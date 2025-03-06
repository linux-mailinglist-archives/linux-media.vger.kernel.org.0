Return-Path: <linux-media+bounces-27679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7442EA5442E
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E4297A1E31
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91B51FC0E3;
	Thu,  6 Mar 2025 08:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="XXeYrDPn"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F711DC9B1;
	Thu,  6 Mar 2025 08:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741248432; cv=pass; b=KFSbN5Gnt/wQYkyt73C6JnXcbt7yonLZIa1no/n+CPMIQhG+gGLjCGVJ44aOxUeNOMjmeI3T1kRv9e5Z98tLywz1fo1SQf3bbg/KlLTDvZ206m8qtKQbMtssydJSQt61XDxJ0NDC4qqVhctJpiEJ9c/YkeNyiWWLTFF8QZ96C5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741248432; c=relaxed/simple;
	bh=dWKsAci39FlsH6tQCq0upEs19/Xio6S+NFIyyEsNm24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVZga7e8wRt38ryMLmUUa+i/ICkkxQnjCsLzVrEIFxeCEwEfTjtGf5A2kpc8HG16WMeAlgnMXIb3cGJvNBejiLXNr2Dv5m5zqQca+ua8b2AFUrupqBhnPxlF49m7YqrIYFLcigc+En3rxPE6Mbl4G99bpFzlFx7TPX5HFcOAKEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=XXeYrDPn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741248395; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dcuS1vvnFY8KcKNp3B1qWH6z5ABilI5v5mzOFsWTGqDDIMEMhiH69DLJg/93jVZfLvGYNQAQEtu7PAHBwvTZSBgSG0T+FfuWlNoDS6z7IYqjvOQfV9mV3VUcAIclCgtt4X3mYNOj0vtHoU+6pm7nHHVbjAzRa0wm2ohHXG+Xykc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741248395; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uCOliLTc8FCNZdZQCcLkuTnopU2o/wGilsZ2OAGkH7Q=; 
	b=XX8zeFLWDdSw5pKnyqisWzxlInY4vWSB5482xn7bqWYCNDoTwF/M5qco07KSqd0AcMZ6v1YY0JEJUS6w0otWupEtFqln2+/p7vn0kbBVoFSmODjHrmQGLRwWgVqEXX7hLeEIp/ajAfpJV8TO4Ju+RsI/9B9Oa+C2fBugdfQvWMU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741248395;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=uCOliLTc8FCNZdZQCcLkuTnopU2o/wGilsZ2OAGkH7Q=;
	b=XXeYrDPnvMwong0AxeA19sYfopUW8O/CPCEdhZPU4CgtXNniVnkkYQNeWtfl9cve
	MpcjD3wQ8SbTqQ87BpX6KsyOan1IGWI929lA5Z5OUQHsH9ZYjYVuD8Fgvpg+DJtMkMR
	NcKe4gdhb8vu/EIcJg8nihpUv1UWtRhnRJwYBLy4=
Received: by mx.zohomail.com with SMTPS id 174124839394569.84592736885759;
	Thu, 6 Mar 2025 00:06:33 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 1/3] media: platform: synopsys: hdmirx: Remove duplicated header inclusion
Date: Thu,  6 Mar 2025 11:05:31 +0300
Message-ID: <20250306080533.294964-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306080533.294964-1-dmitry.osipenko@collabora.com>
References: <20250306080533.294964-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Remove second v4l2-common.h header inclusion.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503061231.PHF6hEL2-lkp@intel.com/
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 4ffc86ad6c35..f161fd6712b6 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -39,7 +39,6 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
-#include <media/v4l2-common.h>
 
 #include <sound/hdmi-codec.h>
 
-- 
2.48.1


