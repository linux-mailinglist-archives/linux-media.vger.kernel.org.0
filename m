Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216C033102D
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 14:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhCHN5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 08:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbhCHN5K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 08:57:10 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4956C06174A
        for <linux-media@vger.kernel.org>; Mon,  8 Mar 2021 05:57:09 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lJGNd-0006hW-TY; Mon, 08 Mar 2021 14:57:05 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lJGNc-0000Su-NW; Mon, 08 Mar 2021 14:57:04 +0100
Date:   Mon, 8 Mar 2021 14:57:04 +0100
From:   Philipp Zabel <pza@pengutronix.de>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 4/7] media: hantro: imx: remove unused include
Message-ID: <20210308135704.GB18168@pengutronix.de>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
 <20210305183924.1754026-5-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305183924.1754026-5-emil.l.velikov@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:54:05 up 18 days, 17:17, 83 users,  load average: 0.02, 0.11,
 0.13
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Emil,

On Fri, Mar 05, 2021 at 06:39:21PM +0000, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> The current imx8 code does not use the jpeg encoder. Remove the
> unnecessary include.
> 
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>

thank you, patches 2-4 could be tagged

Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
