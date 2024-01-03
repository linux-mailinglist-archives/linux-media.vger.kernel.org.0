Return-Path: <linux-media+bounces-3184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E60822A38
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 10:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAC37B214FB
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 09:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1CC182BE;
	Wed,  3 Jan 2024 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOVE7d3Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F2C18622
	for <linux-media@vger.kernel.org>; Wed,  3 Jan 2024 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a27e323fdd3so231542466b.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jan 2024 01:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704273743; x=1704878543; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ErGoDiNeASWB2X75x71K7FzD8z23G7J9Hdv99h+luzU=;
        b=HOVE7d3Yfyyxp/eBRPaeKWEabkcFdq4YDsS+BkUxmhweuNhHWCMBk1H8NX9jpNxw4p
         EXZ1aqCL/7/EUj66mhMFNtcS8RjRHKYCEbHQr63k/9hQ7qLrgJ9z7y8BgzrDUfAWa62q
         ieG4gW2DEY/p511ieEsZ/aeylmDRr2UCCiRIM1KTa3a6i7ghMxlUu37j+QYWf5EUm4Ob
         54JlUICW1koJYUyTPWMEhf3DK37qDZxPxfeLjgxJR0MrVkMCyz7gqn80rL2mLYxlfyrd
         6awooR6BlJm6t7+BNSDe93rtdFxVj6vKUsFHPaYXaAnoCTACPG+MDAsjJUxW56Rr5Twv
         9Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704273743; x=1704878543;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ErGoDiNeASWB2X75x71K7FzD8z23G7J9Hdv99h+luzU=;
        b=mHuUdWuzURrcNmMb0WUP4iFWw8wEVRNRcRgPbwUu2S+Kf+97RJ/TaG85ji5RHmCTD/
         xbmf4O94ej2YofidyQx/l4HvZTYljXL2ERRZzNMVPlgpCmPH/lqWpNtPHRlaITFLW3PK
         06p84mWXQ+5CxcbECdLhGbXkElX7NvxhR1Aap9Svl7ZCgIPHlf4nq0zOr1dxsvblCegX
         D3JVlZg4W5pl90j67j9LWv/A/iEDLnMsQ7eb1t+JxZE1LQTYyVdYBBYGo1aUFr2O8IMo
         3LNzdpPxmKCnko+cCo5bjonx7ST2uEhVB8b3MT+DvkKoojvA9qCA5Va49e6qG0MEMjKW
         xWfQ==
X-Gm-Message-State: AOJu0Yz7DciwmLFqbeVsZsKQn4hGKPYHDTg5LJ3LlwcqxHpm+D4Gru2n
	WraTjtPShjZqDZVgIoFNTbE=
X-Google-Smtp-Source: AGHT+IGEma/1QMXyFlbTWJh9PwOyCESw5O5WXfPO60FWl9RHbvtQuI5CutnzcNP2Xz0mbvGUxq6aMA==
X-Received: by 2002:a17:906:3e54:b0:a23:6259:12d2 with SMTP id t20-20020a1709063e5400b00a23625912d2mr7382949eji.69.1704273742855;
        Wed, 03 Jan 2024 01:22:22 -0800 (PST)
Received: from [192.168.50.250] (c-x59968899.customers.hiper-net.dk. [89.150.136.153])
        by smtp.gmail.com with ESMTPSA id ex1-20020a170907954100b00a26f22dca5asm8587800ejc.0.2024.01.03.01.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 01:22:22 -0800 (PST)
Message-ID: <25b34fe6327dbb59ee485a8b5d411b73ffd29392.camel@gmail.com>
Subject: Re: [PATCH v2 03/15] media: intel/ipu6: add IPU6 buttress interface
 driver
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org,  senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com,  bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Wed, 03 Jan 2024 10:22:20 +0100
In-Reply-To: <20231024112924.3934228-4-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
	 <20231024112924.3934228-4-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bingbu,

On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> The IPU6 buttress is the interface between IPU device (input system
> and processing system) with rest of the SoC. It contains overall IPU
> hardware control registers, these control registers are used as the
> interfaces with the Intel Converged Security Engine and Punit to do
> firmware authentication and power management.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---

...

