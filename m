Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB609640A38
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 17:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbiLBQH4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 11:07:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233505AbiLBQHw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 11:07:52 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDCE21811
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 08:07:48 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id td2so12600605ejc.5
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 08:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5AfNXqpB6DMNrychPSr6MWpW654YYiXw8vNhHpBK+Q=;
        b=RMdfeOtQsNQ+/8/Fq8Xc60mn4XySkz60hft9vF0461mpZ5ZLBKCtwZPyIKIRHVpmiV
         FKjJjxbREtLHZ+x+k7dxHWKjf7Z68DXCqXvnhPCNyS5at9D82repNSmNs/1xnh+oJDPu
         jeWy2x04BuoD4eHemkfocCYCffozpY4mGwSCU9ef2Ep8wocDs5gLLPiLhLhWB2BvdCQ5
         jVrJg3c6wgfiPXuQdCEJeDmE6vrHcvaSkefRjU0bTI/cGa7K45qVjjGIjusXe00LYYzm
         55GUQ/AuiwbP53G/i9BkEdDett4UDh31jamV3flfreQPGzOmyfJwZTt+gMPhRosRuSeo
         kWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5AfNXqpB6DMNrychPSr6MWpW654YYiXw8vNhHpBK+Q=;
        b=vPaWkq2gEHtcEkToDDsyjS6yOwAuGFgm2l1TsiXKQ/Im+f2crG1YOiiBut9cT4NQrk
         TrF5f3n03Vb/a7xplTxnKcYP8qlkel4G+SjRjAvfpI+RMjrn2CgIwV0pMM3CY0szp9jt
         URnv8NT2NXMbKGUX0s7o3AsJAg+cgIilPDyxQ33K4kXEDl52JGEPZf6YmeBuQSdrrZyI
         1NWlxO0meYwJy1B7eA4yQP5LqXBbTQkhN45sK8dgwPyNSpzXq1v5g0NScWSZwlCwNk+C
         zbSAxO9tKdqpIyMF2Lsuv8zeIGjZI8edeubYImWAY0tXqAtZGyb9W6/lrlPXhIwn3ouA
         xXSg==
X-Gm-Message-State: ANoB5pmb5C+a8qw1/aM7dqpCSiCoBKjUH7EGmFguhqRcwNkNdC940CBC
        z3VrLUUU4zLGMlRpxykI47u0BZPD/LG3IPQNzZ/K0c4WG4HCrh4m6jQw39T7Owu+nNTb7wsXCtW
        XMQfjnyChYI2z6TjWDeG1kcxedDomSih62GffdxRqSB6r52YgUaOpBIChp4UtVMHefTDb991EJn
        c=
X-Google-Smtp-Source: AA0mqf6cGBoCWv+9d8yCdT9jT5/xQg78fZ4WsDqDyjFJG1FX5OXwlmLE/31F5enLIHeiWNlNotnM/g==
X-Received: by 2002:a17:906:a1a:b0:79e:9aea:7b60 with SMTP id w26-20020a1709060a1a00b0079e9aea7b60mr62150021ejf.444.1669997267339;
        Fri, 02 Dec 2022 08:07:47 -0800 (PST)
Received: from melexis ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id o26-20020a170906289a00b007415f8ffcbbsm3230644ejd.98.2022.12.02.08.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:07:46 -0800 (PST)
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
Subject: [PATCH v4 2/8] media: v4l: ctrls: Fill V4L2_CID_TOF_CLASS controls
Date:   Fri,  2 Dec 2022 18:07:32 +0200
Message-Id: <76aa4a3333da2a8cda9af1f25f41abebe292b9c2.1669978791.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1669978791.git.vkh@melexis.com>
References: <cover.1669978791.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define names, flags and types of TOF controls. *dims* is driver specific.
It also means, that it is not possible to use new_std for arrays.

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 564fedee2c88..3c0ab290589a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1196,6 +1196,13 @@ const char *v4l2_ctrl_get_name(u32 id)
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
@@ -1403,6 +1410,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_DETECT_CLASS:
 	case V4L2_CID_CODEC_STATELESS_CLASS:
 	case V4L2_CID_COLORIMETRY_CLASS:
+	case V4L2_CID_TOF_CLASS:
 		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
 		/* You can neither read nor write these */
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
@@ -1541,6 +1549,18 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_TOF_PHASE_SEQ:
+		*type = V4L2_CTRL_TYPE_U16;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_TOF_FREQ_MOD:
+		*type = V4L2_CTRL_TYPE_U8;
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

