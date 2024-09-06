Return-Path: <linux-media+bounces-17731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 233AD96EC97
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 09:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99D621F22605
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 07:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335D2155730;
	Fri,  6 Sep 2024 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dJXhAa3K"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F3314E2DA
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609214; cv=none; b=Gspx0Ac6ypknoroTj7s0KRonRK6/1MoXdl7M2Aupf1SLhpZNzpKPs0nKaWJcQGDocM+nvA8a6EYfASL+4jRqnIFfNGM14VfC1Yf3rzmcGslp7+B9+Kl8nqdAIbr1iKWd5yVLBijGLn3XyOmKC4L7yOPCaHyXVuxwyfnCvXt2nh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609214; c=relaxed/simple;
	bh=GCMDxAu3IaniQ5HCxcQskflExoAkJD9+BwP8v4G3nfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBIOThuOvyuICrb6BKESjJPvCAt24QV3H4bsZZxq7flHu01bcn6m4EcZD5ETT121Vctw8QRrsYZdeCSvneod964aOuYlDa8oc9bnnUqyuZZeQa1kwtGPIa91EAPFuY3kHQAZty0TmWseyNRvYv6fbchR7zV5Uka/df4lbsytAqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dJXhAa3K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725609211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jb0VO/koKLYJgTCZzGirO66CNO/8U0TBlaqXMtiO8uM=;
	b=dJXhAa3KGkgkYCjumG+AZZxEEO5NYm5s1gHzMxx1B45rdrrBXSnqnk6sbMLpQzTVflgxQP
	VMKlyASA5kbp8jn0uLl6lUV6cI1YVaPUuPhaMxD7FA191Vs6bCeVn4M5H/qSPfIwzbStSw
	ya+AdgqgXR44AT3jLMeELKEZuDhf6cs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-ncz1M-1HNwO473WUTeU0NQ-1; Fri, 06 Sep 2024 03:53:30 -0400
X-MC-Unique: ncz1M-1HNwO473WUTeU0NQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a8a80667ad8so109532766b.2
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2024 00:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725609209; x=1726214009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jb0VO/koKLYJgTCZzGirO66CNO/8U0TBlaqXMtiO8uM=;
        b=nxoXEiEGg/05LdFdmra15/rzqDmGLi7/NWW0vqxO+obcmr+//jnWlDWQHk6yXUiaAp
         d7s1cm3lnf+mFh4l/uV4PuOqaKH14NYN+UyF9V0RlsJv/RY1TxX5L8mRknb2c543I7aw
         2g6Wo2R/lpSWyWjDQIdRslPB0WTTGMjMUXOXg8cgZfmUHapc5R/z2WNCClguxtSwmq9r
         gAAqpU2+mAW+Wj5HsRJoVAXb45AOMO2GY7RacQNLSAmdRJh8Kv/ZSkadHfPlnjmC8Dcz
         Z7PoTNgqkdnnac/SM15YnWz/QVjsE9WWvdNtYAYjTnrRpJ/54yy2pjaBdHtZDwm6GKLs
         rJlA==
X-Forwarded-Encrypted: i=1; AJvYcCWSIIltYF/bLAdBxUPDVTIZxFB6pJMDujGeh9urBfUI7BE8fQfFH3PZTE9HgapiFH4RaZauvf7p6dRFEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMEkJcErtGExVd6sDom24H8FmZmQtD4f8PK1QD0ZQlruc4KSzt
	2QkrQ0EtYewq4SIziev9J3YKUZwqi/efeHKxcL6L0RHuCP36tWO00KqOnvtgTKzBNgZUNvDLTbN
	F/DvdNUqHRHnJyVaqkQq6I9Ma8YFifrZl3pmGWml7Fwu5dU/asG+hczMwcRZ4
X-Received: by 2002:a17:907:72d3:b0:a88:a48d:2b9a with SMTP id a640c23a62f3a-a897fa74459mr2016881266b.52.1725609209248;
        Fri, 06 Sep 2024 00:53:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp5hoFTWcod3R3DE52W9xXd6OoPu09wqLhMYrYtNi9fhJDGs0vfjiIfjOISDezF+RhQFCZoQ==
X-Received: by 2002:a17:907:72d3:b0:a88:a48d:2b9a with SMTP id a640c23a62f3a-a897fa74459mr2016879766b.52.1725609208773;
        Fri, 06 Sep 2024 00:53:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a6204677csm239290866b.79.2024.09.06.00.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:53:28 -0700 (PDT)
Message-ID: <b37a0c60-55aa-44ec-b96c-68cdaabdc110@redhat.com>
Date: Fri, 6 Sep 2024 09:53:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: Use clamp_t() in
 ia_css_eed1_8_vmem_encode()
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: David.Laight@ACULAB.COM, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <155aba6ab759e98f66349e6bb4f69e2410486c09.1722084704.git.christophe.jaillet@wanadoo.fr>
 <20240906081542.5cb0c142@foz.lan>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240906081542.5cb0c142@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On 9/6/24 8:15 AM, Mauro Carvalho Chehab wrote:
