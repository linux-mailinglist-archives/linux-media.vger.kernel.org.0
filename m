Return-Path: <linux-media+bounces-58616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M22FjsG3GkgLQkAu9opvQ
	(envelope-from <linux-media+bounces-58616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 22:53:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF153E5F68
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 22:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A8833013A7A
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 20:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E1537F8D2;
	Sun, 12 Apr 2026 20:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k41bjSfo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236FF37F016
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 20:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027149; cv=none; b=tiUOWmiTf2EgSVo0NeXYZl+wiARq7C0axAlJ1lgijapGRXsRwnMBRUZedVWiZsuI0kq0BxukjzQNjhFbpuA8LNG0IjsnzvM6iZtE/B+JenZtX2l+3xVBivjrjnpmUHD/LPby8Ad5ZyJUxaqM+vSexjfPLSmeVRvEH4GyInrmaho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027149; c=relaxed/simple;
	bh=DSV51EC4wDAZAtG63wE3QtVJJqfSvUl5AYHQrvro0uA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lrR8vlEq4tMqTYIMzNC121nV0dxzzpQZ45zp+7jkh1AjEVZdO/rFg5KaG7PRXWA9gnkggMbfIHEcW35WbrLJmEnti+F4cAnHxk/bcgp1/cdJmM1ygtXxwxiU/e38sasqYKU+t2iLSnlFqf1/NXTAvJl1o3radE0EyZjFJaliPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k41bjSfo; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6715594a4c2so511466a12.1
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 13:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027146; x=1776631946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QVfujx2mt/GYaWZCYACzathtB/uLnH5k7JHfo05VG1E=;
        b=k41bjSfob9NrM0TgUzeMXbM2AmVS7Lw1V2Nq/U6hcPWu7plszb10kPR46g2yXhiHdc
         IAFdFv1OUT1QWmeFPPUsGPTJwjEsOU5B+r68v//d1yi87Rc2pd5odY+8OlH1JropRCoI
         QuKz2z+OzVLYFjqyPpz/QpYTSJAkrxW2ibFw8kMqedYVMDnIYf4SWclRULkj/DycIQxG
         YQdvo6X3dtf7KY5t2jJ/wRitcuDeEFZPS9pUKlrxRkDFKOsWpieY6vpctIYHKRIUZxV0
         j4Y+FQDa6DBVSm4vmN5Twdi3HM/vsSMhPVvh9h7i2QJyewgATXFYRrUCuqKp7rERFTB0
         uUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027146; x=1776631946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVfujx2mt/GYaWZCYACzathtB/uLnH5k7JHfo05VG1E=;
        b=NMmwKDkP2jqlPXQO9VHFkBKqultwc8JG7uuJUvlvMzeTRRCYr/OJbODcy4EMdtY55B
         13vZR6TTyPIcLsF14j/4981H2zuu1TzIcpaU5Q3sblj2Rvk4Ha0tHnPXN2fQMJUfoul6
         HWAl3pN2bd88HXOiKpQusznipqyPs44eH4QX2mxELNySloTjaXxQjlBsFt1px/m21MBW
         uYBBUIR4d1gWCM/zoe7o2uT7E83v+VXJyngp275sHbqrZaFtOi0jJfcmpyEaDupg6SQZ
         FAOsm1kKa7JLC8khSXov8IGIxsYPNaRIsmqVnm6WM+WOi5QkjGVB/8D5d5giw1Io3+wK
         AE+Q==
X-Gm-Message-State: AOJu0YzXSECZrKDfaHDMyUqiUtq+wOBuPjAA5VQ3BYQpfKK7XWUWaOpH
	sU7m4/hairxjWFVzCbS01MgyILtjKxiyn3cW86Y8JHO1GkDcZ5YWw15XJtBNdD2a0nM=
X-Gm-Gg: AeBDieuV4MqkQlH2Usgh+zgCXFF+Yiw7wgyJ6E4f8a1EJx6DclAZsCIl1B/cEdtBASz
	Db5cFnHexAAS1PVvvh/nPDUZLIYBdjOQ+BqcGuJO0jJ/gqfCppUyzSkA0ajJOOol5hnmyn8tnG/
	0vBhffpDsWB38rYtebSDy9nDZEkBiW0CGdEmh4zQITHUQavHLPLjKOwvj3UQ8GI4UHdH18ndfyx
	L+v2YFCV+7zKqMtDGgI1iEa3dWY6tKBoGM8RuLdAMzufRsb6S21TqyrTCtJ64bdCurwoL9vOwSG
	gVQPDeDE27UJFDZ97CgGso2i9Iu41tEuibG52Xk37kyDgZ5vyxDWJiOL6WpiAvvK05C2D3MBui+
	4qyla8f3/oZ4sPZw2KwEbYLg6jkKuXtjj2hsVodrTX52gv9eWK9sTaWJj1xHWDWnQuxiMIOlEZV
	u2CweTyVDaUjPib0QeMH+zDSIdg4FcU1LNro4rJAP4faT60T/uhoYRFra26Rj7mp6bn2Te/HBwU
	CzaAtq7MCXhpFZat8QLcI8PbGGbtRNtdeZ3aqD7etay9C25Eknz6MidzECQEO5gesTy612Nt5L8
	XLN0QQ==
X-Received: by 2002:a05:6402:505c:b0:66b:b6e2:66e1 with SMTP id 4fb4d7f45d1cf-6707a47e6a3mr3822463a12.18.1776027146093;
        Sun, 12 Apr 2026 13:52:26 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6707082732csm2178795a12.29.2026.04.12.13.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 13:52:24 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 1/5] staging: media: tegra-video: add NULL checks for of_device_get_match_data()
