Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 494322E9EC1
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 21:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbhADUUE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 15:20:04 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35372 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbhADUUE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 15:20:04 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 105231F44D7B
Message-ID: <a4bc748f08085e737c29ab175bc85cc73bc81e1a.camel@collabora.com>
Subject: Re: [PATCH 1/3] media: imx: Unregister csc/scaler only if registered
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Date:   Mon, 04 Jan 2021 17:19:15 -0300
In-Reply-To: <d5fb07fd4f96373382d46b7ef88eaf331286e0e0.camel@pengutronix.de>
References: <20201228122131.138454-1-ezequiel@collabora.com>
         <d5fb07fd4f96373382d46b7ef88eaf331286e0e0.camel@pengutronix.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Philipp,

Thanks for the quick review.

On Mon, 2021-01-04 at 18:16 +0100, Philipp Zabel wrote:
> Hi Ezequiel,
> 
> On Mon, 2020-12-28 at 09:21 -0300, Ezequiel Garcia wrote:
> > The csc/scaler device pointer (imxmd->m2m_vdev) is assigned
> > after the imx media device v4l2-async probe completes,
> > therefore we need to check if the device is non-NULL
> > before trying to unregister it.
> > 
> > This can be the case if the non-completed imx media device
> > is unbinded (or the driver is removed), leading to a kernel oops.
> > 
> > Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/staging/media/imx/imx-media-dev.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
> > index 6d2205461e56..b6d5f844ad79 100644
> > --- a/drivers/staging/media/imx/imx-media-dev.c
> > +++ b/drivers/staging/media/imx/imx-media-dev.c
> > @@ -107,10 +107,14 @@ static int imx_media_remove(struct platform_device *pdev)
> >  
> >         v4l2_info(&imxmd->v4l2_dev, "Removing imx-media\n");
> >  
> > +       if (imxmd->m2m_vdev) {
> 
> Thank you, it's even worse. If imx_media_csc_scaler_device_init() fails
> in imx6_media_probe_complete(), imxmd->m2m_vdev contains an error value.
> 
> So either this should check
> 
>         if (!IS_ERR_OR_NULL(imxmd->m2m_vdev))
> 
> or (probably better) probe_complete should be changed as well.
> 

Good catch. I guess the simplest solution for that is to
clear the m2m_vdev pointer in imx6_media_probe_complete,
if it fails.

Thanks,
Ezequiel

