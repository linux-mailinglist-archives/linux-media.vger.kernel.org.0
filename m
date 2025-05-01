Return-Path: <linux-media+bounces-31502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C107AA5FA1
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 16:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 558AE3B0E11
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 14:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225311DE3D1;
	Thu,  1 May 2025 14:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QWnCI1Et"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000161AB6DE
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108473; cv=none; b=alw1EzRu3SSD4diRYRGFV6TgnvIk43P03UFdtU5j5UjVB+ayFdwgLFvnrCGWvhUakh9w9dHg45ZSOOVqqOVPWnJKgroevfphA7QjPh5fxfswUYjR4bI9YVy3sLWnmLj9RmaEkg+SnMP4gIgAvektEBOhKxbmeZYayNOvAMcx7T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108473; c=relaxed/simple;
	bh=9lC6JDyhN5Ye3uhPem/9/CiQIrSt2QGWIsm0S3JRraA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMqxqDNC0e6xlHGszqXjB9DjvmNS1nMNK1PCinKLmcJoorMErWd1d7FudVlV4INnBy+KyWGPejvkSfHSgCKvj0wVz8zRTSh2pPqfpo9xF1lvxZ10FE2sQAcwPyBkpY3L4m9+/waZJf2jTt2sEgWHmgP2pPGrFF+sPvQsK48bORA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QWnCI1Et; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746108471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AcrNyKhVOmoLr0oSNLK0T/cJNvY0MVzyEpaG1k/ubdI=;
	b=QWnCI1EtEZJOqt7J2WugB8IcJPoZ5mXJu/NIjNNIEMhy1Er/FT/Sv3c/Jkt+hZfp0Ys/wY
	ycwSzddHLfIPBqFnGGMgr3OR9g0g1uLR2/XMdNidT3myjYmuhZq5dQPOOVqthPVVNS9Cdq
	qryjDRYG/2XQcCHpypMK5pZY9sbhqo0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-iq0a9HMlPF-UeoVQD1cG9g-1; Thu, 01 May 2025 10:07:49 -0400
X-MC-Unique: iq0a9HMlPF-UeoVQD1cG9g-1
X-Mimecast-MFC-AGG-ID: iq0a9HMlPF-UeoVQD1cG9g_1746108468
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ace99fe4282so107621866b.1
        for <linux-media@vger.kernel.org>; Thu, 01 May 2025 07:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108468; x=1746713268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcrNyKhVOmoLr0oSNLK0T/cJNvY0MVzyEpaG1k/ubdI=;
        b=jzgKJBGzK76BkZIT+0ozx/gki+/Su5KXwh0gwP/Tp9dtCRZin7a17DJyB0pkGmr4l8
         hK1QxrLFLSrXKxOVxjGU9SPuN/K7yyY2AhsHmeEziiOcyhS1JUACs3BQPaZsbySnxVbQ
         Y6WH404XNoyY08PVAYCq+L4pfPiQ4iMR7P347dyxtKICDP2lKVMRMPD1Ix/Yn6OAY4Ld
         pEzKhLkjw3vOSD9K2ejmzkSH2RrdCpTzgt5CZTlNy1zqUSMi+v//npAg3nkkrY6WYfVl
         U71uEBccHzFxPPwNCkP2V/l8d8EMzyJCmgT10o0rOZBHLHEItcLclXJ0+/3+MmG7vPBg
         kzOg==
X-Forwarded-Encrypted: i=1; AJvYcCXN5YOBnmFGqQthvX3riyklG2CqHKU9eWoit+9twRMWIBLVsUHGdylu3PZLSV9zam7v+niBtN/L25fcyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAEKsxnn6qyp1OD4EfYTsApAvd+f5KD4Gdsr2Gm+Htjf0m6gC0
	eTrvJ9GD2p9vzZzVNMMywiqXNxDhPXfuKiNxxWRqFyveG9L9LWlwdbZahFa6zcX60k2U53qq5As
	/BrkBd2YWf5RvRlETqVTOGNu+0JTsGRWHbypl0OCtH4X65fqKvkr2E79pHDgg
X-Gm-Gg: ASbGnctJH0oTraoYi9OLgVz+dBmXFMOuFWrIcdzMUFyxsib6Ug724ubUnxpphKmmMpN
	eJO3UnqIJo0LrI0PQHvrDzNlwxRYTaHpFHaovjX98CZXvboo5UKw99fM5u/g4k0qC1JDM9kFy5X
	oUt7NEG98dLiZZNCKQF8zJ4KwhKVP1CXS8vcwPNfRpLGHH2K8G7tz7ZbPK/HBLo+M6H0NrmSuYk
	GzLnzhHMAGoynxBM8hZIviIu+NJVUDFRX27IuVt+K1M6fg30jrT9T6YzN4/mlZxti1Nj8ISxdfC
	tf8TSouT3i5WXjB+EG51ig0MDAGPriTzwNgFpLDx1WQV8Xfu7cUWBZ25GwsgbQh96NNVAnZWxj+
	+r+MOU/iE6PvIf6FyjCxlOaGubbYOQmN8HYlJtKJbidwNLodgA0+4Bk9Vd+lMsw==
X-Received: by 2002:a17:907:bc96:b0:ace:dc05:b186 with SMTP id a640c23a62f3a-aceff3c3dc2mr205251266b.21.1746108467782;
        Thu, 01 May 2025 07:07:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOaCqfR6tnOcmlekhmwPg9qvklGDS8NHNOZ/TTonxjbbreUzOoz/tZ2SucDrZZ+SKYUtYWjA==
X-Received: by 2002:a17:907:bc96:b0:ace:dc05:b186 with SMTP id a640c23a62f3a-aceff3c3dc2mr205246866b.21.1746108467411;
        Thu, 01 May 2025 07:07:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55af28sm44458566b.125.2025.05.01.07.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:07:46 -0700 (PDT)
Message-ID: <829bc6a0-bb93-46db-b039-5df0a68ce0b5@redhat.com>
Date: Thu, 1 May 2025 16:07:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: fix spelling error in
 ia_css_sdis2_types.h
To: Liu Jing <liujing@cmss.chinamobile.com>, andy@kernel.org,
 mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241209064022.4342-1-liujing@cmss.chinamobile.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241209064022.4342-1-liujing@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Dec-24 7:40 AM, Liu Jing wrote:
> fix the coefficients spelling error in ia_css_sdis2_types.h
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
> index f37802878528..2bed08435755 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
> @@ -19,7 +19,7 @@
>  #endif
>  
>  /* DVS 2.0 Coefficient types. This structure contains 4 pointers to
> - *  arrays that contain the coeffients for each type.
> + *  arrays that contain the coefficients for each type.
>   */
>  struct ia_css_dvs2_coef_types {
>  	s16 *odd_real; /** real part of the odd coefficients*/


