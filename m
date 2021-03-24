Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481F834842E
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 22:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbhCXVwf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 17:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234582AbhCXVwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 17:52:04 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8C5C06174A;
        Wed, 24 Mar 2021 14:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=iVna0LKmKUuZbQEN2bcoOSl+qbE/fUns8rSsTuiNCUk=; b=AIrrEQiJQKFLouTAnj5YL4Ny69
        yNKYl3oHJj78RxB9hTd6hGqQBK9mOWwcx5Np+YdjikaXpHgBlGtjExkBIkPhoxn5Qq5pe1KCJdmMs
        Lotf4zjpJ1RjnDKG7zcP52+Ys+G5QDZgNkeE/PFol6bKBfgugrzpYy38/iVAz1g4u7etPzgMcHM4t
        nlgJZRjPcswXGbG0PwaDEDuXL68ytD4jx9HT+iJ1TjL0o+wZo+0sv/fvwFlxyYxR38r2QqvqiBcdf
        90W4aNxeqPPt7Y3oWhCkApA66NrLEJQykCDz+uIuRYfaxRneYbZwoC1xOD15tnjsa5bAQrC9t3b16
        zO3Mv5VA==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lPBPn-000G27-II; Wed, 24 Mar 2021 21:51:57 +0000
Subject: Re: [PATCH] media: cx88: Fix a typo
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, mchehab@kernel.org,
        gustavoars@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210324141743.11961-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7fa786bd-a21a-ffb4-895c-0d3afba4b876@infradead.org>
Date:   Wed, 24 Mar 2021 14:51:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324141743.11961-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/24/21 7:17 AM, Bhaskar Chowdhury wrote:
> 
> s/sillicon/silicon/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/media/pci/cx88/cx88-cards.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/cx88/cx88-cards.c b/drivers/media/pci/cx88/cx88-cards.c
> index 8e224fc0474d..f01e48c23f8e 100644
> --- a/drivers/media/pci/cx88/cx88-cards.c
> +++ b/drivers/media/pci/cx88/cx88-cards.c
> @@ -3206,7 +3206,7 @@ static int cx88_xc4000_tuner_callback(struct cx88_core *core,
> 
>  /*
>   * Tuner callback function. Currently only needed for the Pinnacle
> - * PCTV HD 800i with an xc5000 sillicon tuner. This is used for both
> + * PCTV HD 800i with an xc5000 silicon tuner. This is used for both
>   * analog tuner attach (tuner-core.c) and dvb tuner attach (cx88-dvb.c)
>   */
>  static int cx88_xc5000_tuner_callback(struct cx88_core *core,
> --


-- 
~Randy

