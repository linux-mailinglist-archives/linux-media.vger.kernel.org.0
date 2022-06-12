Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79809547BB6
	for <lists+linux-media@lfdr.de>; Sun, 12 Jun 2022 21:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbiFLTXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jun 2022 15:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234200AbiFLTXf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jun 2022 15:23:35 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766AA17058
        for <linux-media@vger.kernel.org>; Sun, 12 Jun 2022 12:23:33 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z7so4652804edm.13
        for <linux-media@vger.kernel.org>; Sun, 12 Jun 2022 12:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/sGKoUhjexzOv6MxuCzYFaugzS1Axdf9CUus//7k+E=;
        b=Cxb3FS8bYsb0gqq1BjqVzPK8TLAW+S7YjyjW26mw0QManmpT4gyz0YdjOknP4oLHRK
         fv3M6zrSwyYLPNmVpIiPyPwN6XjEOZFUFjLUb6H33k6uUWFz6GTMg9cDvwkmFV/VgZZC
         x1Zts1b7fU8o1KBGTlSpjjwGLi/sSpK9w80Rd4BZFovbMvuAAdGqzFhRSVIhUaK/jgG8
         31BxmtA1PFhERfF4VApJzaKxxKz5CQtvwFCYe6u5WbuYQJQCN3KzbUzHKvP5garJvdNs
         8iV0uZXqszw+NLvhuVeyzzwfTgaK2hrvzSQfRDj/lVrZwmqSFVcA8OlYA8RC68oGLSl0
         +CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/sGKoUhjexzOv6MxuCzYFaugzS1Axdf9CUus//7k+E=;
        b=XBlNF9jo/b9UoMRKKpHz7d2Aj4sGVe2ydv57I1BaNQSMOPRW1KkKIH98RZb9xqs2Yw
         gdr26BI+ZsAa/X2LsT/mwfaPs7QE7Q/otnC5VagdrTY328QKimFrLaJLajZY6IGK2daX
         zouf1AqFpk1HuA3YNz5NkLG2FHeKaLYcAD2NYM4gZeLnMiAAnIvoIHWpPLuK5dsn9AHv
         7vnVgAhmd+OXAsK9dI+ADveSu5JVgyMZBUwbKORPQq2i+nHkyDynE0cE3pmmtDjnPvvG
         tZBiM7TtSMPunG3BAUjBOV3SfIfc1h/DNCVac+qibT8GdTKIvlRpTbfPXNp/yqTFMIcL
         2TYg==
X-Gm-Message-State: AOAM533RJ4MlBGMsZ13R8qPU3145ebYczy5QD+0HIvhQYocEh/iQjFYj
        6T0OXMTZ2O3b9eTRPaFsZrVM/cqqCQXhcsPEQAM=
X-Google-Smtp-Source: ABdhPJwyUsTZEa+zdUrjd//Q3O2bdXeZ/L/Pk8NflRaROcpg6uSuSFdLlynNRGS9zmcT1S4HmOeSCARE9Ehmm+EqMpQ=
X-Received: by 2002:aa7:d481:0:b0:42d:d5fd:f963 with SMTP id
 b1-20020aa7d481000000b0042dd5fdf963mr62172778edr.209.1655061811811; Sun, 12
 Jun 2022 12:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220612160556.108264-1-hdegoede@redhat.com> <20220612160556.108264-2-hdegoede@redhat.com>
In-Reply-To: <20220612160556.108264-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 12 Jun 2022 21:22:55 +0200
Message-ID: <CAHp75VcNjQ+0=LcMdi=64U5qvO2f3PeZCPAf9AKbrGLx4PdKmg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: atomisp: revert "don't pass a pointer to a
 local variable"
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 12, 2022 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The gcc is warning about returning a pointer to a local variable
> is a false positive.
>
> The type of handle is "struct ia_css_rmgr_vbuf_handle **" and
> "h.vptr" is left to NULL, so the "if ((*handle)->vptr == 0x0)"
> check always succeeds when the "*handle = &h;" statement which
> gcc warns about executes. Leading to this statement being executed:
>
>         rmgr_pop_handle(pool, handle);
>
> If that succeeds,  then *handle has been set to point to one of
> the pre-allocated array of handles, so it no longer points to h.
>
> If that fails the following statement will be executed:
>
>         /* Note that handle will change to an internally maintained one */
>         ia_css_rmgr_refcount_retain_vbuf(handle);
>
> Which allocated a new handle from the array of pre-allocated handles
> and then makes *handle point to this. So the address of h is actually
> never returned.
>
> The fix for the false-postive compiler warning actually breaks the code,
> the new:
>
>         **handle = h;
>
> is part of a "if (pool->copy_on_write) { ... }" which means that the
> handle where *handle points to should be treated read-only, IOW
> **handle must never be set, instead *handle must be set to point to
> a new handle (with a copy of the contents of the old handle).
>
> The old code correctly did this and the new fixed code gets this wrong.
>
> Note there is another patch in this series, which fixes the warning
> in another way.

> Fixes: fa1451374ebf ("media: atomisp: don't pass a pointer to a local variable")

Dunno for media subsystem, but for ones that Greg is maintain, the
point is that revert itself is already kinda fix and no need to have a
Fixes tag, instead the commit message should clearly have the
automatically generated line of revert (with the rest of the
explanation why that is needed). Just sharing my experience.

-- 
With Best Regards,
Andy Shevchenko
