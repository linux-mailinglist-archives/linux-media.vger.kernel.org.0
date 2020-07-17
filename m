Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8E2223B00
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 14:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgGQMAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 08:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgGQMAJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 08:00:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2E1C061755;
        Fri, 17 Jul 2020 05:00:09 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 322A271D;
        Fri, 17 Jul 2020 14:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594987208;
        bh=nUPwsA58UbJ23qc/rx1oXrPJ7/DQig2xo7uzTbAjTvk=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=MyJkO4/zN1f/EUWHdu66GC/Im+bNiaFqUbNJ+0GCCqfVc6rtYVe2BjC6Jl+cZj/1l
         Gcynu08bKSivPFo4b2WAI716dW1dJ/HSFnJS+qbpiBgutY/JLky37uUkStl3z06VfY
         TkUPPGAVDF5Xxq2hYqBDne6xUrM4GEE/QYcz5xs0=
Subject: Re: [PATCH 5/5] media/v4l2-subdev.h: drop duplicated word in comment
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20200714220553.20294-1-rdunlap@infradead.org>
 <20200714220553.20294-5-rdunlap@infradead.org>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <62f8372d-65d9-f69c-a942-5d9451191863@ideasonboard.com>
Date:   Fri, 17 Jul 2020 13:00:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200714220553.20294-5-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/07/2020 23:05, Randy Dunlap wrote:
> Delete the doubled words "the" in comments.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org

I guess the second instance of the word could have also been removed, to
keep more content on the first line, which fits under 80chars, but I
don't think it really matters.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  include/media/v4l2-subdev.h |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- linux-next-20200714.orig/include/media/v4l2-subdev.h
> +++ linux-next-20200714/include/media/v4l2-subdev.h
> @@ -566,9 +566,9 @@ struct v4l2_subdev_ir_parameters {
>   *
>   * @rx_read: Reads received codes or pulse width data.
>   *	The semantics are similar to a non-blocking read() call.
> - * @rx_g_parameters: Get the current operating parameters and state of the
> + * @rx_g_parameters: Get the current operating parameters and state of
>   *	the IR receiver.
> - * @rx_s_parameters: Set the current operating parameters and state of the
> + * @rx_s_parameters: Set the current operating parameters and state of
>   *	the IR receiver.  It is recommended to call
>   *	[rt]x_g_parameters first to fill out the current state, and only change
>   *	the fields that need to be changed.  Upon return, the actual device
> @@ -582,9 +582,9 @@ struct v4l2_subdev_ir_parameters {
>   *
>   * @tx_write: Writes codes or pulse width data for transmission.
>   *	The semantics are similar to a non-blocking write() call.
> - * @tx_g_parameters: Get the current operating parameters and state of the
> + * @tx_g_parameters: Get the current operating parameters and state of
>   *	the IR transmitter.
> - * @tx_s_parameters: Set the current operating parameters and state of the
> + * @tx_s_parameters: Set the current operating parameters and state of
>   *	the IR transmitter.  It is recommended to call
>   *	[rt]x_g_parameters first to fill out the current state, and only change
>   *	the fields that need to be changed.  Upon return, the actual device
> 

