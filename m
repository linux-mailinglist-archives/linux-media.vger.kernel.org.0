Return-Path: <linux-media+bounces-22409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A59379DFCCE
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 10:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B13C281D41
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 09:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B631FA15A;
	Mon,  2 Dec 2024 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B+yHNJu7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8DF1D6DB5
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733130573; cv=none; b=HEC1pBLcNE4INtInexLH1XB57nN+rfJ3oQcu7bqxEHdPYSl3ONy7YfvTnAJDcq2MKgBb5m8dRmjyBNqhVPBsgYIdGOWCoEtaPgcgLTxMNjqA6frsh7sgogULTmMtw6qT20k2SKK8ELjDdoCc8CRjk5NnbLJgMBI27PHrvrjzeLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733130573; c=relaxed/simple;
	bh=H0d+7gF11WxQzd+CRxmPTpAQow4uhESWn4kdXuSy10g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOFEuM2n/yHhhi3uvr+VbxkbEaVaJe2wqWiQ0r07G6c8RxBgoNxUJdEll0MkiO+dOnC6R/ahwEYJttchUV7a3Y2CgCaPSs+XoBcOYp/kJzHI+wmZ+IjQYVwGp4T/uQk9m738tP2LpHk2JeCgnJe7tYVqCZKKB4S2JmHR4Bi02lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B+yHNJu7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733130570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tumfdB1XT50MzAsh5klmAn6rec/vuEWC4YOENGE4Bpc=;
	b=B+yHNJu79DgSaQ7VtuZUJw641jiZyTVY+B+ewiW/8KfJPF4g1MfZf6WulZQcSfpAjdPUve
	5aW6Tpxdcax+sH8QitbuonfhIka1ppxrQxj7RmkNnlONwnfYrlBsU18y9bNnvjbOzGGX9L
	Ah2k6oqg9T5OyXW/l+rp3lIZcJkflXo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-0cozDO7TMkKe-y-CW8KdmA-1; Mon, 02 Dec 2024 04:09:26 -0500
X-MC-Unique: 0cozDO7TMkKe-y-CW8KdmA-1
X-Mimecast-MFC-AGG-ID: 0cozDO7TMkKe-y-CW8KdmA
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d0abcc9c6cso1991235a12.3
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 01:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733130565; x=1733735365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tumfdB1XT50MzAsh5klmAn6rec/vuEWC4YOENGE4Bpc=;
        b=pdeAMTspaH/O2UeTae4RvCjMiQZ5RGE99c+jRNv/B6OCnkqr8pr8CwpZXqk1FeAAZ3
         xVDJjL5waFgYVymsUZ7qtBN6jNaIF/VifRn/NExEqKzRXzxQfkcciC6jzgadzbZvDuXT
         9aDUCqg0e+hif0vdK3WjBsDxCqRx0bk6O4MLw7XnLbxW3PCDFAb3gVqRx43nytDEryZp
         VBineJi8T8gCKyJQQvlcaTByn6N5IgY+eecsimU8In/Z10skLsrY1uVbq9PihH4f3tMi
         PEzJru4ChasF3sl1eSdAcAjrorFC+McCn4haUMyLdt1WkqAZX57yodWFIWh+r5EysUj0
         WiNA==
X-Forwarded-Encrypted: i=1; AJvYcCWIAGN4KsSnuSdXZJbsR1pcp+3rlNECDdPfwbapQWtCL0CJKy5KRIydji0CFquI2IFDg66yJSXadGiyxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz2HfjUpqtXd4ruGForm7rO/xdFvHb4cCT6pqvbUwZc4C9xH11
	pxh5vtFMgYYlvsiYPrFjEN/I0CAKMd1gQU2vzIhcSUWn9yEx8G2bmDNkcKUa3/Q4QokNYGGnG1P
	A3OW0vw0x9k77/AhYp/1/gtOz0YfexQjGe7N+APB2ALeG0JQPlcYxbJE+Hgxi
X-Gm-Gg: ASbGncuZMJtl+9dtHubOFl0WJ6SdbG+hoH1niz9n56LPkOMsb4FNjr1pXdZPn18dX9A
	FHrzSfvqi2Nrl0hxPDDhyYLyOHyTW5CRjbE+29n7T7vLQ0I4QY9eTh+OxhaV+/4hc8cZQ77fVi2
	6t6zlk9UFDGpupAQy07jVHKRh+kRnmQLleMF6WVKjhyyU3aoPuW5Y+SUg8Cs4f9xm3FbwKhVMjF
	EcZntRZNSTCK31VnXFaIEwokDkl1Nn7lw8lB+jrBg5WZdKTFPpH2Q==
