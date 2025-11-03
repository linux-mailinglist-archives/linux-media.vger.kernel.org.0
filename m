Return-Path: <linux-media+bounces-46188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A01DBC2AD11
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 10:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17A4E1892400
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 09:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8E72F3C13;
	Mon,  3 Nov 2025 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbTfCnkG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F532F068E
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162967; cv=none; b=Odvx+NTCirRMKsIbyFd4W2W3TghnntfFXPj9EHEoHHdPW2mLMyrDWemsKWQ1DHeyEvtbQl7Y4sOAjC7AD6ON7ctNAB4LvKPBQoHCOjQDKI2LpzaXhMjyasx+pImeS1Oi5yOeKsdwAhUE+aLIfJCu17LzwzKfIi7X3N/YaRiAreM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162967; c=relaxed/simple;
	bh=nd2R11liXrMtT7JTcY/VFsASxIZo0gvVgNFJJG/mfmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tP07E+RzBTlzDiflv/raOQNfmGlffFnahqDQEEmVrsP22v9P6ZPE70VxvfYwr2gH7B0LPLU+lCN2yvKXKnGMQK/6uZGAw0fceUWrY6PC6+gyTGPvekPSD12eWukhtI1DoFylBrthuSCwuy9IlTnjg+yA9NdvThJwsg1OvniM/SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbTfCnkG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986EBC4CEFD;
	Mon,  3 Nov 2025 09:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762162967;
	bh=nd2R11liXrMtT7JTcY/VFsASxIZo0gvVgNFJJG/mfmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MbTfCnkGFytd/oM69W6HlEQ7R/EYaCNIXgkjZ59qafGkL5a5VCVzSz8kkcLZmqZvJ
	 2fS1EZ/FZUef+Opx6hJRqcr6IfdzN48z55FadZrFd9M6A0ow3jHuf+cKtqoc97+NSj
	 gGpn1uoYnj3pHmgQKzUo0WNPgtEp4iG0g5qCrUfL3bg/I/r3r5zcgQa/vVyIOPUqyF
	 oivYyh0XhdlAnRycoID1P0v/gqn45EM21bP2/Z/g1ItDyKvZNrg0TA7LB30qV4kGPe
	 7o6JCt/vhVcq/PY+by87Z4mk1NyxDL2j0BUlKqF+S8U8pvaKApaq6d5ZCp11evTIai
	 SjH5ctvfRvEyA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: ipu-bridge: Add OV05C10 to the list of supported sensors
Date: Mon,  3 Nov 2025 10:42:42 +0100
Message-ID: <20251103094242.141001-2-hansg@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103094242.141001-1-hansg@kernel.org>
References: <20251103094242.141001-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Yao <hao.yao@intel.com>

Add the OV05C10 sensor to the list of supported sensors.

Signed-off-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 62f55a70f42c..58ea01d40c0d 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -80,6 +80,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI02C1", 1, 400000000),
 	/* Omnivision OV02E10 */
 	IPU_SENSOR_CONFIG("OVTI02E1", 1, 360000000),
+	/* Omnivision ov05c10 */
+	IPU_SENSOR_CONFIG("OVTI05C1", 1, 480000000),
 	/* Omnivision OV08A10 */
 	IPU_SENSOR_CONFIG("OVTI08A1", 1, 500000000),
 	/* Omnivision OV08x40 */
-- 
2.51.1


