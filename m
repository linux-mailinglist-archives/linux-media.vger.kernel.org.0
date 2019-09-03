Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49ECEA6C27
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 17:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbfICPCG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 11:02:06 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50075 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbfICPCF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 11:02:05 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i5AJk-0008Fs-Uz; Tue, 03 Sep 2019 17:02:00 +0200
Message-ID: <1567522916.5229.11.camel@pengutronix.de>
Subject: Re: [RFC 08/12] media: hantro: Fix H264 decoding of field encoded
 content
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
Date:   Tue, 03 Sep 2019 17:01:56 +0200
In-Reply-To: <DB6PR06MB4007C0F89BAEC6F9F1F2AA18ACB90@DB6PR06MB4007.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <20190901124531.23645-1-jonas@kwiboo.se>
         <HE1PR06MB4011EA39133818A85768B91FACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <1567516908.5229.7.camel@pengutronix.de>
         <DB6PR06MB4007C0F89BAEC6F9F1F2AA18ACB90@DB6PR06MB4007.eurprd06.prod.outlook.com>
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

On Tue, 2019-09-03 at 14:02 +0000, Jonas Karlman wrote:
> On 2019-09-03 15:21, Philipp Zabel wrote:
> > On Sun, 2019-09-01 at 12:45 +0000, Jonas Karlman wrote:
> > > This need code cleanup and formatting
> > > 
> > > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > 
> > The previous patches all work, but this patch breaks decoding of
> > progressive content for me (i.MX8MQ with FFmpeg based on Ezequiel's
> > branch).
> 
> Please try with ffmpeg based on my v4l2-request-hwaccel-4.0.4-hantro branch at [1],
> up to and including the commit "HACK: add dpb flags for reference usage and field picture".
> That commit adds code to set reference flags needed by the changes in this patch.
> 
> There is probably also some other minor difference between our two ffmpeg branches.
> I have not observed any issues with progressive content with this patch and my ffmpeg branch (on a RK3288 device).
> Some H264 reference samples do have visual issues after this patch, however all my real world samples does seem to work.
> 
> My branch use libudev to probe media/video devices and needs to be configured with:
> --enable-v4l2-request --enable-libudev --enable-libdrm
> 
> [1] https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.0.4-hantro

I hadn't realized that this is a backwards incompatible change. With
your branch rebased onto n4.2, and this patch applied, decoding seems to
work.

regards
Philipp
