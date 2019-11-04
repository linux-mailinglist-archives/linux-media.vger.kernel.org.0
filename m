Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B96C7EE897
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729623AbfKDTb6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:31:58 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:42510 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729617AbfKDTb5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:31:57 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVudt105009;
        Mon, 4 Nov 2019 13:31:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572895916;
        bh=ydp8KB6lTbvhWYa9e1PFXRsP1A9D/SDmXslW2TAcj50=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=M0w9VI4EAep0essPXzV+IKOVRYoJHAtYUFoKAxrhiPH8Vy/DGOZamvApS7D/f5KOX
         IqpiEyuXmYM0oxT3Vrb+Ckql5dBXDABx3kX5lqVjaydLoxXSKRVI8c/Af7DXmddNAa
         tm1TdtEPX4AvD70LscSNLbLWlTXyWMStY1B9IP4A=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA4JVusV126263
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 Nov 2019 13:31:56 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 13:31:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 13:31:41 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVmd3096934;
        Mon, 4 Nov 2019 13:31:55 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>, Jyri Sarha <jsarha@ti.com>
Subject: [Patch v2 04/20] media: ti-vpe: cal: Enable DMABUF export
Date:   Mon, 4 Nov 2019 13:31:24 -0600
Message-ID: <20191104193140.31145-5-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104193140.31145-1-bparrot@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow CAL to be able to export DMA buffer.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 5d807b8f0f23..7d25ad83ca1e 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1488,6 +1488,7 @@ static const struct v4l2_ioctl_ops cal_ioctl_ops = {
 	.vidioc_querybuf      = vb2_ioctl_querybuf,
 	.vidioc_qbuf          = vb2_ioctl_qbuf,
 	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
+	.vidioc_expbuf        = vb2_ioctl_expbuf,
 	.vidioc_enum_input    = cal_enum_input,
 	.vidioc_g_input       = cal_g_input,
 	.vidioc_s_input       = cal_s_input,
-- 
2.17.1

