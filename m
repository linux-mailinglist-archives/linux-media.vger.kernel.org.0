Return-Path: <linux-media+bounces-34292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D81AD0D40
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 13:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78131173D13
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 11:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D68D221554;
	Sat,  7 Jun 2025 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="a5a1E/On";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A5vr9kwW"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05FC1F151C;
	Sat,  7 Jun 2025 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749297550; cv=none; b=sahCIj6kxJotmvQkWc3zJI3EKY6LvINtHovcnNNeq4aDD8AaoP4Ld64olu/H+uVixDVmg0OI0wEDS/6tcQvUoucPmsL8HaBO7Njs62DeX25dOQrRcZdtNT3SsOZ4orMnBA7c4z4yvo0mGi1UbEgp0vFwFzZBfO0EYn8rhAzJe0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749297550; c=relaxed/simple;
	bh=PqATbicb2SVMXE+y4rIfrFyAv/pVQ/R7Lfa0ePpU0Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKRN7dMlBHEoX0VqL6cbFfDQFdfjWvi2LDT3kCVFDrDcjoaXwi4ZBqOuRO6EDDneuNYqDgecoK2Iy3LwWo/PnWAWwbnubm4ZMhbwx9teio1ZwXSfGeyUm92plTAPsxXUIJLqqG8Uq1XzUdJj+mkVXIFmwXuKtRBExMV7CLaDsuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=a5a1E/On; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A5vr9kwW; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id A01501140127;
	Sat,  7 Jun 2025 07:59:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 07 Jun 2025 07:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749297546;
	 x=1749383946; bh=nbvq2QJv8S2Bw9oGUdFqLSLlZuMe0C9l5sEZ5s71CIA=; b=
	a5a1E/OnadCrjTh5ZH/roc4SLgU/mcSxVFf8a26yhmhQab9UPinV2TpXbxt+ktUF
	dE/q7SEV5AY0NcNNvNC1bLq1V6kSrhi8Yw7twjYmkgJHPIvucVk1WaYUgCoRqJ60
	EHetj2k99df8Wyp5ctk/iScwDXeHjqtmX58EbipBk3mCCHhqDEN+D8fdGFScrJg4
	hEZp4hC3RMxEvWUfM3jn1NoyH66MEFAYGr7Y5Y5MyaeysIUJyekNXJY44KQLHNH7
	4hfDuZ8Hlha8BTRIo4kkOTwUp24ySvL1Fq1UCQAtnY3bxUpuUgeeEJondXDIjctK
	na7zyIWsZ97C1nTCFzjnRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749297546; x=
	1749383946; bh=nbvq2QJv8S2Bw9oGUdFqLSLlZuMe0C9l5sEZ5s71CIA=; b=A
	5vr9kwWHZfknjJ9wKtrpWT8cxSLS5wngX3F+/efdYOB2k2sYtdwp7A5M+3PM8AUw
	bmhjVJaM/eLXA+i3nfRWIpAAyKQKX4m9cWYrkNXbAzubSS89bXKOat0iB3E4Z91Y
	/SzZ6ezZDlzhM+jY2uzcIWkS6+zhUEUTpzgIfM5T3vFSE4n68u9679ViXfBpB3Y9
	A41a+B5I/rYg27jGT9duricCx1ASDbkS7MhmIL/ExVWEVqOBczFH1bE1HFwiy7CC
	RJn4pvx+QMp1OQa3eORqZ/HoHNq0GQpMSYhLWs1RcdrLxS1eMtXa2GIfRZyWWcNe
	kSQspODOYmz4L88Rnxgtw==
X-ME-Sender: <xms:iSlEaCjk9dXijp1TmaAmXZK5X1aHKPuNZ0Domf_dX4wuay_q4fscSw>
    <xme:iSlEaDAxhFE4K4ysSsMc_n-B0WEJVe_3OPHQFds4c8DIr-EMOuP3lMrWTR9NwzJda
    RNg0J7RImgUdKKfjIE>
