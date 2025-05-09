Return-Path: <linux-media+bounces-32133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF07AB14E8
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B95E7A59A1
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 13:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280E528F518;
	Fri,  9 May 2025 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+/4tC1s"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8750D1E531
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796858; cv=none; b=UrQ7lUJv53jNtinhpqwWZjQ1dS7gVlJGfZ0aCdd6sTxft836LciHYRtAW89BIEcCYT21biGHnlG1VGd9Omlr5e4EgKGPssoDmUmevcJXZhnLX+37XbqlkXF0LNbW1h5Vx5BIBarhPGzAvftL3Vf2PrxsOGlgfC8Y/z0siKJPU5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796858; c=relaxed/simple;
	bh=Ky0YrS3wWw7G3mU/F7ROWo9gj3EiiRSCV05AWcTxpvo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PvjSEcJJviWI9/HNjq0REeQEvs1d2XRNAMcA0U0WxHZRo153OECkwxn0kn4QaNChB433ulULSQzdq+OIQf33ZpXjBOvOvajYpjOcPyNLFOhWhjYvO8T3JpFXHRWhRsBymClgAOJGbvQLsmxEYZw7PRpSA1cjp1MUP/SQ6eWYm/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+/4tC1s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818EEC4CEE4;
	Fri,  9 May 2025 13:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746796857;
	bh=Ky0YrS3wWw7G3mU/F7ROWo9gj3EiiRSCV05AWcTxpvo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L+/4tC1sJz72S6yTsZMERsi1EIEpknDxn3Fut7sJZLq25JZo8K3nhobGQcWFT9LtU
	 a4On3N8M8cOKcJswtFKpkui5W7aVtU9YaIQj7GB7OK1Q+U7lJhWX5JQdHQ9bz4+ard
	 2ymq8mhBXArg+4XqzZEhzTTHjjPdQ1Ct5sh0wCoqQYN55K8d8BEfwbf9EqdSjtLbD6
	 2Limz40FT0OPXfewaudNXvPuB8ofHApmFnOSQzsRKy294hjA96fRX0LOvcg/+hDsOF
	 Tg42nsWsbFA1TuV1NUF0eLqhCtWmKt7AXI//gCTGiFTXMmjiOrolC4e+sAm3+Z3OIq
	 YOUS8jtzywP4A==
Date: Fri, 9 May 2025 15:20:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede
 <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>, Linux Media
 Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sean Young <sean@mess.org>, Ricardo Ribalda
 <ribalda@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Niklas =?UTF-8?B?U8O2ZGVy?=
 =?UTF-8?B?bHVuZA==?= <niklas.soderlund@ragnatech.se>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>,
 Tomasz Figa <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Steve Cho <stevecho@chromium.org>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Kevin Hilman <khilman@baylibre.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Hans Verkuil <hverkuil@xs4all.nl>, Arthur
 Vinchon <arthur.vinchon@allegrodvt.com>, Marco Felsch
 <m.felsch@pengutronix.de>, Jackson Lee <jackson.lee@chipsnmedia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Jai Luthra
 <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, Maxime
 Ripard <mripard@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v4)
Message-ID: <20250509152022.55696cf4@sal.lan>
In-Reply-To: <20250509104656.GF28896@pendragon.ideasonboard.com>
References: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>
	<aBjYnrvg-_T-7xRi@kekkonen.localdomain>
	<20250509094005.GA30047@pendragon.ideasonboard.com>
	<7c4d419a-613c-420e-8885-01ebb006f345@redhat.com>
	<aB3bpdDrn0TKdleD@kekkonen.localdomain>
	<20250509104656.GF28896@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 9 May 2025 12:46:56 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> On Fri, May 09, 2025 at 10:40:37AM +0000, Sakari Ailus wrote:
> > On Fri, May 09, 2025 at 12:13:57PM +0200, Hans de Goede wrote:  
> > > On 9-May-25 11:40 AM, Laurent Pinchart wrote:  
> > > > On Mon, May 05, 2025 at 03:26:22PM +0000, Sakari Ailus wrote:  
> > > >> Hans, Laurent, others,
> > > >>
> > > >> On Fri, May 02, 2025 at 10:15:27AM +0200, Hans Verkuil wrote:  
> > > >>> 16:35-17:30: Hans Verkuil: Status of Media CI/Multi-committers
> > > >>>
> > > >>> Please reply with corrections, questions, etc. to the agenda.  
> > > >>
> > > >> As it seems we might have a little bit of time left, I'd like to propose a
> > > >> keysigning party we haven't done for a few years now. We have some new
> > > >> people here and the folks who have been around for longer have new keys,
> > > >> too.
> > > >>
> > > >> This is what we did the previous time
> > > >> <URL:https://lore.kernel.org/linux-media/YxhplLKtRAQzlSK/@pendragon.ideasonboard.com/>.
> > > >>
> > > >> I wonder if Laurent would like to do the same this time around. I can also
> > > >> help with the arrangements.  
> > > > 
> > > > I don't mind signing keys, but I won't have time to organize it. Feel
> > > > free to take the lead :-)  
> > > 
> > > Embeddedrecipes will also have a key-signing event, see:
> > > 
> > > https://embedded-recipes.org/2025/attend/
> > > 
> > > So it might be best if people who want to have their keys signed
> > > just join that ?  
> > 
> > It's very nice they do. I presume many attendees will also attend ER
> > keysigning party but I'm not sure how many. As we're moving to the new
> > multi-committer model, having potential committers' keys signed by the
> > maintainers is even more important now than it used to be.  
> 
> Unless I'm missing something, the multi-committer model won't make use
> of GPG to push and merge.

We will still require a GPG signature. The difference is that, instead
of requiring it per commit, it will be required when someone is willing
to become a committer, at his letter of intent. The public key used for
such task is meant to be stored at the kernel.org keychain.

Regards,
Mauro

