Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 967C363C63A
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 18:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236492AbiK2RND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 12:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236435AbiK2RMx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 12:12:53 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929D912A99
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 09:12:49 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-381662c78a9so145365627b3.7
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 09:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JHEjD2xxLNtQCC6FYElEPgk7av75DQm6bwKKXcbxhRE=;
        b=rcG6dqqNMky7jtdTJ46UkMVCNRhCC2wS2wzYNMxEWmGIbDbfjKUTHWdytUvxxZ1hCO
         hii0c0lXZOyFm8dJkzKTYZkEVGzbv50tfIKwFHk1Z4+6D/+dF+zj4hRkJfq9z8cmBL21
         qQbfMHJ2NlTGaB434A4h0QmMLvib0OqFYg5apgzZxYpA/sF5NBxK46w8UJ2wJy6vAGY8
         3IeY9uTE0JxVikWmy/lCoTqxXfVyFtezGLVM3gKj95d4Dxt9v5+8VM8ZbuDVvgyI4R7x
         EFR+uEnDq8S9gWaKyUB+g/NJ/YALqL4rI5FDrlTaSuguvEvo77nrE8+8zKnFOLXVVUTD
         5LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHEjD2xxLNtQCC6FYElEPgk7av75DQm6bwKKXcbxhRE=;
        b=DOPjTaEeEGc2eCXX9U4EjyLyBWxs3+/xEFnrWaiptl8b3HxUFvQkJH5rsddAUIBFbT
         rodUTtga+JvMOn4+pP9zxefxJ9Az3L82NABJ9Jnls+KPOtilXmSxz0o4s9txmK6xo266
         ZBQlYhxyRgTcuCh2e84aPsdcFoTHhB/R10G+GHG1QuUM9EsjQegoyVY9UWpMs+nZASRN
         BEvTUZj8xbdf2AkwOoVnIA4FD38QAoVjGjIn4AkzaMO24ul0CnOFaezI1id0w4/gm+jJ
         Bq8Unlg3d1i89L/9U/blVX/Tv5beEihIaLRVG0aOwPuvMJGF07Bps41gf6yt56VU6dbq
         p4Kg==
X-Gm-Message-State: ANoB5pndoSG/jRWuezekDUBGh8fKmENmgxcQCl7ThwurVb5ecmwqf5KZ
        Jf7/OgR+cNi3svgnvJJrXsj1lPQcR42ala8XPuLeFg==
X-Google-Smtp-Source: AA0mqf6tFV1ruJYeq+RpTMqBCXfOUZuF64Zqeq76MlGGXN950+keht0aCkWxTl6Ut47af6Q+Cm0dvHmw7A4GE9YbArk=
X-Received: by 2002:a81:9a94:0:b0:3af:eac8:76e0 with SMTP id
 r142-20020a819a94000000b003afeac876e0mr30728331ywg.256.1669741968574; Tue, 29
 Nov 2022 09:12:48 -0800 (PST)
MIME-Version: 1.0
References: <202211241926133236370@zte.com.cn>
In-Reply-To: <202211241926133236370@zte.com.cn>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Tue, 29 Nov 2022 09:12:37 -0800
Message-ID: <CABdmKX2aidW7LnvTWdULtHr0yzdSb=KqTWp=7RUUNCOA548Pag@mail.gmail.com>
Subject: Re: [PATCH linux-next] dma-buf: use strscpy() to instead of strlcpy()
To:     yang.yang29@zte.com.cn
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        xu.panda@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 24, 2022 at 3:26 AM <yang.yang29@zte.com.cn> wrote:
>
> From: Xu Panda <xu.panda@zte.com.cn>
>
> The implementation of strscpy() is more robust and safer.
> That's now the recommended way to copy NUL terminated strings.
>
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> Signed-off-by: Yang Yang <yang.yang29@zte.com>
> ---
>  drivers/dma-buf/dma-buf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index b6c36914e7c6..485cf4f3431e 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -51,7 +51,7 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
>         dmabuf = dentry->d_fsdata;
>         spin_lock(&dmabuf->name_lock);
>         if (dmabuf->name)
> -               ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
> +               ret = strscpy(name, dmabuf->name, DMA_BUF_NAME_LEN);

The type of ret should also be changed to ssize_t to capture the
negative error value which strlcpy does not have. We shouldn't ever
see that error condition here with the code the way it is now, but
let's not risk it.

>         spin_unlock(&dmabuf->name_lock);
>
>         return dynamic_dname(buffer, buflen, "/%s:%s",
> --
> 2.15.2
