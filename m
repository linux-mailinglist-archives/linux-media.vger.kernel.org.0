Return-Path: <linux-media+bounces-24494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE14A07298
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D500168364
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 10:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C5B215786;
	Thu,  9 Jan 2025 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JkK96JiM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC392153F5;
	Thu,  9 Jan 2025 10:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417779; cv=none; b=CAvqXOjMUPOq40Ve9l5U7yn9r2+IBTeFYF43vZ9qkPMBBl0dlx6gRjpua2nOs6K689heCEmSUUSY1HpoWSh9lguuY7uMre8Jle42FWDAK16ogkyZPX+bRrwlpqHoRunszeJdbyMyu4Ir0eGW2m1WBpCROhW1VE24p6jEynkdC/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417779; c=relaxed/simple;
	bh=WL94jda9gXw3zp7XCXsk+gWbq/+ysSCO2KzddLtNPKM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OBe/oRL6uvIuViI1JWcFGyHQJIXBoXLCMBO07HPkskkIdHOoFSyvQyh8SGhXw7INC3iEOa8BsNGFchN2HC6dmLaPeuAIuUBJmmy/kKjVpJsFmIJ4HpnI3o87FrtvpKB0HaoavDNF5D5fbnAe8lUc75XUMG8FV1RYskGWjWmRb5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JkK96JiM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABEC5844;
	Thu,  9 Jan 2025 11:15:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736417722;
	bh=WL94jda9gXw3zp7XCXsk+gWbq/+ysSCO2KzddLtNPKM=;
	h=From:Subject:Date:To:Cc:From;
	b=JkK96JiMyTbJz+sH1FjkzjlqR2d+NvKoYl+kl7fYthMrp6OLPGOiRzyC5Cj9bFfOt
	 Z5inSqnoZdOLNGafF775RQDRqtA11jKeYkk6ohRno2M3GRZxKfJo9QOE5kzSmeR9H0
	 4iqGKJ5bvJ8/2Cnaf5me8HAntTu5IypDdada3Ad8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH RFC 0/2] media: TPG with internal pads
Date: Thu, 09 Jan 2025 12:15:41 +0200
Message-Id: <20250109-ub953-tpg-v1-0-d7392375c243@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM6hf2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQwNL3dIkS1Nj3ZKCdF0zE3OjtORk47Q00yQloPqCotS0zAqwWdFKQW7
 OSrG1tQBIQMonYAAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=WL94jda9gXw3zp7XCXsk+gWbq/+ysSCO2KzddLtNPKM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnf6Hoi68i3UjaFQFb6rJ8qv2YQG99FTpB3Bppd
 RqjnIPg8xaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ3+h6AAKCRD6PaqMvJYe
 9dveD/9u3EkVYBCChTVyYwViYtRxAd8yxTUfLATmjLq0Hlgcno/+2PPtbEXLWULjFk0Ui9ZNSIr
 nkM1I5HGQDjnYj+ZIBQtV7RHvi02s1o4j6UeZd55JExWmYTrW+s9nT057A4w7j8QUBDJ6FhBm7l
 Kk8Fxsdjmz5eFEtTP/ZdL73ndx8tBhSJRUg+VMjBu04s6Xizehn5o2AfDrZi4bsZX2L6IQgHgnm
 bPI/g3ESQ+GRVKIOPqMvFfzM+Othz85d76NDKUiAaulR4a65X2mFnhnecg8lMehRJeJbrl2osTN
 ClwKccOFJyca19VgoBG9jTTusXvlh2pmxesPi08SrA4b9tZwhG0dB8sZc8KXOnMiRUENZsThEor
 YTtu0RU2R/DV0rqCfBWImDOs52cOmEx+icRvMJq5vd72RkP6vd75yveNTseMIpOMgc9OdtksXE8
 mbYVNxmjsjbpjvzKRPa5jj8cXLEPKMivNUlPlZOUxWdYXE1Rd8I2tWVKgiDN/IG9nCEluCNmjXH
 e1h9MZagTV/UtZoaqzJiZkcz/WnrlMoT02CconVfqfZrn9OR6CQ5wjvz0Dr/hcVLpoZiOunmELj
 Nj/ErA582rmDIM1MhKQ8BC9YJITe8/hnwg/2jjdDHFBQksv43pB65P0LnYBEY4Xfcin6akQhzLS
 rG0jKR3yD2GuKGw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Hi,

This is an RFC that shows how to add TPG support using the
(non-upstream) internal pads. I'm posting this to get some more material
around the internal pads to help the discussions.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Sakari Ailus (1):
      media: mc: Add INTERNAL pad flag

Tomi Valkeinen (1):
      media: i2c: ds90ub953: Add TPG support

 .../userspace-api/media/mediactl/media-types.rst   |   8 +
 drivers/media/i2c/ds90ub953.c                      | 498 +++++++++++++++++++--
 drivers/media/mc/mc-entity.c                       |  10 +-
 include/uapi/linux/media.h                         |   1 +
 4 files changed, 466 insertions(+), 51 deletions(-)
---
base-commit: 40ed9e9b2808beeb835bd0ed971fb364c285d39c
change-id: 20250109-ub953-tpg-6472fcc3ff5b

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


