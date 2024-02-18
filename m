Return-Path: <linux-media+bounces-5371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C285969A
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 12:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9930AB218F6
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 11:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C744F1FB;
	Sun, 18 Feb 2024 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yrc9hKgT"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D51B28DA7
	for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708254630; cv=none; b=Bg805cpqvb2qWFZsEOnPCVwazJ8sw/NbRKn5BaYFxNnscVxdR216pnwVn9KyHB7kF+4vXuU3bQr1QyK7CAJX1pthRWhLJaHzsPLY2qN9fLfVXnLth2qD70QiQ+Eh90xcEUnnQSKe7CgKs/pePAq66SIAnovNcMyIOtuIy6GFFd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708254630; c=relaxed/simple;
	bh=12nsYsy2ut66XifcXoXVHDNUt5GmvoKa4RT4SjvzScY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REqvB0aoC+k+fVAI2CDH1NOODh3E/wNACg//ua8K1mhoQRgXF5QOY4+HMiSBfwK6RA5GOtKTlKmKMOmDdcAYT7TSHWJl7hOftABsb7Mi7kiCCzboU92aodOfHpS9pZR7rDTwNHV3vimw8iFQmLv9n5QkpnRdZzVf5u7i1r/Wo3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yrc9hKgT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708254627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Idax5CM/6qbkH/+u3noY31RZkg7YAD3UFUEjMGy0kMs=;
	b=Yrc9hKgTSrzJ8glg1OnA/EBKNy+pmZkIuB1mNjekUglS1lPpagd4BZpWyD/w6DY9oNbTUK
	eOlE54SPMKgJ0P2IFaHyMqguOYWy6M44mWDohPuwMH/tBDTh0Ovr45MzlckzeTWp23YiWG
	R0VM1++uSHuxww0T3XkFWZjzEPIVO7A=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-LqHKEm8tOkSVraZjOGPQFw-1; Sun, 18 Feb 2024 06:10:26 -0500
X-MC-Unique: LqHKEm8tOkSVraZjOGPQFw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a3d4881bcf5so223215166b.1
        for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 03:10:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708254625; x=1708859425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Idax5CM/6qbkH/+u3noY31RZkg7YAD3UFUEjMGy0kMs=;
        b=cwLeLqlguvSNmxuaO06jh2oR/BbUHm7+HRQ8eSdd2PTTYdkFQi0YO8Tth4s8ifPrSu
         FuWszS3OQwkuMgDtTQr+ySFWPwlQ5pzuZD8m36htdq4lEze4bgTTjspKOGlj7+clZkwA
         R3S/xQ7u0DLRg/iBrH5IYK1u9mp42KUB57lfwovfKZQj1rDiHxokyJHquHP9KfFKAhxO
         jC2iFGoLurNHcshCU/m2/YoxCHHFZbFM9+r/zsThpnPYeRH2NBoQwtSRDmnP7lAENWRN
         mB+7QZn+7MGj56LOaR8jdhns9SBWLe1oGb57pEsnPoQFt7GoFsWO7BhL3cBICaBj9HCZ
         Zn0w==
X-Forwarded-Encrypted: i=1; AJvYcCX79WPHDxxwo2FdN2Osma2oZ869mDr5E/7Rw+1D2HnvP2goPLjkEHC6E8YlNCqgUxz5v7dANXT14X6cYEYznk9vgc9h48tr/oDs96w=
X-Gm-Message-State: AOJu0Yy2OgOrgRTjTDP7E9xrzSR/DHPXCAVbc0FlGBp6P+kMdKWc9V8U
	vIYnEBRUF6S7iKmGG/nb3Ck42eMFkxYQeneYfrz5TaFbVgKrGALKCzIv0zEBb7dZd5Rp91AavaI
	X/3G+FfZlYpw6Z+nRKdOb5egFYmb6pmgK6DTKt38M74ZYkvP/dHxfdcpN64Aq
X-Received: by 2002:a17:906:d9d1:b0:a3e:4813:d4d8 with SMTP id qk17-20020a170906d9d100b00a3e4813d4d8mr2119448ejb.46.1708254625026;
        Sun, 18 Feb 2024 03:10:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMIsEUb2pQYd8CHxglTw5vFUzUD8H2htHGBATSZWaSSzgH+GAwCXS1T4ocFr6NXEECXo+LFA==
X-Received: by 2002:a17:906:d9d1:b0:a3e:4813:d4d8 with SMTP id qk17-20020a170906d9d100b00a3e4813d4d8mr2119427ejb.46.1708254624703;
        Sun, 18 Feb 2024 03:10:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cx1-20020a170907168100b00a3c456b0c0esm1821584ejd.108.2024.02.18.03.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 03:10:24 -0800 (PST)
Message-ID: <54cd298a-e5fc-4263-8443-95a2b8d97a59@redhat.com>
Date: Sun, 18 Feb 2024 12:10:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] media: atomisp: Change ISP subdev name to "ATOM ISP"
Content-Language: en-US, nl
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Andy Shevchenko <andy@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240217112438.15240-1-hdegoede@redhat.com>
 <20240217112438.15240-8-hdegoede@redhat.com>
 <170818560760.1206667.14199319396527835603@ping.linuxembedded.co.uk>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <170818560760.1206667.14199319396527835603@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/17/24 17:00, Kieran Bingham wrote:
> Quoting Hans de Goede (2024-02-17 11:24:36)
>> Change the generic "ATOMISP_SUBDEV" name to "ATOM ISP" to make clear
>> that this is the subdev for the ISP itself.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
>> index 8253b6faf8cd..822fe7d129e2 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
>> @@ -799,7 +799,7 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
>>         int ret;
>>  
>>         v4l2_subdev_init(sd, &isp_subdev_v4l2_ops);
>> -       sprintf(sd->name, "ATOMISP_SUBDEV");
>> +       sprintf(sd->name, "ATOM ISP");
> 
> Pure bikeshedding, but I'd probably lower the shouting to just 
> 	"Atom ISP"

Works for me, I've fixed this in my personal tree.

> Either way saying it's a subdev on a subdev isn't much of a value add so 
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Thank you for this and all the other reviews.

Regards,

Hans



