Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3784A7A6C08
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 22:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbjISUHP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 16:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjISUHO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 16:07:14 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3369F
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 13:07:09 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Rqt3t2Gj3z49Q2P;
        Tue, 19 Sep 2023 23:07:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1695154026;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ou6GR+xg2A9dMQJf0lLZ+NOZi2ejNKlxRNmlfTVxvL4=;
        b=edRS4g//g77LqsFhJ69ngtLDHertTbwzsuUHB/RLAsJwdBh+2fPzjjR7MpctogsZoHPlgJ
        rQPgkEaDKmtYeaqOVuJ2cuXV61HT6L83eMjpVn08C9O+iS2RfN8jEKghK3GwsDrX5yNlWc
        pFJGMqF9qHCYFNeWK3dlZAJvc8qrgzf8R/9RnWQWhGvOADx8ZL8QCRwT5r5FeIjKIFVUmw
        LeLkGkD+t77VkOkJ7CaimkDNSjWHpAa1B9eZPd2xg0/wk2gmzT58C9A6t4QX2lhCzm1VYT
        IYfrIHf9kv0CWbws4sYLbag7oyvjov1aObMzDr7QIEqLMeTJKfL/ayOwTTpGlA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1695154026; a=rsa-sha256;
        cv=none;
        b=iKeJodLBVLBcQ5EiwwlMpzsmyRVcgBAEVuqzV66x5knRyKKUAfU7ZXRGYlGx4rrz08yNDp
        pcCwI2PeP0AbUHg4Br6T9n+BkQxIVOJQqUou1/zUV18g9gCg23LAONF+hRescAYXrD7NlC
        VZk3tbulZg1iIjET2oFwr6+JnPsKmfRJ1MIaohvjaFjghsj6QWiU37/PyYHyQJ7kb0ViU8
        EU2EfVHq0/fMfX6wWF/XpqZKLbdt7gp6ETov8KdISMEVqza2qZzeBDvqKupjRmGih/bh9m
        tBaOCxPJ/Zi5nlT1WZej0tn+rYBNBbFk3UDQQS9238W7lcm+9iLEyME0NDfv/A==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1695154026;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ou6GR+xg2A9dMQJf0lLZ+NOZi2ejNKlxRNmlfTVxvL4=;
        b=DHNeYDCK7jn9xoJFeAO0NxvMTOG2xHq/5XNJYZE43GwW3zoJYjy60r/qOnhC12pjc76X6Q
        +XyvLRxjBuRHDBjoq1W9P5eh+Ol5OMNzDy2FgV8ntF35vWX7AF8xaWAbOgsF6zbdt+duZD
        DCRZg6ih9DFY8IAqlU+kE20QLn80HwDQtSMMbcEH99YiKVw6tIqEdcb9t0VeOBNspgds/I
        8K3XSe5qLF56X7IkxQTNe6sI/jDdg+RSu1LWnEZ/bOEgcPw/WagAvI6btHYJ0AmVkw8dpd
        tHunL1Kj/jjskGQKnwE0VvqEXNPsD316UkAbkVnv6254O04KGdHzyfHOh9EiXw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B87F0634C93;
        Tue, 19 Sep 2023 23:07:05 +0300 (EEST)
Date:   Tue, 19 Sep 2023 20:07:05 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Ricardo Ribalda <ricardo@ribalda.com>
Subject: Re: [PATCH] yavta: Format type errors for non x86 arches
Message-ID: <ZQn/aXrIx7ItvrXI@valkosipuli.retiisi.eu>
References: <20230919140123.6277-1-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919140123.6277-1-ricardo@ribalda.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thanks for the patch.

On Tue, Sep 19, 2023 at 04:01:23PM +0200, Ricardo Ribalda wrote:
> mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different lenghts
> for long long ints, which result in some compilation errors.
> 
> Lets add some castings to help the compiler deal with this.
> 
> We cannot use the Format macro constants ffrom inttypes because they
> seem to not be compatible with kernel (__u64 et al) types.
> 
> Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> ---
>  yavta.c | 35 +++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)
> 
> diff --git a/yavta.c b/yavta.c
> index d562863..bf54e4f 100644
> --- a/yavta.c
> +++ b/yavta.c
> @@ -1313,7 +1313,8 @@ static void video_query_menu(struct device *dev,
>  			printf("  %u: %.32s%s\n", menu.index, menu.name,
>  			       menu.index == value ? " (*)" : "");
>  		else
> -			printf("  %u: %lld%s\n", menu.index, menu.value,
> +			printf("  %u: %lld%s\n", menu.index,

Could you instead use PRId64 for this? You can avoid casting to another
type this way. Same for the other cases.

> +			       (long long)menu.value,
>  			       menu.index == value ? " (*)" : "");
>  	};
>  }

-- 
Regards,

Sakari Ailus
