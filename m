Return-Path: <linux-media+bounces-17735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC896ED43
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 10:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6F0B281EB9
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 08:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0551B155CB0;
	Fri,  6 Sep 2024 08:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBh4u+54"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D0C3C463
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 08:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725610316; cv=none; b=Ts0NA/JWNea5GDKfRTHlAwUjY4XeR76tl5xAEszQ7Sp5OmpAC3/2mG6PLxY/G5+fSeyshoM7dFwKFw3v752mN3U45hxUwZkDNYLX74BDcoQcv1oZRIO95MHnn6gMvVL7A+7PZX1pAolbgxVhjZEPQCW5YhtNBF8j2S/1L+JdfXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725610316; c=relaxed/simple;
	bh=yCXikCur5GsBPVZBekWjPxAAEYuR/8Diz45uzSZmWUI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tJCIt8hhmxPFso8XH8QSYcedmjzc16cJR0qrIZEX8jgimlYIpaGMfLTtJqEUOwOiKO1BlaCqSfYHEWPI+6UhtRqsScUvkuNR4iHmQLZJdNwoDUULQRBfGcBXjwuhvyIegfaYgwZW6FOHa4w7XB1/MIvdbeRXk1vvr9RY252fA5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBh4u+54; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0CEC4CEC4;
	Fri,  6 Sep 2024 08:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725610316;
	bh=yCXikCur5GsBPVZBekWjPxAAEYuR/8Diz45uzSZmWUI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aBh4u+54WVBkRnKrH6tJmVgPs/OhWO6NYyFQjatBvfHjvEZcRb+Q5GL3EpZs5L5e9
	 FA7umKVfBypd5QudF5lIVqQ7PN4S3ldG0cd0rhfI9QCKNFcb8pQLH5o/roi9tskEcB
	 cHo2edT7I8S6msVVl6cST4oQSZdkzCZkED5HhbH/k5ZOeCE8N196A55lMpXorzwLz3
	 R9Tvp3c8sWadskQK6s59cU0b6zjk6lU6tKEKqvjRLl/BCgQHokevRoU6v9bKiyTaRK
	 flfPS3VsakZNyyCMI2ObFgouYQ0vjJHWHSqPbV2K/lP02dA0FauVIbJl+fpEkJNutK
	 btvFl/DnoPhvQ==
Date: Fri, 6 Sep 2024 10:11:48 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>, Martin Hecht
 <martin.hecht@avnet.eu>, Tommaso Merciai <tomm.merciai@gmail.com>, Jacopo
 Mondi <jacopo.mondi@ideasonboard.com>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Michael Tretter <m.tretter@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, Steve Cho
 <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Hidenori
 Kobayashi <hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, Devarsh Thakkar
 <devarsht@ti.com>, r-donadkar@ti.com
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v5)
Message-ID: <20240906101141.451db4f4@foz.lan>
In-Reply-To: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl>
References: <c50f4bfe-6d72-426e-9595-5c8b0751c08b@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Thu, 5 Sep 2024 09:16:27 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Hi all,
>=20
> Here is my fifth (and likely final) stab at an agenda for the media summi=
t. As always,
> it is subject to change and all times are guesstimates!
>=20
> The media summit will be held on Monday September 16th. Avnet Silica has =
very
> kindly offered to host this summit at their Vienna office, which is about=
 35
