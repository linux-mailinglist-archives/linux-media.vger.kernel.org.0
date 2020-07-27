Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C7922FBCB
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 00:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgG0WFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 18:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgG0WFA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 18:05:00 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18204C061794;
        Mon, 27 Jul 2020 15:05:00 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id d14so16816746qke.13;
        Mon, 27 Jul 2020 15:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iVuPTRHNAeDbxJIJqGMzJ2wPysTPpDFSvpK97m2+rwo=;
        b=KKrVFetTr55OQ+1m/sHURefNlPvk09O9SSfcOdgGMAm4zuxZf2zAWC0vPdDs9StyHe
         gg5ArsycVSyP74J5m0Nsd0irvaQDUFdjymVgMbhv9dyfOVrSnBog0ABmlszMZjFpv8Qf
         FHk7u4eIF+rXkYulvQJ6a6XYBQVHXoiZJQmIMk1WuHF9HrUI2vcCrcnpmYpQ5LmmLEwe
         3g80DomwgA4a2yr2RnNFzlZPcwixL1rbxQV2gq0V2G6e1qkBPXNSoYDto4yKglTwBtLZ
         Hdu3c/oSdPzw1wZLuQxdmdVkcm7y32liptBK++zRSYLp7inGClfhqzU2MlOwEaWYCkxv
         NvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iVuPTRHNAeDbxJIJqGMzJ2wPysTPpDFSvpK97m2+rwo=;
        b=tbW4Cpfom1yLmrc+UxEDyLhg0JVmUZSqpsuy12SUW44/EgC1EfLq/tsmvPzIhgElA1
         OOLzgME3D+xjRjnDMDQ2KHnCem58Bklpg6lIp1E48oYkwOZTI2598BCoZ8gn7LIesLCF
         Gy87Q4HU26Uan1pZ73vw9I2o5dqSHtnUssXgouZt23BNe80+wgc0ilk1KqP1s2uLJaMy
         /NMrdi4JrUAGxeXxc/zh0X+dmMEATQDuqj2hojhnif28PHPIufBKyE49QpeqUKnBqdZM
         MDsI2+/pxZ3GGa+JiD0XU9cS7MerxAFTpw1+9w15PjHbU82MjBJPmsZ2+Qd/Jo4gLfr2
         TKSA==
X-Gm-Message-State: AOAM531LzPOtJyEu1U5wAiIp3EXiI/GRKPmHX+vhH6obLJHTk79a83dQ
        +MIfxzwEWmuVBrZLm3TCEQ==
X-Google-Smtp-Source: ABdhPJzfxFKdzL8nQ1KA2C516wzRCtGXJoI/WM2PqHeAK/4CHI1X4r58A9z6GhvCvrBKLEDROQUrkQ==
X-Received: by 2002:a05:620a:4ca:: with SMTP id 10mr22310620qks.306.1595887499368;
        Mon, 27 Jul 2020 15:04:59 -0700 (PDT)
Received: from PWN ([209.94.141.207])
        by smtp.gmail.com with ESMTPSA id l64sm5279365qkc.21.2020.07.27.15.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 15:04:58 -0700 (PDT)
Date:   Mon, 27 Jul 2020 18:04:56 -0400
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200727220456.GA328887@PWN>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727131608.GD1913@kadam>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 04:16:08PM +0300, Dan Carpenter wrote:
> drivers/char/hpet.c:675 hpet_ioctl() warn: check that 'info' doesn't leak information (struct has a hole after 'hi_timer')

This one seems like a false positive.

drivers/char/hpet.c:670:

	mutex_lock(&hpet_mutex);
	err = hpet_ioctl_common(file->private_data, cmd, arg, &info);
	mutex_unlock(&hpet_mutex);

	if ((cmd == HPET_INFO) && !err &&
	    (copy_to_user((void __user *)arg, &info, sizeof(info))))
		err = -EFAULT;

`info` is only being copied to userspace when `cmd` is `HPET_INFO`.
However, hpet_ioctl_common() is already doing memset() on `info` in
`case HPET_INFO`:

drivers/char/hpet.c:612:

	case HPET_INFO:
		{
			memset(info, 0, sizeof(*info));
			^^^^^^

Thank you,
Peilin Ye
