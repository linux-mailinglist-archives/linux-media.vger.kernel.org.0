Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63CEA4498F6
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 17:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239411AbhKHQFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 11:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbhKHQFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 11:05:34 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFC8C061570
        for <linux-media@vger.kernel.org>; Mon,  8 Nov 2021 08:02:49 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id d24so27784114wra.0
        for <linux-media@vger.kernel.org>; Mon, 08 Nov 2021 08:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8vAP0/smT10scjNRgPBTGipkba7IQbJFUmVsZltLLbM=;
        b=NlJ0dzrhwsI+PIHtV8DNA9if9rCTIRo07+Kp12SmuZF9yrnHvT9kwDNOrTUlO42f+S
         On/UlC6AYqt5WUYBBOwD3XIeFde3M4UMZvqtevR9gatyeFykuCItvt4HyhGEqPxSfjCg
         cqWPidWFTjZ2jbMSvjZHeS5mvemYY/FhHTNZWvUtrO2mCacgfh/HRaoF4S8g1L3O9q3E
         orZVKESdLKXvin0pEQ9DytuTgsIaaRylfUz0hlULEUIUC9bE/BybeGUS08E7Oespk+WZ
         JP5kPtWFkdiwfHdt9nJxgA67NZabDgVlAFkr1ZNE5i8C7WlIOBRIXRG5kcbxcwDdpu2i
         YXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8vAP0/smT10scjNRgPBTGipkba7IQbJFUmVsZltLLbM=;
        b=A5dHqJmD3GAsRolgKEiLJ13hFrUP3UhlN/A8DnBktpdaIoypiLxTPuyXlYu9st7b+o
         s1IU3HypbaJ4ISbnBZm1Fc2pTt02kTVNAXPnSmwWmAi3ie8bOrQiTQfpenbSRro7FI49
         q/R6p3XxiF+mNOMn6OI8sQ4WBUa8NDj3dQtLw92IfiqONvJCBRfW21UCEGPqTADPbMrI
         JTMvMcLgQwbrvs/Ttn45vpJaPRtBBDi2d5wupo12pQK96ZD8HAbh6FyNe9rdvKqKokcM
         +clc7+Aeu28a0rwxQfJw0BsDCChOy1b6RWyDp5vDUlvxbDAbsYeMq4TlXmL9ii8TYRaH
         Ap9w==
X-Gm-Message-State: AOAM532i5upFvQFn+9+zWjpLW7smFMi9r1v92o94P6vxUiPjvq2qE+Ra
        vfBY8w6+pRblhwBknZungbKZCUGZW+A2hA==
X-Google-Smtp-Source: ABdhPJxKzkpGXl2/zwCLSevFelF00cNosG3fmT9AeS80//iffmC+gEFqc3A4Rkl8LK/WccvlwedDwg==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr189788wrd.369.1636387368467;
        Mon, 08 Nov 2021 08:02:48 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id d16sm12703176wmb.37.2021.11.08.08.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:02:48 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/4] media: videobuf2: Add a transfer error event
Date:   Mon,  8 Nov 2021 17:02:16 +0100
Message-Id: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series adds a new V4L2 event, V4L2_EVENT_XFER_ERROR. This new event 
is intended to be used when a device in the capturing pipeline 
encounters an unrecoverable error and needs to inform the capturing 
application thru the video node about the error.

The fist use-case for this is also demonstrated in this series by the 
R-Car CSI-2 receiver that generates the new event when it detects an 
error on the bus.

Patch 1/4 is a bug fix for the R-Car VIN driver that was found while 
working on this series. This patch is good to be picked-up on it's own 
but is a requirement for later patches in this series so I have opted to 
include it here as the first patch. 

Patch 2/4 adds the new V4L2 event. While patch 3/4 and 4/4 makes use of 
it in the R-Car capture pipeline. Careful readers will note that the 
last to patches already have a patch history. This is because they have 
been part of an earlier attempt a while back to solve this issue in a 
different way, and during those discussions the need for this new event 
was found.

Niklas Söderlund (4):
  media: rcar-vin: Free buffers with error if hardware stop fails
  media: videobuf2: Add a transfer error event
  rcar-vin: Stop stream when subdevice signal transfer error
  rcar-csi2: Do not try to recover after transfer error

 .../userspace-api/media/v4l/vidioc-dqevent.rst  |  5 +++++
 .../media/videodev2.h.rst.exceptions            |  1 +
 drivers/media/platform/rcar-vin/rcar-csi2.c     | 17 +++++++++--------
 drivers/media/platform/rcar-vin/rcar-dma.c      | 10 ++++++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c     | 17 ++++++++++++++++-
 include/uapi/linux/videodev2.h                  |  1 +
 6 files changed, 42 insertions(+), 9 deletions(-)

-- 
2.33.1

