Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7D9B266E
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 22:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731029AbfIMUGW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 13 Sep 2019 16:06:22 -0400
Received: from mailoutvs39.siol.net ([185.57.226.230]:47326 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730930AbfIMUGV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 16:06:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 1A96A522590;
        Fri, 13 Sep 2019 22:06:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Yu6tDdrqQ1J6; Fri, 13 Sep 2019 22:06:18 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id B54C1522597;
        Fri, 13 Sep 2019 22:06:18 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id D201E522590;
        Fri, 13 Sep 2019 22:06:16 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 5/6] media: sun4i: Add H3 deinterlace driver
Date:   Fri, 13 Sep 2019 22:06:15 +0200
Message-ID: <6033065.vD0Azduf8t@jernej-laptop>
In-Reply-To: <20190913091147.42nsldzxwzfjoiak@localhost.localdomain>
References: <20190912175132.411-1-jernej.skrabec@siol.net> <4613446.95M5L3lKvs@jernej-laptop> <20190913091147.42nsldzxwzfjoiak@localhost.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne petek, 13. september 2019 ob 11:11:47 CEST je Maxime Ripard napisal(a):
> Hi,
> 
> On Thu, Sep 12, 2019 at 10:43:28PM +0200, Jernej Škrabec wrote:
> > Dne četrtek, 12. september 2019 ob 22:26:47 CEST je Maxime Ripard 
napisal(a):
> > > > +	clk_set_rate(dev->mod_clk, 300000000);
> 
> I just realized I missed this too. If you really need the rate to be
> fixed, and if the controller cannot operate properly at any other
> frequency, you probably want to use clk_set_rate_exclusive there.

I don't think that's needed. Parents of deinterlace clock are pll-periph0 and 
pll-periph1 which both have fixed clock and thus deinterlace clock will never 
be changed. I just set it to same frequency as it is set in BSP driver. I 
think it works with 600 MHz too, but that's overkill.

Best regards,
Jernej 



