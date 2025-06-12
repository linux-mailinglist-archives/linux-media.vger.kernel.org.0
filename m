Return-Path: <linux-media+bounces-34603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AA1AD6CAF
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB70A3AF72A
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333E822DF84;
	Thu, 12 Jun 2025 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="h74CKfzJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="krx0H44a"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE10D22D793;
	Thu, 12 Jun 2025 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722196; cv=none; b=Ql6S5X2XLPRtVt23U37KWxQmnTEH5GrBgOfE3L0L/yiK2KrN0Jy1UvIs/Iis6UcaLcHmBfUri9z7XenyTpHiQt6oMlFwbSslhssWruKBr6C/07lidDd5Zn/RytaYQB7sn+oJVSaO6OAeB8cQ5RbWfqHW5J3/AoaqRQPo+FwC/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722196; c=relaxed/simple;
	bh=9HdohCT5MwvPXh/iksGON7Pd7CDhb67AAWLCrpYl8vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Srhi2z1Hwe0LV55zb+ApZFKm1+M0XqyaCJdR8IjMvCKgQstc3H7iQhjQt4zwZ9rjtWYr+FMOAhPdX2yP27i41N39uOEI/u/R6FMFSOboLgNF6STvAmZYNqjRF0p5O1oi4odMMoDZlLa/mBMNPt9AJXKC5U8bQiCrDkXWouBy4mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=h74CKfzJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=krx0H44a; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D6E9A11401C5;
	Thu, 12 Jun 2025 05:56:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 12 Jun 2025 05:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749722191;
	 x=1749808591; bh=WDLmpZQpxxjGEOa4a2f+j3Nb/lDbwjtxEQn2zCDYv+o=; b=
	h74CKfzJH6NuE3xQLr7z1f0tGRBf9kQDopXwjIdbOP3sMyStVgqxjUfHoszGQr5V
	2YPGPhXaNTcq9ZonfbUlZqS8Q6FohIb3Na/Za1xolFmBymPLe6DaRJoGSQCqX4V+
	aHJzwVuwkTbsV2tXFp6TUZlsyrHQFbd5MmBnHQwIhGJUVqNzYC+RmCfecixRE4YB
	BD+5HBw0VyRwJWxQGCxYYpAPvMI1vxQG4YO0mSVYLCfLXuAsLCtuXeJXvSHcefJ1
	VO0RjOeJL3EBCOIs3xngETw95TX+Rh4oldigLdy3/yZcSwYFv5t3YNX5OQtZsoGc
	91AB3zwDQuqpV8Irjt8a8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749722191; x=
	1749808591; bh=WDLmpZQpxxjGEOa4a2f+j3Nb/lDbwjtxEQn2zCDYv+o=; b=k
	rx0H44aL90efH/q0+pbxjWiaks/HSW+2YlqGtHGhVXGFlGf5EGvYXELnMjOHdXe8
	hIPZVjpd9U4MWVhQNhABe/67LGcShFwDTAYEFYgQuLBsZJaqDy25nZ4C7s7YYwnP
	ez2Y5SP2nVm4+0dk/paGSMksQUjB8ynGHjCa+bH3mJHBU+P+XzKsYi7O7Jbjquy3
	1diEVE56q8F7XOQe1rkINPfyt8i8wUlBF4GrSOTmssAKpXbZXgsA6Tgwnp5ldr+/
	EXLioCTXW7cIp5wf3ip5UBIHqHtXhdRQ7NfycUeP1S/LKtVpAhi3+m9K00sYz2SJ
	7tpGd8JfK05WnsRMEKtzw==
X-ME-Sender: <xms:T6RKaE1Pbw6Rr2VeTy0dz6PsiZCflCxfi7988anJonhjRjAs2fFlUw>
    <xme:T6RKaPENlk8zuQwK1w-kMFQnBQtI8bULt3qmC3eV1jnjfqabcv3v9TELp72v-SQeg
    QlFsjMZrPwdqAUavBU>
