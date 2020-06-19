Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E74200619
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 12:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732233AbgFSKNs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 06:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732048AbgFSKNr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 06:13:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87631C06174E
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2020 03:13:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0406556;
        Fri, 19 Jun 2020 12:13:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592561622;
        bh=eQNir4zgFL1F/vHCEC1X40mcIRTzi3uGuuUdbMII6yc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GLoRDBEkl+dVQ4c6EPEX6E5zwvwQqnZM/zs17pU6BZFr+vvtU5G7NnFSHgHl6s9N9
         HM7oO88ZerO+2gADD8pM2S7rfO7BMxNan14q833qUK0BHWw42r8dlAPFZ2hmK26Kic
         uUzZFwP2eSj7ciUvNloCGzAXkyj1wptCf7PGdaG4=
Date:   Fri, 19 Jun 2020 13:13:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH] v4l2-ctl: Fix test_ioctl cmd type
Message-ID: <20200619101319.GA5823@pendragon.ideasonboard.com>
References: <20200611023414.4702-1-paul.elder@ideasonboard.com>
 <20200619082758.GA2073@jade.amanokami.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200619082758.GA2073@jade.amanokami.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Fri, Jun 19, 2020 at 05:27:58PM +0900, Paul Elder wrote:
> ping
> 
> On Thu, Jun 11, 2020 at 11:34:14AM +0900, Paul Elder wrote:
> > test_ioctl uses int for the ioctl cmd, while it should be unsigned long.
> > Fix this.

This matches the libc ioctl() prototype and the ioctl values (the _IOC
macro produces, if I'm not mistaken, an unsigned type) and should help
avoiding sign extension issues.

> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> >  utils/v4l2-ctl/v4l2-ctl.cpp | 2 +-
> >  utils/v4l2-ctl/v4l2-ctl.h   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> > index e7b270cd..4972591e 100644
> > --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> > +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> > @@ -306,7 +306,7 @@ static void usage_all()
> >         edid_usage();
> >  }
> >  
> > -int test_ioctl(int fd, int cmd, void *arg)
> > +int test_ioctl(int fd, unsigned long cmd, void *arg)
> >  {
> >  	return options[OptUseWrapper] ? v4l2_ioctl(fd, cmd, arg) : ioctl(fd, cmd, arg);
> >  }
> > diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> > index b31be7f5..28e50471 100644
> > --- a/utils/v4l2-ctl/v4l2-ctl.h
> > +++ b/utils/v4l2-ctl/v4l2-ctl.h
> > @@ -300,7 +300,7 @@ typedef struct {
> >  
> >  // v4l2-ctl.cpp
> >  int doioctl_name(int fd, unsigned long int request, void *parm, const char *name);
> > -int test_ioctl(int fd, int cmd, void *arg);
> > +int test_ioctl(int fd, unsigned long cmd, void *arg);
> >  int parse_subopt(char **subs, const char * const *subopts, char **value);
> >  __u32 parse_field(const char *s);
> >  __u32 parse_colorspace(const char *s);

-- 
Regards,

Laurent Pinchart
