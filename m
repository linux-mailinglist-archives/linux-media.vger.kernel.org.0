Return-Path: <linux-media+bounces-57715-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MjSAI5sy2mfHgYAu9opvQ
	(envelope-from <linux-media+bounces-57715-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:41:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD5C364906
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70B2A302710A
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 06:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9903A6F02;
	Tue, 31 Mar 2026 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pzaDK6nI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1803806DC
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 06:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939227; cv=none; b=ijmxQ1tHIh+akeL9lkL5TJDT/oAqSeTQleBzdLUdNGPNhBlaB0RtiQwbI57su0jHVhyGJ+/iCda+dZKmx0f6ml2Z5x1fqbF5fWNXQk1hFBfbERn56EPbMm1TNkRYIMXCWG7lZC1bLhSXUXl/jn67Pfvii3kYtvCtv4sBs74Ys6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939227; c=relaxed/simple;
	bh=d20iNc4JOX3+sdGhsRgSEAcmuojvb+kbSLCOZiGzMFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M983cuOJiYev5VU+8A5ObJZe+Il/JqVQZFYiNGhdP8D0aMOA+Mwp0G/LJNIIyt3MaQmOkj1l+D2x+deDMaFqkGqyFD7G3Iq/nATwKKlbxCz2eoglVRCbdEOPjv5oc65wkUVsqjyecPld2mIdojRXvxA50lxXyEaNzgl2tuCriOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pzaDK6nI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7804C156F;
	Tue, 31 Mar 2026 08:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774939139;
	bh=d20iNc4JOX3+sdGhsRgSEAcmuojvb+kbSLCOZiGzMFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzaDK6nID2ZHzQLf1Y1OK07RcjX3lPgeS994azkScV4VAA6YbArIG/BIUKb4nshK8
	 +9ygEamTPSSGEFtIqil2rLZgteZQx4AV1fH4ZCcxmZS5j23j59WjH0rRbxVcmqMLaq
	 ZRZS7fWbD/5YaZLdhekfoXla60+u90+zKhAxw1Zo=
Date: Tue, 31 Mar 2026 08:40:18 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 44/66] media: uapi: Add controls for sub-sampling
 configuration
Message-ID: <actrIRy65KweLfS7@zed>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-45-sakari.ailus@linux.intel.com>
 <9f56a4ee-150a-44a8-8473-a17931443b30@foss.st.com>
 <acVkqiSPLAWrOv4A@kekkonen.localdomain>
 <51d3cb55-b0d3-4968-9871-b7cc646e731f@foss.st.com>
 <acqivj1Oc-LIDUrm@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acqivj1Oc-LIDUrm@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57715-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[foss.st.com,vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim,ideasonboard.com:email,st.com:url]
X-Rspamd-Queue-Id: 4FD5C364906
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello

