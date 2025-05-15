Return-Path: <linux-media+bounces-32555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B2BAB7F0B
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 09:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63C6F4C531E
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 07:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7297B2820DD;
	Thu, 15 May 2025 07:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.com header.i=@tuta.com header.b="YzmasyR6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74ED2820D0
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294956; cv=none; b=DnAW9RWTcZ5bTXJH0RqNp9QO/0Yyy3OAM2ujz8yQPLGZPvaEdTXyKim86zOyO3bsi8ZfojoYkCwmipKJReMBS/9hmylnknBPh+qKYkrt8tTyCFufMTbbp0MsnD4aFL5rAQCifpnuLk7R/k8XMTmEzNp4PrMnWtBXFuKyB5crccM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294956; c=relaxed/simple;
	bh=QqvyAvHXNRpIQxueO0iNUmdGpK+Hq+5gOm7YepibVeE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XdxoudY2jkFBkGfuyoX3ldMCTZR5zZRjejgLunl3s9sC4sHxfyNn42npL2YYIBUtXtIedxNh6zTqb5KB/IhEPBOne27HAKzVH5KaQULfR5h4ENJkl6hFAv3fOTD0u72qBvOKmqCPJwEPOmDZBogRWmYLIvZKPpv9SbWNzmUdrvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.com; spf=pass smtp.mailfrom=tuta.com; dkim=pass (2048-bit key) header.d=tuta.com header.i=@tuta.com header.b=YzmasyR6; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.com
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 33ED2884B11F
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 09:37:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747294628;
	s=s1; d=tuta.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=oT3nTdgRANpaRdD3gXUOstKIJfk+EOok6abEvfRe89Q=;
	b=YzmasyR6KJERR3nR1mNFenQUxvFMxcE5P7sY+KJPuFgB76Di5qTKJmhaXBIE9+p0
	iJw9e8MPn0c3j3gBpQ2tqZQgamk23tgYSZVjh7R09SIfdEv6+UHS3sq7OrARu7aTM76
	LsWwcQPCG2z+K2iWUDm186uOBA63S+Pvx+Cq4JGqN6TybYTCOSCeulTgSCLRErXchCy
	WtuVkQeuE+WJmDI7wXKjEz8KZ6YokXYiQ/eX+YwRbSie/jpGe6TW8v/YZ2Lh8l3EFTc
	2oVFt07SuXvAaVd3Kkx8EdFl40cxwbrhCkioBtMl9vld5PXDMf2Ny8ubV39ZxPG9rUY
	ULY6N0iU4A==
Date: Thu, 15 May 2025 09:37:08 +0200 (CEST)
From: Andrej Gardijan <andrej.gardijan@tuta.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jerry Wu <jerry.w.hu@intel.com>,
	=?UTF-8?Q?Jesper_Taxb=C3=B8l?= <jesper@taxboel.dk>,
	Josuah Demangeon <me@josuah.net>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Naush Patuck <naush@raspberrypi.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Ricardo Ribalda <ricardo.ribalda@gmail.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Will Robertson <w.robertson@cairnwater.com>,
	Libcamera Devel <libcamera-devel@lists.libcamera.org>,
	Linux Media <linux-media@vger.kernel.org>
Message-ID: <OQHs1_r--w-9@tuta.com>
In-Reply-To: <CAFEp6-3OCQ-if8ET52vdNg+OrQR281Ad=egOEtzsSLqPWiZY+Q@mail.gmail.com>
References: <20250512154445.GA4523@pendragon.ideasonboard.com> <CAFEp6-3OCQ-if8ET52vdNg+OrQR281Ad=egOEtzsSLqPWiZY+Q@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Logistics and agenda
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi everyone,

sorry but I'll have to skip the workshop.
Maybe someone could fill my spot?
Kindly,
Andrej Gardijan

May 14, 2025, 10:31 by loic.poulain@oss.qualcomm.com:

> On Mon, May 12, 2025 at 5:45=E2=80=AFPM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>
>>
>> Hello everybody,
>>
>> I'm looking forward to seeing you all on Friday the 16th of May for the
>> libcamera workshop. Here is the first agenda draft, along with logistic
>> information for on-site and remote attendees.
>>
>> As all workshop agendas, this is tentative and we will adjust the exact
>> timing depending on how the discussions progress.
>>
>> 09:00 - 09:10  Welcome and agenda bashing
>> 09:10 - 09:40  Software ISP status and future plans (Hans de Goede)
>> 09:40 - 10:00  Slowing down the soft ISP CPU implementation (Laurent Pin=
chart)
>> 10:00 - 10:30  Using a single IPA with multiple pipeline handlers (Hans =
de Goede)
>> 10:30 - 11:00  Break
>> 11:00 - 11:45  Bayer reprocessing (David Plowman)
>> 11:45 - 12:30  Startup frames (David Plowman)
>> 12:30 - 13:30  Lunch
>> 13:30 - 14:00  State of gstreamer support (Nicolas Dufresne)
>> 14:00 - 14:30  Multi-context support (Nicolas Dufresne)
>> 14:30 - 15:30  Per frame control (David Plowman)
>> 15:30 - 16:00  Break
>> 16:00 - 16:45  libcamera on Zephyr (Josuah Demangeon)
>> 16:45 - 17:15  The importance of libcamera to WildCamera
>> 17:15 - 17:45  TBD
>>
>
> Sorry, I'm late to the party as I missed the earlier announcement, do
> you still have a seat available?
>
> Regards,
> Loic
>

