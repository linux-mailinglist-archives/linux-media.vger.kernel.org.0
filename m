Return-Path: <linux-media+bounces-31335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F3AA19C3
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 20:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0E543AA7CC
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 18:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0262253B5F;
	Tue, 29 Apr 2025 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KAh+uwPi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DAC2517AB
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950192; cv=none; b=qGZpmuz8Ihi1hElda4UqMMX4/O7QkyNXdB2iEu29MaecyqoZSAlflesd/pnk3fLowSqk7uGw9d8Iq+VHeRjOVJDH/yB38FzvsTnr1+A4csf60zu27yHiassemp4Gk5cKa/VZgzYjtMAUvT0dNRC+3zXioL/ILBgKSA3uT10G2f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950192; c=relaxed/simple;
	bh=NRmEFA1cMtNTKkdV4Kz76ZxAsSzC6Ex/40jCfiCBdlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z5mNQV4UFQAColEM2g/iASdrEPaRjKkSvrUefeYayJP+RGy+3sips35x3qmYjoI2o2uSOusScr+tTgoEdoZXG23U5gy1icXhnKut5jwsoKOJLz2xpLWvWPW+hPw95vGB4nc1CkH7JDkJhGSntwNoj/5lBp6Kybn3glnzB5r9pGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KAh+uwPi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso9291855e9.2
        for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745950188; x=1746554988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w/rG6AWXGoekxcd3LHIxXcRgVm+0IkNESPaRkmBuBd8=;
        b=KAh+uwPip5xvNkGr24FODNbDLIbya8rebcJAlZte5lZJYz+zdFJoUJcZIrtMF0F+bU
         wey5YgHsPQiBn0j2aBSELFHviC/Hwz6RbyFXhKr/xUwMr8NWY9X48qjrDxB/tffnVrIh
         rCi296Tl3L1DCorFwDf/sLcicnxGwmQHVZpiFaiYBXtu6rGWodRDKYDp4rhPwIWV2hEm
         d1O80BjHRg1wV9Sxd9jCixTXWc8S884qNQpEiA5M5B+EPslZOF9JrUw6kEE66wF/CxmJ
         BDyyNG8U0dGRIvGqp0SB0G+kZHQHSFcK9V4NexlA9lREfNf5ZmDAZ94qZXK5mc4Vk5IE
         0/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745950188; x=1746554988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/rG6AWXGoekxcd3LHIxXcRgVm+0IkNESPaRkmBuBd8=;
        b=c4CteBWvWGYG6Mk11K6FDR8lP29M9nZj5RTkW5GW3FMzdW7GBW+n9/WGuvY8RljD/D
         NFbEbWf75U4w7A/nmz+VGfgJEOizWbZ4f7xjk5SezdqT7nk66bBpomOinrDM6UXpDKL7
         TKIIZ0i7ZFbj0bionmRYH2KHVcjfaiZGSZHYgSBA3TgmZHMSvRr+TUq0bodscKp5K0uP
         8YxXAXa0o+tqy+YepSClDhYdiCvXbTZdEJtMjNDDO93UrCopFQ6fmIq4k2xb7ScrA580
         /IB6HwTaqU2TLkXPU+KlJc3FaXyr2oqW48yztApiqDAOxmf3VQfwSTM8mahi1XfQx0ts
         shWA==
X-Forwarded-Encrypted: i=1; AJvYcCX2FWxeNd21q0gefK+CH32fSABywkXjNGHE5/0r30Bj8THY/IJRWO6zKGW5VOe8390iACRI0pjMRV2LcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVultITEzpLQ6LXfi7eUA7EJBDDK0wCiM96WYTdur0clXwZIe9
	hHh1NDT8BwmzgKE4ZwrhHiWMvwmcgKmjbVG/6HPDkyMXcOPVoLGHHkAgEUqj8eU=
X-Gm-Gg: ASbGnct2d29sXEao00SEKFm2aXVH8UgOXr9zPiN6U+TPZ38estinyuXPzwWe1L8m0Hf
	6eWcytN1AgWosAfQh+Yh76KZSZ6S70bMHBs5nONy496AOkjR1Wn92k04dMeKRo9FP0TzwiC8y3/
	27MTGpECwCrWRarJ9BP1tBxSDz5YhOckFjxqQmgOnPBh7kJHEluYj+n+Qz2szLhkuqfNUTY0Glq
	irIdRzRBE+UXZqztgdWslxPvyjjFRtbOYsGZRrhkHERfTeR+lMMLOqN0DSSqffQUlItC4xYofYJ
	oFL26/Ka51nDom2hm3ct0andeeXQ7MBh8r5oAf+115EzX1RaGw==
X-Google-Smtp-Source: AGHT+IGEAvfTMVbPsHmLNZ+IkEuAjoyB8jaVAoucK/+s16SnbjUKJ7712NKpLTFsRw8wJ6RbZnh36Q==
X-Received: by 2002:a05:6000:420e:b0:391:3110:dff5 with SMTP id ffacd0b85a97d-3a08f79e75emr121818f8f.5.1745950188236;
        Tue, 29 Apr 2025 11:09:48 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d52bsm15028818f8f.90.2025.04.29.11.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:09:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with version
