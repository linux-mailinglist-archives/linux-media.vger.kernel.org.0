Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E167522E310
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 00:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgGZWPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 18:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGZWPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 18:15:16 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FAB6C0619D2;
        Sun, 26 Jul 2020 15:15:15 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id g26so13711472qka.3;
        Sun, 26 Jul 2020 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lYTK0Cb3cN0oru/eBKA51sHEvh1EM60eDT1VBtlot+Y=;
        b=uWvH6L+KGS9WbhlXtAw26c3lrrWVX0uM6pJIfxuh6zZlOcb2hSvT+wkrBX08GocMgl
         hUh0bd8i83H7nMr3UVc8jJmLFGSaPaUA3TwMSpkciFzj0DhBmU6LmMkzRTE3sFaufpVY
         NONbpW3sMAqR3y7jPqzdUSF00AzMzZwwJCtsdS/a0q7Xz2+4ucblqMeDi5rTi9iGTg7Y
         Mg2AIG+IaOkgQwi0BdydES5agtmwi8e/5LyRsq512sci9yZArciKSDduBG1Z0Bb5EPRg
         znbsjzrMKQDfWocazwvH4n8LDFknJmDNIwsruPCPqsGy6PJ3CW7wiD467C3zY0lkXjVJ
         LF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lYTK0Cb3cN0oru/eBKA51sHEvh1EM60eDT1VBtlot+Y=;
        b=gvqbDN0WyF0pwDMWFoRS71aW7R3zyLBR/bDZwl+c9BnKc3uBhnxUW/A0KdKgvsLJx5
         zaT8T/+KgrwoZz5G7KKBENqfV0gGF0bHza5kS1TE4oaud4CXcU3moHQkpRgeZ4yzhpKy
         Wp7l3QZmUbaW4eohKC8hjrvWTQqwIrYCbcKcPROXXJuEa1rR2rMwKsNKQ1h/sX1ozMYU
         eYTIBtH9At4zw4HH8R/UyqLjtOwbDC1C5xBry1JcaG78O0W2TWOKhpSOJdNndw2dfuSy
         /uQqDLR44KnU0emrpIOHjDltD03WoJpkYCTyw2/V62hlKcXKph0L8Gbgx42BKuxEIPdo
         yqXA==
X-Gm-Message-State: AOAM530u6j3EtNuNYupZrew/aoNK6MMGZE8IM2TFz/uUQ1NxtzFHgghg
        yZ6WZxX1BvyrmMUFT37kXJhnOgwg1g==
X-Google-Smtp-Source: ABdhPJxbgUw9Yi1PTtR0qp1W6oVvtOvAU2bbMzhoHpjTL0HdJf1ShRyD3T8eNW+NxeM5u2ReWyo8JA==
X-Received: by 2002:a37:d97:: with SMTP id 145mr20136700qkn.218.1595801714732;
        Sun, 26 Jul 2020 15:15:14 -0700 (PDT)
Received: from PWN ([209.94.141.207])
        by smtp.gmail.com with ESMTPSA id r48sm11573138qtr.17.2020.07.26.15.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:15:14 -0700 (PDT)
Date:   Sun, 26 Jul 2020 18:15:12 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200726221512.GA102357@PWN>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
 <20200726173044.GA14755@pendragon.ideasonboard.com>
 <20200726180752.GA49356@PWN>
 <20200726220823.GI28704@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726220823.GI28704@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 01:08:23AM +0300, Laurent Pinchart wrote:
> Hi Peilin,
> 
> On Sun, Jul 26, 2020 at 02:07:52PM -0400, Peilin Ye wrote:
> > On Sun, Jul 26, 2020 at 08:30:44PM +0300, Laurent Pinchart wrote:
> > > Hi Peilin,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Sun, Jul 26, 2020 at 12:44:39PM -0400, Peilin Ye wrote:
> > > > video_put_user() is copying uninitialized stack memory to userspace. Fix
> > > > it by initializing `vb32` using memset().
> > > 
> > > What makes you think this will fix the issue ? When initializing a
> > > structure at declaration time, the fields that are not explicitly
> > > specified should be initialized to 0 by the compiler. See
> > > https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.zos.v2r3.cbclx01/strin.htm:
> > 
> > Hi Mr. Pinchart!
> > 
> > First of all, syzbot tested this patch, and it says it's "OK":
> > 
> > 	https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > 
> > > If a structure variable is partially initialized, all the uninitialized
> > > structure members are implicitly initialized to zero no matter what the
> > > storage class of the structure variable is. See the following example:
> > > 
> > > struct one {
> > >     int a;
> > >     int b;
> > >     int c;
> > > };
> > > 
> > > void main() {
> > >     struct one z1;         // Members in z1 do not have default initial values.
> > >     static struct one z2;  // z2.a=0, z2.b=0, and z2.c=0.
> > >     struct one z3 = {1};   // z3.a=1, z3.b=0, and z3.c=0.
> > > }
> > 
> > Yes, I understand that. I can safely printk() all members of that struct
> > without triggering a KMSAN warning, which means they have been properly
> > initialized.
> > 
> > However, if I do something like:
> > 
> > 	char *p = (char *)&vb32;
> > 	int i;
> > 
> > 	for (i = 0; i < sizeof(struct vb32); i++, p++)
> > 		printk("*(p + i): %d", *(p + i));
> > 
> > This tries to print out `vb32` as "raw memory" one byte at a time, and
> > triggers a KMSAN warning somewhere in the middle (when `i` equals to 25
> > or 26).
> > 
> > According to a previous discussion with Mr. Kroah-Hartman, as well as
> > this LWN article:
> > 
> > 	"Structure holes and information leaks"
> > 	https://lwn.net/Articles/417989/
> > 
> > Initializing a struct by assigning (both partially or fully) leaves the
> > "padding" part of it uninitialized, thus potentially leads to kernel
> > information leak if the structure in question is going to be copied to
> > userspace.
> > 
> > memset() sets these "uninitialized paddings" to zero, therefore (I
> > think) should solve the problem.
> 
> You're absolutely right. I wasn't aware the compiler wouldn't initialize
> holes in the structure. Thank you for educating me :-)
> 
> For the patch,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

:O No no sir, I'm just rephrasing that LWN article.

Thank you for reviewing the patch! 

Peilin Ye
