Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4CC67AE0
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2019 17:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbfGMPRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jul 2019 11:17:17 -0400
Received: from gloria.sntech.de ([185.11.138.130]:49290 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727626AbfGMPRR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jul 2019 11:17:17 -0400
Received: from p508fcc68.dip0.t-ipconnect.de ([80.143.204.104] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1hmJlt-0006eI-7X; Sat, 13 Jul 2019 17:17:09 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Alex Dewar <alex.dewar@gmx.co.uk>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: [REGRESSION] Xorg segfaults on Asus Chromebook CP101 with Linux v5.2 (was Asus C101P Chromeboot fails to boot with Linux 5.2)
Date:   Sat, 13 Jul 2019 17:17:08 +0200
Message-ID: <2648434.ut0pN6mfR1@phil>
In-Reply-To: <f47f8759-8113-812a-b17a-4be09665369e@gmx.co.uk>
References: <59042b09-7651-be1d-347f-0dc4aa02a91b@gmx.co.uk> <5fe66d5d-0624-323f-3bf8-56134ca85eca@gmx.co.uk> <f47f8759-8113-812a-b17a-4be09665369e@gmx.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am Samstag, 13. Juli 2019, 13:38:45 CEST schrieb Alex Dewar:
> I initially thought my machine was failing to boot entirely, but it
> turns out it was just failing to start the display manager. I managed to
> escape to a tty by hammering the keyboard a bit.
> 
> I suspect the culprit is the rockchip_vpu driver (in staging/media),
> which has been renamed to hantro in this merge window. When I run startx
> from a terminal, X fails to start and Xorg segfaults (log here:
> http://users.sussex.ac.uk/~ad374/xorg.log). X seems to work without any
> issues in v5.1.

5.2 also has support for Panfrost (Mali-Midgard GPUs) but I'm not
sure if it already can support X11 yet and your X11 log mentions
libglamoregl in the segfault stack trace.

Apart from it bisect that Greg suggested you could also just try
blacklisting either panfrost or vpu kernel modules
/etc/udev/somewhere . This would prevent them from loading

Hope that helps
Heiko


