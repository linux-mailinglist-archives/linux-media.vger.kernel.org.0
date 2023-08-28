Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3A978B6B4
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 19:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbjH1Rrh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 13:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbjH1RrI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 13:47:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B5A11A
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 10:47:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 187B863D70
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 17:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5DEC433C8;
        Mon, 28 Aug 2023 17:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693244824;
        bh=Udsk6rRW6qmOaf1OsMVP0jEDLMHrprJcPKPBMNLYlvI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Dm8opDAqyWsisHniHGkc/Y5GKqp54mEejUjaS5P2nuVy3eNrMfmiUB1jg+5oQjp6z
         PdjyrS5cf6+NKGyFoAHV3f39SC6JF7GtQ3styL9+uXtQEJxUVpzWRXl1Ab2psf3nkN
         r3t7H8/3yHB7+4N9TklNu2KpGoCI8Qanmh5kPdRtXnUEOg6gB2y9C7GKab/gdSGdRC
         uuYI59Q5GQtA3QBVR1FoyB2Cv2ZNFJgBqVQvN57moab0Wg4IgFf504NP3ZY8EmGj2h
         F+0IByfCCK6Waw0/0DcXD1qi+ttod+R9ikZ180f76BC4qwqq6U8c0CAqqd7xHNOUp0
         TuATC68NO/mcg==
Date:   Mon, 28 Aug 2023 19:46:58 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linuxtv-ci@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [ANN] Introducing build scripts to test
Message-ID: <20230828194658.53c3d75c@sal.lan>
In-Reply-To: <f61cc313-4c5f-46e0-3374-05cf3907f68a@xs4all.nl>
References: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
        <fcag2mca7wkmujw5se5km5da4ns7cxnle3yn7jlu2ca4j2buoy@nxkvnvq4d6y4>
        <f61cc313-4c5f-46e0-3374-05cf3907f68a@xs4all.nl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 28 Aug 2023 16:14:56 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Hi Jacopo,
> 
> On 28/08/2023 16:05, Jacopo Mondi wrote:
> > Hi Hans
> > 
> > On Mon, Aug 28, 2023 at 03:29:41PM +0200, Hans Verkuil wrote:  
> >> Hi all,
> >>
> >> We have been working on simplifying the media maintenance, and one part of that is
> >> standardizing on build tools, in particular to make it easier for patch submitters
> >> to run their patches through the same set of tests that the daily build does.
> >>
> >> This helps detect issues before you submit your patches.
> >>
> >> I have been working since July on transforming my hackish scripts to something
> >> that is easier to use and of better quality. While there are still a few rough
> >> edges, I consider it good enough to have others start to use it.
> >>
> >> To get the build scripts run:
> >>
> >> git clone git://linuxtv.org/hverkuil/build-scripts.git
> >>
> >> All the test builds will happen within this directory. It is completely separate
> >> from where you do you normal development, instead you point it to where your
> >> git repository is.
> >>
> >> See the README contained in the build-scripts git repo for all the details on
> >> how to set it up.
> >>  
> > 
> > I've been using your scripts since after ELC-E and I can tell they're
> > useful!
> >   
> >> Currently the scripts expect a debian 12-based distro (likely debian 11 will work
> >> as well). I have no idea if it works well on Red Hat or Suse. If you use one of
> >> those distros, and you get it to work, then a patch updating the README file with
> >> the correct list of packages to install would be welcome.
> >>  
> > 
> > Speaking about distros, I was wondering if you still consider a
> > requirement to build all compiler or we should instead try to use the
> > distro provided ones when possible to test the distro-shipped version
> > ?  
> 
> I strongly believe we should build the cross compilers. The reason is that
> otherwise you get a wide variety of compiler versions, each with typically
> different compiler warnings. It's a pain for a developer to see different
> warnings than the person that merges those patches.

I disagree. We don't want to break build for any supported compiler version. 
With Werror enabled, this can be tough. So, having people using different
versions is actually a good thing.

> It's a a regular problem that the daily build sees different warnings than
> you do locally with the distro's compiler.

Sparse (or smatch) will produce different warnings anyway, even with the
same version, depending on how many times you run it, and if you create
a database or not.

> 
> Doing it this way also makes it easier to upgrade to the latest compiler
> version, certainly quicker than a distro would do.

Usually, Fedora is very quick upgrading to the latest compiler. Yet,
I don't think this should be the main goal. I bet people will be a lot
pickier if we break compilation against a gcc version on Ubuntu,
Suse, Fedora and variants than if you break compilation about an upcoming
gcc version that are used by just a bunch of early testers.

Btw, there are early testers for both gcc and clang that periodically
test them during compilers -rc stages. They'll likely identify issues
before us (as it already happened in the past).

> 
> It's about reproducibility, really.
> 
> Regards,
> 
> 	Hans
> 
> >   
> >> Please note that running the regression tests using virtme-ng is currently only
> >> supported on Debian 12, not on e.g. Ubuntu. Someone is looking into that, and
> >> hopefully we can support that in the future. Running regressions tests are
> >> primarily useful when making changes to core frameworks and public APIs, and
> >> it is possible to run them manually (see the README).
> >>
> >> Since running this locally can take a fair amount of time, we hope to have
> >> build servers available in the future so this can be offloaded.
> >>
> >> To give an idea of the expected build times:
> >>
> >> On an AMD Ryzen 9 6900HX (8 cores) a standard build of the staging tree
> >> (build.sh -test all) takes 39 minutes.
> >>
> >> On an AMD Ryzen Threadripper 3970X (32 cores) it takes a bit over 13 minutes.
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
> >> _______________________________________________
> >> linuxtv-ci mailing list
> >> linuxtv-ci@linuxtv.org
> >> https://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-ci  
> 
> 
> _______________________________________________
> linuxtv-ci mailing list
> linuxtv-ci@linuxtv.org
> https://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-ci
