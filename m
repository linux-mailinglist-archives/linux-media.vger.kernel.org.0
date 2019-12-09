Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B854117386
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 19:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfLISLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 13:11:51 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47960 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfLISLv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 13:11:51 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 12646290491
Message-ID: <7b92111b0c6443653de45f1eeec867645c127f32.camel@collabora.com>
Subject: Re: [PATCH v3 2/5] media: hantro: Reduce H264 extra space for
 motion vectors
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>, Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Mon, 09 Dec 2019 15:11:41 -0300
In-Reply-To: <CAAFQd5CSWea=DNjySJxZmVi+2c5U4EKVPa1mf3vHh70+YrAQCA@mail.gmail.com>
References: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <20191106223408.2176-1-jonas@kwiboo.se>
         <HE1PR06MB4011FF930111A869E4645C8CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <CAAFQd5CSWea=DNjySJxZmVi+2c5U4EKVPa1mf3vHh70+YrAQCA@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-11-20 at 21:44 +0900, Tomasz Figa wrote:
> Hi Jonas,
> 
> On Thu, Nov 7, 2019 at 7:34 AM Jonas Karlman <jonas@kwiboo.se> wrote:
> > A decoded 8-bit 4:2:0 frame need memory for up to 448 bytes per
> > macroblock with additional 32 bytes on multi-core variants.
> > 
> > Memory layout is as follow:
> > 
> > +---------------------------+
> > > Y-plane   256 bytes x MBs |
> > +---------------------------+
> > > UV-plane  128 bytes x MBs |
> > +---------------------------+
> > > MV buffer  64 bytes x MBs |
> > +---------------------------+
> > > MC sync          32 bytes |
> > +---------------------------+
> > 
> > Reduce the extra space allocated now that motion vector buffer offset no
> > longer is based on the extra space.
> > 
> > Only allocate extra space for 64 bytes x MBs of motion vector buffer
> > and 32 bytes for multi-core sync.
> > 
> > Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Changes in v3:
> >   - add memory layout to code comment (Boris)
> > Changes in v2:
> >   - updated commit message
> > ---
> >  drivers/staging/media/hantro/hantro_v4l2.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> > 
> 
> Thanks for the patch!
> 
> What platform did you test it on and how? Was it tested with IOMMU enabled?

Hello Tomasz,

Please note that this series has been picked-up and is merged
in v5.5-rc1.

IIRC, we tested these patches on RK3399 and RK3288 (that means
with an IOMMU). I've just ran some more extensive tests on RK3288,
on media/master; and I plan to test some more on RK3399 later this week.

Do you have any specific concern in mind?

Thanks,
Ezequiel

