Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 720FF139D23
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 00:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbgAMXOR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 18:14:17 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34699 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728794AbgAMXOR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 18:14:17 -0500
Received: by mail-ot1-f65.google.com with SMTP id a15so10730057otf.1;
        Mon, 13 Jan 2020 15:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UsZ98rCI7PkotKyjeTY7iS3Bvm6JfyKWnW/whK0DyZg=;
        b=nAGHf/Epi8EvVV6HKtc8h4VOKLsZX2aCiLzTruVWJDs3wKYW1pfb4zmIMlWSj/HpKL
         x12yC6aY8Co2Br7xxa1pfKib+BxaDxPSqjVZv7jTi5EJHNpfnsejd/8ftdx1e2yhh7lh
         fAhYZVAF/Ga15a5nY5O6wEAgbS/s9PIsmoUOMR49xmNMrjFyYNKNnyYEFSPpHzYwTrYV
         aZJ+YufrTK1dxpg/UmB5jRVVMRXl1D/QXUsGGZWIwbyvcX2KcAZNXLOWf7VJPTE1CqMz
         pnJcqE57t32IXh4SyELJt0q/inz8d7w4jxqN1vAT+IBHKFgCH5aRyFxxtuKBwG32NNqs
         71Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UsZ98rCI7PkotKyjeTY7iS3Bvm6JfyKWnW/whK0DyZg=;
        b=SA+k4BOISIkFJroXsiVJsb2eGaBD1vRrym/BYtyI8kD77Qa6tifCLONpBuTKy9h7+X
         Ca3c/+uODDLpXEWwmiRFoyT+fyjVvvi3JB6IjoER7cmZcXpZg6RJL/NGtxqpv1kJIupn
         PiOLI2Jqc1u4e+W+YRCdYqs2Ht5gTfHWPEAua401finuFuCOtNQOnZFu6DePqCvgBm9J
         i62CQ7A6Ovzp6AQ5GyGxTrR7GwAEr142JmwjkdC3ZkNDt1M/C7GzmNqg0revBnru2egY
         cTlyPQ9/kD8pFfA6fJKSpWiMAkLEO4qEhs6lKXgEHTFm8pISZbRSTV9mo9/22fqWKnnA
         MJlw==
X-Gm-Message-State: APjAAAVlFEFNEXSpPM/VHoKAKmkyZUB411XbcWJL70+6WOFh8jKdEUTC
        kyNC1CxR1TpKcYC1kK4M+z8=
X-Google-Smtp-Source: APXvYqw1JmIvG6iWu6vPIbvwsWVsMZVyfmrNUDYwfcGB4Ecsie8cdsFDuVCZyrXwgkrK/dKTz2ct2w==
X-Received: by 2002:a9d:c02:: with SMTP id 2mr15137769otr.183.1578957255384;
        Mon, 13 Jan 2020 15:14:15 -0800 (PST)
Received: from ubuntu-x2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id j10sm4680785otr.64.2020.01.13.15.14.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 15:14:14 -0800 (PST)
Date:   Mon, 13 Jan 2020 16:14:13 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] media: i2c: adv748x: Fix unsafe macros
Message-ID: <20200113231413.GA23583@ubuntu-x2-xlarge-x86>
References: <20191022132522.GA12072@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022132522.GA12072@embeddedor>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 22, 2019 at 08:25:22AM -0500, Gustavo A. R. Silva wrote:
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
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com

It doesn't look like this was picked up? I still see this warning on
5.5-rc6 and next-20200113.

If it helps:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

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
> -- 
> 2.23.0
> 
