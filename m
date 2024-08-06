Return-Path: <linux-media+bounces-15827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F19948B08
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 10:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B23F1F21C86
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 08:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744A3166F36;
	Tue,  6 Aug 2024 08:17:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDEF5464E
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722932226; cv=none; b=j2YCYjbfpG1BxOwwLq0+rYIeempYE3ogWY/qMCuLU01/hsqt91EUotfQ6NPi4jsWaEFrymcWKbax+y3FVokB5gBNCKU88ghgzY8a7VQTDHF9tKmGhnH7FDFmM/aAL1pD5rjh4anBV2ALDSTgKDi6i2xyUmJgCY1sQaionoh1cbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722932226; c=relaxed/simple;
	bh=EUdTBKbBwLamhSl4qkVY93qeLbVW+40PFNIInjdkFV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nPuHTfiMkWz0bXwpsfTvYLcDDtAVKQK1v5/kYB8cuL3FxnvkoJyzZbTz0cjJajiewscSZ7eXtPlix6mEeQOwTQgaTSfrWcX4UzMPmmdJt+BwzZQyF+vD6IL1uhAGxnkSid7RN4qowHqGRrbx6n/4rXARqL+mOlowQPYhYD9yMJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3860C32786;
	Tue,  6 Aug 2024 08:17:03 +0000 (UTC)
Message-ID: <40bf283c-7d6f-4864-a90c-a765b52dc264@xs4all.nl>
Date: Tue, 6 Aug 2024 10:17:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/12] media: uapi: rkisp1-config: Add extensible
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
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20240724085004.82694-1-jacopo.mondi@ideasonboard.com>
 <20240724085004.82694-2-jacopo.mondi@ideasonboard.com>
 <782e20b3-6a4d-45fb-bcee-b3e92fa16719@xs4all.nl>
 <20240730121845.GJ1552@pendragon.ideasonboard.com>
 <719befce-a50a-4128-b8f5-82bff009c361@xs4all.nl>
 <mge3iac6oh7wxqgppxyy47oghw7rgtp7jun36hnjvxkwgw7yv2@2gw6qym7mczm>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <mge3iac6oh7wxqgppxyy47oghw7rgtp7jun36hnjvxkwgw7yv2@2gw6qym7mczm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2024 09:27, Jacopo Mondi wrote:
