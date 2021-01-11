Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9022F0AAD
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 02:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbhAKBAI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jan 2021 20:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbhAKBAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jan 2021 20:00:07 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167B2C061786
        for <linux-media@vger.kernel.org>; Sun, 10 Jan 2021 16:59:27 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id ga15so22426332ejb.4
        for <linux-media@vger.kernel.org>; Sun, 10 Jan 2021 16:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a0KAnpWv7AJO65oSNyxyHyKuMT6KorNxTtKcI4g6BgA=;
        b=gvY1X8z9rHQveQAsLRAOoEdomZrLRVtQyEVHwmpmLzAIxcD/csN/fl28kgTBMrF9z+
         tP1bSo8AE0WYFIYB3X7leJ8gvOLyjm1wqGcvYVdXH01SgRMEFhOAPChYGL8kATenu8ls
         3Ufwu2U2sd3bJoH0E7jdczzyfOKrs8WznhpnS1zzxyWUwZV+8U3Lm1o7WzTjNsytTAkW
         DVvuGerG2Dgb2OyAOWWiswJ+W1lO1Av+0b7bhFStd211RGShGlwn2Fxs+Suvweij5e6w
         DYcHpWyWZnwelCigsy9kyp+Pa+iGLvssAe307PxY4i5EJ01c6TR8RJtnir3DamuS6B+p
         hxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a0KAnpWv7AJO65oSNyxyHyKuMT6KorNxTtKcI4g6BgA=;
        b=X8XPq+Skwg7IBoXd+0V0lWZIysMx7tuR+CM85c4v3fcD3JuvrqJrFgfpgweg+ggoLv
         Y0WU2IZsgQbppWFv1AJPWSWI1l6XDCPkKZ9Us6wfHi8SHfD2OaCENVhiljAFWzxcotE2
         F0DFUnAmuTLvo05XaJum3TCCufYrkGXYxChW3pGcwwE8rIjdYh4e8q8PKJu7gRgWkw/m
         wMP3xw2GaHsmdhUzz03h3n9YbMklc9pWayTudZZqMGSgvPiUR3aiLnUqdmNWmh/RqKcU
         DrttVi7NAi2Nrd6ErTOJNFMAx/690BdxviOiYaUFR1lpXOHw5JI/hGTzVNVkggKRSVuQ
         Z6yg==
X-Gm-Message-State: AOAM530szrmUOp6NNzIXq3uNdUllEoTdsHD2tzcxrxKDmXonwr7A1yLZ
        hdoPU3BEVyaR4IedhEBuo9HRzWLtFhW5gHTT44wY3SY+25zVWg==
X-Google-Smtp-Source: ABdhPJzl4vOhQRfanN5bpQApc6hAYW/6eI66eQcWT65mvQkLYkaqzg4tD4uPazOuJCUYLeeCRNTyCpq9PE1jYoMmLF8=
X-Received: by 2002:a17:906:e84:: with SMTP id p4mr9454024ejf.141.1610326765672;
 Sun, 10 Jan 2021 16:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20201214213348.19675-1-sakari.ailus@linux.intel.com>
 <CAAEAJfADNg_RKuWfREAPbtpB86ZQsNKa5rc83sjB9BZViPhtHg@mail.gmail.com> <20210107220723.GV11878@paasikivi.fi.intel.com>
In-Reply-To: <20210107220723.GV11878@paasikivi.fi.intel.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 10 Jan 2021 21:59:14 -0300
Message-ID: <CAAEAJfAri-3prmQaQQdgDQmga_+cs5beQA64Nyf0q07uq_KQoA@mail.gmail.com>
Subject: Re: [PATCH 1/1] v4l: fwnode: v4l2_async_notifier_parse_fwnode_endpoints
 is deprecated
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Yong Deng <yong.deng@magewell.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, 7 Jan 2021 at 19:07, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ezequiel,
>
> On Thu, Jan 07, 2021 at 04:31:58PM -0300, Ezequiel Garcia wrote:
> > Hi Sakari,
> >
> > On Mon, 14 Dec 2020 at 18:45, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Document that v4l2_async_notifier_parse_fwnode_endpoints() is deprecated.
> > > Its functionality has been replaced by other, better functions. Also add a
> > > reference to an example if someone ends up wandering here.
> > >
> >
> > I'm working on a series to clean up the v4l2_async API a bit,
> > and came across this patch.
> >
> > As far as I can see, the only user of v4l2_async_notifier_parse_fwnode_endpoints
> > is drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c.
>
> It may be that's the only one left. The intent was also to avoid anyone
> proposing new ones.
>

If we want to avoid any users, how about we make it clear the function
is maybe not a good idea by renaming it to:

__v4l2_async_notifier_parse_fwnode_endpoints ?

Thanks,
Ezequiel
