Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20D845AC29
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 20:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbhKWT0F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 14:26:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbhKWT0E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 14:26:04 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18967C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 11:22:56 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id o17so333833qtk.1
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 11:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=oOP4LZsFe9BvsNCP9KupI2wkSoNPl97Zqr3W7YVWXGI=;
        b=qqmh9vaGXRF3ary8NCeh0Qr4gawTcf10PpGkic12oegN6Azusv7035oIXER2nozDOw
         h52zJydoRuDfsEtV+BFsLdc/kCQxdbtn/BpEmAd994OhSYcnI1qaQWPL0tT6DECqZyso
         UqaHPZX32IoHzdvDIAP8Hige74RGYX3POfsgSp6+lPk1ngI/CeTnGTlwAn2eQuN2Z6UQ
         AzV1rqCmLfree3g7CdqSHlwX9taKvlvCQwWu9dR6TZwdcttEzlyCMzBZjzFarndtuNWd
         u2EXiYixtvXuwb9eIklzDUNsriix/W/j0u0xPTgExBdJOS+KRt7BfFP+/92dJp+KAlR4
         pHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oOP4LZsFe9BvsNCP9KupI2wkSoNPl97Zqr3W7YVWXGI=;
        b=sgMVK9S2MZtGRWJiiVJkawfWwhvEBRNAX2zJCOGJ2QDWlwFi9M5TCfcwesLJ8F7cn6
         jPeRXzAv/PwfSULxLAMbBHm8xj51OvxwOiOo+mp1OsJSpwt2/SxPTG5C5ZqB4dF+rKzg
         D+JDslK2xmYFyKnN4LIdDTgVmIimfVM1gYIcjBwxLYfAAJXBt8gph2EEsZ071TDnKoIt
         hlU/oLQ+6K+d9Sdq4H5MO+/F0Ks4i85XyxeCO1vzk6c9vhaT3C+upRgrcEkPamQ/yolE
         bo6SOvQFRDYwJ7Oijmn2fezFczEMhNDaKPVnSvqIuDgCgIeTDomKqk39kVWWrbgSWRKH
         wiCA==
X-Gm-Message-State: AOAM532ek5oyvGltqTCdyKZdDtuGxj0Ug1eqHiBlQz5vUr7JJ6smBfCT
        oeOpochIC41/tyyDmzISmrkuBw==
X-Google-Smtp-Source: ABdhPJyzoYt1CKE74uJDCTJoiZOHEUpBigSNrgsEVQCF9uOs281xCx8P/CPR1e59gu+3dJF1KkdJIA==
X-Received: by 2002:a05:622a:1196:: with SMTP id m22mr9071248qtk.290.1637695374024;
        Tue, 23 Nov 2021 11:22:54 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id v16sm6290713qkj.93.2021.11.23.11.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 11:22:53 -0800 (PST)
Message-ID: <9947131322e034bb6336802e5afb4b6132ca5071.camel@ndufresne.ca>
Subject: Re: [PATCH v12 00/13] amphion video decoder/encoder driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Tue, 23 Nov 2021 14:22:51 -0500
In-Reply-To: <cover.1636445575.git.ming.qian@nxp.com>
References: <cover.1636445575.git.ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,

For the patchset:

Tested-By: Nicolas Dufresne <nicolas.dufresne@collabora.com>

I've validated encoding manually with GStreamer:

  gst-launch-1.0 videotestsrc num-buffers=100 ! v4l2h264enc ! video/x-h264,profile=main,level=\(string\)2 ! h264parse ! qtmux ! filesink location=test.mov

I've also verify the that the number of frames was exactly 100, this is common
issue with V4L2 encoders. Then I have validated VP8, H.264 and H.265 decoders
using fluster [0] with this PR [1] applied. You can find full summary at the end
of this email. Markdown report didn't get generated, I will have to check with
upstream fluster if there is a regression.

$> ./fluster.py run -s -so amphion-imx8qxp-conformance.md -d GStreamer-VP8-V4L2-Gst1.0 GStreamer-H.264-V4L2-Gst1.0 GStreamer-H.265-V4L2-Gst1.0

VP8:   Ran 59/61 tests successfully               in 131.788 secs
H.264: Ran 75/135 tests successfully               in 501.206 secs
H.265: Ran 126/147 tests successfully               in 1131.933 secs

Note that in mainline, only 1 core get fired and is kept at its lowest possible
frequency, so perhaps it may cause some of the timeout seen. The driver is
overall functional, and I would like to thank you for this extra work. Also,
note that this very first time I run Fluster over the stateful CODEC wrappers. I
will need to run this on more platforms to locate the GStreamer specific fail.

VP8 note, conformance vector vp80-03-segmentation-1425 cause a hang but it then
recover:

[ 8264.851841] amphion-vpu-core 2d040000.vpu_core: [0] sync session timeout
[ 8264.858634] amphion-vpu-core 2d040000.vpu_core: [0] send cmd(0x2) fail
[ 8264.867992] amphion-vpu-core 2d040000.vpu_core: [0] start fail
[ 8264.905173] amphion-vpu-core 2d040000.vpu_core: reset hang core


See comments about your GStreamer MR below...

[0] https://github.com/fluendo/fluster
[1] https://github.com/fluendo/fluster/pull/98


[...]
> encoder is tested with gstreamer
> decoder is tested with gstreamer, but the following patches are required:

GStreamer is now a single repo (and using main branch instead of master), I have
migrated your 3 MRs into 2 MRs.

> https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/1252
> https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/1098

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1379

> https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/1099

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1381


regards,
Nicolas

[...]

****************************************************************************************************
Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0
Using 1 parallel job(s)
****************************************************************************************************

