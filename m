Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 955079EBAE
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 16:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfH0O5z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 10:57:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47766 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfH0O5z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 10:57:55 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEC77BB9;
        Tue, 27 Aug 2019 16:57:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566917873;
        bh=FORQNvGW5MdLuE1K2DQvERGzkmwRNkmugUtqOhsouL0=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=D423NDjZ+R4mD1jaqQ79yZuiFJ7/s+N7L5rP76CX1cgrE2eZ3Wd19y86qrq2QKq7I
         SFv538diH5xgl216SIuoSAAQMlNvFGGok+yKZetkkRHSSVsPRWNhp+xb3Xfmfxdnu2
         IzawxuAmG8hFufTIKDAy6z+tJtcOnFeuJZifLNP0=
Subject: Re: [PATCH] media: cx231xx: Spelling s/diconencted/diconnected/
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <20190731134051.18392-1-geert+renesas@glider.be>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <44bee359-3d5a-f810-0f83-9d499a371e6a@ideasonboard.com>
Date:   Tue, 27 Aug 2019 15:57:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731134051.18392-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 31/07/2019 14:40, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/media/usb/cx231xx/cx231xx-cards.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
> index e0d98ba8fdbfa829..47a85d8152b03afa 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-cards.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
> @@ -1924,7 +1924,7 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
>  
>  /*
>   * cx231xx_usb_disconnect()
> - * called when the device gets diconencted
> + * called when the device gets diconnected

Shouldn't this perhaps be 'disconnected' ?
--
Kieran


>   * video device will be unregistered on v4l2_close in case it is still open
>   */
>  static void cx231xx_usb_disconnect(struct usb_interface *interface)
> 

