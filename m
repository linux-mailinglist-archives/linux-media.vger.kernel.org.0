Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2ED217DD0
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 05:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgGHD7o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 23:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728673AbgGHD7o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 23:59:44 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEBDC061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 20:59:44 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w17so3153502ply.11
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 20:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Gb2ZiRbVvhfcqSpGJbHmjVHEZVNfIm+KO0rMkbQ5K8=;
        b=ljblZgI4EhdbMIlLU4UG3jWffhJhioo3FZtyNTUH669eHwKWvgOggcziRTUOAkwvmg
         m0LTY1AZ79bqxllpQaLeR5sFNhheiUhduKNBSnYWZDbOCuWtkXBvPII9I2obV/mOkyFc
         W2lkyvTTjiGg8TQypAmGiQMOzRefcKaVtt//sSZ0EjZNY0+QsB42bkMhF9prkdBAuSgc
         1ci4Gyjt6Fmb7YnUUnZbpx0vkgMeOfGDX6vYetRfjzSa38iX8DGP8Zt4/AnuYHHgZUwA
         TWhCcgFbKEZHqroU0aELt/0JgHesBcNQx1YH/1+9oUbZKjo47Tq4F+cspz2qdLeEiuuT
         O6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Gb2ZiRbVvhfcqSpGJbHmjVHEZVNfIm+KO0rMkbQ5K8=;
        b=X9PQXBdDX4kqjL5lGIfg1tGgo/EQ2/xIAVn2by8FO88s/lgGzJrNeZdswt2ptpXuLA
         G8pjGM3vVUNgdY/dFYvlNGQ9RFC4r0zQ3Dn/g0BSZs6ltWIjZIXc2C3OZ8ztDN02v/Fa
         o+1adfu2WAKhfS7EUjpcQWypHT9Qz+EJRMeGm3nqSf1UD4KivrbqOBLR9RFTz1W4xYHH
         JJDCjSaxF3APHfp/VvPCArxYVAmZ5mYoEchyjM1cl57/CqFfHr+m/ccvqkPk+/U6dbX6
         JS1dP/PC/r+8EyoM4k5zeXdKOF6wUNa20ckjk63TPVnlCYVXv5lIwQ4QW9zXt/WlF4tv
         BJdA==
X-Gm-Message-State: AOAM532NVACkezivL4Owt3FcSrHONm8KqFF9bSw7TpglPbTra+CQHQb2
        h1vwDyvGzYn/lm/sIu59bZc=
X-Google-Smtp-Source: ABdhPJz6aNn4/91SulTOaplHScm5usZViPbf/rK0NVvBQLeEAK1rQN6Nc9COJ3zxGa+C5YSL5v04CQ==
X-Received: by 2002:a17:902:9a02:: with SMTP id v2mr33691299plp.59.1594180783696;
        Tue, 07 Jul 2020 20:59:43 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id j2sm4769600pjy.1.2020.07.07.20.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 20:59:42 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Wed, 8 Jul 2020 12:59:40 +0900
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: v4l2-compliance tests for cache flags
Message-ID: <20200708035940.GB571@jagdpanzerIV.localdomain>
References: <CAPY8ntAogTZHd7Oh_7L+ghh4_DP9AzZ4DuJ9xChN_EmVbGXb1Q@mail.gmail.com>
 <34df23a8-6ab1-aaba-19f7-5193d18a60b0@xs4all.nl>
 <CAPY8ntAjV7vxpb2qFQVY+EYk3Mb0nBfGovYcAvw+0NMFH0j5PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAjV7vxpb2qFQVY+EYk3Mb0nBfGovYcAvw+0NMFH0j5PQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/07/07 15:41), Dave Stevenson wrote:
> > v4l2-compliance tests are in sync with our master and it expects that
> > that kernel is used.
> 
> Thanks, I'd never noted that restriction. All previous times I'd used
> v4l2-compliance against any kernel it had performed as expected. This
> is the first change that causes a major failure of tests due to an
> older kernel.

It depends on Linux UAPI headers, so the restriction is sort of mandated,
but probably not widely recognized the by the distributions, looking at
arch, for instance:
https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/v4l-utils

Adding a Linux version check code can be a bit intrusive. There has been
a whole bunch of changes all over the place, for instance:

---

+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -381,8 +381,6 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
        if (g_flags() & V4L2_BUF_FLAG_BFRAME)
                frame_types++;
        fail_on_test(frame_types > 1);
-       fail_on_test(g_flags() & (V4L2_BUF_FLAG_NO_CACHE_INVALIDATE |
-                                 V4L2_BUF_FLAG_NO_CACHE_CLEAN));
---

So running newer v4l-compliance against the older kernel or older
v4l-compliance against the newer kernel may trigger various failures.

	-ss
