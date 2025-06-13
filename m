Return-Path: <linux-media+bounces-34740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAC9AD8956
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 12:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C40423B4499
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FC92D5C6B;
	Fri, 13 Jun 2025 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FNPTQ20M";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Yco3Zf8k"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6012749DB;
	Fri, 13 Jun 2025 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809824; cv=none; b=ImZi74O/obmKMXn9gGf4fAAFYu384xVVfPuVgk6rbHuZiyktt4LXGsIVS8Zkyrff0qMVrX3K36Tr3GVPxFltLG4ttCScDZsipdc4qZCSFP3v6U4eamyoX3U/2Z9Caqn8kuFSsJ9TFiDEO1TbSV8d3L9KaoHsDhbOStrmcZQ9YmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809824; c=relaxed/simple;
	bh=Xi2cbe1hpUQ7Dcv6wnVOPWdoRaxHUwzw1212ISrr1DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgOagHIq2PPH91h4rQhK/CAL5YsGpOt3A9DwLqeU7sP4ZXSCLPy5Fyg9VZ2FOAhPSPStIIQyQw3SD6PCBPqYwg3HkGLDtbwHZ300vzZoqcvJch02MtpHokZH00u4jNFTmLErnfeJak2S8E9RZ2F2cucCsYyAheMm+ICQLhUvClk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FNPTQ20M; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Yco3Zf8k; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 5CD981140152;
	Fri, 13 Jun 2025 06:17:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 13 Jun 2025 06:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749809821;
	 x=1749896221; bh=0nv3cUiRRHeJVT8/zd+YX5iKytHTOVd5R+KmXVbiMaU=; b=
	FNPTQ20M4D67CgaJimm7D86qsE0iS5CziKYtmmAbEpsuRIkfRTCoE+YqsSnUnRm8
	gWE0YkALKvpxVF9CgOeGZ6it/Y3IidkNyqzGK7IOvpIuWFnsmFBcBdVcu0AveG3U
	+8ghqWE8WHF7hO0cwGIEPTSvQLNSkSkDPUadWK39+SkZqZlJnfuGW8M12Gn133Et
	hKi9Kgfi9MUxSb/uSlkHDvksrxds6wieM+IU2DDVrEizpCv7JwRIapJvT2YZA4Yn
	/Ura0djLneD485FRc5qvbXJ+L3A04zKgIWQglG0O4kn61fG11JEEKiTi3ZUK3Osp
	guJhfMrhDEzPpHtUV3T7+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749809821; x=
	1749896221; bh=0nv3cUiRRHeJVT8/zd+YX5iKytHTOVd5R+KmXVbiMaU=; b=Y
	co3Zf8kif40EWo2yjR4uLDuMBjUySknpL6dkQH9gOw17EZn77PN1o2BRvIbmqNbG
	kBvVzmua3EKSYV9bL7t7t1ig1gL/CiandaUIUi293Dgbs3SpbKKLMVD5+4MDtuBF
	RjVJIf/c8NuRI1EeDJQsOJxXfR3dVtvh4vKj7H3dyvz8OOr0N/P/knKGFSRSO7Wv
	iUug4Jnhh8Qetg5zRBu03hGy4pHfSlvtWnIuwDRri6+D6sECMpsu5HTgx5NLw0LF
	Q/q7X3QBh+qJjyN+6e29f0ZjaxUGm+secm4gyTB7cjzCZVM5Wt4+i1oSgCYsCr04
	hp/dcUjrwbz4EwtcdSK2w==
X-ME-Sender: <xms:nfpLaJpb1Dz2mZu4jrzLHNp-P5OAglTD-FcFaxZQ-5PFecuhTBlVlA>
    <xme:nfpLaLp4pfbke_gykFX8pkAWE6rGeTY4ois_JWjJiaFxXcy6n1D3hSmriIf4Svf8Z
    GCQlkC2SjsseLYRHqw>
