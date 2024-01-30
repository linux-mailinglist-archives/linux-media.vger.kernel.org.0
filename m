Return-Path: <linux-media+bounces-4388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C57841CCD
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 08:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19DAFB234C9
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 07:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72B75477C;
	Tue, 30 Jan 2024 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="mmg4Uety"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3752F93;
	Tue, 30 Jan 2024 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706600436; cv=pass; b=k55dZQPR9qL0dqWB13hdi94zSEiInUEALjNmCUR+Ni9fqkTL46Pp6AYxyskxwGyLkqk41exfbB38eNVYYZgpMwsAC2NrYSyOjvTj6r9ogP2STELrcmQA2zpB28QEFv+1nRQnftubMOOzw9xl/JKX29zVdVUe56D4UtVvLRsa7GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706600436; c=relaxed/simple;
	bh=gQFi/hgfA9MVHBETu5aazZyA13OZc9rH5VvRgCcJmsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OoFfLGVKic/q29LogRV2ISwUnQlC01cX1g+U4yFgqcYFXE0KngjfcMds7b/xpYLHs5kxYUPA6SuC3t50vE3KKzwhgrXdV694QtCVre5A0VcJgU2tiAWSQJ+oHqM448ILYmWCAikxAUqjbUIzzjJLAyjxS22qIXC6v+97yV7NViw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=mmg4Uety; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TPHBy1PY0zyPp;
	Tue, 30 Jan 2024 09:40:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1706600429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XXYG2rIBeg/NNZorp9z2BhKReEh61TvwReLHXvCjaww=;
	b=mmg4UetyKwlC7TSRMl0nDOWPi+zjDxXpOp3M6L3+Qb/TsTqYbPp/4uUv261XYGZBcYHB6U
	T7T3x9ynxedfSLrcBFH+i/H93sAwKym2r1tj/D1GB2T/SkFWrq1/Kt+oc8YHFDjfatHaM9
	GduB0g58fL7yX+1xcHMtDKkvA1Pp1X0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1706600429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XXYG2rIBeg/NNZorp9z2BhKReEh61TvwReLHXvCjaww=;
	b=UJJzQlqCs9VrKm5FbkOAbRgkCMTr9auA3UukM+Cirg/lszktkvqF9Eq5X0OOPQzqyY1zgH
	1sd2TE0evQiwof0Rp/NhS9QPgZ738HW3BhaVRDZmAvDKyv1e/CfDJchauGIeZMEks+FKYO
	Gs5KxF3RtGS38UkWzoFa/p1ytG0AjEw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1706600429; a=rsa-sha256; cv=none;
	b=b8I/5XUpD8zAG3kEkB9ylC36TMUKxkOVnd3GUPE359jInhtZl89CjKZLsuC/UJuUeEnO3o
	h5OdGhfPjjgmquLay5oDg7lo+L5ojRZUBSC8QI62oKmUlDJpF6udc9tAur01+JX+nmf0Ct
	HTROci/T7MAOf+H9Af+iDXNYkNT9M9s=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3FC86634C93;
	Tue, 30 Jan 2024 09:40:24 +0200 (EET)
Date: Tue, 30 Jan 2024 07:40:24 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 00/13] of: property: add port base loop
Message-ID: <Zbin6Pg6oNp0cTNO@valkosipuli.retiisi.eu>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <20240129122736.GC8131@pendragon.ideasonboard.com>
 <ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
 <87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
 <Zbil22dm9x2ZudJC@valkosipuli.retiisi.eu>
 <582ede29-2df7-4f01-a03b-da59d9f56d74@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <582ede29-2df7-4f01-a03b-da59d9f56d74@ideasonboard.com>

On Tue, Jan 30, 2024 at 09:37:42AM +0200, Tomi Valkeinen wrote:
> On 30/01/2024 09:31, Sakari Ailus wrote:
> > Hi Morimoto-san,
> > 
> > On Tue, Jan 30, 2024 at 12:34:55AM +0000, Kuninori Morimoto wrote:
> > > 
> > > Hi Laurent, Sakari
> > > 
> > > Thank you for your review
> > > 
> > > > > The strategy sounds good to me. However, I'm wondering if you shouldn't
> > > > > take one more step in the core, and implement these as fwnode
> > > > > operations. Or is there a reason why OF is special, and iterating over
> > > > > ports would be useful for drivers on OF systems but not on other types
> > > > > of systems ?
> > > > 
> > > > I'd prefer that, too.
> > > 
> > > It is very easy reason, because I'm not fwnode user ;P
> > > I'm not familiar with fwnode, but in my quick check, it seems it is easy
> > > to expand fwnode side functions if of_graph side function exist ?
> > 
> > That would be one way to do that, yes, but I suggested using the existing
> > endpoint iterators as that would keep the firmware specific implementation
> > more simple. The (slight) drawback is that for each node returned, you'd
> > need to check its parent (i.e. port node) is the same as the port you're
> > interested in. The alternative may involve reworking the struct
> > fwnode_operations interface somewhat, including swnode, DT and ACPI
> > implementations.
> > 
> 
> But we still need the of_* versions, don't we, for patches 4 to 13?

Yes, my comment was indeed about the fwnode property API only.

-- 
Sakari Ailus

