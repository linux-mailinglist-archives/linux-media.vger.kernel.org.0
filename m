Return-Path: <linux-media+bounces-50102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2D8CFC609
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 08:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50C623055C1F
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 07:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1939B2C08D5;
	Wed,  7 Jan 2026 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="ZgED7nFE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8292C21C4
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 07:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767771242; cv=none; b=AwmJo21EF+WrH/mPItohs1swXF8We8ggu1jcGWiKfRObcImQzp769JoRYCi5NmudzDePBRc4iTJuyfMaKV/ibxmJn0RhLPpO728+i3JWlUa4UexFJeA/YH7ubemDPnhsomJIkREk5zvoXhG2rqZf6TMKIohR7KjdZoNS1t8xT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767771242; c=relaxed/simple;
	bh=6NT/6CD3rWZ3UOEb8jv7ELkiRbHIfeKD/vt949Anqvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lh+cvAaJuKTWAGRIPSmzAGpLs3MDaTUu/PeNl/c3fpRAW6MIGKDaSj/3exMlzEwZJ21jc3ls/assSQlr/JK5h2tE2bu8cpsgNDI0313QYP59h3BwjL0h+FOOqY+POgLfGRiIgxxXROvngSwZBZpeRbdnIP52lf90Zr+qz9VPDmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=ZgED7nFE; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-11f36012fb2so1505738c88.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 23:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1767771238; x=1768376038; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N8/5TQNM1PAmtVXVM2y6hrhr43V8SR1yObUFGGutgoU=;
        b=ZgED7nFEWinIb2Io5yRiuo6FgxxC7a9ic2N56gf7piU71WyAITK3xvrwNFJsy2rE4W
         6+E/n441vciPsfDteEHk3D5h3HHeNQC5KmvOGzFski29r1OxkAeVl3F+F7NMy1Y+LFC+
         IsRWAHCMuCPUDi0cD14NpYON+FFlt56MuaNV1Z2w9PqQ9BazrMjBNn7dybl66H7d+E2K
         BmGLKCQsxTrOzfLWNJqz+EBsFA2nJ5IwWo/WuWocViA65u9GgN1ADGh9pP6wgAyEuRPx
         JBYXMQmp1xEcUWkMHsx40Caswbaxde5Oqt77oQu/Qd1+bro5j3mHOTZeHUJylX7qVNGO
         PMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767771238; x=1768376038;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N8/5TQNM1PAmtVXVM2y6hrhr43V8SR1yObUFGGutgoU=;
        b=pWLU9t/EK+PiNSlQb5cDv8tu96QeYSqJ01UYhzyMHrNMuTKbCxPZRZy0yM9kxAHAbB
         2C35TCD9+Z0r3KJk7MjbEXjIxDrXd+LBSo+iocqpy6AW3uNAxhfhPdmw5Mw0YCOzgue0
         LO5LfMCnNcglJG1lBOyu7wiAlV6slg4pmezj7tv9phYgxQ8pVdFc0YJvJnBe52EsKM85
         frvuhL4p60+eBdwW9WwmaBChoCirAKxIBS6s2eYqv739ycVHWsUfLldrWwHY0YTyOWzL
         LCdSs3xpsj6sXpvRpIW6n39aVtEfNKiK1RdFbG3eIpNwr9MvKg/Ib1otUfvEW+7z7KUB
         eh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXus3n3IM1S50VaQkysjSYiK/1Sxs3IErNnH/Bx/4lLD3mjnYeARceDuK4TdLyPKb1JmXQz18vjbkN7oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkgVzep8G3tC8Olpx8EfelC+rvUsbkrSenyjaNhJdfdXEOd3v7
	9+Hn8O1gh6C43LXFgo5OLHN8qSxxbf8GywV3oP5sf+r640J+npwhTKSp5drYCauCXtwg
