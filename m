Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C408361017
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 18:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbhDOQ0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 12:26:42 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:46477 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhDOQ0l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 12:26:41 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id ED7DF240003;
        Thu, 15 Apr 2021 16:26:14 +0000 (UTC)
Date:   Thu, 15 Apr 2021 12:29:18 -0400
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Martiros Shakhzadyan <vrzh@vrzh.net>
Subject: Re: [PATCH] staging: media: atomisp: cleaning up sh_css.c
Message-ID: <YHhp3vfF2KH9nKT0@coplandos.local>
References: <20210415005106.530914-1-vrzh@vrzh.net>
 <e7d21188-3f7e-1b8f-59b0-144713bd918d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7d21188-3f7e-1b8f-59b0-144713bd918d@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 15, 2021 at 03:59:25PM +0200, Hans Verkuil wrote:
> Hi Martiros,
> 
> If you look at other patch series, you'll see that they follow this pattern:
> 
> [PATCH x/y]
> 
> and for the cover letter: [PATCH 0/y]
> 
> It's recommended to follow that rule.
> 
> On 15/04/2021 02:50, Martiros Shakhzadyan wrote:
> > The following set of patches for sh_css.c aims to resolve coding style issues
> > and remove redundancies.
> > 
> > Martiros Shakhzadyan (9):
> >   staging: media: atomisp: [1/6] Fix sh_css.c brace coding style issues
> >   staging: media: atomisp: [2/6] Fix sh_css.c brace coding style issues
> >   staging: media: atomisp: [3/6] Fix sh_css.c brace coding style issues
> >   staging: media: atomisp: [4/6] Fix sh_css.c brace coding style issues
> >   staging: media: atomisp: [5/6] Fix sh_css.c brace coding style issues
> >   staging: media: atomisp: [6/6] Fix sh_css.c brace coding style issues\
> 
> Why split this up in 6 patches? Just combine it in one. It's all the same thing
> for the same source.
> 
> >   staging: media: atomisp: Use goto instead of return in ia_css_init()
> >   staging: media: atomisp: [1/2] Remove redundant assertions in sh_css.c
> >   staging: media: atomisp: [2/2] Remove redundant assertions in sh_css.c
> 
> Ditto for these two.
> 
> Regards,
> 
> 	Hans
> 
Gotcha - will resubmit all following this rule (save for the rejected
patch) - Thanks!
> > 
> >  drivers/staging/media/atomisp/pci/sh_css.c | 266 ++++++++-------------
> >  1 file changed, 105 insertions(+), 161 deletions(-)
> > 
> 