X-ME-Received: <xmr:T6RKaM7N9oI3gHXvTZ431Jf1e1-VrsKye37Mnf-HCpA8XM_YlyBtZl-F_kOGIK6-sczdQDeCtU2WwCqBu6yR-qIaeGLUAym52Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddugeejiecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:T6RKaN0gyCJKN9Q18gK8rkaUCzlEGxZwuwKGz3PoLei5pKFcZtawpw>
    <xmx:T6RKaHFQvMp99r2EYiWrFBVIT6xPnF2ocQtDHlgsz00nsOEo_GTS0Q>
    <xmx:T6RKaG9ihilIKw63iY10LX_8jtkksOAb84t3klxzqjoh1wbpYgpkHw>
    <xmx:T6RKaMk0md1Q8CkQekQH6tvMX3eTBCcPi7k2m_m2nL7ADH58XXQlwg>
    <xmx:T6RKaDCzxHTSIofWb0b1ask1OVE0CzwIjoYbDs99orEAD2ZkRy1jmRGY>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 05:56:30 -0400 (EDT)
Date: Thu, 12 Jun 2025 11:56:27 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 12/12] media: rcar-vin: Fold event notifier into only
 user
Message-ID: <20250612095627.GG330732@ragnatech.se>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-13-niklas.soderlund+renesas@ragnatech.se>
 <20250612002816.GD22977@pendragon.ideasonboard.com>
 <20250612072240.GF330732@ragnatech.se>
 <20250612094408.GD25137@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612094408.GD25137@pendragon.ideasonboard.com>

On 2025-06-12 12:44:08 +0300, Laurent Pinchart wrote:
> On Thu, Jun 12, 2025 at 09:22:40AM +0200, Niklas Söderlund wrote:
> > On 2025-06-12 03:28:16 +0300, Laurent Pinchart wrote:
> > > On Fri, Jun 06, 2025 at 08:26:06PM +0200, Niklas Söderlund wrote:
> > > > With Gen2 converted to use the common media device there is only one
> > > > caller left for the helper to notify a video device of an event, fold it
> > > > in.
> > > > 
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > > ---
> > > > * Changes since v4
> > > > - Broken out from larger patch.
> > > > ---
> > > >  .../platform/renesas/rcar-vin/rcar-v4l2.c     | 20 +++++++------------
> > > >  1 file changed, 7 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > > index 2bf94bd77c24..59b01cb0628a 100644
> > > > --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
> > > > @@ -656,18 +656,6 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
> > > >  	video_unregister_device(&vin->vdev);
> > > >  }
> > > >  
> > > > -static void rvin_notify_video_device(struct rvin_dev *vin,
> > > > -				     unsigned int notification, void *arg)
> > > > -{
> > > > -	switch (notification) {
> > > > -	case V4L2_DEVICE_NOTIFY_EVENT:
> > > > -		v4l2_event_queue(&vin->vdev, arg);
> > > > -		break;
> > > > -	default:
> > > > -		break;
> > > > -	}
> > > > -}
> > > > -
> > > >  static void rvin_notify(struct v4l2_subdev *sd,
> > > >  			unsigned int notification, void *arg)
> > > >  {
> > > > @@ -693,7 +681,13 @@ static void rvin_notify(struct v4l2_subdev *sd,
> > > >  		if (remote != sd)
> > > >  			continue;
> > > >  
> > > > -		rvin_notify_video_device(vin, notification, arg);
> > > > +		switch (notification) {
> > > > +		case V4L2_DEVICE_NOTIFY_EVENT:
> > > > +			v4l2_event_queue(&vin->vdev, arg);
> > > > +			break;
> > > > +		default:
> > > > +			break;
> > > > +		}
> > > 
> > > How about
> > > 
> > > 		if (notification == V4L2_DEVICE_NOTIFY_EVENT)
> > > 			v4l2_event_queue(&vin->vdev, arg);
> > > 
> > > Unless you expect more notifications to be handled later ?
> > 
> > I do, I have a different series that tries to notify CSI-2 errors to 
> > user-space with events. The series was posted in 2021 and I need to get 
> > back to it at some point ;-)
> 
> Could the event be sent on the subdev instead of the video device ?

That is a good point, the event should be sent to user-space thru the 
subdev. The current work I have (that might change) however acts on the 
event to stop the capture process on error, but indeed maybe the call to 
stop capturing should also come from user-space as a reaction to the 
event.

I have captured these thoughts in my TODO file, thanks for the 
suggestion.

> 
> > As this just moves the existing structure around I would prefere to keep 
> > it as-is for now.
> 
> OK.
> 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > 
> > > >  	}
> > > >  }
> > > >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

