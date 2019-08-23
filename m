Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 393C49ADDC
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 13:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfHWLH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 07:07:29 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46441 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726247AbfHWLH3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 07:07:29 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 17PdikOP3Thuu17PhiogyH; Fri, 23 Aug 2019 13:07:27 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v5.3] cec-adap: return from cec_s_conn_info() if adap is
 invalid
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Dariusz Marcinkiewicz <darekm@google.com>
Message-ID: <8dc2a979-ed12-6486-491d-35d216b3450b@xs4all.nl>
Date:   Fri, 23 Aug 2019 13:07:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBxWB5x8jp3jOBbxkAlZJSsBvIQLS2KsAsZNqTiqDjORKeYH2HjKiQNMgOlXCr83c9DuSqXjqJxgxjLiBDJt1jPpsQ/sF69letl7RAAKtBdKiF8uw7Q1
 WzUiLAQ3ROCFgooN5EHcevAGnedFv6drEx3gJrKZzPhi4EwsYOuCFYQNZuB8vddObUfZoCuSlSzGawDKuVpqi2bdEdeMp33XgzsGjt2jzOJgE7KrrZP4pe1Y
 wX6NV+JufobqoyrWWEHLkel/EvojE4Xk0uDJ9Fr3Wng=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check if cec_s_conn_info is called with a valid cec adapter,
do nothing if it is invalid.

This makes it possible to call this function even if CEC support is
disabled in the kernel config.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/cec-adap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index 451c61bde4d4..5ef7daeb8cbd 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -1614,6 +1614,9 @@ EXPORT_SYMBOL_GPL(cec_s_phys_addr_from_edid);
 void cec_s_conn_info(struct cec_adapter *adap,
 		     const struct cec_connector_info *conn_info)
 {
+	if (IS_ERR_OR_NULL(adap))
+		return;
+
 	if (!(adap->capabilities & CEC_CAP_CONNECTOR_INFO))
 		return;

-- 
2.20.1


