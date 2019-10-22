Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9188DE0611
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2019 16:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730076AbfJVOLZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Oct 2019 10:11:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51038 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbfJVOLZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Oct 2019 10:11:25 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28709595;
        Tue, 22 Oct 2019 16:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571753483;
        bh=PmquBevF/cwoHPStIqfgBKlA7tjw1tV0YyybpCNwuqI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bz49JhuLPABaTgAiE4bQhZ0qKHS2/p/HXoqfRkIe7o0jHSSEH9llSp9gmo8WDhr1G
         KXhhUSN8mHVXYMbsATeAeTZ6NWFDpiUncX73auUfYUyv3b+SD36NmBAeF6j+op90U+
         mG8HSwWfeuGG1Vb/gLKN5hqhwXsR9WgtFG9MxCk0=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] media: i2c: adv748x: Fix unsafe macros
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dmitry Vyukov <dvyukov@google.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191022132522.GA12072@embeddedor>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <22780ef3-514e-d013-1da8-9576780fde1c@ideasonboard.com>
Date:   Tue, 22 Oct 2019 15:11:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191022132522.GA12072@embeddedor>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gustavo,

On 22/10/2019 14:25, Gustavo A. R. Silva wrote:
> Enclose multiple macro parameters in parentheses in order to
> make such macros safer and fix the Clang warning below:
> 
> drivers/media/i2c/adv748x/adv748x-afe.c:452:12: warning: operator '?:'
> has lower precedence than '|'; '|' will be evaluated first
> [-Wbitwise-conditional-parentheses]
> 
> ret = sdp_clrset(state, ADV748X_SDP_FRP, ADV748X_SDP_FRP_MASK, enable
> ? ctrl->val - 1 : 0);
> 
> Fixes: 3e89586a64df ("media: i2c: adv748x: add adv748x driver")
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Thanks,

You beat me to posting - but that looks incredibly close (identical I
think) to the one I had prepared.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/adv748x/adv748x.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index 5042f9e94aee..fccb388ce179 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -394,10 +394,10 @@ int adv748x_write_block(struct adv748x_state *state, int client_page,
>  
>  #define io_read(s, r) adv748x_read(s, ADV748X_PAGE_IO, r)
>  #define io_write(s, r, v) adv748x_write(s, ADV748X_PAGE_IO, r, v)
> -#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~m) | v)
> +#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~(m)) | (v))
>  
>  #define hdmi_read(s, r) adv748x_read(s, ADV748X_PAGE_HDMI, r)
> -#define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) | hdmi_read(s, r+1)) & m)
> +#define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) | hdmi_read(s, (r)+1)) & (m))
>  #define hdmi_write(s, r, v) adv748x_write(s, ADV748X_PAGE_HDMI, r, v)
>  
>  #define repeater_read(s, r) adv748x_read(s, ADV748X_PAGE_REPEATER, r)
> @@ -405,11 +405,11 @@ int adv748x_write_block(struct adv748x_state *state, int client_page,
>  
>  #define sdp_read(s, r) adv748x_read(s, ADV748X_PAGE_SDP, r)
>  #define sdp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_SDP, r, v)
> -#define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~m) | v)
> +#define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~(m)) | (v))
>  
>  #define cp_read(s, r) adv748x_read(s, ADV748X_PAGE_CP, r)
>  #define cp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_CP, r, v)
> -#define cp_clrset(s, r, m, v) cp_write(s, r, (cp_read(s, r) & ~m) | v)
> +#define cp_clrset(s, r, m, v) cp_write(s, r, (cp_read(s, r) & ~(m)) | (v))
>  
>  #define tx_read(t, r) adv748x_read(t->state, t->page, r)
>  #define tx_write(t, r, v) adv748x_write(t->state, t->page, r, v)
> 

