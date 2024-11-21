Return-Path: <linux-media+bounces-21762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B59D4DE9
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 660E3281B7A
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4FC1D86C0;
	Thu, 21 Nov 2024 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="beCyBhGP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="t1mcqBt2"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B54155330;
	Thu, 21 Nov 2024 13:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732196504; cv=none; b=PeeU+xS1c+x9u9U3TTDo9hG6V6wZenBauhYYShLe2hiX1Cg0YjVrBC5aGyvYP4CdWhDhkS3tegVh89bUjotZ/p9tWLXVuAfQFgKqH/juPWf/ahlZcz23wh6cXTRIUAJwySbM6EcrHm8k75Bf9gRu5e//iUjAmqR7ZC9jjoWMeGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732196504; c=relaxed/simple;
	bh=3GbjA5vulskTvk0OIgMGa2PjjXD5aeIgekFv8HIMNmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rpofEeIsomOg3CzkdAQ+NCaVTyIicoP8aEmPVhbzOvRVTX/DcD0XmC+qG1dc0uJ97q5TZn5B0iCDKrK5+qIP6sIvs8Z3eYvAqqu83qaK3kB7kcKq5nRgAcEtMZ3oGqcV/YH6Qm3Qgzv5q++JIlYNB0IzrlrJH7Tp8FiX87eHumI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=beCyBhGP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=t1mcqBt2; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DE16A114012F;
	Thu, 21 Nov 2024 08:41:39 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 21 Nov 2024 08:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1732196499; x=1732282899; bh=1v
	4pQI8MULZCGaoQXp1s33OVUx8nOpuohEqpTrGxGh4=; b=beCyBhGPHp1tgGiDGn
	sxDMPyvE87LrfoxR1yIWsPeQM5ebVX6lqgLiFEq7WTUdpz2sKIcbSIS6INQIUzzd
	17BX2duKUT/gAjbNklNl9B+xAZMFnxV11w5wfmXEQZIeP8s6004WviwdxIr8vlcx
	d9y/O/yUvh7My2aOek6sgs1YOHugIwZVzuuvEqUgYH8Cw5HCK6ZoSPeVDK00JAbC
	yhjQOqB6GCryDRmb9hsDCiPUTPjUUAFBdJseP3+HuH6gRv+t72CeQsKX5fJmKiRf
	pKwxZeAdWHnqiMukXJPa5mPURJuPqI3gtvhf/Ys8f9o3cYCSAjrIqeHnu+EDeSPY
	ed2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1732196499; x=1732282899; bh=1v4pQI8MULZCGaoQXp1s33OVUx8n
	OpuohEqpTrGxGh4=; b=t1mcqBt2YVZ9wdjuzDTL0lSLdfItDhcUOSJBJuEWq92u
	JijyW736T3Z7khX8WZC4rrOj4o5kVc2tkWFHosk+i+spEcFRpfWariEq0cqcVcJ/
	A+/WOQdW9D+Q7leubmEOszgMjbSKwdQ9WykcO0fwUpEubVz+jgm4WI1FMHRefj1y
	PbDaqIEm+e10laOK4ylYYpCqmarzt0Eht5RVs9KwFTdKzJAC8s01ljYK28eVGOeX
	iQCwfbQcluQ6tyeyKph50NTZXXoRebmqtP8SgD/JfduXxprmIGPA+Bybu1o+Lgo/
	LbqC6OBPks75TrnP7+aAueyPGNe24l99lEnO1DCG5A==
X-ME-Sender: <xms:kzg_Z6oRFtmJBqmF594m6BVX5AT89nC1pc6cJvyJ158d11YWN5kL_A>
    <xme:kzg_Z4pd8j5xiac4WGN6cUD9MxX3PwKw-wQQMofzuNp0yeP_th4POvybGNsau0HYy
    vTF_us2zJXGDIX0b5I>
