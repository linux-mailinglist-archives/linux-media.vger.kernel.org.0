Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15E7F619409
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 11:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbiKDKBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 06:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231620AbiKDKBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 06:01:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B47A28E11
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 03:01:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29A8F62123
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 10:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2731C433C1;
        Fri,  4 Nov 2022 10:01:13 +0000 (UTC)
Message-ID: <4ef87a4a-66f1-135a-8261-b2760296531b@xs4all.nl>
Date:   Fri, 4 Nov 2022 11:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] media-build: fix menuconfig usage for kernel >= 5.13.0
Content-Language: en-US
To:     Tomasz Maciej Nowak <tmn505@terefe.re>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Maciej Nowak <tmn505@gmail.com>
References: <20221025152902.14298-1-tmn505@terefe.re>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221025152902.14298-1-tmn505@terefe.re>
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

Hi Tomasz,

The media_build system is no longer maintained, see

https://lore.kernel.org/linux-media/32288c08-3220-25ce-36e2-7c98ff81a264@xs4all.nl/

So I'm rejecting this patch as it is no longer relevant.

Regards,

	Hans

On 25/10/2022 17:29, Tomasz Maciej Nowak wrote:
> From: Tomasz Maciej Nowak <tmn505@gmail.com>
> 
> Because of 6dd85ff178cd ("kconfig: change "modules" from sub-option to
> first-level attribute") in Linux kernel the "option" key-word is not
> recognised anymore. That causes an abort when menuconfig is invoked.
> Fix it by adding proper attribute depending on kernel version the
> media_build is used against.
> 
> Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
> ---
>  v4l/scripts/make_kconfig.pl | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/v4l/scripts/make_kconfig.pl b/v4l/scripts/make_kconfig.pl
> index 69f0c67a37b1..76fbf8a168bc 100755
> --- a/v4l/scripts/make_kconfig.pl
> +++ b/v4l/scripts/make_kconfig.pl
> @@ -651,7 +651,11 @@ while (my ($key, $deps) = each %depend) {
>  	print OUT "# Needed by ", join(', ', keys %$deps), "\n";
>  	print OUT "config $key\n\ttristate\n";
>  	print OUT "\tdefault ", qw(n m y)[$kernopts{$key}], "\n\n";
> -	print OUT "\toption modules\n" if ($key eq "MODULES");
> +	if (cmp_ver($kernver, '5.13.0') < 0) {
> +		print OUT "\toption modules\n" if ($key eq "MODULES");
> +	} else {
> +		print OUT "\tmodules\n" if ($key eq "MODULES");
> +	}
>  }
>  close OUT;
>  

