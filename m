Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65BA14AEAC
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 05:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgA1EgE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 23:36:04 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:47076 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgA1EgE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 23:36:04 -0500
Received: by mail-ed1-f65.google.com with SMTP id m8so13222643edi.13
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2020 20:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y7WDQ8mNe+wTvHSQNys0Gz2BA37V8tfgf8BXSaFDUrw=;
        b=kCQIevLRhxAg4UVMkdBxxATDymmTLAjaMvHwJsThMEk/YBCOMHlA3IP+01gzEtYU/k
         jF2EubEsqlfuQvucRuh17bk0kMaWvLEJqjdeqpY2dqVEfE/E2R87NsToHMvY/3HAL3Nn
         sVcayrty7WiA0gu+kfHdMhrDJeV3kfSq3YOL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y7WDQ8mNe+wTvHSQNys0Gz2BA37V8tfgf8BXSaFDUrw=;
        b=gzl+Um6k631jwW/UrAkZm8YPSFiya1NDuKcbdsGwCltkgrVoBZa6W88gA5rb0A/a2z
         rOr9xz0AG3yeRZ8F/AUTO7DV0DTAVNd4dy11HknuEKg4vXP7N4Y3wBZ/oujhQEzdlI9p
         BzDfsB4APuJ5LluYFVo92TbG1Rs9qCLyn4yCOOliky0SylgtW9IpTILOsadlvPSwh5E/
         hJ7yXrgbT9rOtWU4+SI8D1MKQfMc2vSVlMsSOkf39UTZL0d9ohBW2bCm15v4JrlcLRB4
         WIMCrrsa3HSi+E6IPjA3HNcvtPfaaQK7edu/c6wRWE4DhtCQrRyrI3GyUsrbzXYVqRwa
         +GVg==
X-Gm-Message-State: APjAAAUuVmRZP72/z18zib63L5rvVi/srLkUuMRM8Kgreuwk7MKUIiae
        2GDUPDDYNQs1CqHXuInc5JjnwSik1hdv+A==
X-Google-Smtp-Source: APXvYqzDemyK1lOMgdQcaFMjwR8+JCcH0I//rQkyf9scFkN6N57dWU/Ir7C+IMYryMfaEMv7usdl0A==
X-Received: by 2002:a05:6402:1b92:: with SMTP id cc18mr1683794edb.363.1580186162380;
        Mon, 27 Jan 2020 20:36:02 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id ly13sm191240ejb.22.2020.01.27.20.36.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 20:36:01 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id s10so1011641wmh.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jan 2020 20:36:01 -0800 (PST)
X-Received: by 2002:a7b:c750:: with SMTP id w16mr2306669wmk.46.1580186160717;
 Mon, 27 Jan 2020 20:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-3-senozhatsky@chromium.org> <ada2381c-2c1c-17c3-c190-48439ae1657a@xs4all.nl>
 <20200122013937.GC149602@google.com> <20200122025351.GF149602@google.com>
In-Reply-To: <20200122025351.GF149602@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 28 Jan 2020 13:35:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BHXtdmqxFwAHAiyPLQikVLKLsrHL5Ja4jBePR0x-EC9A@mail.gmail.com>
Message-ID: <CAAFQd5BHXtdmqxFwAHAiyPLQikVLKLsrHL5Ja4jBePR0x-EC9A@mail.gmail.com>
Subject: Re: [RFC][PATCH 02/15] videobuf2: handle V4L2 buffer cache flags
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 22, 2020 at 11:53 AM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (20/01/22 10:39), Sergey Senozhatsky wrote:
> > [..]
> > > >  }
> > > >
> > > > +static void set_buffer_cache_hints(struct vb2_queue *q,
> > > > +                            struct vb2_buffer *vb,
> > > > +                            struct v4l2_buffer *b)
> > > > +{
> > > > + vb->need_cache_sync_on_prepare = 1;
> > > > +
> > > > + if (q->dma_dir != DMA_TO_DEVICE)
> > >
> > > What should be done when dma_dir == DMA_BIDIRECTIONAL?
> >
>
> [..]
>
> > We probably cannot enforce any other behavior here. Am I missing
> > something?
>
> Never mind. I got your point.

DMA_BIDIRECTIONAL by default needs sync on both prepare and finish.
need_cache_sync_on_prepare is initialized to 1. Since
DMA_BIDIRECTIONAL != DMA_TO_DEVICE, need_cache_sync_on_finish would
also be set to 1. Is anything still missing?