X-Gm-Gg: AY/fxX5AwrTRu2bvN4SLNnPQboVHwn0tSzPSBSNrTEHAHMECfemnvSttNdSopB9WcK9
	dx3rvsWC3ZdYZiKRQ83CqTIP5LDp37QvTFTlauuBwlpSEb7pm17lRZ/CrIphfuyO/edPiGLEGSZ
	h70vBcIR8jMIiIOz8nMc72FlnBp6w8zT0VasVQfxrhnP/9eP6vbh+0Xjuzeiau9GKeQci8AfB0f
	5+HY8WZOHaKti2/fSDVOh+CFzl+LMVT4GJ4+Hfg03NIdv9wPtWrgUc2x1iZeziVidUfhu9Evgjq
	nxmTQmEf1t0q8nazB2OdNTjqIHXb801TvSIbuyBW6IoDrRDo0+ZkwMKJkY00EPVcYg/7nXTgar4
	kFt/UqCp8Qk2zWAzSeRXC7EUuIbN5IPVCARkIfECVIVHK6+oVAZlil/C0i3lSie569zXFKFKwS6
	VBatrrmXe5cKJ+4A==
X-Google-Smtp-Source: AGHT+IFMDQ0PdDXLp898hl8Kse9aAeIStqTwEVJU4bRIxdkKZgMiKkCIK0DWze1RmTfXbmvQyKQ+xg==
X-Received: by 2002:a05:7022:220d:b0:11b:1c6d:98bd with SMTP id a92af1059eb24-121f8ac1577mr1465809c88.9.1767771238171;
        Tue, 06 Jan 2026 23:33:58 -0800 (PST)
Received: from sultan-box ([142.147.89.233])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243f6c7sm7091462c88.7.2026.01.06.23.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 23:33:57 -0800 (PST)
Date: Tue, 6 Jan 2026 23:33:53 -0800
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
Message-ID: <aV4MYcgdOviulN3E@sultan-box>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-5-Bin.Du@amd.com>
 <aUkZP8i90uWaFliY@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUkZP8i90uWaFliY@kekkonen.localdomain>

Hi Sakari,

On Mon, Dec 22, 2025 at 12:11:11PM +0200, Sakari Ailus wrote:
> Hi Bin,
> 
> On Tue, Dec 16, 2025 at 05:13:23PM +0800, Bin Du wrote:
> > Isp4 sub-device is implementing v4l2 sub-device interface. It has one
> > capture video node, and supports only preview stream. It manages firmware
> > states, stream configuration. Add interrupt handling and notification for
> > isp firmware to isp-subdevice.
> > 
> > Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> > Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> > Signed-off-by: Bin Du <Bin.Du@amd.com>
> > Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
> > ---
> >  MAINTAINERS                                   |   2 +
> >  drivers/media/platform/amd/isp4/Makefile      |   3 +-
> >  drivers/media/platform/amd/isp4/isp4.c        |  99 +-
> >  drivers/media/platform/amd/isp4/isp4.h        |   7 +-
> >  drivers/media/platform/amd/isp4/isp4_subdev.c | 975 ++++++++++++++++++
> >  drivers/media/platform/amd/isp4/isp4_subdev.h | 124 +++
> >  6 files changed, 1202 insertions(+), 8 deletions(-)
> >  create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
> >  create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cccae369c876..48ffc8bbdcee 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1149,6 +1149,8 @@ F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> >  F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
> >  F:	drivers/media/platform/amd/isp4/isp4_interface.c
> >  F:	drivers/media/platform/amd/isp4/isp4_interface.h
> > +F:	drivers/media/platform/amd/isp4/isp4_subdev.c
> > +F:	drivers/media/platform/amd/isp4/isp4_subdev.h
> >  
> >  AMD KFD
> >  M:	Felix Kuehling <Felix.Kuehling@amd.com>
> > diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> > index a2a5bf98e912..6d4e6d6ac7f5 100644
> > --- a/drivers/media/platform/amd/isp4/Makefile
> > +++ b/drivers/media/platform/amd/isp4/Makefile
> > @@ -4,4 +4,5 @@
> >  
> >  obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> >  amd_capture-objs := isp4.o \
> > -		    isp4_interface.o
> > +		    isp4_interface.o \
> > +		    isp4_subdev.o
> > diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> > index ad95e7f89189..bcd7cad32afd 100644
> > --- a/drivers/media/platform/amd/isp4/isp4.c
> > +++ b/drivers/media/platform/amd/isp4/isp4.c

