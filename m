Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1A85B69E4
	for <lists+linux-media@lfdr.de>; Tue, 13 Sep 2022 10:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbiIMIv3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Sep 2022 04:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbiIMIvY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Sep 2022 04:51:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719905B7B8
        for <linux-media@vger.kernel.org>; Tue, 13 Sep 2022 01:51:18 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [89.101.193.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D957517;
        Tue, 13 Sep 2022 10:51:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663059074;
        bh=FctNPx5/FJR2ynKUgrNHNP9aXdcyYsFXVdkeV0dInMk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l8OGNp2ubTrp80+k55T0ZK9t3fpRog8gIDk/a/H3zbhtSI84ZUxG29hYPQFFqAiwn
         KeFwx2kjvi5StsH9Lxz0n0WluiQDS6/kdWcf2sfwAg0XVMa4uBD6A6BzRRk9Dbjx6m
         DJRAHbLLIgLtLT71VAPxlAogfXI06/nnr06Ge2BU=
Date:   Tue, 13 Sep 2022 11:51:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Gregor Jasny <gjasny@googlemail.com>, linux-media@vger.kernel.org,
        ezequiel@collabora.com, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sakari.ailus@iki.fi, sean@mess.org,
        user.vdr@gmail.com, xavier.claessens@collabora.com
Subject: Re: [PATCH v7 0/5] Switch build system to meson
Message-ID: <YyBEdPGpsVMIP9dq@pendragon.ideasonboard.com>
References: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
 <c96f4806-13ec-335f-68ab-10194411da43@googlemail.com>
 <Yx+yv8l7EFbIniup@pendragon.ideasonboard.com>
 <67fa379a-07f9-e19c-22da-6fda931ad8ca@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67fa379a-07f9-e19c-22da-6fda931ad8ca@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Tue, Sep 13, 2022 at 08:15:43AM +0100, Hans Verkuil wrote:
> On 9/12/22 23:29, Laurent Pinchart wrote:
> > On Mon, Sep 12, 2022 at 04:41:33PM +0200, Gregor Jasny wrote:
> >> Hello Laurent and all the other helping hands,
> >>
> >> On 9/9/22 3:44 PM, Laurent Pinchart wrote:
> >>> This series is the latest (and greatest) attempt to switch v4l-utils
> >>> from autotools to meson.
> >>>
> >>> Compared to v6, the first noticeable change is that fixups have been
> >>> squashed into their corresponding commit. Detailed changelogs are now
> >>> included in individual patches.
> >>
> >> Tested-by: Gregor Jasny <gjasny@googlemail.com>
> >>
> >> v7 is still working as expected with my Debian and Ubuntu packaging scripts.
> > 
> > Thanks for testing. I'll post a v8 with the improvements suggested in
> > the review comments. I will also include updates to the
> > v4l-utils.spec.in file, and would appreciate help testing it.
> > 
> >> What would you think would be a good time to release these changes?
> >> Should I do a release shortly after the this change has landed?
> > 
> > I think that would be a good idea. Once v8 is out, if there are no more
> > issues, I think it could be merged.
> 
> Two questions: for meson, what is the equivalent to 'make distclean'? 
> Just rm -rf build?

That's correct. Meson doesn't make *any* change to the source directory.

> And another: if I enable building for v4l2-ctl-32 and 
> v4l2-compliance-32, then those targets aren't build AFAICS.

I'll check that (a bit busy this week with ELC and LPC).

> It's needed for testing 32-bit compat code.

-- 
Regards,

Laurent Pinchart
