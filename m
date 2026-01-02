Return-Path: <linux-media+bounces-49844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7ECEE6A3
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 12:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A2EE300160F
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 11:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F98330E0F1;
	Fri,  2 Jan 2026 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQ62hbJG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D230E0DF
	for <linux-media@vger.kernel.org>; Fri,  2 Jan 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354365; cv=none; b=gPK4bECaRk37cFGN9sFzQx0CBNMUTWkUDM8jX0CN9hwNmYXKCiaSy5WQnIsFM5833LJlBI5U77du1Wpo/4Q4PlBTRAw0/r6orU+D2gWSYLf0PzdjTkNatpudk2iSi7LEr3OVL0ldQlMhonQTm6YTDgt1wjnwKGylxvT2nl/nSx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354365; c=relaxed/simple;
	bh=DnZtX8FMWL3xUvEx9ZwEljqS0Zqi/7F7spPDPYn9XhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GgE34JkeZpPPYFi7eN5Q+9PwmGfxEhgw27pDWwI1K4PCnxGPkrnwONv0FtCd4Xbb/Y0H/o3PrXw+LhQ+bt/PitsmbNZlBL0UC6MW1dilLAuw5Eu/IkasyyBrQQ5jQ/U+NekXOCSHEmIbrYxE9fOry1KvHmJllphyrEW5JM1GbVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQ62hbJG; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6466d8fd383so9404342d50.2
        for <linux-media@vger.kernel.org>; Fri, 02 Jan 2026 03:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354363; x=1767959163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASzrwnWe1LPCoc7Xrbs0jLsSOmeBARD1j4LP7Uc0+4E=;
        b=QQ62hbJGFfl+VuQWrR37xmbhIN8ynp/Z/DAtnb7pIDTA9+GIHbYnsJeh2DXAhaJS7e
         fcSmirTjnZ7DuC8AhqtQF3aWwV7O/1VWsASSlVy3jua4xzBD7XtdRr8CmZTIyy9pdrdg
         x4I2w0Ts/n1JMHsG3RNAzqhRZJQvts+6bNRoe07TewXohnHpmLYn0f6uf0inGMz40f1I
         GHCE3BH8E6IX7pgE9I2q1raWZSwwyUYgC+Td3556I3svAgPLuzdz6AwGRs0LYIvz84WY
         siEZiyp/odu5HPSYfVEgVwCaJwauDiAPdneZWRrUfwytGUfz5knTTyn0rYWnzgogoOHU
         D1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354363; x=1767959163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASzrwnWe1LPCoc7Xrbs0jLsSOmeBARD1j4LP7Uc0+4E=;
        b=aXmmxg/zzJmI3h8cgZjaIq/UEWQIrR30FrzggKZAXy81v2ITSQ5WsdaQagMiCcgamV
         2akEvHTk1NZCC/8974cbSQuXCyROStNjzZMjCW0KZuYXRoa5Qm84HPK31AEbaJ6vRAVx
         FhPxTg4I+BNtptq7vNgeLIYOvRz/PWluGxUYbQhT/b3RvrK97GIj3SJzIUtwf+nwyhTk
         g6s1ko7EjuEWoGfFRcKpbIcmOhyq9MVx/5PXpuIF030mmsPmV7qR3CcuiXAjRL7CzwbX
         TAZo/y/IQCXDtM3zxhTLZjTep1aQLe3oH7ptV9nQ4AikIPZuENb2Wk6eZIjTNq6l1wXO
         u2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWX9keBPzQivSj8lhpFhg6uquNs0uexi9o5b+jfziMOSD5UBlYOxKdjM7QK2UjNkkpIxFnB1jc27PYadA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7w/ZOar58VebasXhAL0FID46SZGt6TAduWidUiHaZSaFZV8ZV
	JBRIkpfN9jHQM14Jgt2c2FIF+qOKyxTY4mPCzT4dGTICTAJIYPxrp2vCXgyuwQJmInIwDA==
X-Gm-Gg: AY/fxX4FZtmwu8JuPUCawjld/OSdRsRY5znrrH+TkS0vYpIaoEExsnh9h07Olb8chZe
	hgJTKaC5vHcYqnB3uqOGjPxEVCDgbkjEU6CjQ5NVydQK4++AVMLRk7SdebiMXJHwKrlH0YHc1HD
	kbQ2SFnPeERAVAtqy1AHFNgZ0n9eRPRuwXwdXHQrkQm2rkP+7sPwCkaW2tXOACLw4JtDO4HBzg5
	aNElhUUpRoo7mvoCofFjwrtBgEVMG4u/jykL0G7pjzx+LgkjXK8csE/ujDBMVrjNbkh6PR1i5Pe
	8I+jrAhP5SCZV+SvNNPX4khqRfm/uSZdnwPFvE9DemJNlYhysPJBHYh40CXw9WrxwzrlEFHtm3X
	G5SfQM7iKB5GqTj3UYTVI+F3zKIDU8xaaWVmnLFPnc1lVpkZinsOUAwrynrb+eobolah+DChJTc
	9BvQiDo1zmtmaT4DOC2nWeY5HbQAFlSQvp0Lqm8Skt1Iq3kMPz2iRbJIZwcMR86SKEmaWQZ63WT
	+m6YLE=
X-Google-Smtp-Source: AGHT+IGAb1LvYCKPkrw6Jp7sMEujxcREGH2IZa4Xr5bo9nugfnsGpFXZASy+0aYsNgKqGokZhA8vng==
X-Received: by 2002:a53:a9cd:0:b0:63f:bb1d:e529 with SMTP id 956f58d0204a3-6466a8f31e2mr23590058d50.48.1767354362981;
        Fri, 02 Jan 2026 03:46:02 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4562df4sm156230587b3.55.2026.01.02.03.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:46:02 -0800 (PST)
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
Subject: [PATCH v3 2/2] staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h
Date: Fri,  2 Jan 2026 19:45:01 +0800
Message-ID: <20260102114501.42312-3-sun.jian.kdev@gmail.com>
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

tegra20_vip_soc is shared across translation units but is currently
declared via an extern in vip.c. Move the declaration to vip.h so users get
it via the header and we avoid extern declarations in .c files, matching
the pattern already used by tegra20_vi_soc and tegra210_vi_soc.

Link: https://lore.kernel.org/linux-staging/DFCAOR6T9DPE.2MOL0K9O3HP1N@bootlin.com/T/
Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/media/tegra-video/vip.c | 4 ----
 drivers/staging/media/tegra-video/vip.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..80cd3b113125 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,10 +263,6 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
-extern const struct tegra_vip_soc tegra20_vip_soc;
-#endif
-
 static const struct of_device_id tegra_vip_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/staging/media/tegra-video/vip.h
index 32ceaaccbba2..fdded00447e4 100644
--- a/drivers/staging/media/tegra-video/vip.h
+++ b/drivers/staging/media/tegra-video/vip.h
@@ -50,6 +50,10 @@ struct tegra_vip_soc {
 	const struct tegra_vip_ops *ops;
 };
 
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+extern const struct tegra_vip_soc tegra20_vip_soc;
+#endif
+
 /**
  * struct tegra_vip - NVIDIA Tegra VIP device structure
  *
-- 
2.43.0


