Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A926B3B35FB
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 20:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbhFXSrG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 14:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhFXSrG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 14:47:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FECFC061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 11:44:47 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 660A11F4423F
Message-ID: <b3f6e93bd5c0d959bea0a648ce806094fac81065.camel@collabora.com>
Subject: Re: [PATCH 02/12] arm64: dts: rockchip: Add panel orientation to
 Odroid Go Advance
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alex Bee <knaerzche@gmail.com>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>, kernel@collabora.com
Date:   Thu, 24 Jun 2021 15:44:35 -0300
In-Reply-To: <3249046.u6TykanW85@diego>
References: <20210624182612.177969-1-ezequiel@collabora.com>
         <20210624182612.177969-3-ezequiel@collabora.com> <3249046.u6TykanW85@diego>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-06-24 at 20:37 +0200, Heiko Stübner wrote:
> Am Donnerstag, 24. Juni 2021, 20:26:02 CEST schrieb Ezequiel Garcia:
> > The Odroid Go Advance panel is rotated, so let's reflect this
> > in the device tree.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> similar patch already applied for 5.14:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts?id=edb39de5d731f147c7b08c4a5eb246ae1dbdd947

Great minds think alike! :)

Thanks,
Ezequiel

