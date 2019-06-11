Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACA93CA6C
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 13:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404162AbfFKLwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 07:52:24 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45249 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404156AbfFKLwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 07:52:22 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hafK9-0007ET-3C; Tue, 11 Jun 2019 13:52:21 +0200
Message-ID: <1560253940.13886.7.camel@pengutronix.de>
Subject: Re: [PATCH v3 09/10] media: hantro: add initial i.MX8MM support
 (untested)
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Date:   Tue, 11 Jun 2019 13:52:20 +0200
In-Reply-To: <a49db696-a31e-7f80-f2c3-bcb162c03dee@xs4all.nl>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
         <20190531085523.10892-10-p.zabel@pengutronix.de>
         <a49db696-a31e-7f80-f2c3-bcb162c03dee@xs4all.nl>
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

On Mon, 2019-06-03 at 14:54 +0200, Hans Verkuil wrote:
> On 5/31/19 10:55 AM, Philipp Zabel wrote:
> > This should enable MPEG-2 decoding on the Hantro G1 and JPEG encoding on
> > the Hantro H1 on i.MX8MM.
> 
> That's the i.MX8M Mini, right? I think that's the official name for this
> SoC.

Correct.

> In any case, I don't like merging this until someone was able to test it.

Agreed. That's why I kept this separate from the i.MX8MQ support patch.

regards
Philipp
