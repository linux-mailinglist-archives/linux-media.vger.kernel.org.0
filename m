Return-Path: <linux-media+bounces-4544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBB18453A8
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 10:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D6B528F68F
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 09:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDDF15B0FF;
	Thu,  1 Feb 2024 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="QLzeQBYW"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3D3159583;
	Thu,  1 Feb 2024 09:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706779148; cv=pass; b=HYRZM3vH55U/e3KUsyDzIeNn5DFyiAgWvdoNZoXm6/j7ZKhMGoFRSKottQxLtowDTGgom3BfC277ceNZTvJtwXSf8XqxlJTlQ5q2tinC9Nw+Lv2/Z/tGjnQYU6GLP/s70BYTF28fN+QEoH+Ehg0pwPyAZ2uwnfEMFgmOhwVBzqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706779148; c=relaxed/simple;
	bh=R2/KugRaeWca7L8ElD1e0FLg7bs8qEI5wiMRWQAzd80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPh1JsxgM55xeNPI1fExecM0lYQLuMqvK8j2VW0CUdP9kPfB+60MVTlP3jyGhVCg6ezv8l03OFw61VJZEKNgdNoJmx2c87HquBavPkU6y12EDjCgYmxNpV0IbXgI4Qw/0IvtJiA+tCHZtg5eipUV6L9k+wY92l5L+Z7v2/MJa2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=QLzeQBYW; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TQYHk0RBKz49Q4M;
	Thu,  1 Feb 2024 11:18:57 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1706779139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Fpy/KbSzjZ8m/Xpg84MM6yz5okV9u4UdrP7s0ILl8o=;
	b=QLzeQBYWyIizNCEdOO0UnX0HbEbBMsM6ktPq78KqRpoDIQ8DmizFrGfVVnqwyqtUM/JaQ+
	erh45k6PJI0YU0dVIUAuNMpYqhechz6r7RLjPhP0fCld4o9s92kwIfth9sixHAur8GV2ye
	G2lFy1SdeH9AtNZFleuMzdFQqETUVPDqw+urOJfKPNLmyuvp4bBGSIV+V4ig0+XrumyWw8
	07fO25P6bDSPhfUBeJnaRCgXxunatKkjhJf6ewRWNftJ32L9nbl7zxsY62LhrL6VcpImO1
	cu/F04Wn3EOnsDbdb61x+zQZO1Yl5mrbRGKmKp8rOJ1aKctoF/qjfKxyftAoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1706779139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Fpy/KbSzjZ8m/Xpg84MM6yz5okV9u4UdrP7s0ILl8o=;
	b=NknHwVeZQJph2n5Ymg8Coj2j1/Q2mhhDK6vMUerjuy1o4kzQBFLyw6FjOzTBjxdEHsyG5l
	mGxwX+TYvyaeBrDhVHKBQEpF3iFhU6h9WDDTUXmLIDiwLhwnGaWiQE7J54Gz4I+J6Xsfkd
	0XKjFaruAqV8fQa78frFvSmUxR09PvGIFkumiQy+u5QzJuymMuyEzzZzdhePLaudoRtmi+
	H00XLzwqiTuH2uJ2jx7uUy5JYxlmfWZ3UNNc34jvL6Y53pYP1Sfaw5ysl05YQTVbelZj7M
	qrK3owq9nvbhux0AG2BXRMCG37dovyKGhjdI1NAXn511Tfdk8kQ+Dsnc+eUzHQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1706779139; a=rsa-sha256;
	cv=none;
	b=NXxTkNsVQcVrRPfV3ZqrLN9BDgTVvbgp7hawQ7Q6lKlQaDSt++h0qI6VuOwvJvBLnyCz2N
	sGZ+lNoYYhWvTGiUU7Bf2GwvZ+WJedRCZNClnC5pZzjA4JKpjpBXsUOc/2qBSERXjSVbFF
	1kUXTsWurtS6VjuyIEFk594JHCAhlyMxRNZPNtFALs/nyBqKa1pE9ZXCtmqlhAvhs47v6x
	Zr9qQ8tQ0DEeUNNVFnBzVgvDYhgiqkt/0isTXz8cq9vVKlFUoLg/56p24AjjeXPzwMs5+X
	vOzDNbGz+dH9WCIlxrE9bSo2nb6QIlWzGvwiKZ/ftfGIOgSJJHSC0KxxDGfyTA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B5FC0634C93;
	Thu,  1 Feb 2024 11:18:56 +0200 (EET)
Date: Thu, 1 Feb 2024 09:18:56 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
Message-ID: <ZbtiAJklkLaXWY20@valkosipuli.retiisi.eu>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
 <20240129122736.GC8131@pendragon.ideasonboard.com>
 <ZbeoPBvGJlaJco_J@valkosipuli.retiisi.eu>
 <87zfwnirps.wl-kuninori.morimoto.gx@renesas.com>
 <Zbil22dm9x2ZudJC@valkosipuli.retiisi.eu>
 <582ede29-2df7-4f01-a03b-da59d9f56d74@ideasonboard.com>
 <Zbin6Pg6oNp0cTNO@valkosipuli.retiisi.eu>
 <87ttmu76co.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttmu76co.wl-kuninori.morimoto.gx@renesas.com>

Hi Morimoto-san,

On Tue, Jan 30, 2024 at 11:24:07PM +0000, Kuninori Morimoto wrote:
> 
> Hi Sakari
> 
> > > > > I'm not familiar with fwnode, but in my quick check, it seems it is easy
> > > > > to expand fwnode side functions if of_graph side function exist ?
> > > > 
> > > > That would be one way to do that, yes, but I suggested using the existing
> > > > endpoint iterators as that would keep the firmware specific implementation
> > > > more simple. The (slight) drawback is that for each node returned, you'd
> > > > need to check its parent (i.e. port node) is the same as the port you're
> > > > interested in. The alternative may involve reworking the struct
> > > > fwnode_operations interface somewhat, including swnode, DT and ACPI
> > > > implementations.
> > > > 
> > > 
> > > But we still need the of_* versions, don't we, for patches 4 to 13?
> > 
> > Yes, my comment was indeed about the fwnode property API only.
> 
> Thank you for your suggestion.
> But I'm not familiar with fwnode, and it seems we still need of_*,
> I will keep current style (= non fwnode) in v3

The fwnode API should be kept in sync with the OF (and other firmware
specific) API. Merging your set in its current form would leave fwnode API
impaired. Therefore I'd very much prefer to see this set add similar fwnode
APIs, too.

-- 
Regards,

Sakari Ailus

