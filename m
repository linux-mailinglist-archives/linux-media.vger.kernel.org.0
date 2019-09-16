Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5474DB3482
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 07:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729254AbfIPFrp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 01:47:45 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41691 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727053AbfIPFrp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 01:47:45 -0400
Received: from [IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8] ([IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9jrSiSrVm8SjN9jrTiVLvG; Mon, 16 Sep 2019 07:47:43 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jiunn Chang <c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] cec.h: CEC_OP_REC_FLAG_ values were swapped
Message-ID: <93a0e9b2-7998-2f97-063b-8412f8bdcdd8@xs4all.nl>
Date:   Mon, 16 Sep 2019 07:47:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN6NBAqnMjxl5UFdNKSCdsuerJm9Wy5MQ3zCfSAFR7ZqO1ZlTPBegkwKCppNsDlLHpfGAF4qoJcfP8O9kIO/7vmCiHZO/ORZKIZwX3mXnNMZ+Nc/+6RU
 fAf1JjyjgpEl5UTGpFhhE2uXOISEBvrQgJhveKtroHOz8lh9B/MMv7ysGxLv+sCM/YVad747kkIPNV7fD2slpTT0wY9a7nGJuHUGGPwYuQiAse+KN1iNR1Ie
 RqtzifK/h3QQJdYteq+Zq9UJ8dq94IN+Tldbn8jzfqLhrSriakx9EssATzeyZrWreaoCnfwy8D/upGamKTZ9vg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CEC_OP_REC_FLAG_NOT_USED is 0 and CEC_OP_REC_FLAG_USED is 1, not the
other way around.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Jiunn Chang <c0d1n61at3@gmail.com>
Cc: <stable@vger.kernel.org>      # for v4.10 and up
---
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 5704fa0292b5..423859e489c7 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -768,8 +768,8 @@ struct cec_event {
 #define CEC_MSG_SELECT_DIGITAL_SERVICE			0x93
 #define CEC_MSG_TUNER_DEVICE_STATUS			0x07
 /* Recording Flag Operand (rec_flag) */
-#define CEC_OP_REC_FLAG_USED				0
-#define CEC_OP_REC_FLAG_NOT_USED			1
+#define CEC_OP_REC_FLAG_NOT_USED			0
+#define CEC_OP_REC_FLAG_USED				1
 /* Tuner Display Info Operand (tuner_display_info) */
 #define CEC_OP_TUNER_DISPLAY_INFO_DIGITAL		0
 #define CEC_OP_TUNER_DISPLAY_INFO_NONE			1
