Return-Path: <linux-media+bounces-56036-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPJZOXIuuWkYuAEAu9opvQ
	(envelope-from <linux-media+bounces-56036-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:35:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DBB2A7FF1
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F412032B2D74
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D653A6EE3;
	Tue, 17 Mar 2026 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8xtv3vv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3201B3A3E97;
	Tue, 17 Mar 2026 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743284; cv=none; b=GBdZpQqSZ3S03alJUGmQ6QYehyhT1TazRpYGaw4aHFou+sWT3eX3Mx21mV5LVIm8zXLcRLz/12NnzmOqiqdrOKT4iL77WT4yKNmMNKuCr0JhY9p3T5eOwW33TWCUrkPz2h5Hw+qIwn6zG5o5AiUDK56857HmUXIbhRAbYChbKk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743284; c=relaxed/simple;
	bh=1xbKBSlkozJZVHo9aWAqFEve5sj6lCI9yEzMc1miQSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5dJLfDHOm8Vhue6fJFIfkAkcVJYjw6Y36rEzR4USiFpLc2q2/bYEecYtHcpcsIFTj8NN9f0vY9HlBdo3tDT1Q49IqrcF0v2TP4OoM0h9H1pHesBsW+x7qPXznLgBaIi7d69qDeSsVxWEQa8ScAGIvpIt+4C+0p4mJ9ArHhP4WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8xtv3vv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDBCC4CEF7;
	Tue, 17 Mar 2026 10:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773743283;
	bh=1xbKBSlkozJZVHo9aWAqFEve5sj6lCI9yEzMc1miQSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8xtv3vvdarHsmUyInVVAPUWhHzbvSKQhDx4fZK4XpDV/UBzN0OZIR24xJ2R4Dt5L
	 4hRILK7tJ0/V9pT5ryBqrlF0TBUT7uQxKTVZY8LWyD3DlRNwmzJBUHTnDrgULu71NU
	 dK+Qlbx2YcNx3HJ1gOWPakoZYxG8crAjXBz1qSa3ecwPxJMNfhOFrxqbpBu+NbESva
	 wqtZfW3kSs8MLR9P2wOUA+GX/DWynBZVts+mKGWl5U9ReZGOsRBJt1J00VfSqG0Bu0
	 7oAqB+pvVrJHBbMhjwD8U6rcw/vvtojEX0WHKBsow/19fu5zNweqcFVrGUrZFqQK7A
	 kHA80/SxGSIXA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2Rea-000000006oc-42C1;
	Tue, 17 Mar 2026 11:28:00 +0100
Date: Tue, 17 Mar 2026 11:28:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Message-ID: <abkssPv559MBM61V@hovoldconsulting.com>
References: <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
 <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com>
 <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com>
 <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
 <aar1PDUB2t7DgEP6@hovoldconsulting.com>
 <CAMRc=Mcv+ZMGaC_MD8WRH113rDuuxdiZXuW5JAXWga1V7vM_ng@mail.gmail.com>
 <aa6hcT7MROZqxF1j@hovoldconsulting.com>
 <CAMRc=McXGZFVQm0B2OddSLLV8r513tDmbEzeY4hvPcakSv9N7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McXGZFVQm0B2OddSLLV8r513tDmbEzeY4hvPcakSv9N7w@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56036-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 49DBB2A7FF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 10:28:17AM +0100, Bartosz Golaszewski wrote:
> On Mon, Mar 9, 2026 at 11:31 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Fri, Mar 06, 2026 at 06:34:43PM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Mar 6, 2026 at 4:39 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > > > You have posted changes that will prevent driver from accessing the
> > > > struct device of core i2c structures. This is unexpected, non-idiomatic
> > > > and subsystem specific and therefore a bad idea.
> > >
> > > That's not true, the changes provide a helper to that end.
> >
> > That was supposed to say "prevent drivers from accessing the struct
> > device *directly*".
> >
> > > > Again, this is a core feature of the driver model. You can't just ignore
> > > > it and come up with random ways to work around just because you disagree
> > > > with design decisions that were made 25 years ago.
> > >
> > > It absolutely *can* be done differently. There's nothing that imposes
> > > a certain API design on susbsystems. If you design the subsystem code
> > > well, provider drivers don't need more than one reference (taken in
> > > probe(), released in remove(), for instance via the
> > > register()/unregister() pair) so the counting can be hidden within the
> > > subsystems that control them.
> >
> > Yes, there is nothing preventing you from diverting from the idiomatic
> > way of doing things. But my point is that that's not a good idea.
> 
> "Idiomatic" is a just buzz-word.

No, it has a meaning.

> I don't know why you insist on it
> being the only "correct" way. People have been doing all kinds of
> driver data management for a long time.

Yes, subsystems do things differently, and unfortunately also gets
things wrong occasionally.

By separating allocation, registration, deregistration and put you can
avoid some of the mistakes that can result from combining these
operations.

> You recently looked at my
> series for nvmem - did you see that nvmem_register() only takes a
> config struct (which may be a stack variable in probe() for all it
> cares) and copies all the data it needs into refcounted struct
> nvmem_device that the subsystem allocates and manages?
> An nvmem provider driver only has to do
> nvmem_register()/nvmem_unregister() and, while it can access the
> internal struct device, it never has to in practice.

nit: It looks like drivers can't access the internal struct device
currently.
 
> There's no:
>   nvmem_alloc()
>   nvmem_register()
>   nvmem_unregister()
>   nvmem_put()
> 
> I don't see why we wouldn't do the same in i2c:
> 
>   struct i2c_adapter_config cfg = { ... /* dev id, driver data,
> whatever... */ };
>   adap = i2c_adapter_register(&cfg);
>   i2c_adapter_unregister(adap);

Because it's unnecessary, would amount to a lot of churn, and has no
clear benefits. We already have an adapter object, it just needs to
refcounted.

Johan

