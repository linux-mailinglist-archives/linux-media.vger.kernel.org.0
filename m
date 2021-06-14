Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655133A66CD
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 14:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbhFNMmw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 08:42:52 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:52417 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233025AbhFNMms (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 08:42:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sltOlcYFrhqltsltRln3Og; Mon, 14 Jun 2021 14:40:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623674442; bh=glrI00jnhxo5manMT9qoOgajXjAFJmV+7SB8WHUDxls=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bfHaqN0gQW75ThHcMtpGZlZS7QBVFbI2hsZBrEAs8HkABFX4icj1V/jS3QXtirZIn
         /rlwJy2LlkfXmtjRpMWQbHwJXPhjizntcivzu22XZjNC+Se7o/XKUDXZFiZOuDZH8Y
         hNCy88rqaabYIRsQjksf1qc8ot0ZJY8Gjqe5EnqGop/DL9EGO1VyEJ7BT1JNF7d5p0
         nqmhDb3Gq8p+dZJAds9hago0IOunKeg/jh+zc3HxN49VLvCRlweiJ6whj0LQrq0K7G
         Io1vmREMy6Lhy/xCR9YBXw0PomBIN8coACfkj+NstSOAuNXq09L8LAmnTju2Rur95f
         tLSpbKGMFNUkQ==
Subject: Re: [PATCH] drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c : fix
 typo imporant > important
To:     Herman <herman.yim88@gmail.com>, a.hajda@samsung.com
Cc:     mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herman <yanshuaijun@yulong.com>
References: <20210610082409.13090-1-yanshuaijun@yulong.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bca73f8d-7780-5d84-1a6e-3575ec834370@xs4all.nl>
Date:   Mon, 14 Jun 2021 14:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210610082409.13090-1-yanshuaijun@yulong.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNcgSPuL3Ext+TJJhONBo7e+kMMFwrTlNKrkJ4OdOAdwPyYYKSgV+6kh4Bpff9k2ZxBu78d4LeKGYNPYD5J0/aE86fKkt/rTSvg1X0j7Ucse3WTM4BWy
 axkKhVi59e5cpRNlhX3uRerjdTaNtJfBTtsH6HnmX2ntKpYcBLqIxZBEdUp8ybUtKNIepIdanxXLUcgygqaVIftVXDEbcTZg1b64Y83qIoNiTfTHbAneOkcG
 s73LbPxAQFOMHg0NElENgphUzk9FwERdtsGMMQta6PppPzu6US2szwXLbr/+9/UD3ZDo/TPg//bOSgCgqnGwMBh35ALiTtuyVf/X8LGdzwHmgudQKkg5ZL8K
 iokOsoXsRnAT7wmNem1OKHdhGc6AJ8i2A6c4wpkGXuuktk6I4phAnKqfbi8V2Qx/OblX/gQy
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/06/2021 10:24, Herman wrote:
> Change 'imporant' into 'important'.
> 
> Signed-off-by: Herman <yanshuaijun@yulong.com>
> ---
>  drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c b/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
> index 49503c20d320..aa80b3f67ded 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
> @@ -1418,7 +1418,7 @@ static void s5p_mfc_try_run_v5(struct s5p_mfc_dev *dev)
>  		if (test_and_clear_bit(0, &dev->hw_lock) == 0)
>  			mfc_err("Failed to unlock hardware\n");
>  
> -		/* This is in deed imporant, as no operation has been
> +		/* This is in deed important, as no operation has been

While we're at it, can you also change: in deed -> indeed

checkpatch also gives me:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Herman <herman.yim88@gmail.com>' != 'Signed-off-by: Herman
<yanshuaijun@yulong.com>'

I can manually change one of the two, but I need to know which you prefer.

Regards,

	Hans


>  		 * scheduled, reduce the clock count as no one will
>  		 * ever do this, because no interrupt related to this try_run
>  		 * will ever come from hardware. */
> 

