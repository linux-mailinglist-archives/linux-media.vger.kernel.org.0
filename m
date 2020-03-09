Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B239817D9CD
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 08:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgCIHZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 03:25:29 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39119 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgCIHZ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 03:25:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id w65so3880795pfb.6
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2020 00:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5d5OhcXw6fl/9cm7UhW62qcDyA41abHWtu9qn534Q9I=;
        b=XFhjGyDi2XzGt1EwH26CyPtsrunI797lUqKtau7oIgAWaQZtz3A+Yz2qWUJc0bN61x
         k8QCJ20rmr8GCXtsi//H8+adMH4vQMh7wscwl6UaS3fK08d6eC771Ua6kB2Pv//aEj09
         VVBxkiDaBl4dcIJz8nvlsUW/kl5nMPQqy2Uts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5d5OhcXw6fl/9cm7UhW62qcDyA41abHWtu9qn534Q9I=;
        b=BZUHU6qTc5WDR+vF2AIGVrBSI48C7tMnkOStYfq5m4bUhFPXhRA/pZNHlCb/2stP1E
         2eJa2ObQrpcEuRovoluIHyS4fZG0Bft34W9clr8ZQB6ALP+1p7aeQT51VyqUX+8uxsxI
         YbveJ5MoOg5r9sDCtJoSCwf4OSdyBemrFjef84umfn3UB83IRK3LAgsfNKiGyGUcqDi4
         sPLP2wjdKP5K10RHhpvjN+RjP5jDKiLvuanHu2BUT7QMSs5vKIQC5Zl3PswjfrbaWX0y
         7vMRm1WXt4trh7RrcDg3d8d/MGOz5sR2M/csn3yR3GLO3vcP8b8diMZNdLrim7KPbFAr
         3JWg==
X-Gm-Message-State: ANhLgQ2cEDGsKXaqibkKknOcBr/exrgk+C5pHZ4YkBQWF41cFPUb7JAi
        VE6s4V4anFkl12MrJmpyQOIvhw==
X-Google-Smtp-Source: ADFU+vtn4bgOcGGpf/24hz8Issgf/62nUhQrOf3o+vLkuvgFiQQ+LrgPQTqBmckwaDxXhwhMqcB2vg==
X-Received: by 2002:a63:b949:: with SMTP id v9mr14717914pgo.336.1583738728524;
        Mon, 09 Mar 2020 00:25:28 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id x9sm12931591pfa.188.2020.03.09.00.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 00:25:28 -0700 (PDT)
Date:   Mon, 9 Mar 2020 16:25:26 +0900
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
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
Message-ID: <20200309072526.GC46830@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
 <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
 <20200307094634.GB29464@google.com>
 <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
 <20200307112838.GA125961@google.com>
 <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
 <20200309032707.GA9460@google.com>
 <40cd09d9-49a6-2159-3c50-825732151221@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40cd09d9-49a6-2159-3c50-825732151221@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/09 08:21), Hans Verkuil wrote:
> On 3/9/20 4:27 AM, Sergey Senozhatsky wrote:
> > On (20/03/07 12:47), Hans Verkuil wrote:
> >>
> >> Create those tests in v4l2-compliance: that's where they belong.
> >>
> >> You need these tests:
> >>
> >> For non-MMAP modes:
> >>
> >> 1) test that V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is never set.
> >>
> >> If V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is not set, then:
> >>
> >> 1) attempting to use V4L2_FLAG_MEMORY_NON_CONSISTENT will clear the flag
> >>    upon return (test with both reqbufs and create_bufs).
> >> 2) attempting to use V4L2_BUF_FLAG_NO_CACHE_INVALIDATE or V4L2_BUF_FLAG_NO_CACHE_CLEAN
> >>    will clear those flags upon return (do we actually do that in the patch series?).

[..]

> > I'm looking into it. Will it work if I patch the vivid test driver to
> > enable/disable ->allow_cache_hints bit per-node and include the patch
> > into the series. So then v4l2 tests can create some nodes with
> > ->allow_cache_hints.  Something like this:
> 
> I would add a 'cache_hints' module parameter (array of bool) to tell vivid
> whether cache hints should be set or not for each instance. It would be useful
> to have this in vivid. Don't forget to update Documentation/media/v4l-drivers/vivid.rst
> as well.

I see. Hmm, how do I do "test that V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS
is never set" then?

	-ss
