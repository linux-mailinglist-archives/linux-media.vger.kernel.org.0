Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02F9BA80AF
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 12:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbfIDKuu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 06:50:50 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45697 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfIDKuu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 06:50:50 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i5SsC-0005Rv-Dt; Wed, 04 Sep 2019 12:50:48 +0200
Message-ID: <1567594247.3041.7.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] media: hantro: Simplify macroblock macros
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>
Date:   Wed, 04 Sep 2019 12:50:47 +0200
In-Reply-To: <20190903181711.7559-2-ezequiel@collabora.com>
References: <20190903181711.7559-1-ezequiel@collabora.com>
         <20190903181711.7559-2-ezequiel@collabora.com>
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

On Tue, 2019-09-03 at 15:17 -0300, Ezequiel Garcia wrote:
> It seems all codecs are using a 16x16 size macroblock,
> and so it's possible to have just one set of macroblock macros.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
