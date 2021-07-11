Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46F93C3C06
	for <lists+linux-media@lfdr.de>; Sun, 11 Jul 2021 13:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbhGKL6T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Jul 2021 07:58:19 -0400
Received: from gloria.sntech.de ([185.11.138.130]:52722 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229688AbhGKL6S (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Jul 2021 07:58:18 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m2Y3R-0007Bq-TM; Sun, 11 Jul 2021 13:55:25 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Alex Bee <knaerzche@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: mfd: syscon: add Rockchip RK3036/RK3228 qos compatibles
Date:   Sun, 11 Jul 2021 13:55:25 +0200
Message-ID: <3527273.z0yIoBN5P9@diego>
In-Reply-To: <20210601154651.GE2159518@dell>
References: <20210525152225.154302-1-knaerzche@gmail.com> <20210527154455.358869-2-knaerzche@gmail.com> <20210601154651.GE2159518@dell>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lee,

Am Dienstag, 1. Juni 2021, 17:46:51 CEST schrieb Lee Jones:
> On Thu, 27 May 2021, Alex Bee wrote:
> 
> > Document Rockchip RK3036/RK3228 qos compatibles
> > 
> > Signed-off-by: Alex Bee <knaerzche@gmail.com>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> > 
> >  Changes in v2:
> >  - collect Reviewed tag
> > 
> >  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Applied, thanks.

not sure if I'm missing something, but this patch wasn't part of your 5.14?
And I also don't see it in your for-mfd-next branch. Did it get lost somewhere?

Thanks
Heiko


