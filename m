Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A56A7B788B
	for <lists+linux-media@lfdr.de>; Wed,  4 Oct 2023 09:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241495AbjJDHUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Oct 2023 03:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjJDHUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Oct 2023 03:20:05 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E43AD
        for <linux-media@vger.kernel.org>; Wed,  4 Oct 2023 00:20:01 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so3076597a12.1
        for <linux-media@vger.kernel.org>; Wed, 04 Oct 2023 00:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1696403999; x=1697008799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mfgoglfeGFCoHfbanPa/H8wXTI3NZ4ZqArZW3xtr/0=;
        b=rt17l19jAN4ccAkbLfZVOC6FSBLibKSmgemkb4fwylkXRSzSDXdRwLVsaJITzogTSw
         vMREkibPHo6gpuhIXacHSNcvV4YA+5RyBf5vuZBJI+6AdwaerfyGNyoHNe1OcQjSvLmV
         QUGteRYFZgRKQi1pXg7lus5YRZkL8L0hHw0jFiugJRCaQDyjuJFYfV37fqfncqiL05UM
         4LLnvTLYq7WQTVRyV0YL1Tn408yi/qqeY3/LYCl5QxbXGIp/EdUS1/2KufA3Gf7d8+7D
         wCUYjwpX9LIbuqLWs1wndPjMdQf/j2BRivN1NKlXze1GsYNlR1isQu6xhISlR5jcs26T
         ZydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696403999; x=1697008799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mfgoglfeGFCoHfbanPa/H8wXTI3NZ4ZqArZW3xtr/0=;
        b=aiccb4tXVLjRx5saNSThoOG1qt3/eVeLeQwUeAEm/X3z+q9WHGOLSNM/QdezezxWGn
         a0KM7IUC3iFv2satnlfDnC6jrvvZkdTf7I5Zpm6C03TYpf9F/SDhTgGxTJSc6bHqjItk
         V9pNA8h5GfBxJ3QnDLzCmNtaHaDF0ih5LtPtIDNNI4dswpRjis2HPYzdNGgfjoQanL7r
         AzraYQsF8gTTLzz58DGm52DcHgz8slFXqVoZrVt6Mh0x8PMCqbEMBKJ2F45lywnocPg2
         pm3g0wE8BoFgH09Z2mh2ZiREIF+C8RWoevzhUXCEwQW4pBpC/Jv6KzDwYG/3AKev6sa4
         kVAw==
X-Gm-Message-State: AOJu0Yy9eoAXFDbmJ3uyOEW+CD1cU18CHVa337bbrHuMOQAwcp3AmIDN
        eiqP4gPgpfVc4eKk0DqW1+iaYKwdmBOquHNL2G1IJSOG9cAuYOA1GsCtLriTWwTiy/oNdyRE2U7
        p1H9E5q0C0aJUzap9WU46qhwTuXV0ect8+akESnq8KJsDcQdiaZnb5Gx129+KBy7haPC3EMsMIT
        oRKA==
X-Google-Smtp-Source: AGHT+IGFKv2t432yf7YQ2NfZ2n4IpnXlJvqPJqLIoQ3uD4NTz80An4fzbikurPClEE/qlJfT2l45Bw==
X-Received: by 2002:a17:906:2210:b0:9b2:8323:d916 with SMTP id s16-20020a170906221000b009b28323d916mr1345909ejs.17.1696403999535;
        Wed, 04 Oct 2023 00:19:59 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id op19-20020a170906bcf300b009adc743340fsm2258027ejb.197.2023.10.04.00.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 00:19:59 -0700 (PDT)
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     <linux-media@vger.kernel.org>
Cc:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v5 2/8] media: v4l: ctrls: Fill V4L2_CID_TOF_CLASS controls
Date:   Wed,  4 Oct 2023 10:19:41 +0300
Message-Id: <4e4a0c7520ea3e77ddf288ed6ceb1be100e53acd.1696347109.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1696347109.git.vkh@melexis.com>
References: <cover.1696347109.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define names, flags and types of TOF controls. *dims* is driver specific.
It also means, that it is not possible to use new_std for arrays.

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8696eb1cdd61..63fcd0d8f139 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1242,6 +1242,13 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
 	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
+
+	/* Time of light camera controls */
+	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
+	case V4L2_CID_TOF_CLASS:	return "Time of Flight Camera Controls";
+	case V4L2_CID_TOF_PHASE_SEQ:		return "TOF Phase Sequence";
+	case V4L2_CID_TOF_FREQ_MOD:		return "TOF Frequency Modulation";
+	case V4L2_CID_TOF_TIME_INTEGRATION:	return "TOF Time Integration";
 	default:
 		return NULL;
 	}
@@ -1451,6 +1458,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_DETECT_CLASS:
 	case V4L2_CID_CODEC_STATELESS_CLASS:
 	case V4L2_CID_COLORIMETRY_CLASS:
+	case V4L2_CID_TOF_CLASS:
 		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
 		/* You can neither read nor write these */
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
@@ -1602,6 +1610,18 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_TOF_PHASE_SEQ:
+		*type = V4L2_CTRL_TYPE_U16;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_TOF_FREQ_MOD:
+		*type = V4L2_CTRL_TYPE_U32;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_TOF_TIME_INTEGRATION:
+		*type = V4L2_CTRL_TYPE_U16;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
-- 
BR,
Volodymyr Kharuk

