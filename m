Return-Path: <linux-media+bounces-38232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD3B0EDDE
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 10:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C757716EDED
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 08:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29B32836B5;
	Wed, 23 Jul 2025 08:58:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B73276028
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261114; cv=none; b=rHapGTBxYZllFj2EJOWlN6t/1cUq1W0KWHZB2hJyRfguc4ekmnaQxExBKRwvEF0+lnCqv9v/ic5Kvd7t7Wc34RdCRmeCK41mjsdnfCOKRYhjvGGQv2NJkvlUgBNRrZ1M8yqgi5aYbzBMEzH5YzrWeJZqLXhHFpuhEI/ndkL6MUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261114; c=relaxed/simple;
	bh=bxHJtEygIS65iMVXdeydJw3JfVyPHxTTM36jGaTq9cg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r81jLzhXYCZSeK41T7hk+86UbFlmxkQYz2b1WXErv0+S6FjRpXtf8lq8UC1289YiKhVtvLojZE2J/8H+5hx95HT/HfvEJY3vVa4aZeuQ95sjety06tLROcOEtFZWpY7c2NrlCHlINryYO5UKZA/q6Qbl0A94XhF4JBd11Z2d+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pfitzner@pengutronix.de>)
	id 1ueVJ0-0004xI-H0; Wed, 23 Jul 2025 10:58:30 +0200
From: Fabian Pfitzner <f.pfitzner@pengutronix.de>
Subject: [PATCH 0/2] parse horizontal/vertical flip properties
Date: Wed, 23 Jul 2025 10:58:28 +0200
Message-Id: <20250718-fpf-media-dt-flip-v1-0-75b3a938b4be@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADSkgGgC/x2N0QrCMAwAf2Xk2UA3kYq/Ij6kbeICrpZkiDD27
 3Y+HsdxGzibssNt2MD4o67v2mE8DZBnqk9GLZ1hCtMlxPGK0gQXLkpYVpSXNoySqZxDypIi9C6
 RMyajmuejXMhXtkM0Y9Hvf3Z/7PsPavz7eXwAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, entwicklung@pengutronix.de, 
 Fabian Pfitzner <f.pfitzner@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: f.pfitzner@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

There are cameras containing a mirror on their optical path e. g. when
mounted upside down.

Introduce two options to change the device's flip property via device tree.

As there is already support for the panel-common driver [1], add it for cameras in the same way.

[1] commit 3c0ecd83eee9 ("dt-bindings: display: panel: Move flip properties to panel-common")

Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
---
Fabian Pfitzner (2):
      media: dt-bindings: add flip properties
      media: v4l: fwnode: parse horizontal/vertical flip properties

 .../devicetree/bindings/media/video-interface-devices.yaml        | 8 ++++++++
 drivers/media/v4l2-core/v4l2-fwnode.c                             | 3 +++
 include/media/v4l2-fwnode.h                                       | 4 ++++
 3 files changed, 15 insertions(+)
---
base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
change-id: 20250718-fpf-media-dt-flip-7fcad30bcfb7

Best regards,
-- 
Fabian Pfitzner <f.pfitzner@pengutronix.de>