X-ME-Received: <xmr:iSlEaKFpGmkW8ZQOPB16tgxy9LWdigDyHY0PbwTKNzxKWVoSuU4IGycdAlUhesPQk5Me-SMy9iAjKoubNt68Z7uHwwosnbn3LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeihedtucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:iilEaLQLdb4hjrZqr4wLWtSsREYljmrh0ebEI59OtTiFoxnhDTbTdQ>
    <xmx:iilEaPx3jV5o0M0ftEn4UjmZgrY7imyzIey0xp_cWWWfdRt_leNDuw>
    <xmx:iilEaJ4aPwECtWgawFT5fPqxqStez84wiNK-5OepDZaGzSVB0mnklQ>
    <xmx:iilEaMzaDToTa6SNlWI50a1g84vLCst5RJFOGYchsOzrdvezZ5ZyFA>
    <xmx:iilEaHN9Jx5Q9HvJ4mVOfYoUtrVvjLsKGX0eeHJBjorYDVtLZj6KJrHp>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 07:59:05 -0400 (EDT)
Date: Sat, 7 Jun 2025 13:59:04 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/6] media: rcar-vin: Prepare for unifying all
 v4l-async notifiers
Message-ID: <20250607115904.GE2780410@ragnatech.se>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
 <20250521132037.1463746-5-niklas.soderlund+renesas@ragnatech.se>
 <aDVjW_k_keyFQbPT@kekkonen.localdomain>
 <20250606135000.GA2780410@ragnatech.se>
 <aEQe89vlZ667jb0T@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEQe89vlZ667jb0T@kekkonen.localdomain>

Hej Sakari,

On 2025-06-07 11:13:55 +0000, Sakari Ailus wrote:
> Hejssan!
> 
> On Fri, Jun 06, 2025 at 03:50:00PM +0200, Niklas Söderlund wrote:
> > Hej Sakari,
> > 
> > Thanks for your feedback.
> 
> Var så god!
> 
> > 
> > On 2025-05-27 07:01:47 +0000, Sakari Ailus wrote:
> > > Hej Niklas,
> > > 
> > > On Wed, May 21, 2025 at 03:20:35PM +0200, Niklas Söderlund wrote:
> > > > The R-Car VIN driver is needless complex and uses more then one
> > > 
> > > s/needless\K/ly/
> > > 
> > > > v4l-async notifier to attach to all its subdevices. Prepare for unifying
> > > > them by moving rvin_parallel_parse_of() to where it needs to be when
> > > > they are unified.
> > > > 
> > > > The function is moved verbatim and there is no change in behavior.
> > > > 
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > >  .../platform/renesas/rcar-vin/rcar-core.c     | 106 +++++++++---------
> > > >  1 file changed, 53 insertions(+), 53 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > > > index d9ad56fb2aa9..60ec57d73a12 100644
> > > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> > > > @@ -337,6 +337,59 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
> > > >  	}
> > > >  }
> > > >  
> > > > +static int rvin_parallel_parse_of(struct rvin_dev *vin)
> > > > +{
> > > > +	struct fwnode_handle *ep, *fwnode;
> > > > +	struct v4l2_fwnode_endpoint vep = {
> > > > +		.bus_type = V4L2_MBUS_UNKNOWN,
> > > > +	};
> > > > +	struct v4l2_async_connection *asc;
> > > > +	int ret;
> > > > +
> > > > +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
> > > > +	if (!ep)
> > > > +		return 0;
> > > > +
> > > > +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> > > > +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > > > +	fwnode_handle_put(ep);
> > > > +	if (ret) {
> > > > +		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> > > > +		ret = -EINVAL;
> > > > +		goto out;
> > > > +	}
> > > > +
> > > > +	switch (vep.bus_type) {
> > > > +	case V4L2_MBUS_PARALLEL:
> > > > +	case V4L2_MBUS_BT656:
> > > > +		vin_dbg(vin, "Found %s media bus\n",
> > > > +			vep.bus_type == V4L2_MBUS_PARALLEL ?
> > > > +			"PARALLEL" : "BT656");
> > > > +		vin->parallel.mbus_type = vep.bus_type;
> > > > +		vin->parallel.bus = vep.bus.parallel;
> > > > +		break;
> > > > +	default:
> > > > +		vin_err(vin, "Unknown media bus type\n");
> > > > +		ret = -EINVAL;
> > > > +		goto out;
> > > > +	}
> > > > +
> > > > +	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
> > > > +				       struct v4l2_async_connection);
> > > 
> > > If you use v4l2_async_nf_add_fwnode_remote() here, you can omit
> > > fwnode_graph_get_remote_endpoint() call above. Also the error handling
> > > becomes more simple.
> > 
> > Indeed it would, but I do use fwnode in the debug print at the end of 
> > the function. And I do find that print out use-full when debugging, so I 
> > would like to keep it.
> 
> The drivers really shouldn't have a need for this. How about adding that
> debug print to the V4L2 async framework instead? I think it might be useful
> for other drivers as well even though the information is available via
> debugfs (or sysfs?) already.

