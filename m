Return-Path: <linux-media+bounces-8764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ACC89A23D
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 18:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25F23282E72
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 16:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B4417108D;
	Fri,  5 Apr 2024 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XyIx3Y0x"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED29217108B
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 16:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712333714; cv=none; b=IG18dNj/4jmx28VRBVMRPlpNl3CQGqaRIIkXvmdxvMM5HMHjxpjoMscIkXsXIkG+kSMp6awXnc/8UgXSAjYc4OtLtvtLIKZ6aBnHS2F8kwABovVY9nk7k+BvaoZimEFQFK9nHS5xSA1fqumh4yKfqScfMbkd7K5ahatFhdH69+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712333714; c=relaxed/simple;
	bh=EmwZWNCUtTXOp/06ywpzpY4S4khYyWg3PlzvRCXmELM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXPcUhRszS/V9BsP0vJ2BUhupjqjn6ZPUdaeckPVtlnWyRgXbOQRc0qJZsjygkawS8ZR9zqp5f4ILzG6a/Ba8gryC3MDaD4AnDw/0vEOyoZPZAjVn/Ew4uK2WOOFEB+E/Q/DfBLljj8ytDiASF1zbsj8S+7jO7Y1xrMXrUwSoaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XyIx3Y0x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712333711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e3uyJWTox08bgDQO6QMdhD99Thi4BOyEc7+yAlbzlMM=;
	b=XyIx3Y0x1WiGV6asUegSYVvkthlIL5ThsSLYH+qPZJ47kkThxWYK8674wRowuqJeDVKaZ+
	hXxeH8N6mYmNKLREvS3QE0Ug8XrR+lsEGgbNFpd9VDENStveMBVRtwQLWVnoYPIvcKo3pe
	R16m460JkQbqybyhAVtOh/sjvJscYik=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-Dr0lUO7LPv6YRU3FEuooMw-1; Fri, 05 Apr 2024 12:15:10 -0400
X-MC-Unique: Dr0lUO7LPv6YRU3FEuooMw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-343c8e87a74so1159270f8f.0
        for <linux-media@vger.kernel.org>; Fri, 05 Apr 2024 09:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712333709; x=1712938509;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3uyJWTox08bgDQO6QMdhD99Thi4BOyEc7+yAlbzlMM=;
        b=wund4xDIAF68bpJ3rzZViYSghZpp+9gI9TLXpEcVCMDu4XVEVNcZh6/haJLSg5Bkro
         1pUMGJSfPrZM9XWTUOgaxlvbCpodO20xADPNIq55bc/QzshXKWaIPzGCGQJtYC6OGSGJ
         +eq0l/61WLTqlJxAB5prKxfe3pN1r9XDUi4fh7lBucl47wsVU2hlIjzM82WV8ATi6Nbw
         wnZ7sYGHCU8hQNS6imV8/mjMCp8G1cRgRgOLCL3S3mqtMaiyGL4NXv7u+yUuOI9rBcN6
         w58ki6OFpiHZZTeMLdEpuxbPpCpylTyw79OglzyMVk4xizO2vFBgSgPwGAORgEq8WfaA
         j/3g==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2ueV/053U6ceogXSpVERmb8CIwPskxnndIruY1KGdv5/zYMGQLhrwgUKb9tAsulQhfKd1V+nN4HiOMm0g1TojAN2fDcwFd9YexM=
X-Gm-Message-State: AOJu0Yz1aOMlKDP9Nupg/RohdLUu7VJa05o0Yyc9rPzYHklgR1IRkWZC
	C0UGUW4obkUwGIaLWF8osGO0vO2E9lwNNIYzKfNzOa0VWFGjDa8LIIvOBk4wdQt98+Yuoj6D7m5
	DE0fwzMWKWUI2Q3XRsshpoC7lzZ4BK5Yw7jip86QnlINu/y1HfSf2e7zACRta
X-Received: by 2002:adf:fd91:0:b0:343:a8cb:7990 with SMTP id d17-20020adffd91000000b00343a8cb7990mr1723888wrr.29.1712333709178;
        Fri, 05 Apr 2024 09:15:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7SsthB7f11+Y2VqpY8ttIHc1MKy4ey8WFAvTSqfXlcIyaoE5uqq5I6hsLY2n7Au7e11v69w==
X-Received: by 2002:adf:fd91:0:b0:343:a8cb:7990 with SMTP id d17-20020adffd91000000b00343a8cb7990mr1723863wrr.29.1712333708802;
        Fri, 05 Apr 2024 09:15:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id u26-20020adfa19a000000b0033e25c39ac3sm2373644wru.80.2024.04.05.09.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 09:15:08 -0700 (PDT)
Message-ID: <4dc6fb16-3d85-4a7f-85f9-ed249da0df1a@redhat.com>
Date: Fri, 5 Apr 2024 18:15:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 13/14] drm/nouveau: Make I2C terminology more inclusive
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-14-eahariha@linux.microsoft.com>
Content-Language: en-US
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240329170038.3863998-14-eahariha@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Easwar,

