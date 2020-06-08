Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6091F1A27
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 15:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729737AbgFHNda (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 09:33:30 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33845 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729179AbgFHNda (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 09:33:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iHu1jRSdCCKzeiHu4jmU3N; Mon, 08 Jun 2020 15:33:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591623208; bh=5H+JcZQ+j0L/vRy7m5zEivWFD9SEuLtRzpP2UWOMfL0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gP9L0s7YbcffMFxsWH+tTVbYch5x52O+hBL4JPu7NCl6+0+vxphSASyWVRTFxD77u
         2FaQ1Dc3zLt81hPUXAtysbVXARu8RevayB9Z1RkRVWG7HgZ7ZkJ9Wyv9lDKttOA6vY
         YDD3GBW5nkwxDq/93Foad7YOWlH+zt09LcfjSVTCPkNpWpxBU8HP+o4Q6lccB4N7Te
         iwDEQkUhpG0CfO07aShZioQgJuCIXXO6lxAli67OMF0FxQQVAzs0TmBJkg++2xz/7V
         SjiqRvTwJThJeI9hY8im+T1PaGUjrqOtROoSw7bG0jw0bl88DTpDwNSvltcTbQ6PuP
         p3FX31vzKzwPQ==
Subject: Re: [PATCH] media: bdisp: Fix runtime PM imbalance on error
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Fabien Dessenne <fabien.dessenne@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200521100021.12461-1-dinghao.liu@zju.edu.cn>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f4378f72-8348-33f8-48a3-aa361bbac5db@xs4all.nl>
Date:   Mon, 8 Jun 2020 15:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200521100021.12461-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD+dVag/E7LFdQq452Ror8YsKG7cG7GdSLNJNiThytUQp8kGjGWAI93N0OL+Wg69Hjwwyd/2WvE9VZ9yFK6Jpu+6PHtujnNOYpbpk4hZg5jvB5MYDbzu
 sENajk/q3oRW7zfcYCPejq9aO3SqFpLZH7Km5AHeI3akj829H8v/uFQK1qxcYDASl4IjTL8ZkVbKvlIP1Xctf+V9H+Dp7uzdUyxcVk910tJsdw2TMRVkLCNp
 LfMISknUXsG4XLTB2xenSH5+EVbsORRFkQ3/Ux5jxAgTR5oJEwi4BsXqShHh2h0sMTbWWssMNTlr7Zrxq0eBSJtp0pF1+Ml89yf1HbxrWL8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/05/2020 12:00, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
> index af2d5eb782ce..e1d150584bdc 100644
> --- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
> +++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
> @@ -1371,7 +1371,7 @@ static int bdisp_probe(struct platform_device *pdev)
>  	ret = pm_runtime_get_sync(dev);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to set PM\n");
> -		goto err_dbg;
> +		goto err_pm;
>  	}
>  
>  	/* Filters */
> @@ -1399,7 +1399,6 @@ static int bdisp_probe(struct platform_device *pdev)
>  	bdisp_hw_free_filters(bdisp->dev);
>  err_pm:
>  	pm_runtime_put(dev);

pm_runtime_put_sync()?

> -err_dbg:
>  	bdisp_debugfs_remove(bdisp);
>  err_v4l2:
>  	v4l2_device_unregister(&bdisp->v4l2_dev);
> 

Regards,

	Hans
