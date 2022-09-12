Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 911EC5B63B2
	for <lists+linux-media@lfdr.de>; Tue, 13 Sep 2022 00:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiILW3n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Sep 2022 18:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiILW3l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Sep 2022 18:29:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01F55F65
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 15:29:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-79-70-nat.elisa-mobile.fi [85.76.79.70])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24471415;
        Tue, 13 Sep 2022 00:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663021775;
        bh=l+QHyscqviNpubsxXNDDpSXjg8Acgfsl0fLkmQrFQE0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YtOeZEz/233z4MRHX9ogEt0hQsIKR8qFxTkyjEjYgJNvtPe9zXXdB+0S8XQNkxxpn
         czmM9BofuyQkkGB/TxGZaIHRgsHHut0mfGvFjIkqbJPcI1IqcO9vrKz8lX3lxWGnjC
         X1T0ROat8lGS0GPnwLEE3QAE/3gYfPnWqq8bBw0I=
Date:   Tue, 13 Sep 2022 01:29:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sakari.ailus@iki.fi, sean@mess.org,
        user.vdr@gmail.com, xavier.claessens@collabora.com
Subject: Re: [PATCH v7 0/5] Switch build system to meson
Message-ID: <Yx+yv8l7EFbIniup@pendragon.ideasonboard.com>
References: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
 <c96f4806-13ec-335f-68ab-10194411da43@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c96f4806-13ec-335f-68ab-10194411da43@googlemail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

On Mon, Sep 12, 2022 at 04:41:33PM +0200, Gregor Jasny wrote:
> Hello Laurent and all the other helping hands,
> 
> On 9/9/22 3:44 PM, Laurent Pinchart wrote:
> > This series is the latest (and greatest) attempt to switch v4l-utils
> > from autotools to meson.
> > 
> > Compared to v6, the first noticeable change is that fixups have been
> > squashed into their corresponding commit. Detailed changelogs are now
> > included in individual patches.
> 
> Tested-by: Gregor Jasny <gjasny@googlemail.com>
> 
> v7 is still working as expected with my Debian and Ubuntu packaging scripts.

Thanks for testing. I'll post a v8 with the improvements suggested in
the review comments. I will also include updates to the
v4l-utils.spec.in file, and would appreciate help testing it.

> What would you think would be a good time to release these changes? 
> Should I do a release shortly after the this change has landed?

I think that would be a good idea. Once v8 is out, if there are no more
issues, I think it could be merged.

-- 
Regards,

Laurent Pinchart
