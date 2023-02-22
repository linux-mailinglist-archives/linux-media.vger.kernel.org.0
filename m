Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 235CB69FA63
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 18:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbjBVRsl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 12:48:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbjBVRsg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 12:48:36 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1453C1E1D7
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 09:48:34 -0800 (PST)
Received: from localhost (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F5EE6602101;
        Wed, 22 Feb 2023 17:48:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1677088112;
        bh=8nidOJ5TFWRuzrKkWx75H2LT82aDYSIwdYDvnG7Ud6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UIzY6HYBQYZGtDFIQyXGOmDmJ8Ww9IkswZfMimgFeZsz8tfYLGDEQijqQ4GYTxEKv
         VSHwyEWABDft7+4Ucv5CmiAjslfZexiUfW8ruMdBcttEHeL6R+vcGFQeNkIlokx2Go
         nq0HZZnwRhdNC+OXmHewlo9P9wK8skNvBdKM5h79wwVVNdZoJ5Gtc6RT6HUUJkdepm
         GSXYtLBncBJRcHH9+BL+bof7HISBtWMnIU0nfKh0Gr/YQY/jQ/kjbDf+hsdGNvH/YF
         ivuW0aqYXLMnlLCJZsxljMn0uALCliWjad/UnrKOBr0TJ5WHGUWonCPWZ5g4odbR6V
         982Klx9EoBY1g==
Date:   Wed, 22 Feb 2023 09:50:08 -0800
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, ariel@vanguardiasur.com.ar,
        ezequiel@vanguardiasur.com.ar, tomi.valkeinen@ideasonboard.com
Subject: Re: [v4l-utils] [PATCH v9 3/7] Add support for meson building
Message-ID: <Y/ZV0AKVW1jetrdf@xps>
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221143204.26591-4-laurent.pinchart@ideasonboard.com>
 <0da1d7df-5ba5-c6ce-afa0-3450ea3e8ed3@xs4all.nl>
 <Y/Tab2i9eA+wcoF2@pendragon.ideasonboard.com>
 <e890fca0-a706-a43d-83ed-80c1f59b1182@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e890fca0-a706-a43d-83ed-80c1f59b1182@googlemail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 22, 2023 at 11:41:29AM +0100, Gregor Jasny wrote:
> Hello,
> 
> On 21.02.23 15:51, Laurent Pinchart wrote:
> > > I wonder if we shouldn't make a 1.24 stable release first without this patch
> > > series, then introduce meson with version 1.25. Besides, the last stable release
> > > was 16 months ago, so I think it is high time for a new stable anyway.
> > 
> > Works for me.
> > 
> > > Gregor, any opinion?
> 
> Sure, I can create a new release tonight. Would anyone want to merge
> something prior to the release?

Not sure how the release works or if it's too late, but it would be nice
to have this in:

v4l2-tracer: misc fixes
https://patchwork.kernel.org/project/linux-media/list/?series=720183

Or at the very least, the first patch in the series which lets you kill tracing
of continuous streaming with Ctrl+C.
All of it still applies on top of Laurent and Sakari's patches and
works with meson fine.

> 
> Thanks,
> Gregor
