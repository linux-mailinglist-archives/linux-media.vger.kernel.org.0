Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251A1AD517
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 10:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfIIIvK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 04:51:10 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48259 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbfIIIvK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 04:51:10 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i7FO4-0005hN-I4; Mon, 09 Sep 2019 10:51:04 +0200
Message-ID: <1568019061.2956.3.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] media: hantro: h264: Fix the frame_num wraparound
 case
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Francois Buergisser <fbuergisser@google.com>
Date:   Mon, 09 Sep 2019 10:51:01 +0200
In-Reply-To: <20190909072815.23981-3-boris.brezillon@collabora.com>
References: <20190909072815.23981-1-boris.brezillon@collabora.com>
         <20190909072815.23981-3-boris.brezillon@collabora.com>
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

Hi Boris,

On Mon, 2019-09-09 at 09:28 +0200, Boris Brezillon wrote:
> Step '8.2.4.1 Decoding process for picture numbers' was missing in the
> reflist creation logic, leading to invalid P reflists when a
> ->frame_num wraparound happens.
> 
> Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
> Reported-by: Francois Buergisser <fbuergisser@google.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Thank you, excellent timing. I've just seen this corruption for the
first time last Friday. All three patches

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

(on i.MX8MQ)

regards
Philipp
