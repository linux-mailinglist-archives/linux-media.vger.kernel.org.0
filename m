Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8399B1EBB46
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 14:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgFBMKx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 08:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgFBMKw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 08:10:52 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43F4C061A0E;
        Tue,  2 Jun 2020 05:10:52 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id d6so1355402pjs.3;
        Tue, 02 Jun 2020 05:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V2uYDYvTpzXxeNKnkNIGug7/bVN4wAJFHdUKLy8MXAI=;
        b=bxq8lSQDgv9sZxmAbZ7U5hT5hFMuKvlqToqx1TuKlgJlOeIRJw81/iU7O9dKPwZFpy
         pgiq/pNNUMbLNYh/pil/gjX8cRu7Sj4OiUC2NsqIaXsXlWKywhdVkAF9L9dLBxohZhPr
         fgAWQhh4vkCqjM/SiS0TULA+PQbNTltv1AsDrRH1PxBlibLGTXImuZEaJ/mWkYPpkJ0y
         BxZG6LC3bK6RBdrPGTIGDq2jwEa3UuDkR4Xa1KbvB+7WA940FxeLYUZ6kqf+A6mgeun9
         FKL4gjXWlyXT0dspCK0cI6enUTf2761NoQoIiZkZvqyZbkO15K+ltjJaLsETjT4AI8De
         fuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V2uYDYvTpzXxeNKnkNIGug7/bVN4wAJFHdUKLy8MXAI=;
        b=CpH5D9XAZ8HLNOZcH0vfoiFwJdamKrEas7+ziXMw73cMf30YtvJRzHcBv57CfNASW1
         Mt9rSkzGxPoAqL4QDP5jNrJ1J00swHBzGBnjAwG9UglNyQJdBcRZTXKDtXw9M3AYouE4
         7eDapfqL1WkrpjwfegIS3bygjesqciXI+OffTVjFL1sRKG0574AF8K6h29R30Wy0DBon
         Hw6lm6EReXCjcg8Ub+1+wXR7srhkKRThMEwO5lP+WHquFoexWoQxhwsSKWeRrmVKFmug
         MbwntV7teWeJwS469PR/TqtfwfjBTiwQpCH/c1K+skAj/9Wm0InIrcXzEsFasRXgnTYA
         +DZA==
X-Gm-Message-State: AOAM5330s2HNmxA2ntwGfNm6lY6NanZNwzIP6y1dV9rQ3MQ1U3BJeN/U
        VqL8sdwp+rxkHHHnU/Mf5lI=
X-Google-Smtp-Source: ABdhPJx46iaVyx2eA6jh47ZPFsD1wXypPfLo23GddEVedhkpkikkHdNx1jPvw5UoAukM2pzSgqHqWw==
X-Received: by 2002:a17:90b:23c8:: with SMTP id md8mr5464609pjb.72.1591099852280;
        Tue, 02 Jun 2020 05:10:52 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id x2sm2271776pfj.142.2020.06.02.05.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 05:10:51 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Tue, 2 Jun 2020 21:10:49 +0900
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v6 03/14] videobuf2: handle V4L2 buffer cache flags
Message-ID: <20200602121049.GB617@jagdpanzerIV.localdomain>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
 <20200514160153.3646-4-sergey.senozhatsky@gmail.com>
 <b34ae09b-7c20-7255-6adc-3370680555cd@xs4all.nl>
 <20200602101834.GA617@jagdpanzerIV.localdomain>
 <9ec2618b-0cce-b00e-08cf-b579d9aa1d5d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ec2618b-0cce-b00e-08cf-b579d9aa1d5d@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/06/02 12:27), Hans Verkuil wrote:
[..]
> > Sorry, Hans, do you suggest to have something like this:
> > 
> > 	if (q->memory == VB2_MEMORY_DMABUF) {
> > 		vb->need_cache_sync_on_finish = 0;
> > 		vb->need_cache_sync_on_prepare = 0;
> > 		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_INVALIDATE;
> > 		b->flags &= ~V4L2_BUF_FLAG_NO_CACHE_CLEAN;
> > 		return;
> > 	}
> > 
> > I didn't clear the ->flags there because we clear the vb flush/sync
> > flags: ->need_cache_sync_on_finish/prepare are zeros for DMABUF memory
> > type. Which is equivalent to passing V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
> > V4L2_BUF_FLAG_NO_CACHE_CLEAN. IOW we would clearing both "vb's do cache
> > sync" and request's "do not cache sync".
> 
> Ah, yes. In that case the v4l-utils patch is likely wrong.
> Can you take a look at that patch?

Hans, are we talking about "v4l2-utils: test cache_hints for MMAP queues"
patch? I can take a look, yes.

	-ss
