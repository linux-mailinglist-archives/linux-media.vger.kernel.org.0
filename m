Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A5B9AE77
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 13:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393166AbfHWLzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 07:55:13 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:37249 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393004AbfHWLzM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 07:55:12 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 189rikgyQThuu189uiot9S; Fri, 23 Aug 2019 13:55:10 +0200
Subject: Re: [GIT PULL for 5.4] A10 CSI driver and atmel-isi fix
To:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     maxime.ripard@bootlin.com
References: <20190823073109.GR3504@valkosipuli.retiisi.org.uk>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f930291a-8d00-28a4-57e0-f5cfc2d40322@xs4all.nl>
Date:   Fri, 23 Aug 2019 13:55:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190823073109.GR3504@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfG81OlVJ4nNJ1O2UVn+UsQQzOYxoo85ApF2V0NFAApMLauhbcT9cwlCo+4D1sq0Pr3fCUfhWWRBMyD+K7X+OFAqncGMJ/sbxx5cjycLVuYR+HGal+iLQ
 a1GKnloTEn/YnQaeN+dKD0oXzJHsmruHJ6nS2HRN0kcELteiwQ+57l6+//tcR0liuLRuLSiKypLLpacvBKWrPphw5oAyWkPbiBa73N5BilObBlx3JyGHN93C
 P3o79fbRSJjgJg/xcPcGVA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On 8/23/19 9:31 AM, Sakari Ailus wrote:
> Hi Mauro,
> 
> Here's a driver for A10 CSI parallel receiver and a fix for atmel-isi.
> 
> There are three checkpatch.pl warnings; two on Makefile / Kconfig on
> MAINTAINERS (i.e. not worth mentioning in MAINTAINERS) while the third is
> on a spinlock missing a comment. If you'd like the last one to be
> addressed, I'm proposing doing that in a separate patch.

When running sparse I get this warning:

drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c:21:31:  warning: symbol 'sun4i_csi_formats' was not declared. Should it be static?

Can you post a follow-up patch for this?

Regards,

	Hans

> 
> Please pull.
> 
> 
> The following changes since commit 01faced6f65d0224bf6ce1262a4137771e28519f:
> 
>   media: dt-bindings: media: Convert Allwinner A10 IR to a schema (2019-08-21 18:39:55 -0300)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/for-5.4-7-signed
> 
> for you to fetch changes up to 494630237a2ce13f1e0b8fe06b48811ce5254ce4:
> 
>   media: sunxi: Add A10 CSI driver (2019-08-23 10:25:33 +0300)
> 
> ----------------------------------------------------------------
> A10 CSI1 driver + sensor fix
> 
> ----------------------------------------------------------------
> Alexandre Kroupski (1):
>       media: atmel: atmel-isi: fix timeout value for stop streaming
> 
> Maxime Ripard (3):
>       dt-bindings: media: Add Allwinner A10 CSI binding
>       media: sunxi: Refactor the Makefile and Kconfig
>       media: sunxi: Add A10 CSI driver
> 
>  .../bindings/media/allwinner,sun4i-a10-csi.yaml    | 109 +++++
>  MAINTAINERS                                        |   8 +
>  drivers/media/platform/Kconfig                     |   2 +-
>  drivers/media/platform/Makefile                    |   2 +-
>  drivers/media/platform/atmel/atmel-isi.c           |   2 +-
>  drivers/media/platform/sunxi/Kconfig               |   2 +
>  drivers/media/platform/sunxi/Makefile              |   2 +
>  drivers/media/platform/sunxi/sun4i-csi/Kconfig     |  11 +
>  drivers/media/platform/sunxi/sun4i-csi/Makefile    |   5 +
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 314 ++++++++++++++
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h | 160 ++++++++
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 454 +++++++++++++++++++++
>  .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    | 385 +++++++++++++++++
>  13 files changed, 1453 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
>  create mode 100644 drivers/media/platform/sunxi/Kconfig
>  create mode 100644 drivers/media/platform/sunxi/Makefile
>  create mode 100644 drivers/media/platform/sunxi/sun4i-csi/Kconfig
>  create mode 100644 drivers/media/platform/sunxi/sun4i-csi/Makefile
>  create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
>  create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
>  create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
>  create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
> 

