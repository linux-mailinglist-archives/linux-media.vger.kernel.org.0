Return-Path: <linux-media+bounces-45387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA61C0149F
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C396918C8859
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5D5315760;
	Thu, 23 Oct 2025 13:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGKzAEma"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD58314D1A;
	Thu, 23 Oct 2025 13:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225274; cv=none; b=GWss3k0DvO55wphflPwajkSOr2pc7gM+GTsQyfug5zmDudzSGkc43uUD+Zjeg/2ZXBXiaef62o0q4D3e4NLOH32qGKir8j8giqp3/pXI/lewDZXpomT50o0mn8kT2pD5GPaHUbT6J6IPdYlujOTh+IHnY5f2776FBcfNnnKAVkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225274; c=relaxed/simple;
	bh=PLd1NVzmQHGQzIcfZ9nEYp9jvBlKFleg3SJKD4eBeJk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=si8iQKpiyeKAx465uoQQkuLNR1GbRBF6yqmKdMiS1jalGcChHNrk0cqqnon3Fz++ECLPZU3yuBZ+SfqazLFkITTlZ85DcrKQNxd7KyzmtTyYL2z5Sz+R6JImKUjQTMnAOT1ddmrffxoQzP4zCH0cENZM72/KKmtRNfwlBVo1Z0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGKzAEma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F2DC4CEE7;
	Thu, 23 Oct 2025 13:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761225274;
	bh=PLd1NVzmQHGQzIcfZ9nEYp9jvBlKFleg3SJKD4eBeJk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=LGKzAEmaTPH8NSmWkzzvonEk4IiDY4od3aVcr/pqvudYANDc7pn4sGOThnAQ1Smvc
	 Gc0XLxiIhTg7qGIts/b38Gy1+zTRBDx9s3L7XR1JjsFuVLqiBX13YTl4ZZ0Xi1Mwao
	 VCGmYiY3WRdfd+SCS6OpmMQBlIvUBodtL19N8j/rmnvFomyHl3RhgJRTKDDim8+MI5
	 91gG+VNHHjuq30I56RTXJXMXOb4yZ0/6MdTpQFVD8aic3EskyYZfT4bLgEIuYLsWdz
	 Ln+HBaTDVdjI9Uhzg6rFXNZazdT4ozE7JySm9ordYsdxIkUh37Id1z9okHS7znWD8e
	 DjQTsfoXTC45A==
Message-ID: <7fc65c85-f75e-419c-aa1b-0c85376373d4@kernel.org>
Date: Thu, 23 Oct 2025 15:14:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3] media: v4l2-ctrls: add full AV1 profile validation in
 validate_av1_sequence()
To: jc@kynesim.co.uk
Cc: opensource india <opensource206@gmail.com>, mchehab@kernel.org,
 hverkuil@kernel.org, ribalda@chromium.org,
 laurent.pinchart@ideasonboard.com, yunkec@google.com,
 sakari.ailus@linux.intel.com, james.cowgill@blaize.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250913105252.26886-1-opensource206@gmail.com>
 <8199bec4-b9e1-4d6e-98da-a4d7eb667437@kernel.org>
 <CAKPKb8-s96v+Nh29Z5E0wgyXYgoFHJT2SHA_WpZshXspo0WY0w@mail.gmail.com>
 <f9001f98-80d6-49d5-8665-d42fcef7b07d@kernel.org>
 <CAFyCYyOFFMrDetScx_8_VgRpCVyTq_O0PGn1hDt7+UwMygqeXw@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAFyCYyOFFMrDetScx_8_VgRpCVyTq_O0PGn1hDt7+UwMygqeXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/10/2025 15:03, John Cox wrote:
