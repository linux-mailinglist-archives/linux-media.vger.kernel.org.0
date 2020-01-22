Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02DD1144BCE
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 07:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgAVGhR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 01:37:17 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33145 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgAVGhR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 01:37:17 -0500
Received: by mail-pf1-f194.google.com with SMTP id z16so2863818pfk.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 22:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7AXcKF6W8asLiClFXriJEBFPGRWX3uOGSn/zkbdHVsU=;
        b=YILkfm0TuU5vkyLd8nIqBpXHopTRzgWr2SZQipfwrFiezbx0jrz9MRs4EVDQQe3sRu
         huwpVi9oNtyYwMeVWc8XbUvBIua5mYWXdUBJ3YibtNYf+iOEhbbW27p1/kGr2QOAG0YG
         IkN9GgHGnY3Kf1WLSxIphLSKL1Nog1G7+A+sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7AXcKF6W8asLiClFXriJEBFPGRWX3uOGSn/zkbdHVsU=;
        b=O9+RZbxyXq/Gh3xIlQQTjxgy00CYSD8bdtpGRUEQQAgWUqwaE/kUMX674O7Cw/4ncA
         KGj/Zs7OFI0fmh9sYmdxui31WQH87mD9dfR3jcPvVL8A99W92++iO1TaPOv2rVIHxpGw
         Io65s8ztrbPs0Bi2iG/0oaRt20OZ3OOtRD3iGks9t2maGGTjYmFvK1DixMG5cdQqyNyg
         gXc85jcYhKGFHzDx6iSq8WOUxbDErBwNyjV2TdX88+FOisaT/7xlFjuDD7Bib+wJuWFg
         ejhQci1KosFZwuwqqThi+arILms/H6WYVTSAPMKuZscj2NMOQqC3beLI9ZpbGIRbEDvF
         aiBg==
X-Gm-Message-State: APjAAAWvvGrD6nEUW9/aAAmyb/m0VeCbvpS06LF+Rpg2kNfQBt2cRMqa
        qLAE+KmsxWQXxg7RfUBIvGqHaA==
X-Google-Smtp-Source: APXvYqyssvAQGz/3NU7TC27DYPmZKShf5Lm0ap0tEDqlQdVSpPwNuztzlwCwNHbPP8JH1fJW04hw0Q==
X-Received: by 2002:a65:4d0b:: with SMTP id i11mr10025106pgt.340.1579675036728;
        Tue, 21 Jan 2020 22:37:16 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id i9sm46704101pfk.24.2020.01.21.22.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 22:37:15 -0800 (PST)
Date:   Wed, 22 Jan 2020 15:37:14 +0900
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
Subject: Re: [RFC][PATCH 12/15] videobuf2: add begin/end cpu_access callbacks
 to dma-sg
Message-ID: <20200122063714.GA14881@google.com>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-13-senozhatsky@chromium.org>
 <1c5198dc-db4e-47d6-0d8b-259fbbb6372f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c5198dc-db4e-47d6-0d8b-259fbbb6372f@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/01/10 11:13), Hans Verkuil wrote:
> On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> > Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
> > callbacks for cache synchronisation on exported buffers.
> > 
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > ---
> >  .../media/common/videobuf2/videobuf2-dma-sg.c | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > index 6db60e9d5183..bfc99a0cb7b9 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > @@ -470,6 +470,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
> >  	vb2_dma_sg_put(dbuf->priv);
> >  }
> >  
> 
> There is no corresponding vb2_sg_buffer_consistent function here.
> 
> Looking more closely I see that vb2_dma_sg_alloc doesn't pass the dma_attrs
> argument to dma_map_sg_attrs, thus V4L2_FLAG_MEMORY_NON_CONSISTENT has no
> effect on dma-sg buffers.
> 
> Is there a reason why dma_attrs isn't passed on to dma_map_sg_attrs()?

Laziness.

> I suspect it was just laziness in the past, and that it should be wired
> up, just as for dma-contig.

OK, I can include it into v2.

	-ss
