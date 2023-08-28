Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F50A78B377
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 16:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbjH1Opr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 10:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231882AbjH1Opf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 10:45:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4920E11B
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 07:45:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0C384E6;
        Mon, 28 Aug 2023 16:44:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693233848;
        bh=T+idW9LbZ6UFHoK1f0El0e7R45hLs7Np6DvgLobypNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JM6vTKwAEJxY6Uch+JkgZXiomcpLVqb1rkB7zS8fWLSKNRWEJzFRM2Gl3AxJ7HObX
         mKM/VM0yyco22mcAV1qKZvmYPc7JPEmsbpvt/ANRt+tsgtVf4LzDTINvkK/O1ZbAom
         M91UkqgHEzDna08R2iPZdZA2vc2obH4hGAiV5rOQ=
Date:   Mon, 28 Aug 2023 17:45:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linuxtv-ci@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [ANN] Introducing build scripts to test
Message-ID: <20230828144538.GQ14596@pendragon.ideasonboard.com>
References: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
 <fcag2mca7wkmujw5se5km5da4ns7cxnle3yn7jlu2ca4j2buoy@nxkvnvq4d6y4>
 <f61cc313-4c5f-46e0-3374-05cf3907f68a@xs4all.nl>
 <20230828142622.GO14596@pendragon.ideasonboard.com>
 <9fc67ba3-0951-ffdc-7fe9-b23598570f77@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9fc67ba3-0951-ffdc-7fe9-b23598570f77@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 28, 2023 at 04:38:32PM +0200, Hans Verkuil wrote:
> On 28/08/2023 16:26, Laurent Pinchart wrote:
> > On Mon, Aug 28, 2023 at 04:14:56PM +0200, Hans Verkuil wrote:
> >> On 28/08/2023 16:05, Jacopo Mondi wrote:
> >>> On Mon, Aug 28, 2023 at 03:29:41PM +0200, Hans Verkuil wrote:
> >>>> Hi all,
> >>>>
> >>>> We have been working on simplifying the media maintenance, and one part of that is
> >>>> standardizing on build tools, in particular to make it easier for patch submitters
> >>>> to run their patches through the same set of tests that the daily build does.
> >>>>
> >>>> This helps detect issues before you submit your patches.
> >>>>
> >>>> I have been working since July on transforming my hackish scripts to something
> >>>> that is easier to use and of better quality. While there are still a few rough
> >>>> edges, I consider it good enough to have others start to use it.
> >>>>
> >>>> To get the build scripts run:
> >>>>
> >>>> git clone git://linuxtv.org/hverkuil/build-scripts.git
> >>>>
> >>>> All the test builds will happen within this directory. It is completely separate
> >>>> from where you do you normal development, instead you point it to where your
> >>>> git repository is.
> >>>>
> >>>> See the README contained in the build-scripts git repo for all the details on
> >>>> how to set it up.
> >>>>
> >>>
> >>> I've been using your scripts since after ELC-E and I can tell they're
> >>> useful!
> >>>
> >>>> Currently the scripts expect a debian 12-based distro (likely debian 11 will work
> >>>> as well). I have no idea if it works well on Red Hat or Suse. If you use one of
> >>>> those distros, and you get it to work, then a patch updating the README file with
> >>>> the correct list of packages to install would be welcome.
> >>>
> >>> Speaking about distros, I was wondering if you still consider a
> >>> requirement to build all compiler or we should instead try to use the
> >>> distro provided ones when possible to test the distro-shipped version
> >>> ?
> >>
> >> I strongly believe we should build the cross compilers. The reason is that
> >> otherwise you get a wide variety of compiler versions, each with typically
> >> different compiler warnings. It's a pain for a developer to see different
> >> warnings than the person that merges those patches.
> >>
> >> It's a a regular problem that the daily build sees different warnings than
> >> you do locally with the distro's compiler.
> >>
> >> Doing it this way also makes it easier to upgrade to the latest compiler
> >> version, certainly quicker than a distro would do.
> >>
> >> It's about reproducibility, really.
> > 
> > There's value in testing with different compiler versions though. The
> > kernel's documented minimum gcc version is v5.1 at the moment. I
> > certainly don't want to build myself with all versions between v5.1 and
> > v13.2, but collectively we could cover more ground.
> > 
> > Regardless of this, I already have recent cross compilers (built with
> > buildroot) for ARM and ARM64, and I'd rather use those than duplicating
> > compilers. Anything that consumes extra disk space is a serious
> > hinderance.
> 
> Feel free, but you run the risk that your PR is rejected because when I
> run with these compiler versions I see new warnings. The whole point is
> to be able to do the same tests before you make the PR to reduce the risk
> of having to make a v2.
> 
> FYI: the cross directory takes about 10 GB on my system. That can be
> streamlined a bit by deleting some temporary directories needed while
> building, probably to something closer to 5-6 GB.

It may not be huge by itself, but it quickly adds up when you need to
maintain multiple userspace cross-built enviroments, including Chrome
OS, Android, Yocto, ... :-( I have half a TB of disk on my main
development machine, and I would need at least 4 times that to cover my
current needs comfortably.

> >>>> Please note that running the regression tests using virtme-ng is currently only
> >>>> supported on Debian 12, not on e.g. Ubuntu. Someone is looking into that, and
> >>>> hopefully we can support that in the future. Running regressions tests are
> >>>> primarily useful when making changes to core frameworks and public APIs, and
> >>>> it is possible to run them manually (see the README).
> >>>>
> >>>> Since running this locally can take a fair amount of time, we hope to have
> >>>> build servers available in the future so this can be offloaded.
> >>>>
> >>>> To give an idea of the expected build times:
> >>>>
> >>>> On an AMD Ryzen 9 6900HX (8 cores) a standard build of the staging tree
> >>>> (build.sh -test all) takes 39 minutes.
> >>>>
> >>>> On an AMD Ryzen Threadripper 3970X (32 cores) it takes a bit over 13 minutes.

-- 
Regards,

Laurent Pinchart
