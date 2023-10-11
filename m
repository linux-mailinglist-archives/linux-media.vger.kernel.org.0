Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B93317C57BD
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 17:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235072AbjJKPGL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 11:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232596AbjJKPGJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 11:06:09 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C476490
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 08:06:07 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7C1E010005E; Wed, 11 Oct 2023 16:06:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1697036766; bh=AKBpUuV/CswgxDImvqSgAOm21vT7amwFf2TcGOM1N7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hqPiFisS8LMVecKK5iQIKsthGB4pLGLRbQTLO3qi8y6kC6DnliOdol1mW81QwOFj4
         SIN5YJSlGNqT2iuKINhaC06XoEqcSOb0lHjpzk7wEZxD49spdJPmOPbBdkiHZKtdNv
         QyIOoiXSZNVGnGLwZbc7SsW87gQx4Y9QGDpMrjF0T49C/S4wSaGfUFIF5ifSFtnoHL
         rk5qg1zEug0wvFhlZNCaX7ZUBgsaqN9nXnjHBCp/6xcQPtI1Yp1r87nQ5bWdhY0HPG
         PdsQbjlPUB5u3kjaK3S+oztEa7k0//m5pj1ES17+d/u3XIYZo9HZ+wlp3DHqh5tMGg
         bEE1qYcVR48tg==
Date:   Wed, 11 Oct 2023 16:06:06 +0100
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v6.7] Minor rc fixes
Message-ID: <ZSa53p/oS3Aqml5m@gofer.mess.org>
References: <ZSOux5a0d0tu9FtE@gofer.mess.org>
 <3faae6db-140a-4eb0-a72e-4d2a82e281ec@xs4all.nl>
 <ZSalxiDPtztvdW0x@gofer.mess.org>
 <d556ab48-b4a4-4699-ba8a-8cb5700f2eec@xs4all.nl>
 <ZSa22E0RLQmWxR9X@gofer.mess.org>
 <53ef5a98-b855-4440-b9ed-35adaaf8748c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53ef5a98-b855-4440-b9ed-35adaaf8748c@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 11, 2023 at 04:55:54PM +0200, Hans Verkuil wrote:
> On 11/10/2023 16:53, Sean Young wrote:
> > On Wed, Oct 11, 2023 at 03:51:29PM +0200, Hans Verkuil wrote:
> >> On 11/10/2023 15:40, Sean Young wrote:
> >>> On Wed, Oct 11, 2023 at 02:58:19PM +0200, Hans Verkuil wrote:
> >>>> On 09/10/2023 09:41, Sean Young wrote:
> >>>> These two patches have a Cc to stable, but no Fixes: tag.
> >>>
> >>> I've added the fixes tags and retagged the v6.7c tag in my repo.
> >>
> >> I'll pick it up from your repo again. No need to do anything.
> > 
> > Thanks.
> > 
> > If we have rules like "Cc: stable" requires "Fixes: " then we really need 
> > tooling that picks that up and warns us about it. Otherwise, not everyone
> > will know or remember.
> > 
> > Something for your build-scripts?
> 
> That's why I discovered this: I added that check to the build scripts yesterday :-)

Perfect! I did not do a git pull on the build scripts, so that's my mistake
then.

> I think a Cc to stable is not needed if you have a Fixes tag, though.

That's a fair point. I viewed "Cc: stable" as an strong indicator to the
stable teams that "this should really go in the stable branch" but I guess
this is implied by the Fixes tags.

Thanks,

Sean
