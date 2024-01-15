Return-Path: <linux-media+bounces-3706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8D282DA30
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 14:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A7071F2216E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 13:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A4C171BC;
	Mon, 15 Jan 2024 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IWbbnxiO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7FB188
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 13:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705325809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BBJxxUnplwadSkLGEm+QXKXGixIiQ5irF4nD3xyUMBA=;
	b=IWbbnxiO2jySZ66Q/bKJIokgsKrHaSSTj9GZQOWv2fprJ1I4GpCuYMGmJm/5FAhmPP6gT7
	6bQC4varX7sx0LncX4FjzXhHnPUdD0XoL2SggBT3yp7EOS/uGUVEEYYRbkTm4NhVnSoX3D
	UWUi2kXfie7yHDA7rh/rv1pQIXMtXKg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-QiPmcZhRPRCx-gfSG07ivA-1; Mon, 15 Jan 2024 08:36:47 -0500
X-MC-Unique: QiPmcZhRPRCx-gfSG07ivA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a28b20b48a8so419017066b.3
        for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 05:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705325806; x=1705930606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BBJxxUnplwadSkLGEm+QXKXGixIiQ5irF4nD3xyUMBA=;
        b=bDxzIH4vbC7H7uZYXVe3E5ILUanVSXPbVxyPDadot/dXhzjPUAHNL1ot9Rf2BT6UIq
         wI+TC180D8Gliva4LEObjPYeUKZlA/oF+ggsfIfDwdnV8t9mEg5gKWZGeN+OXxyLeC3j
         UTgJv9ibbRyKYUOBNurSEAtFhC62eXp6gYMq7HSCENg13Pc7uGumfM8mqiPN4rkXKeW1
         yEs9OQU221Ku6Fpn9vLMEbU5wAvA2giWPKQWIHTb5BgOcrKEFHk7JcX7N48sqKmLWmK3
         lmtDgwE3dvD9tnQ4y/YI7jiVC0/u0VKjTTpxWnS6LVtgLdJHYi9N7uSphuNJYGj4NEXQ
         GYvA==
X-Gm-Message-State: AOJu0Yy1mqwiDZsJP+eBCsqCrb0gLGI5yFLJjpanau1G0GaJscjd63mH
	c6EjsxIrFyVFZWmF2miyGCfmYUeXWYHfppU9tbbBZfUE4Ul0UvHksnqM0Dpho2RHnxKxTTiFdrc
	MCGoS5Zvq/0iXU5f3w64LLS5T50UMVzI=
X-Received: by 2002:a17:906:1558:b0:a26:b86e:2b0f with SMTP id c24-20020a170906155800b00a26b86e2b0fmr2271756ejd.127.1705325806753;
        Mon, 15 Jan 2024 05:36:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzrRPimMmU/9Mls0GmFvs6BoucW9y5c6rwGOqvDDa5TZqQmcixPxGagr+a/ySlhKieiew+kw==
X-Received: by 2002:a17:906:1558:b0:a26:b86e:2b0f with SMTP id c24-20020a170906155800b00a26b86e2b0fmr2271717ejd.127.1705325804838;
        Mon, 15 Jan 2024 05:36:44 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id h20-20020a170906261400b00a28d438a1b0sm5270606ejc.83.2024.01.15.05.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 05:36:44 -0800 (PST)
Message-ID: <e16874f9-cc9b-405f-9618-3f955e205f42@redhat.com>
Date: Mon, 15 Jan 2024 14:36:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/17] media: intel/ipu6: add Intel IPU6 PCI device
 driver
Content-Language: en-US
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 andriy.shevchenko@linux.intel.com, hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
 senozhatsky@chromium.org, andreaskleist@gmail.com,
 bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <20240111065531.2418836-2-bingbu.cao@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240111065531.2418836-2-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/11/24 07:55, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Intel Image Processing Unit 6th Gen includes input and processing systems
> but the hardware presents itself as a single PCI device in system.
> 
> IPU6 PCI device driver basically does PCI configurations and load
> the firmware binary, initialises IPU virtual bus, and sets up platform
> specific variants to support multiple IPU6 devices in single device
> driver.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>

Just one small thing I noticed, not a full review.

<snip>

> +static u32 ipu6se_csi_offsets[] = {
> +	IPU6_CSI_PORT_A_ADDR_OFFSET,
> +	IPU6_CSI_PORT_B_ADDR_OFFSET,
> +	IPU6_CSI_PORT_C_ADDR_OFFSET,
> +	IPU6_CSI_PORT_D_ADDR_OFFSET
> +};
> +
> +/*
> + * IPU6 on TGL support maximum 8 csi2 ports
> + * IPU6SE on JSL and IPU6EP on ADL support maximum 4 csi2 ports
> + * IPU6EP on MTL support maximum 6 csi2 ports
> + */
> +static u32 ipu6_tgl_csi_offsets[] = {
> +	IPU6_CSI_PORT_A_ADDR_OFFSET,
> +	IPU6_CSI_PORT_B_ADDR_OFFSET,
> +	IPU6_CSI_PORT_C_ADDR_OFFSET,
> +	IPU6_CSI_PORT_D_ADDR_OFFSET,
> +	IPU6_CSI_PORT_E_ADDR_OFFSET,
> +	IPU6_CSI_PORT_F_ADDR_OFFSET,
> +	IPU6_CSI_PORT_G_ADDR_OFFSET,
> +	IPU6_CSI_PORT_H_ADDR_OFFSET
> +};
> +
> +static u32 ipu6ep_mtl_csi_offsets[] = {
> +	IPU6_CSI_PORT_A_ADDR_OFFSET,
> +	IPU6_CSI_PORT_B_ADDR_OFFSET,
> +	IPU6_CSI_PORT_C_ADDR_OFFSET,
> +	IPU6_CSI_PORT_D_ADDR_OFFSET,
> +	IPU6_CSI_PORT_E_ADDR_OFFSET,
> +	IPU6_CSI_PORT_F_ADDR_OFFSET
> +};
> +
> +static u32 ipu6_csi_offsets[] = {
> +	IPU6_CSI_PORT_A_ADDR_OFFSET,
> +	IPU6_CSI_PORT_B_ADDR_OFFSET,
> +	IPU6_CSI_PORT_C_ADDR_OFFSET,
> +	IPU6_CSI_PORT_D_ADDR_OFFSET
> +};

These 4 arrays all are the same, except for their lengths.

Please just use a single array wuth the full 8 A-H
entries and then just directly code the amount of ports
here:

> +static void ipu6_internal_pdata_init(struct ipu6_device *isp)
> +{
<snip>

> +	isys_ipdata.csi2.nports = ARRAY_SIZE(ipu6_csi_offsets);

So put the default 4 here instead of ARRAY_SIZE(),

<snip>

> +	if (is_ipu6_tgl(hw_ver)) {
> +		isys_ipdata.csi2.nports = ARRAY_SIZE(ipu6_tgl_csi_offsets);

and then put 8 here instead of ARRAY_SIZE(), etc.

Then there no longer is a need to have 4 different arrays just
to have them a different lenght.

And this line:

> +		isys_ipdata.csi2.offsets = ipu6_tgl_csi_offsets;

Can then be fully dropped as well as similar lines below.


> +	}
> +
> +	if (is_ipu6ep_mtl(hw_ver)) {
> +		isys_ipdata.csi2.nports = ARRAY_SIZE(ipu6ep_mtl_csi_offsets);
> +		isys_ipdata.csi2.offsets = ipu6ep_mtl_csi_offsets;

E.g. this one can also be dropped.

Regards,

Hans






