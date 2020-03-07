Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC3017CC0F
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 06:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgCGFXC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 00:23:02 -0500
Received: from mail-pf1-f169.google.com ([209.85.210.169]:45198 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgCGFXC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 00:23:02 -0500
Received: by mail-pf1-f169.google.com with SMTP id 2so2131726pfg.12
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2020 21:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wZnej70fqtnmhJkhSgvZFCaeIT417LMoCLynROy5i68=;
        b=jLupZ17+y1Pcsuu3u6ZBfn6OjqgbFG2N+msvqVCMibTY7WH6duQ4F7CrB/4ID6e2im
         YZEMtj9ia1NETFijCqJ5dzcwXztBwPsFtPj5VqyPBAOKrdilPTF/MZNMYLWoJBvXn/Bb
         yuVyvmlcVgZOoMIiUKGiLzzdMXlc/ILEQwmzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wZnej70fqtnmhJkhSgvZFCaeIT417LMoCLynROy5i68=;
        b=rkmb6+wr00i2fFqA4yX2KltNUn67uvGnKfKH8JHSr9E1lnCryEXFH2z3mPIdhXiuCa
         OgG5QBlqeVGXtrmjIE+GhBLeqFSDnPbYe9TuQfAop9CfxNDrzXcU4nM16P1Acwc7DXVq
         GWZER7CHsolgQdFJkHl+JtB23bQ3H0ZQjG+VjTqdnKoyjR2mdLkjH6RWei4FiR0rztIL
         WpmQ3MRKpystc3CLCUk6KQBXBfXcCJhHsGzoSPndnP8PfDIgETDmL9JaiYzJLgQmibBq
         89sizMGzHtyfw78CDyFK3wUFO3IZSNbnkusxd1IgockKEEIac0D//a4AV/d4Opb9wJNc
         VDJg==
X-Gm-Message-State: ANhLgQ0YCWVEd4D/4kgTrvip5HSICFvLyt/Ul2+yL5Dz5MZRLmOqjBeY
        qcEbprSjvBwu1x4lw1TGkU43Lw==
X-Google-Smtp-Source: ADFU+vs3kLDTiF4fIdAdEhIDT71WCUm0OIYuNytmoIRGkxyL5cwr8q//1mSe7/JhC0o9M7vi4Gsi6g==
X-Received: by 2002:a62:1889:: with SMTP id 131mr7033784pfy.250.1583558581255;
        Fri, 06 Mar 2020 21:23:01 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id 193sm15387966pfu.181.2020.03.06.21.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 21:23:00 -0800 (PST)
Date:   Sat, 7 Mar 2020 14:22:58 +0900
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
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
Message-ID: <20200307052258.GA176460@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
 <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/06 14:57), Hans Verkuil wrote:
[..]
> > @@ -491,6 +497,9 @@ struct vb2_buf_ops {
> >   * @uses_requests: requests are used for this queue. Set to 1 the first time
> >   *		a request is queued. Set to 0 when the queue is canceled.
> >   *		If this is 1, then you cannot queue buffers directly.
> > + * @allow_cache_hints: when set user-space can pass cache management hints in
> > + * 		order to skip cache flush/invalidation on ->prepare() or/and
> > + * 		->finish().
> 
> checkpatch complains about a space before a tab in the two lines above.

I see them. Sorry. Fixed now.

	-ss
