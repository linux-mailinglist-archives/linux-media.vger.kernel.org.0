Return-Path: <linux-media+bounces-48485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39399CB08C9
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 17:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1208830F32E1
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 16:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAC7301492;
	Tue,  9 Dec 2025 16:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLYXDRge"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7CA19F12A;
	Tue,  9 Dec 2025 16:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765297359; cv=none; b=AK0k+oejORpx2rnJTsnp8YxErQv1CZMdJL1MzAIAM1DevL1WpR7cxzhC3oyWTXdDUWbzvFJLZKyyd4LhupFQ05wGEF8Hv+csGAIiX8rlsXmIFWZ5+Oj5rCdJQkEQtY00ozw4ywXglQKkVH/4PnuNGKmHJi8WkLnYptxAaDyfgoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765297359; c=relaxed/simple;
	bh=SC+Q2Xx7G4zUf/y1G3B7CY3xaRwx0zRKq2UmADlF4do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SP8A7RcefEulPr1oaEIXvsvydI5qLH22NHQZtsOID753P62TAeNBalJAZTU+Qi+b9y1o+j/b4T2sTORMZCcQeU1s7WB/2VQ+vwh6UvtTU9W51x9xZALfUiL9wQxs5jqpJc6gVM2oT8PSflo8DvcCNMpqk1WVOwYRazvVNlaPcvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLYXDRge; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3788C4CEF5;
	Tue,  9 Dec 2025 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765297358;
	bh=SC+Q2Xx7G4zUf/y1G3B7CY3xaRwx0zRKq2UmADlF4do=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aLYXDRgekjMrAbiT0u8/y+2Nmsz8LytniLen/55oNSVY010jUvOoc7eR0sRtBb67h
	 jctqB2Ibhpq75tHI64rYN3YgMKw5lzAkpmxuiPEb2gfaoVO5dWXgHyMvRoHcFCDtwc
	 ZrPT206BKdd23EcPWbG4P76s4EViGjD64hn31fJ12NmdalEMVIGCZC4oFwKGa0JjO5
	 jmOn10feTZkudS50Ye2aWf0xztlLJtGVULp5w//qz0BQL5PGIJhsmJGJwKMeVxIRU8
	 6RmHyCGbV4cuBgxMupILu+KvA2c7sBM5amNpC+zci18BrlCDHuPP1wyFZ5sUHaLAkx
	 7Mm9oH5VU13ZQ==
Message-ID: <2bf30256-7647-488a-a8d8-4b4d2f0af813@kernel.org>
Date: Tue, 9 Dec 2025 17:22:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] media: uvcvideo: Import standard controls from
 uvcdynctrl
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Manav Gautama <bandwidthcrunch@gmail.com>,
 Martin Rubli <martin_rubli@logitech.com>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-2-0359ffb98c9e@chromium.org>
 <779a1a39-64f9-4985-b733-92f8673f3d3e@kernel.org>
 <1ea79ef0-ceba-43b3-9190-7a92c823e3d2@kernel.org>
 <CANiDSCsrAvwygBrQLsF9RVOUGpdOEaOhzE90=c2CrW8GGe6-=g@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CANiDSCsrAvwygBrQLsF9RVOUGpdOEaOhzE90=c2CrW8GGe6-=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Dec-25 7:28 AM, Ricardo Ribalda wrote:
