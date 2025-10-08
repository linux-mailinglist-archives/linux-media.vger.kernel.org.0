Return-Path: <linux-media+bounces-43929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA9DBC3AC6
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B43819E18F7
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81FF2FC029;
	Wed,  8 Oct 2025 07:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7+lWQWy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076CA2F7ABE
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908713; cv=none; b=f5EeSfAO/+13fqPeEuy1k3LhcsoA9+DzLHQnKw0jM8dgNr9QaMcZsqS3T4PE/IuwVdxEGQgtoIMkJtgPwZ4HqN9vW/Nh98ZjhIX+BEZyUxJVKFIbcchwufal+M37081IhMSOxm9WMx2yHcr9e5YzVgfglRipg14dcbv5ViPURJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908713; c=relaxed/simple;
	bh=DQG+inBx8ZXDHcXJybTvBi9O4BMU38YbAkGRkU7JaQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mA8qJajx5DelJgwQeyOqcaN1cv312oMGTrND8HzRoW6YYwZ22bvuaO4IWBCUWmZbvg1kcT5Rn3vev8YK4vo10kscBj4RfTMJ0GSIQbp9Kvw/JUTY7i9LoigBigIN8dAD9drklmxaAOCFvx36EU3q6TPRMLVkoRmXUEUl6/k45iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7+lWQWy; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57a59124323so2275100e87.2
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908709; x=1760513509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=G7+lWQWyryV9LtEA2h9Fju7xkySa19kVPCq0EdVTAxoBLBWbkS1pirZzs/4eu3elyk
         mN23d2df8bowdox3TOvuMVQMHK2Nia1knM5j+OG2by1uPRgQYhtR5TjTXxtBKeIL7br0
         S1FHVLlp6CJoC3ZUfBORF95/aRdolUBmEl08BoQdBzK4khmQ1fdOV7G/iDE4JdMeION0
         fIoAzmKGqAh+Z7fbQGakX9yIKzicjmVD8LssRxXjKCNyoLPU57f7CxK3NdIxSppciZug
         FTnW/tTHWxVhHFEyfVNdvC2kVgWWmZ18QBMEXYxZwuI39nQSlc1Q60F+IuZPzZKg5kyi
         73HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908709; x=1760513509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=SUzDU0qeL7+wTJQ9nSzuT3w9i/ZSXsK4YUqc0iv/ESZLlYvPBhFgfmWPr+Ogt1qazN
         EnqbdpkFzyssj8M/YzTNrCWGoIwH6xD+98ShQuyRuIJvkcImNV5Vn4ZCmONziA6c2Brm
         uNmidc+tGbK4djzxx+kxWSyrKHzsDxwtdfVqAr49/zDXG6N69U00vYaMSTuLrxs4UA57
         MBM5Xc4l/xeNLhpDi5SbZzoIMThMc8Q2uK+nOJWHtoej3CUGX4Sm32swU30GHuonFwNp
         WyBvOUg5YyedVCJ5VmWQ0tnbYwy2rAyXQN3c5Jzp07uFCveGUGktduhiDE7Fa5V7Dq/V
         RJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCWve5hc2oNA6o4hNE0LzCU8iN+QoObkkch5e3XRIeY7f84OXaJdW41fNo4QvSYWFKTBK1eZ77+kKGlyng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCjvQeyEeJqdZDbwbZNoroxgBLHYfZXH1FgD30Wl7pk0YoHq7
	uTRTLGyJ6zkH8nu9tprfVIH6fk3g57sEpA+xBaOL9bVtohGIKtq4G+Ib
X-Gm-Gg: ASbGncv0Yc/AUGbJlKA+FK6CoM3zjCig9q8JHcMWHF/nKptVg52T3isaVRrhDYB/pRA
	XSHhRA6YWKtEfEJ/BimBzUCo5REgSqefXXejncgLJuF/Q8/mcspugH4K+IGJnAb7+gFVLS8VaG3
	hY5YPqa2KhUfLV76JHcXrveWoPxXVlS4jcLoCd7YfXDo7OBzK4rMpRWgZQi4UBvKJPAIAKX5PmE
	i1aCTNLqy9IV8bVbkywJZddvARI2T3HgUDy2mFjMaDZwpC6dvSM8z5EXgFWyP4vtLffYD2Ryogo
	P9dHrtKV8QVBN9xmiSJVdPQ9i/msuQBgF5Eg4JOUGP50o0l4aPEF+x7L8QUucHOXeZzY1gSAEQz
	yBdiCDzKb9vuyg2pGlUNBUdzaycSwuN7W27YEsg==
X-Google-Smtp-Source: AGHT+IF61Uf+7jyVQLbDjguFkflG7qNGvFKGa9VJbcmzM10P4AOV0pJo6kc07mp87QYBfIqV8TPf7A==
X-Received: by 2002:a05:6512:2247:b0:55f:4107:ac46 with SMTP id 2adb3069b0e04-5906d8a084amr687325e87.25.1759908708862;
        Wed, 08 Oct 2025 00:31:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:48 -0700 (PDT)
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 21/24] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Wed,  8 Oct 2025 10:30:43 +0300
Message-ID: <20251008073046.23231-22-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 0457209b789a..626f34543853 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1


