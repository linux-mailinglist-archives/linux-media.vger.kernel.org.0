Return-Path: <linux-media+bounces-49805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A98A1CEBFF1
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 13:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A96433020351
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 12:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C637310774;
	Wed, 31 Dec 2025 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbcwKfHj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2A723D7E0
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184855; cv=none; b=qh5o4qecFsjFDL0931rdDHClUaVN0md56T2XmAj1khgkPJiK/Euc9lryevfOYu1vd/7Krv+NaUzX3fhp6om7zUncyI7jV6Ap/Q9yvheHeE2+S+7uJCp/og3kykX0G09vrH/ay20IzUHp9iPUswrmAMF3fyWgO0NSlc2g04T3QT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184855; c=relaxed/simple;
	bh=bpc64xTes/6DSqbbfKw7utwCw290qXBNArmOt6zd9U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z83vkr8niwwLtHHRkRwFhoRazojDlKWbSI6rhOOfFQtJ+vkt5wNgVGZatwPLZ1iJ5ks1PPSnvx1Zls7L0feJfGC4gToCLHUOs9g4N5cK2doIFpOOfIjldQW4EPIkmZvZoEaTJtO23+rlDlA98zCCwzDoQsPNMIT/4gtC6Hj916s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbcwKfHj; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-787da30c53dso102468317b3.0
        for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 04:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767184852; x=1767789652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMZ9zgZdVr3pbZQDIH7NpdxYpjnjDbphEYD5vgBclQo=;
        b=VbcwKfHjmJPyojiLD2Ehe76AtAOZ0xAOszb0e8C3Npgqv2EOB1vNL0VU5wMSzxqqoS
         aa31X+bxkM8AQhNNvcejoYiFuG2dlYCA83aPGnXj7y9QBQcUDMhwpVcv+YBsf3XHzFfq
         xVHWm0XbtfI2yr1DtUrywH5yKwY8nWBHl0QtcGTI92R0rWsifUkTrya6z01s6SR4Ovit
         q/Z77f4AglJoOzr+q9ARFgYHIO0X5zzWWtfeFnh+3mhBVrEt/OE6PJ6u0P4iPIRFu1tr
         5AoHxAJcbHhXoN6ttYiORUxrflhPh3uq6s/iJ+/uh3VbffmXRi5XDbDuIZ7fot+3/VfX
         xC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184852; x=1767789652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MMZ9zgZdVr3pbZQDIH7NpdxYpjnjDbphEYD5vgBclQo=;
        b=XATMXLZ7188+iaC/DaajyR6DKqvEW98k+Urgup/uvc7DOWuxfnBNVcp8IqtocWgHRW
         gQXbkg1W+1o5c+NuouB7+c1Z9vvf3jg/3IPMYbI6Afaq3GqY3PFAvCx7mQMx5ASjjymj
         2bbtvn+IpIesyuz0gyT91A3J7dUoT30iZ1+2R+yAJYCNke3l97vX1fiGKGKotnac5Qzj
         NuXc3IILX8yl997APBIh6zmxwRAxqA6NucNlDUMKvDLuzmc0AlzxXoiUu+pAIYhfapwX
         LXIb9Fq7OrU+9lHNNcD70tpYXK8K1D10Bh4rH7qzF0hrwMuti+b2w3sfqdXylxLWhUa6
         8CZw==
X-Forwarded-Encrypted: i=1; AJvYcCVEqxuW7j2wAY8sK5nAM7Lab0u6njWiqJvNrGxV7b+BaArCzjH4+EjTYQdY62qPNd9/fUsbZpBUXrDqJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQCX33StH21Iq76D+MGF/uxQrr9it6nekvkOf/VQ2qDB0AcAa
	Ohd/PxM3qwXtyMw9Ogw8UKrZzo5wI4Pcc6F3utxVOwYUqdP9PjMeiVYs
X-Gm-Gg: AY/fxX7b9PviEwjl3CfIdntlt1L9pyQ8uOcto2GU3BbvSe/1bioJVlYH5arUzAANFtu
	qs1l6HkntHTJLpEzVDIxBPFkMDqcG86yCNy8Fq/KZyo+k8IOUMare/0HbJteSnzmb4md+HVtJTT
	LOBTDHIJxLf1v6mrgxDnANsTWVaCDAJXQRssUTbRFfNkYsLXjlEuJRJzka79o1vGxOpgdgdaLEK
	n3WNJXy2BSmF8OpoHDyi4m/VMesCqvcZg96V4TJYQf2c9Y4E2FdgexoOIBpkY4JOrad76NFslpc
	OZF1jN4IbyUHaPQIJvzQo6Ua2FnwV3zXR3KhiB3rlErVcgG91DdQedUPMgOlBXgRUYopYllVmbJ
	kX/3IXoOlSLnkTyDuYICnjEVyO+elUeoxgW6OPzPjgguyY6PYaXlt2pSLbtnMApd671yIuMj6cF
	qtfURu3IPttJ3mgAhWo7THoT8UWPcBuOxGd+C+NZNFf1YLc/K15Ki2d7eHQuJJLZ5vwVT+CQgXV
	cYJC7k=
X-Google-Smtp-Source: AGHT+IFrXQD2q7MyIixphdEVMQQUK0nDKmR0bPg/g+JbhcBEInhr1pMYlAHk+OMHNNhDorAD0CekqQ==
X-Received: by 2002:a05:690e:418d:b0:644:2c33:42d2 with SMTP id 956f58d0204a3-6466a85b6c3mr26405383d50.23.1767184851830;
        Wed, 31 Dec 2025 04:40:51 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb43b2690sm137555257b3.18.2025.12.31.04.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 04:40:51 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: linux-staging@lists.linux.dev,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	mchehab@kernel.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 1/2] staging: media: tegra-video: move tegra210_csi_soc declaration to csi.h
Date: Wed, 31 Dec 2025 20:39:54 +0800
Message-ID: <20251231123955.277384-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231123955.277384-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20251231123955.277384-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse warns that tegra210_csi_soc is not declared in tegra210.c.
The symbol is referenced from csi.c, so it must remain global. Move the
declaration to csi.h so users see it via the header and avoid extern
declarations in .c files.

SPARSE: drivers/staging/media/tegra-video/tegra210.c:1214:28: warning: symbol 'tegra210_csi_soc' was not declared. Should it be static?

No functional change intended.

Link: https://lore.kernel.org/linux-staging/DFCAOR6T9DPE.2MOL0K9O3HP1N@bootlin.com/T/
Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..3c3f6e3fd1ec 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -835,10 +835,6 @@ static void tegra_csi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_210_SOC)
-extern const struct tegra_csi_soc tegra210_csi_soc;
-#endif
-
 static const struct of_device_id tegra_csi_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..609c5952e050 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -130,6 +130,10 @@ struct tegra_csi_soc {
 	unsigned int tpg_frmrate_table_size;
 };
 
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
+extern const struct tegra_csi_soc tegra210_csi_soc;
+#endif
+
 /**
  * struct tegra_csi - NVIDIA Tegra CSI device structure
  *
-- 
2.43.0


