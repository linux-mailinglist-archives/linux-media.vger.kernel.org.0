Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F77A15D704
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 12:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbgBNL75 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 06:59:57 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:40718 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbgBNL75 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 06:59:57 -0500
Received: by mail-io1-f68.google.com with SMTP id x1so10235730iop.7
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2020 03:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1uraVtsrzVMHzePG2yR6DCPEUMyavhEyjVs6nxEu24o=;
        b=U30YN/B2MumWYRiXps0fXkEWwSbju05SSBqJ4/raPl8BGRwatykH4NN5BhmTGAAcSP
         t0MWzBlOIlELWnQbS7pogaTu9V3noHu3hw2QYvs8WYZ93cF4NLKnuYa/kfrmCHch/ADb
         lbs1t4fy6PqAkeECeCkNqgUuytFbP1GcOSaDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1uraVtsrzVMHzePG2yR6DCPEUMyavhEyjVs6nxEu24o=;
        b=sRasOtKUq7On6OGgUjbnUYjPNHkObM5kbnYw3zYKsjX2ne7uiljEudF0AqETwbpMJG
         6D3MjzPl4udKLji+wHvSoMVMLgf3d1rD3ROisxyQiAv4/PR02MRXXu0VqwTrgSWz5i85
         xT5O32uPBmtfo3y1qMrnni9gBtcURgK537gxKxGd7XXYlCeBx5LiqFmktSVN/jWERDKO
         sOVWm9FcGozTuTEuUbBx/lI5j/1JCjOIlnunEiZFwdXktl/DQxjGVfhgg5N6Ov8e+Rnx
         j6CHsi/W7Yh552eAigewElMu+sPUcnHyD6ldKsqKbPZRlc3XRhbD1+bpyVk8qLOA2RsN
         Wr6A==
X-Gm-Message-State: APjAAAXCwR7znYmp2iaXPAN1NamgqHZyg1mm8gFt3EQeSBNdk2nnvgUc
        Kv+ztoYKxFkPOYLSSWvsCwHwL96Mvb7Hf+NXbF+DjQ==
X-Google-Smtp-Source: APXvYqxMO1/xuTDVrtKd0ZSFbiILKTJtYtsmXOvsUOD0CpbVMimQ6kn9e/yNKOWoZ4c8M8RRzOmpBWPZFwTqt9iA31E=
X-Received: by 2002:a6b:3845:: with SMTP id f66mr2068307ioa.102.1581681596283;
 Fri, 14 Feb 2020 03:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20200210035351.227499-1-hsinyi@chromium.org> <bf9205b3-6b02-625a-670d-16cfd44d3274@xs4all.nl>
In-Reply-To: <bf9205b3-6b02-625a-670d-16cfd44d3274@xs4all.nl>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Fri, 14 Feb 2020 19:59:30 +0800
Message-ID: <CAJMQK-gaEq7RA8vQBsM4-LcFONRQ5GY0nUiSUJ08uhggTSHcNA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vpu: avoid unaligned access to DTCM buffer.
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 14, 2020 at 6:52 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Hsin-Yi Wang,
>
> On 2/10/20 4:53 AM, Hsin-Yi Wang wrote:
> > struct vpu_run *run in vpu_init_ipi_handler() is an ioremapped DTCM (Data
> > Tightly Coupled Memory) buffer shared with AP.  It's not able to do
> > unaligned access. Otherwise kernel would crash due to unable to handle
> > kernel paging request.
> >
> > struct vpu_run {
> >       u32 signaled;
> >       char fw_ver[VPU_FW_VER_LEN];
> >       unsigned int    dec_capability;
> >       unsigned int    enc_capability;
> >       wait_queue_head_t wq;
> > };
> >
> > fw_ver starts at 4 byte boundary. If system enables
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, strscpy() will do
> > read_word_at_a_time(), which tries to read 8-byte: *(unsigned long *)addr
> >
> > Copy the string by memcpy_fromio() for this buffer to avoid unaligned
> > access.
> >
> > Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> This patch results in the following sparse warnings:
>
> sparse: WARNINGS
> SPARSE:mtk-vpu/mtk_vpu.c mtk-vpu/mtk_vpu.c:834:52:  warning: incorrect type in argument 3 (incompatible argument 1 (different address spaces))
> SPARSE:mtk-vpu/mtk_vpu.c mtk-vpu/mtk_vpu.c:609:29:  warning: dereference of noderef expression
> SPARSE:mtk-vpu/mtk_vpu.c mtk-vpu/mtk_vpu.c:613:35:  warning: dereference of noderef expression
> SPARSE:mtk-vpu/mtk_vpu.c mtk-vpu/mtk_vpu.c:614:35:  warning: dereference of noderef expression
>
> Can you take a look?
>
> Regards,
>
>         Hans
>
Thanks, I'll send a v2 to fix this
