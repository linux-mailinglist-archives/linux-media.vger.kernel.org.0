Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBA3011DF42
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 09:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbfLMIVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 03:21:39 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36141 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfLMIVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 03:21:39 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so5574301wma.1
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2019 00:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B1eP2vkRbC7o7mbRoosyYPfjuzYz86reSm5iy2bvyDE=;
        b=kQfeAAlxqo8WfaG9lwUWtue1krS96nVizRUmcqoq9DTzvsYUMgxmBG7GY5XPhcg0Jg
         L5rqvOO0JvRMd1y7IQzz6Xv0JVhy3xHLVMONICrBL0F+RPEXwUuin01k9tRSvA9MWPFE
         iAo53qAQSH/uUZmYOmq+a6BPc48lBqcW6kKBMYCRYAjD6SkRs+h67q0GZgEtrZYsJ3cW
         Tc/mzS/1QLSrltoP8xLJArAf9ygYPTd7Jq7CfjIs67lRsqUk5deur4yJmE1I3TbYpD0u
         J3lmz1+3eNKaJrAoFGDiEIkr6Qm2GpZd098icu97VOmJCuNn1Nbl9/zPyroozMnNGCT9
         BhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B1eP2vkRbC7o7mbRoosyYPfjuzYz86reSm5iy2bvyDE=;
        b=AUQnF9M2uyOZIN431vi/ZOtZ5sh/sj8Rc135c4KZ1ybeQBt8ZdPl/vHJIrqIbL5axl
         /VquJ41RkX3+GOZt7dtVrakBuW5jP5+xlkj4ittci+dYqG4qqlxRH8HpszNo4BYwcrF3
         uyoWfzs/thgC1+xHHDcxlE75vWbcmgb1Iiubtd7FVVi4pM65Y1kB21mGsaouZtEpKX6B
         nkvoYgAWEkCe019IeJqxEjHPCZriAaFjKoxwFRCTRilV7/DJ/WzRMvZFWLD+QDzVvSvZ
         onKvkYsOaKhw/e7xfwsQ+gGw1m6sYx96A29ApCIJ9HcnSvrclxp+vc0M500RPwEnP+Qz
         hyAw==
X-Gm-Message-State: APjAAAWxzZXhwfoidSEt7Y6PGAKjDYU0VHvZw7PwpwLZz/441Bn+RTSa
        bXhebc1NTLegnwPmmKcRs5WW5w==
X-Google-Smtp-Source: APXvYqwjzFG03gi4VEfJvOP4v6eaEtaYjEoGzITtfG5ZYq+8xgAyjTc6kZp+0NgLMgrFyoAy98Zmlw==
X-Received: by 2002:a1c:9ec6:: with SMTP id h189mr11828959wme.28.1576225297295;
        Fri, 13 Dec 2019 00:21:37 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id q15sm9067850wrr.11.2019.12.13.00.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 00:21:36 -0800 (PST)
Date:   Fri, 13 Dec 2019 08:21:33 +0000
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: imx7-mipi-csis: remove subdev_notifier
Message-ID: <20191213082133.sdx4dquynxcneile@arch-thunder.localdomain>
References: <20191212191714.812249-1-rmfrfs@gmail.com>
 <13a26524-fa5e-1619-5026-d9b076271988@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13a26524-fa5e-1619-5026-d9b076271988@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
On Fri, Dec 13, 2019 at 08:59:22AM +0100, Hans Verkuil wrote:
> On 12/12/19 8:17 PM, Rui Miguel Silva wrote:
> > It was defined a notifier in the csi_state structure that is never
> > allocated. And besides that it's unregister in the remove, even
> > though it is a no-op, just remove both.
> > 
> > Fixes: 7807063b862b ("media: staging/imx7: add MIPI CSI-2 receiver
> > subdev for i.MX7") Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> 
> Mismatch between this Signed-off-by and your email address.  Is it
> OK if I use your linaro email in this Signed-off-by?

Yeah, no problem. go ahead. Thanks.

------
Cheers,
     Rui

> 
> Regards,
> 
> 	Hans
> 
> > --- drivers/staging/media/imx/imx7-mipi-csis.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c
> > b/drivers/staging/media/imx/imx7-mipi-csis.c index
> > 99166afca071..383abecb3bec 100644 ---
> > a/drivers/staging/media/imx/imx7-mipi-csis.c +++
> > b/drivers/staging/media/imx/imx7-mipi-csis.c @@ -251,8 +251,6 @@
> > struct csi_state {
> >  
> >  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> >  
> > -	struct v4l2_async_notifier subdev_notifier; - struct
> > csis_hw_reset hw_reset; struct regulator *mipi_phy_regulator; bool
> > sink_linked; @@ -1104,7 +1102,6 @@ static int
> > mipi_csis_remove(struct platform_device *pdev)
> >  
> >  	mipi_csis_debugfs_exit(state);
> >  	v4l2_async_unregister_subdev(&state->mipi_sd); -
> >  	v4l2_async_notifier_unregister(&state->subdev_notifier);
> >  
> >  	pm_runtime_disable(&pdev->dev);
> >  	mipi_csis_pm_suspend(&pdev->dev, true);
> > 
> 
