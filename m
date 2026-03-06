Return-Path: <linux-media+bounces-54805-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP1QJpP1qmlcZAEAu9opvQ
	(envelope-from <linux-media+bounces-54805-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 16:41:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C12240B2
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 16:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A1A4305093E
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 15:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7473EBF33;
	Fri,  6 Mar 2026 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joeYs+2f"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C03D3EB80D;
	Fri,  6 Mar 2026 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811584; cv=none; b=cKlc3bgGKVQPS3RWqDypFb1hRos15xz2RnlM98nO1IPc40xiW8DFmFabmZv5+4Psu9HOjOP1JcXg8o21L7ONMs/dylCbvJ8AWHfpwhTTq21am7C1K6XakZ7uANwcqmXb8aiC2buc/7F4nBKtiShhNGI8ShKIPsTwL9NG+ZaFyGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811584; c=relaxed/simple;
	bh=sA7klZwAjMGzSg7D2nkr3VzQfy3dllPSLjh1NxQleUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilntJxJWKpyb4qgkFJqWArNNe7VBzdZ+Q61RFWMcoeWD65FPbYkWlSQ3saMJmeYNMQC99PmGruhTQKAZxvCkqkqXxYsVoTDNAVWD4DZruXQuYqe2w82qN2CUX8aMo4CMB8UkotbmsIWjQiNXhuW7Ks34IDR1YzBzB1FQwHomoQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joeYs+2f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FF3C4CEF7;
	Fri,  6 Mar 2026 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811583;
	bh=sA7klZwAjMGzSg7D2nkr3VzQfy3dllPSLjh1NxQleUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=joeYs+2fl+4Fec/1XHfYv3A7Q4YKPP5eiMn0LZM+qRweq/0Nb7kbhiLzqCxvkgWRC
	 tCAS/Xx0agJmoxvvAVc6x4X8GZR1BI3svk9yKBfAEuQLgkLqDqRKwm7e6RwKl4pyMn
	 dUQ95O395D88k9Yg13CcVMogOutjKpVqLmwup4Ex7i4Z3ch4u/o8zh10VAGacvteCd
	 0ioPnzAhuVix78W0UsYEYvBbJxV/ywhcyOOMiApmh0S1ywx8DF+VobQ/QLsAzG3m/C
	 LWHfX4xBdayp9vmOMWP88nGMykl3fWI4var5kS7GlnVBK6RWTpAzcxPtZHOdhHq20R
	 +kKU1lnmfWAMg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vyXHA-000000003em-3GlB;
	Fri, 06 Mar 2026 16:39:40 +0100
Date: Fri, 6 Mar 2026 16:39:40 +0100
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
Message-ID: <aar1PDUB2t7DgEP6@hovoldconsulting.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
X-Rspamd-Queue-Id: 422C12240B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54805-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.989];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:55:14AM -0800, Bartosz Golaszewski wrote:
> On Tue, Mar 3, 2026 at 4:57 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Mar 02, 2026 at 12:03:19PM -0600, Bartosz Golaszewski wrote:
> > > On Fri, Feb 27, 2026 at 5:41 PM Johan Hovold <johan@kernel.org> wrote:
> > > >
> > > > On Fri, Feb 27, 2026 at 04:42:09PM +0100, Bartosz Golaszewski wrote:
> > > > > On Fri, Feb 27, 2026 at 11:06 AM Johan Hovold <johan@kernel.org> wrote:
> > > >
> > > > > > It seems all that is needed is to decouple the struct i2c_adapter from
> > > > > > the driver data and have core manage the lifetime of the former using
> > > > > > the reference count of the embedded struct device.
> > > >
> > > > > This is a weird pattern you sometimes see where a driver allocates
> > > > > something and passes the ownership to the subsystem.
> > > >
> > > > It's not weird at all, this is the standard way to handle this. We have
> > > > these things called reference counts for a reason.
> > >
> > > I wouldn't say it's *the* standard way. There are at least several different
> > > ways driver subsystems handle resource ownership. And even so: the fact that
> > > something's done a lot does not make it automatically correct.
> >
> > It's the way the driver model works.
> 
> No, it does not impose any specific pattern to use for subsystems other than
> requiring each device that's been *initialized* to provide a .release() callback
> called when the last reference is dropped.

Reference counting is a core part of the driver model and this is
reflected in the way subsystems manage lifetime.

> > > I'm advocating for a hard split between the subsystem data (reference-counted)
> > > and driver data (living from probe() until remove()). A logical struct device
> > > managed entirely by the subsystem should live in a separate structure than
> > > driver data and be allocated - and freed - by the subsystem module.
> >
> > It doesn't really matter what you think. You can't just go around
> > making up new subsystem specific rules at your whim. The linux driver
> > model uses reference counting and that's what developers expect to be
> > used.
> >
> 
> And I've never said that it should not use reference counting. I'm not sure
> what you're implying here.

You have posted changes that will prevent driver from accessing the
struct device of core i2c structures. This is unexpected, non-idiomatic
and subsystem specific and therefore a bad idea.

