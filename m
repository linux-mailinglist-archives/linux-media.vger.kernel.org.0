Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65CC3587CAF
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 14:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236315AbiHBMyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 08:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbiHBMyy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 08:54:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E531F2DF
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 05:54:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C329DB81EF9
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 12:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E5CC433C1;
        Tue,  2 Aug 2022 12:54:49 +0000 (UTC)
Message-ID: <24acf040-a864-44d9-aa18-42dfc5866bff@xs4all.nl>
Date:   Tue, 2 Aug 2022 14:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] edid-decode: downgrade missing display product name to
 warning
Content-Language: en-US
To:     Simon Ser <contact@emersion.fr>, linux-media@vger.kernel.org
References: <20220802093219.30599-1-contact@emersion.fr>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220802093219.30599-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/2/22 11:32, Simon Ser wrote:
> The spec says:
> 
>> The model name of the display product may be listed (optional
>> but recommended) in the Display Product Name (ASCII) String
>> Descriptor (tag #FCh).
> 
> So a missing Display Product Name descriptor shouldn't fail
> conformance.

Actually it is mandatory in EDID v1.3, but optional for EDID v1.4.

So this should be a fail if edid_minor == 3, and a warn otherwise.

Can you post a v2 of this patch? You can use the msg() function directly
instead of fail/warn.

Regards,

	Hans

> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  parse-base-block.cpp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/parse-base-block.cpp b/parse-base-block.cpp
> index 9644577bab70..525cd4c02257 100644
> --- a/parse-base-block.cpp
> +++ b/parse-base-block.cpp
> @@ -1673,7 +1673,7 @@ void edid_state::parse_base_block(const unsigned char *x)
>  	do_checksum("", x, EDID_PAGE_SIZE);
>  	if (base.edid_minor >= 3) {
>  		if (!base.has_name_descriptor)
> -			fail("Missing Display Product Name.\n");
> +			warn("Missing Display Product Name.\n");
>  		if ((base.edid_minor == 3 || base.supports_continuous_freq) &&
>  		    !base.has_display_range_descriptor)
>  			fail("Missing Display Range Limits Descriptor.\n");
> 
> base-commit: 582c935652b0303b87ddad4551e6f97f8bb883ac

