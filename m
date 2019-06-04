Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4428F345F4
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfFDLyj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:54:39 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33261 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfFDLyj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 07:54:39 -0400
Received: by mail-qk1-f193.google.com with SMTP id r6so2600499qkc.0;
        Tue, 04 Jun 2019 04:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l7u7zcpebtQqDAFBJ4GQV49RycFqTe6brbuYMnPGWBc=;
        b=DXo0nYcM2Cf6bxKIp3lSvnMG0SnLtBEh7fGpjoHNDWN/3oUiB/q7BXsmO6LG0+IUlL
         tNG6w6OdkAoNB6htxhVmum9Vh+dT1DqrcZ5IaVW4RuxcnGN4jhelJgaQPX+5JG67PPXi
         tj8rt5Gy7TWGi5+QWpS03rZ7qc5MopF32Iv2kI0kzbsmNnXPJWm+I2h1JVbdAw9PHbjk
         FYhHFRWjuHXBVvJa6bQYshNzDT342d7nUEcfZ7RFvcQ00qwHlMU9jfdjRr/s+eac1KuV
         nK/mpiRQTpG6+Gt1VdBv2qlzOjaNBXZavu+3C9gK2cfrLAFE9c4vuXbGW3ZNg9uwiU2X
         y2Dw==
X-Gm-Message-State: APjAAAVP+EQj0x+wZg/3pO37j5pQB/xO+ySAPZ1mBO3J0iL7ePNgQ/0e
        vqI1llYTrl4u1CdcD7L1DykRvhsAdoX6LBfsk9k=
X-Google-Smtp-Source: APXvYqzIzX1IhiJLP1fnowJhpYd+xc9lAbqTr/l91wUmVLpDG7g8w8gOBLlNhwyMN0IgwwBrPtxjBBeNtoXvVw93HkY=
X-Received: by 2002:a37:a4d3:: with SMTP id n202mr26081936qke.84.1559649277706;
 Tue, 04 Jun 2019 04:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190604111334.22182-1-yamada.masahiro@socionext.com> <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
In-Reply-To: <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 4 Jun 2019 13:54:21 +0200
Message-ID: <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
To:     Joe Perches <joe@perches.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 4, 2019 at 1:23 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2019-06-04 at 20:13 +0900, Masahiro Yamada wrote:
> > On the other hand, uapi headers are written in more strict C, where
> > the C++ comment style is forbidden.
>
> Is this a real problem for any toolchain?

There is likely some code that is built with -Wpedandic -Werror --std=c89
or similar. Since glibc allows this combination for its own headers, it seems
best to also allow it in kernel headers that may be included by libc headers
or by applications, at least where it does not hurt.

Realistically though, we probably assume c99 or gnu89 in user space
headers anyway, since there is no 'long long' in earlier standards.

       Arnd