X-ME-Received: <xmr:nfpLaGPbwz3M4u2krYUOMzS9ZIgV65ZlWRefaSIrsp054wvav5ZP3aQRaNtiy6qIAbb-vS_AhR2dDcDMop_n-k_QF_5tlLIajw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftd
    dvleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrd
    hsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    lhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprh
    gtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtoh
    hmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgt
    ohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nfpLaE7HpqExs3SJg9rPI9mHAyujcWK84b6zg1bR7HOcTc8n49UYuA>
    <xmx:nfpLaI60PkdSX705K5TIfIeHnIp2WsLOheBJ_KyqUfhqNSztlZkGCQ>
    <xmx:nfpLaMgQucOxmOvDdM5erA88e7Zu15Wk28E0mJhDXBYR3s6h5jbAzQ>
    <xmx:nfpLaK5m3fXIAlcfhIepjQhB9hRbbEaMnaA9KFp8r0pDQSejwzTiHQ>
    <xmx:nfpLaNWe32yjqo-GZ_ACsiqK5leDGhsjnTZQPBtCK5CgilzwROr0StyW>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 06:17:00 -0400 (EDT)
Date: Fri, 13 Jun 2025 12:16:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 10/12] media: rcar-vin: Only expose VIN controls
Message-ID: <20250613101659.GC1002387@ragnatech.se>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-11-niklas.soderlund+renesas@ragnatech.se>
 <20250612232820.GG10542@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612232820.GG10542@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for your feedback.

On 2025-06-13 02:28:20 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Fri, Jun 06, 2025 at 08:26:04PM +0200, Niklas Söderlund wrote:
> > Before moving Gen2 to media controller simplify the creation of controls
> > by not exposing the sub-device controls on the video device. This could
> > be done while enabling media controller but doing it separately reduces
> > the changes needed to do so.
> > 
> > The rework also allows the cleanup and remove paths to be simplified by
> > folding all special cases into the only remaining call site.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v4
> > - Broken out from a larger patch.
> > ---
> >  .../platform/renesas/rcar-vin/rcar-core.c     | 84 ++++---------------
> >  1 file changed, 18 insertions(+), 66 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > index 8cb3d0a3520f..597e868a6bc5 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > @@ -365,14 +365,6 @@ static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
> >  	return ret;
> >  }
> >  
> > -static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
> > -{
> > -	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
> > -		v4l2_async_nf_unregister(&vin->group->notifier);
> > -		v4l2_async_nf_cleanup(&vin->group->notifier);
> > -	}
> > -}
> > -
> >  static int rvin_parallel_parse_of(struct rvin_dev *vin)
> >  {
> >  	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
> > @@ -510,7 +502,7 @@ static void rvin_free_controls(struct rvin_dev *vin)
> >  	vin->vdev.ctrl_handler = NULL;
> >  }
> >  
> > -static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
> > +static int rvin_create_controls(struct rvin_dev *vin)
> >  {
> >  	int ret;
> >  
> > @@ -528,16 +520,6 @@ static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev
> >  		return ret;
> >  	}
> >  
> 
> Now that the control handler for the video device only has a single
> control, you can reduce the number of buckets:
> 
> -	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
> +	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);

Agreed.

