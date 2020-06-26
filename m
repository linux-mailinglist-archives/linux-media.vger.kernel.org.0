Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D82720AB5B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 06:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgFZE3e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 00:29:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:34032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726607AbgFZE3e (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 00:29:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FDF520706;
        Fri, 26 Jun 2020 04:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593145774;
        bh=p9585eEAPpWi8dV6JrEUxvDdogWQKRBDutyAYFiyGjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AUCKy9VcNr+VipBQNpzsuXr5km/afx6y28IO3qabI3Pc0QSEKwcMea4Etv6ef5iWC
         mMQxAHvWzn8F7jXHlG7ZeWYWyPhbsij2QTvv5lPRw0L3WZzibeS/oy7sJtsV9c/0O+
         N4GRlrUFd8JAFObuukKm8aaTVnHgErA8SxS10ftQ=
Date:   Fri, 26 Jun 2020 06:29:30 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     B K Karthik <bkkarthik@pesu.pes.edu>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fixing ERROR: Macros with complex values must be
 enclosed within parentheses.
Message-ID: <20200626042930.GA174910@kroah.com>
References: <20200626021723.len2cts3ffq4wimq@pesu-pes-edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626021723.len2cts3ffq4wimq@pesu-pes-edu>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 25, 2020 at 10:17:23PM -0400, B K Karthik wrote:
> soc_camera.c:
> 
> fixing ERROR: Macros with complex values must be enclused within parentheses.
> 
> Signed-off-by: B K Karthik <karthik.bk2000@live.com>
> ---
>  drivers/staging/media/soc_camera/soc_camera.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
