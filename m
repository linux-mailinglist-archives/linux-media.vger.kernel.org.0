Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB5B05F4A38
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 22:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiJDUUQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 16:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJDUUP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 16:20:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DC713FA0
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 13:20:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B4EA7B81BBF
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 20:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA330C433C1;
        Tue,  4 Oct 2022 20:20:09 +0000 (UTC)
Message-ID: <1b377481-428c-ad7c-6444-0fd9b054905f@xs4all.nl>
Date:   Tue, 4 Oct 2022 22:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] edid-decode: fix typo for tiled display bezel
To:     Simon Ser <contact@emersion.fr>, linux-media@vger.kernel.org
References: <20221004125439.2826-1-contact@emersion.fr>
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221004125439.2826-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Simon,

On 10/4/22 14:54, Simon Ser wrote:
> The spec uses the word "bezel", not "bevel".

Nice catch! I've applied the patch.

Thank you,

	Hans

> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  parse-displayid-block.cpp | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
> index a754483b3b73..6dddad37584d 100644
> --- a/parse-displayid-block.cpp
> +++ b/parse-displayid-block.cpp
> @@ -1027,20 +1027,20 @@ void edid_state::parse_displayid_tiled_display_topology(const unsigned char *x,
>  	printf("    Tile resolution: %ux%u\n", tile_width + 1, tile_height + 1);
>  	if (caps & 0x40) {
>  		if (pix_mult) {
> -			printf("    Top bevel size: %.1f pixels\n",
> +			printf("    Top bezel size: %.1f pixels\n",
>  			       pix_mult * x[12] / 10.0);
> -			printf("    Bottom bevel size: %.1f pixels\n",
> +			printf("    Bottom bezel size: %.1f pixels\n",
>  			       pix_mult * x[13] / 10.0);
> -			printf("    Right bevel size: %.1f pixels\n",
> +			printf("    Right bezel size: %.1f pixels\n",
>  			       pix_mult * x[14] / 10.0);
> -			printf("    Left bevel size: %.1f pixels\n",
> +			printf("    Left bezel size: %.1f pixels\n",
>  			       pix_mult * x[15] / 10.0);
>  		} else {
> -			fail("No bevel information, but the pixel multiplier is non-zero.\n");
> +			fail("No bezel information, but the pixel multiplier is non-zero.\n");
>  		}
>  		printf("    Tile resolution: %ux%u\n", tile_width + 1, tile_height + 1);
>  	} else if (pix_mult) {
> -		fail("No bevel information, but the pixel multiplier is non-zero.\n");
> +		fail("No bezel information, but the pixel multiplier is non-zero.\n");
>  	}
>  	if (is_v2)
>  		printf("    Tiled Display Manufacturer/Vendor ID: %02X-%02X-%02X\n",
