Return-Path: <linux-media+bounces-15997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D092094BEF8
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 16:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82F602823A8
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 14:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2D218E745;
	Thu,  8 Aug 2024 14:02:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3628129AF
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723125723; cv=none; b=QDWwcUJ2gbCQxY/8uiJgAjzgFwY7oM5lQOtM3WoJhExc7xhwhKT30PLMIsavTu+nT1PO3lsgb+5iDhwMh0mYoEkGlgh9cv1cVqmOzwczcAxk7O5T1DlJ2rjYG6OxbAx/fYmuin/klvu5nGworroo0CyKgYVovWCHn/zSOhp/OuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723125723; c=relaxed/simple;
	bh=AWWwTDN4OXkfXv9ZY/qaJNrq4vJjyWGYyjFhIDlpZ30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWvWHDgs4lQe/6Q8L0cNy7tGzoh5u9PMDdysqqGYb6xmM0qz6Z7qET1QvPwGs6Uum3JeXHvvEBCo0bbIDpuLUBXY5VTglYJlibzpdcnJjpBc9nYedU+0qQRP0ZgE95rjBJRMykc7htq7qd5X6K1piAYTSKKsG69il+v5jUdZqZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981A5C32782;
	Thu,  8 Aug 2024 14:02:00 +0000 (UTC)
Message-ID: <7cbf9ca9-25fe-4ca5-8ac9-c029508e3a70@xs4all.nl>
Date: Thu, 8 Aug 2024 16:01:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/12] media: uapi: rkisp1-config: Add extensible
 params format
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@iki.fi>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240807212253.1667847-1-jacopo.mondi@ideasonboard.com>
 <20240807212253.1667847-2-jacopo.mondi@ideasonboard.com>
 <5497762f-5959-4890-b02a-176377042387@xs4all.nl>
 <ctpmtoqun2isj2jxer4z4mlvhqzi532j43cejbkhid375fxelt@dg763qf5wtjd>
 <1662108d-24b6-427b-849a-fd0a4107c3e6@xs4all.nl>
 <20240808095438.GB21245@pendragon.ideasonboard.com>
 <a0f0c7d3-8647-49d7-9efc-8c0b8624094a@xs4all.nl>
 <20240808105123.GB5833@pendragon.ideasonboard.com>
 <eb6458f2-2416-46ab-91c6-748561036a77@xs4all.nl>
 <vucgdxhgoqm5ij4sjwsrjfsvza2m3ts3yprjcwhc3ampv2mjqf@mrc4tke6unq2>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <vucgdxhgoqm5ij4sjwsrjfsvza2m3ts3yprjcwhc3ampv2mjqf@mrc4tke6unq2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/08/2024 14:03, Jacopo Mondi wrote:
> Hi Hans
> 
> On Thu, Aug 08, 2024 at 12:58:46PM GMT, Hans Verkuil wrote:

<snip>

