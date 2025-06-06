Return-Path: <linux-media+bounces-34254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E317AD0378
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8F5188C897
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 13:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58208289355;
	Fri,  6 Jun 2025 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="a8zuBiKz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CBJYgtjB"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A893627F164;
	Fri,  6 Jun 2025 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749217808; cv=none; b=PysgEGf3DzXG9vVMjLmp48+lWzkcghET5kwjodtbux2u0/yvC6cGLxsLG7voo7AaIPiTnGOo/oc17twLJ/yfJLDgogTZiWpUdqsCtsXk0pZ78oEjn983uZcFmIpTGTVRJXVVKFKDmtXWCsUFxEZEwuAVgAv0wvA0RoBM/uNs8eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749217808; c=relaxed/simple;
	bh=BJtfLKecF/RWfc70ZA5nuYLVt2qw2mEGJ/wEummRuJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYJ96BdnWqqKE/IRTPCzlIro/iIuHPWGb7LryEsgZRASZqglO/h3XzkBgTPzVFBnbA/6t1w6FcElLCCJuIZBX+U9LTt8KGkc8bIBmLbj02F0Grx541AK1Rms6n+rvjqrZgjBWGV4B4gpufe5sjKjDeeHRtV5O49+YWik6w8TOxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=a8zuBiKz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CBJYgtjB; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8E5CA1140171;
	Fri,  6 Jun 2025 09:50:04 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 06 Jun 2025 09:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749217804;
	 x=1749304204; bh=IyOTe7TBSOQSImzV0o1rLeUe4+AwL6jZftlfZsIs8JY=; b=
	a8zuBiKzQvTN+pXgeuDtBIBbq++zB2R/PiLD3c6DzUEAF/zo3M3acT0R2xO2bhND
	9MTgSK7mKllKUm5OBSFl//Ftjp+M7iLUYoHkXUdNUITDST+GwleeHgcp1XqIFVUU
	08kEsuQ95kcJhnHaz2lwmJjnDeOjsW9DKqbKVXxL+kfnpqMWn3de3Cgm9cQPMjZG
	GGLfHYqHpwi9YQMLVqMLUat7eXwqtIkn3qjjlt4pXS99mjSngSLpHoms20QN4482
	a6NgRB3Wa+qdP7/I6AKgf+jxh2hd2m0tX91h8MwbsTkSB5BY5SiWUNAmjIREWTsK
	OWnxcVXumJv6cGPim5WJsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749217804; x=
	1749304204; bh=IyOTe7TBSOQSImzV0o1rLeUe4+AwL6jZftlfZsIs8JY=; b=C
	BJYgtjBdi8Vd7LfCAAeAeWsbTDit1VXj8o/gE9igtmpfdKH9h1RU6k5k1g6eSfSs
	CRU9GYeUxTGL4Uy0EpS9+SHvz9Tk5Jl+RYRV9gn0QS9NWJMbqa0lPs5W8Zxe6LOX
	1yIT87gNzC9V/4apHXoQXOY8rqi8NwiDh9TfbLgl8bjEgcmKm6xSWxJwc9/8Uh/2
	gV6lqZWLCuccOCb5xE2nQlgFvbV6IOqpmbNB14gu9je/Ib1EJ/Tn0uyA4qw/4Sr8
	WnZ5Yfdhvz+NFmUJXIYtJkwoxrmVPUVDQ9WGwUj2CfExS2QGwmxGyuDjKMOCn2ik
	X7ARja/bV/52oAUOaqAVw==
X-ME-Sender: <xms:DPJCaKKRI3b2qvYpM5gpqBEw_LqmgjKhJ_GkrIkNq9TCnlDPNQkimg>
    <xme:DPJCaCKqSkcj_F2B9cNEsIJ3sArDq2dbge9WxqwMxkdZ9NC0gJE9Nlqj-cw_ERABa
    tOfKCSk-oG6TqJLGi0>
X-ME-Received: <xmr:DPJCaKtUXbrYnxVcxIRn93CEPHPG-1Dxce1zzd4YL9jUzWicIi5j8JsUfTpj8_rvWDlXmNWBif9UGx6YDs-IMYLYTfgz3VxaVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeefhfellefhffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvd
    elieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehs
    rghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhope
    hmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhk
    vghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpth
    htoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:DPJCaPYaVtAfuB_Z4Bhn45FLKbg-yVZO4g2LKMfRbtCvb7GG16ZZKw>
    <xmx:DPJCaBZD7ntu1Zqr1Fl-CGhITe9VLYuwR345lTQA2kMUPaqPrP-MIw>
    <xmx:DPJCaLDw5kHdtoGJfq5Ror4Ptp4AcIO8WXaUdYnXRBPKVcNIXO93Mg>
    <xmx:DPJCaHYscIBYmXKIy6hxAUPHNQSkxpCog_riWjwT8eQT2pNTH711Cg>
    <xmx:DPJCaJ3q9pej1ZN811QcIqXRaHQ_8TFf1efqISPoHuAa5X-JltcBqV2X>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 09:50:03 -0400 (EDT)
Date: Fri, 6 Jun 2025 15:50:00 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: rcar-vin: Prepare for unifying all
 v4l-async notifiers
Message-ID: <20250606135000.GA2780410@ragnatech.se>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
 <20250521132037.1463746-5-niklas.soderlund+renesas@ragnatech.se>
 <aDVjW_k_keyFQbPT@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDVjW_k_keyFQbPT@kekkonen.localdomain>

