Return-Path: <linux-media+bounces-56369-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ORvEvVOvGkXwwIAu9opvQ
	(envelope-from <linux-media+bounces-56369-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:31:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E3E2D1ACC
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2232430F2A62
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E980F3C9428;
	Thu, 19 Mar 2026 19:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="jYnor4XH"
X-Original-To: linux-media@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D47B39C011
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 19:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773948626; cv=none; b=H5+fnYNZp0A0ACm5Wr0mIb1jsLjVF9IwpemuUQnCwD8mryxsBXjmHHj87GMm4bFHYOkoTdIXN27UERlVknA0MBzxM8rRkFoDglHklPAkTVNuUsvVddYKJgbO+vO3bonEAUFBeiwLTQEGC4iYh41oMjqnPXqdz/HX99j1tvoL/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773948626; c=relaxed/simple;
	bh=hEL0PHTo7AQhG/8GAXvMixzRPJPl6koSwFDjLudJkZ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JCRNI8wnMMEU7R7LbqEgXCH8DWvoUfv2hlM1hcY7g0AwwDS9F+LNxWkMpd2w58ccExS3jdjqUPFpNkAyEzfMnmazfEpKF82v1+Jc5FiS2rA4JzYdcFh7NQxLAcXOOzVrdzwaDEe5CRexvOieHbc47jrFH87YQ5BrPNiuJq7v2so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=jYnor4XH; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1AA95240104
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 20:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1773948616; bh=q3Ty2rMUXWrI+Dw+O8BMuW+g1hkiDWZuTXFRx7/LGyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=jYnor4XHuX4y0Ei3ESr2vYmExzddT/I8MWa6hYnwSaMnVs3+xuIXPqOyFFM8XAz3I
	 VtfnmKTxKJbKawbVeyreA+ivMjw+mqAZI+i8YxQohGf4d3HW6zYMZ2RSOqm7oI0FS1
	 Eb8pwgM85IaC+QzlX6KnWzBIZWjVBBMhiwjAX36KGxmM2gzb20JL4SVuyryNTHxU/R
	 GBirJz+So6m5hwVHn1QWiZ7ypub5+dYT7SyBKZ/3y4QoqfqFE2payE4cvMUT5YU+FA
	 bStJ00oijwlRF2sZJsVNYWLRsIzE2AEkFNFmqsGySvZbEo1owegGqLhX1AlXuxVqgJ
	 6EshfQUkWkDoA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fcG4K6pw3z6twZ;
	Thu, 19 Mar 2026 20:30:09 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Michael Riesch via B4 Relay
 <devnull+michael.riesch.collabora.com@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Heiko Stuebner
 <heiko@sntech.de>,  Kever Yang <kever.yang@rock-chips.com>,  Jagan Teki
 <jagan@amarulasolutions.com>,  =?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YU=?=
 =?utf-8?B?0LDQuNC7?=
 <mai.kuznetsov.misha@gmail.com>,  Sebastian Reichel
 <sebastian.reichel@collabora.com>,  Nicolas Dufresne
 <nicolas.dufresne@collabora.com>,  Collabora Kernel Team
 <kernel@collabora.com>,  Sakari Ailus <sakari.ailus@linux.intel.com>,
  michael.riesch@collabora.com,  linux-media@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-rockchip@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] Documentation: admin-guide: media: add rk3588 vicap
In-Reply-To: <20250430-rk3588-vicap-v2-1-77de5ee9048e@collabora.com>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
	<20250430-rk3588-vicap-v2-1-77de5ee9048e@collabora.com>
