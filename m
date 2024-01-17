Return-Path: <linux-media+bounces-3795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B08304F5
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 13:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C96D1C21874
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 12:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0C51DFDC;
	Wed, 17 Jan 2024 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="q2iXLsIO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978131DFCF
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705493371; cv=none; b=TNv5BPJ5heSCaBpGIvV1ryO0iKEJlf11og0IZg4J+Cls2D/JnJC2Z6kmzfyB+X+2iNsNTgK3ML36UgsVgvfurQbzDP2S+5jz2n6ofnu0EZ916arwVrMrIcNW+21xatEiJjG2+MPTcmrOU63Dc5c1mhh8+M95grMVcb+AT2avxLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705493371; c=relaxed/simple;
	bh=sTdciPycfHMyeJYV+oRAPc6wAcAhgW3c8KfLcKczhag=;
	h=DKIM-Signature:X-IronPort-AV:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Organization:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type; b=AfPcD2DLu0bYP6tq8Fo6heya5AaAzPSfXDt4iCLG7odZklSrlvZseZ4gRmcaB5CLP5I5iBJGGeXFGsw8q89QH0fFNZ+MpM5onrAN66s0PhRjaGc4KjriDpj/dIB0rzZh0+rYwCPTVjJHi+Uxn6rWLNo3YFFk6+iLXDM4vHVINHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=q2iXLsIO; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705493367; x=1737029367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sTdciPycfHMyeJYV+oRAPc6wAcAhgW3c8KfLcKczhag=;
  b=q2iXLsIOPMNPZGyb4jO1gRoxx+iZfuH8c7im0ig5bRzNJeSOkgc2FZ2/
   ZIlmedK1DZpu+MsfnriIhO4EJrg34lD1Dgp+irBa13sjOqSzQcOxjCX35
   hoM29OMHw9iJhir7xXguqQxele1BtoLuuXuVV5En7Sr8WnbLnYU2U8Ny2
   1z8PN+DiJmTHj41qfKrwnNvYkjFtJ3OpvBdEDfntDrCtYj4ZMD41ZBxeT
   o2fOXKLFH4r9kxCe41GBCSlfcNQf6VgWaqSy8H+iMZxLzi97m3FJs6qZW
   dQ1zi4D04vRbT2bUzTv7vG7EyO6NRNt2qqGp8NdgyOb+7F7bSAQ74tK5z
   w==;
X-IronPort-AV: E=Sophos;i="6.05,200,1701126000"; 
   d="scan'208";a="34939077"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Jan 2024 13:09:25 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5827C280075;
	Wed, 17 Jan 2024 13:09:25 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v3 1/1] media: tc358743: register v4l2 async device only after successful setup
Date: Wed, 17 Jan 2024 13:09:24 +0100
Message-ID: <1782782.VLH7GnMWUR@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Zae6NUouoPS7b1lR@valkosipuli.retiisi.eu>
References: <20240110090111.458115-1-alexander.stein@ew.tq-group.com> <Zae5w_JbrLXikmTo@valkosipuli.retiisi.eu> <Zae6NUouoPS7b1lR@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Sakari,

Am Mittwoch, 17. Januar 2024, 12:29:57 CET schrieb Sakari Ailus:
> On Wed, Jan 17, 2024 at 11:28:03AM +0000, Sakari Ailus wrote:
> > Hi Alexander,
> >=20
> > On Wed, Jan 10, 2024 at 10:01:11AM +0100, Alexander Stein wrote:
> > > Ensure the device has been setup correctly before registering the v4l2
> > > async device, thus allowing userspace to access.
> > >=20
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Reviewed-by: Robert Foss <rfoss@kernel.org>
> >=20
> > This should be backported to the stable trees. I'll add Cc: stable.
> >=20
> > The patch seems to co-incidentally fix error handling, too. :-)
>=20
> I'll also add:
>=20
> Fixes: 4c5211a10039 ("[media] tc358743: register v4l2 asynchronous
> subdevice")

Agreed. Thanks
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



