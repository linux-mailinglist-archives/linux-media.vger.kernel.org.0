Return-Path: <linux-media+bounces-46221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDABC2CB94
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 16:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DA283B98C8
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 15:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83968314A9B;
	Mon,  3 Nov 2025 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSuRumxA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8F4280318;
	Mon,  3 Nov 2025 14:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762181855; cv=none; b=MxyUecHz0HM7Xg3mbUXHmA1hQusQAO5BhYG9LPnAuOVzXsgR4fZMFnQ4hIcEVljZIYJYmifLeZtzIDVIBpeuxTppt90+cqRn75xCVxU00QSiyxLE8Hei+OAv0JoaLbmdgy96vknaVDge14TJ0RJArAh4KKdllNLECIMnTsgQUAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762181855; c=relaxed/simple;
	bh=oMWyReLEXY6etc/RXv5rvgB/h4bJgJr7T8StnrzmVhE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=p321Zxkb/tpqMfYCQUUVOeM050OpDNVbDhdZvDWgtzmQ7eQRmAnnK6wgKhtOa/mnlSxcUYEnJiqsfqf0ax71ZD+qekSBv6jlXFIuznlhfZVNfjdCWcZYbW7n/B2E925qHJZAxBgZ6Sl6kop92eZ5VoL/rNoN1ZUgIY/Pq+ZbfgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSuRumxA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD5BC4CEFD;
	Mon,  3 Nov 2025 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762181854;
	bh=oMWyReLEXY6etc/RXv5rvgB/h4bJgJr7T8StnrzmVhE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=OSuRumxAqQJ53J0UHJ+mMHBdnIyuA6iJ4heXXnpCL5XqWGD4TcqYjIm8Ma5YVAbA8
	 LoA0N+PAe2P3+kRNyMtxfsVdd2yatL3TS/f+WO0FRaQ8tZHqRO4mD5WoeV/oRJYgqx
	 e2knEOLtZVYld2tVaXBqJ0WwCDJAF9pgQuAHplQH1N8eqAWuz/sUf0nEAhzLddUS0c
	 fMkIogALaROtDdmzZbW3yvCoC0VWudhobFGH7Y45Je6c3e9t//IIlNpa0T4jwK1+tJ
	 1s9kfexWceQluMyNWEBaQPtsTX+40KzPCjrOyAQe+EhWtVL6EA1vXiPFRG8HLnCBoB
	 EIg0jibq00ssA==
Message-ID: <b38c4013-fabb-4469-bfa9-9296a88d244a@kernel.org>
Date: Mon, 3 Nov 2025 15:57:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [RFC PATCH v1 0/2] media: pci: AVMatrix HWS capture driver
 refresh
To: Ben Hoff <hoff.benjamin.k@gmail.com>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org, hverkuil@kernel.org,
 lukas.bulwahn@redhat.com
References: <20251027195638.481129-1-hoff.benjamin.k@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20251027195638.481129-1-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

Thank you for working on this!

On 27/10/2025 20:56, Ben Hoff wrote:
> Hi all,
> 
> This RFC series significantly refactors the downstream AVMatrix HWS PCIe
> capture driver so it is maintainable in-tree and aligns with upstream
> media driver expectations. The new implementation follows V4L2 and ALSA
> subsystem patterns, splits the hardware plumbing across focused source
> files, and introduces proper runtime PM and interrupt handling. The goal
> is to keep future maintenance manageable while providing a direct path for
> existing users of the vendor tree.
> 
> Current status / open items:
>   - Audio capture paths have been refactored from the vendor driver but have
>     not yet been validated on real hardware. I would appreciate guidance
>     on whether you would prefer that I drop the ALSA pieces from the
>     initial submission and stage them as a follow-up once I finish
>     validation.
>   - `v4l2-compliance` passes for each video node, and I have exercised
>     basic capture in OBS. I still plan to do heavier soak testing across
>     all inputs and audio channels, as well as cover the suspend/resume
>     paths.
> 
> Any feedback on the overall structure, subsystem integration, and in
> particular the best way to stage the audio support would be very welcome.

I think you have two options:

1) wait until you finish the audio validation, or
2) make this a staging driver (drivers/staging/media), add the audio part
   later and then move it to drivers/media/pci.

Regarding this driver: I gather that this is a rework of a GPL out-of-tree
driver? Can you should at least add a URL that driver? That should definitely
be part of the commit log of the driver.

Is the vendor involved in this upstream driver work? Or you just took their
code and made it suitable for mainlining? Just curious.

Finally, for the next v1 please include the v4l2-compliance output in the
cover letter. And make sure you compile v4l2-compliance from the v4l-utils
git repo so you are using the latest and greatest version.

Regards,

	Hans

> Once I hear back on the preferred direction I will respin this as a
> formal v1 submission.
> 
> Thanks for taking a look!
> 
> Ben
> 
> Ben Hoff (2):
>   media: pci: add AVMatrix HWS capture driver
>   MAINTAINERS: add entry for AVMatrix HWS driver
> 
>  MAINTAINERS                            |    6 +
>  drivers/media/pci/Kconfig              |    1 +
>  drivers/media/pci/Makefile             |    1 +
>  drivers/media/pci/hws/Kconfig          |   13 +
>  drivers/media/pci/hws/Makefile         |    4 +
>  drivers/media/pci/hws/hws.h            |  194 +++
>  drivers/media/pci/hws/hws_audio.c      |  571 +++++++++
>  drivers/media/pci/hws/hws_audio.h      |   22 +
>  drivers/media/pci/hws/hws_irq.c        |  281 +++++
>  drivers/media/pci/hws/hws_irq.h        |   12 +
>  drivers/media/pci/hws/hws_pci.c        |  708 +++++++++++
>  drivers/media/pci/hws/hws_reg.h        |  142 +++
>  drivers/media/pci/hws/hws_v4l2_ioctl.c |  576 +++++++++
>  drivers/media/pci/hws/hws_v4l2_ioctl.h |   32 +
>  drivers/media/pci/hws/hws_video.c      | 1542 ++++++++++++++++++++++++
>  drivers/media/pci/hws/hws_video.h      |   24 +
>  16 files changed, 4129 insertions(+)
>  create mode 100644 drivers/media/pci/hws/Kconfig
>  create mode 100644 drivers/media/pci/hws/Makefile
>  create mode 100644 drivers/media/pci/hws/hws.h
>  create mode 100644 drivers/media/pci/hws/hws_audio.c
>  create mode 100644 drivers/media/pci/hws/hws_audio.h
>  create mode 100644 drivers/media/pci/hws/hws_irq.c
>  create mode 100644 drivers/media/pci/hws/hws_irq.h
>  create mode 100644 drivers/media/pci/hws/hws_pci.c
>  create mode 100644 drivers/media/pci/hws/hws_reg.h
>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
>  create mode 100644 drivers/media/pci/hws/hws_video.c
>  create mode 100644 drivers/media/pci/hws/hws_video.h
> 


