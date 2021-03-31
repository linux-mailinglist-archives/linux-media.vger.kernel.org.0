Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A45C5350447
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 18:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbhCaQPB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 12:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbhCaQOa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 12:14:30 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7105C061574
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 09:14:29 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id b7so30920841ejv.1
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 09:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=vNxjeoAypk14qZeAB3I01j/gis4p3ugNWJgFdaxWU/Q=;
        b=rg5lOMyrShuCinEw8rLg1MsMbFzvzNJwRuFTcf3XGfpPn5FbG2JucOeBmhTReuO94g
         igE4CCbIp+DZq67I05uSrOoAesOyVuEfL3XqEF55K/N25Ivc2UIxoJtb9B8qJYhH/8WD
         6DL6fW9FEF+zJz0EJeubyAFDFcm9DLfonWDc5JHt4KJvK+jhA0y4w2Pn3J/JuVJYjVcz
         kL86TYYTYj447y6QGbbsW8vbFTGqBPrFVceKHbzWgIQ6cw4SXJTtg693JpLD5mhCy/xC
         Wic4bnqpi6Sz3Ak6Amwhb95dFNN4b2BbL2uc7ITjeXI8KFau+K0Aj7o9ffYXH+zi//Bl
         Ap7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vNxjeoAypk14qZeAB3I01j/gis4p3ugNWJgFdaxWU/Q=;
        b=mw84qPCAJjRBSdBV53dNHgmFETVhUe3dmYbb0XxKB/YqW7Wm+2tbz1hACfa1MbvCbX
         4nHpZqxYEGrzDdMzPMSkC+S913gGZxcpLJrHRuGHE3lldKsCaCaP4ibWAotRc2H3LIKW
         HQxW1MO4+HvpJevLsiCQYQ63fg+TuQgmoqo2U/qp93mJvvjhigDfIhNn+su/X029Odef
         QmMxtPj2R9E4MFPS4P5Yf2uc54y9K8cYmxExkZdbJDeCq4BXnNkgy4YxaX+c2vSuqfL0
         uEl6HSxIKOIQWkM2YLrgQzrXdj1TClDJeh0W+YHGyn2Uz4oWzdC+we4juruhx3IaPUxZ
         M06w==
X-Gm-Message-State: AOAM532ElL1Uv69BLZ0wlfd8pn+z9JbS/6bRVYJOpKpx8u3xnpCutZqm
        OdNajD3+tNTqT992Z46YaUz4oYFI37ue7AETZ+iElQ==
X-Google-Smtp-Source: ABdhPJyCD57Hk7JN+3B03CkiyVtp0j4O0SewLISi/qF5v74Y9tYrClp8NL+kMqJYkabgyX1EXc87VOEKtqokYa2ngPE=
X-Received: by 2002:a17:906:c099:: with SMTP id f25mr4446366ejz.141.1617207268482;
 Wed, 31 Mar 2021 09:14:28 -0700 (PDT)
MIME-Version: 1.0
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 31 Mar 2021 13:14:17 -0300
Message-ID: <CAAEAJfAQkocEX1Z32YwupQT1s+PMGUNQcpgrLhX9+yu+1v9czw@mail.gmail.com>
Subject: NULL pointer dereference at v4l2_ctrl_request_complete
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

We have found this crash in mainline:

[  258.174662] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
[  258.182967] Mem abort info:
[  258.187746]   ESR = 0x96000004
[  258.192100]   EC = 0x25: DABT (current EL), IL = 32 bits
[  258.199108]   SET = 0, FnV = 0
[  258.203732]   EA = 0, S1PTW = 0
[  258.208389] Data abort info:
[  258.212743]   ISV = 0, ISS = 0x00000004
[  258.218322]   CM = 0, WnR = 0
[  258.222760] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000444b0000
[  258.230822] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[  258.239097] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[  258.246162] Modules linked in: hantro_vpu(C) videobuf2_vmalloc
v4l2_h264 videobuf2_dma_contig videobuf2_memops v4l2_mem2mem
videobuf2_v4l2 videobuf2_common videodev mc etnaviv fsl_imx8_ddr_perf
gpu_sched fuse
[  258.263431] CPU: 0 PID: 34 Comm: kworker/0:1 Tainted: G         C
     5.12.0-rc2+ #106
