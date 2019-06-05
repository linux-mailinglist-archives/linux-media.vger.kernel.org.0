Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE787359D5
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 11:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfFEJtO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 5 Jun 2019 05:49:14 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:57005 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbfFEJtO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 05:49:14 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 94C4B1BF204;
        Wed,  5 Jun 2019 09:49:06 +0000 (UTC)
Date:   Wed, 5 Jun 2019 11:49:06 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Sean Young <sean@mess.org>
Subject: Re: [PATCH v4 01/13] dt-bindings: media: sunxi-ir: Add A31 compatible
Message-ID: <20190605094906.d5fjoeelfblhpvfm@flea>
References: <20190604162959.29199-1-peron.clem@gmail.com>
 <20190604162959.29199-2-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20190604162959.29199-2-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 04, 2019 at 06:29:47PM +0200, Clément Péron wrote:
> Allwinner A31 has introduced a new memory mapping and a
> reset line.
>
> The difference in memory mapping are :
>
> - In the configure register there is a new sample bit
>   and Allwinner has introduced the active threshold feature.
>
> - In the status register a new STAT bit is present.
>
> Note: CGPO and DRQ_EN bits are removed on A31 but present on A13
> and on new SoCs like A64/H6.
> This is actually not an issue as these bits are togglable and new
> SoCs have a dedicated bindings.
>
> Introduce this bindings to make a difference since this generation.
> And declare the reset line required since A31.
>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> Acked-by: Sean Young <sean@mess.org>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
