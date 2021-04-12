Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49EF535CF94
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 19:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243907AbhDLRkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 13:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238649AbhDLRkV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 13:40:21 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A59BC061574;
        Mon, 12 Apr 2021 10:40:03 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c123so10247143qke.1;
        Mon, 12 Apr 2021 10:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iHFqjFCRbV77geF1NfusgD5m4a0gjV5MYV0QS53h8i8=;
        b=KOqc3a1bNp8/Hs41BsrMrrQ8Kyer4kA12jgbjBEKZh5rzx4lDzkVAF7YCobsN1c9fR
         VXHmAY+FQcMskTdOKlsGF32JJ1fkKnLTrkChYYJW2JfBH6kScW1zUOrl16P35sT7Im8E
         8qXOy0E5xNA2LanIUcx0JkZ8nCOend0LPtrK/G7WdAy7cqJU5K8L47w1/ELoJjvYG3Qa
         YCTl8z6s2tCAe6Q+NnJp4jeuv1tNbzBSMBS7iltqvTbylO+SVqnPlztC0Hhmy+0fuAtP
         qytQkVV+6nybDpv+SaFiHgrrDc+26zyHfGe0/yYw989WNofcTiR2v7wKQAj1uOc96O/V
         7D+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iHFqjFCRbV77geF1NfusgD5m4a0gjV5MYV0QS53h8i8=;
        b=nRdwiEJcwPffwdiAQofaMRlW+IezLfRE/PQ5WkCWL/YbfIfOWYipqGuUQjM0aOA58q
         Chhfd5Gy+cSq+40OhZonYjjknh4QVZ72skoWSkIeIzXSLWyOKxHKi7lchdAy2hcJB2O1
         9k5A/2cFxbOspfph1iR74ktf7hhAxm5j2B/pRq+oOXt1kK6egTG5mEV4FRMhCGuLnh/p
         12IZYnQMEYbvIx3OeWmRBXHQIF1LUEAX39X2imLigTzBiCe5l+WhgXuw+KPu/Me9iHvc
         2WZcvEIahafptYBcTP4OdaDNWGZzTRY7tYtAxG4ubZMCUSxbcOdONTtd5MdDmDCbzZRp
         rkQQ==
X-Gm-Message-State: AOAM533CK35J8mXJ+mS//I0IiOce0Z6Yje/P+RxVNeZhDVUFVCzL0UDB
        B3i6SIRoS5k0YYlcRGEiNUk=
X-Google-Smtp-Source: ABdhPJy1fojLalaL/ckKGfFP68UfWntnQL/g+7TYjjdzqNuyqH0vzUY7jbc/9nDyia3Zp/Xxclx35w==
X-Received: by 2002:a05:620a:1645:: with SMTP id c5mr27581347qko.63.1618249202608;
        Mon, 12 Apr 2021 10:40:02 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:29a:1b49:fcb:5776? ([2001:1284:f016:a037:29a:1b49:fcb:5776])
        by smtp.gmail.com with ESMTPSA id h7sm4597183qtj.15.2021.04.12.10.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 10:40:02 -0700 (PDT)
Message-ID: <53dad29aee8925b3377d48b4c97b06ba6d05de43.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH 1/4 v2] staging: media: omap4iss:
 Replace macro function by static inline function in file iss.c
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Mon, 12 Apr 2021 14:39:58 -0300
In-Reply-To: <alpine.DEB.2.22.394.2104121935590.19780@hadrien>
References: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
          <e302566a3d9e5180ab27eb2c2824fd1b678a6d99.1618231618.git.alinesantanacordeiro@gmail.com>
          <YHRNzq3h3LEp3Dgc@pendragon.ideasonboard.com>
          <7457fd4eb5afbf66b3a6f2fed4dd1e440e6ed422.camel@gmail.com>
         <YHRjPpMVVrhTF7Tc@pendragon.ideasonboard.com>
         <babb019f0950cf11857a4bcf20a572f2eace1777.camel@gmail.com>
         <alpine.DEB.2.22.394.2104121935590.19780@hadrien>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em seg, 2021-04-12 às 19:36 +0200, Julia Lawall escreveu:
> 
> 
> On Mon, 12 Apr 2021, ascordeiro wrote:
> 
> > Em seg, 2021-04-12 às 18:11 +0300, Laurent Pinchart escreveu:
> > > Hi Aline,
> > > 
> > > On Mon, Apr 12, 2021 at 10:58:45AM -0300, ascordeiro wrote:
> > > > Em seg, 2021-04-12 às 16:40 +0300, Laurent Pinchart escreveu:
> > > > > While testing on a device isn't a requirement as you can't be
> > > > > expected
> > > > > to have the necessary hardware, changes are expected to be at
> > > > > least
> > > > > compile-tested before being submitted.
> > > > 
> > > > Hi Laurent,
> > > > 
> > > > I thought recompiling the kernel would be enough in this case.
> > > > I recompiled it in native Ubuntu 16.04 without errors.
> > > 
> > > Did it compile the driver you modified ?
> > > 
> > I'm sorry, It didn't. I forgot to enable the option to compile the
> > driver as a module in "make menuconfig" and now I'm seeing the
> > problems
> > I generated.
> 
> You can easily compile a single file using make path/foo.o and a
> single
> directory using make path/.
> 
> julia

Ok! I'll do that from now on.

Thank you for the help,
Aline