> On Thu, 23 Oct 2025 at 11:44, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>
>> On 23/10/2025 12:32, opensource india wrote:
>>> On Wed, Oct 22, 2025 at 12:44 PM Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>>>
>>>> Hi Pavan,
>>>>
>>>> On 13/09/2025 12:52, Pavan Bobba wrote:
>>>>> Complete the "TODO: PROFILES" by enforcing profile-specific and
>>>>> monochrome constraints as defined by the AV1 specification
>>>>> (Section 5.5.2, "Color config syntax").
>>>>>
>>>>> The validator now checks:
>>>>>
>>>>>  - Flags: reject any unknown bits set in sequence->flags
>>>>>  - Profile range: only profiles 0..2 are valid
>>>>>  - Profile 0: 8/10-bit only, subsampling must be 4:2:0 (sx=1, sy=1),
>>>>>    monochrome allowed
>>>>>  - Profile 1: 8/10-bit only, subsampling must be 4:4:4 (sx=0, sy=0),
>>>>>    monochrome forbidden
>>>>>  - Profile 2:
>>>>>     * 8/10-bit: only 4:2:2 allowed (sx=1, sy=0)
>>>>>     * 12-bit: 4:4:4 (sx=0, sy=0), 4:2:2 (sx=1, sy=0), or 4:2:0 (sx=1, sy=1)
>>>>>       allowed
>>>>>  - Monochrome path (all profiles except 1): forces subsampling_x=1,
>>>>>    subsampling_y=1, separate_uv_delta_q=0
>>>>>
>>>>> These checks prevent userspace from providing invalid AV1 sequence
>>>>> headers that would otherwise be accepted, leading to undefined driver
>>>>> or hardware behavior.
>>>>
>>>> This patch was merged in our media-committers next branch, but I noticed that
>>>> it now fails the v4l2-compliance test for the visl driver.
>>>>
>>>> The cause is that the new validation now fails with the default values for
>>>> this control as set in std_init_compound().
>>>>
>>>> You can test this yourself by loading the visl driver and then running
>>>> v4l2-compliance -d /dev/videoX -E --verbose
>>>> (-E stops at the first error)
>>>>
>>>> Can you provide a patch to initialize this control with sane values?
>>>>
>>>> Apologies for not noticing this before: there are some issues with the automatic
>>>> regression tests in our CI, so the tests weren't run.
>>>>
>>>> Regards,
>>>>
>>>>         Hans
>>>>
>>>
>>> Hi Hans Verkuil,
>>>
>>> Thank you so much for the review.
>>> yes, v4l2-compliance expected to fail indeed since it is sending
>>> default values which, our newly added code rejects as per
>>> specification
>>>
>>> when you say patch, you mean patch for v4l2-compliance tool with
>>> proper values so that v4l2 core driver can accept?
>>
>> No, std_init_compound() in the kernel needs to be patched so the initial
>> value of this control passes the new validation tests. The initial control
>> values should always be sane.
> 
> Whilst that is a good principle it makes almost no sense in this
> context. There is almost no chance that a given bitstream will decode
> against a default sequence header and failing to set it explicitly is
> going to be a mistake on the users part. It seems to me that it is
> better to have something that is detectable as unset rather than
> something that is valid but wrong.
> 
> I accept that it is the V4L2 way to require "valid" default values for
> all supported ctrls, but it seems to me to be actively unhelpful for
> things like SPS / VPS / Tile Group Entry where if not set correctly
> from bits of the bitstream that the kernel doesn't get to see they
> will break the stream decode.

I agree, but the V4L2 design (not just controls, but also formats etc.) is
that they have valid values, even if it makes no sense in the bigger picture.

Now, is that the right design or not? You could argue either way, but the
fact is that that's how it was designed many years ago.

Changing this for just a single control is worse than just initing with the
minimum you can get away with. Bonus points if it is somewhat sane :-)

The advantage of always reporting valid values is that the application never
has to explicitly check if the format/control/etc. has invalid values.

Regards,

	Hans

> 
> I'm not going to argue this point but I felt that I wanted to make it.
> 
> Regards
> 
> John Cox
>> Regards,
>>
>>         Hans
>>
> 


