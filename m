Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4F7602F64
	for <lists+linux-media@lfdr.de>; Tue, 18 Oct 2022 17:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbiJRPPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Oct 2022 11:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbiJRPPf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Oct 2022 11:15:35 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4926BB05C
        for <linux-media@vger.kernel.org>; Tue, 18 Oct 2022 08:15:31 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id m6so8818727qkm.4
        for <linux-media@vger.kernel.org>; Tue, 18 Oct 2022 08:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GqtJnbok3p6dyPEff7MM2YXTeCKQMcMEo0FcuHNqO0s=;
        b=rmuOxlleLh1/JDJSRLdHNSiXGkiAPf5WWWjfUgAmAHO2KF8AumJdCdCcQb+WifP0Cy
         5XBD+MK3Y1R5mfLc8fJAhvj5ian+jagTyPLa0cF/Z6E3Rs6jxqpPmdazgmmTQxhywSvd
         xAuv9GB7QO48evYpRD8pyoR8eQe+iaNCX0EemvxtLvYGdhpkao8ZjgBCxMn+TkiRY+73
         zHFJVxqpR7uQ5oW9xMiPJI+mq7kAHxFLpPh20pg9zI2go2oLKSFlfdYo0VpqgUjKV6t9
         TLnWvYI2H+svZ1NkbFVlKeKiFa5IEkCywqKpBVkeYVnBdDiM8VtKtHq1warevO5uGs11
         +zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GqtJnbok3p6dyPEff7MM2YXTeCKQMcMEo0FcuHNqO0s=;
        b=3y7WJ0iZoR2u8TnY4qiyyQ93fm8tK5chAKSXwkqyeoejBs0QnosK3JxPfUje7/+yhW
         vZTtBSNSQWmYsVFrgog1jdchE2Tm8jiuRY12Ix8eDHu37vCoGxMQ01djdS5McGUZQWov
         QRQhqY11i7pfVDOzXulhkUoANR7jwKO39wZEJNE8yqNqLRI/YEQgRBGuvdtQB5BEFjIJ
         seODoINroN8FLKxnt+EJdinQVu+s5+tvjj13TpRWjzBTl4htXK3bxFm9BJY2XbZzIf/W
         +x9fs9tbop7cIa/E990KNM/+tFIdRNdznnP1sWAD4PZRIbLqIuly+VehlE0CXAVebLWV
         u6iQ==
X-Gm-Message-State: ACrzQf2lFtzxOyTPEicIScr2YICbTiWdz+nvJAYvSkfVHSkNCkMJH0Kd
        bWKfIEvGaY1P5Jcdeg7IE3WSLA==
X-Google-Smtp-Source: AMsMyM4jGePzE341T5UjekVabsXE4lAPbDBJc4A5WpOefOPYut9wNayPOtAhutZsADIPR8fRIFJNQg==
X-Received: by 2002:ae9:ea03:0:b0:6e0:ca9c:e795 with SMTP id f3-20020ae9ea03000000b006e0ca9ce795mr2195394qkg.168.1666106130833;
        Tue, 18 Oct 2022 08:15:30 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id oo12-20020a05620a530c00b006eeae49537bsm2463598qkn.98.2022.10.18.08.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:15:30 -0700 (PDT)
Message-ID: <6ea6c773372b95ac101ef68511ec2b99af2607c0.camel@ndufresne.ca>
Subject: Re: [PATCH v5 2/4] media: v4l: ctrls: Add a control for HDR mode
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        linux-media@vger.kernel.org
Cc:     alain.volmat@foss.st.com, hugues.fruchet@foss.st.com,
        sylvain.petinot@foss.st.com, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Date:   Tue, 18 Oct 2022 11:15:28 -0400
In-Reply-To: <02b87a0d-651a-1995-cc14-d8ff36a76058@foss.st.com>
References: <20220831090118.104057-1-benjamin.mugnier@foss.st.com>
         <20220831090118.104057-3-benjamin.mugnier@foss.st.com>
         <9f7e07991c509b3179ea3c4c8def5e6e19f508e2.camel@ndufresne.ca>
         <02b87a0d-651a-1995-cc14-d8ff36a76058@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le jeudi 15 septembre 2022 =C3=A0 09:29 +0200, Benjamin MUGNIER a =C3=A9cri=
