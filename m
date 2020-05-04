Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEB61C3557
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgEDJOh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726467AbgEDJOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 05:14:36 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65443C061A0E
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 02:14:36 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e26so7600557wmk.5
        for <linux-media@vger.kernel.org>; Mon, 04 May 2020 02:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BmVMc7UKLdiuTwiPWoTqq3GgP0uVOQe/qjS3P8pMe9I=;
        b=TqJ3DIHZ/IZk6mXHOJ8WqA4feSKeBAXwK2b6sTgrpXtVAwkvrh1xmb0EEpXrer7kzY
         vbTfieAks+hEgtw3T/YtRn7IA0bckQ7MkR+2l5+hPtNEpT0+gJwSuSorjIfVK5dcQpAn
         4aKWgAdHpP2GQ85d47BIOgbUoUnq4wa/CAm4xG76OUnDxERYqnOnwbs8Cd5IKAfm/fK2
         m5uiSCYdRzK0Dut9SQZhdb3lk1lFaxVNCO2pp2YbPio3RZL1NCp1SFp9ZNfnrI47zFe8
         2uSC/10/95xnAADHNC86A7jSwcX3G8oRbpHdCzlpIR9QGrIijHplBDYQh4bmNzLSqztD
         EbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BmVMc7UKLdiuTwiPWoTqq3GgP0uVOQe/qjS3P8pMe9I=;
        b=U+ROhVoPOitl/+VwYud/8T/lsg/A2pYLMZFM4+HKOXZo2svAzX6H7ofRg5sGBUnX83
         Hkcu9c+gCAx+T2e8bCsUVWDt6r7xIee5L6HpnosAOx0D5AT5C1FBf9PEf0GW67JPYR5P
         noXTtpKxiFO3AYeTPVs+hB346O377XvOwEgTtp6LT86sTQc/G9QGDYvyljTzeVxz8mUp
         4R4k4eoV+Tn7GPMYhGK/mmqQkR+40eFaw3biHRE7+Bi19x3SRaALTzrwtRgi8MpmyFo3
         COmTsdPyxQRPrgb3FMsVPosq27kR1h17/jIzhoxBEazrTsIfRKRW8M85I7S/qnHwx6qe
         eRgQ==
X-Gm-Message-State: AGi0PuZDl62G8pYlHsMyEkRxI337k3SPWn2VYt3Ha/r3bF0WQEeyI5ge
        m/hGtfOXRwnS42YZ8v1iEXg=
X-Google-Smtp-Source: APiQypLBV0D5do5BqtIWWZqTftXJDhCweajo3Fp4n05/CnCBZJY0l7YHWrzbGYw5yEVeduBgHqKS8w==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr14082838wmc.85.1588583675193;
        Mon, 04 May 2020 02:14:35 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id 17sm11998984wmo.2.2020.05.04.02.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 02:14:34 -0700 (PDT)
Date:   Mon, 4 May 2020 10:14:32 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v6 11/22] media: imx: imx7-media-csi: Implement
 get_fwnode_pad op
Message-ID: <20200504091432.3sqyzqkbf63ugazr@arch-thunder.localdomain>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
 <20200501171556.14731-12-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501171556.14731-12-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
On Fri, May 01, 2020 at 10:15:45AM -0700, Steve Longerbeam wrote:
> Use v4l2_subdev_get_fwnode_pad_1_to_1() as the get_fwnode_pad operation.
> The i.MX7 CSI maps port numbers and pad indexes 1:1.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index abef59dc22b6..c74455f65b3e 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1179,6 +1179,7 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
>  static const struct media_entity_operations imx7_csi_entity_ops = {
>  	.link_setup	= imx7_csi_link_setup,
>  	.link_validate	= v4l2_subdev_link_validate,
> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
>  };
>  
>  static const struct v4l2_subdev_video_ops imx7_csi_video_ops = {
> -- 
> 2.17.1
> 
