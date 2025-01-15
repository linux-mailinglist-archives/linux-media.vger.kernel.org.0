Return-Path: <linux-media+bounces-24814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE53A12C56
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 21:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E877F3A4A2C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 20:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE001D8DE1;
	Wed, 15 Jan 2025 20:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S50RHIQx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9001C8F77
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 20:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736972080; cv=none; b=Aa6qCUQAaZGUHDViYZ+rG15Rz99imjP4gWjRJFM/N+/OzyzdwNlYxmQc6y3wHmjfg7r7l5jG09vlSHUltWcH/nHb3P283CzPRInvAiU8G5KFdGTZwLd5ImBspJCf5tjcy3UZak++CxsAXos4awoJVbrMR43frNzqWSXcAwSJxCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736972080; c=relaxed/simple;
	bh=1EnBLa5A4AMSymJ8DdQmz8pbp/NVVpgqrMHdw1JRZlw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qtsd2JDe69PKBWRl3iCsJX1jdHnWL9BGYAUrvLKrdqRTp0kD99igxeyd3tKn2VjskUMJerw2MLZt2NsQL1eOreaBzfD3w0yfvnxLjcG1CmkhjR9W4+NWN2K8gns5fq4KQXDMtxBau0UTboVWtSkVwMiEBtwGq5bXRFXi3z2I2Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S50RHIQx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736972076;
	bh=1EnBLa5A4AMSymJ8DdQmz8pbp/NVVpgqrMHdw1JRZlw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=S50RHIQxzOL0SkCFl4rNW+ZiB69AnIgGATpZcrpxH6dy0YNiiOmR2Qg6Zs+mCg20W
	 XEp3aqX9iAfZbywDSdFebC+h03CxLBJ9oVVojguOTX9DT5kMcFwSmc8ZGoRYyKklOQ
	 VGoz3XM7Xm72RVhbvb5eJ6qFWCiALnCJkCyF7dr3gc7gSkqU/5oANIMO1TrGdmcAi9
	 rYiI9pifSpS013CrNrpsmbYWb0ztXLMlRl2plmtznPRlnYaZ/6LNvlSj9HYjEDDC3W
	 kTFTVpD7iK1XJKpy4Js/jW6goiM4smFbX5tn+EYZH/0CGfRg0fe/xnx5wKIAMajp3h
	 th2bvhLiDQhJg==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 22EED17E0F6B;
	Wed, 15 Jan 2025 21:14:35 +0100 (CET)
Message-ID: <a6bb546dcfe68334c5931cef01ea8af63ac64392.camel@collabora.com>
Subject: Re: Hantro H1 Encoding Upstreaming
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Daniel Almeida <dwlsalmeida@gmail.com>, Adam Ford <aford173@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, andrzejtp2010@gmail.com, Frank Li
 <frank.li@nxp.com>, ming.qian@oss.nxp.com,  linux-media
 <linux-media@vger.kernel.org>, linux-imx@nxmp.com, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Gustavo Padovan <gus@collabora.com>
Date: Wed, 15 Jan 2025 15:14:33 -0500
In-Reply-To: <Z4fOScVgLqYEU4Hw@collins>
References: 
	<CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
	 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
	 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com>
	 <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
	 <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com>
	 <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
	 <Z4fOScVgLqYEU4Hw@collins>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mercredi 15 janvier 2025 à 16:03 +0100, Paul Kocialkowski a écrit :
> Would be glad to not have to work on the GStreamer side and focus on kernel
> work instead. Sofar we can already aim to support:
> - Hantro H1
> - Hantro H2/VC8000E
> - Allwinner Video Engine

And Rockchip VEPUs, which have Open Source software implementation in libMPP.
Most of have access to reference software for the Hantro variants, I suppose you
have revered the Allwinner ?

p.s. there is also Imagination stateless codecs, but I only seen them on older
TI board.

> 
> > If you'd like to take a bite, this is a good thread to discuss forward. Until
> > the summer, I planned to reach to Paul, who made this great presentation [1] at
> > FOSDEM last year and start moving the RFC into using these ideas. One of the
> > biggest discussion is rate control, it is clear to me that modern HW integrated
> > RC offloading, though some HW specific knobs or even firmware offloading, and
> > this is what Paul has been putting some thought into.
> 
> In terms of RC offloading, what's I've seen in the Hantro H1 is a checkpoint
> mechanism that allows making per-slice QP adjustments around the global picture
> QP to bit the bill in terms of size. This can be a desirable thing if the use
> case is to stick to a given bitrate strictly.
> 
> There's also the regions of interest that are supported by many (most?) encoders
> and allow region-based QP changes (typically as offset). The number of available
> slots is hardware-specific.

Checkpoints seems unique Hantro, it has a lot of limitation as it 8 a raster set
of blocks. It won't perform well with a important object in the middle of the
scene.

> 
> In addition the H1 provides some extra statistics such as the "average"
> resulting QP when on of these methods is used.

Wasn't the statistic MAD (mean average distance), which is basically the average
residual values ? In my copy of VC8000E reference someone, all that has been
commented out, and the x265 implementation copied over (remember you can pay to
use their code in proprietary form, before jumping onto license violation).

> 
> I guess my initial point about rate control was that it would be easier for
> userspace to be able to choose a rate-control strategy directly and to have
> common implementations kernel-side that would apply to all codecs. It also
> allows leveraging hardware features without userspace knowing about them.
> 
> However the main drawback is that there will always be a need for a more
> specific/advanced use-case than what the kernel is doing (e.g. using a npu),
> which would need userspace to have more control over the encoder.

Which brings to the most modern form of advanced rate control. You will find
this in DXVA and Vulkan Video. It consist of splitting the image as an even
grid, and allowing delta or qualitative differences of QP for each of the
element in the grid. The size of that grid is limited by HW, you can implement
ROI on top of this too. Though, if the HW has ROI directly, we don't have much
option but to expose it as such, which is fine. A lot of stateful encoder have
that too, and the controls should be the same.

> 
> So a more direct interface would be required to let userspace do rate-control.
> At the end of the day, I think it would make more sense to expose these encoders
> for what they are and deal with the QP and features directly through the uAPI
> and avoid any kernel-side rate-control. Hardware-specific features that need to
> be configured and may return stats would just have extra controls for those.
> 
> So all in all we'd need a few new controls to configure the encode for codecs
> (starting with h.264) and also some to provide encode stats (e.g. requested qp,
> average qp). It feels like we could benefit from existing stateful encoder
> controls for various bitstream parameters.

Sounds like we should offer both. As I stated earlier, modern HW resort to
firmware offloading for performance reason. In V4L2, this is even more true. If
you read statistics such as MAD, bitstream size in a frame by frame basis, then
you will never queue more then 1 buffer on the capture side. So the programming
latency (including RC latency) will directly impact the encoder throughput. With
offloading, the statistic can be handled in firmware, or without any context
switch, which improve throughput.

This needs to be unbiased, the GStreamer implementation we did for the last RFC
runs frame by frame, using last frame size as the statistic. We still managed
the specified IP performance documented in the white paper.

Like everything else, we don't need all this in a first uAPI, but we need to
define the minimum "required" features.

> 
> Then userspace would be responsible for configuring each encode run with a
> target QP value, picture type and list of references. We'd need to also inform
> userspace of how many references are supported.

The H1 only have 1 reference + 1 long term reference (which only 1 reference was
implemented). We used the default reference model, so there was only one way to
manage and pass reference. There is clearly a lot more research to be done
around reference management.

Nicolas


