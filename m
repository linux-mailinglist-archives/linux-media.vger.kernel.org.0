Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4493344465B
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 17:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233018AbhKCQ5L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 12:57:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:52452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232870AbhKCQ5K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Nov 2021 12:57:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A00461053;
        Wed,  3 Nov 2021 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635958473;
        bh=jO5V5YGkKZKCIIFUKlx4t5qdcFJRnyfTr9k5CI4kRxU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gzDGaCn5SjzHy/iIOG0t5Kv/B2qv58ao2WWhWgwwfP745Z8cGpV7C/HfIFrk726Bw
         reKMlOSZk9p2q7B3PLtiJvgYiU4sKpuZ367tW1irGeNazp8wc3UaWCnlWJxVpP2rpT
         hKGUSWjvtCSXae3Huw04rQ9G4x9a5Z4IvWKhJMsoUeVWqQVcPMp3ZqbbYOlimaRr9v
         R2Nt6p7DOZ1LwGvx8EHFjtvF7RUewJ0vMiLSW5QVoAvyGKUhf2YZbZyPRRfpd7ZirK
         c58+w7vqn7Iaj4gf/vxshko9SLO9aFZ2OAwhO7QZDfAeIIUt3LVtvZqdDxUyebjm5W
         +C40Va2QDafeA==
Date:   Wed, 3 Nov 2021 16:54:24 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>, linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: atomisp current issues
Message-ID: <20211103165424.67296e13@sal.lan>
In-Reply-To: <c39cac68-73ab-4ab0-a701-e92f01c92774@xs4all.nl>
References: <20211103135418.496f75d5@sal.lan>
        <c39cac68-73ab-4ab0-a701-e92f01c92774@xs4all.nl>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 3 Nov 2021 15:41:05 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> On 03/11/2021 14:54, Mauro Carvalho Chehab wrote:
> > Hi,
> > 
> > From what I've seen so far, those are the main issues with regards to V4L2 API,
> > in order to allow a generic V4L2 application to work with it.
> > 
> > MMAP support
> > ============
> > 
> > Despite having some MMAP code on it, the current implementation is broken. 
> > Fixing it is not trivial, as it would require fixing the HMM support on it, 
> > which does several tricks.
> > 
> > The best would be to replace it by something simpler. If this is similar
> > enough to IPU3, perhaps one idea would be to replace the HMM code on it by 
> > videodev2 + IPU3 HMM code.
> > 
> > As this is not trivial, I'm postponing such task. If someone has enough
> > time, it would be great to have this fixed.
> > 
> > From my side, I opted to add support for USERPTR on camorama:
> > 
> > 	https://github.com/alessio/camorama
> > 
> > As this is something I wanted to do anyway, and it allowed me to cleanup
> > several things in camorama's code.
> > 
> > Support for USERPTR is not autodetected. So, this should be selected  
> 
> You can autodetect this: the capabilities field returned by VIDIOC_REQBUFS
> or VIDIOC_CREATE_BUFS will indicate support for this. This works with any
> vb2-based driver.
> 
> Just thought I should mention this...

Yeah, surely the app could try it, but:

1. As libv4l doesn't support USERPTR, such detection should happen
   early inside camorama code;

2. Atomisp does have support for MMAP, but it is broken.
   (this is the most relevant reason)

Ok, we could change it to return -ENOIOCTLCMD for mmap, and add
a basic logic at camorama that would try to call REQBUFS in order
to verify if -ENOIOCTLCMD is returned.

Perhaps one more item to our todo list, if nobody fixes MMAP before
that.

Regards,
Mauro
