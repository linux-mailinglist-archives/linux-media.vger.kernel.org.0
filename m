Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CC72FF1E4
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 18:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388423AbhAURNw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 12:13:52 -0500
Received: from gloria.sntech.de ([185.11.138.130]:41170 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388589AbhAURNf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 12:13:35 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l2dVf-0005Fz-F8; Thu, 21 Jan 2021 18:12:39 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
        Helen Koike <helen.koike@collabora.com>
Cc:     ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v8 4/6] media: rockchip: rkisp1: reduce number of histogram grid elements in uapi
Date:   Thu, 21 Jan 2021 18:12:38 +0100
Message-ID: <2974513.zE8UqtGg2D@diego>
In-Reply-To: <c9d0ac1b-2cb7-a5b6-aa97-1510c44404c1@collabora.com>
References: <20210121144407.9045-1-dafna.hirschfeld@collabora.com> <20210121144407.9045-5-dafna.hirschfeld@collabora.com> <c9d0ac1b-2cb7-a5b6-aa97-1510c44404c1@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Am Donnerstag, 21. Januar 2021, 18:04:49 CET schrieb Helen Koike:
> Hi Dafna,
> 
> On 1/21/21 11:44 AM, Dafna Hirschfeld wrote:
> > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > 
> > The uapi right now specifies an array size of 28 but the actual number
> > of elements is only 25 with the last 3 being unused.
> > 
> > Reduce the array size to the correct number of elements and change
> > the params code to iterate the array 25 times.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 3 ++-
> >  include/uapi/linux/rkisp1-config.h                     | 3 +--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 6af4d551ffb5..021939466b24 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -589,7 +589,6 @@ static void rkisp1_hst_config(struct rkisp1_params *params,
> >  		RKISP1_CIF_ISP_HIST_WEIGHT_22TO03,
> >  		RKISP1_CIF_ISP_HIST_WEIGHT_13TO43,
> >  		RKISP1_CIF_ISP_HIST_WEIGHT_04TO34,
> > -		RKISP1_CIF_ISP_HIST_WEIGHT_44,
> >  	};
> >  	const u8 *weight;
> >  	unsigned int i;
> > @@ -622,6 +621,8 @@ static void rkisp1_hst_config(struct rkisp1_params *params,
> >  							    weight[2],
> >  							    weight[3]),
> >  				 hist_weight_regs[i]);
> > +
> > +	rkisp1_write(params->rkisp1, weight[0] & 0x1F, RKISP1_CIF_ISP_HIST_WEIGHT_44);
> 
> I just noticed that the default value to arg->hist_weight was:
> 
> 	memset(hst.hist_weight, 0x01, sizeof(hst.hist_weight));
> 
> Shouldn't the value be RKISP1_CIF_ISP_HIST_WEIGHT_SET(weight[0], 0x01, 0x01, 0x01) ?
> Or am I missing something?

The last register only has that one value from weight[24];

I.e. before we were writing the 4 values into that last register as well
from indices 24, 25, 26, 27 ... hence the 3 unused values in the weight array.

But that was merely a crutch to make that fit into the write loop.


Heiko


> >  }
> >  
> >  static void
> > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > index 24f05d6d258f..35aa82d5f6dd 100644
> > --- a/include/uapi/linux/rkisp1-config.h
> > +++ b/include/uapi/linux/rkisp1-config.h
> > @@ -102,8 +102,7 @@
> >  /*
> >   * Histogram calculation
> >   */
> > -/* Last 3 values unused. */
> > -#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 28
> > +#define RKISP1_CIF_ISP_HISTOGRAM_WEIGHT_GRIDS_SIZE 25
> >  
> >  /*
> >   * Defect Pixel Cluster Correction
> > 
> 




