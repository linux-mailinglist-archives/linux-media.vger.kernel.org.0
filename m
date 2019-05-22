Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDA225EAC
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 09:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbfEVH3a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 03:29:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53870 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfEVH33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 03:29:29 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4A02E260E09;
        Wed, 22 May 2019 08:29:28 +0100 (BST)
Date:   Wed, 22 May 2019 09:29:24 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Thierry Reding <thierry.reding@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190522092924.116b212e@collabora.com>
In-Reply-To: <CAAFQd5Cmv-CJAsQ7QdoEPYyCFLDjAJjFFLo8PMZT=zeOumnkmQ@mail.gmail.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
        <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
        <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
        <20190521154358.GC7098@ulmo>
        <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
        <CAAFQd5Cmv-CJAsQ7QdoEPYyCFLDjAJjFFLo8PMZT=zeOumnkmQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 22 May 2019 15:39:37 +0900
Tomasz Figa <tfiga@chromium.org> wrote:

> > It would be premature to state that we are excluding. We are just
> > trying to find one format to get things upstream, and make sure we have
> > a plan how to extend it. Trying to support everything on the first try
> > is not going to work so well.
> >
> > What is interesting to provide is how does you IP achieve multi-slice
> > decoding per frame. That's what we are studying on the RK/Hantro chip.
> > Typical questions are:
> >
> >   1. Do all slices have to be contiguous in memory
> >   2. If 1., do you place start-code, AVC header or pass a seperate index to let the HW locate the start of each NAL ?
> >   3. Does the HW do support single interrupt per frame (RK3288 as an example does not, but RK3399 do)  
> 
> AFAICT, the bit about RK3288 isn't true. At least in our downstream
> driver that was created mostly by RK themselves, we've been assuming
> that the interrupt is for the complete frame, without any problems.

I confirm that's what happens when all slices forming a frame are packed
in a single output buffer: you only get one interrupt at the end of the
decoding process (in that case, when the frame is decoded). Of course,
if you split things up and do per-slice decoding instead (one slice per
buffer) you get an interrupt per slice, though I didn't manage to make
that work.
I get a DEC_BUFFER interrupt (AKA, "buffer is empty but frame is not
fully decoded") on the first slice and an ASO (Arbitrary Slice Ordering)
interrupt on the second slice, which makes me think some states are
reset between the 2 operations leading the engine to think that the
second slice is part of a new frame.

Anyway, it doesn't sound like a crazy idea to support both per-slice
and per-frame decoding and maybe have a way to expose what a
specific codec can do (through an extra cap mechanism).
The other option would be to support only per-slice decoding with a
mandatory START_FRAME/END_FRAME sequence to let drivers for HW that
only support per-frame decoding know when they should trigger the
decoding operation. The downside is that it implies having a bounce
buffer where the driver can pack slices to be decoded on the END_FRAME
event.

