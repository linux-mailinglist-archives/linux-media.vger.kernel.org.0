Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F379A78309C
	for <lists+linux-media@lfdr.de>; Mon, 21 Aug 2023 21:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjHUS6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 14:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjHUS6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 14:58:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A394C1E
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 11:57:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A428E642B6
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 18:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3A7C433D9
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 18:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692644230;
        bh=TV6VbUlHxg4zo4yUgUTEapoI0MTOb1Ihdyh2Te0cGZY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RYiiPHJ2pf4eKrq/0+/RfNgBj8wDOXV6/VjTdNNiYzJIYJUgcFw5WI3D/T0YU1Jui
         cYue+e3o7TmIKIcsWSiJp+1cuFguxy2C9mptvikauZxZm82U8ocfkEBb9/l7Z45K7d
         bEjaluC3HM3bFTIoUSG9MykpdRSlMiWYeAiLXJpD9MPU+6DkPG9mbu+CzxKm4YjOP/
         2FN2/6F2d7g92eWOceqpqgup1nZj//LmRpFIx2EkNVt22Y6AlzfKO21JC2k/VtyMOb
         LiLtsVBqjOfywykb1IvFBJCWJrEOdZlBqjj1ye7ZvaMiFzGJzMADFOy72P853iRpO1
         1pwuiqlmN+tUQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bb734a9081so54159591fa.1
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 11:57:09 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxd6wtAGeWsC4EjCOaSL+4sql3cmMC7P9qIPnNachkCnWJedWlf
        tMpGa9pKv9JXaWartAQZZgM/B1tEKCC5U4Ybxg==
X-Google-Smtp-Source: AGHT+IE5NDQyW6p1fOWHykcH2viQb94bBs7CGEMqf3G36RCCJjVbkUD84mCfsUJAm0FtHjIu/7/J6J1L0hWTB7giniM=
X-Received: by 2002:a2e:a23b:0:b0:2ba:1286:d99e with SMTP id
 i27-20020a2ea23b000000b002ba1286d99emr2855433ljm.1.1692644228034; Mon, 21 Aug
 2023 11:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230821152623.196541-1-sean@mess.org> <20230821152623.196541-2-sean@mess.org>
In-Reply-To: <20230821152623.196541-2-sean@mess.org>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 21 Aug 2023 13:56:56 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+BLdhKZnTZwRN5b3XdkgSHDj53Z1YJfcYxWxTDqzkRRQ@mail.gmail.com>
Message-ID: <CAL_Jsq+BLdhKZnTZwRN5b3XdkgSHDj53Z1YJfcYxWxTDqzkRRQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: nokia,n900-ir use generic
 pwm-ir-tx driver
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, Sicelo <absicsz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Timo Kokkonen <timo.t.kokkonen@iki.fi>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please use get_maintainers.pl and send patches to the right place.
Like the other DT maintainers and DT list...

On Mon, Aug 21, 2023 at 10:26=E2=80=AFAM Sean Young <sean@mess.org> wrote:
>
> The generic pwm-ir-tx driver works for the Nokia n900, so nokia,n900-ir
> can be removed.

How long has this been true? You are breaking users if they are on a
version of OS where the pwm-ir-tx driver doesn't work (or didn't exist
or wasn't enabled). I suspect this is a platform that will care about
the ABI.

What you should do is make the "nokia,n900-ir" compatible work with
the generic driver. Then old driver works still, the generic driver
works on new OS versions, and the DTB doesn't change.

Rob
