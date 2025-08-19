Return-Path: <linux-media+bounces-40225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA048B2BA32
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 470DA3B02C2
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740D42773D0;
	Tue, 19 Aug 2025 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rgzQup1X"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631B31DC9B1;
	Tue, 19 Aug 2025 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755587241; cv=none; b=tJq2Lc1FC54sCR52rNRxqCxLH5qpdberxSN+1m8Ctwf4YA53Wf20PurbWb9Lx3udA2o6xu9Nw8IO5dnmBay6KJkAmvLeXKaQ1Li7URUlCfjukJZv0Wn3NYZ3nr1w+fpL6mEoWbjgSZZqcY0IB+l0iO/H92uqZgF1ZF1s4yAlOHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755587241; c=relaxed/simple;
	bh=mLPmUM3qzz4rXeh01LoNrL5mE2/ePoL835QSL3kCAQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G7iqrysMe5UDZBNzn4hAR5VHmjMtmUfmyiefsUSzwL9g2THiVHfxhJecjz4qADOOYyJB0MavBccdzcRiHcregIWYJHm0QGPGGyuZ09EUo+51S/fkLv2UIymq0FcIrKMB6XO4bOzMavSkIEYVyNs5gzTwXkq4r6XMVcTRFrbZ8BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rgzQup1X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CE19596;
	Tue, 19 Aug 2025 09:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755587181;
	bh=mLPmUM3qzz4rXeh01LoNrL5mE2/ePoL835QSL3kCAQY=;
	h=From:Subject:Date:To:Cc:From;
	b=rgzQup1XpTJweLk/KIkRrK5yXoPL9hJMSOfJKQUhZnyNXpeoFnEeHRM9SeHbw8iKR
	 /Uk2Kr54KL6UaNDZpuRV+StCTSAFJtv8KCKqX4WMshgm+YdykB+M04juHgRB9jxJnf
	 s+ZmxogZAnyhQO2IgSAdO0HjKsHjvL7205FFAw5Q=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 0/2] media: pci: Fix invalid access to file *
Date: Tue, 19 Aug 2025 09:07:02 +0200
Message-Id: <20250819-cx18-v4l2-fh-v4-0-9db1635d6787@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYipGgC/33MQQ6DIBCF4asY1qUBRlC76j2aLhCGStJKAw2xM
 d696Lq6meSf5H0zSRg9JnKpZhIx++TDWKI+VcQMenwg9bY0EUxI1vKWmqmcXD8FdQNtUGvFu85
 Zi6RM3hGdnzbudi89+PQJ8bvpma/fHShzyqhyyCU0ivUGr96iTmHsg472bMKLrF4WR4YoBjgJB
 msBSsGOAUcGFEOicKx1YLQ1f4xlWX5MxdVlNwEAAA==
X-Change-ID: 20250818-cx18-v4l2-fh-7eaa6199fdde
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=mLPmUM3qzz4rXeh01LoNrL5mE2/ePoL835QSL3kCAQY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBopCKl4wNMTO1vyexdT5xHCes6CMQ6faJQb/QMv
 38wDdvZVkWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKQipQAKCRByNAaPFqFW
 PBCTEAC8JmAxflw0kbwVBqRUfS+Og2XWpm+PB+4UuURLO63NF9+ctK8HW121jRtfvaDjvny+k8H
 46rkpLZQ1msYijIm56Rp999A0Nf9RxRd7t5loKTCo/NyjWwddWBxRiJkbAOVlrcnsZYhQnklOcf
 ny05cO9JicIqu7x3xTucpDunj92e8pCf18lXLXrcrw9wZz30Lxv65PmsBvpYT+X18rk94QQ7p+Y
 7vKs7VFtRc1AWEzhyN/Ivu/ZZZw2Rjwk0HC1Y3/v6cXdX/CDmEv7PRaGF7QqdhmSW6kgd7WXlsw
 gDxWgBtdHcsXZDotBCSqC7SM5H7SLKZ6SoiAd77uOt+ceCcmvF2ijVnnQG9NgJZ5yzHEE3WN2JU
 KMEwRvWTqWgZa7VCAaTrKiuH9zhf4cNPgljPDPuAdTOvAuRYdj8I32qVygQ9ou3WcsfS5sniy9X
 E0c11zwnQYTZQ0qazeQojKQtfRpimy8unfJtrdGDewDZO1Hh5q/Np/KDQaOiqEdJyFnSaUQqNpo
 BYihxtxpML4SfeztxUT+9KJ0in+Kmie16oRgsF163j5vBKQP2KnADkv/t8spTSclJ15D2iKgNNk
 L1TY3c24915TCpCeJAIAu2rDCJ0dH8/OP8U+fppioNaek+9C2iZDzcmIekr0JNckLnxR7hzmZE+
 SC/GlUGHRISaeeg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Since commits
7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")

All the ioctl handlers access their private data structures
from file *

The ivtv and cx18 drivers call the ioctl handlers from their
DVB layer without a valid file *, causing invalid memory access.

The issue has been reported by smatch in
"[bug report] media: cx18: Access v4l2_fh from file"

Fix this by providing wrappers for the ioctl handlers to be
used by the DVB layer that do not require a valid file *.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes in v4:
- Slightly adjust commit messages
- Link to v3: https://lore.kernel.org/r/20250818-cx18-v4l2-fh-v3-0-5e2f08f3cadc@ideasonboard.com

Changes in v3:
- Change helpers to accept the type they're going to operate on instead
  of using the open_id wrapper type as suggested by Laurent
- Link to v2: https://lore.kernel.org/r/20250818-cx18-v4l2-fh-v2-0-3f53ce423663@ideasonboard.com

Changes in v2:
- Add Cc: stable@vger.kernel.org per-patch

---
Jacopo Mondi (2):
      media: cx18: Fix invalid access to file *
      media: ivtv: Fix invalid access to file *

 drivers/media/pci/cx18/cx18-driver.c |  9 +++------
 drivers/media/pci/cx18/cx18-ioctl.c  | 30 +++++++++++++++++++-----------
 drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
 drivers/media/pci/ivtv/ivtv-driver.c | 11 ++++-------
 drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
 drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
 6 files changed, 52 insertions(+), 34 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250818-cx18-v4l2-fh-7eaa6199fdde

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