> Em Sat, 27 Jul 2024 14:51:56 +0200
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> escreveu:
> 
>> Using clamp_t() instead of min_t(max_t()) is easier to read.
>>
>> It also reduces the size of the preprocessed files by ~ 193 ko.
>> (see [1] for a discussion about it)
>>
>> $ ls -l ia_css_eed1_8.host*.i
>>  4829993 27 juil. 14:36 ia_css_eed1_8.host.old.i
>>  4636649 27 juil. 14:42 ia_css_eed1_8.host.new.i
>>
>> [1]: https://lore.kernel.org/all/23bdb6fc8d884ceebeb6e8b8653b8cfe@AcuMS.aculab.com/
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>  .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 24 +++++++++----------
>>  1 file changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
>> index e4fc90f88e24..96c13ebc4331 100644
>> --- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
>> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
>> @@ -172,25 +172,25 @@ ia_css_eed1_8_vmem_encode(
>>  		base = shuffle_block * i;
>>  
>>  		for (j = 0; j < IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS; j++) {
>> -			to->e_dew_enh_x[0][base + j] = min_t(int, max_t(int,
>> -							     from->dew_enhance_seg_x[j], 0),
>> -							     8191);
>> -			to->e_dew_enh_y[0][base + j] = min_t(int, max_t(int,
>> -							     from->dew_enhance_seg_y[j], -8192),
>> -							     8191);
>> +			to->e_dew_enh_x[0][base + j] = clamp_t(int,
>> +							       from->dew_enhance_seg_x[j],
>> +							       0, 8191);
>> +			to->e_dew_enh_y[0][base + j] = clamp_t(int,
>> +							       from->dew_enhance_seg_y[j],
>> +							       -8192, 8191);
> 
> Such change introduces two warnings on smatch:
> 
> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c: drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c:177 ia_css_eed1_8_vmem_encode() warn: assigning (-8192) to unsigned variable 'to->e_dew_enh_y[0][base + j]'
> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c: drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c:182 ia_css_eed1_8_vmem_encode() warn: assigning (-8192) to unsigned variable 'to->e_dew_enh_a[0][base + j]'
> 
> Should dew_enhance_seg_x and dew_enhance_seg_y be converted to signed?

These already are s32, the problem is that e_dew_enh_a is of type t_vmem_elem which is:

typedef u16 t_vmem_elem;

And that type is used in a lot of places, so we cannot
just change that.

I guess we could add a t_signed_vmem_elem (s16) and use that for these vmem-arrays ?

I tried fixing it like this:

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-t4ka3.c b/drivers/staging/media/atomisp/i2c/atomisp-t4ka3.c
index 1e01d354152b..7c0195d15f53 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-t4ka3.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-t4ka3.c
@@ -428,18 +428,13 @@ static int t4ka3_s_stream(struct v4l2_subdev *sd, int enable)
 			goto error_unlock;
 		}
 
-		ret = cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
-					  ARRAY_SIZE(t4ka3_init_config), NULL);
-		if (ret)
-			goto error_powerdown;
-
+		cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
+				    ARRAY_SIZE(t4ka3_init_config), &ret);
 		/* enable group hold */
-		ret = cci_multi_reg_write(sensor->regmap, t4ka3_param_hold,
-					  ARRAY_SIZE(t4ka3_param_hold), NULL);
-		if (ret)
-			goto error_powerdown;
-
-		ret = cci_multi_reg_write(sensor->regmap, sensor->res->regs, sensor->res->regs_len, NULL);
+		cci_multi_reg_write(sensor->regmap, t4ka3_param_hold,
+				    ARRAY_SIZE(t4ka3_param_hold), &ret);
+		cci_multi_reg_write(sensor->regmap, sensor->res->regs,
+				    sensor->res->regs_len, &ret);
 		if (ret)
 			goto error_powerdown;
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
index b79d78e5b77f..c9043d516192 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
@@ -172,21 +172,21 @@ ia_css_eed1_8_vmem_encode(
 		base = shuffle_block * i;
 
 		for (j = 0; j < IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS; j++) {
-			to->e_dew_enh_x[0][base + j] = clamp(from->dew_enhance_seg_x[j],
-							     0, 8191);
-			to->e_dew_enh_y[0][base + j] = clamp(from->dew_enhance_seg_y[j],
-							     -8192, 8191);
+			to->e_dew_enh_x[0][base + j] = (u16)clamp(from->dew_enhance_seg_x[j],
+								  0, 8191);
+			to->e_dew_enh_y[0][base + j] = (u16)clamp(from->dew_enhance_seg_y[j],
+								  -8192, 8191);
 		}
 
 		for (j = 0; j < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); j++) {
-			to->e_dew_enh_a[0][base + j] = clamp(from->dew_enhance_seg_slope[j],
-							     -8192, 8191);
+			to->e_dew_enh_a[0][base + j] = (u16)clamp(from->dew_enhance_seg_slope[j],
+								  -8192, 8191);
 			/* Convert dew_enhance_seg_exp to flag:
 			 * 0 -> 0
 			 * 1...13 -> 1
 			 */
-			to->e_dew_enh_f[0][base + j] = clamp(from->dew_enhance_seg_exp[j],
-							     0, 13) > 0;
+			to->e_dew_enh_f[0][base + j] = (u16)clamp(from->dew_enhance_seg_exp[j],
+								  0, 13) > 0;
 		}
 
 		/* Hard-coded to 0, in order to be able to handle out of

but smatch still complains after this...

Regards,

Hans



