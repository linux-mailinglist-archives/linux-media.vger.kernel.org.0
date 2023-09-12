Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5DA79C8B2
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 09:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbjILHw1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Sep 2023 03:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbjILHwI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Sep 2023 03:52:08 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C654D171E
        for <linux-media@vger.kernel.org>; Tue, 12 Sep 2023 00:52:04 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6491907dbc3so34851086d6.2
        for <linux-media@vger.kernel.org>; Tue, 12 Sep 2023 00:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694505123; x=1695109923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wfU0nPdaQSnyD0LQvaXmeyB83Sm2OJsXjly/b3WroA=;
        b=TgIAUi6N7Z9CFefXOTuWM1k+dEN/sh+up1wchuuDoWPP+tvSEh67bEowB6n5vHrmZ9
         Ge8WsYVt8vRj8sltsPXbMd23vxa+d9RCUaMAF4oZV/XTfva88I6GCIeJgI7g8iWyt7/V
         Rh/pqvFlGR1sWLg8A2qcT4T2osBPbVl/+s7QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694505123; x=1695109923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wfU0nPdaQSnyD0LQvaXmeyB83Sm2OJsXjly/b3WroA=;
        b=bY92/gJYOCaFEE0SRh3l/G4bVRRMQd+uHOp899oyTbF9iKyS/titdfH81w1ZBVMDoD
         f5eLsM8WCWjuBbXXRehXvStPRLL57CePDvCY9g96ERdec9ffE67JJuW5axwqgKF3mAle
         PSDXbovAi9R2UCi/QRZBOOkxkFfDSXOtiWIOyH5CYdVpoIhmhcWiAK107Ra3O/O44IMb
         C+s9H8BjObcLLWPdLxBAy6PSC34W33CfUrOIos0+nlxPdFoli4ARUuc/VmaXFZ90pVKj
         5uNT4yIL3wpJYrAkbe+0F3c7enbVp9Wv8GERkc1F7vDxlqbV8KvLtkHYWUUFQx0n8VOT
         yHFw==
X-Gm-Message-State: AOJu0Yw2ruxR3+M8L/r8NXaoN74l4IE3+/Hh+CLHRfe4rf5NdxHyLA/Y
        sO+krjXqzSyqw7Mt6bHoist8nEtVThH6e8d50McA+Q==
X-Google-Smtp-Source: AGHT+IEZIPrm0oCKObLzSOnD5ZZD12k0kbjWUMZkY21YTdzRwc+p5UaR9LS4Q51cy87YacHvSIslGA==
X-Received: by 2002:a05:622a:1917:b0:40f:ffd3:6201 with SMTP id w23-20020a05622a191700b0040fffd36201mr16518578qtc.66.1694505123542;
        Tue, 12 Sep 2023 00:52:03 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id f2-20020ac87f02000000b00411f7da6e1bsm3090454qtk.60.2023.09.12.00.52.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 00:52:03 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-76dcf1d8957so321896485a.1
        for <linux-media@vger.kernel.org>; Tue, 12 Sep 2023 00:52:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a1c:b0:76f:93e:4b45 with SMTP id
 i28-20020a05620a0a1c00b0076f093e4b45mr11888873qka.69.1694505122529; Tue, 12
 Sep 2023 00:52:02 -0700 (PDT)
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
 <CAAFQd5Ar18TvFE3jXBuphpCiwWAb8O99wqkiwEVDSs3+MXvW0w@mail.gmail.com> <DB9PR04MB9284404C1E1F1300EEF5A70487F1A@DB9PR04MB9284.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB9284404C1E1F1300EEF5A70487F1A@DB9PR04MB9284.eurprd04.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 12 Sep 2023 16:51:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Aq=ZrNGQU6psXJXt1ak2SkoRrZ=QBzp+xxHmWre0zBVg@mail.gmail.com>
Message-ID: <CAAFQd5Aq=ZrNGQU6psXJXt1ak2SkoRrZ=QBzp+xxHmWre0zBVg@mail.gmail.com>
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

On Tue, Sep 12, 2023 at 4:43=E2=80=AFPM Hui Fang <hui.fang@nxp.com> wrote:
>
> On Tue, Sep 12, 2023 at 4:11=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> =
wrote:
> > Is your DMA device restricted only to the bottom-most 4 GB (32-bit DMA
> > address)? If yes, would it make sense to also allocate from that area r=
ather
> > than bouncing the memory?
>
> The DMA device use 32-bit DMA address.
> From user space, can't control the v4l2 buffer address, may still change =
the
> code of vb2_dma_sg_alloc().

Right. You may want to try modifying vb2_dma_sg_alloc_compacted() to
use dma_alloc_pages() instead of alloc_pages().

Best regards,
Tomasz
