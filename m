Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1E9351459
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 13:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234323AbhDALMX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 07:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234000AbhDALMK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 07:12:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796CDC061797
        for <linux-media@vger.kernel.org>; Thu,  1 Apr 2021 04:12:08 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lRvF7-00016W-JU; Thu, 01 Apr 2021 13:12:05 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lRvF7-000623-AV; Thu, 01 Apr 2021 13:12:05 +0200
Date:   Thu, 1 Apr 2021 13:12:05 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, mchehab@kernel.org
Subject: Re: [PATCH -next] media: imx-pxp: remove redundant dev_err call in
 pxp_probe()
Message-ID: <20210401111205.GA20418@pengutronix.de>
References: <20210401102607.1554006-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401102607.1554006-1-yangyingliang@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:10:46 up 42 days, 14:34, 94 users,  load average: 0.35, 0.20,
 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 01, 2021 at 06:26:07PM +0800, Yang Yingliang wrote:
> There is an error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thank you,
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
