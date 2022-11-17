Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0DDC62E013
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 16:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbiKQPil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 10:38:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234954AbiKQPiT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 10:38:19 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44A65803A
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 07:38:18 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id u7so1395589qvn.13
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 07:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vyMHbYz7pcCdNisY9D7J4VP8a/I9/qddgBipkibQG+M=;
        b=nmbivz/kcxfBCLU/jAAuW462IWRidAqpClZ0uFErVGlRdeIegMjlU+eqvz2tbWHaEZ
         KaPYd4IZp7oHa0C8D6MDHS2KpQLwfrOWt8Pwf/VMl1wf47no3bFde2wi8BBsTAIaub2z
         rPp1tLD9bcjZErhI+nK6eVwPamcyRRT+JJjsLsPfecDz5AwAs1Sx0WPilMs0xue8sNgg
         hx/KzzWKbvqCtZ3vPY8dd289I/w5EA1RZRQBqca94LrqHUW42Sohy1FLpwEwvh2z6PWK
         2cYHwU128Itq9GXd9neoAFK30WSnxFBd97cVRMJ3qhdHOxiPmXv23PjpGPDjhtbfLjVf
         OmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vyMHbYz7pcCdNisY9D7J4VP8a/I9/qddgBipkibQG+M=;
        b=rMid94vakhaT9FSEp7gml4Ou/7hLeKTQOTqO1o4uLUs7he+oolWx+R+DikCwCi0XjX
         lCeuiNUj46J0RabZ+B5Z5Z/bDV67iBkgExPE0HWzduPeeRTJAUdv/AvHhxXUZ8KkqlOS
         E6LMCYOKn9Isc49rNx5fZH63fXXy15te9K2F0+O388RYq+SWlOjDyspfmCnDojdguwUO
         VLkNphZeYUkYq5tiHSNYud4tDzRj5Z+4eLCjSCSeGjoNdhFIRCcZ7D61bYMbHHBja/pD
         XNHwyKv73B+jpB2lj5Xo8vfwy4vSW46ILI7FQk6qQ7zdkShHlOAS744yz1wEZjwpC/K9
         zTFQ==
X-Gm-Message-State: ANoB5pmM+i9I/N+yNrdAubYJD17nyPUx8m83/RlUz8CTbGhEGc8uZDiD
        hPtqo+lU16ARqVLJbzJBOMOCBQ==
X-Google-Smtp-Source: AA0mqf5Venn3LzgykvP/AW3ygZYkmxzaUHLCWmhJmw7owC7KwpImB6WDjiRHdsPxXKixU/hzrIG4Hw==
X-Received: by 2002:ad4:4e42:0:b0:4b8:361:4ca with SMTP id eb2-20020ad44e42000000b004b8036104camr2852335qvb.102.1668699497853;
        Thu, 17 Nov 2022 07:38:17 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id w9-20020a05620a424900b006ce2c3c48ebsm645891qko.77.2022.11.17.07.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 07:38:17 -0800 (PST)
Message-ID: <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
Subject: Re: Try to address the DMA-buf coherency problem
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Daniel Stone <daniel@fooishbar.org>, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Date:   Thu, 17 Nov 2022 10:38:16 -0500
In-Reply-To: <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
         <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
         <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
         <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
         <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
         <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
         <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
         <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
         <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
         <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
         <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
         <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
         <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
         <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
         <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
         <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
         <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 17 novembre 2022 =C3=A0 13:10 +0100, Christian K=C3=B6nig a =C3=A9=
crit=C2=A0:
> > > DMA-Buf let's the exporter setup the DMA addresses the importer uses =
to
> > > be able to directly decided where a certain operation should go. E.g.=
 we
> > > have cases where for example a P2P write doesn't even go to memory, b=
ut
> > > rather a doorbell BAR to trigger another operation. Throwing in CPU
> > > round trips for explicit ownership transfer completely breaks that
> > > concept.
> > It sounds like we should have a dma_dev_is_coherent_with_dev() which
> > accepts two (or an array?) of devices and tells the caller whether the
> > devices need explicit ownership transfer.
>=20
> No, exactly that's the concept I'm pushing back on very hard here.
>=20
> In other words explicit ownership transfer is not something we would=20
> want as requirement in the framework, cause otherwise we break tons of=
=20
> use cases which require concurrent access to the underlying buffer.

I'm not pushing for this solution, but really felt the need to correct you =
here.
I have quite some experience with ownership transfer mechanism, as this is =
how
GStreamer framework works since 2000. Concurrent access is a really common =
use
cases and it is quite well defined in that context. The bracketing system (=
in
this case called map() unmap(), with flag stating the usage intention like =
reads
and write) is combined the the refcount. The basic rules are simple:

- An object with a refcount higher then 2 is shared, hence read-only
- An object with refcount of one, mapped for writes becomes exclusive
- Non exclusive writes can be done, but that has to be explicit (intentiona=
l),
we didn't go as far as Rust in that domain
- Wrappers around these object can use mechanism like "copy-on-write" and c=
an
also maintain the state of shadow buffers (e.g. GL upload slow cases) even =
with
concurrent access.

Just hope it clarify, Rust language works, yet its all based on explicit
ownership transfers. Its not limiting, but it requires a different way of
thinking how data is to be accessed.

Nicolas

