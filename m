Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B472350E922
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 21:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235701AbiDYTIS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 15:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238763AbiDYTIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 15:08:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89102BC
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 12:05:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91ACD496;
        Mon, 25 Apr 2022 21:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650913511;
        bh=brv8uvar2hDXmnnSF8W8qT0Sm4xD7jV1+a9oWEQBAa8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L2rhVhab2ZLrzNrfdu8qNxcFRGRmRkbVvu/B4wGUEtrkgXwDKTPRNvKaa1cCAPlIe
         1hhSpDe4CmtN1OLF5M7TohGF1as1lwfui29b7kNj8dE3lei2kFPhIxqO1MBsdlswGl
         M/ODSQ2RCcpuOhHs4HRJhm5Z5IoTmELXtdDTMn80=
Date:   Mon, 25 Apr 2022 22:05:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 18/21] media: rkisp1: debug: Compute max register
 length name dynamically
Message-ID: <Ymbw52EF+Pcvkclz@pendragon.ideasonboard.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-19-laurent.pinchart@ideasonboard.com>
 <YmaK5XHQbKkfH6uR@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YmaK5XHQbKkfH6uR@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Mon, Apr 25, 2022 at 01:49:57PM +0200, Ricardo Ribalda wrote:
> Laurent Pinchart wrote:
> 
> > Don't hardcode the register name maximum length (used for alignment
> > purposes) to 14, but compute it dynamically. The small performance
> > impact isn't an issue as this is debugging code.
> 
> Not sure if we want this. Different files will have different alignment,
> which will look ugly if we cat them.

That's a good point. I wrote this patch to avoid maintaining the maximum
register name length manually, but I'm fine moving it to a macro instead
if that's preferred. It's debug code, so I don't mind much.

> Besides that, the code looks correct.
>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 21 +++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > index 2c226f20f525..28a69323cb38 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > @@ -11,8 +11,10 @@
> >  #include <linux/debugfs.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> > +#include <linux/minmax.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/seq_file.h>
> > +#include <linux/string.h>
> >  
> >  #include "rkisp1-common.h"
> >  #include "rkisp1-regs.h"
> > @@ -32,22 +34,29 @@ static int rkisp1_debug_dump_regs(struct rkisp1_device *rkisp1,
> >  				  struct seq_file *m, unsigned int offset,
> >  				  const struct rkisp1_debug_register *regs)
> >  {
> > +	const struct rkisp1_debug_register *reg;
> > +	int width = 0;
> >  	u32 val, shd;
> >  	int ret;
> >  
> > +	for (reg = regs; reg->name; ++reg)
> > +		width = max_t(int, width, strlen(reg->name));
> > +
> > +	width += 1;
> > +
> >  	ret = pm_runtime_get_if_in_use(rkisp1->dev);
> >  	if (ret <= 0)
> >  		return ret ? : -ENODATA;
> >  
> > -	for ( ; regs->name; ++regs) {
> > -		val = rkisp1_read(rkisp1, offset + regs->reg);
> > +	for (reg = regs; reg->name; ++reg) {
> > +		val = rkisp1_read(rkisp1, offset + reg->reg);
> >  
> > -		if (regs->shd) {
> > -			shd = rkisp1_read(rkisp1, offset + regs->shd);
> > -			seq_printf(m, "%14s: 0x%08x/0x%08x\n", regs->name,
> > +		if (reg->shd) {
> > +			shd = rkisp1_read(rkisp1, offset + reg->shd);
> > +			seq_printf(m, "%*s: 0x%08x/0x%08x\n", width, reg->name,
> >  				   val, shd);
> >  		} else {
> > -			seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
> > +			seq_printf(m, "%*s: 0x%08x\n", width, reg->name, val);
> >  		}
> >  	}
> >  

-- 
Regards,

Laurent Pinchart
