Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7E51E4AB2
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 18:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391453AbgE0Qp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 12:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387952AbgE0QpZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 12:45:25 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17A3C05BD1E;
        Wed, 27 May 2020 09:45:24 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id fs4so1743114pjb.5;
        Wed, 27 May 2020 09:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HOBnpx8HZKNA2mYIrdIzHPO79IIq+OTFtfJlgxpJynw=;
        b=p4Ckd5waAaTuvezAffm07NRV85HZodPW8wNla6B8uK/gXbUpwtX5HwUMRwlRt3Fdfh
         q2Giqjv+VG1ScvnivS3X3fmz31jXmDS8roFzNGnrS/HiWq4o8MSg+UyNhvKCbCsQv4vy
         FtPuEoMZSz1dZ7J4ExxMdMRMPIc2OOJiB5+mnuGh5KbMyuqRgRDnFgVlUIb/DoqtyC1I
         um+HfeHStBaBKv54odL4+T7QBiDqyR3cntNfh9Y+8us1fkWTCMz7Hk8KQCyhqH2EAGjP
         9GWSvpiZGfyqffIG24RHMBYKSuKLiAR9TGMuhGwYrfr9IwDxVlFuqDBtCi3JGA1g0DZb
         nqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HOBnpx8HZKNA2mYIrdIzHPO79IIq+OTFtfJlgxpJynw=;
        b=Lw3F1ykj/alalyaG5ccwoeCnzkyIz8xQWRkgRECJ+7CkPj1jA8Vx5jFlkk+45ZdwOI
         vpSL/ySISKADeMDYYaZ1bmVMDenmwJIs+R3qC6X6BtvekESDxGGR5J2PBvpxikZFWFIS
         Ui6Qb6RYkXhO1NpjZiaLamF9JXGmVmCI9e2hyK2GJ/CcJkc7kKKOdC6cYOTm8I0n8l3a
         3Jbv3gBTn+9IejhHIice2WrVzovqL/ouN7QtJ9AOrxJIH/4Rd/MbneKILZ4ofzyyIDDi
         c61kwqWvOfNZ0+aF6krBu5rstxl3AEF+0y52PebsIQ7IozRT2xph+asV0YAbWcRCiPmc
         BvdQ==
X-Gm-Message-State: AOAM533nhhM1Tlx8HFgyOmNK16gETI6a8vDYdAS0B2kYKaxGlb82YgLw
        +nUl8GUzTpkb5sh8EB+urSI=
X-Google-Smtp-Source: ABdhPJxqHB/iYSQ/+IIgLYnRKb0OQneD8BTKop/Sw/gGN6GWtWYe7tcz1W0KOcQOXoNpZgVtiC+KMQ==
X-Received: by 2002:a17:902:a584:: with SMTP id az4mr6717595plb.201.1590597924251;
        Wed, 27 May 2020 09:45:24 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id c12sm3147692pjm.46.2020.05.27.09.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 09:45:23 -0700 (PDT)
Date:   Wed, 27 May 2020 09:45:21 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 0/7] media: atomisp: Address several clang warnings
Message-ID: <20200527164521.GA1239557@ubuntu-s3-xlarge-x86>
References: <20200527071150.3381228-1-natechancellor@gmail.com>
 <20200527104525.5e6cd93b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527104525.5e6cd93b@coco.lan>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 27, 2020 at 10:45:25AM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 27 May 2020 00:11:43 -0700
> Nathan Chancellor <natechancellor@gmail.com> escreveu:
> 
> > Hi all,
> > 
> > This series aims to clean up the code while addressing the majority of
> > clang warnings in this driver, some found by the 0day bot and others
> > found by me.
> > 
> > There are several enum conversion warnings that happen, which I do not
> > really know how to solve without understanding how exactly this driver
> > works. I would appreciate some guidance or a solution. Below are the
> > warnings, sorry for not wrapping them but they would be hard to read
> > otherwise.
> 
> ... 
> > ../drivers/staging/media/atomisp//pci/atomisp_compat_css20.h:117:22: note: expanded from macro 'CSS_ID'
> > #define CSS_ID(val)     (IA_ ## val)
> ...
> 
> I actually wrote a patch getting rid of this ugly thing:
> 
> 	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp_v3&id=cf6a15543ace1e99364911c0b7a2f6b8f2f43021
> 
> This one was already submitted upstream (not merged yet), but there
> are also lots of other patches on my working tree.

Ah excellent, that makes the warnings a lot more readable. I am still
not sure how to reconcile the differences, it might be easier to just
change the types in the struct to int.

../drivers/staging/media/atomisp/pci/atomisp_subdev.c:49:68: warning: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Wenum-conversion]
        { V4L2_MBUS_FMT_CUSTOM_NV21, 12, 12, IA_CSS_FRAME_FORMAT_NV21, 0, IA_CSS_FRAME_FORMAT_NV21 },
        ~                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp/pci/atomisp_subdev.c:49:39: warning: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Wenum-conversion]
        { V4L2_MBUS_FMT_CUSTOM_NV21, 12, 12, IA_CSS_FRAME_FORMAT_NV21, 0, IA_CSS_FRAME_FORMAT_NV21 },
        ~                                    ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp/pci/atomisp_subdev.c:48:68: warning: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Wenum-conversion]
        { V4L2_MBUS_FMT_CUSTOM_NV12, 12, 12, IA_CSS_FRAME_FORMAT_NV12, 0, IA_CSS_FRAME_FORMAT_NV12 },
        ~                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp/pci/atomisp_subdev.c:48:39: warning: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Wenum-conversion]
        { V4L2_MBUS_FMT_CUSTOM_NV12, 12, 12, IA_CSS_FRAME_FORMAT_NV12, 0, IA_CSS_FRAME_FORMAT_NV12 },
        ~                                    ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/staging/media/atomisp/pci/atomisp_subdev.c:47:34: warning: implicit conversion from enumeration type 'enum ia_css_frame_format' to different enumeration type 'enum atomisp_input_format' [-Wenum-conversion]
        { MEDIA_BUS_FMT_JPEG_1X8, 8, 8, IA_CSS_FRAME_FORMAT_BINARY_8, 0, ATOMISP_INPUT_FORMAT_BINARY_8 },
        ~                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
5 warnings generated.

> I'll try to apply your patch series on it, once I'll be able to
> fix a bug with mmap support.

It looks like all of them apply to your experimental branch aside from
patch 3, which you handled in a different way.

Cheers,
Nathan
