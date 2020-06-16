Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC171FAE58
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 12:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgFPKpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 06:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgFPKpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 06:45:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AB1C08C5C2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 03:45:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D600FF9;
        Tue, 16 Jun 2020 12:45:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592304303;
        bh=K94o9FZtrapwuGujdotomzWpgObiKgxVKM3aL41RC+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gn0Rj5J+Y4cU2LlFw4oaEA9opbgwtWUpzWfl5c6zmofe/mS/bW6VYHzRIc9C2iiUh
         GHSi3sVw7KOnJX05+med18hC+dJAuTqPM5n+n9Qz2e7tWB9INc2A5/LPYaLz+J2KmU
         0KcnbVa+Nw9zg6FjF1+CO0P7QLd8xpbnsQuE9ANw=
Date:   Tue, 16 Jun 2020 13:44:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v1 006/107] media: ti-vpe: cal: Merge all status
 variables in IRQ handler
Message-ID: <20200616104440.GA19010@pendragon.ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
 <20200614235944.17716-7-laurent.pinchart@ideasonboard.com>
 <7f6d0a6e-de9f-53c0-9aa3-9be8dc9b3240@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f6d0a6e-de9f-53c0-9aa3-9be8dc9b3240@ti.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Jun 16, 2020 at 01:32:17PM +0300, Tomi Valkeinen wrote:
> On 15/06/2020 02:58, Laurent Pinchart wrote:
> > The cal_irq() function reads three IRQ status registers and stores their
> > values in three different variables. As each value is processed right
> > after reading the corresponding register, a single variable is enough.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/media/platform/ti-vpe/cal.c | 35 +++++++++++++----------------
> >   1 file changed, 15 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> > index b04d8cb86977..0a5fb81223da 100644
> > --- a/drivers/media/platform/ti-vpe/cal.c
> > +++ b/drivers/media/platform/ti-vpe/cal.c
> > @@ -1206,19 +1206,18 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
> >   	struct cal_dev *dev = (struct cal_dev *)data;
> >   	struct cal_ctx *ctx;
> >   	struct cal_dmaqueue *dma_q;
> > -	u32 irqst0, irqst1, irqst2;
> > +	unsigned int i;
> > +	u32 status;
> >   
> > -	irqst0 = reg_read(dev, CAL_HL_IRQSTATUS(0));
> > -	if (irqst0) {
> > -		int i;
> 
> I do like to keep local variables inside smaller scopes when possible,
> as it reduces chances for bugs. Any reason you moved i to the whole
> function scope?

I do the same as well, but tend to keep variables used in multiple
smaller scopes as top-level variables. I'm fine multiple instances of
'i' if you prefer.

-- 
Regards,

Laurent Pinchart
