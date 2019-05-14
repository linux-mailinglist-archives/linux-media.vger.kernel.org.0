Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5B1D1C471
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 10:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfENIMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 04:12:12 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44080 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfENIMM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 04:12:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id g9so8694393pfo.11
        for <linux-media@vger.kernel.org>; Tue, 14 May 2019 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ELhRuMsUIWwL7cdxk7yZxKy2OTGQGdFenKWb/rZoxgA=;
        b=SqRCNlo6hgzL0YlpNY/t44ggLN4avw6PNEKVCowpQgDmtPe0yYAQj9zGkyyZYVInr7
         tU3BoBdA/O05irkUhvlaGqhHK4oBnhKrmD7FKGxl4h/VRzJGhAafoL/L0RUuIgzFTDz9
         4plTolbqfLjzBlqbOscGy6bSw0pQMx+M3HnI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ELhRuMsUIWwL7cdxk7yZxKy2OTGQGdFenKWb/rZoxgA=;
        b=B8BtrFdKZYnKutq7xHVa5awBV9Qw6smJJozseTlEO5KgNmxlaaIbLpGeehycOZ5fOr
         djFp1nOrumgCFSpV3C0Fr2sW7TAFS8TcKVv62uTB1yKmGOvK/2YhBvLOUvpmi73bKMdo
         gOaUj7dfY+8uuGAxfx+FMPFc9RwPoZAuwjQc4EIKKHy90dO6Yrc9vRM32w5FKa411X+0
         HnhY4gjB9ZRi7TVKjKHFiyiuLAz9awXjQYBiXsEU+Socqv1vZTCV/ZZLE5mV0krXb6KH
         Znji9MfOhkuURZaeHLbB4c1Jk79C0bgr2j71MOc9jt0Fv+bOy2qZwiTmtarrxV3syVnH
         qxPQ==
X-Gm-Message-State: APjAAAUPTdP3ti5jb8AHWOemMKNRRJLmuzmI0+HnNCRrE6XxdUbDzK/j
        CHcDnBFOp4z2rdELKde763Osyw==
X-Google-Smtp-Source: APXvYqwo+K+cbzWQE4wnVaj+lvOIDoSw50OP67oo8SVrG+i1C9Q42J+rxF8oGU2S0atGGLD19ZYbkA==
X-Received: by 2002:a62:6807:: with SMTP id d7mr38391742pfc.75.1557821531245;
        Tue, 14 May 2019 01:12:11 -0700 (PDT)
Received: from chromium.org ([2401:fa00:4:4:6d27:f13:a0fa:d4b6])
        by smtp.gmail.com with ESMTPSA id f87sm23387384pff.56.2019.05.14.01.12.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 01:12:10 -0700 (PDT)
Date:   Tue, 14 May 2019 17:12:04 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pawel Osciak <posciak@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Kamil Debski <kamil@wypas.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Jeongtae Park <jtp.park@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tiffany Lin =?utf-8?B?KOael+aFp+ePiik=?= 
        <tiffany.lin@mediatek.com>,
        Andrew-CT Chen =?utf-8?B?KOmZs+aZuui/qik=?= 
        <andrew-ct.chen@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Todor Tomov <todor.tomov@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dave.stevenson@raspberrypi.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Subject: Re: [PATCH v3 2/2] media: docs-rst: Document memory-to-memory video
 encoder interface
Message-ID: <20190514081204.GA132745@chromium.org>
References: <20190124100419.26492-1-tfiga@chromium.org>
 <20190124100419.26492-3-tfiga@chromium.org>
 <20190430193412.4291fca8@litschi.hi.pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430193412.4291fca8@litschi.hi.pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Tue, Apr 30, 2019 at 07:34:12PM +0200, Michael Tretter wrote:
> On Thu, 24 Jan 2019 19:04:19 +0900, Tomasz Figa wrote:

[snip]

> > +State machine
> > +=============
> > +
> > +.. kernel-render:: DOT
> > +   :alt: DOT digraph of encoder state machine
> > +   :caption: Encoder state machine
> > +
> > +   digraph encoder_state_machine {
> > +       node [shape = doublecircle, label="Encoding"] Encoding;
> > +
> > +       node [shape = circle, label="Initialization"] Initialization;
> > +       node [shape = circle, label="Stopped"] Stopped;
> > +       node [shape = circle, label="Drain"] Drain;
> > +       node [shape = circle, label="Reset"] Reset;
> > +
> > +       node [shape = point]; qi
> > +       qi -> Initialization [ label = "open()" ];
> > +
> > +       Initialization -> Encoding [ label = "Both queues streaming" ];
> > +
> > +       Encoding -> Drain [ label = "V4L2_DEC_CMD_STOP" ];
> > +       Encoding -> Reset [ label = "VIDIOC_STREAMOFF(CAPTURE)" ];
> > +       Encoding -> Stopped [ label = "VIDIOC_STREAMOFF(OUTPUT)" ];
> > +       Encoding -> Encoding;
> > +
> > +       Drain -> Stopped [ label = "All CAPTURE\nbuffers dequeued\nor\nVIDIOC_STREAMOFF(CAPTURE)" ];
> 
> Shouldn't this be
> 
> 	Drain -> Stopped [ label = "All OUTPUT\nbuffers dequeued\nor\nVIDIOC_STREAMOFF(OUTPUT)" ];
> 
> ? While draining, the encoder continues encoding until all source
> buffers, i.e., buffers in the OUTPUT queue, are encoded or STREAMOFF
> happens on the OUTPUT queue. At the same time, the client continues to
> queue and dequeue buffers on the CAPTURE queue and there might be
> buffers queued on the CAPTURE queue even if the driver returned the
> buffer with the FLAG_LAST set and returns -EPIPE on further DQBUF
> requests.
>

The STREAMOFF should be on OUTPUT indeed, because that immediately
removes any OUTPUT buffers from the queue, so there is nothing to be
encoded to wait for anymore.

The "All OUTPUT buffers dequeued" part is correct, though. The last
OUTPUT buffer in the flush sequence is considered encoded after the
application dequeues the corresponding CAPTURE buffer is dequeued and
that buffer is marked with the V4L2_BUF_FLAG_LAST flag.

Best regards,
Tomasz
