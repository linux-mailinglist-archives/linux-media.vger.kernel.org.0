Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5C7E86B0
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 12:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbfJ2LWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 07:22:17 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47311 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727533AbfJ2LWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 07:22:16 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iPPZi-0008NS-2i; Tue, 29 Oct 2019 12:22:10 +0100
Message-ID: <b1a0089f9fb46af9c5091db5da4ff1c944bf878a.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] media: cedrus: Use correct H264 8x8 scaling list
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
Date:   Tue, 29 Oct 2019 12:22:09 +0100
In-Reply-To: <HE1PR06MB4011189B5455E402FACE08C2AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011D3B8C200D13829648D86AC660@HE1PR06MB4011.eurprd06.prod.outlook.com>
         <20191029000033.13540-1-jonas@kwiboo.se>
         <HE1PR06MB4011189B5455E402FACE08C2AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
> Documentation now define the expected order of scaling lists,
> change to use correct indices.
> 
> Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

