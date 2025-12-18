Return-Path: <linux-media+bounces-49060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E5CCB2B1
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 10:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BB58302FA2A
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 09:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0742E7650;
	Thu, 18 Dec 2025 09:24:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E11221FBA
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049850; cv=none; b=GjdbO1+g/8bTKXIj9/fOdf3oDFG/oLPps3tpmcJVjSWMn4o1MTh9/Jc5s+ONdYblDciCh0fKVIggPz2wCmCCUpC8VoLtZlcDVSV+IlMyUWg4cZAhM6CzNm84j/XGDgkjNR0dAFTxS/TK7YXQ8E4U+HN/XUn3ZC5EqiJfW37766Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049850; c=relaxed/simple;
	bh=a7ZN0BgPf1WahBqihGGqSVnKRzkNOJHjpkqofkRgfw0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TvSAV843x5meyQcxZDZny4WzT9ZV3i6Y+q2BlERysMcdiN6B9u12RIst1Y6Io1FEgpxJg1TLNw4VeuXmRH6BW44g2huk9+nxjltvwV7hsXz5D1bFpf7lyV6XyYfFCz1/JTs2T/Un5kkRtdRsjMqe8B39rnLhEF67MlpTbsXpl+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vWAEo-0002J4-FB; Thu, 18 Dec 2025 10:23:58 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 0/3] media: imx-csi: cleanup media pipeline start
Date: Thu, 18 Dec 2025 10:23:48 +0100
Message-Id: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACTIQ2kC/32NQQ6CMBBFr0Jm7Zh2rAquvIdh0dABJpHStEAwh
 LtbOYDL95L//gaJo3CCR7FB5EWSjD4DnQpoeus7RnGZgRRdtVZ3HNiJRRlWbN5s/RywUkSuMtq
 yMZB3IXIr69F81Zl7SdMYP8fFon/2X23RqLAtyd6qS0Nla56BfTdPcfSynh1Dve/7F0UsSCy3A
 AAA
X-Change-ID: 20251107-media-imx-cleanup-9022d941ae44
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-staging@lists.linux.dev, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

The imx media device currently assumes that there is only a single media
pipeline. However, the media graph has multiple imx capture devices.
These may be started separately on media pipelines if they don't cause
conflicts in the media graph.

Move the media pipeline from the media device to the capture devices to
properly track and handle multiple media pipelines for the imx-csi.
Refactor the code to start the media pipeline from the driver to help
the reader.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Improve code readability in Patch 2
- Update commit message of Patch 3 as suggested by Frank Li
- Link to v1: https://patch.msgid.link/20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de

---
Michael Tretter (3):
      media: imx-csi: move media_pipeline to video device
      media: imx-csi: explicitly start media pipeline on pad 0
      media: imx-csi: use media_pad_is_streaming helper

 drivers/staging/media/imx/imx-media-capture.c |  8 ++++----
 drivers/staging/media/imx/imx-media-utils.c   | 12 ++++++++----
 drivers/staging/media/imx/imx-media.h         |  7 ++++---
 3 files changed, 16 insertions(+), 11 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251107-media-imx-cleanup-9022d941ae44

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>


