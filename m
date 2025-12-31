Return-Path: <linux-media+bounces-49796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5927CEBBB2
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 10:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5ACE8303090F
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 09:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894D631985B;
	Wed, 31 Dec 2025 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="hg6RrTRR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BqFulToH"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11161C84D0;
	Wed, 31 Dec 2025 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767175066; cv=none; b=Tmyx9Fs/6tq9AHw0PPu7lNNzjnJxF8aUqqRWHFOn44psRfJJXjl/XS5AP9KNWM+oBgoNYoVNxB+ogGm6Un5ne60uPH+mugqc+blQZz2zxDlFQEEZYJoU9u/aOmXxLXNq1DAZfmdd5DYnv5NmR/4aib/ijTM5BP7DmM33AmltNo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767175066; c=relaxed/simple;
	bh=EOmdSrTNL0vNtg/Ym1zQuO4wrPs2hfmsfoaaLfYFg6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAtYpCfC06VS30e80iGFJLLL8F5d9k6U/5YkDXHSS8GCDGmLo9lxzvPfNkYTG8Xw1pmigzb/Pw3Fzmx6m2VsBCITmnjOtVkm45kb8Snhps0fkRevAabgMygRBbORbqtnZkpn2AE3NyWbTL/LNOMFd5eiCsv0v/AIRl0RuwMA3gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hg6RrTRR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BqFulToH; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 767A1EC00F9;
	Wed, 31 Dec 2025 04:57:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 31 Dec 2025 04:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767175062;
	 x=1767261462; bh=Oa+/+rc1nqzSq3Nx84rWE4AZa4DGNN3q0O7mmyPQMus=; b=
	hg6RrTRR6BIdUbo50FevHPbc5dcX23+xSl7EtnEhxg4MvqgNQ0b4GeG0jYufvt0O
	nHNgvybNhbi5WEXQZ1/gvq7vqbJJw9079PF+Jw6XsIUQYgCtgrBwsVYeWAp7kK3h
	zU6E66Ge7Jxi9/S2nJ5iWVotasm6lnt12qjrvx7mHl35veIWn0gr//M5EojPdSvc
	emeJhosAxbtM2wiD02t8G+yc9eY5YcOQ/zVfJRiOIw+A8Trr7hyz2wEDHQCmriCT
	YIhoHp/5CpyZPqyKrGZpQJj2rTgnmHDgwtaWhx8CzN/qeUP++khnbeFCf6cu2QP6
	LaaPAWNKK3t5+ySPhGP/zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767175062; x=
	1767261462; bh=Oa+/+rc1nqzSq3Nx84rWE4AZa4DGNN3q0O7mmyPQMus=; b=B
	qFulToHMdiiAaLeZ1GFlFIoKYhX2OHgqOmg/tKCbUFR6V0VInCAfkAcdBsON+S5X
	LxybLAhEevGkMu0NERsMz3PxRoqTLh+Qx9ftqaHPsSp9vW3fEidkV8rCEeRW7+mQ
	MxDV8p9ri6ZA/Wvp6FfYizqaNvCrNmv5Dhbx5AB/+UH9KcJFZ3L1Xs+1hTBF+Yhy
	5YkeeP2D0iq3vpImIl/yJToPfuhFzx5UL5z/uXLTCQcQI19/zkAijzkdG7lVjLl6
	wFrbczYgZ3/dvaZpzejVkkiOqS5sbUt7b84rtfWXmqokZoFzc9edKv+2iommZq4w
	feBM7vxFcsMDZggtR6gyg==
X-ME-Sender: <xms:lfNUab0tQCp_FEQRuUj--ycvq9LhoecvsgJ_4XOoTgiEJBQh6ARxJw>
    <xme:lfNUaZwJIkBKP-ltthaSu-1cb_4pkYQmWB5M-vVaE64cTG7dVDvILP6-mkNZaSqAA
    uZyEnOaknBYN_ZmipkjnFCcLHpypd5ZEuTVSMeNqJALfIa2h5V_vwo>
X-ME-Received: <xmr:lfNUaXjFaGmiZlhj7Y5KhB09X4V6vseTHIXELpwk57Tit9RKpkiuTA80vcG7uud3gNNI3BoTRfkEsy9Fqnwb_ngPzDQg7q8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekvdeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffdtgeefveefgfeutdevveelgfelkeeu
    vdefgefgfeehfeeijeehudelhfejkefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhomhhirdhvrghlkhgv
    ihhnvghnodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtth
    hopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrghkrghrihdr
    rghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    rhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehmtghhvghhrggsodhhuhgrfigviheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    gruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgt
    phhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:lfNUacon9BSTz-Aogp6DRHZeDEJMGYHCqRecrButYCG0fevP4m0iBA>
    <xmx:lfNUaeg_0Rii2XmB_D6QBX2Sik3qoSBWqcb1VvyThKnM0TXSOzIWYw>
    <xmx:lfNUaePALXp-m7KHEDmW0inu4PoQKD9aX7ZV-E6Giep3CfzsSVjn4g>
    <xmx:lfNUaYx9PIlyyKI5hBnoocxO5fQS1NeApvnq-t2Ov2fcs9comtaomQ>
    <xmx:lvNUadm_iEbf9l4fhG9CGInc1hyw5yLYQ3s7KFVXZNyIXWtmxNVnSnP7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 04:57:41 -0500 (EST)
Date: Wed, 31 Dec 2025 10:57:39 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v4 00/15] media: rcar: Streams support
Message-ID: <20251231095739.GA3091492@ragnatech.se>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>

Hi Tomi,

Thanks for your persistent work on this series!

