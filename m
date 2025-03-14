Return-Path: <linux-media+bounces-28274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 521B3A621E8
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 00:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B64E3B84B9
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 23:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BD51FAC4F;
	Fri, 14 Mar 2025 23:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bkz3YxiS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C71D1F868F
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 23:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995368; cv=none; b=r2gKF535qPnuPt6+mqW5AuEjYuPVjaIQmLFp8WfuZNhh+EiEOc6/CrWiwe3AA8hU3vDMx6Dk8qXIcbHSOxIVZ/IHxeaGHZHTMXJ0dtaxSbljKhjmek79XXrsV1LDQiatojlz1g6aq1bsgZBP2DJUx6pVXRQ6klDGK6FAuYu2aGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995368; c=relaxed/simple;
	bh=Vq2uKzeOhWg9BzD0uczH19oCawxDFmiCSfyNb/VvQDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDvlo/ZQrqxAvzGLTK5gYf08N5ZjlV+XIVXyFvXjwKi/qo4btMpjCaWdjZukhjRTm50HcfFiODMidTTniHSA3qVIKKNC/D5LWIvs+FMfL+hN2u3yRy2WrHhCA9tSjc7p5ccLY19NEhVSLbdmOrScm/xsHGi+z/qhhVE+dVvnHwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bkz3YxiS; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2b10bea16so535552866b.0
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 16:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741995364; x=1742600164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3U+Pt6JpsUTUHyzjN19Q+jXJPU51fOtm+jzvoDFAjpA=;
        b=Bkz3YxiSsGOA4zxSZLudvhAY6Hnx9WMP+rqX8GZL3bauWr3CCEeI94t5AQ4szfczzz
         4X3ALE8vP0HLZo1lWz5iqFZItccKMGqdj4x1zmrcwK2CahwDKluMWfS8TMbBwQsi/jTp
         PY1WElsM5p76WfE4oub9dNFJhOa3NL5fhJCIIn13KOfV352nNKoVKbWq8wJ2i1l2La0N
         EssyjxLdZFZAJWcQ+YUT7POon5MZ25TEh6JIMXJBbuUnQ3zY502Cs8g++t94lCduSsUk
         ayKw5OTD2X0+Wr/frW0/Ha83fdl18g45oLd8GuiKT8fV0yUK2QDecaJHEy8lxWnLHx+8
         TZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995364; x=1742600164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3U+Pt6JpsUTUHyzjN19Q+jXJPU51fOtm+jzvoDFAjpA=;
        b=vRz3eNTzjc4r0cs2Y9tyARVFY8j/h+6Q/juEce4WtpM4IV4ZgXhj9yET2lLGGn3VJe
         iJ26XxfUb+S2uBnXnI7N3pvv0S5ZocacxctMNt8nOP+IUFBC5pVcw/KbTyi6soCmXkOp
         M0xO9zG7l+ZR4AgW8/lTnxoyktDpS74EMRyEFGOzcJeHumWPJouS2gqJvgF28kKPnGpW
         UB2jKdlMSkxwcQ332THbWpjv45IHEkhrHyseH9N6tfgQENPisEWZlVlRnhEgho0sxDP3
         ggvUP3XSm3A7sd9QKZKzPtWaHHVTCZzzeBETC10dKRfhfQgujXm9/YFZ2A4tCaL9qp+M
         i8WA==
X-Gm-Message-State: AOJu0YyaZiGyPUhDzIlR0hLifBqUI/GQsOupjvXp0/sXSZa8ex3jaVgf
	VDxyb6yaf4EIgSG8PEYQJZslU31gjkDcSw9Yg898zAwPAcs5obfbmcrvUT+jqJo=
X-Gm-Gg: ASbGncstLL1xn95wvx3DdZ9c8mBB0lWNm20INhQxiOyYg4tEKrCZMvfq93357RWZdEd
	n5sJ3uGJpyyc2+1VfWEydMqSeBOB4V5AWF2IN4wymZE9EFIW+gHTvZYlS048+o7z2nBz9ng6ErN
	iso0q5HOJc6k4fZUw57gOpiUP+kI/VuAfcEJK22eFeRCioLSBZPtmnxqB2R2tenbNIK9WQbzmWp
	qUdRK6AEsTBpQhc1LDvQHrxdPo47i7Y3sv3J7xKMQGK2UQUOajeWZjOlMQ6v6SfL15VSEP/XsX2
	jr/aecrT4Gi3nzNnV8Ouf+pP/CLjv9DPMn1l5kcVB/Iiz7bBKPBKnDIY31Gj1eCEpghYjGLp0G2
	T4vacfHTP4N/88V5Uov2E7shK0ckFnEmh/xn0kK1lYn/6Fw0/2rRwXJv3uXA1S4rUkArB
X-Google-Smtp-Source: AGHT+IFhQMOFUycyNl9NAwVjWQ8rMePZypskVYVYNfryZOS2CgGWpOB2ap4X37XJjZsLcNHBbTgMLA==
X-Received: by 2002:a17:906:c10d:b0:ac2:7cf9:7193 with SMTP id a640c23a62f3a-ac3304195a3mr509150366b.48.1741995364518;
        Fri, 14 Mar 2025 16:36:04 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm284246966b.29.2025.03.14.16.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:36:04 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 23:35:59 +0000
Subject: [PATCH v2 6/7] media: qcom: camss: csiphy-3ph: Add 4nm CSIPHY 2ph
 5Gbps DPHY v2.1.2 init sequence
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-6-d163d66fcc0d@linaro.org>
References: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
In-Reply-To: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

For various SoC skews at 4nm CSIPHY 2.1.2 is used. Add in the init sequence
with base control reg offset of 0x1000.

This initial version will support X1E80100. Take the silicon verification
PHY init parameters as a first/best guess pass.

SKEW_CAL is included as received from the qcom silicon init sequence.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index b44939686e4bbf400f145368d3ba015b56bfb187..d5f717f6215c45908c4fc5a8650d68c00d544db7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -55,6 +55,7 @@
 #define CSIPHY_DNP_PARAMS		4
 #define CSIPHY_2PH_REGS			5
 #define CSIPHY_3PH_REGS			6
+#define CSIPHY_SKEW_CAL			7
 
 struct csiphy_lane_regs {
 	s32 reg_addr;
@@ -423,6 +424,123 @@ csiphy_lane_regs lane_regs_sm8550[] = {
 	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
+static const struct
+csiphy_lane_regs lane_regs_x1e80100[] = {
+	/* Power up lanes 2ph mode */
+	{0x1014, 0xD5, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x101C, 0x7A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x1018, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0090, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x005C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0060, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	{0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0490, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x045C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0460, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0890, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0800, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0808, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x085C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0860, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C00, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C5C, 0x00, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C60, 0xBD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+};
+
 static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 				   struct device *dev)
 {
@@ -593,6 +711,9 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
 			val = settle_cnt & 0xff;
 			break;
+		case CSIPHY_SKEW_CAL:
+			/* TODO: support application of skew from dt flag */
+			continue;
 		case CSIPHY_DNP_PARAMS:
 			continue;
 		default:

-- 
2.48.1


