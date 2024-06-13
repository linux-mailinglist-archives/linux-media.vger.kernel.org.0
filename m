Return-Path: <linux-media+bounces-13183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC959069A6
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 12:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9100B21899
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 10:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0F51411FD;
	Thu, 13 Jun 2024 10:08:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8111E1411CD;
	Thu, 13 Jun 2024 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718273312; cv=none; b=dFnAc25+3IAoYmHwAI9ge2L98d00tWrjPc8xWuk2Qz2mrHRTYTkG4J49a6yaQgMH0hZUt8cDlTRQyTSwoeKRYVcKxHFzjGcJUGf0NUFE+CHp5HcWcZ7RUctpodIwO7XsvmFb1xW/2l1ycCyDD8Abi42NcZ4VQscojDir98rNS9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718273312; c=relaxed/simple;
	bh=cEArx9mzHgsB/rYrdqilf+3WfQuNBbb2M6oNfy8Y1V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNXnvMRVsn0F37uHBS5pUWm4PFnsv5a6fOLOTnZgFaV42FBcIZujRkmWLs3Fdac4LngCbONlSzwCn3eFIa73YI4FeaD7rOyJxNkUjPTUksc/IIgPe1O3e1hBPJzr7VQWvGqsUtISxYmHkAHkbSoPHuh4qepP5hga9xgBcKg3Bfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B45C3277B;
	Thu, 13 Jun 2024 10:08:27 +0000 (UTC)
Message-ID: <59866428-342b-4ba4-a7c7-2df1477aa7e6@xs4all.nl>
Date: Thu, 13 Jun 2024 12:08:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 03/13] media: v4l2-jpeg: Export reference quantization
 and huffman tables
To: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com
Cc: laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca
References: <20240607131900.3535250-1-devarsht@ti.com>
 <20240607132831.3551333-1-devarsht@ti.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240607132831.3551333-1-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Devarsh,

On 07/06/2024 15:28, Devarsh Thakkar wrote:
> Export reference quantization and huffman tables as provided in ITU-T.81 so
> that they can be re-used by other JPEG drivers.
> 
> These are example tables provided in ITU-T.81 as reference tables and the
> JPEG encoders are free to use either these or their own proprietary tables.
> 
> Also add necessary prefixes to be used for huffman tables in global header
> file.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V13: Fix smatch/sparse related below warning by using static global
> variable for arrays:
> Logs:
> +drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'luma_qt' was not
> declared. Should it be static?
> +drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'chroma_qt' was
> not declared. Should it be static?
> +drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'zigzag' was not
> declared. Should it be static?
> +drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'luma_dc_ht' was
> not declared. Should it be static?
> +drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'luma_ac_ht' was
> not declared. Should it be static?
> +drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'chroma_dc_ht' was
> not declared. Should it be static?
> +drivers/media/v4l2-core/v4l2-jpeg.c: warning: symbol 'chroma_ac_ht' was
> not declared. Should it be static?"
> 
> V12: Fix html-doc warnings by removing * from args
> V11: No change
> V10: Add description for new macros introduced in this patchset
> V1->V9: No change (Patch introduced in V7)
>  drivers/media/v4l2-core/v4l2-jpeg.c | 162 +++++++++++++++++++++++++++-
>  include/media/v4l2-jpeg.h           |  28 +++++
>  2 files changed, 189 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
> index 94435a7b6816..bd6305c92e0e 100644
> --- a/drivers/media/v4l2-core/v4l2-jpeg.c
> +++ b/drivers/media/v4l2-core/v4l2-jpeg.c
> @@ -16,7 +16,7 @@
>  #include <linux/types.h>
>  #include <media/v4l2-jpeg.h>
>  
> -MODULE_DESCRIPTION("V4L2 JPEG header parser helpers");
> +MODULE_DESCRIPTION("V4L2 JPEG helpers");
>  MODULE_AUTHOR("Philipp Zabel <kernel@pengutronix.de>");
>  MODULE_LICENSE("GPL");
>  
> @@ -52,6 +52,115 @@ MODULE_LICENSE("GPL");
>  #define COM	0xfffe	/* comment */
>  #define TEM	0xff01	/* temporary */
>  
> +/* Luma and chroma qp tables to achieve 50% compression quality
> + * This is as per example in Annex K.1 of ITU-T.81
> + */
> +static const u8 luma_qt[] = {
> +	16, 11, 10, 16, 24, 40, 51, 61,
> +	12, 12, 14, 19, 26, 58, 60, 55,
> +	14, 13, 16, 24, 40, 57, 69, 56,
> +	14, 17, 22, 29, 51, 87, 80, 62,
> +	18, 22, 37, 56, 68, 109, 103, 77,
> +	24, 35, 55, 64, 81, 104, 113, 92,
> +	49, 64, 78, 87, 103, 121, 120, 101,
> +	72, 92, 95, 98, 112, 100, 103, 99
> +};

