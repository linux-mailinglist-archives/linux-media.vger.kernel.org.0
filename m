Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 255E6726595
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235333AbjFGQOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241593AbjFGQOo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:14:44 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767C21BDF
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:14:43 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-394c7ba4cb5so5123338b6e.1
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686154483; x=1688746483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQaolXzGkWOeGyF5eOKuAo51ZyGk52j1tIs9DLS1FTs=;
        b=nKxlJbYVMxP0nf6+o3JssLtSIgMBvBmOaCEm07VevkigXcCC8LfNK8K0uZhpUZGvRe
         H0qgMKCWr8Qdnqg8ekb7Q5kqqAIF6eopGdTM65+sIl16tzYw14MyBG/DO2aRMG+DhRzw
         WhciIhCF9+JZwHq79/44ida4aFauoOpTgyk64NzyZZ2gSqccZ3imEIWwte0UAnNV+rsa
         5Kj8nu52RHi/mKZJ1U56f7VatlRqj+tz4rDQqNSUP90E3/39/F4cW30kd5IzcDgLEMnv
         2/4KPHqZILjRVcsTSCQrn4GPLD37JvvlmdC+Ur9qWxvWwjMweuVEJUYNyP6xP9y/VhhU
         HpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686154483; x=1688746483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQaolXzGkWOeGyF5eOKuAo51ZyGk52j1tIs9DLS1FTs=;
        b=MvMLCqTEN4/IYrUELr+J9kq5N1+gvC04YnDQ1tJ/3aWXeHHCdHe0TtX5zu5YLtDA+z
         PHi/ugMFDL8VdtxnCoDNmdKqxVEukrTxP+boGbWoevF8hhw7kXFMC/ovj/P8J6Pqgqpz
         9R39iDJmfB/zmoH5FFReBbpQ1j4wgoOBQ4mqb7POzc5Aul6D9ANwrpAQrxA4h959X5T1
         RKnMXRtpiH0qpqd3mt8ZnAcT9uCb4OvMQHmX+7AVO5YCynfWEYf4hHIu+1UYutWmK876
         4SxfCO6fsDPAvoZuIJfD+z/L2w5/1dA+BtdL8nZy1DBjUJManiNQv0vIRLOsfGuK/8RZ
         L1EA==
X-Gm-Message-State: AC+VfDxelCVmmOaPe2DEfEI3rsKZYZ4jC32RTxwj76s3LzZwd+FLW+3z
        PttiJ3UR2A+aSvnDQIqer0/s5iCsnjJMzy0IjZY=
X-Google-Smtp-Source: ACHHUZ7zVQIiKQO3MaFA2EIwUhbzVojj+oAU1Rq6NMZUS6OBn27iIUOlYBMnaw+hEaR8a2hE5IKYVy40IuCRfrKxpfQ=
X-Received: by 2002:a05:6808:98f:b0:39a:bca0:3c28 with SMTP id
 a15-20020a056808098f00b0039abca03c28mr5038279oic.57.1686154482638; Wed, 07
 Jun 2023 09:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230606165808.70751-1-hdegoede@redhat.com> <20230606165808.70751-2-hdegoede@redhat.com>
 <CAHp75Vd6TPfZhPEDUdAj0Y7G8fQDPKQhmcY_tDWmN7VHBpXL0w@mail.gmail.com>
 <0760b8ba-0091-5270-5e46-9787a910bd6f@redhat.com> <ZIBxhg1LVL8+zBCE@kekkonen.localdomain>
 <CAHp75VeZe-aeusoeYgDh=6kGfxNUDexLvvwMdLTKe-k1_vtAwA@mail.gmail.com> <2f367370-1dcd-5246-4016-dfb06019eda6@redhat.com>
In-Reply-To: <2f367370-1dcd-5246-4016-dfb06019eda6@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 7 Jun 2023 19:14:06 +0300
Message-ID: <CAHp75VekdeW1P0-CvcdTCYryvq0DGkJ6JzCVtatVAgFDu5gJxA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 7, 2023 at 6:58=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 6/7/23 17:40, Andy Shevchenko wrote:
> > On Wed, Jun 7, 2023 at 3:01=E2=80=AFPM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> >> On Wed, Jun 07, 2023 at 10:40:34AM +0200, Hans de Goede wrote:
> >>> On 6/6/23 22:43, Andy Shevchenko wrote:

...

> >>>               *val =3D __get_unaligned_be24(buf);
> >
> > __without double underscore prefix
>
> include/asm-generic/unaligned.h
>
> defines __get_unaligned_be24() and not get_unaligned_be24(), I guess beca=
use 24bit is not a standard register width.

Strange. Do you have some custom patches in the area?

https://elixir.bootlin.com/linux/v6.4-rc5/source/include/asm-generic/unalig=
ned.h#L112
https://elixir.bootlin.com/linux/v6.4-rc5/source/include/asm-generic/unalig=
ned.h#L90

--=20
With Best Regards,
Andy Shevchenko
