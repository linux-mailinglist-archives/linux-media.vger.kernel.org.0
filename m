Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E9A3CD009
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 11:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbhGSIZm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 04:25:42 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:54641 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235323AbhGSIZl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 04:25:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 5OT0mRjsW2bXB5OT1m9mSi; Mon, 19 Jul 2021 10:17:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626682656; bh=Ww0EzuT42pJONbVMxgQXs2gNguJHAaMvbrZoE+9Qczo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=I3nMkdTt/iO4TF8ancFjNyQGFAJ3EL1s4FaNx3JOjuFbDPozZwMYapy/m24lWVQHi
         ynsyodvCIORUD/b2sscr9dLjtBP9fY2OXBHpmG6tC+jScmk9iEqKVWylUkrQdl4tvX
         /Gdrry1jYi/O+pbTKsn8EPqkwHvCMNSKkM/+X+IpoDwx99FFyee4+Xa2qwPFiSrS2G
         flQV1jAIQLoMEVOgtQre451hdpDpfdbkaKpsAF5kqHKEJkxX/qy5ByvgiC2AzdLZA3
         VpWgcIS0tOeMQBD0qbbTCFREzplEY7Io6Al8IZRA9jo0uQGQ39wGEH9GgHigzBAZyW
         vMJ1ov0gxSZBQ==
Subject: Re: [RFC,WIP PATCH 1/2] media: cedrus: fix double free
To:     daniel.almeida@collabora.com, jernej.skrabec@gmail.com,
        ezequiel@collabora.com, paul.kocialkowski@bootlin.com,
        mripard@kernel.org
Cc:     kernel@collabora.com, linux-media@vger.kernel.org
References: <20210702020129.470720-1-daniel.almeida@collabora.com>
 <20210702020129.470720-2-daniel.almeida@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <37421d22-a1ba-319b-b90e-cfc840638623@xs4all.nl>
Date:   Mon, 19 Jul 2021 10:17:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702020129.470720-2-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBK4yo0J/F/bgpFhDlF/6WpRHhon4tt6hyWFXO3iohOyfFh61LHv3y+SQLEhvKdUsq1BOr7JGCaU0/x+6I9uTFaJZzwh8C1Ed8Dr8wJrEhQRqr7DGpKw
 1oekPvelpnZ6ygvCBgSykDVAQ59CheVdcmmbwyMiJWbE4cMyHw81syePLGSt5pE4k4VtbGQ2higwtMn9ewTsFh6LcpFtSAxWczLo7bB4v1gL8VmpSmB7jmGT
 9ndxa6NOSiYzRZxR1JpHXBf0oNd2jd3Q2oifCzc8fETiSBxDtqBJPCKwplbIVlPurhITUqjJLytRseroJvewPJSnqcMO1lGHnsW8AVNrUIyw44hth34XdxIg
 q06hXBnQAT3FVCnvykpTpwllCYG1tUiQjJIfiiZVb8jysRVBJEfWeuiv9l29WT+TF27j2lZKIj+6e42bN5EO+93dRchvf0rMr8ziCrdPJsRSktAPj6VGHuS6
 6xWo1Nu1SnhKpddGCXvJiAx+7re7zm9rqo44+g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/07/2021 04:01, daniel.almeida@collabora.com wrote:
> From: Daniel Almeida <daniel.almeida@collabora.com>
> 
> If v4l2_ctrl_new_custom fails in cedrus_init_ctrls the error path will
> free ctx->ctrls, which is also freed in cedrus release. Fix this by
> setting ctx->ctrls to NULL instead of inadvertently removing kfree
> calls.

This is just a bug fix, right? Not really an RFC,WIP.

Regards,

	Hans

> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index c0d005dafc6c..e72810ace40f 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -207,6 +207,7 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
>  
>  			v4l2_ctrl_handler_free(hdl);
>  			kfree(ctx->ctrls);
> +			ctx->ctrls = NULL;
>  			return hdl->error;
>  		}
>  
> 

