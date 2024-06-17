Return-Path: <linux-media+bounces-13399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 705F190A8A0
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E39B11F21D24
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 08:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE41A190493;
	Mon, 17 Jun 2024 08:38:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677D517F5
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 08:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718613523; cv=none; b=pO9IE4RL3qMrFlkR2k6MZa+URDyza614deaIEfkdtc7KI6Gs+yUp3dz/4NRTnVEugHMRFjCtoPXTy1pcSBqjnBiRuD445E7lJsCJOuJl+y4p7xJhXI7gbkzFbMpNLKNZAlEXZ+4/QsYMu+zyPPuKhlDKtsnQnwCUngvm1shOJjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718613523; c=relaxed/simple;
	bh=tFEuYAyEiv+/LpaGU44Y6ODa8xySRZWWQB50ov9K4mE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpLR1RUrkl8dIVxml4Y1E6BdRTSZmmQfbza5isuJcM0D3gZuuRD4+l0csm6CjPwK2nH3VxS8WJRGZ0In8qnwPE74KtWLj3TQoVnow6EoDKI6OrSyDuUhkjIk5mmr5h8YW9i1zjEZjrE1Q3hRZ/VEoS2378Wwf0qg/vOy4Kwu1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7641DC2BD10;
	Mon, 17 Jun 2024 08:38:41 +0000 (UTC)
Message-ID: <6028df14-a73b-42e9-857c-6202297fc5b9@xs4all.nl>
Date: Mon, 17 Jun 2024 10:38:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4l-utils] utils: media-ctl: Install media-ctl header and
 library files
To: "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Gandhi, Neel" <neel.gandhi@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "Hatle, Mark" <mark.hatle@amd.com>,
 "Allagadapa, Varunkumar" <varunkumar.allagadapa@amd.com>,
 "Sagar, Vishal" <vishal.sagar@amd.com>
References: <20240614065120.896247-1-neel.gandhi@amd.com>
 <20240614100445.GD6806@pendragon.ideasonboard.com>
 <BY5PR12MB4950321E05846F4A64793C25FCC22@BY5PR12MB4950.namprd12.prod.outlook.com>
 <20240615003525.GG9171@pendragon.ideasonboard.com>
 <Zm_rGLHKsPQjzLho@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <Zm_rGLHKsPQjzLho@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2024 09:51, sakari.ailus@iki.fi wrote:
> Hi Laurent,
> 
> On Sat, Jun 15, 2024 at 03:35:25AM +0300, Laurent Pinchart wrote:
>> Hi Neel,
>>
>> On Fri, Jun 14, 2024 at 01:07:24PM +0000, Gandhi, Neel wrote:
>>> Hi Laurent,
>>>
>>> Thank you for your quick response. Please see my below inline response.
>>>
>>> On Friday, June 14, 2024 3:35 PM, Laurent Pinchart wrote:
>>>> On Fri, Jun 14, 2024 at 12:21:20PM +0530, Neel Gandhi wrote:
>>>>> Install mediactl and v4l2subdev header and library files, which may be
>>>>> required by 3rd party applications to populate and control v4l2subdev
>>>>> device node tree
>>>>
>>>> We haven't done so because the API of those libraries is currently internal, and
>>>> not guaranteed to be stable.
>>>
>>> So, if one's application is developed based on those libraries, then
>>> is there any alternative solution for it?
>>
>> Good question. I personally have no issue with applications using those
>> libraries, as long as they don't expect a stable API. This means that
>> any future version of v4l-utils may ship incompatible libraries, and
>> that won't be considered as a regression, and won't be addressed. If we
>> want to go that way, I think we should install static versions of the
>> libraries only, as dynamic linking will really be asking for trouble.
>>
>> A better option, of course, would be to offer a stable API. That will
>> require work, the current API will need to be reviewed and improved to
>> make sure we can then extend it in a backward-compatible way whenever
>> the kernel APIs get extended. It's not work that I could commit to, so
>> we would need a volunteer for work on that and then maintain the
>> libraries.
>>
>> Hans, Sakari, any opinion ?
> 
> Given it's been around for a decade without much changes, it wouldn't seem
> unreasonable to consider the API stable. A lot of projects copy the code in
> verbatim which makes fixing bugs very hard. :-(
> 
> I think the API could be improved on and the library could use G_TOPOLOGY
> IOCTL. Neither has happened but these don't much affect the value of the
> librarisation.
> 
> I've already proposed making this a proper library previously and I still
> believe it should be one.

I quickly looked at the API and I think it needs work before it is suitable
for a generic library API. It is was never meant as a public API.

Making it a proper library is a lot more work and needs someone to maintain
it. I'm not maintaining this code, so it is not up to me, but for what it is
worth, I would recommend against it.

Regards,

	Hans

> 
>>
>> Neel, out of curiosity, what do you use those libraries for (if you can
>> tell publicly) ?
>>
>>> As in the prior versions of v4l-utils package, those libraries are
>>> available to use but it was removed from v1.25+ onwards (from meson
>>> related changes in c2b91b9c3853b2cbcbe170a542864a3147d179ee commitID).
>>> We're using yocto scarthgap, which is using v1.26.
>>>
>>>>> Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
>>>>> ---
>>>>>  utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
>>>>>  1 file changed, 21 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
>>>>> index 3a7b0c9a..40669b4c 100644
>>>>> --- a/utils/media-ctl/meson.build
>>>>> +++ b/utils/media-ctl/meson.build
>>>>> @@ -3,14 +3,24 @@ libmediactl_sources = files(
>>>>>      'mediactl-priv.h',
>>>>>  )
>>>>>
>>>>> +libmediactl_api = files(
>>>>> +    'mediactl.h',
>>>>> +    'v4l2subdev.h',
>>>>> +)
>>>>> +
>>>>> +install_headers(libmediactl_api, subdir: 'mediactl')
>>>>> +
>>>>>  libmediactl_deps = [
>>>>>      dep_libudev,
>>>>>  ]
>>>>>
>>>>> -libmediactl = static_library('mediactl',
>>>>> -                             libmediactl_sources,
>>>>> -                             dependencies : libmediactl_deps,
>>>>> -                             include_directories : v4l2_utils_incdir)
>>>>> +libmediactl = library('mediactl',
>>>>> +                      libmediactl_sources,
>>>>> +                      soversion: '0',
>>>>> +                      version: '0.0.0',
>>>>> +                      install : true,
>>>>> +                      dependencies : libmediactl_deps,
>>>>> +                      include_directories : v4l2_utils_incdir)
>>>>>
>>>>>  dep_libmediactl = declare_dependency(link_with : libmediactl)
>>>>>
>>>>> @@ -18,9 +28,13 @@ libv4l2subdev_sources = files('libv4l2subdev.c')
>>>>> libv4l2subdev_sources += media_bus_format_names_h
>>>>> libv4l2subdev_sources += media_bus_format_codes_h
>>>>>
>>>>> -libv4l2subdev = static_library('v4l2subdev',
>>>>> -                               libv4l2subdev_sources,
>>>>> -                               include_directories : v4l2_utils_incdir)
>>>>> +libv4l2subdev = library('v4l2subdev',
>>>>> +                        libv4l2subdev_sources,
>>>>> +                        soversion: '0',
>>>>> +                        version: '0.0.0',
>>>>> +                        install : true,
>>>>> +                        dependencies : dep_libmediactl,
>>>>> +                        include_directories : v4l2_utils_incdir)
>>>>>
>>>>>  dep_libv4l2subdev = declare_dependency(link_with : libv4l2subdev)
>>>>>
>>
> 


