Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13622151442
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 03:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgBDCu0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 21:50:26 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:40200 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgBDCuZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 21:50:25 -0500
Received: by mail-pj1-f65.google.com with SMTP id 12so686980pjb.5
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 18:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SIPb87j1x52DpZAA2dXWxz9TdyllVrxg7vta0P2dsgQ=;
        b=GjTFy4PXP77tBt3f62/r618RgWIPd4s3gK9eoOMnIMN3eZZjMiQVJNAMaiDepHdQjY
         9cNUAoU9LEpMNiYuHvSsPEj3utzgeztTXwF+blSAwre6pwBqspmd3Ef9fqSXwA9TS1GS
         K3i6XA/D0eczxbWXKaKxy9y2xdfl8f7ZXBr18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SIPb87j1x52DpZAA2dXWxz9TdyllVrxg7vta0P2dsgQ=;
        b=q0WXyFbwAyhXrUA/L+c2hlGf0YZB8A+ChfQ4j2i90lTfB5JHaDfr72dWR4Yz9yN48b
         ra0PKvvuqaJVBqDSmCM6kFnK8JWvpqwFnT6gSK4gklO5sAvvgcUJznk8A2Ry3hZKEaZF
         AHfy5bm5Q2fQJn1FPI8J+6Y5U02Fn8I1/L8U3kexWJu+z6yJx5kM6fqoUicIQiDSKzpw
         qi7QAsakX01d+zvsgG/Ag6rT+SQXIIcDbNV/pQ1Aapha/6PR6GPnV/i78MtznEFEkdvh
         /GwV1VVchM6n7h2od/OxuBBDc34zmQzyfe+y/nW5wn67PNx+ZszfjLMF8EbbDjX5sAa0
         /Gsw==
X-Gm-Message-State: APjAAAXE72E9F2l9rpwHrDreG1SR4oj/p94n2iEmQ8uQpIUQURDtNNtr
        WSFgB6pI6oGBh44nOFGjWP3IbA==
X-Google-Smtp-Source: APXvYqxbS01u5Z2Cu0d+QYSIXDHwvkeCKpPMuaHL0dLdMogyQs3ucft0inokm+BourpirZqU8TEeoQ==
X-Received: by 2002:a17:902:864a:: with SMTP id y10mr27112565plt.2.1580784624133;
        Mon, 03 Feb 2020 18:50:24 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id z30sm23150340pfq.154.2020.02.03.18.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 18:50:23 -0800 (PST)
Date:   Tue, 4 Feb 2020 11:50:21 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC][PATCH 12/15] videobuf2: add begin/end cpu_access callbacks
 to dma-sg
Message-ID: <20200204025021.GF41358@google.com>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-13-senozhatsky@chromium.org>
 <1c5198dc-db4e-47d6-0d8b-259fbbb6372f@xs4all.nl>
 <CAAFQd5DN0FSJ=pXG3J32AXocnbkR+AB8yKKDk0tZS4s7K04Z9Q@mail.gmail.com>
 <560ba621-5396-1ea9-625e-a9f83622e052@xs4all.nl>
 <CAAFQd5D27xaKhxg8UuPH6XXdzgBBsCeDL8wYw37r6AK+6sWcbg@mail.gmail.com>
 <c23618a9-4bf8-1d9a-6e52-d616c79ff289@xs4all.nl>
 <CAAFQd5BGA-mnirgwQJP_UHkNzpVvf19xeRu-n7GLQci8nYGB2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5BGA-mnirgwQJP_UHkNzpVvf19xeRu-n7GLQci8nYGB2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/02/03 19:04), Tomasz Figa wrote:
[..]
> > I very much agree with that. But this should be very clearly documented.
> > Should V4L2_CAP_MEMORY_NON_CONSISTENT always be set in this case?
> >
> 
> Yes, IMHO that would make sense. My understanding is that currently
> the consistency of allocated memory is unspecified, so it can be
> either. With V4L2_FLAG_MEMORY_NON_CONSISTENT, the userspace can
> explicitly ask for inconsistent memory.
> 
> Moreover, I'd vote for setting V4L2_CAP_MEMORY_NON_CONSISTENT when
> V4L2_FLAG_MEMORY_NON_CONSISTENT is guaranteed to return inconsistent
> memory to avoid "optional" features or "hints" without guaranteed
> behavior.

Documentation/DMA-attributes.txt says the following

  DMA_ATTR_NON_CONSISTENT
  -----------------------

  DMA_ATTR_NON_CONSISTENT lets the platform to choose to return either
  consistent or non-consistent memory as it sees fit.  By using this API,
  you are guaranteeing to the platform that you have all the correct and
  necessary sync points for this memory in the driver.

	-ss
