Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0BD2133919
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 03:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgAHC1o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 21:27:44 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:37087 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgAHC1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 21:27:43 -0500
Received: by mail-pj1-f65.google.com with SMTP id m13so402927pjb.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2020 18:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=TxCBIIGREavpCVrRs9QNlaW6niSLc1GB+TRhNf+Qpmo=;
        b=R842ZIDzQUYEND1R5s7cntI/r/5WU1Mlc62dtk1Wrbk7IdDkynyqhS/SeUXFyzPXUN
         1Nk47N4euErxEnpMFOUkTdtGvi/lQ41Dwo0VbusHkEI+5/LaHz45hTiKDFAap8hgdFg4
         CEB/UqMZtUqwfpExLHBKwe2lYBXPb0fMW5L4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=TxCBIIGREavpCVrRs9QNlaW6niSLc1GB+TRhNf+Qpmo=;
        b=DFkqBbs84/i1PeKpS6TQd5dpQZ9lCFL7CsoG1/kBusiENAqrujPsD2aadHPcxqFVpD
         UPetVXj7ghkZ33Og9E5ClLT108onjJLyK5h9t7BUXlsp548U1YtMiKV+FqL62TkhxQlK
         lguP7Gvi1m+HCRNoS47kY5RnHVF6s6q5yXZpLlxgnmLAli4PuYkquMxtiwWsVxVW7LWR
         2QHvvU3TA9n1sx/nfq9Gm5s465unrj6VjAxZgc1/vKqdD5iurcA08DfdPsVXco+e9Kns
         spWmTYJCY4F+w+6k5qESNKJNfm0t0G4HD+vDZciRlr9xveOI31ZIC1V1Id56PWHVd7bX
         LtEg==
X-Gm-Message-State: APjAAAWHob+0cxFc6f3m27lx1MkH7SSeDr3+L4XUHdcQdkSU1m5G9MJt
        ZHXbFcF/fp090h0bjxrCzYLSXg==
X-Google-Smtp-Source: APXvYqyApuWFuZqGIyOf5rbM7brHnaEX2kHU+YLA3DErCW/+r7iApFECfrvpBxwUNNbksYTQ0nXytg==
X-Received: by 2002:a17:90b:f0f:: with SMTP id br15mr1822086pjb.138.1578450463118;
        Tue, 07 Jan 2020 18:27:43 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id b15sm925307pft.58.2020.01.07.18.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 18:27:42 -0800 (PST)
Date:   Wed, 8 Jan 2020 11:27:41 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 00/15] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Message-ID: <20200108022741.GA7366@google.com>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217032034.54897-1-senozhatsky@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (19/12/17 12:20), Sergey Senozhatsky wrote:
> Hello,
> 
> 	RFC
> 
> 	This is a reworked version of the vb2 cache hints
> (V4L2_BUF_FLAG_NO_CACHE_INVALIDATE / V4L2_BUF_FLAG_NO_CACHE_CLEAN)
> support patch series which previsouly was developed by Sakari and
> Laurent [0].
> 
> The patch set attempts to preserve the existing behvaiour - cache
> sync is performed in ->prepare() and ->finish() (unless the buffer
> is DMA exported). User space can request “default behavior” override
> with cache management hints, which are handled on a per-buffer basis
> and should be supplied with v4l2_buffer ->flags during buffer
> preparation. There are two possible hints:
> 
> - V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
> 	No cache sync on ->finish()
> 
> - V4L2_BUF_FLAG_NO_CACHE_CLEAN
> 	No cache sync on ->prepare()
> 
> In order to keep things on the safe side, we also require driver
> to explicitly state which of its queues (if any) support user space
> cache management hints (such queues should have ->allow_cache_hints
> bit set).
> 
> The patch set also (to some extent) simplifies allocators' ->prepare()
> and ->finish() callbacks. Namely, we move cache management decision
> making to the upper - core - layer. For example, if, previously, we
> would have something like this
> 
> 	vb2_buffer_done()
> 	  vb2_dc_finish()
> 	    if (buf->db_attach)
> 	       return;
> 
> where each allocators' ->finish() callback would either bail
> out (DMA exported buffer, for instance) or sync, now that "bail
> out or sync" decision is made before we call into the allocator.
> 
> Along with cache management hints, user space is also able to
> adjust queue's memory consistency attributes. Memory consistency
> attribute (dma_attrs) is per-queue, yet it plays its role on the
> allocator level, when we allocate buffers’ private memory (planes).
> For the time being, only one consistency attribute is supported:
> DMA_ATTR_NON_CONSISTENT.

Gentle ping.

	-ss
