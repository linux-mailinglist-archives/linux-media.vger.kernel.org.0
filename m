Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF69620166
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 10:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbfEPIhV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 04:37:21 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51203 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfEPIhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 04:37:21 -0400
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1hRBtA-0003B4-8Q; Thu, 16 May 2019 10:37:20 +0200
Date:   Thu, 16 May 2019 10:37:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pawel Osciak <posciak@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Kamil Debski <kamil@wypas.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Jeongtae Park <jtp.park@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Tiffany Lin (=?UTF-8?B?5p6X5oWn54+K?=)" <tiffany.lin@mediatek.com>,
        "Andrew-CT Chen (=?UTF-8?B?6Zmz5pm66L+q?=)" 
        <andrew-ct.chen@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Todor Tomov <todor.tomov@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dave.stevenson@raspberrypi.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Subject: Re: [PATCH v3 2/2] media: docs-rst: Document memory-to-memory video
 encoder interface
Message-ID: <20190516103715.283face8@litschi.hi.pengutronix.de>
In-Reply-To: <20190514081204.GA132745@chromium.org>
References: <20190124100419.26492-1-tfiga@chromium.org>
 <20190124100419.26492-3-tfiga@chromium.org>
 <20190430193412.4291fca8@litschi.hi.pengutronix.de>
 <20190514081204.GA132745@chromium.org>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 14 May 2019 17:12:04 +0900, Tomasz Figa wrote:
> Hi Michael,
> 
> On Tue, Apr 30, 2019 at 07:34:12PM +0200, Michael Tretter wrote:
> > On Thu, 24 Jan 2019 19:04:19 +0900, Tomasz Figa wrote:  
> 
> [snip]
> 
> > > +State machine
> > > +=============
> > > +
> > > +.. kernel-render:: DOT
> > > +   :alt: DOT digraph of encoder state machine
> > > +   :caption: Encoder state machine
> > > +
> > > +   digraph encoder_state_machine {
> > > +       node [shape = doublecircle, label="Encoding"] Encoding;
> > > +
> > > +       node [shape = circle, label="Initialization"] Initialization;
> > > +       node [shape = circle, label="Stopped"] Stopped;
> > > +       node [shape = circle, label="Drain"] Drain;
> > > +       node [shape = circle, label="Reset"] Reset;
> > > +
> > > +       node [shape = point]; qi
> > > +       qi -> Initialization [ label = "open()" ];
> > > +
> > > +       Initialization -> Encoding [ label = "Both queues streaming" ];
> > > +
> > > +       Encoding -> Drain [ label = "V4L2_DEC_CMD_STOP" ];
> > > +       Encoding -> Reset [ label = "VIDIOC_STREAMOFF(CAPTURE)" ];
> > > +       Encoding -> Stopped [ label = "VIDIOC_STREAMOFF(OUTPUT)" ];
> > > +       Encoding -> Encoding;
> > > +
> > > +       Drain -> Stopped [ label = "All CAPTURE\nbuffers dequeued\nor\nVIDIOC_STREAMOFF(CAPTURE)" ];  
> > 
> > Shouldn't this be
> > 
> > 	Drain -> Stopped [ label = "All OUTPUT\nbuffers dequeued\nor\nVIDIOC_STREAMOFF(OUTPUT)" ];
> > 
> > ? While draining, the encoder continues encoding until all source
> > buffers, i.e., buffers in the OUTPUT queue, are encoded or STREAMOFF
> > happens on the OUTPUT queue. At the same time, the client continues to
> > queue and dequeue buffers on the CAPTURE queue and there might be
> > buffers queued on the CAPTURE queue even if the driver returned the
> > buffer with the FLAG_LAST set and returns -EPIPE on further DQBUF
> > requests.
> >  
> 
> The STREAMOFF should be on OUTPUT indeed, because that immediately
> removes any OUTPUT buffers from the queue, so there is nothing to be
> encoded to wait for anymore.
> 
> The "All OUTPUT buffers dequeued" part is correct, though. The last
> OUTPUT buffer in the flush sequence is considered encoded after the
> application dequeues the corresponding CAPTURE buffer is dequeued and
> that buffer is marked with the V4L2_BUF_FLAG_LAST flag.

I understand. As the application continues to queue and dequeue buffers
on the CAPTURE queue until it received the last CAPTURE buffer and cannot
dequeue further CAPTURE buffers, "All CAPTURE buffers dequeued" is
correct. Thanks for the clarification.

Michael

> 
> Best regards,
> Tomasz
> 
