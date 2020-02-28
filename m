Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428E8172F96
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 04:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730794AbgB1D6E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 22:58:04 -0500
Received: from mail-pj1-f50.google.com ([209.85.216.50]:50207 "EHLO
        mail-pj1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730782AbgB1D6E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 22:58:04 -0500
Received: by mail-pj1-f50.google.com with SMTP id r67so712050pjb.0
        for <linux-media@vger.kernel.org>; Thu, 27 Feb 2020 19:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8xTrl5tDJ3LgMjVjznAF2IZeLLj4bLTa5BFypN0t3zI=;
        b=FLoUb8YWIBuLFoC4a674VnvdxctknREYD8PsnvPRqrRhKsCe12ZRSw+75eaa+Dlup8
         MCLEWHv+XMbgSPaH9rDmqjz2BP7UVMNjqglwAa/87DKW6m47xejUIaAVeWnkBb1w8558
         sW0TsJVbQTh+l68RVz8wB7l1Tgmy7ImR47CWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8xTrl5tDJ3LgMjVjznAF2IZeLLj4bLTa5BFypN0t3zI=;
        b=RLyyOQrM03wQ/g3kUdXHQ5UKKr6EsqlTgIhPIyLVSap9uvTxli2em8gPnHV5I+Wg8e
         RHueW3RybLg7Gn6mgkZtBe9ER0fnNuNBKwLacHeI0ksWGMaVuJuj03rYrIA+z/y0cB0w
         YXOSnx8TbLZB63Z8b/6D7SZstrEszpaKeYCSP2aWjVtiLgx4MXFxItcE+yavWOSaryxS
         6+p7MQzNHfaQnSHa87EaMiRMqoWb009lBLieTVsavKKIthjswcDzR6kFMzNzV431MPOM
         OwhVtKzkvP6zPIjqC1OoPc0D5xdqOiaynNMBa8jp7bTObbizL7GDiKyOSGddC+K02gIM
         lCqg==
X-Gm-Message-State: APjAAAXD1GW9Gp+ZT7kSzPVNWxDvx7Tj9qdNvoPRsDplfM7OdQZ5RQ52
        n5SsU6Xea12aVc+ebOKIY2veTA==
X-Google-Smtp-Source: APXvYqyvxjKuYMmtpPhK74Cp/7Nhm3vufNA08w1WY2arWJ6e2j4fSSY/TtpCAkQC5CTdLTtF/shCvQ==
X-Received: by 2002:a17:90a:1f8c:: with SMTP id x12mr2512123pja.27.1582862283222;
        Thu, 27 Feb 2020 19:58:03 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id c68sm9251950pfc.156.2020.02.27.19.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 19:58:02 -0800 (PST)
Date:   Fri, 28 Feb 2020 12:57:59 +0900
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
Subject: Re: [PATCHv3 05/11] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT flag
Message-ID: <20200228035759.GP122464@google.com>
References: <20200226111529.180197-1-senozhatsky@chromium.org>
 <20200226111529.180197-6-senozhatsky@chromium.org>
 <8ea79a02-8346-2b1d-c2d8-3a3b36480320@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ea79a02-8346-2b1d-c2d8-3a3b36480320@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/02/27 13:36), Hans Verkuil wrote:
[..]
> >  	other changes, then set ``count`` to 0, ``memory`` to
> >  	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
> >      * - __u32
> > -      - ``reserved``\ [7]
> > +      - ``flags``
> > +      - Specifies additional buffer management attributes.
> > +	See :ref:`memory-flags`. Old drivers and applications must set it to
> > +	zero.
> 
> Drop the last sentence, it's not relevant.
> 
> > +
> > +    * - __u32
> > +      - ``reserved``\ [6]
> >        - A place holder for future extensions. Drivers and applications
> >  	must set the array to zero.
> 
> Old drivers and applications still think reserved is [7] and will zero this.

Just to make sure, does this mean that you also want me to drop the
"Drivers and applications must set the array to zero" sentence?

	-ss