> > > Let's put aside kernel code for a minute and work with an abstract C example,
> > > where the equivalent of what you're proposing would look like this:
> > >
> > > struct bar {
> > >	   struct foo foo;
> > >	   ...
> > > };
> > >
> > > struct bar *bar = malloc(sizeof(*bar));
> > >
> > > ret = foo_register(&bar->foo);
> > >
> > > And the corresponding free() lives who knows where because foo_register()
> > > automagically introduces reference counting (nevermind the need to calculate
> > > where bar is in relations to foo).
> >
> > No, that's not what I'm suggesting here, but it would be compatible with
> > the driver model (ever heard of struct device which works exactly like
> > this?).
> 
> I know how struct device works. I'm pointing out that this is a bad API (just
> to be absolutely clear: not the reference counting of struct device itself but
> using it in a way tha looks like it's not refcounted but becomes so after an
> API call) because it's confusing. I'm not buying the argument that if it
> confuses you then you should not be doing kernel development because it's not
> the goal of API design to make it as complex and confusing as possible - quite
> the contrary. And it *is* confusing given the amount of misuse present. I've
> heard Greg KH say on multiple occasions during his talks that we try to offload
> complex code to subsystems so that drivers can remain fairly simple. I agree
> with that.

Again, this is a core feature of the driver model. You can't just ignore
it and come up with random ways to work around just because you disagree
with design decisions that were made 25 years ago.

> > > I strongly believe that this makes more sense:
> > >
> > > struct bar {
> > >	   ...
> > > };
> > >
> > > struct bar *bar = malloc();
> > >
> > > struct foo *foo = foo_register(bar);
> > >
> > > // foo is reference counted and allocated in the provider of foo_register()
> > >
> > > foo_put(foo);
> > > free(bar);
> > >
> > > The equivalent of which is moving struct device out of struct i2c_adapter.
> >
> > No, it's not.
> >
> > > In fact: I would love to see i2c_adapter become a truly reference-counted
> > > object detached from driver data but due to it being embedded in every bus
> > > driver data structure it realistically won't happen.
> >
> > And this is what I've been suggesting all along, separating the driver
> > data and making the adapter reference counted.
> >
> > The idiomatic way to handle this is:
> >
> >		 xyz_probe()
> >		 {
> >				 adap = i2c_adapter_alloc();
> >				 // initialise driver data, store pointer in adap
> >				 i2c_adapter_register(adap);
> >		 }
> >
> >		 xyz_remove()
> >		 {
> >				 i2c_adapter_deregister(adap);
> >				 i2c_adapter_put(adap);
> >		 }
> >
> > Exactly where the driver data is stored is secondary, it could be memory
> > allocated by core or by the driver.
> >
> > But the adapter is reference counted and kept around until all users are
> > gone.
> 
> Yeah, that's awesome but that's not what's being done in i2c. We do:
> 
> struct foo_i2c_driver_data {
> 	struct i2c_adapter adap {
> 		struct device dev;
> 		...
> 	};
> 	...
> };
> 
> instead which is a completely different story. It makes foo_i2c_driver_data
> implicitly reference counted despite its lifetime being tied to the bound-state
> of the device. It becomes painfully obvious in rust when the compiler starts
> enforcing proper lifetime management.

I'm quite aware of that and that's why we are discussing how to change
it.

> But sure, your example works fine too. My point is: getting to that state would
> require more churn than allowing drivers to continue allocating i2c_adapter
> struct themselves with struct device being moved out of it - making reference
> counting of it work properly.
> 
> And I agree: doing the above would be even better but you'd need - for every
> driver - to move the i2c_adapter struct out of driver data and make it a
> pointer. That's in addition to providing new APIs and using them. I2C drivers
> are spread treewide. There's a reason why nobody attempted it for decades. I'm
> proposing something a bit less complex: allow drivers to free i2c_adapter at
> unbind but make i2c core keep a private, reference-counted structure for as
> long as it's needed.

But its non-idiomatic and therefore not a good idea. Sometimes you just
have to dig in and fix the real problem instead of trying to work around
it.

> > > > Yes, you have to update the allocation and replace container_of() with
> > > > dev_get_drvdata() but it's a straight-forward transformation that brings
> > > > the i2c subsystem more in line with the driver model (unlike whatever it
> > > > is you're trying to do).
> > > >
> > >
> > > No, it's not that simple. The .release() callback of struct device embedded
> > > in struct i2c_adapter is assigned from the bus type and only calls complete()
> > > (yeah, I too don't think it looks right, one would expect to see the associated
> > > kfree() here, right?). It relies on the bus driver freeing the data in its
> > > remove() path. That's why we wait until all references to said struct device
> > > are dropped. After your proposed change, if your new release() lives in the
> > > driver module, it must not be removed until all the references are dropped
> > > - basically where we are now. If on the other hand, the release() callback's
> > > functionality is moved into i2c-core, how would you handle the fact i2c_adapter
> > > can be embedded in a larger driver data structure? Provide yet another callback
> > > in i2c_adapter called from the device's .release()? Sure, can be done but I
> > > doubt it's a better solution.
> >
> > You seem to be constructing some kind of straw man here. Obviously, the
> > release function would free the memory allocated for the adapter struct.
> >
> > An adapter driver can free its driver data on unbind as core will
> > guarantee that there are no further callbacks after the adapter has been
> > deregistered.
> >
> 
> Sure, but my point all along has been that - with struct device currently
> embedded in struct i2c_adapter - that's not the case. Driver data *and*
> i2c_adapter are tied together. You need a major rework in either case.

And I've being saying that the driver data should be *decoupled* from
the i2c_adapter.

> I'm frustrated because I'm spending time working on an actual solution. I've
> explained what I'm doing and what the end result will look like based on what
> works for GPIO (struct gpio_chip's lifetime is bound to device's "bound" state,
> struct gpio_device is refcounted, I want to mirror it with i2c_adapter and
> whatever we eventually call its refcounted counterpart - let's say:
> i2c_bus_device). If you claim you have a better alternative - will you do the
> work to make it happen?

Sure. I'll fix this properly.

Johan

