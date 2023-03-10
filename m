Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24F4F6B5115
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 20:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjCJTmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Mar 2023 14:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjCJTmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Mar 2023 14:42:15 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1840C136FC2
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 11:42:11 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso4171106wms.5
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 11:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112; t=1678477329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WzhgYRgHRVqqxDzbPa/e+yQ1YbV1LqfQQeGDUw8JTXA=;
        b=Jw4/lz4OMRH4a0fOj5DZRt0mUfulSAPfJuIsLhNYvtETBvmr7FQO6IsAWVw20axWmI
         M7tHTzwj1+Hb+yLQ6QU6d53EdGgJabKbf8YQW19PoheoUyiMDTTHRrFVXlPLndlT/SzF
         VMSCtwfpC0NBjR4Vuso9L2NRxoZNrje1BIFcZVR8YDNrONkB+R19YgQhnK3ia8lbP+iS
         s7iSMTMathBFwlp72SspUUKYl7zyeBLKfrKWlFP7aIRBXKimYnD46Frc/L6UrESYTflF
         gzV72Dm83HxUVhQDFQoaDXQpKxeQtLHcl7ro7ciSjfv2onlQNPj/6i8BzXwy8Jt/Ckcx
         p1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678477329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzhgYRgHRVqqxDzbPa/e+yQ1YbV1LqfQQeGDUw8JTXA=;
        b=GSMenXuDaHb92Xk6df44dpxbjJKmnbLV5fYZY1kQhE7l37Xijkrtl0LhWUHBNJm2WV
         kb3YYYZnB9UYEu6O8pUu8owwWEuzZoP6JS7QXs18Le/o9ytDcl5L5osX+FiFw6WlCEGd
         anxvw64m1IUYkboMPLm/oo16ekD9uFpw3RwfjntpJSqxuHR28VIXk5d7lHSx2KlhnlK4
         ZGD4SmLwpYZ0jhWfIkf7SBoiL/j/ywjJ/mpY4WYPcBUsFO3MclAykiuPJIEXMj+tkzPQ
         Y2fDxQqLnKMlab84aEcYv223cFMUQIOLz0oJxAXlI6sDoBODzIVJogjA4rdbCo+Jhih8
         /bkA==
X-Gm-Message-State: AO0yUKVQ/7W/c+ELwvTrTcXs4NbVexc5dSW2CqD12xVdt5uIqNjwkAPd
        z0jYSdOO39Gg5e25CeBleuxYzQu7giSvSeqe9mg=
X-Google-Smtp-Source: AK7set8J4xxO9Q5AB+N+fJNdXYt1vKDaz3Tz93+CYPOdDD41LasbCkMOaBP3/OuPl1ig6cu7vpnuJg==
X-Received: by 2002:a05:600c:282:b0:3e7:b17f:9af1 with SMTP id 2-20020a05600c028200b003e7b17f9af1mr3929468wmk.22.1678477329609;
        Fri, 10 Mar 2023 11:42:09 -0800 (PST)
Received: from sucnaath.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id n4-20020adffe04000000b002c54c92e125sm585400wrr.46.2023.03.10.11.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:42:09 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        hverkuil-cisco@xs4all.nl
Cc:     John Cox <jc@kynesim.co.uk>
Subject: [PATCH v2 0/5] media: v4l: Add Broadcom sand format to the list of V4L formats
Date:   Fri, 10 Mar 2023 19:41:16 +0000
Message-Id: <20230310194121.61928-1-jc@kynesim.co.uk>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is in preparation for attempting to upstream the Rpi H265 decoder
as these formats are the only ones the hardware can decode to. They are
a column format rather than a tile format but I've added them to the
list of tiled formats as that seems the closest match.

V4L2_PIX_FMT_NV12_C128 matches DRM format NV12 with modifier
DRM_FORMAT_MOD_BROADCOM_SAND128_COL_HEIGHT(ch) and
V4L2_PIX_FMT_P030_C128 matches DRM format P030 with the same modifier.

version 2:
- Add franctional bpp support from the "AV1 stateless decoder for
  RK3588" patch set.
- Add description to v4l2-ioctl.c
- Add format info to v4l2-common.c
- Rework documentation in line with comments

John Cox (4):
  media: v4l: Add Broadcom sand formats to videodev2.h
  media: v4l: Add documentation for Broadcom sand formats
  media: v4l: Add Broadcom sand format descriptions to v4l2-ioctl.c
  media: v4l: Add Broadcom sand format infos to v4l2-common.c

Nicolas Dufresne (1):
  v4l2-common: Add support for fractional bpp

 .../media/v4l/pixfmt-yuv-planar.rst           | 195 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c         | 150 +++++++-------
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 include/media/v4l2-common.h                   |   2 +
 include/uapi/linux/videodev2.h                |   2 +
 5 files changed, 277 insertions(+), 74 deletions(-)

-- 
2.37.2

