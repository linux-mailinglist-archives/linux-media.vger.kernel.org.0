Return-Path: <linux-media+bounces-7002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6EB87A820
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 14:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25720B2100A
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 13:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B843FE55;
	Wed, 13 Mar 2024 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="ZGkiGGfl"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B294205A
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710335697; cv=pass; b=j6kRKBCNGo/Rgzj2aadcaEmcGXZCRt/h/EtgPpgBntGYY8YWYlA9Mr9kzNTtmo17gVu1fT4kN9WW+2cE7F+ZG5P1Wy3TCPn+7TzgY+jMibk+LPEhSvsUyEODCWKbiEu9sagm8WStFsjj5NRpwExRYltys34/yJJAVZFuWjcXMqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710335697; c=relaxed/simple;
	bh=Ajhzk2/Dsd5bxmRqmsMfiBb6SM8xp65QBNfsISxjjQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C277aL5fNlZ2twx41sB5/AurL9/f2WwePBJjN2Psjo400m0kN86Ui2Mpddm3eJrphRu/2DsZSi/wVunNwqeeevDuTYu7AlcywR2+tf1BNCH/AqMocWzrF8DPC6cHqx/xwQTX4q8zt6iVX8gSUtgOCENpJi33qNEA6U24QignJk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=ZGkiGGfl; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Tvrb13vSgz49QPJ;
	Wed, 13 Mar 2024 15:14:53 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1710335693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yvTd+qPLnyrG1Nlhapciks6ceKbuzbjCJpySb0CShyE=;
	b=ZGkiGGfl19sRhBkwZ4OjqJA0QbBSLACDfPxWRcf8P8GtXlRnOHOHDBZcyVnCQHJk0Ett5N
	OC4PtVNktJCHDQgM1zz7h3DPpgf6eyI7ODCOh1R8EKitYYYOwEyDT6xlhjH+KMX+ecocpe
	/LHKDkucET4uj5owK3aMI9tlGxX5FSfIaCay/ZNVjYAyL7CvRCW7MZ8pAblp8Bn30lDe1V
	gtLbG11YDij8S+K24eP4HSTqAIhAZx0s9kw4/GBpTWt7MXvriT0XyMNQjrJatZdZFDWjrp
	4FUE2OgMKX0WnWSUohEjNBJvR8D0Hq6X2xGySkqodRt7ML826zws8xAuDxc12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1710335693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yvTd+qPLnyrG1Nlhapciks6ceKbuzbjCJpySb0CShyE=;
	b=SJu1NlMPC/Xl+lKMKoUr/7JEnGl47lePuFwbaS8insWSKoWhoW1bHsl/ZpjQBtfa71CrLp
	bnmCMVEeEuR6y+KPd1IzhtMx/vBepgw9v+KlOpMrjQJOMFUd1Z3RnHmOHqKgxUUdBRVpwZ
	hP9W2ovKXMEyC6Kps9eU4skvW04LmNLgjcrs8rTfmIYbyw81Vw6Gt2sbTQM/Di2pMAZa6D
	cdpnzFUwW37MnR2RfPhNB6N8/dRbDMb7f95gN+DF5aO1Zz48gYKDW2KjXipM8AkEBpOIxV
	ZY3qEq6t5RIcYnoTe83e5vygqLDevUzn6uDZgB78e6Xyv9ru2AshUsltaYQteA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1710335693; a=rsa-sha256;
	cv=none;
	b=agSEdd/xbWApElC7Ds2maDgnPdKqm97kurClFbP1kGaR5st2zWUGvM4MWdQDFtery+asNg
	nv81kJP51ORQ8rOkY97qkviTUYSnyENIGGFjwDPjq4fWDr/A1Z8f0NwqWP5ZXYd2GWl0of
	sZv9hOSVkQRuAEra1zEorNHkB3yWtEJ1YKIDWY8NCBVsaZm0oOxRn8vx9x5w6xs+jNigMl
	9844OVN2NRVKw3GsqGKQzQYQy/Fn1YiZhGYj1lTGC3+cf2hxjF9fN0mT/ww+VoDo3afjdz
	y7NAZ3SBV7ogoLUr6sC8x+e8lTTqNG8YutAXUTnRLKhCmfsLHEmNWfgMavUJmA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AD216634C94;
	Wed, 13 Mar 2024 15:14:51 +0200 (EET)
Date: Wed, 13 Mar 2024 13:14:51 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 8/9] media: raspberrypi: Add support for PiSP BE
Message-ID: <ZfGmy1TQQo9ov4hx@valkosipuli.retiisi.eu>
References: <20240308085028.44388-1-jacopo.mondi@ideasonboard.com>
 <20240308085028.44388-9-jacopo.mondi@ideasonboard.com>
 <Ze7UsGgZ6W42fmgT@valkosipuli.retiisi.eu>
 <lsnv73m36ajckpgaurn7zbt2ybmdgiuyv3nbykzjo5n5vb63mh@yvwoh2bwgieg>
 <ZfGc1WkXkzQPERIZ@valkosipuli.retiisi.eu>
 <smqydagmfw3e7fspnzorgmh2qiwairuonazuwh7vdntimhxikg@gzttbrv7q4mq>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <smqydagmfw3e7fspnzorgmh2qiwairuonazuwh7vdntimhxikg@gzttbrv7q4mq>

Hi Jacopo,

On Wed, Mar 13, 2024 at 01:41:09PM +0100, Jacopo Mondi wrote:
> > > > > +struct pisp_be_global_config {
> > > > > +	__u32 bayer_enables;
> > > > > +	__u32 rgb_enables;
> > > > > +	__u8 bayer_order;
> > > > > +	__u8 pad[3];
> > > > > +} __attribute__((packed));
> > > >
> > > > I wonder what is the current recommendation on packing the structs on
> > > > different ABIs. On some archs (e.g. ARM) this involves more inefficient
> > > > access of data on these structs and it would seem like that there are no
> > > > direct struct layout related implications from packing apart from the main
> > > > struct embedding other structs.
> > > >
> > > > The V4L2 IOCTL arguments have used packing just to be sure there are no
> > > > holes but I wonder if it makes sense here. I've argued for this, too, but
> > > > drawbacks exist as well.
> > > >
> > > > Any thoughts?
> > > >
> > > > How about checking this with pahole?
> > >
> > > I've run this through Hans' scripts as reported in the cover letter
> > >
> > > pahole: ABI OK
> > >
> > > But as Naush replied, this gets applied directly to the HW registers
> > > layout, so packing is needed
> >
> > Not really for that reason, no, but this is up to you.
> >
> 
> For my education, why isn't the fact that this struct gets applied
> directly to HW a good reason to use packing ?

It's certainly a reason. But even without packing, the same can be often
achieved by relying on host CPU ABIs where Linux runs. This isn't an option
of course if you have e.g. misaligned fields but this is perhaps more
common in firmware ABIs.

As I noted, this is up to you.

-- 
Regards,

Sakari Ailus

