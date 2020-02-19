Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57D54163EB5
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgBSIQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:16:43 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54913 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgBSIQn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:16:43 -0500
Received: by mail-pj1-f68.google.com with SMTP id dw13so2242952pjb.4
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 00:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v3O1z61UvArVytMUXoRlXAZVh2DnhKK0P9ahcjLWA5k=;
        b=hzQWWTsx+VBLfoV3esj8tam3Kvc099iWAPDDfO7kgY1+oVBTK1EMtP7GrlZ9dcFlXV
         KHam5I3mh7AgqgVfGScUfU9iqaWG6EGXH/xAFOZpCN8YHZEV4SOnu5Ow6KqBVAroJAIN
         TtjDlgBQ4qgkJcGErAHX4lOicUmxquPRiYdm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v3O1z61UvArVytMUXoRlXAZVh2DnhKK0P9ahcjLWA5k=;
        b=I3YHyCjPTJDA5qLI9wPHFwZonT/3Z5awkP1+Fsat/94ossNR7X2LH6aF+SRIN1emZa
         eevmBYSC6hnlHJCwm1DWxoNCj9wAVP0LOf6CqJOUySeS2/qgrbMxg5fYJsEdz4A6GtVN
         P8PtF9qLPuPskZIn2TRDMpBD3faCsYTiTIELTKtHKSg/x7Z+XpsIkBLaFmif5AJhEQpc
         T/XTMl60dmYdrh/gI3U8S8+mH622lF0z4KqIKhQqmpOIWx5dR2sWBYKrBBM7PYexwbWq
         miLTvwwnreeVALhLFcemnT/exek0V25sIwCV7F/r9BwSyi1OHS98pNe3sl8tkxdOMYzL
         C68w==
X-Gm-Message-State: APjAAAVGkUwt5jBurSou5v8iQoCcLB9K0i5mrejLZG2/5nGASuZp/UJI
        uRMLud4X8GpZ1yRaSOIjE8vNVg==
X-Google-Smtp-Source: APXvYqx51bWBjGv4rYr+8LsDLU/bH5VBjUsq/fMDVigYR/Iz+/x6iuRGG2jeKoAiO1U9UUwzxDfgAg==
X-Received: by 2002:a17:90b:4004:: with SMTP id ie4mr7687893pjb.49.1582100201064;
        Wed, 19 Feb 2020 00:16:41 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id 13sm1669232pfi.78.2020.02.19.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 00:16:40 -0800 (PST)
Date:   Wed, 19 Feb 2020 17:16:38 +0900
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
Subject: Re: [RFC][PATCHv2 01/12] videobuf2: add cache management members
Message-ID: <20200219081638.GB122464@google.com>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-2-senozhatsky@chromium.org>
 <964aeb73-1474-032f-b2a6-b317cc15f7cb@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <964aeb73-1474-032f-b2a6-b317cc15f7cb@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/02/19 09:05), Hans Verkuil wrote:
> On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:

[..]

> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> > index a2b2208b02da..026004180440 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -263,6 +263,10 @@ struct vb2_buffer {
> >  	 *			after the 'buf_finish' op is called.
> >  	 * copied_timestamp:	the timestamp of this capture buffer was copied
> >  	 *			from an output buffer.
> > +	 * need_cache_sync_on_prepare: do not sync/invalidate cache from
> > +	 * 			buffer's ->prepare() callback.
> > +	 * need_cache_sync_on_finish: do not sync/invalidate cache from buffer's
> > +	 * 			->finish() callback.
> 
> Shouldn't 'do not' be deleted from the flag descriptions? If the flag is set,
> then you need to sync/validate, right?

Hmm, kind of work both ways. Maybe the wording can be more specific,
e.g. "Do/skip cache sync/invalidation" even more detailed "When set
perform cache sync/invalidation from ..."

	-ss
