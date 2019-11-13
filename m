Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0312FABA4
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 09:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfKMIE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 03:04:28 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:46785 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725993AbfKMIE2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 03:04:28 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id UndXif5M7XYiTUndaiCSAF; Wed, 13 Nov 2019 09:04:26 +0100
Subject: Re: [PATCH] edid-decode: fix typo in 1024x768i established timing
To:     Ilia Mirkin <imirkin@alum.mit.edu>, linux-media@vger.kernel.org
References: <20191112234628.3212-1-imirkin@alum.mit.edu>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a626cdb7-c6ab-7973-ed43-bdf8b2433ac9@xs4all.nl>
Date:   Wed, 13 Nov 2019 09:04:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112234628.3212-1-imirkin@alum.mit.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEsHIQgIy4v2Tbk+/MODj7Fx5UmtRP4/l2yYoansvB8aRofqfntid951JeRb3eT01FoBgBRGVT63oRvNtqFvaQkL1L+l7o7vhEmlxKOx4UjgYehIABdx
 u9cZehq9Oo08Nz1pvRVMIQfh6MA3lwYdpNxFXY+ZBQZnm2OGXR0bZfN/AfurIlmq8YKREDD4D3ODSxe2kkhF9W9weIug3FQ135oyNZkNSi4+SVJWoKSB6cbW
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/13/19 12:46 AM, Ilia Mirkin wrote:
> Looks like this has been wrong since the dawn of time - commit ec1931fa.
> Also adjust the AR to match the "new" resolution.

Good catch!

I've applied the patch.

Thank you!

	Hans

> 
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> ---
>  edid-decode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/edid-decode.c b/edid-decode.c
> index 40891aa..07f8b48 100644
> --- a/edid-decode.c
> +++ b/edid-decode.c
> @@ -553,7 +553,7 @@ static const struct {
>  	{800, 600, 72, 4, 3, 48100, 50000},
>  	{800, 600, 75, 4, 3, 46900, 49500},
>  	{832, 624, 75, 4, 3, 49726, 57284},
> -	{1280, 768, 87, 5, 3, 35522, 44900, 1},
> +	{1024, 768, 87, 4, 3, 35522, 44900, 1},
>  	{1024, 768, 60, 4, 3, 48400, 65000},
>  	{1024, 768, 70, 4, 3, 56500, 75000},
>  	{1024, 768, 75, 4, 3, 60000, 78750},
> 

