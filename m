Return-Path: <linux-media+bounces-45570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6524C0ADF7
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 17:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1D2F3B05F3
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 16:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78C629D27E;
	Sun, 26 Oct 2025 16:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhrcF4Vv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D4819D065;
	Sun, 26 Oct 2025 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761496988; cv=none; b=WCQ2q24ClZyAs0S1lFVHV/L+3WsAwyEx/Maxl6unkuyvvMV+QvZe6oJFTnQlfAQk6kVGpSc8dQ4W2LSS5r+myeeMUqHi2kkx+gqmKK/tG89ROvtyUFmGbm7vnQIh8inW52gIKu1to1phaCuIbPrNR4nWmJ7uDYJFdzQgMAOnAr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761496988; c=relaxed/simple;
	bh=k/7TZI9MaeLcnsEULYSl0PNNFCT1m0p+1qssnCP/zuI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M4ma7gbaXzsV9em1UIchDTHmeDxgf07Murgkp/cFnZk5mQOOwCG5JkhZ6zH8oszCjafyUImL3k497rKutjAXCcO6RedLb4uHA92Ix7mE0q9fP0p/bLjLCEIJB/genfeUX7zs5aT8y2/5yZHc3vwFWkIUewiSFLilrFe8y6xSgEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhrcF4Vv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90DF3C4CEE7;
	Sun, 26 Oct 2025 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761496987;
	bh=k/7TZI9MaeLcnsEULYSl0PNNFCT1m0p+1qssnCP/zuI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZhrcF4VvEFiJLzdSwPtl+DuoWUXYr6QyVrcUWqj/fPVwBCHB5OPiJI6HeFgEHhssZ
	 NLj5WiEq97F46i6gdkg243gXn0mV8bV4F5oENecakE9MbIlpxkhiknkabTOyluGpAP
	 xNBAqp5Ibi3hdtqU/xzTz1JuWpYARP06kRsPRUWivMzAHe/fF40vWof1GBCeldGdrJ
	 RSHYQBLEy8wnvPmlQ6RbV3fvgzJ07NE01HNXMBpjHRBZssCTubAQ5tZhru73hdLdgW
	 khoF9gzCZf0QNXcJXGUBqDh8PA9l7G5OUp1h4OEpka8q2ybJctKEb/Nouu+KnCtu1a
	 +drLLegm24FLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866FFCCF9E9;
	Sun, 26 Oct 2025 16:43:07 +0000 (UTC)
From: ymodlin via B4 Relay <devnull+yogev.modlin.realsenseai.com@kernel.org>
Subject: [PATCH v4 0/2] Since Realsense has been spin-off Intel, the
 comment should be change.
Date: Sun, 26 Oct 2025 18:43:01 +0200
Message-Id: <20251026-fix-uvc-v4-0-610eb1329600@realsenseai.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJVP/mgC/23MQQ7CIBCF4asY1o6BmVasK+9hXNBhVBJtDSjRN
 L272E1NdPlgvn9QSWKQpLaLQUXJIYW+K6NaLhSfXXcSCL5shRproxHhGJ7wyAzYkPUtGXYNqXJ
 9i1K+ptL+UPY5pHsfX1M4m8/rbyMbMCAVe01rvbZU76K4S5IuiQsr7q/qU8r4rWnWCBoMN7SpC
 Wvr+b+mb13Nmopu7XFDrA2ys796HMc3WDsT/iABAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ymodlin <yogev.modlin@realsenseai.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761496986; l=1203;
 i=yogev.modlin@realsenseai.com; s=20251022; h=from:subject:message-id;
 bh=k/7TZI9MaeLcnsEULYSl0PNNFCT1m0p+1qssnCP/zuI=;
 b=I1lFqcUO+oQPu1Wcr4buBhXP1zaLw6fPjt4XLadAL5ILz9hl7m59LqaTOnZAoVdZnD0Bkdfms
 IIYgow0/bvADLJER3Kn3lLPhX7iqk8HUN54h92zhVPBz3INN02bjVnx
X-Developer-Key: i=yogev.modlin@realsenseai.com; a=ed25519;
 pk=V3EENbzJJO6YkqjrHtGmN67ulKS2b5TU7Ze0hVi1G1o=
X-Endpoint-Received: by B4 Relay for yogev.modlin@realsenseai.com/20251022
 with auth_id=549
X-Original-From: ymodlin <yogev.modlin@realsenseai.com>
Reply-To: yogev.modlin@realsenseai.com

Signed-off-by: ymodlin <yogev.modlin@realsenseai.com>
---
Changes in v4:
- reorder Intel RealSense camera according to vid/pid.
- Link to v3: https://lore.kernel.org/r/20251024-fix-uvc-v3-0-b7f83c012ca7@realsenseai.com

Changes in v3:
- Add metadata support for D436 and D555 cameras.
- Realsense D555 has been released to the market earlier this year.
- Realsense D436 will soon be official it's currenly being supplied to
  beta users.
- Link to v2: https://lore.kernel.org/r/20251023-fix-uvc-v2-0-1c93853257dc@realsenseai.com

Changes in v2:
- Fixed commit message formatting
- Write 'Intel RealSense' for D400 family of depth camera comments
- Link to v1: https://lore.kernel.org/r/20251022-fix-uvc-v1-1-e4cd03606735@realsenseai.com

---
ymodlin (2):
      media: uvcvideo: change comment to 'Intel RealSense'
      media: uvcvideo: Add D436 and D555 cameras metadata support

 drivers/media/usb/uvc/uvc_driver.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)
---
base-commit: 552c50713f273b494ac6c77052032a49bc9255e2
change-id: 20251022-fix-uvc-2937db31ca93

Best regards,
-- 
Yogev Modlin <yogev.modlin@realsenseai.com>



