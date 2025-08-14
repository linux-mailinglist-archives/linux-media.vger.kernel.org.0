Return-Path: <linux-media+bounces-39865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278BB25C3D
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 418149E280B
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 06:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE9D25B693;
	Thu, 14 Aug 2025 06:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="joAau70V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA9E5C96
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 06:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755154414; cv=none; b=rs3uIDbd0oYPWJdv97PCdLfy3uAlUSvMnbYxfJibdOO/GVyKhBAhGbimFTkAUBqZOUeaxib8gNkxn+OZ0Yfdjv7lTWJXcN+i2Pve4YHsQPqfUYT99QQ/G+NfxyLiOBefcTTZQ6ju7DF4CHzfRAYkSOo4mgoqzJ+p7av25mw0I9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755154414; c=relaxed/simple;
	bh=I2f0Kmwx35GBfduIK/dxSt63Wr2nKS3YOjch7WOFfSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtY/NZSRQsIK9Ikx0+RiPefusU5XsXaiAqle1+rx2PaFTj54nLSnnVjBM3l+7lDpAiTfvtipP6UyDnFDrffESc0yK/S518NOv4t3MtkHX/Bi1CXleY3JdCoenwwRykbTUHGiRxGKUE0POafimG5SIqoHxV01gZzqb2tvlZGC6Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=joAau70V; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e2e6038cfso1078263b3a.0
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 23:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1755154412; x=1755759212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I2f0Kmwx35GBfduIK/dxSt63Wr2nKS3YOjch7WOFfSY=;
        b=joAau70V52U2kzayZJ1Tqw6OfcCqevVwv1HFFRTDqaSQMrAw7JLU5citRaVT30hySB
         tTzrHohI5wm7+ebRCmoimP7JYoq5psnWV5fbrIp3T20K0J2NTUQ8lJh5IrNVvDjFaB9s
         Q9XmvcYv8sKWi4ZVIx/OANiJYjfw1+jLdAAk3nBcd0JRt+vWdjaNHPAmO6tNXXxRy14p
         8dZuZX7RBNRGst7HUqTNe7A6L1SH9zgY1squQozdEZOnNYHgDACqrK2XYtQ8/D0pY1UN
         Axr6ZZf0zmI/3Eg/fsxUu4+DJjTueNeoj0qxuB3/8xslwbhTMXljxQtrIlsFDm+INDNy
         Wmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755154412; x=1755759212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2f0Kmwx35GBfduIK/dxSt63Wr2nKS3YOjch7WOFfSY=;
        b=db5Dnc2C7Si28RukzWb3W+IxkvG8arj9kiO8BxO0S8dDD65PD9ww4WU2+jNtmru8EJ
         Xd6xnPvcNrd/K7dZVHJIasLcQ+cImafWKhDRwJXQIe06QMhABrHYBFsyfZnH8Ht/Am0I
         Or0pCr7PgsGpebTILuNor0gZmDRMQtkfF+denIAnrKHBpEKvWIMKTfp3c2qPiVmaL/5L
         4TTi+aRItXreyuQnNJE54zADNBPSxEPBgq8uyu912PviacpttRu9bCDk9Cqe6Vxa9a0t
         Eq7EOmfq4pCjLUM8ZvPPGxkk+OF09ggICpEUczMf4xlFDqoHbKNUFCP2GZutpXB8CB0j
         nHEw==
X-Forwarded-Encrypted: i=1; AJvYcCUtnMtS3VVTycD/+MW3kforSYFDiNET6H7068V4nusKi0SEtJtM4b79ySwN/7Kefq735+ofVtzo7AID/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzILXtwFLIS3b3neKt1RU+UbYZZbTncxjUA2TmqK/TBiMsdHl58
	YHZZ4MQEdhvtTgTJFqv1Z7BeUGGlzPM/8vGlNqAqG6SBHaAjeGgxfw2K/F91C0SSigCpINtQnks
	Eq/fyUg==
X-Gm-Gg: ASbGncsIYCuwpm7Ai8NW/oeImdI13PQooIRCPyfeCbY6U09L6NmAWAF/s8xsRXBWd1O
	Y8YKRYxLIJcq3J2T0ksnUHBSRII2Uvh1EMPe63zZ/A4r1FacW9KHz4lSvUxS76e73UhcLsW8iXb
	43wi/0H/wb9g2k1CIB+3wPua8kYlOyIxUtURO16H7NnU16dd5ACte4BqPeiEsjO7bGKsKBwAaGy
	+3qyQr64JIm9KKX0a6CTEt1Wj3fGqchpytjx26Xo/wCh405lHH0TntXHwclBRHopCFs3RSJlAyd
	1udJvq8rMRwlNQFHSpY7EWn8ZxPY7jz1MLw6WeJC7oBJ8gmASgdiCt/41mt9/6R2/X7dth1yXff
	KQxJN+dhNGXw9vQskIg8c0Rmlvg==
X-Google-Smtp-Source: AGHT+IGvRd33xzKg/pe8y/fTlz3quAUsTO77844G78vPlMhID8A1Z/AcMV21WIDU2QS3X1+7OdOc5A==
X-Received: by 2002:a05:6a20:3ca7:b0:240:2234:6835 with SMTP id adf61e73a8af0-240bd241613mr2844646637.27.1755154412485;
        Wed, 13 Aug 2025 23:53:32 -0700 (PDT)
Received: from sultan-box ([142.147.89.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd656sm33719534b3a.72.2025.08.13.23.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 23:53:31 -0700 (PDT)
Date: Wed, 13 Aug 2025 23:53:28 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
Message-ID: <aJ2H6CIyZvN8W2sS@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618091959.68293-1-Bin.Du@amd.com>

On Wed, Jun 18, 2025 at 05:19:51PM +0800, Bin Du wrote:
> AMD ISP4 Key features:
> - Processes bayer raw data from the connected sensor and output them to different YUV formats
> - Downscale input image to different output image resolution
> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc

BTW, another problem I have which I would love some help with: may I get the FW
commands for setting basic 3A parameters?

It seems like the default AE mode does frame-averaging, which is really
unsuitable for video calls on the webcam. My face is really underexposed as a
result during the daytime because there's a lot of ambient light in the
background.

The webcam on this laptop also has a very wide field of view, which makes my
face appear small and shows too much of the background. This also exacerbates
the AE problem.

I'm thinking CMD_ID_SET_ZOOM would fix the FOV problem, and then either
CMD_ID_AE_SET_MODE to change the AE mode or CMD_ID_AE_SET_REGION to set the AE
ROI would fix the exposure problem. What do you think?

Thanks,
Sultan

