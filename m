Return-Path: <linux-media+bounces-49413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 027A0CD9721
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 14:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC3443017675
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 13:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F50340277;
	Tue, 23 Dec 2025 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTmFfkKx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F5533B6E1
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496846; cv=none; b=QXAhzAbbpV7KltSpiwg/kf9jGxg0SndEv40+yFINA52+zoaHATVCtvgTkyVWu6HJhHk8plTLLPuRkjUOcg8S7d8/JjiwdHmwGxenLmwX9ZlZjwMgolgQ4JyJJfaTTwyiGBROurMSXwCobV62iaDdXObaPDcLoyIpoISpxM0YSvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496846; c=relaxed/simple;
	bh=pJh0gtd39hBojwvDDq8V4DMqUho21kHxbKogtH/3hZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4N5dmy/6JAmMS355mX4qb2MmjDuJm/3FaifDamJCb6995V+rBl9bW7LmBEUySqC4xAYmW3C18jfhBWpgrIfRGb7nQbivLRTMXMEI5moMBsaOvkrVNrQp5aiDEVtsl5kUJNTxKEIoUAY6PBsr5ElogiNMVFlAtBqXdYV5s6lxe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTmFfkKx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7908C113D0;
	Tue, 23 Dec 2025 13:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766496842;
	bh=pJh0gtd39hBojwvDDq8V4DMqUho21kHxbKogtH/3hZI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uTmFfkKxN7Yl/IFuFDfhnHacz4/72UtozQexVwaJiOWqbNSnL3bZZCA8EdcbY86ne
	 EPFPpdY2WeA/5zZw2v8vanFtM+MipvvgMWaIs5ME+59uOmJ7x0oFTZHEt6besRjIxm
	 9P+QyzB+ctmNXRLWmjM6o5sdIrkbwEUTJziytCkvHCz/qBGsA6wyixoGqTP9ka2rS/
	 pqBWXXywuvoZr+1rGHGp2T4sW6oZlTqLRyyL/EtiwvpMi2jWf8i3j35jFs5QG4eTcT
	 YHzHhrJ4CAs/+KwG3fzdG8b8/yXLQf8DOOBJ8+pwDDYzgyyX9kIBtwOFyr1ZBPtVpI
	 qKxM1FRoNw4YQ==
Message-ID: <99d1ee27-7d3d-4b2a-98a8-bfc27e904eb1@kernel.org>
Date: Tue, 23 Dec 2025 14:33:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] media: mt9m114: Adjust IFP selections and src
 format when src pixelfmt changes to/from RAW10
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250629205626.68341-11-hansg@kernel.org>
 <20250702003231.GE17819@pendragon.ideasonboard.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250702003231.GE17819@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

Thank you for all the reviews.

On 2-Jul-25 02:32, Laurent Pinchart wrote:
> On Sun, Jun 29, 2025 at 10:56:20PM +0200, Hans de Goede wrote:
>> Changing the IFP src pad pixelfmt to RAW10 means disabling the scaler,
> 
> s/src/source/
> s/pixelfmt/format/ or "media bus code", as this isn't a pixel format
> 
> Same below.
> 
>> which means that the crop and compose rectangles must be reset to
>> match the sink format size with no border.
>>
>> And when changing the src pad pixelfmt back from RAW10 to another pixelfmt
>> which require demosaicing the crop and compose rectangles must be reset
>> to the sink format size minus a 4 pixels border all around it.
>>
>> Also when changing the src pad pixelfmt back from RAW10 to another pixelfmt
>> the colorspace, ycbcr_enc and quantization need to be updated too.
>>
>> Add a new mt9m114_ifp_update_sel_and_src_fmt() helper which resets all
>> these taking the bordersize for the new src pixelfmt into account and
>> call this helper whenever the src pad pixelfmt changes to/from RAW10.
>>
>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> ---
>> Changes in v3:
>> - This is a new patch in v3 of this patch-set, which comes from splitting
>>   up "media: mt9m114: Fix scaler bypass mode" into multiple patches
>> ---
>>  drivers/media/i2c/mt9m114.c | 53 +++++++++++++++++++++++++++++++++----
>>  1 file changed, 48 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
>> index 020caae95a3d..ef27780384f2 100644
>> --- a/drivers/media/i2c/mt9m114.c
>> +++ b/drivers/media/i2c/mt9m114.c
>> @@ -1820,6 +1820,40 @@ static int mt9m114_ifp_enum_frameintervals(struct v4l2_subdev *sd,
>>  	return 0;
>>  }
>>  
>> +/*
>> + * Helper function to update IFP crop, compose rects and src format when
> 
> s/rects/rectangles/
> 
>> + * the pixel border size changes, which requires resetting these.
>> + */
>> +static void mt9m114_ifp_update_sel_and_src_fmt(struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_mbus_framefmt *src_format, *sink_format;
>> +	struct v4l2_rect *crop;
>> +	unsigned int border;
>> +
>> +	sink_format = v4l2_subdev_state_get_format(state, 0);
>> +	src_format = v4l2_subdev_state_get_format(state, 1);
>> +	crop = v4l2_subdev_state_get_crop(state, 0);
>> +	border = mt9m114_ifp_get_border(state);
>> +
>> +	crop->left = border;
>> +	crop->top = border;
>> +	crop->width = sink_format->width - 2 * border;
>> +	crop->height = sink_format->height - 2 * border;
>> +	*v4l2_subdev_state_get_compose(state, 0) = *crop;
>> +
>> +	src_format->width = crop->width;
>> +	src_format->height = crop->height;
> 
> Please add a blank line here.
> 
>> +	if (src_format->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
>> +		src_format->colorspace = V4L2_COLORSPACE_RAW;
>> +		src_format->ycbcr_enc = V4L2_YCBCR_ENC_601;
>> +		src_format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>> +	} else {
>> +		src_format->colorspace = V4L2_COLORSPACE_SRGB;
>> +		src_format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +		src_format->quantization = V4L2_QUANTIZATION_DEFAULT;
>> +	}
>> +}
>> +
>>  static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
>>  			       struct v4l2_subdev_state *state,
>>  			       struct v4l2_subdev_format *fmt)
>> @@ -1843,11 +1877,20 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
>>  		/* Only the media bus code can be changed on the source pad. */
>>  		info = mt9m114_format_info(sensor, 1, fmt->format.code);
>>  
>> -		format->code = info->code;
>> -
>> -		/* If the output format is RAW10, bypass the scaler. */
>> -		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
>> -			*format = *v4l2_subdev_state_get_format(state, 0);
>> +		/*
>> +		 * If the output format changes from/to RAW10 then the crop
>> +		 * rectangle needs to be adjusted to add / remove the 4 pixel
>> +		 * border used for demosaicing. And these changes then need to
>> +		 * be propagated to the compose rectangle and src format size.
>> +		 */
>> +		if (format->code != info->code &&
>> +		    (format->code == MEDIA_BUS_FMT_SGRBG10_1X10 ||
>> +		     info->code == MEDIA_BUS_FMT_SGRBG10_1X10)) {
> 
> This would be shorter:
> 
> 		if ((format->code == MEDIA_BUS_FMT_SGRBG10_1X10) !=
> 		    (info->code == MEDIA_BUS_FMT_SGRBG10_1X10)) {
> 
> Whether or not it's more readable may be a matter of personal preference
> though.

I like your suggestion, so I'm going with this for v4.

I'll also address all your comments about commit msg wording,
comment wording and adding a blank line here and there both
in this patch as well as in all the other patches in the series
with similar comments.

Regards,

Hans



