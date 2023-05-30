Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEE5715D48
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 13:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbjE3Lcr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 07:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjE3Lco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 07:32:44 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14CBB0
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 04:32:43 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-75b2726f04cso256764685a.3
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 04:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685446363; x=1688038363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CX81QWvH6s9KobzrQsWhmRGUwobmqZbLPmPxbjonnI=;
        b=oVT4K3lX8p1VNzyYUMympqQHEHM6dCfrfnHaE0nko9gnJRsyoKv6HPSGk/sqmywVZO
         lDwk+NZmwsIEqfFG5VetzKVHjuPhCfBeM4w8cJD/m5ij5YgdWwjiaNZk28pqL1EUQcJB
         0gwZ/3jBxyhRxQc+WXfEpxss3mudXcoJUjHx0hj6GC7YMLwT7z4oe6vruayKcze0sKzo
         H4ZJ3MAGGzm5WtPzCvw/elSakHIXBL+xKaur1WAqITl4x0E3Dq/5XRiFX6gfzHm+F1bk
         pzQYze0o7dVKCQgXx1rU7YTV8VUIf9kjHJUDeGxCJSsThzMnuT6WhZyB83YgMD/CoQjF
         wsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446363; x=1688038363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CX81QWvH6s9KobzrQsWhmRGUwobmqZbLPmPxbjonnI=;
        b=RIN+NLAxW6EaTZv6rBIRBlb/JyJ+KPD0lsiH+gCVRumUK6JdaxhpWHYjYKQ9UvTcGj
         RDnk9pkyXlX5K2bAc2RVhmUlGiSIj/lVgTBbozM5/GPzD5J35kMyTI80R4wjPTFkFd2v
         dwXNjwQMuawOyrWJB8nB4xvsXIhAWPbJ/iS3BIvY4359GpBwtmHTwfE3/XVZkMV+y37r
         Dw6uGWnqQ9ozFG31BB02G6Rv3AK9VuqZyJOAsIon2gn3qbGeApa/1/aq+Cme9DCqgcch
         NydbRkzI2UMR5ffEV+K6HadsJTDjUVb+h4lK7Z+wLPu042LXEIK0OJPVBTCoTwbBPHqC
         9sAw==
X-Gm-Message-State: AC+VfDyLsGcqcYEOyosd71uA7/xtAOS2SOfB5cq1WhJrtD37J9gZ4Lce
        TWO008y/9C/PdEK7ojqGy+DnfmzKzNllSWEU7eU=
X-Google-Smtp-Source: ACHHUZ6ytsG267MBZ7DmFEntlrmRiVBGiwfzQPpFlxYfxho8sft+/wYtkjKawGRkFqNjx5ngPISYo7Orl1qogtsA6Uw=
X-Received: by 2002:ad4:4eae:0:b0:625:aa49:19f3 with SMTP id
 ed14-20020ad44eae000000b00625aa4919f3mr1670661qvb.64.1685446362988; Tue, 30
 May 2023 04:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-22-hdegoede@redhat.com>
 <CAHp75Ve6rWtkDowBS7z1f=Ot7h8xmXTws8L+Z3eXEfFum2pBcA@mail.gmail.com> <c3580ce0-c43f-8918-ad44-56d512c4fd04@redhat.com>
In-Reply-To: <c3580ce0-c43f-8918-ad44-56d512c4fd04@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 14:32:06 +0300
Message-ID: <CAHp75VeDj6HmG4YzU5aOYOoZkWu+J=GkLwu=LuWpa5jXoqkPTA@mail.gmail.com>
Subject: Re: [PATCH 21/21] media: atomisp: csi2-bridge: Set PMC clk-rate for
 sensors to 19.2 MHz
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

On Tue, May 30, 2023 at 1:28=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 5/29/23 23:48, Andy Shevchenko wrote:
> > On Mon, May 29, 2023 at 1:39=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:

...

> >> +       ret =3D clk_prepare_enable(clk);
> >> +       if (!ret)
> >> +               clk_disable_unprepare(clk);
> >
> > I'm wondering if _enable / _disable required.
>
> As the comment says the BIOS may have the clock enabled
> at boot, the hw won't allow changing the rate while
> the clk is enabled and the clk-framework won't
> allow calling clk_disable_unprepare(clk) without
> first calling clk_prepare_enable().
>
> All the sound/soc/intel/boards/*.c files which are
> used on BYT / CHT do the same thing before setting
> the codec clk speed.

Interesting... It might be that x86 (under drivers/clk/x86 or
somewhere there) can gain a common helper to do this trick, so we
won't repeat this over and over again.

--=20
With Best Regards,
Andy Shevchenko
