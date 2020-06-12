Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0155C1F79C7
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 16:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgFLO04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 10:26:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54368 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLO04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 10:26:56 -0400
Received: from jade.amanokami.net (unknown [IPv6:2400:4051:61:600:b09c:6559:5445:7c98])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D7D424F;
        Fri, 12 Jun 2020 16:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591972015;
        bh=fvBQTQWl75Sl/tCVxm5QcBYbRo8BXgMC2okLIae9eCo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L1Tr0EJLAjxZzM47lSt2QslEnVWu/9rsX8osqzhGa01zCnzmX/UO7ni6EvM1VCjqg
         wUDqzj+Y4cA70UaEjqvg+Jaa+QvNzHuZZS/XxutfQAhQWIs9TeJv7fb3LriISwHULV
         u2oC/smbU29NbKd/98LUpUZ/iD+qLkKSwG+40L6U=
Date:   Fri, 12 Jun 2020 23:26:46 +0900
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH] v4l2-compliance: Kill child after failed streamoff test
 blocks
Message-ID: <20200612142646.GC1777@jade.amanokami.net>
References: <20200612141107.43344-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141107.43344-1-paul.elder@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 12, 2020 at 11:11:07PM +0900, Paul Elder wrote:
> The test to test that a forked child process can do VIDIOC_STREAMOFF
> without being blocked does not kill the child in the event of a failure
> (ie. the child process blocks on VIDIOC_STREAMOFF). This causes the
> video device node to still be in use even after v4l2-compliance
> completes execution. Kill the child process after this test fails.

As we just discussed on irc, I'll convert this test to pthreads, so this
patch can be disregarded.


Thanks,

Paul

> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index fc49fff6..896e8e14 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -2282,6 +2282,8 @@ static int testBlockingDQBuf(struct node *node, cv4l_queue &q)
>  	usleep(250000);
>  	pid = waitpid(pid_streamoff, &wstatus_streamoff, WNOHANG);
>  	kill(pid_dqbuf, SIGKILL);
> +	if (pid != pid_streamoff)
> +		kill(pid_streamoff, SIGKILL);
>  	fail_on_test(pid != pid_streamoff);
>  	/* Test that the second child exited properly */
>  	if (!pid || !WIFEXITED(wstatus_streamoff)) {
> -- 
> 2.27.0
> 