> +static irqreturn_t ipu6_buttress_call_isr(struct ipu6_bus_device *adev)
> +{
> +	irqreturn_t ret =3D IRQ_WAKE_THREAD;
> +
> +	if (!adev || !adev->auxdrv || !adev->auxdrv_data)
> +		return IRQ_NONE;
> +
> +	if (adev->auxdrv_data->isr)
> +		ret =3D adev->auxdrv_data->isr(adev);
> +
> +	if (ret =3D=3D IRQ_WAKE_THREAD && !adev->auxdrv_data->isr_threaded)
> +		ret =3D IRQ_NONE;
> +
> +	return ret;
> +}
> +
> +irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
> +{
> +	struct ipu6_device *isp =3D isp_ptr;
> +	struct ipu6_bus_device *adev[] =3D { isp->isys, isp->psys };
> +	struct ipu6_buttress *b =3D &isp->buttress;
> +	u32 reg_irq_sts =3D BUTTRESS_REG_ISR_STATUS;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	u32 disable_irqs =3D 0;
> +	u32 irq_status;
> +	u32 i, count =3D 0;
> +
> +	pm_runtime_get_noresume(&isp->pdev->dev);
> +
> +	irq_status =3D readl(isp->base + reg_irq_sts);
> +	if (!irq_status) {
> +		pm_runtime_put_noidle(&isp->pdev->dev);
> +		return IRQ_NONE;
> +	}
> +
> +	do {
> +		writel(irq_status, isp->base + BUTTRESS_REG_ISR_CLEAR);
> +
> +		for (i =3D 0; i < ARRAY_SIZE(ipu6_adev_irq_mask); i++) {
> +			irqreturn_t r =3D ipu6_buttress_call_isr(adev[i]);
> +
> +			if (!(irq_status & ipu6_adev_irq_mask[i]))
> +				continue;
> +
> +			if (r =3D=3D IRQ_WAKE_THREAD) {
> +				ret =3D IRQ_WAKE_THREAD;
> +				disable_irqs |=3D ipu6_adev_irq_mask[i];
> +			} else if (ret =3D=3D IRQ_NONE && r =3D=3D IRQ_HANDLED) {
> +				ret =3D IRQ_HANDLED;
> +			}
> +		}

It seems wrong to call the ISR for a adev[i] before checking the
corresponding IRQ mask. If the mask is not set, the ISR is still
called, but the result is thrown away.

I started investigating this because I'm seeing "general protection
fault, probably for non-canonical address 0x6b6b6b6b6b6b6b6b" in this
function when unbinding the IPU4 driver.

How do you ensure that the ISR is not called on a ipu6-bus device that
has been deleted? Specifically in ipu6_pci_remove, ipu6_bus_del_devices
is called before ipu6_buttress_exit (which disables buttress IRQs).
Perhaps the above for loop should really be a "for each ipu6-bus
device" loop?

> +
> +		if ((irq_status & BUTTRESS_EVENT) && ret =3D=3D IRQ_NONE)
> +			ret =3D IRQ_HANDLED;
> +
> +		if (irq_status & BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING) {
> +			dev_dbg(&isp->pdev->dev,
> +				"BUTTRESS_ISR_IPC_FROM_CSE_IS_WAITING\n");
> +			ipu6_buttress_ipc_recv(isp, &b->cse, &b->cse.recv_data);
> +			complete(&b->cse.recv_complete);
> +		}
> +
> +		if (irq_status & BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING) {
> +			dev_dbg(&isp->pdev->dev,
> +				"BUTTRESS_ISR_IPC_FROM_ISH_IS_WAITING\n");
> +			ipu6_buttress_ipc_recv(isp, &b->ish, &b->ish.recv_data);
> +			complete(&b->ish.recv_complete);
> +		}
> +
> +		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE) {
> +			dev_dbg(&isp->pdev->dev,
> +				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
> +			complete(&b->cse.send_complete);
> +		}
> +
> +		if (irq_status & BUTTRESS_ISR_IPC_EXEC_DONE_BY_ISH) {
> +			dev_dbg(&isp->pdev->dev,
> +				"BUTTRESS_ISR_IPC_EXEC_DONE_BY_CSE\n");
> +			complete(&b->ish.send_complete);
> +		}
> +
> +		if (irq_status & BUTTRESS_ISR_SAI_VIOLATION &&
> +		    ipu6_buttress_get_secure_mode(isp))
> +			dev_err(&isp->pdev->dev,
> +				"BUTTRESS_ISR_SAI_VIOLATION\n");
> +
> +		if (irq_status & (BUTTRESS_ISR_IS_FATAL_MEM_ERR |
> +				  BUTTRESS_ISR_PS_FATAL_MEM_ERR))
> +			dev_err(&isp->pdev->dev,
> +				"BUTTRESS_ISR_FATAL_MEM_ERR\n");
> +
> +		if (irq_status & BUTTRESS_ISR_UFI_ERROR)
> +			dev_err(&isp->pdev->dev, "BUTTRESS_ISR_UFI_ERROR\n");
> +
> +		if (++count =3D=3D BUTTRESS_MAX_CONSECUTIVE_IRQS) {
> +			dev_err(&isp->pdev->dev, "too many consecutive IRQs\n");
> +			ret =3D IRQ_NONE;
> +			break;
> +		}
> +
> +		irq_status =3D readl(isp->base + reg_irq_sts);
> +	} while (irq_status);
> +
> +	if (disable_irqs)
> +		writel(BUTTRESS_IRQS & ~disable_irqs,
> +		       isp->base + BUTTRESS_REG_ISR_ENABLE);
> +
> +	pm_runtime_put(&isp->pdev->dev);
> +
> +	return ret;
> +}

...

/Andreas