Why make this so complicated?

Just do this:

const u8 v4l2_jpeg_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK] = {
	16, 11, 10, 16,  24,  40,  51,  61,
	12, 12, 14, 19,  26,  58,  60,  55,
	14, 13, 16, 24,  40,  57,  69,  56,
	14, 17, 22, 29,  51,  87,  80,  62,
	18, 22, 37, 56,  68, 109, 103,  77,
	24, 35, 55, 64,  81, 104, 113,  92,
	49, 64, 78, 87, 103, 121, 120, 101,
	72, 92, 95, 98, 112, 100, 103,  99
};
EXPORT_SYMBOL_GPL(v4l2_jpeg_table_luma_qt);

and in the header add:

extern const u8 v4l2_jpeg_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];

Same for the other tables.

And in the header add:

extern const u8 v4l2_jpeg_table_luma_qt[V4L2_JPEG_PIXELS_IN_BLOCK];

It's similar to e.g. 'const u8 v4l2_vp9_kf_y_mode_prob[10][10][9];'
in v4l2-vp9.c/h.

It also ensures that the compiler knows the size of each array,
so it can detect out-of-bounds errors. And you can drop the accessor
functions, as there is no longer any need for that.

I really want this out-of-bounds detection, the code as it is now is too
risky. So please make a v14.

