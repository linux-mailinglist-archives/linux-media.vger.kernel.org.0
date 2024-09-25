Return-Path: <linux-media+bounces-18552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F1498636B
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 17:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3636C1F277C9
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 15:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC07186616;
	Wed, 25 Sep 2024 15:07:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E591865F7
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276862; cv=none; b=QIuxhb9mqP7NmB5V9LcESkYkLgFu1sUzZ3DeesXSiGVBpcvqMuNGPXvPIbxhKJfoBhSqNeeWrmTtlb5kuoipk4K3tmOvyKsguYJgWo+HGK5XVzkzC/Vb/T/LcFCfTgD3HLgFfBKnJdhKuiGUgb6jjH3l1Gr0aYDdxlLdFAw8pHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276862; c=relaxed/simple;
	bh=8GfBUdOg/QSvr9uhZROpCY6GPCwtP46GQFOUZHOoOrc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dYxNLUggr14y2lV9Ab5F/tHoyxYEd218VlVIRCnt2AmtaJgDWZo+xmf4zk9BbTSyesVqngdFNMRNpVXy29pVCzGOnwH9C1ZBirWYrD1RwNynuutYSnvbDNtDfXOXO629cJc/I+50EDoxzNL+YNOdcorbBggosl4KmlAxMT4TXm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1stTbx-0005WS-Gp; Wed, 25 Sep 2024 17:07:25 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1stTbw-001Tgc-Qq; Wed, 25 Sep 2024 17:07:24 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1stTbw-000MKv-2P;
	Wed, 25 Sep 2024 17:07:24 +0200
Message-ID: <f894eb3fd132a214ddbf2fa3ed405d065e629398.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Wed, 25 Sep 2024 17:07:24 +0200
In-Reply-To: <3e850259-9349-4215-947a-ce192fa95f14@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
	 <20240724002044.112544-2-marex@denx.de>
	 <a66a2eaf30e21ff7c87f140e97ed4639640121ba.camel@pengutronix.de>
	 <3e850259-9349-4215-947a-ce192fa95f14@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi,

On Di, 2024-09-24 at 17:28 +0200, Marek Vasut wrote:
> On 9/6/24 11:01 AM, Philipp Zabel wrote:
[...]
> > Instead of presenting two devices to userspace, it would be better to
> > have a single video device that can distribute work to both IPUs.
>=20
> Why do you think so ?

The scaler/colorspace converter supports frames larger than the
1024x1024 hardware by splitting each frame into multiple tiles. It
currently does so sequentially on a single IC. Speed could be improved
by distributing the tiles to both ICs. This is not an option anymore if
there are two video devices that are fixed to one IC each.

The same would be possible for the deinterlacer, e.g. to support 720i
frames split into two tiles each sent to one of the two VDICs.

> I think it is better to keep the kernel code as simple as possible, i.e.=
=20
> provide the device node for each m2m device to userspace and handle the=
=20
> m2m device hardware interaction in the kernel driver, but let userspace=
=20
> take care of policy like job scheduling, access permissions assignment=
=20
> to each device (e.g. if different user accounts should have access to=20
> different VDICs), or other such topics.

I both agree and disagree with you at the same time.

If the programming model were more similar to DRM, I'd agree in a
heartbeat. If the kernel driver just had to do memory/fence handling
and command submission (and parameter sanitization, because there is no
MMU), and there was some userspace API on top, it would make sense to
me to handle parameter calculation and job scheduling in a hardware
specific userspace driver that can just open one device for each IPU.

With the rigid V4L2 model though, where memory handling, parameter
calculation, and job scheduling of tiles in a single frame all have to
be hidden behind the V4L2 API, I don't think requiring userspace to
combine multiple mem2mem video devices to work together on a single
frame is feasible.

Is limiting different users to the different deinterlacer hardware
units a real usecase? I saw the two ICs, when used as mem2mem devices,
as interchangeable resources.

> > To be fair, we never implemented that for the CSC/scaler mem2mem device
> > either.
>=20
> I don't think that is actually a good idea. Instead, it would be better=
=20
> to have two scaler nodes in userspace.

See above, that would make it impossible (or rather unreasonably
complicated) to distribute work on a single frame to both IPUs.

