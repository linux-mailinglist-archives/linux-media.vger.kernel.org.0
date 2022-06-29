Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 625B755F322
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 04:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbiF2CIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 22:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiF2CIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 22:08:01 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D9D313B9
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 19:08:00 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-318889e6a2cso134991087b3.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 19:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iaxx2mVOl0/WekbiOxEK1DBs+N3hD6yTv9XuQKXGu1M=;
        b=snmlm8zTm4idfSay5cdiMQTZoJl6vnex6SHkWC4iwzwCA3Z5mELXLjfNIyeFxuSw0X
         5eEun1jx1IomWHm3aAQQDgAJ9mUi3AWvW9jWc7nRNiLK3ISyv5lyULIrfjN6f/VzDIOm
         gVySoKarRjlv6h+ql2o/Nwp92/U9L8axjpaonILKzbmXPgqjYUvXxtJz6CO6RDWqckHp
         QCJDxj4MSgSLh9k5rv8KwhsBTCkGZ8QRMXtj71JtYHN4bkoVoYpTJzO2V8N/sAaK4FvF
         v77XZYD9pAGmhQgwWmmDTFVmm3X07r3ed6/xj6/dVT9ThgkxogqQAEJeb++fgZm7nBXK
         15dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iaxx2mVOl0/WekbiOxEK1DBs+N3hD6yTv9XuQKXGu1M=;
        b=IFcNNHslOG917Og4atBKsFxd2onM/EAs4WAKnysv59Yj2o6PMFVTHz85kTfiXE/JUZ
         dsOBaRENsrcX7sYJ6RRwqnhXo+1cFO9AFzPV15x7nHyDFo6naO9RBD3TSfa8s9xsJevz
         7H0H1JLoUrPzyFllMzymhvi+WQGpMqvbpbTUsxMm+FvcyjGX516dbqUTPbi40RjGVmVu
         BT28qwslRzObP561mJ4EZ+pDD/DssxfhL8aJTTgda8kEf3iPcT2mTV+KIU5ZWmA9SKTY
         bihlpE+ELKDd1s0HS6k777tyhSDyt/BzlmGUH/FLivlROQOOkgQDADmtIEiX7ZQcUluN
         IhDg==
X-Gm-Message-State: AJIora9t69EpOsRHsay0WwD2GLVikfrzQJJX6L7tg3tYJvuBI6AQ6l/5
        KXXfPvVwZGnJ52cL0tSWSyzaflhrsD3ttuoPb/VAfA==
X-Google-Smtp-Source: AGRyM1tNcLlSOiZoBvMQFzz074e5kjsCYYpdJDDlSw52FbeuP7LYgL6gft9ICcY/NEFk9O6CYQKqUACTuHVA1zwl72U=
X-Received: by 2002:a81:3645:0:b0:31c:1d57:791f with SMTP id
 d66-20020a813645000000b0031c1d57791fmr757481ywa.37.1656468479386; Tue, 28 Jun
 2022 19:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220628005353.1719403-1-yunkec@google.com> <20220628005353.1719403-3-yunkec@google.com>
 <75485861-f17c-001c-b656-881d3be22144@linuxfoundation.org>
In-Reply-To: <75485861-f17c-001c-b656-881d3be22144@linuxfoundation.org>
From:   Yunke Cao <yunkec@google.com>
Date:   Wed, 29 Jun 2022 11:07:48 +0900
Message-ID: <CANqU6Fe2=aS9JfnXGYAZ2W9KyArDy-50KoaKdNNvJz3zjqbDTg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: vimc: documentation for lens
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just resent the patches. Sorry about the inconvenience.

Thanks,
Yunke

On Wed, Jun 29, 2022 at 4:57 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 6/27/22 6:53 PM, Yunke Cao wrote:
> > Add documentation for vimc-lens.
> > Add a lens into the vimc topology graph.
> >
> > Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >   Documentation/admin-guide/media/vimc.dot |  4 ++++
> >   Documentation/admin-guide/media/vimc.rst | 19 +++++++++++++++++++
> >   2 files changed, 23 insertions(+)
> >
>
> This patch failed to apply. Please rebase to the latest Linux 5.19-rc4
> and resend.
>
> thanks,
> -- Shuah
>
