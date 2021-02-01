Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4315330A3A7
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 09:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbhBAIzJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 03:55:09 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:46971 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbhBAIzI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 03:55:08 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 41E5A1BF217;
        Mon,  1 Feb 2021 08:54:18 +0000 (UTC)
Date:   Mon, 1 Feb 2021 09:54:40 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v8 0/5] media: i2c: Add RDACM21 camera module
Message-ID: <20210201085440.zcc5kuu4gyiyasvy@uno.localdomain>
References: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210114170429.139762-1-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Jan 14, 2021 at 06:04:24PM +0100, Jacopo Mondi wrote:
> One more iteration to squash in all the fixups sent in v7 and address
> a comment from Sergei in [2/5] commit message.
>
> All patches now reviewed and hopefully ready to be collected!

All patches seems reviewed, do you think we can still collect this for
the v5.12 merge window ?

Thanks
  j

>
> Thanks
>   j
>
> Jacopo Mondi (5):
>   media: i2c: Add driver for RDACM21 camera module
>   dt-bindings: media: max9286: Document
>     'maxim,reverse-channel-microvolt'
>   media: i2c: max9286: Break-out reverse channel setup
>   media: i2c: max9286: Make channel amplitude programmable
>   media: i2c: max9286: Configure reverse channel amplitude
>
>  .../bindings/media/i2c/maxim,max9286.yaml     |  22 +
>  MAINTAINERS                                   |  12 +
>  drivers/media/i2c/Kconfig                     |  13 +
>  drivers/media/i2c/Makefile                    |   2 +
>  drivers/media/i2c/max9286.c                   |  60 +-
>  drivers/media/i2c/rdacm21.c                   | 623 ++++++++++++++++++
>  6 files changed, 719 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/media/i2c/rdacm21.c
>
> --
> 2.29.2
>
