Return-Path: <linux-media+bounces-8988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A389EFB7
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 12:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36C2D2852D6
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 10:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364B815921E;
	Wed, 10 Apr 2024 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K9EopO3/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04879158204
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712744309; cv=none; b=RD/VEYrSaKVhnL+Ydn9OrcBWRYghod+VwDzC9399HODed4WhMeL8TTyPxuiN17mYG5/obpWR/QQ/YV1oItMXBJieBBhSgKkPyCjbS5+PpEXKeWBHlUa4PdQ2XpWVQqXxcoWweoer6mtt3p++bhbPo6f/3KuTLhseZlRPnfGpSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712744309; c=relaxed/simple;
	bh=rnIXbOwnqOQM5j1jbv3CHZoW9NXHrM7BZa2pt9AYbCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUR3QjhSNEMgDTfPim0CWSHkiOGY0kxyUcNUUTnoOV0BquZ6xFzv3NnfhrVWxMQXwduh9GHay2RF0Bgyrg9WgvYZOd/Kd0UeBKTbVy2g40sj1J7oJhRXHfHkPqmX9IAO4OxaMqfGeMefQd01fnwiPLrlYKsp46thZHuvqnkQgl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K9EopO3/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712744306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yK1ndb0HEzjHhWCscmXGR+/VhC+xm8vRidFQegZ1QFI=;
	b=K9EopO3/Uwu32ky75MfChY+jqWEVNIGxkYxwdLPai7QJMvu6JZ4ZdKARj3GN+JZYmvJuMu
	uZDlsfP4iGIqyd6pb3nNKNbPrdsB2U03oeyDa9vifq5RC8p1fadziyDhALYpAOmKMyEY6Q
	w0rK67HaSyIgoXi0dCWpn14FqEVWcco=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-LVg7kUPxNuecTjKuie-WQw-1; Wed, 10 Apr 2024 06:18:23 -0400
X-MC-Unique: LVg7kUPxNuecTjKuie-WQw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-56e7187af0fso1174290a12.0
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 03:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712744302; x=1713349102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yK1ndb0HEzjHhWCscmXGR+/VhC+xm8vRidFQegZ1QFI=;
        b=RDn/0It/qMw26v/IAZtjsdScNDzWUdhdAIGXTq0Comz3CXiSr/fZSZ+bB49hf1p9ti
         qy6ijnF4rxbU1e1Bjj0ji7wAyUBDjXlRrBM/QF244YY2zrhCjRfqa+CfEe+rYGmt5dk8
         wFiqDZ8O3BEU134Zfi5Fpd0oyKk4gfOc7sAOytN7bVS59bCaBlmZn5fDwS6LLE90UaWu
         t5H+HNlkxAt+JL004bRojQj66+lga148whfkKHrDeMxUgpGH8j4aQ3wjAINWrpDhzu0F
         8TJIiMnO7gY7ybTvH23BhGb3F2DQch+3ciQhDO2Kb/M/VOcgD82nP2AaCvkSR/a+G7pK
         Rf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXei1w8j1QaEw+zzxC21Jv2mwagDTNLLKMUpdKs8e02y27Gma+0cKq4iWIiltSf1BHtjsDEFUi9k85iZZ9TnHMplSEfxFU8CpMsaQo=
X-Gm-Message-State: AOJu0YzNfIVnC8VNByEzrI/yrYUhAm+CQd+W6YxN6EDX13TkqR8UVqoR
	vG3k2So4KrPxpoj9vNa8AMEuba8Ha3bgG4pTLtVFy4+kKwTid5dtPx1DLY+C7dgEKnDSHerFyUj
	1WFiqhjgE/EWddfe584Tj7/dg0Ujr3+azErBv7AQzINvzLza2puVrD3YTWi3j
X-Received: by 2002:a50:bb03:0:b0:56e:2e62:cbec with SMTP id y3-20020a50bb03000000b0056e2e62cbecmr1386173ede.12.1712744302248;
        Wed, 10 Apr 2024 03:18:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE13rcGio4p/46wokBP534XSQ9edk7PhKUzOKNFUJuCKCy7I0U2bBMLFIeoRzMKERPPlkBH1w==
