Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6947C55A0
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 15:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbjJKNk2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 09:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbjJKNk1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 09:40:27 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F419E
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 06:40:25 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B7FDF10005E; Wed, 11 Oct 2023 14:40:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1697031622; bh=8pURyj9slli2rRbBHEiAYnNMPKrTxJHxIqSD8aJ//NI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K2gT3+wNpLPvhzu9lati22QQoE1Deqyqzj18lFQdK2GK7FpXPLUkXYVZ/ZNoAlXjm
         ZAW1cngaILxURvGlhBDo6ouMeKBoilJMlQ6m+95oiQSPMUT+hTUfZNlsveTmPxmVFp
         XL7vxlUEos3pERfkS75POq2dKA5V2czq5Gh7FBe5047O9NSHXHnzfwxMUbcNfjqbpg
         vHEnwr+pTVGOgMbE4wNj7+vMdyOE2cS1O+LLs9O5maMnL2pl/2ocza3b6qSF0djsrS
         YZo91ZsRwJmyftOsjnw43Bwl/hU9nmZ556hQsfDTGVvEUd0G9+nwLkG9LrNFCkOSD3
         JTuZJixvggNaQ==
Date:   Wed, 11 Oct 2023 14:40:22 +0100
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v6.7] Minor rc fixes
Message-ID: <ZSalxiDPtztvdW0x@gofer.mess.org>
References: <ZSOux5a0d0tu9FtE@gofer.mess.org>
 <3faae6db-140a-4eb0-a72e-4d2a82e281ec@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3faae6db-140a-4eb0-a72e-4d2a82e281ec@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 11, 2023 at 02:58:19PM +0200, Hans Verkuil wrote:
> On 09/10/2023 09:41, Sean Young wrote:
> > The following changes since commit 73835b514160dc548f7d77c6cd7fe6a8629d3406:
> > 
> >   media: imon: fix access to invalid resource for the second interface (2023-10-07 10:55:48 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/syoung/media_tree.git tags/v6.7c
> > 
> > for you to fetch changes up to faf2b9954d9c9fdbac48e4b1d45d5ba2d3f10e52:
> > 
> >   media: lirc: drop trailing space from scancode transmit (2023-10-09 08:22:14 +0100)
> > 
> > ----------------------------------------------------------------
> > v6.7c
> > 
> > ----------------------------------------------------------------
> > Sean Young (2):
> >       media: sharp: fix sharp encoding
> >       media: lirc: drop trailing space from scancode transmit
> > 
> >  drivers/media/rc/ir-sharp-decoder.c | 8 +++++---
> >  drivers/media/rc/lirc_dev.c         | 6 +++++-
> >  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> These two patches have a Cc to stable, but no Fixes: tag.

I've added the fixes tags and retagged the v6.7c tag in my repo.

> Can you provide Fixes tags for these two patches? I can add them
> manually.

I should have fully read your message before retagging, my bad. What do
you want me to do now? The patches haven't changed, just the commit
messages.


Sean
