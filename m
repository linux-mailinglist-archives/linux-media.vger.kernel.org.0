Return-Path: <linux-media+bounces-19704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890099F8FE
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 23:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAB371C21B9A
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 21:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388FF1FC7D0;
	Tue, 15 Oct 2024 21:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vm5jjmxQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0B01F80BC;
	Tue, 15 Oct 2024 21:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027225; cv=none; b=kEAO57KINv+GP/1oR6CqPLAOuKrqMpq/riJ1E59F9OeUSdFghx2P1r5XklEDOR+gnSakqWDc2FRCSYD3QBHLLPCywInmppVuQpnNgqjGfr9dSrC8Z5ODcOYfwzJY2eJFCvrtg1Lt6MrAep5cjnPnSQYQJsbyQKn2KpyWH03fz3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027225; c=relaxed/simple;
	bh=eqxuOksx4KeZdBeDotgtJkYmKVXv8UqH/qarvTInZME=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fDcX4R+6qG0Io4qcrhwzNZ8brvNOTMIzy/IwBoEKCQ5NvlMrelbQHg+7Pfyn18tPJR5N7JawvMppGTJBN5xAmtMkV/XmJEe6ctgxGmUlJ4e3hoDnpL4CzXiIJ1x4FxuAd4aPSN7/M3mkxAAcCY8pqUlxXZruDth0VDrK7t6U+yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vm5jjmxQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47206A8F;
	Tue, 15 Oct 2024 23:18:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729027114;
	bh=eqxuOksx4KeZdBeDotgtJkYmKVXv8UqH/qarvTInZME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vm5jjmxQS3Pt6xWXVgDUWh28SEgR6f1y+6qZsNIxNOlBcEzIMag1DFrqRLgNy7m36
	 GPnWhJVrjGTSpDh589ff1WPqjRQbJr9qUri8N2W2BrEizjiyeMwhShs9+Jeuu1RTV6
	 9IlVtUo8CDCuQ6e97wqsLRAyZannlo6sK4sE9E3c=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: anders.ruke@gmail.com,
	sakari.ailus@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 3/3] media: ipu-bridge: Add _HID for OV5670
Date: Tue, 15 Oct 2024 22:19:58 +0100
Message-Id: <20241015211958.1465909-4-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015211958.1465909-1-dan.scally@ideasonboard.com>
References: <20241015211958.1465909-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OV5670 is found on Dell 7212 tablets paired with an IPU3 ISP
and needs to be connected by the ipu-bridge. Add it to the list
of supported devices.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index a0e9a71580b5..4e921c751629 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -59,6 +59,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV5670 */
+	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
 	IPU_SENSOR_CONFIG("INT347A", 1, 360000000),
 	/* Omnivision OV7251 */
-- 
2.34.1


