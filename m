Return-Path: <linux-media+bounces-42544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA81BB575A6
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 12:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0F92200DF0
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 10:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483832FABE2;
	Mon, 15 Sep 2025 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIsduP1N"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5864258EED
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757930982; cv=none; b=bYdl+76tPj/nB9p0PiaKUzX2ZPzXQ28/imeAlkJTbfcpUWUFQjgmE4mRFb+mkV+sKcu5DSfKT6qbuc2VJ+LEuGTQ/BoMhZdz5H+7afCCwouFGqdyDTAYgJjyOGM8062wFrHM0cSwAFC9V3IupG1sfEME5kgNJ8ZX0SS9OBFwgok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757930982; c=relaxed/simple;
	bh=DWu5wFEEwuMyOTvClMR+U8t3C3qYUz9f+R81XiQ8Aak=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ivhK1ILVsBIUq3Dfr6xdjQLdfIlXiSKDdJ87TVOArIuYRvKJusaNpEeS17xpHq9Vn7eWJyXqYc+uj2ZfHXDMpCIxzC1dEWV6VpvCJIrDBbBPdXJeld9LzL/eSBAQhDKLO7jG8n2SE7t7pVDOMwhFlNDJzBhaALrRjI5BSa2+Qy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIsduP1N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8104C4CEF1;
	Mon, 15 Sep 2025 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757930982;
	bh=DWu5wFEEwuMyOTvClMR+U8t3C3qYUz9f+R81XiQ8Aak=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=nIsduP1NXQBnc4c6AbqB+neCTRzEBbFCZ2lBiIf/4YM15VGC439Hv1JSlHbftfyDL
	 qteC9Js1MUGckU6y6JxDvsU9iPQk3LB8IdHp6f1db6+MuZ0IrfFbAgL0MkdvWU6UdA
	 fUP/zfpXXc3nWfFYx3INA6HpeuLqqZPngf6b0Lh0N+kW/HKqaaMD+Ld3qzZvxBwi9V
	 2dlWcHcOWGOV2rGhpd5scdbGtPjBDB8ftfThJ8IIYxFhtKquxERaURROe1JC2DwQRC
	 7l/BodslEEhdJYmv4E7mgnNiadCKexqajZBxVfYnpY8wIahnYu92ve2H7JES0NOJyj
	 0rWAilsr907nw==
Message-ID: <1f1fd450-8799-4c8f-bb5c-18ad044c5f12@kernel.org>
Date: Mon, 15 Sep 2025 12:09:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR v6.18] TI and Cadence CSI2RX drivers changes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@linux.dev>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>
References: <4wklgso7mjxss5nzrwtcwae6fm22snmw7zdx4lmdxs75tmklip@3w55xhfzkasw>
 <9bc39cae-ea86-4ef7-a97c-66469b082375@kernel.org>
 <v2xtw7soyiailistxcr24xj5uxzhlhljtf2hqdgarnzhnmms5d@rxojdydr7jqo>
 <6aa144e0-5ea0-4669-8398-dc6a35674b63@kernel.org>
 <20250915084427.GD22385@pendragon.ideasonboard.com>
 <8de3180d-5d53-4aa1-9e01-b6add8d67477@kernel.org>
 <20250915095211.GF22385@pendragon.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20250915095211.GF22385@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/09/2025 11:52, Laurent Pinchart wrote:
