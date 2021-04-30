Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECC1370422
	for <lists+linux-media@lfdr.de>; Sat,  1 May 2021 01:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhD3XiM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 19:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhD3XiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 19:38:11 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C875DC06174A
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 16:37:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x2so6632569lff.10
        for <linux-media@vger.kernel.org>; Fri, 30 Apr 2021 16:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=h6jmTahhOXkt9FPExUK+c60K/g6rBslabSTQ1lDFwaQ=;
        b=fe2ghiIRfO6QBGvx1p4ZVETJzTqORMw/qsBL0KGXbEJXDr+TWSU8TtKqusaY0Wu3JV
         IfamRgZCsfXhWTzDnbs9I06T2BjGc82oQldKFVSj6N9p6iU7lnJmQmdF/QLnnZDOdr/0
         kfd4UmkvHmq+g99Twc237EEcqDJy0+8H745aTElJbRWn3MsRyqpifKJsj4wCmoyEO8Sb
         UuzRwK4vDXRPTbXx1pNGsSBahHoOBCtQMnq60ZIEnSSrb3uMntEAE9zAKNDUmT+VTGo4
         rBv6G6KBzWY6dFKf0WVgPyKfsyQEiNbqjbfDWIWGRpvWXKj8Sc+omRyLwnMGx8xeVg7i
         PPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=h6jmTahhOXkt9FPExUK+c60K/g6rBslabSTQ1lDFwaQ=;
        b=ZKDhitU9ggkOSMeMs31PrFoZt/J2QSKWNwIyXeSWNHlQ9c9SwSPJekGFRZTRb9ZJpz
         BrzNhdVzrDQX29zWWV2T37CHoO+hXsv+71y4JEIHQVQnt7CNRuY3B4KvUzSR2PgCflZl
         Ok1CbBQSbMu8KpVK04il5vXHRYBVC21WLsUR8lq4eTevZyjaPoFaNp1reQihJtp+rEDK
         gdPZbG15S2z2Lq/LqdACh0tkcjNWzsj4RtoNAttlfkm7il+hIxMwZpXlOdF+K+2kHDfV
         hydct0FrnF4uG+SmvbnCvZ2NZpclRWdm5sYL0rDLeuts21lsrEuZDtsBMB9gnlSCHA1w
         RRsw==
X-Gm-Message-State: AOAM5320a16jOjdMG6yykJxbEQpLxjXZv5zFMLCThcZ63pHqYeh0La1+
        VxQzsvK+vQHw0w21AAAVSHswsqEXmw2D9rX19fYNJsPODCo=
X-Google-Smtp-Source: ABdhPJwnQ2epwGHwsAQiYntUgMgyDE+II9wCmtS60NPUaRnoKIPTctNBdviel1IlN02w01bs+BvYV6FexmO+wC36zJg=
X-Received: by 2002:ac2:4c82:: with SMTP id d2mr4922651lfl.212.1619825841235;
 Fri, 30 Apr 2021 16:37:21 -0700 (PDT)
MIME-Version: 1.0
From:   Chris McCrae <chrismccraeworks@gmail.com>
Date:   Fri, 30 Apr 2021 19:37:10 -0400
Message-ID: <CAN2W0iNOsa6GYK28Vz=DmkyjY72H_bq=8EUkzFuy0_p9ZVms4A@mail.gmail.com>
Subject: Asus PN62S vs PN50 - ITE8708
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Long time stalker, first time caller, so go easy please :-)  (I've
already learned I need to use plain text mode ... what's next?)

Recently acquired an Asus PN62S (Intel) as a media centre frontend
(currently testing with Xubuntu 20.04 and a 5.10 kernel, and the most
current BIOS available).  Having an integrated IR was part of the
selling features.  However, getting it to be recognized by my system
has become a challenge that I am getting obsessed with.  There's very
little to find online on this device that is current, but there has
been some recent conversation on this list about the same device, on a
related machine, the PN50 (AMD).  I'm hoping that the knowledge here
may lead to a solution for my issue.

I can provide more detail on request, but at the moment I am focusing
on the DSDT as a possible suspect.  I do not have the 16 byte issue
that the PN50 experiences.  Mine is defined as 8 bytes, which is
compatible with the ite-cir driver.  My issue is that there appears to
be no attempt to bind the device to the driver (but it is visible in
lsmod)... no messages about the driver in dmesg at all.  My thought is
that the definition of the device in DSDT may somehow give it enough
information (ITE8708) to know the driver could be needed, but not the
correct information to make it work.

An earlier message provided only part of the device definition in DSDT
for the PN50.  I would like to be able to see the full definition for
it from the PN50, to see if anything is significantly different.
Ideally, if I had the full DSDT as a starting point, I could compare
other areas such as motherboard resources.

I have learned a lot about ACPI lately, and am continuing to learn.
In the end, ACPI may have nothing to do with my problem.  If anyone
has other suggestions as to where an issue might originate, I'm ready
to look there too (like when does the kernel make the decision to bind
or not).  I've used acpi.debug_layer and debug_level options, tested
with fwts, recompiled kernels and drivers with patches, rebuilt the
DSDT to force some parameters, installed Windows 10 and confirmed
things actually work, and probably a few other things I can't
remember.

Any help is appreciated.

Chris
