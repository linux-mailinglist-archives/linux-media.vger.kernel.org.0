Return-Path: <linux-media+bounces-27682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A536A5443D
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527D417108C
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87761FBC9F;
	Thu,  6 Mar 2025 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Erj10uqx"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60081C8602;
	Thu,  6 Mar 2025 08:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741248445; cv=pass; b=nnscRxojIqA+BKPyS/a9UgMG/gXzXlYWQeTF8xWYDuG5WnUSF/qclOiz+/wmeTcO5M5jmjM1mgwOuGi0MScBMUMsz6zJrD7uLn+le/FnGh8ItwNbqRoiBTQsTqjiORlBlU+6OtZSmdM8PvF+tG+q+0lRitQJrBwz+WZJKSJJAoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741248445; c=relaxed/simple;
	bh=lA+iBJcFX6Jy8GTqBQJtCX4q+kEAxMYiJnZ1Q1Vk6YI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oMj8lFehRCVbu5W/+xPwZ4Ted5vsa30MIMzQvRuUuuN3oSNf6jIcUPo0BJXrTGEeWJcDWiAANcyhEynP0ehExDhVqNRIBfzXlu3bmUghqJUnt4deSjXvAWc9jsjaPU7XQNVB4Sr2NP00llx9Y3uYZalRL0xICWBEnx6ma+s0Yl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Erj10uqx; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741248391; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CWvERW0aqJYos4A9ChZ0WUYpVAlLVFcka6xZ2DPgwvhNJaLV+ulwb86isCMTiDUYd/JbTGnMv/Icx1AmyM30qhjBwxVm5cA48k1rqgJuQrUa0vV0UY1EM+hZj70FX7usbKyLso6eyU5KZfDMJf25DqHEL3d6tMFRQsuLItb+BRM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741248391; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pJnrzorwJZg5YVopIF87hrP6/JAWjqvnB+RBADKXXwE=; 
	b=aweY4RFBbqtihLY1gVBtSPV4PS6Wk+Z8mXv28xlIXIhoreRVvzDEdPa8yyInVep2ODkU8e+MowviUpKgc9CmVy4YYRVsZ+lbMxrfQFDQ6mNihiQwIv2Kz/ArAkwcmkntfaXTaGUla47ZCdaFOuvlVbYcMc0TMe3saX+2Iuo1tm0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741248391;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pJnrzorwJZg5YVopIF87hrP6/JAWjqvnB+RBADKXXwE=;
	b=Erj10uqxvm9Iu8s/SDjtOeOxUkedSot1Wk0iS/H8EzDUM92HUKs+A3KDhXr6nWns
	NFJQYC7clS0PRJq9vuIyYAEefmD/K7BVwYaoRc6bD/ffZb+/xP4n43Q30UjJGjxSXt8
	ZDotbJ9sVKoP7QVH4dCkq4Rvdg3uKuje3p99xhhw=
Received: by mx.zohomail.com with SMTPS id 174124838915716.167179851729884;
	Thu, 6 Mar 2025 00:06:29 -0800 (PST)
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
Subject: [PATCH v1 0/3] Remove unused code from HDMI RX driver
Date: Thu,  6 Mar 2025 11:05:30 +0300
Message-ID: <20250306080533.294964-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Hans,

This is a follow up to the v13 HDMI RX patches [1] addressing warning
produced by Intel's test robot.

It also removes the unused HDMI CODEC leftovers that we accidentally
missed to remove previously and makes minor improvement to the definition
of struct snps_hdmirx_dev, all of which I noticed while was looking at
the warning report.

Dmitry Osipenko (3):
  media: platform: synopsys: hdmirx: Remove duplicated header inclusion
  media: platform: synopsys: hdmirx: Remove unused HDMI audio CODEC
    relics
  media: platform: synopsys: hdmirx: Optimize struct snps_hdmirx_dev

 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

-- 
2.48.1


