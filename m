Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10242ECC81
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 10:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727432AbhAGJOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 04:14:34 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:41237 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726801AbhAGJOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 04:14:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id xRMVklktVbMeAxRMZkT4Za; Thu, 07 Jan 2021 10:13:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610010830; bh=E0MA7bSe09OCRGTiRBeJqYGJV3Asl9zqcjkRywEcSlA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LiqJ21KYHrwqKrRJcgKxZqm1AxBN59aAlf3EUIosdZWalxJ2wL1NvKnPXyy3G8Kwv
         zbWzE6Y8/nuiS6rogUvCfWoh+l8Ubn53VKT3c23ecaosLLAANRjTfe3b7t8k/tjDBd
         c+/aFH2YhtbKMkbuu93gpQXu7kv6vdbASh4EwInk6aJWmpsaSB1tNUYG5NiFHCsrde
         qnUIhYzEYwTpnz6KZ16dwFI+vEwuBq2rbmPBT1ewOXKeVIcRsjWZw8KvUqvBJYJ8iR
         581HlH8TUiMkRbJStjcx5IdxoSN1FWfTsh58D7t3xiH06Dp7mcy+gGJBRPMWD9S9cM
         hqsAlKnfIx+tg==
Subject: Re: [PATCH] media: rkvdec: silence ktest bot build warning
To:     Adrian Ratiu <adrian.ratiu@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20201208155540.340583-1-adrian.ratiu@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <76b5569c-bc19-3d11-4da7-cf0dbb244433@xs4all.nl>
Date:   Thu, 7 Jan 2021 10:13:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201208155540.340583-1-adrian.ratiu@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfECXKwRH1TUnQACLjcNLsP8PHssfJJz/tIezgMZj62/CxkRMGBxeAwNrUgW+Q3170ToZ4VnWpgpVMi/tPwXxZQTsqdGv1eukLo5ghbZ5Xgmo3wfn6QT4
 XPHbH2VyQJ9lQ1iiBZnfnwh9mWIE3CTJSlGRJPdtyNo4fb29QXbYynlw0T55QFeTbbDefiJxe8Cby7mIk/gLeHoObJ3kYd9fXUlltm2GF+r6IAgusSlF4VGN
 cOCIaubQuEIQHGtC++jcl/dTcaw9Q2N0iJTerVTq13CrZlwZInddDIHGqlo0ESut9PLWvuYoj4N1k/BtW/bKP6pFK+/gBw82VLVASDLcBuBG8l9i+CLLMkCU
 H1BB/rd9s18MP0BUpnMGxrzcK7dbH1CQHA0VxWO94undZRd0wyPOWIVUskiEwnYBvgAFycxi4aUrQKH6h0Tu1eII4xYIcGM9FT88VtCApDcFxCk1/EdAS0Fn
 sOG/rUxKg5I5+WUdx3/aeoiIHaVWXN2v6SVhDorbPjkKebsLIIMAHX+t80E=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/12/2020 16:55, Adrian Ratiu wrote:
> Some configurations built by the ktest bot produce the following
> warn, so mark the struct as __maybe_unused to avoid unnecessary
> ML spam.
> 
>>> drivers/staging/media/rkvdec/rkvdec.c:967:34: warning: unused variable 'of_rkvdec_match' [-Wunused-const-variable]
>    static const struct of_device_id of_rkvdec_match[] = {
> 				    ^
>    1 warning generated.

I suspect that this is because there is no 'depends on OF' in the Kconfig.

'__maybe_unused' isn't used for this anywhere else, so this does not seem like the
right approach.

Regards,

	Hans

> 
> vim +/of_rkvdec_match +967 drivers/staging/media/rkvdec/rkvdec.c
> 
>    966
>  > 967	static const struct of_device_id of_rkvdec_match[] = {
>    968		{ .compatible = "rockchip,rk3399-vdec" },
>    969		{ /* sentinel */ }
>    970	};
>    971	MODULE_DEVICE_TABLE(of, of_rkvdec_match);
>    972
> 
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index aa4f8c287618..3af0f02ec59b 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -992,7 +992,7 @@ static void rkvdec_watchdog_func(struct work_struct *work)
>  	}
>  }
>  
> -static const struct of_device_id of_rkvdec_match[] = {
> +static const struct of_device_id __maybe_unused of_rkvdec_match[] = {
>  	{ .compatible = "rockchip,rk3399-vdec" },
>  	{ /* sentinel */ }
>  };
> 

