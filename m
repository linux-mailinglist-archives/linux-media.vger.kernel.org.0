Return-Path: <linux-media+bounces-7451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BACF58855A9
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 09:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 571DB1F223EF
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 08:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA245A117;
	Thu, 21 Mar 2024 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Bbvb4oz8";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Jeo/faYo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5C31DFD2
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711009694; cv=none; b=egVva5ltiNvBhaRn7APVeSE3YbnoHsBEJNAWZLoB1gXp9GbTt0iIkwbpMZrzjFZhGNzKnBp33kUKEUu3x6zUQnuDj8pobXA0hM4nHu2GdgwXPiSKUeghra81o+svvyuDrmOlSenUz757ookydryvCh+nOhdwQDDPNvb+4sv9YwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711009694; c=relaxed/simple;
	bh=hmFnxZG0frELyPGrnQY/tUTjodSvdd5rbBbBZX6TNwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cUYWNYmEgUrvMeHPCFHCxrp8xOSV3I+u7ANGwBO+VqmYq3LCv65hHWVk9j1DVgfh/RmqjUJz04PGM/jEBkQHSg6XIHcRofEoZpgBpoum05IAIRXS6Gtxve2IF2m/98j1HHdTOkhs2GI5lPV9ijXsS7eGI9aY6oSk7blyS1UwJcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Bbvb4oz8; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Jeo/faYo reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1711009690; x=1742545690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UivPSG3oxRpc+jkoFyuRewtFyXNkWl7e2bCcde0Nne4=;
  b=Bbvb4oz8XEA+qkF1OxGY2cpQlvxl11lv3UD8hAI9KbSShUrSoRlw68JJ
   pBelCqF0nXn70uZ6V3RGRZ0ebWVM7Zyx8l+9oKP0dr80huL+wlX7EywfR
   rTT4D8WpOhwO3H8eH0tlxP7Prbxx0M6XCm5+mfuCsuot9FKYM/zecmIFv
   DsyGCVo6sLx0QhwWgiWtPKMzd7sahmHi301ROczXeRHZ+bWaSxPadZOCS
   7KOKmqcS3a5q1wbtseS9f8FVEqYr/12H2ePh/9ysNXZYuh0KL4LlnF8kn
   O2EhwnakrpSs4W15KWhhG9etrWUbOktcOvo14XIloL6tytRXWI4nZ/m2O
   Q==;
X-IronPort-AV: E=Sophos;i="6.07,142,1708383600"; 
   d="scan'208";a="36022069"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Mar 2024 09:28:02 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5CA7160F29;
	Thu, 21 Mar 2024 09:27:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1711009678;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UivPSG3oxRpc+jkoFyuRewtFyXNkWl7e2bCcde0Nne4=;
	b=Jeo/faYo1f1SwVCbBjj0w+c2TRhDtyK0+a1s9O+5LZiT4ibUpZUQtbf/R/S/RLoQ42QSvY
	Ct9jxpqSBKg9prJaV7gGxKP+lYa1BKcK+tzCRqsFve9m6rVLeYoHuJvHvAmfKX+u/D3nqf
	Tamkuj/WwAbXtLXVE90R5XIAsNBP/VRDNAn8S7D9LCQwgxTwgUUlFmJpjDG4aAb/NnnI47
	eQPJmkf87L4wOsLECjMg47G601X2ye/UVNiYLg/L44xVbq8/GpwIM35F7ieG2WJh2+cPmp
	kwAbNXQ6Cqxsrt+O6T0QLcGOBN8NugdMWY7HFnIQ7fKyag1MXUZsO3SSgulPGA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 2/2] media: v4l: async: Properly check for a notifier initialised or registered
Date: Thu, 21 Mar 2024 09:28:01 +0100
Message-ID: <7831497.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZfqLRxUOwmh60gq1@kekkonen.localdomain>
References: <20240311121741.1249976-1-sakari.ailus@linux.intel.com> <8691787.DvuYhMxLoT@steina-w> <ZfqLRxUOwmh60gq1@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Sakari,

Am Mittwoch, 20. M=E4rz 2024, 08:07:51 CET schrieb Sakari Ailus:
> Hi Alexander,
>=20
> On Thu, Mar 14, 2024 at 03:04:44PM +0100, Alexander Stein wrote:
> > Hi Sakari,
> >=20
> > I suppose on of your intentions of this series is to replace my patch, =
no?
>=20
> No, these are somewhat unrelated issues.

Okay, thanks for confirmation.

> >=20
> > Am Montag, 11. M=E4rz 2024, 13:17:41 CET schrieb Sakari Ailus:
> > > Properly check that a notifier was never initialised or register. Thi=
s can
> > > now be done by looking at the entry in the notifier list, not the V4L2
> > > device or sub-device that are set in the initialiser now.
> > >=20
> > > Fixes: b8ec754ae4c5 ("media: v4l: async: Set v4l2_device and subdev i=
n async notifier init")
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-async.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l=
2-core/v4l2-async.c
> > > index 2ff35d5d60f2..3b43d6285dfe 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -630,12 +630,14 @@ EXPORT_SYMBOL(v4l2_async_nf_register);
> > >  static void
> > >  __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
> > >  {
> > > -	if (!notifier || (!notifier->v4l2_dev && !notifier->sd))
> > > +	/* Return here if the notifier is never initialised or registered. =
*/
> > > +	if (!notifier->notifier_entry.next ||
> >=20
> > I don't like the idea checking the next pointer of a list.
> > Despite that it's not even necessary.
>=20
> Actually I think we can drop the above change. But the list_del_init()
> below is still necessary.

I agree about the list_del_init() change.

Best regards,
Alexander

> >=20
> > Best regards,
> > Alexander
> >=20
> > > +	    list_empty(&notifier->notifier_entry))
> > >  		return;
> > > =20
> > >  	v4l2_async_nf_unbind_all_subdevs(notifier);
> > > =20
> > > -	list_del(&notifier->notifier_entry);
> > > +	list_del_init(&notifier->notifier_entry);
> > >  }
> > > =20
> > >  void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
> > >=20
> >=20
> >=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



