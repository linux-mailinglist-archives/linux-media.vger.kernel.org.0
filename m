Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297C87019ED
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 23:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjEMVAX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 17:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjEMVAW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 17:00:22 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88AA1BD0
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 14:00:19 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-61b58779b93so103565606d6.0
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 14:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684011619; x=1686603619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBW31pof8U7JTyTG4H9UR8Byn7pBNVG1sdNfQzahcps=;
        b=Q1pQ/R7O807K0QZcLpy/a2OsFtwWI/GTC+ZtCUcvSAji6ri9Ecu0DYWtxMyT1SUiAt
         4wOKSVUmO3yiybktUvj1aG+GsTTgnlWrDoYFYY1JqhX0Kq73QIakH/0whQz+6fHdXGjM
         jX7ky8cs8zdCWf6K7d1tGs4ktXItS/E6whtcNmBVwdbJwATXtD8hLzGmUzhWuEnibHjV
         4J009SDCubKfzomTP1kZBdM+WWkzcBO4yEalleqWWMytzLoeTeRk8y6+X4fCazsOxjOz
         Iej3RJ7i8s75IW8aCAuTkg9ihCaliRwqTbSVv23HdSA71oLDaa2rTps1/bbVwQcrKvtn
         AtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684011619; x=1686603619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBW31pof8U7JTyTG4H9UR8Byn7pBNVG1sdNfQzahcps=;
        b=f4IGoq9BI3WcUlBFTE773N5FGhoN+5Z+phkwRm0h3g3ML+ROwKjRrHPPHsQmvNIKES
         ItKMcW//h5ihis/I6M5Tv4ii5xvFVxoGD3x68yIMezeDuYdNfnd1OkgTfM6DPmppdMfa
         B3hc9XzpYhLOXY7vR5yHxGfxVndKBS9elPepN6HpQI5J5co+qIguaIVrLIS1PEhy+qnV
         Zv4zuEauQVCpjafwBuPYZZ7tHxh9q9jfztmkcnAnMI8CsMhnhSgINkKxl3Ft0eOCPkWX
         sP6RK8EoZH5BWpxA5l+OAYcXDHZicwwt5WSuJqDNv2T1LWf4IitzwEkWg7HcavQIyUwF
         Zddw==
X-Gm-Message-State: AC+VfDwBWzd5wdwVXWzdGukjpFmQm4bYREub6bv9fnre8FApV/iD/Aaq
        GPRsK5Xhk6CACQWcFQAOyIIExSEUwQ8A2f4g8CM=
X-Google-Smtp-Source: ACHHUZ6suIKuv3NjLUbdApii3uNgQoxsnjNnlmFrppV/65JRTdetReF6gcblQMdaqEsJspAHCiqlde+Tngc031xgJdY=
X-Received: by 2002:ad4:4ee5:0:b0:621:68e8:99a4 with SMTP id
 dv5-20020ad44ee5000000b0062168e899a4mr18306226qvb.8.1684011618996; Sat, 13
 May 2023 14:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 13 May 2023 23:59:42 +0300
Message-ID: <CAHp75Ve413+r6jE=h-n0tibU5xy5iAMfbB3H8MPpgjRD3bj-eA@mail.gmail.com>
Subject: Re: [PATCH 00/30] media: atomisp: Register only 1 /dev/video# node + cleanups
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
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

On Sat, May 13, 2023 at 3:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> Here is an atomisp patch-series to continue the simplification /
> exotic feature removal of atomisp. Specifically this series
> makes atomisp register only 1 /dev/video# node.
>
> The other patches are some preparation + follow-up work for
> this change, as well as a whole bunch of folow-up clean-ups.
>
> The cleanups focus on removing the various count / users functions
> which atomisp used before when there were multiple nodes. This
> is preparation work for eventually allowing opening the same
> node multipe-times, as is normal for standard v4l2 /dev/video#
> nodes.

As usual
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
for non-commented and otherwise depending on your answers. I.o.w. feel
free to add if you are going to address as I suggested.

--=20
With Best Regards,
Andy Shevchenko
