Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E3F4249AD
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 00:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbhJFW36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 18:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhJFW35 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 18:29:57 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314B6C061746
        for <linux-media@vger.kernel.org>; Wed,  6 Oct 2021 15:28:05 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id y17so4387081ilb.9
        for <linux-media@vger.kernel.org>; Wed, 06 Oct 2021 15:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VI72+rQQH950OkSQA66NIQXwWicvtVqAwf2xJMPB6lM=;
        b=fxHYOaNVrsUChcGOTJdXMhCykDCTOyS1Aq6lNkx/fLSTsg29afZshjsuobE/hRb1me
         aOfGx4wiRWv/YGtwGYvorqk9t4vLAu9oNu5Zd6R2V+JkKsPAN/3etLL/wayLjrLo70Hk
         vM8A1NyzRE3JtFvJe4HMsaN7cZGdtYRONB/mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VI72+rQQH950OkSQA66NIQXwWicvtVqAwf2xJMPB6lM=;
        b=kD+ntAzLRmUEYWOy4Ign7JXA3gGBwpgcAHyJYWzqyL4GQfHRCYbeXWYD9FQHjy7tmo
         z20k/FkeQhh8pr+49hoFu2zP5VyfvL1ZM2lqCLooJXMSt3iUMHLWAGquwq8JyLHEkk2h
         XUhaSo7GFiqRkbwo8ejthR6oAN/OSlCuxenZiTu54F79ofsDw/b79apv660WxcfbKdqy
         D1ekKQ5GGAJsUGub4khAqAYN9fNaL+leB55GqucET2gLexDYWXJxCclCBysmOrG0GlBp
         WtfZYYx688Ws5vqJtuays93H36a7JaBXkTQ5O+0EQ+FdrzbyzP1CBL9V0wjHIJCia19i
         JBzA==
X-Gm-Message-State: AOAM532V/gXQgtHAoXlSEg18xUcfL5YfmexIl9M4wKDoVlgt3h9MOFxm
        jrUmw64n1PPY08jakWkeZFnUYyiBlIkzFw==
X-Google-Smtp-Source: ABdhPJzwtSoIC6+sn5axPTXwATv+vv9v+H3glHQ/7qU6cGeONMV2kBqcWh7AAJejL6mDdwYmGnglZQ==
X-Received: by 2002:a05:6e02:20ee:: with SMTP id q14mr513083ilv.176.1633559284397;
        Wed, 06 Oct 2021 15:28:04 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id o7sm943581ilm.4.2021.10.06.15.28.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 15:28:04 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id h189so1711509iof.1
        for <linux-media@vger.kernel.org>; Wed, 06 Oct 2021 15:28:03 -0700 (PDT)
X-Received: by 2002:a5e:d618:: with SMTP id w24mr685194iom.178.1633559283343;
 Wed, 06 Oct 2021 15:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211001112522.2839602-1-ribalda@chromium.org>
 <20211001112522.2839602-2-ribalda@chromium.org> <YV4blXBkmYhCXxKG@paasikivi.fi.intel.com>
In-Reply-To: <YV4blXBkmYhCXxKG@paasikivi.fi.intel.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 7 Oct 2021 00:27:52 +0200
X-Gmail-Original-Message-ID: <CANiDSCtHKOAmC3=vmyz0Ky2ZJ5Xg4rfwoetSc+=XXt2msE2KPg@mail.gmail.com>
Message-ID: <CANiDSCtHKOAmC3=vmyz0Ky2ZJ5Xg4rfwoetSc+=XXt2msE2KPg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] media: ipu3-cio2 Check num_planes and sizes in queue_setup
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

Thanks for your review :)

On Wed, 6 Oct 2021 at 23:56, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Fri, Oct 01, 2021 at 11:25:15AM +0000, Ricardo Ribalda wrote:
> > If num_planes is different than zero num_planes and sizes must be
> > checked to support the format.
> >
> > Fix the following v4l2-compliance error:
> >
> > Buffer ioctls (Input 0):
> >     fail: v4l2-test-buffers.cpp(717): q.create_bufs(node, 1, &fmt) != EINVAL
> >   test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
> >
> > Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I attempted to apply the set to my tree but it doesn't seem to.
>
> Do you happen to have extra patches in your tree?


I think that I was on top of Linus.
I just rebased it on top of yours and resend it as v4

Thanks!


>
> I just pushed mine to the master branch here:
>
>         https://git.linuxtv.org/sailus/media_tree.git/
>
> --
> Sakari Ailus



--
Ricardo Ribalda
