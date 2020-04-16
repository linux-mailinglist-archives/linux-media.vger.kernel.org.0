Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4766C1ABABC
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 10:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439948AbgDPIBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 04:01:55 -0400
Received: from gofer.mess.org ([88.97.38.141]:59437 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439931AbgDPIBy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 04:01:54 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 4D47F11A002; Thu, 16 Apr 2020 09:01:52 +0100 (BST)
Date:   Thu, 16 Apr 2020 09:01:52 +0100
From:   Sean Young <sean@mess.org>
To:     Rosen Penev <rosenp@gmail.com>
Cc:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: Re: [RFC PATCH v2 1/1] Add support for meson building
Message-ID: <20200416080152.GA12736@gofer.mess.org>
References: <20200408195611.55421-1-ariel@vanguardiasur.com.ar>
 <20200408195611.55421-2-ariel@vanguardiasur.com.ar>
 <CAKxU2N9CN6N3p5kfpzhkpX0PWD=5ogr14qcPQ_p5qprm0z98=A@mail.gmail.com>
 <CAKxU2N_fTJ7gzLov3AsTPrCVB3xbXoJa6fuSqRvPxVa60V_+zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKxU2N_fTJ7gzLov3AsTPrCVB3xbXoJa6fuSqRvPxVa60V_+zQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 15, 2020 at 04:34:08PM -0700, Rosen Penev wrote:
> On Fri, Apr 10, 2020 at 5:28 PM Rosen Penev <rosenp@gmail.com> wrote:
> >
> > On Wed, Apr 8, 2020 at 1:42 PM Ariel D'Alessandro
> > <ariel@vanguardiasur.com.ar> wrote:
> > >
> > > Currently supports building libraries and tools found in lib/ and
> > > utils/ directories.
> > Excellent. This will make it easier to run the code against static
> > code analyzers.
> This is worse than I thought. v4l-utils fails to compile with clang
> (and by extension clang-tidy as it uses nested functions.

That's down to some code I wrote. I was hoping clang was going to add
nested function support at some point, but they haven't. 

I've just sent a patch to the list removing the nested functions from
v4l-utils. I don't think the code is improved by this, but I think being
able to build with clang takes precendence.


Sean
