Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B8438C85E
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236275AbhEUNj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236241AbhEUNjm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:39:42 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96526C06138C
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:38:18 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id d25so8361023ioe.1
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zXInqLwOOkmxw3FAtCSHWSift3iK7/sFcDERc9LRSF4=;
        b=P+50PGwtRDOoeSEvb4QqD//5T0XqcThBfJTGTyXGa/7fVf0cA8hIb1SmGHWRm+npTW
         xzGND2Pva4PPpWL9EM+uqUvGKNxk4RBqy0YJwKPing7Ye6LW+mxzR+hPkOXQc59KYeP5
         zztM/HFZ1Vo17VrxhVyGBPxqobjIOPl37JteeOoC69VXt7LCvsCtAmRZyt0WQmp7BQ3J
         7jrOyzncZCqVfT+arDqQ7g2VuNValU4gSjobpj4PMND6JrPwvgOW2/F0KyBYpgRMMnho
         Yjrnb6S5eth7mVkI+IbYDNlxFbp0pm7uw6QfsR+up+JH8EXkwDovI1IfdUtODb4W7KCr
         LJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zXInqLwOOkmxw3FAtCSHWSift3iK7/sFcDERc9LRSF4=;
        b=RxWrQGK8huhYDgTURL+u/azxRRkDrY5iwJCwGTAZ5BhXByDGx6Nij+OCtfFKjmaKB/
         woWB/bICq8cgbN0clZZugT0r+1bP4DjmGoEfFHiu09QUV8yYCIW3eMFTab0FT5ZczJL9
         /O5erVBLRLXQl72vjnUQh+FUKi4zRl2ma21NxW2jKJd0CoW3+hoH1TLcPpKetKQdlZ9M
         D854PxVzPhrqtZtd/nH+mEtnm22otPAJAnZ30/Loqc+sCAniDKH64O38TIS5FMU2DVuP
         O9D8PBucgEjfavJL53frTanY7wqTdAuXnVhWil94DdkteTEPvTg8Vaxt8nYFmaJVWc6k
         0qgw==
X-Gm-Message-State: AOAM532Pas3ap+mfC6xf58UQCZ96+uTa1fArmG9MrqSJLrtwifSIUPjr
        wvvDtCWwSG22ILHbVVWtLnNpYk8SmcjQuZo2r8mZwA==
X-Google-Smtp-Source: ABdhPJzDCg3SDubz4fjQvEgSqB/x9Z08rEIowfTPC3zW+FVgcUW8kQxymOjjU9gFknfrlouULiZyZcawYJnd45GtWDg=
X-Received: by 2002:a02:5409:: with SMTP id t9mr4611825jaa.50.1621604297789;
 Fri, 21 May 2021 06:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org> <20210519143011.1175546-11-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-11-acourbot@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 21:38:06 +0800
Message-ID: <CA+Px+wUWncvepPMhRZ7qdMzdeQr+0jnJRPYRY57qedVPM_8+wg@mail.gmail.com>
Subject: Re: [PATCH v5 10/14] media: mtk-vcodec: vdec: support stateless API
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> +#include "media/videobuf2-v4l2.h"
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <linux/module.h>
> +
> +#include "mtk_vcodec_drv.h"
> +#include "mtk_vcodec_dec.h"
> +#include "mtk_vcodec_intr.h"
> +#include "mtk_vcodec_util.h"
> +#include "vdec_drv_if.h"
> +#include "mtk_vcodec_dec_pm.h"

Would be good practice to separate <...> and "..." inclusion and sort them.

> +static void mtk_vdec_worker(struct work_struct *work)
> +{
> +       struct mtk_vcodec_ctx *ctx =
> +               container_of(work, struct mtk_vcodec_ctx, decode_work);
> +       struct mtk_vcodec_dev *dev = ctx->dev;
> +       struct vb2_v4l2_buffer *vb2_v4l2_src, *vb2_v4l2_dst;
> +       struct vb2_buffer *vb2_src;
> +       struct mtk_vcodec_mem *bs_src;
> +       struct mtk_video_dec_buf *dec_buf_src;
> +       struct media_request *src_buf_req;
> +       struct vdec_fb *dst_buf;
> +       bool res_chg = false;
> +       int ret;
> +
> +       vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +       if (vb2_v4l2_src == NULL) {

To be neat, !vb2_v4l2_src.

> +       vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +       if (vb2_v4l2_dst == NULL) {

To be neat, !vb2_v4l2_dst.
