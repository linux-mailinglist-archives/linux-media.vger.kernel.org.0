Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695D52003D9
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 10:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731241AbgFSI2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 04:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731022AbgFSI2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 04:28:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF77DC06174E
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 01:28:11 -0700 (PDT)
Received: from jade.amanokami.net (unknown [IPv6:2400:4051:61:600:e972:d773:e99a:4f79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 448E3552;
        Fri, 19 Jun 2020 10:28:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592555287;
        bh=ZqDXOhlxTKEJmZDvzvBI9E4VKcmXBixVcD5phA6bZjI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KoC0oqSRG4cIHL1ar/UTnycKj8c9T3wwvgeXBRwCWtsaBs6kNS9uZD99syWHrHBq9
         4TfKedr0Tb3YHqA1SbfdLeIOIEOT2zo6JfKqmqovaIJYYwhjpu4YA0At6QP32dnLBN
         iGOqGor8n1OYx2LiniJ34xGShAX/P84UTwbWOHr0=
Date:   Fri, 19 Jun 2020 17:27:58 +0900
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH] v4l2-ctl: Fix test_ioctl cmd type
Message-ID: <20200619082758.GA2073@jade.amanokami.net>
References: <20200611023414.4702-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611023414.4702-1-paul.elder@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ping

On Thu, Jun 11, 2020 at 11:34:14AM +0900, Paul Elder wrote:
> test_ioctl uses int for the ioctl cmd, while it should be unsigned long.
> Fix this.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  utils/v4l2-ctl/v4l2-ctl.cpp | 2 +-
>  utils/v4l2-ctl/v4l2-ctl.h   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> index e7b270cd..4972591e 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> @@ -306,7 +306,7 @@ static void usage_all()
>         edid_usage();
>  }
>  
> -int test_ioctl(int fd, int cmd, void *arg)
> +int test_ioctl(int fd, unsigned long cmd, void *arg)
>  {
>  	return options[OptUseWrapper] ? v4l2_ioctl(fd, cmd, arg) : ioctl(fd, cmd, arg);
>  }
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index b31be7f5..28e50471 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -300,7 +300,7 @@ typedef struct {
>  
>  // v4l2-ctl.cpp
>  int doioctl_name(int fd, unsigned long int request, void *parm, const char *name);
> -int test_ioctl(int fd, int cmd, void *arg);
> +int test_ioctl(int fd, unsigned long cmd, void *arg);
>  int parse_subopt(char **subs, const char * const *subopts, char **value);
>  __u32 parse_field(const char *s);
>  __u32 parse_colorspace(const char *s);
> -- 
> 2.25.1
> 
