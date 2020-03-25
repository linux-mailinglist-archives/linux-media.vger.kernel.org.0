Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C270192F6C
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 18:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbgCYRfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 13:35:05 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39043 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgCYRfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 13:35:05 -0400
Received: by mail-ot1-f67.google.com with SMTP id x11so2832203otp.6
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SNBvqruIJbsSWKYqMDqatKlNO0h6Vc5uC5fqznY6rW4=;
        b=VBfoNJbEEb5ILO/sU6WuuevrS3mAgcEu9XagkD8w/Wf4tckW0C7YodI0AoNZZ/TE6v
         xWXp02EQbsvF/igGHFij85c0f23suX7dWLpm9hyt5fQMlduIr7XGDt2ufT4A1P6kFkN5
         uCimkloxaLDv8CCUu1X0G32SP7IVULSyP6xBm1Q6KCXQRbfgLFCKIGaYQCc3qA7e6ie8
         qWUdw7S/CkSM0T0qfMm2fydzXcZSIJzF5c0JAjlFgjmZgBAqGA54ivatrO9M6+uTMEt7
         X0ytr3kh8n/rlvPvS/aTnKNAWJRxi+dtVTEIUchi0RWEIx7Uh/qHShPyvK5g19UcxYDa
         u9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SNBvqruIJbsSWKYqMDqatKlNO0h6Vc5uC5fqznY6rW4=;
        b=QF5tpTUWawGK9GF7A4CakgXfoCYMg0d20SlPmIvxPmnbHad4VFewTV9Q7+H6M3LwOf
         2J18YFKjCrNJhoYY1ROlQQUFQp0xUQJjY6eEkGKSjiSJX31o+7vYPXxaSmhTw/ek78/m
         /3Lfw3gyzqdP8lxd4mwetakX6q+YgtV0wk6KJLlrBZdJR/awcjXgAlToQgrAvPfA51CY
         GZsdDntY7fZWEc9WY7Dr6x/2qcGK0/45/pyRQ7VE/XSc/pg+jaWrHF6TWgtwmAUE/pXe
         +F0Xd0KVQsG/m6tgt9F7m424wGuJxUSWfI+4qeIrXV0nNsWDhqZ9ZWWtksV46E0oajvX
         KqzQ==
X-Gm-Message-State: ANhLgQ2yfW1Zk5NmbCysXXu3a4d05o0OqRTUMtGUwfkaI1YAVr+uieDl
        0hNoHTODv+dWY9DHkaJfPaO1GaGSZwM=
X-Google-Smtp-Source: ADFU+vtnJ5FE9bRGOXr0M94eMhHgQPAHVKPPWcvx7UHQ98Y5bzGO/N9e7TKgutil1OlIgid55h9Yiw==
X-Received: by 2002:a05:6830:3150:: with SMTP id c16mr3109185ots.251.1585157702867;
        Wed, 25 Mar 2020 10:35:02 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (104-10-251-90.lightspeed.sntcca.sbcglobal.net. [104.10.251.90])
        by smtp.gmail.com with ESMTPSA id q196sm656504ooq.19.2020.03.25.10.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 10:35:02 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH] media: imx: utils: Default colorspace to SRGB
Date:   Wed, 25 Mar 2020 10:34:56 -0700
Message-Id: <20200325173456.21455-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function init_mbus_colorimetry() is used to initialize the imx
subdevice mbus colorimetry to some sane defaults when the subdevice is
registered. Currently it guesses at a colorspace based on the passed
mbus pixel format. If the format is RGB, it chooses colorspace
V4L2_COLORSPACE_SRGB, and if the format is YUV, it chooses
V4L2_COLORSPACE_SMPTE170M.

While that might be a good guess, it's not necessarily true that a RGB
pixel format encoding uses a SRGB colorspace, or that a YUV encoding
uses a SMPTE170M colorspace. Instead of making this dubious guess,
just default the colorspace to SRGB.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index fae981698c49..8344675bfd05 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -236,8 +236,7 @@ static const struct imx_media_pixfmt ipu_rgb_formats[] = {
 static void init_mbus_colorimetry(struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *fmt)
 {
-	mbus->colorspace = (fmt->cs == IPUV3_COLORSPACE_RGB) ?
-		V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
+	mbus->colorspace = V4L2_COLORSPACE_SRGB;
 	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
 	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
 	mbus->quantization =
-- 
2.17.1

