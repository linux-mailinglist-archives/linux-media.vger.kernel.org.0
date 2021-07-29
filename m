Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A70A3DA0AB
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 11:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235670AbhG2Jzz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 05:55:55 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58883 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231488AbhG2Jzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 05:55:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 92lXmQZzSXTlc92lYmWCY5; Thu, 29 Jul 2021 11:55:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627552550; bh=zfdDd6IHmcwpegfCs0x5obfA9rbXIbLuza2xF5KLbEw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jZHk6DD5xEDme1JBVO/Y3KccZoeAGGL5usdQrThOasyFCk7NSC3osiG4asihHk9V8
         mKzjq+p7yFMOSmaO4lybJs6ymLBzsIrNkTmo2k9SYJAmA+D4pp+9AU0+GzwmM3/HoJ
         x4lVtmCCdQaVycZa8WndVgtADwbvW7RRRn/D2pDU2Gh3VdYRIzIeS07igG2bgxzx8E
         KwoXlGQD2HvwdNAQOVwDcMqE/8IXpZCfkZ+jhtIhVPhvQQGg1bBVaZLXqYud5lJF6Z
         hO/8NDjAQ60/3255aGwxJ9+dy2Ic0wxAVcxHKAlqhC4800AqtI81R+TaGGsPM9S4+s
         ahC2Qe/ac0LdA==
Subject: Re: [PATCH] TDA1997x: fix tda1997x_remove()
To:     =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <m35ywxcq1l.fsf@t19.piap.pl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a1f99432-f11e-fd4d-4956-ae2864f08a2a@xs4all.nl>
Date:   Thu, 29 Jul 2021 11:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <m35ywxcq1l.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPn7bQFYDQzVyj4l/K8Dfve+HIcRhrtN6kpZLSbnnpVUdTeFu7cMuRLW9nIom1Ei4jfvZEa5wHyg4Y+sNe9LUQyl9ngD61MRLGFUCZ1o9IcZeTmNUm5d
 Y+d67U87kSjELaUeS/pAmdClYKwlZRinj0rChSqCsll0ystgC7QRyHNYCV2DF4j6RK7zprJ3hjExFHas3/I/pw8JH3lBiuWl5txGCPcSCLUU5b9Qg99hQh2F
 KEGQLs1hnv0ZV2vQTi1mdHu2Oqhl21Yd3oA5NHWRUIHOyB0IbKg1F1a3ckDXkWGa7ojE0eiQ4MyQlw07Dxbs1mZcdseb9erkarADCjJ/mFpaRXd5M61X+qDJ
 1lsoDM7HUQ00HYxcBwHUzfNmYNHzU+sFvxyKQMZohQNXATZcjUpkLeTQgSnv7KsVAidYFj0y
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/07/2021 12:44, Krzysztof Hałasa wrote:
> TDA1997x I2C "client data" pointer was never set in tda1997x_probe(),
> then the code tried to use invalid pointer in tda1997x_remove().
> 
> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> 
> diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
> index 71194746c874..043cc8275d00 100644
> --- a/drivers/media/i2c/tda1997x.c
> +++ b/drivers/media/i2c/tda1997x.c
> @@ -2771,6 +2771,7 @@ static int tda1997x_probe(struct i2c_client *client,
>  		goto err_free_media;
>  	}
>  
> +	i2c_set_clientdata(client, sd);
>  	return 0;
>  
>  err_free_media:
> 

Actually, v4l2_i2c_subdev_init() sets this, and v4l2_i2c_subdev_init() *is* called.
Does it really crash in tda1997x_remove() without this patch?

If so, then I suspect something else is going on.

Regards,

	Hans
