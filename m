Return-Path: <linux-media+bounces-24904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A3A1623A
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 15:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01572164762
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 14:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945161DEFFC;
	Sun, 19 Jan 2025 14:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiFJP2aS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909D21EEE6
	for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 14:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297572; cv=none; b=uZ49ozG2/jvY5Bz3HpJ85XkG0exB6jWvZTq9+5mKFd4jQM8Mg2K0iV4lscsQoXqOSywezMjj5YGYyTIlaXNTZwhpa2oWErY+sVjBF6gsEX4qB38LHEyxnFEdfB6inDgbk884aVgWljWhyC7//F1m51+3canXjpSPnU1OqthmxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297572; c=relaxed/simple;
	bh=Ss2le2bg2PCpLXGM/QUZlPmxsO2vDgpi7atAPfCy0ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m02XEW0AUD44frZ5MS+Ksa6iurlmK83/j/+201wsmDxP2oGfBC6Ri2M1BdCELI9bSnFWtUbuTkFLKr3nfFZyiLzdi0LanLBK0yY1Vl40/NYKt8T9CdIp8LkmrCi1IN89kJWsPI6sILL5UdejEZcRphMK+CC5YiFzm2eJEwgkhVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiFJP2aS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737297570; x=1768833570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ss2le2bg2PCpLXGM/QUZlPmxsO2vDgpi7atAPfCy0ro=;
  b=kiFJP2aSjxXjFijPrx/ATitmpjhWsJCN3jE8CwIAUTlBZOOFQ3pCQYVk
   1NaHBEo5FFflYHkfAKc52ob0TVoogzdMJU/t6TLpe7ZRwbrBvqWT8pI9V
   uG1ZgCfoIvm2XGzM4EbTF65E1lEngEA3/SD2jpLHmAZizfM3AS8DFCpNC
   IpQZ9OY/RNkDQZE1vEvyJs0BoxGub3vmjJ1RGvxnTYsEsQk8eHyFMAY/B
   BnvZmk7U5a60cRlzcOFmNWq7BbiuL/FaR6zXWbWL6mFD1ZdyUXlTBXv7h
   dZoUlIWbPpRaKtNQqbpRqcItp4If4xZqL70jGDSKo3H0zsGQrHU31VqdU
   A==;
X-CSE-ConnectionGUID: 2Fs/WahPSd2javejoJt0/A==
X-CSE-MsgGUID: FvHshKczTgmo8/RFo0MqEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37579739"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="37579739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:30 -0800
X-CSE-ConnectionGUID: ALIpLDmiRf+8hKhWZc0VJQ==
X-CSE-MsgGUID: SlXJp7HSQuq2begxLSx0Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="111232071"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:23 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DD2BF12076F;
	Sun, 19 Jan 2025 16:39:16 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benoit Parrot <bparrot@ti.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"Duc-Long, Le" <duclong.linux@gmail.com>
Subject: [PATCH v9 3/9] media: Documentation: Update link frequency driver documentation
Date: Sun, 19 Jan 2025 16:38:58 +0200
Message-Id: <20250119143904.114991-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250119143904.114991-1-sakari.ailus@linux.intel.com>
References: <20250119143904.114991-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the get_mbus_config() as the means for conveying the link frequency
towards the receiver drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/tx-rx.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index c71003f74b1c..6f9eba189a9f 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -49,6 +49,10 @@ Link frequency
 The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
 receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
 
+Drivers that do not have user-configurable link frequency should report it
+through the ``.get_mbus_config()`` subdev pad operation, in the ``link_freq``
+field of struct v4l2_mbus_config, instead of through controls.
+
 ``.enable_streams()`` and ``.disable_streams()`` callbacks
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.5


