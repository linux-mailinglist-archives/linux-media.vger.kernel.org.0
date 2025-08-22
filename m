Return-Path: <linux-media+bounces-40745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A3B314D6
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 12:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67880BA10E2
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 10:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFCA2D7DC5;
	Fri, 22 Aug 2025 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="ofC3MbHg"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69242C029C;
	Fri, 22 Aug 2025 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857393; cv=pass; b=hefzGCLyhQB9oAP90eoi9gskKae9/joobSIfO0NDL6FhF/5oqd9Yb4l3pUL0YoaarCln9XpHZHj4v3Uqt4zpEHDC5FWUdKb3XIEZM90Jci9tOpxgwu+lPI0D8GldXVfgoOytwo+JJi1ku9q3NvUHqQNn97sP+JaOVLTAChHkxxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857393; c=relaxed/simple;
	bh=T8ROrNDIfDuYoTbq8PfIQiVDeBf323W6pfygO8iSHAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AM25jgXiXoJTn+AHz+TeO70qSwpYuVr+GQgAJZYpgUabaVvpxbbKBOQKKToSeSOXOy3N8FkHZDZV4IK6aRSQUBIXveXDmvIuZwD/iNik/8GckbFcSCKggq01hYgZMCjYnfc2dH4xadfqAKI3GN7Z9JxdT0rZ4H9MlI4yTXv9aE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=ofC3MbHg; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c7bXC6pn8zyT0;
	Fri, 22 Aug 2025 13:09:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1755857388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Edx5eFoI2kFWMn+C2kKn3uVggSyrKKBix583FrwpuJw=;
	b=ofC3MbHgs0pTJQUjGMOWaW3psKoScTP49kmMWNgrvjpW8YSoinaCe+J9ivejcJtMJHdCvE
	cSSBtz/RFAHVszPDbzW9TN26qdjVvCwGfalqwmbkanvtCs5W0sZpbuaWXt1RGodrUKUU/U
	rG35EZ+fEEI3UVbtIaKntYxfJXDBqNk=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1755857388; a=rsa-sha256; cv=none;
	b=yjRvcgXivtm9H6dYImPIlkLwv2NE6TU7i9Q/WLQE/kvOWeadfcMJdgvWKt52h4QWTCUYe2
	sq3/evz5M+Cahvm0/SryvR9d0jJ0WZPoGbfwBhKjY3kD9Qo8FX36FCc1WIKnkDuMdQwwrg
	t4SkdR9ejMRXattlTjFKfB8KHxZe/Dc=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1755857388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Edx5eFoI2kFWMn+C2kKn3uVggSyrKKBix583FrwpuJw=;
	b=tB/YWjQJvdg0ZoWCtD50wbcEgVfZF6J7Sp9VV5KOXp1Za+TYCR7MWsyyGGTCIrcDCPNpd6
	fdQKx6WM3PsAZqqocOXRT7WEZoTCaGvpPOQ41y93HQ7KdZmzNQftl9Mf0sND9PM2R5yuBO
	czxXnDs4C6KssHuIHNpoWsLRdVWi+4A=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6F62F634C98;
	Fri, 22 Aug 2025 13:09:47 +0300 (EEST)
Date: Fri, 22 Aug 2025 10:09:47 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v4 3/5] docs: media: update maintainer-entry-profile for
 multi-committers
Message-ID: <aKhB6zrtRKwbAZ-s@valkosipuli.retiisi.eu>
References: <cover.1733218348.git.mchehab+huawei@kernel.org>
 <5eed1e4a37d087f401b7bd54b793ea301e511d7e.1733218348.git.mchehab+huawei@kernel.org>
 <aKcQak8k2MiCriZt@valkosipuli.retiisi.eu>
 <20250822102346.30347275@foz.lan>
 <aKgxcWYq-WZAFwsx@valkosipuli.retiisi.eu>
 <20250822113159.70b0339d@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822113159.70b0339d@foz.lan>

Hi Mauro,

On Fri, Aug 22, 2025 at 11:31:59AM +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 22 Aug 2025 08:59:29 +0000
> Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> 
> > Hi Mauro,
> > 
> > On Fri, Aug 22, 2025 at 10:23:46AM +0200, Mauro Carvalho Chehab wrote:
> > > Em Thu, 21 Aug 2025 12:26:18 +0000
> > > Sakari Ailus <sakari.ailus@iki.fi> escreveu:

...

> > > What about this:
> > > 
> > > <text>
> > > The Linux Media Community (aka: the LinuxTV Community) consist of developers 
> > > who work with the Linux Kernel media subsystem, together with users who
> > > benefit from such develoment and help testing the developed code.  
> > 
> > How about, with slight modifications:
> > 
> > The Linux Media Community (aka: the LinuxTV Community) is formed of
> > developers working on Linux Kernel Media Subsystem, together with users.
> 
> Works for me, although I prefer keep mentioning about the important
> role that users play on help testing drivers.

How about then:

The Linux Media Community (aka: the LinuxTV Community) is formed of
developers working on Linux Kernel Media Subsystem, together with users who
also play an important role in testing the code.