> Hi Hans, Laurent
> 
> On Tue, Jul 30, 2024 at 02:37:04PM GMT, Hans Verkuil wrote:
>> On 30/07/2024 14:18, Laurent Pinchart wrote:
>>> Hi Hans,
>>>
>>> On Tue, Jul 30, 2024 at 02:11:12PM +0200, Hans Verkuil wrote:
>>>> On 24/07/2024 10:49, Jacopo Mondi wrote:
>>>>> Add to the rkisp1-config.h header data types and documentation of
>>>>> the extensible parameters format.
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
>>>>> ---
>>>>>  include/uapi/linux/rkisp1-config.h | 489 +++++++++++++++++++++++++++++
>>>>>  1 file changed, 489 insertions(+)
>>>>>
>>>>> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
>>>>> index 6eeaf8bf2362..00b09c92cca7 100644
>>>>> --- a/include/uapi/linux/rkisp1-config.h
>>>>> +++ b/include/uapi/linux/rkisp1-config.h
>>>>> @@ -996,4 +996,493 @@ struct rkisp1_stat_buffer {
>>>>>  	struct rkisp1_cif_isp_stat params;
>>>>>  };
>>>>>
>>>>> +/*---------- PART3: Extensible Configuration Parameters  ------------*/
>>>>> +
>>>>> +/**
>>>>> + * enum rkisp1_ext_params_block_type - RkISP1 extensible params block type
>>>>> + *
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS: Black level subtraction
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC: Defect pixel cluster correction
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG: Sensor de-gamma
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN: Auto white balance gains
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT: ISP filtering
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM: Bayer de-mosaic
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK: Cross-talk correction
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC: Gamma out correction
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF: De-noise pre-filter
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH: De-noise pre-filter strength
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC: Color processing
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_IE: Image effects
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC: Lens shading correction
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS: Auto white balance statistics
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
>>>>> + */
>>>>> +enum rkisp1_ext_params_block_type {
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_IE,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * enum rkisp1_ext_params_block_enable - RkISP1 extensible parameter block
>>>>> + *					 enable flags
>>>>> + *
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_DISABLE: Disable the HW block
>>>>> + * @RKISP1_EXT_PARAMS_BLOCK_ENABLE: Enable the HW block
>>>>> + */
>>>>> +enum rkisp1_ext_params_block_enable {
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_DISABLE,
>>>>> +	RKISP1_EXT_PARAMS_BLOCK_ENABLE,
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_block_header - RkISP1 extensible parameter block
>>>>> + *					   header
>>>>> + *
>>>>> + * This structure represents the common part of all the ISP configuration
>>>>> + * blocks. Each parameters block shall embed an instance of this structure type
>>>>> + * as its first member, followed by the block-specific configuration data. The
>>>>> + * driver inspects this common header to discern the block type and its size and
>>>>> + * properly handle the block content by casting it to the correct block-specific
>>>>> + * type.
>>>>> + *
>>>>> + * The @type field is one of the values enumerated by
>>>>> + * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
>>>>> + * interpreted by the driver. The @size field specifies the size of the
>>>>> + * parameters block and is used by the driver for validation purposes.
>>>>> + *
>>>>> + * The @enable field specifies the ISP block enablement state. The possible
>>>>> + * enablement states are enumerated by :c:type:`rkisp1_ext_params_block_enable`.
>>>>> + * When userspace needs to configure and enable an ISP block it shall fully
>>>>> + * populate the block configuration and the @enable flag shall be set to
>>>>> + * RKISP1_EXT_PARAMS_BLOCK_ENABLE. When userspace simply wants to disable the
>>>>> + * ISP block the @enable flag shall be set to RKISP1_EXT_PARAMS_BLOCK_DISABLE.
>>>>> + * The driver ignores the rest of the block configuration structure in this
>>>>> + * case.
>>>>> + *
>>>>> + * If a new configuration of an ISP block has to be applied userspace shall
>>>>> + * fully populate the ISP block configuration and set the @enable flag to
>>>>> + * RKISP1_EXT_PARAMS_BLOCK_ENABLE.
>>>>> + *
>>>>> + * Userspace is responsible for correctly populating the parameters block header
>>>>> + * fields (@type, @enable and @size) and the block-specific parameters.
>>>>> + *
>>>>> + * For example:
>>>>> + *
>>>>> + * .. code-block:: c
>>>>> + *
>>>>> + *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
>>>>> + *		struct rkisp1_ext_params_bls_config *bls =
>>>>> + *			(struct rkisp1_ext_params_bls_config *)block;
>>>>> + *
>>>>> + *		bls->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
>>>>> + *		bls->header.enable = RKISP1_EXT_PARAMS_BLOCK_ENABLE;
>>>>> + *		bls->header.size = sizeof(*bls);
>>>>> + *
>>>>> + *		bls->config.enable_auto = 0;
>>>>> + *		bls->config.fixed_val.r = blackLevelRed_;
>>>>> + *		bls->config.fixed_val.gr = blackLevelGreenR_;
>>>>> + *		bls->config.fixed_val.gb = blackLevelGreenB_;
>>>>> + *		bls->config.fixed_val.b = blackLevelBlue_;
>>>>> + *	}
>>>>> + *
>>>>> + * @type: The parameters block type, see
>>>>> + *	  :c:type:`rkisp1_ext_params_block_type`
>>>>> + * @enable: The block enable flag, see
>>>>> + *	   :c:type:`rkisp1_ext_params_block_enable`
>>>>> + * @size: Size (in bytes) of the parameters block, including this header
>>>>> + */
>>>>> +struct rkisp1_ext_params_block_header {
>>>>> +	__u16 type;
>>>>> +	__u16 enable;
>>>>> +	__u16 size;
>>>>
>>>> I would suggest changing this to '__u32 size;'. It ensures the header is8 bytes
>>>> long (much nicer than 6), and if there is ever a block > 65535, then it is supported.
>>>
>>> I'm pretty confident we will never need a block size larger than 64kB.
>>
>> Hmm, famous last words :-)
>>
>>> That would mean more than 64kB of data written to hardware
>>> registers/SRAM for a single processing block, and it would be incredibly
>>> expensive in terms of hardware. Keeping size a __u16 means we have two
>>> bytes of reserved space we could possibly use later, which may come
>>> handy.
>>
>> i would prefer to change the size to a u32, but rename the 'enable' field
>> to 'flags', and assign bit 0 to the enable/disable bit. This is a bit
>> more flexible IMHO and allows for 15 bits to encode additional data.
>>
>>  Blocks > 64kB could still be supported in the future by defining
>>> a new version of the parameters format (RKISP1_EXT_PARAM_BUFFER_V2)
>>> without needing a different 4CC.
>>>
>>> This being said, the opposite argument can be made, that a 32-bit size
>>> could come handy if we ever have larger blocks, and a new version of the
>>> parameters format could be used if we ever need to add more fields to
>>> the block header. I won't insist either way.
>>>
>>>> i wonder if, with this change, the 'aligned(8)' attributes are even needed, but
>>>> I didn't dig into that.
>>>
>>> The header would become 8-bytes long, but its larger field would still
>>> be 4-bytes long, so the compiler would only enforce 4-bytes aligned
>>> AFAIK.
>>
>> Normally the actual data blocks (in the non-extensible format) are already aligned
>> to either 4 or 8 bytes (depending on whether u64 values are used). So an 8 byte
>> header won't mess up the alignment.
> 
> When it come to existing uAPI types (non-extensible) they sometimes
> have holes and are aligned by the compiler to the size of the
> largest-member, even when embedded in other structure. In example,
> cproc is 7 bytes in size
> 
> struct rkisp1_cif_isp_cproc_config {
> 	__u8                       c_out_range;          /*     0     1 */
> 	__u8                       y_in_range;           /*     1     1 */
> 	__u8                       y_out_range;          /*     2     1 */
> 	__u8                       contrast;             /*     3     1 */
> 	__u8                       brightness;           /*     4     1 */
> 	__u8                       sat;                  /*     5     1 */
> 	__u8                       hue;                  /*     6     1 */
> 
> 	/* size: 7, cachelines: 1, members: 7 */
> 	/* last cacheline: 7 bytes */
> };
> 
> And when embedded in the corresponding extensible type it gets aligned
> to the size of the largest member in the structure (4 bytes)
> regardless if __attribute__((aligned(8)) is specified or not (by
> chance, in this case we get a size which is 8-bytes aligned)
> 
> struct rkisp1_ext_params_cproc_config {
> 	struct rkisp1_ext_params_block_header header;    /*     0     8 */
> 	struct rkisp1_cif_isp_cproc_config config;       /*     8     7 */
> 
> 	/* size: 16, cachelines: 1, members: 2 */
> 	/* padding: 1 */
> 	/* last cacheline: 16 bytes */
> };

A potential problem with padding in a public data structure is that you
have to be careful that no memory is leaked in the padding data from the
kernel to userspace.

Another potential problem is if e.g. rkisp1_cif_isp_cproc_config is extended
with a new byte in the future: in that case the new byte would replace the current
padding byte, but applications using the older struct may have left the
padding byte undefined, so the driver can't rely on that byte being 0
when called from such an application.

For compound control (which have similar problems) I have quite strict
requirements: the structure layout may not contain any holes, and I require (and
test) that any reserved/padding fields at set to 0 by the driver and that it is
documented that userspace sets it to 0 as well.

My recommendation for public APIs that effectively return data structures
is to:

1) ensure the layout is the same for 32 and 64 bit code,
2) there are no holes, instead use reserved[] arrays instead,
3) ensure that reserved fields are always set to 0 by the driver,
   and document that userspace sets it to 0 as well. You could chose
   to test for that and fail if it is not 0.

