Return-Path: <linux-media+bounces-27437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7614BA4D768
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9BD16AF64
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 09:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF6E1FC7F5;
	Tue,  4 Mar 2025 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WPCBRp4u"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E709190468;
	Tue,  4 Mar 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741078903; cv=pass; b=WCASmwxErTfFb6vScFZV8YqGfkMpf1QvySJTx/ITJL6QsKsWjFOt3BH8306YV7j8+c7Wxg7V7+fZHpuYVE+0ptbhwzyoZulrHePY6/7ZrSNP4zyykmdM4VoX37xDBsxHhW9aP4NqeurnYFgvUt4bFIWYiKVm+RWzIhMSQVo/Txg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741078903; c=relaxed/simple;
	bh=7YBv4TV4OSCYMGU9/JN624saPQbxk1vUOER1vqH+wYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zn/jP3G1fbtrkgZrBRB8O4MVDtiZd43ALal8vamyuZ9LU7pUbD75bv26sKSAxsLpWcmm8Bes/DQZiKT+AOgsPBBcaHPXvpf4zOT45MMO5cQLp1FssYtl3gidkCezY8HZsFnyiCxQ0BcqAdzm6dSnrvb0WKVj4cWrKIyiu+0ZhbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=WPCBRp4u; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741078850; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HCIEzLWj2Y7iSKdpzsbiq0OqPRrrvn0MOyJl1u1Eif+cXTfpiBmQEmcv6Ks3Jbjr0d4cFehnQSoUPy3G0XvTl0l6uWUXWynMkiKS3gwQlCy4jAHp9Wn/mclDGZ5XxFHNlGGkUgR1UMWSQqueQT5ZGKCocME3lWtRj0/3bE2pyMw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741078850; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ksDagsXbRnqXqY/SM85Of5WqOjgwoOYDeKarCY0Qk/4=; 
	b=WjjBLZOo3huDzqEFwPc6SphmAO0f1YDulVu0SRUpSVNqFu0dT4Xg8jQZdTHWVsX9Ck5O/Y0amwmeO/jb+xuWqWMLQjQ2De7V/BIky+jobu4QGkGajsn/U8vmFyjZuqf/SAOf8USQ0Kpoo/fFxG5YFme1yXH9iIvyJqbqaFUgxRo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741078850;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ksDagsXbRnqXqY/SM85Of5WqOjgwoOYDeKarCY0Qk/4=;
	b=WPCBRp4uQXVdArRn1NGCvaPFNHxYb0G/1PtKB0VXZfI4BsKMV6DaYDVs9G8lEtEo
	iw6Ca/XwYVMB371BDlsKGGs4QD35XxD0jju7KFWJkHt/UDoJzmqORe5ZGKRSHr61Q1V
	dBahGk7Ib5T9Qe4U1W6ymOrig20KNxzJdEeSTyKs=
Received: by mx.zohomail.com with SMTPS id 1741078847265210.0717245482465;
	Tue, 4 Mar 2025 01:00:47 -0800 (PST)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v13 1/6] MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
Date: Tue,  4 Mar 2025 11:58:14 +0300
Message-ID: <20250304085819.108067-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304085819.108067-1-dmitry.osipenko@collabora.com>
References: <20250304085819.108067-1-dmitry.osipenko@collabora.com>
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


