Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E60535E15E
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 16:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbhDMO1x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 10:27:53 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49137 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231989AbhDMO1r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 10:27:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WK0UlFTnQMxedWK0Xliy0M; Tue, 13 Apr 2021 16:27:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618324037; bh=acPwpmN8LRurjL4ZoK4jcfchuekDqa0A8WDaYbS96Wc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=etqLEeHAGChlAY0FfadeMw2io21bvnev3o6na85h75HO4wvMC3J9OtSCNs4ck+WkX
         lyWZiCnD0ZkqsLhoxvsuM5qlXU+0HR1oWMc2pntVGa0L2sxoiyg30hlYaTKlx/SrIY
         34IOM4O7bbkANLF0tDY7mZ1H6aJEomACWzE/CiADtBBicif/JJ6TuwRFK8hhbSzuIj
         xK3PSncxWPkTca10pHZAszyWf3e/if43qftqZMnFn0IoISBHZBGmwkM8KuzJSLz2Au
         YPFr/Qe3OGkNfs1NyvQoOZrvtHNbeKg1NzZf5/o+P6cXCLkYsGxpo7YGrayl4DldVO
         2YME4R7Fb+yrg==
Subject: Re: [PATCH v2] staging: media: zoran: moved statement to next line
 with '*'
To:     Mitali Borkar <mitaliborkar810@gmail.com>, clabbe@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
References: <YHA9Gsc2pmmtmlNA@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2ab278b3-19dc-ce49-5dd9-62cf7c79290b@xs4all.nl>
Date:   Tue, 13 Apr 2021 16:27:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHA9Gsc2pmmtmlNA@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOfKXL3v/ZL9rj1TGdEQKCtCs8w7YPUtZn+5Pq/Bnfh8r0stLKIUDov8tFPRxleBKIBL5LY3z9D6zWSNz4MR1UPkFMZToZjWwMU3yjO43SDK2XIiFTCn
 JD/lVRLT1oJyGvZwJfYKrSAsxvCPGRxPZeDenDMAO6kv77Irdc5Q0JSn+I466nekBEIVh33EUGJgeXvJ1yMiOHGaHTED3xUkXTiHkebRHCVkbyjQvykKpqNc
 rgfcgeHyC1xk3gjLYHZSb5Jfkj1+6sS8fFpdtLbq/bqZ9hOn16nA/Zx25uspCwIU8MtKEy4CE6FoyPz/ZkUroy/yy3r7x1wztaPNPl/fAAo2gBvVe+/4pzdy
 L99ABAm8ioOd6PcKILuyv2ozlFG659p0gAQeWp0egtLg8mc5cQf5McHZjvtEOoaujfruqldIVhz1yzkWHKhfP2TlrobNgAFrRQboqPejGPua0/xLt95LZLn8
 UpnKtBwaySE4EjKpv1a8d92D8vtPqVKqpeI16g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/04/2021 13:40, Mitali Borkar wrote:
> Moved the statement to next line and added '*' before it to meet
> linux kernel coding style for long(multi-line) comments.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
> 
> Changes from v1:- made style changes according to linux kernel coding style
> for long comments.
> 
> drivers/staging/media/zoran/zr36060.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
> index 035634fc1c6d..8c6f4d792a9d 100644
> --- a/drivers/staging/media/zoran/zr36060.c
> +++ b/drivers/staging/media/zoran/zr36060.c
> @@ -249,7 +249,8 @@ static const char zr36060_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
>  static const char zr36060_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
>  static const char zr36060_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
>  
> -/* SOF (start of frame) segment depends on width,
> +/*
> + * SOF (start of frame) segment depends on width,
>   * height and sampling ratio of each color component
>   */
>  static int zr36060_set_sof(struct zr36060 *ptr)
> 

Same problem as with other patches: this sits on top of your v1, so won't apply
to mainline code.

Regards,

	Hans
