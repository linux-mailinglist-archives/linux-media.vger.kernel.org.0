Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A55711B723
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387460AbfLKQFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:05:50 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44057 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388831AbfLKQFr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:05:47 -0500
Received: from [IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946]
 ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4UhiY1cFapzpf4UiiSJjr; Wed, 11 Dec 2019 17:05:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576080345; bh=FNuAvw/X9ch9uUZgR9b1d/RIrYyBDMC32pLXN+WugkE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EgDLPjdsaIpCJShCik/tbGuxlhTc8MixXGaAXCyeQMON+0bl5cBGp2agzM5a2/sKx
         wgYCqsIaQ+g60otVvZa2QHApN7ZNfELHSG1ewqLtFhUzPKMqP3+hSwycKhFjwbRtDh
         QL09zDLuOIddKl8R8A9XHEl2RU5AfNbUTxiqbNC4bpMXCWisnfXPp1dMCwb06rJVA0
         oQwU2Pu66S0P6hSaVbjKUBjSo2wjA6XyZjSscZWnXkwh5sXDkd6i74qY8mVqLnjk8F
         ACk6/ZFy7SgIqaakt2MlarDOUdtqzkxe3vcCJxIL3z4S5EX280GDdpS0ODcX/71k4C
         fV+e7NRuW3saQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.5] cec: check 'transmit_in_progress', not
 'transmitting'
Message-ID: <dd8ed8f2-9199-8bde-1a0c-571fcee71011@xs4all.nl>
Date:   Wed, 11 Dec 2019 17:05:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNxso/pSf3kLEC39DgeXF2c/D3g5xCmTD2XGTrjKfTrKf6mFsLjC2Sm5MokrAa/mig64Xj45IgmLPLehQUsOtjyR7Dl8ZnEc5pYQQgO2CA22396zKHuA
 bojDEDHi2tgcdvw7MuDBZp0wStmDtZyNDqxj7MNDnKErl44+KA7m86ReVDNacy3p6u9/+BKyrkMN+VGs9E8pDbiWHwCV5m6T3V1pVtRQpybMxnwrridxmKEv
 hHMtnEunizLccJTVKkOfOTN4oHuKRxxvJTW+QaDMyhw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently wait_event_interruptible_timeout is called in cec_thread_func()
when adap->transmitting is set. But if the adapter is unconfigured
while transmitting, then adap->transmitting is set to NULL. But the
hardware is still actually transmitting the message, and that's
indicated by adap->transmit_in_progress and we should wait until that
is finished or times out before transmitting new messages.

As the original commit says: adap->transmitting is the userspace view,
adap->transmit_in_progress reflects the hardware state.

However, if adap->transmitting is NULL and adap->transmit_in_progress
is true, then wait_event_interruptible is called (no timeout), which
can get stuck indefinitely if the CEC driver is flaky and never marks
the transmit-in-progress as 'done'.

So test against transmit_in_progress when deciding whether to use
the timeout variant or not, instead of testing against adap->transmitting.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 32804fcb612b ("media: cec: keep track of outstanding transmits")
Cc: <stable@vger.kernel.org>      # for v4.19 and up
---
 drivers/media/cec/cec-adap.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index d96add70b293..cf251f753b10 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -465,7 +465,7 @@ int cec_thread_func(void *_adap)
 		bool timeout = false;
 		u8 attempts;

-		if (adap->transmitting) {
+		if (adap->transmit_in_progress) {
 			int err;

 			/*
@@ -500,7 +500,7 @@ int cec_thread_func(void *_adap)
 			goto unlock;
 		}

-		if (adap->transmitting && timeout) {
+		if (adap->transmit_in_progress && timeout) {
 			/*
 			 * If we timeout, then log that. Normally this does
 			 * not happen and it is an indication of a faulty CEC
@@ -509,14 +509,18 @@ int cec_thread_func(void *_adap)
 			 * so much traffic on the bus that the adapter was
 			 * unable to transmit for CEC_XFER_TIMEOUT_MS (2.1s).
 			 */
-			pr_warn("cec-%s: message %*ph timed out\n", adap->name,
-				adap->transmitting->msg.len,
-				adap->transmitting->msg.msg);
+			if (adap->transmitting) {
+				pr_warn("cec-%s: message %*ph timed out\n", adap->name,
+					adap->transmitting->msg.len,
+					adap->transmitting->msg.msg);
+				/* Just give up on this. */
+				cec_data_cancel(adap->transmitting,
+						CEC_TX_STATUS_TIMEOUT);
+			} else {
+				pr_warn("cec-%s: transmit timed out\n", adap->name);
+			}
 			adap->transmit_in_progress = false;
 			adap->tx_timeouts++;
-			/* Just give up on this. */
-			cec_data_cancel(adap->transmitting,
-					CEC_TX_STATUS_TIMEOUT);
 			goto unlock;
 		}

-- 
2.23.0


