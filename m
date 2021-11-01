Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3F2441EFD
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 18:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232304AbhKARLD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 13:11:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55378 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbhKARLC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 13:11:02 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01F0D929;
        Mon,  1 Nov 2021 18:08:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635786508;
        bh=HCPNat1y4QBy3bzxnPYkvnxbfKV9zb7AsBUZfjhDfqk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=buUMOx/eojXAkxjeplDTq5x52L4FDh3hDaV1ZzLLDIIw7EIOwIfOrgDYV7Dewkr1k
         hE3wtgtj3uE0ydWF3H8G2GXxKShI4xwc97HMfGO1bHWND/6J1JXRdlmOjQmR6GPGm8
         I+BLHhUbNpvVSse2jPo3VU0QAhQoi2OCTQVtuieM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YYAb5oYrsZMWNB+o@oden.dyn.berto.se>
References: <20211101132502.700505-1-sakari.ailus@linux.intel.com> <163578420928.926484.5058272719714961844@Monstersaurus> <YYAb5oYrsZMWNB+o@oden.dyn.berto.se>
Subject: Re: [PATCH 1/1] max96712: Select VIDEO_V4L2
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
To:     Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Date:   Mon, 01 Nov 2021 17:08:25 +0000
Message-ID: <163578650541.926484.13834590528432884952@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Niklas S=C3=B6derlund (2021-11-01 16:55:02)
> Hi Kieran,
>=20
> On 2021-11-01 16:30:09 +0000, Kieran Bingham wrote:
> > Hi Sakari,
> >=20
> > Quoting Sakari Ailus (2021-11-01 13:25:02)
> > > Select VIDEO_V4L2 for the driver actually depends on it, failing to
> > > compile otherwise.
> > >=20
> > > Fixes: 51758f8b32134bacbf30bd217f7c2074e9b4b51e ("media: staging: max=
96712: Add basic support for MAX96712 GMSL2 deserializer")
> >=20
> > I guess this is a local commit in your tree so far, I can't identify it.
> >=20
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/staging/media/max96712/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging=
/media/max96712/Kconfig
> > > index 258d47644cbd..492a7ff70dd8 100644
> > > --- a/drivers/staging/media/max96712/Kconfig
> > > +++ b/drivers/staging/media/max96712/Kconfig
> > > @@ -6,6 +6,7 @@ config VIDEO_MAX96712
> > >         select V4L2_FWNODE
> > >         select VIDEO_V4L2_SUBDEV_API
> > >         select MEDIA_CONTROLLER
> > > +       select VIDEO_V4L2
> >=20
> > I don't see any other driver 'select' VIDEO_V4L2...
> > Most 'depend' on VIDEO_V4L2 instead.
> >=20
> > And curiously, I already see
> >  - Add 'depends on VIDEO_V4L2'
> >=20
> > in Niklas' v4.
>=20
> I noticed too late that v3 was already in the media staging tree so I=20
> submitted a v4 with this fix. I should probably have submitted a Fixes=20
> patch like this one instead of a v4 if I knew it was already picked-up.
>=20
> >=20
> > Is this one a special case that 'needs' to select it?
>=20
> Both 'select' and 'depends on' solves the problem reported by the bot,=20
> which one is more correct I do not know.

Aha, I see. Well - consistency would tell me that 'depends on' would
match almost every other driver.

I notice that the MAX9286 suffers the same problem. I'll send a patch.
--
Kieran


> > --
> > Kieran
> >=20
> >=20
> >=20
> > >         help
> > >           This driver supports the Maxim MAX96712 Quad GMSL2 Deserial=
izer.
> > > =20
> > > --=20
> > > 2.30.2
> > >
>=20
> --=20
> Regards,
> Niklas S=C3=B6derlund
