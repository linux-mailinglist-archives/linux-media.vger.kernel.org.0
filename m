Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB3EC7BD027
	for <lists+linux-media@lfdr.de>; Sun,  8 Oct 2023 23:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjJHVCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Oct 2023 17:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjJHVCe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Oct 2023 17:02:34 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C66B3
        for <linux-media@vger.kernel.org>; Sun,  8 Oct 2023 14:02:31 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c8a1541233so4044845ad.1
        for <linux-media@vger.kernel.org>; Sun, 08 Oct 2023 14:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696798951; x=1697403751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+637J8JrxpPBKVObYJuwDVzNM6P1JOtG34tKxFSpPmw=;
        b=kiumIqxCXurcE5rVbMY1WNBT4+vW8RJyyelhy11gsoSUiVi3JwFxoTtlQqDgAfkwPQ
         ZbwR1I5Ox2W8z7XnmMboYlsSriYDiGxlValNLH3xedDPtoxHi14RX5dGMwstjyME8deZ
         j3MtSXSDCoCbFYegTcfcV/OjDAVd9bpcAQD+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696798951; x=1697403751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+637J8JrxpPBKVObYJuwDVzNM6P1JOtG34tKxFSpPmw=;
        b=r6ZBmXObauT3DbeavT0wT40D+i8gbL5zOYepF52LKUJaCWM7dQ0f8ia1W31XbwTcDG
         +YmjJs0CjpE8hcscNSLFfedqywbJ5DlaXjKeamBXtAcmKntk/bFHhR1Elewr85nw9rX7
         K7RW+IRM0PKuxIokgzgjOwLgzVaiIXwcIHfRt+zlp0SHjul1TrFW1xqxUfK1+U91lY9w
         1RRB2lwz8HhtQaLS2ee9JVKfkSiir7noSa1DP2h4WiRm8x6a8YiI7KUS8Aj1STz+cgPz
         T8JvCYP9Ch+ivNi1y7M/ivWsmtb38HwRJ1dWXYF6ZkTmmaHjVw0Sf8+usWO3KlBpOwsb
         aq0Q==
X-Gm-Message-State: AOJu0YzrCuvxvPxMeyTWma5JDUtibsjreA5WsM9xTsvVCSpIGi6gS/AD
        fXrCgIuC1sQ3msV20GcosbgEsA==
X-Google-Smtp-Source: AGHT+IGA+gNn0/afQ19stAKcVih0BRUUfkT7EAYUidRwr3O0DF16NyVLt6G/9/uEJWXsIq4Yp/7DBQ==
X-Received: by 2002:a17:90b:3a8e:b0:274:2906:656a with SMTP id om14-20020a17090b3a8e00b002742906656amr11799946pjb.5.1696798951057;
        Sun, 08 Oct 2023 14:02:31 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id nv16-20020a17090b1b5000b00271c5811019sm6919052pjb.38.2023.10.08.14.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 14:02:30 -0700 (PDT)
Date:   Sun, 8 Oct 2023 14:02:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        lijian <lijian@yulong.com>, linux-media@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-event: Annotate struct v4l2_subscribed_event
 with __counted_by
Message-ID: <202310081402.F4DBC2B@keescook>
References: <20230922174951.work.160-kees@kernel.org>
 <169662411867.2154917.2192633783167073007.b4-ty@chromium.org>
 <eeeb183e-f6ed-4158-8852-04da5e452d9b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeeb183e-f6ed-4158-8852-04da5e452d9b@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 07, 2023 at 11:21:26AM +0200, Hans Verkuil wrote:
> On 06/10/2023 22:28, Kees Cook wrote:
> > On Fri, 22 Sep 2023 10:49:52 -0700, Kees Cook wrote:
> >> Prepare for the coming implementation by GCC and Clang of the __counted_by
> >> attribute. Flexible array members annotated with __counted_by can have
> >> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> >> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> >> functions).
> >>
> >> As found with Coccinelle[1], add __counted_by for struct v4l2_subscribed_event.
> >> Additionally, since the element count member must be set before accessing
> >> the annotated flexible array member, move its initialization earlier.
> >>
> >> [...]
> > 
> > Since this is a trivial change and it's been 2 week without further
> > discussion, I'll snag this patch.
> 
> Ah, I picked this up for media as well. Same for the other patch.
> You should have gotten an email from patchwork on Oct 3 that it was accepted.
> 
> I think I should be more pro-active and reply when I pick up patches from
> non-media developers instead of relying on patchwork. It seems that it is
> easy to miss emails from patchwork.

Ah! Thanks for reminding me. I'll drop them from the hardening tree. :)

-Kees

-- 
Kees Cook
