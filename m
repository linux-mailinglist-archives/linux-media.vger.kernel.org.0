Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08562B9D87
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 23:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgKSWTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 17:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgKSWTA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 17:19:00 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460CFC0613CF;
        Thu, 19 Nov 2020 14:18:58 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id f11so10602228lfs.3;
        Thu, 19 Nov 2020 14:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K5HPknZej83oJvWIt/FZVa+q2hWE2AXL1nYvqO+6Ul8=;
        b=WBXbhlhurUHDejeqYNxafU5YMa5j15UCO6/IwEjMjPtYgtX7wj2Z8ZtJZ9o3z7bazl
         4J62BoMdhx5tsu1P344tCJdTpNCjRUck0Ud/o02o77GnXAc21JfgOX4EHOA0LXHgLTsB
         UacQ5DW4SjYZ6r2a5RQGI1N2/npF2XYML5pH8Vhba9+Tns7/RqF6rGD5gcNFnfY6JC+s
         UM1HP1vDDEEEIghucZiCRNH0ay9qtUJjzLBV22m0U+ddMFASAueZ1tcmL4hasx6Y5VCt
         xoqd2GnaKiRFBRIEtMLv7Qs5MHR191VjIxh34y/yI5w1B1xwVGw9J3tkbPHajMpr6htJ
         RiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K5HPknZej83oJvWIt/FZVa+q2hWE2AXL1nYvqO+6Ul8=;
        b=C3DawxYXvzMVMD6SAFwOwA7B7F6312WEiJzaZ8NzXqzX3DtxwCS4kpo3VEZGr36qIp
         /2eryRLsiw+13KJs7i0Z0WMqZ4dzjUED7pZB3DovV1KsOv59dDx3/zY+xw+CIiRCfHVG
         6THsTtWLmfbYY+cTa+yP/9eOFdyRR0bQYP9Aob2WrzNSfJ9kYaW/LhMOpF68HDjVMSV9
         ywZB7uoRZDAoo86gUlRprRKqvuNqfayiYpn3T155rC7cU/90gBuzvXrTeLblVaNM87oO
         u8ylhXQXwDuVyKKwpcbprmGDdIbSw4HdHCr2Cb88KEJvJwDpddTptsxSTYZ5B3ueIDxS
         W2Aw==
X-Gm-Message-State: AOAM532BCpEWYCBw3ujaAETsBczV/013SzgLECsQSr5L1gIfCi5MFAuk
        mV1G0DDcZa3ALXXmfjU9o98=
X-Google-Smtp-Source: ABdhPJzRB5StQv+khcLHMwalJko+2W3xdWplQTXFuqHT08QMj58TQTHkujKlHdhJ3De/mEnxyUCIkg==
X-Received: by 2002:a19:6005:: with SMTP id u5mr6222544lfb.367.1605824336806;
        Thu, 19 Nov 2020 14:18:56 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
        by smtp.gmail.com with ESMTPSA id o189sm113722lff.149.2020.11.19.14.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 14:18:55 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: rockchip: rkisp1: Constify static structs
Date:   Thu, 19 Nov 2020 23:18:49 +0100
Message-Id: <20201119221849.147984-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These 'ops' structs are never modified, so make them const to allow the
compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 6 +++---
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h  | 2 +-
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index b81235afd053..380582f68ace 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -565,7 +565,7 @@ static void rkisp1_sp_set_data_path(struct rkisp1_capture *cap)
 	rkisp1_write(cap->rkisp1, dpcl, RKISP1_CIF_VI_DPCL);
 }
 
-static struct rkisp1_capture_ops rkisp1_capture_ops_mp = {
+static const struct rkisp1_capture_ops rkisp1_capture_ops_mp = {
 	.config = rkisp1_mp_config,
 	.enable = rkisp1_mp_enable,
 	.disable = rkisp1_mp_disable,
@@ -574,7 +574,7 @@ static struct rkisp1_capture_ops rkisp1_capture_ops_mp = {
 	.is_stopped = rkisp1_mp_is_stopped,
 };
 
-static struct rkisp1_capture_ops rkisp1_capture_ops_sp = {
+static const struct rkisp1_capture_ops rkisp1_capture_ops_sp = {
 	.config = rkisp1_sp_config,
 	.enable = rkisp1_sp_enable,
 	.disable = rkisp1_sp_disable,
@@ -1038,7 +1038,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	return ret;
 }
 
-static struct vb2_ops rkisp1_vb2_ops = {
+static const struct vb2_ops rkisp1_vb2_ops = {
 	.queue_setup = rkisp1_vb2_queue_setup,
 	.buf_queue = rkisp1_vb2_buf_queue,
 	.buf_prepare = rkisp1_vb2_buf_prepare,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 3a134e97161c..038c303a8aed 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -214,7 +214,7 @@ struct rkisp1_capture {
 	struct rkisp1_vdev_node vnode;
 	struct rkisp1_device *rkisp1;
 	enum rkisp1_stream_id id;
-	struct rkisp1_capture_ops *ops;
+	const struct rkisp1_capture_ops *ops;
 	const struct rkisp1_capture_config *config;
 	bool is_streaming;
 	bool is_stopping;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 03f9a81df440..6af4d551ffb5 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -1469,7 +1469,7 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 }
 
-static struct vb2_ops rkisp1_params_vb2_ops = {
+static const struct vb2_ops rkisp1_params_vb2_ops = {
 	.queue_setup = rkisp1_params_vb2_queue_setup,
 	.wait_prepare = vb2_ops_wait_prepare,
 	.wait_finish = vb2_ops_wait_finish,
@@ -1479,7 +1479,7 @@ static struct vb2_ops rkisp1_params_vb2_ops = {
 
 };
 
-static struct v4l2_file_operations rkisp1_params_fops = {
+static const struct v4l2_file_operations rkisp1_params_fops = {
 	.mmap = vb2_fop_mmap,
 	.unlocked_ioctl = video_ioctl2,
 	.poll = vb2_fop_poll,
-- 
2.29.2

