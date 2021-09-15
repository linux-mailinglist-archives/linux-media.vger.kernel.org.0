Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B05F40C348
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 12:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbhIOKHd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 06:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbhIOKHb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 06:07:31 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90663C061574
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 03:06:12 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QRntmN6OOcSrkQRnvmyhXg; Wed, 15 Sep 2021 12:06:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631700371; bh=sy+eRxEClkH3XsEtlG4wJEItTa2Ir7S72EfA6HER6sM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AseTitC+dBlrUXyjlnDZAVN5yKIpUP6p31T3esfcCWT+KpIkLT21ChJQk3g53nugM
         Q4Ns4RkSG4W3gn2rLRRo2+s8YVidMLnNBERhTsFipoObmzmS2zI0k5yjBYgBoH8SQJ
         TqaWMRHqHOaJgBjYC/Aa9vvWvECyv8FjhjUaSKMumXodzZOn5uHAS6pQIugtadIIVx
         okt0gwELinRksGduRddJ//UfrZltnQB4xiG+FEiTgTUj4tquPHdcBEz0ysm5pmApdl
         V+3haf05QlttUYPfrT8hbbXFJiivE1wfbw3sxJEL7Eu+pW20Eo1JjkWLIbnOqgvF7k
         COg8xZO1Ny1Mg==
Subject: Re: [PATCH 03/11] edid-decode: change install directories for macOS
To:     joevt <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20210914121129.51451-1-joevt@shaw.ca>
 <20210914121129.51451-4-joevt@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <451f71d2-be72-9075-9c55-e456182eea5c@xs4all.nl>
Date:   Wed, 15 Sep 2021 12:06:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914121129.51451-4-joevt@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHpinM5J9wOJMufs9AvMWFlguvc4AyM1ZodirZ5haabO1qHb54oRHGHpHQFihbvIshiGhWNj/ENRuzm6mP3K7ejLyHOythL4TubPLhH3af/fbHOdNMfW
 fKsiqn8j7v0dqklyVQm0D36GE92VyUauMK/vLP+a8z27lrjVG31uwO13q7Bxxc4gMU4Fnao2aSY+wDYUZSz2rG4WiFiFo/19PDKT942r3poczA+smepWy9zZ
 hpuCVuNL+w9eyzVtrZTxQCOf/MGdzLr8RgdiJLC7I+BkHcdzdC/LAZ+AX/8Llve9skIqzkPhQPP/AHFeTkIpAw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2021 14:11, joevt wrote:
> In macOS, /usr/bin and /usr/share/man belong to root:wheel so install to /usr/local/bin and /usr/local/share/man instead.
> 
> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
> ---
>  Makefile | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 287b72d..adf6123 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,11 +1,23 @@
> -bindir ?= /usr/bin
> -mandir ?= /usr/share/man
> +ifeq ($(OS),Windows_NT)
> +	bindir ?= /usr/bin
> +	mandir ?= /usr/share/man
> +else
> +	UNAME_S := $(shell uname -s)
> +	ifeq ($(UNAME_S),Darwin)
> +		bindir ?= /usr/local/sbin
> +		mandir ?= /usr/local/share/man
> +	else
> +		bindir ?= /usr/bin
> +		mandir ?= /usr/share/man
> +	endif
> +endif
>  
>  EMXX ?= em++
>  
> -SOURCES = edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp \
> -	  parse-displayid-block.cpp parse-ls-ext-block.cpp \
> -	  parse-di-ext-block.cpp parse-vtb-ext-block.cpp calc-gtf-cvt.cpp
> +SOURCES = \
> +	edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp \
> +	parse-displayid-block.cpp parse-ls-ext-block.cpp \
> +	parse-di-ext-block.cpp parse-vtb-ext-block.cpp calc-gtf-cvt.cpp

This last change is a spurious change, I'll drop this and keep the rest.

No need for you to do anything.

Regards,

	Hans

>  WARN_FLAGS = -Wall -Wextra -Wno-missing-field-initializers -Wno-unused-parameter
>  
>  all: edid-decode
> 

