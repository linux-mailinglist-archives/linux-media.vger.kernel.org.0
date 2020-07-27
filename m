Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39EA122F3DA
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 17:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729693AbgG0Pah (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 11:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgG0Pag (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 11:30:36 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C665C061794;
        Mon, 27 Jul 2020 08:30:36 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id u8so7616591qvj.12;
        Mon, 27 Jul 2020 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=06/0Fc/CzxtKe/AQi80TbkGLzxKNq+FXAhjScQa1P0w=;
        b=DMDO/s0VURJbuRU3EHjXuLMdKHeGJSp2p9miEcOKpygLfWx3etfGBJvyZT6YdaZv+D
         cRoFG+Y+3ZnrS9yjMKJeiB0VelIwPoCw1EqPPnVv2zHz3BT28EHOgaRMlAD8lBHtJSV2
         swA4A9tm6Gr6T7RraR1YT/GNZ2z1TVHDrKojgEASJ9i+C1WXyMQDEZvJIv8tYeF/jp7S
         Tz9tY4hGgzbJZO8677sk2m2r2b3E4NQT2kL4hY1SAiikCv20LlP77egY5OY91ZRUSADj
         BK240vqACl1y5S2tAum2n+iasGs2ljw/dzEQQdijqTFEuVEbFezqKj92L1fG5KWU/Mt+
         X43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=06/0Fc/CzxtKe/AQi80TbkGLzxKNq+FXAhjScQa1P0w=;
        b=o3xGibHCqN4ftcE2X91ivADbsm3IIThXFMoIlAjbF8bAjAWJNoKUIM1eI0EpqAiX0y
         gBu9vvGR1wsQfFnwOzrr0hzVqGprHiu719FoMZ6SuGNdBSbxHjfA1JawWt8v20v/Ji2Z
         NNl84/KlIB97hbGDXNzVhyAW86YnBE3k5qV4rgwUkOx8d04tYpFWafvaDOH7aiSYApAa
         8kTTd67nDXYfK0Y8JSrlIITJJmsCu6ucBC/sRD+8MKu+Y1SRL3uSjJv6v42Fa+6ESyMS
         QDp3gdhpMnjqVu6L8yeHMiUt+DxXBR+jTSxyLXL6Hm4eCeML5f27TFr0ACJR8o/+nkox
         X5fw==
X-Gm-Message-State: AOAM531L1CDfbha934atYsv3fRMVxuNpv+uLsSfWO0SWEc1K8DNE5iWX
        pKVw4LrLQv/MVEuQO+pwig==
X-Google-Smtp-Source: ABdhPJw5MjdGAe9ULHqTPC3/a5mAB9/7H9/flRqXH8RawvWje9UzoAdVymmniLR/3m88yRIKeSCTXQ==
X-Received: by 2002:a05:6214:1143:: with SMTP id b3mr21082466qvt.84.1595863835563;
        Mon, 27 Jul 2020 08:30:35 -0700 (PDT)
Received: from PWN ([209.94.141.207])
        by smtp.gmail.com with ESMTPSA id c133sm19928340qkb.111.2020.07.27.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:30:34 -0700 (PDT)
Date:   Mon, 27 Jul 2020 11:30:32 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200727153032.GB315139@PWN>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
 <20200727141416.GA306745@PWN>
 <20200727144609.GG1913@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727144609.GG1913@kadam>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 05:46:09PM +0300, Dan Carpenter wrote:
> On Mon, Jul 27, 2020 at 10:14:16AM -0400, Peilin Ye wrote:
> > Yes, I would like to! I will start from:
> > 
> > 	drivers/firewire/core-cdev.c:463
> 
> My prefered fix for this would be to add a memset at the start of
> fill_bus_reset_event().
> 
> 	memset(event, 0, sizeof(*event));
> 
> 	spin_lock_irq(&card->lock);
> 
> 	event->closure       = client->bus_reset_closure;
> 
> 
> > 	drivers/input/misc/uinput.c:743

I just sent a patch to fix this as you suggested.

> I don't think this is a bug.

I see. I am now fixing:

	block/scsi_ioctl.c:707 scsi_put_cdrom_generic_arg() warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')
