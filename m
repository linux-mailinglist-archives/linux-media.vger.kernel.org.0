Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54EF2CC0DB
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 16:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgLBPbZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 2 Dec 2020 10:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgLBPbY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 10:31:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE518C0613D6
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 07:30:44 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkU5U-0000Zf-Vi; Wed, 02 Dec 2020 16:30:36 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkU5U-0000Ip-Bv; Wed, 02 Dec 2020 16:30:36 +0100
Message-ID: <d92689dfb92dfa0812f19cc5ed04ec308b9efde3.camel@pengutronix.de>
Subject: Re: [PATCH v5 09/10] media: Avoid parsing quantization and huffman
 tables
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Date:   Wed, 02 Dec 2020 16:30:36 +0100
In-Reply-To: <48b58168-662c-3e4d-2e5d-1f2a14b239fe@xs4all.nl>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
         <20201112030557.8540-10-mirela.rabulea@oss.nxp.com>
         <48b58168-662c-3e4d-2e5d-1f2a14b239fe@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2020-12-02 at 13:12 +0100, Hans Verkuil wrote:
> On 12/11/2020 04:05, Mirela Rabulea (OSS) wrote:
> > From: Mirela Rabulea <mirela.rabulea@nxp.com>
> > 
> > These are optional in struct v4l2_jpeg_header, so do not parse if
> > not requested, save some time.
> > 
> > Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-jpeg.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
> > index d77e04083d57..7576cd0ce6b9 100644
> > --- a/drivers/media/v4l2-core/v4l2-jpeg.c
> > +++ b/drivers/media/v4l2-core/v4l2-jpeg.c
> > @@ -307,6 +307,9 @@ static int jpeg_parse_quantization_tables(struct jpeg_stream *stream,
> >  {
> >  	int len = jpeg_get_word_be(stream);
> >  
> > +	if (!tables)
> > +		return 0;
> > +
> 
> It feels more natural to check for a non-NULL out->quantization_tables
> or non-NULL out->huffman_tables pointer in v4l2_jpeg_parse_header()
> rather than in these low-level functions. It's weird to have this check here.

Ah, now I get it.

Yes, if you want to skip the entire DQT for performance reasons, it is
probably better to just call jpeg_skip_segment() instead of
jpeg_parse_quantization_table(). Otherwise the next jpeg_next_marker has
to scan the whole quantization table for segment markers.

regards
Philipp
