Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37C4DA6904
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 14:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbfICMxN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 08:53:13 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39585 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728860AbfICMxM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 08:53:12 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i58J0-0001Lr-Ol; Tue, 03 Sep 2019 14:53:06 +0200
Message-ID: <1567515184.5229.5.camel@pengutronix.de>
Subject: Re: [PATCH 02/12] media: hantro: Do not reorder H264 scaling list
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Date:   Tue, 03 Sep 2019 14:53:04 +0200
In-Reply-To: <DB6PR06MB4007C140420365E83064C5BEACB90@DB6PR06MB4007.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <20190901124531.23645-1-jonas@kwiboo.se>
         <HE1PR06MB40116C92C3D52C5957EF48E9ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <1567432843.3666.6.camel@pengutronix.de>
         <HE1PR06MB4011A8F99D58E5ACFAE3CECAACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <DB6PR06MB4007C140420365E83064C5BEACB90@DB6PR06MB4007.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-09-03 at 07:54 +0000, Jonas Karlman wrote:
[...]
> After a closer look both ffmpeg and rkmpp only apply zig-zag scan and not field scan,
> ffmpeg will memcpy the scaling_matrix4/8 as is for vaapi, vdpau and nvdec,
> for dxva2 there is a workaround flag that controls if zig-zag should be applied or not.
> 
> I suggest a clarification of the expect order of values and use of the same value order as vaapi, vdpau and nvdec.
> i.e. have the scaling list values in "matrix order"/"raster order", after zig-zag scan has been applied,
> as is currently expected by cedrus and hantro after this patch.
> 
> I would also suggest a change to the expected order of the 8x8 scaling lists to follow the H264 standard,
> instead of the ffmpeg order like this patch and cedrus driver currently expects.
> 
> Expected scaling list order would then be,
> for 4x4: Intra Y, Intra Cb, Intra Cr, Inter Y, Inter Cb, Inter Cr,
> for 8x8: Intra Y, Inter Y, Intra Cb, Inter Cb, Intra Cr, Inter Cr.

I'm in favor of both, it seems unnecessary to reorder the lists in
userspace only to have the kernel reorder them back before passing them
to the hardware.

regards
Philipp
