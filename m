Return-Path: <linux-media+bounces-29943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B507EA84829
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 17:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 953E71B6018F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9327C1EB1A1;
	Thu, 10 Apr 2025 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QhZrEgNc"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98A21C8631;
	Thu, 10 Apr 2025 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299605; cv=none; b=YYyFhtCfzduQp6HyxmwRT77RPa8UTQYTZ+98qy639IPhIc4mbxQVrOt1tcMSVulXIHF5yaiPmFmmNlTRt8yRUKOUWKcTjNY7TwMfCSn01u8iNoLPxMhlyVdSkTpfw3/8f5AUPbqgIr1G1hnKCikJoDTqRiNXgjoVKM/LjNkUGDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299605; c=relaxed/simple;
	bh=tPergy+7vln1jvxL4YHdDb/GQY/NPfI0GdgYCslJK/k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QMP0lB/9+pVpejoCE46AXWI0cc/mHdcI8i67GftztFeBmE/fsDkBhxq8XuBpsw8TK3z6T55N+BjLBNTQeqorbPQD8gSRteuRnUdD/NLc6fMQBauNsIJJA/Vc9BSQ76HXUr453XnpS1/OCRm9AE71TJkcu+yqWHHzHpz2imCpXU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QhZrEgNc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744299601;
	bh=tPergy+7vln1jvxL4YHdDb/GQY/NPfI0GdgYCslJK/k=;
	h=From:Subject:Date:To:Cc:From;
	b=QhZrEgNcjDYjrV1DCwmAHSqUfYZ/XvszBg2F0NauJeHOYpmVscW7dcPcq8LyY385r
	 LfelS4Ax3Ne5siHXzdb4cesGA8IWTAALhutIVtXaXOmJyz6hfRGQ/ikPEroaOa5tEv
	 9znFNcYbh6VxeYQRwvxofYNOzYE7B2D6CNRakWlWzihgkHyRZwGOuWKY6LjPutGiJI
	 usqSjAchJscFEs7AbDUdpxyEvFM6eEnksIm+JJnbNxSC6tgMoZZ6szeUCqMB0X/8SZ
	 D0hlaoXnS0RA8G6Zj3IhgaaY2oHjPasymn3y8RRildjMaSjVyla1D8yqzoxE4oNZ+U
	 +WIJPoqHUdOAw==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E092B17E03B6;
	Thu, 10 Apr 2025 17:39:59 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 0/5] Add manual request completion to the MediaTek
 VCodec driver
Date: Thu, 10 Apr 2025 11:39:55 -0400
Message-Id: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEvm92cC/62OWw6CMBBFt2L6bQ2Ul/rlPgxphjLIRGixLVVD2
 LuVxB34eW7uzLkLc2gJHTvvFmYxkCOjI4j9jqke9A05tZGZSESRZKngDhtwnkB3ltQdeVCmRSV
 H0DMM0uJjRuelMuM0oI/P5JN8L50Hj7GketLIy6wUquqOCaQ5i6bJYkevbcW1jtyT88a+t1Eh/
 aY/f/4Xf0h5wgsUVQVZW56K5qLMMEBjLBziJavXdf0A871mERoBAAA=
X-Change-ID: 20250312-sebastianfricke-vcodec_manual_request_completion_with_state_machine-6362c7f80a14
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-media@vger.kernel.org, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2

This set introduces the manual request completion API by the author Hans
Verkuil and implements it within the MediaTek VCodec driver.

Why is this needed?

The VCodec driver supports a hardware containing two separate cores, the
CORE and the LAT, these are working in a serial manner without this
series. This series solves two issues, the first being that the current
code runs into a problem, that occurs when the last request object is
unbound from the request, before the v4l2_ctrl_request_complete function
is called, causing an implicit transition to the COMPLETE state.
This issues has been found in applications which didn't attach the
controls for the very first request (which is supposed to enable the
driver to sniff out the correct formats, etc.).
The second issue is that the VCodec driver can not utilize the full
performance of both cores, when the LAT core has to wait for the CORE
core to finishing processing the decode. Thus by enabling the LAT core
to process the next bitstream, right after processing the last we can
increase the performance of the driver.
With the manual request completion API, we can separate the
completion of the request objects of a request and from the completion
of the request itself, which allows to send a new bitstream after the
LAT core has processed the previous and while the CORE core decodes the
previous bitstream, so both cores can work in a parallel manner, but
while keeping the request alive during both steps.

A new state machine for the VCodec driver ensures, that all necessary
processing steps are handled in the correct order depending on the
current step in the execution. This state machine has been added to each
request to ensure that new requests do not alter the state of still
ongoing requests.

Additionally, this series adds a small patch to avoid trying to handle a
scenario, which is not supported by the hardware and thus runs into a
timeout.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changes in v2:
- The implementation patch for V1 was using an outdated version of the
  "media: vcodec: Implement manual request completion" patch, update it
  to the most recent one which doesn't use the state machine globally
  but instead per request, thus having no conflicts between multiple
  concurrent threads
- The kernel test robot found an issue because a function which I only
  use locally was defined without the static keyword
- Link to v1: https://lore.kernel.org/r/20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com

---
Hans Verkuil (3):
      media: mc: add manual request completion
      media: vicodec: add support for manual completion
      media: mc: add debugfs node to keep track of requests

Nicolas Dufresne (1):
      media: mtk-vcodec: Don't try to decode 422/444 VP9

Sebastian Fricke (1):
      media: vcodec: Implement manual request completion

 drivers/media/mc/mc-device.c                       | 30 ++++++++++
 drivers/media/mc/mc-devnode.c                      |  5 ++
 drivers/media/mc/mc-request.c                      | 44 +++++++++++++-
 .../mediatek/vcodec/common/mtk_vcodec_cmn_drv.h    | 13 ++++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  4 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 50 ++++++++++++++++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 19 ++++++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 69 ++++++++++++++--------
 drivers/media/test-drivers/vicodec/vicodec-core.c  | 21 +++++--
 include/media/media-device.h                       |  9 +++
 include/media/media-devnode.h                      |  4 ++
 include/media/media-request.h                      | 38 +++++++++++-
 12 files changed, 274 insertions(+), 32 deletions(-)
---
base-commit: 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b
change-id: 20250312-sebastianfricke-vcodec_manual_request_completion_with_state_machine-6362c7f80a14

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


