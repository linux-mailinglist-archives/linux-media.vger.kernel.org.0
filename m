Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1E11C8D89
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 16:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgEGOGN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 10:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbgEGOGN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 10:06:13 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF1BC05BD43
        for <linux-media@vger.kernel.org>; Thu,  7 May 2020 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=VdMq/Jc7qCK1txecCcqfPFUFad+GzEPdwS+Cdig9ARE=; b=GafhsXpWf7nec1WgDx5zoTea0V
        XcoaJ0nwre6dEwF02YkufHpl1aIMEdmHc4stcKlvshEHs93tdtsXznmrnGrPIm5Has30xjzQFTIbd
        0RK3yPNrLbDiIdYAdlsSzD0NT8+d8gM8Wyyv8sSI2tu3EdbC/9/9hdhJAZ5XcTmxOY5EyXntgpQqn
        3+JoLyhL6BsMfXcGUnLRMUvbYIasz/QYkOKGaxy2dRBwTiDU+NZZLUE0PQoh1yE+f1iLUdi1SP5Lh
        595FMxf9/3nKspvS/xi6sz/gIbidFWOl8eD0BnMQu9Sfe1sJ+K5HKDsOSt/IyGLgIEExG/QJbTje2
        ilBP7/MA==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWh9z-0002UW-Nd; Thu, 07 May 2020 14:06:00 +0000
Date:   Thu, 7 May 2020 16:05:54 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH v9 02/11] media: v4l2-ctrl: Document
 V4L2_CID_CAMERA_SENSOR_LOCATION
Message-ID: <20200507160530.21cf5922@coco.lan>
In-Reply-To: <20200507123649.q3ecciyxulzisn62@uno.localdomain>
References: <20200417124110.72313-1-jacopo@jmondi.org>
        <20200417124110.72313-3-jacopo@jmondi.org>
        <20200505140206.589f54ae@coco.lan>
        <a5d77790-5f98-650e-cfb9-a97b8701454d@xs4all.nl>
        <20200505165826.1ce8bb0d@coco.lan>
        <b3e211da-b9f6-a65c-4453-c11b05bced45@xs4all.nl>
        <20200506113909.1489bd1e@coco.lan>
        <20200506110730.rvhxoh74u3rmemtw@uno.localdomain>
        <20200506132847.03860fce@coco.lan>
        <20200507123649.q3ecciyxulzisn62@uno.localdomain>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 7 May 2020 14:36:49 +0200
Jacopo Mondi <jacopo@jmondi.org> escreveu:

> Hi Mauro,
> 
> On Wed, May 06, 2020 at 01:28:47PM +0200, Mauro Carvalho Chehab wrote:
> > Em Wed, 6 May 2020 13:07:30 +0200
> > Jacopo Mondi <jacopo@jmondi.org> escreveu:
> >  
> > > > So, if that would be ok for you, I can live with a
> > > >
> > > > V4L2_CID_CAMERA_VIEWING_ANGLE (or some similar name) that will
> > > > specify the angle where the sensor is mounted (for fixed sensors),
> > > > or the current angle, in case of movable ones, being RO for fixed
> > > > sensors and RW for movable ones.
> > > >
> > > > Let's postpone discussions for a LOCATION control once this
> > > > would be needed by some driver.  
> > >
> > > Would V4L2_CID_CAMERA_ORIENTATION work ?  
> >
> > Yeah, either V4L2_CID_CAMERA_ORIENTATION or CID_LENS_FACING would
> > equally work (although I would prefer the one with a shorter name).
> >  
> 
> Yeah, CID_LENS_FACING is nice and shorter, but I would refrain from
> polluting the LENS_ namespace, this control applies to the whole camera
> module, so I would keep it in the CAMERA_ namespace... And
> 'orientation' gives a nice match with the DT property, which I would
> not call 'facing' or 'facing_side' as 'orientation' seems more
> appropriate as a dt-property name to me..

Ok. V4L2_CID_CAMERA_ORIENTATION works for me.

Thanks,
Mauro
