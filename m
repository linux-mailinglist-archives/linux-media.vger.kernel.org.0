Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D52B6A2F24
	for <lists+linux-media@lfdr.de>; Sun, 26 Feb 2023 11:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjBZKry (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Feb 2023 05:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjBZKrx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Feb 2023 05:47:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EC5199C;
        Sun, 26 Feb 2023 02:47:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 37990B80B6F;
        Sun, 26 Feb 2023 10:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A19AC433EF;
        Sun, 26 Feb 2023 10:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677408469;
        bh=fLQt+ixMEJSno4VMGJ1WCh88kx568RB8kp9xOEK0ZLw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=d1Btl1zvFXWcXcQY0WO1bc/qjhN1GZgwcTiYMFxTOQOqDLawscMFk5ki2J3DAa1Xw
         wlTMXP0BwkWr99xwqquqlREx461suPqS+zKKLJyl36bSSfE6gNtGr1OfXMr9c6FPQ5
         t2XmTbirJcUKs7uPA1wVo03LrjngNw8FsZmg4wqQkfULn0riyheBkFbNWv7FWyGoqb
         hwgEEEKgCCAAU27m4wv6i0rhSBo4Y8g+8BiBI9I5Jyx9Ta7goKCuAI+hbk6XUU2nIw
         mWtAReJxcP/pF17LSnl0svyDSwDX9buC6PMxg+suQJmsh6CID0LGTSb4Z1rb/67YLl
         U4JVxL4tYEXEw==
Date:   Sun, 26 Feb 2023 11:47:44 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Airlie <airlied@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] media: Fix building pdfdocs
Message-ID: <20230226114744.7221f460@coco.lan>
In-Reply-To: <307dbafd-6fe7-1b75-a484-67553529a5e0@gmail.com>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
        <307dbafd-6fe7-1b75-a484-67553529a5e0@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 26 Feb 2023 08:39:32 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> [+CC: Jon, linux-doc]
> 
> On Wed,  8 Feb 2023 10:29:16 +0200, Tomi Valkeinen wrote:
> > Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
> > documatation for a few new RGB formats. For some reason these break the
> > pdfdocs build, even if the same style seems to work elsewhere in the
> > file.
> > 
> > Remove the trailing empty dash lines, which seems to fix the issue.
> > 
> > Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
> > Reported-by: Akira Yokosawa <akiyks@gmail.com>  
> Link: https://lore.kernel.org/r/12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com/
> 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> > 
> > Note: the offending patch was merged via drm tree, so we may want to
> > apply the fix to the drm tree also.  
> 
> So, the offending commit is now in mainline without this fix...
> I believe this build regression -- a real build error of "make pdfdocs"
> -- should be fixed ASAP.
> 
> Tomi, Laurent has suggested a typo fix in the Changelog.
> Can you respin ?
> 
> Or, Laurent, can you do the fix on your own?
> 
> Hopefully, the fix can make v6.3-rc1.

Better to wait for media PR to be handled. There were some changes at
the documentation that affected the patch. I guess the bug is gone.
If not, we'll need to rebase the patch.

Regards,
Mauro

> 
>         Thanks, Akira
> 
> > 
> >  Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > index d330aeb4d3eb..ea545ed1aeaa 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > @@ -868,7 +868,6 @@ number of bits for each component.
> >        - r\ :sub:`4`
> >        - r\ :sub:`3`
> >        - r\ :sub:`2`
> > -      -
> >      * .. _V4L2-PIX-FMT-RGBA1010102:
> >  
> >        - ``V4L2_PIX_FMT_RGBA1010102``
> > @@ -909,7 +908,6 @@ number of bits for each component.
> >        - r\ :sub:`4`
> >        - r\ :sub:`3`
> >        - r\ :sub:`2`
> > -      -
> >      * .. _V4L2-PIX-FMT-ARGB2101010:
> >  
> >        - ``V4L2_PIX_FMT_ARGB2101010``
> > @@ -950,7 +948,6 @@ number of bits for each component.
> >        - r\ :sub:`6`
> >        - r\ :sub:`5`
> >        - r\ :sub:`4`
> > -      -
> >  
> >  .. raw:: latex
> >    



Thanks,
Mauro
