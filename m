Return-Path: <linux-media+bounces-61288-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANECJ+5RA2qR4QEAu9opvQ
	(envelope-from <linux-media+bounces-61288-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:14:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44E524768
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 091483137ED3
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6323C583B;
	Tue, 12 May 2026 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tXFGhD/I"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815493C4165;
	Tue, 12 May 2026 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600636; cv=none; b=rU7V1nMrioHx5GOthh5gHJABTqz/mJpEsuZt4+Wc39RYhso91Pjujc7QBF9dorPx4LpqKgsp9DEUehUgQdVyUfo907ZDyOC9lWUzyTX0rHhJqC4fQA60HecM1nRdY1/pAnJ1fperP74xtISb/bsPT9NQCW2grf8O1BGbGOsrAOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600636; c=relaxed/simple;
	bh=JsQDnXvipvbo4kWLlUqj0uQttCJfUclcjuvwV9jSCyo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VFkbIr8u4/b1mK6EKDhY96t3klhJsVO2o5GNAL8QnW3gFwcIC+d3H9DlAUQHPKZKhvJj6Vxfyg9Ub7/c/Ks2P0rM4UW/Io8/lBvSviEbcPodXDM4NSqzEZuMCmic1dvsjbrF42hh+HtNH3uTkDJKrZx8MVxeqCNsQQU8o86l330=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=tXFGhD/I; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600633; x=1810136633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JsQDnXvipvbo4kWLlUqj0uQttCJfUclcjuvwV9jSCyo=;
  b=tXFGhD/IRwmVFKRGbg2uhytG/wTIielU8fVWBq6jCeQgeeNR1DGI7fq8
   ZC/AOU/CxOtB93iTumGLCEGTsdBiumWdW63np8BIv2gr1C2a+D3pcHHrS
   ic44Xr9BctK+hzxTO08axaDiJpYg2xZkLuCIS1frgW3o+nl0ENqg/8ZzA
   sdpnTWpj2WpGt0XOlI3Gdqi+Fqf5eBV4cziZYtNPYwqd+cDQ1IdIOXUb0
   dpxcyd4J66fE75+MJy3A4z7RWDx1agtlDI4Xq/pmW4WkcQCVvuDbWMkfG
   cxSIQ469WxqFgCajR6xjodJB0t39znVSe4297oCvZw88oraTBSNFGtz4w
   g==;
X-CSE-ConnectionGUID: yOttjrTKT6K8nLB7BgKmQg==
X-CSE-MsgGUID: CIreHTtkRfCwHv0OO5uaRg==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="224633694"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 08:43:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 12 May 2026 08:43:52 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:43:49 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH v2 03/15] media: microchip-isc: fix race condition on stream stop
Date: Tue, 12 May 2026 21:13:27 +0530
Message-ID: <20260512154339.210444-4-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512154339.210444-1-balakrishnan.s@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <20260512154339.210444-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: 4B44E524768
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_FROM(0.00)[bounces-61288-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Disable histogram and drain AWB work queue before releasing DMA
buffers to prevent use-after-free if histogram IRQ fires during
stream stop.

Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
Cc: stable@vger.kernel.org
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index 45b94f1e89d8..b19c5a63b4bd 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -427,6 +427,14 @@ static void isc_stop_streaming(struct vb2_queue *vq)
=20
 	mutex_unlock(&isc->awb_mutex);
=20
+	/*
+	 * Disable the histogram so the ISR stops firing HISREQ, then drain
+	 * any work that was already queued before returning.  This must happen
+	 * after releasing awb_mutex because isc_awb_work also takes it.
+	 */
+	isc_set_histogram(isc, false);
+	cancel_work_sync(&isc->awb_work);
+
 	/* Disable DMA interrupt */
 	regmap_write(isc->regmap, ISC_INTDIS, ISC_INT_DDONE);
=20
@@ -1519,10 +1527,17 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&isc->awb_mutex);
=20
-		/* if we have autowhitebalance on, start histogram procedure */
+		/*
+		 * If AWB auto mode is requested and we are streaming RAW,
+		 * start the histogram procedure, but only if it is not
+		 * already running. Repeated enable requests would reset
+		 * hist_id, preventing the 4-channel Bayer cycle from
+		 * completing.
+		 */
 		if (ctrls->awb =3D=3D ISC_WB_AUTO &&
 		    vb2_is_streaming(&isc->vb2_vidq) &&
-		    ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
+		    ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code) &&
+		    ctrls->hist_stat !=3D HIST_ENABLED)
 			isc_set_histogram(isc, true);
=20
 		/*
--=20
2.34.1


