Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD8D4473DA
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 17:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235210AbhKGQiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 11:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhKGQiq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Nov 2021 11:38:46 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A6AC061570
        for <linux-media@vger.kernel.org>; Sun,  7 Nov 2021 08:36:03 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id v127so11114463wme.5
        for <linux-media@vger.kernel.org>; Sun, 07 Nov 2021 08:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4hGkCLxhZnpNqcqLmATMrD9cvIKaW/chFtDdi+mbfSw=;
        b=hv8NDkkf/BoZNySfSrye1dDjE3EbpF4GnWvmAFKWyHwMsTO7Sq1Y+10oQxm4RAgv9B
         5nQ5gW/qXeGOdkEqhcWa649hD9AfBikGH0nULObfIuE2+4BhHCpU8Litwr0Xpm353gFk
         5loZeEyiKwfr7JJ6k2TReEAPu8AmzkTqF2L6qV8j+CixhTr8EcAJ9dG/UIY0bnfPerOZ
         X93THQNykU0JbErZr4kX8LkZYxrdzlSjweqkaUw0VvmrKNvVeNFa1Eivbf7wgX7BqmFt
         LE3hy02ln6T/TaGLk0a/aXRD+NANID85TEt8tSC3rXhpll91iY7YW1mVFbWCYFGvAmCz
         cqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4hGkCLxhZnpNqcqLmATMrD9cvIKaW/chFtDdi+mbfSw=;
        b=1sZqpJhGTUp3JuGWj6gYKv7hz+AuZxLOmL8mhHEdZZ0BWYjVZvV5nMLlL776TpdM21
         Kov7DkvKubdNev6npb1a9lLTX7rgX3bGrWq1Tpiow6itHuzNX1mfGHLi5aw3MrMbxwWh
         nLcnH8qxAEDT49+/N7ASBAMfopRszJ5mO5d1kWWOlc+erWBpD72aC+9a2oNu3nj9BBkU
         9Z/BgblPhnmKYl0pQOaieJBufXp80Hn8aupdMfywIhGFV/j6fmvPzbns2slZgcZJSc5N
         dQSeh/N6iwfi/Fd9X/XxnUBrKRZHWe0H5CfI0d8yMgfINWs3e7pdQy55XPpLYA5aIjFh
         Wyfg==
X-Gm-Message-State: AOAM533w1iEHdsBHN9Y3ZUgsTIcb/2SBt610LWipiCWfCUFq0EF/XnCB
        PnT/ymIF12oN455oShsGUlowpH5fJ7DD4g==
X-Google-Smtp-Source: ABdhPJyye92fqnf6uoFZErPVsPnRnuPe12kbbNUM+TzpZQv1fjLeglt8aIYLErII3t4don1klOQE1g==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr47550829wmj.30.1636302961570;
        Sun, 07 Nov 2021 08:36:01 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id g13sm12780500wmk.37.2021.11.07.08.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 08:36:01 -0800 (PST)
Date:   Sun, 7 Nov 2021 17:35:59 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v3 00/14] staging: media: zoran: fusion in one module
Message-ID: <YYgAb76mrMb1ERMW@Red>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
 <a85c93db-e118-274f-d86a-d127c7399926@xs4all.nl>
 <YYKxTrWI299pvqo7@Red>
 <2bbce7ef-acf8-3c0f-2705-09d34b2d92be@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bbce7ef-acf8-3c0f-2705-09d34b2d92be@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Wed, Nov 03, 2021 at 05:29:46PM +0100, Hans Verkuil a écrit :
> On 03/11/2021 16:57, LABBE Corentin wrote:
> > Le Wed, Nov 03, 2021 at 04:21:02PM +0100, Hans Verkuil a écrit :
> >> Hi Corentin,
> >>
> >> On 26/10/2021 21:34, Corentin Labbe wrote:
> >>> Hello
> >>>
> >>> The main change of this serie is to fusion all zoran related modules in
> >>> one.
> >>> This fixes the load order problem when everything is built-in.
> >>
> >> I've been testing this series, and while the module load/unload is now working,
> >> I'm running into a lot of other v4l2 compliance issues.
> >>
> >> I've fixed various issues in some follow-up patches available in my tree:
> >>
> >> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=zoran
> >>
> >> At least some of the worst offenders are now resolved. Note that the patch
> >> dropping read/write support relies on this patch:
> >>
> >> https://patchwork.linuxtv.org/project/linux-media/patch/4f89b139-13b7-eee6-9662-996626b778b0@xs4all.nl/
> > 
> > Hello
> > 
> > My test branch already included your "zoran: fix various V4L2 compliance errors"
> > I have quickly checked other patch and I am ok with them.
> > I will add and test with them.
> > 
> >>
> >> But there is one really major bug that makes me hesitant to merge this:
> >>
> >> This works:
> >>
> >> v4l2-ctl -v pixelformat=MJPG,width=768,height=576
> >> v4l2-ctl --stream-mmap
> >>
> >> This fails:
> >>
> >> v4l2-ctl -v pixelformat=MJPG,width=768,height=288
> >> v4l2-ctl --stream-mmap
> >>
> >> It's an immediate lock up with nothing to indicate what is wrong.
> >> As soon as the height is 288 or less, this happens.
> >>
> >> Both with my DC30 and DC30D.
> > 
> > Just for curiosity, what is the difference between thoses two ?
> 
> It's the DC30 variant without an adv7175.
> 
> > 
> >>
> >> Do you see the same? Any idea what is going on? I would feel much happier
> >> if this is fixed.
> >>
> >> Note that the same problem is present without this patch series, so it's
> >> been there for some time.
> >>
> > 
> > I will start on digging this problem and add thoses commands to my CI.
> > And I know there are a huge quantity of problem since origins.
> > A simple example is that just setting MJPEG as default input format does not work.
> > 
> > But since it is not related to my serie, can you please merge it.
> 
> Before I do that, I would really like to know a bit more about this issue:
> can you reproduce it? Is it DC30 specific or a general problem with zoran?
> 
> The problem with this hard hang is that it is hard to do regression testing
> with v4l2-compliance, since it will hang as soon as MJPG pixelformat is
> tested.
> 
> I would feel much happier if the hang can be avoided, even if it is just
> with a temporary hack. It will make it much easier going forward.
> 

I found the bug

The null pointer deref was in zoran_reap_stat_com() due to 
buf = zr->inuse[i];
...
buf->vbuf.vb2_buf.timestamp = ktime_get_ns();
with buf = NULL;

It is due to miscalculation of "i".

I will resend my serie with the fix for that.

Regards
