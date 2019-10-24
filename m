Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1693E3637
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 17:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409599AbfJXPLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 11:11:24 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33553 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407327AbfJXPLY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 11:11:24 -0400
Received: by mail-pf1-f194.google.com with SMTP id c184so5824212pfb.0
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9PJr+QTxz2B0wV3wNYY8ZRw+ZEelcSAfwVm8qIl6sHs=;
        b=isSLqGdaVwHr91at9sd0eaaZDkiZ/hI0r8UAUxnOWOcSTYeyJBwfraTKay9aaio6LG
         +gcXc07PZdFvH91vgwh47v4DTC5yEnoiyyWbKJ252TnzKQiGBi/y04bBuc1x4bMHrn6i
         lSOQFMfBywn104KvTxniKWi0xx0fhjWxy8O1ceWN6LaMNmb4Bf/b7duulqwQQJQJcRXB
         DyrYIRG9CFJV1oN38oCOMzvuAy0tWHqAHg9kY3Nnfo+6bcEoFSjxFpGtv+3R7rZPjzL2
         /RxaYbDXMF8UtHRO1Q+l28xVIG6V6kLjWIMe9zaH4YfrzDGzoQnN+pvHH02J3xeiy83b
         AC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9PJr+QTxz2B0wV3wNYY8ZRw+ZEelcSAfwVm8qIl6sHs=;
        b=dMGWm52H7tKP9eB+D9B0a9Z9cAm/JijiHHYPjQJAtWUAgFwAJkMx5eu39M3sPD0M6C
         kcJry6ha03nT+9SXzFcWVDR4wUGvXzxwWG0xhx5G0erup1n1szUCRIHeKSjMcCfrOTpw
         NwJnfYLtXRwZz1yEVhyspSHsnZxCzeuvprKEa5RpGgn6vg+DqoMv4jUjVpmT6TyH2uIA
         3l3l9EA/F5js2bg50cCbJZsBcYxvfDrU3osnRh93M2VPQoBcviaDSoD1RBTsfPE04Ll4
         D+zC78/I7u4b50nJaGNsIM9wNDshm3EFrSi+28yO4hWvjiG4ZXjVPnLIZcjUfCRrtjWx
         IgXg==
X-Gm-Message-State: APjAAAUqdCpDmvUFILCeTpXKXkgniG6LOzdJvCvF5Px8b1+nv4TkqLrG
        VuppkkRJUN0Gfoau6DXmgfg=
X-Google-Smtp-Source: APXvYqwdBn06jOyUEZGFr6Ns2+FBZwx2ZfR6oUYgYqejmHpibX/LTcgIIJozrMmjJaOD4IFdTf8FLQ==
X-Received: by 2002:a63:2c53:: with SMTP id s80mr14347142pgs.377.1571929881821;
        Thu, 24 Oct 2019 08:11:21 -0700 (PDT)
Received: from [192.168.1.59] (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.gmail.com with ESMTPSA id g4sm25707800pfo.33.2019.10.24.08.11.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 08:11:21 -0700 (PDT)
Subject: Re: [PATCH 7/7] media: imx: imx7-media-csi: Fix video field handling
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
 <20191024004155.32068-8-laurent.pinchart@ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <3d979bfa-0bb2-0dde-9bc7-83ee3923d33a@gmail.com>
Date:   Thu, 24 Oct 2019 08:11:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024004155.32068-8-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 10/23/19 5:41 PM, Laurent Pinchart wrote:
> Commit 4791bd7d6adc ("media: imx: Try colorimetry at both sink and
> source pads") reworked the way that formats are set on the sink pad of
> the CSI subdevice, and accidentally removed video field handling.

Well, let me restate the problem. This driver never did have correct 
field handling (as you demonstrate in this patch, the driver never 
set/propagated the field type to its source pad). So it's not accurate 
to say the patch is a fix. A better description is that it adds 
rudimentary field handling.

Steve

> Restore it by defaulting to V4L2_FIELD_NONE if the field value isn't
> supported, with the only two supported value being V4L2_FIELD_NONE and
> V4L2_FIELD_ALTERNATE.
>
> Fixes: 4791bd7d6adc ("media: imx: Try colorimetry at both sink and source pads")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/staging/media/imx/imx7-media-csi.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index ac07f55a63e3..0db6473caf13 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1017,6 +1017,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
>   		sdformat->format.width = in_fmt->width;
>   		sdformat->format.height = in_fmt->height;
>   		sdformat->format.code = in_fmt->code;
> +		sdformat->format.field = in_fmt->field;
>   		*cc = in_cc;
>   
>   		sdformat->format.colorspace = in_fmt->colorspace;
> @@ -1031,6 +1032,9 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
>   							 false);
>   			sdformat->format.code = (*cc)->codes[0];
>   		}
> +
> +		if (sdformat->format.field != V4L2_FIELD_INTERLACED)
> +			sdformat->format.field = V4L2_FIELD_NONE;
>   		break;
>   	default:
>   		return -EINVAL;

