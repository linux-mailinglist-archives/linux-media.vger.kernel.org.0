Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C4B98ED1
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 11:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732973AbfHVJKF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 05:10:05 -0400
Received: from gofer.mess.org ([88.97.38.141]:45139 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732969AbfHVJKE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 05:10:04 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C9931603F6; Thu, 22 Aug 2019 10:10:02 +0100 (BST)
Date:   Thu, 22 Aug 2019 10:10:02 +0100
From:   Sean Young <sean@mess.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Brad Love <brad@nextdimension.cc>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v4] media: si2168: Refactor command setup code
Message-ID: <20190822091002.7v7slkrilwfz3d3c@gofer.mess.org>
References: <06171488-7530-d4e4-1b94-f82905ed383d@free.fr>
 <499bea86-f483-f776-4512-510c5df9d78f@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <499bea86-f483-f776-4512-510c5df9d78f@free.fr>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 19, 2019 at 01:54:53PM +0200, Marc Gonzalez wrote:
> On 15/07/2019 11:50, Marc Gonzalez wrote:
> 
> > Use cmd_init() to fill a struct si2168_cmd command.
> > 
> > Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > ---
> > Changes from v1:
> > - Use a real function to populate struct si2168_cmd *cmd, and a trivial
> > macro wrapping it (macro because sizeof).
> > Changes from v2:
> > - Fix header mess
> > - Add Jonathan's tag
> > Changes from v3:
> > - Drop Jonathan's tag after rewrite
> > - Completely drop macro, and explicitly provide 'wlen' argument
> > ---
> >  drivers/media/dvb-frontends/si2168.c | 152 ++++++++-------------------
> >  1 file changed, 44 insertions(+), 108 deletions(-)
> 
> Brad, Sean, Antti,
> 
> I believe this patch is good to go. Is anything still wrong with it?

It's been accepted:

https://git.linuxtv.org/media_tree.git/commit/?id=619f6fc390909fce3247c3e07e6882b868b645da

Thanks,

Sean