[...]
> > > +	ipu_cpmem_set_buffer(priv->vdi_out_ch,  0, out_phys);
> > > +	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys + phys_offset)=
;
> > > +	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, curr_phys);
> > > +	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys + phys_offset)=
;
> >=20
> > This always outputs at a frame rate of half the field rate, and only
> > top fields are ever used as current field, and bottom fields as
> > previous/next fields, right?
>=20
> Yes, currently the driver extracts 1 frame from two consecutive incoming=
=20
> fields (previous Bottom, and current Top and Bottom):
>=20
> (frame 1 and 3 below is omitted)
>=20
>      1  2  3  4
> ...|T |T |T |T |...
> ...| B| B| B| B|...
>       | ||  | ||
>       '-''  '-''
>        ||    ||
>        ||    \/
>        \/  Frame#4
>      Frame#2
>=20
> As far as I understand it, this is how the current VDI implementation=20
> behaves too, right ?

Yes, that is a hardware limitation when using the direct CSI->VDIC
direct path. As far as I understand, for each frame (two fields) the
CSI only sends the first ("PREV") field directly to the VDIC, which
therefor can only be run in full motion mode (use the filter to add in
the missing lines).
The second ("CUR") field is just ignored. It could be written to RAM
via IDMAC output channel 13 (IPUV3_CHANNEL_VDI_MEM_RECENT), which can
not be used by the VDIC in direct mode. So this is not implemented.

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/staging/media/imx/imx-media-vdic.c#n207

That code is unused. The direct hardware path doesn't use
IPUV3_CHANNEL_MEM_VDI_PREV/CUR/NEXT, but is has a similar effect, half
of the incoming fields are dropped. The setup is vdic_setup_direct().

> > I think it would be good to add a mode that doesn't drop the
> >=20
> > 	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys);
> > 	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, prev_phys + phys_offset);
> > 	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys);
> >=20
> > output frames, right from the start.
>=20
> This would make the VDI act as a frame-rate doubler, which would spend a=
=20
> lot more memory bandwidth, which is limited on MX6, so I would also like=
=20
> to have a frame-drop mode (i.e. current behavior).
>
> Can we make that behavior configurable ? Since this is a mem2mem device,=
=20
> we do not really have any notion of input and output frame-rate, so I=20
> suspect this would need some VIDIOC_* ioctl ?

That would be good. The situation I'd like to avoid is that this device
becomes available without the full frame-rate mode, userspace then
assumes this is a 1:1 frame converter device, and then we can't add the
full frame-rate later without breaking userspace.

> > If we don't start with that supported, I fear userspace will make
> > assumptions and be surprised when a full rate mode is added later.
>=20
> I'm afraid that since the current VDI already does retain input frame=20
> rate instead of doubling it, the userspace already makes an assumption,=
=20
> so that ship has sailed.

No, this is about the deinterlacer mem2mem device, which doesn't exist
before this series.

The CSI capture path already has configurable framedrops (in the CSI).

> But I think we can make the frame doubling configurable ?

That would be good. Specifically, there must be no guarantee that one
input frame with two fields only produces one deinterlaced output
frame, and userspace should somehow be able to understand this.

This would be an argument against Nicolas' suggestion of including this
in the csc/scaler device, which always must produce one output frame
per input frame.

[...]
> > This maps to VDI_C_MOT_SEL_FULL aka VDI_MOT_SEL=3D2, which is documente=
d
> > as "full motion, only vertical filter is used". Doesn't this completely
> > ignore the previous/next fields and only use the output of the di_vfilt
> > four tap vertical filter block to fill in missing lines from the
> > surrounding pixels (above and below) of the current field?
>=20
> Is there a suitable knob for this or shall I introduce a device specific=
=20
> one, like the vdic_ctrl_motion_menu for the current VDIC direct driver ?
>=20
> If we introduce such a knob, then it is all the more reason to provide=
=20
> one device node per one VDIC hardware instance, since each can be=20
> configured for different motion settings.

As far as I know, there is no such control yet. I don't think this
should be per-device, but per-stream (or even per-frame).

> > I think this should at least be configurable, and probably default to
> > MED_MOTION.
>=20
> I think to be compatible with the current VDI behavior and to reduce=20
> memory bandwidth usage, let's default to the HIGH/full mode. That one=20
> produces reasonably good results without spending too much memory=20
> bandwidth which is constrained already on the MX6, and if the user needs=
=20
> better image quality, they can configure another mode using the V4L2=20
> control.

I'd rather not default to the setting that throws away half of the
input data. Not using frame doubling by default is sensible, but now
that using all three input fields to calculate the output frame is
possible, why not make that the default.

regards
Philipp

