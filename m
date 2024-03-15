Return-Path: <linux-media+bounces-7107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2EA87CA40
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 09:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF63A1F22041
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 08:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC02D17591;
	Fri, 15 Mar 2024 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TY7EgijU"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7641758D
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710492746; cv=none; b=rgE/tbbGOVANrfEa50Yhw10LtycsoA6Sk8/RbbZxJkdmgoMcR8Xl0gxX9zYMNGkBAXxCyL83ZZwA/St4FxVw89JPtG8dHcuXNLst+g7tewIYTU9SwSh7Rr0NLnxH+YFnEQ0TlvNlbozONWxkO+WKGesE56mVKrqSlyv2/Xc//ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710492746; c=relaxed/simple;
	bh=pPbXGkl5iVmKWfwtTv54Li+Hgjllt07euKGrF2krQHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T73US7UrcKJzaXDETpFha4Juq1Pile995fHbuTavFw7Hcrpi0aUBWR++QmZAMBAh+DFxZlGQ0fukiK6zaTZvoFz3gzk1oWyX6fP3mgBnSjQkP4CmaSf8bEnsbBz1Sw/H1hYisBnyG1I0W994ODzcDmzUtWo98pg2HHysYf7k308=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TY7EgijU; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710492742;
	bh=pPbXGkl5iVmKWfwtTv54Li+Hgjllt07euKGrF2krQHI=;
	h=From:To:Cc:Subject:Date:From;
	b=TY7EgijU4lso5QpvByvJki6tNxsszAN8CErDDVKx5+zzoxM83EYStvKNNyIffX8ZI
	 WfySqGXG7rnHFrbFmhqF73oljrCy4cvAJMp4pUobkxZ/3Tt9ocY9oSzbJWUV8nIpT4
	 pYNPj2d8Wzi5vKwMjP95dXOXr/iI1sWWhNAeFnSO4jkF9/hp/MUigzmX2kKysf6wns
	 XEhVrsbb7Gbav7V982vYEKltUQMAwwZ60YRGj/OMUMfP+/PDorIZ5AzfwLHN7J8Zz1
	 l6qY5jc0dy58nwfJy3i+llk0L4q/uYp9Dd2DKA1jzeqeeFJTa6KC395EQ7NWmCWCaM
	 Al0aqaLe5FTTg==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7022D37820F5;
	Fri, 15 Mar 2024 08:52:22 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/4] media: i2c: st-vgxy61 Add support for embedded metadata
Date: Fri, 15 Mar 2024 09:51:54 +0100
Message-ID: <20240315085158.1213159-1-julien.massot@collabora.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ST-VGXY61 sensors are transmitting Intelligent Status Line (ISL).
The ISL contains some values of the user interface registers.
ISL data are transmitted as RAW8 data packing and follow the
SMIA CSI-2, simplified, 2-byte, tagged data with MIPI_CSI2_DT_EMBEDDED_8B
datatype.
According to the documentation, the firmware preconfigures two status lines
of 256 bytes sent every frame, hence the format 256x2.

ISL data can be disabled in SW_STDBY state, so the set_routing callback is
added to disable the ISL data transmission.


This patchset depends on the "Generic line based metadata support, internal pads"
v8 patchset version.

Julien Massot (4):
  media: i2c: st-vgxy61: Use sub-device active state
  media: i2c: st-vgxy61: Add support for embedded data
  media: i2c: st-vgxy61: Switch to {enable,disable}_streams
  media: i2c: st-vgxy61: Implement set_routing callback

 drivers/media/i2c/st-vgxy61.c | 345 +++++++++++++++++++++++++---------
 1 file changed, 260 insertions(+), 85 deletions(-)

-- 
2.44.0


