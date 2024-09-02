Return-Path: <linux-media+bounces-17327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3560E9683DD
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 11:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C730AB2333E
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 09:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF6B1D416F;
	Mon,  2 Sep 2024 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVrNycb/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C781D415C
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271040; cv=none; b=C0znL92WLXUn4Cbhvuv9+OdXqdvSB6tuQX1IX2XjgqKN3sBxSWqNAyGlIg2gOOKxOT10iQYcYct20yj0FFOJfvhkUyPqMVMqulRy6BlPd8tokPez//AGdiKQCN3DJeirVkMbm0y+2824V5NTVKgzCArxMjrxizwXxwr3gTrklwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271040; c=relaxed/simple;
	bh=h6aqWJZFe0DKJpJGK0OZTK0FOdgHJcHHhCtmfLuBK8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dadIKao9dznZYUMw+hzSlZyVgcPNynTisSexyT4Lf710NyXFW9vEXzdJ0NHFX3F11mTX+za/F+S+gUuFpg+wGdEqEysZokmZaTvgpaoaSdVRyZFqmdnZbJjt0sQ9IbIUvq+3BzTS1aVYX/cgFHYOZIby1ns46eEHioRgCKrB0/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVrNycb/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725271038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqO38yPbjmvsFWhnuzTcej5cxt9R0Ja/2qgnhxFK22Y=;
	b=UVrNycb/6jQF8XKTpeS8epp7e5EY7VQPoQ9SQsTaunPADKgMha+w2Izr+HJWAMWX0ah7iU
	kdBTV4Qd2UdiPxeK38B5NWoW/JwNV9wA4YUXyDqO4PmBYMiWQ2hWwgj+gNdlTSC25+IRbW
	q7hCyXmIAwozDPorMDva+XSXzWvSjH4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-Vrp0gMkPO5S5ak9G6idhSg-1; Mon, 02 Sep 2024 05:57:15 -0400
X-MC-Unique: Vrp0gMkPO5S5ak9G6idhSg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5c244732fe0so1774149a12.3
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 02:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271034; x=1725875834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqO38yPbjmvsFWhnuzTcej5cxt9R0Ja/2qgnhxFK22Y=;
        b=IoXj+n8nBZhpqR6G764aChvM4KAYdsAGPKTRHhpj6MMhkxlqxNFwmnFMPhCp0sZC6P
         a85QAM5w91qJ7vfbUj7X+1CfxJoGwi7TRzx2t8Evg6t1ER0zyFZjbthO4TigERAkikYh
         uSp6hA/PMXBcOl1mrcyW36yy5It3cKpubLrO+3g4kuAtXrChcm6r5V95PIdSnAyZgGMB
         cu78hsOphWOn7eNgIFWRhExRQO7pP8HEHU8BRBYrnNPHMnBmMZbEu8msNMDTlmxJA6qo
         umwk3PfPa2+BjnS++9hEypqv0v8loMdOgwXqnPjP2JDttZrE05Mg5hXswyCTlXHZjVXf
         c0/A==
X-Gm-Message-State: AOJu0YydYhGekOo54b1C90abgLZCLgHrNdCfQybmEWeS6OS+r8PJqRAi
	oFGaWCVoFa1ktxKWmi6YqtijkKSPLB8bppbPlkkKuJzOQ1iQNFe++0gTFdI2OUmEJRwebrhKxNE
	O1ypi1pHHtc0cyrB3lUxtQLCH7VCI91N1DDq6YDoJwjJID5FGDx+a2+hYxsVs
X-Received: by 2002:a17:907:1c1f:b0:a6e:f7bc:dcab with SMTP id a640c23a62f3a-a897fad848dmr1008306666b.65.1725271033761;
        Mon, 02 Sep 2024 02:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwtv99Has9Hvq1W7dpRPfixeSdoVcVSbR1ZDJPHIHNOwqQjIB2aBEqdYaBzaUlXxrofnbVfQ==
X-Received: by 2002:a17:907:1c1f:b0:a6e:f7bc:dcab with SMTP id a640c23a62f3a-a897fad848dmr1008305066b.65.1725271033196;
        Mon, 02 Sep 2024 02:57:13 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989222593sm535098466b.205.2024.09.02.02.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 02:57:12 -0700 (PDT)
Message-ID: <44642b37-9a73-40d6-9c2b-0f3182932907@redhat.com>
Date: Mon, 2 Sep 2024 11:57:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/include/linux: Fix spelling
 mistakes in atomisp.h
To: Roshan Khatri <topofeverest8848@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, andy@kernel.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240522161830.57434-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240522161830.57434-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/22/24 6:18 PM, Roshan Khatri wrote:
> codespell reported misspelled coefficients and vector in atomisp.h. This
> patch corrects the spellings to increase readability and searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>

Thank you for your 3 patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/include/linux/atomisp.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
> index bbbd904b696a..1d11a9579587 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
> @@ -201,7 +201,7 @@ struct atomisp_dis_vector {
>  };
>  
>  /* DVS 2.0 Coefficient types. This structure contains 4 pointers to
> - *  arrays that contain the coeffients for each type.
> + *  arrays that contain the coefficients for each type.
>   */
>  struct atomisp_dvs2_coef_types {
>  	short __user *odd_real; /** real part of the odd coefficients*/
> @@ -741,7 +741,7 @@ enum atomisp_burst_capture_options {
>  /* Digital Image Stabilization:
>   * 1. get dis statistics: reads DIS statistics from ISP (every frame)
>   * 2. set dis coefficients: set DIS filter coefficients (one time)
> - * 3. set dis motion vecotr: set motion vector (result of DIS, every frame)
> + * 3. set dis motion vector: set motion vector (result of DIS, every frame)
>   */
>  #define ATOMISP_IOC_G_DIS_STAT \
>  	_IOWR('v', BASE_VIDIOC_PRIVATE + 6, struct atomisp_dis_statistics)


