Return-Path: <linux-media+bounces-42524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDECB572CD
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 10:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6453D1792D4
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 08:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5752EB842;
	Mon, 15 Sep 2025 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5oDHcDt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AF22727F5
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757924678; cv=none; b=U8+zJJ0kFSW7GXyFN/x8f5TKf+1mTDC5s9oW4o4jX4YyhHIL2NAr4985IzEOpOZodo7zYcAN69w3INjMbaFQuQpHRTKh8o+uislvra3ldHTDpsHAegpAleocJ1m1Zr7C6RgaGMREnVq+djcISELpkbw08R4sHKtor5eLAFluqOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757924678; c=relaxed/simple;
	bh=aJ8rCmuQslwP1QLlCC8MHn57V0zxgnDCsmG+coM+Z+A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pGtmqZTPHunOjS28xJ1UU9RNe1FjM+PnitDv1KaOZo4drwa4W9yeXm42grVi1pnHHRCND3AbMK87T+t+MsHgRbyikncdWC0nvB4LCrEcAtKgjcVyiut2tRCs67x4S/hpwtJEC7gIxPcHvmjW/gwJI9DIYWsg6W3KazlrMzL+Jas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5oDHcDt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E743C4CEF1;
	Mon, 15 Sep 2025 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757924677;
	bh=aJ8rCmuQslwP1QLlCC8MHn57V0zxgnDCsmG+coM+Z+A=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=R5oDHcDtJNiWVQFf6djGkBP7sxPMUUqo0hGbnJ0lLWSpzNQuZYa3G4WbLUj+XviD6
	 EbW2J0aXib8di3WcRYDp52YwMFHJxtY92esN+ooQnZYvUg1zgtKuM2pwz/ntj/jgh5
	 lNCVAwdAvvLcNpd4QYrrMmq36uuxUsGXETSL7MpkeRN+Np5o5jQ9haYUd6GEvf3LQD
	 t1ySZQMF/dzslNs+k7tVmkVG8gPO80eND/yXeuDxDQiln3hqc0dY3ob8th6J1UcsAE
	 4lZEAHgq+rI6uHA2BuZPODJW7deXR5TkbfyxI3DY3SWAaZ4e2MxvKe3Nt9Xx7/GUDL
	 eTZ7+LWk5AY0A==
Message-ID: <6aa144e0-5ea0-4669-8398-dc6a35674b63@kernel.org>
Date: Mon, 15 Sep 2025 10:24:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR v6.18] TI and Cadence CSI2RX drivers changes
To: Jai Luthra <jai.luthra@linux.dev>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>
References: <4wklgso7mjxss5nzrwtcwae6fm22snmw7zdx4lmdxs75tmklip@3w55xhfzkasw>
 <9bc39cae-ea86-4ef7-a97c-66469b082375@kernel.org>
 <v2xtw7soyiailistxcr24xj5uxzhlhljtf2hqdgarnzhnmms5d@rxojdydr7jqo>
Content-Language: en-US, nl
In-Reply-To: <v2xtw7soyiailistxcr24xj5uxzhlhljtf2hqdgarnzhnmms5d@rxojdydr7jqo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2025 13:21, Jai Luthra wrote:
> Hi Hans,
> 
> On Fri, Sep 12, 2025 at 12:17:17PM +0200, Hans Verkuil wrote:
>> Hi Jai,
>>
>> On 12/09/2025 11:55, Jai Luthra wrote:
>>> Hi Hans, Mauro,
>>>
>>> The following changes since commit ecba852dc9f4993f4f894ea1f352564560e19a3e:
>>>
>>>   media: redrat3: use int type to store negative error codes (2025-09-11 08:46:10 +0200)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://gitlab.freedesktop.org/linux-media/users/jluthra.git tags/for-6.18-ti-j721e-csi2rx-signed
>>>
>>> for you to fetch changes up to c694e74c651e79838e817a8c6644dc72cf80540d:
>>>
>>>   media: ti: j721e-csi2rx: Support system suspend using pm_notifier (2025-09-12 14:37:56 +0530)
>>>
>>> ----------------------------------------------------------------
>>> TI and Cadence CSI2RX driver changes:
>>>
>>> - Multistream support for Cadence and TI CSI2RX
>>> - Runtime PM support for Cadence and TI CSI2RX
>>> - System suspend and resume support for TI CSI2RX
>>> - Misc cleanups
>>
>> This should go through Sakari most likely, possibly Laurent, seeing that this is CSI
>> related. Several patches do not even have a Reviewed-by from Sakari or Laurent.
>>
>> I can't take this, I'm afraid.
>>
>> I'm not sure why we get a PR from you, was there some misunderstanding?
>>
> 
> Apologies. I had a look at other "GIT PULL" messages on linux-media and 
> inferred that any driver maintainer can send a pull request for media tree.

