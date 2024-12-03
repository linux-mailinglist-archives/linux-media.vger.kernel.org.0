Return-Path: <linux-media+bounces-22524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5C59E19FD
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 11:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD667B3F169
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 10:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99ED91E0B84;
	Tue,  3 Dec 2024 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="n8ffWfRR"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F317813D890;
	Tue,  3 Dec 2024 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733220212; cv=pass; b=a3YNnf1B0b7ZaOZNxqn8b0hJZat6UDpnNa0oJoG4uNoHhE267dbdAdvRJjivcxhe3+sdN0n7Q43asL0omF4igzvJ7VfqJ9BUtEkN+T+hi2NUEv4GrKs8IcFjfdmFjG3QGZlYCEC+O/1Iqv/xO+MViAx94796RPTsyXp3ym1UCJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733220212; c=relaxed/simple;
	bh=7JpRyPUnNfuTEpfwoJb8MzSzIUfy+wB/PWtcu4sT2Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEiM2xs41l0T0oUTxKgrY3bdRmmqMlewaZcaHXHAc2pCcDVrg6l+jSbrGrKqxcA+YwlJ4dEK1It/ACPbvNrE3+Fgxoe7+TDNxQxrWIAEKNlqdvcMO3nVh8WT9c3ydkTXGRuxQ6ayN7dwZtufoqHbSYFBxH4Ol105x/E9fl9C6A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=n8ffWfRR; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Y2bnn2bNjz49Q5b;
	Tue,  3 Dec 2024 12:03:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1733220207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vDu/zLIwB79Ur5c+5zOhVcRD15ca/NXI1us4RVANQM=;
	b=n8ffWfRRnA9/XL0KQAesGa+LlZ4dyhd6Y6MasEwNMfnk2vMdDroHhyuBlhh6+W39JwIEKH
	wxFzJw23EJkr7xRJrr7fPW39YK8ecGM4W1aG8l2uVz+u1mj5HSV7zHFcw3PRHg9XFkkmRA
	n2nFpdgEigKh1UkdI6AtPv7PbZFqubxS0VFUNpSxNjESZiEhljYHqvi16L1xjnx9e3R0IX
	WsrUcsGfHHe0pFy/9D3yh9qyO4lILNLnwRt6g4g84mowXVnUn5+nvoN23j/l3U/L2tzJEW
	epfSwdmSVXe5DJFRcabn2xYSjf47Rdo0e1K/Plr9pFseiaoMZ1rz0bPv+u2W/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1733220207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vDu/zLIwB79Ur5c+5zOhVcRD15ca/NXI1us4RVANQM=;
	b=Ml0gbQunrlhrRZ/BGZDY+QR6PTQHirTqGnHoB+aPneXvg4umBVDoNApPDB9K3HN9pvpsOr
	FYqV4c/d1adXi/sD1NfF0uUE1mC6qFIU4sceVTCfpYGJY22C6ToTjbCENxL8re3dJTmL7B
	7s++rtzs6T9GiuiSe9g4KJUxsMQ8SuCqivKE8hi2MiEYZhr9FRk9Jn6k5R7k2ditwBBvb9
	PX3bVqnvUux1Ogr3ty3/88qyFNkROyobbBYqre4smocqCLXgIVpcy8mg+5SDIHHfNMWqJ+
	F46dafynqCsFtug2PseGy7/Np+4rlcci1GeIvGr1oDPoSjd8Wr84UO6Qld0aKw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1733220207; a=rsa-sha256;
	cv=none;
	b=qF8+9tm+8eAiLVSVyJ4cLUiDAmsSrX091OcAdhtPvyxMUWJm0bM4DSoGMs5bBNKmo3+A+2
	dX2VCiYEqvZFtK1Tb+yjXpXoc5AexLnw9X9RkhuLBjql/GXIOHFnOKCylEOyzL+QvSM/1H
	mxFTT3wVi6LeD6jjGaVewm1BGa5CCE2bFSGk9xNpJXZtG2FJx9OJTEcgDZ6kK+zMVtCMDb
	MEL4pLPVpF22WF8Z27njn1RjyEE2ulDdvHF/pjHgjSE6g9TJsYy4rQWZ1ODnnkHbfuRijY
	V73UJ9bCV8fSujXMPVwf4KLQ8jGJeXcoYgVLPIR94/en1YwQUi8a+1PQ7xW1WQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 686F7634C94;
	Tue,  3 Dec 2024 12:03:23 +0200 (EET)
Date: Tue, 3 Dec 2024 10:03:23 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 2/3] docs: media: document media multi-committers
 rules and process
