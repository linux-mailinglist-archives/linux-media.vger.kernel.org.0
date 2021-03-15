Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E7433AF4D
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 10:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhCOJxd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 05:53:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:60212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229519AbhCOJxT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 05:53:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E90364E4D;
        Mon, 15 Mar 2021 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615801998;
        bh=Adv7WCY3jtw6DcCGCX6gz07XcPOuVO8dqHPVb2+n4TI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZYris3PnRLTsU3ECbzPfEAI4aQSn3oAKZKSPAKWwWcZhw1cOlSt4GaLpkORNFhQD0
         y6LNAAzvmG16LSgy10ERqXmiXnpHBTJsoHaCIz3BZxGRSxc9y6OHn9XrdF0PCzQWfp
         jPpNpcQCEYEslvfS/1EhH0EtLHaPuf/Xvsqxp5P3fY329OGBOr3JhUBqfV3w5qUVxc
         sy/I/ZimLU0RxV8oWG1/x37/Cfvx524WB6jyfeZQn913L9i0uRoZ0REjnKDGnVrwx9
         ExXQelLbAQMLr98oeIelz0bSX8yBQ/RvYKDVq1vuV1mkPrhK4jPPpRMXRRn8s+BhL+
         GB4djZHQlIOVg==
Date:   Mon, 15 Mar 2021 10:53:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH] v4l-utils tpg GCC 11 fix
Message-ID: <20210315105315.18e07b09@coco.lan>
In-Reply-To: <8169ff5a-8dba-088b-e3b3-1901246d5aec@googlemail.com>
References: <E1lHUCT-0000OM-9X@paradis.debian.org>
        <CAJxGH0-c4eU0Tpwws+jpvf=_+3hJj-rSroQGb9xuZ5ii-KwR+Q@mail.gmail.com>
        <8169ff5a-8dba-088b-e3b3-1901246d5aec@googlemail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 14 Mar 2021 22:51:41 +0100
Gregor Jasny <gjasny@googlemail.com> escreveu:

> Hello Hans,
> 
> On 04.03.21 17:25, Gregor Jasny wrote:
> > qv4l fails to build with GCC 11:
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=984381 
> > 
> > The reason is that min/max are defined as macros here:
> > https://git.linuxtv.org/v4l-utils.git/tree/utils/common/v4l2-tpg.patch#n200 
> > <https://git.linuxtv.org/v4l-utils.git/tree/utils/common/v4l2-tpg.patch#n200>
> > 
> > should I apply a fix which prefixes the min/max/3 macros with libv4l_?  
> 
> Could you please take a look at the patch below and tell me if I should 
> apply it to v4l-utils master (or of cause, apply it yourself)?
> 
> https://sources.debian.org/patches/v4l-utils/1.20.0-3/fix-gcc-11-ftbfs.diff/

My 2 cents:

I don't like the fix:

	#ifndef libv4l_min
	#define libv4l_min(a,b)	((a) < (b) ? (a) : (b))
	#define libv4l_max(a,b)	((a) > (b) ? (a) : (b))
	#endif /* !libv4l_min */

The #ifndef there is useless, as no other includes should ever
add it.

The culprit here is that the headers are expecting max() and
min() to be a macro, but on the build, it is using std::min and
std::max functions instead.

As v4l2-ctl-common.cpp has:

	#include <algorithm>

This causes a problem.

IMHO, the right solution would be to move the #include 
for it to be at utils/common/v4l2-tpg.h, and replace
min/max by std::min/std::max at the headers.

Thanks,
Mauro
