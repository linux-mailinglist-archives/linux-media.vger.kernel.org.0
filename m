Return-Path: <linux-media+bounces-8504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 054AF896BDC
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 12:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 996681F22A44
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E47713664C;
	Wed,  3 Apr 2024 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LRS0jpPm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17EC7317F
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 10:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712139364; cv=none; b=MZysgy6F3gVF/bhj+5sMeWh+aRho4BE3Qwlh+YRS60L0B4hTL5ob0tI7LQqkS0xl0pA02Qiw3bu4RaLKnNiDFleV5pOVCMloFq1gXgFm11X1vO30Q5oE087+HCorJ52NSaa614Ld7bGf+ZaaKMnCH8N+zCJSud6qoELem5JiP0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712139364; c=relaxed/simple;
	bh=rkmb1yh7QN+ohEtyKavIRAMw2Vd/1qvbkaqknS5nmUk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rH/w5plUISmKD2aSMTCk3XrwoWKXfs2W76hg03Je+/vx7obodoVpCmKJWTAsXwhC74tuNwFwgY1WNrmKl/K+ABhtftgeUQQ4/zgJ+CWt9v5NZEDkuJSrBTf68ZWaVSlaJkAe9zrRDxsi1Fr7yjpaUlplp7C7N7wdraU+XAZlvqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LRS0jpPm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 944343A3;
	Wed,  3 Apr 2024 12:15:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712139322;
	bh=rkmb1yh7QN+ohEtyKavIRAMw2Vd/1qvbkaqknS5nmUk=;
	h=From:Subject:Date:To:Cc:From;
	b=LRS0jpPmfz3Bp4A6dTUMzBc+5aVGZR0oGXmJ22TGIH7d2BlWP6+qdweonXvZqJUhY
	 JzzucYy+DFwNgCH6u8JJdWa/gQfLD3eS1RAtZ5Kdxxe6g9mhqUbj1wZY3wn0j2dufG
	 vntud7wMd36jzJGOJNtIwz8rm/pgC5g3rTCUN2CA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/2] v4l2-compliance streams fixes
Date: Wed, 03 Apr 2024 13:15:43 +0300
Message-Id: <20240403-v4l2-compliance-streams-fixes-v2-0-be9b338dc204@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8sDWYC/42NSw6DMAxEr4K8rqv8FtBV71GxCMEUS5BUMY1aI
 e7eiBN0+TQzb3YQykwCt2aHTIWFU6xgLg2E2ccnIY+VwSjjlFMWi1sMhrS+FvYxEMqWya+CE39
 IkDpFrpuCH9oBquOV6Qyq4gF1iu+NF4G+RjPLlvL3fC76LPx5UjQq9DrY1oZgtO3uPJKXFIfk8
 3itO+iP4/gBh2qcI9wAAAA=
To: linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=858;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=rkmb1yh7QN+ohEtyKavIRAMw2Vd/1qvbkaqknS5nmUk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmDSxbYyrOp+6mz5M2D7o63iJ/0L6tkkQNRF9kH
 gSauvmLl1yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZg0sWwAKCRD6PaqMvJYe
 9a3+D/0WlN/GKadfp+QAlqaPk6pbJ83ebU2/aBh2FWR+Cm86sDcd8gDcwI4Rk8SB38OhH4q667w
 DHcih+Am5qakY8aID1TrhbgT5Qr5JIFo/Jm226kTpsotfBlpCQmw03EJP9k8YTyLqb8kUdmVqMP
 6leFNu4Kfu4fUu7uCw3tJDCzFsEBCZiR52QEN+g2GHV3uX7Pq5A9qwgBHIUuNsQcaf1/CPMxS0Z
 6eLOI5gx1sxHq8t53MdLVmOeOXnNIRqMXQCak1gNJJ3eMlVdWjqrtSkgTZsA4hI2SFyFJDvB9UZ
 oSVp0UN0aDA+wKvtsKFp57hVOy2jKZsxTobwuTJIwPCQC+UIXUKLaj3COIxJXhI84q7UPFDYXj9
 Jl16E7m+jlEWmZ4GiG4bA4SIjDfQHBrD9DpN/ZmQtuwQDTEifgI61xEk0/BB627TDbK2uHHNy/h
 oj67pKj3JeiTMpzKHmPn2N9uh4/03ZIMkyUKhEdXIfsDyaUMf+mBz0BSH90xPHmIREysDIw7Jdm
 BspHjJEtqdjUMIz4AQtF5ZHaYSZml3nAa+en57eSqg7nbeKHDaMuomCqmxsdjVGw7ydOTEtqfEu
 RVZlZDz4haqCdTIElDxhmu/rzknwjN/o2QLRppmVByRqhNToVQkV79lXUWQvAvlVf3S1c7bdBIK
 eW9qtTpQjxK+Bsw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Two streams related fixes for v4l2-compliance.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Patch 1: cast only to uintptr_t, not first to uintptr_t and then to __u64.
- Link to v1: https://lore.kernel.org/r/20240403-v4l2-compliance-streams-fixes-v1-0-a1c383cc2139@ideasonboard.com

---
Tomi Valkeinen (2):
      v4l2-compliance: Fix use of routing on 32-bit platforms
      v4l2-compliance: Fix streams use in testSubDevEnumFrameSize()

 utils/v4l2-compliance/v4l2-compliance.cpp   |  4 ++--
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)
---
base-commit: a04dfa5b72df01c6dbdf68fd9365e2d913fe5a0f
change-id: 20240403-v4l2-compliance-streams-fixes-e90e49fcab8b

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


