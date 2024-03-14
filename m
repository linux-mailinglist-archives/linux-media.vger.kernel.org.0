Return-Path: <linux-media+bounces-7076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A53F487BE61
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 15:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E4A3B22C51
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 14:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B060C71748;
	Thu, 14 Mar 2024 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="QW6NmRjX";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="sTGKpLU6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDF770CD8
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710425094; cv=none; b=jICrrMGHcvuU3uqFkadSJiRW77N28FexUpCB2MWK4K8xbS172xUiisykx7MWOElQva38gKLsxWim05HZFgoeiWWOjNsb6E4Af4m7abCThy6+Vv78ebY5hY4iEsgjh/5YrPqVd/1mVSGlpdYBu8NnJ6TK5wkRomtptVo+50Zlf0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710425094; c=relaxed/simple;
	bh=03WpCWECUFO5FyEbVyfRI6vK3UxYNb7tESURdD/U5mY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LuEp4CrsQAY5HnlG7Aj2CxF8ve+02qOTAr5YEFOxbkR+sYuFZA3vYC+MC3LlmdgygsWNt32GbRycLDBgidJDpb8V9CFUMUXW/nRJevhv/480YKPa/0tlGnC5fbG57YZnR7pJwHkSaN5/jZ0JJbIGnbAc7e/71EngZgMUqizvVCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=QW6NmRjX; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=sTGKpLU6 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1710425090; x=1741961090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kGjmBr0tSpBc5FHpI5ehetcFSjByS5a7mEbiBqncob4=;
  b=QW6NmRjXHUlaAu5WcIdMD5v8AlrkwXGIcg7cMeQCEW2+lVN8qsELUa0k
   fv/x+8j9R5AllLyJCI2eoNfJJP0sxrWWgrbmCA60ZTrIKPTSUoJWOL2Mn
   USE4PaZ8f3S2Qo45/r8RriCNGgdnvpUKjgmP/6Y1+NBoqdMbpkoxBxT+d
   cl5/a25N4xVbMAQF9GXcOc+VGKzXY+GGcD3mfWtU3SsxZDEKJvxZgMRla
   D97nm7hNcz7+0sTM3Sqi+BQBnbWDKFyKFpMPI3pctkybYH1DDHXR3dSzv
   UHJ30B5gSO/d1QN1PbaazIJEh7anxle+5WnK9Uee2DIPkN8kSqL3LjOFu
   Q==;
X-IronPort-AV: E=Sophos;i="6.07,125,1708383600"; 
   d="scan'208";a="35915273"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 Mar 2024 15:04:45 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 643D616ECBD;
	Thu, 14 Mar 2024 15:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1710425081;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kGjmBr0tSpBc5FHpI5ehetcFSjByS5a7mEbiBqncob4=;
	b=sTGKpLU6V4sfHnUgx0BObOqp4vROyq0h0HHjAat77JhstqJntoAmXTMSWM+MTK5z2EMSqI
	gT8U4hOI6Y+uvvkNlKpXB6J9PhIvFM2YKG91W6tJyokGxjdRToGlPA4K/OGlW0l8uxGx6x
	dZqR9wcxV5EV3eIUSqWhQs8ULOskAKvoHbdh00zhXA16Z84Cz5/W0LmAMfBAf3kMQUhzqM
	VCWUQOJ9VknEJOBtmGkX59OaMgxf4ZrjzXDtnFnGaYVzNOeLgY+sMmBEbmYVOtfTy/ueqh
	9dMCwQh/9p4r8oPs6fL5C4ZTNpLgrnlLKUdJf6zK+0wABi1KBH8AZEV/08TJzQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 2/2] media: v4l: async: Properly check for a notifier initialised or registered
Date: Thu, 14 Mar 2024 15:04:44 +0100
Message-ID: <8691787.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240311121741.1249976-3-sakari.ailus@linux.intel.com>
References: <20240311121741.1249976-1-sakari.ailus@linux.intel.com> <20240311121741.1249976-3-sakari.ailus@linux.intel.com>
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

I suppose on of your intentions of this series is to replace my patch, no?

Am Montag, 11. M=E4rz 2024, 13:17:41 CET schrieb Sakari Ailus:
> Properly check that a notifier was never initialised or register. This can
> now be done by looking at the entry in the notifier list, not the V4L2
> device or sub-device that are set in the initialiser now.
>=20
> Fixes: b8ec754ae4c5 ("media: v4l: async: Set v4l2_device and subdev in as=
ync notifier init")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-co=
re/v4l2-async.c
> index 2ff35d5d60f2..3b43d6285dfe 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -630,12 +630,14 @@ EXPORT_SYMBOL(v4l2_async_nf_register);
>  static void
>  __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
>  {
> -	if (!notifier || (!notifier->v4l2_dev && !notifier->sd))
> +	/* Return here if the notifier is never initialised or registered. */
> +	if (!notifier->notifier_entry.next ||

I don't like the idea checking the next pointer of a list.
Despite that it's not even necessary.

Best regards,
Alexander

> +	    list_empty(&notifier->notifier_entry))
>  		return;
> =20
>  	v4l2_async_nf_unbind_all_subdevs(notifier);
> =20
> -	list_del(&notifier->notifier_entry);
> +	list_del_init(&notifier->notifier_entry);
>  }
> =20
>  void v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




