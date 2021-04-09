Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6403035A4B9
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 19:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234133AbhDIRgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 13:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbhDIRgn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 13:36:43 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402A5C061761;
        Fri,  9 Apr 2021 10:36:30 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id j3so3060483qvs.1;
        Fri, 09 Apr 2021 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iaFkKzWMamTzdA9WJNo3nuUtl8TLuaeVqvjAOEZQMfY=;
        b=idsyB02cFc5uHVLFZz/dNjbR3BcMiU/iIUqaPb7PstrPwbVW+QI77u9DF8T0syEnpf
         2V/sl/8UYJHTTXMRYvr39I7Z57DefYfLSeVcOUI6qAXT8gEfuiyVAIGvLZ5MGX+oJCvo
         a5NVRRM1OJWfDltXbCzN53Es2d7mvlSMKfYWaIx9A/Os0VqxcChfMBpZ4y2pgsXfOduF
         hEEwLEfh2hElGoXmsAFBdyteM5/rMuTXs8FMzS8ZphTHu9mhKNQWKZjwGM/RlPuHY28t
         FpSXE/e1PSULso1Z1TxZzfxdpZhcmpaEsh0DgN/gZNLrBqEY/Mi4GGHiMxUyTfoiZHVo
         5jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iaFkKzWMamTzdA9WJNo3nuUtl8TLuaeVqvjAOEZQMfY=;
        b=MXLgUdspBrAoePdgbJrWJYzsWOX7UuyD3yDqlFgZpMrsI79celBnnpKkM87WbEvBMI
         q7aHKNnSlnoaW9InNCQCrwDgzGUnRGk+kXNaaxsTjpcXlU4VGXKfu1SYReABqTZSEWB5
         zHfuclM7c/3TFA977Wxd6uXzrV5esJGrv2v2mdp9fMGJtbcqUY3k1gLabdDVMj/j2vEL
         swXBSFqL8Zum1L7meKpDOQSq+VgsWQuQl9wYyWOCtXOsOiIiUyuP9biV90xdmqTXo45s
         0mXIVvZBdTq3OaenwUbZMkEeug78qiF4EEDjGjsiai7+Mnei1RPNiXWq4wbieeNzzwXB
         df+g==
X-Gm-Message-State: AOAM530vpr2zI6WXVvThxmmpCYpoDzDZNbEyfc7BgaDPMzRXcwPVv62i
        yP9GTrmM6CxKNjaF/koIt9k=
X-Google-Smtp-Source: ABdhPJwR4sJ9wsj0+ipygYICMcMViHTwd5+mt6N3j49V1XJ0VCxQKwKPOaPGU93iRa8qsw/WXkHyHQ==
X-Received: by 2002:a05:6214:1081:: with SMTP id o1mr14885607qvr.11.1617989789596;
        Fri, 09 Apr 2021 10:36:29 -0700 (PDT)
Received: from [192.168.100.7] ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id n15sm2092540qkk.109.2021.04.09.10.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 10:36:29 -0700 (PDT)
Message-ID: <34466470c14123542af3b8e0ced80425ea3afec8.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Fri, 09 Apr 2021 14:36:25 -0300
In-Reply-To: <88e48e7bb5679b913e3f223d29b566ce8c18e9c3.camel@collabora.com>
References: <20210409135404.GA26172@focaruja>
         <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com>
         <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
         <88e48e7bb5679b913e3f223d29b566ce8c18e9c3.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em sex, 2021-04-09 às 14:15 -0300, Ezequiel Garcia escreveu:
> On Fri, 2021-04-09 at 14:00 -0300, ascordeiro wrote:
> > Em sex, 2021-04-09 às 13:44 -0300, Ezequiel Garcia escreveu:
> > > Hi Aline,
> > 
> > Hi Ezequiel,
> > > 
> > > On Fri, 2021-04-09 at 10:54 -0300, Aline Santana Cordeiro wrote:
> > > > Rewrite macros resembling functions #define HANTRO_PP_REG_WRITE
> > > > and #define HANTRO_PP_RED_WRITE_S in lower case, according with
> > > > code style.
> > > > 
> > > 
> > > Where is this written in the Coding Style?
> > 
> > I found this in section 12, about Macros, Enums and RTL in both
> > references:
> > https://www.kernel.org/doc/html/latest/process/coding-style.html
> > https://elixir.bootlin.com/linux/latest/source/Documentation/process/coding-style.rst
> 
> It seems this
> 
> """
> CAPITALIZED macro names are appreciated but macros resembling
> functions may be named in lower case.
> """
> 
> It's just a suggestion, not a big deal. In general, if checkpatch.pl
> is not complaining, it's not worth the trouble.
> 
> So let's skip this fix.
Okay! I'm going to check different problems with the checkpatch.pl
> 
> Thanks a lot!
> Ezequiel
> 
Thank you!
Aline

