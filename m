Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1359F5B19F5
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 12:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbiIHK3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 06:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiIHK3F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 06:29:05 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF8BA3D04
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 03:28:59 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id w8so26907198lft.12
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=o8Z4CAve5fqqekItJ5TFGp6h+pybclKENCYKBTuFmhk=;
        b=IwcoQSz3UBrwnTW+HJsc6p8YeZ3gsbEhZ9gow3OEDbwrZWKiJ4I0GZtV40U0N60tH4
         g6iWHb8C/2uMf1AUqLqniwMkuSC0UXtsyjPPUO/238y/DnuRIcMCTrvrKfwhjwFST81q
         WCI0Bzvb+68TiJRBY2P3TXTqKehNdv1cuRQVc31f7d3fT9OSHBmtRpeVNXKXm0itJAZu
         wzG2WwVEBIaPuN21x1nTMFmLsMU2yRjFNpKQrXZpj8F0G1aR0kF8N0JlrwbLQIchOG2S
         S0sKweHdVu2Py7n87UpmgLnbDYmywB/aBdtRTJ5Q/i0bugqSaUHWPVsvVuCK04qp4WPD
         t3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=o8Z4CAve5fqqekItJ5TFGp6h+pybclKENCYKBTuFmhk=;
        b=1XnydaNvqU6TsGWj2wscqn4U3OEepv5yVxiFBespiZgJhiLQHlGD8pVHt+SXDplW3+
         HbcnNh6ygE9IG9hVvlaJGd0oU6M25E9VCzH1iCMhzbTgIsGsdZr9hNT5A1uCKGOuNbH2
         Y02LqwI2HBio3mYY6qYEtKds1ZbRaX8ENvbRwlF3eD+uEiZtfwaI1gtPw2QBgHwZGvP0
         go4OO3qg4mXHTYbsVFoRGGbUElzCZ+/IMg0RlPHdAYdBQCi70PyLCK5JhtFUOt3UUebu
         LZS0AhTFQT+VgwNwxUgs0s0sb+z4+bbtboVsl9fdO3P5oFBuuLTiQCPdhYiKjCsniHzN
         +PBw==
X-Gm-Message-State: ACgBeo0WniKMY2iz0KWnGt2dofdXRCBYPEUYXaj8Ntt6kczZj9xq7njm
        Dhx9aZwOAZit/WS6dTg/c1FQOAhEU8PAi8KR4dTFkg==
X-Google-Smtp-Source: AA6agR5m51Ese4pRsiZ202uyHyguCnTFQK0dB89rjGUTjXVlu7AN+6Kz3Be2wVD4Zf8ywGIliea3qbme0TqsVaR8RrU=
X-Received: by 2002:a05:6512:3da5:b0:497:6082:98fd with SMTP id
 k37-20020a0565123da500b00497608298fdmr2328152lfv.109.1662632938143; Thu, 08
 Sep 2022 03:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220812143055.12938-1-olivier.masse@nxp.com> <CAFA6WYM89+SrW2Br-fnFke4djt4GgGHXn7JS3=rxvAa7dAAY7w@mail.gmail.com>
 <fb641c168a6b9fc041785a0baa8ee4b2d3ff8ed4.camel@nxp.com>
In-Reply-To: <fb641c168a6b9fc041785a0baa8ee4b2d3ff8ed4.camel@nxp.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 8 Sep 2022 15:58:47 +0530
Message-ID: <CAFA6WYM+G=MPonqPpfVXCgCAxuezUjFnm7gZ1x6ybHGrAtQp3g@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
To:     Olivier Masse <olivier.masse@nxp.com>
Cc:     "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Cl=C3=A9ment_Faure?= <clement.faure@nxp.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
        "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
        "etienne.carriere@linaro.org" <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 8 Sept 2022 at 14:48, Olivier Masse <olivier.masse@nxp.com> wrote:
>
> Hi Sumit
>
> On ven., 2022-08-19 at 13:54 +0530, Sumit Garg wrote:
> > Caution: EXT Email
> >
> > Hi Olivier,
> >
> > On Fri, 12 Aug 2022 at 20:01, Olivier Masse <olivier.masse@nxp.com>
> > wrote:
> > >
> > > Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
> > > shared memory from a dmabuf file descriptor.
> > > This new ioctl will allow the Linux Kernel to register a buffer
> > > to be used by the Secure Data Path OPTEE OS feature.
> > >
> > > Please find more information here:
> > >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fstati=
c.linaro.org%2Fconnect%2Fsan19%2Fpresentations%2Fsan19-107.pdf&amp;data=3D0=
5%7C01%7Colivier.masse%40nxp.com%7C05071ff1c28044ab740908da81bc44e2%7C686ea=
1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637964942860947359%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000%7C%7C%7C&amp;sdata=3DnYLb2iMoJExdKEg4CL4eW5%2FQ%2Bqqj4Iw1TxFsd1UqWW0%3=
D&amp;reserved=3D0
> > >
> > > Patch tested on Hikey 6220.
> > >
> >
> > AFAIU, for the OP-TEE SDP feature to work you need to have a DMA-BUF
> > heap driver for allocating secure buffers through exposed chardev:
> > "/dev/dma_heap/sdp". Have you tested it with some out-of-tree driver
> > as I can't find it upstream? Also, do you plan to push that upstream
> > as well?
>
> It has been tested with linaro,secure-heap reserved dma heap memory
> which is also in review for upstream.

Can you provide the corresponding reference? Also, do keep OP-TEE ML
in CC if you send any new iteration for that patch.

-Sumit

>
> >
> > BTW, please add a changelog while sending newer patch-set versions.
> >
> > -Sumit
> >
> > > Etienne Carriere (1):
> > >   tee: new ioctl to a register tee_shm from a dmabuf file
> > > descriptor
> > >
> > >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> > >  drivers/tee/tee_shm.c    | 99
> > > +++++++++++++++++++++++++++++++++++++++-
> > >  include/linux/tee_drv.h  | 11 +++++
> > >  include/uapi/linux/tee.h | 29 ++++++++++++
> > >  4 files changed, 175 insertions(+), 2 deletions(-)
> > >
> > > --
> > > 2.25.0
> > >