> minutes by public transport from the Open Source Summit Europe venue
> (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
>=20
> Avnet Silica Office Location:
>=20
> Sch=C3=B6nbrunner Str. 297/307, 1120 Vienna, Austria
>=20
> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(=
Silica)/@48.183203,16.3100937,15z/data=3D!4m6!3m5!1s0x476da80e20b26d5b:0x2c=
5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=3Dttu
>=20
> Refreshments are available during the day.
>=20
> Lunch is held at Sch=C3=B6nbrunner St=C3=B6ckl (https://www.schoenbrunner=
stoeckl.com/), close
> to the Avnet Silica office. The lunch is sponsored by Ideas on Board and =
Cisco Systems
> Norway.
>=20
> Regarding the face mask policy: we will follow the same guidance that the
> Linux Foundation gives for the EOSS conference:
>=20
> https://events.linuxfoundation.org/open-source-summit-europe/attend/healt=
h-and-safety/#onsite-health-and-safety
>=20
>=20
> In-Person Attendees:
>=20
> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
> Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media Kernel Maintain=
er)
> Steve Cho <stevecho@chromium.org> (Google)
> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
> Ricardo Ribalda <ribalda@chromium.org> (Google)
> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
> Sean Young <sean@mess.org>
> Jerry W Hu <jerry.w.hu@intel.com> (Intel)
>=20
> Remote Attendees (using MS Teams):
>=20
> Rishikesh Donadkar <r-donadkar@ti.com> (TI)
> Tomasz Figa <tfiga@chromium.org> (Google)
> Hidenori Kobayashi <hidenorik@chromium.org> (Google)
> Devarsh Thakkar <devarsht@ti.com> (TI)
>=20
> Note: information on how to connect remotely will come later.
>=20
> If any information above is incorrect, or if I missed someone, then pleas=
e let me know.
>=20
> We are currently 17 confirmed in-person participants, so we're pretty muc=
h full.
> If you want to join remotely, then contact me and I'll add you to that li=
st.
>=20
> Draft agenda:
>=20
> 8:45-9:15: get settled :-)
>=20
> 9:15-9:25: Hans: Quick introduction
>=20
> 9:25-11:00: Ricardo: multi-committer model using gitlab

As part of such discussion, IMO some topics that should be covered:

1. All committers shall use a common procedure for all merges.

   This is easy said than done. So, IMO, it is needed some common scripts
   to be used by all committers. On my tests when merging two PRs there,
   those seems to be the minimal set of scripts that are needed:

   a) script to create a new topic branch at linux-media/users/<user>
      The input parameter is the message-ID, e. g. something like:

	create_media_staging_topic <topic_name> <message_id>

      (eventually with an extra parameter with the name of the tree)

      It shall use patchwork REST interface to get the patches - or at least
      to check if all patches are there (and then use b4).

      such script needs to work with a single patch, a patch series and a
      pull request.

      the message ID of every patch, including the PR should be stored at
      the MR, as this will be needed to later update patchwork.

   b) once gitlab CI runs, there are two possible outcomes: patches may
      pass or not. If they pass, a MR will be created and eventually be
      merged.

      Either merged or not (because something failed or the patches require
      more work), the patchwork status of the patch require changes to
      reflect what happened. IMO, another script is needed to update the
      patch/patch series/PR on patchwork on a consistent way.

      This is actually a *big* gap we have here. I have a script that=20
      manually check patchwork status and the gap is huge. currently,
      there are 73 patches that seems to be merged, but patchwork was not
      updated.

      From what I noticed, some PR submitters almost never update patchwork
      after the merges.

      So another script to solve this gap is needed, doing updates on all=20
      patches that were picked by the first script. Something like:

      update_patchwork_from_topic <topic_name> <new_status>

      This would likely need to use some logic to pick the message IDs
      of the patch inside the MR.

      Such script could also check for previous versions of the patch
      and for identical patches (it is somewhat common to receive identical
      patches with trivial fixes from different developers).

   Someone needs to work on such script, as otherwise the multi committers
   model may fail, and we risk needing to return back to the current model.

2. The mailbomb script that notifies when a patch is merged at media-stage
   we're using right now doesn't work with well with multiple committers.

   Right now, the tree at linuxtv runs it, but it might end sending patches
   to the author and to linuxtv-commits ML that reached upstream from other
   trees. It has some logic to prevent that, but it is not bulletproof.
=20
   A replacement script is needed. Perhaps this can be executed together
   with the patchwork script (1B) at the committer's machine.

3. Staging require different rules, as smatch/spatch/sparse/checkpatch
   warnings and errors can be acceptable.

4. We need to have some sort of "honour code": if undesired behavior
   is noticed, maintainers may temporarily (or permanently) revoke
   committer rights.

   Hopefully, this will never happen, but, if it happens, a rebase
   of media-staging tree may be needed.

5. The procedure for fixes wil remain the same. We'll have already enough
   things to make it work. Let's not add fixes complexity just yet.
   Depending on how well the new multi-committers experimental model
   works, we may think using it for fixes as well.

Thanks,
Mauro