X-Received: by 2002:a50:bb03:0:b0:56e:2e62:cbec with SMTP id y3-20020a50bb03000000b0056e2e62cbecmr1386155ede.12.1712744301837;
        Wed, 10 Apr 2024 03:18:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b11-20020a0564021f0b00b0056e743c2d3fsm1723434edb.46.2024.04.10.03.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 03:18:21 -0700 (PDT)
Message-ID: <bed0c56a-666d-4992-bb23-32b5883d51ae@redhat.com>
Date: Wed, 10 Apr 2024 12:18:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] staging: media: atomisp: Fix various multiline block
 comment formatting instances
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240227163043.112162-1-bergh.jonathan@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240227163043.112162-1-bergh.jonathan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jonathan,

On 2/27/24 5:30 PM, Jonathan Bergh wrote:
> This patch makes the following fixes:
>  * Reformats a number of multiline block comments to ensure * and */ align
>    correctly
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>

Thank you for your patch.

I have merged patches 1-2 of this series, as well as your previous
2 separate patches and your previous 6 patch patch-series into
my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And these patches will be included in my next
pull-request to Mauro (to media subsystem maintainer)

I did not merge patch 3/3 of this series since the msleep which is
being modified there has been removed in the latest version of the code.

Regards,

Hans




> ---
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  | 34 ++++++++++---------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 547e1444ad97..77809e88da83 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -78,13 +78,15 @@ static char firmware_name[256];
>  module_param_string(firmware_name, firmware_name, sizeof(firmware_name), 0);
>  MODULE_PARM_DESC(firmware_name, "Firmware file name. Allows overriding the default firmware name.");
>  
> -/*set to 16x16 since this is the amount of lines and pixels the sensor
> -exports extra. If these are kept at the 10x8 that they were on, in yuv
> -downscaling modes incorrect resolutions where requested to the sensor
> -driver with strange outcomes as a result. The proper way tot do this
> -would be to have a list of tables the specify the sensor res, mipi rec,
> -output res, and isp output res. however since we do not have this yet,
> -the chosen solution is the next best thing. */
> +/*
> + * Set to 16x16 since this is the amount of lines and pixels the sensor
> + * exports extra. If these are kept at the 10x8 that they were on, in yuv
> + * downscaling modes incorrect resolutions where requested to the sensor
> + * driver with strange outcomes as a result. The proper way tot do this
> + * would be to have a list of tables the specify the sensor res, mipi rec,
> + * output res, and isp output res. however since we do not have this yet,
> + * the chosen solution is the next best thing.
> + */
>  int pad_w = 16;
>  module_param(pad_w, int, 0644);
>  MODULE_PARM_DESC(pad_w, "extra data for ISP processing");
> @@ -507,12 +509,12 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
>  	}
>  done:
>  	/*
> -	* MRFLD WORKAROUND:
> -	* before powering off IUNIT, clear the pending interrupts
> -	* and disable the interrupt. driver should avoid writing 0
> -	* to IIR. It could block subsequent interrupt messages.
> -	* HW sighting:4568410.
> -	*/
> +	 * MRFLD WORKAROUND:
> +	 * before powering off IUNIT, clear the pending interrupts
> +	 * and disable the interrupt. driver should avoid writing 0
> +	 * to IIR. It could block subsequent interrupt messages.
> +	 * HW sighting:4568410.
> +	 */
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
>  	irq &= ~BIT(INTR_IER);
>  	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
> @@ -525,9 +527,9 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
>  }
>  
>  /*
> -* WA for DDR DVFS enable/disable
> -* By default, ISP will force DDR DVFS 1600MHz before disable DVFS
> -*/
> + * WA for DDR DVFS enable/disable
> + * By default, ISP will force DDR DVFS 1600MHz before disable DVFS
> + */
>  static void punit_ddr_dvfs_enable(bool enable)
>  {
>  	int reg;


