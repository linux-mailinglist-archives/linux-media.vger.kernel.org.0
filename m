Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F232C4D3DA4
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 00:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbiCIXkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 18:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbiCIXku (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 18:40:50 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DFF95A1F
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 15:39:50 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2dbd97f9bfcso40507287b3.9
        for <linux-media@vger.kernel.org>; Wed, 09 Mar 2022 15:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8AOnmA2Mb/yeEPF4DtUVs5oM65/BGpLN/Af78JnrIqk=;
        b=MOJTOCZTpXWUBNkeI/eMHuKCtar5kYbzQhiOmtpg0vpKrQUl1YE/pY8lGEmDEPCTcs
         VPxSbV6yw8GHU7kTsQWXmutsz/ZGZT0nfIm7EWA5VDSz4gV7EDVdcRo+gyBumznW2WFH
         GbNUb52w91rCdgTWWQ4bXScFb4QxExXD1tH1tRB1AZoBkx7fgNXsuPb6OQGN419UnB9V
         mUDAZ/BrATF0pwdvBAuLODdUy6NPHszy3huKpUnUg25DGb393Ty4OUrku9znI5j19ogf
         YByK9S0IFW1lG4KAEV9Or919refA9DxdWVK94g/TKxDZP2XNvWkqclCsLKOKbeyO/Xev
         Nz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8AOnmA2Mb/yeEPF4DtUVs5oM65/BGpLN/Af78JnrIqk=;
        b=Br+jT9JlI4Q2NRTHczUxT3mp5K6O82V2CCXK/+08uC3IYY3kXi+nQc/mWm8U2aZwkv
         mJ/BoI8f1lsDuBVjVk5RxUU0We2EZO8bqSZpFdbCQGuVMhgKTFjqgLeb3XnpfkKAsTIb
         hU32TlqGjjYqbYTiq5d0qGi8DzKYbp2LDqxCb5XAc0QhMSJj744eACYS3n619oAk4Cyp
         NcnBBjrOZehqrfLLaYQihGEKDs2cAMAQSXdQFAjgODfO4rp34+blEjHtK6MjAlQl7ZJJ
         nzUIuV+19Nco1Wcaua+1DoY6RXI4JrhjUJY/336jX2rutGKgJiQ2oHgvBAuW7iRcX+6E
         TS0A==
X-Gm-Message-State: AOAM531shaCLlqDFervW9QX5FJ+EB1KQfzviiM2Ra/O9Hhr75PsGa2yL
        b+LaUmAxSyjC/Ne1zXB3lLAeTVkBpQrocy7OlC1ezGg/brC7xA==
X-Google-Smtp-Source: ABdhPJy3DcFHI4MpfIfV+qtIA8ESnqa8bPPxoQ8j0nzwxfzI5m5hz5O9w7zPsLZuhkwMAthvSNrl/3pnwoi3k27P0bQ=
X-Received: by 2002:a81:9c47:0:b0:2db:9e18:6e75 with SMTP id
 n7-20020a819c47000000b002db9e186e75mr1849613ywa.437.1646869190108; Wed, 09
 Mar 2022 15:39:50 -0800 (PST)
MIME-Version: 1.0
References: <ab8dc7f1-683c-618c-5b03-2615d06808ae@xs4all.nl>
In-Reply-To: <ab8dc7f1-683c-618c-5b03-2615d06808ae@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 10 Mar 2022 00:39:39 +0100
Message-ID: <CACRpkdb=omXqxQ1mezdHevkq96skOq6BqVDQLJUoOYzwP_dDWw@mail.gmail.com>
Subject: Re: [PATCH] m5mols/m5mols.h: document new reset field
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 8, 2022 at 9:42 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:

> The new reset field in struct m5mols_info was not documented,
> add this.
>
> This fixes a kerneldoc warning:
>
> drivers/media/i2c/m5mols/m5mols.h:244: warning: Function parameter or member 'reset' not described in 'm5mols_info'
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: aaaf357fa61c (media: m5mols: Convert to use GPIO descriptors)

Sorry for missing this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
