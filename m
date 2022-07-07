Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3B0569E33
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 10:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbiGGI5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 04:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbiGGI5O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 04:57:14 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147604D4DC
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 01:57:13 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E827E100071; Thu,  7 Jul 2022 09:57:10 +0100 (BST)
Date:   Thu, 7 Jul 2022 09:57:10 +0100
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH] media: rc: Always report LIRC repeat flag
Message-ID: <Ysaf5haqAeLl+on+@gofer.mess.org>
References: <20220705085358.44418-1-marko.makela@iki.fi>
 <YsR4W3B6JErTCDrS@gofer.mess.org>
 <YsW6tegch5+yNOub@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsW6tegch5+yNOub@jyty>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marko,

On Wed, Jul 06, 2022 at 07:39:17PM +0300, Marko Mäkelä wrote:
> Tue, Jul 05, 2022 at 06:43:55PM +0100, Sean Young wrote:
> > On Tue, Jul 05, 2022 at 11:53:58AM +0300, Marko Mäkelä wrote:
> > > The flag LIRC_SCANCODE_FLAG_REPEAT was never set by rc_keydown().
> > > Previously it was only set by rc_repeat(), but not all protocol
> > > decoders invoke that function.
> > 
> > This should say _why_ you are making this change, not _what_ the change
> > is.
> 
> How would you find the following?
> 
> ---
> media: lirc: ensure lirc device receives repeats
> 
> Commit de142c32410649e64d44928505ffad2176a96a9e ("media: lirc: implement
> reading scancode") would never set the LIRC_SCANCODE_FLAG_REPEAT flag in the
> LIRC messages.
> 
> Commit b66218fddfd29f315a103db811152ab0c95fb054
> ("media: lirc: ensure lirc device receives nec repeats") fixed it up for
> those protocol drivers that may call rc_repeat().
> ---

That's no good. See:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

The heading is called "Describe your changes".


Sean
