Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA8053CBFB
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 14:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388904AbfFKMof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 08:44:35 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43107 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387887AbfFKMof (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 08:44:35 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hag8f-0005fY-JM; Tue, 11 Jun 2019 14:44:33 +0200
Message-ID: <1560257073.13886.13.camel@pengutronix.de>
Subject: Re: [PATCH v3 07/10] media: dt-bindings: Document i.MX8MQ and
 i.MX8MM VPU bindings
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Date:   Tue, 11 Jun 2019 14:44:33 +0200
In-Reply-To: <20190601111829.5643f57d@collabora.com>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
         <20190531085523.10892-8-p.zabel@pengutronix.de>
         <20190601111829.5643f57d@collabora.com>
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

On Sat, 2019-06-01 at 11:18 +0200, Boris Brezillon wrote:
> On Fri, 31 May 2019 10:55:20 +0200
> Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > Add devicetree binding documentation for the Hantro G1/G2 VPU on i.MX8MQ
> > and for the Hantro G1/G2/H1 VPU on i.MX8MM.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  .../devicetree/bindings/media/imx8m-vpu.txt   | 56 +++++++++++++++++++
> 
> Hm, shouldn't we have a single bindings file for all hantro-based VPUs?

I'm not sure, these are different bindings.

I could combine imx8m-vpu.txt and rockchip-vpu.txt into hantro-vpu.txt
if required.

regards
Philipp
