Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCD6185B10
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 08:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbgCOHja (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 03:39:30 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:50097 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727134AbgCOHja (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 03:39:30 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id DNrmjBAndhVf8DNrpjRZ98; Sun, 15 Mar 2020 08:39:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584257966; bh=o1DEhFybCxl5eHVq0rgedyoUKfzEE57Yp/hdN0kWxfk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rGE4KR2oB882hnaJJw5d4meFnqankjP41TLNRTy7pGqOszD4BS2UWOb71RSkZMV/O
         ozINrjupynm7xy0lOQLALCsDs2jQKxwH9K+METyXt6TKRgEjPUoU82q/Nss9j13qr3
         qc5z8H7SHgIob4jC+Y/ogOBqCLW4fg/dfkuW4Z0QKjGMmKFOwsnYxN8aHSOzmex8PL
         pJ0cp3JWv5Dj4GG+c2/2LvZQjo6ur9JQLZBEXsXVBJA8O4pL+Qunj+2dH6UfJMVtjM
         6JafC7ze3KqMnDaKFiez3HpVaMDaK7hSOL6K2/WvQoXs5BCnhIH/0tYBhQz7QiOS7o
         57HruWzd2YQ3w==
Subject: Re: [PATCH] edid-decode: Fix decoing of DispID physical enclosure bit
To:     Ville Syrjala <ville.syrjala@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20200313183924.10820-1-ville.syrjala@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9a3b9e6d-cfad-1feb-72ac-1a3d4c24931a@xs4all.nl>
Date:   Sun, 15 Mar 2020 08:39:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313183924.10820-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPn94ekMpCrb1yGkOUWDNVnLGUTROY59+xcNLr48GQLlmxFLNcQRHubLCmNaUpVfBcvriq+z/mJMnvyJJYdLqA9vqMjNZ7v+OoYlnBc9/jSVCe6IRJZk
 8cUaZF16Vav3uYowi1WEPMy1Lr8eDOuRJsf9tgyukawMcP9x6V2CGu4jwRNIik+xE3wJY9vcU9Y33i4j52IiiBjUsI/ot55iBEw6tXob+uj41TzBfwOzkYww
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/13/20 7:39 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The interpretation of the physucal enclosure bit is backwards.
> Fix it to match the spec.

Thank you, it's been applied.

Regards,

	Hans

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  parse-displayid-block.cpp | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
> index e6c8d95dcaa1..b436f343fa63 100644
> --- a/parse-displayid-block.cpp
> +++ b/parse-displayid-block.cpp
> @@ -913,9 +913,9 @@ static void parse_displayid_tiled_display_topology(const unsigned char *x, bool
>  	default: printf("Reserved\n"); break;
>  	}
>  	if (caps & 0x80)
> -		printf("    Tiled display consists of multiple physical display enclosures\n");
> -	else
>  		printf("    Tiled display consists of a single physical display enclosure\n");
> +	else
> +		printf("    Tiled display consists of multiple physical display enclosures\n");
>  	printf("    Num horizontal tiles: %u Num vertical tiles: %u\n",
>  	       num_h_tile + 1, num_v_tile + 1);
>  	printf("    Tile location: %u, %u\n", tile_h_location, tile_v_location);
> 

