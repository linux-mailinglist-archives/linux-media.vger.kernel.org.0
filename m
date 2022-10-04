Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9549B5F457D
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 16:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiJDOaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 10:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiJDO34 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 10:29:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCBEE09A
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 07:29:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 534282D9;
        Tue,  4 Oct 2022 16:29:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664893789;
        bh=fGgOrX7TT4juF9GMaH2qw8OAeqdy0K50ldVINA/bn38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fkqkcCao3Wcm6BJIu8ptSi79gQfGiTFT8LvYsZUwF5xip1fGtiPhbU+y1dpYvevlE
         vLiufN5ZFjUfRhqszbGLJ9IrDfYgSuZbursJTy9upqeLfryKdG7xF7+3mscvhCBgyk
         VYqvb+PNQt5HoZhLtAZnk78nQ5xHEyVcZXjqg6b0=
Date:   Tue, 4 Oct 2022 17:29:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        m.szyprowski@samsung.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v6 2/4] vb2: add allow_zero_bytesused flag to the
 vb2_queue struct
Message-ID: <YzxDWhT0fsmupwGZ@pendragon.ideasonboard.com>
References: <1424694379-11115-1-git-send-email-k.debski@samsung.com>
 <1424694379-11115-2-git-send-email-k.debski@samsung.com>
 <YzjR5ajfLfMXvC4D@pendragon.ideasonboard.com>
 <9b2c0c99-9f14-7bb8-415b-8c399569aabd@xs4all.nl>
 <Yzv7jBKeYPZ0BPS+@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yzv7jBKeYPZ0BPS+@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Tue, Oct 04, 2022 at 12:23:24PM +0300, Sakari Ailus wrote:
> On Tue, Oct 04, 2022 at 11:12:45AM +0200, Hans Verkuil wrote:
> > On 10/2/22 01:48, Laurent Pinchart wrote:
> > > Hello,
> > > 
> > > While working on fixing occurrences of
> > > 
> > > [   54.375534] use of bytesused == 0 is deprecated and will be removed in the future,
> > > [   54.388026] use the actual size instead.
> > > 
> > > in libcamera, I realized that the patch that initially introduced the
> > > warning and deprecated setting bytesused to 0 didn't change the V4L2 API
> > > specification, which still documents bytesused as
> > > 
> > >     [...] If the application sets this to 0 for an output stream, then
> > >     bytesused will be set to the size of the buffer (see the length
> > >     field of this struct) by the driver. [...]
> > > 
> > > for both v4l2_buffer and v4l2_plane.
> > > 
> > > This deprecated behaviour has been present in the kernel for 7 years and
> > > a half now. I'm wondering if it's really deprecated, in which case we
> > > should update the API specification, or if it should be considered
> > > supported, in which case the warning should be dropped.
> > 
> > It's a good question.
> > 
> > I do believe it should be removed from the spec. It is IMHO a bad idea to
> > just leave bytesused at 0 for an output buffer. Applications should be explicit.

OK. I'll write a patch.

> > But on the other hand, I think we need to keep the current behavior in the
> > kernel of replacing bytesused == 0 with the length of the buffer. I don't
> > think we can return an error in that case, it would almost certainly break
> > userspace.

Yes, I don't think we can change the implementation for the time being,
the risk of breakages is just too high (I'm fixing the libcamera side
though).

> > Regarding the warning: I think we need to keep it, to warn applications that
> > what they are doing is a bad idea, but that the text should change from:
> > 
> > "use of bytesused == 0 is deprecated and will be removed in the future"
> > 
> > to:
> > 
> > "use of bytesused == 0 is not recommended"
> 
> If we ever intend to drop this support, we should warn we're going to do
> so. Otherwise there's little point in recommending against using it.

I agree. Just saying it's not recommended is pointless. Either we want
to deprecate this behaviour, which means that it may get removed in the
future (one option could be to WARN_ONCE() for a few years, although
even that may not be enough), or we conclude that removing it will never
be possible, in which case I'd drop the message.

> The
> spec should document it as deprecated and to be removed in the future as
> well. (Or alternatively, the warning should be removed altogether.)

I wouldn't document it at all, if it's deprecated it doesn't deserve a
mention in the spec. It's hard enough for people to understand how to do
the right thing when reading documentation without being told about the
things that work but shouldn't be done :-)

-- 
Regards,

Laurent Pinchart
