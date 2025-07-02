Return-Path: <linux-media+bounces-36604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1431AF5C82
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 636BF1C4508E
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228622DBF48;
	Wed,  2 Jul 2025 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eQbDJOZa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC73472610
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469325; cv=none; b=d7xGacBTurBn9LHDUX1NPfJ+dQQdn8lnvBMT1N43pUoCEckE+wVsJMM/YlqNYFXMngWe4+aQbAeAh3Wdtlym85fkdH/I8PRxwJP+6HHmvdqX4zrYPNIKlWJ3S2tEYEU2Wrb6DuUgIQq4OhTTvGzDXd7WWd2B9jmmoSrN5BUH+9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469325; c=relaxed/simple;
	bh=Jyx6DhyPeS2FuFxl9jUd7aBnaJRUFLl7eagKHfBKRgc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mmXiQBpT3t3iqrYfXLlKr6cTvg/hOnW7cc0Ooi73WkDJxZeNfClzNLRUwaSLots3gkgFHVFi6un10NpYyv41kONkt0gzGfdqxHWRL5Ta05XGWhXag8VSaIQxiZNKGRy0VhrSRjEZ7tXU+A5EW1zwTq25JmmVk1yPoPbKzRfccmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eQbDJOZa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FC65886;
	Wed,  2 Jul 2025 17:14:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751469298;
	bh=Jyx6DhyPeS2FuFxl9jUd7aBnaJRUFLl7eagKHfBKRgc=;
	h=From:Subject:Date:To:Cc:From;
	b=eQbDJOZaVDgjfvnWnIcnX1WFPUqBUiH0i6qj3dAnqSIgi0IB9uFcexkDAZcqDTvJC
	 jY9GSzC37fLPf60v3aswiKYBvs/EdSX2eBOo0ucdGaBrhO0eoTYMrUrw21SFkfC4m7
	 PXlYJ/bwufDKOpOL5rrSf//l8MvXlezHl7G3UQoM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/4] Helpers to manage starting / stopping multi-driver
 media pipelines
Date: Wed, 02 Jul 2025 16:15:01 +0100
Message-Id: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVMZWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMj3YLMgtSczLzUYl2zxDQLQ8vUtKTUFEMloPqCotS0zAqwWdGxtbU
 ACLOm71sAAAA=
X-Change-ID: 20250702-pipelines-6af819efbed1
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=Jyx6DhyPeS2FuFxl9jUd7aBnaJRUFLl7eagKHfBKRgc=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoZU0C8Ia+i9fGwedpKXSQh9VAMybSRYixy5KyK
 xkXdjgIfXaJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaGVNAgAKCRDISVd6bEV1
 MjO+D/0V1iRbso2KA9ToZPuMUSTMiJIEX+EkPNCC5orksBR47jFltC1LqbmjPY0XwGLgb25HUQB
 HChLGXsVNc7PNNsxXkV0L921D/Ef0hqo1QShpseMpJNN8K3w76Y0Cto6HRBdTArixa/83/6g8Si
 9ReRFqwVntGl432mzXuzRaxWSQuWCptI08x0Otvtulhp/ZWdU5Ym1P4ipf/TsI8PAn4WJeN8iZv
 Pm60wtIOgiNqFBDfrBurT1njC/3OiWha+tIlnLACBJL9u+G0nXpEF0wi1UhgYo+hRf67NkdC2Sj
 Sk4oq5TjdsaHSq93ZY6++JQ/8xUjZVo6U/y6d4lBPN1YKEQ/C/deKG08UG5Eg70yrbGxTH4S5SU
 e6TZ54gYpeHs2uWMiGdTKIx7T9FEG4rYYAehT53pw5Cc5BtMYkLNuiiriWTljM/n5POPcNI/oRX
 +loYoHO5dT+UVTDTE/IwSYh1FWY1mypGpf45MnTfI8F+8i0Sx/3UjLkcMCwRJg3Olf+iD+J6zau
 RL69k+W0ziU0y7oeEdUCP9JPmr/NOi+UTUrevtvp1yhepIC/P65X/E0qmL4mGWfh1yRi5u1LgC+
 0ZZvZQogzOap4apcBtPSUsPaePWDBXGvy+PSkHYTTBA747IejAzLvEauMrf5s4YbL7Pa314zKDZ
 Bt/AqFNos78CLLA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hello all

This series is adds some helper functions that are intended to
simplify driver code that starts a pipeline to which multiple
drivers contribute video devices. Oone of the patches from my
earlier media jobs series [1] is included, and will now be dropped
from there. The extra changes mostly stem from review comments
to that patch and the IVC series [2].

The media pipeline entity iterator is embedded into
struct media_pipeline and inited during media_pipeline_start() with
updates to functions interacting with the iterator to accomodate
that. The commit adding the new entity operations was updated to
account for that change, and a further new patch was introduced to
create a helper for drivers to call the new media_pipeline_started()
and media_pipeline_stopped() based on the state of all the video
device type entities in the pipeline

Thanks
Dan

[1] https://lore.kernel.org/linux-media/20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com/
[2] https://lore.kernel.org/linux-media/20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com/

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Daniel Scally (4):
      media: mc: entity: Move media pipeline entity iteration functions
      media: mc: entity: Embed entity iterator in pipeline
      media: mc: entity: Add pipeline_started/stopped ops
      media: v4l2-dev: Add helpers to run media_pipeline_[started|stopped]()

 drivers/media/mc/mc-entity.c                  | 93 ++++++++++++++++++---------
 drivers/media/platform/ti/omap3isp/ispvideo.c |  9 +--
 drivers/media/v4l2-core/v4l2-dev.c            | 49 ++++++++++++++
 include/media/media-entity.h                  | 91 +++++++++++++-------------
 include/media/v4l2-dev.h                      | 46 +++++++++++++
 5 files changed, 204 insertions(+), 84 deletions(-)
---
base-commit: c0b1da281d84d33281fc49289f0c7f8aada450ff
change-id: 20250702-pipelines-6af819efbed1

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