Ah, no. It's media maintainers that do that. For small subsystems you would post
patches and the subsystem maintainer will (when ready) merge them and send a PR
to Linus.

For large subsystems like media you have multiple media maintainers, each responsible
for a part of the subsystem. They will review and prep a PR for the media maintainers
(me and Mauro) to pick up. The media subsystem is far too big for a single maintainer.

Hopefully once we get the multi-committer up and running (pending doc changes) we can
do away with most of the PRs.

> 
> I looked at 
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html but 
> that was not very informative.
> 
> But yes, happy to wait for more reviews from Sakari and Laurent (or Tomi given 
> this is about streams support).
> 
> Could the process and who-owns-what sub-subsystem be better documented in 
> docs.kernel.org or linuxtv.org? I am aware of the proposed multi-committer 
> model, but until that is finalized even the current process is hard to 
> understand for a newbie :-)

It's here (link below), but I see that it is out-of-date: it's missing Nicolas Dufresne for
codecs and Bryan O'Donoghue for Qualcomm drivers.

https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/maintainer-entry-profile.html#media-maintainers

In any case, your PR came in too late. After rc6 is released we only merge fixes as a
general rule. It's good to keep that in mind for the next kernel cycle.

If your PR contains fixes that you believe are important for v6.18, then discuss that
with Sakari and he can post a PR with those fixes.

Regards,

	Hans

> 
>> Regards,
>>
>> 	Hans
>>
> 
> Thanks,
> Jai
> 
>>>
>>> ----------------------------------------------------------------
>>> Changhuang Liang (1):
>>>       media: cadence: csi2rx: Support runtime PM
>>>
>>> Jai Luthra (9):
>>>       dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
>>>       media: ti: j721e-csi2rx: separate out device and context
>>>       media: ti: j721e-csi2rx: add a subdev for the core device
>>>       media: ti: j721e-csi2rx: add support for processing virtual channels
>>>       media: cadence: csi2rx: add multistream support
>>>       media: ti: j721e-csi2rx: add multistream support
>>>       media: ti: j721e-csi2rx: Submit all available buffers
>>>       media: ti: j721e-csi2rx: Support runtime suspend
>>>       media: ti: j721e-csi2rx: Support system suspend using pm_notifier
>>>
>>> Pratyush Yadav (4):
>>>       media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
>>>       media: ti: j721e-csi2rx: allocate DMA channel based on context index
>>>       media: ti: j721e-csi2rx: get number of contexts from device tree
>>>       media: cadence: csi2rx: add get_frame_desc wrapper
>>>
>>> Rishikesh Donadkar (2):
>>>       media: ti: j721e-csi2rx: Remove word size alignment on frame width
>>>       media: ti: j721e-csi2rx: Change the drain architecture for multistream
>>>
>>>  Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml |   39 ++++++-
>>>  drivers/media/platform/cadence/Kconfig                            |    1 +
>>>  drivers/media/platform/cadence/cdns-csi2rx.c                      |  491 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
>>>  drivers/media/platform/ti/Kconfig                                 |    1 +
>>>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c             | 1167 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------
>>>  5 files changed, 1300 insertions(+), 399 deletions(-)
>>>
>>> --
>>> Thanks,
>>>
>>> Jai
>>>
>>


