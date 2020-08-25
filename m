Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C24A251C37
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 17:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgHYPX0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 25 Aug 2020 11:23:26 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:49165 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgHYPXR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 11:23:17 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360 (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7DB231BF225;
        Tue, 25 Aug 2020 15:23:10 +0000 (UTC)
Date:   Tue, 25 Aug 2020 17:23:09 +0200
From:   =?UTF-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 1/7] media: sun6i-csi: Fix the bpp for 10-bit bayer
 formats
Message-ID: <20200825172309.6756760d@lhopital-XPS-13-9360>
In-Reply-To: <20200824165536.u2yzonoskiqu3c5j@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
        <20200821145935.20346-2-kevin.lhopital@bootlin.com>
        <20200824165536.u2yzonoskiqu3c5j@gilmour.lan>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Le Mon, 24 Aug 2020 18:55:36 +0200,
Maxime Ripard <maxime@cerno.tech> a écrit :

> On Fri, Aug 21, 2020 at 04:59:29PM +0200, Kévin L'hôpital wrote:
> > 10-bit bayer formats are aligned to 16 bits in memory, so this is
> > what needs to be used as bpp for calculating the size of the
> > buffers to allocate.
> > 
> > Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>  
> 
> Generally speaking, you should also explain why it's not an issue for
> the callers. Depending on what that function is supposed to be doing
> (returning the padded bits or the padded bits per pixel), your patch
> could be either right or wrong.
> 
> Since all the callers are using it to generate the number of bytes per
> line, your patch is indeed correct. But it should be mentionned in the
> commit log.
> 
> Maxime

All right, I will add this explanation.

Thank you very much for the review

Kévin 

-- 
Kevin L'Hopital, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
