Return-Path: <linux-media+bounces-56832-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBaDHMlYwmnQbwQAu9opvQ
	(envelope-from <linux-media+bounces-56832-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:26:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F593058EA
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFF8230C09BB
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9146F3DA7C2;
	Tue, 24 Mar 2026 09:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEufzgZW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3096363C49;
	Tue, 24 Mar 2026 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343979; cv=none; b=K14IgKzctw3WrXThQ7nNbXT4WJHUrlO/lMM3K/N02zeFX+ymeojT4hewlfzveaFVjr07roz8tXxi88I4T+KdNNq49L2f3nYp0D2vNmZpmnEL21G89qie+TGyjkrtWkXVbmsOFkEEAPr4Iq1Xo4oM+IRzsRe0i9/lniwcAAtCoVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343979; c=relaxed/simple;
	bh=ru8FnEspDBdDivrAVnS5NX5fHjlaHR7PNzx5/+5Yh7k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NASSI12PF+5WGCwlkVY2xDE7WAu3Gc8h3tLYlsjEXeo0FFN88d0PHgvit6UnRnYVAPF75YRLAoPzB3o/10okeDLeDS0CIXu9XVlIafdr3CdUyObK9QpArZrnQy7OuiFgdQ3mLWe3fgzqueFFlXcOdAX8SiSgU25TrnE9DvT4hls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEufzgZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFECC19424;
	Tue, 24 Mar 2026 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774343979;
	bh=ru8FnEspDBdDivrAVnS5NX5fHjlaHR7PNzx5/+5Yh7k=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=LEufzgZWJJzp5lkySKNZeEvRInZ5IHLloD5T6lQvv9SamCRFU/gw89MyvVo/bwPnU
	 G/lCUR7MXKU27O3fFjhE2HMbYfo/J2wN1pBSLXzpr3z//QZyW+kwGmi2ECPc5GnXRR
	 fngiEXCatjf3iIU/iB5Eu6o45jwaOBXtpAP0R16L8B4gBenlf+FchTwueSFYwC/L23
	 jsYqeZFybjzYwFu1z2HhgsTmqIQ2ESqU75AEf5raSU21ZY3VX0BqzrxqreLttDX37l
	 uc2NBjnNIg3N5uE0OfoEHoqGqGkhjfAf9KE+6LzLxK7NJHe9Nl+n9cOB/RjYN1ZhOI
	 pGJP9p1N3DgBQ==
Message-ID: <405fad61-8c46-4993-a2fc-286729fcfb8d@kernel.org>
Date: Tue, 24 Mar 2026 10:19:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 0/2] media: pci: add AVMatrix HWS capture driver
To: Ben Hoff <hoff.benjamin.k@gmail.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
 <20260318001056.465071-1-hoff.benjamin.k@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260318001056.465071-1-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56832-lists,linux-media=lfdr.de,cisco];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E1F593058EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ben,

On 18/03/2026 01:10, Ben Hoff wrote:
> Add an AVMatrix HWS PCIe capture driver and its MAINTAINERS entry.
> 
> The driver exposes one V4L2 capture node per input channel, supports
> YUYV capture through vb2-dma-contig, reports DV timings, emits
> SOURCE_CHANGE events, and provides the basic brightness/contrast/
> saturation/hue controls used by the hardware.

I found some issues that need to be addressed, so a v3 is needed.

Please provide the v4l2-compliance output as well when posting v3.

Regards,

	Hans

> 
> Changes in v2:
> - keep scratch DMA allocation on a single probe-owned path
> - fix hws_video_register()/probe unwind ownership to avoid control-handler
>   double-free on late registration failures
> - on live input resolution changes, emit SOURCE_CHANGE, error queued
>   buffers, and require userspace to renegotiate buffers and restart
>   streaming
> - add enum_frameintervals and report DV_RX_POWER_PRESENT, addressing the
>   two v1 v4l2-compliance warnings
> 
> Testing for v2:
> - build-tested with W=1:
>   make -C /home/hoff/swdev/linux O=/tmp/hws-build \
>     M=drivers/media/pci/hws W=1 KBUILD_MODPOST_WARN=1 modules
> - checkpatch.pl --no-tree --strict --file ... is clean for the new files
> 
> Context carried forward from v1:
> - audio support remains intentionally omitted from this submission
> - the driver is derived from a GPL out-of-tree driver; the baseline tree is
>   available at https://github.com/benhoff/hws/tree/baseline
> - a vendor driver bundle is available at
>   https://www.acasis.com/pages/acasis-product-drivers
> - the vendor is not involved in this upstreaming effort
> 
> Ben Hoff (2):
>   media: pci: add AVMatrix HWS capture driver
>   MAINTAINERS: add entry for AVMatrix HWS driver
> 
>  MAINTAINERS                            |    6 +
>  drivers/media/pci/Kconfig              |    1 +
>  drivers/media/pci/Makefile             |    1 +
>  drivers/media/pci/hws/Kconfig          |   12 +
>  drivers/media/pci/hws/Makefile         |    4 +
>  drivers/media/pci/hws/hws.h            |  176 +++
>  drivers/media/pci/hws/hws_irq.c        |  271 +++++
>  drivers/media/pci/hws/hws_irq.h        |   10 +
>  drivers/media/pci/hws/hws_pci.c        |  864 +++++++++++++
>  drivers/media/pci/hws/hws_reg.h        |  144 +++
>  drivers/media/pci/hws/hws_v4l2_ioctl.c |  778 ++++++++++++
>  drivers/media/pci/hws/hws_v4l2_ioctl.h |   43 +
>  drivers/media/pci/hws/hws_video.c      | 1546 ++++++++++++++++++++++++
>  drivers/media/pci/hws/hws_video.h      |   29 +
>  14 files changed, 3885 insertions(+)
>  create mode 100644 drivers/media/pci/hws/Kconfig
>  create mode 100644 drivers/media/pci/hws/Makefile
>  create mode 100644 drivers/media/pci/hws/hws.h
>  create mode 100644 drivers/media/pci/hws/hws_irq.c
>  create mode 100644 drivers/media/pci/hws/hws_irq.h
>  create mode 100644 drivers/media/pci/hws/hws_pci.c
>  create mode 100644 drivers/media/pci/hws/hws_reg.h
>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
>  create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
>  create mode 100644 drivers/media/pci/hws/hws_video.c
>  create mode 100644 drivers/media/pci/hws/hws_video.h
> 
> 
> base-commit: f0caa1d49cc07b30a7e2f104d3853ec6dc1c3cad


