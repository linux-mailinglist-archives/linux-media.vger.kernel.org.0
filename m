Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E94986F65A9
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 09:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjEDHZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 May 2023 03:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjEDHZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 May 2023 03:25:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C4AA212B
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 00:25:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D687E6B8;
        Thu,  4 May 2023 09:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683185131;
        bh=k5yqwrTB2+bQnisfp6fP51qA/A+re71qYFtcDOqLBho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n7Eu4ViIcWZpvne+6FgNo63NSwMwhY23MVSEH0lpyc5cLhjo5CYn+l7/01HEQvPkV
         ZDhpr0wjcXYajoKQic+nWy6+T5rvbJZi4bFRNnPUXnTiVa+0rBYiODrQutTU9EtSca
         joyCOuRRMDFryqPxBVZNOzzQJ9L0Jt1mOMHS7U+I=
Date:   Thu, 4 May 2023 10:25:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Gregor Jasny <gjasny@googlemail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sean Young <sean@mess.org>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: v4l-utils 1.24.0 has been released
Message-ID: <20230504072546.GA4551@pendragon.ideasonboard.com>
References: <86f5a2f0-0714-6648-eed2-cd4f11209dd5@googlemail.com>
 <20230321222126.2490de9b@coco.lan>
 <e85004bc-61a1-d86c-1da0-3e2d8bb609d1@googlemail.com>
 <eb8cca26-8c2a-419a-6b90-31d9e78d1a24@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb8cca26-8c2a-419a-6b90-31d9e78d1a24@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, May 04, 2023 at 08:32:37AM +0200, Hans Verkuil wrote:
> On 04/05/2023 08:25, Gregor Jasny wrote:
> > On 21.03.23 22:21, Mauro Carvalho Chehab wrote:
> >> Gregor Jasny <gjasny@googlemail.com> escreveu:
> >>> I'm happy to announce that v4l-utils 1.24.0 has been released. This will
> >>> be the last version before the build system will be migrated from
> >>> Autotools to Meson.
> >>
> >> I wouldn't mind if we would have a shorter release time for version
> >> 1.26 - or maybe it is time to increase major, so version 2.0.
> >>
> >> As we are now using a new building system, it would be nice to have
> >> a stable version frozen, with not much other changes, in order
> >> to allow distros to opt either to use version 1.24 with autotools
> >> or to migrate to the newest version, with meson, but not many other
> >> changes.
> >>
> >> So, perhaps we should aim release a new version in 2 months or
> >> so, once we have enough time to do cleanups if needed and having
> >> media maintainers and developers familiar with the new way.
> > 
> > It looks like the dust after the meson migration has been settled.
> > When would be a good time for a new v4l-utils release? I'm available
> > this weekend or the upcoming ones.
> > 
> > Is there anything you'd like to land in the mainline branch prior to
> > a new release?
> 
> Actually, there is one thing I want to discuss. I maintain the edid-decode utility
> (https://git.linuxtv.org/edid-decode.git/) and I have received several request for
> 'a proper version number' and releasing it as a package.
> 
> I have been wondering whether this utility shouldn't be moved to v4l-utils so it
> is part of the v4l-utils release mechanism.
> 
> Since V4L2 also deals with setting/getting EDIDs it is not unreasonable.
> 
> Would there be any objections if I did that? If there are no objections, then it
> would be nice to include this in a new release.

No objection from me. It could be nice at some point to work on
v4l-utils packaging to make it easier to split key utilities in
different packages, but there's no urgency.

-- 
Regards,

Laurent Pinchart
