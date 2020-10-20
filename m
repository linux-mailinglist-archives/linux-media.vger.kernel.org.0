Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3F929430F
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438212AbgJTTfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:35:34 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9845 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438193AbgJTTfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:35:32 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8f3bf80000>; Tue, 20 Oct 2020 12:35:20 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 19:35:32 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 20 Oct 2020 19:35:31 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 7/9] media: tegra-video: Add support for VIDIOC_LOG_STATUS ioctl
Date:   Tue, 20 Oct 2020 12:36:13 -0700
Message-ID: <1603222575-14427-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603222575-14427-1-git-send-email-skomatineni@nvidia.com>
References: <1603222575-14427-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603222520; bh=SF21BnA36cQvnemUV9ucdhKRKNHO+gD0lDF9mm2flJQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=V32FFOZZQdDwZDMNIJkgsDiX09Wjaa4ZoXk5QrZSDIO/F+EfM6JjdnCFi39QFAiR9
         zcqNrx/12MpnxSNsFn03/FFcLh3QjL3RRfcCjONSzLAoHTsDjWqpuJZDSCRmou/a3t
         emXoNTpMgjEcPX7l1H5ECJ+p9juiR5RG7COO9NyXkIr0WQ9MOWhyuhVMNH8okwQj+F
         r5n/q0xXwN5oi2snOFbqN+qVB/QIIMoSNUj96YBaRq3LA7qOkgZaxZZHfjciQK5u6V
         YJaD+jKbLb6eT+op+cWpI6R4rBbfDR0CzD9fyhXhjMxqESfNCdLgkj3z4Y+IxlfVu3
         jIrCJux6VOESg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for log_status ioctl.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 92f36b1..936e5e5 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -838,6 +838,15 @@ static int tegra_channel_dv_timings_cap(struct file *file, void *fh,
 	return v4l2_subdev_call(subdev, pad, dv_timings_cap, cap);
 }
 
+static int tegra_channel_log_status(struct file *file, void *fh)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+
+	v4l2_device_call_all(chan->video.v4l2_dev, 0, core, log_status);
+
+	return 0;
+}
+
 static int tegra_channel_enum_input(struct file *file, void *fh,
 				    struct v4l2_input *inp)
 {
@@ -904,6 +913,7 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_query_dv_timings	= tegra_channel_query_dv_timings,
 	.vidioc_enum_dv_timings		= tegra_channel_enum_dv_timings,
 	.vidioc_dv_timings_cap		= tegra_channel_dv_timings_cap,
+	.vidioc_log_status		= tegra_channel_log_status,
 };
 
 /*
-- 
2.7.4

