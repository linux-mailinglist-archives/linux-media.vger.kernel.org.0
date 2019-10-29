Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6699AE86B2
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 12:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbfJ2LWW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 07:22:22 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45977 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbfJ2LWW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 07:22:22 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iPPZn-0008OA-06; Tue, 29 Oct 2019 12:22:15 +0100
Message-ID: <c8fe949268670586e6786eab633c389bbb6c1ed3.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] media: hantro: Do not reorder H264 scaling list
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jonas Karlman <jonas@kwiboo.se>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Tue, 29 Oct 2019 12:22:14 +0100
In-Reply-To: <HE1PR06MB4011B2DED416807CD9C9B90EAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011D3B8C200D13829648D86AC660@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <20191029000033.13540-1-jonas@kwiboo.se>
         <HE1PR06MB4011B2DED416807CD9C9B90EAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
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

On Tue, 2019-10-29 at 00:00 +0000, Jonas Karlman wrote:
> Scaling list supplied from userspace should be in matrix order
> and can be used without applying the inverse scanning process.
> 
> The HW also only support 8x8 scaling list for the Y component, indices 0
> and 1 in the scaling list supplied from userspace.
> 
> Remove reordering and write the scaling matrix in an order expected by
> the VPU, also only allocate memory for the two 8x8 lists supported.
> 
> Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