On 3/29/24 18:00, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.
> 
> Compile tested, no functionality changes intended
> 
> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   drivers/gpu/drm/nouveau/dispnv04/dfp.c             | 14 +++++++-------
>   .../gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_bios.c             |  4 ++--
>   3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> index d5b129dc623b..65b791006b19 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
> @@ -149,7 +149,7 @@ void nv04_dfp_update_fp_control(struct drm_encoder *encoder, int mode)
>   	}
>   }
>   
> -static struct drm_encoder *get_tmds_slave(struct drm_encoder *encoder)
> +static struct drm_encoder *get_tmds_client(struct drm_encoder *encoder)
>   {
>   	struct drm_device *dev = encoder->dev;
>   	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
> @@ -172,7 +172,7 @@ static struct drm_encoder *get_tmds_slave(struct drm_encoder *encoder)
>   		struct dcb_output *slave_dcb = nouveau_encoder(slave)->dcb;
>   
>   		if (slave_dcb->type == DCB_OUTPUT_TMDS && get_slave_funcs(slave) &&
> -		    slave_dcb->tmdsconf.slave_addr == dcb->tmdsconf.slave_addr)
> +		    slave_dcb->tmdsconf.client_addr == dcb->tmdsconf.client_addr)
>   			return slave;

While, personally, I think master/slave was well suiting for the device relationship
on those busses, I think that if we change it up to conform with the change in
specification, we should make sure to update drivers consistently.

We should make sure to also change the names of the sourrounding structures and variable
names, otherwise we just make this code harder to read.

- Danilo

>   	}
>   
> @@ -471,7 +471,7 @@ static void nv04_dfp_commit(struct drm_encoder *encoder)
>   		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv04_dac_output_offset(encoder), 0x00100000);
>   
>   	/* Init external transmitters */
> -	slave_encoder = get_tmds_slave(encoder);
> +	slave_encoder = get_tmds_client(encoder);
>   	if (slave_encoder)
>   		get_slave_funcs(slave_encoder)->mode_set(
>   			slave_encoder, &nv_encoder->mode, &nv_encoder->mode);
> @@ -621,7 +621,7 @@ static void nv04_dfp_destroy(struct drm_encoder *encoder)
>   	kfree(nv_encoder);
>   }
>   
> -static void nv04_tmds_slave_init(struct drm_encoder *encoder)
> +static void nv04_tmds_client_init(struct drm_encoder *encoder)
>   {
>   	struct drm_device *dev = encoder->dev;
>   	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
> @@ -632,7 +632,7 @@ static void nv04_tmds_slave_init(struct drm_encoder *encoder)
>   		{
>   		    {
>   		        .type = "sil164",
> -		        .addr = (dcb->tmdsconf.slave_addr == 0x7 ? 0x3a : 0x38),
> +		        .addr = (dcb->tmdsconf.client_addr == 0x7 ? 0x3a : 0x38),
>   		        .platform_data = &(struct sil164_encoder_params) {
>   		            SIL164_INPUT_EDGE_RISING
>   		         }
> @@ -642,7 +642,7 @@ static void nv04_tmds_slave_init(struct drm_encoder *encoder)
>   	};
>   	int type;
>   
> -	if (!nv_gf4_disp_arch(dev) || !bus || get_tmds_slave(encoder))
> +	if (!nv_gf4_disp_arch(dev) || !bus || get_tmds_client(encoder))
>   		return;
>   
>   	type = nvkm_i2c_bus_probe(bus, "TMDS transmitter", info, NULL, NULL);
> @@ -716,7 +716,7 @@ nv04_dfp_create(struct drm_connector *connector, struct dcb_output *entry)
>   
>   	if (entry->type == DCB_OUTPUT_TMDS &&
>   	    entry->location != DCB_LOC_ON_CHIP)
> -		nv04_tmds_slave_init(encoder);
> +		nv04_tmds_client_init(encoder);
>   
>   	drm_connector_attach_encoder(connector, encoder);
>   	return 0;
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h
> index 73f9d9947e7e..5da40cf74b1a 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/dcb.h
> @@ -50,7 +50,7 @@ struct dcb_output {
>   		} dpconf;
>   		struct {
>   			struct sor_conf sor;
> -			int slave_addr;
> +			int client_addr;
>   		} tmdsconf;
>   	};
>   	bool i2c_upper_default;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index 479effcf607e..a91a5d3df3ca 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -1511,9 +1511,9 @@ parse_dcb20_entry(struct drm_device *dev, struct dcb_table *dcb,
>   			link = entry->tmdsconf.sor.link;
>   		}
>   		else if (dcb->version >= 0x30)
> -			entry->tmdsconf.slave_addr = (conf & 0x00000700) >> 8;
> +			entry->tmdsconf.client_addr = (conf & 0x00000700) >> 8;
>   		else if (dcb->version >= 0x22)
> -			entry->tmdsconf.slave_addr = (conf & 0x00000070) >> 4;
> +			entry->tmdsconf.client_addr = (conf & 0x00000070) >> 4;
>   		break;
>   	case DCB_OUTPUT_EOL:
>   		/* weird g80 mobile type that "nv" treats as a terminator */


