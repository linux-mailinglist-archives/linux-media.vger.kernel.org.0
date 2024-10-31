Return-Path: <linux-media+bounces-20643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 218DC9B7BCE
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 14:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52B871C21356
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 13:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FB519D89D;
	Thu, 31 Oct 2024 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LC4pGhGp"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12621991BE
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730381840; cv=none; b=dWYJ3z5qkBB9UmI8qLyvwxn2Qw+IJS7fmYEL03bNN2Artxb4XnPtUIZvL94i2Uihh5EviP8760mH5dMqC0xYf6qrLbHZahqMQvyQIsNls4Fs5LaTGUM2lXG1mlXoXtKce+ojU093ii5VpIkZ37QlxVU/pJ5KLZZMAZ5rrdUcyP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730381840; c=relaxed/simple;
	bh=Qip768iZ+fEQoRn3rnvkHqZYXdGEwFL/u9tJujWCifA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FnItbojoPl999yF3D5SIElFDwQD+Vxsy0Z+CLf3Uc4eCfKWGyfunRH44R7+gsaOz+wz7BxSm+WBynM+96S5wo0KaViOR0AdkScUiBw0IZpmrq5M6Tc1He3GnFrroQ+hi/fwtvMUPasjdQe6wgh0e5m1uNHJnlS9P4SHm6TUNhJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LC4pGhGp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730381829;
	bh=Qip768iZ+fEQoRn3rnvkHqZYXdGEwFL/u9tJujWCifA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LC4pGhGphkOMAt9G8eFQ8BCr4tkCCMwRnx3+UOnuku9O8nbNaqOB93xP7iT/n8lhA
	 whxqt3DbWCixN9xuCc3m1RXxb/71ITxEghZhtAJTfUoP1OrnxtNa/frnd7C3qpqULJ
	 7SyWSvUGK2gKB1vuEor+4t3XhwiYLUNT1AJJQhnxELFvY5pwYI0TZZUDmt1tTLw3u4
	 5erb781g1nl3LVAxZiTaoz7GtIhWqL42EqaQFPpN7plSHxASMPbezZ+4NMaB+CSS+L
	 uO1VhXCVyqfEtKA0M79cAKbPdeor7Xs+QYmdrPdXe6gsYIMlgka6Pf80gow1nyScOe
	 f7buhbfcZbZ7A==
Received: from nicolas-tpx395.lan (unknown [IPv6:2606:6d00:15:862e::580])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 355C317E3613;
	Thu, 31 Oct 2024 14:37:09 +0100 (CET)
Message-ID: <9795641ebd2cd709ea9d12ab4465422e997e580d.camel@collabora.com>
Subject: Re: [PATCH] Documentation: media: improve
 V4L2_CID_MIN_BUFFERS_FOR_*, doc
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Date: Thu, 31 Oct 2024 09:37:07 -0400
In-Reply-To: <2a61ded3-4cea-4a1a-9d16-aa74dbb22f74@xs4all.nl>
References: <93d078e5-deba-4060-a32e-94bce677453c@xs4all.nl>
	 <20241031101141.GD2473@pendragon.ideasonboard.com>
	 <2a61ded3-4cea-4a1a-9d16-aa74dbb22f74@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le jeudi 31 octobre 2024 à 11:26 +0100, Hans Verkuil a écrit :
> On 10/31/24 11:11, Laurent Pinchart wrote:
> > Hi Hans,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Oct 31, 2024 at 08:50:04AM +0100, Hans Verkuil wrote:
> > > Clearly state that the V4L2_CID_MIN_BUFFERS_FOR_OUTPUT and
> > > V4L2_CID_MIN_BUFFERS_FOR_CAPTURE controls are required for
> > > stateful codecs.
> > 
> > Wouldn't it be better for this kind of information to be centralized in
> > a stateful decoder document ? That would make it easier for developers
> > to see all they need to implement. Otherwise they would need to read
> > through the whole documentation to pick the parts of the API they need
> > to support in their drivers.
> 
> It's also already mentioned in the documentation for the stateful de/encoders here:
> 
> https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-mem2mem.html
> 
> Also, once this vicodec patch is merged:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/1dd09050-40ca-4c5b-b985-819731140388@xs4all.nl/
> 
> I plan to push v4l2-compliance patches that explicitly test for the presence of
> these controls and fail if they are missing (like they are now in vicodec).

Thanks, this is a great idea.

Nicolas

> 
> Regards,
> 
> 	Hans
> 
> > 
> > > Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> > > ---
> > >  Documentation/userspace-api/media/v4l/control.rst | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> > > index 57893814a1e5..9253cc946f02 100644
> > > --- a/Documentation/userspace-api/media/v4l/control.rst
> > > +++ b/Documentation/userspace-api/media/v4l/control.rst
> > > @@ -290,13 +290,15 @@ Control IDs
> > >      This is a read-only control that can be read by the application and
> > >      used as a hint to determine the number of CAPTURE buffers to pass to
> > >      REQBUFS. The value is the minimum number of CAPTURE buffers that is
> > > -    necessary for hardware to work.
> > > +    necessary for hardware to work. This control is required for stateful
> > > +    decoders.
> > > 
> > >  ``V4L2_CID_MIN_BUFFERS_FOR_OUTPUT`` ``(integer)``
> > >      This is a read-only control that can be read by the application and
> > >      used as a hint to determine the number of OUTPUT buffers to pass to
> > >      REQBUFS. The value is the minimum number of OUTPUT buffers that is
> > > -    necessary for hardware to work.
> > > +    necessary for hardware to work. This control is required for stateful
> > > +    encoders.
> > > 
> > >  .. _v4l2-alpha-component:
> > > 
> > 
> 


