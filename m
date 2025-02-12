Return-Path: <linux-media+bounces-26074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2A1A32C81
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 17:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6C8D188C89B
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 16:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C1625A325;
	Wed, 12 Feb 2025 16:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bMTeqcuG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kn8+r0i5"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504772586FB
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379097; cv=none; b=uxB1KI9Y7mx7m19/TOCplVaUI/zOi52ZJGNlN0gyRt+nM1MzMHxEcPUW+a2hccW41ikeCML58qAAmJzuh0qF4Iv4Y+aVlzfGV5QzzX+XfxbeYBPNUbVF0Y2p9lsbSjJ9T3oeN4/iEQcQtmEd1aDaLIlQqQKXprSyixXcSdmxtoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379097; c=relaxed/simple;
	bh=E4AT5lu3lm+SWEl2oUUV6cNHpPrCowXvnRg2X/JLrus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZIgWN7Dt/9Tw562VoSzbRv+zsif4kiTc2efLPRsFWB38o7tp4+caQ3MT2ZqWKR2tNws+vy7jrirPCfKawpnCfHYhQyuFfgYjl2UIk135hSJkfJxR8ca9N9l+vJ3IRFQAjEWOhWxP2T0NgYMpZVoHYpo6wbtBhC2xai+EZ5RVZr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bMTeqcuG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kn8+r0i5; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 381C21140101;
	Wed, 12 Feb 2025 11:51:34 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 12 Feb 2025 11:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1739379094; x=1739465494; bh=3y
	Etyh9YY1GMG9XsGl7GthC62viQRU4CHHyQFihHuZQ=; b=bMTeqcuGb6P5tQBQo4
	gdyQ0dAzDnxnEVl7qzg1Nxr6x/gvc41oMo1NhhE0AmGEGiEOPydox5nyqpnIdL5g
	d7m3qKRxoASJMkIGWcQM15irk/bT9Ub71MIxcRCW9mslslLpJTzLv1YPwFCDHDaE
	AiS1R5DjG3tPFkvZOE22Cww43XtKkuT2zhK2Kvk1oUKU12RHF5rK6NXRZ+e/HNen
	CjOQeG2eOv0jaHXT2uTsu29M62lOQ6vf4DD9UrPSvzeHf8grMLTqrSeh6s5s4Ds+
	W1dtzos/0PFbkusoEBQWbl4Om/AqQs/WFnHcqsHqB4agPngFkpVxdeNlmwgF/eWn
	X82Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1739379094; x=1739465494; bh=3yEtyh9YY1GMG9XsGl7GthC62viQ
	RU4CHHyQFihHuZQ=; b=kn8+r0i5XWttRVtl0/8QigtLWZYH18RprF3jeWLC/VO0
	JWUKKNtFaGq0NJtDh4SZ69wVFx0L11AcHPOHAJFT6TlJ5SFA/l6hMgAzpEHT5pyP
	K8+/TVCOBSRERTKlEVfm0+OxTLjXmLIdZj0ueLK1kYFl10U944v741FzjmQ1HTK/
	EI7FNPClI5f7Zn5lRZbOIn80/yELdHcPw2TxfCfC7p8pq7WxTzHFxrg3kAwHI2VI
	KKxcYw9u1ddia52tRSdIECBb2Gbp+s3PDWb8IEcBS6d0SozoXum8OwkTdeZ4XkVy
	R/F/3zD8JInAmmI6ZEls/bfitCxMV763bz8sj8lBlA==
X-ME-Sender: <xms:ldGsZ6iMaQafwHTwn1SDiicvoOGd8m3VED1BS_Kui4UM3XitO6J7YA>
    <xme:ldGsZ7DvJTIl-70CnBTzWgs9ByWbdf6rzsE-7iVnXt9zM5EZUBzYCb89rmo3yvJss
    45zdAVspHbNudJ0KrY>
X-ME-Received: <xmr:ldGsZyGGH_1FllqDyBDy-gfXMcP0V3pLDpF4qLLwY4enJnYefdCl0iP_cYmwzBiNX9bl9esqlSMXTxz7PY4O8YvAWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrfhhnrgesfhgrshht
    mhgrihhlrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiug
    gvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehprghulhdrvghluggvrhesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhsse
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughi
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhotghk
    tghhihhpsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepnhhikh
    hlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:ldGsZzQuPaLGWFeYuGy68OCz-lpUONEZLSZSyYEswWv3cNhtUVLuMw>
    <xmx:ldGsZ3wow_fRuYOFqBjcXyjdhSZMcajc7TAZ76n-LtyYe3SnWlnvGg>
    <xmx:ldGsZx5Bri9W4QRGsw7Ocor7scmgu-n5LuVD-wQunmW-GQMIlZ6BDg>
    <xmx:ldGsZ0w_-FnEYptSyO4tU5quSy5o7WX_8czyQBR1JDDKEcd7W3ht3w>
    <xmx:ltGsZ-k4sOKKWJL7ohUH68d4Y6YISFB21UOTEpXtdxsGggDU1TSZPxr1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Feb 2025 11:51:33 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: uapi: rkisp1-config: Fix typo in extensible params example
Date: Wed, 12 Feb 2025 17:50:53 +0100
Message-ID: <20250212165053.3378513-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The define used for the version in the example diagram do not match what
is defined in enum rksip1_ext_param_buffer_version, nor the description
above it. Correct the typo to make it clear which define to use.

Fixes: e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/uapi/linux/rkisp1-config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 430daceafac7..2d995f3c1ca3 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -1528,7 +1528,7 @@ enum rksip1_ext_param_buffer_version {
  * The expected memory layout of the parameters buffer is::
  *
  *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
- *	| version = RKISP_EXT_PARAMS_BUFFER_V1;                               |
+ *	| version = RKISP1_EXT_PARAM_BUFFER_V1;                               |
  *	| data_size = sizeof(struct rkisp1_ext_params_bls_config)             |
  *	|           + sizeof(struct rkisp1_ext_params_dpcc_config);           |
  *	| +------------------------- data  ---------------------------------+ |
-- 
2.48.1


