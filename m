Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAC5A163F6E
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgBSImc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:42:32 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46382 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbgBSIm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:42:29 -0500
Received: by mail-pf1-f195.google.com with SMTP id k29so12136190pfp.13
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 00:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rEfRYK8X2QQnG43sHHHHoR8YIwfIEm7XxLTlJ/H+Qso=;
        b=D4fnLH50SoBcu24sBK+TREJyUfMHxXPaZKVeoLfvA5KFxaZ7c68RJNszw2tBFA9Qcp
         ba+eAmlzeBfOiXE8FiyX0VS/UsLgVA9SF+n+DR06ziu8bljGWCHxbU/czk9XIaQ7Imvj
         bhlROB8OvWew6mZ/ZxOVoOWi7afsncAZvIcNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rEfRYK8X2QQnG43sHHHHoR8YIwfIEm7XxLTlJ/H+Qso=;
        b=Yz09unrx9dYUroGkudz5WktH8lw48Mv6wJ41tDKcx0tYvS61l3/VuewfQhtjKaukZu
         BRjSL9CKdD8BKJVwt5LUr4JZsWiTJYJfuum2BdVP60soICWnk3WOP06lU5/aA6lPgmw+
         LotX8taOMqa55I4Ph4Olp3mWhS+Jdsi8NumQs+P9V6U6y/DTFAtV9ZUOOYLk3KQkBlX7
         wsjwnHCsVuAjOvTi1SdeVJYG1gdhFyc8jsJzF+u+KhIGJVRDCkWuQJkqdAOC/24LImM7
         GNax6SrS5GbbjYlJ6ooCC2QUq0/ic+6Leu0K7Qbz5N9eAXrwl1vFfxBxA6j3xxrqd67r
         90kA==
X-Gm-Message-State: APjAAAX5U8CjLWwS0WdwNJ1CxT4QTmSaepQNqrMt12FfBRb6VNa97rCo
        OyvuN0jVnw6ypAInjiHTqjoCMw==
X-Google-Smtp-Source: APXvYqzjnuZExpo94NDDjP+oXQOEJXX7Rv7xGZvYk6wB2CYz2vbMD1KopE9TEkAVUNxHi4plCGVSsw==
X-Received: by 2002:aa7:9796:: with SMTP id o22mr25408908pfp.101.1582101748508;
        Wed, 19 Feb 2020 00:42:28 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id v25sm1829913pfe.147.2020.02.19.00.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 00:42:27 -0800 (PST)
Date:   Wed, 19 Feb 2020 17:42:26 +0900
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
Subject: Re: [RFC][PATCHv2 11/12] videobuf2: add begin/end cpu_access
 callbacks to dma-sg
Message-ID: <20200219084226.GC122464@google.com>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-12-senozhatsky@chromium.org>
 <06d654ec-9d05-4ef5-c27e-ff78c96a3457@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06d654ec-9d05-4ef5-c27e-ff78c96a3457@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/02/19 09:35), Hans Verkuil wrote:
> On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:
> > Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
> > callbacks for cache synchronisation on exported buffers.
> > 
> > V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
> > dma-sg allocates memory using the page allocator directly, so
> > there is no memory consistency guarantee.
> 
> This should also be a comment in the code.

OK.

	-ss
