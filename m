Return-Path: <linux-media+bounces-28224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2F6A61293
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 14:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8472418943D9
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 13:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA5A1FF7DB;
	Fri, 14 Mar 2025 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="e8HuVzn+"
X-Original-To: linux-media@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9812FF6F;
	Fri, 14 Mar 2025 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958834; cv=pass; b=AlSU1FOuJlEoOAjD18xSR8q/v1L6gudDr4JrMtRxGP1juFJ3vsABUOJVq01t0mWd2gbDCSpgkmZAGRuCMBH5PhhgvsveqLul/BxXvLh1ou1dFYfYLRfRjMT6LqUyszaA0f42ue31v2dyAXrFp3LkIeu7NHsuF9tgWu3JfQkOq6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958834; c=relaxed/simple;
	bh=Xp0Y8pHU3fv/bIXLAawK95MaSBrGEYjOs4pySFviY/w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q48YmewAEbMoimHxUYehE6y0xCFDvxKN5bwKIiSEaKDKPPR4ZjJx9Za/4fFuNtjggqrdkxMXWV4qX3jD8FZHbhCMYkdu5p8SSf4ZC1v59t3A4DcvtKb7xr4T4OLxaa7wiAeyls/0OVfrSXKveJIEj5Z0r/qTmVfl1+f9SvF8BPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=e8HuVzn+; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741958798; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D4k3SKsVi5dF8Z3ZB4rjnk6FXSb8ROD01yQSVBAcAm46+r9Rk7SRAbIJ6MQv07q8S1LSSg8TXuJousZ8TmJq6zDyYryNfkab3SWxrsn4h6K/T1VJgnY22rigFDVRgFIKLyM3b0+7DZt6aSomlfBL7QV2ZG7ryXCeWXbBsVFzL9w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741958798; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TFP7XQ1cObdqQ6De6eSsgjYNzHKxK2Nt4AObjojPfNo=; 
	b=ihm1Uo8exTE5IABlu3X5y8qdKU30rmWh6Ur83wSEQy7JNbyR5qb3uL5z0jIE3x45f5YpRfK+6honuCaYvUztaL1MQPzCZDmua5z7xcTFsSPUG8sLLPD2AxKUsPMjf1zYMKnySvLbECuitGVqK1XyPjFOlI7Q+pa5bAW79c3XMqw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741958798;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=TFP7XQ1cObdqQ6De6eSsgjYNzHKxK2Nt4AObjojPfNo=;
	b=e8HuVzn+uMJOmOW7EN341A6UjAQkT9ccnM/Tw2WnM/Wz7ZDoRNKTyETONJgq4Gsk
	+GcnhLxcvKVjru8HwuU4j1nJgqRx4JVIzTtqey3QO022T0sMu56+a9SRH+QKyqOH2uW
	EDC819E5xZUpFRcGzCQJJCEaa3KSEtWDFxpsqnRk=
Received: by mx.zohomail.com with SMTPS id 1741958796725877.1323443038518;
	Fri, 14 Mar 2025 06:26:36 -0700 (PDT)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCH 0/5] Add manual request completion to the MediaTek VCodec
 driver
Date: Fri, 14 Mar 2025 14:26:25 +0100
Message-Id: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIEu1GcC/x2O0QqCQBBFf0X2uQVdy6JfiVim8ZpDutrOaoH47
 y09HricezajiAI112IzEauoTCFDdSgM9xSesNJmNq50p7KunFU8SJNQ6KLwC3blqQX7kcJCg49
 4L9DkeRrnASnL/EdS7zVRQh5xLwG2qRvH5+5SUnU0+WmO6OT7r7jd9/0HIUjRl5UAAAA=
X-Change-ID: 20250312-sebastianfricke-vcodec_manual_request_completion_with_state_machine-6362c7f80a14
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741958789; l=3501;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=Xp0Y8pHU3fv/bIXLAawK95MaSBrGEYjOs4pySFviY/w=;
 b=3QIJWz8aO21ikn7G/sTIYXAiWCA335VBVJ6d1vE+9/medWSofWgVGyuBgGZC7ZJa/b73S13ls
 ZkS/Y9WunT3BVM1lwJ4dQnDfWRlQ+VNg5hKS73rldUKBA7XZligWjVL
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

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
---
Hans Verkuil (3):
      media: mc: add manual request completion
      media: vicodec: add support for manual completion
      media: mc: add debugfs node to keep track of requests

Nicolas Dufresne (1):
      media: mtk-vcodec: Don't try to decode 422/444 VP9

Sebastian Fricke (1):
      media: vcodec: Implement manual request completion

 drivers/media/mc/mc-device.c                       | 30 +++++++++++++
 drivers/media/mc/mc-devnode.c                      |  5 +++
 drivers/media/mc/mc-request.c                      | 44 +++++++++++++++++-
 .../mediatek/vcodec/common/mtk_vcodec_cmn_drv.h    | 13 ++++++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  4 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 52 ++++++++++++++++++++++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  4 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 52 ++++++++++++----------
 drivers/media/test-drivers/vicodec/vicodec-core.c  | 21 +++++++--
 include/media/media-device.h                       |  9 ++++
 include/media/media-devnode.h                      |  4 ++
 include/media/media-request.h                      | 38 +++++++++++++++-
 12 files changed, 244 insertions(+), 32 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250312-sebastianfricke-vcodec_manual_request_completion_with_state_machine-6362c7f80a14

Best regards,
-- 
Sebastian Fricke <sebastian.fricke@collabora.com>


