Return-Path: <linux-media+bounces-38507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A1B12CF6
	for <lists+linux-media@lfdr.de>; Sun, 27 Jul 2025 00:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E0547A8577
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 22:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67C3219311;
	Sat, 26 Jul 2025 22:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="P25KKNDW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48EB43159
	for <linux-media@vger.kernel.org>; Sat, 26 Jul 2025 22:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753569121; cv=none; b=K1tP2kxh6j3O29JqKFH5QTwrxsPmia68+gRgTvMP2GaubWF8fL+ztGPmzl33ihMYAtNwPzkGh170Y9Er3015e3vvxCMbwcXveW9Y1fFdYsJ3FPGqNrsri+RgUV5cM1yO4k+33L1rd01b3l0RS0A5EHrGMafVkvEgnhLtkY7DEK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753569121; c=relaxed/simple;
	bh=Br0igOSWeBgd+8tcin2EbctaTl2MsLwbeeC9XmXtjgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fN9ol9cnnblFFsc296aG+BXyE9qTccLPiiJuLkz6/jGbmhMaUJivR7ux2RMp4nEKraTHFu9t04Df4Ccq0juXgWZFvbPsPpgBsjP2OzmQNxCFbvXP40DiCTnIRpplIgOyxxqfQJqKqI6nm5Fkwmm9RF6ose7hvVkUkJhMOmDUqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=P25KKNDW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so2219896b3a.0
        for <linux-media@vger.kernel.org>; Sat, 26 Jul 2025 15:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1753569118; x=1754173918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=goQUyZCivbdecbzMlPOrKS5rZk5oqTbMCiPefv4GjFo=;
        b=P25KKNDWzt+sxvY0e2H41NVa0sYMlMrdrrr1Q3yRo8qGUIV69tMU6rHQ5t0TGscHQR
         6ucEoXCjq3q47k+hVa10eZhTugEk2DPlLZNVP22mWhgrWAIHwHtRD7VTJ85ugUZOJoUk
         0L2UR7M/IhOlLI6mjOhBYKuaHZtLN58AcDQTc3p9UyT3IGqqmzgdsapP80LmpuEgxS5a
         dV0QVhtS4Z3dly2+/XmH4qhXr6T3cqBY+eWtfMJthIKnrmqOeNpkxf9mQ0SCFwfa3u9G
         1RwcwIkF00+lnHW3BYcvf7YA2cSkXvfWgF/c966J27CuD1tXkvLO/e3b49ZsrBm0i6dH
         A39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753569118; x=1754173918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goQUyZCivbdecbzMlPOrKS5rZk5oqTbMCiPefv4GjFo=;
        b=Ygu/IujULgZkJhgnvOUE+ULB1LCwTVFHFSmhk3vquhxUx3KJ8A+SZaWXGJBu1RS9g/
         tt/gA0eLuIKV4UOtSvnsT6DgW6diZqOa+/fKhlu8ZiLmWbnKAR8bv/KGAsLPwMnXRQG9
         XvhQdO5ZYiiuxqiULazUo4gFuPUuCpFz7tZK8KWLLXG7PzIAGxexJJ7yEXzOYRFvH2P2
         OmwTE+6HeFzRy8CY2D6U1jET5F1b/45Q/pynR1cLjTEd4kkDmgr8R96BtxzHQHkeonzZ
         2SmvgPKbH+HjGYkz7p5Er2xIkzOa6W9C7vtbcShiW9GeAZ9QEmrsd1eNkURaiglRBHh8
         nSfg==
X-Forwarded-Encrypted: i=1; AJvYcCVib+g0hZqMc0rzUbxyFinwM+8Fj5ZC8SgGtOLjjuF0p62ictKSbgx/tbGEpmkYk6qtqOAUKP/88vVMTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiHQboABJg6dDB1Vb8gXS+AupJX8/UB5FLTy5o3tsEYOwJhpjK
	233VJpF4L+gDlsrhV/l1qb4gTbZ/T5FCmYc63tLI3o4EnorfOwqZMEnYrD+W2ZQJ7z+7
