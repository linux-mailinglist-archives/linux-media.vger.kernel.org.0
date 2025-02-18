Return-Path: <linux-media+bounces-26297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4300DA3A25A
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 17:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D70E1889F08
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 16:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4451226E15A;
	Tue, 18 Feb 2025 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qhnB9F4U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE812198E60;
	Tue, 18 Feb 2025 16:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739895360; cv=none; b=botrWrd09ENfYr0q032ULNGu2MxqSTntYkgwWslzrIXI7Vp4jHd0UeAPf0PHg/HJ7MyNAeSdyqweBwa/yjyk9ZDtCAEybSsYekY9taui/UEGAapdjyZJu4SZnOk91xBod6DrLEArs7FYN2cM2eHMpZxA4Y1W54AT1NDZu378N3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739895360; c=relaxed/simple;
	bh=9LmEoBxlVvOChmpzaX4Orbg6zkvzEFFJVyWkOWDTFEQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FCLnSYcrVE97LplQWvqB+79Wp+K6xKCPVM1ZrmFsLZgzccrt+2+wZZbtnSErRyToQA2yvjmQpfP1wckVrZ4xmbLSfJXFNA7dbKEbIeQ/EUDQF5hRzWSmvam//ifszR51hhZv+vlp9HDSHLd4h+v5qBXrH3tbPqoRqWJfKPP3FgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qhnB9F4U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C312322F;
	Tue, 18 Feb 2025 17:14:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739895269;
	bh=9LmEoBxlVvOChmpzaX4Orbg6zkvzEFFJVyWkOWDTFEQ=;
	h=From:Subject:Date:To:Cc:From;
	b=qhnB9F4UDfNjKtqNYMXLFoEgWJlV+/yE+mcJhK1yegXmv5LDEVtgZdG/nMte13M5U
	 2bnrlyliwkVfiEimcGZ5NuqBb9oZziU4Xjxl2VWmyRCEPWcoyyE4VyZ8+ynLtqSykY
	 dcIZWB3kHDKS5Jzih+6CSPMyk9evG5r1AH9UuGKw=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 0/3] media: subdev: Add v4l2_get_frame_desc_passthrough and
 use it
Date: Tue, 18 Feb 2025 18:15:42 +0200
Message-Id: <20250218-frame-desc-passthrough-v1-0-a32458f53714@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC+ytGcC/x3MSQqAMAxA0atI1gbaOnsVcVE02iwcSFQE8e4Wl
 2/x/wNKwqTQJg8IXay8rRE2TWAIfp0JeYwGZ1xhnK1xEr8QjqQD7l71CLKdc8CyrE1Buc2aKoc
 Y70IT3/+469/3A6bDlWVoAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=931;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=9LmEoBxlVvOChmpzaX4Orbg6zkvzEFFJVyWkOWDTFEQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBntLI0GQDYvpFcB1Pg19G4z7hlcxyQdKfo3xCt1
 g53eoqJ2QuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7SyNAAKCRD6PaqMvJYe
 9UWuEAChAo3r/qpjgYBFgDvfpsk+8kGTVCbiVrv8N8RD2o5nQXuIEUtCXK63UCF9/3yGY0Kw02c
 Z7D9Utz5JauxUFpYlapcDx5gD+74JPLrS5CtqLprRmhlEDQw2oegET2z/O5U6rY+YPKb6IoJ4DB
 G0zGZQlrKwUYTq211AtsobwmWsJZVeI4NwBd1AcOw5/PD0wP6FAZfnuaoxkTqVZu2UE9k2s8Q+q
 Yx2L9PUjAkZqA/DTUW2qa6B+G2mb0cuz2HZe1d6g9+EX7gi3aHne05CZu0BGLJiqvFxf6Ds/6Vc
 7V58Ssz+L4AtZUDJR7sSZl7k39ELXPmP2c4EUhmyHTYAAR0RbL6On6T5+vzTCHgwueU0q9YAu/q
 Jx+LjLt3SBPEzVWMRP7HL27Rgy8Uah26+04z+G8mV+sPue0yAwLDqW1ClKZ9/GqjAnSp2YTGVrJ
 o1FB3hdmnNYcl6fwGZTRdfPgtiOliP4qEJGGpDoeIB0Q77PApocFYD2L4ABC/HZXDS9/SugrgrG
 JplAWYG9QqkmdKauJ+yEuWWaqiq13cGuGuYcs2SLTCMDbcmbLLvLYHTy2BssC9S3V5zco9ZBjw6
 iaam0y1IdtSd6QCF7B/svtYZ7iSzPNLOstQhr4AaFlHzRM2r0e/714/dmjaAFqG9Ta/dBhcpW5R
 BrsgwciX418zRsg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

When writing the exact same code the third time for Renesas, I thought
we probably need a helper.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Tomi Valkeinen (3):
      media: subdev: Add v4l2_get_frame_desc_passthrough helper
      media: i2c: ds90ub953: Use v4l2_get_frame_desc_passthrough
      media: i2c: ds90ub913: Use v4l2_get_frame_desc_passthrough

 drivers/media/i2c/ds90ub913.c         | 59 +--------------------
 drivers/media/i2c/ds90ub953.c         | 61 +---------------------
 drivers/media/v4l2-core/v4l2-subdev.c | 96 +++++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 21 ++++++++
 4 files changed, 119 insertions(+), 118 deletions(-)
---
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20250218-frame-desc-passthrough-66805e413974

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


