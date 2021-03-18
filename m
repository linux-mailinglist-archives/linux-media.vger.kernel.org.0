Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9707D34001A
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 08:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhCRHRF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 03:17:05 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:48723 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229512AbhCRHQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 03:16:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MmtRlHbuHDUxpMmtUlhxUg; Thu, 18 Mar 2021 08:16:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616051793; bh=lh4ncnKzrsO1O+pyW3ae3E8r/aFbjztV9kxgx87clhM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KBbaSKWyUtw4FkAfko5Gg7aKP5LX8tlPcEl/fVOHrftzwC8Ir84VJiOIgxCHJ94TC
         Z/xE+b/a4o46Vmk2cil3T0hj70NWjUaC4LXpfbcYsnlArzB0Lu8cabjvSTLQReJ6pS
         qvbvgyH0esnOWfZzJXWjrCIZJewdZ3FZOXSeE2xntrr1IombalpGAu0asqm68mMA6u
         13eXOXT13WhV3pEVzy6ZHBtWfeOg5SRVfFVRBC6KQ+EpEMVTqfm0RVvRVxuQjURWBV
         ykjKAI4RXoOslNXToz5tKCs6ybnXAlNP8UZXyT2JZ19IiTFKbn+fpvtHi1Th2Txjh+
         Wf8ow+a5QXmng==
Subject: Re: [PATCH v6 05/17] media: pvrusb2: Do not check for
 V4L2_CTRL_WHICH_DEF_VAL
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Mike Isely <isely@pobox.com>
References: <20210317164511.39967-1-ribalda@chromium.org>
 <20210317164511.39967-6-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <72477f88-b5ec-6896-3c79-ab92ffa0bad2@xs4all.nl>
Date:   Thu, 18 Mar 2021 08:16:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317164511.39967-6-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCABKwoQ6xuldTzhZ3wPGBg95XGdKawUTq1gCdrshztX96OmIA7vHQXM6YEr3hCPQcXNRnbcc/ON3zC8BcEpuPChBoOY3zeVpbJnOkRTnUvzr69qskI2
 Awc6pG08ac3jCcPLeNbl3IZQMc2OXFUXCQ0j+FTzWfEPx6KzDkrxFnK24pSz5hBlorALOKs2mwF5CRKiTwrROfD0h+5FFV4YbuSIOiqIFAeUYVi7e0ZKFnsY
 viQlyodWOwheB03cwVxtMOp6eG06I+Z6I7l0FOvnMSEuHkw933sq3NacqpOygx+eTkUAYC/IQIESkOGXNk6Mdls4zv+CT3MjDLAKWykUhEh4CY4RQdyIWJd8
 DnkhSh5XzOl71EPTPILlERL9NxadEelUBMPiJlkkzMZGt89hsKfYmDnHkAWzKEYh3zfp24mPAy4Jd2SAFBHuEtmTN0nvAwSgLMFrktKSL+xxk6uRgj8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2021 17:44, Ricardo Ribalda wrote:
> The framework already checks for us if V4L2_CTRL_WHICH_DEF_VAL is
> written.
> 
> Cc: Mike Isely <isely@pobox.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> index 9657c1883311..c04ab7258d64 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> @@ -640,10 +640,6 @@ static int pvr2_s_ext_ctrls(struct file *file, void *priv,
>  	unsigned int idx;
>  	int ret;
>  
> -	/* Default value cannot be changed */
> -	if (ctls->which == V4L2_CTRL_WHICH_DEF_VAL)
> -		return -EINVAL;
> -
>  	ret = 0;
>  	for (idx = 0; idx < ctls->count; idx++) {
>  		ctrl = ctls->controls + idx;
> 

