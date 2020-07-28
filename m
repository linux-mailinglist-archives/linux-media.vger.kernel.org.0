Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262F52309DD
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 14:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgG1MWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 08:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbgG1MWm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 08:22:42 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A15FC061794
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 05:22:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id g6so8273621ljn.11
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TESeuYU5SfzLxBWMQ4kl8vP13Tpf9d4XmBM8Gp63Ao8=;
        b=tWs0cbIEtxsoEEWx87oQK2/AgPlRAXgY0LbgzgRA3ewO5DWL6Fyxb8WS3aulE9/J9C
         X3RsXavLk4qFUAWa4p05w6NqoVN+pucr64IBxtUbfF0Mf29aAXTZyAEJTyX15Z9ovorj
         wQEi4O2bCR8ckUmBIg6mwgpxBnP5IMhwzOd86n02qGgjjYaAjBM79Rn3x2dlCYpTnBqV
         I+UTfpEnvgnzhrgm3JZqje3nsXlj8agQslaPouGHWhmpPABmgolCN9NXsxPDZd1PQh+v
         NGQwfGtgnwr0M3pbpqj4n2+rOU/1w12GWAALbgiFNbUtF3NmRBGZFe+sqUlrg1pbaDHE
         v+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TESeuYU5SfzLxBWMQ4kl8vP13Tpf9d4XmBM8Gp63Ao8=;
        b=KYietagCjCjPSXcWlUUNEhH0H9sXQuQxLFNKTKxof9J9/+OSAOLLZ+URSqvk0XSNyo
         5iNd+LPT8YD2IOB4nXkJFX1RHa1IeYZ9Az2CKld1xAh6tNeD40xNtGEEXtaZ0/l5uowd
         2qDJm8Uye1ODkLWlj36raGYmj1ZrQPMjjeToGqaAgeUHNH28lxPJBqn5zEOtGe0ZhjrD
         4zqzhjPfFJg4U7feoFqKUhRxzgWVGk+kjZRjagTkWetmPko1QLzqKo+n2ZO49WtPVJgL
         K06uzuzsBaJRIlOt2mM+BgRbUbMMK4ro6K3jl5r8xWMVTTq5Z72Up8bKa/XzjTwqs/6V
         UleQ==
X-Gm-Message-State: AOAM532usgkXoaNY2q9+OLVoAnLsRir1Q3SxVsJx1XGJFz9yoxf9/LKJ
        sVOw76Vs18kwriiIZoJti9X6IRT2B+ojTKzjurxARA==
X-Google-Smtp-Source: ABdhPJxFKokBgoeIMtwaFCWZjTjcyuOq58U+G8s0TH2HfjNeeOsLST8x9LgKqX+cy/D0oEkPhul5xgMLR5yLY5nKt8c=
X-Received: by 2002:a2e:90e:: with SMTP id 14mr5500607ljj.293.1595938960755;
 Tue, 28 Jul 2020 05:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com> <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
In-Reply-To: <20200727131608.GD1913@kadam>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jul 2020 14:22:29 +0200
Message-ID: <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Peilin Ye <yepeilin.cs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 3:17 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Here are my latest warnings on linux-next from Friday.

Thanks for sharing this Dan, very interesting findings.

> drivers/gpio/gpiolib-cdev.c:473 lineevent_read() warn: check that 'ge' doesn't leak information (struct has a hole after 'id')

We are revamping the ABI for 64bit compatibility so we are now running
pahole on our stuff. I suppose we need to think about mending this old ABI
as well.

Yours,
Linus Walleij