X-ME-Received: <xmr:kzg_Z_Mn1Gvb4cAPJGMkvPK0SE4ORg9LZHRiFfu1rp4qgyFKkIzCxoe7dP6Le10Vq_8gp-7nuV4g6cqv_GYvxJUFVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeigdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfh
    rhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlh
    hunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghr
    nhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefteegne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhl
    rghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtoh
    epuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghilhhu
    sheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghs
    sehglhhiuggvrhdrsggvpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtse
    hiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgr
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:kzg_Z57AIFi2ws511-PpKmLB5fpAmTgmOf59V9C6wLiL7pvjL1kv0A>
    <xmx:kzg_Z56768Q5K1TMOHASpQ5K-dPufnZSAElWXXsA9SMXMU6SbPVC9w>
    <xmx:kzg_Z5hyfR1TyGOQQDQNdXNr4JjPKlA92-NzeZM-jZdmM02WNoP0cA>
    <xmx:kzg_Zz7sGyof-VyFY-x6IZrkdQT82I2896l40KrYDzVee7XEez2LDA>
    <xmx:kzg_Z1hbNaNeKe3iJzBNiVMU8C45YK5NUrUj2V1vSFqsx-br8jF3biyJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Nov 2024 08:41:38 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/4] media: v4l: fwnode: Add support for CSI-2 C-PHY line orders
Date: Thu, 21 Nov 2024 14:41:04 +0100
Message-ID: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series aims to extend the video interface bindings with a new
property to describe the CSI-2 C-PHY line orders. In comparison with
CSI-2 D-PHY where each data-lane is constructed from two lines making up
a differential pair the C-PHY uses three phase encoding constructed from
three lines to create a single data lane.

The three lines making up the C-PHY data lane are labeled A, B and C in
the specification and can be ordered in any combination (ABC, ACB, BAC,
BCA, CAB and CBA). This can be compared to the D-PHY model where the two
lines in the differential pair can be "normal" or "inverted" to do the
same thing.

For the D-PHY uses-case the exists a property 'lane-polarities' can be
used to describe this line wiring. However there are no property to
describe this ordering of the C-PHY lines in the video interfaces
definition nor in the V4L2 fwnode structures or parser.

Patch 1/4 extends the video bindings with a new property 'line-orders'
which can describe this property of the C-PHY. The property name and the
const values used for different line configurations are taken from the
MIPI Discovery and Configuration (DisCo) Specification for Imaging
document.

Patch 2/4 extends the V4L2 fwnode data structure and parser to consume
and exposes this property to drivers.

While patch 3/4 and 4/4 adds an example use of the property both in the
bindings and in the driver using the R-Car CSI-2 receiver driver on V4H.

A note on the changes to the R-Car driver not relevant to the core V4L2
or bindings work. The V4H WhiteHawk development platform is the only
model where the CSI-2 bus is used in a C-PHY configuration. Early
datasheets where used to add support for it and at that time the line
order registers where not documented so magic values where used as-is.
This have been addressed in later versions of the datasheet and this can
now be done properly.

The magic values used however configured one of the data lanes used in a
BCA configuration, which is required for proper operation on that
development platform. Thus the change in patch 4/4 breaks proper
operation with older DTS files lacking the new line-orders property.

I think this is fine as the only known use-case for this platform is
together with the MAX96712 CSI-2 transmitter and for this we only have a
staging driver capable of generating test patterns. To extend this to a
capture pipeline capable of capturing frames from a real source DTS
changes are needed to describe the video source, so an updated DTS are
need anyhow.

See individual patches for changelog.

Niklas Söderlund (4):
  media: dt-bindings: Add property to describe CSI-2 C-PHY line orders
  media: v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders
  arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line orders
  media: rcar-csi2: Allow specifying C-PHY line order

 .../bindings/media/video-interfaces.yaml      | 21 ++++++
 .../boot/dts/renesas/white-hawk-csi-dsi.dtsi  |  6 ++
 drivers/media/platform/renesas/rcar-csi2.c    | 74 +++++++++++++++++--
 drivers/media/v4l2-core/v4l2-fwnode.c         | 43 ++++++++++-
 include/dt-bindings/media/video-interfaces.h  |  7 ++
 include/media/v4l2-mediabus.h                 | 21 ++++++
 6 files changed, 164 insertions(+), 8 deletions(-)

-- 
2.47.0


