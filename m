Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 467E6C26C1
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 22:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730886AbfI3Uj4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 16:39:56 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40497 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730607AbfI3Uj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 16:39:56 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id EzRYimvp3z6EAEzRbiOcir; Mon, 30 Sep 2019 19:26:44 +0200
Subject: Re: [PATCH] edid-decode: Avoid division by zero
To:     Breno Leitao <leitao@debian.org>, linux-media@vger.kernel.org
References: <cc88ca6d-5608-5381-74b9-008c2a32afb3@debian.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ca1fd80c-02d1-f793-0906-239f020eac65@xs4all.nl>
Date:   Mon, 30 Sep 2019 19:26:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cc88ca6d-5608-5381-74b9-008c2a32afb3@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOzwK3Xssnkxk6flXl1nd44PnBaY56XRL3VktjyNhDbaO4w+LNYJx/MsYHEPYYOI9Wvcs2PFQo80A8+UCmXiaFvW1FtFtnV2+3JDgg1w+LqJtJnCm8xz
 tyRFi7jLieuEz2AM4Du8v0jKMaI9/M3R2Uc/Pl+nrd53n6NoLytSGGezB2j2OXajsjgGuJknO8kgs+zQLqB03ae+8zwPtW3uwoQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/30/19 7:13 PM, Breno Leitao wrote:
> There are some weird monitors that returns invalid data, as zeroed
> Horizontal/Vertical Active/Blanking.
> 
> This causes edid-decode to crash with a divsion by error exception. This
> simple patch avoids so, checking for the divisor before proceeding.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  edid-decode.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/edid-decode.c b/edid-decode.c
> index 7442f8a..4b2cef8 100644
> --- a/edid-decode.c
> +++ b/edid-decode.c
> @@ -1022,6 +1022,17 @@ static int detailed_block(const unsigned char *x,
> int in_extension)

This should have been on one line, it looks like your mailer is wrapping lines.

>  		break;
>  	}
> 
> +	if ((ha + hbl) == 0 ||
> +	    (va + vbl) == 0) {

I'd use '!ha || !hbl || !va || !vbl' here.



> +		printf("Invalid data. Refusing to continue.\n"

I'd say: "Invalid Detailing Timings:" here.

> +		       "Horizontal Active %4d\n"
> +		       "Horizontal Blanking %4d\n"
> +		       "Vertical Active %4d\n"
> +		       "Vertical Blanking %4d\n",
> +		       ha, hbl, va, vbl);
> +		return 0;
> +	}
> +
>  	pixclk_khz = (x[0] + (x[1] << 8)) * 10;
>  	refresh = (pixclk_khz * 1000) / ((ha + hbl) * (va + vbl));
>  	printf("Detailed mode: Clock %.3f MHz, %d mm x %d mm\n"
> 

I'm happy to take this if you post a v2 with these changes!

Regards,

	Hans
