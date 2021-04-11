Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CBC35B68F
	for <lists+linux-media@lfdr.de>; Sun, 11 Apr 2021 20:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236130AbhDKSZB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 11 Apr 2021 14:25:01 -0400
Received: from mailoutvs31.siol.net ([185.57.226.222]:55289 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S235229AbhDKSZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Apr 2021 14:25:00 -0400
X-Greylist: delayed 488 seconds by postgrey-1.27 at vger.kernel.org; Sun, 11 Apr 2021 14:24:53 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id E0BF9525531;
        Sun, 11 Apr 2021 20:18:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id eZShPbwdXxkD; Sun, 11 Apr 2021 20:18:42 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id A100952552D;
        Sun, 11 Apr 2021 20:18:42 +0200 (CEST)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net [86.58.17.133])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id F1B3B525539;
        Sun, 11 Apr 2021 20:18:41 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     lujialin4@huawei.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lu Jialin <lujialin4@huawei.com>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] media: sun8i: Fix PM reference leak in deinterlace_start_streaming()
Date:   Sun, 11 Apr 2021 20:18:41 +0200
Message-ID: <2184866.DZomrXFPLt@kista>
In-Reply-To: <20210408133630.56299-1-lujialin4@huawei.com>
References: <20210408133630.56299-1-lujialin4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne četrtek, 08. april 2021 ob 15:36:30 CEST je Lu Jialin napisal(a):
> 
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Lu Jialin <lujialin4@huawei.com>

Acked-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej


