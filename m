Return-Path: <linux-media+bounces-24830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86543A136EB
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 10:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 862913A057A
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 09:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B160E1DC9BE;
	Thu, 16 Jan 2025 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cH6ET3xc"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6DD19E98A
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737020847; cv=none; b=jq/p9OcOlkpSIeDkrnoW2OwGPOMSGgtZgcdb7eJEX3wDOHYjwY8kUj2k6EZCatvDd972G2GsTVECPZ34xwMeplD08t/Pk/LnfsTRsAHDDFe8Ro1EzqPBt2NFMoStAHmehECZROB3SW/wGXFapNlvZVbalpmFW1AmS68j+rzs3JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737020847; c=relaxed/simple;
	bh=j5HWL9byI1Kk9GZc2O9n069fGllRJsIhNQHS/O0RTDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xd1SYWrpE8qLacgHpIJmriM54XdM8POpRi+VuZf39HpqsxtNeN2OJ0Ivs5MEpU8TkReEt7fzGAElehjYDZCwGRRvLWvLiXiM0OqrJhxKg48BDdK7fGCB10Dtbl6oiy/jJ2Qi87bxfhGr2GFrFNqtuvGVeaj6dm0Sl3FfGS6pN58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cH6ET3xc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737020844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dod0g81n58haQni7iVU931jn6ac7QbIR2eHCRhhlbDQ=;
	b=cH6ET3xcxkdux4k/D1VDglDgcpXIXt5WVc7TfhA2BJSc39jFQ4oz4di8KqqEWxIFHqXjbU
	MVZXCfpPORVB8wnpKnFcLOYapBYHTEHowMwNPTQmkZRJIPR/wTtNGBVfDNnXf5tpqrfkdL
	56NHVpsqtdX0hTdx1szRR+mGy2NKCJ8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-o0tQXtF2NaOQWUEziUKCsw-1; Thu, 16 Jan 2025 04:47:22 -0500
X-MC-Unique: o0tQXtF2NaOQWUEziUKCsw-1
X-Mimecast-MFC-AGG-ID: o0tQXtF2NaOQWUEziUKCsw
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa691c09772so65193666b.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 01:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737020841; x=1737625641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dod0g81n58haQni7iVU931jn6ac7QbIR2eHCRhhlbDQ=;
        b=OD6buBF+wl1cIw2i2XXxtWK+1GwShVT88TqgK3sNdNZcQ1hea2f8FWMEJfZAy+KOsp
         rOSs0VC5jl+YfGJpjhnWsiYjgqCXXmLByd/OZpgDQ+OXqly0de5dkbj3fwekMfCzdWSU
         8qURXYtx/nitLlyA8oY8gEoebGMooJiJM0/kAI5VtBkM1Y1nISHN4pfM8FuqOiSzqiaM
         aChqdWoXs+8r2XEeQpGnLTn9FcN4Doaa3WmyVHD6PnVs1aGPHBp7ZNq5OzFnA6Ed9mFp
         gNkeLVHeGHte1y4ac7AlW+1ZwDZIlEzm/gRG+nUyYL5T51XKle0WOIvfauMVfQy1ysvb
         p2yQ==
X-Gm-Message-State: AOJu0YzWXUuueDbcDJuNtXj3CTB+arSGgGA7xdbHJdI+jzscOu5hk0k9
	Gx2sxaFYBNA0pNPqXmwJ4sK6+lYwh+ApiQydLerEjXcfyXbeteYdgkwj8mdD8zNPxKHWyPfKQAz
	dP8q5+CblQn5FVkxddyPaFNDT7wkNTrQQ8pDjjQqFiQ/mTaKfL37xZO6OVp44
X-Gm-Gg: ASbGncsv+pbVNG/IHlUyfeFVi7cye27vn/0UDX8e3798rQ4vbU067xMwbFcgeRuuTTj
	93FYNdOqHH5m+bCT0I1zpBsjYlcpNjo9YiqNvgxMn2AC9srV8YMKSsH+eYO3B4Uu2GUlbC5+zVV
	Q4jETFGOFU5GUqz+ay6MiH/aopgPNwwk3p4B4qwgJTjGguAsYrBBWmP4FtG4jQiCscN3tLdDJBM
	DA0Zkxi04VPr+JiUSMqHBqrG0YJGtOuEyurteenSraGS99k61DQPec6KrKKCl6E
