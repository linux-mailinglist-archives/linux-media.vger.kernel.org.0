Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7757B38F8
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 19:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbjI2R3L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 13:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233863AbjI2R3D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 13:29:03 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B9ACFC
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 10:28:36 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-692a885f129so10333897b3a.0
        for <linux-media@vger.kernel.org>; Fri, 29 Sep 2023 10:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696008516; x=1696613316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Po3iJEPyhTDHKHPYluCLtAPAQ5pzD+vTnYerXb74xEg=;
        b=cO80HXeYmyhSsBCB7tXQU1Ce772cGf1RoQxQ//zw/qtcXztY1J8XGB+qun3ZYGmsaq
         lrufjkV5TEpE0arjJXC56GhUY+xN/V0An7aZORQqzEU0YrlLkgOLUlRduhKWgk1wflDh
         g7xNt46p/LXssE84ssuqyE7fumLOdFpUFzBZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696008516; x=1696613316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po3iJEPyhTDHKHPYluCLtAPAQ5pzD+vTnYerXb74xEg=;
        b=oY3j5wuozzIvjiciRvRL1g1vY9pP3IA6SdemxH8uDWCVat0xk3wWrSylBb9rKimBud
         wPnrYUfG8t5Pzszn3QShpWthgxXqmbORNeyRdO4UL8kwm2UEs2Rt/oCNswFCOzONLPil
         vGJcFZ8jh3AuteyTO9Hwh+UgevU8t7UJRE2yr1QRCYZyXAQT95lCzbGO24Cn9Z8MOZ98
         gJlC7Fjaeq0JkN/rqQ7yfBoKge5hvYs6rayUUYQj/e+0eO6rV8dVA7BWq21tDOIEhASM
         8Z8UuR6T4f4uMucogNbta1CoQgpxDhRo2QXaJ829l4LlEnRHc6zNpvPg1CtTUdQlRwxA
         sZeQ==
X-Gm-Message-State: AOJu0Yx3AEHf+NH2PJIRcQVA2PQJxR1KYcn/koUnEc9mR9/JNDg3R21X
        q0jjWnqpOr5BQJPBXwht0Ledbw==
X-Google-Smtp-Source: AGHT+IELca6dHQ43mKm/oMzdvQYfA4Uh8/PuQ46jEYeyMLg9ZQpRBWSkpn/PPZVgmSwvl4Uqd7CFMg==
X-Received: by 2002:a05:6a20:a110:b0:159:b7ba:74bd with SMTP id q16-20020a056a20a11000b00159b7ba74bdmr5057365pzk.50.1696008515843;
        Fri, 29 Sep 2023 10:28:35 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m16-20020aa79010000000b0068fece22469sm15298300pfo.4.2023.09.29.10.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 10:28:35 -0700 (PDT)
Date:   Fri, 29 Sep 2023 10:28:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] media: usb: siano: Fix undefined behavior bug in
 struct smsusb_urb_t
Message-ID: <202309291027.305751B8@keescook>
References: <ZRbwU8Qnx28gpbuO@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRbwU8Qnx28gpbuO@work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 29, 2023 at 05:42:11PM +0200, Gustavo A. R. Silva wrote:
> `struct urb` is a flexible structure, which means that it contains a
> flexible-array member at the bottom. This could potentially lead to an
> overwrite of the object `wq` at run-time with the contents of `urb`.
> 
> Fix this by placing object `urb` at the end of `struct smsusb_urb_t`.
> 
> Fixes: dd47fbd40e6e ("[media] smsusb: don't sleep while atomic")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

As Jann pointed out, it's unlikely there is a function bug here, but I
still think it's right to make sure this is robust and clears the way
for -Wflex-array-member-not-at-end.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
