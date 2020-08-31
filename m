Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C21257193
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 03:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgHaBeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 21:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbgHaBeB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 21:34:01 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7371AC061573
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2020 18:34:00 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id i11so4176687otr.5
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2020 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Htmaaw+S1jVeeY2gulw+mb8r3sodMQx9mT6I6HgVbyg=;
        b=bv3nlx0zc3/JAg/L6CS5rd06Wnw7/t+958vC2vL3c97FCoz8CxOs7Qrx4jnSvI1EJH
         XkYVhrkjP4oKmn1uOagqER7GiVlFkchkIwBD1SoVs1TtWVswHPCanHkQDKi/NYR7suwG
         rH+tou5/JHl2DTSJFz4+i+IBUSNaVTtXf3XI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Htmaaw+S1jVeeY2gulw+mb8r3sodMQx9mT6I6HgVbyg=;
        b=HdeBBh8t2+K/xpEGDCmAes5f+ysbMLnFnlY8Q4xYuhNR8WlIHvl6PP5CcKLRqdlYnm
         Z5IsW1G+1fj+oR9PK3gUVoM2pU0fJFrNXZy9jU0lfUUa6IF/2p2udoGPvGzBAccvKiwq
         3lylwBhJF11YUF+iPi/WVsMCA6Z+y94bFXNOqfjNj6mHsj1Xv7IVYF7MnVAqFPMEk7mf
         HGCkW7H7uXuk9Rq5nrj/0vo+v+N1JxNxBQcazLwC1hwwkDXgoW+oOLWVsxoIIGVHsaAW
         6KDspLU0Ggbh8IHdarkrOV7oIPSwJnC/6jOg/7SSEe70GRkp4VIJsZY3Ht2wukpGo/5m
         XgPw==
X-Gm-Message-State: AOAM532qWjaWc9scq78Ce8dvwSQ+ryrE7SXVPD6c0WPJRjSeSWM0pV7A
        FQ5gMvTsZEORqhumOvMlidHdWdB83uwmX3wk
X-Google-Smtp-Source: ABdhPJzGb2UH1uDs4Kc21GrnBMZYXmStzANSNNMAjr9oopxFZDYvuA/I+BwJiy++d+578YTRCdOoSA==
X-Received: by 2002:a9d:65c8:: with SMTP id z8mr1176939oth.5.1598837637640;
        Sun, 30 Aug 2020 18:33:57 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id v36sm1526988ooi.46.2020.08.30.18.33.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2020 18:33:56 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id k25so5877660oij.0
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2020 18:33:56 -0700 (PDT)
X-Received: by 2002:a05:6808:482:: with SMTP id z2mr2099462oid.94.1598837635892;
 Sun, 30 Aug 2020 18:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <22861790-3ae1-2009-a4db-c124067771b2@xs4all.nl> <20200830104650.0dd4d751@coco.lan>
In-Reply-To: <20200830104650.0dd4d751@coco.lan>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 31 Aug 2020 10:33:44 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXoyg7UY57SWR-wOrty0hEmW=VAA-1zTi7q3moruRiZ-Q@mail.gmail.com>
Message-ID: <CAPBb6MXoyg7UY57SWR-wOrty0hEmW=VAA-1zTi7q3moruRiZ-Q@mail.gmail.com>
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

On Sun, Aug 30, 2020 at 5:46 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Sat, 29 Aug 2020 10:43:12 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>
> > Note 1: the MTK_SCP config option causes COMPILE_TEST to fail, but a patch for that
> > is pending for the remoteproc tree: https://lkml.org/lkml/2020/8/21/489
> > I've verified that that patch fixes the COMPILE_TEST failure.
>
> Breaking COMPILE_TEST is a very bad idea, as it means that the robots
> will stop reporting issues on this driver, including our own Jenkins
> instance.
>
> We need a solution for it, like:
>
> 1. postponing the changes that caused it to break to be added only
>   after the merge window;
> 2. ask an ack from remoteproc maintainer for him to send his ack
>   and having the patch applied via our tree;
> 3. cherry-pick the fixup patch, applying it before the patch which
>   broke the build;
> 4. pull from a permanent branch from the tree where the fixup patch
>   were merged;
>
> Looking at lore:
>         https://lore.kernel.org/linux-remoteproc/20200821115832.2893484-1-acourbot@chromium.org/
>
> I can't see any reply to this patch. Was it already merged there?
> I guess not:
>         https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next
>
> I'm not a big fan of (4), as, if something bad happens during the
> merge window with the tree containing the fixup patch, we may have
> some bad time merging media upstream, specially if such tree would
> contain something that. So, if we would use alternative (4), I'll
> likely place all changes for mtk driver on a topic branch, to be
> merged upstream only after the pull request with the fixup
> patches got merged.

It also seems that the series with other mtk-vcodec changes being
merged in between, the series does not apply as-is to the media tree.
The conflict is trivial to resolve, but please let me know if you
would like me to rebase and resend along with the SCP patch once the
remoteproc maintainer acks it.

>
> Thanks,
> Mauro
