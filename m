Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E85F679E403
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 11:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239399AbjIMJoj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 05:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239391AbjIMJoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 05:44:38 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAA3198C
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 02:44:34 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4142ca41b89so45013311cf.0
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694598273; x=1695203073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9pWS5RKacUJB+Dks28jDzi/RTSOwkJtyGFeCb9s9pw=;
        b=fFLDJHG/ehIv5uE6W/xrd+cyq4pSuwHnR+Xt81evRx0L6ZqVnSviiCzI1TfVCT+don
         DCf28hoqRRUvK5iX6e2e41ppB1nZ0CnzmpYR9PUzSFmZXDxzn1fBmowhGRIFujNFfxjX
         xrlF7Q+jkFOoXbP0nt9sG81QOT24MUyUi3bCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694598273; x=1695203073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9pWS5RKacUJB+Dks28jDzi/RTSOwkJtyGFeCb9s9pw=;
        b=FbNSNHocCE5K4Car4ZBXgHcl5OK0wmKf8tA5U72Q14+CUrMMsZE+j8vcrlvYQgqYxr
         lbx3GciJlKP22OR+1NTO0UQ0FDe8tmxfKd1PtXdx6RRSlazLmInumr3/RwpbJm51AkJt
         S970yDnkKsO76KQiom9JxpM2iPqFXf/ewI0614Kjnq4tWJGeCe865Qrx9sHzOAHgbXJY
         CLNJKUsKnKIWgrkjmtV7sPgMwDSyxLIRfjzlMZ7GyJ0nkrIz5FmMxIs79veAcc7sGk01
         nA4SCL2LI65nNIlbsFL99gXRyBFpNdGoW1N8/DL+9mZh6IQNtrYCNI4alxgrp2i7AQvA
         AQfA==
X-Gm-Message-State: AOJu0YyC0W1ujhHy1NMxWifFz/ARJGmE4A4qdt+iuA9vfqUsuNucJr9m
        7Twa+LgkT7R0UcyiadueMLNl2dhP7FFr2mbnfng=
X-Google-Smtp-Source: AGHT+IHHGbdscZ6mykTaGREyo+GliqTkAKpHHM8usZql38pR3Q5+q49iAX/L4iEqEN1T30H9R7m/dg==
X-Received: by 2002:ac8:5788:0:b0:3fd:e37c:edea with SMTP id v8-20020ac85788000000b003fde37cedeamr2346596qta.45.1694598273086;
        Wed, 13 Sep 2023 02:44:33 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id g9-20020ac84dc9000000b00410aa0054dfsm3854722qtw.23.2023.09.13.02.44.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 02:44:32 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-655dccc9977so25330936d6.0
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 02:44:32 -0700 (PDT)
X-Received: by 2002:a05:6214:8ce:b0:64f:518d:ac91 with SMTP id
 da14-20020a05621408ce00b0064f518dac91mr2055205qvb.8.1694598271822; Wed, 13
 Sep 2023 02:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230828075420.2009568-1-anle.pan@nxp.com> <DB9PR04MB9284AA58AA71655C9C0C7C9A87E6A@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5DYxwX+JdXQ_-ba5B9y+gyWPjvUpCBnKM1zz1W2EkO_vA@mail.gmail.com>
 <DB9PR04MB928460023FB3CCCBC3EACE1487E9A@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5BGJX7=Z1ukFRq_ktaQ0d7FbvV-ob5gs8hfGaNHUXPTww@mail.gmail.com>
 <DB9PR04MB9284A0CDB1FC7CAADE0A394F87EFA@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5AugUGh7Z=9Qh7SS4=-0ddGBmRAOOyCGDfPdT-=eurtUg@mail.gmail.com>
 <DB9PR04MB9284A45033B3E24F44C5AA3987F2A@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5Bk0DUq5jgFDHV2wGYEcfQzNVQ2KYJ2ZYLubwFLgqW4kQ@mail.gmail.com>
 <DB9PR04MB92846D75C93A9B2B8C8A998D87F1A@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5Ar18TvFE3jXBuphpCiwWAb8O99wqkiwEVDSs3+MXvW0w@mail.gmail.com>
 <DB9PR04MB9284404C1E1F1300EEF5A70487F1A@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5Aq=ZrNGQU6psXJXt1ak2SkoRrZ=QBzp+xxHmWre0zBVg@mail.gmail.com> <DB9PR04MB9284A1DAB3C642C57298893A87F0A@DB9PR04MB9284.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB9284A1DAB3C642C57298893A87F0A@DB9PR04MB9284.eurprd04.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 13 Sep 2023 18:44:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BQ+FsuKipxE-yh3P-NbPdc_U=FHp7PBkWY-xunxthKuA@mail.gmail.com>
Message-ID: <CAAFQd5BQ+FsuKipxE-yh3P-NbPdc_U=FHp7PBkWY-xunxthKuA@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH] media: videobuf2-dma-sg: limit the sg segment size
To:     Hui Fang <hui.fang@nxp.com>
Cc:     Anle Pan <anle.pan@nxp.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jindong Yue <jindong.yue@nxp.com>,
        Xuegang Liu <xuegang.liu@nxp.com>, Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 13, 2023 at 6:14=E2=80=AFPM Hui Fang <hui.fang@nxp.com> wrote:
>
> On Tue, Sep 12, 2023 at 16:52=E2=80=AFPM Tomasz Figa <tfiga@chromium.org>=
 wrote:
> > Right. You may want to try modifying vb2_dma_sg_alloc_compacted() to us=
e
> > dma_alloc_pages() instead of alloc_pages().
>
> Thanks for your suggestion, it works. And it's a better resolution since =
no need
> an extra copy from high buffer to low buffer.

Great to hear! Could you submit a patch? Would appreciate adding

Suggested-by: Tomasz Figa <tfiga@chromium.org>

above the Signed-off-by line if you don't mind. Thanks.

Best regards,
Tomasz
