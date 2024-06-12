Return-Path: <linux-media+bounces-13041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C118905444
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 15:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9404B22323
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 13:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8993017DE24;
	Wed, 12 Jun 2024 13:53:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2E17D355;
	Wed, 12 Jun 2024 13:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200389; cv=none; b=eJd2fFN+gC5H9q9iHWd5WdMi0kfhVmicqi4G6sf7pXwsYPrOuB+6w/5iUuOALp3KH+Be7H/mNwToxKlE4i+6Owkps2MEpuE0HEBZyWuGi5HZO98BYv8EKChrLSkVM2RE3Bp46/HgPi2ewifyr8OdU/MB2Z3M3aDpvyopdQ1mh4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200389; c=relaxed/simple;
	bh=CV2uriN9S/YzuxYjZG9aIAQnqMjtHHg9/LRTS/nuTmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7JgZNwCOZhoPom3QbUi+uhSASX/clCU0e64luA2FgKBI3u7JsnA4cMOucME9i66KW5mz/xKjVgYKOzblWIAhXwhwkH/EVwxGv3yc3Gs8KBn3SOvaqpWBuXDBxBbfS0I4116qdCvvG9Jwf2rnbNZW6lFxLbL+xSB8AWw27IGc6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42165f6645fso19520405e9.2;
        Wed, 12 Jun 2024 06:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718200385; x=1718805185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdcbJPuvm/SOnoBP3pphclytefXjwVWNFObDahPD+Oc=;
        b=OcZurVGyUOg4vg2tTrY7HG7Bt2c4TpH++gQNSTZrnAdj/6tLSkG8b3SeC5sq04Om+y
         xZ/WmzII7TuyqsDyTo6yajpa+RR+E9wjjsvu0csGhLF1FVqVUxTdDptWwT5bea1N18mW
         F7lWlMrcDN6o5K9bm2dbezjCmAFh5/6jTZeDRkKueeAy4P3QMhfQOwMfbtk3XIgRhden
         JPd1tBMbT2DqRiZcKcSSSR+5SqjFdW6pTBfn1yuBiMVtLVd8sp+dba9h78caIz2kZtul
         TR0qOqTAcNOMFk9cVRmSoW9nZaec9SqPSEOj8Gu5+qZEvKUJ+jGhSH72/PilI0ONCfHU
         DNFg==
X-Forwarded-Encrypted: i=1; AJvYcCV3KfnIxPYCoABSWyS+EBclVFH0vfu3BQ7YJqW+RYhwFWlMi1AckZDXaLhiAQKd6r/1WvWhci/i0kmxdsJK1S06B94A5iuLPUYk9KnYybaOuGAsjT1/7fCgcqu6ZvNjKdyrwZTqmI0VaSwL8pDAFYgKKAUChaHif3kWpS2r9o2FhAb8jmdx
X-Gm-Message-State: AOJu0YyjfJUK1WNyBvFd7w2UF4BlytDZAF3w2onXi8GJ65ZYw05tVNsr
	uRCyiEF29X+W4z96f95ZAeRlrvBnUP9Y/y+IK6KtDUJ6CzPH+WqJ
X-Google-Smtp-Source: AGHT+IFJ6HaoLtBMH/sfOyJVvqVCohkpotBVV3isMd0LH8wFPWn4nrbmoRl/1VKV0QqTF75zWTXtLw==
X-Received: by 2002:a05:600c:a46:b0:422:683b:df2a with SMTP id 5b1f17b1804b1-422862acc15mr18775005e9.13.1718200384503;
        Wed, 12 Jun 2024 06:53:04 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 06:53:04 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 15:52:54 +0200
Subject: [PATCH 1/9] iommu/rockchip: Add compatible for
 rockchip,rk3588-iommu
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-6-10-rocket-v1-1-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
In-Reply-To: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.13.0

So far, seems to be fully compatible with the one in the RK3568.

The bindings already had this compatible, but the driver didn't
advertise it.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/iommu/rockchip-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 4b369419b32c..f5629515bd78 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1363,6 +1363,9 @@ static const struct of_device_id rk_iommu_dt_ids[] = {
 	{	.compatible = "rockchip,rk3568-iommu",
 		.data = &iommu_data_ops_v2,
 	},
+	{	.compatible = "rockchip,rk3588-iommu",
+		.data = &iommu_data_ops_v2,
+	},
 	{ /* sentinel */ }
 };
 

-- 
2.45.2


