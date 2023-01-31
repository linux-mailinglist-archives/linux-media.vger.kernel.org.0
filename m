Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E77A68283C
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 10:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbjAaJHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 04:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232370AbjAaJHB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 04:07:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400831E2A8
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 01:03:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 09747B81A77
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 09:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6B3C4339B;
        Tue, 31 Jan 2023 09:02:58 +0000 (UTC)
Message-ID: <936514b3-8cff-2707-e4c4-92d795ec2a84@xs4all.nl>
Date:   Tue, 31 Jan 2023 10:02:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] edid-decode: print human-readable CTA infoframe types
Content-Language: en-US
To:     Simon Ser <contact@emersion.fr>, linux-media@vger.kernel.org
References: <20230130172224.65193-1-contact@emersion.fr>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230130172224.65193-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/01/2023 18:22, Simon Ser wrote:
> Instead of printing the code, print the human-readable infoframe
> type. This is more informative.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  parse-cta-block.cpp | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
> index 02730a9eafb1..3a6be3972e50 100644
> --- a/parse-cta-block.cpp
> +++ b/parse-cta-block.cpp
> @@ -2203,6 +2203,17 @@ static void cta_hdr_dyn_metadata_block(const unsigned char *x, unsigned length)
>  	}
>  }
>  
> +static const char *infoframe_types[] = {
> +	NULL,
> +	"Vendor-Specific",
> +	"Auxiliary Video Information",
> +	"Source Product Description",
> +	"Audio",
> +	"MPEG Source",
> +	"NTSC VBI",
> +	"Dynamic Range and Mastering",
> +};
> +
>  static void cta_ifdb(const unsigned char *x, unsigned length)
>  {
>  	unsigned len_hdr = x[0] >> 5;
> @@ -2218,16 +2229,24 @@ static void cta_ifdb(const unsigned char *x, unsigned length)
>  	x += len_hdr + 2;
>  	while (length > 0) {
>  		int payload_len = x[0] >> 5;
> +		unsigned char type = x[0] & 0x1f;
> +
> +		const char *name = NULL;
> +		if (type < ARRAY_SIZE(infoframe_types))
> +			name = infoframe_types[type];
> +		if (name)
> +			printf("    %s InfoFrame", name);

Can you show the type as well? E.g.: "    %s InfoFrame (%u)", name, type

It can be useful to have the code too.

If you can post a v2 with that change, then I'll take it.

Regards,

	Hans

> +		else
> +			printf("    Unknown InfoFrame (%u)", type);
>  
> -		if ((x[0] & 0x1f) == 1 && length >= 4) {
> +		if (type == 1 && length >= 4) {
>  			unsigned oui = (x[3] << 16) | (x[2] << 8) | x[1];
>  
> -			printf("    InfoFrame Type Code %u, OUI %s\n",
> -			       x[0] & 0x1f, ouitohex(oui).c_str());
> +			printf(", OUI %s\n", ouitohex(oui).c_str());
>  			x += 4;
>  			length -= 4;
>  		} else {
> -			printf("    InfoFrame Type Code %u\n", x[0] & 0x1f);
> +			printf("\n");
>  			x++;
>  			length--;
>  		}
> 
> base-commit: e052f5f9fdf74ca11aa1a8edfa62eff8d0aa3d0d

