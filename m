Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B4443FC0C
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 14:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbhJ2MLK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 08:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbhJ2MLJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 08:11:09 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237F3C061570
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 05:08:41 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id l13so10418172ilh.3
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=S3e8pqbxO9kRMVq8vTunu1hvd4DX3hvFiOfDtzQfJiw=;
        b=vDb11hdP7H142tuAwbW3fpRhtcsPF8+mDNWdkpY8XDnvO54fGT4iV2BLa1A2nTyboS
         9YfOqV622Xaiww6i1aDyRsh1x4jvfyd8V3kOdmf7OFJ7Q9KR86zwKzVfaKSqmxxTCve8
         FdT5PePhvMq0J/UvD+j5pvJECeiHON0NUCu+/ovOjNRAkK0Ns+GThHxybtl/xIu4PBKl
         Bc1lXbseEXeud9gSkwXsCqIQGq/R1MkybMwALEelm4/LVOet5K53Oc+z32vZaoxfHq5S
         H7vH1XN98l8vZFb4H/jAIAvaaUX/W579IFlqPoMAckwB0xdNZ60jtcK2Pt0EKPbntJz0
         fjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=S3e8pqbxO9kRMVq8vTunu1hvd4DX3hvFiOfDtzQfJiw=;
        b=U1rVW5HPuFzZ31z+hshczSDjztsCAPsAgL8Jz5/EDZfP0z0Rp9/O6SJTeZoWGRNsb/
         B0jCcbl3lHq1fcbzJ/zakLITiNJP6bD+XfOYaJTLSasiIoa4X98NES38XJH3fP3jux1Z
         kIc+cMSIKxlm3H+TEAn8JcaLMDBq7RN5j1968o3miq3NgseX7V+NvGKOd4o9e1uRLqaU
         KGZNkqc6DWBa+eqYBA65bVITJSa9sz5IHfpUA5HK+qvirUhNP9oKygP+GgRMveSVZcrL
         WbNiwjfQLA1K9woQSUWtyscc4jbw00qD2FcckDs74kC1bPVyAz9qQUuqSx+m1M0F/Rre
         CsVQ==
X-Gm-Message-State: AOAM531kuRoB6GIcp2Ry1KEl9Hpt0ywe/UNEuiCyM2nc9RzypiAAnq0t
        5MXev3/3XRT3Ydh+a+ZrWshwQ/c9lg7mmWcZAW+sKQ==
X-Google-Smtp-Source: ABdhPJw7l9tTUHM1yjutTmZWrPVU1tYWmwCykIMHpGpIY9tktiGxDmCCtsSRhTXKzw5/yB3eWydyUujIuks7RoqM8kM=
X-Received: by 2002:a05:6e02:1d9d:: with SMTP id h29mr4170466ila.29.1635509320573;
 Fri, 29 Oct 2021 05:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <YXlxhpZWf2mxJaMi@fedora> <20211028064513.guziv6uaivzlk6ki@pengutronix.de>
 <20211028091442.GA16514@gofer.mess.org> <20211028111535.x7xgz7domx2lpyfh@pengutronix.de>
 <20211028122610.GA18767@gofer.mess.org> <20211028180516.t2tpfbzztm7s6cqm@pengutronix.de>
 <20211029071608.GA28997@gofer.mess.org> <20211029110602.uugnbm5vtfpghiwh@pengutronix.de>
 <20211029115412.GA32383@gofer.mess.org>
In-Reply-To: <20211029115412.GA32383@gofer.mess.org>
From:   =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
Date:   Fri, 29 Oct 2021 09:08:29 -0300
Message-ID: <CAH7FV3njgZ7sOnZZF88KZ2C4UwqxoodpUuLsnucvBxYXmaZo1Q@mail.gmail.com>
Subject: Re: [PATCH v4] media: rc: pwm-ir-tx: Switch to atomic PWM API
To:     Sean Young <sean@mess.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        kernel test robot <lkp@intel.com>, mchehab@kernel.org,
        thierry.reding@gmail.com, Lee Jones <lee.jones@linaro.org>,
        llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I would like to thank you guys for the attention and this interesting
discussion. I'm looking for some work in the kernel and I would like
to know if you guys have any suggestions for beginner tasks in this
subsystem. I have solid knowledge in C programming, but I started in
the kernel a couple of weeks ago. Anyway, thank you for all the
feedback.

Ma=C3=ADra
