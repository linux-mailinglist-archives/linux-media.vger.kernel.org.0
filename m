Return-Path: <linux-media+bounces-40381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8FAB2DA1C
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3562D1C46297
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2CC2E285B;
	Wed, 20 Aug 2025 10:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="JkAjfh70"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1916920322;
	Wed, 20 Aug 2025 10:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755685992; cv=pass; b=bYQXJji9Xs2vcEvh8OXHNhR8xhdQnNVwxRF2b+CPLgsP3sSU/MtBK3GPUVTeVdOE3tGLC5hlFMqTktaxws7e2p7JypLpNFQqSsuq8QALiCfstY4eKXcKpdNXa2A6Txdm6sleg2i0rHQxHvVF4y9o2F6m2vBxperWqsezagb26/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755685992; c=relaxed/simple;
	bh=5ZXYNlQDxRW1XjNmzcCuzVo2OKG6231JW8+6jCO9WXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G7mgqdFul1mOQG/z/WQg+OWD8OuP3HJhDCE+vVJjCzxzaInzo5S9LmpI8dH093hUEHl0V8j2B2jeXxnNivyUZOZxvHdSVBizIyBytjr8qIGWzKIdJcnYEuvUxzoSqUnMajgXlt1cdKMNUMY7c8j7LHm7y3mmoNzyglsX3GjdOVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=JkAjfh70; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755685960; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OAvv+zFCpb/jM/M2C29e+J2X1pekKnt31HFBRH1I5gYpSYu0oKkTnDOQgeb+OCtgvry1tn53oSeGUwBU2No3oJH113NyXWP8bBSu1+inlx4Al+1M9HgG1kc8X2uTccqCxomlXe2DguVrboiJrYoAXA/huManVE1nu7TXkWu4jpU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755685960; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=L/DY3w/dkX1JEnee89D1ni0qXzrMnWvJW71C4ROFh5o=; 
	b=TsQgr9Wbhsj/oWpPS6Td2/xjWI122Pq4MgNQr+xN7PRnHvoPlhBAKFXU1aOrA86N0C462qrAPoeN9B7oJbcVCgDLLJelDlrrw0kFM1EhfS62QgpNzfyNEbHruysnQEJOLMmSpxVbUGa6HDCp6weCYr3BzSEISeeeUueaIcKwRrE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755685960;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=L/DY3w/dkX1JEnee89D1ni0qXzrMnWvJW71C4ROFh5o=;
	b=JkAjfh70HrHYkkYUzhqeOdM0OOhRk/E0lFcuJpnw841ib36p1ylUrbCiBVmFSwA0
	mMDpwGw/IOR1D4glHoclGINZylSvTLqeQx16KQY5PReb+iAhjfrjtV6EwhvQCfu8Unv
	A2xxiqnMXji9JLcsGXhsabGf5Ll5sm4lnC0NX73M=
Received: by mx.zohomail.com with SMTPS id 1755685957040941.9859599941752;
	Wed, 20 Aug 2025 03:32:37 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/2] MAINTAINERS: Update Synopsys HDMI RX driver entry
Date: Wed, 20 Aug 2025 13:30:58 +0300
Message-ID: <20250820103059.342850-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Shreeya no longer works at Collabora, set Dmitry as maintainer of
the Synopsys HDMI RX driver.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e913c1edd1fd..e1db3cc859eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24535,7 +24535,7 @@ F:	drivers/net/pcs/pcs-xpcs.h
 F:	include/linux/pcs/pcs-xpcs.h
 
 SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
-M:	Shreeya Patel <shreeya.patel@collabora.com>
+M:	Dmitry Osipenko <dmitry.osipenko@collabora.com>
 L:	linux-media@vger.kernel.org
 L:	kernel@collabora.com
 S:	Maintained
-- 
2.50.1