> 
> > -	/* For the non-MC mode add controls from the subdevice. */
> > -	if (subdev) {
> > -		ret = v4l2_ctrl_add_handler(&vin->ctrl_handler,
> > -					    subdev->ctrl_handler, NULL, true);
> > -		if (ret < 0) {
> > -			rvin_free_controls(vin);
> > -			return ret;
> > -		}
> > -	}
> > -
> >  	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> >  
> >  	return 0;
> > @@ -627,11 +609,6 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
> >  	if (ret < 0 && ret != -ENOIOCTLCMD)
> >  		return ret;
> >  
> > -	/* Add the controls */
> > -	ret = rvin_create_controls(vin, subdev);
> > -	if (ret < 0)
> > -		return ret;
> > -
> >  	vin->parallel.subdev = subdev;
> >  
> >  	return 0;
> > @@ -885,34 +862,17 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
> >  	return ret;
> >  }
> >  
> > -static void rvin_csi2_cleanup(struct rvin_dev *vin)
> > -{
> > -	rvin_group_notifier_cleanup(vin);
> > -	rvin_free_controls(vin);
> > -}
> > -
> >  static int rvin_csi2_init(struct rvin_dev *vin)
> >  {
> >  	int ret;
> >  
> > -
> > -	ret = rvin_create_controls(vin, NULL);
> > -	if (ret < 0)
> > -		return ret;
> > -
> >  	ret = rvin_group_get(vin, rvin_csi2_setup_links, &rvin_csi2_media_ops);
> >  	if (ret)
> > -		goto err_controls;
> > +		return ret;
> >  
> >  	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
> >  	if (ret)
> > -		goto err_group;
> > -
> > -	return 0;
> > -err_group:
> > -	rvin_group_put(vin);
> > -err_controls:
> > -	rvin_free_controls(vin);
> > +		rvin_group_put(vin);
> >  
> >  	return ret;
> >  }
> > @@ -966,34 +926,17 @@ static int rvin_isp_setup_links(struct rvin_group *group)
> >  	return ret;
> >  }
> >  
> > -static void rvin_isp_cleanup(struct rvin_dev *vin)
> > -{
> > -	rvin_group_notifier_cleanup(vin);
> > -	rvin_free_controls(vin);
> > -}
> > -
> >  static int rvin_isp_init(struct rvin_dev *vin)
> >  {
> >  	int ret;
> >  
> > -
> > -	ret = rvin_create_controls(vin, NULL);
> > -	if (ret < 0)
> > -		return ret;
> > -
> >  	ret = rvin_group_get(vin, rvin_isp_setup_links, NULL);
> >  	if (ret)
> > -		goto err_controls;
> > +		return ret;
> >  
> >  	ret = rvin_group_notifier_init(vin, 2, RVIN_ISP_MAX);
> >  	if (ret)
> > -		goto err_group;
> > -
> > -	return 0;
> > -err_group:
> > -	rvin_group_put(vin);
> > -err_controls:
> > -	rvin_free_controls(vin);
> > +		rvin_group_put(vin);
> >  
> >  	return ret;
> >  }
> > @@ -1372,6 +1315,10 @@ static int rcar_vin_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > +	ret = rvin_create_controls(vin);
> > +	if (ret < 0)
> > +		return ret;
> 
> Don't you need to call rvin_dma_unregister() here ?

Indeed, there is a similar issue where rvin_id_put() is not called where 
it should introduced by this series.

> 
> > +
> >  	if (vin->info->use_isp) {
> >  		ret = rvin_isp_init(vin);
> >  	} else if (vin->info->use_mc) {
> > @@ -1390,6 +1337,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	if (ret) {
> > +		rvin_free_controls(vin);
> >  		rvin_dma_unregister(vin);
> >  		rvin_id_put(vin);
> >  		return ret;
> 
> Error labels at the end of the function will make this more manageable.

I agree, I have added a small patch early in this series that converts 
this error path to use labels and fixed the missing call to 
rvin_id_put() and rvin_dma_unregister() in the error paths using labels 
as you suggest it turns out nicer.

> 
> > @@ -1409,13 +1357,17 @@ static void rcar_vin_remove(struct platform_device *pdev)
> >  
> >  	rvin_v4l2_unregister(vin);
> >  
> > -	if (vin->info->use_isp)
> > -		rvin_isp_cleanup(vin);
> > -	else if (vin->info->use_mc)
> > -		rvin_csi2_cleanup(vin);
> > +	if (vin->info->use_isp || vin->info->use_mc) {
> > +		if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
> > +			v4l2_async_nf_unregister(&vin->group->notifier);
> > +			v4l2_async_nf_cleanup(&vin->group->notifier);
> > +		}
> > +	}
> >  
> >  	rvin_group_put(vin);
> >  
> > +	rvin_free_controls(vin);
> > +
> >  	rvin_id_put(vin);
> >  
> >  	rvin_dma_unregister(vin);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

