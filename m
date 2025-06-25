Return-Path: <linux-media+bounces-35882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 525D4AE87EE
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 17:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF08D7A1C94
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770852D8DBC;
	Wed, 25 Jun 2025 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gopCmP7l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6AE2D8784
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864993; cv=none; b=V5pTJSGUVwdh4LMLe2+FAfFT/Uq+olviICE8IN7idIHN567zlI95jzIDXYi1XrIrjRyYfJipIpSXPR5v08q15aPKcymHWLeirHg2EWKK4v23qWKCYKjCwlE+OUymTvh7cTOE3r0uWkXONFRMsUr0n/OF9ECSyAMi5QO1R/Wq1SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864993; c=relaxed/simple;
	bh=5O2/4BpQHfklLSAAZ+OUfTKYve/rhKype+tQDUVh+no=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RO722doFwVmSv8VwZWB7qmtvmguXwGi6etYqYQZXo7sh3bLO5rjAhNz8Sc5Wmk3N35ymNGwzS0hKF+8ap/1BB120jLE+gCM93MrSntDlGWcx/3kJFfMiydNA8sesC3Y/ZO2mleCIoeh148gNCSK0j/z4RicG8CZmfhHsWTxHI+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gopCmP7l; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-735b9d558f9so602319a34.2
        for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864991; x=1751469791; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RscgyY7zr0J0heuodisQOvqSQWiux2P+I5t0Y0pHfw4=;
        b=gopCmP7lQbciQsrEixvDxNRXOALsnIT2oVDTnaldRPWO/cvurg1e/doGdO7JkVk7KR
         9jIjSCbJ0WB4/3BAUlvJEfn6zG3pUqleX6fI9HAhWAzCoOR65VzVdoEnouPG7dF24owP
         afVOis9bpICpAWOapd8oBx/bESglX1ysYX1BG1yOTdInAA3LtP7wjvEsIjeL/3OXe9oP
         nbaPNT2ikwFK9XDxnuR28wt6FCLtIVbXSPcDRF9mofL2UwHJ1KLj8gdyGjA4RMEvaw3n
         cGrw6hElsP4LSXm1tGHEjhg0uiEwKjvnIdaTmpcar24CR0ya0kIvBLXxDjLjYw0pQTNC
         gHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864991; x=1751469791;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RscgyY7zr0J0heuodisQOvqSQWiux2P+I5t0Y0pHfw4=;
        b=SAi5dHoLwSyWJCJ5Gm8xCESvb4TuGI2R398lEd2zdBhhs2amlfd0PZc44KkgEYqmGt
         bAXlKVgD7SOIGahTWxFtGowinvSOHUIuhnCxkvUnfpU/snrvEQTjfskG0Gmo4yKXJYyD
         kDDsce5hYJ7ATkMyseKn8fGQ+wgfhlVdusw0Cke0i4w/ZII5jxwFjOpIGBWsaS6WOnmT
         sSk2hrKGepp4PNZmbCaiwNwSBFO7MD8GMHyxlI+B4XcwGdQCaSkVhq4rspd93Wh74BVq
         iHcr9LibRDMtPoiulb9lert7nAKnds2g2CYEty/0QAgwlMDaZQ/Ap4XkLiZMBh4hWmpj
         47Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUCF8yi5rpujveJ7uxwHoLFZNBBYSTFlm8GJLY1nUgRoqZfVObtX2axL3A76GeDDSAz4SGdG3x7Fl4Ozw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXAXJ28VpLuU7dE5lbWD7Eis8+oyjXg/D/r4wGv8grQbruReAn
	ZKq8iJEHQXhuDmnK3XxeDj/J6s8J0cb9lzS3XUZILvl1Zyri4pj7Zjer6ef4+rNp0Lg=
X-Gm-Gg: ASbGnctT7yZ0gAQL7N2TlH2rAdjbqXqPU12Y9P5HrzXErlObLGZ0pDqrGCFMdavMSVI
	sCkGbqGFNDyLYngRIJLyyYUUVeAAQh938RP4JAuWZiESqx+8SJacXUoR4VJrvPA3gGKQzLA4Kh6
	muc+a8H/7NSdhaztXr17DOghZPGGEUynbYOlGGfUjxsIQF68RN2lA3RKrL9cPNgWAlYiaU0SAHF
	hsYcxjq88vNkcuE9o+by8n8NZVlE0ne5bxx7UyJSILt/+13rkbkWa+GX9KxD4HnVf6nd575FAKf
	F1R5OeUCbO8qVph0x08JN6zRuqBBhQ65U8oCCHVUqzqgB0lK/kS9SFGnMv8IodJd74837g==
X-Google-Smtp-Source: AGHT+IFW4wlR0wlfzJlAh8x3qk2Cx37JojTQFFpNrPClMsltnG4YGIKmiULYONmufRuAqIk5456wBg==
X-Received: by 2002:a05:6830:2113:b0:731:cac7:364e with SMTP id 46e09a7af769-73adc811af9mr2506085a34.22.1750864991484;
        Wed, 25 Jun 2025 08:23:11 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73a90ca9c12sm2237043a34.50.2025.06.25.08.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:23:11 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:23:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: rkvdec: Fix a NULL vs IS_ERR() bug in probe()
Message-ID: <696219e9-a1c7-4c87-b15c-1ffd42c95d58@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The iommu_paging_domain_alloc() function doesn't return NULL on error it
returns error pointers.  Update the check and then set ->empty_domain to
NULL because the rest of the driver assumes it can be NULL.

Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/media/rkvdec/rkvdec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d707088ec0dc..1b7f27e4d961 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -1162,8 +1162,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 	if (iommu_get_domain_for_dev(&pdev->dev)) {
 		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
 
-		if (!rkvdec->empty_domain)
+		if (IS_ERR(rkvdec->empty_domain)) {
+			rkvdec->empty_domain = NULL;
 			dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
+		}
 	}
 
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
-- 
2.47.2


