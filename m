Return-Path: <linux-media+bounces-11567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CFE8C7A89
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 18:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32E701F20F50
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 16:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DEC747F;
	Thu, 16 May 2024 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="QYOnM0cy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573DD63BF
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 16:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715877736; cv=none; b=dTTeAMDNgWlgY2wKNtPglxx0rM72R0Qj7Ys+m0eeYCbop4rk9qUMv/6ITJonuGAoOvihSrHCyr9PTjdaSaOA82KWVx+KsrUEP3mgzR2JPQfANQs4jtNgs2Fg9dAl0XFIWlBHozaP2WmVMwBz3jigeCKzztTXEnA3CK5YFZViEwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715877736; c=relaxed/simple;
	bh=alJQ6riM1LX9FIYE0B2o3uu7wFCy8RXzmTCI8lK6Om4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gkMamv4hXMyHGk9N3yhTCVoZfZu3Nd+TQIx7LRZzzagtiMwCC7gdyklgbZ4nomJ7ZPNPn3RDTER6TUC+AKIBDISBoYGHujw2stpR5BDt8WcnO3VCSrOZ4jon7WYUptO/9UHG6vtQSwzi2uDocyvn/1zeHzDjqU9HKNTdXFj9aj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=QYOnM0cy; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59c5c9c6aeso346354666b.2
        for <linux-media@vger.kernel.org>; Thu, 16 May 2024 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1715877733; x=1716482533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJbbquUuFYlyR0DXePZ8R2GDsWo7iL9ZJhKoHm9Pgs8=;
        b=QYOnM0cyiyTN2sysu8cgM1fx8e3m3xfG1aFoDIHbc/l/U4k0Z2FZ145oTlY1qx+Mtg
         LYok9xzyr0G7kytWdfORE1m8T+tcy5COrJ5ePJEUPXW0lu/9IAWIY8bqyCdyojeEtGy/
         6Ayld47Xh4oT37i4HaxBLfS5yaYFV6U6qR7Gudk/7ffvoZ2YmMygeU47LwinHmNcCD0e
         EcCm5J8NFeWgI3tMMNshmWY3kJqVJcPlUXE2h+OGG6pTK3XEuWcc7EwCSygLwnUREbrX
         9N8B31o8mk3umB7upEcGAk3yZxss3TwCnevvBWEZC3lo5zDbsO2ZbqQrcU+mqOIG2wXO
         YUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715877733; x=1716482533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJbbquUuFYlyR0DXePZ8R2GDsWo7iL9ZJhKoHm9Pgs8=;
        b=D6KKrspaokOZSqLMpBCGNx44F43Vmyx7bZ8jwSUWA/W1cRZuRaGxAcryBlw2Jqv4MZ
         mwOC3m7ntDIYf7Ccy/XDi6mZWtfjj3t8taVOrhBwcbxupgMEvGWS+VLo4CQyIEkxOCaH
         DbkMaBgcMl4L8tHPmzz4IHtPxxPz3CnnRAH+ShXSK7AcTQm1g3KF3YaHQK9OtadXCG2Z
         uKT+jCjeNLz+XmVtfjlahwiiUWXwQMKFVuMWNVvslSEeIwPktFDrHBtBLImxfHEt5bQa
         FhIbCQFt+XCyQoVGx+TwmZnMRw+iar4HIwa38PgTmR/iDr6sXl89at2OY5rk+HOynubE
         LSbg==
X-Gm-Message-State: AOJu0Yy8s8V1Pe89rWmxLiCNJqJI45BITJxm16OFlD/QykBPRYcwoH3P
	TEm8n6njfJlxiwwflbdI7KZCdaS1yHiHJ3YJVfi98Uvfg3WSUXPPCYPt3JKC5ycdxRfNQb28suM
	AbgL2bcTn8NiUdslrE9IoCOibvuteviSCYbPW1evK5yh7RmyF5c5/vFOrYtkF2OUthrl87WyeMV
	/K3qRxTOyJywqIHczX8lVu2qD4ehdUi9Wg3WM0Oglm
X-Google-Smtp-Source: AGHT+IEoTmPYnnZUtQvyZDjO3o9XekoX/3nMH2nUsz5wDT97DiFeyV0y1NTyXq1UjUAZ37yTIg1z+Q==
X-Received: by 2002:a17:906:da8d:b0:a58:ea85:9114 with SMTP id a640c23a62f3a-a5a2d672fb6mr1600297266b.50.1715877732754;
        Thu, 16 May 2024 09:42:12 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a178a9f0fsm995174566b.69.2024.05.16.09.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 09:42:12 -0700 (PDT)
From: Volodymyr Kharuk <vkh@melexis.com>
To: <linux-media@vger.kernel.org>
Cc: Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Volodymyr Kharuk <vkh@melexis.com>
Subject: [PATCH v6 04/10] media: v4l: ctrls: Fill V4L2_CID_TOF_CLASS controls
Date: Thu, 16 May 2024 19:41:49 +0300
Message-Id: <69e2cb692e63f9cf1f347fcc10de5c634c8643bc.1715871189.git.vkh@melexis.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <cover.1715871189.git.vkh@melexis.com>
References: <cover.1715871189.git.vkh@melexis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define names, flags and types of TOF controls. *dims* is driver specific.
It also means, that it is not possible to use new_std for arrays.

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index db596cb43ad0..18085b800c32 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1252,6 +1252,13 @@ const char *v4l2_ctrl_get_name(u32 id)
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
@@ -1463,6 +1470,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_DETECT_CLASS:
 	case V4L2_CID_CODEC_STATELESS_CLASS:
 	case V4L2_CID_COLORIMETRY_CLASS:
+	case V4L2_CID_TOF_CLASS:
 		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
 		/* You can neither read nor write these */
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
@@ -1614,6 +1622,18 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
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


