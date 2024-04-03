Return-Path: <linux-media+bounces-8483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0389189687F
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A253D287E05
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 08:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA106EB44;
	Wed,  3 Apr 2024 08:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="leZfvlsv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E0F67A15
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 08:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712132224; cv=none; b=gaDzqukG73P2LYJyEl/ZcUwCQnKkmtYnVlWrXw1qAfOHK2gDg7qdBN7bjUf1M2iXnpEiPVQ9rWLl5i0IFgzVIONUcwAt8fqSWrzfmOIqUQZg2gSR4azzpcEPKxYNq3N6AmKqO6WTDlzQXFJ+K1lOp71tgeRTmFQ0/h9hEKFMxVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712132224; c=relaxed/simple;
	bh=ub04hGafBOj+UaIQWHwh7ZPI4OZFminvginn6Ms0mxw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pBkzzS0bfz60qSuJnUIbxbnnTjk4Dldh2oQChZP+9rWYZQ2hueoEDop8ZnqFwlMnrX+rDtAbra9wX+IpY7a5X7zsamVLVDo4RQOW8H5EXhHIwrrOBYTrI7CsFDmcRdRtq1+T7pxTq/bp34at2eq+xYWMtu0H8j0at74DKq9oo0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=leZfvlsv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18A82674;
	Wed,  3 Apr 2024 10:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712132184;
	bh=ub04hGafBOj+UaIQWHwh7ZPI4OZFminvginn6Ms0mxw=;
	h=From:Subject:Date:To:Cc:From;
	b=leZfvlsvC1XcP5PQ9QfIg0WCbt/Q54OWjtAXm3q5j9HI+bEFDOaU5TN7jX3fS1BoY
	 J8L/gSPBf/PvOV9HzGKFJtbVtqwNUZsPOylEH5PyKVk8VoZ+Q5SrXoKnts0R/uaA6M
	 ZdcW9ADnMojv7zuHeyC9EKXcy+je+VGjBIdaVtPw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/2] v4l2-compliance streams fixes
Date: Wed, 03 Apr 2024 11:16:27 +0300
Message-Id: <20240403-v4l2-compliance-streams-fixes-v1-0-a1c383cc2139@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFsQDWYC/x2MwQqDMBAFf0X23IU0zaH6K6WHGJ91IUbJWimI/
 97F4zDMHKSoAqWuOahiF5WlGNxvDaUplg9YBmPyzgcX3IP3kD2nZV6zxJLAulXEWXmUH5TROoR
 2TLF/9mSPteIStniRpfzdJCu9z/MPV0Tg3XoAAAA=
To: linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=642;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ub04hGafBOj+UaIQWHwh7ZPI4OZFminvginn6Ms0mxw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmDRB7NdrWFXrYgLXCUNmrZF8TyemKjyI6MzPk7
 +SQlU8PIP2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZg0QewAKCRD6PaqMvJYe
 9QOTEACAbSO1zrZ4/cF/VI9tjEtfkqcdUd8QmAQd7Jdvp2O9t2i8V+xH5OG6ODhxqio3oGPeKYc
 yl8eihtZOXkW6T1YmExTNt28LdtOz4tY8Ebbby2KQbHTjkKLQ5TQkxH/+37Qyzr8NMwMAoQHqIi
 n5RKtHpmqjWt960BedHsM+79jp/xtwjUOCNKbl8dB/VC8fN43drgHeUxztEzIne2cAUqKy29W1R
 erPRV5YOZ5nQRhuC8CH1dgHj4Yl+KRZ/cq07NmKymHkYmNxbrFjuRrjKz8pGwBIeJ9jngHIIzPq
 gYk9X3KNmQ3IDj30hYmTWUe2bnpNRktvcYQD6xwZYdl41c9Vnr7csPBERPSN+n1/F4dN70T1+O2
 rjrvwCnrgPxMRa1HNCQY+xXtdlx8KxP74SVjcJsxfKLdEOCGLMJWL1Zs5eMuwija6bqN/EiLgvk
 z1GRQSliEaFqMgZc2lr1RIkYhI02s0cR+S0E/oZi/i5zr+F2gK9nGPhzcp7EjLqjxnh4Yu79c9V
 lOAlyyA10DeGTQl23CUeIBxFD9sjI01isQbq6nchjIwqEAUshrIsROo3COUtqagGTlvyR6DEiAD
 f7zT9qcQQtO2DKXO5EMPg0QGiwAMVIQwEOIwngsEJYGvZ7xm6EmyCh2fEmJtQW4vzGGWOXJZtAF
 dHvb3+adz1FMxfQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Two streams related fixes for v4l2-compliance.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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


