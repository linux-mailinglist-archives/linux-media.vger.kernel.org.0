Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9748522E1DF
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 20:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgGZSH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 14:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgGZSH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 14:07:56 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07FBC0619D2;
        Sun, 26 Jul 2020 11:07:56 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id d27so10605346qtg.4;
        Sun, 26 Jul 2020 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7QCobyC2ItfhaGKp9vOhyilsu/vFD41abiIi+idKUH4=;
        b=V7TMauH/w1Ana1kFtHdtvCoOzYrzEicGu1Y7VQh+OX3RqgbbGWUHjJE7KhUY4Jb5Iw
         a+65Vhwltu8vpzbWEN+I1yK0lPn056HV170KEzcbegvE9RjLoU5sXY3fndO2Wq8woeiZ
         +JuaBGuqq2/3Pz1ecRT4b3Kt3CbVKzYTXJFMlqCo2kDilOfdc1p0Hw32zWJp1ejySpyx
         fghCDWp2SwfsXbHL90T0OIVSErQLREljP415kl50bQoX8vrP6Zw5PC1Hhljc4O+X5ljY
         RrRyICT32tUlTSPRMLM4JnP/vJjSFg4o+naE6YvGC1A1YRiIvdMV/6TjgVSl41hPQI9h
         2fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7QCobyC2ItfhaGKp9vOhyilsu/vFD41abiIi+idKUH4=;
        b=KMM70pb5zVN7DN13WSM4PMaH3froLO3ONR5T1At4TCiUQQXWba1Fd+ERtPtOeLBqEW
         7yZM74rQWvKvIPaXaLKEj6HOEOMXzb/AN37ZpP6ODxcdxQmQPU6Gywptk0V4BT6N/qI2
         0v3WF3x1EmvlRIGt8PgJDS0OVt5oWKCn9cqJbSjtUmFosu0WNUdk/WyZD3tajhs7r8nI
         4qSu4XX4OeiBGo9fJVI81zNxSpBDIXyuEzg+SJwRQfVPUpu1UaCjPOF7PeVwX4DP63FU
         A9JI4Efzg3Glz/nUEOnmbJzQicWjmPl0zR3dxYd7Vep3dUI9RTYGkDPIjcVULKW/THq9
         n4AQ==
X-Gm-Message-State: AOAM530FQHgaiqrQuJfcL3sU2Cup2biLLirOqb0g/YRfsRQsei4zBrkC
        /QPPTVX9jj3apu3myoOuYQ==
X-Google-Smtp-Source: ABdhPJzlzTapl0f9uK6uWdZz8aGCLIpRNKb6qZDpaJ4z35xH941T2u8rGNiKrd05M+B8qqVCtQAnhw==
X-Received: by 2002:ac8:47c8:: with SMTP id d8mr17743991qtr.32.1595786875627;
        Sun, 26 Jul 2020 11:07:55 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
        by smtp.gmail.com with ESMTPSA id s5sm15852823qke.120.2020.07.26.11.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 11:07:55 -0700 (PDT)
Date:   Sun, 26 Jul 2020 14:07:52 -0400
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
Message-ID: <20200726180752.GA49356@PWN>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
 <20200726173044.GA14755@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726173044.GA14755@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jul 26, 2020 at 08:30:44PM +0300, Laurent Pinchart wrote:
> Hi Peilin,
> 
> Thank you for the patch.
> 
> On Sun, Jul 26, 2020 at 12:44:39PM -0400, Peilin Ye wrote:
> > video_put_user() is copying uninitialized stack memory to userspace. Fix
> > it by initializing `vb32` using memset().
> 
> What makes you think this will fix the issue ? When initializing a
> structure at declaration time, the fields that are not explicitly
> specified should be initialized to 0 by the compiler. See
> https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.zos.v2r3.cbclx01/strin.htm:

Hi Mr. Pinchart!

First of all, syzbot tested this patch, and it says it's "OK":

	https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59

> If a structure variable is partially initialized, all the uninitialized
> structure members are implicitly initialized to zero no matter what the
> storage class of the structure variable is. See the following example:
> 
> struct one {
>     int a;
>     int b;
>     int c;
> };
> 
> void main() {
>     struct one z1;         // Members in z1 do not have default initial values.
>     static struct one z2;  // z2.a=0, z2.b=0, and z2.c=0.
>     struct one z3 = {1};   // z3.a=1, z3.b=0, and z3.c=0.
> }

Yes, I understand that. I can safely printk() all members of that struct
without triggering a KMSAN warning, which means they have been properly
initialized.

However, if I do something like:

	char *p = (char *)&vb32;
	int i;

	for (i = 0; i < sizeof(struct vb32); i++, p++)
		printk("*(p + i): %d", *(p + i));

This tries to print out `vb32` as "raw memory" one byte at a time, and
triggers a KMSAN warning somewhere in the middle (when `i` equals to 25
or 26).

According to a previous discussion with Mr. Kroah-Hartman, as well as
this LWN article:

	"Structure holes and information leaks"
	https://lwn.net/Articles/417989/

Initializing a struct by assigning (both partially or fully) leaves the
"padding" part of it uninitialized, thus potentially leads to kernel
information leak if the structure in question is going to be copied to
userspace.

memset() sets these "uninitialized paddings" to zero, therefore (I
think) should solve the problem.

Thank you!
Peilin Ye

