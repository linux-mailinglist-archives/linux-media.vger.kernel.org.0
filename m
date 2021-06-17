Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48ED23AA8C1
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 03:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbhFQBsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 21:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbhFQBsu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 21:48:50 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 504FFC061574
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 18:46:42 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id g6so3707923pfq.1
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 18:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aCu4LkD8DzzqfW0LqAc59fm9y5Or9nczlrM9Hg9t/o4=;
        b=TEuDdg4PDrfRk+ENI85vuqFt7iHDIWll3icoHcSJBroSYUZQXHN3mSZXTklYG2OUoi
         I7QWlYpfEersSBaqmqhxouOWrW9gV/FaX/NUFP0b1t5wXnFwUkiU7AXOuRqe11tP+JYk
         16F1D7cnZfhCgIbW5xvbMm3zik+Z6qQiufaTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aCu4LkD8DzzqfW0LqAc59fm9y5Or9nczlrM9Hg9t/o4=;
        b=qbGjyYKmzb9h/SAbKj978RB/vkZIQdDJOD6T8abuh/0oTbqSaBVDJZ2+LExT5A6fXC
         PU+8mYWYZQjpLoqKg3GLsUeaelzgVIHiOKha29+2kMRlEzn1+Rr3gfFrm3WruhDZVJ+c
         JqRKiZ1MgxcoY9WmOD9hnNGOK6K2awQv9mepkl7UgJc4j5QVmAeCkZpK4j2nj29SWNz4
         hdutPsGmhDR+MuHnQQAvDsw16XZDr4ndSXtRosSEEKzx1E/60mx0luKwPeoaxy4Q3jS2
         tSSZZiSQzMdbQ/M2PcU3NT1fKWDkoeaNJjFRanvIRHEKmKIx7stkotddi2wcKzkIolF4
         ykXQ==
X-Gm-Message-State: AOAM531ol5IFJFU5QuwcQhDIsyuu2pa66h2MIst7FMQoRGqcIT9Vgzdb
        QLkxnsy+ew1+/jXK0L3Iyx6m/Q==
X-Google-Smtp-Source: ABdhPJzX2BJ54oHHJad88jmZ+ROH3fq5TXvxRH30zU61ZUJHG6rDLHXUqRg2LrxGaOn40G9auSApxw==
X-Received: by 2002:a65:6256:: with SMTP id q22mr2549354pgv.391.1623894401080;
        Wed, 16 Jun 2021 18:46:41 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:32ae:4292:bec1:e4])
        by smtp.gmail.com with ESMTPSA id s63sm374107pjj.35.2021.06.16.18.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 18:46:40 -0700 (PDT)
Date:   Thu, 17 Jun 2021 10:46:36 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 7/8] videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT
 flag
Message-ID: <YMqpfI6udqgbMg82@google.com>
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-8-senozhatsky@chromium.org>
 <93d99f68-7363-6ba3-2634-f052a95e5fe0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93d99f68-7363-6ba3-2634-f052a95e5fe0@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/06/03 13:32), Hans Verkuil wrote:
[..]
> > +static void validate_memory_flags(struct vb2_queue *q,
> > +				  int memory,
> > +				  u32 *flags)
> > +{
> > +	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
> > +		/*
> > +		 * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only,
> > +		 * but in order to avoid bugs we zero out all bits.
> > +		 */
> > +		*flags = 0;
> 
> Wouldn't it make sense to add:
> 
> 	} else {
> 		*flags &= ~V4L2_MEMORY_FLAG_NON_COHERENT;
> 
> I.e., clear all unknown flags.

Done.

[..]
> > @@ -2003,9 +2003,6 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
> >  
> >  	if (ret)
> >  		return ret;
> > -
> > -	CLEAR_AFTER_FIELD(p, capabilities);
> 
> Shouldn't this be:
> 
> 	CLEAR_AFTER_FIELD(p, flags);
> 
> You still need to zero the reserved array, after all.

Done.
