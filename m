Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9052D0CA4
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 10:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgLGJI7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 04:08:59 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:51997 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgLGJI7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 04:08:59 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1D47F60008;
        Mon,  7 Dec 2020 09:08:15 +0000 (UTC)
Date:   Mon, 7 Dec 2020 10:08:25 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] dt-bindings: media: eliminate yamllint warnings
Message-ID: <20201207090825.gbgpqidxyxfujqmg@uno.localdomain>
References: <20201207042400.1498-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201207042400.1498-1-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Zhen,

On Mon, Dec 07, 2020 at 12:23:56PM +0800, Zhen Lei wrote:
> These patches are based on the latest linux-next code.
>
> Zhen Lei (4):
>   dt-bindings: media: adv7604: eliminate yamllint warnings
>   dt-bindings: media: nokia,smia: eliminate yamllint warnings
>   dt-bindings: media: ov772x: eliminate yamllint warnings
>   dt-bindings: media: imx214: eliminate yamllint warnings

The adv7604, ov772x and imx214 bits have been addressed by:
https://www.spinics.net/lists/linux-media/msg181093.html

Thanks
  j

>
>  Documentation/devicetree/bindings/media/i2c/adv7604.yaml     |  4 ++--
>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml    | 11 ++++++-----
>  Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml | 12 ++++++------
>  Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml | 12 ++++++------
>  4 files changed, 20 insertions(+), 19 deletions(-)
>
> --
> 1.8.3
>
>