[snip]

> >  static irqreturn_t isp4_irq_handler(int irq, void *arg)
> >  {
> > +	struct isp4_subdev *isp_subdev = arg;
> > +	u32 intr_ack = 0, intr_en = 0, intr_status;
> > +	int seen = 0;
> 
> Is int appropriate here? Should this be u32 or u64?

ffs() is just a macro alias for __builtin_ffs(). The parameter and return value
of __builtin_ffs() are both int.

> > +
> > +	/* Get the ISP_SYS interrupt status */
> > +	intr_status = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_STATUS);
> > +	intr_status &= ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
> > +
> > +	/* Find which ISP_SYS interrupts fired */
> > +	for (size_t i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
> > +		if (intr_status & isp4_irq[i].status_mask) {
> > +			intr_ack |= isp4_irq[i].ack_mask;
> > +			intr_en |= isp4_irq[i].en_mask;
> > +			seen |= BIT(i);
> > +		}
> > +	}
> > +
> > +	/*
> > +	 * Disable the ISP_SYS interrupts that fired. Must be done before waking
> > +	 * the response threads, since they re-enable interrupts when finished.
> > +	 * The lock synchronizes RMW of INT0_EN with isp4_enable_interrupt().
> > +	 */
> > +	spin_lock(&isp_subdev->irq_lock);
> > +	intr_en = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_EN) & ~intr_en;
> > +	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_EN, intr_en);
> > +	spin_unlock(&isp_subdev->irq_lock);
> > +
> > +	/*
> > +	 * Clear the ISP_SYS interrupts. This must be done after the interrupts
> > +	 * are disabled, so that ISP FW won't flag any new interrupts on these
> > +	 * streams, and thus we don't need to clear interrupts again before
> > +	 * re-enabling them in the response thread.
> > +	 */
> > +	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_ACK, intr_ack);
> > +
> > +	/* Wake up the response threads */
> > +	for (int i; (i = ffs(seen)); seen = (seen >> i) << i)
> 
> unsigned int, please.

As mentioned above, ffs() takes an int and returns an int.

> The parentheses around ffs() appear redundant.

The parentheses are there because it's an assignment. Without them:

drivers/media/platform/amd/isp4/isp4.c: In function ‘isp4_irq_handler’:
drivers/media/platform/amd/isp4/isp4.c:106:21: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
  106 |         for (int i; i = ffs(seen); seen = (seen >> i) << i)
      |                     ^

> The increment could probably be expressed as seen &= ~BIT(i).

Yes it can be, but it adds several more instructions before the loop body,
without any improvement to the loop body (the sarx in the loop body is replaced
by andn). The right shift trick is faster and this is a hot path (IRQ handler).

Before:
     d8:   jmp    10d

    // loop body
     da:   lea    -0x1(%rax),%eax
     dd:   xor    %ecx,%ecx
     df:   mov    $0x1,%edx
     e4:   mov    $0x1,%esi
     e9:   lea    (%rax,%rax,4),%rax
     ed:   sarx   %ebx,%ebp,%ebp
     f2:   shlx   %ebx,%ebp,%ebp
     f7:   movb   $0x1,0x9b0(%r13,%rax,8)
    100:   lea    0x998(%r13,%rax,8),%rdi
    108:   call   __wake_up
    10d:   mov    $0xffffffff,%eax
    112:   bsf    %ebp,%eax
    115:   add    $0x1,%eax
    118:   mov    %eax,%ebx
    11a:   jne    da