[  258.270312] Hardware name: NXP i.MX8MQ EVK (DT)
[  258.273542] Workqueue: events v4l2_m2m_device_run_work [v4l2_mem2mem]
[  258.278716] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
[  258.283426] pc : __memcpy+0x7c/0x180
[  258.285709] lr : v4l2_ctrl_request_complete+0x7c/0x200 [videodev]
[  258.290585] sp : ffff8000116fbc60
[  258.292598] x29: ffff8000116fbc60 x28: ffff80001142b780
[  258.296617] x27: ffff80001127bc80 x26: 00000000e9b00000
[  258.300637] x25: 00000000e9a00000 x24: ffff0000067e2500
[  258.304653] x23: ffff0000067e2538 x22: ffff00000387d238
[  258.308671] x21: ffff0000067e2598 x20: ffff000004644e00
[  258.312688] x19: ffff000006812a00 x18: 0000000000000000
[  258.316708] x17: 0000000000000000 x16: 0000000000000000
[  258.320724] x15: 0000000000000000 x14: 0000000000000000
[  258.324744] x13: 0000000000000000 x12: 0000000000000000
[  258.328761] x11: 0000000000000000 x10: 0000000000000000
[  258.332776] x9 : 0000000000000000 x8 : 0000000000000000
[  258.336793] x7 : 0000000000000000 x6 : ffff000006812a40
[  258.340811] x5 : 0000000000000006 x4 : 0000000000000000
[  258.344826] x3 : 0000000000000010 x2 : 0000000000000010
[  258.348845] x1 : 0000000000000000 x0 : ffff000006812a40
[  258.352864] Call trace:
[  258.354010]  __memcpy+0x7c/0x180
[  258.355941]  hantro_end_prepare_run+0x2c/0x60 [hantro_vpu]
[  258.360150]  hantro_g1_mpeg2_dec_run+0x3b0/0x7f0 [hantro_vpu]
[  258.364615]  device_run+0xa8/0xbc [hantro_vpu]
[  258.367777]  v4l2_m2m_try_run+0x84/0x134 [v4l2_mem2mem]
[  258.371723]  v4l2_m2m_device_run_work+0x14/0x20 [v4l2_mem2mem]
[  258.376279]  process_one_work+0x1c0/0x484
[  258.378995]  worker_thread+0x70/0x434
[  258.381364]  kthread+0x158/0x160
[  258.383296]  ret_from_fork+0x10/0x34
[  258.385582] Code: a8c12027 a88120c7 a8c12027 a88120c7 (a8c12027)
[  258.390377] ---[ end trace fea6ecb96dad642d ]---

This needs several concurrent streams to run at the same time,
it doesn't happen with just one; it was reproduced in rkvdec
and hantro drivers. The above stacktrace is on MPEG-2,
but we have found it on H.264 as well.

I've traced this to:

                v4l2_ctrl_lock(ctrl);
                if (ref->req) {
                        ptr_to_ptr(ctrl, ref->req->p_req, ref->p_req);

And:

static void ptr_to_ptr(struct v4l2_ctrl *ctrl,
                       union v4l2_ctrl_ptr from, union v4l2_ctrl_ptr to)
{
        if (ctrl == NULL)
                return;
        memcpy(to.p, from.p_const, ctrl->elems * ctrl->elem_size);
                               ^^^^^^^^^^^^
                               This is NULL

I've been staring at this file and trying to understand how this can happen
but haven't been able to make any progress so far...

Any ideas ?

Thanks,
Ezequiel
