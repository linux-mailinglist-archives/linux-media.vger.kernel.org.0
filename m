Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEA2573D67
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 21:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236966AbiGMTzm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 15:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236975AbiGMTzl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 15:55:41 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9442630555
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 12:55:40 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 0FA7E1B0029D;
        Wed, 13 Jul 2022 22:55:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1657742138;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PKDkzAyZehK1KIpGxBzCYZvoWfnyIYsFQKIUomeInJU=;
        b=V+TgxdXDvX+BRaXihGNllY+f6mAsHIdhg5bxKNkoqwIcS9pP0bEeq9iHLEcxQDaAJJhttc
        hwgrmbzhM2gy90/5ve2Xyx5QLqwtAwjM721YjxRM5VH5hJJ1XLmoYGMbW1R5k8l7a939Bz
        LPzI3+YAsjVM966cSSRfhnpQmkGTtdMHxo+CrwbHvrwnahplmZ3y7lDjysQSEIK+cFs00b
        u3q//gMa7FRsuGrXA3UmgXF3FnNm662SL7+MYsXVx4g7NkxMSIcrulnpIAFLTlyWhyln7f
        SjtJqU/6MpN3q6huf9Jg39CcN9kfRABBdB1zKRS5ryhY1kyrxc9HIpqxDS1LBQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A8DDB634D60;
        Wed, 13 Jul 2022 22:55:37 +0300 (EEST)
Date:   Wed, 13 Jul 2022 22:55:37 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] v4l: Kconfig: Drop subdev API option help text
Message-ID: <Ys8jOdPmRPCUP7u8@valkosipuli.retiisi.eu>
References: <20220713173920.222394-1-sakari.ailus@linux.intel.com>
 <Ys8GxF91rx32ZRAX@pendragon.ideasonboard.com>
 <Ys8d54l85k8Cwxne@pendragon.ideasonboard.com>
 <Ys8fzV1H8iFwqoHA@valkosipuli.retiisi.eu>
 <Ys8hNg87Ar9MTryZ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys8hNg87Ar9MTryZ@pendragon.ideasonboard.com>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1657742138; a=rsa-sha256;
        cv=none;
        b=o16g0mUID3GKcOBrcVehdgKRk4DNR0uXoHqW48l4u50O/3S0qHx9T1yggH/kXEAR75CjxK
        cduSGE2A7iBCqXvrcWsZBw9maUuZi/bujNaMUHMiAIr198SEitFcB+Jv/Y2gLcKYa6Zsn4
        oyYvOz205/TnQjXKdrwUC5aT6wNKrbicIT3mTyFzw+A1Tntg6VJ0ynljFj2rjaC1e0D7Pg
        Ghjcb4WSO6iofk5XdvL6jEbETLTXlr3ik2axbVD6orU/Kv1XihP2jcu48iUysynBseY5Xs
        wiQZqeeaZ58V390/TfqWZYoxS4iZXGrBnTYPTjBfdmm4fAUTL0mY8h0+4BT+jw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1657742138;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PKDkzAyZehK1KIpGxBzCYZvoWfnyIYsFQKIUomeInJU=;
        b=QCF4RseEEggyeuvY8X3gXXPdrWpKzWpIlnGb69/J2nW8D7FJ7xnhYj6W6hmhp/b6nr/uML
        wIfyEznBGFG0M3h10IyFIkwhnYfX1bsezMwjXs6NSo30Es7uE4zOLEqTIaPUTf/QcsWPef
        8+q27m86UcZFBkXXSsyVMHNTmypB6AzVXP1dPoUA8EVRZtwNAysKih6uSec2/F9XffRKC9
        QK+xqgZQUQ/N0q47vyHkY07qLakMVmFg1I1b2yA5QnZGXaVDp1XbwzTHDRBOq2X+I5Pzn7
        69XghdvEhy1mGffG0qr9sXJc/UmdrL3XqM9y+2mjtgIOD5dk7givpL3+dMOrCQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 13, 2022 at 10:47:02PM +0300, Laurent Pinchart wrote:
> On Wed, Jul 13, 2022 at 10:41:01PM +0300, Sakari Ailus wrote:
> > On Wed, Jul 13, 2022 at 10:32:55PM +0300, Laurent Pinchart wrote:
> > > On Wed, Jul 13, 2022 at 08:54:12PM +0300, Laurent Pinchart wrote:
> > > > Hi Sakari,
> > > > 
> > > > Thank you for the patch.
> > > > 
> > > > On Wed, Jul 13, 2022 at 08:39:20PM +0300, Sakari Ailus wrote:
> > > > > The config option text was recently removed, also remove the help text.
> > > > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > 
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > 
> > > Actually, on second thought, isn't it useful to keep the help text as
> > > documentation ?
> > 
> > We haven't generally done that for other such options either. This was
> > intended for end users IMO.
> 
> I don't have a strong opinion, but this came to my attention when
> reviewing your patch that adds selection of GENERIC_PHY_MIPI_DPHY for
> sun6i. The GENERIC_PHY_MIPI_DPHY symbol isn't user-selectable but has a
> help text. A short documentation is useful in my opinion.

I'll leave it ouf of the next pull request then. We can later on decide to
merge it if we like.

-- 
Sakari Ailus
