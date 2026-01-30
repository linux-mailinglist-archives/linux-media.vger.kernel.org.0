Return-Path: <linux-media+bounces-51826-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNt/HwSpfGnuOAIAu9opvQ
	(envelope-from <linux-media+bounces-51826-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:50:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 977D6BAA96
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 340983008D1D
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BA737F0F3;
	Fri, 30 Jan 2026 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9EDDRx5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C137F0E6
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777399; cv=none; b=PTRPcSGiYrj0m/reyNgfVwegToSJF44MkA4xNfraS0+Zf31ASpaJiygsJHHY42lIIBVu66xuhWNjo7SRqsZD7qyfLIOnqVD29L1x0YF/9shwVVEDOVQkyHqHJXjmnHMdvKJ3QDKPzqx0o+ChXsfVtEy4bVrFFOSCb9/hLU974RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777399; c=relaxed/simple;
	bh=To1d/zhAMJHw605taojXaeo9SAKZcoKeQpcDI3cxW/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ldzm6uiC4Q7Adgka1MDtaf5DTaM2TotO6tOlgs5Jbf2SENpbpbmMY7i7ajM902Yafscb7F/heRV7U3hCsqcGgBLu/xNOE5ZRl1RpFpkJERVxy2tOa9eyHyNIm5QoRS4Ljvaidz0fbOtthIRUI1DIiv0JMw3KxzV+flSKjP+mN9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9EDDRx5; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fbc305882so1379062f8f.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777396; x=1770382196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xe8jyxD8htr2t5lhKuU5l2a42gpBrpfOGyfYmkBAV1Y=;
        b=G9EDDRx5tXJr1omgSbsBsXlXv7iiDyfI3BOgssqb//ShPrFFSoScwMQCZybFH2eh8K
         DXSpPAmaUeQwp43r6IAYLxgjN9XarT0hSjXg9eJCs7GV//m2aX/mEY3CjWdcT0Nd4x9i
         FIg4SdyxqkayfVTm8tQLWJaCHjz9T652z1bERichWXoK7bXwUPxwf9QmhmAV8l5N8+Jm
         AGNTwxMU44drUHD16uG+FQ9XgsbfXcJq5LbPvfeeddLVJVp773ekd57kHjPvZ8JtOJ8u
         ZYr5oxmVCsQeiB4p5OZcuosHxRin31ntoysAqUCBu3UfhdmHkOplxMOMNDZyTdAKKP3q
         BdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777396; x=1770382196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xe8jyxD8htr2t5lhKuU5l2a42gpBrpfOGyfYmkBAV1Y=;
        b=sUxihaH7LI6Brvn0U6rczJmmCIGtuK8PzMIQB+u994NA/4ICaf/Tj+RnHini8t3GLR
         X3cRhVx2zKl0SjEtPV5sKQsb2re0NomQUDzVb+ljOFqtNO3g7LrmWiyKMdQvIri6G/eW
         ti6LuhXRuBBLyFIXNJE/Ym8qu2fqIqxtjhRPzOFmytcQS8uI/Qus1dRWFCFEVivyFiw5
         jPtCCwP3Xh/oFGQ+Xqs0mUXvsVh1gmhGSorbPStDyZRcBDAvmcnMgHK+VdM6YYCNdajL
         g3HaOMGavEP5qHT90HtQ97AytBR15qAb+d0DvGHNvLra8Vvm16i7/30ITV+j2kRzpL0Y
         eFiw==
X-Forwarded-Encrypted: i=1; AJvYcCUDlZZs4RQ+L/GrZdoTEB18maTXcaKFgMQsk2hKtdZzunl9ui2KBSzWPl3Qy99lOieQwZbzI191F2u1Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YylYsJQFJ7806HIsLPhWtZzv6Jdosh1ru49KN2zz0fbX/X4ZIpI
	Qqn+mQuvGZavE0zzkubXEId9CXyqI5F8UytMw/KRPMwm1z2ie+yWCotK
X-Gm-Gg: AZuq6aLlsf67q7IOe190PrTiB/LEQMrXBekqvhEPxFrRLIwvRIrYr0/lr8GgYNgQzGh
	heNwqhnuterrY6P8WktPeeGQX4uAmRIeaoBeQywJ10sPPY01v0kl7s91CsW6UiifOfEjBnQ83Tk
	lUC0gM8FGvm7PiDwKiq7RlY7YZ/JgTcxLU0yFXL7WnFxtwVPPd4LHmEPnyrAuMkwuoP2YG0JVRx
	HaKV7umujDzDEDKMOltzbDbMuHdtCLNX+76/JcoD8AhqLvf3D0m0Fd7opQswmHoB+AyZ1LQMG4E
	TE4XSOEk6kqJSk66xhHTKRJJj3sJaGlQ1OfSevxbcjj3K0HeRj9aGrNhel8QPcTmoMd7Sex08Ue
	pdtAz9k9pT5S2418D/903KnM3rONfzhTgNO4RfaY/eofU0uBdfo8RXKDmA7qmFbEGSyPPsMaAuc
	7L
X-Received: by 2002:a05:6000:4285:b0:431:b1e:7ff9 with SMTP id ffacd0b85a97d-435f3aba7ddmr3579193f8f.59.1769777395701;
        Fri, 30 Jan 2026 04:49:55 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:49:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 01/15] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Fri, 30 Jan 2026 14:49:18 +0200
Message-ID: <20260130124932.351328-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51826-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email]
X-Rspamd-Queue-Id: 977D6BAA96
X-Rspamd-Action: no action

Existing VI and VIP implementation for Tegra20 is fully compatible with
Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/Makefile | 1 +
 drivers/staging/media/tegra-video/vi.c     | 2 +-
 drivers/staging/media/tegra-video/vi.h     | 2 +-
 drivers/staging/media/tegra-video/video.c  | 2 +-
 drivers/staging/media/tegra-video/vip.c    | 2 +-
 drivers/staging/media/tegra-video/vip.h    | 2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/staging/media/tegra-video/Makefile
index 6c7552e05109..96380b5dbd8b 100644
--- a/drivers/staging/media/tegra-video/Makefile
+++ b/drivers/staging/media/tegra-video/Makefile
@@ -6,5 +6,6 @@ tegra-video-objs := \
 		csi.o
 
 tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  += tegra20.o
+tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  += tegra20.o
 tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 14b327afe045..4b80086f8c05 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1959,7 +1959,7 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 1e6a5caa7082..cac0c0d0e225 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -296,7 +296,7 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index 68783d5ffeb1..4aec2ff9a69c 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -121,7 +121,7 @@ static void host1x_video_remove(struct host1x_device *dev)
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 80cd3b113125..9ff1f1750a15 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -264,7 +264,7 @@ static void tegra_vip_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vip_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
 #endif
 	{ }
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/staging/media/tegra-video/vip.h
index fdded00447e4..563059cbf5b5 100644
--- a/drivers/staging/media/tegra-video/vip.h
+++ b/drivers/staging/media/tegra-video/vip.h
@@ -50,7 +50,7 @@ struct tegra_vip_soc {
 	const struct tegra_vip_ops *ops;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vip_soc tegra20_vip_soc;
 #endif
 
-- 
2.51.0


