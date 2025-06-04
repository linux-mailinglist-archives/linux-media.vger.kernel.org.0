Return-Path: <linux-media+bounces-34071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 666CDACE58D
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 22:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DFFC7A2F6B
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 20:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5779D220F41;
	Wed,  4 Jun 2025 20:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fP7+jXAV"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88CA1F4C8A;
	Wed,  4 Jun 2025 20:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067807; cv=none; b=hu494GATjjOvTC6b70qqFDB03X9oTwsncE60gSkRcepUWjTy5DcJAA6Na2ChajzKBDHrsuRCimtB+zMqNr+TSPZdfjIlw31ZWp7OCNuC9/nyQnTeNEi6XImUchrZziCOvJ9wsitBXZK7h4l/drCybI2XGq5AVsfOWJjb0ZxSkxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067807; c=relaxed/simple;
	bh=TvPaiU8NbgI1edZZoqcyPZfKJS3ol0kOtDlVb7mFRpI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OvPsxege+wwlkEv/RKDojr3Fy2ybD6MNqJibo/mCYIb+amhqpA6X55F4MHyK7pMAfjxbtvdhTvFJpgm5IB1BDgkMFbzji46dbMLNtUoQuurunjE7bls3VZ9buIxG4ZuRdFTcbLyeAMClf23jovejAXrorfLaDpUMRTjRx84k4t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fP7+jXAV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749067797;
	bh=TvPaiU8NbgI1edZZoqcyPZfKJS3ol0kOtDlVb7mFRpI=;
	h=From:Subject:Date:To:Cc:From;
	b=fP7+jXAV7SvFkstO+ZU4JIGTI0zv+Lu6TEnZt0VXGODsGWCI+DKTvsqQVx7SWQxeZ
	 XqcXxX3m2pdMiA+Ys6Vq03uovlShr+qrg0f3oLfGbqm80wRFCwhqKfH2nYrAXzsFQS
	 7cAAC7CrNTVEDqKvpXqtHQJhJ4k9TZQRzaS/5St9fMspaXE2fHYKVxSb5WM8SmdVns
	 6LnHqNCxgXwX9o1zmjTvPdoHAFHAH+I49Waf86z7wjdNLGOHEYb1X3S0W+kDdUSJ28
	 7FaxOp0ncA54eb40UoeW7zRtGysKsp0FtlvIlYSgvJt+qLpDJ9PQ1WXYE3Htq2x4DY
	 Z/d2BdG4vA4zw==
Received: from [192.168.13.145] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EEBB317E0536;
	Wed,  4 Jun 2025 22:09:55 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v3 0/5] Add manual request completion to the MediaTek
 VCodec driver
Date: Wed, 04 Jun 2025 16:09:34 -0400
Message-Id: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6nQGgC/63O3WrDMAwF4Fcpvp6L7fwtvep7jGEURVnEUru1X
 W+j5N3nFMpg1708QtJ3biJSYIrisLuJQJkje1dC9bITOIP7IMljycIo06hKGxlpgJgY3BQYP0l
 m9COhPYG7wmIDXa4Uk0V/Oi+UyjP7xWm2MUGisoQzO5Jt1RrsplcFuhZFOgea+Pve4u295Jlj8
 uHnXirrbfrw66f4WUslGzJdB9XY9s1wRL8sMPgA+3Iptg7Z/Lm1Vs9xzeYOfU+o6kZR+99d1/U
 XIA2GWJIBAAA=
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
Changes in v3:
- Patch 1: Applied suggested documentation fixes to the manual completion API
- Patch 4: Moved MTK VCODEC request helper into the decoder driver
- Patch 4: Matched MTK driver namespaces
- Patch 4: Set MTK request to CORE_DONE state if LAT failed
- Patch 4: Dropped Angelo's Rb, its better to review again
- Link to v2: https://lore.kernel.org/r/20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com

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

 drivers/media/mc/mc-device.c                       |  30 +++++
 drivers/media/mc/mc-devnode.c                      |   5 +
 drivers/media/mc/mc-request.c                      |  44 ++++++-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |   4 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  29 ++++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 146 ++++++++++++++++-----
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  21 ++-
 include/media/media-device.h                       |   9 ++
 include/media/media-devnode.h                      |   4 +
 include/media/media-request.h                      |  40 +++++-
 10 files changed, 292 insertions(+), 40 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250312-sebastianfricke-vcodec_manual_request_completion_with_state_machine-6362c7f80a14

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


