Return-Path: <linux-media+bounces-3111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E3B820AF0
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D53B82828F9
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 09:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881BA3D86;
	Sun, 31 Dec 2023 09:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UfFkRs9r"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFED18F48
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 09:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704016250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QhZUTd/H07Uvw7u2aVbJSjltpuPY6hRS4P4m9ENSPLw=;
	b=UfFkRs9rGTl9063IgsKKCdHsTIMY+0HXlcy1Xi7pYMAGGAFZqwr6nX08Ti6vY3ekIWwAev
	e/imXMR9GenyNqGHCfjn2ypfFSgXs5vrZXXowWvHsHZFQKiObyq82WlgelKFlBtkvs1MIE
	dY+VCda4nltEcguZ8ZURgFWNF52zjmg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-CIXFesySPwW69yCZIjPPlA-1; Sun, 31 Dec 2023 04:50:48 -0500
X-MC-Unique: CIXFesySPwW69yCZIjPPlA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a27ab879162so108004866b.1
        for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 01:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016248; x=1704621048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhZUTd/H07Uvw7u2aVbJSjltpuPY6hRS4P4m9ENSPLw=;
        b=aJffnb3/XAlLpVYP0WXeqjB5NiF6gyTLL6yvL19oLfKEWlmUfs6wY7Y0Cr41EVD/3x
         vTTUTVR3yt7riynfhrJ6+ukj6unyhygAINQyGx2PdKFoYcA8hPhZahaw+z3m1Vn57xIM
         yiL3vZ0UM1eNkYVRTAmGwqGgWItnY7caJ0bCRlU6CzcIyzqM0bdWMMP0yaCWltZ+FDX8
         X9w50JVR8H9eGkPXLksrFyX1bX9czkWqW5uWmGGDPrJAD8/LmLgUq8yzZMgAlI+Fz8tq
         AvsuRlpgsKRZ6vJpF2biPgUnxkh2Oc+r69HOOOp7pd+XNkEWnEvfgTbsdPs9ebzfCF/6
         WxPA==
X-Gm-Message-State: AOJu0Yw0EoJmocFlJgWOw0T/8U/liC96FCQuJQbvwKfOpluB/BX0rL5f
	XeQCn6gphaIZ4/qOqrC9TbCzJDO2Dxi4PhQpFSfB2V/zsNpnXk2y+Vrid4msm7SYOyeAw470MRb
	jXPswPYOTbkWpT45P3HRPxs2Zg2NyR1I=
X-Received: by 2002:a05:6402:206c:b0:554:448d:c4a5 with SMTP id bd12-20020a056402206c00b00554448dc4a5mr11611694edb.13.1704016247852;
        Sun, 31 Dec 2023 01:50:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5IZnzaHDdgE/IRBdvRxny2kWlK9XSzfGwaU2d8BMjhMEYr1AvINGSZPGd2vxco9f93vQgiA==
X-Received: by 2002:a05:6402:206c:b0:554:448d:c4a5 with SMTP id bd12-20020a056402206c00b00554448dc4a5mr11611684edb.13.1704016247673;
        Sun, 31 Dec 2023 01:50:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p12-20020a05640243cc00b0055493aa8905sm9894390edc.63.2023.12.31.01.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:50:47 -0800 (PST)
Message-ID: <7d43e396-9496-42c3-9396-7f0fbda40bc0@redhat.com>
Date: Sun, 31 Dec 2023 10:50:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: media: atomisp: pci: Fix spelling mistake in
 ia_css_acc_types.h
Content-Language: en-US, nl
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223141157.95501-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223141157.95501-1-kdipendra88@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 15:11, Dipendra Khadka wrote:
> codespell reported spelling mistakes in
> ia_css_acc_types.h as below:
> 
> '''
> ia_css_acc_types.h:87: cummulative ==> cumulative
> ia_css_acc_types.h:411: descibes ==> describes
> '''
> 
> This patch fixes these spelling mistakes.
> Word "cummulative" is changed to "accumulation"
> and "descibes" to "describes".
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
> v3:
>  - Changed "cummulative" to "accumulation" as suggested by Randy.
> v2: https://lore.kernel.org/lkml/20231223051108.74711-1-kdipendra88@gmail.com/
>  - Previously only corrected spelling  mistake reported by checkpatch.pl.
>  - All spelling mistakes reported by codespell are fixed.
> v1: https://lore.kernel.org/lkml/20231222200350.2024-1-kdipendra88@gmail.com/
> 
>  drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> index d6e52b4971d6..f6838a8fc9d5 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> @@ -84,7 +84,7 @@ struct ia_css_blob_info {
>  		memory_offsets;  /** offset wrt hdr in bytes */
>  	u32 prog_name_offset;  /** offset wrt hdr in bytes */
>  	u32 size;			/** Size of blob */
> -	u32 padding_size;	/** total cummulative of bytes added due to section alignment */
> +	u32 padding_size;	/** total accumulation of bytes added due to section alignment */
>  	u32 icache_source;	/** Position of icache in blob */
>  	u32 icache_size;	/** Size of icache section */
>  	u32 icache_padding;/** bytes added due to icache section alignment */
> @@ -408,7 +408,7 @@ struct ia_css_acc_sp {
>  };
>  
>  /* Acceleration firmware descriptor.
> -  * This descriptor descibes either SP code (stand-alone), or
> +  * This descriptor describes either SP code (stand-alone), or
>    * ISP code (a separate pipeline stage).
>    */
>  struct ia_css_acc_fw_hdr {