Date: Tue, 29 Apr 2025 20:08:29 +0200
Message-ID: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7342; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=NRmEFA1cMtNTKkdV4Kz76ZxAsSzC6Ex/40jCfiCBdlA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoERWcIyDAxAv9TbP2GAMiw/QCHluBg1AQUDsz4
 TNetsccTP2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBEVnAAKCRDBN2bmhouD
 139PD/9UaFPoTNGrGk3Kxu3/I1Xj66yiTsYIU0lLxXCKXqQ6e02DHsVQdoGqUJ1kSElO9ycyRrZ
 V9CC/NCXFRd4nWNHfIzp3akwKAiPIlt4OoAkzuhGyRoWHIuORF5kDC90Vj/7+UDDUTksSxP7rwE
 JcNHpi71hbxfyrgPYhWGYxgLXqh/hDTA1hzZoTM4dcp/kYOARoF/xpYlZQTXoNrf0TZmmI3oU2Y
 kgzzGAMC2hDB92Kf8rheFfQDgpI0DvrwLU8BV2Ue0iiqRW0VVHkvREf3ZVHCuLa1hP31KGvGGhS
 QLHQh0rrkDp59k8qrU0DT6aovnM1WX4OWXz3zUpZeQN3MdUY5kQAx524Zfmflk3KldG3drLyKC9
 sQYpx/ShKlbqgG+bSM7EWzsmyT194pSlQZSPRljtu//3t8FsCsV3MgLr9sqbdluD4Ah62t8DmH2
 1WB0oFH2OmRU/vepKdp18ZCDtA19HJKdVm5icnu+N+/30meTorALrisI26cqJh4CpZiWJq7v8Tu
 GW7DGP8Jx73SOpKu6ECJEInMf+Cq4lzd1UWgNj0v6IaMHb/AAByAUIeU1Qf0UhXsp6c2t/kRJd8
 3kFLQYFLwdkQ5xVa+GqUi+x8Yx6hXpM8qWchpbjmy7sMmrdb/3Q0CwI0EqRAQ5ra6JyRXBO4x+C 3PAh9BQL1KrHDsQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Camss drivers spam kernel dmesg with 64 useless messages during boot:

  qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
  qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0

All of these messages are the same, so it makes no sense to print same
information 32 times.

The driver does not use read version at all, so if it was needed for any
real debugging purpose it would be provided via debugfs interface.
However even then printing this is pointless, because version of
hardware block is deducible from the compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../media/platform/qcom/camss/camss-vfe-17x.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-480.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-680.c |  1 -
 .../media/platform/qcom/camss/camss-vfe-780.c |  1 -
 drivers/media/platform/qcom/camss/camss-vfe.c | 22 -------------------
 drivers/media/platform/qcom/camss/camss-vfe.h |  8 -------
 9 files changed, 37 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index e5ee7e717b3b..e0d12c3f6015 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -577,7 +577,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_170 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 901677293d97..7620ce42b49b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -993,7 +993,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_4_1 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_4_1_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 76729607db02..b3b6ccb4748e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1145,7 +1145,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_4_7 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index b2f7d855d8dd..5a4b4f486aca 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -1135,7 +1135,6 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_4_8 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 4feea590a47b..edd92308af62 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -278,7 +278,6 @@ static void vfe_buf_done_480(struct vfe_device *vfe, int port_id)
 const struct vfe_hw_ops vfe_ops_480 = {
 	.enable_irq = vfe_enable_irq,
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
 	.isr_read = vfe_isr_read,
 	.reg_update = vfe_reg_update,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-680.c b/drivers/media/platform/qcom/camss/camss-vfe-680.c
index 99036e7c1e76..96a927acc6bb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-680.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-680.c
@@ -227,7 +227,6 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 
 const struct vfe_hw_ops vfe_ops_680 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
 	.pm_domain_on = vfe_pm_domain_on,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index b9812d70f91b..e5023eb7ad60 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -142,7 +142,6 @@ static int vfe_halt(struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_780 = {
 	.global_reset = vfe_global_reset,
-	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
 	.pm_domain_on = vfe_pm_domain_on,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4bca6c3abaff..1ae523219525 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -415,26 +415,6 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	return 0;
 }
 
-/*
- * vfe_hw_version - Process write master done interrupt
- * @vfe: VFE Device
- *
- * Return vfe hw version
- */
-u32 vfe_hw_version(struct vfe_device *vfe)
-{
-	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
-
-	u32 gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
-	u32 rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
-	u32 step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
-
-	dev_dbg(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
-		vfe->id, gen, rev, step);
-
-	return hw_version;
-}
-
 /*
  * vfe_buf_done - Process write master done interrupt
  * @vfe: VFE Device
@@ -1088,8 +1068,6 @@ int vfe_get(struct vfe_device *vfe)
 		vfe_reset_output_maps(vfe);
 
 		vfe_init_outputs(vfe);
-
-		vfe->res->hw_ops->hw_version(vfe);
 	} else {
 		ret = vfe_check_clock_rates(vfe);
 		if (ret < 0)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index a23f666be753..1553ca89bd86 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -101,7 +101,6 @@ struct vfe_device;
 struct vfe_hw_ops {
 	void (*enable_irq)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
-	u32 (*hw_version)(struct vfe_device *vfe);
 	irqreturn_t (*isr)(int irq, void *dev);
 	void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
 	void (*pm_domain_off)(struct vfe_device *vfe);
@@ -259,13 +258,6 @@ void vfe_put(struct vfe_device *vfe);
  */
 bool vfe_is_lite(struct vfe_device *vfe);
 
-/*
- * vfe_hw_version - Process write master done interrupt
- * @vfe: VFE Device
- *
- * Return vfe hw version
- */
-u32 vfe_hw_version(struct vfe_device *vfe);
 /*
  * vfe_enable - Enable streaming on VFE line
  * @line: VFE line
-- 
2.45.2


