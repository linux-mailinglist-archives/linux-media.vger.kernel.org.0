Return-Path: <linux-media+bounces-47960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D25C97B58
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 14:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 73D353477FB
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 13:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEB930EF87;
	Mon,  1 Dec 2025 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVs7Iz4F"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599F83128D0
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764596690; cv=none; b=uAfDyFwSzATMGpZszx0Jt+nBhxY59WKQhZFjQoJBs3z/rglAdhEAeKu2Jlm1EYes7Qmba+emoI6OY3Wn083Eaylsv38RDbaVwAwHOubEvh8dHZw39ABYzvO1r4gQ23HLdAJbzZieix89CEVSN3GrOZu0vuMQ1mSViwicUQd3MTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764596690; c=relaxed/simple;
	bh=3gnS2Uypo/AYmIYNnGKsmKaSEUhD/BALvbmDrBYrbCw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X0sa7fgClixAdIuRgy4P0kEFUaI7nJzfGp/aVFPEBL73/3KGi2MEizZ3Q+hSHZIVd0Gtz4nxzI3Uiyj4c2JqaSrCdXPXcbrNYSimkCAxx5JYSxV8DJdvttlefTdRM7ZrsRbIYyI4swo/6dLN4lAnrAWb2PIKmRfmt97hLREKPqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVs7Iz4F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929EFC4CEF1;
	Mon,  1 Dec 2025 13:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764596686;
	bh=3gnS2Uypo/AYmIYNnGKsmKaSEUhD/BALvbmDrBYrbCw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=IVs7Iz4F7/lKVv71drk5VvBd2qfLtPlNkOyKK9FZaUXVC3rY3wONRtS41vu6ZayR9
	 fvw+1hPW5jSXJIgf4/ekqjZzc/si5g3CP6VRxI0PBL9Nb8llnlE9E2cMDbb/yjLP8M
	 HpHB0phUIV20IhiJd94KJGS0mPnCWLgD4nOzHhLTDULGI9xk0EUOI+1WCmBJT9/MFX
	 oZ0OH1w5rTS7Q+F8ILTZAHqfm7CbzP/TPzi6nre6I94Hn//k9tBZErbJmO7U1m/xiy
	 tE8kON9MUztOH9vGP/PTcLv/18pLem2RQLFCPsNSmWJ68EN+qVTah1TiFmhJvn5l+Z
	 TJ/MYTQtIxABA==
Message-ID: <beaf6c94-c705-476d-a12b-d7ef42c9244c@kernel.org>
Date: Mon, 1 Dec 2025 14:44:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 04/14] media: omap3isp: implement enum_fmt_vid_cap/out
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <30813a3e81f2d8a6f42f637eba6fba2481b535cf.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiOIoe24l5NNz6z@kekkonen.localdomain>
 <9cd8b533-95fb-4495-a67b-bdf5c7774a74@kernel.org>
 <aS19g3Z38hAAcBkw@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <aS19g3Z38hAAcBkw@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2025 12:35, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Dec 01, 2025 at 09:40:58AM +0100, Hans Verkuil wrote:
>> On 22/10/2025 09:56, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Fri, Oct 17, 2025 at 03:26:41PM +0200, Hans Verkuil wrote:
>>>> Add missing ioctls. This makes v4l2-compliance happier:
>>>>
>>>> fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
>>>> 	test VIDIOC_G_FMT: FAIL
>>>> fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
>>>> 	test VIDIOC_TRY_FMT: FAIL
>>>> fail: v4l2-test-formats.cpp(516): pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
>>>> 	test VIDIOC_S_FMT: FAIL
>>>>
>>>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>>>> ---
>>>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 34 +++++++++++++++++++
>>>>  1 file changed, 34 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
>>>> index 864d38140b87..77beea00d507 100644
>>>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
>>>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
>>>> @@ -652,6 +652,38 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int
>>>> +isp_video_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>>>> +{
>>>> +	struct isp_video *video = video_drvdata(file);
>>>> +	unsigned int i, j;
>>>> +	unsigned int skip_last_fmts = 1;
>>>> +
>>>> +	if (f->type != video->type)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/*
>>>> +	 * The last two formats have the same pixelformat as the two
>>>> +	 * formats before them, but they do have different mediabus
>>>> +	 * codes. So to avoid reporting duplicate pixelformats we skip
>>>> +	 * those two, provided f->mbus_code is 0.
>>>> +	 */
>>>> +	if (!f->mbus_code)
>>>> +		skip_last_fmts += 2;
>>>> +	for (i = 0, j = 0; i < ARRAY_SIZE(formats) - skip_last_fmts; i++) {
>>>> +		if (f->mbus_code && formats[i].code != f->mbus_code)
>>>> +			continue;
>>>
>>> How about, instead of the skip_last_fmts thingy, using this:
>>>
>>> 		/* Weed out pixelformats with the same mbus code. */
>>> 		if (i && formats[i - 1].code == formats[i].code)
>>> 			continue;
>>
>> Good idea, but it should be this:
>>
>>                /* Weed out duplicate pixelformats with different mbus codes */
>>                if (!f->mbus_code && i &&
>>                    formats[i - 1].pixelformat == formats[i].pixelformat)
>>                        continue;
> 
> I think you shouldn't add !f->mbus_code check here, there's already a check
> for that right after the for ... line.

Ah, no. If you search with non-zero f->mbus_code, then you want to
see all matching formats for that mbus_code.

Without the '!f->mbus_code' condition you would incorrectly skip entries in
the formats array.

E.g. if f->mbus_code is set to MEDIA_BUS_FMT_UYVY8_2X8, then it would fail to
find V4L2_PIX_FMT_UYVY as a match.

Regards,

	Hans

> 
>>
>> And the duplicate pixelformats in the formats array must be together in the
>> array for this to work. Easy enough to change.
> 
> The pixelformats in formats array would need to be sorted for this -- right
> now they're not (16- vs. 8-bit YUV formats at the end of the table). So I
> think this should be:
> 
> 		if (f->mbus_code && formats[i].code != f->mbus_code)
> 			continue;
> 
> 		/* Weed up duplicate pixelformats. */
> 		if (i && formats[i - 1].pixelformat == formats[i].pixelformat)
> 			continue;
> 


