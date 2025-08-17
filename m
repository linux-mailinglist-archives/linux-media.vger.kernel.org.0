Return-Path: <linux-media+bounces-40022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADF9B2918D
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 06:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98E787A845C
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 04:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2546A1E1E0B;
	Sun, 17 Aug 2025 04:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XnGLaZI6"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D98625634;
	Sun, 17 Aug 2025 04:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755405660; cv=none; b=oqkVzgI/EAP3EKfXlhjl+1H3JoETVcwGiBYJ2jOs2SJ3Yz6joBl7aFnxd57RifKrF2EuJ0YPHmGWR4u+GWPphKaUsTT584BKLZypuBGENQFzrNSbu0vl4n+hOTT88OOEAM5L+I3VfnBjppETgUwzPLWLBKQIfDkhobQzkFvTEdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755405660; c=relaxed/simple;
	bh=KORNnHM6mSqsQf5e82dqGuQBpFISpmxZHXEwH0orQiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K2KP/vZFwh1WL6dJxkEQrYJt3ZlUZaIoIkOEcouegsbRZVV/q++IXe4ZG1KoUCp3a135InLhNBLz9lDqD0xvjRehAT7kLqQMafWfilES4dvGoZlAmDYWP9IxEMK69K3jsQaZ/jpUxRlVIiS9zx+sTxGjqKFcLY0bJ3r8PA4hqpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XnGLaZI6; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=T+
	UEZTiqXRtws2hRlaLqRpBSLuxDDCMMTDvSDX8gpsA=; b=XnGLaZI6iD+A6OLRJc
	9WRsu2ebfFE2R3z3iM3EIkYZUDBLZA/Og/50SsixxT1Pq8YKgoOleSexm0MIM2Wi
	b/6OHXju6tWJ5ZrgrK7iGHxnFL9eM1nd1Jv70IUINN6UBGYbWpJrB//QS8SV5Y33
	9I8bZyY6yf2fRC1tIyEnMPPsc=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDH+Sc7XaFo6jvZCQ--.58104S2;
	Sun, 17 Aug 2025 12:40:28 +0800 (CST)
From: Qianqiang Liu <qianqiang.liu@163.com>
To: mchehab@kernel.org
Cc: patrick.boettcher@posteo.de,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qianqiang Liu <qianqiang.liu@163.com>
Subject: [PATCH] media: dvb: remove redundant assignment
Date: Sun, 17 Aug 2025 12:40:26 +0800
Message-ID: <20250817044026.135791-1-qianqiang.liu@163.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDH+Sc7XaFo6jvZCQ--.58104S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw1ktr43CF1DGr4kAF1fJFb_yoWDGFbEgw
	s7GrnrZw4rJa1UKr1UJ34Uu3y09rW7ZFWkuFyFya13Ar4ftF1xZw1v9347Cw4UJ3WIv3W3
	GF45WF18Jwn7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRi8uc3UUUUU==
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiYhGsamihVzR4pwAAsA

The field adap->demux.filternum is immediately overwritten with
adap->max_feed_count, so the initial assignment to 0 is redundant
and can be removed.

Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index f1c79f351ec8..96fd42ad7b6f 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -465,7 +465,6 @@ static int dvb_usbv2_adapter_dvb_init(struct dvb_usb_adapter *adap)
 
 	adap->demux.dmx.capabilities = DMX_TS_FILTERING | DMX_SECTION_FILTERING;
 	adap->demux.priv             = adap;
-	adap->demux.filternum        = 0;
 	adap->demux.filternum        = adap->max_feed_count;
 	adap->demux.feednum          = adap->demux.filternum;
 	adap->demux.start_feed       = dvb_usb_start_feed;
-- 
2.47.2


