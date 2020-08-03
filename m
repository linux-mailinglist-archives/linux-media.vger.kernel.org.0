Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4EA523AA0D
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 18:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgHCQAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 12:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgHCQAO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 12:00:14 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FE5C06174A
        for <linux-media@vger.kernel.org>; Mon,  3 Aug 2020 09:00:13 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id 186so1019747vkx.4
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2020 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AQC5OSI+ot4HICgMI1hBiF+Gos4KF9rtoTAXqBLWz5k=;
        b=gP0hGxdZpv7oi/HJF0iairUbhXDSeECExkx/WUmvKbJIKYqRHFbhrSant0W/qarBAu
         pt2QS00SD0C3sScBrjjH8PuJSo/uiRusGI8NdinY72x5wOlbs+la767nkgtU1+AdO/4R
         sVgh/KH5EXT8KXDfD+VCxBTK4X1AEadmwBpBrMVvntYBujslfuoMPSdeAJPR+0zoXtmU
         az8f0YQ3IGNq2/+IKVQAVs5iYU/bcziJbdbgOWftXf0g+mybpPTS5/8EnV/nQwq4dSqm
         ZRV9gMwTdIcvKiJF/9J0XUaNMTR7Pm4yz/Nv7W/qKW98y0pV5r5ge3KKLHyEx2GZZhW8
         O0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AQC5OSI+ot4HICgMI1hBiF+Gos4KF9rtoTAXqBLWz5k=;
        b=AVtO3WZudgLjzsIuDhPvr+0DVmYgm75XlMMkfv7FiudQ6P1XsLhYA78+WYohqET93A
         9gM01jBfGOx1VA8z6q3yA0AHMQSCE80q5DJaqdmP1Zy1pqrGVzV/Tch61zNml4A/yd/V
         Es5X/g/pj5I/45DBUPMqKFSwRkMjYf8JrZFkug+GPnBWb6cTO6J9YLJ4sQaCLncHlDcV
         qFSgODq8nRX/VJhUo6aTQLV2IHvJ/wqMucncM1NFVuBIBJl0Pt4aYfRj5Sq+Jpa2bfYp
         Kg3EPHnJCos5TCtl1j8r8zkLebuiJJlOnbOXQYRF9ahsc8IE0PCK0mwPqczefay5AIk6
         y+vA==
X-Gm-Message-State: AOAM533cRWlMkUiB61waYENRa/dpM6f3AOdFIQUE5A7ndSckle5dUhQh
        6dwOFLUOyM2FIFjhL+6tZcdV1GsRDWOCCBy9j3RywA==
X-Google-Smtp-Source: ABdhPJxBkWFzXg/y1w5xTYtUJSHjvCQFO/a1nE0RcfXFpI2HgJqGujkazyU0S+p/ymKJ5J9VS+bR1YpMln1PD/g9du0=
X-Received: by 2002:a1f:9651:: with SMTP id y78mr1828501vkd.5.1596470412618;
 Mon, 03 Aug 2020 09:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com> <20200803154125.GA23808@casper.infradead.org>
In-Reply-To: <20200803154125.GA23808@casper.infradead.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 3 Aug 2020 09:00:00 -0700
Message-ID: <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Kalesh Singh <kaleshsingh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
        Hridya Valsaraju <hridya@google.com>,
        Ioannis Ilkos <ilkos@google.com>,
        John Stultz <john.stultz@linaro.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 3, 2020 at 8:41 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 03, 2020 at 02:47:19PM +0000, Kalesh Singh wrote:
> > +static void dma_buf_fd_install(int fd, struct file *filp)
> > +{
> > +     trace_dma_buf_fd_ref_inc(current, filp);
> > +}
>
> You're adding a new file_operation in order to just add a new tracepoint?
> NACK.

Hi Matthew,
The plan is to attach a BPF to this tracepoint in order to track
dma-buf users. If you feel this is an overkill, what would you suggest
as an alternative?
