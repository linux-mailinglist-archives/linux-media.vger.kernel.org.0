Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76AA432C72E
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244458AbhCDAbN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 3 Mar 2021 19:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238841AbhCCOSo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 09:18:44 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C80C0617A7
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 06:18:03 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lHSK3-00014Z-9q; Wed, 03 Mar 2021 15:17:55 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lHSK2-00075d-0s; Wed, 03 Mar 2021 15:17:54 +0100
Message-ID: <e6f8537d2a1f34d0a424b68e056c0ae556c93efd.camel@pengutronix.de>
Subject: Re: [PATCH v3 0/5] Reset driver for IMX8MQ VPU hardware block
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, ezequiel@collabora.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Date:   Wed, 03 Mar 2021 15:17:53 +0100
In-Reply-To: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, 2021-03-01 at 16:17 +0100, Benjamin Gaignard wrote:
> The two VPUs inside IMX8MQ share the same control block which can be see
> as a reset hardware block.

This isn't a reset controller though. The control block also contains
clock gates of some sort and a filter register for the featureset fuses.
Those shouldn't be manipulated via the reset API.

> In order to be able to add the second VPU (for HECV decoding) it will be
> more handy if the both VPU drivers instance don't have to share the
> control block registers. This lead to implement it as an independ reset 
> driver and to change the VPU driver to use it.

Why not switch to a syscon regmap for the control block? That should
also allow to keep backwards compatibility with the old binding with
minimal effort.

> Please note that this series break the compatibility between the DTB and
> kernel. This break is limited to IMX8MQ SoC and is done when the driver
> is still in staging directory.

I know in this case we are pretty sure there are no users of this
binding except for a staging driver, but it would still be nice to keep
support for the deprecated binding, to avoid the requirement of updating
kernel and DT in lock-step.

regards
Philipp
