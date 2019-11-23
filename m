Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C37E7107BF1
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 01:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfKWARn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Nov 2019 19:17:43 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39040 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbfKWARn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Nov 2019 19:17:43 -0500
Received: by mail-pf1-f194.google.com with SMTP id x28so4307834pfo.6;
        Fri, 22 Nov 2019 16:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iiY6R0zRBcS0LohPlMpk2ff2+jdv+GHem5CUGt0sLyU=;
        b=ruzFU+9LYg6SJBtYNXx4bMTfDwjthU1KKHGCc7bc41xc74FnQ1WKyOIEyXcw3Zm4wZ
         iQ5seG7iFjvNjjen5g/AwbORnA7Vd5PisCqsqcnqNrGZ3rWB7+JxlJz7NB6ZWhgSHMJ2
         94QJxluzxlemheDVANp396zLKtoWL2vkAA+Ys0mAfhp0/hwAAOoRVopXE4/B+iLR+Rdz
         T/1kkwRhIwbjLm0FPBsmtVIev0LioKjEv6gcjkAxDJlYMtn+B0CfgNsMg6OhN2FOaq0R
         3pULuNkI5jjW0MBCgL52j8RiQJLqH0jPsUaTwhKKR8yZNwvP49Yg9ClDKgRV/DfaSoB9
         gr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iiY6R0zRBcS0LohPlMpk2ff2+jdv+GHem5CUGt0sLyU=;
        b=irkOID9lCii6FKSPto5j+xU33BxnqqTsOqZ22sPu3P8xrSZLua+KyrkVKaDAh+it3R
         3UegYtgAKezknHJ2DZ+e7oAL9A1AQMc4W5F1WuTgzyv8alxfRfY0VnFgRC6cZPtT0zKp
         nOnR1UxnageWIQSshwVOPp5OjokU1kYLqe7amC5GaSje7iqN+xcWHf33m3aZTRebyB+3
         1Si4B3+92fr9+NBwsqta+dALGazIhm/P8WaPKD+sFIRmexW7dvDfKo6EfwMwYo8cSJ1Y
         Y5lNxm7AjLNaS0cQAMoEXLvoAuCWuavGPca8avCgxu9L32prZfRt6/6UQh76hSD4xQ27
         uTjA==
X-Gm-Message-State: APjAAAUh8la7LtRRb9jD7MHR8jNzJcwgGfJi4TncJ3LclptJIH2z/HaW
        JoTHKPFeGcpWTL1de2vSTT8=
X-Google-Smtp-Source: APXvYqxWzhfv9eQFc3QRM0i66yd0/2QMecTo1639KT0UxVZ3s530XCH7iUA0uDwR2n2NrFKK0VfhEA==
X-Received: by 2002:a62:108:: with SMTP id 8mr20875928pfb.53.1574468260599;
        Fri, 22 Nov 2019 16:17:40 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p16sm8619385pfn.171.2019.11.22.16.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 16:17:39 -0800 (PST)
Date:   Fri, 22 Nov 2019 16:17:37 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-input@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
Subject: Re: [PATCH 1/5] input/mouse/synaptics: add LEN0091 support
Message-ID: <20191123001737.GG248138@dtor-ws>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
 <20191119105118.54285-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119105118.54285-2-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 19, 2019 at 11:51:14AM +0100, Hans Verkuil wrote:
> Some Lenovo X1 Carbon Gen 6 laptops report LEN0091. Add this
> to the smbus_pnp_ids list.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Applied, thank you.

> ---
>  drivers/input/mouse/synaptics.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index 56fae3472114..1ae6f8bba9ae 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -172,6 +172,7 @@ static const char * const smbus_pnp_ids[] = {
>  	"LEN0071", /* T480 */
>  	"LEN0072", /* X1 Carbon Gen 5 (2017) - Elan/ALPS trackpoint */
>  	"LEN0073", /* X1 Carbon G5 (Elantech) */
> +	"LEN0091", /* X1 Carbon 6 */
>  	"LEN0092", /* X1 Carbon 6 */
>  	"LEN0093", /* T480 */
>  	"LEN0096", /* X280 */
> -- 
> 2.23.0
> 

-- 
Dmitry
