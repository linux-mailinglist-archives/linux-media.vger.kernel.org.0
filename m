Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF62C7BC051
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 22:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbjJFU3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 16:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233398AbjJFU3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 16:29:12 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5117ABD
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 13:29:11 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-690d2e13074so2118738b3a.1
        for <linux-media@vger.kernel.org>; Fri, 06 Oct 2023 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696624151; x=1697228951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEFC14BkrpnGEbJ9O9/6ay29sN85g5PSsTmfl2FKtGM=;
        b=QaOEVh4iMGiGUAf28F4zIIUf6DWwqGRlCKLy/mzlxp1g3D4hO+qfCBKGne2r1sal+Q
         Tsy0hX4VAkveQLZU6GhgKeGw2urgslGMfrleHbtuqUnAr7cUgCiQvEH6vuD7RgdjnR6d
         GDn0rk2ZFAioj2LsNNfZfc0k0PgytS9TKT5xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624151; x=1697228951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEFC14BkrpnGEbJ9O9/6ay29sN85g5PSsTmfl2FKtGM=;
        b=PdW4F4xZfPSQefh3of+YwoYbIpCBwPTYV50PIQwpxALNEDKF8OXeMI4i/NzycWYH8r
         tEqhWKQ9uvtewjb+gEIdbPhdi8E7y37N0CmjeWLQVxIg+51RETfBtpF8oeU8EzJ5e1Dy
         8/UYsETYlMIyDzoHweCY3jF9Bui6SVSlS7C3NXylrgZmoG3Qpoeix4cHNeZQLyGUwwbP
         kDLfP/fWXS/uEXpnwEEFG5LXhaO+yEn781NTAiraB+unZcofU3K9J5halsr+wEisnN6z
         qbD7SfNpxoOy3ORYmgHbw5ruBETVqYDjpMN3+3VAWWKHLpjpw/t0K1pYqEkLJGf9vHwH
         gVmg==
X-Gm-Message-State: AOJu0YxknOIrdca5yXQU6gXvQkF2teTfZ6dQHd2Hxjbr1tRTOe6VUKZq
        QcYwMpTZ8xTALhbgyV9jPRHoWA==
X-Google-Smtp-Source: AGHT+IGRyv8sAjwYvp43ZGf13MZV0quwDxaxDpmItfLr+PaHBjrnG6egScp3KHGIyEw9yf3qE2TREA==
X-Received: by 2002:a05:6a00:168b:b0:692:6d3f:485b with SMTP id k11-20020a056a00168b00b006926d3f485bmr10482622pfc.3.1696624150808;
        Fri, 06 Oct 2023 13:29:10 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78c11000000b0068c10187dc3sm1896078pfd.168.2023.10.06.13.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:29:10 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <keescook@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        lijian <lijian@yulong.com>, linux-media@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-event: Annotate struct v4l2_subscribed_event with __counted_by
Date:   Fri,  6 Oct 2023 13:28:40 -0700
Message-Id: <169662411867.2154917.2192633783167073007.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922174951.work.160-kees@kernel.org>
References: <20230922174951.work.160-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 22 Sep 2023 10:49:52 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct v4l2_subscribed_event.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [...]

Since this is a trivial change and it's been 2 week without further
discussion, I'll snag this patch.

Applied to for-next/hardening, thanks!

[1/1] media: v4l2-event: Annotate struct v4l2_subscribed_event with __counted_by
      https://git.kernel.org/kees/c/b1a20bbd4687

Take care,

-- 
Kees Cook

