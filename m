Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2F941A8EB
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 08:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239005AbhI1G0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 02:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239103AbhI1G0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 02:26:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD4BC061575
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 23:25:06 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id e15so88206131lfr.10
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZCQae3qtwWWvw1bArGUlcBvlQ7e1v0hnozmBJqr5+wY=;
        b=XFcsrX2mvcmHJqhezqRZDMGZPCIkkaUydPP3SLHxN9StxlmKN5yJXcnHRj8AJAPl1i
         Y5zNIqhkZkspqF1g9ONsNNc8sZh01VX2QCa11ftBN+9421gF887JV0TW55ceNF6dAun5
         EFnP5PmVTGGI16/R1vuPbc9mZ6IdIWhVOpea4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZCQae3qtwWWvw1bArGUlcBvlQ7e1v0hnozmBJqr5+wY=;
        b=br4lZbOBB8IxnNyHqCttjl8Z9Xh1xA44To6BZ9IC9RircXPbERaE/BwTW71LUPav9A
         aWcbQF9PWX5mDgWM6Avm5ivQRZ9nNmnRgT28JZukJvi7uD65ZwFgoYfImIxzTRAx3CTd
         AW5Vq2QyQPHkk1T+mGn1J98JRFonpgBVTKVtf/G4zMunuVeQmnfl0P7CUo7wTg9r9L2h
         KS0fN7uZVJ3wzTjmm51Gbd3nMw/SWEZ/Dw0sfh1xMzhY+2TzT8ZQ1xCcrVviw/9eI4Gl
         R3IM3n+8YdumCtWL3ur1Jcu3PuEC/nOkPvUvYQ9SYchzMberMD6+xynY4V1Su+Q9oCdo
         N65w==
X-Gm-Message-State: AOAM531KryVXsFFEoyMjzZ+nDyP4PwZNzRUJp3J0mPnxp8aWSIbdzBV6
        gl5t1HIiMn8JSxJhbigeRk8cklPOp8nUqoC+W9qP+g==
X-Google-Smtp-Source: ABdhPJwrT8e8JH9/bCx+L/c1ar2wKO4LHtdHouzuP6rp6HRQVrGo7bbWRh3t2y5LGqn5NFCgA24rgPc+SlhWEgvgCrA=
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr3849019lfq.597.1632810305111;
 Mon, 27 Sep 2021 23:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210928034634.333785-1-senozhatsky@chromium.org>
In-Reply-To: <20210928034634.333785-1-senozhatsky@chromium.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 28 Sep 2021 14:24:54 +0800
Message-ID: <CAGXv+5HaZcf-RwGGb7phfKcoTnaeiN2H6b_BvR+qdcRYys=nzA@mail.gmail.com>
Subject: Re: [PATCH] media: videobuf2: always set buffer vb2 pointer
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 28, 2021 at 2:16 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> We need to always link allocated vb2_dc_buf back to vb2_buffer because
> we dereference vb2 in prepare() and finish() callbacks.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

This fixes the breakage from the "videobuf2: support new noncontiguous DMA
API" series on the RK3399 Scarlet if the ChromeOS patch that changes
min_buffers_needed to 0 [1] is not applied.

Since there are other in-tree drivers that have min_buffers_needed=0,
I would recommend getting some more testing.

ChenYu

[1] https://crrev.com/c/3168489
