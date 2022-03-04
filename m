Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82E614CDA31
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 18:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238422AbiCDRWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 12:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238306AbiCDRWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 12:22:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607161516B5
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 09:21:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC3DA51C;
        Fri,  4 Mar 2022 18:21:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646414511;
        bh=6nrhRGagr9FFf1fLkq8/LvV/jOZr1PYzFncKJuUpiDc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PWhen/EexS/70Ti92+YZhfXcxk7wLckc8m7X5Fu6aWZ18MV9hqNRueecoNnE7P8/7
         a3Fg0lGOdI3dPr1bG2NL1zAYlBg7V6YJzjJdENYbeMMqKqpGbxuvJK3ZQQLBa3kDYA
         YGnQ58lcslhcE5A163jCzITi8shKTAkClN7K2c6I=
Date:   Fri, 4 Mar 2022 19:21:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil@xs4all.nl, linux-rockchip@lists.infradead.org,
        ezequiel@collabora.com, christoph.muellner@theobroma-systems.com
Subject: Re: [PATCH 0/2] Fix the rkisp1 userspace API for later IP versions
Message-ID: <YiJKooCwFiFuC+Ue@pendragon.ideasonboard.com>
References: <20210111234011.3642481-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210111234011.3642481-1-heiko@sntech.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

On Tue, Jan 12, 2021 at 12:40:09AM +0100, Heiko Stuebner wrote:
> This NEEDs to go into 5.11 while we can still adapt the uapi
> during its RC-cycle.
> 
> 
> When looking into supporting the rkisp1 of the px30 I noticed that
> some fields got bigger in the uapi, caused by bigger number of samples
> for example for histograms or gamma values.

As I don't have access to a PX30 platform, I was wondering if you could
read the RKISP1_CIF_VI_ID register and report its value.

> The rkisp1 was destaged with 5.11-rc1 so we have still time during
> the 5.11 cycle to fix that without big hassles.
> 
> This was discussed previously in a mail [0] and a rfc series [1]
> and this two-part series now splits out the important parts that
> really should become part of a 5.11-rc and thus the final 5.11.
> 
> 
> [0] http://lore.kernel.org/r/3342088.iIbC2pHGDl@diego
> [1] https://lore.kernel.org/r/20210108193311.3423236-2-heiko@sntech.de
> 
> Heiko Stuebner (2):
>   media: rockchip: rkisp1: carry ip version information
>   media: rockchip: rkisp1: extend uapi array sizes
> 
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 22 +++++++++-------
>  include/uapi/linux/rkisp1-config.h            | 25 ++++++++++++++++---
>  3 files changed, 35 insertions(+), 13 deletions(-)

-- 
Regards,

Laurent Pinchart