> On Mon, Sep 15, 2025 at 11:20:12AM +0200, Hans Verkuil wrote:
>> On 15/09/2025 10:44, Laurent Pinchart wrote:
>>> On Mon, Sep 15, 2025 at 10:24:34AM +0200, Hans Verkuil wrote:
>>>> On 12/09/2025 13:21, Jai Luthra wrote:
>>>>> On Fri, Sep 12, 2025 at 12:17:17PM +0200, Hans Verkuil wrote:
>>>>>> On 12/09/2025 11:55, Jai Luthra wrote:
>>>>>>> Hi Hans, Mauro,
>>>>>>>
>>>>>>> The following changes since commit ecba852dc9f4993f4f894ea1f352564560e19a3e:
>>>>>>>
>>>>>>>   media: redrat3: use int type to store negative error codes (2025-09-11 08:46:10 +0200)
>>>>>>>
>>>>>>> are available in the Git repository at:
>>>>>>>
>>>>>>>   https://gitlab.freedesktop.org/linux-media/users/jluthra.git tags/for-6.18-ti-j721e-csi2rx-signed
>>>>>>>
>>>>>>> for you to fetch changes up to c694e74c651e79838e817a8c6644dc72cf80540d:
>>>>>>>
>>>>>>>   media: ti: j721e-csi2rx: Support system suspend using pm_notifier (2025-09-12 14:37:56 +0530)
>>>>>>>
>>>>>>> ----------------------------------------------------------------
>>>>>>> TI and Cadence CSI2RX driver changes:
>>>>>>>
>>>>>>> - Multistream support for Cadence and TI CSI2RX
>>>>>>> - Runtime PM support for Cadence and TI CSI2RX
>>>>>>> - System suspend and resume support for TI CSI2RX
>>>>>>> - Misc cleanups
>>>>>>
>>>>>> This should go through Sakari most likely, possibly Laurent, seeing that this is CSI
>>>>>> related. Several patches do not even have a Reviewed-by from Sakari or Laurent.
>>>>>>
>>>>>> I can't take this, I'm afraid.
>>>>>>
>>>>>> I'm not sure why we get a PR from you, was there some misunderstanding?
>>>>>
>>>>> Apologies. I had a look at other "GIT PULL" messages on linux-media and 
>>>>> inferred that any driver maintainer can send a pull request for media tree.
>>>>
>>>> Ah, no. It's media maintainers that do that. For small subsystems you would post
>>>> patches and the subsystem maintainer will (when ready) merge them and send a PR
>>>> to Linus.
>>>>
>>>> For large subsystems like media you have multiple media maintainers, each responsible
>>>> for a part of the subsystem. They will review and prep a PR for the media maintainers
>>>> (me and Mauro) to pick up. The media subsystem is far too big for a single maintainer.
>>>>
>>>> Hopefully once we get the multi-committer up and running (pending doc changes) we can
>>>> do away with most of the PRs.
>>>
>>> Is there an objection against pull requests from driver maintainers ?
>>> Assuming all the other rules and requirements are met (passing CI,
>>> having the expected R-b tags, ...), is there a reason why I would need
>>> to collect a series posted by Jai and then send a pull request, instead
>>> of having Jai send the pull request directly ?
>>
>> If I get a PR from you, then I know that you, with your expertise, judged the
>> patches in the PR to be ready to be merged. Since it's from you I also can
>> trust that all the right tags are in place, that all the right people have
>> been pulled in if that was needed, etc.
>>
>> If the PR would be from a driver maintainer, then I don't have that additional
>> level of trust and I will have to pay closer attention to the patches in the PR,
>> checking tags, checking that nothing was forgotten, etc. Precisely what happened
>> in this case where tags were missing.
>>
>> As a general rule we don't accept PRs from non-media maintainers. It's something
>> we can discuss, though.
>>
>> BTW, when I talk about 'trust', it's about trusting the PR author to know all the
>> procedures, and having the expertise to know when something is ready to be merged.
>> It's not about malicious code or anything like that.
> 
> Understood. The risk of honest mistakes is at the moment much higher
> than the risk of malicious activity, given the complexity of the
> process. Whether that's good or bad news is debatable :-)

Indeed. It has become more and more complex over time. It's not media specific,
I think, it is a general trend. Not helped by confusion around things like when
to add a CC to stable, and now the Link tag discussion.

