Return-Path: <linux-media+bounces-18973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 601F898CFF7
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9209E1C20A77
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7B5197A88;
	Wed,  2 Oct 2024 09:22:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB1E84A52
	for <linux-media@vger.kernel.org>; Wed,  2 Oct 2024 09:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727860920; cv=none; b=C77oXAYCn3HYl9p/KyUt/94D4hSKUUP3hzGOdnmWrFZHJu8XLigq9fi4JrdePQOkyunMJlpHmZSYq//DKDLGegOiJbxiaGmzJdPZYODZU751+XszI6g+l5H0rD4bDvKNJMXrgHKiXLOo9qc/ErevfMpPVDOCldjtC9sBbgbq6gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727860920; c=relaxed/simple;
	bh=XMWcCmLY15f6pctqDTyVSfZdnCRjSYs1Q8M/aGKtgUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g6KxUgaOlsCyZJVuq3ngOPPFSVicmjX24Nz2ecytFEbgMgoSCQ5uE+o7xKJP9Xrv0znqqXGP1jakitu/op+M6J3JmFnFjSEoOdZoldKSxJFpyM7Ljkan5u4F2IrVg7IigIAsKUZlahSUcTeVestdb8o49zBSceaJ6YrB8ffoXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BFBC4CEC5;
	Wed,  2 Oct 2024 09:21:59 +0000 (UTC)
Message-ID: <ed8c3d5f-2988-4aaf-a374-1d68805e87e5@xs4all.nl>
Date: Wed, 2 Oct 2024 11:21:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support for Si468x radio receiver
Content-Language: en-US
To: Robert Tiemann <rtie@gmx.de>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <ed03debb-163f-47df-99ec-9b62785172fc@gmx.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <ed03debb-163f-47df-99ec-9b62785172fc@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Robert,

On 10/1/24 15:35, Robert Tiemann wrote:
> Hi!
> 
> We'd like to use the Silicon Labs Si4688 FM/HD/DAB/DAB+ radio receiver
> chip in a product, but there is no kernel support for it yet. We have
> the full datasheet and Si468x Programming Guide available, so it
> should be possible to write a driver for that chip. The kernel
> supports the Si4768 already (which can do AM/FM/HD radio, but not
> DAB/DAB+), so I figured it should not be to hard to get the Si4688
> supported...
> 
> Then I checked the kernel sources for how DAB+ radio tuners are
> supposed to be handled by V4L2, but found nothing. Seems like V4L2 is
> restricted to abstraction of analog radio tuners, and there is
> currently no way to support DAB+ receivers. Is this correct or did I
> miss something? The same seems to be true about FM HD (the
> radio-si476x driver doesn't seem to support FM HD, only AM and FM).
> 
> Now, my question is, how should the FM HD/DAB/DAB+ parts of a
> hypothetical radio-si468x driver be implemented? Since DAB is quite
> different from FM, do we need a new tuner type in addition to
> V4L2_TUNER_RADIO? Or just new V4L2_BAND_MODULATION_FM_HD and
> V4L2_BAND_MODULATION_DAB definitions? Or is V4L2 sufficient the way
> it is and I am simply failing to understand how it should work?

First of all, I don't think we have any drivers that support DAB(+) today
in the mainline kernel. My limited understanding of DAB is that it is actually
something you would implement as part of the DVB API (digital video broadcasting).

I see a SYS_DAB in include/uapi/linux/dvb/frontend.h, suggesting that it is
indeed something that should be part of dvb, but that's where my knowledge
ends.

I CCed Mauro, he is the DVB expert, and he might know more about this.

Regards,

	Hans

