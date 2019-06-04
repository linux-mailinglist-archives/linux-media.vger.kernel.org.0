Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97F92342B9
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 11:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfFDJJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 05:09:12 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47987 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfFDJJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 05:09:12 -0400
X-Originating-IP: 90.88.144.139
Received: from aptenodytes (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C005020009;
        Tue,  4 Jun 2019 09:09:07 +0000 (UTC)
Message-ID: <c76e8694ea4f378e82653d1f8bc981f434706223.camel@bootlin.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Tue, 04 Jun 2019 11:09:07 +0200
In-Reply-To: <20190604110527.48d16907@collabora.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <20190603112449.GA30132@ulmo>
         <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
         <20190604085503.GE9048@ulmo> <20190604110527.48d16907@collabora.com>
Organization: Bootlin
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, 2019-06-04 at 11:05 +0200, Boris Brezillon wrote:
> On Tue, 4 Jun 2019 10:55:03 +0200
> Thierry Reding <thierry.reding@gmail.com> wrote:
> 
> > On Mon, Jun 03, 2019 at 02:52:44PM -0400, Nicolas Dufresne wrote:
> > [...]
> > > There is one thing that come up though, if we enable per-frame decoding
> > > on top of per-slice decoder (like Cedrus), won't we force userspace to
> > > always compute l0/l1 even though the HW might be handling that ? Shall
> > > we instead pass the modification list and implement the non-parsing
> > > bits of applying the modifications in the kernel ?  
> > 
> > Applying the modifications is a standard procedure, right? If it's
> > completely driver-agnostic, it sounds to me like the right place to
> > perform the operation is in userspace.
> 
> Well, the counter argument to that is "drivers know better what's
> needed by the HW", and if we want to avoid doing useless work without
> having complex caps checking done in userspace, doing this task
> kenel-side makes sense.

I believe we should also try and alleviate the pain on the user-space
side by having these decoder-specific details handled by the kernel.

It also brings us closer to bitstream format (where the modifications
are coded) and leaves DPB management to the decoder/driver, which IMO
makes a lot of sense.

Cheers,

Paul

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

