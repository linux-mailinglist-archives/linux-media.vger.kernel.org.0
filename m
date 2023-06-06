Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B647E7240DA
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 13:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235891AbjFFLaG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 07:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbjFFLaE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 07:30:04 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CBBE47;
        Tue,  6 Jun 2023 04:30:02 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3f9aeba6cc4so6379161cf.2;
        Tue, 06 Jun 2023 04:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686051001; x=1688643001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2A1fLNTmEx2ReydX2CnML7lt078/lSewzLRtnj3shQE=;
        b=IXjvlkS+0oP2XmoD8qtrDGi7Hk676v/qNIe44UfNeNXzDTHeGKLe02GRh9Ro1h+7E2
         ZY0tdn0gEJ2LpvUGAG7+g3nuw8IDoPsds3ar4WOtpV3T7/t9RWPmyzQDdlUnkgTdNDRU
         UCA6XuqjKpPQslXWvT/CqPVMwKt8AJCZHXuEgbVqihM46QNNTl1728MdimY7Q+D+xgGg
         GenYzCVqR/8UHv9U710PhTuL4HN3RFoMd3Xf108uVMocs+PfkyI4qf8r+qaPuoSqMmsF
         PhJ6slEC5yDu9WyZR2MGjzYizIdONnR7d1VGXbYESJf29hr5KG01atfa/xC9uJAOFSIO
         rU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686051001; x=1688643001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A1fLNTmEx2ReydX2CnML7lt078/lSewzLRtnj3shQE=;
        b=U09zyp961z3lNXoWLAbJ7vuPB+EZoM+Aznvz2sOBs7LQ261TeRDVEcGWUPkYBawsUe
         Xnu2K7sYNzreu0hpczPkKjCiAt/ceq4GtuxfwlDKElIAm5cJXzH2s3IU73zG0Sm6q2e5
         pm4cHB7XcTCx4PrqDAweO/xkQFuzSUgtisJGGCVvfpyGZDvY/nFi8Q9rbHpXL8BzFl7W
         I4x3N+cigOeSavTU/QkhyH35OyN5KwjWo6/9rBWVBe0iW/f+hhLH2K4tUAq+crwLBaQe
         dXGSXU64v4cdbXd/BKVpi6rcas5INkB1MtttuEG88bib4u9/j5uu1FSp3rVvMs62xK2U
         aNeg==
X-Gm-Message-State: AC+VfDzXy0nx7tu+VoKY3/rLRe2wCXDMJE0H067F4RTBMQMcm9N2t8OZ
        TIr/LzjeaanaTUN6x8YyneHwrs4UhBSMf1jmSNc=
X-Google-Smtp-Source: ACHHUZ6VrW8rH/QwOz/vHdpqVl7g/95eXNASpdXVIUHuZp7MT1GSCQbpjgs70WJezPWjjxH0SMKNqhhk204Libv5GDM=
X-Received: by 2002:ac8:7d96:0:b0:3f6:aff0:6df2 with SMTP id
 c22-20020ac87d96000000b003f6aff06df2mr1901689qtd.31.1686051001493; Tue, 06
 Jun 2023 04:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230531134429.171337-1-hdegoede@redhat.com> <CAHp75VfZN5M8LiP3nw0NT5p3WyJJJJm6w2OZKgm28b6aokzopQ@mail.gmail.com>
 <b1cdf8b7-ae9b-a86d-5298-bd0cfa70f9cb@redhat.com> <CAHp75Vc7fq=PK5vN5Ya6yMRG3VCFhfwBVobxsSKYwKUyWnDq3g@mail.gmail.com>
In-Reply-To: <CAHp75Vc7fq=PK5vN5Ya6yMRG3VCFhfwBVobxsSKYwKUyWnDq3g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 6 Jun 2023 14:29:25 +0300
Message-ID: <CAHp75Vdm-srbyTXmR_g_FziVGOdUaWskHVFW=gOet_YyEY2HAQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        bingbu.cao@linux.intel.com, platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Hao Yao <hao.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 6, 2023 at 2:26=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Jun 6, 2023 at 12:23=E2=80=AFPM Hans de Goede <hdegoede@redhat.co=
m> wrote:
> > On 5/31/23 19:56, Andy Shevchenko wrote:

...

> > Ack, I've squashed a fix for this into this patch while merging it into
> > my review-hans branch.
>
> Now you have two different checks for the same, I would suggest that
> you switch to check clk->cl in the skl_int3472_enable_clk()
> as it's done in the skl_int3472_register_dsm_clock() instead of GPIO.
> Other way around is also possible but it seems to me that checking for
> clock existence has better guarantees than just checking for GPIO
> availability.

That said it might make sense to also introduce

struct ... *clk =3D &int3472->clock;

in skl_int3472_register_dsm_clock() so the above mentioned checks will
be the same and actually code in the latter will look neater (?).


--=20
With Best Regards,
Andy Shevchenko
