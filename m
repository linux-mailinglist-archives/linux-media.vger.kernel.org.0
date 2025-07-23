Return-Path: <linux-media+bounces-38288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D29B0FA08
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 20:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 898DD96251B
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 18:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0012226D0C;
	Wed, 23 Jul 2025 18:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="kecbuE/A"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96533223704
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 18:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753294381; cv=none; b=RPgN5+ALkFyZMn1OipoNzusEetr1iCWEsZ8ztbuTPXunXyucnpfZrcjKcvPpfKtbSuIvTWCL7p0331vJN/W/PHxIM02ZUj9tx30sZb5DOl2gRkyKNZQTkp8yOnB49CdkoTIVa85RFQddpxP4zHvLCtcYEtDSCongc95X1kiu+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753294381; c=relaxed/simple;
	bh=IoJM5k8gu00K4USptc5OhMjR7OL/N6KUXNIuyJSq3/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+uqmUncSjVdH2D4m03CVcuWyNZ6Ea+2zNR+RZXKRp/WTyDS3dldOwZ/2p7JBsQy3qbMYmm73rYusqPepD4UWAWIKaw9W86ZvvvkGyMtjg0bEAnsVctSJSfp1v0ew9eFIuPDI4UNxybNmJrqbBxYOYKHHcLR4daQ7kCiJJG8fC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=kecbuE/A; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-75ab31c426dso214091b3a.3
        for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 11:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1753294378; x=1753899178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KRBtTt4FaTOSTc+GWTfgDYuIZ/jxrCB5XixWzEejzWU=;
        b=kecbuE/A6GZwq7c02Tc+/vXRPPz2zQrj33eYJtUdG/1QHTkxPlfS/xVDkb6eK+mKwE
         wPzdZRZco1kmEXka7r+ghP2mee7uUkjuIkVyMlBCW1MuzCUHUGUw/+FgUyGpPZOoU8ji
         iEbu7Oq/PBiAVE8htxlHwsp7ybO4NMPXH2BH4DyJR9kAcidkYXoLT2abx6zAYC5WgOi3
         vN4zOsGRCw4TDqHfknI+5Ol2OcPCbNiDxyORuLj6AQ1njQOfDbEN+GRXU/lfvuzc/gap
         Ddrp29qV6jGju7b33iZaHW1OhPN7uFiAt8IKa1QoUzxCiJzUXQARhHyuhbX32Cm/wzZt
         lEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753294378; x=1753899178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRBtTt4FaTOSTc+GWTfgDYuIZ/jxrCB5XixWzEejzWU=;
        b=lqZK2ddgmeg25RQ8RAw1NfgzkCLagVnLoBtL2W6BXDfmQplefwdjjCpJMOSYQxVGrx
         7xTr2/ln/GcqH+dcZcflRRdDqNyDlk4duImxxlYVZJnZPQ0j28HzmTY0HAQBu7jdoa3M
         6LXEdpHnDXjNfPM3lWypFZ0FPYwneWLxPW0c7hcNBetX88VQQbN+55jQeiEkS5ssrTP7
         XIFgJRHFmlv8g/o/2yHKABa70ef60fFhetfVyJ7bDtc4a5Q6qAyxGrd5VuPBS6MbLONE
         NwKTckKdHIblm/did1lPLwOc3MEnlJkzI7EBoElLZgmqj/AOgmF15ITsgZ1cLaEvUWS+
         sQlg==
X-Forwarded-Encrypted: i=1; AJvYcCW4rUapYv8RPapZl7nacbwyKenLcXLzNgKnv/W1eEknNvut3t0LRSeBXvDnKxtDKE9ibD0NNM0ahY3hOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwghzYlE0JPRRTeHU9548A1X/UNGJXKhwojF5Uw0G9toG0v8dI
	3R6XNIvOVAUenZ5l2pnYS+vdb1U6D7ZsIZg8LCxBRMmbrTvAY9RbDhH6F0KkALVIxNOi