[TEST SUITE] (DECODER                    ) TEST VECTOR              ... RESULT
----------------------------------------------------------------------
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) AUD_MW_E                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) BA1_FT_C                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) BA1_Sony_D               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) BA2_Sony_F               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) BA3_SVA_C                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) BA_MW_D                  ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) BAMQ1_JVC_C              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) BAMQ2_JVC_C              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) BANM_MW_D                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) BASQP1_Sony_C            ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CABA1_Sony_D             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CABA1_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CABA2_Sony_E             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CABA2_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CABA3_Sony_C             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CABA3_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CABA3_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) cabac_mot_fld0_full      ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) cabac_mot_frm0_full      ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) cabac_mot_mbaff0_full    ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) cabac_mot_picaff0_full   ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CABACI3_Sony_B           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CABAST3_Sony_E           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CABASTBR3_Sony_B         ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CABREF3_Sand_D           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CACQP3_Sony_D            ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAFI1_SVA_C              ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAMA1_Sony_C             ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAMA1_TOSHIBA_B          ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) cama1_vtc_c              ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) cama2_vtc_b              ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAMA3_Sand_E             ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) cama3_vtc_b              ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAMACI3_Sony_C           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAMANL1_TOSHIBA_B        ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAMANL2_TOSHIBA_B        ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAMANL3_Sand_E           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAMASL3_Sony_B           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAMP_MOT_MBAFF_L30       ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAMP_MOT_MBAFF_L31       ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CANL1_Sony_E             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CANL1_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CANL1_TOSHIBA_G          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CANL2_Sony_E             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CANL2_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CANL3_Sony_C             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CANL3_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CANL4_SVA_B              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CANLMA2_Sony_C           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CANLMA3_Sony_C           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAPA1_TOSHIBA_B          ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAPAMA3_Sand_F           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAPCM1_Sand_E            ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAPCMNL1_Sand_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAPM3_Sony_D             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAQP1_Sony_B             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) cavlc_mot_fld0_full_B    ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) cavlc_mot_frm0_full_B    ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) cavlc_mot_mbaff0_full_B  ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) cavlc_mot_picaff0_full_B ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAWP1_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CAWP5_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CI1_FT_B                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CI_MW_D                  ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVBS3_Sony_C             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVCANLMA2_Sony_C         ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVFC1_Sony_C             ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVFI1_Sony_D             ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVFI1_SVA_C              ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVFI2_Sony_H             ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVFI2_SVA_C              ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVMA1_Sony_D             ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVMA1_TOSHIBA_B          ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVMANL1_TOSHIBA_B        ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVMANL2_TOSHIBA_B        ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVMAPAQP3_Sony_E         ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVMAQP2_Sony_G           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVMAQP3_Sony_D           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVMP_MOT_FLD_L30_B       ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVMP_MOT_FRM_L31_B       ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVNLFI1_Sony_C           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVNLFI2_Sony_H           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVPA1_TOSHIBA_B          ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVPCMNL1_SVA_C           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVPCMNL2_SVA_C           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVSE2_Sony_B             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVSE3_Sony_H             ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVSEFDFT3_Sony_E         ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVWP1_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVWP2_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVWP3_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) CVWP5_TOSHIBA_E          ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) FI1_Sony_E               ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) FM1_BT_B                 ... Timeout
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) FM1_FT_E                 ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) FM2_SVA_C                ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) HCBP1_HHI_A              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) HCBP2_HHI_A              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) HCMP1_HHI_A              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) LS_SVA_D                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MIDR_MW_D                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MPS_MW_A                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MR1_BT_A                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MR1_MW_A                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MR2_MW_A                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MR2_TANDBERG_E           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MR3_TANDBERG_B           ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MR4_TANDBERG_C           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MR5_TANDBERG_C           ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MR6_BT_B                 ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MR7_BT_B                 ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MR8_BT_B                 ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MR9_BT_B                 ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) MV1_BRCM_D               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) NL1_Sony_D               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) NL2_Sony_H               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) NL3_SVA_E                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) NLMQ1_JVC_C              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) NLMQ2_JVC_C              ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) NRF_MW_E                 ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) Sharp_MP_Field_1_B       ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) Sharp_MP_Field_2_B       ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) Sharp_MP_Field_3_B       ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) Sharp_MP_PAFF_1r2        ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) Sharp_MP_PAFF_2r         ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) SL1_SVA_B                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) SP1_BT_A                 ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) sp2_bt_b                 ... Fail
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) SVA_BA1_B                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) SVA_BA2_D                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) SVA_Base_B               ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) SVA_CL1_E                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) SVA_FM1_E                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) SVA_NL1_B                ... Success
[JVT-AVC_V1] (GStreamer-H.264-V4L2-Gst1.0) SVA_NL2_E                ... Success


