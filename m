Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7145735A4D0
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 19:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbhDIRm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 13:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbhDIRm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 13:42:29 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F566C061761;
        Fri,  9 Apr 2021 10:42:16 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9377B1F469A9
Message-ID: <532a72f6fcb6f51451e12444413c0ad4441a679d.camel@collabora.com>
Subject: Re: [Outreachy kernel][PATCH] staging: media: hantro: Rewrite macro
 function in lower case
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Julia Lawall <julia.lawall@inria.fr>,
        ascordeiro <alinesantanacordeiro@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Fri, 09 Apr 2021 14:42:02 -0300
In-Reply-To: <alpine.DEB.2.22.394.2104091924510.17316@hadrien>
References: <20210409135404.GA26172@focaruja>
          <9c09806cce4c7e5c5f0dc03e8c502cf29716f00f.camel@collabora.com>
         <138794d79c42510d9b6ae744df20216904773032.camel@gmail.com>
         <alpine.DEB.2.22.394.2104091924510.17316@hadrien>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-04-09 at 19:25 +0200, Julia Lawall wrote:
> 
> 
> On Fri, 9 Apr 2021, ascordeiro wrote:
> 
> > Em sex, 2021-04-09 às 13:44 -0300, Ezequiel Garcia escreveu:
> > > Hi Aline,
> > 
> > Hi Ezequiel,
> > > 
> > > On Fri, 2021-04-09 at 10:54 -0300, Aline Santana Cordeiro wrote:
> > > > Rewrite macros resembling functions #define HANTRO_PP_REG_WRITE
> > > > and #define HANTRO_PP_RED_WRITE_S in lower case, according with
> > > > code style.
> 
> Maybe you can see if these macros can be converted to static inline
> functions.  Macros don't provide any type checking.
> 

I'd like to leave these as they are for now, tbh ^_^

A more massive refactoring is needed in this driver,
but it needs proper testing and it's a more complex plan.

Thanks!
Ezequiel

