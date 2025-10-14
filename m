Return-Path: <linux-media+bounces-44410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF5CBD9376
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 14:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F8291922773
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 12:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB52311580;
	Tue, 14 Oct 2025 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8+i6X1w"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF3F25D546;
	Tue, 14 Oct 2025 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443488; cv=none; b=ANyVOlSeHwcNxVnqsrKFbgOwMm0bniRyvhME9gMj5umR0Noi1g3d7YJC5QAS7vA45ruzDKJEAnRB1Mzdw2juoMGPkmrpQD30iYha6IdrkWJwTKQ/HwN5wG3On2dACteW49ke9Qa0T6SiEsydNY0sfSmr3yFN7pJv7bvv0fQy41U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443488; c=relaxed/simple;
	bh=AvGMwLIFy7bHs/LBUU5JB/2hWcYVDmOQDHh4rrEYpgs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UsCxDd7cv2/3q7XcN12A3YcCYK7tx2mIqafWpbNsUe7pa0S2xd56rDv9GOPwmT9OCtnheS7eqZ09o5KEebd30Q58VfYft0ABd2EMgBa34mHy2pW4fKHdW7M9UBuL3VTurwwolCbv8/m/416NDeZJIP3qdZ9O2OcsWPZCXeriME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8+i6X1w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A171EC4CEE7;
	Tue, 14 Oct 2025 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760443487;
	bh=AvGMwLIFy7bHs/LBUU5JB/2hWcYVDmOQDHh4rrEYpgs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=d8+i6X1w/nv+jKX8ZNR1Kxkw0aMHsq+O4lnFUyUvRGPJkw/LKl7u/klYGHL0GsnLZ
	 pghOhCLQA57sV/7alhdQ0spte20L8VcCrmXJWv6AtEd7VbJ5zrSu1TTM8uOBjHPfHm
	 M+/QeE3CcCkPlKKSDdrSPPV7mviuP5OOBugZb40BCojYFp08nRe/fYaaFJc+nsGhVF
	 cqddW8KWUJZo+gCb1grb6f7w4EcjWHNHoDgdXJxogl3i95Hr4jzE7ajxUTworSikD0
	 V/+lXt0lTvp1S20nLX8JVgTKyU88MFE/6eDXbyoVShdew33Y+dCtCjkWHVMMicDoXa
	 95sobLSItFtew==
Message-ID: <0c11f4b3-a49c-47a5-8d76-98331281488c@kernel.org>
Date: Tue, 14 Oct 2025 14:04:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] media: i2c: imx214: Exit early on control init errors
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Ricardo Ribalda <ribalda@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251014-imx214-smatch-v2-1-04218043086d@chromium.org>
 <37ceef4f-4ed6-4554-9baf-3cddf3e36bd7@kernel.org>
 <CANiDSCvwKsQcCurmgUR=44z2fVF9NDQLHdHF4v-V+_4Z5jN9=g@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CANiDSCvwKsQcCurmgUR=44z2fVF9NDQLHdHF4v-V+_4Z5jN9=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2025 13:54, Ricardo Ribalda wrote:
> On Tue, 14 Oct 2025 at 13:52, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>
>> On 14/10/2025 13:00, Ricardo Ribalda wrote:
>>> Now we try to initialize all the controls and at the very end check
>>> ctrl_hdlr->error to check if one of them has failed.
>>>
>>> This confuses smatch, who do not know how to track the state of
>>> imx214->link_freq.
>>>
>>> drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)
>>>
>>> Fix this by exiting early on control initialization errors.
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>> Right now we are handling this with a quirk in media-ci, if Dan cannot
>>> fix smatch in a kernel cycle we should merge this patch.
>>
>> OK, will you keep track of this? This patch is delegated to me, so if you tell me when
>> it should be merged, then I can do that. And if it is fixed in smatch, then you can just
>> drop this patch in patchwork, of course.
> 
> Which is the latest rc that you will feel comfortable merging this? rc5? rc6?

Late rc5.

Regards,

	Hans

> 
> I can ping you then if smatch is not ready by then.
> 
> 
> Thanks :)
> 
>>
>> Until then it just stays in my TODO list.
>>
>> Regards,
>>
>>         Hans
>>
>>> ---
>>> Changes in v2:
>>> - Fix typo in commit message commit
>>> - Move error tag where it belongs (Thanks Hans!)
>>> - Link to v1: https://lore.kernel.org/r/20250829-imx214-smatch-v1-1-f3d1653b48e4@chromium.org
>>> ---
>>>  drivers/media/i2c/imx214.c | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
>>> index 94ebe625c9e6ee0fb67fe1d89b48b2f1bf58ffc6..c66f0e18726c3fc15df91c37888a797bcea82134 100644
>>> --- a/drivers/media/i2c/imx214.c
>>> +++ b/drivers/media/i2c/imx214.c
>>> @@ -1014,8 +1014,10 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>>>                                                  V4L2_CID_LINK_FREQ,
>>>                                                  imx214->bus_cfg.nr_of_link_frequencies - 1,
>>>                                                  0, imx214->bus_cfg.link_frequencies);
>>> -     if (imx214->link_freq)
>>> -             imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>> +     if (!imx214->link_freq)
>>> +             goto err_init_ctrl;
>>> +
>>> +     imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>
>>>       /*
>>>        * WARNING!
>>> @@ -1099,6 +1101,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>>>
>>>       v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx214_ctrl_ops, &props);
>>>
>>> +err_init_ctrl:
>>>       ret = ctrl_hdlr->error;
>>>       if (ret) {
>>>               v4l2_ctrl_handler_free(ctrl_hdlr);
>>>
>>> ---
>>> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
>>> change-id: 20250829-imx214-smatch-c4d4d47428d5
>>>
>>> Best regards,
>>
> 
> 


