Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922712FCE82
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733017AbhATKdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731244AbhATJ1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:27:15 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E4EC0613ED
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 01:26:32 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id d22so13889216edy.1
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 01:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tTT0+SqKfrfhaHcnRFvnvU9qDTr8hatpLylY1+aK+yQ=;
        b=S+8/ubQWgNSY0+aeQAy708NPaa9yQucZWs8A74w5rv9PjdxLXxpUU4BiMq+RljwggJ
         vT1IdBTbqBdf0oqf8H+EX/XVrrNHU0kPPVKSkC6OmSDHgw1PO5r5nPwv6lA0mFK8Lar2
         /ebuzzLZWUT8TEPRpzvymqDnBiYMci7Tmf1mxBVnjJ3pzf1l5e/FYsnaHiZg4b488IUb
         KWwSaZXetc+EpBt65C635eV0463cyZpTIN++PC7RWhYzIAEBXbnvMOxrs9bAaYQxMjXF
         MhIL8OrGY98++7sSJY+a/g1fOjWZozfAuH/DuMh97vqUugp2cgnUzg00Zirr95T4yMo/
         kSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tTT0+SqKfrfhaHcnRFvnvU9qDTr8hatpLylY1+aK+yQ=;
        b=oaiGXcDCsMiqXYuezzT8Q3jliGjtm3nhUrV4B9JZ1d0kRgjn29WO0NSRsQ4+zlUAzK
         Mlx7vFQ0aQuqv+N1mqMbUNlw20kQEPXCjeo92Borhv/hug2+tUrSKNN3XFdRkJE/iuKY
         di059pZNBEkU6C3I+VPVff6J7DjRU8SP9YBtIvHQRJMxe9aQflmv98NfsXkyjJAUafuK
         bD1TOXtV2fskP4JUB5Fq13IvU3H5cjYHxvS+E0DTf30nZwdLJGAYf5SjPrLCRDSJX9TO
         QeodtARx9EjNR2nn6GRBOHgPt32pKMiJsFCwIBl3118ej+eq5QI7DhDIeWUFfejUNUFs
         gToQ==
X-Gm-Message-State: AOAM533GzkM5KM51BX6TqPw7VoCBkodSVO5tV3L/ncQV4cFazUaOHR76
        MLaxGsC4cqb1IaP3yhXA+mtlmqo3eE62kU0A
X-Google-Smtp-Source: ABdhPJzbVr9bKOhKB5w1vpD4zCZzXTS5MKV1IETe1k/SjINiPVdYfqHXxuithV9Nk9EU7ka/IRtheQ==
X-Received: by 2002:a05:6402:614:: with SMTP id n20mr6592595edv.358.1611134790882;
        Wed, 20 Jan 2021 01:26:30 -0800 (PST)
Received: from localhost.localdomain (hst-221-66.medicom.bg. [84.238.221.66])
        by smtp.gmail.com with ESMTPSA id k16sm619392ejd.78.2021.01.20.01.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:26:30 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 1/5] v4l: Add new Colorimetry Class
Date:   Wed, 20 Jan 2021 11:26:02 +0200
Message-Id: <20210120092606.3987207-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
References: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Colorimetry control class for colorimetry controls

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 5 +++++
 include/uapi/linux/v4l2-controls.h   | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index f7b310240af2..a5137a867411 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1201,6 +1201,10 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
 	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
 	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
+
+	/* Colorimetry controls */
+	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
+	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
 	default:
 		return NULL;
 	}
@@ -1389,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_RF_TUNER_CLASS:
 	case V4L2_CID_DETECT_CLASS:
 	case V4L2_CID_CODEC_STATELESS_CLASS:
+	case V4L2_CID_COLORIMETRY_CLASS:
 		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
 		/* You can neither read not write these */
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 039c0d7add1b..a41039559193 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -66,6 +66,7 @@
 #define V4L2_CTRL_CLASS_RF_TUNER	0x00a20000	/* RF tuner controls */
 #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
 #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
+#define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
 
 /* User-class control IDs */
 
@@ -1657,6 +1658,9 @@ struct v4l2_ctrl_fwht_params {
 	__u32 quantization;
 };
 
+#define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
+#define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
-- 
2.25.1

