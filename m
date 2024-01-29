Return-Path: <linux-media+bounces-4349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A27E78405CA
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 13:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 541F61F22711
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 12:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43828657A4;
	Mon, 29 Jan 2024 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R0GesCaT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827B86519C
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532864; cv=none; b=JvZJMX4Uu+odf8xsoovpYqucvd2TKH8lXEblsSBXvT2/uYt6wyItAJ+PrdjoCUSLY6vnl5PCfXQd2+zp3Iw0UTipI9sN4kJtccQZywb71acO0/F0fEyoTjM8n/IbqUG43Ulf16HW6/EZGZ8n9D/00wRW/4J3xGjGwPzcTdlKaPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532864; c=relaxed/simple;
	bh=u3qGhvxkt2BrZxR5CI/0ZU7I9Kr6TdiTnWr3OoxO/d4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=K/gELxpJ9GMSpOdxL3D7o68adCNIn6LWCNBaOhgR4c1zyQkK2Fu0lNm8z3O72mqJbtpNWIQbKtrAzy3A0mPFE0J1YNBSPjjNVevCpbqBrtHG0WqSFBLmoCZ5nu8j+zmM2ygSqQ3/8LReeo5T6Le5PUzPTO+oZ44mqbdq5wUatUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R0GesCaT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DDDA1F73;
	Mon, 29 Jan 2024 13:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706532783;
	bh=u3qGhvxkt2BrZxR5CI/0ZU7I9Kr6TdiTnWr3OoxO/d4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=R0GesCaTZRkS4pcaZxgU/K2ri9qBeEg7sjut0K+Z/Tt6R+WAeCbWXedeHS3M6DjST
	 VVM2KZ7hL0ECmoNwsGRaJcvaeslgJr60rL2XN08lPFMvNqMegKxKq2EQgHpHQKrHj4
	 71+hU3TgEgzXM3z4ezAFXIx/FZrLjwI6mRlAJFqU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <77162309-ed79-42ed-a715-d8a0ce1af56d@redhat.com>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com> <xpzavj24xdbeixfc7lw7rccx3zyhodqhcsceovru7bgcfvdp5s@w4jbols3o2wv> <77162309-ed79-42ed-a715-d8a0ce1af56d@redhat.com>
Subject: Re: Weird default vblank value in ov5693
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 29 Jan 2024 12:54:18 +0000
Message-ID: <170653285818.2407440.7940034493930024656@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-01-29 10:43:33)
> Hi,
> >=20
> > Would you be interested in reviewing
> > https://patchwork.kernel.org/project/linux-media/list/?series=3D697777&=
state=3D%2A&archive=3Dboth

> Documentation: media: camera_sensor: Document blankings handling

> >=20
> > and discuss there what the desired behaviour should be ?
>=20
> I'm definitely interested in discussing this and in
> helping with reviewing the documentation patches,
> good timing wrt writing those patches :)
>=20
> but Dan already replied in this thread, so lets
> keep the discussion in this thread for now ?
>=20
> Also I think this will probably make a good agenda
> item for the libcamera workshop coming Friday ?

Added to the existing Sensor Modes topic that was added by Nicolas

--
Kieran

