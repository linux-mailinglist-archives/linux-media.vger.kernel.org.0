Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89BD1C8AD3
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 14:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgEGMdk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 08:33:40 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51007 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgEGMdk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 08:33:40 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CDCA82000D;
        Thu,  7 May 2020 12:33:36 +0000 (UTC)
Date:   Thu, 7 May 2020 14:36:49 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH v9 02/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_LOCATION
Message-ID: <20200507123649.q3ecciyxulzisn62@uno.localdomain>
References: <20200417124110.72313-1-jacopo@jmondi.org>
 <20200417124110.72313-3-jacopo@jmondi.org>
 <20200505140206.589f54ae@coco.lan>
 <a5d77790-5f98-650e-cfb9-a97b8701454d@xs4all.nl>
 <20200505165826.1ce8bb0d@coco.lan>
 <b3e211da-b9f6-a65c-4453-c11b05bced45@xs4all.nl>
 <20200506113909.1489bd1e@coco.lan>
 <20200506110730.rvhxoh74u3rmemtw@uno.localdomain>
 <20200506132847.03860fce@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200506132847.03860fce@coco.lan>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, May 06, 2020 at 01:28:47PM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 6 May 2020 13:07:30 +0200
> Jacopo Mondi <jacopo@jmondi.org> escreveu:
>
> > > So, if that would be ok for you, I can live with a
> > >
> > > V4L2_CID_CAMERA_VIEWING_ANGLE (or some similar name) that will
> > > specify the angle where the sensor is mounted (for fixed sensors),
> > > or the current angle, in case of movable ones, being RO for fixed
> > > sensors and RW for movable ones.
> > >
> > > Let's postpone discussions for a LOCATION control once this
> > > would be needed by some driver.
> >
> > Would V4L2_CID_CAMERA_ORIENTATION work ?
>
> Yeah, either V4L2_CID_CAMERA_ORIENTATION or CID_LENS_FACING would
> equally work (although I would prefer the one with a shorter name).
>

Yeah, CID_LENS_FACING is nice and shorter, but I would refrain from
polluting the LENS_ namespace, this control applies to the whole camera
module, so I would keep it in the CAMERA_ namespace... And
'orientation' gives a nice match with the DT property, which I would
not call 'facing' or 'facing_side' as 'orientation' seems more
appropriate as a dt-property name to me..

> >
> > I could:
> > 1) rename dt-proeprty and control to use orientation
> > 2) specify multiple locations could be entered, the first one being
> > the "default" (eg. device turned off) location
> > 3) make am RW control if multiple entries have been specified, a RO
> > otherwise.
> >
> > Ack ?
>
> Yeah, that would work for me.
>
> Thanks,
> Mauro
