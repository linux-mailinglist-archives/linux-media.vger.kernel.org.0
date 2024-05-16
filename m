Return-Path: <linux-media+bounces-11564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E378C7A84
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 18:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72C9BB22A82
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 16:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4F48460;
	Thu, 16 May 2024 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="KqjrZps+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640279FE
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 16:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715877726; cv=none; b=iGENrfA7XC0Xv8UnIkhiimptmjC089XBCM+9Pik1E3LusogJVF7+g5BjRmsD8kAENCstnrdfbcPEZYULdCxywLEPaRUbnSRAktoAi8qdRzqMUd7tw8Y4TjE8J2ooN/aaVTKCnZ53XOGVaLL/l+R/cAsCz3U9DIofP6hNLxJVGl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715877726; c=relaxed/simple;
	bh=WTaUGYnA8nbsl8nLAXhtY6rxQ83aC1Nv58FbygyBPdA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a/V8HOjN4ueBvuMz4rjVGMUvuGpp1pH6pYHAcMYmuG+XUwTWtTMyA+4yQB3hotdCVxQ+ebbBQf452sFHLqYewlmACqDOSL/YFhiUppHOIKCnQgGcJsJB3VS2jfnG71ho03iMJytOBCAZPATd8vwbe560OdmsPzTckfCoOVinxGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=KqjrZps+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-572b37afd73so4340154a12.2
        for <linux-media@vger.kernel.org>; Thu, 16 May 2024 09:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1715877723; x=1716482523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bEyFm5wcKgbR0Noerq2V2BjAgl0FGLSdsDpoLsS9lA=;
        b=KqjrZps++g4buIwC490ovsLdaKq1v707Vct718Y7RlJeDquZB315Q8GYPTMSg4ZLKK
         pAKUiuUvjUxUXQwBPDNoUMaQYWzOCaVMJ45OyLqJzNW37kxwo+dWxVaqHhDEww/gJBiw
         nZ4QD5L+LZo1VVl46RUrwJ6/nJwIXsylp8wddSTgc/i28egTO+bI4SopU5YiDEjJM7V3
         D3XoucUURJU/rErt7IH7extIngMbzsTqwyGAunbrCyg5bHG1zaRBERkPtbFjynT1FM1P
         cJM1/1GvYjCdukRJmXKbiBNrnUVdkfc80PnFU26CJANsYSlj1Iqhot1wMzlxNVgHPcNG
         98hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715877723; x=1716482523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bEyFm5wcKgbR0Noerq2V2BjAgl0FGLSdsDpoLsS9lA=;
        b=AK5NDZEByvUA3NgYX0Vz64K5DpPt31pMSnYrXZsOGjyPTiKcuVCG0CUd3IH5u25Yur
         u2V80Jz0xO3MHtEh0VT56yfUszqQytkK3EI+ou41V3aLJnI6hBob4bS6oSkFzMC0+CkG
         frW5r7O/8K+twzpbuZJHmUiVtSZg1d14lfx/cSug+DXVeTeuknnngVX2lOo8t7lUOY2B
         1kw44bbS5Udtz1bpO8SWsQWRSjXM1aGK7YvkyH88s+GmsfAHU6Aqv3VlGh9AFZidza2e
         SoV821MQ0q3S8TPnRxFZ7DuRsGb29rSv9CIUVmPIrHh3ZJzBbiH+pJr6KdJRc8xyZUIF
         Fggw==
X-Gm-Message-State: AOJu0YxnEeiqmxH7nQrb1BpffSmwgGT3VcYr033dYgNpUlps22Y910TE
	9Nxt/Dd2BwLE6xfMIk3mOFVwN30asdp/7Hpa8aDXUTeoPTvpSDMPPH/idMK8vLKwkVoGUtbSydM
	hW/zbYWmpxHf3TPbo6D673iSnp3YgRxEMRs0wNysaEb8fyht5wS7O8gI8CubTjAQy0m6hfx5wVc
	m8N6x9ZsUhTdA42H4mEpFI8qmFph7NG1/gxpkaxkEh
X-Google-Smtp-Source: AGHT+IFa1SValMhmtz+0a1u5VMBzR/sAhzAIZDgcR4npkFEeLOcFIKRbnCeumY7rytF2CUfHCXK/Tg==
X-Received: by 2002:a50:c002:0:b0:572:7c5d:6ed5 with SMTP id 4fb4d7f45d1cf-5734d5ce3demr13088962a12.22.1715877723572;
        Thu, 16 May 2024 09:42:03 -0700 (PDT)
Received: from melexis ([91.192.181.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-574ebdf46cesm3490547a12.37.2024.05.16.09.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 09:42:03 -0700 (PDT)
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
Subject: [PATCH v6 01/10] media: uapi: ctrls: Add camera trigger controls
Date: Thu, 16 May 2024 19:41:46 +0300
Message-Id: <de44db636f0e3f5bea2357aa6a34531fe0c34f08.1715871189.git.vkh@melexis.com>
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

Add V4L2_CID_CAMERA_TRIGGER_MODE as a menu item control to set
trigger mode. Also proposed some standard modes.
Another item is V4L2_CID_CAMERA_TRIGGER as a button to send
trigger in V4L2_TRIGGER_MODE_INTERNAL mode.

Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
---
 include/uapi/linux/v4l2-controls.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 99c3f5e99da7..7901f40a1bd8 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1087,6 +1087,14 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
 
+#define V4L2_CID_CAMERA_TRIGGER			(V4L2_CID_CAMERA_CLASS_BASE + 37)
+#define V4L2_CID_CAMERA_TRIGGER_MODE		(V4L2_CID_CAMERA_CLASS_BASE + 38)
+enum v4l2_trigger_mode {
+	V4L2_TRIGGER_MODE_CONTINUOUS		= 0,
+	V4L2_TRIGGER_MODE_INTERNAL		= 1,
+	V4L2_TRIGGER_MODE_EXTERNAL		= 2,
+};
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
-- 
BR,
Volodymyr Kharuk


