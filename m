Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF258683A
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 19:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732327AbfHHRku (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 13:40:50 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44326 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730291AbfHHRku (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 13:40:50 -0400
Received: by mail-lf1-f67.google.com with SMTP id v16so13602458lfg.11
        for <linux-media@vger.kernel.org>; Thu, 08 Aug 2019 10:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tkt+lgTcRQkmSxLmFiGRLV1e/Czil9zvKfrfyoehvrk=;
        b=CtiKszUhPw7CM6bkf7cDm5JvKT+tQOxUqgCRqHWCbysQd/lrscToLDfvNokY+sgADz
         O33XNu27xYMhy1j6ZE1c0RCpmUEj0yxeIEyySDDyy5gAr/er2H2Yhx/T087GdgxZDnhH
         FVV0UnkKErs5BI76pHKBvHTCr4KnGxvWhXXyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tkt+lgTcRQkmSxLmFiGRLV1e/Czil9zvKfrfyoehvrk=;
        b=N0Oz9vwMSMD6XIC9kq8jI9YA8LuhRdvd/r3FjeTArUo15Fm6S8hP4zEhFo+hGxX34v
         8ZxdvXs2Q2awc/ztgsVX/mJ3t3qnDMJsc540cMuGuAK1AcKUpfmRrO486y5bdrSiAyfz
         EYJVt93GbDSlHsM5gbIfHLeFhpOpKNINu6hbsCzQuWPMij8Ms3x3p3YGaQxWCB4tgPa3
         2yXySUPoASFKJEZ08IKcs9MkbW9+QgbSEChelDM/JhrL6KlkNMuxgGtJoOIpgqTxOt+h
         2EQG/u6SFpfSVKVVossW6Re8SeP+0yhPrRhah+zqwZN/a757y0NC0KVZcjTMc/TPQqxV
         ljiA==
X-Gm-Message-State: APjAAAVZASrwmp+r+4seVcAS8aACJ2MAWeJ9+7qdiXZLBl407sZ4ZUNY
        r8jQjFbebjIeL7q7rTB9UKyav4UjUKY=
X-Google-Smtp-Source: APXvYqwqT2FmfGuWHes9rgFhZLkaDSh7eOjYOJN9IF0GQYzU8u0UnMj9nJloJd9y2fP7pWHsCsCJ/Q==
X-Received: by 2002:a19:6041:: with SMTP id p1mr10139350lfk.6.1565286047497;
        Thu, 08 Aug 2019 10:40:47 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id u18sm16912101lfe.65.2019.08.08.10.40.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 10:40:46 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id d24so89650007ljg.8
        for <linux-media@vger.kernel.org>; Thu, 08 Aug 2019 10:40:46 -0700 (PDT)
X-Received: by 2002:a2e:9bc6:: with SMTP id w6mr9102579ljj.156.1565286046249;
 Thu, 08 Aug 2019 10:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190808123943.1551193d@coco.lan>
In-Reply-To: <20190808123943.1551193d@coco.lan>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 8 Aug 2019 10:40:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=whYYTiBOtzh2qh5KO7Mwh5cXkQEXnhD0b+zJ4J-WmEVDw@mail.gmail.com>
Message-ID: <CAHk-=whYYTiBOtzh2qh5KO7Mwh5cXkQEXnhD0b+zJ4J-WmEVDw@mail.gmail.com>
Subject: Re: [GIT PULL for v5.3-rc4] media fixes
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 8, 2019 at 8:39 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Please pull from:
>   git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media media/v5.3-2
>
> For a fix at the vivid CEC support.

There's no vivid CEC fix there, and you already asked me to pull that
tag two weeks ago, and it was merged in Jul 22 (merge commit
c92f0380673b).

I _suspect_ that you meant for me to pull a media/v5.3-3 tag, but no
such tag exists. There is a v4l_for_linus branch that has the commit
you point to, but no actual signed tag anywhere.

Normally I'd think you forgot to push out, but with the wrong
tag-name, there's something else going on too.

                 Linus
