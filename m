Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2899AFE25A
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 17:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfKOQLC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 11:11:02 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40769 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbfKOQLC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 11:11:02 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iVeBZ-0002s0-2g; Fri, 15 Nov 2019 17:11:01 +0100
Message-ID: <272dedf2cc25053475e9536b446b434f4754f62c.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/3] media: hantro: Support color conversion via
 post-processing
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
Date:   Fri, 15 Nov 2019 17:10:59 +0100
In-Reply-To: <dc637b43a4ef4609f9200f3fc91ee76fef75f64a.camel@collabora.com>
References: <20191113175603.24742-1-ezequiel@collabora.com>
         <20191113175603.24742-3-ezequiel@collabora.com>
         <1e1c7a0e3d25187723ccac1a8360b5aae9aed8cd.camel@pengutronix.de>
         <dc637b43a4ef4609f9200f3fc91ee76fef75f64a.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Fri, 2019-11-15 at 12:44 -0300, Ezequiel Garcia wrote:
> Hello Philipp,
> 
> Thanks for reviewing.
> 
> On Thu, 2019-11-14 at 10:48 +0100, Philipp Zabel wrote:
[...]
> > Why isn't PP enabled in prepare_run? Does this mean the first frame is
> > not post-processed?
> > 
> 
> No, because hantro_finish_run is called (despite its name)
> before the decoding operation is actually triggered.
> 
> I guess this hantro_finish_run name adds some confusion:
> prepare_run and finish_run should be something along
> start_prepare_run, end_prepare_run. 

Ah, ok then. I was confused because I just came from looking at coda-vpu 
code, where finish_run is a callback called after the device has
finished processing. Maybe I should rename that as well.

> And also, perhaps disabling the post-processor in prepare_run
> works just fine. I need to check that.

Ok.

[...]
> > > +#define HANTRO_PP_REG_WRITE_S(vpu, reg_name, val) \
> > > +	do { \
> > > +		if ((vpu)->variant->postproc_regs->(reg_name).base)	\
> > > +			hantro_reg_write((vpu), \
> > > +					 &(vpu)->variant->postproc_regs->(reg_name), \
> > > +					 (val)); \
> > > +	} while (0)
> > 
> > Why all these checks, are any of the register fields optional?
> > 
> 
> That was the plan. Perhaps now it makes less sense,
> but maybe it's safer this way, if it's extended?
> 
> OTOH, we might want to make sure the driver fails (or warns).

I think that would be better than silently ignoring them.

Although I don't quite see the point in repeatedly checking the presence
of mandatory register fields at runtime.

regards
Philipp

