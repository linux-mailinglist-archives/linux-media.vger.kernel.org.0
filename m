Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988EA2625E7
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 05:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgIID33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 23:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgIID32 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 23:29:28 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B0DC061573
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 20:29:27 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id g26so252427ooa.9
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 20:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=79+3UGzyvkfull/0xelYhtY5yY6mExctrq9qhKg6vx4=;
        b=TwaxzrjkeFQBQ5S9iZfl52REqRHmJzGvvYF2B9CfSD9B4j23CtHTQ0KXJT58yhbXY8
         j+sIb4F7twjdXWrlesuqQFYXRNz5qOf6OnT7tJm6oK+tQV9F9SmLa2WNM5dPnQR8xu7S
         zXVt8YoHznEoZHqs/7zWdIgP9eZ2DO924HrF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=79+3UGzyvkfull/0xelYhtY5yY6mExctrq9qhKg6vx4=;
        b=DgBRq15hz6GRdTcAQLPPUt75S5SRcSTruM2M/QHK6lZhp92PLUUakPX//oZ0iNobQa
         k2r8imNFM65UbvgIJqkQ2rcu1pWgfc/rl1l6/a3ccN9VLBS2TaSeNTQc0u1JP6fBlXKS
         Ld1lr0sezQVdPJsxNQxuZRGk00ESpfhM9SlL8wzDrzm0fWD1+EXMOC1JEfC7sMqBEkCE
         YadDQqZqFuokQ/xMoPcsuYTgIgHe8OF1gZQ9GU7REf8kAmGIc6nMTEIk7u5QDhBw+0oO
         gNxAp1RSrDW927YyzUIQervKbGDDS1OP3oNbCOFJ+RQsb0nDFYP46638KJW67cF2MM6a
         A8oQ==
X-Gm-Message-State: AOAM533H9frN7oHA8tEjAZ6WCJ5bsI9PbIqwGH3BVkEpqpF01lpT/7Jx
        7GXjOn6M8hFRpH/egGMT93s4vmC6662tdw==
X-Google-Smtp-Source: ABdhPJxet41847PNGETD9oyfswntefi6hEHTk1Av4Rlx0E6cPffSizboLVEMgG+CpsOpCvJiC1O+gA==
X-Received: by 2002:a4a:5403:: with SMTP id t3mr1347547ooa.11.1599622166903;
        Tue, 08 Sep 2020 20:29:26 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id n10sm213885ooj.19.2020.09.08.20.29.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 20:29:26 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id u25so1109226otq.6
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 20:29:25 -0700 (PDT)
X-Received: by 2002:a9d:20c1:: with SMTP id x59mr1588734ota.36.1599622165404;
 Tue, 08 Sep 2020 20:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <22861790-3ae1-2009-a4db-c124067771b2@xs4all.nl>
 <20200830104650.0dd4d751@coco.lan> <CAPBb6MXoyg7UY57SWR-wOrty0hEmW=VAA-1zTi7q3moruRiZ-Q@mail.gmail.com>
 <20200831081008.2d2c153b@coco.lan>
In-Reply-To: <20200831081008.2d2c153b@coco.lan>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 9 Sep 2020 12:29:12 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXZkXT_0WscZWnBcRjPabskSJnuYo4peDbLx0LyJkevfA@mail.gmail.com>
Message-ID: <CAPBb6MXZkXT_0WscZWnBcRjPabskSJnuYo4peDbLx0LyJkevfA@mail.gmail.com>
Subject: Re: [GIT PULL FOR v5.10 (v2)] mtk-vcodec: venc: support for MT8183
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, Aug 31, 2020 at 3:10 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Mon, 31 Aug 2020 10:33:44 +0900
> Alexandre Courbot <acourbot@chromium.org> escreveu:
>
> > Hi Mauro,
> >
> > On Sun, Aug 30, 2020 at 5:46 PM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > Em Sat, 29 Aug 2020 10:43:12 +0200
> > > Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> > >
> > > > Note 1: the MTK_SCP config option causes COMPILE_TEST to fail, but a patch for that
> > > > is pending for the remoteproc tree: https://lkml.org/lkml/2020/8/21/489
> > > > I've verified that that patch fixes the COMPILE_TEST failure.
> > >
> > > Breaking COMPILE_TEST is a very bad idea, as it means that the robots
> > > will stop reporting issues on this driver, including our own Jenkins
> > > instance.
> > >
> > > We need a solution for it, like:
> > >
> > > 1. postponing the changes that caused it to break to be added only
> > >   after the merge window;
> > > 2. ask an ack from remoteproc maintainer for him to send his ack
> > >   and having the patch applied via our tree;
> > > 3. cherry-pick the fixup patch, applying it before the patch which
> > >   broke the build;
> > > 4. pull from a permanent branch from the tree where the fixup patch
> > >   were merged;
> > >
> > > Looking at lore:
> > >         https://lore.kernel.org/linux-remoteproc/20200821115832.2893484-1-acourbot@chromium.org/
> > >
> > > I can't see any reply to this patch. Was it already merged there?
> > > I guess not:
> > >         https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next
> > >
> > > I'm not a big fan of (4), as, if something bad happens during the
> > > merge window with the tree containing the fixup patch, we may have
> > > some bad time merging media upstream, specially if such tree would
> > > contain something that. So, if we would use alternative (4), I'll
> > > likely place all changes for mtk driver on a topic branch, to be
> > > merged upstream only after the pull request with the fixup
> > > patches got merged.
> >
> > It also seems that the series with other mtk-vcodec changes being
> > merged in between, the series does not apply as-is to the media tree.
> > The conflict is trivial to resolve, but please let me know if you
> > would like me to rebase and resend along with the SCP patch once the
> > remoteproc maintainer acks it.
>
> Hans did a rebase on this version 2 and all patches apply OK.
> I guess he also did build test with the remoteproc patch applied,
> and build fine. Yet, Jenkins were unable to check the build patch
> per patch, due to the Kconfig issue.
>
> Once the Kconfig issue has sorted out, feel free to send an updated
> version, if something else is needed. On such case, please preserve
> Hans SoB for the patches that won't require non-context changes.

I tried doing a resend of the patch enabling COMPILE_TEST for the SCP
one week ago (https://lkml.org/lkml/2020/9/2/211, sent to both
maintainers of remoteproc and their list), but unfortunately still no
reaction from them.

Would it be acceptable to you if I temporarily disabled COMPILE_TEST
for mtk-vcodec as a workaround so we can at least merge this series?
Once the remoteproc patch lands, we can then reenable it.
