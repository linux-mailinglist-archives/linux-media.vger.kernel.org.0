Return-Path: <linux-media+bounces-40150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABABB2A3BA
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22C7A3B31A8
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C653831E11C;
	Mon, 18 Aug 2025 13:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eq8FtS2O"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7F3218C2;
	Mon, 18 Aug 2025 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522408; cv=none; b=V2agYYN948T0DnmFD4YjhaUrgddm8jlN9aB6LVrYARVQZ+rvKqJziNPtd2HNnEGvL+ihRH8HpI7dsterxW2OwUQuqBENWJP2E28HJR7cSkNoWjULvZcHROWBzw7az1nMlKbdQAp+nasvfc0dXkp9CZeWNyPJf0F6m1pfhbncdus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522408; c=relaxed/simple;
	bh=3Jf3ZeC9gG+RbAsn8dvc1PeS4APZDud4jhCGpNeW/G0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OlTPNF7s9AvXGg14F1jR5phaqbSkbilxqN6ry6Wvu2l5kO7iao2XhXvJSn3PYH3DmxAknzSNfrjpzJ1HydvT97LA01m/ViaBAbxZO+sizUhqyAkoSTqv4JeRVVggiMxZjZ3hpuWbmXG9c7hgnb6JWaDsOKv/Jt6UR6WDadBy9Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eq8FtS2O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-51-68.net.vodafone.it [5.90.51.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 577971249;
	Mon, 18 Aug 2025 15:05:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755522348;
	bh=3Jf3ZeC9gG+RbAsn8dvc1PeS4APZDud4jhCGpNeW/G0=;
	h=From:Subject:Date:To:Cc:From;
	b=eq8FtS2OJKQV8ctUEvRGPFsVPqD15J76rG2UfRct9slPWoN6HfKvKS8Ge2Kkw/pY/
	 318bVfka8iwdMFfOPGt4nOuJvMGCZXKI0eaCWL1oyHjzxnJ6Emb9LLbPufdio3q69H
	 aXbGrI52XIdfNk2OOfqKg1NQpKgLfjzKNuCRJdW8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 0/2] media: pci: Fix invalid access to file *
Date: Mon, 18 Aug 2025 15:06:34 +0200
Message-Id: <20250818-cx18-v4l2-fh-v2-0-3f53ce423663@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFolo2gC/3WMwQ7CIBAFf6XZsxhAS1tP/ofpgcIimygYMKSm4
 d/F3r28ZF4ys0HGRJjh0m2QsFCmGBrIQwfG63BHRrYxSC57PoqRmbVNOT8kc54NqLUS0+SsRWj
 KK6Gjdc/d5sae8jumz14v4vf+CRXBOFMORX8aFF8MXsmizjEsUSd7NPEJc631Cxt8V82vAAAA
X-Change-ID: 20250818-cx18-v4l2-fh-7eaa6199fdde
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=3Jf3ZeC9gG+RbAsn8dvc1PeS4APZDud4jhCGpNeW/G0=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBooyVjja0Di4gin36T06v/Jjoe4chA5u3FuAYBP
 nlhPXYmyy+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKMlYwAKCRByNAaPFqFW
 PP0uD/4nhsK9/vBAW+b3d9cIO8gfNOB+vNVr5xHQwLEi7gi0gJt0hfyMZ+K7q8jmHsXOwGlzbkH
 DeLn4gWyTJu8baW8Fs1mZrrF7dZQR3rKGF25S9NDCwRUW+AnqBvw9sYtWfVqjs8djSzwWjocc9f
 ztrWaBh3tH7Bc5TtJdYcmrUx8ACDqeOxKK+kxricvajw01PE9Qck+72tl/KK4JCgHlfxDZnsaes
 C/1h0Gm5mWpOb8AeXfHRX/41kFmRg/1Hux/7+inPwSfc5ReTkdDABqpMvCbyX8LbP71z7rmxrdZ
 bhgGLlxQ5h8Tcd/P/U4FRcnERZ1wa+uPSEGHLtKW8wz8GW66R8ha+g2EyQlGiah45C7ekK3B5yH
 uKtoALswwJAi4NVk1BYDtyek4pJeOiV9c28Aa7bBKflb5bpJgV2s5bWXd6MEiS07bEKxXzB6hY+
 M74VXDQ3Vu74vOGpu5wjXJFEhXbMhC/o9KJWK8WwGNkDqnsbgsHYW6UGBYfhdtTH8TmXHz2p54D
 sGD82wbXGyhK+xNsjW/8eppH1UpTLWsegWKinEuHyf8EXUWnLWtXuz6i+H6/z2A/TaAP8J9kkMG
 OoRbgHB66QPqhoIMSgddFN3sd1obAfAROqPG+itNSi0h1DCTQWtIHv0lYfyFyx3xNsZka3BYh1v
 c5s2NZ0ydGuG3OQ==
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
Changes in v2:
- Add Cc: stable@vger.kernel.org per-patch

---
Jacopo Mondi (2):
      media: cx18: Fix invalid access to file *
      media: ivtv: Fix invalid access to file *

 drivers/media/pci/cx18/cx18-driver.c |  6 +++---
 drivers/media/pci/cx18/cx18-ioctl.c  | 26 ++++++++++++++++++++------
 drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
 drivers/media/pci/ivtv/ivtv-driver.c |  4 ++--
 drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
 drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
 6 files changed, 51 insertions(+), 21 deletions(-)
---
base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
change-id: 20250818-cx18-v4l2-fh-7eaa6199fdde

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


