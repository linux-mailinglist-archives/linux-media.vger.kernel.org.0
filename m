Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6287D22E302
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 00:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgGZWIf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 18:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgGZWIf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 18:08:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E733C0619D2;
        Sun, 26 Jul 2020 15:08:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60DE151D;
        Mon, 27 Jul 2020 00:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595801311;
        bh=KUaPOkg636bLdNE8/asczb6N8L2ExnhjaO2k2jCo0LQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PSBrJrvay92ecq4JbixGxKIabJQmc4pZJaNk3A/wXXfD3Ekkbfpt7ZT6g2Y8a0057
         /CfKIjl0AnCKZ3jw5eSwIWM8oliHSnhewGDEZy0sr4Mjz/s6eIajbulW7/E0mI5ee2
         /cvTxgegR9ug5m2pbBZkLTCjthrHkLQewsX4SGnw=
Date:   Mon, 27 Jul 2020 01:08:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200726220823.GI28704@pendragon.ideasonboard.com>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
 <20200726173044.GA14755@pendragon.ideasonboard.com>
 <20200726180752.GA49356@PWN>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200726180752.GA49356@PWN>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Peilin,

On Sun, Jul 26, 2020 at 02:07:52PM -0400, Peilin Ye wrote:
> On Sun, Jul 26, 2020 at 08:30:44PM +0300, Laurent Pinchart wrote:
> > Hi Peilin,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Jul 26, 2020 at 12:44:39PM -0400, Peilin Ye wrote:
> > > video_put_user() is copying uninitialized stack memory to userspace. Fix
> > > it by initializing `vb32` using memset().
> > 
> > What makes you think this will fix the issue ? When initializing a
> > structure at declaration time, the fields that are not explicitly
> > specified should be initialized to 0 by the compiler. See
> > https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.zos.v2r3.cbclx01/strin.htm:
> 
> Hi Mr. Pinchart!
> 
> First of all, syzbot tested this patch, and it says it's "OK":
> 
> 	https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> 
> > If a structure variable is partially initialized, all the uninitialized
> > structure members are implicitly initialized to zero no matter what the
> > storage class of the structure variable is. See the following example:
> > 
> > struct one {
> >     int a;
> >     int b;
> >     int c;
> > };
> > 
> > void main() {
> >     struct one z1;         // Members in z1 do not have default initial values.
> >     static struct one z2;  // z2.a=0, z2.b=0, and z2.c=0.
> >     struct one z3 = {1};   // z3.a=1, z3.b=0, and z3.c=0.
> > }
> 
> Yes, I understand that. I can safely printk() all members of that struct
> without triggering a KMSAN warning, which means they have been properly
> initialized.
> 
> However, if I do something like:
> 
> 	char *p = (char *)&vb32;
> 	int i;
> 
> 	for (i = 0; i < sizeof(struct vb32); i++, p++)
> 		printk("*(p + i): %d", *(p + i));
> 
> This tries to print out `vb32` as "raw memory" one byte at a time, and
> triggers a KMSAN warning somewhere in the middle (when `i` equals to 25
> or 26).
> 
> According to a previous discussion with Mr. Kroah-Hartman, as well as
> this LWN article:
> 
> 	"Structure holes and information leaks"
> 	https://lwn.net/Articles/417989/
> 
> Initializing a struct by assigning (both partially or fully) leaves the
> "padding" part of it uninitialized, thus potentially leads to kernel
> information leak if the structure in question is going to be copied to
> userspace.
> 
> memset() sets these "uninitialized paddings" to zero, therefore (I
> think) should solve the problem.

You're absolutely right. I wasn't aware the compiler wouldn't initialize
holes in the structure. Thank you for educating me :-)

For the patch,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
