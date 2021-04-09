Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C15D35A5B6
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 20:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234464AbhDIS01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 14:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhDIS00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 14:26:26 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956C6C061762;
        Fri,  9 Apr 2021 11:26:13 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id q26so6775826qkm.6;
        Fri, 09 Apr 2021 11:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=c+DbAEwm0zRiHXUbKphWseVw53MsK9wYkvb3a3fbewM=;
        b=lXeEtyAca43iGOTwSlP0zw5k6vVxMpXPwmtkGVDHceQMVS6ieis3frq9h8IaSRBVi4
         2fPmzKe50P9tL4LZA4G0mPxKCfeNvB5MVpF9N7e4csTMTMvKmEhlxYf+c+wSoSgtRaV/
         b7jMt/2yBfclVcmch4A+aLHf/jvI/AkE581hPmZzCKOoipBUUeztXGF8eblCYRxeVIZ6
         6yXk5qSSz5IIPw9uqF8XbCXiM1mmHVvzddUzAZU5mLgnhrB+DZWUVyj5ebVhi64mKm4F
         PkvZp3sp1e5tIWUQyisrGsJYrt82lBJxkLF6XLr7bGqhmiq7nquccTCuzo7KNXkmQhrl
         VLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=c+DbAEwm0zRiHXUbKphWseVw53MsK9wYkvb3a3fbewM=;
        b=V7PYq8rGX52OQ6EVNXAW1rhR+cMOpl2gigRHziXMV4oyo27tV3EosMnpp5HMSh1xCR
         aPQrdQYTKHMAav7Sd7xMAfDb1AdYBdEaAafCjozc3DNwIjkvCh1lRQQT+Hdn0oJr8PYE
         nrg/zkoph4QyZVT0IHFyyVx+e1WlUPb/GT1/qynzSGAuSuHH7cfDiMtP+c0eoq3ubgfk
         xie0nUTBoz6g6NdxzTFVgct/pP0nKV5LW+veMu4SSVaVz2Ego4EDd/joOgGiiZbxuqLA
         7UicWMmLq11lr4Uaelp445k4gM4oTZarIhrNXi4KZ8x/p7wvhg2sFjkGkosZzx/tOLvI
         KRRw==
X-Gm-Message-State: AOAM530MmvdWeXTBkCCWL9lmZebsHIrgG52oB9kxB/y5eJxvTi473cZY
        Ebd3xZzolS2NYw3xXiUfKtwsoll3uVZC9uaW
X-Google-Smtp-Source: ABdhPJxbIXjazCV7IMjXK4LTzgF0mrELA4f2g4oXayX59ZrQRRbJ1g7LgpoLPbX74QMzNDLHlmM3oQ==
X-Received: by 2002:a05:620a:13ac:: with SMTP id m12mr15181568qki.458.1617992772882;
        Fri, 09 Apr 2021 11:26:12 -0700 (PDT)
Received: from [192.168.100.7] ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id d190sm1058319qkf.103.2021.04.09.11.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:26:12 -0700 (PDT)
Message-ID: <aff7af9caab6fab8ec2c7ee0980669323b449aa9.camel@gmail.com>
Subject: Re: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Julia Lawall <julia.lawall@inria.fr>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Fri, 09 Apr 2021 15:26:08 -0300
In-Reply-To: <532a72f6fcb6f51451e12444413c0ad4441a679d.camel@collabora.com>
References: <20210409135404.GA26172@focaruja>
         <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com>
         <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
         <alpine.DEB.2.22.394.2104091924510.17316@hadrien>
         <532a72f6fcb6f51451e12444413c0ad4441a679d.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em sex, 2021-04-09 às 14:42 -0300, Ezequiel Garcia escreveu:
> On Fri, 2021-04-09 at 19:25 +0200, Julia Lawall wrote:
> > 
> > 
> > On Fri, 9 Apr 2021, ascordeiro wrote:
> > 
> > > Em sex, 2021-04-09 às 13:44 -0300, Ezequiel Garcia escreveu:
> > > > Hi Aline,
> > > 
> > > Hi Ezequiel,
> > > > 
> > > > On Fri, 2021-04-09 at 10:54 -0300, Aline Santana Cordeiro
> > > > wrote:
> > > > > Rewrite macros resembling functions #define
> > > > > HANTRO_PP_REG_WRITE
> > > > > and #define HANTRO_PP_RED_WRITE_S in lower case, according
> > > > > with
> > > > > code style.
> > 
> > Maybe you can see if these macros can be converted to static inline
> > functions.  Macros don't provide any type checking.
> > 
> 
> I'd like to leave these as they are for now, tbh ^_^
> 
> A more massive refactoring is needed in this driver,
> but it needs proper testing and it's a more complex plan.

Okay, thank you for your attention :)

Aline

> 
> Thanks!
> Ezequiel
> 


