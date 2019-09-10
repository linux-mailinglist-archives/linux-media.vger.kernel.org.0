Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 713E0AE7B0
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 12:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388075AbfIJKOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 06:14:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40240 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfIJKOX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 06:14:23 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B932128C51D
Message-ID: <56f8886353ced71426e2ce6442eed18fe349cdab.camel@collabora.com>
Subject: Re: [PATCH 02/12] media: hantro: Do not reorder H264 scaling list
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Tue, 10 Sep 2019 11:14:17 +0100
In-Reply-To: <HE1PR06MB4011A8F99D58E5ACFAE3CECAACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <20190901124531.23645-1-jonas@kwiboo.se>
         <HE1PR06MB40116C92C3D52C5957EF48E9ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <1567432843.3666.6.camel@pengutronix.de>
         <HE1PR06MB4011A8F99D58E5ACFAE3CECAACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

Thanks for your patch.

On Mon, 2019-09-02 at 16:18 +0000, Jonas Karlman wrote:
[..]
> 
> > > diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
> > > index 0d758e0c0f99..e2d01145ac4f 100644
> > > --- a/drivers/staging/media/hantro/hantro_h264.c
> > > +++ b/drivers/staging/media/hantro/hantro_h264.c
> > > @@ -20,7 +20,7 @@
> > >  /* Size with u32 units. */
> > >  #define CABAC_INIT_BUFFER_SIZE		(460 * 2)
> > >  #define POC_BUFFER_SIZE			34
> > > -#define SCALING_LIST_SIZE		(6 * 16 + 6 * 64)
> > > +#define SCALING_LIST_SIZE		(6 * 16 + 2 * 64)
> > This changes the size of struct hantro_h264_dec_priv_tbl. Did this
> > describe the auxiliary buffer format incorrectly before?
> 
> Based on RKMPP and Hantro SDK the HW expects the 8x8 inter/intra list for
> Y-component to be located at indices 0 and 1, lists for Cr/Cb is only used for
> 4:4:4 and HW only supports 4:0:0/4:2:0 if I am not mistaken. So the unused
> extra 4 lists at the end of the auxiliary buffer seemed like a waste,
> also RKMPP and Hantro SDK only seemed to allocate space for 2 lists.
> 

I think it would make a lot of sense to document what the hardware
expects somewhere, perhaps as part of the struct hantro_h264_dec_priv_tbl
documentation?

Thanks,
Ezequiel

