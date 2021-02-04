Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37CA30F779
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 17:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237876AbhBDQQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 11:16:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:42948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237569AbhBDQPr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Feb 2021 11:15:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F219B64F46;
        Thu,  4 Feb 2021 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612455307;
        bh=jSR+H2Se7RwSPIQ6c8R1g7IEE/b08qVRfo7IMR76jI0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VGH6P1BQ2eHG1hty/IFQNVUKQxzv2eZt3/VSB+Qnp3uIIpfvAxm0muRUlkXeK49SD
         coQNlOoyrEjShdzxyYbnyFopg+Jd6cyiWofV1IPD/UjtihkkGDjxOWBXbtXNHal9a5
         867rCWNC0U0vCwpncrUlbt/jbwDUWGMMV9vLtqmQ=
Date:   Thu, 4 Feb 2021 17:15:04 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ayush <ayush@disroot.org>
Cc:     mchehab@kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix coding style issues in
 timer.c
Message-ID: <YBwdiIgrMGIpziEA@kroah.com>
References: <20210131182529.112629-1-ayush@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210131182529.112629-1-ayush@disroot.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jan 31, 2021 at 11:55:29PM +0530, Ayush wrote:
> - Fix unneeded brace in if condition(also, brace was on next line).
> - Fix leading space warning before struct ia_css_clock_tick *curr_ts.
> 
> compile tested only (on next-20210129)
> 
> Signed-off-by: Ayush <ayush@disroot.org>
> ---
>  .../staging/media/atomisp/pci/runtime/timer/src/timer.c    | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
