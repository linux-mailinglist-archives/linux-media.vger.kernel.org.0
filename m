Return-Path: <linux-media+bounces-13084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D30F905B01
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E57E2852CF
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 18:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1CA80049;
	Wed, 12 Jun 2024 18:31:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF6257C8A;
	Wed, 12 Jun 2024 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217094; cv=none; b=hOOzmAK2PcG5O6cdsqg2X/6BE7j/QBsnwuBUDSDVj3Qsm1HzEejU9w4Hb04BL2iuZ5Nqm4ai9TcPsHKx5DimnxCH/uEC0IESZ6rjrIGVU7hfLv88lUL9EaVVg6AiM4hnyuChpojF/dyLNFi0QcbKogzfJGpPmD7efwDj5VGiFlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217094; c=relaxed/simple;
	bh=ESjmU9gJ2L1QxdyTF1ckdrrFop0h+nJAejCPZh5QRfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ixbUW1qv+mDrPNb6abNkutnJ0kuL7NrKMcmdCpWsDz0WIs6/LfHkU884UDBoCKFQzoSA6Em2XcmqD9CyjRwf6BVWWwkeIK1JKKsj80BbCq1fZf0pEkDZHwTFvaUBGRyavqDtQEt2yD9pLiwX8nHoh1F93meCk1zTbpGZXXZsbqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (c3e47615.dsl.pool.telekom.hu [::ffff:195.228.118.21])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000070666.000000006669E982.0016B24C; Wed, 12 Jun 2024 20:31:29 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 2/2] media: v4l2: map UVC_CT_ROLL_ABSOLUTE_CONTROL
Date: Wed, 12 Jun 2024 20:31:14 +0200
Message-ID: <163b1aee53fa78fe1a8d0b8bb7b0f7be1f1975c9.1718216718.git.soyer@irl.hu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718216718.git.soyer@irl.hu>
References: <cover.1718216718.git.soyer@irl.hu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0

Some new UVC cameras can report whether they are mounted in 'portrait
mode'.

Current roll degrees (-90, 0, 90, 180) are reported with
UVC_CT_ROLL_ABSOLUTE_CONTROL.

Map UVC_CT_ROLL_ABSOLUTE_CONTROL to V4L2_CID_ROLL_ABSOLUTE to
make it available to userspace.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 4b685f883e4d..bc3272b6ceb1 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -748,6 +748,15 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.v4l2_type	= V4L2_CTRL_TYPE_BOOLEAN,
 		.data_type	= UVC_CTRL_DATA_TYPE_BOOLEAN,
 	},
+	{
+		.id		= V4L2_CID_ROLL_ABSOLUTE,
+		.entity		= UVC_GUID_UVC_CAMERA,
+		.selector	= UVC_CT_ROLL_ABSOLUTE_CONTROL,
+		.size		= 16,
+		.offset		= 0,
+		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
+		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
+	},
 };
 
 const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limited = {
-- 
2.45.2


