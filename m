Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810E540C359
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 12:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237442AbhIOKKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 06:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237431AbhIOKJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 06:09:58 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75566C061574
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 03:08:39 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QRqGmN7SGcSrkQRqHmyi3I; Wed, 15 Sep 2021 12:08:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631700517; bh=gjEUquKcjH2BxAAXznmkRmzpZ8NPZFUVcdlu93xS6n4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NWI5N0LXMR8kCNpDWTUOt6iMRqGcXgEhu1dV9Dd0B6yl65xOLaGAyP0RbnWVjRf6+
         LluBLVXiNumbttuak5L6b8HzqzqUxDhsTGp4jnL9rjtIaK0Nnue5abzKM4r9yLxrCM
         tlIxAQZr31G68dxGB2mcF3RuMyKDda6doEd86KPmZZ1H3m1/vc2Sh5JC03v+m1Y3p4
         aX0N0dmhFq6kjfEzBmsL0ugD01kqqrIf/+8IBD39ohM+yJcN/5LLerX//Gl3ksUJW4
         VS3hl4+0aRsSml07uTh5+x1ivgWGa0EcCGIv/SNqFSm17kSd6xcjJASdNk0Ojb3+3t
         0zjUfVqu22usg==
Subject: Re: [PATCH 05/11] edid-decode: fix standard timing vertical pixels
To:     joevt <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20210914121129.51451-1-joevt@shaw.ca>
 <20210914121129.51451-6-joevt@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <075b28bd-35a0-5acb-3cc2-383c8533c031@xs4all.nl>
Date:   Wed, 15 Sep 2021 12:08:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914121129.51451-6-joevt@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFk1vsX8ANQUORYgsunN/zykbZIZeVyQrws706dAQGnrTR0U0MhHjKNGotomh7QOjiFGg1DpenfLO6jZ3E2aRJHIEIMHNMavisiNz5MLIddN27lldl8X
 iN3NUHP/oIm99HXnj7SiPoEypmbt/lypj1HFQuFimKFFmFzNzI40OszhntK9fb+p86/1BxDmlbNF+Lkdv+6CHoY0uLQ6dBQFO5vFEVws5q+0KbgrSu1CJPNY
 6bG6ou4hoAgttz7wdqi3o2h5jWOpY93Me3kFsbx63YTFEHYo/nIfn139vS2BjMwuuYtpFl+TuQTAzidy8tGnvQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2021 14:11, joevt wrote:
> Don't do ceiling to nearest 8 pixels for active vertical lines. See examples elo-4600l-hdmi and kogan-kaled24144f-hdmi.
> 
> Section 3.9 and 3.10.3.6 of EDID 1.4 does not say vertical lines must be a multiple of 8.  This line of code appears to have been added to satisfy the 3rd example in VTB-EXT spec but that example has an incorrect HAP indicator decimal value so it cannot be trusted. Also, all 3 examples have an incorrect vertical refresh value as noted in parse-vtb-ext-block.cpp. The VESA DMT spec has the following examples that are not a multiple of 8 lines which support this change:
> 1400x1050 4:3
> 1440x900 16:10
> 1600x900 16:9
> 1680x1050 16:10
> 
> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
> ---
>  parse-base-block.cpp | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/parse-base-block.cpp b/parse-base-block.cpp
> index e2901a6..32d2079 100644
> --- a/parse-base-block.cpp
> +++ b/parse-base-block.cpp
> @@ -573,7 +573,6 @@ void edid_state::print_standard_timing(const char *prefix, unsigned char b1, uns
>  		break;
>  	}
>  	vact = (double)hact * vratio / hratio;
> -	vact = 8 * ((vact + 7) / 8);

I need to look closer at this. I think it was added to help with 1360x768, which without
this line maps to 1360x765.

I'll get back to you on this.

Regards,

	Hans

>  	refresh = (b2 & 0x3f) + 60;
>  
>  	formula.hact = hact;
> 