Date: Sun, 12 Apr 2026 22:50:57 +0200
Message-ID: <20260412205057.386856-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58616-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[hossualexandru@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,bootlin.com,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: EDF153E5F68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tegra_csi_probe(), tegra_vi_probe(), and tegra_vip_probe() all call
of_device_get_match_data() to retrieve SoC-specific data from the device
tree match table, but none of them check the return value for NULL before
eventually dereferencing it.

In tegra_csi_probe(), the pointer is dereferenced on the very next
statement via csi->soc->num_clks. In tegra_vi_probe(), it is dereferenced
later via vi->soc->ops. In tegra_vip_probe(), vip->soc is stored and then
dereferenced at runtime via vip->soc->ops->vip_start_streaming(). A NULL
return would cause a kernel NULL pointer dereference in each case.

Add a NULL check returning -ENODEV in all three probe functions, consistent
with the defensive pattern already used in similar staging drivers such as
drivers/staging/media/sunxi/cedrus/cedrus_hw.c.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 2 ++
 drivers/staging/media/tegra-video/vi.c  | 2 ++
 drivers/staging/media/tegra-video/vip.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 7842104ca933..33369a8c803a 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -781,6 +781,8 @@ static int tegra_csi_probe(struct platform_device *pdev)
 		return PTR_ERR(csi->iomem);
 
 	csi->soc = of_device_get_match_data(&pdev->dev);
+	if (!csi->soc)
+		return -ENODEV;
 
 	csi->clks = devm_kcalloc(&pdev->dev, csi->soc->num_clks,
 				 sizeof(*csi->clks), GFP_KERNEL);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index d1d934e361f7..f3b749f059f8 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1907,6 +1907,8 @@ static int tegra_vi_probe(struct platform_device *pdev)
 		return PTR_ERR(vi->iomem);
 
 	vi->soc = of_device_get_match_data(&pdev->dev);
+	if (!vi->soc)
+		return -ENODEV;
 
 	vi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(vi->clk)) {
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 80cd3b113125..148c68ceb605 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -236,6 +236,8 @@ static int tegra_vip_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	vip->soc = of_device_get_match_data(&pdev->dev);
+	if (!vip->soc)
+		return -ENODEV;
 
 	vip->dev = &pdev->dev;
 	platform_set_drvdata(pdev, vip);
-- 
2.53.0


