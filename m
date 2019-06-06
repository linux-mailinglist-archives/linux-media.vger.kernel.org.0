Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147CD36CB7
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 08:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfFFG7d convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 6 Jun 2019 02:59:33 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55812 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfFFG7d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 02:59:33 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AB56C263955;
        Thu,  6 Jun 2019 07:59:30 +0100 (BST)
Date:   Thu, 6 Jun 2019 08:59:28 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH RFC 5/6] media: cedrus: Make the slice_params array size
 limitation more explicit
Message-ID: <20190606085928.5555fa0d@collabora.com>
In-Reply-To: <7d1512239f13280195af995c112b4bda52c4b609.camel@bootlin.com>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
        <20190603110946.4952-6-boris.brezillon@collabora.com>
        <1764986.tDiRxPxGAQ@jernej-laptop>
        <0fbe395c644bfba4830e98d208c143b8a265498a.camel@ndufresne.ca>
        <20190604081210.GA9048@ulmo>
        <cb3dff3942ba0468e65855cfdc35e92611bb5c82.camel@ndufresne.ca>
        <7d1512239f13280195af995c112b4bda52c4b609.camel@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 05 Jun 2019 23:01:37 +0200
Paul Kocialkowski <paul.kocialkowski@bootlin.com> wrote:

> Hi,
> 
> Le mardi 04 juin 2019 à 10:31 -0400, Nicolas Dufresne a écrit :
> > Le mardi 04 juin 2019 à 10:12 +0200, Thierry Reding a écrit :  
> > > On Mon, Jun 03, 2019 at 07:55:48PM -0400, Nicolas Dufresne wrote:  
> > > > Le lundi 03 juin 2019 à 23:48 +0200, Jernej Škrabec a écrit :  
> > > > > Dne ponedeljek, 03. junij 2019 ob 13:09:45 CEST je Boris Brezillon napisal(a):  
> > > > > > The driver only supports per-slice decoding, and in that mode
> > > > > > decode_params->num_slices must be set to 1 and the slice_params array
> > > > > > should contain only one element.  
> > > > > 
> > > > > What Cedrus actually needs to know is if this is first slice in frame or not. I 
> > > > > imagine it resets some stuff internally when first slice is processed.
> > > > > 
> > > > > So if driver won't get all slices of one frame at once, it can't know if this 
> > > > > is first slice in frame or not. I guess we need additional flag for this.  
> > > > 
> > > > A first slice of a frame comes with a new timestamp, so you don't need
> > > > a flag for that.  
> > > 
> > > But slices for the same frame will all have the same timestamp, so we
> > > can't use the timestamp to tell the individual slices apart.
> > > 
> > > I mentioned this in that other thread, but I think it'd be useful to
> > > pass along the number of each of the slices. Drivers can use this in
> > > order to conceal errors when corrupt slices are detected during the
> > > decode operation.  
> > 
> > This is already passed as this is part of the slice header that we both
> > pass and parse to structure. Each slice have it's first MB indicated
> > (that standard to H264) and you can deduce the lost slice from that.
> >   
> > > So if we also passed a slice index along with the offset of the slice in
> > > the bitstream, that should give us enough information to achieve both. A
> > > slice with index 0 is obviously going to be the first slice in a frame.  
> > 
> > We do this in per-frame mode only. The offset of the slice in the
> > bitstream is always 0 in per-slice mode, since each v4l2 input buffer
> > is a slice.  
> 
> I don't think we need a slice index either, we most likely already have
> enough information to know where we're at regarding slices position.
> 
> But how about allowing an arbitrary number of slices within frame
> boundary in per-slice decoding mode?

Yep, will send a v2 taking that case into consideration.
