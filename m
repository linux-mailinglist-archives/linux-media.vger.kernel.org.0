Return-Path: <linux-media+bounces-44437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E01A3BD9AA6
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 15:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8CFCA3556CC
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643BF314D15;
	Tue, 14 Oct 2025 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vYZW3A2a"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002FA1C84AB;
	Tue, 14 Oct 2025 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447989; cv=none; b=li/Uqftx4yBdjJRqlLNglKEZKbtavBlHcw459SCsunNe6tYdM+6Ix270ezh5Gz3GEtLSPVwkJSYgS5SIJbLjqEMp2+I2vRCslcasn8CFY4N1ba09H8XtZPAKGnliLU2GKl+ZsmAIMppcUL1Xlo2Dmp1IEz3W6CLpAvaXPCUEEmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447989; c=relaxed/simple;
	bh=kWOu7e1w1cCAlaL468RTI3QNSoUUrTM/wU169Sfem5U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uU2WFU6TOepEWozuYcJPbxjPfeNDqywzDUwVyAZAHH8lU6r/y2m2Niz3R/YZ+Uo+3B9Qfly5jRioIrNy2n5xtVXMxFnNFD8Qzyz3dlJ+93JAGvPaoz2b3+R7bpssJzVCqxX/Ju3zKrhVCUIvUP45+2nVjg5IlXdRP5kOcgC5rfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vYZW3A2a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EF85C73;
	Tue, 14 Oct 2025 15:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760447887;
	bh=kWOu7e1w1cCAlaL468RTI3QNSoUUrTM/wU169Sfem5U=;
	h=From:Subject:Date:To:Cc:From;
	b=vYZW3A2aU9QAJBzBg6sr4jNplhQmViA8CCkz0XKAyXTepZgZfD9XypvMTv1Vj0dh5
	 g7wdp+ofsug1AJzHakua8jjP2kFdvyPrQVJ3VHQX50cIevwaJM2jF8B2tV/hquiNWv
	 AHA4F50kq0WlT0qmlVZ8J5b3/TU2J45Ycz4YWDeg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH for v5 0/2] media: pci: Fix invalid access to file *
Date: Tue, 14 Oct 2025 15:19:32 +0200
Message-Id: <20251014-cx18-v4l2-fh-v5-0-e09e64bc4725@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAORN7mgC/33NQQ7CIBAF0Ks0rKUBplDqynsYFxQGS6LFgCEa0
 7tLujKmupnkZ/68eZGMKWAm++ZFEpaQQ5xrkLuG2MnMZ6TB1UwEE5Jprql91FG6i6B+oj0ao/g
 weOeQ1JNbQh8eK3ckPqamqJZrcqqrKeR7TM/1UeFrYdssnDKqPHIJvWKjxUNwaHKcx2iSa228r
 l4R/wxRDfASLHYClIIfBvwzoBoShWfagzXO/jC6T2P4MrpqDG7kCqRTve43jGVZ3pEAxcOGAQA
 A
X-Change-ID: 20250818-cx18-v4l2-fh-7eaa6199fdde
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=kWOu7e1w1cCAlaL468RTI3QNSoUUrTM/wU169Sfem5U=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7k3wFPG0lwdcKvdRDzFZaUEblL8SHh8zTTela
 cdjFNTniRSJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO5N8AAKCRByNAaPFqFW
 PF+DEACfMjsThBVt0zUy18dzMRypo5SltMO+Rmeam34tX43bpxKEpTchFjiTDlT5vxJ0M9KeY4X
 1wcV86hLtIaLca7qOvzOoe95oSBN37FqC/TiilrzB/cZRx76Nv+ITgjMGhWmRiV1m+OPtd919kl
 iAf2PHudpWiQjEef3Pvmsbr6IvE9fdatLP4QJwuNCWWRIs3QGGBMbaCBQt7dE/J5LV9LdWUqBws
 AJ4Ui52Pg85/QFyJTGg0s1ogDPMLsMYcEXy0DRpjAfO1R0cQm2SepjmJc0SybIKUvI9Lw22cwy4
 2d2NcIg9Zn4E/J5GUcOuMLw/nnRuRVyo363RCkPrZvG6RGZBjeqLwyQltwITjGVyz0g7kOmhCWd
 87rLaida90R43rdmjTn2mFdrGosARXWhTqcfnwCX8TKW3enq89X8NmtuA3ktcG5jsU9cJ+m9l5U
 mLwLwY9kV3k9vYSyz5WvOHmW7ee1Ja1ht/SVpCWt7CvvcqivEd4n0p6aG48r/++J4Qu7V/h4MU+
 NLNq5NbEso+tDaGABnqChAq/FIwGOMOQEL5Dnpq18qz4REHZuQcEQ/Dw5KisnyByQ/4hhlkKC1U
 eZC+4nfTlHLU5q4yJtCl+SzLCyllEAmvnOXba1NxSw3IN9J0PAUN9YFiZleVMlzM4XOPmbQlPoJ
 s7aXin68xGeKXWg==
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
Changes in v5:
- Remove stray link from cx18 patch
- Add Hans' tags
- Link to v4: https://lore.kernel.org/r/20250819-cx18-v4l2-fh-v4-0-9db1635d6787@ideasonboard.com

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
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250818-cx18-v4l2-fh-7eaa6199fdde

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


