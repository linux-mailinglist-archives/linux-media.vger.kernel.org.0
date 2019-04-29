Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E37E9DF0C
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 11:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbfD2JN4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 05:13:56 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42841 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbfD2JN4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 05:13:56 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hL2ME-00055Y-Sr; Mon, 29 Apr 2019 11:13:54 +0200
Message-ID: <1556529234.3009.4.camel@pengutronix.de>
Subject: Re: [PATCH 3/5] media: coda: Replace the threaded interrupt with a
 hard interrupt
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     kernel@collabora.com
Date:   Mon, 29 Apr 2019 11:13:54 +0200
In-Reply-To: <47a776d4d5e8e169924e1c55d5be42325225f1d7.camel@collabora.com>
References: <20190425183546.16244-1-ezequiel@collabora.com>
         <20190425183546.16244-4-ezequiel@collabora.com>
         <1556270218.3664.8.camel@pengutronix.de>
         <47a776d4d5e8e169924e1c55d5be42325225f1d7.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
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

On Fri, 2019-04-26 at 14:56 -0300, Ezequiel Garcia wrote:
> Hi Philipp,
> 
> Thanks for the quick review of the series.
> 
> On Fri, 2019-04-26 at 11:16 +0200, Philipp Zabel wrote:
> > On Thu, 2019-04-25 at 15:35 -0300, Ezequiel Garcia wrote:
> > > The current interrupt handler is doing very little, and not doing
> > > any non-atomic operations. Pretty much all it does is accessing
> > > a couple registers, taking a couple spinlocks and then signalling
> > > a completion.
> > > 
> > > There is no reason this should be a threaded interrupt handler,
> > > so move the handler to regular hard interrupt context.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  drivers/media/platform/coda/coda-common.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> > > index 1f53ca4effd2..617d4547ec82 100644
> > > --- a/drivers/media/platform/coda/coda-common.c
> > > +++ b/drivers/media/platform/coda/coda-common.c
> > > @@ -2789,8 +2789,8 @@ static int coda_probe(struct platform_device *pdev)
> > >  		return irq;
> > >  	}
> > >  
> > > -	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, coda_irq_handler,
> > > -			IRQF_ONESHOT, dev_name(&pdev->dev), dev);
> > > +	ret = devm_request_irq(&pdev->dev, irq, coda_irq_handler, 0,
> > > +			       dev_name(&pdev->dev), dev);
> > >  	if (ret < 0) {
> > >  		dev_err(&pdev->dev, "failed to request irq: %d\n", ret);
> > >  		return ret;
> > 
> > There is one thing that this would complicate. For at least H.264 I
> > know that we can pad the bitstream in reaction to a BIT_BUF_EMPTY
> > interrupt, to make a picture run finish successfully when it is stuck in
> >   buffer underrun condition. This would need to be done under the
> > bitstream_mutex in a threaded handler.
> > 
> 
> In this case, a top-half handler would still stand in good stead,
> as it would check the interrupt status, and fire the bottom-half
> threaded interrupt to handle the buffer underrun.

I agree, and the R-b stands.

regards
Philipp