X-Received: by 2002:a17:907:c0c:b0:aae:8490:9429 with SMTP id a640c23a62f3a-ab2ab6fd4c3mr3086063966b.34.1737020841106;
        Thu, 16 Jan 2025 01:47:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi5YyELOilmxcNvGHhZdjuXJ76Bcgc+Q/xijiS9vQlmiIi28qauH5Bqa7UAQu9hPe/bLqKFQ==
X-Received: by 2002:a17:907:c0c:b0:aae:8490:9429 with SMTP id a640c23a62f3a-ab2ab6fd4c3mr3086061866b.34.1737020840725;
        Thu, 16 Jan 2025 01:47:20 -0800 (PST)
Received: from [192.168.101.224] ([109.38.130.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95647b6sm881998866b.115.2025.01.16.01.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 01:47:20 -0800 (PST)
Message-ID: <b4a5cb71-b982-42fb-a1d0-c9b2a2e85a7b@redhat.com>
Date: Thu, 16 Jan 2025 10:47:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] media: i2c: Add Omnivision OV02C10 sensor driver
To: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 sakari.ailus@linux.intel.com, hao.yao@intel.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, joachim.reichel@posteo.de
References: <20241219175128.40871-1-heimir.sverrisson@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241219175128.40871-1-heimir.sverrisson@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Heimir,

On 19-Dec-24 6:51 PM, Heimir Thor Sverrisson wrote:
> Add a new driver for the Omnivision OV02C10 camera sensor. This is based
> on the out of tree driver by Hao Yao <hao.yao@intel.com> from:
> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c
> 
> This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI
> driver and the libcamera software ISP code.
> 
> Tested-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
> Signed-off-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>

First of all thank you for your work on cleaning up this driver.

I have done a quick review and I noticed 2 things which need to be
addressed, see comment inline below.

When you've time please submit a v7 with this fixed and also add the
Tested-by tags given in this v6 email-thread.

> ---
>  drivers/media/i2c/Kconfig   |   10 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/ov02c10.c | 1322 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1333 insertions(+)
>  create mode 100644 drivers/media/i2c/ov02c10.c

<snip>

> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> new file mode 100644
> index 000000000000..03646cabed15
> --- /dev/null
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -0,0 +1,1322 @@

<snip>

> +static int ov02c10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +
> +	mutex_lock(&ov02c10->mutex);
> +	ov02c10_update_pad_format(&supported_modes[0],
> +				  v4l2_subdev_state_get_format(fh->state, 0));
> +	mutex_unlock(&ov02c10->mutex);
> +	return 0;
> +}

There are 2 issues with this:

1. Since it only touches the fh state (the ov02c10 pointer is only used for the mutex)
locking the mutex is not necessary, so the locking can be dropped
(and that is dropped the ov02c10 pointer can also be dropped).

2. This is not the place to init the fh state, the fh-state should be initialized
through the v4l2_subdev_internal_ops.init_state operand / function pointer instead
of through the v4l2_subdev_internal_ops.open op.

See: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/ov2680.c#n790

<snip>

> +static const struct v4l2_subdev_internal_ops ov02c10_internal_ops = {
> +	.open = ov02c10_open,

As mentioned above this should be init_state instead.

> +};
> +
> +static int ov02c10_read_mipi_lanes(struct ov02c10 *ov02c10, struct device *dev)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	int ret = 0;
> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -ENXIO;
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;

The calling of fwnode_graph_get_next_endpoint() +
v4l2_fwnode_endpoint_alloc_parse() is already done in
ov02c10_check_hwcfg().

Please modify ov02c10_check_hwcfg() to take an additonal
struct ov02c10 *ov02c10 argument and then do the checking
+ storing of .num_data_lanes there and drop this function
(as well as the calling of this function.

> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
> +	    bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +		dev_err(dev, "number of CSI2 data lanes %d is not supported",
> +			bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		return(-EINVAL);
> +	}
> +	ov02c10->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
> +	return ret;
> +}

<snip>

Regards,

Hans