Date: Thu, 19 Mar 2026 19:30:14 +0000
Message-ID: <m2h5qbd3cv.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[posteo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[posteo.net:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[posteo.net:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-56369-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charmitro@posteo.net,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.849];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,michael.riesch.collabora.com,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rkcif-rk3588-vicap.dot:url,collabora.com:email]
X-Rspamd-Queue-Id: D9E3E2D1ACC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org> writes:

> From: Michael Riesch <michael.riesch@collabora.com>
>
> Add a section that describes the Rockchip RK3588 VICAP.
>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../admin-guide/media/rkcif-rk3588-vicap.dot       | 29 ++++++++++++++++++++
>  Documentation/admin-guide/media/rkcif.rst          | 32 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>
> diff --git a/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot b/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot
> new file mode 100644
> index 000000000000..f6d3404920b5
> --- /dev/null
> +++ b/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot
> @@ -0,0 +1,29 @@
> +digraph board {
> +        rankdir=TB
> +        n00000007 [label="{{<port0> 0} | rkcif-mipi2\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000007:port1 -> n0000000a
> +        n00000007:port1 -> n00000010 [style=dashed]
> +        n00000007:port1 -> n00000016 [style=dashed]
> +        n00000007:port1 -> n0000001c [style=dashed]
> +        n0000000a [label="rkcif-mipi2-id0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +        n00000010 [label="rkcif-mipi2-id1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> +        n00000016 [label="rkcif-mipi2-id2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> +        n0000001c [label="rkcif-mipi2-id3\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> +        n00000025 [label="{{<port0> 0} | rkcif-mipi4\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000025:port1 -> n00000028
> +        n00000025:port1 -> n0000002e [style=dashed]
> +        n00000025:port1 -> n00000034 [style=dashed]
> +        n00000025:port1 -> n0000003a [style=dashed]
> +        n00000028 [label="rkcif-mipi4-id0\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
> +        n0000002e [label="rkcif-mipi4-id1\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
> +        n00000034 [label="rkcif-mipi4-id2\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
> +        n0000003a [label="rkcif-mipi4-id3\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
> +        n00000043 [label="{{<port0> 0} | dw-mipi-csi2rx fdd30000.csi\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000043:port1 -> n00000007:port0
> +        n00000048 [label="{{<port0> 0} | dw-mipi-csi2rx fdd50000.csi\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000048:port1 -> n00000025:port0
> +        n0000004d [label="{{} | imx415 3-001a\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n0000004d:port0 -> n00000043:port0
> +        n00000051 [label="{{} | imx415 4-001a\n/dev/v4l-subdev5 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000051:port0 -> n00000048:port0
> +}
> diff --git a/Documentation/admin-guide/media/rkcif.rst b/Documentation/admin-guide/media/rkcif.rst
> index 2558c121abc4..fcd7f8cfc5d3 100644
> --- a/Documentation/admin-guide/media/rkcif.rst
> +++ b/Documentation/admin-guide/media/rkcif.rst
> @@ -77,3 +77,35 @@ and the following video devices:
>  .. kernel-figure:: rkcif-rk3568-vicap.dot
>      :alt:   Topology of the RK3568 Video Capture (VICAP) unit
>      :align: center
> +
> +Rockchip RK3588 Video Capture (VICAP)
> +-------------------------------------
> +
> +The RK3588 Video Capture (VICAP) unit features a digital video port and six
> +MIPI CSI-2 capture interfaces that can receive video data independently.
> +The DVP accepts parallel video data, BT.656 and BT.1120.
> +Since the BT.1120 protocol may feature more than one stream, the RK3568 VICAP

Nit, should this be RK3588 instead of RK3568?

> +DVP features four DMA engines that can capture different streams.
> +Similarly, the RK3588 VICAP MIPI CSI-2 receivers feature four DMA engines each
> +to handle different Virtual Channels (VCs).
> +
> +The rkcif driver represents this hardware variant by exposing the following
> +V4L2 subdevices:
> +
> +* dw-mipi-csi2rx fdd30000.csi: MIPI CSI-2 receiver connected to MIPI DPHY0
> +* dw-mipi-csi2rx fdd50000.csi: MIPI CSI-2 receiver connected to MIPI DPHY1
> +* rkcif-mipi2: INTERFACE/CROP block for the MIPI CSI-2 receiver connected to
> +  MIPI DPHY0
> +* rkcif-mipi4: INTERFACE/CROP block for the MIPI CSI-2 receiver connected to
> +  MIPI DPHY1
> +
> +and the following video devices:
> +
> +* rkcif-mipi2-id{0,1,2,3}: The DMA engines connected to the rkcif-mipi2
> +  INTERFACE/CROP block.
> +* rkcif-mipi4-id{0,1,2,3}: The DMA engines connected to the rkcif-mipi4
> +  INTERFACE/CROP block.
> +
> +.. kernel-figure:: rkcif-rk3588-vicap.dot
> +    :alt:   Topology of the RK3588 Video Capture (VICAP) unit
> +    :align: center

