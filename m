Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190C72316E6
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 02:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730909AbgG2Aoj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 20:44:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49688 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730668AbgG2Aoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 20:44:38 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF24C563;
        Wed, 29 Jul 2020 02:44:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595983476;
        bh=SXwJUww4PLDsTPPWs4BTBzqNum9zhqM0IspNl9R9qwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gYhN/FaqLk8fIj6ntQF/E3ZmkdVD6j+mbXx3ZTuYi/Y6Nqirs/CQTAHAF83+yQA4c
         kuC+/2f9PE2bhrsBA55C8JCbVsGDyt9KUWNwVl4IU3Hb3sMSzR5gGjcTJT+P2NHygk
         ZVjTrepYNJpL/KxMCZq3mywVeCqrYmN9Y+5m232w=
Date:   Wed, 29 Jul 2020 03:44:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "kernel@puri.sm" <kernel@puri.sm>, devel@driverdev.osuosl.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: nxp imx8m CSI drivers
Message-ID: <20200729004426.GA4633@pendragon.ideasonboard.com>
References: <cbfdb81f-9a09-2ad1-4b51-54e10f678358@puri.sm>
 <f4958d19-cc4f-8206-2dc7-e0b084c8970d@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f4958d19-cc4f-8206-2dc7-e0b084c8970d@puri.sm>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Tue, Jul 28, 2020 at 12:36:58PM +0200, Martin Kepplinger wrote:
> On 09.07.20 11:32, Martin Kepplinger wrote:
> > hi linux-media people,
> > 
> > TL-DR: when exactly is "sd->entity.function == MEDIA_ENT_F_VID_MUX"?
> > 
> > 
> > I try to use the camera on our librem5-devkit (imx8mq): I try to use
> > only mainline drivers except for "mxc-mipi-csi2_yav" taken from
> > linux-imx (which we can prepare to submit if a PoC works. This is the
> > tree I'm experimenting with:
> > 
> > https://source.puri.sm/martin.kepplinger/linux-next/-/commits/5.8-rc4/librem5___csi
> > 
> > * "imx7-media-csi" / imx-media-capture / imx-media-utils currently in
> > staging (that should work according to NXP)
> > * ov5640 mainline driver
> > * mxc-mipi-csi2_yav from NXP tree (linux-imx) with
> > v4l2_subdev_video_ops' mipi_csis_g_parm and mipi_csis_s_parm callbacks
> > removed (due to missing API in mainline)
> > 
> > the drivers probe and run but the following fails when trying to use the
> > camera (gstreamer):
> > 
> > in imx-media-utils' imx_media_pipeline_set_stream() the call to
> > v4l2_subdev_call(sd, video, s_stream, 1) returns with 32 (broken pipe)
> > and thus the application that tries to use the camera too.
> > 
> > One problem is definitely the trees' last commit (that I did as a
> > workaround) in this tree that makes the drivers probe but only by
> > ignoring this probably needed check:
> > 
> > imx7-media-csi's imx7_csi_notify_bound() callback implementation gets
> > called during startup. But if (WARN_ON(sd->entity.function !=
> > MEDIA_ENT_F_VID_MUX)) is true so this is the wrong type of subdev (?).
> > 
> > I just want to put this out there and check if the general approach is
> > valid at all and if there's anything that comes to your mind.
> 
> (added Pavel Machek)
> 
> still I'm only on the librem5 Devkit: the situation regarding a tree
> that should use the imx7-media-csi csi_bridge driver hasn't changed, see
> above for the details. The tree I tried now is this one:
> 
> https://source.puri.sm/martin.kepplinger/linux-next/-/commits/5.8-rc7/librem5___csi_ml1
> 
> A tree that includes NXP's csi_bridge and mipi-csi drivers (and camera
> driver) on the other hand works, and I have one based on v5.8-rcX too:
> 
> https://source.puri.sm/martin.kepplinger/linux-next/-/commits/5.8-rc7/librem5___csi_nxp
> 
> Since I want to look into a different camera driver, I might use that
> nxp-drivers tree to work on that, but our goal is obviously to use what
> is already in staging and should work (the csi bridge driver at least).
> In case you know more about the v4l2 details that don't match over
> there, please have a look.

For what it's worth, I'm debugging a complete system memory corruption
with the imx staging camera driver on an i.MX7D, on v5.8-rc6. The issue
didn't occur on v5.7. I however have a fairly large number of custom
patches that I'm in the process of upstreaming on top of mainline for
that driver, so I can't tell yet whether the problem is in my code or in
v5.8-rc6.

I haven't been able to use the staging driver as-is, neither on v5.7 nor
on v5.8-rc6, with the camera sensor I'm working with (a Sony IMX296). I
also get an EPIPE (32) error. Seems there's a reason why this driver is
in staging :-) This however makes debugging more difficult as I can't
test v5.8-rc6 without my custom changes.

As for MEDIA_ENT_F_VID_MUX, the check is about verifying that the device
connected directly to the input of the CSI (*not* MIPI CSI2) is the
video mux that selects between the MIPI CSI2 receiver and the parallel
sensor input. On i.MX7D, this models the "CSI Input MUX Control" bit in
register IOMUXC_GPR_GPR5. On i.MX8M, there seems to be no such mux, as
there seems to be no parallel sensor input. It should thus be safe to
drop the check, but other adjustements to the routing and pipeline
configuration logic in the driver will likely be needed.

-- 
Regards,

Laurent Pinchart
