Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403E736EB59
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 15:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237130AbhD2N3d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 09:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbhD2N3c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 09:29:32 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5F4C06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 06:28:46 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id h15so14707586wre.11
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 06:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8qAnJhu426Yk0q3ANLKCzgV8SiusL56tznRnb2ny3w=;
        b=rtmoKzoOI+lN0atSJDZwVj+MfAztl04Bcm2Q/thGxeg9yPoVDj8tV8wk5/I3ZiemaM
         C8VyrCgYYucTJmZZ1zIxyyqX8HaTa4DhbIwnvcSP70WCTNQMJNDjz5no1fMRcjYElhcZ
         4oeeG4E5Dlm7Kkp1L161CNLi1h6np0mXo0EPzzgW63851LCN3rZ1KJDCAksC/1t3yQiU
         ZhwtNMm/FwYPgOm+F9UhhuF9bVBdSahhXArIqUUaldd6rBLuW0hPdKp4wAfWobyYH84Y
         ++xC+bj0X8f96GCzt182b5+s69RXHauRGfUnkFl8uNrSZCkksBZeKZ2UFzyTFRd5IIcF
         RAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8qAnJhu426Yk0q3ANLKCzgV8SiusL56tznRnb2ny3w=;
        b=iXd/gwDpswWnHa+y17nVzl7lsAGok6OtDZhMliGjNNSAwtTK2TvwZqM/JOy+wqexPA
         8lajmp6se1J1AeotX9maOJKRyhyFfFFgKXY1PpfKLQtpz+NfvGIk9821UVRJjLDiS+UF
         nJqbcdTEm1g8YydAI12kTWbKvgCLQt2Hue/U05Eato6AgIKcCLSzlQRcksqaEYV6XIU7
         KFBI4DNveoKWBBgmbI5IH6SZJD+uAnz70pWZr1EjBogqHDM5ZyGFgm6cnqtfLcIvLG1v
         WQCNgVXdhwDlGozbKJ/SWpAUncRjtifpvWckYyN01KT+GgGZJ7SjGDdJuvDY3baqDgOg
         90XA==
X-Gm-Message-State: AOAM531rvkEo8RO2psIC9XB46ZTRKnbJDaaDWJVFlIKtELICQvMnYpj6
        fBkrhOJ3kskSWcx0f6Up0zsR28Z9RXNhyRE0
X-Google-Smtp-Source: ABdhPJyb8fmOqVDcDfoAnfOf1N48eGPB8bBJsR3ng3DxPt0V1t/P8S4pJE8VNilkSKwJ0ENKPcyT9w==
X-Received: by 2002:a5d:6181:: with SMTP id j1mr30633672wru.16.1619702924603;
        Thu, 29 Apr 2021 06:28:44 -0700 (PDT)
Received: from localhost.localdomain (hst-221-38.medicom.bg. [84.238.221.38])
        by smtp.gmail.com with ESMTPSA id n10sm4811462wrw.37.2021.04.29.06.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 06:28:44 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC/WIP 0/4] HEIC image encoder
Date:   Thu, 29 Apr 2021 16:28:29 +0300
Message-Id: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

HEIC (High-Efficiency Image Container) is a variant of HEIF (High
Efficiency Image File Format) where HEVC/h265 codec is used to encode
images.  For more info see [1].

In this RFC we propose a new compressed pixel format V4L2_PIX_FMT_HEIC.
The name is debatable and could be changed (V4L2_PIX_FMT_HEVC_HEIF is
also an option).

There are two encoding modes which should be selectable by clients:
    1. Regular image encoding
    2. Grid image encoding

1. Regular image encoding

Propose to reuse stateful video encoder spec [2].

- queuing one OUTPUT buffer will produce one CAPTURE buffer.  The
client could trigger Drain sequence at any point of time.

2. Grid image encoding

Propose to reuse stateful video encoder spec [2].

- queuing one OUTPUT buffer will produce a number of grids CAPTURE
buffers.  The client could trigger Drain sequence at any point of time.

This image encoding mode is used when the input image resolution is
bigger then the hardware can support and/or for compatibility reasons
(for exmaple, the HEIC decoding hardware is not capable to decode higher
than VGA resolutions).

In this mode the input image is divided on square blocks (we call them grids)
and every block is encoded separately (the Venus driver presently supports 
grid size of 512x512 but that could be changed in the future).

To set the grid size we use a new v4l2 control.

The side effect of this mode is that the client have to set the v4l2
control and thus enable grid encoding before setting the formats on
CAPTURE and OUTPUT queues, because the grid size reflects on the
selected resolutions. Also the horizontal and vertical strides will
also be affected because thеy have to be aligned to the grid size
in order to satisfy DMA alignment restrictions.

Using of v4l2 control to set up Grid mode and Grid size above looks
inpractical and somehow breaks the v4l2 and v4l2 control rules, so
I'd give one more option. 

Encoding the Grid mode/size in the new proposed HEIC pixel format:

   V4L2_PIX_FMT_HEIC - Regular HEIC image encoding
   V4L2_PIX_FMT_HEIC_GRID_512x512 - Grid HEIC image encoding, grid size of 512x512 
   and so on ...

Comments and suggestions are welcome!

regards,
Stan

[1] https://en.wikipedia.org/wiki/High_Efficiency_Image_File_Format
[2] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-encoder.html


Stanimir Varbanov (4):
  media: Add HEIC compressed pixel format
  v4l2-ctrls: Add HEIC grid size control
  venus: helpers: Add a new helper for buffer processing
  venus: Add HEIC image encoder

 .../media/v4l/pixfmt-compressed.rst           |   12 +
 drivers/media/platform/qcom/venus/Makefile    |    2 +
 drivers/media/platform/qcom/venus/core.h      |   10 +
 drivers/media/platform/qcom/venus/helpers.c   |   20 +
 drivers/media/platform/qcom/venus/helpers.h   |    1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  |   10 +-
 .../media/platform/qcom/venus/hfi_helper.h    |    5 +
 drivers/media/platform/qcom/venus/ienc.c      | 1348 +++++++++++++++++
 drivers/media/platform/qcom/venus/ienc.h      |   14 +
 .../media/platform/qcom/venus/ienc_ctrls.c    |   83 +
 drivers/media/v4l2-core/v4l2-ctrls.c          |    3 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/v4l2-controls.h            |    1 +
 include/uapi/linux/videodev2.h                |    1 +
 14 files changed, 1510 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/qcom/venus/ienc.c
 create mode 100644 drivers/media/platform/qcom/venus/ienc.h
 create mode 100644 drivers/media/platform/qcom/venus/ienc_ctrls.c

-- 
2.25.1
