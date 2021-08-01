Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C615F3DCC22
	for <lists+linux-media@lfdr.de>; Sun,  1 Aug 2021 16:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbhHAOmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Aug 2021 10:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbhHAOmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Aug 2021 10:42:01 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00516C06175F
        for <linux-media@vger.kernel.org>; Sun,  1 Aug 2021 07:41:53 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 67BD5C636F; Sun,  1 Aug 2021 15:41:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1627828910; bh=m7ZlxCJqizc2sVd5PaLC0jlI6IySpBaTvoyJ5LCgbE4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rhn9ZiJFLBZs6GzCSD4BvqXAxTAZAGHHB+r07zPIL+AOLPT1u/yVf7gzWjZoyezuX
         T7ZZlUSpygJWuRvQkKCz9g1SLlAgz5Z+uao5HgcSl0ZmGXzDGKS1YRJZLj3tmORb0N
         N4Z3+P0xqVY2QLsve7lJlM4D9CDjndPGixPvxbvHpo5Q2F4I23DJ1I+KaL+Z3BbkwW
         XOySSZcgG4Cvg8VpsOLin9H7U2pdVimfd3kH0X6Nob3g+McVzK8z9kdGHtsVSRW4/J
         g0dBmswqoTAtMambEejPWEyCjEZplEgJYEyerbOWYPOnN/paMPcvUi0qqgqtPW0F4+
         t8S2nmk0jPuIg==
Date:   Sun, 1 Aug 2021 15:41:50 +0100
From:   Sean Young <sean@mess.org>
To:     nil Yi <teroincn@gmail.com>
Cc:     crope@iki.fi, linux-media@vger.kernel.org
Subject: Re: [BUG]: drivers: media: dvb-frontends: rtl2832_sdr.c: a dangling
 pointer may cause double free
Message-ID: <20210801144150.GA17214@gofer.mess.org>
References: <CANTwqXCapbBTXEx1ow9QBw_h0mqCq_myRvmTN=2KpsEEBBJFKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANTwqXCapbBTXEx1ow9QBw_h0mqCq_myRvmTN=2KpsEEBBJFKg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Sun, Aug 01, 2021 at 03:08:16PM +0800, nil Yi wrote:
> Hi,
> I found there is a dangling pointer in  rtl2832_sdr_alloc_urbs which
> may cause double free in v5.14-rc3
> 
> in rtl2832_sdr_alloc_urbs:
> 
> 379: for (j = 0; j < i; j++)
> 380:    usb_free_urb(dev->urb_list[j]);
> it frees all the urbs but forgets to set the dev->urbs_initialized to
> zero, which will be used in function  rtl2832_sdr_free_urbs:
> 
> 357: for (i = dev->urbs_initialized - 1; i >= 0; i--) {
> 358:     if (dev->urb_list[i]) {
> 359:          dev_dbg(&pdev->dev, "free urb=%d\n", i);
> 360:                /* free the URBs */
> 361:              usb_free_urb(dev->urb_list[i]);
> 362: }
> 363: }
> 364:    dev->urbs_initialized = 0;
> 
> 
> I'm not sure whether this double free would be triggered or not,
> similar issue happened in commit b7f870510384 <media: tm6000: double
> free if usb disconnect while streaming>
> 
> Any feedback would be appreciated, thanks :)

I am not quite sure how this bug could be triggered, since this would involve
rtl2832_sdr_start_streaming() being called and then failing, and then
rtl2832_sdr_stop_streaming() being called even though start failed (I don't
think that happens).

Note that the code around this is pretty ugly; it might be nicer to remove
urbs_initialized and simply rely on the fact the the urb_list[i] entry
is non-null if it needs to be freed. That would be a great patch. :-)

For discussion it is best if you post a patch and then we can discuss the
patch itself rather than "is there a possible way this could go wrong".


Sean
