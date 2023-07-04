Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2218747648
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 18:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbjGDQRK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 12:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjGDQRK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 12:17:10 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4511DA
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 09:17:08 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977e0fbd742so674337666b.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 09:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1688487427; x=1691079427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zoSLxvXdWi/Yl+BEgvp6RDAlMoTsWmGbOp6gCR7ij0=;
        b=IvxDZs5FZwr/WzKLQBOPETWNGRsTF6HYbMFn0CA4Rn6PX6e94Z0KzCbI46ct5SNPVC
         ZFSay5Q+Bcevmw2q5h3dvgLXq53rthbmWoJkH/qKb0W31EbZZj2D6AN4gcBL3yJlxgIB
         w3xcNxYg/ddD/es0NxpN1vd5LovJvOdD92AiYBbKibxM/fWGE1sLubha+vgKeM3eaKTW
         Guw89lFVcKe1sOZDjPmk3oUq5ImJ4KhwlKWH1SwRDyFOAxQh16vkF9nirBx6a/G0DMrL
         FCZ7kvsrIHo9To5kP6rjdqJZ0LO3deobSvbqjthhmG8YyAPT/EyDjoZPg9jcTwXXPmuR
         QHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688487427; x=1691079427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zoSLxvXdWi/Yl+BEgvp6RDAlMoTsWmGbOp6gCR7ij0=;
        b=FMxeJoDWEnc+iY6XLrJu1OrP3SEHU7m1BG2i4ghqtvCnLG9KQZJqffFbMsCrXJnIgC
         Dzp7d3iiRHqPCCRjI6TfBTXGCumw9CIsJLy6/tJPUUxJ/qeXWhbYee2FdHN3HdGexZmK
         5V9GsYBUzH+2c6glSOb5IGmN+2edPLszmfI/YkBB709a2sbxiKLoEoYR7HGKVOA3UaJR
         uvxc2gh7kYGei1svjkq6Gr7Ghe5ZPFbcxnnd26Q9bt1Hzcr9rZwCkwQytl1D5i3cE5ES
         Nytzzy7mt03LEKEReYRUSROjB4QYvW4va/HH2wTq8wySnOC0A5pdrvynkdUtOwQwmKlU
         C8Rg==
X-Gm-Message-State: ABy/qLZJcpXXj3Wf0Q0gsW60lxj4oLS7mpBQ/Hc2qgQTLxMpU7msdFwJ
        SS1d4XMDf0EzkrCwJh2ThH3vUSYRE8CgoY7m7lZ9Iw==
X-Google-Smtp-Source: ACHHUZ72Trq3ak3feJZfX2mvIRzadW3AAT3MBnGmwqh3StyYxyK0jn9H0wssJNSY2G6F09VwGyGhf4P+t7Iyad6P0Qs=
X-Received: by 2002:a17:906:86d1:b0:988:a0d6:c4fa with SMTP id
 j17-20020a17090686d100b00988a0d6c4famr10290333ejy.13.1688487427344; Tue, 04
 Jul 2023 09:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230630144006.1513270-1-pan@semihalf.com> <20230630144006.1513270-4-pan@semihalf.com>
 <20230630-scrimmage-antelope-7d1f82d491fc@spud> <CAF9_jYT1Fz4hBQrNtgkM6mU-JVH=ZxsJnkaLDsa5uoEV_hTLVA@mail.gmail.com>
 <df7440e2-58b0-9f12-8f37-4f0d9050f934@linaro.org>
In-Reply-To: <df7440e2-58b0-9f12-8f37-4f0d9050f934@linaro.org>
From:   =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date:   Tue, 4 Jul 2023 18:16:56 +0200
Message-ID: <CAF9_jYSwDdyE6mj8+1bA23MWmFHdm16jTSYaRQiF1kzpUtkMNQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] ARM: dts: Add Chameleon v3 video node
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dinguyen@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mchehab@kernel.org, upstream@semihalf.com, amstan@chromium.org,
        ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 3, 2023 at 2:33=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/07/2023 13:44, Pawe=C5=82 Anikiel wrote:
> >>> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleo=
nv3.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
> >>> index 422d00cd4c74..5e66363d4ab5 100644
> >>> --- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
> >>> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_chameleonv3.dts
> >>> @@ -10,6 +10,60 @@ / {
> >>>       compatible =3D "google,chameleon-v3", "enclustra,mercury-aa1",
> >>>                    "altr,socfpga-arria10", "altr,socfpga";
> >>>
> >>> +     soc {
> >>> +             video@c0060500 {
> >>> +                     compatible =3D "google,chv3-video";
> >>
> >> This compatible does not seem to be documented & I did not see a comme=
nt
> >> about the lack of a binding in the cover letter. What am I missing?
> >
> > Yes, the compatible is not documented for now (I'll do that in a later
> > patchset), sorry for not mentioning that in the cover letter.
>
> You cannot add undocumented compatible. This cannot be fixed in "a later
> patchset".

I meant later revision, I'm certainly not expecting this one to land
(I sent is as an RFC). Is it really necessary to document the
compatible to get any form of feedback on the overall structure of the
driver?
