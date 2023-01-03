Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E961D65C131
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 14:53:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237559AbjACNwr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 08:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237505AbjACNwq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 08:52:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1452C4F
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 05:52:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2ECEB108;
        Tue,  3 Jan 2023 14:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672753964;
        bh=zuNi/JbW4vTy7FeUMeaLjpzRHCiTCj9Rf0d+Qyxn900=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rqKoFsYSz7EyTXIYh1XMSB1746EWbO9DgjgWvz84G98dlNP5TbPKdRgA/wHxicfo2
         344lS9uiBi8VPS1xSkmoY35jmwqhrzz3QCWG4CbOjBJ4Lanuah5h/5R6EK9BIzTZpp
         /cs55mCPgU/uw7zzCviVRQMgsUwbByhKliXYSmyg=
Date:   Tue, 3 Jan 2023 15:52:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] media: dw100: Add a missing unwind goto in dw100_probe()
Message-ID: <Y7QzKAbCxiu7+sgs@pendragon.ideasonboard.com>
References: <20230103105534.3018257-1-xavier.roumegue@oss.nxp.com>
 <1962839.8hb0ThOEGa@steina-w>
 <42a8016a-8922-236d-30a7-9b12b53a9bb9@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <42a8016a-8922-236d-30a7-9b12b53a9bb9@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Xavier,

On Tue, Jan 03, 2023 at 02:35:35PM +0100, Xavier Roumegue (OSS) wrote:
> On 1/3/23 12:01, Alexander Stein wrote:
> > Am Dienstag, 3. Januar 2023, 11:55:34 CET schrieb Xavier Roumegue (OSS):
> >> From: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> >>
> >> In case the IRQ allocation returns an error in dw100_probe(), the pm
> >> runtime is not disabled before to return.
> >>
> >> Add the missing unwind goto on the error handling path of the IRQ
> >> allocation request.
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Reported-by: Dan Carpenter <error27@gmail.com>
> >> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> >> ---
> >>   drivers/media/platform/nxp/dw100/dw100.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/nxp/dw100/dw100.c
> >> b/drivers/media/platform/nxp/dw100/dw100.c index f6d48c36f386..189d60cd5ed1
> >> 100644
> >> --- a/drivers/media/platform/nxp/dw100/dw100.c
> >> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> >> @@ -1571,7 +1571,7 @@ static int dw100_probe(struct platform_device *pdev)
> >>   			       dev_name(&pdev->dev), dw_dev);
> >>   	if (ret < 0) {
> >>   		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
> >> -		return ret;
> >> +		goto err_pm;
> >>   	}
> >>
> >>   	ret = v4l2_device_register(&pdev->dev, &dw_dev->v4l2_dev);
> > 
> > Doesn't it make more sense to request/allocate the IRQ (and other resources)
> > before enabling runtime PM?
>
> I would say this does as much sense as the other way around, as soon as 
> something wrong happens, you have to restore things as it was prior to enter 
> your routine. The most optimal function call ordering should depend on the 
> failing occurrence likelihood of each individual function.
> On the probe path, I assume none of the functions are expected to fail.
> But I understand one could argue differently.
> 
> So for the time being, this oneliner patch addresses the issue reported by the 
> robot.

I think that Alexander's point was that, as you request the IRQ with
devm_request_irq(), you could just return in case of error if this was
done before any other operation that requires a cleanup. In this case,
however, enabling runtime PM is done so that the device gets reset,
which I think is important to do before requesting the IRQ, otherwise
spurious IRQs could happen if the device was left in a weird state.

A comment above runtime PM enable would be useful to record the reason
why the current order is required. You could add that in a v2 of this
patch, or in a separate patch. In either case,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
