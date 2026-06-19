Return-Path: <linux-media+bounces-65244-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eOfRLzDTNGpphwYAu9opvQ
	(envelope-from <linux-media+bounces-65244-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 07:27:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A500F6A3F00
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 07:27:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=FyWeDAbd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65244-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65244-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A291301518C
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 05:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D993264DE;
	Fri, 19 Jun 2026 05:27:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A303D40D598;
	Fri, 19 Jun 2026 05:26:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781846822; cv=none; b=VDjXL9M3NND/+3yRbu3qa05TfKPya99gFbqyl+SUQ4sl6w4MFHFHYAhyfyaIZf4fbccy/Atl8ayuMw/vrEBwGq7eQl3c+9am1oZkzSfhUPWnBvbPy9bOli8ZcdE5ADoKgYoqaw/7dbfumPxbcB/I+yF4Dm45PJpFX9NFZcslicM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781846822; c=relaxed/simple;
	bh=ri3GLALkdclrGp1ImW0Sz2hkHPgk2vG7ChOZMwyLV+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ArnChH4qhkNTk94jIKpaZU18SCTrtFryp9pqY+t4K+PJ0SO/K+jq8QehjHnL58kuZ/UaUzHm3M4Q+M5S0F2yQ9V7DiTUTCmVs9gWvGi0OKQCp7o2ujB4KR2jTpwldqiXFNFcKz6ufzLOvROfjyUnqSOn/bmth5QuBx0/Gsg7BoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FyWeDAbd; arc=none smtp.client-ip=213.167.242.64
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:327:f131:c148:b7f8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E0CE1494;
	Fri, 19 Jun 2026 07:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781846780;
	bh=ri3GLALkdclrGp1ImW0Sz2hkHPgk2vG7ChOZMwyLV+A=;
	h=From:To:Cc:Subject:Date:From;
	b=FyWeDAbd6jK55XNn/i1qbtvg304BKYAcLZndeLfkM5ugHw2Nls+LECIX1SFl8s6H3
	 SAaX6RHG2L/bvMJnQIihtpLo4Bila1c15hYPgrMMuPKLopFloCAiEzL05Jj3GlRWX1
	 RpUHVVyiTfhm9PqYI1ugpLaYev5FDha8g+vB9PxM=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	nicolas.dufresne@collabora.com,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com
Subject: [RFC PATCH 0/6] Add Shared Media Graph API
Date: Fri, 19 Jun 2026 14:26:27 +0900
Message-ID: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65244-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:michael.riesch@collabora.com,m:xuhf@rock-chips.com,m:stefan.klug@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,pasteboard.co:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A500F6A3F00

Hello everyone,

This patch series extends the media controller API with a Shared Media
Graph framework.

We have started to run into platforms where there are multiple media
drivers that ought to be participating in the same media graph, but it's
undecidable who should own the media device.

One example of this is the RK3588 which has a capture interface (VICAP,
handled by rkcif) and two ISP instances (handled by rkisp2). Another
example is the i.MX8MP which has an image sensor interface (ISI, handled
by imx8-isi) and two ISP instances (handled by rkisp1). Since they
cannot all be in the same media graph at the moment, on the RK3588 we
can only support memory-to-memory mode between the VICAP and ISP, while
in the i.MX8MP we cannot use the ISI and ISP simultaneously.

The drivers for these ISPs and capture interfaces also support hardware
where only the ISP or only the capture interface is present (eg. imx8mn
only has ISI; rk3399 only has rkisp1). This means that we cannot simply
make one of them always the main device of the media graph.

This topic was discussed over a lunch at Embedded Recipes, and the
conclusion was that the best solution is to add a mechanism where
drivers could join an existing media device, or create one if none were
available. This series implements such a mechanism, which I have
tentatively named Shared Media Graph.


Patch 1 implements the Shared Media Graph API. The rest of the series
are a functioning example implementation on the aforementioned RK3588
setup.

This framework allows the aforementioned setups to work. For this
series, I specfically targeted the RK3588 setup, and I am able to have
both the VICAP and the ISP in the same media graph [0] [5]. I can switch
between inline mode and memory-to-memory mode by enabling/disabling the
link between the rkcif and rkisp2, and can successfully capture in both
modes.

There are still a lot of rough edges in the framework that need to be
discussed and sorted out (aka RFC); see all of the TODOs in patch 1 for
details. Actually everything that I want comments on are in the TODOs
for patch 1. The rest of the series are less RFC and more "here's an
example of how it would work".


This patch series is based on linux-media/next (06cb687a5132) [1] and
depends on:
- v5 of "media: rockchip: rkcif: add support for rk3588 vicap" [2]
- rfc of "media: rockchip: rkisp2: Add driver for ISP on Rk3588" [3]

I have a branch here [4].

[0] https://www.pasteboard.co/i-p5Z10LMHJ5.png
[1] https://gitlab.freedesktop.org/linux-media/media-committers/-/tree/next
[2] https://lore.kernel.org/all/20260522-rk3588-vicap-v5-3-d1d1f5265c56@collabora.com/
[3] https://lore.kernel.org/all/20260424175853.638202-1-paul.elder@ideasonboard.com/
[4] https://gitlab.freedesktop.org/linux-media/users/epaul/-/tree/epaul/v7.1-rc1/rk3588/shared-mc/upstream

[5] media-ctl -p and dot output for when the pasteboard [0] expires:

Media controller API version 7.1.0

Media device information
------------------------
driver          rockchip-cif
model           rkisp2
serial          
bus info        platform:rkisp2
hw revision     0x1e
driver version  7.1.0

Device topology
- entity 9: rkcif-mipi2 (3 pads, 6 links, 2 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
	routes:
		0/0 -> 1/0 [ACTIVE]
		0/0 -> 2/0 [ACTIVE]
	pad0: SINK,MUST_CONNECT
		[stream:0 fmt:SRGGB10_1X10/1920x1080 field:none]
		<- "dw-mipi-csi2rx fdd30000.csi":1 [ENABLED]
	pad1: SOURCE
		[stream:0 fmt:SRGGB10_1X10/1920x1080 field:none
		 crop.bounds:(0,0)/1920x1080
		 crop:(0,0)/1920x1080]
		-> "rkcif-mipi2-id0":0 []
		-> "rkcif-mipi2-id1":0 []
		-> "rkcif-mipi2-id2":0 []
		-> "rkcif-mipi2-id3":0 []
	pad2: SOURCE
		[stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
		 crop.bounds:(0,0)/1920x1080
		 crop:(0,0)/1920x1080]
		-> "rkisp2_isp":4 [ENABLED]

- entity 13: rkcif-mipi2-id0 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
	pad0: SINK,MUST_CONNECT
		<- "rkcif-mipi2":1 []

- entity 19: rkcif-mipi2-id1 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video1
	pad0: SINK,MUST_CONNECT
		<- "rkcif-mipi2":1 []

- entity 25: rkcif-mipi2-id2 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video2
	pad0: SINK,MUST_CONNECT
		<- "rkcif-mipi2":1 []

- entity 31: rkcif-mipi2-id3 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video3
	pad0: SINK,MUST_CONNECT
		<- "rkcif-mipi2":1 []

- entity 49: dw-mipi-csi2rx fdd30000.csi (2 pads, 2 links, 1 route)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
	routes:
		0/0 -> 1/0 [ACTIVE]
	pad0: SINK,MUST_CONNECT
		[stream:0 fmt:SRGGB10_1X10/1920x1080 field:none]
		<- "imx219 4-0010":0 [ENABLED]
	pad1: SOURCE
		[stream:0 fmt:SRGGB10_1X10/1920x1080 field:none]
		-> "rkcif-mipi2":0 [ENABLED]

- entity 54: imx219 4-0010 (1 pad, 1 link, 0 routes)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev2
	pad0: SOURCE
		[stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
		 crop.bounds:(8,8)/3280x2464
		 crop:(688,700)/1920x1080]
		-> "dw-mipi-csi2rx fdd30000.csi":0 [ENABLED]

- entity 64: rkisp2_isp (5 pads, 8 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev3
	pad0: SINK
		[stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
		 crop.bounds:(0,0)/1920x1080
		 crop:(0,0)/1920x1080]
		<- "rkisp2_rawrd0":0 []
		<- "rkisp2_rawrd1":0 []
		<- "rkisp2_rawrd2":0 []
	pad1: SINK
		[stream:0 fmt:unknown/0x0]
		<- "rkisp2_params":0 [ENABLED,IMMUTABLE]
	pad2: SOURCE
		[stream:0 fmt:YUYV8_2X8/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:lim-range
		 crop.bounds:(0,0)/1920x1080
		 crop:(0,0)/1920x1080]
		-> "rkisp2_mainpath":0 [ENABLED,IMMUTABLE]
		-> "rkisp2_selfpath":0 [ENABLED,IMMUTABLE]
	pad3: SOURCE
		[stream:0 fmt:unknown/0x0]
		-> "rkisp2_stats":0 [ENABLED,IMMUTABLE]
	pad4: SINK
		[stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
		 crop.bounds:(0,0)/1920x1080
		 crop:(0,0)/1920x1080]
		<- "rkcif-mipi2":2 [ENABLED]

- entity 70: rkisp2_mainpath (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video5
	pad0: SINK
		<- "rkisp2_isp":2 [ENABLED,IMMUTABLE]

- entity 74: rkisp2_selfpath (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video6
	pad0: SINK
		<- "rkisp2_isp":2 [ENABLED,IMMUTABLE]

- entity 78: rkisp2_rawrd0 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video7
	pad0: SOURCE
		-> "rkisp2_isp":0 []

- entity 82: rkisp2_rawrd1 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video8
	pad0: SOURCE
		-> "rkisp2_isp":0 []

- entity 86: rkisp2_rawrd2 (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video9
	pad0: SOURCE
		-> "rkisp2_isp":0 []

- entity 90: rkisp2_params (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video10
	pad0: SOURCE
		-> "rkisp2_isp":1 [ENABLED,IMMUTABLE]

- entity 94: rkisp2_stats (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video11
	pad0: SINK
		<- "rkisp2_isp":3 [ENABLED,IMMUTABLE]


digraph board {
	rankdir=TB
	n00000009 [label="{{<port0> 0} | rkcif-mipi2\n/dev/v4l-subdev0 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
	n00000009:port1 -> n0000000d [style=dashed]
	n00000009:port1 -> n00000013 [style=dashed]
	n00000009:port1 -> n00000019 [style=dashed]
	n00000009:port1 -> n0000001f [style=dashed]
	n00000009:port2 -> n00000040:port4
	n0000000d [label="rkcif-mipi2-id0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
	n00000013 [label="rkcif-mipi2-id1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
	n00000019 [label="rkcif-mipi2-id2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
	n0000001f [label="rkcif-mipi2-id3\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
	n00000031 [label="{{<port0> 0} | dw-mipi-csi2rx fdd30000.csi\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
	n00000031:port1 -> n00000009:port0
	n00000036 [label="{{} | imx219 4-0010\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
	n00000036:port0 -> n00000031:port0
	n00000040 [label="{{<port0> 0 | <port1> 1 | <port4> 4} | rkisp2_isp\n/dev/v4l-subdev3 | {<port2> 2 | <port3> 3}}", shape=Mrecord, style=filled, fillcolor=green]
	n00000040:port2 -> n00000046 [style=bold]
	n00000040:port2 -> n0000004a [style=bold]
	n00000040:port3 -> n0000005e [style=bold]
	n00000046 [label="rkisp2_mainpath\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
	n0000004a [label="rkisp2_selfpath\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
	n0000004e [label="rkisp2_rawrd0\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
	n0000004e -> n00000040:port0 [style=dashed]
	n00000052 [label="rkisp2_rawrd1\n/dev/video8", shape=box, style=filled, fillcolor=yellow]
	n00000052 -> n00000040:port0 [style=dashed]
	n00000056 [label="rkisp2_rawrd2\n/dev/video9", shape=box, style=filled, fillcolor=yellow]
	n00000056 -> n00000040:port0 [style=dashed]
	n0000005a [label="rkisp2_params\n/dev/video10", shape=box, style=filled, fillcolor=yellow]
	n0000005a -> n00000040:port1 [style=bold]
	n0000005e [label="rkisp2_stats\n/dev/video11", shape=box, style=filled, fillcolor=yellow]
}

Paul Elder (6):
  media: mc: Implement shared media graph
  arm64: dts: rockchip: rk3588s-base: Connect vicap and isps
  media: rkcif: Use shared media graph
  media: rkisp2: Use shared media graph
  media: rkcif: Implement inline mode
  media: rkisp2: Implement inline mode

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  30 ++
 drivers/media/mc/Makefile                     |   2 +-
 drivers/media/mc/mc-shared-graph.c            | 335 ++++++++++++++++++
 .../rockchip/rkcif/rkcif-capture-dvp.c        |   2 +-
 .../rockchip/rkcif/rkcif-capture-mipi.c       |   3 +
 .../platform/rockchip/rkcif/rkcif-common.h    |  18 +-
 .../media/platform/rockchip/rkcif/rkcif-dev.c |  32 +-
 .../platform/rockchip/rkcif/rkcif-interface.c | 248 ++++++++++++-
 .../platform/rockchip/rkcif/rkcif-regs.h      |  49 +++
 .../platform/rockchip/rkcif/rkcif-stream.c    |   6 +-
 .../platform/rockchip/rkisp2/rkisp2-common.h  |   5 +-
 .../platform/rockchip/rkisp2/rkisp2-dev.c     |  46 +--
 .../platform/rockchip/rkisp2/rkisp2-isp.c     | 155 ++++++--
 include/media/mc-shared-graph.h               |  92 +++++
 14 files changed, 932 insertions(+), 91 deletions(-)
 create mode 100644 drivers/media/mc/mc-shared-graph.c
 create mode 100644 include/media/mc-shared-graph.h

-- 
2.47.2


