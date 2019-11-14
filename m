Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE9FFC28A
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 10:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfKNJ0L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 04:26:11 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44459 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfKNJ0L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 04:26:11 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iVBOD-0001dz-N3; Thu, 14 Nov 2019 10:26:09 +0100
Message-ID: <4797d07a4e51a509a866733cd46aeec49c0222f6.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/3] media: hantro: Cleanup format negotiation helpers
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
Date:   Thu, 14 Nov 2019 10:26:05 +0100
In-Reply-To: <20191113175603.24742-2-ezequiel@collabora.com>
References: <20191113175603.24742-1-ezequiel@collabora.com>
         <20191113175603.24742-2-ezequiel@collabora.com>
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

On Wed, 2019-11-13 at 14:56 -0300, Ezequiel Garcia wrote:
> Format negotiation helpers, hantro_find_format()
> and hantro_get_default_fmt() can be simplified,
> making the code a little bit clearer.
> 
> More importantly, this change is preparation work
> for the post-processor usage.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