>>>>>>>> I see no check against this in the rkisp1 code. Shouldn't this be checked?
>>>>>>>> If the version is unsupported, then just return an error.
>>>>>>>
>>>>>>> Do we need this for the first version ? There are no other versions
>>>>>>> userspace can use at the moment. I can add a check during validation
>>>>>>> though.
>>>>>>
>>>>>> Yes: if a V2 is added in the future, and an application wants to use that
>>>>>> against a driver that only support V1, then that should fail.
>>>>>>
>>>>>>>> Also, how does userspace know which version(s) is/are supported by the driver?
>>>>>>>
>>>>>>> Good question, there is no API for that atm. Defining a new format
>>>>>>> version should only happen when a non-backward compatible change to
>>>>>>> the format is made. I understand an application can be compiled
>>>>>>> against a newer kernel header that provides a new format version but
>>>>>>> then run on an older kernel where the new format is not supported.
>>>>>>>
>>>>>>> Probably userspace should be able to identify what versions are
>>>>>>> supported by the driver it runs with and use the most appropriate one
>>>>>>> by selecting it at runtime.
>>>>>>>
>>>>>>> What API would you use for that ? Is this something required for this
>>>>>>> first version where a single format version is available ?
>>>>>>
>>>>>> You need this also for this first version for the reason explained above.
>>>>>>
>>>>>> Personally I would just make a read-only control that returns the highest
>>>>>> supported version.
>>>>>
>>>>> Can't userspace use the version number reported through the media device
>>>>> to determine the features the driver support ? We've done that in
>>>>> libcamera for some drivers already, either to work around bugs, or to
>>>>> make use of new features.
>>>>
>>>> You can, but this will fall down if the driver is backported to an older
>>>> kernel for whatever reason. Since the version is just the kernel version,
>>>> it will drop back to that older kernel version.
>>>
>>> I recall discussing this issue in the past (I'm not sure it was with
>>> you). If my memory doesn't fail me, there was a consensus that, when
>>> backporting the whole V4L2 subsystem, the version number reported would
>>> tbe the one corresponding to the more recent kernel, not the kernel the
>>> code has been backported to.
>>
>> That was when using the old https://git.linuxtv.org/media_build.git/ system.
>> That's no longer in use.
>>
>> I'm talking if a vendor is on an old kernel and backports rkisp1 to it (not
>> exactly uncommon!), then this will not work since the version will be that
>> of the old kernel.
>>
> 
> In this case it will backport the driver and the uAPI from the same
> version, so this shouldn't be an issue.
> 
> What is concerning is an application compiled against a uAPI newer
> than the kernel it will be run on. The uAPI could advertise newer
> format revisions the driver doesn't know about and will fail to
> validate. In this case the application should be give a way to know
> what version is the most recent one supported by the driver, and a
> control might be the way forward. As long as we have a single format
> revision I think we might omit implementing the control for now and
> only expose it when multiple revisions will be implemented ? If the
> control is not there, it means only V1 is available. Should I document
> it ?

I think it is sufficient for now to just add a version check in the driver
and return an error if it is not supported.

And when a V2 is introduced, then we can think about using a control. Or
perhaps just rely on the version check.

Regards,

	Hans

