Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DEB262296
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 00:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730131AbgIHWXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 18:23:13 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:38445 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728463AbgIHWXN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 18:23:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Fm17k7M46gJnQFm18ktpj1; Wed, 09 Sep 2020 00:23:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599603791; bh=z98ehuIZvGHxv+91Gz602COJFj9RTwa7v+xpOq6hWx4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rfAN940fPp8ajjg/H5HioNRXbeWQQImc9WhpxvHI1vgrUKwqQpyFj0Bc+6FcgbL2N
         1LcssKhHcluR/jd+TRGVYXkU5PX2S5G7ehSyGDuBe101fabi7K4mhP7u8CrrI75nJ8
         oYJH06xprMKGXl5FgnoPOIBzDoUUP1WGt3SrrxtYVlJGE1+iHNQLR8b77QrzUDMj+w
         RVcdoblSsJmpPXm8tjXTGoeP++UcJVaxF/7UeAsaJWxd2Xul0dpRDN6xAuGQ9akCbM
         K3INCOgSCK38LOKePYlbfIYqbDDac4md6jACBJ9isWjHwmGAyrRj0ygQ0LYUotdaIy
         90qo6fX45csCw==
Subject: Re: [PATCH] edid-decode: Report supported SL-HDR versions
To:     Harry Mallon <harry.mallon@codex.online>,
        linux-media@vger.kernel.org
References: <20200908125844.73317-1-harry.mallon@codex.online>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1fa71e34-94e9-f025-2248-7015de8a5c72@xs4all.nl>
Date:   Wed, 9 Sep 2020 00:23:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908125844.73317-1-harry.mallon@codex.online>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPSmXXyD+GAwI4XVyDxQHgpB9IULnZ/wqkRirOSCJX89/woV6wdOZV9MLQlD732B/nZgufCEx+fZvgif7wHfBdXyn1SnMM32+u2JrpklHw2+33Zvu6Hp
 k67LcCAG+mh+aTL2eEV6sSxPy5kBjFkWbpX9wJOoTh8A+9hG8hMG+sUBkmqn1Z7Dr77y4kxc778RjnaUiH0UGo+mLnpW9dJYc6oMH+JbsZ3M8c/Xpg0f7bt7
 o5NVQsLHeoFX8bXmXXG5w7S1MOqoEsPGodgRmT4u3ePMPVTJpnD/R2WEVT/OzmmYEYtNRtTCXv79kXN9CUrZCg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Harry,

Thanks for the patch, I missed this change in CTA-861.4.

It's applied and pushed to the git repo.

Regards,

	Hans

On 08/09/2020 14:58, Harry Mallon wrote:
> Specified in ETSI TS 103 433-1 v1.3.1
> 
> Signed-off-by: Harry Mallon <harry.mallon@codex.online>
> ---
>  parse-cta-block.cpp | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
> index 97924d1..ad1e18b 100644
> --- a/parse-cta-block.cpp
> +++ b/parse-cta-block.cpp
> @@ -1512,11 +1512,21 @@ static void cta_hdr_dyn_metadata_block(const unsigned char *x, unsigned length)
>  		printf("    HDR Dynamic Metadata Type %u\n", type);
>  		switch (type) {
>  		case 1:
> -		case 2:
>  		case 4:
>  			if (type_len > 2)
>  				printf("      Version: %u\n", x[3] & 0xf);
>  			break;
> +		case 2:
> +			if (type_len > 2) {
> +				unsigned version = x[3] & 0xf;
> +				printf("      Version: %u\n", version);
> +				if (version >= 1) {
> +					if (x[3] & 0x10) printf("      Supports SL-HDR1 (ETSI TS 103 433-1)\n");
> +					if (x[3] & 0x20) printf("      Supports SL-HDR2 (ETSI TS 103 433-2)\n");
> +					if (x[3] & 0x40) printf("      Supports SL-HDR3 (ETSI TS 103 433-3)\n");
> +				}
> +			}
> +			break;
>  		default:
>  			break;
>  		}
> 