t=C2=A0:
> Hi Nicolas,
>=20
> Thank you for your review.
>=20
> On 9/12/22 17:51, Nicolas Dufresne wrote:
> > Hi Benjamin,
> >=20
> > Le mercredi 31 ao=C3=BBt 2022 =C3=A0 11:01 +0200, Benjamin Mugnier a =
=C3=A9crit=C2=A0:
> > > Add V4L2_CID_HDR_MODE as a menu item control to set the HDR mode of t=
he
> > > sensor, and its documentation.
> > > Menu items are not standardized as they differ for each sensors.
> > >=20
> > > Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> > > ---
> > >  .../userspace-api/media/v4l/ext-ctrls-camera.rst          | 8 ++++++=
++
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 2 ++
> > >  include/uapi/linux/v4l2-controls.h                        | 2 ++
> > >  3 files changed, 12 insertions(+)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.r=
st b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > index 4c5061aa9cd4..0ee09ff250e7 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > @@ -661,3 +661,11 @@ enum v4l2_scene_mode -
> > >  .. [#f1]
> > >     This control may be changed to a menu control in the future, if m=
ore
> > >     options are required.
> > > +
> > > +``V4L2_CID_HDR_MODE (menu)``
> >=20
> > Perhaps try to make this more sensor specific in it name ?
> > V4L2_CID_HDR_SENSOR_MODE ?
> >=20
>=20
> No problem, queued for v6. Thank you.
>=20
> > > +    Change the sensor HDR mode. A HDR picture is obtained by merging=
 two
> > > +    captures of the same scene using two different exposure periods.=
 HDR mode
> > > +    describes the way these two captures are merged in the sensor.
> > > +
> > > +    As modes differ for each sensor, menu items are not standardized=
 by this
> > > +    control and are left to the programmer.
> >=20
> > I do have concern about this approach. Can you clarify ?
> >=20
>=20
> Sure! This is the implementation of Sakari's excellent idea from v3 which=
 you can read here:
> https://lore.kernel.org/linux-media/YwNcUpsw1psudCOC@paasikivi.fi.intel.c=
om/
>=20
> The control name is standardized as a menu type, but values of the menu o=
r not. The driver developer has to provide them by himself in its driver wh=
en adding the control. This is pretty versatile as hdr modes differ from on=
e sensor to another (at least for my cases).
> For the vgxy61 I defined these hdr modes in the driver file:
>=20
> +static const char * const vgxy61_hdr_mode_menu[] =3D {
> +	"HDR linearize",
> +	"HDR substraction",
> +	"No HDR",
> +};
>=20
> and added these elements to the V4L2_CID_HDR_MODE control with a std_menu=
_items in the vgxy61_init_controls function:
>=20
> +	v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_HDR_MODE,
> +				     ARRAY_SIZE(vgxy61_hdr_mode_menu) - 1, 0,
> +				     VGXY61_NO_HDR, vgxy61_hdr_mode_menu);
>=20
> I hope this is clearer.
> This implementation can of course be discussed. Tell me what you think.

Just food for the mind, this is going to be HW specific. If we go that way,=
 I'd
like to adopt a rule similar to DRM, that for these type of controls there =
must
be an Open Source userland users of it. I'm sure you'd have no issue with t=
hat.

The downside is that we no longer have a place to extend on the HW specific
documentation/knowledge, which often endup lost. How is that approach bette=
r
then having multiple vendor controls ? (Perhaps there is family of censors =
that
could possibly share some of the controls and we'd have a common place to
document the exact meaning of the menu items).

>=20
>=20
> Regards,
>=20
> Benjamin
>=20
> > regards,
> > Nicolas
> >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-defs.c
> > > index e22921e7ea61..0854de1ef1a5 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > @@ -1043,6 +1043,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > >  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
> > >  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
> > >  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotatio=
n";
> > > +	case V4L2_CID_HDR_MODE:			return "HDR mode";
> > > =20
> > >  	/* FM Radio Modulator controls */
> > >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > > @@ -1370,6 +1371,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, =
enum v4l2_ctrl_type *type,
> > >  	case V4L2_CID_STATELESS_H264_START_CODE:
> > >  	case V4L2_CID_CAMERA_ORIENTATION:
> > >  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
> > > +	case V4L2_CID_HDR_MODE:
> > >  		*type =3D V4L2_CTRL_TYPE_MENU;
> > >  		break;
> > >  	case V4L2_CID_LINK_FREQ:
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/=
v4l2-controls.h
> > > index 5f46bf4a570c..5dfd38b09768 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -1013,6 +1013,8 @@ enum v4l2_auto_focus_range {
> > > =20
> > >  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE=
+35)
> > > =20
> > > +#define V4L2_CID_HDR_MODE			(V4L2_CID_CAMERA_CLASS_BASE+36)
> > > +
> > >  /* FM Modulator class control IDs */
> > > =20
> > >  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> >=20