X-Gm-Gg: ASbGncu/CzYNWhWxN+cNH7QddUUuWHTSn0GsSD2JjA7WOj5RYHgBwMMBQqqej7xSRAV
	r9R8av8VsB56DAC7lcZhAsAvZNv1/xB/QavsWrBef0iqYzO6ez4anQ5rF3eySjOOdheEZTcp2Cm
	0UaEJnDnxt3nDgNnlMEbKadBequ6K4RLzsFWvTywoHO+yANO148zfb8uiGliWNQHjpUIZEY47G2
	liyAUBEHRCJsaj7TPPt+3GdLa3NNyi6qDXILAoBG133xgCN5xYeNH6zBP+LeynOLPNZ3VcvXGuA
	fBsLMd8F0gHJaz1uYTRYnx/RcTGrcvig5kH55zAZpjqqo6Xs/WLMH/GRoHyzi4bHyhsHbWKncct
	cLBw1eq6XW28qka0ebBurRaE2/2o89FA1NTI=
X-Google-Smtp-Source: AGHT+IG8RlX8EaTNxnjrK8cBNiAzFaGbxNnOguyYkbJTZTChZrwDQdPD/l/h6iZ+WVo7VIPkC2HfZQ==
X-Received: by 2002:a05:6a00:3e0b:b0:748:e38d:fed4 with SMTP id d2e1a72fcca58-76034a00040mr5466661b3a.6.1753294377675;
        Wed, 23 Jul 2025 11:12:57 -0700 (PDT)
Received: from sultan-box ([142.147.89.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d6bf2sm9504248b3a.53.2025.07.23.11.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 11:12:57 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:12:53 -0700
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
Message-ID: <aIEmJXNpNN0QF233@sultan-box>
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
> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC ( Ryzen AI Max 385)
> (https://ubuntu.com/certified/202411-36043)
> This patch series introduces the initial driver support for the AMD ISP4.
> 
> Patch summary:
> - Powers up/off and initializes ISP HW
> - Configures and kicks off ISP FW
> - Interacts with APP using standard V4l2 interface by video node
> - Controls ISP HW and interacts with ISP FW to do image processing
> - Support enum/set output image format and resolution
> - Support queueing buffer from app and dequeueing ISP filled buffer to App
> - Starts/stops sensor and mipi csi when camera App starts/stops streaming.
> - It supports libcamera ver0.2 SimplePipeline
> - It is verified on qv4l2, cheese and qcam
> - It is verified together with following patches
> 	platform/x86: Add AMD ISP platform config for OV05C10 (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
> 	media: i2c: Add OV05C10 camera sensor driver (https://lore.kernel.org/all/20250408221246.911508-1-pratap.nirujogi@amd.com/)
> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
> 	i2c: amd-isp: Add ISP i2c-designware driver (https://github.com/torvalds/linux/commit/d6263c468a761cd4c89887073614394ac48441e1)
> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)

Hi,

I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.

I cannot for the life of me get the webcam working under Linux. The webcam works
under Windows so it's not a hardware issue.

With this patchset and all of the patches you link here applied to 6.15, I get
the following errors:
  [   11.970038] amd_isp_i2c_designware amd_isp_i2c_designware: Unknown Synopsys component type: 0xffffffff
  [   11.973162] amd_isp_i2c_designware amd_isp_i2c_designware: error -19: i2c_dw_probe failed

With the old ispkernel code from February [1] applied on 6.15, the webcam
indicator LED lights up but there's no image. I see these messages at boot:
  [    9.449005] amd_isp_capture amd_isp_capture.1.auto: amdgpu: AMD ISP v4l2 device registered
  [    9.489005] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: The OV05 sensor device is added to the ISP I2C bus
  [    9.529012] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
  [    9.554046] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
  [    9.554174] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
  [    9.580022] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter

And then the kernel crashes due to the same use-after-free issues I pointed out
in my other email [2].

Any idea what's going on?

[1] https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
[2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box

Thanks,
Sultan