After (with seen &= ~BIT(i)):
     d8:   mov    $0xffffffff,%eax
     dd:   bsf    %ebp,%eax
     e0:   add    $0x1,%eax
     e3:   mov    %eax,%ebx
     e5:   je     12f
     e7:   mov    $0x1,%r12d

    // loop body
     ed:   lea    -0x1(%rbx),%eax
     f0:   xor    %ecx,%ecx
     f2:   mov    $0x1,%edx
     f7:   mov    $0x1,%esi
     fc:   lea    (%rax,%rax,4),%rax
    100:   movb   $0x1,0x9b0(%r13,%rax,8)
    109:   lea    0x998(%r13,%rax,8),%rdi
    111:   call   __wake_up
    116:   shlx   %rbx,%r12,%rax
    11b:   andn   %ebp,%eax,%ebp
    120:   mov    $0xffffffff,%eax
    125:   bsf    %ebp,%eax
    128:   add    $0x1,%eax
    12b:   mov    %eax,%ebx
    12d:   jne    ed

> > +		isp4_wake_up_resp_thread(isp_subdev, i - 1);
> > +
> >  	return IRQ_HANDLED;
> >  }
> >  

[snip]

> > +	container_of(v4l2_sdev, struct isp4_subdev, sdev)
> > +
> > +static const char *isp4sd_entity_name = "amd isp4";
> > +
> > +static const char *isp4sd_thread_name[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
> > +	"amd_isp4_thread_global",
> > +	"amd_isp4_thread_stream1",
> > +};
> > +
> > +static void isp4sd_module_enable(struct isp4_subdev *isp_subdev, bool enable)
> > +{
> > +	if (isp_subdev->enable_gpio) {
> > +		gpiod_set_value(isp_subdev->enable_gpio, enable ? 1 : 0);
> > +		dev_dbg(isp_subdev->dev, "%s isp_subdev module\n",
> > +			enable ? "enable" : "disable");
> > +	}
> > +}
> > +
> > +static int isp4sd_setup_fw_mem_pool(struct isp4_subdev *isp_subdev)
> > +{
> > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > +	struct isp4fw_cmd_send_buffer buf_type;
> > +	struct device *dev = isp_subdev->dev;
> > +	int ret;
> > +
> > +	if (!ispif->fw_mem_pool) {
> > +		dev_err(dev, "fail to alloc mem pool\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	/*
> > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > +	 * zeroed, since this is not guaranteed on all compilers.
> > +	 */
> > +	memset(&buf_type, 0, sizeof(buf_type));
> > +	buf_type.buffer_type = BUFFER_TYPE_MEM_POOL;
> > +	buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> > +	isp4if_split_addr64(ispif->fw_mem_pool->gpu_mc_addr,
> > +			    &buf_type.buffer.buf_base_a_lo,
> > +			    &buf_type.buffer.buf_base_a_hi);
> > +	buf_type.buffer.buf_size_a = ispif->fw_mem_pool->mem_size;
> > +
> > +	ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
> > +				  &buf_type, sizeof(buf_type));
> > +	if (ret) {
> > +		dev_err(dev, "send fw mem pool 0x%llx(%u) fail %d\n",
> > +			ispif->fw_mem_pool->gpu_mc_addr, buf_type.buffer.buf_size_a, ret);
> > +		return ret;
> > +	}
> > +
> > +	dev_dbg(dev, "send fw mem pool 0x%llx(%u) suc\n",
> > +		ispif->fw_mem_pool->gpu_mc_addr, buf_type.buffer.buf_size_a);
> > +
> > +	return 0;
> > +}
> > +
> > +static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
> > +{
> > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > +	struct isp4fw_cmd_set_stream_cfg cmd;
> > +	struct device *dev = isp_subdev->dev;
> > +
> > +	/*
> > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > +	 * zeroed, since this is not guaranteed on all compilers.
> > +	 */
> > +	memset(&cmd, 0, sizeof(cmd));
> 
> You could assign assign all these in the declaration and avoid zeroing the
> memory explicitly at the same time. I presume possibly leaking some
> information from memory to the firmware in case there are holes in the
> struct isn't an issue.

Leaking kernel memory is bad. Also, there is no guarantee that the firmware will
behave as expected with varying values for the padding bytes.

Please see my arguments from v4 on why these structs should be memset [1].

> > +	cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id = SENSOR_ID_ON_MIPI0;
> > +	cmd.stream_cfg.mipi_pipe_path_cfg.b_enable = true;
> > +	cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id = MIPI0_ISP_PIPELINE_ID;
> > +
> > +	cmd.stream_cfg.b_enable_tnr = true;
> > +	dev_dbg(dev, "isp4fw_sensor_id %d, pipeId 0x%x EnableTnr %u\n",
> > +		cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id,
> > +		cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id,
> > +		cmd.stream_cfg.b_enable_tnr);
> > +
> > +	return isp4if_send_command(ispif, CMD_ID_SET_STREAM_CONFIG,
> > +				   &cmd, sizeof(cmd));
> > +}
> > +
> > +static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
> > +{
> > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > +	struct isp4fw_cmd_send_buffer buf_type;
> > +	struct device *dev = isp_subdev->dev;
> > +	int i;
> 
> unsigned int, please. You can also declare this within the loop as you do
> elsewhere. Consistency is nice.

Why does this need to be unsigned?

> > +
> > +	/*
> > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > +	 * zeroed, since this is not guaranteed on all compilers.
> > +	 */
> > +	memset(&buf_type, 0, sizeof(buf_type));
> > +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
> > +		struct isp4if_gpu_mem_info *meta_info_buf =
> > +				isp_subdev->ispif.meta_info_buf[i];
> > +		int ret;
> > +
> > +		if (!meta_info_buf) {
> > +			dev_err(dev, "fail for no meta info buf(%u)\n", i);
> > +			return -ENOMEM;
> > +		}
> > +
> > +		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
> > +		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> > +		isp4if_split_addr64(meta_info_buf->gpu_mc_addr,
> > +				    &buf_type.buffer.buf_base_a_lo,
> > +				    &buf_type.buffer.buf_base_a_hi);
> > +		buf_type.buffer.buf_size_a = meta_info_buf->mem_size;
> > +		ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
> > +					  &buf_type, sizeof(buf_type));
> > +		if (ret) {
> > +			dev_err(dev, "send meta info(%u) fail\n", i);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	dev_dbg(dev, "send meta info suc\n");
> > +	return 0;
> > +}
> > +
> > +static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
> > +				    struct isp4fw_image_prop *out_prop,
> > +				    struct v4l2_subdev_state *state, u32 pad)
> > +{
> > +	struct device *dev = isp_subdev->dev;
> > +	struct v4l2_mbus_framefmt *format;
> > +
> > +	format = v4l2_subdev_state_get_format(state, pad, 0);
> > +	if (!format) {
> > +		dev_err(dev, "fail get subdev state format\n");
> > +		return false;
> > +	}
> > +
> > +	switch (format->code) {
> > +	case MEDIA_BUS_FMT_YUYV8_1_5X8:
> > +		out_prop->image_format = IMAGE_FORMAT_NV12;
> > +		out_prop->width = format->width;
> > +		out_prop->height = format->height;
> > +		out_prop->luma_pitch = format->width;
> > +		out_prop->chroma_pitch = out_prop->width;
> > +		break;
> > +	case MEDIA_BUS_FMT_YUYV8_1X16:
> > +		out_prop->image_format = IMAGE_FORMAT_YUV422INTERLEAVED;
> > +		out_prop->width = format->width;
> > +		out_prop->height = format->height;
> > +		out_prop->luma_pitch = format->width * 2;
> > +		out_prop->chroma_pitch = 0;
> > +		break;
> > +	default:
> > +		dev_err(dev, "fail for bad image format:0x%x\n",
> > +			format->code);
> > +		return false;
> > +	}
> > +
> > +	if (!out_prop->width || !out_prop->height)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 w, u32 h)
> > +{
> > +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > +	struct device *dev = isp_subdev->dev;
> > +
> > +	if (sensor_info->status == ISP4SD_START_STATUS_STARTED)
> > +		return 0;
> > +
> > +	if (sensor_info->status == ISP4SD_START_STATUS_START_FAIL) {
> > +		dev_err(dev, "fail for previous start fail\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dev_dbg(dev, "w:%u,h:%u\n", w, h);
> > +
> > +	if (isp4sd_send_meta_buf(isp_subdev)) {
> > +		dev_err(dev, "fail to send meta buf\n");
> > +		sensor_info->status = ISP4SD_START_STATUS_START_FAIL;
> > +		return -EINVAL;
> > +	}
> > +
> > +	sensor_info->status = ISP4SD_START_STATUS_OFF;
> > +
> > +	if (!sensor_info->start_stream_cmd_sent &&
> > +	    sensor_info->buf_sent_cnt >= ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
> > +		int ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
> > +					      NULL, 0);
> > +		if (ret) {
> > +			dev_err(dev, "fail to start stream\n");
> > +			return ret;
> > +		}
> > +
> > +		sensor_info->start_stream_cmd_sent = true;
> > +	} else {
> > +		dev_dbg(dev,
> > +			"no send START_STREAM, start_sent %u, buf_sent %u\n",
> > +			sensor_info->start_stream_cmd_sent,
> > +			sensor_info->buf_sent_cnt);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
> > +			       struct v4l2_subdev_state *state, u32 pad)
> > +{
> > +	struct isp4sd_output_info *output_info = &isp_subdev->sensor_info.output_info;
> > +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > +	struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop;
> > +	struct isp4fw_cmd_enable_out_ch cmd_ch_en;
> > +	struct device *dev = isp_subdev->dev;
> > +	int ret;
> > +
> > +	if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
> > +		return 0;
> > +
> > +	if (output_info->start_status == ISP4SD_START_STATUS_START_FAIL) {
> > +		dev_err(dev, "fail for previous start fail\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > +	 * zeroed, since this is not guaranteed on all compilers.
> > +	 */
> > +	memset(&cmd_ch_prop, 0, sizeof(cmd_ch_prop));
> > +	cmd_ch_prop.ch = ISP_PIPE_OUT_CH_PREVIEW;
> > +
> > +	if (!isp4sd_get_str_out_prop(isp_subdev, &cmd_ch_prop.image_prop, state, pad)) {
> > +		dev_err(dev, "fail to get out prop\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dev_dbg(dev, "channel:%d,fmt %d,w:h=%u:%u,lp:%u,cp%u\n",
> > +		cmd_ch_prop.ch,
> > +		cmd_ch_prop.image_prop.image_format,
> > +		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
> > +		cmd_ch_prop.image_prop.luma_pitch,
> > +		cmd_ch_prop.image_prop.chroma_pitch);
> > +
> > +	ret = isp4if_send_command(ispif, CMD_ID_SET_OUT_CHAN_PROP,
> > +				  &cmd_ch_prop, sizeof(cmd_ch_prop));
> > +	if (ret) {
> > +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
> > +		dev_err(dev, "fail to set out prop\n");
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > +	 * zeroed, since this is not guaranteed on all compilers.
> 
> You should have explicit padding fields in any case and not rely on ABI in
> this case.

It is error-prone for a human to make sure that all padding bytes have explicit
struct members. And what about future changes to the firmware API where explicit
padding might be forgotten?

Unless the firmware API structs are all __packed in a future firmware update, I
think the memsets should remain.

> > +	 */
> > +	memset(&cmd_ch_en, 0, sizeof(cmd_ch_en));
> > +	cmd_ch_en.ch = ISP_PIPE_OUT_CH_PREVIEW;
> > +	cmd_ch_en.is_enable = true;
> > +	ret = isp4if_send_command(ispif, CMD_ID_ENABLE_OUT_CHAN,
> > +				  &cmd_ch_en, sizeof(cmd_ch_en));
> > +	if (ret) {
> > +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
> > +		dev_err(dev, "fail to enable channel\n");
> > +		return ret;
> > +	}
> > +
> > +	dev_dbg(dev, "enable channel %d\n", cmd_ch_en.ch);
> > +
> > +	if (!sensor_info->start_stream_cmd_sent) {
> > +		ret = isp4sd_kickoff_stream(isp_subdev,
> > +					    cmd_ch_prop.image_prop.width,
> > +					    cmd_ch_prop.image_prop.height);
> > +		if (ret) {
> > +			dev_err(dev, "kickoff stream fail %d\n", ret);
> > +			return ret;
> > +		}
> > +		/*
> > +		 * sensor_info->start_stream_cmd_sent will be set to true
> > +		 * 1. in isp4sd_kickoff_stream, if app first send buffer then
> > +		 * start stream
> > +		 * 2. in isp_set_stream_buf, if app first start stream, then
> > +		 * send buffer
> > +		 * because ISP FW has the requirement, host needs to send buffer
> > +		 * before send start stream cmd
> > +		 */
> > +		if (sensor_info->start_stream_cmd_sent) {
> > +			sensor_info->status = ISP4SD_START_STATUS_STARTED;
> > +			output_info->start_status = ISP4SD_START_STATUS_STARTED;
> > +			dev_dbg(dev, "kickoff stream suc,start cmd sent\n");
> > +		}
> > +	} else {
> > +		dev_dbg(dev, "stream running, no need kickoff\n");
> > +		output_info->start_status = ISP4SD_START_STATUS_STARTED;
> > +	}
> > +
> > +	dev_dbg(dev, "setup output suc\n");
> > +	return 0;
> > +}
> > +
> > +static int isp4sd_init_stream(struct isp4_subdev *isp_subdev)
> > +{
> > +	struct device *dev = isp_subdev->dev;
> > +	int ret;
> > +
> > +	ret = isp4sd_setup_fw_mem_pool(isp_subdev);
> > +	if (ret) {
> > +		dev_err(dev, "fail to setup fw mem pool\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = isp4sd_set_stream_path(isp_subdev);
> > +	if (ret) {
> > +		dev_err(dev, "fail to setup stream path\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void isp4sd_uninit_stream(struct isp4_subdev *isp_subdev,
> > +				 struct v4l2_subdev_state *state, u32 pad)
> > +{
> > +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > +	struct isp4sd_output_info *output_info = &sensor_info->output_info;
> > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > +	struct v4l2_mbus_framefmt *format;
> > +
> > +	format = v4l2_subdev_state_get_format(state, pad, 0);
> > +	if (!format) {
> > +		dev_err(isp_subdev->dev, "fail to get v4l2 format\n");
> > +	} else {
> > +		memset(format, 0, sizeof(*format));
> > +		format->code = MEDIA_BUS_FMT_YUYV8_1_5X8;
> > +	}
> > +
> > +	isp4if_clear_bufq(ispif);
> > +	isp4if_clear_cmdq(ispif);
> > +
> > +	sensor_info->start_stream_cmd_sent = false;
> > +	sensor_info->buf_sent_cnt = 0;
> > +
> > +	sensor_info->status = ISP4SD_START_STATUS_OFF;
> > +	output_info->start_status = ISP4SD_START_STATUS_OFF;
> > +}
> > +
> > +static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
> > +				    enum isp4if_stream_id stream_id,
> > +				    struct isp4fw_resp_cmd_done *para)
> > +{
> > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > +	struct isp4if_cmd_element *ele =
> > +		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
> > +	struct device *dev = isp_subdev->dev;
> > +
> > +	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
> > +		stream_id,
> > +		para->cmd_id, para->cmd_status, para->cmd_seq_num,
> > +		ele);
> > +
> > +	if (ele) {
> > +		complete(&ele->cmd_done);
> > +		if (atomic_dec_and_test(&ele->refcnt))
> > +			kfree(ele);
> > +	}
> > +}
> > +
> > +static struct isp4fw_meta_info *isp4sd_get_meta_by_mc(struct isp4_subdev *isp_subdev,
> > +						      u64 mc)
> > +{
> > +	for (int i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
> 
> unsigned int, please. Similarly for the rest.

Why an unsigned int?

> > +		struct isp4if_gpu_mem_info *meta_info_buf =
> > +				isp_subdev->ispif.meta_info_buf[i];
> > +
> > +		if (meta_info_buf->gpu_mc_addr == mc)
> > +			return meta_info_buf->sys_addr;
> > +	}
> > +
> > +	return NULL;
> > +}

[1] https://lore.kernel.org/all/aNTtLHDHf_ozenC-@sultan-box/

Sultan

