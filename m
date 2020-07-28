Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFAC231051
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 19:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731706AbgG1RAM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 13:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731523AbgG1RAM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 13:00:12 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768CFC061794;
        Tue, 28 Jul 2020 10:00:12 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id y22so18060900oie.8;
        Tue, 28 Jul 2020 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TZpDclNNZRMgFEz0oqb9LeYPT9K0M3xP45ARWm+IZRA=;
        b=o0JSIB1dljduACzj5af9gW2AzX15u3MTM+ZG5sk5CTeVpq4IM2R+EmK49qFNJdL0K3
         XK2xpayESCykGC99u5VkdMBpve8pH+8YDA8ovL1P2W3hyTeiP/vG+KgnGp+IH5lc1Qhj
         RNd5TpSq+um87qxs5A8gyQw8qjnJyezqxKZ4RTvNyepoAgEcbcofRUqrVcYkKfmjuXO9
         Yie1Q20Tncptz8mlve/WpscL/Xh7YvTk6+hflZ0oT2EUhsLmhbZTHgkeXD8lgOd4Vx3Z
         oKMmRstyCCl4uqnjVT6+Y4o+7HIjdZdJNSqq9MnAaTI+AyRYwgBvr4zBbx3+EGgCkt75
         bkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TZpDclNNZRMgFEz0oqb9LeYPT9K0M3xP45ARWm+IZRA=;
        b=E0k4RHnYja4aMvxaLBLy2xUFRI7+9JZKa75wDoSInqDWpxhBT0CxmHz3Gi3kov+54K
         ZddcZoiPmq9QaW6NtroA6s8sZGfEbkshWlAcaM4mdLOfmUw4SNpJJWlQzqlkUart0aUq
         FTCA3mXQNa77s3hRD/ugMWCRCKmU97nwKcu4r0ar9QRC/Pb34mU4DmQv9cQhGHm7Or8P
         vc5kfR4XLzISFk/8jPZn5nVyfiY6gZxPM59retI4i2UphC0rK0H+qOPuIQqxMip7wqPf
         kaF6mZkQbXBn3Y36v+/HgxMeipv40oxnbhGokdFUdi81oTpF7uAvHDGjJ9e0YoLMqyBm
         oNVQ==
X-Gm-Message-State: AOAM532wjY3AAroetO3p1s7yUMA4iKHtzXYe7tDmKIA7sb9SzhagxK5a
        EyiDhuncRNrnIKW4i/1e/mnODHhSJh2t5mAe5Lw=
X-Google-Smtp-Source: ABdhPJy0vU1aOpVRhjMrvC2AGOeItsZVY+CvFDtcW5Ntc3n2wH8ZJdKELj2heiQzdzMSULdMXvmDRir7wn0YcSSAW+M=
X-Received: by 2002:a54:4f1a:: with SMTP id e26mr1765736oiy.171.1595955611873;
 Tue, 28 Jul 2020 10:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200728143004.3228-1-dhiraj.sharma0024@gmail.com>
 <20200728145419.GA3537020@kroah.com> <CAPRy4h1Xs1JpQinnWm04dOi07Ch0RLL0U4Z5DDCKHmombXE0sA@mail.gmail.com>
 <20200728155311.GA4178776@kroah.com> <CAPRy4h2Zbw=QwJ7=0+FzGnK_o1esn2GTRSuv5ZE30Vu=Oj=x=Q@mail.gmail.com>
 <20200728165820.GA42656@kroah.com>
In-Reply-To: <20200728165820.GA42656@kroah.com>
From:   Dhiraj Sharma <dhiraj.sharma0024@gmail.com>
Date:   Tue, 28 Jul 2020 22:29:58 +0530
Message-ID: <CAPRy4h1byz5_r0GdEagvx6Sini3P3uA5Mm4K6AdmM4wHjk+y9A@mail.gmail.com>
Subject: Re: [PATCH] media: usbvision: fixed coding style
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     devel@driverdev.osuosl.org, arnd@arndb.de,
        linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        stern@rowland.harvard.edu, jrdr.linux@gmail.com,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Alright sorry, I will ignore this patch and will commit the new patch
in another file.


On Tue, Jul 28, 2020 at 10:28 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 28, 2020 at 10:13:22PM +0530, Dhiraj Sharma wrote:
> > > As the bot said, only do one type of thing per patch, and "fix all
> > > checkpatch errors/warnings" is not one type of thing.
> >
> > So should I send a fresh patch with minimal fixes? instead of replying
> > to this mail with [PATCH 01]
>
> Why are you ignoring what Hans said?