> 
>> So a driver maintainer will certainly know the driver code, and is expected to review
>> patches for that driver. But it takes time to gain the expertise to become a
>> media maintainer.
>>
>> I hope this helps.
> 
> Thank you for sharing you reasoning, it helps.
> 
> I would like to experiment with allowing pull requests from more
> contributors, but I don't want to increase your workload by forcing you
> to review those way more carefully. If that's OK with everybody, I
> propose, for the next version of the patches (once they get reviewed by
> the appropriate person) that Jai would send me pull request, following
> all our rules. I will check that everything is fine, and will then
> "forward" the pull request by sending you a pull request for the same
> commit ID, but from my tree and with a tag that carries my GPG
> signature. This will have no impact on your workflow, will allow me to
> delegate work to Jai, and will allow him to learn the subsystem rules.

That would be fine by me!

Regards,

	Hans

> 
>>>>> I looked at 
>>>>> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html but 
>>>>> that was not very informative.
>>>>>
>>>>> But yes, happy to wait for more reviews from Sakari and Laurent (or Tomi given 
>>>>> this is about streams support).
>>>>>
>>>>> Could the process and who-owns-what sub-subsystem be better documented in 
>>>>> docs.kernel.org or linuxtv.org? I am aware of the proposed multi-committer 
>>>>> model, but until that is finalized even the current process is hard to 
>>>>> understand for a newbie :-)
>>>>
>>>> It's here (link below), but I see that it is out-of-date: it's missing Nicolas Dufresne for
>>>> codecs and Bryan O'Donoghue for Qualcomm drivers.
>>>>
>>>> https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/maintainer-entry-profile.html#media-maintainers
>>>>
>>>> In any case, your PR came in too late. After rc6 is released we only merge fixes as a
>>>> general rule. It's good to keep that in mind for the next kernel cycle.
>>>>
>>>> If your PR contains fixes that you believe are important for v6.18, then discuss that
>>>> with Sakari and he can post a PR with those fixes.
>>>>
>>>>>>> ----------------------------------------------------------------
>>>>>>> Changhuang Liang (1):
>>>>>>>       media: cadence: csi2rx: Support runtime PM
>>>>>>>
>>>>>>> Jai Luthra (9):
>>>>>>>       dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
>>>>>>>       media: ti: j721e-csi2rx: separate out device and context
>>>>>>>       media: ti: j721e-csi2rx: add a subdev for the core device
>>>>>>>       media: ti: j721e-csi2rx: add support for processing virtual channels
>>>>>>>       media: cadence: csi2rx: add multistream support
>>>>>>>       media: ti: j721e-csi2rx: add multistream support
>>>>>>>       media: ti: j721e-csi2rx: Submit all available buffers
>>>>>>>       media: ti: j721e-csi2rx: Support runtime suspend
>>>>>>>       media: ti: j721e-csi2rx: Support system suspend using pm_notifier
>>>>>>>
>>>>>>> Pratyush Yadav (4):
>>>>>>>       media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
>>>>>>>       media: ti: j721e-csi2rx: allocate DMA channel based on context index
>>>>>>>       media: ti: j721e-csi2rx: get number of contexts from device tree
>>>>>>>       media: cadence: csi2rx: add get_frame_desc wrapper
>>>>>>>
>>>>>>> Rishikesh Donadkar (2):
>>>>>>>       media: ti: j721e-csi2rx: Remove word size alignment on frame width
>>>>>>>       media: ti: j721e-csi2rx: Change the drain architecture for multistream
>>>>>>>
>>>>>>>  Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml |   39 ++++++-
>>>>>>>  drivers/media/platform/cadence/Kconfig                            |    1 +
>>>>>>>  drivers/media/platform/cadence/cdns-csi2rx.c                      |  491 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
>>>>>>>  drivers/media/platform/ti/Kconfig                                 |    1 +
>>>>>>>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c             | 1167 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------
>>>>>>>  5 files changed, 1300 insertions(+), 399 deletions(-)
> 


