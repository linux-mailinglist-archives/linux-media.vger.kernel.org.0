Return-Path: <linux-media+bounces-20805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 880389BB63A
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 14:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DF361F231E1
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BC81BFE01;
	Mon,  4 Nov 2024 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MDZMqsMY"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FAD1BD017
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730727159; cv=none; b=GIKv6fDPtgF/0BJiwAPly0YlxbS1JZRQmyRnKvFwivAv/KsNlzz1ZVdfLhJxs5cFTqGAdu40yVGihlvGt1RQBRkyHeCx4IB9OgI8q4VJ7M21b5so5JS2Shq22VVO6SpjjOeILvtjDafeRA0kcgqkLx591yQ92HooT2TPZ+vBGsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730727159; c=relaxed/simple;
	bh=MySqwZ8N+ERSp37xH/lFZNAcLiB76PxySngIL+ViHF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qltP3SiTWKfmE2Ft87fujHEFAYA6jrJ5UbD8cso6P0aNIlBd2LH/M66u3HcTddJTrCvAnxwmZHTv3HN2GGZt5EnzvRE72tshfCNeQH6Eos2vouPxwToPn8f6GDx7UinmRL2Zqzi1BJn58VfN8bq6k6PCvQTm40fOLWIKjJHIIGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MDZMqsMY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730727155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmKw27p8DiPnTLIKGS53exyhQKQhknZ7zNEiDjxMm+U=;
	b=MDZMqsMYKG6bHo3UJExNfaYTBUtXvdsV4XHiBr4KqOy6zi35fA9OFd060elAp4rJgGeVLp
	dmisLyNPQkKqWV9dMLVBFxzjielEZLb0lCXJzRilg7Jk//o0W+GzeM4gks1rrHBfmdGFC/
	qDbnJSZtIgBsuyVUWWO0Klx1IbpGsyE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-Jc4UnHpmMzGFijHG6KHiHw-1; Mon, 04 Nov 2024 08:32:34 -0500
X-MC-Unique: Jc4UnHpmMzGFijHG6KHiHw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9a004bfc1cso285563866b.1
        for <linux-media@vger.kernel.org>; Mon, 04 Nov 2024 05:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727153; x=1731331953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmKw27p8DiPnTLIKGS53exyhQKQhknZ7zNEiDjxMm+U=;
        b=SNfcWAoWICBkL/4CBWzjK0NeUgpkInBUzmMBOreztOs2CNyIv1hoSfjWANLKkpqBxi
         iP3yyJlrqc47awhXXIT0liPDoeD4RACPQ8GwlEvbN8JhEwbNxxDEjWRAulkBkclbJIGz
         lvSvkhCogPKYqT67nmFl0mAAAEVE0zMhgyRdd3r5ZmB72qJZ5woWLuOqKdPSKQzz/1u+
         lTuOEJ/yeJ8HW9fnP05alJi/Fs3JftDRXGQqSMoDBWStjqf+rThICQmcLtzVy2HcIpc0
         vNtEungsGVdq9mUOojcgbD2NIpPdpIer7mmtnaYeb1Xlp7PcUvA1fTvwDGs/ozWPJAPQ
         Ltnw==
X-Forwarded-Encrypted: i=1; AJvYcCVlDuRnLwgGEw1rCXX04bD7zubwiQbrI8/KeXcr5veVSubIUhakXh6+vAgkfS0FgL0jKtvnK+7bt3tKUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGV4tFo4oJxMBgqHOUHBLQavXNK5eun+eyhLFuBf3Cjpu/J9ZW
	5I9CWs5EimGZytgJSMaLYDrLI9556Nj/veGKCv1pBgZau10mXwOx1JmROHbHr99XsDLyIaz8+tM
	kszkJu+JKZTQkJ4r+fAL0UMwmZx1Nf2t+PFT885iNfGy/F1d6DbbsMyujVEtk
X-Received: by 2002:a17:906:f598:b0:a9a:8a4:e090 with SMTP id a640c23a62f3a-a9de61ce882mr3264094366b.50.1730727153053;
        Mon, 04 Nov 2024 05:32:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2nkvXSCQDu/b2PBidrjQj5Yl75m5fDlUR6Swc1B1BkA7J6Uph0/4q1MRWwaIp97ukpnZxJQ==
X-Received: by 2002:a17:906:f598:b0:a9a:8a4:e090 with SMTP id a640c23a62f3a-a9de61ce882mr3264091566b.50.1730727152569;
        Mon, 04 Nov 2024 05:32:32 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e5667982esm554475666b.191.2024.11.04.05.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:32:32 -0800 (PST)
Message-ID: <ddf37030-1f51-47b0-a1cc-26df72b8d14d@redhat.com>
Date: Mon, 4 Nov 2024 14:32:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: intel/ipu6: do not handle interrupts when device
 is disabled
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>
References: <20241031102321.409454-1-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241031102321.409454-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 31-Oct-24 11:23 AM, Stanislaw Gruszka wrote:
> Some IPU6 devices have shared interrupts. We need to handle properly
> case when interrupt is triggered from other device on shared irq line
> and IPU6 itself disabled. In such case we get 0xffffffff from
> ISR_STATUS register and handle all irq's cases, for what we are not
> not prepared and usually hang the whole system.
> 
> To avoid the issue use pm_runtime_get_if_active() to check if
> the device is enabled and prevent suspending it when we handle irq
> until the end of irq. Additionally use synchronize_irq() in suspend
> 
> Fixes: ab29a2478e70 ("media: intel/ipu6: add IPU6 buttress interface driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I have also given this a test run on a "ThinkPad X1 Yoga Gen 8" and
everything there works at least as well as before:

Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740

Regards,

Hans


> ---
>  drivers/media/pci/intel/ipu6/ipu6-buttress.c | 13 +++++++++----
>  drivers/media/pci/intel/ipu6/ipu6.c          |  3 +++
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> index e47f84c30e10..edaa285283a1 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> @@ -345,12 +345,16 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
>  	u32 disable_irqs = 0;
>  	u32 irq_status;
>  	u32 i, count = 0;
> +	int active;
>  
> -	pm_runtime_get_noresume(&isp->pdev->dev);
> +	active = pm_runtime_get_if_active(&isp->pdev->dev);
> +	if (!active)
> +		return IRQ_NONE;
>  
>  	irq_status = readl(isp->base + reg_irq_sts);
> -	if (!irq_status) {
> -		pm_runtime_put_noidle(&isp->pdev->dev);
> +	if (irq_status == 0 || WARN_ON_ONCE(irq_status == 0xffffffffu)) {
> +		if (active > 0)
> +			pm_runtime_put_noidle(&isp->pdev->dev);
>  		return IRQ_NONE;
>  	}
>  
> @@ -426,7 +430,8 @@ irqreturn_t ipu6_buttress_isr(int irq, void *isp_ptr)
>  		writel(BUTTRESS_IRQS & ~disable_irqs,
>  		       isp->base + BUTTRESS_REG_ISR_ENABLE);
>  
> -	pm_runtime_put(&isp->pdev->dev);
> +	if (active > 0)
> +		pm_runtime_put(&isp->pdev->dev);
>  
>  	return ret;
>  }
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> index 7fb707d35309..91718eabd74e 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> @@ -752,6 +752,9 @@ static void ipu6_pci_reset_done(struct pci_dev *pdev)
>   */
>  static int ipu6_suspend(struct device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	synchronize_irq(pdev->irq);
>  	return 0;
>  }
>  


