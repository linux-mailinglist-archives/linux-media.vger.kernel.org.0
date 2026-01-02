Return-Path: <linux-media+bounces-49843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07623CEE69D
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 12:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37C3F300D301
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 11:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B1F30E0C3;
	Fri,  2 Jan 2026 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThTyo797"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E49E30DEA6
	for <linux-media@vger.kernel.org>; Fri,  2 Jan 2026 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354356; cv=none; b=RAeotWWY1tHkpl3h4eUPdIYK2Sgl15OK7UQDfGm+sT+Ye7D85+WB1brmsU5xGsr8k/GajElp09QgrIxPYs6d0V0QVtdde2ozshxNFPNY/1aDd9bXpWcvIQaaIsYN6j4A2QJfwsorqPKMgZ8ajn3ucYvJ0QINxxCO7dl6fn60Ke8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354356; c=relaxed/simple;
	bh=2ypGmbMRjHkuiK4aTiukHS+p1dUsv+EdrHXZ0KGp3nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ur6VhVdyZINk16TNGqbabV9eeO1BaZMo23TfXlwnqfUnGxD5QsDEZlsj8k3sxThPFkI/VkyiiMvmGqlZQjiW5Od8ZNQ7AjmbKsth8421RhvzcAv0Jyu+fECNXCB+f7k0FNCIZ+xhynIZV5d07vcpRvAx0VFTL9jjXWxRBnsw+RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThTyo797; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64669a2ecb5so11690509d50.1
        for <linux-media@vger.kernel.org>; Fri, 02 Jan 2026 03:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354354; x=1767959154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7QSdR986P/lV+3rtDwQ9bAy4seXEo836u2RcHq5oBc=;
        b=ThTyo797ptVMzfPBjytUaQJY3hHC7lRC22rDB2tcqPx+kRZJZUs9RKnGKcC4C8NiXd
         siyqYEbQrAxc2pHa4e5Z4HL8NK94WnuNAh74/CJMGsjnTGRY2sn4qEHJYW5Pu28/b84Y
         Pwvd9zoCcxf/Ai5pGik7ZRnovESW0bRrvtA1p4dfgCsuMEyxu2A8t5r5RdeRr2JqFFTz
         uxm/ctLq6VbUedpn/Q/XzukwwiojVGbMsy5iUksJ//IM1OYsRfTB1C4FP317uWV/JaIt
         TdulGuSrdSGKcicjgnntUqpPS/w8o7cwn7sE4R8Bano89jb3HH3qNbrm30O5nqp6ZGiW
         uwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354354; x=1767959154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v7QSdR986P/lV+3rtDwQ9bAy4seXEo836u2RcHq5oBc=;
        b=AANGy6Q/VqajAd/lxXwha8HIYEQoCRusyb0hUA0bstQLayhrkQe6QcFfWXyZAlMp6W
         fnPRcEqxePiVjk8Cq38kZZjHGQ/fmf2IepVCl5TXb9/3WneWoGLzzOGzmPPys2cy9Plb
         xy6gQCVEGRtSEzyfXHTNwypcjZdvbvvaBoGa/VqNG/+AzJw8MhbniY+m/re8+rz3ga07
         XaSnVRSz1C67Vo7HrulCZAtAlxWqPKaxxqkNnp5RR4PhwduYFnXbMi5TF5V5vc5SqlfZ
         LnkB56AYkm/HXICjIbV5JCtKQKRKGnUOIEN3sp28+JVotx34qlMOAluGbJjCqUM/LsmN
         AC6A==
X-Forwarded-Encrypted: i=1; AJvYcCW9SV03Uq2eyoY4kOFh4/GBZO2SLEePuOcY4y6ZUL0Ds0BVQkWLUDorNUTW9zZ+LPJaS9i0PTpeaNbzTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWN/eRz4r/QnhqVsRHvY2HhG3IoDO3fgTU4GFnxyEvHzPm9tj5
	J+hem/wIg4wr6WLpV+rmj1mcSijFOXvMEjcQulj/LD+m3yCqeQffUNzn
X-Gm-Gg: AY/fxX6IglTG7R5NZkKE+f4044CwojMOySX7NyLBpN6t+DdTaphgBSuJwVC340Qcznp
	J3DvV7R2wO1KRaFyvOpurD338eQKNqrtWS+w3qT1yYoCc6FkBdq4za/iikavltcDlhx1fGsH39w
	l/CvElREUwgLEi/XnYQ1AffTIZQJv/W8fCuAzLoPh8kY7MWnW9AmZqPZ5VN/WZSBN7GAXY4yQEn
	5RVMvQnkOzc/I3xUpqXYLkTwaL4urt1diRqIvxYiJgIlht1FaFC0/XS0OgOcfYlMddQrWQuDhPx
	+ImDjaTpdNfkZP3L9cKseSDAk8ESbun+RkDeUDAlrVt51xRa5bLG+BdyTCTQ4JmcOmURzbKhhcm
	/nfkfaHCFjG02r7CNmctLQ+Byj3thDOP/HWypX1hR8rC0Ed0Wm/SrENn5kC2zTEjPxFAXHI1Hm5
	O8a+9iAwsC6M5KaZmrR6E8j1AUGdmCJUb57niuBITJa2KQnUzbfs5Y/OAS6HMdZxyWP6oP59hb1
	Nh1jf4=
X-Google-Smtp-Source: AGHT+IHQjwf66LpwbH+zQYAQHv53uj5p0N7n8ZIHwmqUY4C0r2zhCHWhI73039OChAbOqw/5A0P/Bg==
X-Received: by 2002:a05:690e:4089:b0:644:7ad3:6528 with SMTP id 956f58d0204a3-64669dd878bmr28580521d50.41.1767354354292;
        Fri, 02 Jan 2026 03:45:54 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4562df4sm156230587b3.55.2026.01.02.03.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:45:53 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3 1/2] staging: media: tegra-video: move tegra210_csi_soc declaration to csi.h
Date: Fri,  2 Jan 2026 19:45:00 +0800
Message-ID: <20260102114501.42312-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102114501.42312-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20260102114501.42312-1-sun.jian.kdev@gmail.com>
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

SPARSE: drivers/staging/media/tegra-video/tegra210.c:1214:28: warning:
 symbol 'tegra210_csi_soc' was not declared. Should it be static?

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


