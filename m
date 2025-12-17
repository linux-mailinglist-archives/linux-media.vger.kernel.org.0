Return-Path: <linux-media+bounces-48964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20803CC6684
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D469301824E
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 07:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1DE34888D;
	Wed, 17 Dec 2025 07:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="T5+p4snU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621D8348860
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956988; cv=none; b=OfCpJWA8stcyvkT5jreMTOxO9EnKfZZ6/R0ZtlufcaqVvDvbXWbL448q25RhofjxzmpfoPpR6IycDfUQikmZDOTbV1SDpqEUmwJOrcbEN+n731L0VkL+9OCLLPdmr6GuL/EdokwuLJcO88Ac91ukQbjAe35gwce6S9jkYNT2zmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956988; c=relaxed/simple;
	bh=Kq0S0gun6VBXUhZPsNE8K2dbuxakWof1k++nE6eN5/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7GtPClAGCVEFOO3+pJs/xVbAlmTLWQsQAM56NkmUgAcWC0EB8ArZJXlkHUu0ycbaoaJmCQWwf4rUGg3xnwvhvD0dgvu/ro87xtfq7Q/bGWhSQgicG2j+2WTD2JlhvpwFLJHU4D6bJvmrAcwklBomBhRldGyfFpKyqc3znItihg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=T5+p4snU; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a0f3f74587so37154465ad.2
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 23:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1765956986; x=1766561786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWE5vv6v6wuZtHopZl3madiZDTOgqyCJX5w0o/PLKAQ=;
        b=T5+p4snURDPmbVGgMTAWYBwoYPmcACCjQNmA6rULOj9oRVrxZfifcQBYcUou8heDZX
         PGQFGH5o9tT65QqEZ4PKr8zOLP1pt5qByPr8KudP4RNcKdTnTp64WHv4ITcCEzBubzNV
         MOh2Kg+lCTjq1dS0ypBZz1lQ4ZCNGzr5Xb5Trd6SJu/eOxqh7OPNUCw/9NRlAt+Hr0wy
         DLkpSLXToAJgfLO7qS2n6FGtQGviyq6mfu3XIFOfeH9/TYMyCfX7+TIjG8rbQiGrfz8e
         cT61qEyJd3EFXjuHVrp+goLALF9lxe+m5zPuBJ7SncA7SIh5UAbgM8hhtrLIADsCJPiQ
         921g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765956986; x=1766561786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWE5vv6v6wuZtHopZl3madiZDTOgqyCJX5w0o/PLKAQ=;
        b=qQHVmFSiRwfeSSPqP3YnKNB4z60n0ixsg+BYGI/fZqv/GSpqNOxgW/7s3dr6siYdhF
         KLFZQsi5ND5UyIjs/DhokprPT9swjboEBzcjaBx6eGqMyO8yMO3lm/HIB/wvGAx97PiD
         aGa1daXz5W39gI2Zh6gcLr8cVZjKqWU58YbNcJTD4p8G4ttgkA2DNB5rfUl9dNVnh7XC
         nCV6IwhNzZIAM7x0Ir9Kfu2bXAHOKqSTD1FfZX0+XoMA8fWW/+QmftkHLAygYwSsD04F
         k0jArxGyKg5Q3xX5TYRdt0YexNrlDg+O6bGo0TT8TbOb8zVhirwBqi3L+mtHJiFahffp
         HePA==
X-Forwarded-Encrypted: i=1; AJvYcCXYv9Dte7xQLGcYVT7k9XXKZ+V1KfROBLjEhrD+NdK5xIStycYwI5xr/4KplO3h4MJxh9/Be7ZugR2x/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ64GkK7DxOZJ6AnnX4pRbiawn+l9vf8/Er2WYxDT/GOH5MkO9
	BQ1DH75ObUhQTJ+24DaCRDG9bsDlOUgtIhvJunkfp8kXNr7JgMSKUxX9gl0Vp5OGn8Qs
X-Gm-Gg: AY/fxX4jFtW7aYygCYDbeg6e6GBrLC49UTTdL3NXKiwnnbOuxTxHeyGSPITRS54cKH/
	/widwut1IZaqdUDETScsGXNZMPVxnDWUdjzCUqJM7xEC6LMFSS0x2BLitqhTiUo+8EBXbndSRYu
	JRtmhsP6bxL/cYrofEZAReVrbP1eHR0drfPRacUf5iXUbjvWb6oaUySt+Kldwwv/2gZJ6lAtSWk
	raf548yAdcLLR3KA+ud7/MlbvF+ktQ+UzPdlJCQRBo2F06mXIExYlf8bRXrAWQr4DzQepTrCLgt
	MOzeTuKVSJdtzxLIQ2jx2jHGPB4Wdmf3i1nvQaUiHV1LxBsCUL65iE/raix6iCtt1OVvNneSial
	i6+tnJnhzOdyC+WyfIANtBf7eDjiMZPUkjOSuP8qOTCqeyRbUYTYiRqFPinLLqU+lBgm6WN9e19
	+At9eIZhI+C0fbmQ==
X-Google-Smtp-Source: AGHT+IGrh8rftXEhI8SkByfHHpn6ZH4gl9bM7u+uz3DE49ulaeKFEeD5C6Kq2E2c8TABAqoy8maX3Q==
X-Received: by 2002:a05:7022:2209:b0:11b:9386:a3cb with SMTP id a92af1059eb24-11f354f39f9mr12439978c88.44.1765956985499;
        Tue, 16 Dec 2025 23:36:25 -0800 (PST)
Received: from sultan-box ([142.147.89.218])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm61779524c88.13.2025.12.16.23.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 23:36:24 -0800 (PST)
Date: Tue, 16 Dec 2025 23:36:21 -0800
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com
Subject: Re: [PATCH v7 0/7] Add AMD ISP4 driver
Message-ID: <aUJddaGQTKJnJIJY@sultan-box>
References: <20251216091326.111977-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216091326.111977-1-Bin.Du@amd.com>

On Tue, Dec 16, 2025 at 05:13:19PM +0800, Bin Du wrote:
> Hello,
> 
> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
> (https://ubuntu.com/certified/202411-36043)
> This patch series introduces the initial driver support for the AMD ISP4.
> 
> Patch summary:
> - Powers up/off and initializes ISP HW
> - Configures and kicks off ISP FW
> - Interacts with APP using standard V4l2 interface by video node
> - Controls ISP HW and interacts with ISP FW to do image processing
> - Supports enum/set output image format and resolution
> - Supports queueing buffer from app and dequeuing ISP filled buffer to App
> - It is verified on qv4l2, cheese and qcam
> - It is verified together with following patches
> 	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
> 	drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)
> 
> AMD ISP4 Key features:
> - Processes bayer raw data from the connected sensor and output them to different YUV formats
> - Downscale input image to different output image resolution
> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc.
> 
> ----------
> 
> Changes v6 -> v7:
> 
> - Added missed blank line after some if statements.
> - Changed the pm_runtime_disable() order in isp4_capture_remove() to align with initialization.
> - Reset buf_sent_cnt and start_stream_cmd_sent on stream stop.
> - Removed duplicate buf_sent_cnt and start_stream_cmd_sent reset in isp4sd_pwron_and_init().
> - Combined isp4sd_reset_stream_info() and isp4sd_reset_camera_info() into isp4sd_uninit_stream() to eliminate redundant stream info reset.
> - Removed always-false status check in isp4sd_uninit_stream().
> - Minor style improvements.
> [snip]

Hi Bin,

v7 looks great to me! :)

For the whole series,

Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>

