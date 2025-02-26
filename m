Return-Path: <linux-media+bounces-27014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B0DA45AA1
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F3FC172E11
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8442459F4;
	Wed, 26 Feb 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="BFCWmfzp"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2051423817E;
	Wed, 26 Feb 2025 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563472; cv=pass; b=PWEaRpgvm7fESlie1SpyMRRG7SJ8uXr1vufkgqZ2iUlKzbSuGMD+wB7UK4ILytRiP6PHAA99hN9B4CM79xsKRLZfltURwxdzXZ6NtU59UeBu7knXAgU/Hu0S2lQOGZZ2ddobd4ghZvy5yugwQOXFFt7o3n6vnus8KEaZhDTLv8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563472; c=relaxed/simple;
	bh=8oLzn5I0OADSlVcV6xkYQcD5GCt4cpAIIwyR4b/aPys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiyKQZuEyZ/tPP5eKgS38AZ8t9qUs/Gpwlq90hVoLclxaJObJQmvEvNzpqwID8cg9s2e2GvcmdPmjQo6XPoKf3iDYDPn68tdkj2g/6IQfzt+rJ1HNkljYgMpsEVO6GoJCcV/XPufLlTfOTRhO1z4Ktnu16Wn9qyOAXJ49Ykxaco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=BFCWmfzp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740563413; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ODySbHIgUrC/R/eJVn+s6PRCVzWT0Wi8CQ7JNl/W/7V9WBR/ZSnYe+RyBN50yKzFoPxgUQzs8oebvJSu8AllLi7f2zU1SIutiLIJRXUu82sn//YahOMPB487NMqU1BABb4v6CWjZuyQxO1wy17gOrooPdcoXod10IdhfgRmugXw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740563413; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YExa2cR9o7Mo3lUq9RQPolzLOjJZhxbHtJfLua+BJKI=; 
	b=mtc4ItPNOJn6tZIbujx5C6vb+Lz1Xp+Oat7UM6TCmEt3JdyZlx9w0a+RAUhGr2fjw1NgbPDmpbh7Q5KSQH/qtDiL6XfjESPzywVAClv87XzM6nGneow1n3GRRpz4X/R3v/fsKwwHFEWttSw2pfUO9Sz63GquUvTtql1nOS00BRk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740563413;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YExa2cR9o7Mo3lUq9RQPolzLOjJZhxbHtJfLua+BJKI=;
	b=BFCWmfzpK6H4svO3CMcR3aR+AyLk93O5Fj81qAPeciCeOlVQUzTe25P4MAW+nLkV
	6A6Bj8B2kakOY/7ub28rgPwTa9flNlLjfh5o+VpMZ9MDhqcK25Wn2Fmv8CUtpYipXoB
	9Qnzmg+T6L4ZHGd0eAWFaMFjJmvo3Y0fuB7RVWbE=
Received: by mx.zohomail.com with SMTPS id 1740563411516959.0567330367636;
	Wed, 26 Feb 2025 01:50:11 -0800 (PST)
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
	linux-rockchip@lists.infradead.org,
	Tim Surber <me@timsurber.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v11 1/6] MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
Date: Wed, 26 Feb 2025 12:49:41 +0300
Message-ID: <20250226094946.665963-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226094946.665963-1-dmitry.osipenko@collabora.com>
References: <20250226094946.665963-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Shreeya Patel <shreeya.patel@collabora.com>

Add an entry for Synopsys DesignWare HDMI Receiver Controller
Driver.

Reviewed-by: Christopher Obbard <chris.obbard@collabora.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---

NOTE: Shreeya is currently busy and I'm helping to finish upstreaming
      the driver. She will be maintaining driver afterwards.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2286200b355b..1bb6a54e41c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22952,6 +22952,14 @@ F:	drivers/net/pcs/pcs-xpcs.c
 F:	drivers/net/pcs/pcs-xpcs.h
 F:	include/linux/pcs/pcs-xpcs.h
 
+SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
+M:	Shreeya Patel <shreeya.patel@collabora.com>
+L:	linux-media@vger.kernel.org
+L:	kernel@collabora.com
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+F:	drivers/media/platform/synopsys/hdmirx/*
+
 SYNOPSYS DESIGNWARE I2C DRIVER
 M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-- 
2.48.1


