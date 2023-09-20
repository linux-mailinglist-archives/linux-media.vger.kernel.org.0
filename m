Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB0E87A8019
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 14:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236165AbjITMcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 08:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236172AbjITMcw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 08:32:52 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B12F2
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:32:45 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c012232792so49547201fa.0
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695213163; x=1695817963; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ea/cCcPzYZYXGP2HXNYz8e5upcV7kl0VOiTjgaOoRD8=;
        b=HqrlQ9kdR7bT/X+SKhHLiVh3no03UNZ61EEfhKTOu7x7vR7ovP/Lu2YeKsfLs6X/ug
         AUwLhatfGU6W/Yq22Mfo5I3EzOnwCNaMK2Jo1neokyJyZyTnj5dXhdz5vSZayCzR3P2G
         TGrFM8JjVNVq63eHK+dVi4RNLMWDQ39ilQXYSEjtFTBe9iliKfs8ZQKEQAWYhufbnYQ8
         xymyih9QyToEsS1I5/pZZrn1idaezuAG+sVi4U+uCioPStLQhhqb1lS6NUPNX+uG0gje
         c+vmMmz7HnBmenyJDmJfGbbP2yKvcPlyol/1A3LfXzXHEuNPrQvRri7rTkUjh/NZ95lr
         KSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695213163; x=1695817963;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ea/cCcPzYZYXGP2HXNYz8e5upcV7kl0VOiTjgaOoRD8=;
        b=Q5VQm9hgeSKQ7IdfmeMRymLtRFsGCTndILjKSvpFwpVJXff1e4iFzsiqhEqp56ByfK
         bDDstVluMeeEE8WeNwaIP0wJ3CUgA+aqaK9cj9izbRdSV1d5+gaTXaKnX8IkMiEChDPN
         hjtPaFxICbjWTbszM0a//lKZivOmVpDz+pX64nFiOGwOayilusB1QykhKhUfoTn9eZaz
         KgOTBs4uAgBU9pe7DRc1z0xbMvCkqqTsPdkED2TQ2uuNPSgIe9d38jh59AQ1wKr2CDTi
         AH86NKGsW8rCbPU1M/fYp8Irr1YzfBDjkCYDHQQod2s5cH3tCc3nnAcxHA1Bg90qCXfR
         Jo7g==
X-Gm-Message-State: AOJu0YyTQDn6jCuddbN1UhCURy9dGTw3BS31167pNkRU9qykwGXUfuU8
        D927nLOetIL2rlyEIoEaJgP8oEJ/iHMdxBg9
X-Google-Smtp-Source: AGHT+IG2qqWu11y3WrSuPZN5bn940m+wMD1sVz0cWFAZOJAAeOOI597t6L6j7wsbYu84duZ+fAMu5g==
X-Received: by 2002:a2e:860a:0:b0:2b5:80e0:f18e with SMTP id a10-20020a2e860a000000b002b580e0f18emr2253811lji.3.1695213163227;
        Wed, 20 Sep 2023 05:32:43 -0700 (PDT)
Received: from [192.168.1.70] ([87.52.106.165])
        by smtp.gmail.com with ESMTPSA id h24-20020a170906829800b009ae0042e48bsm5163427ejx.5.2023.09.20.05.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 05:32:42 -0700 (PDT)
Message-ID: <8821037492568f97eb258cbb4a6f7b2a81263650.camel@gmail.com>
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
From:   Claus Stovgaard <claus.stovgaard@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Date:   Wed, 20 Sep 2023 14:32:40 +0200
In-Reply-To: <88a7d652-354e-2a69-21de-22b32d5d4c1f@redhat.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
         <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
         <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
         <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
         <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
         <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
         <1d03c5f9-1813-40f0-f280-520e2da38e09@hansg.org>
         <1d46186b-24a6-3ae9-ccc1-0ada0f068313@redhat.com>
         <253b5ba6-d44d-4ee1-8c18-44159632d023@redhat.com>
         <fc63b127-d8e5-c278-d17a-3ecc90febbe3@linux.intel.com>
         <d97f7d9a-20f5-5914-4109-f98b9f89b11e@redhat.com>
         <e17fc9ca-9b14-10c1-7425-f7f44407f580@linux.intel.com>
         <88a7d652-354e-2a69-21de-22b32d5d4c1f@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu

On Wed, 2023-09-20 at 10:52 +0200, Hans de Goede wrote:
> Hi Bingbu,
>=20
>=20
> Yes that sounds good to me, please it move there for the next version
> of this series.
>=20
> Regards,
>=20
> Hans
>=20

Now Hans mention it. When is the plan for the next version?
Would love to test my Dell on top of latest rc of 6.6, as the ivsc is
now merged upstream, and also with the updated v4l2 api changes.

Regards
Claus

