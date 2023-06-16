Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D5073251E
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 04:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240418AbjFPCRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 22:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbjFPCRb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 22:17:31 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E84E296A
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 19:17:30 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51a324beca6so243325a12.1
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 19:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686881848; x=1689473848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QRMbq2VvSqK0Urjp22PwUm17As2BrZ4veHF95ybZPJ0=;
        b=bovBaQF8JKXet/eDzUBjdG1a68cWfRtaYnJSeJrz4RnISnZ94Z0sUZp5O/yC0dlpEV
         kwzbllsU2r+GfoUhVKhBrp84l4BJJ69jQi6LaBNIJZe6kEo+aqvmjzdwQrogOYqiHFqC
         6In4C/POAngZkjnCgcv94h1LCyqnTtkdzG878=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686881848; x=1689473848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRMbq2VvSqK0Urjp22PwUm17As2BrZ4veHF95ybZPJ0=;
        b=lkKasVJSyUeVOQd1k/3N3J8OQVidVSFRY7u2njwY92DUnA7aZQalb8ob3ORjD7chep
         IOk3X1Cy745D/toDVKA1lsMGlyCpKGpuStAxEjGiOp+c3socwlAKqW4ptkgT0EU95LVh
         ApOEqtyN6+Uausog/0gxRQz6iyFfBAL/7j5V81L5/zEX0ANIg4rJ405R/mPQWfQjntv9
         HGvzxILpX5sR9idnhQATawDvAMWi5RGtzaQF82XAxJdV/IreAHOi+N0uD0be0i4zkure
         dIhVgznL6iMKgVTS1musbHqCNQhhmfu3EqSWn4F7FQB+R0som0OBJejPqEHNBxlydHxR
         HzZg==
X-Gm-Message-State: AC+VfDwQ1Dk1ajcoetyN3EZYxHzeCRvCEERqi+sXwMTnVJoVA25qCl2d
        f3KB/tsUXB3D2zj0sIwr/EJYPx3BM7heju2ZJ+8nn4k7
X-Google-Smtp-Source: ACHHUZ5Wi4DPPm5jZcPkVb2s/YP5LmaDzBVO51GUeRmxhpMCjSlI/b0U33NvhMGuK0V8fs6OV58HGg==
X-Received: by 2002:a17:906:f2c8:b0:958:801b:9945 with SMTP id gz8-20020a170906f2c800b00958801b9945mr482642ejb.31.1686881848703;
        Thu, 15 Jun 2023 19:17:28 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id m25-20020a170906235900b00982aec29db1sm1335689eja.126.2023.06.15.19.17.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 19:17:28 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51a324beca6so243301a12.1
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 19:17:27 -0700 (PDT)
X-Received: by 2002:a50:fb03:0:b0:51a:2f22:6564 with SMTP id
 d3-20020a50fb03000000b0051a2f226564mr279108edq.39.1686881847426; Thu, 15 Jun
 2023 19:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230615121721.1f901ebb@sal.lan>
In-Reply-To: <20230615121721.1f901ebb@sal.lan>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 15 Jun 2023 19:17:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgiL88k26bmOXwkRojVUwkcGdXHBm2-+PwtXUja88+tEA@mail.gmail.com>
Message-ID: <CAHk-=wgiL88k26bmOXwkRojVUwkcGdXHBm2-+PwtXUja88+tEA@mail.gmail.com>
Subject: Re: [GIT PULL for v6.4-rc7] media fixes
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 15 Jun 2023 at 04:17, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> Mauro Carvalho Chehab (3):
>       Merge tag 'v6.4-rc4' into v4l_for_linus
>       Merge tag 'v6.4-rc5' into v4l_for_linus
>       Revert "media: dvb-core: Fix use-after-free on race condition at dvb_frontend"

Please don't do those back-merges. Particularly the *pointless* ones
with bad commit messages.

I've pulled this, bnut your tree literally had three commits, two of
which were WRONG. Their commit messages were pure garbage.

Don't do this. Seriously. It's garbage.

If you can't do proper merges with proper commit messages, just don't
merge things. It's that easy.

              Linus
