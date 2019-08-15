Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 537BF8EC34
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732032AbfHONBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:01:22 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:33075 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729818AbfHONBW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:01:22 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.localdomain (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2A4F31C0004;
        Thu, 15 Aug 2019 13:01:18 +0000 (UTC)
Date:   Thu, 15 Aug 2019 15:02:45 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 3/5] media: v4l2-ctrls: Add support for V4L2_CID_LOCATION
Message-ID: <20190815130245.usat55oqffe4abvi@uno.localdomain>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-4-jacopo@jmondi.org>
 <20190814225353.GE5015@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="q3wploq7haya4lpx"
Content-Disposition: inline
In-Reply-To: <20190814225353.GE5015@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--q3wploq7haya4lpx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Thu, Aug 15, 2019 at 01:53:53AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Wed, Aug 14, 2019 at 10:28:13PM +0200, Jacopo Mondi wrote:
> > Add support for the newly defined V4L2_CID_LOCATION read-only control
> > used to report the camera device mounting position.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls.c | 7 +++++++
> >  include/uapi/linux/v4l2-controls.h   | 4 ++++
> >  2 files changed, 11 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index 7d3a33258748..8ab0857df59a 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -943,6 +943,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
> >  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
> >  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
> > +	case V4L2_CID_LOCATION:			return "Location";
>
> Depending on what we decide to name the control (see review of 2/5), you
> should adjust the description accordingly.
>
> >
> >  	/* FM Radio Modulator controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > @@ -1300,6 +1301,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >  		break;
> >  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:
> >  		*type = V4L2_CTRL_TYPE_FWHT_PARAMS;
> > +	case V4L2_CID_LOCATION:
> > +		*type = V4L2_CTRL_TYPE_INTEGER;
> > +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +		*min = V4L2_LOCATION_FRONT;
> > +		*max = V4L2_LOCATION_BACK;
>
> I don't think the control should have a min and a max different than the
> current value, as it's a fully static control. I'd drop those two lines
> here, and drivers will have to set value = min = max = V4L2_LOCATION_xxx
> when creating the control. That why you should be able to collapse this
> with V4L2_CID_MIN_BUFFERS_FOR_OUTPUT.
>

Ah, I thought min/max should report the actual control values limits.
Anyway, if we move this to be an integer menu control with an helper
to parse the DT property and register the control on behalf of
drivers, this will change.

> > +		*step = 1;
> >  		break;
> >  	default:
> >  		*type = V4L2_CTRL_TYPE_INTEGER;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 37807f23231e..5c4c7b245921 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -889,6 +889,10 @@ enum v4l2_auto_focus_range {
> >  #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
> >  #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
> >
> > +#define V4L2_CID_LOCATION			(V4L2_CID_CAMERA_CLASS_BASE+34)
> > +#define V4L2_LOCATION_FRONT			(0 << 0)
> > +#define V4L2_LOCATION_BACK			(1 << 0)
>
> Why not just 0 and 1 ?

Or why not BIT(). I saw that the (1 << x) style is the mostly used one in
this header file when defining macros like this one so I went for
consistency with the existing code.

>
> > +
> >  /* FM Modulator class control IDs */
> >
> >  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
>
> --
> Regards,
>
> Laurent Pinchart

--q3wploq7haya4lpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1VV/UACgkQcjQGjxah
VjyxEw/+IkrGu9/F2R9FbjT2wZtvpOv4r7HsQbNglpGhV+JJ6ub5fO65zCAHrIL5
PaeZFoKVIhxipY8cZDuRrUcxVxO4q1sS7JiE76wFG4tr82JFFRUCSEcVc47r21H+
RYRh4aymQKL010QxcnnrixvIAaBedweGHfhae/V+NvRR0aIsSm6wZsJr4HmJnYy8
5SB3NNsiUjRXGPvtYbFUf1/8+fsKm59AyT7hLYi+jf6ZphX/qxEHf/zluLJFbxkX
XLGw04z3x+lnKSpAOvjlOB/NLis65uqd2bV9/53r7BgUZ0agchBcxwK1ZJYzoe2c
rvLuadej00BzfkFKqCRB24qfAc51RrUfvJx5eksR26L/moAYdqOxyHuQZBx895L9
e3cEFKSMBlQhQIMC2Q255ViKO41KViT/UL0/OQ0wv4DCZmMVfrILLNcylG5oVqCA
hs1B2aT9PFkhaaCUqGOGMwJpLhwQRcFsXpBeSqonB0DDo4j+Z2Y3ybszRJ0S15ob
gobCLRGr6NLK9bHbHRqYS6rKXgMAmxOamvFfDPjEdeBqIQTG6n5HNQQC2EofXF+5
DeC+f3JbpggYraA/LVfDsI7Tv4MLN/PPXaaohgWf4RoTcMigYxwOBH7LlPCNdk+N
zZoKqIAYDyfmmEQtPlnuzN+JoxdVR3bgjI0vCf4MhgXQIETwG84=
=KSit
-----END PGP SIGNATURE-----

--q3wploq7haya4lpx--
