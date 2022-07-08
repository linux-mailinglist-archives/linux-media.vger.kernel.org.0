Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 019EF56B3BF
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 09:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237453AbiGHHmc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 03:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237436AbiGHHmb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 03:42:31 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7457D1CE
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 00:42:30 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E83EB10008B; Fri,  8 Jul 2022 08:42:28 +0100 (BST)
Date:   Fri, 8 Jul 2022 08:42:28 +0100
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: rc: Always report LIRC repeat flag
Message-ID: <Ysff5PEy580LIg8w@gofer.mess.org>
References: <20220705085358.44418-1-marko.makela@iki.fi>
 <YsR4W3B6JErTCDrS@gofer.mess.org>
 <YsW6tegch5+yNOub@jyty>
 <Ysaf5haqAeLl+on+@gofer.mess.org>
 <Ysa+/QLY8AYrDr6m@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ysa+/QLY8AYrDr6m@jyty>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marko,

On Thu, Jul 07, 2022 at 02:09:49PM +0300, Marko Mäkelä wrote:
> Thu, Jul 07, 2022 at 09:57:10AM +0100, Sean Young wrote:
> > On Wed, Jul 06, 2022 at 07:39:17PM +0300, Marko Mäkelä wrote:
> > > Tue, Jul 05, 2022 at 06:43:55PM +0100, Sean Young wrote:
> > > > On Tue, Jul 05, 2022 at 11:53:58AM +0300, Marko Mäkelä wrote:
> > > > > The flag LIRC_SCANCODE_FLAG_REPEAT was never set by rc_keydown().
> > > > > Previously it was only set by rc_repeat(), but not all protocol
> > > > > decoders invoke that function.
> > > >
> > > > This should say _why_ you are making this change, not _what_ the change
> > > > is.
> > > 
> > > How would you find the following?
> > > 
> > > ---
> > > media: lirc: ensure lirc device receives repeats
> > > 
> > > Commit de142c32410649e64d44928505ffad2176a96a9e ("media: lirc: implement
> > > reading scancode") would never set the LIRC_SCANCODE_FLAG_REPEAT flag in the
> > > LIRC messages.
> > > 
> > > Commit b66218fddfd29f315a103db811152ab0c95fb054
> > > ("media: lirc: ensure lirc device receives nec repeats") fixed it up for
> > > those protocol drivers that may call rc_repeat().
> > > ---
> > 
> > That's no good. See:
> > 
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
> > 
> > The heading is called "Describe your changes".
> 
> I see. A quick read of "git log --oneline drivers/media/rc" suggests that
> the first line of the commit message is expected to be a summary _what_ the
> change is, not _why_ it was made. Would the commit message be acceptable
> after adding a "why" part right after the heading line, like this? If not, I
> would appreciate specific suggestions.

This is much better, thank you.

> ---
> media: lirc: ensure lirc device receives repeats
> 
> For remote controls using RC5 and similar protocols that include a
> "toggle" flag, the LIRC device never set the "repeat" flag to distinguish
> repeated messages that were sent several times per second due to a
> long keypress, and messages sent due to repeated short keypresses.
> 
> While a user-space program may implement logic around the "toggle" flag
> to distinguish long keypresses, it would be simpler to be able to rely on
> the "repeat" flag for any type of protocol.

I'm not sure how relevant the toggle is. This change is relevant for all 
protocols that do not use rc_repeat() and simply repeat the original
message when a key is being held down. This includes the sony protocol, 
imon, and the nec protocol (in case the remote does *not* use the repeat
message).

> Commit de142c32410649e64d44928505ffad2176a96a9e ("media: lirc: implement
> reading scancode") would never set the LIRC_SCANCODE_FLAG_REPEAT flag in
> the LIRC messages.
> 
> Commit b66218fddfd29f315a103db811152ab0c95fb054
> ("media: lirc: ensure lirc device receives nec repeats") fixed it up for
> those protocol drivers that may call rc_repeat().
> ---

Thanks

Sean
