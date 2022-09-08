Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481B45B19EC
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 12:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbiIHK01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 06:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbiIHK0X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 06:26:23 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F18BFAA6
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 03:26:15 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id v6so5930978ljj.0
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7zHmF7fV9+CSAN0NLZlR4YsL2QCd2uL4OzOpXBOMvMs=;
        b=Updcj/5C3zcysfgCd+XVSKzzlMDbyhzK9KV7VA96nw7o6Aiq7w/f6Rreuf4t+ru6Ia
         XO+EzWUB7W7bZkjzNvd5TPNumCOUW62pJeFae/RT0JfZ/BWDywBeuSuLlZkuIsKR1Pwm
         d4a4Lv4ZDEL5fi0jHtYo48baOvLY9PUg1De+IXOTIkkn5XGYeNN8b6M/2ztvVLYhYZc1
         AECew7rZxgj4NzTaXGLk4iVuGwxcSXlWVPABmSd8xaPB7p2RO85yNvQsIIvlgvKgxdlf
         qWZM75W5ERmzTblB28p3YXmF242iZ0Ud02IP837dPVV8UHmxhGYuR58YPXhqkIftwMpP
         5LlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7zHmF7fV9+CSAN0NLZlR4YsL2QCd2uL4OzOpXBOMvMs=;
        b=2fQZl6ZFX9xgmuk3EFzvb0ohkaWQoZkdXi/nWXv/rfHyGQZzYKj3hL4J/3sNfRCtwD
         nrMGHuGi3btBGXh1UWW87Wc/9CQYox5Z6ppWWRzD1ICNl5wtjPPF5CDt7dfPUoPtAfTs
         g5C3Sr1LOuGXXEdcxB4n+0kf4lVp/uagv+Ub7wFY0asm1n/N61+zIz6Wl9tle/E1HWiB
         RyVIDIeLcHpvBxR+mosunJ6LJKNDaTCTGUi9rUldMURZ5O67qOXBs2r9/wNVw8ca2VnE
         UJEm2DDQ1UHceuOVsVz341ehkFcFSQdzupW5Hs4ePgE+7C664IxQ+oAiy0oqAjB0LtXM
         6MUQ==
X-Gm-Message-State: ACgBeo3BU2UjV7TyEGNLOS1vS1VN8qefCjh8/k0pPedhemStCIXux2zQ
        hiAiF4QrfgFbh9NIXfY2JtdiUaK44tsHWcnJl+aoZQ==
X-Google-Smtp-Source: AA6agR5d+wwCPsH/ETCPRquWaPRFMuEHcU81Q+wmC6wIdZFu96tqD4jYmOC7FgcjqLpochaAtlr2pT1hUtYbk0+6Eas=
X-Received: by 2002:a2e:9799:0:b0:26b:dd3c:7080 with SMTP id
 y25-20020a2e9799000000b0026bdd3c7080mr255822lji.297.1662632773944; Thu, 08
 Sep 2022 03:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220812143055.12938-1-olivier.masse@nxp.com> <CAFA6WYM89+SrW2Br-fnFke4djt4GgGHXn7JS3=rxvAa7dAAY7w@mail.gmail.com>
 <YxemmVxh5F0fXEPJ@phenom.ffwll.local>
In-Reply-To: <YxemmVxh5F0fXEPJ@phenom.ffwll.local>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 8 Sep 2022 15:56:02 +0530
Message-ID: <CAFA6WYMstaxeGVcuEKF68Bo9ZFSvQCaJfiC59Bv2q6LDCD3JDQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
To:     daniel@ffwll.ch
Cc:     Olivier Masse <olivier.masse@nxp.com>, clement.faure@nxp.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jens.wiklander@linaro.org, linaro-mm-sig@lists.linaro.org,
        op-tee@lists.trustedfirmware.org, etienne.carriere@linaro.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-media@vger.kernel.org
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

Hi Daniel,

On Wed, 7 Sept 2022 at 01:29, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Aug 19, 2022 at 01:54:31PM +0530, Sumit Garg wrote:
> > Hi Olivier,
> >
> > On Fri, 12 Aug 2022 at 20:01, Olivier Masse <olivier.masse@nxp.com> wrote:
> > >
> > > Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
> > > shared memory from a dmabuf file descriptor.
> > > This new ioctl will allow the Linux Kernel to register a buffer
> > > to be used by the Secure Data Path OPTEE OS feature.
> > >
> > > Please find more information here:
> > > https://static.linaro.org/connect/san19/presentations/san19-107.pdf
> > >
> > > Patch tested on Hikey 6220.
> > >
> >
> > AFAIU, for the OP-TEE SDP feature to work you need to have a DMA-BUF
> > heap driver for allocating secure buffers through exposed chardev:
> > "/dev/dma_heap/sdp". Have you tested it with some out-of-tree driver
> > as I can't find it upstream? Also, do you plan to push that upstream
> > as well?
> >
> > BTW, please add a changelog while sending newer patch-set versions.
>
> Also after the huge discussion last year dma-buf are agreed to be under
> the "you need an open source userspace for any new uapi using them" rule
> that all gpu drivers are under.
>
> Does this exist here?

There is already an open source userspace test application using it
here [1] [2] demonstrating its use-case. I think that should be
sufficient.

[1] https://github.com/OP-TEE/optee_test/blob/master/host/xtest/sdp_basic.c
[2] https://github.com/OP-TEE/optee_test/blob/master/host/xtest/sdp_basic.h

-Sumit

> -Daniel
>
> >
> > -Sumit
> >
> > > Etienne Carriere (1):
> > >   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> > >
> > >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> > >  drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
> > >  include/linux/tee_drv.h  | 11 +++++
> > >  include/uapi/linux/tee.h | 29 ++++++++++++
> > >  4 files changed, 175 insertions(+), 2 deletions(-)
> > >
> > > --
> > > 2.25.0
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
