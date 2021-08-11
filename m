Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC653E8F8B
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 13:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237409AbhHKLhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 07:37:24 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39037 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237374AbhHKLhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 07:37:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id DmXWmFcmWTTg6DmXbmzcCS; Wed, 11 Aug 2021 13:36:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628681819; bh=+XMbqHVmZd0Owr5KWgrrXkf7OsHGOFf2VmTqJuSQI34=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=R/pYx5Xw68+yjCyl2+t6t0FbVyC9k5Ic1cO4Tf7AilT0xAe41y65lW03DqH25Fqes
         vjfkMcv2qdBu29FOkbIjAvOKqsAMh9DRQ+psuZz40CE9UCDFSQCc0D+QQLPzRD8Wmy
         QrPa382Mz1uUoil/hnzeIiXPltvxG9JkSRT64Ml2LNHyTH62Ycc4P3uePHVqgrgJyv
         RLPqpU38NNAepOnd0N0ELC5oYga5zCaqBdqXg0Go/O4g347Cf+YCQUFZoYSPQ1UXol
         7wNLTJV0icIs0EEhAUwk45HlE1Ojdpq4ETgeWQgPgPTw1IwxdF9jWv6wiutM+WMCAE
         5NkIyC3tiwPeg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec-pin: fix off-by-one SFT check
Message-ID: <4f1e5106-d97d-b51f-9a96-2c38b26898b8@xs4all.nl>
Date:   Wed, 11 Aug 2021 13:36:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMtPPV6U/gLI5raQNma80ZzVQyEAUDkBo1mAqXFsZHZR0TChF341j7Hw/n0K5yllnunrPXWs8ghRAvsCmhV4gpRavVYjSU0CY0HiHKRC+p6koqhcvKlF
 TiG6TcRrCUDbiYFW8YMmPG2WTMz4lVXEYjcaf7o7xdeUm4W9YSpfwgVuBXqoceJtVdci3J9CQEzxHg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CEC pin framework has to wait for the CEC bus to be idle for the
requested Signal Free Time before it can start a transmit.

However, the check for that was off by one, so transmits would start one
bit period (2.4ms) too late.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index f006bd8eec63..195576a53c82 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -957,7 +957,7 @@ static enum hrtimer_restart cec_pin_timer(struct hrtimer *timer)
 			 * so we can kick off the pending transmit.
 			 */
 			delta = ktime_us_delta(ts, pin->ts);
-			if (delta / CEC_TIM_DATA_BIT_TOTAL >
+			if (delta / CEC_TIM_DATA_BIT_TOTAL >=
 			    pin->tx_signal_free_time) {
 				pin->tx_nacked = false;
 				if (tx_custom_start(pin))
@@ -968,7 +968,7 @@ static enum hrtimer_restart cec_pin_timer(struct hrtimer *timer)
 				cec_pin_low(pin);
 				break;
 			}
-			if (delta / CEC_TIM_DATA_BIT_TOTAL >
+			if (delta / CEC_TIM_DATA_BIT_TOTAL >=
 			    pin->tx_signal_free_time - 1)
 				pin->state = CEC_ST_TX_WAIT;
 			break;
