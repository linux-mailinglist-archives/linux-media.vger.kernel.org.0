Return-Path: <linux-media+bounces-45262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF127BFC84F
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 403D51887EE4
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAE4347BCF;
	Wed, 22 Oct 2025 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POWMSZJD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A23351FA1
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142925; cv=none; b=BVbMBlIEXqOF8qtvYtcvvsmGQiqwSsuxds8Xz7oeYEUBI4xW8YcveQbi5PntrNub3QodcFGQmZieujTRXfO7m7QWXKseV+MF+a/sfRBcfZDuuqsqF5W1fGbDUOYhV/TyNfTKWJTfOcMSpWtLIRmG9oJPdfW2IAW+pniYMfpYgsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142925; c=relaxed/simple;
	bh=LMNj3RJtvSAolKc/cNyymmQWeXKMjtcs4eYn8DUf4jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZa6uuUKNa/v0EbXOEhVJJgY6my/3+ccAI6WLVN2xxRB+0pnWaVyap9FMF1usHj7FUCeHQR9zdrf2jJ6C6h8aLUm5LCyI8jYNDK5HrBqvVNhVJvgw3yWC1ei0VBq2sj470IbSFvlx29LFkK2z/xv4PwYcr3G78wGUeqqUK2dcdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POWMSZJD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4270491e9easo4308028f8f.2
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142915; x=1761747715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=POWMSZJDp7lpsCky1EgRlQLwH1w0TX/qXwWgEcXcEJUONjXLwGvTyMQw0U2PtwwaUR
         dDMCX4sTtRfHgL0W9UkSwGe6eybkaEJ7qWlgMe720o55F8uZUUF3JAXFzU6IyEAyytj6
         4WjEX+huRmlGu9NzEh8moCPBJ26OMDBNekWekIC43RP+ZUS9ODog9d4uxeVNoxfF0O1t
         eue7s3PqjdubmPWcRNi93cq+9MYgwn9hvlNbxQjQxkzb38cyWhuzi5cTEngosZudg9DT
         83r3THfeh3s+CinBLeFPEWi0KpQcHmy4wBeOnybQFnPv/N9cGRKyFrbDEDpYylBoJzv+
         Uvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142915; x=1761747715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=wDmWOcxgFRkGVGjty2GvhzGF3b/Iqk46D9cp9NyA/i3+GgQjZtLzm0bLWSFlMsfNXw
         XY4TczYsOZyZ3Z2asbRc4bvmpzK7ZXkAQOMceFUQpwrbPzpHAhXPnhuJtKeAkv7nZVIG
         vuB1LO9CFoDibooXJUwqFfU37QlTwaOATCGKwmWVzTIwhrbMdMats6lXM1dQpQgbb0UR
         hdbgx3uGX8ED9f+mdtGYHtAputLaKtq1dyVxlkCmT06Es1mAZsaT04HGdFgDeeu6+8t4
         fDnisv0V73qQayUrVcrU7mVXFArfNvqGqaVTdcppaGlaWUGt1oGVDmkkAJtp2nI1tmyL
         R4VA==
X-Forwarded-Encrypted: i=1; AJvYcCXKu9vyi+ZEPDja1jdf6NnEHgThP4niTzpOgz+8OAsmTZwfuZuraBd0lNIRpB/2NP7XRvpmHHi/eH8A1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhzMe6fkNx/gOvsMKMxo4+3F88hcOne4zbiBFjr2AvH4pK1IcQ
	ZBlG2UjadH0ziK0KiWQpBALq2wkitFydGoYUtMWiFFrPxCzi2Fj2hoBj
X-Gm-Gg: ASbGncu017o9+zNzOnbjBxieFIe3ZDJqM0NjnYw5BUFD8vcau2iqSB1gPGUf2SVlHDw
	AyPpFI7xUebqT3szW88Zb6RdZts7LBg1IodjIbUMQV/Y+nVMaxsHO1EKvQNDa7AnwN6Gb2JtYAW
	vWev+5+T5gA866EsZtHkCbPO+9inxfZa7J3go/taT+p1H9C7kymmtPESq82yaSBGF1BntR/QccK
	vZuRVlQk307sb67LM01RMVl8OuWYy2da1AkoLRWV2XIHGjGHRDf5FWrljez6RT+C78SQISbGZyy
	+98XDv0hIzgb2H6SCQuqnJPB+btY+uqLufWEJx3rWSWp2+1ebadoaE2Ut+Dl6eaGkNEBbR448PS
	TrwP0Gxgeco1nPAXzOR/FgIumuRM6Fu2/5ybDJSoDtmCMBm4CnlYqx2EFc5KwfH3PO7M=
X-Google-Smtp-Source: AGHT+IFX0XnrlT4GW6rKQFEmK1orh25Up0PxK9L9DQEcm8KVBweiXSL9uA4QjEkF/hiMIpTbvZ0SpQ==
X-Received: by 2002:a5d:64c4:0:b0:426:d51c:4d71 with SMTP id ffacd0b85a97d-42704d44253mr11937579f8f.8.1761142915306;
        Wed, 22 Oct 2025 07:21:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:54 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 18/23] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Wed, 22 Oct 2025 17:20:46 +0300
Message-ID: <20251022142051.70400-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 93105ed57ca7..149386a15176 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1


