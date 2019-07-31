Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4937BB92
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 10:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbfGaI0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 04:26:04 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43903 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbfGaI0D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 04:26:03 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hsjvl-0006Tm-Pu; Wed, 31 Jul 2019 10:25:53 +0200
Message-ID: <1564561552.3207.3.camel@pengutronix.de>
Subject: Re: [PATCH v2] media: i2c: ov5645: Fix power sequence
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     kernel@collabora.com, Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org
Date:   Wed, 31 Jul 2019 10:25:52 +0200
In-Reply-To: <20190710184000.8995-1-ezequiel@collabora.com>
References: <20190710184000.8995-1-ezequiel@collabora.com>
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

On Wed, 2019-07-10 at 15:40 -0300, Ezequiel Garcia wrote:
> This is mostly a port of Jacopo's fix:
> 
>   commit aa4bb8b8838ffcc776a79f49a4d7476b82405349
>   Author: Jacopo Mondi <jacopo@jmondi.org>
>   Date:   Fri Jul 6 05:51:52 2018 -0400
> 
>   media: ov5640: Re-work MIPI startup sequence
> 
> In the OV5645 case, the changes are:
> 
> - Move OV5645_IO_MIPI_CTRL00 (0x300e) out of the initial setting blob.
> - At set_power(1) time power up MIPI Tx/Rx and set data and clock lanes in
>   LP11 during 'sleep' and 'idle' with MIPI clock in non-continuous mode.
> - At set_power(0) time power down MIPI Tx/Rx (in addition to the current
>   power down of regulators and clock gating).
> - At s_stream time enable/disable the MIPI interface output.
> 
> With this commit the sensor is able to enter LP-11 mode during power up,
> as expected by some CSI-2 controllers.
> 
> Many thanks to Fabio Estevam for his help debugging this issue.
> 
> Tested-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> Changes in v2:
> * As suggested by Philipp, move the initial configuration
>   to the ov5645_global_init_setting array.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
