Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51463A5987
	for <lists+linux-media@lfdr.de>; Sun, 13 Jun 2021 18:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhFMQYJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Jun 2021 12:24:09 -0400
Received: from gloria.sntech.de ([185.11.138.130]:58722 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231782AbhFMQYI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Jun 2021 12:24:08 -0400
Received: from p508fc96c.dip0.t-ipconnect.de ([80.143.201.108] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lsSs4-0005Bk-Sg; Sun, 13 Jun 2021 18:22:00 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Alex Bee <knaerzche@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/12] ARM: dts: rockchip: add power controller for RK3036
Date:   Sun, 13 Jun 2021 18:22:00 +0200
Message-ID: <3783580.yKVeVyVuyW@phil>
In-Reply-To: <1dc782cd3956598b2eb5f89ad0680d2ce38ffd54.camel@collabora.com>
References: <20210525152225.154302-1-knaerzche@gmail.com> <20210527154455.358869-9-knaerzche@gmail.com> <1dc782cd3956598b2eb5f89ad0680d2ce38ffd54.camel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, 11. Juni 2021, 17:58:58 CEST schrieb Ezequiel Garcia:
> Hi Heiko,
> 
> On Thu, 2021-05-27 at 17:44 +0200, Alex Bee wrote:
> > Add the power controller node and the correspondending qos nodes for
> > RK3036.
> > Also add the power-domain property to the nodes that are already
> > present.
> > Note: Since the regiser offsets of the axi interconnect QoS are missing
> > in the TRM (RK3036 TRM V1.0), they have been taken from vendor kernel.
> > 
> 
> Can you take care of the device tree changes (patches 8 to 12)?

sure, I'll pick the power-domains now but need to wait for
the vpu nodes for the driver parts to land in the media tree.


Heiko


