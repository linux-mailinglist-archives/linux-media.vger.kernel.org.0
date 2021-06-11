Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3533A45D1
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 17:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhFKQBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 12:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbhFKQBL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 12:01:11 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7FAC061574;
        Fri, 11 Jun 2021 08:59:13 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4466C1F44800
Message-ID: <1dc782cd3956598b2eb5f89ad0680d2ce38ffd54.camel@collabora.com>
Subject: Re: [PATCH v2 08/12] ARM: dts: rockchip: add power controller for
 RK3036
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Alex Bee <knaerzche@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Fri, 11 Jun 2021 12:58:58 -0300
In-Reply-To: <20210527154455.358869-9-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
         <20210527154455.358869-1-knaerzche@gmail.com>
         <20210527154455.358869-9-knaerzche@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Heiko,

On Thu, 2021-05-27 at 17:44 +0200, Alex Bee wrote:
> Add the power controller node and the correspondending qos nodes for
> RK3036.
> Also add the power-domain property to the nodes that are already
> present.
> Note: Since the regiser offsets of the axi interconnect QoS are missing
> in the TRM (RK3036 TRM V1.0), they have been taken from vendor kernel.
> 

Can you take care of the device tree changes (patches 8 to 12)?

Thanks!
Ezequiel

