Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F21122DC53
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 08:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgGZGqU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 02:46:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:55850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgGZGqU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 02:46:20 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEF0B206E3;
        Sun, 26 Jul 2020 06:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595745979;
        bh=YnJ5nUz3ldqzpxZJINBMhHvr1Qjj2bXg6xaQet/rkv0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hGpqhUk+W43DFwMHDzWMYt4zpy5HWocDU2g2oRa+lgngsC4JHeT3enBp8Vnv+YzfU
         6+ZyrTaC0w2adew2hA24/12g6XiYL5aWiITPRwmdnYUSNOlHphb6XYAPJZz5o05rN1
         SpmbCBICgdlGn50PQb4rb6CZqXSag/NbosDBIV18=
Date:   Sun, 26 Jul 2020 08:46:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix code style issues
Message-ID: <20200726064615.GA415554@kroah.com>
References: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jul 26, 2020 at 11:55:42AM +0530, Rohit K Bharadwaj wrote:
> this patch fixes the warnings and errors generated after running checkpatch.pl on pci/sh_css_firmware.c
> 
> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
> ---
>  .../media/atomisp/pci/sh_css_firmware.c       | 62 +++++++++++--------
>  1 file changed, 36 insertions(+), 26 deletions(-)

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