X-Gm-Gg: ASbGncslnvRPu0YSlcJmGxRG8Qlstv7OTpOnYHY/VlCqQSyQ5cghV82R9bx4A/zOboC
	6C71cLXZZ0oit42Ie1WBt6rvVFalij4NbrsouNw9faO7rnxa8h8g/NLNvjrOwlirwqye76/bO+6
	ZmmtyfgapMZCINH+jljdAXEddFw5admZIiciTkAgOb7Kw20WZaPB3dEu5C/7O4fOx5Fo5ZETS6B
	zVyV+2g4eaaW8xpu9oSUW2QBFpCUVYrfsAG9Yabndxkvys3AwF/mI3fc1FQLW5ZgRKnAsTsmr6p
	QL2pRnDTrEEBVZXgmAfgqx5jqEFebP/uVXG9Btb29XMTAZrg3Y8qcKKzPEYwqo0aKqmcy6MpHVD
	GOej84FltOF9eknOs8p5rFfGZ
X-Google-Smtp-Source: AGHT+IHV8UrL+m4gTW5oOstx5hy347NvkBbkiGVIXjzUOoId55IP6klYPnDv+SEeKUmZ3w4agAipyw==
X-Received: by 2002:a05:6a20:914c:b0:21f:53e4:1919 with SMTP id adf61e73a8af0-23d6df7ea1dmr10973722637.3.1753569117874;
        Sat, 26 Jul 2025 15:31:57 -0700 (PDT)
Received: from sultan-box ([142.147.89.207])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f6dd053sm2120290a12.68.2025.07.26.15.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 15:31:57 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:31:50 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
Message-ID: <aIVXVpg_9XxRXUAH@sultan-box>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aIEmJXNpNN0QF233@sultan-box>
 <12fb4d09-6b94-4f54-86b8-8a3ac0949151@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12fb4d09-6b94-4f54-86b8-8a3ac0949151@amd.com>

On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
> > I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
> > 
> > I cannot for the life of me get the webcam working under Linux. The webcam works
> > under Windows so it's not a hardware issue.
> > 
> > With this patchset and all of the patches you link here applied to 6.15, I get
> > the following errors:
> >    [   11.970038] amd_isp_i2c_designware amd_isp_i2c_designware: Unknown Synopsys component type: 0xffffffff
> >    [   11.973162] amd_isp_i2c_designware amd_isp_i2c_designware: error -19: i2c_dw_probe failed
> > 
> > With the old ispkernel code from February [1] applied on 6.15, the webcam
> > indicator LED lights up but there's no image. I see these messages at boot:
> >    [    9.449005] amd_isp_capture amd_isp_capture.1.auto: amdgpu: AMD ISP v4l2 device registered
> >    [    9.489005] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: The OV05 sensor device is added to the ISP I2C bus
> >    [    9.529012] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
> >    [    9.554046] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
> >    [    9.554174] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
> >    [    9.580022] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
> > 
> > And then the kernel crashes due to the same use-after-free issues I pointed out
> > in my other email [2].
> > 
> > Any idea what's going on?
> > 
> > [1] https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
> > [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
> Hi Sultan,
> 
> [1] is for kernel 6.8, believe it can't be applied to 6.15. We didn't verify
> on 6.15 but we are really glad to help, would you please provide some info,
> 1. Suppose you are using Ubuntu, right? What's the version?
> 2. 6.15, do you mean https://github.com/torvalds/linux/tree/v6.15 ?
> 
> After your confirmation, we'll see what we can do to enable your camera
> quickly and easily
>
> Regards,
> Bin

Thank you, Bin!

1. I'm using Arch Linux with the ISP4-patched libcamera [1].
2. Yes, here is my kernel source [2].

I have some more findings:

Currently, the first blocking issue is that the I2C adapter fails to initialize.
This is because the ISP tile isn't powered on.

I noticed that in the old version of amd_isp_i2c_designware [3], there were
calls to isp_power_set(), which is available in the old ISP4 sources [4].
Without isp_power_set(), the I2C adapter always fails to initialize for me.

How is the ISP tile supposed to get powered on in the current ISP4 code?

Also, I noticed that the driver init ordering matters between all of the drivers
needed for the ISP4 camera. In particular, amd_isp_i2c_designware and amd_isp4
must be initialized before amd_capture, otherwise amd_capture will fail to find
the fwnode properties for the OV05C10 device attached to the I2C bus.

But there is no driver init ordering enforced, which also caused some issues for
me until I figured it out. Maybe probe deferral (-EPROBE_DEFER) should be used
to ensure each driver waits for its dependencies to init first?

[1] https://github.com/amd/Linux_ISP_libcamera/tree/3.0
[2] https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.15-sultan-isp4
[3] https://lore.kernel.org/all/20250228164519.3453927-1-pratap.nirujogi@amd.com
[4] https://github.com/amd/Linux_ISP_Kernel/blob/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4/drivers/media/platform/amd/isp4/isp_hwa.c#L378-L385

Sultan