Message-ID: <Z07Xawtb_JpH_upp@valkosipuli.retiisi.eu>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
 <49cdca2d2b3b5422c34506bfe2c91173e847ea1f.1733131405.git.mchehab+huawei@kernel.org>
 <Z03Alg5lNTTDiFcF@valkosipuli.retiisi.eu>
 <20241203092613.4e7b3a21@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203092613.4e7b3a21@foz.lan>

Hi Mauro,

On Tue, Dec 03, 2024 at 09:26:13AM +0100, Mauro Carvalho Chehab wrote:
> > > +is also based on a trust relationship between the rest of the committers,  
> > 
> > s/also//
> > s/between the rest of/among/
> > 
> > I wonder if we should add here some expectation on being reachable on
> > #linux-media.
> 
> I'll add it at the note about linuxtv.org:
> 
> 	These commit rights are granted with expectation of responsibility:
> 	committers are people who care about the Linux Kernel as a whole and
> 	about the Linux media subsystem and want to advance its development. It
> 	is also based on a trust relationship among other committers, maintainers
> 	and the Linux Media community[1].
> 
> 	...
> 
> 
> 	[1] The Linux Media Community, also called LinuxTV Community, has its primary
> 	    site at https://linuxtv.org.
> 	
> 	    Media committers and developers are reachable via the #linux-media
> 	    IRC channel at OFTC.

Looks good, thanks!

> 
> > > +maintainers and the Linux Media community[1].
> > > +
> > > +As such, a media committer is not just someone who is capable of creating
> > > +code, but someone who has demonstrated their ability to collaborate
> > > +with the team, get the most knowledgeable people to review code,
> > > +contribute high-quality code, and follow through to fix issues (in code
> > > +or tests).
> > > +
> > > +.. Note::
> > > +
> > > +   1. If a patch introduces a regression, then it is the media committer's
> > > +      responsibility to correct that as soon as possible. Typically the
> > > +      patch is either reverted, or an additional patch is committed that
> > > +      fixes the regression;  
> > 
> > s/that fixes/to fix/
> 
> Ok.
> 
> > 
> > > +   2. if patches are fixing bugs against already released Kernels, including
> > > +      the reverts above mentioned, the media committer shall add the needed
> > > +      tags. Please see :ref:`Media development workflow` for more details.  
> > 
> > Does this reference work?
> 
> Yes. Tested on Sphinx 6.2.0.
> 
> > > +[1] The Linux Media community, also called LinuxTV community, has its primary
> > > +    site at https://linuxtv.org.
> > > +
> > > +Becoming a media committer
> > > +--------------------------
> > > +
> > > +The most important aspect of volunteering to be a committer is that you have
> > > +demonstrated the ability to give good code reviews. So we are looking for  
> > 
> > I wonder if we should add some kind of an expectation of demonstrating
> > common sense? :-)
> 
> Could you propose some text for that?

How about:

The most important aspects of volunteering to be a committer are that you
have demonstrated the ability to give good code reviews, interacting with
others in the community as well as common sense. These are what we're
looking for when we're judging whether you'd be a good Media committer.

> 
> > > +whether or not we think you will be good at doing that.
> > > +
> > > +As such, potential committers must earn enough credibility and trust from the
> > > +LinuxTV community. To do that, developers shall be familiar with the open
> > > +source model and have been active in the Linux Kernel community for some time,
> > > +and, in particular, in the media subsystem.
> > > +
> > > +So, in addition to actually making the code changes, you are basically
> > > +demonstrating your:
> > > +
> > > +- commitment to the project;
> > > +- ability to collaborate with the team and communicate well;
> > > +- understand of how upstream and the LinuxTV community work
> > > +  (policies, processes for testing, code review, ...)
> > > +- reasonable knowledge about:
> > > +
> > > +  - the Kernel development process:
> > > +    Documentation/process/index.rst  
> > 
> > :ref:`the Kernel development process <process_index>`
> 
> No need. a Sphinx converts all *.rst into references automatically.
> 
> Better to use RST files at the text, as makes easier for people
> reading the text file directly.

Ack.

> 
> > > +
> > > +  - the Media development profile:
> > > +    Documentation/driver-api/media/maintainer-entry-profile.rst  
> > 
> > Could you add a label to the title and refer to it directly?
> 
> Same as above.
> 
> > > +
> > > +- understanding of the projects' code base and coding style;
> > > +- ability to provide feedback to the patch authors;
> > > +- ability to judge when a patch might be ready for review and to submit;
> > > +- ability to write good code (last but certainly not least).
> > > +
> > > +Developers that intend to become committers are encouraged to participate  
> > 
> > s/intend/yearn/
> 
> Heh, I had to go to the dictionary to seek for "yearn" meaning ;-)
> 
> Let's use a simpler language, as most developers are not native-English
> speakers. I did:
> 
> 	s/intend/desire/
> 
> which is a synonym.

Works for me.

-- 
Kind regards,

Sakari Ailus

