Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85382C6756
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 15:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730609AbgK0OAQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 09:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730152AbgK0OAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 09:00:16 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8265C0613D1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 06:00:15 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id d17so5830982ejy.9
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2020 06:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ccJHrlF9FwsIH9aGCulf5tf6e++Vv2HEBiESGeN2fLs=;
        b=LeZQ2JMiHx3KWZn33gCrv1uiXmf/8We+/+Ejos6ALV/IVKzPwbojrtszbf4r3BnLwu
         LmB6JIN+8Qns54BaXXybdThKDMfzXtcYBY7fSE1h8VSB3WtQIe19fERX/QzfYSOTr5yS
         39q1xvP/mATA8sguPQrJ+X+lnepBknaZhWqzRBU4Er95l/BKLvHwk5BSI7Qpf7KtmMDG
         F/1i8KFWeprrpQ9yzebmZWsTxMDGw//Yemg62ltIRmCGRgcKstYpUJ3kSahbFv5Lx1li
         7HYWxfnHpgpe1KDOIEQfg0NyJBn14Ug4HoEkTLgUBD6FLrTegGXZT7WfOW8xCWTn3Zez
         Zblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ccJHrlF9FwsIH9aGCulf5tf6e++Vv2HEBiESGeN2fLs=;
        b=Efk32y7ihvm/bWrReRD4gG4phRrkvWDhsXRxHEC88k0xWqz3ZojhkeuV76ZuzOVDml
         ErNKkennVirvTxz0GOaBEw2hY3FIcmZdmzu1D8+XaHGZR/NW+DkUaoDZeZr5iTA7qtrd
         ojO1rpBHol/3ciPYD4H/hVWQJUsow23AW8j5i2nS2NId2cCe40hpMRAnxTan2hj06PDS
         bnAwWAZkXD1fwJT4rQm5nxPCwuHCiWng8VmvmFc0OWz1Spns6qCcCYPSgFHrrW2Sjasy
         S4pjHOZ9+9EjfLY7P6ABTrwi4+A2qcoeOuCrKaXd1vYhMFqQsbphKtRJiMg/icFXyJY5
         LY3w==
X-Gm-Message-State: AOAM533qAr7vJvG+go0VfdD42jiiEU8qi+rVPtmWsX4Q0KfzyBJe/J9E
        KoyOrJGzLg58jzJi4TWL7vAIGVLdyVvpQjZOhMlRJg==
X-Google-Smtp-Source: ABdhPJxXNcUzvO9Y9iUEuUPSU6pIz4SIyNYM+xG57jiKAgNc0TyTbXD0krD0FiNHDdKufo+i1/UTGAQRBAwRmVjcrRQ=
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr7922731eju.375.1606485613605;
 Fri, 27 Nov 2020 06:00:13 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 27 Nov 2020 19:30:01 +0530
Message-ID: <CA+G9fYvLt1A_VZJk96ixFxx4Ep9eX9zy8hFDLLZ=WwKLBMXaEA@mail.gmail.com>
Subject: v4l2-compliance: v4l2-test-formats.cpp(265): unknown flag 000001e0 returned
To:     open list <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Alexandre Courbot <gnurou@gmail.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Pi-Hsun Shih <pihsun@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

FYI,
you might have seen this problem, but for the record I am reporting here,
Following test cases have been failing for a while on the mainline kernel.
Please find crash log and git short between bad and good commit.

List of failed test cases:
v4l2-compliance
    * VIDIOC_ENUM_FMT-FRAMESIZES-FRAMEINTERVALS
    * VIDIOC_G_FMT
    * VIDIOC_S_FMT
    * VIDIOC_TRY_FMT

test output log:
-------------------
Format ioctls (Input 0):
fail: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(265):
unknown flag 000001e0 returned
test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: FAIL
warn: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(1320):
S_PARM is supported for buftype 1, but not for ENUM_FRAMEINTERVALS
test VIDIOC_G/S_PARM: OK
test VIDIOC_G_FBUF: OK
fail: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(444):
pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
test VIDIOC_G_FMT: FAIL
fail: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(444):
pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
test VIDIOC_TRY_FMT: FAIL
fail: ../../../v4l-utils-1.18.1/utils/v4l2-compliance/v4l2-test-formats.cpp(444):
pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
test VIDIOC_S_FMT: FAIL

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

# git log --oneline  dfef313e9990..c4439713e82a  -- drivers/media/v4l2-core/
1efe3c28eba1 media: v4l2-mem2mem: Fix spurious v4l2_m2m_buf_done
463c43fcd97e Merge tag 'v5.9-rc7' into patchwork
1698a7f15112 media: v4l2-mem2mem: simplify poll logic
566463afdbc4 media: v4l2-mem2mem: always consider OUTPUT queue during poll
5823833c9ada media: v4l2-ctrl: Add VP9 codec levels
32b6e400c34d media: v4l2-fwnode: Use debug level for printing link frequencies
d13ee586e026 Merge tag 'v5.9-rc4' into patchwork
1faa39e0f3bc media: videobuf-dma-sg: number of pages should be unsigned long
44f5b2fffc32 media: v4l2-ctrl: Add frame-skip std encoder control
4ad1b0d410c8 media: v4l2-ctrls: Add encoder constant quality control
d9358563179a media: uapi: h264: Clean slice invariants syntax elements
f9879eb37829 media: uapi: h264: Increase size of DPB entry pic_num
c02ff21952a6 media: uapi: h264: Clean DPB entry interface
eb44c6c9c236 media: uapi: h264: Split prediction weight parameters
911ea8ec42de media: v4l2-mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume
38df0b850613 media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops


Full test log,
https://lkft.validation.linaro.org/scheduler/job/1987206#L1664

-- 
Linaro LKFT
https://lkft.linaro.org