On Mon, Mar 30, 2026 at 07:20:14PM +0300, Sakari Ailus wrote:
> Hi Benjamin,
>
> On Mon, Mar 30, 2026 at 05:00:44PM +0200, Benjamin Mugnier wrote:
> > Hi Sakari
> >
> > Le 26/03/2026 à 17:54, Sakari Ailus a écrit :
> > > Hi Benjamin,
> > >
> > > On Thu, Mar 26, 2026 at 05:05:47PM +0100, Benjamin Mugnier wrote:
> > >> Hi Sakari,
> > >>
> > >> I'm so late to the party I'm afraid the door might already be closed :)
> > >
> > > The patches aren't merged so it's still possible to change things...
> > >
> > >>
> > >> Le 25/08/2025 à 11:50, Sakari Ailus a écrit :
> > >>> Sub-sampling is a way to decrease the data rates after the pixel array by
> > >>> systematically discarding some samples, either vertically or horizontally
> > >>> or both. Add two controls for the purpose and document them. The
> > >>> sub-sampling configuration is taken into account in the compose rectangle.
> > >>>
> > >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > >>> ---
> > >>>  .../media/drivers/camera-sensor.rst              | 16 +++++++++++++---
> > >>>  .../userspace-api/media/v4l/ext-ctrls-camera.rst | 11 +++++++++++
> > >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c        |  2 ++
> > >>>  include/uapi/linux/v4l2-controls.h               |  2 ++
> > >>>  4 files changed, 28 insertions(+), 3 deletions(-)
> > >>>
> > >>> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > >>> index ef1f51862980..b0ad0d778396 100644
> > >>> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > >>> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > >>> @@ -120,8 +120,8 @@ values programmed by the register sequences. The default values of these
> > >>>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> > >>>  independently of the sensor's mounting rotation.
> > >>>
> > >>> -Binning
> > >>> --------
> > >>> +Binning and sub-sampling
> > >>> +------------------------
> > >>>
> > >>>  Binning has traditionally been configured using :ref:`the compose selection
> > >>>  rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> > >>> @@ -130,7 +130,17 @@ users should use it when it's available. Drivers supporting the control shall
> > >>>  also support the compose rectangle, albeit the rectangle may be read-only when
> > >>>  the control is present.
> > >>>
> > >>> -Binning isn't affected by flipping.
> > >>> +Sub-sampling is often supported as part of a camera sensor's binning
> > >>> +functionality and performed after the binning operation. Sub-sampling typically
> > >>> +produces quality-wise worse results than binning. Sub-sampling factors are
> > >>> +independent horizontally and vertically and they are controlled using two
> > >>> +controls, :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> > >>> +V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`. In
> > >>> +sub-sampling, the image size before sub-sampling is horizontally and vertically
> > >>> +divided by the respective sub-sampling factors. Drivers supporting the control shall
> > >>> +also reflect the sub-sampling configuration in the compose rectangle.
> > >>> +
> > >>> +Binning and sub-sampling aren't affected by flipping.
> > >>>
> > >>>  .. _media_using_camera_sensor_drivers_embedded_data:
> > >>>
> > >>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > >>> index 18b484ff5d75..577b73045bee 100644
> > >>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > >>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > >>> @@ -701,3 +701,14 @@ enum v4l2_scene_mode -
> > >>>
> > >>>  For instance, a value of ``0x0001000300020003`` indicates binning by 3
> > >>>  (horizontally) * 3/2 (vertically).
> > >>> +
> > >>> +.. _v4l2-cid-camera-sensor-subsampling:
> > >>> +
> > >>> +``V4L2_CID_SUBSAMPLING_HORIZONTAL`` and ``V4L2_CID_SUBSAMPLING_VERTICAL``
> > >>> +(integer)
> > >>> +
> > >>> +    Horizontal and vertical subsampling factors.
> > >>> +
> > >>> +    Sub-sampling is used to downscale an image, horizontally and vertically, by
> > >>> +    discarding a part of the image data. Typically sub-sampling produces lower
> > >>> +    quality images than binning.
> > >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > >>> index 5e1c28850e87..9f8816bfffbe 100644
> > >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > >>> @@ -1088,6 +1088,8 @@ const char *v4l2_ctrl_get_name(u32 id)
> > >>>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
> > >>>  	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
> > >>>  	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
> > >>> +	case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Sub-Sampling Factor, Horizontal";
> > >>> +	case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Sub-Sampling Factor, Vertical";
> > >>
> > >> I applied this patch in my tree and I'm currently implementing binning
> > >> and sub-sampling support for the vd55g1. First of all, thank you for
> > >> your work.
> > >>
> > >> The vd55g1 camera sensor only performs sub-sampling in both horizontal
> > >> and vertical axes at the same time, no decoupling. For now I  modified
> > >> the patch to have a single control handling sub-sampling as a whole.
> > >> Maybe there is a more idiomatic way to approach this kind of problem
> > >> that I might have missed ? Kind of 'linking' controls together if that
> > >> make sense.
> > >>
> > >> I'm unusure if having both sub-sampling axes tied together is common
> > >> behavior among camera sensors or not. Do you think this is something
> > >> worth addressing in the serie ?
> > >
> > > The reason a single control was added for the purpose was that it does
> > > allow for implementations that tie horizontal and vertical binning factors.
> > > I'm not sure which one is more common but both can be supported this way.
> > > Untied factors typically means having a large number of options though.
> > >
> > > In CCS horizontal and vertical binning are related, too.
> > >
> > > How many options do you have for each?
> > >
> >
> > I have binning x2 and x4, and subsampling x2, x4, and x8. But I only
> > care for x2 for both at the moment. You can find more at H.2.53
> > READOUT_CTRL in the user manual [1].
>
> I think I misread your explanation earlier, missing two perhaps impotant
> letters "d" and "e". Another option would be to implement a third
> sub-sampling control that would apply to both directions: this is about
> controlling the sensor only so I don't see this being an issue.
>
> Controls are a bit awkward when it comes to direct dependencies.

Can't a driver that has its vertical/horizontal binning factors
coupled together use v4l2_ctrl_cluster() on V4L2_CID_SUBSAMPLING_HORIZONTAL
and V4L2_CID_SUBSAMPLING_VERTICAL ?

Thanks
   j

>
> >
> > I came up with something like this :
> >
> >   case V4L2_CID_BINNING_FACTORS:
> >     if (ctrl->val != ctrl->cur.val) {
> >       sensor->subsampling_h_ctrl->cur.val = 1;
> >       sensor->subsampling_h_ctrl->val = 1;
> >       sensor->subsampling_v_ctrl->cur.val = 1;
> >       sensor->subsampling_v_ctrl->val = 1;
> >     }
> >     break;
> >   case V4L2_CID_SUBSAMPLING_HORIZONTAL:
> >     if (ctrl->val != ctrl->cur.val) {
> >       sensor->binning_ctrl->cur.val = 0;
> >       sensor->binning_ctrl->val = 0;
> >       sensor->subsampling_v_ctrl->cur.val = ctrl->val;
> >       sensor->subsampling_v_ctrl->val = ctrl->val;
> >     }
> >     break;
> >   case V4L2_CID_SUBSAMPLING_VERTICAL:
> >     if (ctrl->val != ctrl->cur.val) {
> >       sensor->binning_ctrl->cur.val = 0;
> >       sensor->binning_ctrl->val = 0;
> >       sensor->subsampling_h_ctrl->cur.val = ctrl->val;
> >       sensor->subsampling_h_ctrl->val = ctrl->val;
> >     }
> >     break;
> >
> > Allowing to reset the binning if the sub subsampling is set or the other
> > way around, and tying both sub samplings together.
> >
> > I don't find it very elegant but it works. Are we fine with this kind of
> > code for sensors having these restrictions ? As you may have guessed
> > they applies for most ST cameras.
> >
> >
> > [1]
> > https://www.st.com/resource/en/user_manual/um3224-how-to-integrate-and-configure-the-vd55g1-sensor-stmicroelectronics.pdf
>
> --
> Kind regards,
>
> Sakari Ailus