> Hi Hans
> 
> 
> On Mon, 8 Dec 2025 at 20:12, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi,
>>
>> On 8-Dec-25 12:02 PM, Hans de Goede wrote:
>>> Hi Ricardo,
>>>
>>> Thank you very much for doing this, this has been on my own TODO list for
>>> a long time, so it is great to finally see this happen.
>>>
>>> On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
>>>> The uvcdynctrl tool from libwebcam:
>>>> https://sourceforge.net/projects/libwebcam/
>>>> maps proprietary controls into v4l2 controls using the UVCIOC_CTRL_MAP
>>>> ioctl.
>>>>
>>>> The tool has not been updated for 10+ years now, and there is no reason
>>>> for the UVC driver to not do the mapping by itself.
>>>>
>>>> This patch adds the mappings from the uvcdynctrl into the driver. Hopefully
>>>> this effort can help in deprecating the UVCIOC_CTRL_MAP ioctl.
>>>
>>> ...
>>>
>>> Question what happens if uvcdynctrl is run after applying this patch ?
>>
>> Answering my own question here, we will hit:
>>
>> drivers/media/usb/uvc/uvc_ctrl.c: 3166:
>>
>>         list_for_each_entry(map, &ctrl->info.mappings, list) {
>>                 if (mapping->id == map->id) {
>>                         uvc_dbg(dev, CONTROL,
>>                                 "Can't add mapping '%s', control id 0x%08x already exists\n",
>>                                 uvc_map_get_name(mapping), mapping->id);
>>                         ret = -EEXIST;
>>                         goto done;
>>                 }
>>         }
>>
>> So uvcdynctrl will see an EEXIST error. I think we need to add an -EEXIST check
>> to uvc_ctrl_add_mapping() )or uvc_ioctl_xu_ctrl_map() which is the only caller of
>> uvc_ctrl_add_mapping()) and if -EEXIST is returned do a uvc_warn_once() that duplicate
>> mappings are being ignored and return 0 instead of -EEXIST to avoid breaking existing
> 
> uvcdynctrl seems to handle this kind of error ok:
> 
> https://sourceforge.net/p/libwebcam/code/ci/master/tree/libwebcam/dynctrl.c#l1215
> 
> while(node_mapping) {
>   CResult ret = process_mapping(node_mapping, ctx);
>   if(ctx->info) {
>     if(ret)
>       ctx->info->stats.mappings.successful++;
>     else
>       ctx->info->stats.mappings.failed++;
>   }
>   node_mapping = xml_get_next_sibling_by_name(node_mapping, "mapping");
> }
> 
> https://sourceforge.net/p/libwebcam/code/ci/master/tree/libwebcam/dynctrl.c#l1199
> if(v4l2_ret != 0
> #ifdef DYNCTRL_IGNORE_EEXIST_AFTER_PASS1
> && (ctx->pass == 1 || errno != EEXIST)
> #endif
> )
> 
> https://sourceforge.net/p/libwebcam/code/ci/master/tree/libwebcam/libwebcam.h#l69
> /// Ignore EEXIST errors for the UVCIOC_CTRL_ADD and UVCIOC_CTRL_MAP ioctls for
> /// all but the first device. This is required if the driver uses
> global controls
> /// instead of per-device controls.
> #define DYNCTRL_IGNORE_EEXIST_AFTER_PASS1
> 
> 
> (BTW, I think the last comment ^^^ is wrong, it should be. Ignore
> EEXIST errors, or errors for second passes.
> But I might need a coffee :P)
> 
> 
> Looking at the debian codesearch:
> https://codesearch.debian.net/search?q=UVCIOC_CTRL_MAP+-path%3Aioctl.rs+-path%3Auvc_v4l2.c+-file%3Auvcvideo.rst+-file%3Auvc_ctrl.c+-file%3Auvcvideo.h&literal=1
> 
> the only occurrence that I am no sure if it will properly handle -EEXIST is:
> https://sources.debian.org/src/chromium/143.0.7499.40-1/chrome/browser/ash/chromebox_for_meetings/xu_camera/xu_camera_service.cc?hl=400#L400
> But that is ash-> ChromeOS browser. I can ask the code owner to fix it
> if needed.
> 
> 
> I'd rather not add the quirk that you are proposing if possible. I
> would expect that any/all the userspace handles -EEXIST because the
> uvc control state outlives the userspace.
> 
> 
> Let me know what you think.

Based on what you wrote above I think that going with -EEXIST is ok for
now, we can always revisit if we get complaints about this.

Regards,

Hans



