Return-Path: <linux-media+bounces-17336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A39684BC
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 12:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77F88286C1C
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C91143878;
	Mon,  2 Sep 2024 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hHF6fEfq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B85713B2A8
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273208; cv=none; b=LyJGiNuxTMlRSBhaRJ9F0sgseixnBNLFP+nFmaadmulx1vDmyZvIYVNlTRn2ltdcpqfuAJdVcPU6bJRrAFkMQq1BGS1AWfY+VQXFAE0HNXHd0YK8KOZfjp6W6NApshhbcGuBYhlk9dlnaut0VXbMowOWPJ8PbpMhVmxG6HWxohU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273208; c=relaxed/simple;
	bh=I3fdoM6yM4f/D40flYJNhPUtuHyy8h9Fmdm5n4JrXIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LiwW6ggcm6KF4ktf04WJOBaVZC7PfLiQT0XmWH10DjmOBHQBLxVLN8m0m3Lkp2cU8jgptBKVYPSWrsMGqIJ0/usWj4AC15cQE/w4zxcAur/DXeu2i4ywghCG82EuQVQdUVbtmAC5kXhBIKVWnOgM+q+H5XrK5p3vYm9gIZ7TPB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hHF6fEfq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725273204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEftyclLmgL6sFHWyZ9hilR8BG/bolwD0Ec6Bihbrwc=;
	b=hHF6fEfqHRr/4PvJ2H6L98m8xnOnYDDB7iealHO/alt2WAXpkiWPUjKPwWFKgUUjWh1gVK
	SW+2PBMbo+OBkIn4md33eCy/DfdoByS69V2Ak/FJiUmDyTHPPMhaaZ1RmdfAf1G0DCoUMa
	BdQkl75fKu2PAsCvXKgRjSE/kvh5ti8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-gwaf4E7mOwSpsXw9AkixXw-1; Mon, 02 Sep 2024 06:33:21 -0400
X-MC-Unique: gwaf4E7mOwSpsXw9AkixXw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7a83fad218so367137866b.3
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 03:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273199; x=1725877999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FEftyclLmgL6sFHWyZ9hilR8BG/bolwD0Ec6Bihbrwc=;
        b=RIjk3GbrkieYo6FNFB6L4ah984MsOYPC6TWFNmxm5pKe+gGlRsxyTAKLj2ko2qd7YO
         mrZ8So6H3rCFyzHXMQLCOREmZzN1Rn3XXteua5GS4wqsWV/POSwL1uMhR+eapznbv1ME
         itUtff13NSeDvs1oHrTDnK/3TNc34XXA5hJknkrf6klsFWc3iirNHEmcvNCedcPtqhGf
         EMemAKST8ApWYOC4PztmGbAHi+RRpmXDuC9p+XHzHK640Gd7dx3LMbViG62Kk4x2SkR0
         7n+PqX2m4yHPDzTSvpw5c2Wmg+0pXaxenYEHxSMoRiTJiQoD4fcjiEViAfU+vSw/IO7U
         KOzw==
X-Forwarded-Encrypted: i=1; AJvYcCULU5Sj1LW4DAJt185LYIKAJmB8KGnq1FWSuw8GKrd8k29YjEMSEkvRqVj3DfFYDA49Atd5Ho1nwdEc2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxslsvBAknkvtym35s4uswSsVMg4ZOO1CgXUi9i1VFvu/WoHuFS
	gV9duGuWN6cztKcP7NhV7C33DJ8afZWuZJcj2e+iDPUG6EFNh/9V2tQTWjb8QOHlkXUwzBX+G4b
	pQ8JWJ1S3ByPtcglnopDVq8UMKsulGqTDKZVIlabu05vv36m8SyLJKcUZ8orG
X-Received: by 2002:a17:907:dab:b0:a86:743a:a716 with SMTP id a640c23a62f3a-a89b96f8af8mr442737266b.53.1725273199203;
        Mon, 02 Sep 2024 03:33:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeTa2CX7uYLrV9yyScoXnuNVqaFfg+6diBaHk/rMPkx1pF/93vabNo5pGf8xqWrdDkz/7CVQ==
X-Received: by 2002:a17:907:dab:b0:a86:743a:a716 with SMTP id a640c23a62f3a-a89b96f8af8mr442735266b.53.1725273198640;
        Mon, 02 Sep 2024 03:33:18 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6d88sm542661366b.151.2024.09.02.03.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:33:18 -0700 (PDT)
Message-ID: <f7d25ee2-810d-40af-bdfc-787a7ef7366f@redhat.com>
Date: Mon, 2 Sep 2024 12:33:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: atomisp: Remove unused declartion
To: Zhang Zekun <zhangzekun11@huawei.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
 changhuang.liang@starfivetech.com
References: <20240830030035.15686-1-zhangzekun11@huawei.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240830030035.15686-1-zhangzekun11@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/30/24 5:00 AM, Zhang Zekun wrote:
> v4l2_get_acpi_sensor_info() has been removed since commit d80be6a10cd3
> ("media: atomisp: Drop v4l2_get_acpi_sensor_info() function"), remain
> the declaration untouched in the header file. So, let's remove this
> unused declartion.
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
> v2: Improve commit message
> 
>  drivers/staging/media/atomisp/include/linux/atomisp_platform.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> index fdeb247036b0..ca31eea41f39 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> @@ -175,8 +175,6 @@ int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
>  				    enum atomisp_bayer_order bayer_order);
>  void atomisp_unregister_subdev(struct v4l2_subdev *subdev);
>  
> -int v4l2_get_acpi_sensor_info(struct device *dev, char **module_id_str);
> -
>  /* API from old platform_camera.h, new CPUID implementation */
>  #define __IS_SOC(x) (boot_cpu_data.x86_vfm == x)
>  #define __IS_SOCS(x, y) (boot_cpu_data.x86_vfm == x || boot_cpu_data.x86_vfm == y)


