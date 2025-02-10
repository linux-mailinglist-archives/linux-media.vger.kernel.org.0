Return-Path: <linux-media+bounces-25918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A5A2EEA1
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 14:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAB3C3A2F8E
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 13:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23911223706;
	Mon, 10 Feb 2025 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="uUPjiNgP"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D91113213E
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195203; cv=pass; b=O8RwCby3KJmjBHDaTQuJ9wFDjzJomKRkpdEpcs55KO87gI9uyuRCF7dewk7+Kde/CiJvBqpasxd8/7rUS5d9xkkXpo90zwp0WiVw3UJ9ow0h0nimrDyMXFDUf4JySP5bOwl8DPTDRpbf3LuTnwcT1naEHM9wfGX1i43sQrrc+tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195203; c=relaxed/simple;
	bh=zmCXtKTYdrcR2D8s92IPVBdgf2IspPYLJzAhGwRHg1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3ZJeoh1SKsBtNKjrC8RrlOumfzt5/SqYiicfUvOVF618d87uJmAM5yA+OGeQxKeDnmE+J5Gx/FLaFreyukVKbWSyd0OLlbnSfPkrkcWOX8Gl87wdnc9KZz9RdVTWSWFdbrEAb03J8D3y/1WB+jKnjSNH/YxH3N/CoFJP56PTrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=uUPjiNgP; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Ys5TM0tbPz49Q47;
	Mon, 10 Feb 2025 15:46:31 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1739195193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qvGWOenLr2Xh3ayG9r0F45r/Tfu2mbP/nxtlf1wGygA=;
	b=uUPjiNgPrKooH7vOgwF1mVKkfPXS14RfMQqSPIFFKoufHS+KrVCFLYR4KiNif8cheB4LAx
	rl9RI6IK1jnE0Zk9QL8W+BqmLp1M5ud/diHMmlGkkTdQeEhqZfipyD+RMZkiQdXi2idN/E
	kaK0SHGZp+6lvuvhRCT9mA3iTEksAAwY0bjvHCBXJ99IGE/BXp83p4SZafbqWLl/ytz74l
	615IPytkktHbT8NJbfru9hF/sn6FIXXSktiDn0UD7JEZf9VVXnEpHLRCxzcdhPJXQRXVcf
	jlj1IFgFrhTD2Svtn+sirKUZi8ZqD7YlwwIxhu2Bj02mSYQYHkbSXdVcQldO5A==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1739195193; a=rsa-sha256;
	cv=none;
	b=VlSlcwhDo7AXNT6XW+if/JH7Di2NGY87nF2uQ56Oiw+CiXZuJIJcIE1aNLfTQyuHecWsyL
	7dcJe65LwhPyJHhV8m1at1JUNwBngR+t6DsFCBDS0wzCY1HuhfmBGa4r/kBbZK0qWc98CX
	46icQfFqn53BP5FWFcvGqXLhhiiJ7PCRMntfEjt9b5c6hRc20JcWJ/NkIJgG/YY0WV2k5v
	321mBBD+QEs5s0dP2PIcnjFLOQbUPnaYct+163QXrnk3CtIpbQhxnVbf/nJJhfmJBCSDk4
	OWI6to4Xv4arUWa4gmJ+mYJv5nVgwI6+DzWNwZdjfohGBGT9pqM/MQEOWEQycw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1739195193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qvGWOenLr2Xh3ayG9r0F45r/Tfu2mbP/nxtlf1wGygA=;
	b=jpd1vIaEUP/ReOF23RYvHyBnxYlfBdWN1LeVfLFvka3nuf1bAPrlG7nW9WwvWy5SSbyMCf
	HZEDd7GjOqsqv/c0tg3mPJcLAbdiQ8ZOm/9IiLthI69A4LKhs/xIFM8AUKGiU87LBnyxUp
	oK1Bm/Q6qul5qKFhliUNLBhz4pCb3SnGfcyUgzwYGvfUic7G5mdvrB+vxlNRphmLoODGOf
	Dd+yK/sr9t+HnxeMq43MHYlw0pCFqwR3gkaFS9QldWSPJU5GbHchVhju6g5aaaCBeifetg
	6bNZkccyECIs95LVehpjXEKDPAHPrOeSBtphhcThkoy85Qgi23QU+jpHxWMRbg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 910DD634C96;
	Mon, 10 Feb 2025 15:46:30 +0200 (EET)
Date: Mon, 10 Feb 2025 13:46:30 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v5 00/15] Sub-device configuration models
Message-ID: <Z6oDNrZSXdWSjAY_@valkosipuli.retiisi.eu>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>

On Mon, Feb 03, 2025 at 10:58:38AM +0200, Sakari Ailus wrote:
> Hello everyone,
> 
> I've been recently working (with others) on sub-device streams support as
> well as on internal pads. The two can be used to make sub-device
> configuration more versatile.

The patches are all available here (including streams + internal pad
support)
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata-raw>.

-- 
Sakari Ailus

