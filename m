Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19334A6623
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 11:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbfICJ4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 05:56:46 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59207 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfICJ4p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 05:56:45 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i55YG-0000fO-Qa; Tue, 03 Sep 2019 11:56:40 +0200
Message-ID: <1567504599.5229.1.camel@pengutronix.de>
Subject: Re: [PATCH 02/12] media: hantro: Do not reorder H264 scaling list
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Tue, 03 Sep 2019 11:56:39 +0200
In-Reply-To: <HE1PR06MB4011A8F99D58E5ACFAE3CECAACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <20190901124531.23645-1-jonas@kwiboo.se>
         <HE1PR06MB40116C92C3D52C5957EF48E9ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <1567432843.3666.6.camel@pengutronix.de>
         <HE1PR06MB4011A8F99D58E5ACFAE3CECAACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-09-02 at 16:18 +0000, Jonas Karlman wrote:
> On 2019-09-02 16:00, Philipp Zabel wrote:
> > Hi Jonas,
> > 
> > On Sun, 2019-09-01 at 12:45 +0000, Jonas Karlman wrote:
> > > Scaling list supplied from userspace using ffmpeg and libva-v4l2-request
> > > is already in matrix order and can be used without applying the inverse
> > > scanning process.
> > 
> > "in matrix order" is equivalent to "in raster scan order"?
> 
> The values supplied by ffmpeg and libva-v4l2-request is in the order after the
> inverse scanning process has been applied (scaling list has been transformed
> into a scaling matrix). Not sure what this is called, "matrix order" seemed
> close enough.

Ok, after reading chapters

8.5.6 Inverse scanning process for 4x4 transform coefficients and scaling lists
8.5.7 Inverse scanning process for 8x8 transform coefficients and scaling lists

of ITU-T Rec. H.264, this seems clear enough. I just asked to make sure,
because libva documentation uses the term "raster scan" [1].

[1] http://intel.github.io/libva/structVAIQMatrixBufferH264.html

> Since there is two scan orders, zig-zag and field, and cedrus already expecting
> the values in "matrix" order, it seems more logical to let userspace handle the
> inverse scanning process.

I agree.

[...]
> > This changes the size of struct hantro_h264_dec_priv_tbl. Did this
> > describe the auxiliary buffer format incorrectly before?
> 
> Based on RKMPP and Hantro SDK the HW expects the 8x8 inter/intra list for
> Y-component to be located at indices 0 and 1, lists for Cr/Cb is only used for
> 4:4:4 and HW only supports 4:0:0/4:2:0 if I am not mistaken. So the unused
> extra 4 lists at the end of the auxiliary buffer seemed like a waste,
> also RKMPP and Hantro SDK only seemed to allocate space for 2 lists.

Ok.

> > After this change, the second 8x8 scaling list has moved to a different
> > offset. Is this where the hardware has always been looking for it, or is
> > there a change missing in another place?
> 
> As mentioned above HW only looks at indices 0 and 1, and ffmpeg will store the
> inter/intra Y list at indices 0 and 3 as seen at [1], in similar way cedrus only
> use indices 0 and 3 at [2].
> FFmpeg memcpy entire scaling_matrix8 to scaling_list_8x8 for v4l2-request-api
> and memcpy scaling_matrix8[0] and scaling_matrix8[3] for vaapi.
> 
> You can see the effect of this patch using the h264_tivo_sample.ts sample from
> cover letter, patch 3-8 must be applied. With this patch applied the green
> football field will stay green, without the patch the field will shift in colors.
> 
> [1] https://github.com/FFmpeg/FFmpeg/blob/master/libavcodec/h264_ps.c#L299-L308
> [2] https://git.linuxtv.org/media_tree.git/tree/drivers/staging/media/sunxi/cedrus/cedrus_h264.c#n231

Thank you, I'll try this.

regards
Philipp