That is a good idea, I will try to find time and move the debug prints 
(I have other similar ones in the driver) to the framework in follow up 
work.

Or if debugfs is enough for my needs I can drop them all together! My 
primary use-case is to get a grips of what's going on from bug reports 
sent to me so I can't always poke around on a live system.

> 
> > 
> > Laurent's suggestion of using __free(fwnode_handle) can instead be used 
> > to make error handling easier, and since it would be needed for the ep 
> > variable anyhow I think I will try that.
> 
> Sounds good to me.
> 
> > 
> > > 
> > > > +	if (IS_ERR(asc)) {
> > > > +		ret = PTR_ERR(asc);
> > > > +		goto out;
> > > > +	}
> > > > +
> > > > +	vin->parallel.asc = asc;
> > > > +
> > > > +	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
> 
> Please use %pfw instead for the fwnode (at least for the possible V4L2
> async patch).

ack.

> 
> > > > +out:
> > > > +	fwnode_handle_put(fwnode);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > >  static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
> > > >  				    unsigned int max_id)
> > > >  {
> > > > @@ -635,59 +688,6 @@ static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
> > > >  	.complete = rvin_parallel_notify_complete,
> > > >  };
> > > >  
> > > > -static int rvin_parallel_parse_of(struct rvin_dev *vin)
> > > > -{
> > > > -	struct fwnode_handle *ep, *fwnode;
> > > > -	struct v4l2_fwnode_endpoint vep = {
> > > > -		.bus_type = V4L2_MBUS_UNKNOWN,
> > > > -	};
> > > > -	struct v4l2_async_connection *asc;
> > > > -	int ret;
> > > > -
> > > > -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
> > > > -	if (!ep)
> > > > -		return 0;
> > > > -
> > > > -	fwnode = fwnode_graph_get_remote_endpoint(ep);
> > > > -	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > > > -	fwnode_handle_put(ep);
> > > > -	if (ret) {
> > > > -		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> > > > -		ret = -EINVAL;
> > > > -		goto out;
> > > > -	}
> > > > -
> > > > -	switch (vep.bus_type) {
> > > > -	case V4L2_MBUS_PARALLEL:
> > > > -	case V4L2_MBUS_BT656:
> > > > -		vin_dbg(vin, "Found %s media bus\n",
> > > > -			vep.bus_type == V4L2_MBUS_PARALLEL ?
> > > > -			"PARALLEL" : "BT656");
> > > > -		vin->parallel.mbus_type = vep.bus_type;
> > > > -		vin->parallel.bus = vep.bus.parallel;
> > > > -		break;
> > > > -	default:
> > > > -		vin_err(vin, "Unknown media bus type\n");
> > > > -		ret = -EINVAL;
> > > > -		goto out;
> > > > -	}
> > > > -
> > > > -	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
> > > > -				       struct v4l2_async_connection);
> > > > -	if (IS_ERR(asc)) {
> > > > -		ret = PTR_ERR(asc);
> > > > -		goto out;
> > > > -	}
> > > > -
> > > > -	vin->parallel.asc = asc;
> > > > -
> > > > -	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
> > > > -out:
> > > > -	fwnode_handle_put(fwnode);
> > > > -
> > > > -	return ret;
> > > > -}
> > > > -
> > > >  static void rvin_parallel_cleanup(struct rvin_dev *vin)
> > > >  {
> > > >  	v4l2_async_nf_unregister(&vin->notifier);
> 
> -- 
> Med vänliga hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund

