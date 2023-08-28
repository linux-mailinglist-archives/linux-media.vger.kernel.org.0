Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6857278B296
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 16:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjH1OG1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 10:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbjH1OGY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 10:06:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E8DCC3
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 07:06:01 -0700 (PDT)
Received: from ideasonboard.com (mob-5-91-19-240.net.vodafone.it [5.91.19.240])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F55F741;
        Mon, 28 Aug 2023 16:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693231476;
        bh=fWOKgDFb83QGCOSiC1AD4tBrXlHU3oqHKh4yEbm+4lk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=awgrv+biELLJofMeiNe6q5XcS5o73k5AZaodGCzpO548GsfGuX2G9t5Irkof8Ehb9
         Q7VG+651DFYtQt6q+Ym+oKW9lSmf4xC7KfxQoUH1rwBQGFBAtyr3QMjEE3eE+EGXu5
         QLcidcTo1Zf/FaEnZoHcc7u1qBd8YBBbWQLLd97o=
Date:   Mon, 28 Aug 2023 16:05:53 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxtv-ci@linuxtv.org
Subject: Re: [ANN] Introducing build scripts to test
Message-ID: <fcag2mca7wkmujw5se5km5da4ns7cxnle3yn7jlu2ca4j2buoy@nxkvnvq4d6y4>
References: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Mon, Aug 28, 2023 at 03:29:41PM +0200, Hans Verkuil wrote:
> Hi all,
>
> We have been working on simplifying the media maintenance, and one part of that is
> standardizing on build tools, in particular to make it easier for patch submitters
> to run their patches through the same set of tests that the daily build does.
>
> This helps detect issues before you submit your patches.
>
> I have been working since July on transforming my hackish scripts to something
> that is easier to use and of better quality. While there are still a few rough
> edges, I consider it good enough to have others start to use it.
>
> To get the build scripts run:
>
> git clone git://linuxtv.org/hverkuil/build-scripts.git
>
> All the test builds will happen within this directory. It is completely separate
> from where you do you normal development, instead you point it to where your
> git repository is.
>
> See the README contained in the build-scripts git repo for all the details on
> how to set it up.
>

I've been using your scripts since after ELC-E and I can tell they're
useful!

> Currently the scripts expect a debian 12-based distro (likely debian 11 will work
> as well). I have no idea if it works well on Red Hat or Suse. If you use one of
> those distros, and you get it to work, then a patch updating the README file with
> the correct list of packages to install would be welcome.
>

Speaking about distros, I was wondering if you still consider a
requirement to build all compiler or we should instead try to use the
distro provided ones when possible to test the distro-shipped version
?

> Please note that running the regression tests using virtme-ng is currently only
> supported on Debian 12, not on e.g. Ubuntu. Someone is looking into that, and
> hopefully we can support that in the future. Running regressions tests are
> primarily useful when making changes to core frameworks and public APIs, and
> it is possible to run them manually (see the README).
>
> Since running this locally can take a fair amount of time, we hope to have
> build servers available in the future so this can be offloaded.
>
> To give an idea of the expected build times:
>
> On an AMD Ryzen 9 6900HX (8 cores) a standard build of the staging tree
> (build.sh -test all) takes 39 minutes.
>
> On an AMD Ryzen Threadripper 3970X (32 cores) it takes a bit over 13 minutes.
>
> Regards,
>
> 	Hans
>
> _______________________________________________
> linuxtv-ci mailing list
> linuxtv-ci@linuxtv.org
> https://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-ci
