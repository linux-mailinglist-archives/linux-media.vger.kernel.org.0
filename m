Return-Path: <linux-media+bounces-32126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA99AB1112
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 12:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 755351C26510
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 10:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C80A28F51D;
	Fri,  9 May 2025 10:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ewpWrKFe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF837E1
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746787630; cv=none; b=kk7kFHfHtRhLOGcnf+KtJ99IYOOF3KMbKS51zIsfSPF88S4PiiH601sPnRPXNL7aXLZ6Lr/Lkm48nXXvDDLWdSHjzozTPi9RVyVkcNZrUJmKiN++CWDUgJShkyDs6W8qSA4aG5+RCBCpcjSqvde0I/zKh6C/hKDGJrHTqm2OjKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746787630; c=relaxed/simple;
	bh=nuGCpOjNi7n2tSJmeQz4R/WVwpq9Q9KYP3cvk03RGhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEvwFWPb/IOnlHm0fstKa6Y6xGR3yKvzpTsKwgzOfVEZC5zNtER7gg04vErndSkW01acLep3tXvwKkEQq2euhPhQxqorDakcyFjmHI611R3l89T63raQ8htGkNEGpbSDXVqPUdPGhUjBxam6cmcmUYvZnqWa0du2ua6pAfWB+38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ewpWrKFe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (noh63-h01-176-133-119-130.dsl.sta.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 887C98DB;
	Fri,  9 May 2025 12:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746787612;
	bh=nuGCpOjNi7n2tSJmeQz4R/WVwpq9Q9KYP3cvk03RGhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewpWrKFehtyWA+/mIJ17PY3P8edCGx+oE0Yq6oImipr1WcFyxsLSeWg2/V2GXyrEi
	 Mz70mPBcWXZSs9YsHpWiG7ip7vPVPnvOIVaMCjNcNLoxq4k2f/b7Ux04hnQ47TxfwY
	 bcXypVCcZSMnQqIWky5KTh2/3RKEVtcLV/oUcj5k=
Date: Fri, 9 May 2025 12:46:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maxime Ripard <mripard@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v4)
Message-ID: <20250509104656.GF28896@pendragon.ideasonboard.com>
References: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>
 <aBjYnrvg-_T-7xRi@kekkonen.localdomain>
 <20250509094005.GA30047@pendragon.ideasonboard.com>
 <7c4d419a-613c-420e-8885-01ebb006f345@redhat.com>
 <aB3bpdDrn0TKdleD@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aB3bpdDrn0TKdleD@kekkonen.localdomain>

On Fri, May 09, 2025 at 10:40:37AM +0000, Sakari Ailus wrote:
> On Fri, May 09, 2025 at 12:13:57PM +0200, Hans de Goede wrote:
> > On 9-May-25 11:40 AM, Laurent Pinchart wrote:
> > > On Mon, May 05, 2025 at 03:26:22PM +0000, Sakari Ailus wrote:
> > >> Hans, Laurent, others,
> > >>
> > >> On Fri, May 02, 2025 at 10:15:27AM +0200, Hans Verkuil wrote:
> > >>> 16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers
> > >>>
> > >>> Please reply with corrections, questions, etc. to the agenda.
> > >>
> > >> As it seems we might have a little bit of time left, I'd like to propose a
> > >> keysigning party we haven't done for a few years now. We have some new
> > >> people here and the folks who have been around for longer have new keys,
> > >> too.
> > >>
> > >> This is what we did the previous time
> > >> <URL:https://lore.kernel.org/linux-media/YxhplLKtRAQzlSK/@pendragon.ideasonboard.com/>.
> > >>
> > >> I wonder if Laurent would like to do the same this time around. I can also
> > >> help with the arrangements.
> > > 
> > > I don't mind signing keys, but I won't have time to organize it. Feel
> > > free to take the lead :-)
> > 
> > Embeddedrecipes will also have a key-signing event, see:
> > 
> > https://embedded-recipes.org/2025/attend/
> > 
> > So it might be best if people who want to have their keys signed
> > just join that ?
> 
> It's very nice they do. I presume many attendees will also attend ER
> keysigning party but I'm not sure how many. As we're moving to the new
> multi-committer model, having potential committers' keys signed by the
> maintainers is even more important now than it used to be.

Unless I'm missing something, the multi-committer model won't make use
of GPG to push and merge.

-- 
Regards,

Laurent Pinchart

