Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4958CB0DF3
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 13:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731106AbfILLfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 07:35:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42564 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730923AbfILLfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 07:35:20 -0400
Received: from [IPv6:2001:8a0:6c2f:b301:66f4:e6a0:633:7a5e] (unknown [IPv6:2001:8a0:6c2f:b301:66f4:e6a0:633:7a5e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ezequiel)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B00F728A88C;
        Thu, 12 Sep 2019 12:35:16 +0100 (BST)
Message-ID: <9d7cb0caf39aa4704e5d83fab56a65b305c5b924.camel@collabora.com>
Subject: Re: [PATCH 0/4] Enable Hantro G1 post-processor
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>
Date:   Thu, 12 Sep 2019 12:35:12 +0100
In-Reply-To: <CAAFQd5CKkdN0byeAonPvvzmHQ5CRXLRVidAG8FGmxExHzgvaqA@mail.gmail.com>
References: <20190903181711.7559-1-ezequiel@collabora.com>
         <CAAFQd5AdikoN+7TG=0ZGFkSzaK2UFHM4VG7SYtfUtmjQgD61zA@mail.gmail.com>
         <6e493142690d48ee7e65c1cb2a4d6aec1e3b671b.camel@collabora.com>
         <c7b62640ae0e57a9da0c6c5245b5454af08ad2a0.camel@ndufresne.ca>
         <CAAFQd5CKkdN0byeAonPvvzmHQ5CRXLRVidAG8FGmxExHzgvaqA@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-09-12 at 14:52 +0900, Tomasz Figa wrote:
> On Thu, Sep 12, 2019 at 4:49 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> > Le mercredi 11 septembre 2019 à 09:27 +0100, Ezequiel Garcia a écrit :
> > > On Mon, 2019-09-09 at 16:07 +0900, Tomasz Figa wrote:
> > > > Hi Ezequiel,
> > > > 
> > > > On Wed, Sep 4, 2019 at 3:17 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > > > Hi all,
> > > > > 
> > > > > This series enables the post-processor support available
> > > > > on the Hantro G1 VPU. The post-processor block can be
> > > > > pipelined with the decoder hardware, allowing to perform
> > > > > operations such as color conversion, scaling, rotation,
> > > > > cropping, among others.
> > > > > 
> > > > > The decoder hardware needs its own set of NV12 buffers
> > > > > (the native decoder format), and the post-processor is the
> > > > > owner of the CAPTURE buffers. This allows the application
> > > > > get processed (scaled, converted, etc) buffers, completely
> > > > > transparently.
> > > > > 
> > > > > This feature is implemented by exposing other CAPTURE pixel
> > > > > formats to the application (ENUM_FMT). When the application
> > > > > sets a pixel format other than NV12, the driver will enable
> > > > > and use the post-processor transparently.
> > > > 
> > > > I'll try to review the series a bit later, but a general comment here
> > > > is that the userspace wouldn't have a way to distinguish between the
> > > > native and post-processed formats. I'm pretty much sure that
> > > > post-processing at least imposes some power penalty, so it would be
> > > > good if the userspace could avoid it if unnecessary.
> > > > 
> > > 
> > > Hm, that's true, good catch.
> > > 
> > > So, it would be desirable to retain the current behavior of allowing
> > > the application to just set a different pixel format and get
> > > a post-processed frame, transparently.
> > > 
> > > But at the same time, it would be nice if the application is somehow
> > > aware of the post-processing happening. Maybe we can expose a more
> > > accurate media controller topology, have applications enable
> > > the post-processing pipeline explicitly.
> > 
> > How it works on the stateful side is that userspace set the encoding
> > type (the codec), then passes a header (in our case, there will be
> > parsed structures replacing this) first. The driver then configure
> > capture format, giving a hint of the "default" or "native" format. This
> > may or may not be sufficient, but it does work in giving userspace a
> > hint.
> 
> The bad side of that is that we can't handle more than 1 native format.
> 
> For the most backwards-compatible behavior, sorting the results of
> ENUM_FMT according to format preference would allow the applications
> that choose the first format returned that works for them to choose
> the best one.
> 
> For a further improvement, an ENUM_FMT flag that tells the userspace
> that a format is preferred could work.
> 
> That said, modelling the pipeline appropriately using the media
> controller is the idea I like the most, because it's the most
> comprehensive solution. That would have to be well specified and
> documented, though, and sounds like a long term effort.
> 

Completely agreed.

Thanks,
Ezequiel