> 
>> Regards,
>>
>> 	Hans
>>
>>>
>>> That would help here, but will not solve the issue of how to deal with
>>> backports of a single driver. Jacopo, what do you think ?
>>>
>>>> Whether that is acceptable or not is up to you.
>>>>
>>>> In any case, this would have to be documented so you know at which kernel
>>>> version a new RKISP1_EXT_PARAM_BUFFER_Vx is introduced.
>>>>
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +/**
>>>>>>>>> + * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
>>>>>>>>> + *
>>>>>>>>> + * This struct contains the configuration parameters of the RkISP1 ISP
>>>>>>>>> + * algorithms, serialized by userspace into a data buffer. Each configuration
>>>>>>>>> + * parameter block is represented by a block-specific structure which contains a
>>>>>>>>> + * :c:type:`rkisp1_ext_params_block_header` entry as first member. Userspace
>>>>>>>>> + * populates the @data buffer with configuration parameters for the blocks that
>>>>>>>>> + * it intends to configure. As a consequence, the data buffer effective size
>>>>>>>>> + * changes according to the number of ISP blocks that userspace intends to
>>>>>>>>> + * configure and is set by userspace in the @data_size field.
>>>>>>>>> + *
>>>>>>>>> + * The parameters buffer is versioned by the @version field to allow modifying
>>>>>>>>> + * and extending its definition. Userspace shall populate the @version field to
>>>>>>>>> + * inform the driver about the version it intends to use. The driver will parse
>>>>>>>>> + * and handle the @data buffer according to the data layout specific to the
>>>>>>>>> + * indicated version and return an error if the desired version is not
>>>>>>>>> + * supported.
>>>>>>>>> + *
>>>>>>>>> + * For each ISP block that userspace wants to configure, a block-specific
>>>>>>>>> + * structure is appended to the @data buffer, one after the other without gaps
>>>>>>>>> + * in between nor overlaps. Userspace shall populate the @data_size field with
>>>>>>>>> + * the effective size, in bytes, of the @data buffer.
>>>>>>>>> + *
>>>>>>>>> + * The expected memory layout of the parameters buffer is::
>>>>>>>>> + *
>>>>>>>>> + *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
>>>>>>>>> + *	| version = RKISP_EXT_PARAMS_BUFFER_V1;                               |
>>>>>>>>> + *	| data_size = sizeof(struct rkisp1_ext_params_bls_config)             |
>>>>>>>>> + *	|           + sizeof(struct rkisp1_ext_params_dpcc_config);           |
>>>>>>>>> + *	| +------------------------- data  ---------------------------------+ |
>>>>>>>>> + *	| | +------------- struct rkisp1_ext_params_bls_config -----------+ | |
>>>>>>>>> + *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
>>>>>>>>> + *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS;                | | | |
>>>>>>>>> + *	| | | | flags = RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE;              | | | |
>>>>>>>>> + *	| | | | size = sizeof(struct rkisp1_ext_params_bls_config);     | | | |
>>>>>>>>> + *	| | | +---------------------------------------------------------+ | | |
>>>>>>>>> + *	| | | +---------- struct rkisp1_cif_isp_bls_config -------------+ | | |
>>>>>>>>> + *	| | | | enable_auto = 0;                                        | | | |
>>>>>>>>> + *	| | | | fixed_val.r = 256;                                      | | | |
>>>>>>>>> + *	| | | | fixed_val.gr = 256;                                     | | | |
>>>>>>>>> + *	| | | | fixed_val.gb = 256;                                     | | | |
>>>>>>>>> + *	| | | | fixed_val.b = 256;                                      | | | |
>>>>>>>>> + *	| | | +---------------------------------------------------------+ | | |
>>>>>>>>> + *	| | +------------ struct rkisp1_ext_params_dpcc_config -----------+ | |
>>>>>>>>> + *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
>>>>>>>>> + *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC;               | | | |
>>>>>>>>> + *	| | | | flags = RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE;              | | | |
>>>>>>>>> + *	| | | | size = sizeof(struct rkisp1_ext_params_dpcc_config);    | | | |
>>>>>>>>> + *	| | | +---------------------------------------------------------+ | | |
>>>>>>>>> + *	| | | +---------- struct rkisp1_cif_isp_dpcc_config ------------+ | | |
>>>>>>>>> + *	| | | | mode = RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE;          | | | |
>>>>>>>>> + *	| | | | output_mode =                                           | | | |
>>>>>>>>> + *	| | | |   RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_G_CENTER; | | | |
>>>>>>>>> + *	| | | | set_use = ... ;                                         | | | |
>>>>>>>>> + *	| | | | ...  = ... ;                                            | | | |
>>>>>>>>> + *	| | | +---------------------------------------------------------+ | | |
>>>>>>>>> + *	| | +-------------------------------------------------------------+ | |
>>>>>>>>> + *	| +-----------------------------------------------------------------+ |
>>>>>>>>> + *	+---------------------------------------------------------------------+
>>>>>>>>> + *
>>>>>>>>> + * @version: The RkISP1 extensible parameters buffer version, see
>>>>>>>>> + *	     :c:type:`rksip1_ext_param_buffer_version`
>>>>>>>>> + * @data_size: The RkISP1 configuration data effective size, excluding this
>>>>>>>>> + *	       header
>>>>>>>>> + * @data: The RkISP1 extensible configuration data blocks
>>>>>>>>> + */
>>>>>>>>> +struct rkisp1_ext_params_cfg {
>>>>>>>>> +	__u32 version;
>>>>>>>>> +	__u32 data_size;
>>>>>>>>> +	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>>  #endif /* _UAPI_RKISP1_CONFIG_H */
>>>>>
>>>>
>>>
>>


