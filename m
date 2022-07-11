Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26A18570C72
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 23:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbiGKVLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 17:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbiGKVLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 17:11:50 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB01132DA5
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 14:11:47 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-10c0e6dd55eso8171665fac.7
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 14:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbKWYct3zsrjoEzuaalBR5DOzaR3iOSKkKGj9VMXX4Q=;
        b=lSyK+TybBpBJtkKE65SGZElfNa7FhIvZbZTMDtuhflL/1WfRJzRPIV5AeqCk3/8Jvk
         qaIGSq6iuOumoe5N/dKmdpzyTSP2meopJ0j64azXBSzmbcQTa/jVdMfyAtD61aoRVL6n
         LfkhQbhLhuK5RDAarGHQH/rYfYROieRKTVMHzkkOohMSvzSvmESQeHd01Qbdw5oNDghp
         ychol7kyf7TXdt5/Kuyba1mCgKjxXNM6MmZaE/K3q2QpL05cvlwjFzcwxG06nV67ABGt
         Jh7CS+LrCvOGs8sADuX+JPlobi3coeYrIm8KXqBp92iSHk/zdkbDxVrGiNVwK0KQduV4
         D3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbKWYct3zsrjoEzuaalBR5DOzaR3iOSKkKGj9VMXX4Q=;
        b=quRMF44odR5nDwCohasYCUPvZrqelvD9q7oGO2H/JYnhSDvlgORN1NGCEdMfp5hqJA
         QN+U4ZxZBHc8Po94pL9ze9sRp2CBIRe9oZYlLlfaYU+LAbYV1hsVJJgXpPJOmtdZwOkm
         ZsAbecQXiMm0l+crSB32obqkgr764ZnB01JHQrBBuy6MC1zQAYKd3WjBYOLm1+pcp2lx
         /JVUl4f8RpvAUV9E4/QCTsSKa+/V8NMikzPSjBFnoS2m1ZrI+ZFcTZ9QMhab9e/B+ymo
         EBse8rJGI+NN++JBYZ+DMQK9ra6SvvGoinu9whT1AQrW1qx15BPbnst3MSHCohCusX9P
         pdJg==
X-Gm-Message-State: AJIora+2H+4asVlTCKatqU9KZ2mOFpGPxjuwt5bMLyVrYL3ipH48tjOs
        kBfGVVwIUs9tS1GW99fooGQ0bDMhBrQhSI6z
X-Google-Smtp-Source: AGRyM1ufJbNzhzUX1SClCd4w/9qofyi8K7JJoWUJBXCkRPit7cmiGrp+C0J7kbNzO2JlBp8m5vMPng==
X-Received: by 2002:a05:6870:2418:b0:101:9461:787c with SMTP id n24-20020a056870241800b001019461787cmr172168oap.196.1657573906945;
        Mon, 11 Jul 2022 14:11:46 -0700 (PDT)
Received: from zeta-build.. ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id c128-20020aca3586000000b00338869042fdsm3198817oia.32.2022.07.11.14.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 14:11:46 -0700 (PDT)
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 0/8] videobuf2: Replace vb2_find_timestamp() with vb2_find_buffer()
Date:   Mon, 11 Jul 2022 18:11:33 -0300
Message-Id: <20220711211141.349902-1-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All users of vb2_find_timestamp() combine it with vb2_get_buffer()
to retrieve a videobuf2 buffer, given a u64 timestamp.

Therefore, this series removes vb2_find_timestamp() and instead
introduces a vb2_find_buffer, which is more suitable, making
videobuf2 API slightly cleaner.

Changes from v1:

* Introduce API in its final shape, to make review easier.
* Prefix cedrus_write_ref_buf_addr and move to common cedrus.c

Ezequiel Garcia (8):
  videobuf2: Introduce vb2_find_buffer()
  mediatek: vcodec: Use vb2_find_buffer
  tegra-vde: Use vb2_find_buffer
  vicodec: Use vb2_find_buffer
  hantro: Use vb2_find_buffer
  rkvdec: Use vb2_find_buffer
  cedrus: Use vb2_find_buffer
  videobuf2: Remove vb2_find_timestamp()

 .../media/common/videobuf2/videobuf2-v4l2.c   | 11 +++--
 .../vcodec/vdec/vdec_h264_req_common.c        |  7 ++-
 .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  7 ++-
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         |  8 ++--
 .../media/platform/nvidia/tegra-vde/h264.c    |  9 ++--
 .../media/test-drivers/vicodec/vicodec-core.c |  8 +---
 drivers/staging/media/hantro/hantro_drv.c     |  6 +--
 .../staging/media/hantro/hantro_g2_vp9_dec.c  | 10 ++---
 drivers/staging/media/rkvdec/rkvdec-h264.c    | 41 ++++++------------
 drivers/staging/media/rkvdec/rkvdec-vp9.c     | 10 ++---
 drivers/staging/media/sunxi/cedrus/cedrus.h   | 24 ++++++-----
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 16 +++----
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 16 +++----
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 28 ++++--------
 .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 43 ++++---------------
 include/media/videobuf2-v4l2.h                | 12 ++----
 16 files changed, 96 insertions(+), 160 deletions(-)

-- 
2.34.3

