Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96305163FF1
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 10:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgBSJFw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 04:05:52 -0500
Received: from mail-pj1-f48.google.com ([209.85.216.48]:38173 "EHLO
        mail-pj1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgBSJFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 04:05:52 -0500
Received: by mail-pj1-f48.google.com with SMTP id j17so2268103pjz.3
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 01:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MHb/19gJYPsAg71KRRWbuzDnz+m/m3K8W3L6MyDMF70=;
        b=PEl5zJNPTZ13sh03vuG3STMRi7yYdWvxlSO9I6m9T7ca225tueehBwEzPvdWyTLf2c
         6GLBPw9n6bXaRHgrc3gHz9+N53a7dDq7MUxrRXociwiVomLYcBF0m92XNKkw8IGBKg+x
         +9yYIHshuaTpCTfOyXzjuKxpbVWr38aNboCzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MHb/19gJYPsAg71KRRWbuzDnz+m/m3K8W3L6MyDMF70=;
        b=CRN63bBy8vFKz9hwVyxNc+aNs6NsXDT543m9w6OpzSsDIi+zAmLvS3TFh1F259diAt
         wO0JYtDd5cv+++zCgggM8zYYD8+gsUCgZLo4C9stW2/a4PNqqMREFiXgWa1HEP04DD2c
         FcvL5bbz/3bTUXP2J5pEjJt5tH5j3z37B+bqz1gSzTASYhfTecMep8UQEqdxW8LMrzdA
         m9uq9njSxvIXpF1Bq69WB5ZBgbqtOm6oNxR801+3qaIOi95BXsRRA1svo2Fbv8oZNmoJ
         gy/siy4mWAKY8pcG3IMHDvy5idS2VP4mIBxXA+h8VEqjsxwJmqk5STq336QffZJCBTU5
         w/IA==
X-Gm-Message-State: APjAAAXOlDMAKShMBTRz+q67PNwC6lVKwzl5GbozN66iLoeUbImVzKaw
        uRsf3IrzyFP0L5vmBOUIjVH2pw==
X-Google-Smtp-Source: APXvYqx0/1JHBp144TCle6IzSZivX4OKQsKGWeZ3go60rD3jWKdHuDQSJTlnR7UxVoCqaQLvXDiW3A==
X-Received: by 2002:a17:902:7442:: with SMTP id e2mr25802611plt.158.1582103150121;
        Wed, 19 Feb 2020 01:05:50 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id a69sm1984743pfa.129.2020.02.19.01.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 01:05:49 -0800 (PST)
Date:   Wed, 19 Feb 2020 18:05:47 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCHv2 05/12] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Message-ID: <20200219090547.GF122464@google.com>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-6-senozhatsky@chromium.org>
 <83147032-25a4-9450-d455-437e82e09dc8@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83147032-25a4-9450-d455-437e82e09dc8@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/02/19 09:48), Hans Verkuil wrote:
[..]
> >  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
> >  {
> >  	int ret = vb2_verify_memory_type(q, req->memory, req->type);
> > +	bool consistent = true;
> > +
> > +	if (req->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> > +		consistent = false;
> 
> There is no check against allow_cache_hints: if that's 0, then
> the V4L2_FLAG_MEMORY_NON_CONSISTENT flag should be cleared since it is
> not supported.

The check is in set_queue_consistency()

static void set_queue_consistency(struct vb2_queue *q, bool consistent_mem)
{
	if (!q->allow_cache_hints)
		return;

	if (consistent_mem)
		q->dma_attrs &= ~DMA_ATTR_NON_CONSISTENT;
	else
		q->dma_attrs |= DMA_ATTR_NON_CONSISTENT;
}

I don't explicitly clear DMA_ATTR_NON_CONSISTENT attr for
!->allow_cache_hints queues just in case if the driver for
some reason sets that flag. ->allow_cache_hints is, thus,
only for cases when user-space asks us to set or clear it.

	-ss
