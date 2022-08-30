Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530205A60E9
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 12:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiH3Khm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 06:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbiH3Kh3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 06:37:29 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750A6AD99A
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 03:37:27 -0700 (PDT)
X-KPN-MessageId: bbca3a3f-284f-11ed-a5a6-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id bbca3a3f-284f-11ed-a5a6-005056abbe64;
        Tue, 30 Aug 2022 12:37:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=gDT6OL2WxT8FzoGgaRRckw3TXInFzT3Nnj/9SUq+Ilc=;
        b=Lvpkh2Iythl6n3JHG7xt3R+dOxHU0iNDU8wzvS/+KbA1dl4jLV4ApJVE3lLrRQFqZtOb4IW7fHnHj
         YJzKcXpvHQ8XI64rvuhdAFK74Ad9oSYE0Jn1LqP852SF0DjoOe6M7xYqcTO0H2i+igXoOEnzNqg7OV
         mZ3+ducOhfLd9BsLOyaYq7MOGK8SIxwbzRE5af0EhxEctDSmTtr7CO2zeZwhkid2IAtk+qOH2du6tM
         2MouAnP1zhbOnnX1Y2q5Bx/qYCab39wDZnK1FgQdTy2cQiOVVKGot86qrUw4PnZ6wXoFD5DjBAgQIM
         Ojr4p6bhGM5QsnRnrLbT/XobJ0MhbUw==
X-KPN-MID: 33|sEQ+0xNKXymiux02BHgIpyLgLG01ghQEtfYyq3jmv/tPBkwPpz11oRfDFUXXiJ6
 nhAvot4Z/0TbCB9Kwnv2PzmpFR/MvvhRISdvK2G4jPKg=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|XwvO8GnumNXZak3+Rf/CojX5PcFm+zW2/V1dD49PjvezPg7B5ebZVS6b/NB2nPR
 jgCDrYJX6mLRou2zpOxRQkA==
X-Originating-IP: 173.38.220.57
Received: from [10.47.77.219] (unknown [173.38.220.57])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id bc30c00c-284f-11ed-b5e7-005056abf0db;
        Tue, 30 Aug 2022 12:37:25 +0200 (CEST)
Message-ID: <9c9af92a-588b-e2ca-d72b-4dcc43d38c0e@xs4all.nl>
Date:   Tue, 30 Aug 2022 12:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: cec: add support for Absolute Volume Control
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for this new CEC message. This was added in HDMI 2.1a.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../userspace-api/media/cec.h.rst.exceptions       |  2 ++
 drivers/media/cec/core/cec-adap.c                  |  1 +
 include/uapi/linux/cec-funcs.h                     | 14 ++++++++++++++
 include/uapi/linux/cec.h                           |  2 ++
 4 files changed, 19 insertions(+)

diff --git a/Documentation/userspace-api/media/cec.h.rst.exceptions b/Documentation/userspace-api/media/cec.h.rst.exceptions
index 13de01d9555e..15fa1752d4ef 100644
--- a/Documentation/userspace-api/media/cec.h.rst.exceptions
+++ b/Documentation/userspace-api/media/cec.h.rst.exceptions
@@ -239,6 +239,7 @@ ignore define CEC_OP_FEAT_DEV_HAS_DECK_CONTROL
 ignore define CEC_OP_FEAT_DEV_HAS_SET_AUDIO_RATE
 ignore define CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX
 ignore define CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX
+ignore define CEC_OP_FEAT_DEV_HAS_SET_AUDIO_VOLUME_LEVEL

 ignore define CEC_MSG_GIVE_FEATURES

@@ -487,6 +488,7 @@ ignore define CEC_OP_SYS_AUD_STATUS_ON

 ignore define CEC_MSG_SYSTEM_AUDIO_MODE_REQUEST
 ignore define CEC_MSG_SYSTEM_AUDIO_MODE_STATUS
+ignore define CEC_MSG_SET_AUDIO_VOLUME_LEVEL

 ignore define CEC_OP_AUD_FMT_ID_CEA861
 ignore define CEC_OP_AUD_FMT_ID_CEA861_CXT
diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 41a79293ee02..4f5ab3cae8a7 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1027,6 +1027,7 @@ static const u8 cec_msg_size[256] = {
 	[CEC_MSG_REPORT_SHORT_AUDIO_DESCRIPTOR] = 2 | DIRECTED,
 	[CEC_MSG_REQUEST_SHORT_AUDIO_DESCRIPTOR] = 2 | DIRECTED,
 	[CEC_MSG_SET_SYSTEM_AUDIO_MODE] = 3 | BOTH,
+	[CEC_MSG_SET_AUDIO_VOLUME_LEVEL] = 3 | DIRECTED,
 	[CEC_MSG_SYSTEM_AUDIO_MODE_REQUEST] = 2 | DIRECTED,
 	[CEC_MSG_SYSTEM_AUDIO_MODE_STATUS] = 3 | DIRECTED,
 	[CEC_MSG_SET_AUDIO_RATE] = 3 | DIRECTED,
diff --git a/include/uapi/linux/cec-funcs.h b/include/uapi/linux/cec-funcs.h
index c3baaea0b8ef..d58fa1cdcb08 100644
--- a/include/uapi/linux/cec-funcs.h
+++ b/include/uapi/linux/cec-funcs.h
@@ -1568,6 +1568,20 @@ static inline void cec_ops_request_short_audio_descriptor(const struct cec_msg *
 	}
 }

+static inline void cec_msg_set_audio_volume_level(struct cec_msg *msg,
+						  __u8 audio_volume_level)
+{
+	msg->len = 3;
+	msg->msg[1] = CEC_MSG_SET_AUDIO_VOLUME_LEVEL;
+	msg->msg[2] = audio_volume_level;
+}
+
+static inline void cec_ops_set_audio_volume_level(const struct cec_msg *msg,
+						  __u8 *audio_volume_level)
+{
+	*audio_volume_level = msg->msg[2];
+}
+

 /* Audio Rate Control Feature */
 static inline void cec_msg_set_audio_rate(struct cec_msg *msg,
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 1d48da926216..b8e071abaea5 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -768,6 +768,7 @@ struct cec_event {
 #define CEC_OP_FEAT_DEV_HAS_SET_AUDIO_RATE		0x08
 #define CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX			0x04
 #define CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX		0x02
+#define CEC_OP_FEAT_DEV_HAS_SET_AUDIO_VOLUME_LEVEL	0x01

 #define CEC_MSG_GIVE_FEATURES				0xa5	/* HDMI 2.0 */

@@ -1059,6 +1060,7 @@ struct cec_event {
 #define CEC_OP_AUD_FMT_ID_CEA861			0
 #define CEC_OP_AUD_FMT_ID_CEA861_CXT			1

+#define CEC_MSG_SET_AUDIO_VOLUME_LEVEL			0x73

 /* Audio Rate Control Feature */
 #define CEC_MSG_SET_AUDIO_RATE				0x9a
-- 
2.35.1
