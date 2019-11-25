Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F264A1091FC
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 17:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbfKYQgx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 11:36:53 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52933 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728860AbfKYQgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 11:36:52 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iZHM3-0002uV-0C; Mon, 25 Nov 2019 17:36:51 +0100
Message-ID: <c96cdd650f7250699c1f3c73ccfc28d304dbb88a.camel@pengutronix.de>
Subject: Re: [EXT] [PATCH 1/5] media: add v4l2 JPEG helpers
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>,
        "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mikhail.ulyanov@cogentembedded.com" 
        <mikhail.ulyanov@cogentembedded.com>,
        "bin.liu@mediatek.com" <bin.liu@mediatek.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "rick.chang@mediatek.com" <rick.chang@mediatek.com>
Date:   Mon, 25 Nov 2019 17:36:47 +0100
In-Reply-To: <1574681817.19906.28.camel@nxp.com>
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
         <20191113150538.9807-2-p.zabel@pengutronix.de>
         <1574681817.19906.28.camel@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mirela,

On Mon, 2019-11-25 at 11:36 +0000, Mirela Rabulea wrote:
> Hi Philipp,
> I tried using these helpers for imx8 jpeg encoder/decoder, and the main
> issues that I have are:
> 1. It is necessary to support ARGB (4 components)

Ok. I'll add support for 4-component images. Is there a reasonable
default color encoding for 4-component images if the APP14 marker
segment is not present?

> 2. It is necessary to support extended sequential (parse SOF1)

Do you require arithmetic coding or 12-bit sample precision as well, or
just extended sequential with Huffman coding and 8-bit sample precision?

> 3. It is necessary to distinguish somehow between YUV and RGB, I used
> APP14 marker to do that

I see you used the "APP14 marker segment for colour encoding" as
specified in Recommendation T.872 [1]. I'll add support for this to the
common code.

[1] https://www.itu.int/rec/T-REC-T.872-201206-I/en

> 4. It is necessary to be able to modify/patch the component ID's inside
> SOF & SOS segments; this is due to a hardware limitation that the
> component ID's must be 0..3 or 1..4, however it is possible to decode a
> jpeg that violates this condition, if the component ID's are patched to
> accepted values.

Interesting. I'm not sure if this is something we should do
unconditionally in the common code. Maybe this warrants a flag.

> I have a concern related to performance, about parsing the jpeg like
> that, but I did not get to measure anything yet, as I could not fully
> integrate imx8 jpeg driver with the helpers, I
> used v4l2_jpeg_parse_header, but I also had to keep my old structures.
> Please take a look in my imx8 patch, at mxc-jpeg.h, struct
> mxc_jpeg_sof/struct mxc_jpeg_sos, these are __packed structures, they
> work quite well via a simple cast and allow modifications too, the
> downside is that fields bigger than u8 might require swapping. 

We can't use bitfields for external data in portable code, and I'm not a
big fan of using __be16 in the API, but we could certainly use this
internally and see if that speeds up parsing. There are quite a few
superfluous bounds checks right now that can be optimized away.
I'd still like to copy the parsed headers into a structure provided by
the caller.

> Please also see below my comments.

I'll take these into account for the next version. Thank you for the
feedback!

regards
Philipp

