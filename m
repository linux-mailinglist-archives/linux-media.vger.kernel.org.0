Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEA35B686A
	for <lists+linux-media@lfdr.de>; Tue, 13 Sep 2022 09:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbiIMHO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Sep 2022 03:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiIMHO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Sep 2022 03:14:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB37AF8
        for <linux-media@vger.kernel.org>; Tue, 13 Sep 2022 00:14:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 48670612E8
        for <linux-media@vger.kernel.org>; Tue, 13 Sep 2022 07:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F1AC433C1;
        Tue, 13 Sep 2022 07:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663053265;
        bh=Vhd6zo3DPax8NWs3ZjazuZKDmPH4Ncll/8L5omoNZpg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jIKo6/mJZLSlX1+f1xKoy9hFKywqKNiFIWvOSyL6FchsiF0IKBSCZWNnQzjIc4NBe
         7cjzs55aZhqWnE1GSloVCQeGXoBusDIVF1dG3k+Tc+uOzfnYZaDAYKaAaSY4SHp5gj
         mZhnjJc5/G8nW9M7GlbsaL63k8vTsqbv1GGFzusBB9xsimo2Amz3visF/ds+2UuEHd
         xsamDveJM5HBXXol36rWUWnMiLyX2UuU7TpwAMsQEnnLlY4Ca0pz5Rg0zi94/uHSNT
         ubSuX+3BPSmLyFd1P9kWY8fpuHr0i1TMXfpW59pAnDwe8CWcNISZBOO6fwNIpzo0vs
         VHtvtDyGjPCIg==
Date:   Tue, 13 Sep 2022 09:14:19 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Gregor Jasny <gjasny@googlemail.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        p.zabel@pengutronix.de, rosenp@gmail.com, sakari.ailus@iki.fi,
        sean@mess.org, user.vdr@gmail.com, xavier.claessens@collabora.com
Subject: Re: [PATCH v7 0/5] Switch build system to meson
Message-ID: <20220913091419.326e3969@coco.lan>
In-Reply-To: <20220913090427.39d88f65@coco.lan>
References: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
        <c96f4806-13ec-335f-68ab-10194411da43@googlemail.com>
        <Yx+yv8l7EFbIniup@pendragon.ideasonboard.com>
        <ce4f6274-f937-be90-0ae7-01538e033896@xs4all.nl>
        <20220913090427.39d88f65@coco.lan>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 13 Sep 2022 09:04:27 +0200
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Tue, 13 Sep 2022 07:54:08 +0100
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
> > Hi Laurent,
> > 
> > On 9/12/22 23:29, Laurent Pinchart wrote:  
> > > Hi Gregor,
> > > 
> > > On Mon, Sep 12, 2022 at 04:41:33PM +0200, Gregor Jasny wrote:    
> > >> Hello Laurent and all the other helping hands,
> > >>
> > >> On 9/9/22 3:44 PM, Laurent Pinchart wrote:    
> > >>> This series is the latest (and greatest) attempt to switch v4l-utils
> > >>> from autotools to meson.
> > >>>
> > >>> Compared to v6, the first noticeable change is that fixups have been
> > >>> squashed into their corresponding commit. Detailed changelogs are now
> > >>> included in individual patches.    
> > >>
> > >> Tested-by: Gregor Jasny <gjasny@googlemail.com>
> > >>
> > >> v7 is still working as expected with my Debian and Ubuntu packaging scripts.    
> > > 
> > > Thanks for testing. I'll post a v8 with the improvements suggested in
> > > the review comments. I will also include updates to the
> > > v4l-utils.spec.in file, and would appreciate help testing it.
> > >     
> > >> What would you think would be a good time to release these changes?
> > >> Should I do a release shortly after the this change has landed?    
> > > 
> > > I think that would be a good idea. Once v8 is out, if there are no more
> > > issues, I think it could be merged.
> > >     
> > 
> > Before you do that, I would like to do a few more tests next week.  
> 
> I'd like to to it too, once the summary is there. I want to compare
> autotools x meson with regards to enable/disable each build option,
> and check the results.

Ah, forgot to mention, but, before disabling autotools, I need
the recipe for using Coverity with meson, as otherwise we'll have
a regression on CI.

The final patch dropping support for auto-tools can only be
applied upstream after changing the CI to build via meson.

So, the steps should be:

1. Version 8 is submitted;
2. Once it pass on tests, merge without dropping auto-tools support;
3. change CI to build via meson and test it;
4. release a new version.

I'm in doubt if we should drop auto-tools before (4) or if we should
keep support for it for a while. 

Thanks,
Mauro
