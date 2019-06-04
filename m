Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2F9341CB
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 10:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfFDI2v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 4 Jun 2019 04:28:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40602 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbfFDI2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 04:28:51 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9763C260CCF;
        Tue,  4 Jun 2019 09:28:49 +0100 (BST)
Date:   Tue, 4 Jun 2019 10:28:46 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH RFC 5/6] media: cedrus: Make the slice_params array size
 limitation more explicit
Message-ID: <20190604102846.7045846d@collabora.com>
In-Reply-To: <20190604081210.GA9048@ulmo>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
        <20190603110946.4952-6-boris.brezillon@collabora.com>
        <1764986.tDiRxPxGAQ@jernej-laptop>
        <0fbe395c644bfba4830e98d208c143b8a265498a.camel@ndufresne.ca>
        <20190604081210.GA9048@ulmo>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 4 Jun 2019 10:12:10 +0200
Thierry Reding <thierry.reding@gmail.com> wrote:

> On Mon, Jun 03, 2019 at 07:55:48PM -0400, Nicolas Dufresne wrote:
> > Le lundi 03 juin 2019 à 23:48 +0200, Jernej Škrabec a écrit :  
> > > Dne ponedeljek, 03. junij 2019 ob 13:09:45 CEST je Boris Brezillon napisal(a):  
> > > > The driver only supports per-slice decoding, and in that mode
> > > > decode_params->num_slices must be set to 1 and the slice_params array
> > > > should contain only one element.  
> > > 
> > > What Cedrus actually needs to know is if this is first slice in frame or not. I 
> > > imagine it resets some stuff internally when first slice is processed.
> > > 
> > > So if driver won't get all slices of one frame at once, it can't know if this 
> > > is first slice in frame or not. I guess we need additional flag for this.  
> > 
> > A first slice of a frame comes with a new timestamp, so you don't need
> > a flag for that.  
> 
> But slices for the same frame will all have the same timestamp, so we
> can't use the timestamp to tell the individual slices apart.

I think Nicolas was suggesting to keep the last decoded slice timestamp
around and check it against the new slice one. If they are different,
that means we are dealing with a new frame, and this slice is the first
in the frame.

> 
> I mentioned this in that other thread, but I think it'd be useful to
> pass along the number of each of the slices. Drivers can use this in
> order to conceal errors when corrupt slices are detected during the
> decode operation.
> 
> So if we also passed a slice index along with the offset of the slice in
> the bitstream, that should give us enough information to achieve both. A
> slice with index 0 is obviously going to be the first slice in a frame.

There's also the ->first_mb_in_slice field which should be 0 for the
first slice and > 0 for others assuming userspace pass slices in order
(might be an issue if we want to support ASO).
