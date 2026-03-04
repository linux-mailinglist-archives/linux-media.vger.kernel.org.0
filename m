Return-Path: <linux-media+bounces-54458-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNQIGYMSqGm/ngAAu9opvQ
	(envelope-from <linux-media+bounces-54458-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 12:07:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 214721FEAE2
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 12:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 869733012E46
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 11:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E87A3A2579;
	Wed,  4 Mar 2026 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kkivlZzP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9803976A7
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622464; cv=none; b=myYJiM5ZikXTSlUzEEN+/LXxeevg3/pWz5oiW9ib841Cn1guSkYs57wTpPVTesyGdwXfajtUNMw4SbWe9xEwEZoqVsKjBBJdU3hdPksZSdMAdpkgJzj0nUBvQ6JfjOzL4z4dNrVvjjLnNEBsCy4tGxkXYi6pODFB9vEsDFiNLnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622464; c=relaxed/simple;
	bh=GQgZl+hb5vJHSc5otdcv/INSX/iqwoYHQ/QyhJiHEOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p25oX4lkU0CDdcWusk982NHwNPM8EijUcKXvg6MlH050+Ht48XYWFO0JW1pF3weWwgE+heBDlNMDULd0tfYlxCHqGltiGYiZrxLhkKqVtSa4WyrtkTyqg46NRIGiyQh2JRAqttTbhZq7LPvE8o1yDLkCQu6OhIdvFxKL2PBG2Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kkivlZzP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Go6W
	ehmyci0DJ/MCAqPt3GYrNoZxkU13L6zOAdfar8s=; b=kkivlZzPtMJBXQH/hPQ3
	qPCcLeyBPW7V9igmfr58nDc4NCvyUwzGdvAK/tIsS18FsNK2UOl2llVTiRyIQDH8
	zX64j6IFxhKiwPtP0mCvWQDqKyem0mxivks65IsLnnGgzejW/UbORNu6fVqegwke
	soPJOCFJ7fO6ci9/sJyDjtt088/mH1PBt4uWsN00gJaSRvz9Au+P3PzXZXC69AQP
	o8aYQwbaVu/COFNWlQy6UP9/ZIekJc+opAnXSKLR7fisH2iL1s29I5lgFHiz/p98
	hoBGmoA0+RlVDSglIYUHHdWMlv+mJvwKcdfR4PVQ3LULl54pUz5Sc+EoC7/JEe0n
	tw==
Received: (qmail 702506 invoked from network); 4 Mar 2026 12:07:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Mar 2026 12:07:40 +0100
X-UD-Smtp-Session: l3s3148p1@BIQK1DBMcBptKXG7
Date: Wed, 4 Mar 2026 12:07:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aagSewpM88KAZDcJ@shikoro>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com>
 <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
 <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com>
 <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com>
 <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
X-Rspamd-Queue-Id: 214721FEAE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54458-lists,linux-media=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Bart, hi Johan,

> And I agree: doing the above would be even better but you'd need - for every
> driver - to move the i2c_adapter struct out of driver data and make it a
> pointer. That's in addition to providing new APIs and using them. I2C drivers
> are spread treewide. There's a reason why nobody attempted it for decades. I'm
> proposing something a bit less complex: allow drivers to free i2c_adapter at
> unbind but make i2c core keep a private, reference-counted structure for as
> long as it's needed.

I am still with Bart, the above paragraph sums it up extremly well IMO.
I also recall that the outcome of the Plumbers session 2024 was "go for
it!". Nobody said the approach would be "fighting" the driver model.
There were a lot of experienced developers in the room.

> I'm frustrated because I'm spending time working on an actual solution. I've
> explained what I'm doing and what the end result will look like based on what
> works for GPIO (struct gpio_chip's lifetime is bound to device's "bound" state,
> struct gpio_device is refcounted, I want to mirror it with i2c_adapter and
> whatever we eventually call its refcounted counterpart - let's say:
> i2c_bus_device).

I am super-happy and thankful that Bart volunteers to spend all this
time on fixing this decade old problem. I know this alone is not a
reason to accept a technically bad solution. But I think it isn't. I
think it is a viable approach to keep the churn and potential
regressions lower than a theoretically ideal solution which is nobody to
do anyways because you'd need to refactor drivers from the 90s in a
quite intrusive way.

All the best,

   Wolfram


