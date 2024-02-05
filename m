Return-Path: <linux-media+bounces-4685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CFA84966C
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 10:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A8C62811EC
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 09:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E1712B85;
	Mon,  5 Feb 2024 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="foU6YdKK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDDE125B7;
	Mon,  5 Feb 2024 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125207; cv=none; b=Y5ijBQmsL1Pps1NbBsW3Czt1lPidAp/reOjEYWiLSuKm7VsDqLlWF84oGdSXvN2iS0KItth9YWXWuA94VmT9RfLaj1s0FH+vaT9TBls3KYsopm9gqauIedhxHUePIDOi8NgB6m1GFwU5P+KY1VC2beuf4FWSUTncv0JOZ7XjTuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125207; c=relaxed/simple;
	bh=rHMp+3HUl38fXd92yWtNbr68AI7/ldR3UAk7XKf8c/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSsN+8shkbb90uiwqQksoNQKcHnB9bEPCGP3iWH8CjFz4BG2Ip2d9AK+XYykYAxw5cpmXxY0W2rYKLXO46Y/fAtmWl8uU2h/kQpz4YNWbS2g1A4P3n0+6Fp+YWZ2BNU2bcq6al4SLsNwE0bPhaLphSwK9AKL5OnnioeEU4HAWnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=foU6YdKK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (99.141-128-109.adsl-dyn.isp.belgacom.be [109.128.141.99])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC5A4268;
	Mon,  5 Feb 2024 10:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707125120;
	bh=rHMp+3HUl38fXd92yWtNbr68AI7/ldR3UAk7XKf8c/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foU6YdKKlM9CYYob1znc8ZbHPp9AotBroDPzPQoXy+b/czrpSr2+sCa6G+Ae/kfVB
	 25qzq1p6Da4NtDQRhfuNtUSKEzqrSE5R9H5IWOWjoTkOmLgq8fFGITxV+PjOybBUQL
	 lYZr6XhiRpmFvuU+yPl8n7b2fWnhBNp6lHkspcAE=
Date: Mon, 5 Feb 2024 11:26:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Uwe =?utf-8?B?S2xlaW5lLUvDg8K2bmln?= <u.kleine-koenig@pengutronix.de>,
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
Message-ID: <20240205092644.GK6804@pendragon.ideasonboard.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <20240129122736.GC8131@pendragon.ideasonboard.com>
 <ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
 <87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
 <Zbil22dm9x2ZudJC@valkosipuli.retiisi.eu>
 <582ede29-2df7-4f01-a03b-da59d9f56d74@ideasonboard.com>
 <Zbin6Pg6oNp0cTNO@valkosipuli.retiisi.eu>
 <87ttmu76co.wl-kuninori.morimoto.gx@renesas.com>
 <ZbtiAJklkLaXWY20@valkosipuli.retiisi.eu>
 <87ttmncw9f.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ttmncw9f.wl-kuninori.morimoto.gx@renesas.com>

Hello Morimoto-san,

On Mon, Feb 05, 2024 at 05:31:25AM +0000, Kuninori Morimoto wrote:
> 
> Hi Sakari
> 
> > > Thank you for your suggestion.
> > > But I'm not familiar with fwnode, and it seems we still need of_*,
> > > I will keep current style (= non fwnode) in v3
> > 
> > The fwnode API should be kept in sync with the OF (and other firmware
> > specific) API. Merging your set in its current form would leave fwnode API
> > impaired. Therefore I'd very much prefer to see this set add similar fwnode
> > APIs, too.
> 
> I will keep current fwnode API behavior, but I can't test it.

The fwnode API is an abstraction layer on top of the OF or ACPI APIs,
and allows drivers to work on both without needing to support OF and
ACPI explicitly and separately. You should be able to convert the
drivers you're using to the fwnode API, and it should work exactly the
same as when using the OF-specific functions. That will give you a way
to test the API.

For instance, if you look at the drivers/media/platform/rcar_drif.c
driver, you will see

        if (!fwnode_property_read_u32(fwnode, "sync-active", &val))

which, on OF platforms, is equivalent to

        if (!of_property_read_u32(np, "sync-active", &val))

This particular driver will never be used on an ACPI-based system, but
drivers are still encouraged to use the fwnode API. 

> Now, I'm separating the patch-set into small stages.
> There is no problem for a while, but I think I will ask you to test it in the
> final stage.

-- 
Regards,

Laurent Pinchart

