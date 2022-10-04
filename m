Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5FBA5F49DA
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 21:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiJDTr5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 15:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiJDTr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 15:47:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649765A800
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 12:47:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C442F2D9;
        Tue,  4 Oct 2022 21:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664912873;
        bh=gHnTCa8V0HyilwzK1eB799k55Yw68RjHy8Hg2yA7E6o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K9qzS4iFLgly76L3I4mXdfgz7Spe+0OnBusEM+2Xejhy1gwXtTKoBUFHsM5mvbvm2
         9mLdTOLtKyrKIw4ub9fE5wMCokFQx+Nl6UMJaqbAcIcupdFeCEKJmuUWjKrZgLwA9a
         h31FODszphVaYy86yQVl4S5e6w7Q3NOuUi4bFEAQ=
Date:   Tue, 4 Oct 2022 22:47:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        m.szyprowski@samsung.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v6 2/4] vb2: add allow_zero_bytesused flag to the
 vb2_queue struct
Message-ID: <YzyN5U+HPB5l0Jv9@pendragon.ideasonboard.com>
References: <1424694379-11115-1-git-send-email-k.debski@samsung.com>
 <1424694379-11115-2-git-send-email-k.debski@samsung.com>
 <YzjR5ajfLfMXvC4D@pendragon.ideasonboard.com>
 <9b2c0c99-9f14-7bb8-415b-8c399569aabd@xs4all.nl>
 <Yzv7jBKeYPZ0BPS+@valkosipuli.retiisi.eu>
 <YzxDWhT0fsmupwGZ@pendragon.ideasonboard.com>
 <Yzx9SISk3KqFFY1i@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yzx9SISk3KqFFY1i@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Oct 04, 2022 at 09:36:56PM +0300, Sakari Ailus wrote:
> On Tue, Oct 04, 2022 at 05:29:46PM +0300, Laurent Pinchart wrote:
> > > If we ever intend to drop this support, we should warn we're going to do
> > > so. Otherwise there's little point in recommending against using it.
> > 
> > I agree. Just saying it's not recommended is pointless. Either we want
> > to deprecate this behaviour, which means that it may get removed in the
> > future (one option could be to WARN_ONCE() for a few years, although
> > even that may not be enough), or we conclude that removing it will never
> > be possible, in which case I'd drop the message.
> 
> I think displaying a warning for a few seconds would do it. ;-) ;-)
> 
> > > The
> > > spec should document it as deprecated and to be removed in the future as
> > > well. (Or alternatively, the warning should be removed altogether.)
> > 
> > I wouldn't document it at all, if it's deprecated it doesn't deserve a
> > mention in the spec. It's hard enough for people to understand how to do
> > the right thing when reading documentation without being told about the
> > things that work but shouldn't be done :-)
> 
> I would document it as deprecated so that application developers reading it
> could get the hint. Otherwise they won't (unless they look at the kernel
> logs of course). Up to you, I don't have a strong opinion on this.

Why do you think that would be better than documenting the
non-deprecated behaviour only ? I doubt anyone would read the
documentation, realize that the feature is deprecated, and then go fix
an application. I may be wrong though, is that why you would like to see
a mention of the deprecated feature in the documentation ?

-- 
Regards,

Laurent Pinchart
