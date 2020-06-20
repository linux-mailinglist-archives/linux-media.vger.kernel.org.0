Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFE9202180
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2020 06:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgFTEp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 00:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgFTEp1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 00:45:27 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFD5C06174E
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 21:45:27 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id i4so10617680iov.11
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 21:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Wh/lTGXVT0WJe4A6MDAEH2nBcYpHTocRL3R50KZ9Bo=;
        b=CnbOQqxWogg0hJ+m6nEl6LmarjCrn9ulqptcCsMRefpnOnhcwVw9IAy8zv0VilRriO
         UO2fQhpPOQJ6OtlZyFHXj6D2nZtXAFFCByEi92EviucvkNsBvhBVkSicSmM4X+1dOes+
         s6iT2KpvmFTLkoqEFMn/QDXlCE2iQiSm4tSvy/4+2qR1P+KQTCMeVgYDqWG8A6bvHr00
         RLCTfZSOZriUQn33JcvtDrwpZzXYTTOwFd0BV1rpla9l9k4dOtAophqulwvv0L3ypp+f
         t25MQYS/SgTaMNbhBwJowOML+CcqBlh5aPiEkyi04D6abr0s+s9NUYRRdHPWgDsh4pHp
         5USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Wh/lTGXVT0WJe4A6MDAEH2nBcYpHTocRL3R50KZ9Bo=;
        b=BIuaaohNBtggfmZC8Ob7Jr0tBH0G7ECumkn7pIuDO7CLGx1FUb98z8KAiNH0TFWBZH
         x7ejx0zgPnNlwzD5vVEGMYkRYoLK4GTIdFsgGvYGorHBrs4AOvPrU4NUC51ErTfmFw+z
         E1Ixy0YRzk0Ov73s+ioZNYdta40MZiKOL9Ep/rYB3CccK8kB1lrG2v0zUAglPhE6s6kc
         lrGHDNFyMKPQrELrVJC1tJ73DaGfPSArf1pZE2jZ+SvKfLAvFB3a48cA8znkWyk2eADj
         2oHqemjYpeM6BZJLWUVutl/hIH57TUlBlfhcr1wMHe/CVpqG/uhG0rTplH6MzQwRjORO
         kL2w==
X-Gm-Message-State: AOAM533ol64gWBlwrHQiIdYgs/yvf/t0NpRKGuvKELUNaAyfV1lxAHpG
        jPx0llzDz3B/y2x/y7uTQLhCuEsAr7I6ch50Bp0=
X-Google-Smtp-Source: ABdhPJztRSUkKrlemuljGZEql/ppWQiJ1SEulZIpPPMeRc1X0zp1gtkm8trvrC69PuCAt3r9CzyPTQYeeuHhN3UmJaI=
X-Received: by 2002:a02:ca13:: with SMTP id i19mr6963102jak.132.1592628326011;
 Fri, 19 Jun 2020 21:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
 <20200618133303.28676-2-ariel@vanguardiasur.com.ar> <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
 <f2bf8846e265024c20a77fa618d54455b3b7ca95.camel@collabora.com>
 <20200619144229.GD5823@pendragon.ideasonboard.com> <adbb92de81105575d661f348a9804279a2844d64.camel@collabora.com>
In-Reply-To: <adbb92de81105575d661f348a9804279a2844d64.camel@collabora.com>
From:   VDRU VDRU <user.vdr@gmail.com>
Date:   Fri, 19 Jun 2020 21:45:14 -0700
Message-ID: <CAA7C2qi5msfPjs=VdS5rkFHGDE37N+ViAhnK3bmxnPnUmntQEw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Add support for meson building
To:     Xavier Claessens <xavier.claessens@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        kieran.bingham@ideasonboard.com,
        "Ariel D'Alessandro" <ariel@vanguardiasur.com.ar>,
        "mailing list: linux-media" <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        p.zabel@pengutronix.de, nicolas@ndufresne.ca,
        Gregor Jasny <gjasny@googlemail.com>,
        nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> From past experience, distros tend to find many small issues with build
> systems, especially debian who have tones of scripts to verify what
> changed in the package: a missing installed file, a missing build
> option, missing build flag, etc. You can either deal with that and roll
> a quick point release to fix any issue they could find, or keep both
> build systems for a couple releases while recommending downstream (a
> note in ChangeLog) to try the meson build system, making it clear
> autotools is going away.

Another viewpoint is supporting both for a number of releases equates
to kicking the can down the road. A lot of people don't bother with
changes until they're forced to. Consider supporting both build
systems for one release, making it clear autotools will be removed
from the next release. If you imply a sense of urgency, people are
more likely to give it attention. If you imply that it's ok to kick
the can down the road, people will kick the can down the road. Yes,
some people will jump on the move to meson, but it's not just those
people who need to migrate. The best way to get someones attention is
not text in a changelog or readme, it's to deploy changes that break
their build and make them address it. How many times has it been that
upcoming changes were announced well in advance and people still
neglect preparation. As the saying goes, `the squeaky wheel gets the
grease`.
