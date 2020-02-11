Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F4B1597D5
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2020 19:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731159AbgBKSLA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Feb 2020 13:11:00 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34454 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbgBKSLA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Feb 2020 13:11:00 -0500
Received: by mail-pl1-f196.google.com with SMTP id j7so4586965plt.1;
        Tue, 11 Feb 2020 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=JMpOqqpilZ7AQlf3RCvgNhVJfJ1KLbsRxFC/cI9QVQo=;
        b=eGwF4julFDD+DYw/RF7rnhjymOoer+FSJpGyFtgigiiFJ1tGi2GVfVNfoSS+gcQb98
         Lhk6pI0lrWpY/poSOAOuYAgO339V2jjet3ajtIWb3U49Fp9+i0kj+BggHOciWfxq+pX9
         ulrxKssn031YIZMxRLHFoej/vc/Yu5phM41a1e6ICqZjbpktO/dE4uSfs7jMVpmSBGXZ
         Lqz7gJtDYYg10xUoqz6toQSxjMSvHhwTGJpSJpOJUBFJvBFpVd/+m9KT94hJlqQHDVUv
         3C7B1LLuGLxjdcfpszIyD2wtn16gbSWpnLingdQdkaGAEjwIgCh5hgBa7qZQNbDjwuiT
         rHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JMpOqqpilZ7AQlf3RCvgNhVJfJ1KLbsRxFC/cI9QVQo=;
        b=LA4jknZ330cn/E5OGMK5TC+e47bgHNbuYhYBGVzRW3OAWESHRQzPrr3z6M0/rg7/+5
         D7x2jiXWZ6NAAulemFaG0orEIfYCwLtxkyGm0eGqFC4Mh2svF6u51z7sSWOFr2lrzO1v
         x8BoN/9au1MWSyeBD+d+NBZuqhiZyIGXZg9QDR2AH6WV9u2CeIZcDAaly3EIpXRVQvfR
         Pa3Sr1BklhfeNCng3wZK207WJ6CxylkSDz1ZQlZ9ggPT7kfebcEHMKqIdPAgP5T7EpIT
         aSXYnrRGdGMK2XeTPFaLdYV4PyTbAPvIMPGmJhcs/VE/6+rY+0qneHvUV7Bo5+r/y+K4
         AiXQ==
X-Gm-Message-State: APjAAAXxkkZolQF0LS75+0WHs0VNpDpD5uH51a3+njl5FkeQxvGLECXM
        NOIk8Ox8rvL91VkGV0StD6fPDGGm
X-Google-Smtp-Source: APXvYqxY6c5GKr16qPJ8oLu++FgKXWeGitNZXYf0AeRBxYHPZ8pefxxfDnAdeBzg/ti9Ih6DIzzxIg==
X-Received: by 2002:a17:90a:bf0c:: with SMTP id c12mr4764969pjs.112.1581444659229;
        Tue, 11 Feb 2020 10:10:59 -0800 (PST)
Received: from [172.30.88.83] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id l21sm4840995pgo.33.2020.02.11.10.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 10:10:58 -0800 (PST)
Subject: Re: [PATCH] media: staging/imx: Missing assignment in
 imx_media_capture_device_register()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200211073522.jobdu256d22c3y32@kili.mountain>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <8cafab51-93d9-9596-bf4d-d8990df7ccda@gmail.com>
Date:   Tue, 11 Feb 2020 10:10:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211073522.jobdu256d22c3y32@kili.mountain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for catching. Tested on a imx6 sabreauto and it's fine.

On 2/10/20 11:35 PM, Dan Carpenter wrote:
> There was supposed to be a "ret = " assignment here, otherwise the
> error handling on the next line won't work.
>
> Fixes: 64b5a49df486 ("[media] media: imx: Add Capture Device Interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>

> ---
> Not tested.  Sometimes in these situations the function could be
> returning something bogus but no one knew because the assignment wasn't
> there.  So it's best to test these.
>
>   drivers/staging/media/imx/imx-media-capture.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 7712e7be8625..df0bf680721b 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -778,7 +778,7 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>   	/* setup default format */
>   	fmt_src.pad = priv->src_sd_pad;
>   	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -	v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt_src);
> +	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt_src);
>   	if (ret) {
>   		v4l2_err(sd, "failed to get src_sd format\n");
>   		goto unreg;

