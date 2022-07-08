Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1985456B843
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 13:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237644AbiGHLPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 07:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237487AbiGHLPN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 07:15:13 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6426488F27
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 04:15:11 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10c0430e27dso17310236fac.4
        for <linux-media@vger.kernel.org>; Fri, 08 Jul 2022 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jgD41DClj9ITXixXNM/x57/pqkxyp7RLyTWG82gKh7U=;
        b=P/3m/Sr/SBbYfZUrS3jTNKqKLMA82hVPC4FqgrPvvNPejINyNvR9832YSpp90tgUl+
         mBYKZGhWjg/dES3JII1WLmClt4T2fbqgBol8dM0xBP/67RpTvHnA5ow2UqMoQ8VGthNv
         xE7t8k4Ro2Jk9oqDVJYh/of0u/y6p1mWKudApehGv3WkjwPd/t5B4Nm8vGcQwXjWMfe3
         pChFzxzqmUyHEyu1G+5PlZyrlv61GVHTJVNkZg74FthpaGHKVsX2TnOzrhrrm12fud1/
         IGaR20D+mS6Oq5YMmlOUgo08KczbKD3b0yV8eoi94vI4s33KWvB4lJMFeXovtfLC8Gc+
         srEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jgD41DClj9ITXixXNM/x57/pqkxyp7RLyTWG82gKh7U=;
        b=l1hLRaZzPPVCsYcMt5sVdqmH/8wd3JYYmcS4ESh0aTEH6/uUmkgXKMnm8yZQvnG+G3
         IGrexJkMJZ0rQwyFIwB2HpvuCvMjWO7MatEm6ANSI5zWR017j5H27i26yYOy5rULzCow
         NiN4QSdohyCNr91qURoQERZ7sN/GVM9QSzYW0YvIRiOVWafaTw2QPaeViVI8EtQL4zXd
         LQgZ3+WFVEX8JLJDe+iJUKix7nZ4QIKWJP3KRomLBoLCKmYNJQTGRcPniU+1LGRF1vsF
         M0IsI68YqQH5yLgTKQ4uiDMZ3rSCSCSirfPpnBB7jfQmZ7dQhePTAAlqgjsChaFtz89g
         HgQg==
X-Gm-Message-State: AJIora9UA+sQujlfkQLGp1hlHcpe4w7l7c3V+Z1bSa+4r2U6d5212iy8
        eo/1ydSk0KMCz5a9eY6IudA95w==
X-Google-Smtp-Source: AGRyM1sQMMjHC1+zY9qUSR6WynBXMlwEYtI42SyzNkBIV4nlo6LQWEMR/W/Gb1rNIXUAEcahQ0p5LA==
X-Received: by 2002:a05:6870:434e:b0:10b:8204:3ec4 with SMTP id x14-20020a056870434e00b0010b82043ec4mr6026041oah.113.1657278910743;
        Fri, 08 Jul 2022 04:15:10 -0700 (PDT)
Received: from eze-laptop ([186.13.97.246])
        by smtp.gmail.com with ESMTPSA id u5-20020a4a9705000000b0042568efdaccsm18189389ooi.15.2022.07.08.04.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:15:09 -0700 (PDT)
Date:   Fri, 8 Jul 2022 08:15:05 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 8/8] videobuf2: Remove vb2_find_timestamp()
Message-ID: <YsgRuahdB/65K88a@eze-laptop>
References: <20220706182657.210650-1-ezequiel@vanguardiasur.com.ar>
 <20220706182657.210650-9-ezequiel@vanguardiasur.com.ar>
 <CAAFQd5Cxn+HVun+H66-RvUh6SUqnSbug0vpmFFanmrGywfqHeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5Cxn+HVun+H66-RvUh6SUqnSbug0vpmFFanmrGywfqHeg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Fri, Jul 08, 2022 at 01:45:35PM +0900, Tomasz Figa wrote:
> Hi Ezequiel,
> 
> On Thu, Jul 7, 2022 at 3:27 AM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > Now that we've transitioned all users to vb2_find_buffer API,
> > remove the unused vb2_find_timestamp().
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> > ---
> >  .../media/common/videobuf2/videobuf2-v4l2.c   | 12 ++++-----
> >  include/media/videobuf2-v4l2.h                | 26 +------------------
> >  2 files changed, 7 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > index 075d24ebf44c..a9696442dfba 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -625,18 +625,18 @@ static const struct vb2_buf_ops v4l2_buf_ops = {
> >         .copy_timestamp         = __copy_timestamp,
> >  };
> >
> > -int vb2_find_timestamp(const struct vb2_queue *q, u64 timestamp,
> > -                      unsigned int start_idx)
> > +struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q, u64 timestamp)
> >  {
> >         unsigned int i;
> >
> > -       for (i = start_idx; i < q->num_buffers; i++)
> > +       for (i = 0; i < q->num_buffers; i++)
> >                 if (q->bufs[i]->copied_timestamp &&
> >                     q->bufs[i]->timestamp == timestamp)
> > -                       return i;
> > -       return -1;
> > +                       return vb2_get_buffer(q, i);
> > +
> > +       return NULL;
> >  }
> > -EXPORT_SYMBOL_GPL(vb2_find_timestamp);
> > +EXPORT_SYMBOL_GPL(vb2_find_buffer);
> >
> >  /*
> >   * vb2_querybuf() - query video buffer information
> > diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
> > index 7f9ae5b39b78..5a845887850b 100644
> > --- a/include/media/videobuf2-v4l2.h
> > +++ b/include/media/videobuf2-v4l2.h
> > @@ -62,22 +62,6 @@ struct vb2_v4l2_buffer {
> >  #define to_vb2_v4l2_buffer(vb) \
> >         container_of(vb, struct vb2_v4l2_buffer, vb2_buf)
> >
> > -/**
> > - * vb2_find_timestamp() - Find buffer with given timestamp in the queue
> > - *
> > - * @q:         pointer to &struct vb2_queue with videobuf2 queue.
> > - * @timestamp: the timestamp to find.
> > - * @start_idx: the start index (usually 0) in the buffer array to start
> > - *             searching from. Note that there may be multiple buffers
> > - *             with the same timestamp value, so you can restart the search
> > - *             by setting @start_idx to the previously found index + 1.
> > - *
> > - * Returns the buffer index of the buffer with the given @timestamp, or
> > - * -1 if no buffer with @timestamp was found.
> > - */
> > -int vb2_find_timestamp(const struct vb2_queue *q, u64 timestamp,
> > -                      unsigned int start_idx);
> > -
> >  /**
> >   * vb2_find_buffer() - Find a buffer with given timestamp
> >   *
> > @@ -86,15 +70,7 @@ int vb2_find_timestamp(const struct vb2_queue *q, u64 timestamp,
> >   *
> >   * Returns the buffer with the given @timestamp, or NULL if not found.
> >   */
> > -static inline struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q,
> > -                                                u64 timestamp)
> > -{
> > -       int index = vb2_find_timestamp(q, timestamp, 0);
> > -
> > -       if (index < 0)
> > -               return NULL;
> > -       return vb2_get_buffer(q, index);
> > -}
> > +struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q, u64 timestamp);
> 
> Was there any specific reason to add it as an inline initially rather
> than just having it close to the final shape from the very beginning?
> Sorry for being picky, but I find it more difficult to review this
> way.
> 

Yeah, that makes sense, I'll re-work it for the next iteration.

Thanks,
Ezequiel

> Best regards,
> Tomasz
> 
> >
> >  int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b);
> >
> > --
> > 2.34.3
> >
