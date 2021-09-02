Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF543FF6C3
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 00:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234028AbhIBWDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 18:03:44 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:60398
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232827AbhIBWDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Sep 2021 18:03:44 -0400
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 0B9CA3F042;
        Thu,  2 Sep 2021 22:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630620164;
        bh=gsJFTztF9GceLOLBONfz4P+vNdtOnoxVKuUu34GIhYs=;
        h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=azlAvWbmqeT774jKollb4hL0VVErvYvKsaWz9nfuDtx7liu2sqSSR4h14RzzXOlic
         o5eg2QknVstBjiDaLl0BWJ6GWoqowQoEBTRcW2Tx87RJZkWZTwXP6YoRA9rxdy9wPx
         xJWGjslti7MfRAeZAEmIY8X9T8elRB8bdpKTVajHcdk4GNBLV1y62KJqngAB2yq3T4
         W9DKJmlWS3pBHdDTAgvCy9zR1UtJtD6BDvD0+3B9HziYitj5Cs3B0IobSRTV8RkV9m
         F7oyM8L6WTdtGesuQqh70Xx5tGYB8GR6QTpUHbqr3gySTJ0FPk88qx+rAWfo6tY2FT
         ZVeFtdCBQhfQA==
Subject: NAK: [PATCH][next] media: pvrusb2: add newline between two statements
From:   Colin Ian King <colin.king@canonical.com>
To:     Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210902220112.55824-1-colin.king@canonical.com>
Message-ID: <52c324ad-2467-9edc-c386-bc5a086cecbc@canonical.com>
Date:   Thu, 2 Sep 2021 23:02:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902220112.55824-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/09/2021 23:01, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two statements on the same line, add a newline to clean
> this up.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> index d38dee1792e4..ca00b7fe1e7f 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> @@ -1727,7 +1727,8 @@ int pvr2_hdw_set_streaming(struct pvr2_hdw *hdw,int enable_flag)
>  				   enable_flag ? "enable" : "disable");
>  		}
>  		pvr2_hdw_state_sched(hdw);
> -	} while (0); LOCK_GIVE(hdw->big_lock);
> +	} while (0);
> +	LOCK_GIVE(hdw->big_lock);
>  	if ((ret = pvr2_hdw_wait(hdw,0)) < 0) return ret;
>  	if (enable_flag) {
>  		while ((st = hdw->master_state) != PVR2_STATE_RUN) {
> 

ignore, V2 being sent in a moment.