Hej Sakari,

Thanks for your feedback.

On 2025-05-27 07:01:47 +0000, Sakari Ailus wrote:
> Hej Niklas,
> 
> On Wed, May 21, 2025 at 03:20:35PM +0200, Niklas Söderlund wrote:
> > The R-Car VIN driver is needless complex and uses more then one
> 
> s/needless\K/ly/
> 
> > v4l-async notifier to attach to all its subdevices. Prepare for unifying
> > them by moving rvin_parallel_parse_of() to where it needs to be when
> > they are unified.
> > 
> > The function is moved verbatim and there is no change in behavior.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../platform/renesas/rcar-vin/rcar-core.c     | 106 +++++++++---------
> >  1 file changed, 53 insertions(+), 53 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > index d9ad56fb2aa9..60ec57d73a12 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > @@ -337,6 +337,59 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
> >  	}
> >  }
> >  
> > +static int rvin_parallel_parse_of(struct rvin_dev *vin)
> > +{
> > +	struct fwnode_handle *ep, *fwnode;
> > +	struct v4l2_fwnode_endpoint vep = {
> > +		.bus_type = V4L2_MBUS_UNKNOWN,
> > +	};
> > +	struct v4l2_async_connection *asc;
> > +	int ret;
> > +
> > +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
> > +	if (!ep)
> > +		return 0;
> > +
> > +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> > +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > +	fwnode_handle_put(ep);
> > +	if (ret) {
> > +		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> > +		ret = -EINVAL;
> > +		goto out;
> > +	}
> > +
> > +	switch (vep.bus_type) {
> > +	case V4L2_MBUS_PARALLEL:
> > +	case V4L2_MBUS_BT656:
> > +		vin_dbg(vin, "Found %s media bus\n",
> > +			vep.bus_type == V4L2_MBUS_PARALLEL ?
> > +			"PARALLEL" : "BT656");
> > +		vin->parallel.mbus_type = vep.bus_type;
> > +		vin->parallel.bus = vep.bus.parallel;
> > +		break;
> > +	default:
> > +		vin_err(vin, "Unknown media bus type\n");
> > +		ret = -EINVAL;
> > +		goto out;
> > +	}
> > +
> > +	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
> > +				       struct v4l2_async_connection);
> 
> If you use v4l2_async_nf_add_fwnode_remote() here, you can omit
> fwnode_graph_get_remote_endpoint() call above. Also the error handling
> becomes more simple.

Indeed it would, but I do use fwnode in the debug print at the end of 
the function. And I do find that print out use-full when debugging, so I 
would like to keep it.

Laurent's suggestion of using __free(fwnode_handle) can instead be used 
to make error handling easier, and since it would be needed for the ep 
variable anyhow I think I will try that.

> 
> > +	if (IS_ERR(asc)) {
> > +		ret = PTR_ERR(asc);
> > +		goto out;
> > +	}
> > +
> > +	vin->parallel.asc = asc;
> > +
> > +	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
> > +out:
> > +	fwnode_handle_put(fwnode);
> > +
> > +	return ret;
> > +}
> > +
> >  static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
> >  				    unsigned int max_id)
> >  {
> > @@ -635,59 +688,6 @@ static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
> >  	.complete = rvin_parallel_notify_complete,
> >  };
> >  
> > -static int rvin_parallel_parse_of(struct rvin_dev *vin)
> > -{
> > -	struct fwnode_handle *ep, *fwnode;
> > -	struct v4l2_fwnode_endpoint vep = {
> > -		.bus_type = V4L2_MBUS_UNKNOWN,
> > -	};
> > -	struct v4l2_async_connection *asc;
> > -	int ret;
> > -
> > -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
> > -	if (!ep)
> > -		return 0;
> > -
> > -	fwnode = fwnode_graph_get_remote_endpoint(ep);
> > -	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > -	fwnode_handle_put(ep);
> > -	if (ret) {
> > -		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> > -		ret = -EINVAL;
> > -		goto out;
> > -	}
> > -
> > -	switch (vep.bus_type) {
> > -	case V4L2_MBUS_PARALLEL:
> > -	case V4L2_MBUS_BT656:
> > -		vin_dbg(vin, "Found %s media bus\n",
> > -			vep.bus_type == V4L2_MBUS_PARALLEL ?
> > -			"PARALLEL" : "BT656");
> > -		vin->parallel.mbus_type = vep.bus_type;
> > -		vin->parallel.bus = vep.bus.parallel;
> > -		break;
> > -	default:
> > -		vin_err(vin, "Unknown media bus type\n");
> > -		ret = -EINVAL;
> > -		goto out;
> > -	}
> > -
> > -	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
> > -				       struct v4l2_async_connection);
> > -	if (IS_ERR(asc)) {
> > -		ret = PTR_ERR(asc);
> > -		goto out;
> > -	}
> > -
> > -	vin->parallel.asc = asc;
> > -
> > -	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
> > -out:
> > -	fwnode_handle_put(fwnode);
> > -
> > -	return ret;
> > -}
> > -
> >  static void rvin_parallel_cleanup(struct rvin_dev *vin)
> >  {
> >  	v4l2_async_nf_unregister(&vin->notifier);
> > -- 
> > 2.49.0
> > 
> 
> -- 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund

