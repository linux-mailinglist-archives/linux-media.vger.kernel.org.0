Return-Path: <linux-media+bounces-55432-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAkoJtKosWmzEQAAu9opvQ
	(envelope-from <linux-media+bounces-55432-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 18:39:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E924A2681DB
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 18:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D29E3058727
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 17:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616293DFC99;
	Wed, 11 Mar 2026 17:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="n8B4Nmx7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e51bOtqK"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619B71FA272;
	Wed, 11 Mar 2026 17:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773250714; cv=none; b=BJc/2lF9SNXW8/AgHPslqn7spDAJcuITNem7D0AC84n8K1jEfypho3ngU970QEc93qDvIaVEDdYcfhEjRPaX/FIBbbsafVElqphs0w8ZyNbcDpu3DMJ7QkpSx9ywBxtz6YTvRguPFMmPSi8zvEkdRIjZaig4fPf0uTYFtTY+rIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773250714; c=relaxed/simple;
	bh=iM8qxmY9Fw2+2iOHBbQJQnNWigOdZFcFEtAeKtBtzFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiIjxq1lJDuBl7PgBv7TUB7X/oEoO8L5YeTyFuq4FfoPcKJ9epC2F4P7SKkBAeUqN7nqc6gszqnF+QGRYWpewFFqPKhQ9jbOJ1ySb+YE1bNPMb1j/uePhjqqZkWRq9v7W3DjD3+D3onJJHv54THGo/u58Vtcgfwulmc24lr15Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=n8B4Nmx7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e51bOtqK; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9963D1400191;
	Wed, 11 Mar 2026 13:38:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 11 Mar 2026 13:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773250711;
	 x=1773337111; bh=+cct0stBXN7tVLSelUsHYZOTz6oMVB1x4nMnPiTirR4=; b=
	n8B4Nmx7E35HZwx55AWTpF9sT1eeA8+w7uzytjosaYPJPfKnwUR2QS0sPowHVJs8
	ObHItp4OtsiXrw5RmQxb+6vKT96ZmkGEjgkBm6Vslgfcokw0FOMcxIrfTgD/v3Uu
	bJym+kW5yRoK+ui2VtWTCOoffzoXwO4AE53LxWMz0oEPWMhNF9G3gWkM5sh4TXBm
	8Y7n63CB4nZWLuPSnVmRf+fnRxhS0EDt779olAW5nzv1cYi/xZR6HwxgGPD1X/J4
	h9BjvxtAELqYOHdlRzI6y7a5cNK9AXEU4hCrvAj+r2c5XycGu0FJM0HkBJ9PfIqb
	ButKhZu/QuJ8czbkF2s/Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773250711; x=
	1773337111; bh=+cct0stBXN7tVLSelUsHYZOTz6oMVB1x4nMnPiTirR4=; b=e
	51bOtqKUnIzkjFNBUGwZKDTQGMqPY+SEjvhIiZ9t5qV2lrvf8CquwYWIvPAUwSF8
	KSOrrBV49HOZ/MzEoWa6/E7stm75QvdEtPjUCo6LodLesPaMVieAyEuCVA+mbFbQ
	sIzLjNKdY3C9Kv3LHZrw0g5dn21OoN+gTe8pymVd4y8+8AF2GH4U2RgQVk+sAGoV
	yCihKIpoLixU/ndwec8wLdl5kIEz/WaVtI5tg+J0wGSTsw1XdBwcvPg6Ss5hzo/v
	svy4i/l90wUi5r+wm61vJsw2p1hcIl2HnSrsKAvqQkd+cePbEMvFSzGfZf94sn/X
	t5JjsnJkA+ZzJtusmRrtA==
X-ME-Sender: <xms:lqixadx1pmlTkBe3tiebc2BBTnf1Z8-k75zlCB6kuWeLeyn21Xy52Q>
    <xme:lqixaZ29X3CYM1di86ksi9ljMSxAOGSPhyxn2ULn5pQFRZM1Ix0W3D1lRiJV-QBFV
    JZYsTB2Qcvhbe_G0YnKdpZOmaOykpu-lKBW_UxT3dSCqqR-7MNDkw>
X-ME-Received: <xmr:lqixabwCgUOlJeGbSI-kYe_rBelWRufxCZcmt3TZ9vqRHf9_733aWTmQ90nURKL4xdlq7RyJgpbHRZb0rle9N66NJ3DMmO25LeA9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpefftdegfeevfefguedtveevlefgleek
    uedvfeeggfefheefieejhedulefhjeekgfenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhomhhirdhvrghlkhgv
    ihhnvghnodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtth
    hopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrghkrghrihdr
    rghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    rhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehmtghhvghhrggsodhhuhgrfigviheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    gruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgt
    phhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:lqixaWUTKGRZIcKXkyauf7Amif8GSWwvJUBpyRaPdNttigpNauTSsQ>
    <xmx:lqixaf_XtnntSuMwaqM4gN7yV-3IVbDu8ENdYFCMIss16zxIOd9r9w>
    <xmx:lqixaRuJ_zKr8rxFA1pFX41_heQ8Nbj5_b8rrL3I_A9rco57wwnA6w>
    <xmx:lqixaX0LoK4bAkpFJb_fAC_DePtIjdfC5SU1Q4SpWjQ2tWg04ddWgw>
    <xmx:l6ixaSOf1yFPqIL2c_Gqbh3y7IobDsbOb0tI11Re0zi2pY3y0BYjOwB1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Mar 2026 13:38:30 -0400 (EDT)
Date: Wed, 11 Mar 2026 18:38:28 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v5 00/10] media: rcar: Streams support
Message-ID: <20260311173828.GC1156208@ragnatech.se>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55432-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: E924A2681DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tomi,

Thanks for your work.

On 2026-03-11 15:53:13 +0200, Tomi Valkeinen wrote:
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

Is this still needed, was this not fixed by "[PATCH] media: renesas: 
vin: Fix RAW8 (again)" ?

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
> 
> I have observed one issue with the embedded data (i.e. requiring bunch
> of patches not in upstream): when stopping streaming, VIN says that it
> cannot stop the stream. I haven't debugged that, but a possible issue is
> that the if the video stream for the imx219 is stopped first, the
> embedded data stops also, and VIN does not get the frame-end it is
> waiting for.
> 
>  Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
> Changes in v5:
> - Rebase on v7.0-rc2, with the streams preparation series and
>   get_frame_desc_passthrough series as dependencies
> - This series is now smaller, as the non-streams parts are in the
>   streams preparation series
> - Fix "variable ‘format’ set but not used" warning
> - Link to v4: https://lore.kernel.org/r/20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com
> 
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
> Tomi Valkeinen (10):
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
>  drivers/media/platform/renesas/rcar-csi2.c         | 323 ++++++++++++++++-----
>  drivers/media/platform/renesas/rcar-isp/csisp.c    | 227 ++++++++++++---
>  .../media/platform/renesas/rcar-vin/rcar-core.c    |  27 +-
>  3 files changed, 445 insertions(+), 132 deletions(-)
> ---
> base-commit: 9fad1d148df6f36105159c2503d0ecb1397bc89a
> change-id: 20250219-rcar-streams-1fdea8860e5e
> prerequisite-change-id: 20260115-rcar-streams-prep-1-1cc285538848:v1
> prerequisite-patch-id: 78155acff7a40c74881accca6d9699476405e937
> prerequisite-patch-id: 983b909c5d3667711baf2112713eac7862e5f9e7
> prerequisite-patch-id: 6dba98cf21fb95029009733448075ee0380eaf16
> prerequisite-patch-id: db9ed82262cd02a2cb6941dc30f731b6b7c4410c
> prerequisite-patch-id: 2342bc950678d13b5aa41b2faa276ad1c0e3d850
> prerequisite-change-id: 20250218-frame-desc-passthrough-66805e413974:v5
> prerequisite-patch-id: 4b1733536cdc5b2bdd3c996032273c576228da72
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