> 
> > 
> > > 
> > > They work on the top of the Media tree, which has code to support a    
> > > variety of devices: stream capture, analog and digital TV streams, cameras,
> > > remote controllers, HDMI CEC and media pipeline control.
> > > 
> > > The Media tree is mainly responsible to be the main source of the
> > > code under development with the contents of those directories:
> > > 
> > >   - drivers/media
> > >   - drivers/staging/media
> > >   - Documentation/admin-guide/media
> > >   - Documentation/driver-api/media
> > >   - Documentation/userspace-api/media
> > >   - Documentation/devicetree/bindings/media/\ [1]_
> > >   - include/media
> > > </text>
> > >   
> > > >   
> > > > >  
> > > > >    - drivers/media
> > > > >    - drivers/staging/media
> > > > > @@ -27,19 +28,158 @@ It covers, mainly, the contents of those directories:
> > > > >  Both media userspace and Kernel APIs are documented and the documentation
> > > > >  must be kept in sync with the API changes. It means that all patches that
> > > > >  add new features to the subsystem must also bring changes to the
> > > > > -corresponding API files.
> > > > > +corresponding API documentation files.    
> > > > 
> > > > I'd drop " files" as the documentation is split between C source code files
> > > > and ReST nowadays.  
> > > 
> > > OK.
> > >   
> > > > > -Due to the size and wide scope of the media subsystem, media's
> > > > > -maintainership model is to have sub-maintainers that have a broad
> > > > > -knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
> > > > > -task to review the patches, providing feedback to users if the patches are
> > > > > +Due to the size and wide scope of the media subsystem, the media's
> > > > > +maintainership model is to have committers that have a broad knowledge of    
> > > > 
> > > > Maintainership or maintenance?
> > > > 
> > > > s/is to have/recognises/ ?  
> > > 
> > > OK.
> > >    
> > > > > +a specific aspect of the subsystem. It is the committers' task to
> > > > > +review the patches, providing feedback to users if the patches are
> > > > >  following the subsystem rules and are properly using the media kernel and
> > > > >  userspace APIs.
> > > > >  
> > > > > -Patches for the media subsystem must be sent to the media mailing list
> > > > > -at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > > > > -HTML will be automatically rejected by the mail server. It could be wise
> > > > > -to also copy the sub-maintainer(s).
> > > > > +Media committers
> > > > > +----------------
> > > > > +
> > > > > +In the media subsystem, there are experienced developers who can push
> > > > > +patches directly to the development tree. These developers are called
> > > > > +Media committers and are divided into the following categories:
> > > > > +
> > > > > +- Committers:
> > > > > +    contributors for one or more drivers within the media subsystem.
> > > > > +    They can push changes to the tree that do not affect the core or ABI.    
> > > > 
> > > > Question to Ricardo -- sorry if I already have asked this: can this be
> > > > enforced?
> > > >   
> > > > > +
> > > > > +- Core committers:
> > > > > +    responsible for part of the media core. They are typically
> > > > > +    responsible for one or more drivers within the media subsystem, but, besides
> > > > > +    that, they can also merge patches that change the code common to multiple
> > > > > +    drivers, including the kernel internal API.    
> > > > 
> > > > This doesn't say clearly whether e.g. the V4L2 or MC frameworks are
> > > > included or not. I think they should be and this should be mentioned. Same
> > > > for videobuf2.  
> > > 
> > > The problem of specifying what the core via frameworks, vb2, etc is that
> > > this would require constant maintainance. Core is everything that is not
> > > inside a driver for an specific driver.
> > > 
> > > We called this here as "the code common to multiple drivers". For me it
> > > is clear, but if you have a better generic term, I'm all ears.  
> > 
> > How about:
> > 
> > - Core committers:
> >     responsible for part of the Media Core, including V4L2, Media
> >     controller, Videobuf2, CEC and DVB frameworks. They are typically
> >     responsible for one or more drivers within the Media Subsystem, but,
> >     besides that, they can also merge patches that change the code common
> >     to multiple drivers, including the kernel internal API.
> > 
> > I think we should define Media Subsystem, Media Core and possibly Media
> > Community in the glossary but I'd do that after merging this set.
> 
> You forgot remote controllers there ;-)
> 
> Btw, that's exactly my point: when we enumerate things, we tend to forget
> about something, and, when new stuff gets add, we need to remember to
> add here.

The text above does not imply something isn't part of Media Core even if
not listed. But of course Remote Controller should have been in the above
list. Adding that results in:

- Core committers:
    responsible for part of the Media Core, including V4L2, Media
    controller, Videobuf2, Remote Controller, CEC and DVB frameworks. They
    are typically responsible for one or more drivers within the Media
    Subsystem, but, besides that, they can also merge patches that change
    the code common to multiple drivers, including the kernel internal API.

> 
> > 
> > >   
> > > >   
> > > > > +
> > > > > +- Subsystem maintainers:
> > > > > +    responsible for the subsystem as a whole, with access to the
> > > > > +    entire subsystem.
> > > > > +
> > > > > +    API/ABI changes are done via consensus between subsystem maintainers\ [2]_.
> > > > > +
> > > > > +    Only subsystem maintainers push changes that affect the userspace
> > > > > +    API/ABI. Committers may push ABI/API changes on their commits if they
> > > > > +    have approvals from subsystem maintainers.
> > > > > +
> > > > > +All media committers shall explicitly agree with the Kernel development process
> > > > > +as described at Documentation/process/index.rst and to the Kernel
> > > > > +development rules inside the Kernel documentation, including its code of
> > > > > +conduct.    
> > > > 
> > > > Is there a need to mention this? Aren't people generally expected to
> > > > follow the process anyway?  
> > > 
> > > There's a big difference between "generally expected" and "have to agree".
> > > The goal here is really to prevent having bad committers as we had in the
> > > past on our previous multicommiters model before we moved to git. If this
> > > ever have again, by having an explicit agreement, one cannot deny he/she
> > > didn't know the rules.  
> > 
> > Fair enough. Either way, enforment is discretionary so I think this is
> > fine -- mistakes tend to happen, to everybody, at least in some extent.
> 
> Yeah, mistakes can happen. What we want to cover is intentional misbehavior.

I agree. I hope this will remain a theoretical possibility though.

-- 
Kind regards,

Sakari Ailus

