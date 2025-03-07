Return-Path: <linux-media+bounces-27804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DC1A563AF
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72EF0189687F
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475A2205AC3;
	Fri,  7 Mar 2025 09:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="fFtXPVvz"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160211FCD1F;
	Fri,  7 Mar 2025 09:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339366; cv=pass; b=dHlIFQKyxor9kniY6tg5uDLKURLEYy0iZTg28wQjX0XHwV+PqWM6QhjMMiwZTZCYJPWJqZUUeiQUPfhDTNoawhEO0lqyVrnNSVhqSTP7wHi81kSLmUzIjut6qJ3sruDrZFFCn1EftANH7u28I2byS0oStSCOE0HP6u7TYFQcoOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339366; c=relaxed/simple;
	bh=mK+RomwHnhzCyg7EefZ9r/iooekiTCi6TK57RFBmuVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jGC4DMXaMjX+OwjALYAZl9tVoprJKDz3mXoM4ZCFI/W/TTuKhKAzpBXDlqv9zLdtMMVIk/bwHkzdoRv2s5WT2+n9juQzDzCTV2k9PbqPRY+pEcNcy8hviygN/HcyFLPbeyxWhk77z7W+0uH/Sib2OtETi1zgkPZXkhFGhpujJwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=fFtXPVvz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741339329; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y5374y2wA258tjYrBfxl6aKXWd0geSJuM/buyfdqp5Mln6e6g8L3cWfTVZEHl7lmhf2sJD81yCB+ycgmIO9jx/MbT3Q5uQplRcmVPOJaq7mSHdsd8ztZNjoZTWdJtt0VqtsMcPf/aqsn6WJwpQuP+gNzcGNOO13LAvC++/RDZD8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741339329; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TUsHy9uRDl2OIKrdZbuHC8Lrx8G+Tx5xIuuGpSk8lqo=; 
	b=FGCfzyP/861bMEa+B6uguhqqJy92WrPfCfjpV6SHKHlRa7i+sC40Jyk7HwEuDrG1HrvYYPvFKXQbPb1UQnZ4kEDZaZI37hZFpLiLQFZbImVnnqY/M73psY9EHKF1OTsaaIK7IVJwA6nFV7GpwWrW5UPqfi7gnBvHmuNfBelj+QQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741339329;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TUsHy9uRDl2OIKrdZbuHC8Lrx8G+Tx5xIuuGpSk8lqo=;
	b=fFtXPVvzfYP/iRf2zkLDTFsPJWPTxBmSAqkzQDugGPqh/dadTRhc9p8vjn8AYXIm
	5mP84Lfs3l9H2TU2xyo5xq58WACBajvOh/VgUC5wvJvM/i1OWTlRKMarEuEC4kFlCQ0
	eX8jVP0d0xOvxVP3rTYtjfoU+bhWWgqEi4Yst4kY=
Received: by mx.zohomail.com with SMTPS id 1741339326900299.3151948531463;
	Fri, 7 Mar 2025 01:22:06 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Tim Surber <me@timsurber.de>
Subject: [PATCH v1] media: platform: synopsys: hdmirx: Fix compilation on 32bit arches
Date: Fri,  7 Mar 2025 12:21:13 +0300
Message-ID: <20250307092113.646831-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The pixelclock is specified as 64bit integer and for this driver it
won't be above 600MHz. Fix the 64bit division of the pixclock for 32bit
kernel builds.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503070743.WnRxStlk-lkp@intel.com/
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 4d42da7255f3..7e342bbde967 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -291,7 +291,7 @@ static void hdmirx_get_timings(struct snps_hdmirx_dev *hdmirx_dev,
 	hfp = htotal - hact - hs - hbp;
 	vfp = vtotal - vact - vs - vbp;
 
-	fps = (bt->pixelclock + (htotal * vtotal) / 2) / (htotal * vtotal);
+	fps = ((u32)bt->pixelclock + (htotal * vtotal) / 2) / (htotal * vtotal);
 	bt->width = hact;
 	bt->height = vact;
 	bt->hfrontporch = hfp;
-- 
2.48.1


