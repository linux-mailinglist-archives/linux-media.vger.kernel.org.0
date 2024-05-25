Return-Path: <linux-media+bounces-11872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89B8CF0A2
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 19:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 536CA1F22BF0
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 17:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3E4128393;
	Sat, 25 May 2024 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="iWxvDqR+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0662127B53;
	Sat, 25 May 2024 17:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659573; cv=none; b=bQFgZM336OR0C0l4X8XxQt1mXnaV3oUDByFacX0eY9Tp3IRKGOohGwOepnsPXlVJ8KNfM6GkeAqItqjSPAhTu25CNB8gw85Q9MvCUXdRw67JIGcw9xAOiFoF7xDmhxoIZsUtpra3UXdOCI9A9tOfccOGyW/OgaqXP5CHQ8KrbtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659573; c=relaxed/simple;
	bh=n2gSzLJAVR/Dw4PlUaVFh/cZe8nDCg+VsxMJYZV6wiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pVH0jTrsfXD9OEqtaX2HO+aaLnhbU5VbXCkirB1+6Gx6jzBKY1jwL3dL47GW7ZVM3rnmVvERjuakNtH+cxAv3mcvIzwQ+V7OTZWYjzyHNO7KjmTZ5o2KUzIhgvyWeXn+e+or8byhL85I82DkgG+1p83UNi2pxa4RxFVw8nAM+KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=iWxvDqR+; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=FogEAuJxLZKuSvi+ipJi2aarhPLy54vfOso/MWiUiSk=; b=iWxvDqR+b/AHa8kf
	egJ75QCJZ0MzNISv7HIROJBY5H5HiMVIZEyPOGE+jahgqVaKxUWI2qM5s7GSDypZXWLlTBBBKvI4j
	xBtORmaArTGUW+gXMlrIDZRzczpQslxjlNStJWsXQMj6mry0sTHa3MBTCrYptj4wqIQcQ39aYsY8c
	nQrY4AvINGdBoAHEC1enMbbr0lazXH74qByl4UbYo3EZiCZ6HSr8Ho3u2bjowAfFWh1Q7hWO3VORe
	7cM3pTHLyZzIZZWypM/xD59flZf6gHibdfNV6MNNBZ7OzT9JV7Garezs5AldShg0PC+hO4hAVYz5I
	p5QvXDQcHMSqfmagSw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAvZJ-002Wcl-17;
	Sat, 25 May 2024 17:52:33 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	charles-antoine.couret@nexvision.fr,
	isely@pobox.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] media dead struct removal
Date: Sat, 25 May 2024 18:52:26 +0100
Message-ID: <20240525175229.100559-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Dead struct removal in spi and usb.

(These are the last of my struct removal in media as
far as I know).

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Dave

Dr. David Alan Gilbert (3):
  media: gs1662: remove unused struct 'gs_reg_fmt_custom'
  media: opera1: remove unused struct 'rc_map_opera_table'
  media: pvrusb2: remove unused struct 'debugifc_mask_item'

 drivers/media/spi/gs1662.c                   | 8 --------
 drivers/media/usb/dvb-usb/opera1.c           | 4 ----
 drivers/media/usb/pvrusb2/pvrusb2-debugifc.c | 5 -----
 3 files changed, 17 deletions(-)

-- 
2.45.1


