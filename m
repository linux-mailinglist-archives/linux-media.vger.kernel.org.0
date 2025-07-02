Return-Path: <linux-media+bounces-36602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B6AF5C42
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CF573AEE1F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E903093D6;
	Wed,  2 Jul 2025 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mIc1jMz0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N4cIZM4s"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71E2307AFD;
	Wed,  2 Jul 2025 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468836; cv=none; b=uE5VGFcv3lUQ3cwK2BKONfY09E6DYO4oxDnY6RWLSY22qN0gUvttcOkkuDsnQElshtQuqeVFMfrBAx4XvkE8yRp3Trr/HiU9+eoC7DBfGbtx9Mrrqw3znRI+RdizVgEtKQrm31dVG1dtGk1Zb/ngD3E6GUqKgiWfOcOY9sxhP8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468836; c=relaxed/simple;
	bh=xNeND/Ooj09fN2GWxsXb8hWO6NNH8/vzCt92D6/zLHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTMMVWU6SgGinZpc6t5fQI9dcRHUfkETBnHlAjm5hqlxXV/js6JgjUnA3z/M33NWWSlUKT4+lNsNCaykbUwKdAX7PwmGYkyUpapypM4/LzqPwOFWtG/8mHkyZcFFy9gJ7OcDQEJBAvMGUA6cpScdh1dZSzay+GvCSmcAdg4Tjr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mIc1jMz0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N4cIZM4s; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9237F7A025E;
	Wed,  2 Jul 2025 11:07:13 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 02 Jul 2025 11:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751468833;
	 x=1751555233; bh=CBC06ObgAQxCPssTuSyr08dyqUxTmsl14Ux516A5WPA=; b=
	mIc1jMz0fgkm8fe09U4aO3d54cE0F18CDkrF/qZNOU4WFCi9Z5wT/9nxLYMBLrco
	/EXzZwk3GvzB2lpB2a0FFwJA62c7HGFSJ4vOhTIy6Osnm2+Hi4zBNAA0fJFnJEDt
	TSqgxmJs14obDM1ARUV6+sL5QALCT0bA8ibXwzAnEd5fgObA9Yc8fX6kCMFnVjV0
	b43jIyWp2Ki5rATrR3ZnoEKaJhZOPfCYZEbwdUoZhHTeT77NVwp8QfZBDgxADRJE
	UMyBg5DU76/r/TtiXPT1WEeL26/P3J8cJvbmlgOYT8zIw+2e2cBMg8GkqphmEz2C
	r5U+i+fKDX+zuKjuy7sCKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751468833; x=
	1751555233; bh=CBC06ObgAQxCPssTuSyr08dyqUxTmsl14Ux516A5WPA=; b=N
	4cIZM4s4NZzMuMt9F4TkKraQo+l5UFyxNmRTN9Zlru5YQxrQyt9PjsUvCXCxyeNB
	6RS/RPZU1WbUZ1ajzr1wOnNRSGERAinJ0J58NO8xcyfEw/aX3L6fPNFFseqUCOsF
	fjNuccgmxqYvpXNQ5RNemo3p+kD50x038PbzUoPxqjC6dCWEyvKklGHXFZrJvf0Z
	Tpryy8XdE/HbhORFx2YRQYM9raMRAmxcESvnMoVUh9jmPdPr/9edeLiMvwZxYA7k
	8rY+VO5Qe/E2j3N5gRjuZN0cvn9PYLGLWATJ/uy6bqNbVsPa6ZudZID3H6bBjrUV
	1HK7bDeSksQFqznnGYNOw==
X-ME-Sender: <xms:IUtlaNYVtCqBndVKuNUVHmA3LHdUUSQdak6kA7RKLuRyTaNeiMcJ3Q>
    <xme:IUtlaEasifcmDZGlVBwpM6AImPhcw_k_JImSuM9GScRopVwzOq4lmvoLSv1no1chC
    1XwgJxgSgtYjI8fKks>
X-ME-Received: <xmr:IUtlaP-VTZKYhjLw_o5nwXeWDvYQhyegun2wonsQLuGGJJhOyHgF4dTxX6AHC0xlgsFwPTFU64Z0s0ohjdlWNrrMkkwLwfmbNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeejudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdr
    tghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesih
    guvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinh
    htvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsgdohhhurgifvg
    hisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihgu
    vggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:IUtlaLpjw61_Ees9KYwmGgiZIlL1Y2HyaoLcgnb5JJlNgxyVT0mYfA>
    <xmx:IUtlaIpWhv8MPPtep_wfbfPZ9NjiHsxo-2o6ScXETBb6HFt0_g8R4w>
    <xmx:IUtlaBRxEXKLp8MHHF3BzMNLmHsl6x69jLIIZCNBV7V0od8_rC0MLg>
    <xmx:IUtlaAqvEkaOIFxLTu9st3MfAkB1XNlXPxpQ8sstgJkrAFXUe51Yjw>
    <xmx:IUtlaMw8TedH8OFB3KICz7v7aiPKPvxM2DxeWBZOjtuWNgoMOcxgHcFq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Jul 2025 11:07:12 -0400 (EDT)
Date: Wed, 2 Jul 2025 17:07:11 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 01/15] media: rcar-csi2: Use the pad version of
 v4l2_get_link_freq()
Message-ID: <20250702150711.GE3830050@ragnatech.se>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-1-026655df7138@ideasonboard.com>
 <20250602094321.GD3645@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250602094321.GD3645@pendragon.ideasonboard.com>

On 2025-06-02 12:43:21 +0300, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, May 30, 2025 at 04:50:30PM +0300, Tomi Valkeinen wrote:
> > Use the new version of v4l2_get_link_freq() which supports media_pad as
> > a parameter.
> 
> The commit message should explain why. With that fixed,

How about this,

The pad aware version of v4l2_get_link_freq() tries to retrieve the link 
frequency from the media bus configuration using the get_mbus_config 
operation, and only if the subdevice do not implement this operation 
fall-back to the old method of getting it using the V4L2_CID_LINK_FREQ 
or V4L2_CID_PIXEL_RATE control.

Update the VIN driver to use the pad aware version to be able to support 
subdevices that only provides the link frequency in the media bus 
configuration. As the implementation falls-back to the old method if the 
subdevice don't support get_mbus_config, or don't provide a link 
frequency in the v4l2_mbus_config struct, this is fully backward 
compatible.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/renesas/rcar-csi2.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> > index 9979de4f6ef1..ddbdde23c122 100644
> > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > @@ -954,6 +954,7 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
> >  static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> >  			   unsigned int lanes)
> >  {
> > +	struct media_pad *remote_pad;
> >  	struct v4l2_subdev *source;
> >  	s64 freq;
> >  	u64 mbps;
> > @@ -962,8 +963,9 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
> >  		return -ENODEV;
> >  
> >  	source = priv->remote;
> > +	remote_pad = &source->entity.pads[priv->remote_pad];
> >  
> > -	freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
> > +	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
> >  	if (freq < 0) {
> >  		int ret = (int)freq;
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