X-Received: by 2002:a05:6402:2755:b0:5d0:c8f4:d1d7 with SMTP id 4fb4d7f45d1cf-5d0c8f4d4e0mr10627841a12.31.1733130565069;
        Mon, 02 Dec 2024 01:09:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHf9u0gEJC+1dS0iPEUiOSVntJyjuxH1TJ1jpFdtcx0sbSjoqsQ8pfWYz0irdDW45Z/7srSyg==
X-Received: by 2002:a05:6402:2755:b0:5d0:c8f4:d1d7 with SMTP id 4fb4d7f45d1cf-5d0c8f4d4e0mr10627797a12.31.1733130564565;
        Mon, 02 Dec 2024 01:09:24 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0cadaa90dsm2747851a12.21.2024.12.02.01.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 01:09:23 -0800 (PST)
Message-ID: <01c8e1c3-a5ef-4c4f-a38f-d602c36e7ce0@redhat.com>
Date: Mon, 2 Dec 2024 10:09:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: intel/ipu6: move some boot messages to debug level
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>
References: <20241129120020.318903-1-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241129120020.318903-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for your patch.

On 29-Nov-24 1:00 PM, Stanislaw Gruszka wrote:
> When ivsc chip fail to initialise properly we can get plenty of ipu6
> messages like this:

s/initialise/initialize/  (if you decide to do a v2)

This does not only happen when the ivsc chip fails to initialize, it also
happens while the ipu6 driver is waiting for the ivsc driver to be probed
(with ipu6's probe() method returning -EPROBE_DEFER) when the ivsc driver
does initialize properly eventually.


Maybe do a v2 with an updated commit msg reflecting this ?

Otherwise the patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> [   15.454049] intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 0x0 mask 0xff
> [   15.456600] intel-ipu6 0000:00:05.0: FW version: 20230925
> [   15.458292] intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 0x0 mask 0xff
> [   15.461186] intel-ipu6 0000:00:05.0: FW version: 20230925
> [   15.463616] intel-ipu6 0000:00:05.0: IPU6 in non-secure mode touch 0x0 mask 0xff
> [   15.466490] intel-ipu6 0000:00:05.0: FW version: 20230925
> 
> Print them only when debugging is enabled to do not flood dmesg on
> ivsc errors condition.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> --->  drivers/media/pci/intel/ipu6/ipu6-buttress.c | 8 ++++----
>  drivers/media/pci/intel/ipu6/ipu6-cpd.c      | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> index e47f84c30e10..e02899dda8d0 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> @@ -852,10 +852,10 @@ int ipu6_buttress_init(struct ipu6_device *isp)
>  	INIT_LIST_HEAD(&b->constraints);
>  
>  	isp->secure_mode = ipu6_buttress_get_secure_mode(isp);
> -	dev_info(&isp->pdev->dev, "IPU6 in %s mode touch 0x%x mask 0x%x\n",
> -		 isp->secure_mode ? "secure" : "non-secure",
> -		 readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
> -		 readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
> +	dev_dbg(&isp->pdev->dev, "IPU6 in %s mode touch 0x%x mask 0x%x\n",
> +		isp->secure_mode ? "secure" : "non-secure",
> +		readl(isp->base + BUTTRESS_REG_SECURITY_TOUCH),
> +		readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
>  
>  	b->wdt_cached_value = readl(isp->base + BUTTRESS_REG_WDT);
>  	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_ISR_CLEAR);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
> index 715b21ab4b8e..3dec9e3329d6 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
> @@ -275,7 +275,7 @@ static int ipu6_cpd_validate_moduledata(struct ipu6_device *isp,
>  		return -EINVAL;
>  	}
>  
> -	dev_info(&isp->pdev->dev, "FW version: %x\n", mod_hdr->fw_pkg_date);
> +	dev_dbg(&isp->pdev->dev, "FW version: %x\n", mod_hdr->fw_pkg_date);
>  	ret = ipu6_cpd_validate_cpd(isp, moduledata + mod_hdr->hdr_len,
>  				    moduledata_size - mod_hdr->hdr_len,
>  				    moduledata_size);