> +
> +static const u8 chroma_qt[] = {

Just to make it clear: don't use [] here, use the actual define for the
array size. That way you get a compiler warning if you missed an entry
in the initialization.

Apologies for the late review, I only noticed this when I checked the
pull request.

Regards,

	Hans

> +	17, 18, 24, 47, 99, 99, 99, 99,
> +	18, 21, 26, 66, 99, 99, 99, 99,
> +	24, 26, 56, 99, 99, 99, 99, 99,
> +	47, 66, 99, 99, 99, 99, 99, 99,
> +	99, 99, 99, 99, 99, 99, 99, 99,
> +	99, 99, 99, 99, 99, 99, 99, 99,
> +	99, 99, 99, 99, 99, 99, 99, 99,
> +	99, 99, 99, 99, 99, 99, 99, 99
> +};
> +
> +/* Zigzag scan pattern */
> +static const u8 zigzag[] = {
> +	0,   1,  8, 16,  9,  2,  3, 10,
> +	17, 24, 32, 25, 18, 11,  4,  5,
> +	12, 19, 26, 33, 40, 48, 41, 34,
> +	27, 20, 13,  6,  7, 14, 21, 28,
> +	35, 42, 49, 56, 57, 50, 43, 36,
> +	29, 22, 15, 23, 30, 37, 44, 51,
> +	58, 59, 52, 45, 38, 31, 39, 46,
> +	53, 60, 61, 54, 47, 55, 62, 63
> +};
> +
> +/*
> + * Contains the data that needs to be sent in the marker segment of an
> + * interchange format JPEG stream or an abbreviated format table specification
> + * data stream. Specifies the huffman table used for encoding the luminance DC
> + * coefficient differences. The table represents Table K.3 of ITU-T.81
> + */
> +static const u8 luma_dc_ht[] = {
> +	0x00, 0x01, 0x05, 0x01, 0x01, 0x01, 0x01, 0x01,
> +	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
> +};
> +
> +/*
> + * Contains the data that needs to be sent in the marker segment of an
> + * interchange format JPEG stream or an abbreviated format table specification
> + * data stream. Specifies the huffman table used for encoding the luminance AC
> + * coefficients. The table represents Table K.5 of ITU-T.81
> + */
> +static const u8 luma_ac_ht[] = {
> +	0x00, 0x02, 0x01, 0x03, 0x03, 0x02, 0x04, 0x03, 0x05, 0x05, 0x04, 0x04,
> +	0x00, 0x00, 0x01, 0x7D, 0x01, 0x02, 0x03, 0x00, 0x04, 0x11, 0x05, 0x12,
> +	0x21, 0x31, 0x41, 0x06, 0x13, 0x51, 0x61, 0x07, 0x22, 0x71, 0x14, 0x32,
> +	0x81, 0x91, 0xA1, 0x08, 0x23, 0x42, 0xB1, 0xC1, 0x15, 0x52, 0xD1, 0xF0,
> +	0x24, 0x33, 0x62, 0x72, 0x82, 0x09, 0x0A, 0x16, 0x17, 0x18, 0x19, 0x1A,
> +	0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
> +	0x3A, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x53, 0x54, 0x55,
> +	0x56, 0x57, 0x58, 0x59, 0x5A, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69,
> +	0x6A, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A, 0x83, 0x84, 0x85,
> +	0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98,
> +	0x99, 0x9A, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8, 0xA9, 0xAA, 0xB2,
> +	0xB3, 0xB4, 0xB5, 0xB6, 0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3, 0xC4, 0xC5,
> +	0xC6, 0xC7, 0xC8, 0xC9, 0xCA, 0xD2, 0xD3, 0xD4, 0xD5, 0xD6, 0xD7, 0xD8,
> +	0xD9, 0xDA, 0xE1, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0xE8, 0xE9, 0xEA,
> +	0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0xF7, 0xF8, 0xF9, 0xFA
> +};
> +
> +/*
> + * Contains the data that needs to be sent in the marker segment of an interchange format JPEG
> + * stream or an abbreviated format table specification data stream.
> + * Specifies the huffman table used for encoding the chrominance DC coefficient differences.
> + * The table represents Table K.4 of ITU-T.81
> + */
> +static const u8 chroma_dc_ht[] = {
> +	0x00, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
> +	0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
> +};
> +
> +/*
> + * Contains the data that needs to be sent in the marker segment of an
> + * interchange format JPEG stream or an abbreviated format table specification
> + * data stream. Specifies the huffman table used for encoding the chrominance
> + * AC coefficients. The table represents Table K.6 of ITU-T.81
> + */
> +static const u8 chroma_ac_ht[] = {
> +	0x00, 0x02, 0x01, 0x02, 0x04, 0x04, 0x03, 0x04, 0x07, 0x05, 0x04, 0x04,
> +	0x00, 0x01, 0x02, 0x77, 0x00, 0x01, 0x02, 0x03, 0x11, 0x04, 0x05, 0x21,
> +	0x31, 0x06, 0x12, 0x41, 0x51, 0x07, 0x61, 0x71, 0x13, 0x22, 0x32, 0x81,
> +	0x08, 0x14, 0x42, 0x91, 0xA1, 0xB1, 0xC1, 0x09, 0x23, 0x33, 0x52, 0xF0,
> +	0x15, 0x62, 0x72, 0xD1, 0x0A, 0x16, 0x24, 0x34, 0xE1, 0x25, 0xF1, 0x17,
> +	0x18, 0x19, 0x1A, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x35, 0x36, 0x37, 0x38,
> +	0x39, 0x3A, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x53, 0x54,
> +	0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68,
> +	0x69, 0x6A, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A, 0x82, 0x83,
> +	0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8A, 0x92, 0x93, 0x94, 0x95, 0x96,
> +	0x97, 0x98, 0x99, 0x9A, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8, 0xA9,
> +	0xAA, 0xB2, 0xB3, 0xB4, 0xB5, 0xB6, 0xB7, 0xB8, 0xB9, 0xBA, 0xC2, 0xC3,
> +	0xC4, 0xC5, 0xC6, 0xC7, 0xC8, 0xC9, 0xCA, 0xD2, 0xD3, 0xD4, 0xD5, 0xD6,
> +	0xD7, 0xD8, 0xD9, 0xDA, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0xE8, 0xE9,
> +	0xEA, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0xF7, 0xF8, 0xF9, 0xFA
> +};
> +
>  /**
>   * struct jpeg_stream - JPEG byte stream
>   * @curr: current position in stream
> @@ -675,3 +784,54 @@ int v4l2_jpeg_parse_huffman_tables(void *buf, size_t len,
>  	return jpeg_parse_huffman_tables(&stream, huffman_tables);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_huffman_tables);
> +
> +/**
> + * v4l2_jpeg_get_reference_quantization_tables - Get reference quantization
> + *						 tables as defined in ITU-T.81
> + * @ref_luma_qt: Output variable pointing to luma quantization table
> + * @ref_chroma_qt: Output variable pointing to chroma quantization table
> + */
> +void v4l2_jpeg_get_reference_quantization_tables(const u8 **ref_luma_qt, const
> +						 u8 **ref_chroma_qt)
> +{
> +	if (ref_luma_qt)
> +		*ref_luma_qt = luma_qt;
> +	if (ref_chroma_qt)
> +		*ref_chroma_qt = chroma_qt;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_jpeg_get_reference_quantization_tables);
> +
> +/**
> + * v4l2_jpeg_get_zig_zag_scan - Get zigzag scan table as defined in ITU-T.81
> + * @ref_zigzag: Output variable pointing to zigzag scan table
> + */
> +void v4l2_jpeg_get_zig_zag_scan(const u8 **ref_zigzag)
> +{
> +	if (ref_zigzag)
> +		*ref_zigzag = zigzag;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_jpeg_get_zig_zag_scan);
> +
> +/**
> + * v4l2_jpeg_get_reference_huffman_tables - Get reference huffman tables as
> + *					    defined in ITU-T.81
> + * @ref_luma_dc_ht : Output variable pointing to huffman table for luma DC
> + * @ref_luma_ac_ht : Output variable pointing to huffman table for luma AC
> + * @ref_chroma_dc_ht : Output variable pointing to huffman table for chroma DC
> + * @ref_chroma_ac_ht : Output variable pointing to huffman table for chroma AC
> + */
> +void v4l2_jpeg_get_reference_huffman_tables(const u8 **ref_luma_dc_ht,
> +					    const u8 **ref_luma_ac_ht,
> +					    const u8 **ref_chroma_dc_ht,
> +					    const u8 **ref_chroma_ac_ht)
> +{
> +	if (ref_luma_dc_ht)
> +		*ref_luma_dc_ht = luma_dc_ht;
> +	if (ref_luma_ac_ht)
> +		*ref_luma_ac_ht = luma_ac_ht;
> +	if (ref_chroma_dc_ht)
> +		*ref_chroma_dc_ht = chroma_dc_ht;
> +	if (ref_chroma_ac_ht)
> +		*ref_chroma_ac_ht = chroma_ac_ht;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_jpeg_get_reference_huffman_tables);
> diff --git a/include/media/v4l2-jpeg.h b/include/media/v4l2-jpeg.h
> index 2dba843ce3bd..b470bbffb73f 100644
> --- a/include/media/v4l2-jpeg.h
> +++ b/include/media/v4l2-jpeg.h
> @@ -14,6 +14,30 @@
>  
>  #define V4L2_JPEG_MAX_COMPONENTS	4
>  #define V4L2_JPEG_MAX_TABLES		4
> +/*
> + * Prefixes used to generate huffman table class and destination identifiers as
> + * described below:
> + *
> + * V4L2_JPEG_LUM_HT | V4L2_JPEG_DC_HT : Prefix for Luma DC coefficients
> + *					huffman table
> + * V4L2_JPEG_LUM_HT | V4L2_JPEG_AC_HT : Prefix for Luma AC coefficients
> + *					huffman table
> + * V4L2_JPEG_CHR_HT | V4L2_JPEG_DC_HT : Prefix for Chroma DC coefficients
> + *					huffman table
> + * V4L2_JPEG_CHR_HT | V4L2_JPEG_AC_HT : Prefix for Chroma AC coefficients
> + *					huffman table
> + */
> +#define V4L2_JPEG_LUM_HT		0x00
> +#define V4L2_JPEG_CHR_HT		0x01
> +#define V4L2_JPEG_DC_HT			0x00
> +#define V4L2_JPEG_AC_HT			0x10
> +
> +/* Length of reference huffman tables as provided in Table K.3 of ITU-T.81 */
> +#define V4L2_JPEG_REF_HT_AC_LEN		178
> +#define V4L2_JPEG_REF_HT_DC_LEN		28
> +
> +/* Array size for 8x8 block of samples or DCT coefficient */
> +#define V4L2_JPEG_PIXELS_IN_BLOCK	64
>  
>  /**
>   * struct v4l2_jpeg_reference - reference into the JPEG buffer
> @@ -154,4 +178,8 @@ int v4l2_jpeg_parse_quantization_tables(void *buf, size_t len, u8 precision,
>  int v4l2_jpeg_parse_huffman_tables(void *buf, size_t len,
>  				   struct v4l2_jpeg_reference *huffman_tables);
>  
> +void v4l2_jpeg_get_reference_quantization_tables(const u8 **luma_qt, const u8 **chroma_qt);
> +void v4l2_jpeg_get_zig_zag_scan(const u8 **zigzag);
> +void v4l2_jpeg_get_reference_huffman_tables(const u8 **luma_dc_ht, const u8 **luma_ac_ht,
> +					    const u8 **chroma_dc_ht, const u8 **chroma_ac_ht);
>  #endif


