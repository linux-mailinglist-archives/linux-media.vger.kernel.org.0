Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75573223AFC
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 14:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgGQL7t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 07:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgGQL7t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 07:59:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80404C061755;
        Fri, 17 Jul 2020 04:59:49 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0CB9561;
        Fri, 17 Jul 2020 13:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594987188;
        bh=JZyR/6SbfjL0s5cFatbaADO00CQgPwJXmlRaBomPXDY=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=NcaEf11pEevcTEcxdhO3Finb64VxT7nwegNRArxkZEiuD4UX6yYnj59qX+B3fa0q3
         Oeoqafv1CBOsI/heQnfcjEKzr76eKH6mFM5tVDgMLFtI04Mnq43u2HZIr9R32jBbLT
         SKbx7bYUYglpryBes0FyVtqekGkt6MfYpCOBaHF8=
Subject: Re: [PATCH 2/5] media/media-devnode.h: drop duplicated word in
 comment
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20200714220553.20294-1-rdunlap@infradead.org>
 <20200714220553.20294-2-rdunlap@infradead.org>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <cc4c6b01-8bd2-2eec-9028-aaa81abf6521@ideasonboard.com>
Date:   Fri, 17 Jul 2020 12:59:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200714220553.20294-2-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/07/2020 23:05, Randy Dunlap wrote:
> Delete the doubled word "the" in a comment.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> ---
>  include/media/media-devnode.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200714.orig/include/media/media-devnode.h
> +++ linux-next-20200714/include/media/media-devnode.h
> @@ -39,7 +39,7 @@ struct media_device;
>   * @poll: pointer to the function that implements poll() syscall
>   * @ioctl: pointer to the function that implements ioctl() syscall
>   * @compat_ioctl: pointer to the function that will handle 32 bits userspace
> - *	calls to the the ioctl() syscall on a Kernel compiled with 64 bits.
> + *	calls to the ioctl() syscall on a Kernel compiled with 64 bits.
>   * @open: pointer to the function that implements open() syscall
>   * @release: pointer to the function that will release the resources allocated
>   *	by the @open function.
> 