=======================================================================
FAIL: cabac_mot_fld0_full (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '46a58bb66c0c4b1bc94a2561e7f5cc47' != '345185949255b2d66b3979dd5d263b87'
- 46a58bb66c0c4b1bc94a2561e7f5cc47
+ 345185949255b2d66b3979dd5d263b87
 : cabac_mot_fld0_full

=======================================================================
FAIL: cabac_mot_mbaff0_full (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '3fe977ce8ce2f1a4c29867d9034f8408' != 'dc354a0e404c97ca70154981ca66b308'
- 3fe977ce8ce2f1a4c29867d9034f8408
+ dc354a0e404c97ca70154981ca66b308
 : cabac_mot_mbaff0_full

=======================================================================
FAIL: cabac_mot_picaff0_full (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '2b6fbe1cf21e3034bf59fb9c1a96b1a4' != '7d7a9f7b5ebee7afabbf7101170279ca'
- 2b6fbe1cf21e3034bf59fb9c1a96b1a4
+ 7d7a9f7b5ebee7afabbf7101170279ca
 : cabac_mot_picaff0_full

=======================================================================
FAIL: CABREF3_Sand_D (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'afad28e67263aab63678c4759e9f689a' != 'dfb4d2ce0b8d177ea8f0bda09e4d7336'
- afad28e67263aab63678c4759e9f689a
+ dfb4d2ce0b8d177ea8f0bda09e4d7336
 : CABREF3_Sand_D

=======================================================================
FAIL: CAFI1_SVA_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '8f249706ddaeda94c4899c1f3954476e' != 'cf1abca903299b24fc47bec5c4ac1081'
- 8f249706ddaeda94c4899c1f3954476e
+ cf1abca903299b24fc47bec5c4ac1081
 : CAFI1_SVA_C

=======================================================================
FAIL: CAMA1_Sony_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'c234cc1b862b5b2ef958622fce77b7f5' != 'b32eb6b9f9e022d0199b03a631a3c7df'
- c234cc1b862b5b2ef958622fce77b7f5
+ b32eb6b9f9e022d0199b03a631a3c7df
 : CAMA1_Sony_C

=======================================================================
FAIL: CAMA1_TOSHIBA_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '583824378a02646355fe52318ffeb58c' != '0673aa91b6baa1f6248e1e225fa57880'
- 583824378a02646355fe52318ffeb58c
+ 0673aa91b6baa1f6248e1e225fa57880
 : CAMA1_TOSHIBA_B

=======================================================================
FAIL: cama1_vtc_c (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '9e3e565497977759d97d169cd13b842a' != '690a44ca8ec75796235a8065a8b6bccf'
- 9e3e565497977759d97d169cd13b842a
+ 690a44ca8ec75796235a8065a8b6bccf
 : cama1_vtc_c

=======================================================================
FAIL: cama2_vtc_b (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'ec33975ec4d2fccc55485da3f37a755b' != '50385efda29615bf46d8c66beef2c555'
- ec33975ec4d2fccc55485da3f37a755b
+ 50385efda29615bf46d8c66beef2c555
 : cama2_vtc_b

=======================================================================
FAIL: CAMA3_Sand_E (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '44ed473e4749ef88e040573cbb236381' != '8a3e28fd4ecae00b18f4a0f632e63455'
- 44ed473e4749ef88e040573cbb236381
+ 8a3e28fd4ecae00b18f4a0f632e63455
 : CAMA3_Sand_E

=======================================================================
FAIL: cama3_vtc_b (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '2c38362c0c84e7084527a7f1ef8c900d' != 'ff77884b05cbf9760eb17df8ba9ea73a'
- 2c38362c0c84e7084527a7f1ef8c900d
+ ff77884b05cbf9760eb17df8ba9ea73a
 : cama3_vtc_b

=======================================================================
FAIL: CAMACI3_Sony_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '0f3edb4f003b8fb4838f6a35c572fe70' != '21933a6cf51b29248803c907286ce998'
- 0f3edb4f003b8fb4838f6a35c572fe70
+ 21933a6cf51b29248803c907286ce998
 : CAMACI3_Sony_C

=======================================================================
FAIL: CAMANL1_TOSHIBA_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'ead6f461d3dfcb968386ac0a2443b35a' != '83e0a1a58b8b49d3d7f09ef6aded9c95'
- ead6f461d3dfcb968386ac0a2443b35a
+ 83e0a1a58b8b49d3d7f09ef6aded9c95
 : CAMANL1_TOSHIBA_B

=======================================================================
FAIL: CAMANL2_TOSHIBA_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '720f536ecad1dc22125e90c0f79ed165' != '40743e700e82eddbd2036e01150b1096'
- 720f536ecad1dc22125e90c0f79ed165
+ 40743e700e82eddbd2036e01150b1096
 : CAMANL2_TOSHIBA_B

=======================================================================
FAIL: CAMANL3_Sand_E (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'b28485ca9c269690e785fe0914dd51d9' != '3f18da9627e90cc93f1fde030654aebf'
- b28485ca9c269690e785fe0914dd51d9
+ 3f18da9627e90cc93f1fde030654aebf
 : CAMANL3_Sand_E

=======================================================================
FAIL: CAMASL3_Sony_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'd95dc479f23791df4f166145e5c011a4' != '119344efaea6d9333cfffe629a3a38b1'
- d95dc479f23791df4f166145e5c011a4
+ 119344efaea6d9333cfffe629a3a38b1
 : CAMASL3_Sony_B

=======================================================================
FAIL: CAMP_MOT_MBAFF_L30 (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'b360d7c05677d545fea9f35862aca50c' != 'ad1371d9d0e7a0a9428201e4ec8ae4cb'
- b360d7c05677d545fea9f35862aca50c
+ ad1371d9d0e7a0a9428201e4ec8ae4cb
 : CAMP_MOT_MBAFF_L30

=======================================================================
FAIL: CAMP_MOT_MBAFF_L31 (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '249f8b52b757de13d53d13cbbe017a41' != '4b91fd48ee2fa6b6c3065213b8fda289'
- 249f8b52b757de13d53d13cbbe017a41
+ 4b91fd48ee2fa6b6c3065213b8fda289
 : CAMP_MOT_MBAFF_L31

=======================================================================
FAIL: CANLMA2_Sony_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '90fb51566be306a77895e11cd275fcac' != '7e058e3c0d609f1daf9ce18fadd1618e'
- 90fb51566be306a77895e11cd275fcac
+ 7e058e3c0d609f1daf9ce18fadd1618e
 : CANLMA2_Sony_C

=======================================================================
FAIL: CANLMA3_Sony_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '2575cc432e6df0e4abb28aeb337c8527' != 'a938833c124510501886e00b183e65e7'
- 2575cc432e6df0e4abb28aeb337c8527
+ a938833c124510501886e00b183e65e7
 : CANLMA3_Sony_C

=======================================================================
FAIL: CAPA1_TOSHIBA_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '7dbd6d91d6768a238450890a9013f65a' != '82ddb2a84684d4666c209f6025d36a21'
- 7dbd6d91d6768a238450890a9013f65a
+ 82ddb2a84684d4666c209f6025d36a21
 : CAPA1_TOSHIBA_B

=======================================================================
FAIL: CAPAMA3_Sand_F (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '44d78296fb12c2e523cf02886e3ee4ad' != 'e257200d00d0e9dccfecbc65b8445f32'
- 44d78296fb12c2e523cf02886e3ee4ad
+ e257200d00d0e9dccfecbc65b8445f32
 : CAPAMA3_Sand_F

=======================================================================
FAIL: cavlc_mot_fld0_full_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '12fe884fd61346d2f10be36d15513eb6' != 'd7fa667393494e43705e345083521d5d'
- 12fe884fd61346d2f10be36d15513eb6
+ d7fa667393494e43705e345083521d5d
 : cavlc_mot_fld0_full_B

=======================================================================
FAIL: cavlc_mot_mbaff0_full_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '094404fcc9683ba6c1b33f352f19a229' != '939a1067c18b23928606c3cb0a309b49'
- 094404fcc9683ba6c1b33f352f19a229
+ 939a1067c18b23928606c3cb0a309b49
 : cavlc_mot_mbaff0_full_B

=======================================================================
FAIL: cavlc_mot_picaff0_full_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'bc470e9c5cd1f0e31719d1078f0678bc' != 'bbef681219e116350983f78d879aa701'
- bc470e9c5cd1f0e31719d1078f0678bc
+ bbef681219e116350983f78d879aa701
 : cavlc_mot_picaff0_full_B

=======================================================================
FAIL: CVCANLMA2_Sony_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '90fb51566be306a77895e11cd275fcac' != '7e058e3c0d609f1daf9ce18fadd1618e'
- 90fb51566be306a77895e11cd275fcac
+ 7e058e3c0d609f1daf9ce18fadd1618e
 : CVCANLMA2_Sony_C

=======================================================================
FAIL: CVFC1_Sony_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '9fdb17e17d332b5d9752362c9c7ff9b0' != 'd2aeaea0b9da3509442377a849cc2ff1'
- 9fdb17e17d332b5d9752362c9c7ff9b0
+ d2aeaea0b9da3509442377a849cc2ff1
 : CVFC1_Sony_C

=======================================================================
FAIL: CVFI1_Sony_D (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '4d9f97dca797af1e1d8f2660cef97f04' != 'bea5158644293087167fdc74b2980ae5'
- 4d9f97dca797af1e1d8f2660cef97f04
+ bea5158644293087167fdc74b2980ae5
 : CVFI1_Sony_D

=======================================================================
FAIL: CVFI1_SVA_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'af3086f97e7316670af7a4bdf3d53fea' != 'd72d5ca3017874bee9a0e9362eb2a524'
- af3086f97e7316670af7a4bdf3d53fea
+ d72d5ca3017874bee9a0e9362eb2a524
 : CVFI1_SVA_C

=======================================================================
FAIL: CVFI2_Sony_H (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'ae30d20c4c56cd64921eafcee959fbdb' != '8d4496f23489df677fa8e57c156bfc12'
- ae30d20c4c56cd64921eafcee959fbdb
+ 8d4496f23489df677fa8e57c156bfc12
 : CVFI2_Sony_H

=======================================================================
FAIL: CVFI2_SVA_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'c8a88bb26229196ee85ffc3b019c7554' != '98a76e47d1658382758d86de5369ddfd'
- c8a88bb26229196ee85ffc3b019c7554
+ 98a76e47d1658382758d86de5369ddfd
 : CVFI2_SVA_C

=======================================================================
FAIL: CVMA1_Sony_D (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'c234cc1b862b5b2ef958622fce77b7f5' != 'b32eb6b9f9e022d0199b03a631a3c7df'
- c234cc1b862b5b2ef958622fce77b7f5
+ b32eb6b9f9e022d0199b03a631a3c7df
 : CVMA1_Sony_D

=======================================================================
FAIL: CVMA1_TOSHIBA_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '583824378a02646355fe52318ffeb58c' != '0673aa91b6baa1f6248e1e225fa57880'
- 583824378a02646355fe52318ffeb58c
+ 0673aa91b6baa1f6248e1e225fa57880
 : CVMA1_TOSHIBA_B

=======================================================================
FAIL: CVMANL1_TOSHIBA_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'ead6f461d3dfcb968386ac0a2443b35a' != '83e0a1a58b8b49d3d7f09ef6aded9c95'
- ead6f461d3dfcb968386ac0a2443b35a
+ 83e0a1a58b8b49d3d7f09ef6aded9c95
 : CVMANL1_TOSHIBA_B

=======================================================================
FAIL: CVMANL2_TOSHIBA_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '720f536ecad1dc22125e90c0f79ed165' != '40743e700e82eddbd2036e01150b1096'
- 720f536ecad1dc22125e90c0f79ed165
+ 40743e700e82eddbd2036e01150b1096
 : CVMANL2_TOSHIBA_B

=======================================================================
FAIL: CVMAPAQP3_Sony_E (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '1c5c11c8b920acbd8ba3d72b5079d959' != 'fc872826ae0f96d5f55a7a25ed9ed24c'
- 1c5c11c8b920acbd8ba3d72b5079d959
+ fc872826ae0f96d5f55a7a25ed9ed24c
 : CVMAPAQP3_Sony_E

=======================================================================
FAIL: CVMAQP2_Sony_G (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'b1523085074c91e17c4a1db47c318929' != '5448ad09bb1b275694f7ae9b79535216'
- b1523085074c91e17c4a1db47c318929
+ 5448ad09bb1b275694f7ae9b79535216
 : CVMAQP2_Sony_G

=======================================================================
FAIL: CVMAQP3_Sony_D (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'fa8cf12561c04bbf68f93769ae2d1443' != '31cb5efb379c9b53b25f28636eeb28ea'
- fa8cf12561c04bbf68f93769ae2d1443
+ 31cb5efb379c9b53b25f28636eeb28ea
 : CVMAQP3_Sony_D

=======================================================================
FAIL: CVMP_MOT_FLD_L30_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '7a2ff88bf2a85190b690db602323124f' != '51612b72e8fdb199ddabb11f8b2a221f'
- 7a2ff88bf2a85190b690db602323124f
+ 51612b72e8fdb199ddabb11f8b2a221f
 : CVMP_MOT_FLD_L30_B

=======================================================================
FAIL: CVMP_MOT_FRM_L31_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'e55e41c7ed89a78ab338faabdd1abff1' != '5a851ac3cbe95f17f6abdc00fa340b8f'
- e55e41c7ed89a78ab338faabdd1abff1
+ 5a851ac3cbe95f17f6abdc00fa340b8f
 : CVMP_MOT_FRM_L31_B

=======================================================================
FAIL: CVNLFI1_Sony_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'f76dfe9a73a69f25106b940b21c436ce' != '4b1cec47e8c9ca6ef0f5c4d2fafec758'
- f76dfe9a73a69f25106b940b21c436ce
+ 4b1cec47e8c9ca6ef0f5c4d2fafec758
 : CVNLFI1_Sony_C

=======================================================================
FAIL: CVNLFI2_Sony_H (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'c9d048ee4281ad2f7e41be1da0f9c210' != '218ed2ab114b34676fb1d524c83ab5cc'
- c9d048ee4281ad2f7e41be1da0f9c210
+ 218ed2ab114b34676fb1d524c83ab5cc
 : CVNLFI2_Sony_H

=======================================================================
FAIL: CVPA1_TOSHIBA_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '6c1d64160a6a4d81a3c8176e7ba304c4' != '2d2b37aaab718ffef994029f6d1ad219'
- 6c1d64160a6a4d81a3c8176e7ba304c4
+ 2d2b37aaab718ffef994029f6d1ad219
 : CVPA1_TOSHIBA_B

=======================================================================
FAIL: FI1_Sony_E (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'e56dee215cec5912300406975ffdc56c' != 'a0daa562cd266e6bb893c07be516ce56'
- e56dee215cec5912300406975ffdc56c
+ a0daa562cd266e6bb893c07be516ce56
 : FI1_Sony_E

=======================================================================
FAIL: FM1_BT_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 507, in run
    stdout, stderr = process.communicate(input, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1134, in communicate
    stdout, stderr = self._communicate(input, endtime, timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 2005, in _communicate
    self.wait(timeout=self._remaining_time(endtime))
  File "/usr/lib64/python3.9/subprocess.py", line 1189, in wait
    return self._wait(timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1909, in _wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 'gst-launch-1.0 filesrc location=resources/JVT-AVC_V1/FM1_BT_B/FM1_BT_B.h264 ! h264parse ! v4l2h264dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JVT-AVC_V1/FM1_BT_B.out' timed out after 29.999805622000167 seconds

=======================================================================
FAIL: FM1_FT_E (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'bf2d60e2a0140368e087580a8565fc99' != '9ec7fab73663a9c2b51472c7a109ac5a'
- bf2d60e2a0140368e087580a8565fc99
+ 9ec7fab73663a9c2b51472c7a109ac5a
 : FM1_FT_E

=======================================================================
FAIL: FM2_SVA_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '2ca2331ff02689d0cc036935a7f0d4bf' != 'd41d8cd98f00b204e9800998ecf8427e'
- 2ca2331ff02689d0cc036935a7f0d4bf
+ d41d8cd98f00b204e9800998ecf8427e
 : FM2_SVA_C

=======================================================================
FAIL: MR4_TANDBERG_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '5f5f14beca549172487bb74c4d3ba8f9' != 'a27dd395b0cb190ba2d40201197ba436'
- 5f5f14beca549172487bb74c4d3ba8f9
+ a27dd395b0cb190ba2d40201197ba436
 : MR4_TANDBERG_C

=======================================================================
FAIL: MR5_TANDBERG_C (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '5f5f14beca549172487bb74c4d3ba8f9' != 'a27dd395b0cb190ba2d40201197ba436'
- 5f5f14beca549172487bb74c4d3ba8f9
+ a27dd395b0cb190ba2d40201197ba436
 : MR5_TANDBERG_C

=======================================================================
FAIL: MR6_BT_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'd2ef83e72a57df1cc5266a0be646463f' != '3f08e88cb0cb8d66eb00c0c7cfa4c010'
- d2ef83e72a57df1cc5266a0be646463f
+ 3f08e88cb0cb8d66eb00c0c7cfa4c010
 : MR6_BT_B

=======================================================================
FAIL: MR7_BT_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '3ee7ae943bf21f309a6fe438f832d1b8' != '9327e048ef581c58116f085f2741691c'
- 3ee7ae943bf21f309a6fe438f832d1b8
+ 9327e048ef581c58116f085f2741691c
 : MR7_BT_B

=======================================================================
FAIL: MR8_BT_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '1ed4829bf27262147b12ee16cd6ce5db' != '725adc04ca305870d8873ae34ce5417c'
- 1ed4829bf27262147b12ee16cd6ce5db
+ 725adc04ca305870d8873ae34ce5417c
 : MR8_BT_B

=======================================================================
FAIL: MR9_BT_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'c1ae4e809894d01cc4f5e6b0bb8df99e' != '686ff125262b0128624196acecb1bab6'
- c1ae4e809894d01cc4f5e6b0bb8df99e
+ 686ff125262b0128624196acecb1bab6
 : MR9_BT_B

=======================================================================
FAIL: Sharp_MP_Field_1_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '069ca95648563a3d0d78121588b506ee' != '87bcc33216268c7f0bc129324683dea3'
- 069ca95648563a3d0d78121588b506ee
+ 87bcc33216268c7f0bc129324683dea3
 : Sharp_MP_Field_1_B

=======================================================================
FAIL: Sharp_MP_Field_2_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '6025cbdf791a3881c371774d3674b471' != 'a95c09f0584edb344cfa2915b75079ad'
- 6025cbdf791a3881c371774d3674b471
+ a95c09f0584edb344cfa2915b75079ad
 : Sharp_MP_Field_2_B

=======================================================================
FAIL: Sharp_MP_Field_3_B (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '01c63ee764a75a5100e3f720954f65f5' != 'a010a3a6f9e35e895a48fabe45103929'
- 01c63ee764a75a5100e3f720954f65f5
+ a010a3a6f9e35e895a48fabe45103929
 : Sharp_MP_Field_3_B

=======================================================================
FAIL: Sharp_MP_PAFF_1r2 (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'e31b7df5a2e5dde2b5c8ede9d3aec16d' != '38edc0f0830ebfd7d72a7f68ed9635a7'
- e31b7df5a2e5dde2b5c8ede9d3aec16d
+ 38edc0f0830ebfd7d72a7f68ed9635a7
 : Sharp_MP_PAFF_1r2

=======================================================================
FAIL: Sharp_MP_PAFF_2r (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '8edf56f61f81162c1f7a795029aca26f' != 'f57ccac4277106c6f5f7b7db47c97f33'
- 8edf56f61f81162c1f7a795029aca26f
+ f57ccac4277106c6f5f7b7db47c97f33
 : Sharp_MP_PAFF_2r

=======================================================================
FAIL: SP1_BT_A (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'ca0b3580f448cc1e07f81a4756273b59' != 'b5427c3d710735d7f408e679cfa82bad'
- ca0b3580f448cc1e07f81a4756273b59
+ b5427c3d710735d7f408e679cfa82bad
 : SP1_BT_A

=======================================================================
FAIL: sp2_bt_b (GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '77fef826070d3d17174529b16765bb24' != 'ee5e5a79b130665148b999669a11c56e'
- 77fef826070d3d17174529b16765bb24
+ ee5e5a79b130665148b999669a11c56e
 : sp2_bt_b

Ran 75/135 tests successfully               in 501.206 secs
Generating summary for test suite JVT-AVC_V1 and decoders GStreamer-H.264-V4L2-Gst1.0:

****************************************************************************************************
Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0
Using 1 parallel job(s)
****************************************************************************************************

[TEST SUITE    ] (DECODER                    ) TEST VECTOR                     ... RESULT
----------------------------------------------------------------------
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) AMP_A_Samsung_7                 ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) AMP_B_Samsung_7                 ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) AMP_D_Hisilicon_3               ... Timeout
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) AMP_E_Hisilicon_3               ... Timeout
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) AMP_F_Hisilicon_3               ... Timeout
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) AMVP_A_MTK_4                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) AMVP_B_MTK_4                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) AMVP_C_Samsung_7                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) BUMPING_A_ericsson_1            ... Fail
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) CAINIT_A_SHARP_4                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) CAINIT_B_SHARP_4                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) CAINIT_C_SHARP_3                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) CAINIT_D_SHARP_3                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) CAINIT_E_SHARP_3                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) CAINIT_F_SHARP_3                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) CAINIT_G_SHARP_3                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) CAINIT_H_SHARP_3                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) CIP_A_Panasonic_3               ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) cip_B_NEC_3                     ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) CIP_C_Panasonic_2               ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) CONFWIN_A_Sony_1                ... Fail
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DBLK_A_MAIN10_VIXS_4            ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DBLK_A_SONY_3                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DBLK_B_SONY_3                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DBLK_C_SONY_3                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DBLK_D_VIXS_2                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DBLK_E_VIXS_2                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DBLK_F_VIXS_2                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DBLK_G_VIXS_2                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DELTAQP_A_BRCM_4                ... Timeout
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DELTAQP_B_SONY_3                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DELTAQP_C_SONY_3                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DSLICE_A_HHI_5                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DSLICE_B_HHI_5                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) DSLICE_C_HHI_5                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) ENTP_A_QUALCOMM_1               ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) ENTP_B_Qualcomm_1               ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) ENTP_C_Qualcomm_1               ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) EXT_A_ericsson_4                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) FILLER_A_Sony_1                 ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) HRD_A_Fujitsu_3                 ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) INITQP_A_Sony_1                 ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) INITQP_B_Main10_Sony_1          ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) ipcm_A_NEC_3                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) ipcm_B_NEC_3                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) ipcm_C_NEC_3                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) ipcm_D_NEC_3                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) ipcm_E_NEC_2                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) IPRED_A_docomo_2                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) IPRED_B_Nokia_3                 ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) IPRED_C_Mitsubishi_3            ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) LS_A_Orange_2                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) LS_B_Orange_4                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) LTRPSPS_A_Qualcomm_1            ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MAXBINS_A_TI_5                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MAXBINS_B_TI_5                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MAXBINS_C_TI_5                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MERGE_A_TI_3                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MERGE_B_TI_3                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MERGE_C_TI_3                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MERGE_D_TI_3                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MERGE_E_TI_3                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MERGE_F_MTK_4                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MERGE_G_HHI_4                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MVCLIP_A_qualcomm_3             ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MVDL1ZERO_A_docomo_4            ... Timeout
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) MVEDGE_A_qualcomm_3             ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) NoOutPrior_A_Qualcomm_1         ... Fail
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) NoOutPrior_B_Qualcomm_1         ... Fail
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) NUT_A_ericsson_5                ... Fail
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) OPFLAG_A_Qualcomm_1             ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) OPFLAG_B_Qualcomm_1             ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) OPFLAG_C_Qualcomm_1             ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) PICSIZE_A_Bossen_1              ... Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) PICSIZE_B_Bossen_1              ... Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) PICSIZE_C_Bossen_1              ... Fail
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) PICSIZE_D_Bossen_1              ... Fail
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) PMERGE_A_TI_3                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) PMERGE_B_TI_3                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) PMERGE_C_TI_3                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) PMERGE_D_TI_3                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) PMERGE_E_TI_3                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) POC_A_Bossen_3                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) PPS_A_qualcomm_7                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) PS_B_VIDYO_3                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RAP_A_docomo_6                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RAP_B_Bossen_2                  ... Fail
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RPLM_A_qualcomm_4               ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RPLM_B_qualcomm_4               ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RPS_A_docomo_5                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RPS_B_qualcomm_5                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RPS_C_ericsson_5                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RPS_D_ericsson_6                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RPS_E_qualcomm_5                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RPS_F_docomo_2                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RQT_A_HHI_4                     ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RQT_B_HHI_4                     ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RQT_C_HHI_4                     ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RQT_D_HHI_4                     ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RQT_E_HHI_4                     ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RQT_F_HHI_4                     ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) RQT_G_HHI_4                     ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SAO_A_MediaTek_4                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SAO_B_MediaTek_5                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SAO_C_Samsung_5                 ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SAO_D_Samsung_5                 ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SAO_E_Canon_4                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SAO_F_Canon_3                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SAO_G_Canon_3                   ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SAO_H_Parabola_1                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SAODBLK_A_MainConcept_4         ... Timeout
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SAODBLK_B_MainConcept_4         ... Timeout
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SDH_A_Orange_4                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SLICES_A_Rovi_3                 ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SLIST_A_Sony_5                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SLIST_B_Sony_9                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SLIST_C_Sony_4                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SLIST_D_Sony_9                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) SLPPLP_A_VIDYO_2                ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) STRUCT_A_Samsung_7              ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) STRUCT_B_Samsung_7              ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) TILES_A_Cisco_2                 ... Timeout
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) TILES_B_Cisco_1                 ... Timeout
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) TMVP_A_MS_3                     ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) TSCL_A_VIDYO_5                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) TSCL_B_VIDYO_4                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) TSKIP_A_MS_3                    ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) TSUNEQBD_A_MAIN10_Technicolor_2 ... Fail
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) TUSIZE_A_Samsung_1              ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) VPSID_A_VIDYO_2                 ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) VPSSPSPPS_A_MainConcept_1       ... Error
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WP_A_MAIN10_Toshiba_3           ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WP_A_Toshiba_3                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WP_B_Toshiba_3                  ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WP_MAIN10_B_Toshiba_3           ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN10_2         ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN_2           ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN10_2         ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN_2           ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN10_2         ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN_2           ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN10_2         ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN_2           ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN10_2         ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN_2           ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN10_2         ... Success
[JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN_2           ... Success


=======================================================================
FAIL: AMP_D_Hisilicon_3 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 507, in run
    stdout, stderr = process.communicate(input, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1134, in communicate
    stdout, stderr = self._communicate(input, endtime, timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 2005, in _communicate
    self.wait(timeout=self._remaining_time(endtime))
  File "/usr/lib64/python3.9/subprocess.py", line 1189, in wait
    return self._wait(timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1909, in _wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/AMP_D_Hisilicon_3/AMP_D_Hisilicon.bit ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/AMP_D_Hisilicon_3.out' timed out after 29.99980899699949 seconds

=======================================================================
FAIL: AMP_E_Hisilicon_3 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 507, in run
    stdout, stderr = process.communicate(input, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1134, in communicate
    stdout, stderr = self._communicate(input, endtime, timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 2005, in _communicate
    self.wait(timeout=self._remaining_time(endtime))
  File "/usr/lib64/python3.9/subprocess.py", line 1189, in wait
    return self._wait(timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1909, in _wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/AMP_E_Hisilicon_3/AMP_E_Hisilicon.bit ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/AMP_E_Hisilicon_3.out' timed out after 29.999798621999616 seconds

=======================================================================
FAIL: AMP_F_Hisilicon_3 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 507, in run
    stdout, stderr = process.communicate(input, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1134, in communicate
    stdout, stderr = self._communicate(input, endtime, timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 2005, in _communicate
    self.wait(timeout=self._remaining_time(endtime))
  File "/usr/lib64/python3.9/subprocess.py", line 1189, in wait
    return self._wait(timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1909, in _wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/AMP_F_Hisilicon_3/AMP_F_Hisilicon_3.bit ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/AMP_F_Hisilicon_3.out' timed out after 29.999801372000547 seconds

=======================================================================
FAIL: BUMPING_A_ericsson_1 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '64f213eb1cf45614f0eeb50fd1b725bf' != 'a85ebcd45f4bc1a05a5d66404b85a283'
- 64f213eb1cf45614f0eeb50fd1b725bf
+ a85ebcd45f4bc1a05a5d66404b85a283
 : BUMPING_A_ericsson_1

=======================================================================
FAIL: CONFWIN_A_Sony_1 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'a3ce3f936ff69ff1ec2621a622dd37ac' != '1463f3ca27962804a2f7ba0f55978830'
- a3ce3f936ff69ff1ec2621a622dd37ac
+ 1463f3ca27962804a2f7ba0f55978830
 : CONFWIN_A_Sony_1

=======================================================================
FAIL: DELTAQP_A_BRCM_4 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 507, in run
    stdout, stderr = process.communicate(input, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1134, in communicate
    stdout, stderr = self._communicate(input, endtime, timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 2005, in _communicate
    self.wait(timeout=self._remaining_time(endtime))
  File "/usr/lib64/python3.9/subprocess.py", line 1189, in wait
    return self._wait(timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1909, in _wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/DELTAQP_A_BRCM_4/DELTAQP_A_BRCM_4/DELTAQP_A_BRCM_4.bit ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/DELTAQP_A_BRCM_4.out' timed out after 29.999807246999808 seconds

=======================================================================
FAIL: MVDL1ZERO_A_docomo_4 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 507, in run
    stdout, stderr = process.communicate(input, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1134, in communicate
    stdout, stderr = self._communicate(input, endtime, timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 2005, in _communicate
    self.wait(timeout=self._remaining_time(endtime))
  File "/usr/lib64/python3.9/subprocess.py", line 1189, in wait
    return self._wait(timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1909, in _wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/MVDL1ZERO_A_docomo_4/MVDL1ZERO_A_docomo_4.bit ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/MVDL1ZERO_A_docomo_4.out' timed out after 29.999810747000083 seconds

=======================================================================
FAIL: NoOutPrior_A_Qualcomm_1 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '1c5f20a08ab8dfa0f44d9a0ca23d174d' != '32ffa6b58b648b3e966f011fb063c14c'
- 1c5f20a08ab8dfa0f44d9a0ca23d174d
+ 32ffa6b58b648b3e966f011fb063c14c
 : NoOutPrior_A_Qualcomm_1

=======================================================================
FAIL: NoOutPrior_B_Qualcomm_1 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '048bca0ec216a3f88cf9fbb4bb5a61ac' != '1f2e78cc91d3e50894d51b020b378fc7'
- 048bca0ec216a3f88cf9fbb4bb5a61ac
+ 1f2e78cc91d3e50894d51b020b378fc7
 : NoOutPrior_B_Qualcomm_1

=======================================================================
FAIL: NUT_A_ericsson_5 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '9dbe33badd0cc6dfcd1b53e546968fbd' != 'a954a2af78fdc7cd7b4cc5ed67c28c44'
- 9dbe33badd0cc6dfcd1b53e546968fbd
+ a954a2af78fdc7cd7b4cc5ed67c28c44
 : NUT_A_ericsson_5

=======================================================================
FAIL: PICSIZE_A_Bossen_1 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 528, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/PICSIZE_A_Bossen_1/PICSIZE_A_Bossen_1/PICSIZE_A_Bossen_1.bin ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/PICSIZE_A_Bossen_1.out' returned non-zero exit status 1.

=======================================================================
FAIL: PICSIZE_B_Bossen_1 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 528, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/PICSIZE_B_Bossen_1/PICSIZE_B_Bossen_1/PICSIZE_B_Bossen_1.bin ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/PICSIZE_B_Bossen_1.out' returned non-zero exit status 1.

=======================================================================
FAIL: PICSIZE_C_Bossen_1 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '674f9f11eb956257d86782949ec00399' != 'ec7466a6f046dbd4f94e793fc307068d'
- 674f9f11eb956257d86782949ec00399
+ ec7466a6f046dbd4f94e793fc307068d
 : PICSIZE_C_Bossen_1

=======================================================================
FAIL: PICSIZE_D_Bossen_1 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '5b76e0591618f5affe8b15b03d9c0bef' != '5c6a3798b45257aeee5aabd94b86589d'
- 5b76e0591618f5affe8b15b03d9c0bef
+ 5c6a3798b45257aeee5aabd94b86589d
 : PICSIZE_D_Bossen_1

=======================================================================
FAIL: RAP_B_Bossen_2 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'f38befcc280f2fd0d23f48f807f843c2' != '9a85001a2279df623eaa367d666501dd'
- f38befcc280f2fd0d23f48f807f843c2
+ 9a85001a2279df623eaa367d666501dd
 : RAP_B_Bossen_2

=======================================================================
FAIL: SAODBLK_A_MainConcept_4 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 507, in run
    stdout, stderr = process.communicate(input, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1134, in communicate
    stdout, stderr = self._communicate(input, endtime, timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 2005, in _communicate
    self.wait(timeout=self._remaining_time(endtime))
  File "/usr/lib64/python3.9/subprocess.py", line 1189, in wait
    return self._wait(timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1909, in _wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/SAODBLK_A_MainConcept_4/SAODBLK_A_MainConcept_4/SAODBLK_A_MainConcept_4.bin ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/SAODBLK_A_MainConcept_4.out' timed out after 29.999805997000294 seconds

=======================================================================
FAIL: SAODBLK_B_MainConcept_4 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 507, in run
    stdout, stderr = process.communicate(input, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1134, in communicate
    stdout, stderr = self._communicate(input, endtime, timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 2005, in _communicate
    self.wait(timeout=self._remaining_time(endtime))
  File "/usr/lib64/python3.9/subprocess.py", line 1189, in wait
    return self._wait(timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1909, in _wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/SAODBLK_B_MainConcept_4/SAODBLK_B_MainConcept_4/SAODBLK_B_MainConcept_4.bin ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/SAODBLK_B_MainConcept_4.out' timed out after 29.99980249700002 seconds

=======================================================================
FAIL: TILES_A_Cisco_2 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 507, in run
    stdout, stderr = process.communicate(input, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1134, in communicate
    stdout, stderr = self._communicate(input, endtime, timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 2005, in _communicate
    self.wait(timeout=self._remaining_time(endtime))
  File "/usr/lib64/python3.9/subprocess.py", line 1189, in wait
    return self._wait(timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1909, in _wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/TILES_A_Cisco_2/TILES_A_Cisco_2/TILES_A_Cisco_2.bin ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/TILES_A_Cisco_2.out' timed out after 29.999810246999914 seconds

=======================================================================
FAIL: TILES_B_Cisco_1 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 507, in run
    stdout, stderr = process.communicate(input, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1134, in communicate
    stdout, stderr = self._communicate(input, endtime, timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 2005, in _communicate
    self.wait(timeout=self._remaining_time(endtime))
  File "/usr/lib64/python3.9/subprocess.py", line 1189, in wait
    return self._wait(timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1909, in _wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/TILES_B_Cisco_1/TILES_B_Cisco_1/TILES_B_Cisco_1.bin ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/TILES_B_Cisco_1.out' timed out after 29.999793870999383 seconds

=======================================================================
FAIL: TSUNEQBD_A_MAIN10_Technicolor_2 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: '1bed23df7253170eeb8efc3fd1b740a3' != '7de52908e284c5c137a02d31a4eb4884'
- 1bed23df7253170eeb8efc3fd1b740a3
+ 7de52908e284c5c137a02d31a4eb4884
 : TSUNEQBD_A_MAIN10_Technicolor_2

=======================================================================
FAIL: VPSSPSPPS_A_MainConcept_1 (GStreamer-H.265-V4L2-Gst1.0.JCT-VC-HEVC_V1)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 528, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command 'gst-launch-1.0 filesrc location=resources/JCT-VC-HEVC_V1/VPSSPSPPS_A_MainConcept_1/VPSSPSPPS_A_MainConcept_1.bin ! h265parse ! v4l2h265dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/JCT-VC-HEVC_V1/VPSSPSPPS_A_MainConcept_1.out' returned non-zero exit status 1.

Ran 126/147 tests successfully               in 1131.933 secs
Generating summary for test suite JCT-VC-HEVC_V1 and decoders GStreamer-H.265-V4L2-Gst1.0:

****************************************************************************************************
Running test suite VP8-TEST-VECTORS with decoder GStreamer-VP8-V4L2-Gst1.0
Using 1 parallel job(s)
****************************************************************************************************

[TEST SUITE      ] (DECODER                  ) TEST VECTOR               ... RESULT
----------------------------------------------------------------------
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-001 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-002 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-003 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-004 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-005 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-006 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-007 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-008 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-009 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-010 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-011 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-012 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-013 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-014 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-015 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-016 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-017 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-00-comprehensive-018 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-01-intra-1400        ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-01-intra-1411        ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-01-intra-1416        ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-01-intra-1417        ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-02-inter-1402        ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-02-inter-1412        ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-02-inter-1418        ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-02-inter-1424        ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-01   ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-02   ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-03   ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-04   ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1401 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1403 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1407 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1408 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1409 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1410 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1413 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1414 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1415 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1425 ... Timeout
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1426 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1427 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1432 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1435 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1436 ... Fail
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1437 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1441 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-03-segmentation-1442 ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-04-partitions-1404   ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-04-partitions-1405   ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-04-partitions-1406   ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-05-sharpness-1428    ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-05-sharpness-1429    ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-05-sharpness-1430    ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-05-sharpness-1431    ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-05-sharpness-1433    ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-05-sharpness-1434    ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-05-sharpness-1438    ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-05-sharpness-1439    ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-05-sharpness-1440    ... Success
[VP8-TEST-VECTORS] (GStreamer-VP8-V4L2-Gst1.0) vp80-05-sharpness-1443    ... Success


=======================================================================
FAIL: vp80-03-segmentation-1425 (GStreamer-VP8-V4L2-Gst1.0.VP8-TEST-VECTORS)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 71, in _test
    result = self.decoder.decode(
  File "/home/nicolas/fluster/fluster/decoders/gstreamer.py", line 90, in decode
    run_command(shlex.split(pipeline), timeout=timeout, verbose=verbose)
  File "/home/nicolas/fluster/fluster/utils.py", line 70, in run_command
    raise ex
  File "/home/nicolas/fluster/fluster/utils.py", line 66, in run_command
    subprocess.run(command, stdout=sout, stderr=serr, check=check, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 507, in run
    stdout, stderr = process.communicate(input, timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1134, in communicate
    stdout, stderr = self._communicate(input, endtime, timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 2005, in _communicate
    self.wait(timeout=self._remaining_time(endtime))
  File "/usr/lib64/python3.9/subprocess.py", line 1189, in wait
    return self._wait(timeout=timeout)
  File "/usr/lib64/python3.9/subprocess.py", line 1909, in _wait
    raise TimeoutExpired(self.args, timeout)
subprocess.TimeoutExpired: Command 'gst-launch-1.0 filesrc location=resources/VP8-TEST-VECTORS/vp80-03-segmentation-1425/vp80-03-segmentation-1425.ivf ! ivfparse ! v4l2vp8dec ! video/x-raw ! videoconvert dither=none ! video/x-raw,format=I420 ! videocodectestsink location=results/VP8-TEST-VECTORS/vp80-03-segmentation-1425.out' timed out after 29.99979774699932 seconds

=======================================================================
FAIL: vp80-03-segmentation-1436 (GStreamer-VP8-V4L2-Gst1.0.VP8-TEST-VECTORS)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/nicolas/fluster/fluster/test.py", line 104, in _test
    self.assertEqual(
AssertionError: 'bfd17a557ee1ba347c755a18ce5a64a6' != '44ed1dfb57028e6cd6ce6a1caab507b8'
- bfd17a557ee1ba347c755a18ce5a64a6
+ 44ed1dfb57028e6cd6ce6a1caab507b8
 : vp80-03-segmentation-1436

Ran 59/61 tests successfully               in 131.788 secs

