Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE5E19E1E8
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 02:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgDDAV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 20:21:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53728 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgDDAV6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 20:21:58 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42F24321;
        Sat,  4 Apr 2020 02:21:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585959716;
        bh=yISGOexUXpRvRg7Jt5xQI1yOLeEob8QXDDqtcGTJvyo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vYWyy3eeKnYr9FAklrONkxYQAFjBLYd7UyMzBgv6dN8niEc4/SKwnSgcD+mlBhNbs
         COoXW/6KLF3K+2D6YCvDN1y4z2UsaLo68L0Wk3AW0WWgH6AdCguyS3MHG6OcaBWQSD
         zmgDovrDYEkZQpqgZhwFsa0ta13nownChq1TxE6Y=
Date:   Sat, 4 Apr 2020 03:21:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Joe Perches <joe@perches.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200404002147.GG9690@pendragon.ideasonboard.com>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
 <b1e6213ba9f67da8278dd5c5f5e4def8ab927c83.camel@perches.com>
 <20200403193242.38611906@coco.lan>
 <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
 <CAHp75Vf+m_qzOwZb38dObLpKV2N27-J_7beqffhFVoSHaNV2vg@mail.gmail.com>
 <20200404001425.GC4394@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200404001425.GC4394@kekkonen.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sat, Apr 04, 2020 at 03:14:25AM +0300, Sakari Ailus wrote:
> On Fri, Apr 03, 2020 at 09:32:42PM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 3, 2020 at 8:54 PM Joe Perches <joe@perches.com> wrote:
> > > On Fri, 2020-04-03 at 19:32 +0200, Mauro Carvalho Chehab wrote:
> > > > Em Fri, 03 Apr 2020 09:56:42 -0700
> > > > Joe Perches <joe@perches.com> escreveu:
> > 
> > > It _might_ be useful to use a CONFIG_MEDIA_SUPPORT guard
> > > in lib/vsprintf for this.
> > 
> > No need. FourCC, if Sakari makes it more generic, can be used for
> > other purposes, e.g. printing component names from the chips (not
> > related to media at all).
> 
> Could you elaborate?
> 
> This could be already used on DRM, presumably, and that does not depend on
> CONFIG_MEDIA_SUPPORT. I don't know how much there would be a need for that,
> though, but this remains a possibility.

/**
 * drm_get_format_name - fill a string with a drm fourcc format's name
 * @format: format to compute name of
 * @buf: caller-supplied buffer
 */
const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf)
{
	snprintf(buf->str, sizeof(buf->str),
		 "%c%c%c%c %s-endian (0x%08x)",
		 printable_char(format & 0xff),
		 printable_char((format >> 8) & 0xff),
		 printable_char((format >> 16) & 0xff),
		 printable_char((format >> 24) & 0x7f),
		 format & DRM_FORMAT_BIG_ENDIAN ? "big" : "little",
		 format);

	return buf->str;
}
EXPORT_SYMBOL(drm_get_format_name);

I'm not advocating for one approach or the other in this case, but we
should standardize 4CC printing between the two subsystems.

-- 
Regards,

Laurent Pinchart
