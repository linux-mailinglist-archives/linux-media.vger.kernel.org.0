Return-Path: <linux-media+bounces-34576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC84AD68DE
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ADCF3A3E01
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 07:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8BF20B7EA;
	Thu, 12 Jun 2025 07:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BkOSufU4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KsQ8g7ME"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163A31EB1BF;
	Thu, 12 Jun 2025 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749712966; cv=none; b=Ome4/Qxsv+B9aaE1now4ObHUcXBapz6cao18Zrcs0iqhmySKEiBsM78akAad4S+8fIvJE7PVqmUPWriAQHwip+h3YgXtD0NkHkl7snach/0KsARJ3q+BSFYKUJjJJtesVgA7ICB14TRy0iOhm9o87wJT62scAHyizFe+p2wIYJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749712966; c=relaxed/simple;
	bh=tudZmes0tzS0L6N+Moup6myILR3aF7F6LV4KkXIKHms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CipQeG0Kg4/VI8IxpRpy3Y+edjbQVOZd6X4l1L1L69HwKzEZtU3+j4PyqhPmjxnsn9w5hW7x8LA+tMcYdfbJ+/yqczxe+DEpQhsAwM7TpCVwCnv1B2PnWYpUzNlV6tN8dyfnFvuGI15nK0vxjTDaFpRiZBgzmC9EdQApKSXpjx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BkOSufU4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KsQ8g7ME; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2F79511401B1;
	Thu, 12 Jun 2025 03:22:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 12 Jun 2025 03:22:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749712963;
	 x=1749799363; bh=m3QInsRv6rSgD8UgJsyiuSNJFvPdPwOZW8NEO9LmxCg=; b=
	BkOSufU4DYPJ8vE/1PlLDWNgWOYEhuyAkJeBqTXl070f+HHytQtktlfgF4TZYW87
	FTst568UemA1C4Pm9TR+lBEOFELyGy3jHYPndzYgFMG5yz7uPFAJnG1McRH87+9w
	DSpAE3WmaEKvqPDrxHpFYis+NbbWa8uqZPJMUOi5Yt20EIG6pW4QmaSB9+34FFKI
	MVZLDntpbxurtAmr7k7z0gYvazOCMXNa103r3oUJvWmdpgr1YPLqiTbR1QaQtT+0
	uFHi8u85KeiiJ73WToxrwqn85tKDAnFU/p10LqEHEqIAeHp5IWw+8IZ5GYkIMsRW
	Arqtg6S1X7GF1Po61UahOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749712963; x=
	1749799363; bh=m3QInsRv6rSgD8UgJsyiuSNJFvPdPwOZW8NEO9LmxCg=; b=K
	sQ8g7MEx4l4t8V2XJOdEnWhyNR6SfkccAzHXy5Rzr8IvTXuYXtXFQccZuBEXeI28
	zagpv5fsl6aX1fS9cfFLWrMuAYDkbnPrT84TB4bTcHDl1HctqT2R+TNSl4GIPOJ/
	r4Efp0ymjTyK0Z7gXxU6NZch+uGPh1Y7LkhctxwFeK78WIik6+i4m7L7tLBISFM9
	0NbwkkEAZ7EY5WEmhHilljgoD0eSi/wkql7t2wlYivatHxd3G5hOiJz2EAB1VWJW
	ZajtdH5SlOowauUEndNGzjx40WPoA47Dy8KXWWIBuWrfhiY2tHtk9XIrjNjP1Rk7
	oj2t43ype9BQ6gatcoJIA==
X-ME-Sender: <xms:QoBKaN-nVyvJFURa8IwjCri6ct1mDok-f80md_bcfKGYE0n0M57jVw>
    <xme:QoBKaBvwrqCVAneWy8q9FOpGyb2Rod_TSNh8SrgeQoAT1cdoQyq8lsuN-uz4MuBWa
    iF3XtVVFArfVyxwMkg>
X-ME-Received: <xmr:QoBKaLDVeFBUPKWAoUKhagwq-d7i8LYrGdBMQaCT8ej28KeZYTnFBVwnnzXXcdtj0GGTgrmXIVq-FQrdEzjinswkBYbuQU-SNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddugeeghecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:QoBKaBeIkrbqMYgLJvM_PglvFzwPP7p8VQ6KhtDJqIae4Mhl3dZa8Q>
    <xmx:QoBKaCNgIAarFBv3lZ7q5YXhC38hTtZOmQCrSDi4YKvb_YpK9_BJFw>
    <xmx:QoBKaDn9Ui1ItrEQDhaEcS_UR7i7gMcr7DMHWKHpETxaGfkRyMksQw>
    <xmx:QoBKaMuYAC1wegIv9xPJW8aUENbR2Wn31upqa8O5d3zzbEGoO2iTkw>
    <xmx:Q4BKaLKEbRI1jf1NZlul5lsEP1vx6Nt22oC9u58CkYSezGyOGhjwr3ER>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 03:22:42 -0400 (EDT)
Date: Thu, 12 Jun 2025 09:22:40 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 12/12] media: rcar-vin: Fold event notifier into only
 user
Message-ID: <20250612072240.GF330732@ragnatech.se>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-13-niklas.soderlund+renesas@ragnatech.se>
 <20250612002816.GD22977@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612002816.GD22977@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for your review.

On 2025-06-12 03:28:16 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Fri, Jun 06, 2025 at 08:26:06PM +0200, Niklas Söderlund wrote:
> > With Gen2 converted to use the common media device there is only one
> > caller left for the helper to notify a video device of an event, fold it
> > in.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v4
> > - Broken out from larger patch.
> > ---
> >  .../platform/renesas/rcar-vin/rcar-v4l2.c     | 20 +++++++------------
> >  1 file changed, 7 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > index 2bf94bd77c24..59b01cb0628a 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > @@ -656,18 +656,6 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
> >  	video_unregister_device(&vin->vdev);
> >  }
> >  
> > -static void rvin_notify_video_device(struct rvin_dev *vin,
> > -				     unsigned int notification, void *arg)
> > -{
> > -	switch (notification) {
> > -	case V4L2_DEVICE_NOTIFY_EVENT:
> > -		v4l2_event_queue(&vin->vdev, arg);
> > -		break;
> > -	default:
> > -		break;
> > -	}
> > -}
> > -
> >  static void rvin_notify(struct v4l2_subdev *sd,
> >  			unsigned int notification, void *arg)
> >  {
> > @@ -693,7 +681,13 @@ static void rvin_notify(struct v4l2_subdev *sd,
> >  		if (remote != sd)
> >  			continue;
> >  
> > -		rvin_notify_video_device(vin, notification, arg);
> > +		switch (notification) {
> > +		case V4L2_DEVICE_NOTIFY_EVENT:
> > +			v4l2_event_queue(&vin->vdev, arg);
> > +			break;
> > +		default:
> > +			break;
> > +		}
> 
> How about
> 
> 		if (notification == V4L2_DEVICE_NOTIFY_EVENT)
> 			v4l2_event_queue(&vin->vdev, arg);
> 
> Unless you expect more notifications to be handled later ?

I do, I have a different series that tries to notify CSI-2 errors to 
user-space with events. The series was posted in 2021 and I need to get 
back to it at some point ;-)

As this just moves the existing structure around I would prefere to keep 
it as-is for now.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> >  	}
> >  }
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

