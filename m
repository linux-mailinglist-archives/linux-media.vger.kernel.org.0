Return-Path: <linux-media+bounces-25076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B627A18742
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 22:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54F0B1644FC
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 21:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E571F55F0;
	Tue, 21 Jan 2025 21:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kLSKTqNU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PURl9I0I"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0981BBBFD;
	Tue, 21 Jan 2025 21:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737494694; cv=none; b=kWaw47qE4IfhmLx3OoWbvJ644p9u8JkaxVvhra3UGE5A51f06UVCN5H2QvTNIOLdLHBtO4eLapSsb6vmDgFWU5g1ZaDwHTE0j3slrYBqARwEi+tnoie7yM9VXJLIhUBUTxppQYX4jMkMWiRasSw0SUaeCBXiUOL3D+mIN7iqFUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737494694; c=relaxed/simple;
	bh=XVEkCUmH/FZiA51Ijb2h4j99qonTUAr6JFKmetyIXF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6j72fcWgCPOAVFW5uUXKpEQ2Wa7CjGTBeZ7Dn2y32PJK7XSSQq9ge3P62MH4LFvSGxBDbb90x4WgV2viHl360pETpZlzbav4gxQcDv7E0iNAVGpXlisUHjxo7toYos/BQcYSR7GJLzMFeRxZgurvtSV1Ik7Yv0tdkp5DwqJXLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kLSKTqNU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PURl9I0I; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 575B71140170;
	Tue, 21 Jan 2025 16:24:51 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 21 Jan 2025 16:24:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737494691;
	 x=1737581091; bh=zMOK5XbZGOxbCzx5PbfIJ4T88q3oQ0Vq0Ph7ae8c6v8=; b=
	kLSKTqNUdsXfI9wj+9EtkzmFvrdGGBdSRWyWTpxbR20HtGzRhbQ+Vf+UL1c94JiT
	EREDjQ/xu5RTakCL0A7jvGe9NiObCBO6mdwrWtt1CEz2dHeRQ5BlAfk8+r/DNB7I
	1wfR+IEA8uN+A+eUn7BEoFYXYk/OIWxahLd7mEvG5baGaBGs07qNJyUM8BTnV7hA
	oYGZWKJrWuNurB/S25oV3TLt5gUKI2LbRqun8MDAspOMZlZdeyv5rWq7twWMDNe7
	FAdMRjSFouiA6hjgm70rVE56WxLRDZGsPAqGeR+XXZps+kALAkidZspxOHxXoO2M
	gMoXAcepFMO6sBS3iufjpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737494691; x=
	1737581091; bh=zMOK5XbZGOxbCzx5PbfIJ4T88q3oQ0Vq0Ph7ae8c6v8=; b=P
	URl9I0I6NEoKRcJS8In5zCzD+1XnQhEBdkPGHnVQifoGzKxxc+NNWB3nsocHIZtJ
	8IdfA8mQXyuHJjauX/rj9fc9ydztrftm6vGsfRD3UjLgoQNJo9smsymKDAJypxbC
	Ak5/VwoCg2vI8djd0RAzzs713OI1/u73+1DTpxkb/1sNmebwyxmvVBh5qVWhoRgD
	ZrRlL2TMBL85pXnAgohKyVveFgabn4mcXrYrm3HvsqAFo5v8L19xHsncw1FHyoAW
	CrSNFTJYqh2zRZ8yAHc4OkT5HXW4jJ8CixyWjc3XaJI/QH2Dz/nNxc4oP81VQ+DN
	AAI9G4/oQWZKycE32PLIg==
X-ME-Sender: <xms:ohCQZzibW-8QMdan5fh6wEv5lgJLJ1dkevx-W4f3yweq3FHoMN7AOQ>
    <xme:ohCQZwCDCyeBmPqjfle4qaKiBz_5Aa1A5dx693JF59xbVGJdm10u5tMxOnHofGvvi
    7ixjcKFeHEvq2Pqkr8>
X-ME-Received: <xmr:ohCQZzEf-bIdMkhav_NJXEKwQKx-KkBaCsFOYW6JYufjg8cwt6iW7JMgMvKt97ZpWQhmVSBRs4HXsfp97A0BhG8bj5NzZa_NrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejvddguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvg
    hhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrsh
    dqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ohCQZwS6J4qmOr7ywAAdUDb_ueGm_5nXDy1a_wMDL3KI48JGrA_kwA>
    <xmx:oxCQZwyQ_bM4TK5f1UP_oPr_Yb3Ldrlu3ImRb24BOSfMR9fmrRqW8Q>
    <xmx:oxCQZ265VyZ71_DmvZe6gkVGO9q5COxMjjn1g7rjzXYA6XpYUUR9JQ>
    <xmx:oxCQZ1xZ-OuYghdB-k1N8sDRFsyXzTXmssO66NDmtqtrA7X1ZPsTnw>
    <xmx:oxCQZ_pLNUOcRK1p3Qx98OrbZ5E9ugflls77vEKGvro-HVeejI4x_i78>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 16:24:50 -0500 (EST)
Date: Tue, 21 Jan 2025 22:24:48 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] media: rcar: Minor cleanups and improvements
Message-ID: <20250121212448.GA3302176@ragnatech.se>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>

Hi Tomi,

Thanks for a great cleanup series!

On 2025-01-20 15:10:33 +0200, Tomi Valkeinen wrote:
> I've started looking at multi-stream support, and came up with these
> while working towards streams.
> 
>  Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

I have tested this in Gen2, Gen3 and Gen4 without noticing any 
regressions. The log is now spammed with the helpful suggestion that the 
CSI-2 TX subdevices shall implement V4L2_CID_LINK_FREQ control. This is 
annoying but out of scope for this series, but would be nice at some 
point.

  [   37.421531] v4l2_get_link_freq: Link frequency estimated using pixel rate: result might be inaccurate
  [   37.430991] v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver

For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Tomi Valkeinen (10):
>       media: rcar-csi2: Move Y8 entry to a better place
>       media: rcar-csi2: Add RAW10 and RAW12 formats
>       media: rcar-isp: Add RAW8, RAW10 and RAW12 formats
>       media: rcar-csi2: Use v4l2_get_link_freq()
>       media: rcar-vin: Use v4l2_subdev_{enable|disable}_streams()
>       media: rcar-isp: Use v4l2_subdev_{enable|disable}_streams()
>       media: rcar-csi2: Use v4l2_subdev_{enable|disable}_streams()
>       media: rcar-isp: Convert to subdev state
>       media: rcar-isp: Convert to .{enable|disable}_streams
>       media: rcar-csi2: Convert to .{enable|disable}_streams
> 
>  drivers/media/platform/renesas/rcar-csi2.c         | 118 ++++++++++-----
>  drivers/media/platform/renesas/rcar-isp.c          | 162 +++++++++++++--------
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   4 +-
>  3 files changed, 190 insertions(+), 94 deletions(-)
> ---
> base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
> change-id: 20250120-rcar-media-impro-2c37c1036e19
> 
> Best regards,
> -- 
> Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 

-- 
Kind Regards,
Niklas Söderlund

