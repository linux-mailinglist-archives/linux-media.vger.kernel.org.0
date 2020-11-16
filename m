Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B912B4607
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 15:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729645AbgKPOko (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 09:40:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728041AbgKPOko (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 09:40:44 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3F1C0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 06:40:44 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1kefgI-0008RN-Ba; Mon, 16 Nov 2020 15:40:34 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1kefgH-0008OQ-DE; Mon, 16 Nov 2020 15:40:33 +0100
Date:   Mon, 16 Nov 2020 15:40:33 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        jacopo+renesas@jmondi.org, gustavoars@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: tvp5150: Fix wrong return value of
 tvp5150_parse_dt()
Message-ID: <20201116144033.lix6hxvccdcmvnam@pengutronix.de>
References: <20201116141801.3601713-1-zhangxiaoxu5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116141801.3601713-1-zhangxiaoxu5@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:39:16 up 367 days,  5:57, 46 users,  load average: 0.00, 0.02,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

thanks for covering that.

On 20-11-16 09:18, Zhang Xiaoxu wrote:
> If of_graph_get_endpoint_by_regs() return NULL, it will return 0 rather
> than an errno, because we doesn't initialize the return value.
> 
> Fixes: 0556f1d580d4 ("media: tvp5150: add input source selection of_graph support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