On 2025-12-16 17:18:17 +0200, Tomi Valkeinen wrote:
> Add streams support to Renesas rcar platform driver.
> 
> The series keaps compatibility with the current upstream for a single
> stream use case. However, in upstream there's a limited custom
> multi-stream support implemented to the rcar driver, which will be
> replaced with the upstream's Streams API.
> 
> I have tested this series on Sparrow-Hawk board, with a few different
> setups:
> 
> IMX219 connected to the CSI0 connector
> - The following patches applied to my test branch in addition to this
>   series:
>   1) The v4l2_subdev_get_frame_desc_passthrough dependency
>   2) Revert of commit e7376745ad5c8548e31d9ea58adfb5a847e017a4 ("media:
>      rcar-vin: Fix stride setting for RAW8 formats"), as that commit
>      breaks RAW8

That is so odd, I do grab RAW8 on V4H with a IMX219. In what way is do 
you see RAW8 breaking?

> - Tested with a single video stream
> 
> IMX219 connected to the CSI0 connector
> - Plenty of other patches applied to enable full streams support and
>   embedded data support in imx219 and v4l2 framework
> - Tested with video and embedded data streams
>  
> Arducam FPD-Link board + 4 x IMX219 connected to the CSI0 connector
> - Plenty of other patches applied to enable full streams support and
>   embedded data support in imx219 and v4l2 framework, and TPG support in
>   ub953
> - Tested with video and embedded data streams from all four cameras (so
>   8 streams in total)
> - Also tested with ub953's TPG, combined with video & embedded streams
>   from other cameras.

As there are dependencies on patches that have been on the list for a 
long time that would block merging this work. Could we try and shift 
focus and get some of the nice fixups and cleanups merged first? IMHO we 
could even aim for merging the rework (reduction) of the ad-hoc VC 
support done in the graph ASAP to get it out of the way.

It would also be nice if we could sort the RAW8 issue separately to get 
it out of the way.

I have other work touching these drivers I'm holding of on to not cause 
conflicts with your nice work, and it will make my work smaller/easier 
too!

Could we start by breaking this out into:

- A series that just removes the ad-hoc VC thru media graph in the R-Car 
  VIN and CSI-2 drivers.

- And then we can follow up with the cleanup of each of the drivers as 
  separate series.

This would make it easier for everybody I think. Each series becomes 
smaller to review, we can get fixes and cleanup in now and not wait for 
all stream dependences to land first.

> 
> I have observed one issue with the embedded data (i.e. requiring bunch
> of patches not in upstream): when stopping streaming, VIN says that it
> cannot stop the stream. I haven't debugged that, but a possible issue is
> that the if the video stream for the imx219 is stopped first, the
> embedded data stops also, and VIN does not get the frame-end it is
> waiting for.

I would not be comfortable merging with this regression. I have bad 
experiences when VIN report it can't stop the stream. More often then 
not it also means it then can't start streaming again...

> 
>  Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> Changes in v4:
> - Rebased on v6.18, with minor conflicts resolved
> - Improved patch descriptions
> - Re-ordered the patches a bit to move changes that could be applied
>   without the full streams support to the beginning of the series
> - Added "media: rcar-vin: Link VINs on Gen3 to a single channel on each
>   CSI-2" which removes possibility of wrong routing config on Gen3
> - Added "media: rcar-csi2: Improve FLD_FLD_EN macros" which was part of
>   another patch in v3
> - Addressed minor comments (constifyings, cosmetics)
> - Fixed the missing stream_count checks in disable_streams ops
> - Fixed a few instances in csisp and csi2 where
>   v4l2_subdev_state_get_format() was called with hardcoded pad/stream,
>   instead of using the data from the route
> - Dropped unnecessary ISPPROCMODE_DT_REG register clears
> - Squashed "media: rcar-csi2: Add more stream support to
>   rcsi2_calc_mbps()" into a previous patch
> - Dropped wrong use_isp check from csi2's rcsi2_set_routing()
> - Link to v3: https://lore.kernel.org/r/20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com
> 
> Changes in v3:
> - Rebased on top of latest linux-media
> - Dropped dependencies which are already in linux-media (only remaining
>   dependency is v4l2_subdev_get_frame_desc_passthrough)
> - Tested on white-hawk board, using the staging deser TPG
> - Also tested in a WIP branch for GMSL2 (two video streams)
> - Link to v2: https://lore.kernel.org/r/20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com
> 
> Changes in v2:
> - Rebased on top of latest upstream, and updated the dependencies to
>   match the latest serieses sent.
> - Add new patch "media: rcar-csi2: Use the pad version of v4l2_get_link_freq()"
> - Drop "media: rcar-csi2: Fix typo" (it was not a typo)
> - Update the code in calc_mbps(). The previous method relied on
>   V4L2_CID_LINK_FREQ, but that's not available if the link-freq is
>   provided via get_mbus_config().
> - Dropped dependencies to Niklas' old series which doesn't apply
>   cleanly. It's needed for multi-stream, but not for the current
>   upstream which only has a single stream use case.
> - Link to v1: https://lore.kernel.org/r/20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com
> 
> ---
> Tomi Valkeinen (15):
>       media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
>       media: rcar-csi2: Improve FLD_FLD_EN macros
>       media: rcar-csi2: Move rcsi2_calc_mbps()
>       media: rcar-csi2: Simplify rcsi2_calc_mbps()
>       media: rcar-csi2: Optimize rcsi2_calc_mbps()
>       media: rcar-vin: Link VINs on Gen3 to a single channel on each CSI-2
>       media: rcar-isp: Move {enable|disable}_streams() calls
>       media: rcar-csi2: Move {enable|disable}_streams() calls
>       media: rcar-csi2: Switch to Streams API
>       media: rcar-isp: Switch to Streams API
>       media: rcar-csi2: Add .get_frame_desc op
>       media: rcar-isp: Call get_frame_desc to find out VC & DT
>       media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
>       media: rcar-csi2: Add full streams support
>       media: rcar-isp: Add full streams support
> 
>  drivers/media/platform/renesas/rcar-csi2.c         | 437 +++++++++++++++------
>  drivers/media/platform/renesas/rcar-isp/csisp.c    | 232 ++++++++---
>  .../media/platform/renesas/rcar-vin/rcar-core.c    |  27 +-
>  3 files changed, 509 insertions(+), 187 deletions(-)
> ---
> base-commit: f7b88edb52c8dd01b7e576390d658ae6eef0e134
> change-id: 20250219-rcar-streams-1fdea8860e5e
> prerequisite-change-id: 20250218-frame-desc-passthrough-66805e413974:v4
> prerequisite-patch-id: bce4a915a29a64f88ed1bb600c08df37d2ba20c6
> prerequisite-patch-id: 69b75e7dad9ced905cb39a72f18bebbf3e8f998a
> prerequisite-patch-id: 58463f6944c76acd6cf203b14a2836cdb0db2461
> 
> Best regards,
> -- 
> Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund

