Return-Path: <linux-media+bounces-65290-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x7dlNks/NWrrpwYAu9opvQ
	(envelope-from <linux-media+bounces-65290-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:08:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7CE6A5FB1
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:08:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=c8lS+RKp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65290-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65290-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CC713014954
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 13:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9503932E5;
	Fri, 19 Jun 2026 13:06:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF5138A726;
	Fri, 19 Jun 2026 13:06:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874392; cv=none; b=Y0kMc0G+xZ80VpsUTXF91VM6kNDsphYkfXQKElOO4b98QGA8RrHbdTbUSM8YHg9Gz7GoMbQfFhNtGi5IQJRfpmAB9Pec7VG4yZc/bgoIwqlPW/XMmq7rQ2NqvBtzSlM/CKkEd121p75iahOIeynU6ca6F5LfKwM5UJEEPhVKOo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874392; c=relaxed/simple;
	bh=XRpnFaAYD4JxTpfRYfnNlSejvTVS21ZFpueMCnBrIYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POEFvx806BDLEts/yCb6kgQfYIbJLi4aNxNDOOT7Dt670Xu+HsJSiiivyLHijNSo3Z/c402OR/kAWfd5r252hLjbGC+hz78rRVT1jzNLMdt/RazctxxibDhJKMl6qXlZ+T4HeoOLllr9ljL2foRW7bN7XGr7G1AYypXiu/ryisU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8lS+RKp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E2F1F000E9;
	Fri, 19 Jun 2026 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781874388;
	bh=B0QjJ0r3T1RYk1i9XytkOvWkCThvCLDC0VRduOm6DpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c8lS+RKpnAd1keGtLeakexrPve2/AQukDtnReKQWodsuTXoqc3RmD3YqH6q0lM1zn
	 NVAaXx10iVv8pWPUkPoTxE4SH4JOvXxa8uwp5XMP4fOVkaXNfTZSM2bpG6/D4i0WTA
	 heDp4lq5naMqkEao5PRUbl9xn9RHjZfgCj8uEMmUbOC44Djo7Q+IMfWi2jWfMFRMll
	 kN7/Ur3tv+Slwilh/PhJeiQ+xebFleAod0+7JHdnWxDdxR1/QUVt3mx1WEXUO3D4iq
	 BAUwTQmaOeVPvaTV2lXGR8JyLy7GiyX16HT2imNFvxb9qtjav04G/GCHaUpuJewbS2
	 OG+jWtzJDxOOQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1waYvS-00000000uOT-18em;
	Fri, 19 Jun 2026 15:06:26 +0200
Date: Fri, 19 Jun 2026 15:06:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
	Christopher Healy <healych@amazon.com>
Subject: Re: [PATCH v2 2/5] docs: media: add documentation for media client
 usage stats
Message-ID: <ajU9qkexEUtNqOng@foz.lan>
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
 <20260617-v4l2-add-fdinfo-v2-2-d298e98ce06a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-v4l2-add-fdinfo-v2-2-d298e98ce06a@collabora.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65290-lists,linux-media=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:detlev.casanova@collabora.com,m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:ezequiel@vanguardiasur.com.ar,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:healych@amazon.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D7CE6A5FB1

On Wed, Jun 17, 2026 at 02:10:57PM -0400, Detlev Casanova wrote:
> From: Christopher Healy <healych@amazon.com>
> 
> Document the media fdinfo interface for per-file-descriptor usage
> statistics exposed by stateless V4L2 codec drivers via
> /proc/<pid>/fdinfo/<fd>.
> 
> This interface is designed for stateless (request API based) codec
> devices where the kernel driver has per-job visibility into hardware
> execution. Stateful codecs cannot support all of this because their
> firmware manages job scheduling opaquely.
> 
> The specification defines media- prefixed keys for engine utilization
> time, and operating frequency, following the same conventions as the DRM
> fdinfo mechanism documented in drm-usage-stats.rst.
> 
> More fields can be added later.
> 
> Signed-off-by: Christopher Healy <healych@amazon.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../userspace-api/media/drivers/index.rst          |  1 +
>  .../media/drivers/media-usage-stats.rst            | 85 ++++++++++++++++++++++

Please notice that sysfs/procfs APIs are usually documented at
Documentation/ABI/, using a machine-readable format[1]. Still, we do want
it also at media uAPI. So, please add it there as well on your next spin.

[1] As those are new, Documentation/ABI/testing/ is probably the best place.

>  2 files changed, 86 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index 02967c9b18d6..61879738836c 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -34,6 +34,7 @@ For more details see the file COPYING in the source distribution of Linux.
>  	imx-uapi
>  	mali-c55
>  	max2175
> +	media-usage-stats
>  	npcm-video
>  	omap3isp-uapi
>  	thp7312
> diff --git a/Documentation/userspace-api/media/drivers/media-usage-stats.rst b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
> new file mode 100644
> index 000000000000..d3dc07002f62
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
> @@ -0,0 +1,85 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _media-usage-stats:
> +
> +==========================
> +Media client usage stats
> +==========================
> +
> +Stateless V4L2 codec drivers can optionally expose per-file-descriptor usage
> +statistics via ``/proc/<pid>/fdinfo/<fd>``. This is analogous to the DRM fdinfo
> +mechanism documented in :ref:`drm-client-usage-stats`, but uses the ``media-``
> +key prefix for V4L2 media devices.
> +
> +This interface is specific to stateless (request API based) codec devices,
> +including both decoders and encoders. With stateless codecs, the kernel driver
> +explicitly submits each frame to the hardware and receives a completion
> +interrupt, providing a clean per-job boundary that can be attributed to the
> +submitting file descriptor.
> +
> +Stateful codec devices cannot support this interface because their firmware
> +manages job scheduling internally. The kernel driver submits bitstream data
> +but has no visibility into per-frame hardware execution timing.
> +
> +Implementation
> +==============
> +
> +The V4L2 core provides the plumbing: drivers implement the ``show_fdinfo``
> +callback in ``struct v4l2_file_operations``, and the core wires it into the
> +kernel ``struct file_operations`` so that ``/proc/<pid>/fdinfo/<fd>`` output
> +includes the driver-provided keys.
> +
> +File format specification
> +=========================
> +
> +- File shall contain one key value pair per one line of text.
> +- Colon character (``:``) must be used to delimit keys and values.
> +- All standardised keys shall be prefixed with ``media-``.
> +- Driver-specific keys shall be prefixed with ``driver_name-``.
> +
> +Mandatory keys
> +--------------
> +
> +- media-driver: <valstr>
> +
> +  String shall contain the name of the media driver.
> +
> +- media-type: <valstr>
> +
> +  String shall identify the type of media engine exposed through this file
> +  descriptor. Standard values are ``decoder`` and ``encoder``.
> +
> +Utilization keys
> +----------------
> +
> +- media-engine-usage: <uint> ns
> +
> +  Time in nanoseconds that the hardware engine spent busy processing work
> +  belonging to this file descriptor. The engine being measured is identified
> +  by the ``media-type`` key.
> +
> +  Values are not required to be constantly monotonic if it makes the driver
> +  implementation easier, but are required to catch up with the previously
> +  reported larger value within a reasonable period.
> +
> +Frequency keys
> +--------------
> +
> +- media-maxfreq: <uint> Hz
> +
> +  Maximum operating frequency of the main engine clock.
> +
> +- media-curfreq: <uint> Hz
> +
> +  Current operating frequency of the main engine clock.
> +
> +Example output
> +==============
> +
> +::
> +
> +  media-driver:           hantro-vpu
> +  media-type:             decoder
> +  media-engine-usage:     123456789 ns
> +  media-maxfreq:          600000000 Hz
> +  media-curfreq:          600000000 Hz
> 
> -- 
> 2.54.0
> 

-- 
Thanks,
Mauro