> 
> Other structures are instead aligned to 4 bytes boundary without the
> aligned(8) attribute specified, in example BLS:
> 
> struct rkisp1_ext_params_bls_config {
> 	struct rkisp1_ext_params_block_header header;    /*     0     8 */
> 	struct rkisp1_cif_isp_bls_config config;         /*     8    28 */
> 
> 	/* XXX last struct has 1 hole */
> 
> 	/* size: 36, cachelines: 1, members: 2 */
> 	/* member types with holes: 1, total: 1 */
> 	/* last cacheline: 36 bytes */
> };
> 
> Which is not 8 bytes aligned, compared to the 40 bytes long aligned(8)
> version here below:
> 
> struct rkisp1_ext_params_bls_config {
> 	struct rkisp1_ext_params_block_header header;    /*     0     8 */
> 	struct rkisp1_cif_isp_bls_config config;         /*     8    28 */
> 
> 	/* XXX last struct has 1 hole */
> 
> 	/* size: 40, cachelines: 1, members: 2 */
> 	/* padding: 4 */
> 	/* member types with holes: 1, total: 1 */
> 	/* last cacheline: 40 bytes */
> } __attribute__((__aligned__(8)));
> 
> Now, the question is if we want 8 bytes alignment for all structures
> or not.
> 
> 8-bytes alignment is significant when trying to read an 8-byte data
> type from a non-8-bytes-aligned address but as far as I can tell there
> are no u64 fields in the uAPI and the compiler would have aligned
> them anyway, so this is not a concern.
> 
> When it comes to 32-bit compatibility (32 bits userspace running on a
> 64 bits kernel) I don't see any pointer in the uAPI whose size can
> change between a 32-bit and a 64-bit system, and all types have their
> size specified, so I don't think we would have any issue there.

If there are no u64/s64 fields and no pointers, and you don't expect
to see such things in the future, then there is no need to align to
8 bytes.

> 
> The extensible data types are serialized in a u8[] data buffer, and
> code can access any location within the array by dereferencing a u64
> pointer, but there's nothing we can do to prevent this from happening.
> 
> As of now, I'm missing the reason why we decided to align everything
> to 8 bytes..
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>>> Did you check with pahole for holes etc. in the datastructures?
>>>
>>> That's a good idea in any case.
>>>
> 
> As shown in the above examples, existing types have holes, but there's
> nothing we can do about it. When embedded in the extensible types,
> after the 8-bytes header, they extensible type gets aligned to the
> size of the largest member, which is usually the 32-bits large (now
> that I made the size member of the header 32-bits).

As mentioned above, I strongly suggest to replace holes with reserved
fields. It avoids potential future problems.

Regards,

	Hans

> 
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Black Level Subtraction configuration block.
>>>>> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Black Level Subtraction configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_bls_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_bls_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_bls_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_dpcc_config - RkISP1 extensible params DPCC config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Defective Pixel Cluster Correction configuration
>>>>> + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Defective Pixel Cluster Correction configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_dpcc_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_dpcc_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_dpcc_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_sdg_config - RkISP1 extensible params SDG config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Sensor Degamma configuration block. Identified
>>>>> + * by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Sensor Degamma configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_sdg_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_sdg_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_sdg_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_lsc_config - RkISP1 extensible params LSC config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Lens Shading Correction configuration block.
>>>>> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Lens Shading Correction configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_lsc_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_lsc_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_lsc_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_awb_gain_config - RkISP1 extensible params AWB
>>>>> + *					      gain config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Auto-White Balance Gains configuration block.
>>>>> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Auto-White Balance Gains configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_awb_gain_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_awb_gain_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_awb_gain_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_flt_config - RkISP1 extensible params FLT config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Filter configuration block. Identified by
>>>>> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Filter configuration, see :c:type:`rkisp1_cif_isp_flt_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_flt_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_flt_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_bdm_config - RkISP1 extensible params BDM config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Demosaicing configuration block. Identified by
>>>>> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Demosaicing configuration, see :c:type:`rkisp1_cif_isp_bdm_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_bdm_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_bdm_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_ctk_config - RkISP1 extensible params CTK config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Cross-Talk configuration block. Identified by
>>>>> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Cross-Talk configuration, see :c:type:`rkisp1_cif_isp_ctk_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_ctk_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_ctk_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_goc_config - RkISP1 extensible params GOC config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Gamma-Out configuration block. Identified by
>>>>> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Gamma-Out configuration, see :c:type:`rkisp1_cif_isp_goc_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_goc_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_goc_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_dpf_config - RkISP1 extensible params DPF config
>>>>> + *
>>>>> + * RkISP1 extensible parameters De-noise Pre-Filter configuration block.
>>>>> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: De-noise Pre-Filter configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_dpf_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_dpf_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_dpf_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_dpf_strength_config - RkISP1 extensible params DPF
>>>>> + *						  strength config
>>>>> + *
>>>>> + * RkISP1 extensible parameters De-noise Pre-Filter strength configuration
>>>>> + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGTH`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: De-noise Pre-Filter strength configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_dpf_strength_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_dpf_strength_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_dpf_strength_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_cproc_config - RkISP1 extensible params CPROC config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Color Processing configuration block.
>>>>> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Color processing configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_cproc_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_cproc_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_cproc_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_ie_config - RkISP1 extensible params IE config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Image Effect configuration block. Identified by
>>>>> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_IE`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Image Effect configuration, see :c:type:`rkisp1_cif_isp_ie_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_ie_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_ie_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_awb_meas_config - RkISP1 extensible params AWB
>>>>> + *					      Meas config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Auto-White Balance Measurement configuration
>>>>> + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Auto-White Balance measure configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_awb_meas_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_awb_meas_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_awb_meas_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_hst_config - RkISP1 extensible params Histogram config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Histogram statistics configuration block.
>>>>> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Histogram statistics configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_hst_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_hst_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_hst_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_aec_config - RkISP1 extensible params AEC config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Auto-Exposure statistics configuration block.
>>>>> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Auto-Exposure statistics configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_aec_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_aec_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_aec_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_afc_config - RkISP1 extensible params AFC config
>>>>> + *
>>>>> + * RkISP1 extensible parameters Auto-Focus statistics configuration block.
>>>>> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS`.
>>>>> + *
>>>>> + * @header: The RkISP1 extensible parameters header, see
>>>>> + *	    :c:type:`rkisp1_ext_params_block_header`
>>>>> + * @config: Auto-Focus statistics configuration, see
>>>>> + *	    :c:type:`rkisp1_cif_isp_afc_config`
>>>>> + */
>>>>> +struct rkisp1_ext_params_afc_config {
>>>>> +	struct rkisp1_ext_params_block_header header;
>>>>> +	struct rkisp1_cif_isp_afc_config config;
>>>>> +} __attribute__((aligned(8)));
>>>>> +
>>>>> +#define RKISP1_EXT_PARAMS_MAX_SIZE					\
>>>>> +	(sizeof(struct rkisp1_ext_params_bls_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_dpcc_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_sdg_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_lsc_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_awb_gain_config)		+\
>>>>> +	sizeof(struct rkisp1_ext_params_flt_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_bdm_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_ctk_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_goc_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_dpf_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_dpf_strength_config)		+\
>>>>> +	sizeof(struct rkisp1_ext_params_cproc_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_ie_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_awb_meas_config)		+\
>>>>> +	sizeof(struct rkisp1_ext_params_hst_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_aec_config)			+\
>>>>> +	sizeof(struct rkisp1_ext_params_afc_config))
>>>>> +
>>>>> +/**
>>>>> + * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version
>>>>> + *
>>>>> + * @RKISP1_EXT_PARAM_BUFFER_V1: First version of RkISP1 extensible parameters
>>>>> + */
>>>>> +enum rksip1_ext_param_buffer_version {
>>>>> +	RKISP1_EXT_PARAM_BUFFER_V1 = 1,
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
>>>>> + *
>>>>> + * This struct contains the configuration parameters of the RkISP1 ISP
>>>>> + * algorithms, serialized by userspace into a data buffer. Each configuration
>>>>> + * parameter block is represented by a block-specific structure which contains a
>>>>> + * :c:type:`rkisp1_ext_params_block_header` entry as first member. Userspace
>>>>> + * populates the @data buffer with configuration parameters for the blocks that
>>>>> + * it intends to configure. As a consequence, the data buffer effective size
>>>>> + * changes according to the number of ISP blocks that userspace intends to
>>>>> + * configure and is set by userspace in the @data_size field.
>>>>> + *
>>>>> + * The parameters buffer is versioned by the @version field to allow modifying
>>>>> + * and extending its definition. Userspace shall populate the @version field to
>>>>> + * inform the driver about the version it intends to use. The driver will parse
>>>>> + * and handle the @data buffer according to the data layout specific to the
>>>>> + * indicated version and return an error if the desired version is not
>>>>> + * supported.
>>>>> + *
>>>>> + * For each ISP block that userspace wants to configure, a block-specific
>>>>> + * structure is appended to the @data buffer, one after the other without gaps
>>>>> + * in between nor overlaps. Userspace shall populate the @data_size field with
>>>>> + * the effective size, in bytes, of the @data buffer.
>>>>> + *
>>>>> + * The expected memory layout of the parameters buffer is::
>>>>> + *
>>>>> + *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
>>>>> + *	| version = RKISP_EXT_PARAMS_BUFFER_V1;                               |
>>>>> + *	| data_size = sizeof(struct rkisp1_ext_params_bls_config)             |
>>>>> + *	|           + sizeof(struct rkisp1_ext_params_dpcc_config);           |
>>>>> + *	| +------------------------- data  ---------------------------------+ |
>>>>> + *	| | +------------- struct rkisp1_ext_params_bls_config -----------+ | |
>>>>> + *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
>>>>> + *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS;                | | | |
>>>>> + *	| | | | enable = RKISP1_EXT_PARAMS_BLOCK_ENABLE;                | | | |
>>>>> + *	| | | | size = sizeof(struct rkisp1_ext_params_bls_config);     | | | |
>>>>> + *	| | | +---------------------------------------------------------+ | | |
>>>>> + *	| | | +---------- struct rkisp1_cif_isp_bls_config -------------+ | | |
>>>>> + *	| | | | enable_auto = 0;                                        | | | |
>>>>> + *	| | | | fixed_val.r = 256;                                      | | | |
>>>>> + *	| | | | fixed_val.gr = 256;                                     | | | |
>>>>> + *	| | | | fixed_val.gb = 256;                                     | | | |
>>>>> + *	| | | | fixed_val.b = 256;                                      | | | |
>>>>> + *	| | | +---------------------------------------------------------+ | | |
>>>>> + *	| | +------------ struct rkisp1_ext_params_dpcc_config -----------+ | |
>>>>> + *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
>>>>> + *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC;               | | | |
>>>>> + *	| | | | enable = RKISP1_EXT_PARAMS_BLOCK_ENABLE;                | | | |
>>>>> + *	| | | | size = sizeof(struct rkisp1_ext_params_dpcc_config);    | | | |
>>>>> + *	| | | +---------------------------------------------------------+ | | |
>>>>> + *	| | | +---------- struct rkisp1_cif_isp_dpcc_config ------------+ | | |
>>>>> + *	| | | | mode = RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE;          | | | |
>>>>> + *	| | | | output_mode =                                           | | | |
>>>>> + *	| | | |   RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_G_CENTER; | | | |
>>>>> + *	| | | | set_use = ... ;                                         | | | |
>>>>> + *	| | | | ...  = ... ;                                            | | | |
>>>>> + *	| | | +---------------------------------------------------------+ | | |
>>>>> + *	| | +-------------------------------------------------------------+ | |
>>>>> + *	| +-----------------------------------------------------------------+ |
>>>>> + *	+---------------------------------------------------------------------+
>>>>> + *
>>>>> + * @version: The RkISP1 extensible parameters buffer version, see
>>>>> + *	     :c:type:`rksip1_ext_param_buffer_version`
>>>>> + * @data_size: The RkISP1 configuration data effective size, excluding this
>>>>> + *	       header
>>>>> + * @data: The RkISP1 extensible configuration data blocks
>>>>> + */
>>>>> +struct rkisp1_ext_params_cfg {
>>>>> +	__u32 version;
>>>>> +	__u32 data_size;
>>>>> +	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
>>>>> +};
>>>>> +
>>>>>  #endif /* _UAPI_RKISP1_CONFIG_H */
>>>
>>


