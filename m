Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5690B792536
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 18:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbjIEQBt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 12:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344469AbjIEDoQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 23:44:16 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46958CC7
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 20:44:12 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-76da0ed3b7aso130118285a.1
        for <linux-media@vger.kernel.org>; Mon, 04 Sep 2023 20:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693885451; x=1694490251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAZHJuenxcHpAilGOcCYgpTDOCH9+ws/HIfnUtOnAtU=;
        b=J8l8wDdHabzfac0jkMIe3eU8GR0PfomtQ8NupJZ/95WVie4VchlCbCJB69ybk2O5GT
         Vzl8++6EBe9cK1uS6GEQ/G/gqUcFRGE5F6Zn8pkOmbP19of4frrrtLMExkanvx9Nt/1T
         82F0fCQlY101qxAQuvuemMKGcksFAGpaHhKmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693885451; x=1694490251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAZHJuenxcHpAilGOcCYgpTDOCH9+ws/HIfnUtOnAtU=;
        b=T5RQ+Ty0e5zFX/vzRc0BzfsMICnhPQxc5XSEwgIW5c47SNoVp0K4vE7BdbKEng/wBF
         uiygEPY/j9cY33orEkjfDxJxc+W/qx3AP6+OKkrWFdW6Et+Y9+7gGKdufr+BoGZIu+pn
         Wt1x93cT55btarNajaQPh5fGRCujlTnUjFXjZLKBAnd+siVSfdQxYLJ7jtl9cxyoBKLd
         RTequNq461plHCL7PQXhgpMvQ78AiysKp2KJbAzTLPYJMAakio3IbV5ybfrWkcJ7bBcm
         Vf4BIsVFDBTZvPaXLge5Xm7p4CNVXLKa4TQ6QfzNFMwRXV4wRI7QNEU9fwhZgDP82bvU
         WKRg==
X-Gm-Message-State: AOJu0Yx7+j2GgRgRaSowowJ+pJKd6udOK4d4jI7L67E6p28ENkZv3eaF
        hAfpMBLKap+1zYUB+4FM1EmkFtT1iim+qToeU2o7Ow==
X-Google-Smtp-Source: AGHT+IG9cD/bwYK1VtdcLnHoCKJ6L7yb1QS3/C5VFnna3ZprVnfEsLWrL8MKuOsK72qV2WLKMo3Y4w==
X-Received: by 2002:a05:620a:f96:b0:76c:c1cf:7a35 with SMTP id b22-20020a05620a0f9600b0076cc1cf7a35mr9663317qkn.46.1693885450938;
        Mon, 04 Sep 2023 20:44:10 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id h19-20020a05620a13f300b007659935ce64sm3779746qkl.71.2023.09.04.20.44.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 20:44:10 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-64aaf3c16c2so12493766d6.3
        for <linux-media@vger.kernel.org>; Mon, 04 Sep 2023 20:44:10 -0700 (PDT)
X-Received: by 2002:ad4:42af:0:b0:651:735c:26f1 with SMTP id
 e15-20020ad442af000000b00651735c26f1mr11597948qvr.55.1693885449698; Mon, 04
 Sep 2023 20:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230828075420.2009568-1-anle.pan@nxp.com> <DB9PR04MB9284AA58AA71655C9C0C7C9A87E6A@DB9PR04MB9284.eurprd04.prod.outlook.com>
 <CAAFQd5DYxwX+JdXQ_-ba5B9y+gyWPjvUpCBnKM1zz1W2EkO_vA@mail.gmail.com> <DB9PR04MB928460023FB3CCCBC3EACE1487E9A@DB9PR04MB9284.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB928460023FB3CCCBC3EACE1487E9A@DB9PR04MB9284.eurprd04.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 5 Sep 2023 12:43:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BGJX7=Z1ukFRq_ktaQ0d7FbvV-ob5gs8hfGaNHUXPTww@mail.gmail.com>
Message-ID: <CAAFQd5BGJX7=Z1ukFRq_ktaQ0d7FbvV-ob5gs8hfGaNHUXPTww@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH] media: videobuf2-dma-sg: limit the sg segment size
To:     Hui Fang <hui.fang@nxp.com>
Cc:     Anle Pan <anle.pan@nxp.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jindong Yue <jindong.yue@nxp.com>,
        Xuegang Liu <xuegang.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 4, 2023 at 4:10=E2=80=AFPM Hui Fang <hui.fang@nxp.com> wrote:
>
> On Wed, Aug 30, 2023 at 6:20=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> =
wrote:
> > On Wed, Aug 30, 2023 at 5:50=E2=80=AFPM Hui Fang <hui.fang@nxp.com> wro=
te:
> ......
> > > I wonder if only NXP met the "swiotlb buffer full" issue. In theory,
> > > when format is YUYV, those resolutions no greater than 320x240 (15360=
0
> > > bytes, which less than the max mapping size 256K ) can't meet the iss=
ue.
> > > But resolutions no less than 640x480 (307200 bytes), may have chances
> > > to trigger the issue.
> >
> > I think a combination of a device that can support scatter-gather, but =
requires
> > swiotlb is kind of rare. Most drivers would require a single contiguous=
 DMA
> > address (and thus use videobuf2-dma-contig) and physical discontinuity =
would
> > be handled by an IOMMU (transparently to vb2).
> >
> > I guess one thing to ask you about your specific setup is whether it's =
expected
> > that the swiotlb ends up being used at all?
>
> Yes, the swiotlb ends up being used. We met the issue when bring up
> DeviceAsWebCam (android-14 new feature, android device works as a usb cam=
era).

I see. I guess the mapping is done by the USB gadget controller
driver? Could you point us to the exact driver that's used?

Just to clarify, swiotlb should only be needed in the very extreme
fallback case, because of the performance impact of the memory copy
back and forth. The right approach would depend on the DMA
capabilities of your device, though.

Best regards,
Tomasz
