Return-Path: <linux-media+bounces-47922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B5C9636C
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 09:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0055D3A2B6B
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 08:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA60A2EA468;
	Mon,  1 Dec 2025 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkbeof+Q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DBC33985
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 08:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764578462; cv=none; b=eSp9gl8O/UizBX8akaJiyvp7tIF64uz2EcZwwwLpoTC2TOx69aKd2hEbsI+CEPPh7FZisAaLra1rxwUiTMoBEW5yFC6IvJXOM+4wUhTEPINE8+ubuIdXN7U8AGAn+1dMwAzM5aQO8sEdSFGsIQYAQTrbskSBdzj+VOMd0Sd5p+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764578462; c=relaxed/simple;
	bh=o4jy+qzQneLroLHV0jSTCegOykenZZvD9onAZZsUmyI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TZ+RRhqMal0PLdF7RTEQBlIdsmoKWtuYBNTl64AmgLfjbrhdZzR8y9KRz29XoFD9LjnHZNmAqNToUhO2UlcyVfYm0XbhsDcoMCDgaWUBJYmTebtGkfYxBnzhKFrwVbJuMMB1NAhfCA1DuIUEBQkiKKqS4zF3CQli0hLG/YesJBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkbeof+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA989C4CEF1;
	Mon,  1 Dec 2025 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764578460;
	bh=o4jy+qzQneLroLHV0jSTCegOykenZZvD9onAZZsUmyI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=rkbeof+QDh+exQHAptaXqHiKeZZbVxI8jLmH24Fl21mjq0VPChSS8Ov8jKJROkCX1
	 WSRboarXuq3Ytvry2e4BHFxbT6pcy1laRcmu8FRubhtvzzU6ukqJbCcCZYvSwAwVDM
	 jPfzCbLULnpClFnClwsdKayy5Gi4I9E6HToLAJ9bYFLfIPcz5aXgJ3snsHvkUCBGyY
	 54Ije4ceiHv82TOUUuRRWJabmlIoRCsmjDc81RoJu1PCqZJt2QP+kJZm/zkK1RWYdw
	 Tx+lfc6BsVxJZGYhW6ECnkOy3hXiKAwbBmKjJuNOmRggApNjijmDTVxmVBYHwg0mE8
	 m7nqeSoBOqE3Q==
Message-ID: <9cd8b533-95fb-4495-a67b-bdf5c7774a74@kernel.org>
Date: Mon, 1 Dec 2025 09:40:58 +0100
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
Content-Language: en-US, nl
In-Reply-To: <aPiOIoe24l5NNz6z@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/2025 09:56, Sakari Ailus wrote:
> Hi Hans,
> 
> On Fri, Oct 17, 2025 at 03:26:41PM +0200, Hans Verkuil wrote:
>> Add missing ioctls. This makes v4l2-compliance happier:
>>
>> fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
>> 	test VIDIOC_G_FMT: FAIL
>> fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
>> 	test VIDIOC_TRY_FMT: FAIL
>> fail: v4l2-test-formats.cpp(516): pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
>> 	test VIDIOC_S_FMT: FAIL
>>
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> ---
>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 34 +++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> index 864d38140b87..77beea00d507 100644
>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
>> @@ -652,6 +652,38 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>>  	return 0;
>>  }
>>  
>> +static int
>> +isp_video_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>> +{
>> +	struct isp_video *video = video_drvdata(file);
>> +	unsigned int i, j;
>> +	unsigned int skip_last_fmts = 1;
>> +
>> +	if (f->type != video->type)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * The last two formats have the same pixelformat as the two
>> +	 * formats before them, but they do have different mediabus
>> +	 * codes. So to avoid reporting duplicate pixelformats we skip
>> +	 * those two, provided f->mbus_code is 0.
>> +	 */
>> +	if (!f->mbus_code)
>> +		skip_last_fmts += 2;
>> +	for (i = 0, j = 0; i < ARRAY_SIZE(formats) - skip_last_fmts; i++) {
>> +		if (f->mbus_code && formats[i].code != f->mbus_code)
>> +			continue;
> 
> How about, instead of the skip_last_fmts thingy, using this:
> 
> 		/* Weed out pixelformats with the same mbus code. */
> 		if (i && formats[i - 1].code == formats[i].code)
> 			continue;

Good idea, but it should be this:

               /* Weed out duplicate pixelformats with different mbus codes */
               if (!f->mbus_code && i &&
                   formats[i - 1].pixelformat == formats[i].pixelformat)
                       continue;

And the duplicate pixelformats in the formats array must be together in the
array for this to work. Easy enough to change.

Regards,

	Hans

> 
>> +
>> +		if (j == f->index) {
>> +			f->pixelformat = formats[i].pixelformat;
>> +			return 0;
>> +		}
>> +		j++;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>>  static int
>>  isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
>>  {
>> @@ -1258,9 +1290,11 @@ isp_video_s_input(struct file *file, void *fh, unsigned int input)
>>  
>>  static const struct v4l2_ioctl_ops isp_video_ioctl_ops = {
>>  	.vidioc_querycap		= isp_video_querycap,
>> +	.vidioc_enum_fmt_vid_cap	= isp_video_enum_format,
>>  	.vidioc_g_fmt_vid_cap		= isp_video_get_format,
>>  	.vidioc_s_fmt_vid_cap		= isp_video_set_format,
>>  	.vidioc_try_fmt_vid_cap		= isp_video_try_format,
>> +	.vidioc_enum_fmt_vid_out	= isp_video_enum_format,
>>  	.vidioc_g_fmt_vid_out		= isp_video_get_format,
>>  	.vidioc_s_fmt_vid_out		= isp_video_set_format,
>>  	.vidioc_try_fmt_vid_out		= isp_video_try_format,
> 


