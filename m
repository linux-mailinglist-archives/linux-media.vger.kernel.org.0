Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27D1D77CE54
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 16:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237738AbjHOOmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 10:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237733AbjHOOmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 10:42:14 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746CA93;
        Tue, 15 Aug 2023 07:42:13 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-4496b17cccfso1003957137.2;
        Tue, 15 Aug 2023 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692110532; x=1692715332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UZFaVlc1sczHQWHZJ9AjHZsRHt5PWt4JpBGZLlXeg0=;
        b=pPleL2QungwV3N3GV8TI1ahpjqCncp51gnYfpvhhOplW891qdlMshtDs+IgT0IzjBl
         aH8K8BwF5pYG7OngZkQaS0AvH3oE577jAmSSX4MW+Axt0EXU9ozPJySimW1pqaeSi8+M
         11yfvvWj2VSawUbT0Y9PkmaBSuw8n/qBLaxKPTjIBKoLI9fjcfonXPLke4HnTrfXq2Bq
         P4hgAYQOWwMryU68Se7CJVbkDXuFrZT5zXEmYIv5WIj62AZ7XLUbTEychVoKNEHMInpM
         b0hq+dHf4oaWA35i6X3k4p1wE4swSej2PiRoHfDquatLYJPOHmt0P3o+G++ZtaUzPtYN
         JlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692110532; x=1692715332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UZFaVlc1sczHQWHZJ9AjHZsRHt5PWt4JpBGZLlXeg0=;
        b=ai2f5Ps/1Orem0g95uBKuYVO205Va8uCYK8zk60mV2ZF2DCX7CxgynmE8dN6f5EBJ/
         +Ovg7UnmlG4zojYA/xLb0ui3o40wmUKzsjsls6UZaVG1mjSJaoo+Q76vSl/YplaB62VR
         UN+vpbfHmTdIBHL2IoZBL0eYxpZKCHMesmmtMMCZmTs1SdezWCtGJR86U+HUdqSjQuxQ
         uWu4LdSQvTLhMKVaPI6h5l2TYIotr3HYfnT0MA5yMDwKcp77+JIwE5A4rdQ7Cs0MhIGG
         rOTyKmFvSMdWQ35f1bG3Qa5koLDv1m5bwcwnYXsBJJhxaWvELCbX/dEGgaPC1hiEHTS8
         OPPg==
X-Gm-Message-State: AOJu0Yw6oGxMaSt9SagtNmEjR0eLBzi4qz7kM4marwq7hpQD/9/ychaj
        Z9ufAquPUnLsO5GLfqke16MXs2s7/AjDN+2fJqM=
X-Google-Smtp-Source: AGHT+IHkefxbWaWrxGL9lInv9tYLtV6RKC5Xhye/4zD/nSk4TJeMzlNk1n0Cbb5GRzuoSowhEPnqM6F//jPuzZ4WmLM=
X-Received: by 2002:a05:6102:3014:b0:440:c4fb:f257 with SMTP id
 s20-20020a056102301400b00440c4fbf257mr11215788vsa.0.1692110532489; Tue, 15
 Aug 2023 07:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com> <58a93e4e8b8b4ca79c2678a3ae8281cd@AcuMS.aculab.com>
In-Reply-To: <58a93e4e8b8b4ca79c2678a3ae8281cd@AcuMS.aculab.com>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Tue, 15 Aug 2023 10:41:35 -0400
Message-ID: <CAF=yD-KrkHo9QY2-cALosQHnZe=JWiRcmcvpfu3qov2J6kJPMQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] Device Memory TCP
To:     David Laight <David.Laight@aculab.com>
Cc:     Mina Almasry <almasrymina@google.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Ahern <dsahern@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        "stephen@networkplumber.org" <stephen@networkplumber.org>,
        "sdf@google.com" <sdf@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 15, 2023 at 9:38=E2=80=AFAM David Laight <David.Laight@aculab.c=
om> wrote:
>
> From: Mina Almasry
> > Sent: 10 August 2023 02:58
> ...
> > * TL;DR:
> >
> > Device memory TCP (devmem TCP) is a proposal for transferring data to a=
nd/or
> > from device memory efficiently, without bouncing the data to a host mem=
ory
> > buffer.
>
> Doesn't that really require peer-to-peer PCIe transfers?
> IIRC these aren't supported by many root hubs and have
> fundamental flow control and/or TLP credit problems.
>
> I'd guess they are also pretty incompatible with IOMMU?

Yes, this is a form of PCI_P2PDMA and all the limitations of that apply.

> I can see how you might manage to transmit frames from
> some external memory (eg after encryption) but surely
> processing receive data that way needs the packets
> be filtered by both IP addresses and port numbers before
> being redirected to the (presumably limited) external
> memory.

This feature depends on NIC receive header split. The TCP/IP headers
are stored to host memory, the payload to device memory.

Optionally, on devices that do not support explicit header-split, but
do support scatter-gather I/O, if the header size is constant and
known, that can be used as a weak substitute. This has additional
caveats wrt unexpected traffic for which payload must be host visible
(e.g., ICMP).

> OTOH isn't the kernel going to need to run code before
> the packet is actually sent and just after it is received?
> So all you might gain is a bit of latency?
> And a bit less utilisation of host memory??
> But if your system is really limited by cpu-memory bandwidth
> you need more cache :-)
>
>
> So how much benefit is there over efficient use of host
> memory bounce buffers??

Among other things, on a PCIe tree this makes it possible to load up
machines with many NICs + GPUs.
