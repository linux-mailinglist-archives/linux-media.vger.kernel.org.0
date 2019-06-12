Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E9641F08
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 10:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407641AbfFLI1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 04:27:05 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34533 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405127AbfFLI1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 04:27:04 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hayb1-0004pM-8f; Wed, 12 Jun 2019 10:27:03 +0200
Message-ID: <1560328022.5160.0.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] drivers: media: coda: fix warning same module
 names
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Anders Roxell <anders.roxell@linaro.org>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 12 Jun 2019 10:27:02 +0200
In-Reply-To: <20190612081550.2255-1-anders.roxell@linaro.org>
References: <20190612081550.2255-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-06-12 at 10:15 +0200, Anders Roxell wrote:
> When building with CONFIG_VIDEO_CODA and CONFIG_CODA_FS enabled as
> loadable modules, we see the following warning:
> 
> warning: same module names found:
>   fs/coda/coda.ko
>   drivers/media/platform/coda/coda.ko
> 
> Rework so media/platform/coda is named coda-vpu. Leaving CODA_FS as is
> since that's a well known module.
> 
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  drivers/media/platform/coda/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/Makefile b/drivers/media/platform/coda/Makefile
> index 54e9a73a92ab..5fd5efa35159 100644
> --- a/drivers/media/platform/coda/Makefile
> +++ b/drivers/media/platform/coda/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -coda-objs := coda-common.o coda-bit.o coda-gdi.o coda-h264.o coda-mpeg2.o coda-mpeg4.o coda-jpeg.o
> +coda-vpu-objs := coda-common.o coda-bit.o coda-gdi.o coda-h264.o coda-mpeg2.o coda-mpeg4.o coda-jpeg.o
>  
> -obj-$(CONFIG_VIDEO_CODA) += coda.o
> +obj-$(CONFIG_VIDEO_CODA) += coda-vpu.o

Thanks,
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
