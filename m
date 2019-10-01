Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFD80C2EFE
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 10:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbfJAIjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 04:39:31 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47275 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727274AbfJAIja (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 04:39:30 -0400
Received: from [IPv6:2001:420:44c1:2577:10df:bfa0:cde1:e23a] ([IPv6:2001:420:44c1:2577:10df:bfa0:cde1:e23a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id FDgqikleh9D4hFDguiQfeX; Tue, 01 Oct 2019 10:39:28 +0200
Subject: Re: [PATCH v2] edid-decode: Avoid division by zero
To:     Breno Leitao <leitao@debian.org>
Cc:     linux-media@vger.kernel.org
References: <cc88ca6d-5608-5381-74b9-008c2a32afb3@debian.org>
 <ca1fd80c-02d1-f793-0906-239f020eac65@xs4all.nl>
 <e9bae40c-9a2c-067b-d547-cd1f1a528e25@debian.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3f362e23-7cf9-e93b-8c88-b7b6c5197230@xs4all.nl>
Date:   Tue, 1 Oct 2019 10:39:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e9bae40c-9a2c-067b-d547-cd1f1a528e25@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDkqxH3yTs0kWTkYX35XAJANsW2HSiTqn44/ITzoQruL0KBAlJbaafGLnwB1NnesBv5T7JtP8r1NHBS/X/AbwIbfO/hW6HTP4uyqS+LuszgnbXkBchQ4
 DTYb7N7sJDFL8YYmF7Jt6p/CaKgqm17lFP0oqvCZ2SRYgo2UjOCB2ScOMNS9V7gbY/lMJWi7Rg12ScGWUEcGnfgylKcUgvxO7r8d2KwfZ4KNlRrSkZeZDwdM
 zTBOD0myQw+hSK50A4JJvAvIOdQ/NkGU4yDJfRTVIZZZbcOwAYl2+2GQ2FYhNHo/h+2j4QHU7OXSlv99TX8kwjBxRM3aXwmGnZqNknB91cE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/1/19 10:10 AM, Breno Leitao wrote:
> There are some weird monitors that returns invalid data, as zeroed
> Horizontal/Vertical Active/Blanking.

Do you have an EDID that does this? I'd like to add it to the collection
of EDIDs in edid-decode.

Some more nitpicks below:

> 
> This causes edid-decode to crash with a division by zero exception. This simple
> patch avoids so, checking for the divisor before proceeding.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  edid-decode.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/edid-decode.c b/edid-decode.c
> index 7442f8a..b932179 100644
> --- a/edid-decode.c
> +++ b/edid-decode.c
> @@ -1022,6 +1022,16 @@ static int detailed_block(const unsigned char *x, int in_extension)
>  		break;
>  	}
>  
> +	if (!ha || !hbl || !va || !vbl) {
> +		printf("Invalid Detailing Timings:\n"

Detailing -> Detailed

> +		       "Horizontal Active %4d\n"
> +		       "Horizontal Blanking %4d\n"

This can be a bit more concise:

			"Horizontal Active/Blanking: %d/%d\n"

> +		       "Vertical Active %4d\n"
> +		       "Vertical Blanking %4d\n",

Ditto.

> +		       ha, hbl, va, vbl);
> +		return 0;
> +	}
> +
>  	pixclk_khz = (x[0] + (x[1] << 8)) * 10;
>  	refresh = (pixclk_khz * 1000) / ((ha + hbl) * (va + vbl));
>  	printf("Detailed mode: Clock %.3f MHz, %d mm x %d mm\n"
> 

Regards,

	Hans
