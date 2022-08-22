Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7C7459C002
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 15:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbiHVNC4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 09:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbiHVNCz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 09:02:55 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AD833E29
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 06:02:54 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id b2so7721653qkh.12
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 06:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=wIwKw1gOb6F5duzr7O0U8izvfu93fzT6GsFY+BrsqnM=;
        b=WLchoSq/f2Kkw5Mx3GU2X7FcLXOY3v0M0uucywP7l29piamld3Onu7BmMdDi9MYZbJ
         f0PR3Yh6uO7ug5yNDXEtd98wGxJ9PhmA0r8mxFN+YsUfcOBarWwhs/4ROhmdjvC3RcGI
         jlgv7HV/TnhIxvMa/3V3498lPepZV1W56c2J5XeI2UIuPTFJ34pSGLh3KXw8m/aMiIF3
         gj42A0f5McUzadIXbn9/zv/flzCXkWq9NK8OISQ0KN+iFydcKh7yedsPz8ZIfF+E93s5
         /amP5AfQaz/rttYYNTl41Ci2wdV3Myv20galVLjEn8/DNFDzG07+yV3fsA/VwK2Ox56h
         1idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wIwKw1gOb6F5duzr7O0U8izvfu93fzT6GsFY+BrsqnM=;
        b=yQVa9NKyeBoPW9B9utrWoLSDpXRHi+zdHwHQ46VPavCf0zRx0GdQ920MGMl1Vn7wz5
         05AjmlSYbcWjjXYgx/NWNu9p3z5FLNyqNPmKVQs1/Pwj5CpL+1ou6DkYNeSdXZ3ykskj
         rzYpBgQlPn3qwDWLETStZle5R6M8M9poJMhv5OUrqeV23HiuQkQYpt2wwECfK1MFhhQf
         H4ROOsNMnbfsiUIW+a9HGeAM7MXv3gCfJr26y/hdPAltlgrHsyQZTEp7L3fSuE+sQ5gk
         Nihx2vmgF/ioofpcysmA7RwsKt05m6tBDBRT/EUt/UBSbg7kixDcrPGiCK76sElIHrsl
         Yocg==
X-Gm-Message-State: ACgBeo1lGUDEPpUwelYhM168iuN8wF/o5Pk1ZtTW7N0hJH7pqFZXeoCs
        PUhVJ36L1rOm4TMkRGvqOpESAVb1kQQX3ESh6Oc=
X-Google-Smtp-Source: AA6agR5GKs/gL1Oyb6udRN2RSYIIPhIwxadD03mQmbVzjwC+Oa2puVHwzx4dtEiREOW9fXq+GHnMTzge9KVkUBuceFQ=
X-Received: by 2002:a05:620a:288a:b0:6b8:fcfe:db02 with SMTP id
 j10-20020a05620a288a00b006b8fcfedb02mr12917577qkp.504.1661173373560; Mon, 22
 Aug 2022 06:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220821215027.461344-1-hdegoede@redhat.com> <20220821215027.461344-12-hdegoede@redhat.com>
In-Reply-To: <20220821215027.461344-12-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Aug 2022 16:02:17 +0300
Message-ID: <CAHp75Vezhe_pBrt+pesneh-Tt_eqwJyOHmMdt8s7nG-V+6O7iQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] media: atomisp: hmm_bo: Drop PFN code path from alloc_user_pages()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 22, 2022 at 12:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> alloc_user_pages() is only ever called on qbuf for USERPTR buffers which
> always hits the get_user_pages_fast() path, so the pin_user_pages() path
> can be removed.
>
> Getting the vma then also is no longer necessary since that is only
> done to determine which path to use.
>
> And this also removes the only users of the mem_type struct hmm_bo member,
> so remove that as well.

...

> +       /*Handle frame buffer allocated in user space*/

Spaces?

> +       mutex_unlock(&bo->mutex);

> +       page_nr = get_user_pages_fast((unsigned long)userptr,
> +                                     (int)(bo->pgnr), 1, bo->pages);

No need for parentheses in the first argument.

> +       mutex_lock(&bo->mutex);

> +       dev_dbg(atomisp_dev, "%s: %d user pages were allocated as 0x%08x\n",
> +               __func__, bo->pgnr, page_nr);

Since you touch this you may remove __func__, which can be enabled via
dynamic debug. OTOH, it might be better to go and drop __func__
everywhere in the driver in the debug messages.

-- 
With Best Regards,
Andy Shevchenko
