Return-Path: <linux-media+bounces-38286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B93B0F89E
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 19:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0B7C3BDFD8
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 17:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566162046A9;
	Wed, 23 Jul 2025 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K3XhHuSP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC07C149C41;
	Wed, 23 Jul 2025 17:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753290164; cv=none; b=uoNwl8+ASAPV5+Fp3KIriNvrvdrW2De0+nEX5WEczaT677jThpiLkLk6nYt9Snwk3mpp7nq6Szilxm4SADFoDPyiDraIMLDlqb9rJuBe9zTmJB7K4hgLlUidB7S02atuBcoR3bdXq8T8tVN3v/HV0015JGrI0VA+KUBavzmyYpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753290164; c=relaxed/simple;
	bh=Ezg06OgxSDKdzPWG8w2hBs/q71+zE2RMViCk8Fhbyos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0q7CnAgEpgXFcQ/UFfcve8nlsUmI7XQznPB6eqaF+iwGognui6ZQj8KWVDYyS6K8XfVW4I5KRqGK8F7oEtuxNoMqAi9ZuBGFRMvFy3Rmpm2sw/r3q7LtrsjT52iRHFrttOH7WJcOBqZCOKZqcX/ccmoyxqy8FivkVgRu0bf1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K3XhHuSP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EAC38E8A;
	Wed, 23 Jul 2025 19:02:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753290121;
	bh=Ezg06OgxSDKdzPWG8w2hBs/q71+zE2RMViCk8Fhbyos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K3XhHuSPkqh4NicMKgdUj2sHYo32LjRjokjtoawyUrlGZypbscYBsp35AhwhhtA+h
	 uxaVYzKPJFDystJHdEBDBepNl/lSu63hfQ5fmpRPWdZS0Sc3G4XLm6By/2jGn4J+z0
	 9A2CGZ4aA/hji8KR+VTREP/p526rrw+68O5Ge6Dc=
Date: Wed, 23 Jul 2025 20:02:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Allen Ballway <ballway@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ov8865: move mode_configure out of state_configure
Message-ID: <20250723170237.GE14576@pendragon.ideasonboard.com>
References: <20250722-mode_configure-v1-1-5ea35052a01f@chromium.org>
 <20250723154753.GH6719@pendragon.ideasonboard.com>
 <CAEs41JCctnTgwY-ePrB+kwY7nUvJuMAttZ894PzhL-b_SF7uNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEs41JCctnTgwY-ePrB+kwY7nUvJuMAttZ894PzhL-b_SF7uNQ@mail.gmail.com>

On Wed, Jul 23, 2025 at 09:40:42AM -0700, Allen Ballway wrote:
> On Wed, Jul 23, 2025 at 8:47 AM Laurent Pinchart wrote:
> > On Tue, Jul 22, 2025 at 01:35:43PM -0700, Allen Ballway wrote:
> > > ov8865_mode_configure() only needs to be called on sensor init, but it can
> > > be called multiple times from ov8865_state_configure(). Move
> > > ov8865_mode_configure() to ov8865_sensor_init().
> > >
> > > Signed-off-by: Allen Ballway <ballway@chromium.org>
> > > ---
> > >  drivers/media/i2c/ov8865.c | 15 +++++++--------
> > >  1 file changed, 7 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> > > index 95ffe7536aa6aba814f4e5c3d12e7279470b2f07..1d1a1f261bf4ab5c09848402dc057e2f572504e7 100644
> > > --- a/drivers/media/i2c/ov8865.c
> > > +++ b/drivers/media/i2c/ov8865.c
> > > @@ -2304,14 +2304,6 @@ static int ov8865_state_configure(struct ov8865_sensor *sensor,
> > >       if (sensor->state.streaming)
> > >               return -EBUSY;
> > >
> > > -     /* State will be configured at first power on otherwise. */
> > > -     if (pm_runtime_enabled(sensor->dev) &&
> > > -         !pm_runtime_suspended(sensor->dev)) {
> > > -             ret = ov8865_mode_configure(sensor, mode, mbus_code);
> > > -             if (ret)
> > > -                     return ret;
> > > -     }
> > > -
> > >       ret = ov8865_state_mipi_configure(sensor, mode, mbus_code);
> > >       if (ret)
> > >               return ret;
> > > @@ -2384,6 +2376,13 @@ static int ov8865_sensor_init(struct ov8865_sensor *sensor)
> > >       }
> > >
> > >       /* Configure current mode. */
> > > +     ret = ov8865_mode_configure(sensor, sensor->state.mode,
> > > +                                  sensor->state.mbus_code);
> >
> > How about the implication on ov8865_set_fmt() that will not update the
> > link freq and pixel rate controls anymore ?
> 
> I believe those will be unaffected by this change, they are updated in
> ov8865_state_mipi_configure() which is still called from
> ov8865_set_fmt() via ov8865_state_configure().

You're right, my bad.

> > > +     if (ret) {
> > > +             dev_err(sensor->dev, "failed to configure mode\n");
> > > +             return ret;
> > > +     }
> > > +
> > >       ret = ov8865_state_configure(sensor, sensor->state.mode,
> > >                                    sensor->state.mbus_code);

Can't we drop this now ? The remaining code in ov8865_state_configure()
updates the link frequency and pixel rate controls, and sets
sensor->state.mode and sensor->state.mbus_code. The latter is a no-op
here as they're set to their current value, and the controls shouldn't
need an update in this function as it's only called from
ov8865_resume().

> > >       if (ret) {
> > >
> > > ---
> > > base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
> > > change-id: 20250722-mode_configure-80105fbd835d

-- 
Regards,

Laurent Pinchart

