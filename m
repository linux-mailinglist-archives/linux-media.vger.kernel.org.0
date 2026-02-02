Return-Path: <linux-media+bounces-51972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Lz4CBNsgGkd8AIAu9opvQ
	(envelope-from <linux-media+bounces-51972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 10:19:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FDECA095
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 10:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D2933015488
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 09:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DC22D1936;
	Mon,  2 Feb 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDb9590Y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC5288C2C;
	Mon,  2 Feb 2026 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023947; cv=none; b=XreTixXp4FbCSSvHDmHjBigN1Uq2THNJnOOrMnJQ4D3vzo/mysW6CnFK/nTHYzeAGf4bgHxbpJgiSkFXfZOE4Ouwv/j74V/IxhFbT/7kk9h+U0hTM7udCGoTy4v44WWapFHHpeIwV04MHb1OH2yB9oJ41ZriHfl1iTt0rdQAeQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023947; c=relaxed/simple;
	bh=V0WbQpFix6zCTYwDV07C7w3HOSiWB/FGNOUmcH8b5FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIxNuMFdsAELAPYYxYJKut1ikJSk7M5F0FJBxKnh/Ac04hkHV/2XoGT9XS4XVdgfghEY3jplRyP5y6IGhlpgTN33WTSbAKu5pPHHxlfvi2Kl2Jf7K2xf/JcNZgGQVdEagKQPGUSUJdSdpC3rSEhNsOm4nNrFCuClTNF4VG7c72M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDb9590Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909B9C116C6;
	Mon,  2 Feb 2026 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770023946;
	bh=V0WbQpFix6zCTYwDV07C7w3HOSiWB/FGNOUmcH8b5FI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDb9590YPYc6rZMQSomSYvADo2E4v6xx2zi2Le0KTYChFRTkUo7L9SnLCiUWhIWGm
	 vnw7591TEEk0YW0QYxsBuoYHhhUbZI2j52dWdSSrqAskVM8MWPcLcylc20OxYQBbw2
	 TUU8qFLwujHhROquEnkE4X1BIKOI3hs22sKxXK4Ipb1fORWbjlqUcf1qpi6dSkf94v
	 Z+i7UbnG9JBYY89Sj5yGKFyoP2ARGMPZ9m7NyFxeFFx7wi4uubw9O5tSBAwpwHgB6I
	 TEAkPcrehsuAf2DmsKT5EAo6LHCr9fVVliuWwOIcdneS/O40heByW140YCKwPXvvsJ
	 v1BZaOGBqRRUg==
Date: Mon, 2 Feb 2026 11:19:03 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, jani.nikula@linux.intel.com,
	anisse@astier.eu, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] media: Virtual camera driver
Message-ID: <aYBsBw2j6pkwAssn@kernel.org>
References: <20260201133342.335680-1-jarkko@kernel.org>
 <5073898.31r3eYUQgx@natalenko.name>
 <20260202001704.2419778a@foz.lan>
 <13939245.uLZWGnKmhe@natalenko.name>
 <20260202020214.2243acec@foz.lan>
 <aYBo69zrMnRdWs32@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYBo69zrMnRdWs32@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-51972-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jarkko@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,natalenko.name:email,astier.eu:email]
X-Rspamd-Queue-Id: 72FDECA095
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 11:05:52AM +0200, Jarkko Sakkinen wrote:
> On Mon, Feb 02, 2026 at 02:02:14AM +0100, Mauro Carvalho Chehab wrote:
> > On Mon, 02 Feb 2026 00:25:37 +0100
> > Oleksandr Natalenko <oleksandr@natalenko.name> wrote:
> > 
> > > Date: Mon, 02 Feb 2026 00:25:37 +0100
> > > From: Oleksandr Natalenko <oleksandr@natalenko.name>
> > > To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org, jani.nikula@linux.intel.com, anisse@astier.eu, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, open list <linux-kernel@vger.kernel.org>
> > > Message-ID: <13939245.uLZWGnKmhe@natalenko.name>
> > > 
> > > On pondělí 2. února 2026 0:17:20, středoevropský standardní čas Mauro Carvalho Chehab wrote:
> > > > No. At the machine with the camera, obs can read from a V4L2 input,
> > > > generate a mpeg TS stream, and listen to a UDP port (for instance). 
> > > > 
> > > > At the remote machine, you can just pass the URL to ffmpeg.  
> > > 
> > > I can't, I have to feed the stream into Firefox somehow for it to see the stream as a virtual webcam.
> > 
> > Motioneye could be used on such scenario. It has a proper web
> > interface, allows multiple users to watch, has login control accepts
> > multiple cameras.
> 
> When proposed workarounds move in the area of motion detection systems
> it feels like there was a competion who invents the most impractical
> solution for a practical real-world problem out in the wild.

A trivial Google search shows that the scope of the issue, which is
also (on emphasis) a security issue, and net effect that is caused
of not addressing it properly.

> 
> > 
> > Thanks,
> > Mauro


BR, Jarkko

