Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0739077F9E2
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 16:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352443AbjHQO5D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 10:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352493AbjHQO4s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 10:56:48 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B82A2D7E
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 07:56:34 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99df11828c6so218175366b.1
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 07:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1692284192; x=1692888992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vz8AzeclrbAtQHTVxmwRIMfUys2iPiXzHBgxBLhu+CI=;
        b=dwziQM2+Yt9ERHVwknRtALisO2aqZA7rC/jWFI8wN3p6hwllcInP7Uz8/Y4CAIoB0B
         iEl+47doPnCTVeFhdMs0Di2PU3ybn6pJEwpHOt5DggUbdtZQDnuoNEXl6xl07ez36e8l
         0qopaeU9Q9lsfOy/xYc337FEEau0Cd2VbclQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692284192; x=1692888992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vz8AzeclrbAtQHTVxmwRIMfUys2iPiXzHBgxBLhu+CI=;
        b=alvPKt5CqROZIuP0OUwY0vkTwaaHVNvBL9oQraNHkB0VflDAkiSFdzFml5rVaFvBVp
         kBm9lMOYbuhhXboedLXFTXoddr3mAz2MGIeFcbMXxZ6aXky2xP8GtDQINJin1QZlaUtJ
         uZxV2oo1bnXtkyNHpH9eLd/M+x6Gxm4dVIGZ5AzwfLlKOGcbRgi6kzW7CQ2LXbqAPNdr
         2bsEnQ753IyJQ3uWfBBvcqafP0Ju/Yu4n1jg4JGuPYH/wQuTB0CZIcLcljBHjSGfLBJE
         7ry++TJ8iBCNFJ4fQ25SXEkdwUljEvZj50JRKbZ8oZl0YQ0POvEArqG9pTDbwj7RNZdM
         rQTg==
X-Gm-Message-State: AOJu0YyT9ewfrx3u1jroDaJ0YLCKfCh8e7ohfU3TRpa5sESz920s+Ama
        GBN9Uxvzgm/gMYItf7bD5H/EzOHxLD2EpAEaN+NWdn4f
X-Google-Smtp-Source: AGHT+IGIzFT23rEJFBEY2nxUNoK3BILkk3fkDJGJKUi067ohP0QNPpOs1apmOHXSre0bGPWDGYZyZw==
X-Received: by 2002:a17:907:c23:b0:988:d841:7f90 with SMTP id ga35-20020a1709070c2300b00988d8417f90mr3626096ejc.27.1692284192496;
        Thu, 17 Aug 2023 07:56:32 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id s6-20020a170906454600b0099cd1c0cb21sm10099701ejq.129.2023.08.17.07.56.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 07:56:31 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99df11828c6so218169566b.1
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 07:56:31 -0700 (PDT)
X-Received: by 2002:a17:907:3f8f:b0:99c:572:c0e4 with SMTP id
 hr15-20020a1709073f8f00b0099c0572c0e4mr3620309ejc.7.1692284191332; Thu, 17
 Aug 2023 07:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <d5e1ee76-75b3-26cb-23ae-cf6ab40597b7@xs4all.nl>
In-Reply-To: <d5e1ee76-75b3-26cb-23ae-cf6ab40597b7@xs4all.nl>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 17 Aug 2023 16:56:14 +0200
X-Gmail-Original-Message-ID: <CAHk-=wgR3JSopXha1pJh4dRDH-U+jHgqp1zy1nR8OovUQTJgWw@mail.gmail.com>
Message-ID: <CAHk-=wgR3JSopXha1pJh4dRDH-U+jHgqp1zy1nR8OovUQTJgWw@mail.gmail.com>
Subject: Re: [PATCH] media: vb2: frame_vector.c: replace WARN_ONCE with a comment
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Jan Kara <jack@suse.cz>, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 17 Aug 2023 at 12:41, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> There are no reports of WARN_ONCE being issued for actual VM_IO cases, so
> just drop it and instead add a note to the comment before the function.

Ack. That was meant to catch any (unlikely) strange users, but yeah,
it can obviously be triggered by "intentional" strange users, ie
syzbot and friends, so since there seems to be no sign of actual
real-world use, just removing the WARN_ONCE() is the right thing to
do.

I'm assuming I'll get this eventually through the regular media pulls?

                Linus
