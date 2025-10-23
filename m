Return-Path: <linux-media+bounces-45371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F48C008DF
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 12:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36BB33A5369
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 10:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FED30AD08;
	Thu, 23 Oct 2025 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6wQvmfV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CE13090CD;
	Thu, 23 Oct 2025 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761216235; cv=none; b=cWJwqDOMpCH8A5yVAwdoTpomdw3W/00+fdRGMO3Ubc52/LuwZNNAiP9rZIXafK1J9u+qNTQaBTmDm448OCEOpxXxz58iwWruqePTYWayHX+A+fE+PKnaKHTqGqZcdJqOoVm/9ubQ06H39SFUYpTRjMggT6PUq79PZ0dflI6Uoxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761216235; c=relaxed/simple;
	bh=v3W29lmu2vesvPmXeVocXYYr2DEm1Otyo/PcVtTBofQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MW1lKVNvJa4fo6t/srEZGpX7xqT4Slf4+CKU3TLhjqEw0ZN3hDoVUfRfMFTXFrApRf+qd4OGGb2ftpKe5amFNTbV71dSPcyny/lk0H35jxKqD+2dQSD5AVatGdLFa2rWD+qYxNTibxnmj50Zb0BD0HvTJM4knIWXksD4fjA50Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6wQvmfV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333CEC4CEE7;
	Thu, 23 Oct 2025 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761216235;
	bh=v3W29lmu2vesvPmXeVocXYYr2DEm1Otyo/PcVtTBofQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=S6wQvmfVMaxhiOCVH7AaUKNA8Uhv2WDLgmWUf3RAnIC5feiNy5GveIqMM+fs3WN2k
	 Lh3zfaubl285ZOscRa1GPNevZBVTmJLG1ie1PqrnmDErq911NuRfdi9mpm4VVLRvkS
	 7Jc88rUuIE0DcGmM5GArjD5mmWfQf16K0qRV7r4+YVc3ggixXOhu/ShSAIh/PBcgBU
	 4T307ka0dE+WWuiZGWceHxJgdC54VfN6uwa/C07I3Zz/urXgH9ugwfDAspF8FILF8D
	 m84/RBsxCdo9WwvBg6G3vfetXqAqXaiZ9c0J1PDCE2kJFc0r1INDK329/iIJHsxKcU
	 NMIQtHKcdp6wg==
Message-ID: <f9001f98-80d6-49d5-8665-d42fcef7b07d@kernel.org>
Date: Thu, 23 Oct 2025 12:43:50 +0200
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
To: opensource india <opensource206@gmail.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, ribalda@chromium.org,
 laurent.pinchart@ideasonboard.com, yunkec@google.com,
 sakari.ailus@linux.intel.com, james.cowgill@blaize.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250913105252.26886-1-opensource206@gmail.com>
 <8199bec4-b9e1-4d6e-98da-a4d7eb667437@kernel.org>
 <CAKPKb8-s96v+Nh29Z5E0wgyXYgoFHJT2SHA_WpZshXspo0WY0w@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAKPKb8-s96v+Nh29Z5E0wgyXYgoFHJT2SHA_WpZshXspo0WY0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/10/2025 12:32, opensource india wrote:
> On Wed, Oct 22, 2025 at 12:44 PM Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>
>> Hi Pavan,
>>
>> On 13/09/2025 12:52, Pavan Bobba wrote:
>>> Complete the "TODO: PROFILES" by enforcing profile-specific and
>>> monochrome constraints as defined by the AV1 specification
>>> (Section 5.5.2, "Color config syntax").
>>>
>>> The validator now checks:
>>>
>>>  - Flags: reject any unknown bits set in sequence->flags
>>>  - Profile range: only profiles 0..2 are valid
>>>  - Profile 0: 8/10-bit only, subsampling must be 4:2:0 (sx=1, sy=1),
>>>    monochrome allowed
>>>  - Profile 1: 8/10-bit only, subsampling must be 4:4:4 (sx=0, sy=0),
>>>    monochrome forbidden
>>>  - Profile 2:
>>>     * 8/10-bit: only 4:2:2 allowed (sx=1, sy=0)
>>>     * 12-bit: 4:4:4 (sx=0, sy=0), 4:2:2 (sx=1, sy=0), or 4:2:0 (sx=1, sy=1)
>>>       allowed
>>>  - Monochrome path (all profiles except 1): forces subsampling_x=1,
>>>    subsampling_y=1, separate_uv_delta_q=0
>>>
>>> These checks prevent userspace from providing invalid AV1 sequence
>>> headers that would otherwise be accepted, leading to undefined driver
>>> or hardware behavior.
>>
>> This patch was merged in our media-committers next branch, but I noticed that
>> it now fails the v4l2-compliance test for the visl driver.
>>
>> The cause is that the new validation now fails with the default values for
>> this control as set in std_init_compound().
>>
>> You can test this yourself by loading the visl driver and then running
>> v4l2-compliance -d /dev/videoX -E --verbose
>> (-E stops at the first error)
>>
>> Can you provide a patch to initialize this control with sane values?
>>
>> Apologies for not noticing this before: there are some issues with the automatic
>> regression tests in our CI, so the tests weren't run.
>>
>> Regards,
>>
>>         Hans
>>
> 
> Hi Hans Verkuil,
> 
> Thank you so much for the review.
> yes, v4l2-compliance expected to fail indeed since it is sending
> default values which, our newly added code rejects as per
> specification
> 
> when you say patch, you mean patch for v4l2-compliance tool with
> proper values so that v4l2 core driver can accept?

No, std_init_compound() in the kernel needs to be patched so the initial
value of this control passes the new validation tests. The initial control
values should always be sane.

Regards,

	Hans

