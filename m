Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4CD46FEBD5
	for <lists+linux-media@lfdr.de>; Thu, 11 May 2023 08:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236438AbjEKGlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 May 2023 02:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjEKGlI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 May 2023 02:41:08 -0400
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC39103;
        Wed, 10 May 2023 23:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
        bh=RtWxN7e4QjgKeMqyRm8+weDfqFq3jfnkuzd3W1qjtiM=; b=jw/mMH9qT+/rpGk7mfI4YGlPGe
        uWTb2lZmqfZIuwVdgWuQnLtmQkWFasYr7kqa7CUIFVCLKRFtUvi1n8Qd+6fMBYIIAbvrl/GdFxv2J
        lqAmLygNJHA+XCTSh+mldXiQG+o7dI8T8FS5MrntPj1B3P2ekHWFpwYFdC4tjvXb2QUArkaE0igA9
        oZtyK6diEXw40KxwmYst51pwkoEifoIuQGmWWNdXLmKJ3cCOtTTeK1EclD5jXQT9bgdhOYp/vs0Fz
        UBoWWTUbFlQsarbW1h9IC4EJZW1ubTxAV15CCwSdzwFvYrZWcxDjqD9Lezep+zRrsTgNjjVxyMM2m
        zJpZGunw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
        id 1pwzyw-001dzq-0x;
        Thu, 11 May 2023 06:40:54 +0000
Date:   Thu, 11 May 2023 07:40:54 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     ye.xingchen@zte.com.cn, sumit.semwal@linaro.org,
        gustavo@padovan.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf/sync_file: Use fdget()
Message-ID: <20230511064054.GM3390869@ZenIV>
References: <202305051103396748797@zte.com.cn>
 <b9ceed26-bf64-6314-3ec5-562542b2b1c6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9ceed26-bf64-6314-3ec5-562542b2b1c6@amd.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 05, 2023 at 10:22:09AM +0200, Christian K�nig wrote:
> Am 05.05.23 um 05:03 schrieb ye.xingchen@zte.com.cn:
> > From: Ye Xingchen <ye.xingchen@zte.com.cn>
> > 
> > convert the fget() use to fdget().
> 
> Well the rational is missing. Why should we do that?

We very definitely should not.  The series appears to be
pure cargo-culting and it's completely wrong.

There is such thing as unwarranted use of fget().  Under some
conditions converting to fdget() is legitimate *and* is an
improvement.  HOWEVER, those conditions are not met in this case.

Background: references in descriptor table do contribute to
struct file refcount.  fget() finds the reference by descriptor
and returns it, having bumped the refcount.  In case when
descriptor table is shared, we must do that - otherwise e.g.
close() or dup2() from another thread could very well have
destroyed the struct file we'd just found.  However, if
descriptor table is *NOT* shared, there's no need to mess
with refcount at all.  Provided that
	* we are not grabbing the reference to keep it (stash
into some data structure, etc.); as soon as we return from
syscall, the reference in descriptor table is fair game for
e.g. close(2).  Or exit(2), for that matter.
	* we remember whether it was shared or not - we can't
just recheck that when we are done with the file; after all,
descriptor table might have been shared when we looked the file up,
but another thread might've died since then and left it not
shared anymore.
	* we do not rip the same reference out of our descriptor
table ourselves - not without seriously convoluted precautions.
Very few places in the kernel can lead to closing descriptors,
so in practice it only becomes a problem when a particularly
ugly ioctl decides that it would be neat to close some descriptor(s).
Example of such convolutions: binder_deferred_fd_close().

fdget() returns a pair that consists of struct file reference
*AND* indication whether we have grabbed a reference.  fdput()
takes such pair.

Both are inlined, and compiler is smart enough to split the
pair into two separate local variables.  The underlying
primitive actually stashes the "have grabbed the refcount"
into the LSB of returned word; see __to_fd() in include/linux/file.h
for details.  It really generates a decent code and a plenty of
places where we want a file by descriptor are just fine with it.

This patch is flat-out broken, since it loses the "have we bumped
the refcount" information - the callers do not get it.

It might be possible to massage the calling conventions to enable
the conversion to fdget(), but it's not obvious that result would
be cleaner and in any case, the patch in question doesn't even
try that.
