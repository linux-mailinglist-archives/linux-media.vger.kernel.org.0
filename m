Return-Path: <linux-media+bounces-60894-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPkfOnSX/WnBgAAAu9opvQ
	(envelope-from <linux-media+bounces-60894-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 09:57:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450C4F367D
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 09:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6A07300D6BA
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 07:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3192C37EFE3;
	Fri,  8 May 2026 07:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFYi7Rx6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D74F2877F6
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778227023; cv=none; b=h9dT1wH+ToB/l+vZxQp/v0pbA7gLBPVcvy7WJoSFZhDhhS2ED/PPB/r/HSSpZrL59ad1GbwPRCRI9uL8wcG2ikQg5dwWPIAq+Cnxsuhlw9LBXVJhmYdc2aYSVvleaVMo373DI14j7Q3FD2wWufJHH0HoXHu9/rGtTLan68OTiCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778227023; c=relaxed/simple;
	bh=X/rO31veteZI8SMcHjdY/CFZe8z32Ilei+FH3cir2Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aw0o29j8/8jIVYEfOsh3Bn7e601+C5IVmf12NmBpooKj4iFdjLmImJzWH1ZerYXrcLnx9g0lf59PYakcw7FtzI7r9jDK9P6TxQsn1Xckq7QDqzlTLHDDh+t/85BgjQPBq4GGu+vOCLq+9d2Izkq9+ee+Oue1yceN7HZCDjuVI2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFYi7Rx6; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7bdec52f48dso33900927b3.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 00:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778227021; x=1778831821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iYZ0URUYB1WuhiYjiJmcY+ddhxixfkGcYj97wiGCaoA=;
        b=jFYi7Rx6VNqsU75MXlIzs4syIW3r/3WcHNqiMMIK/XR39W0Vd5v/h3vSRF6Sy1XkVT
         MC8AYNc88CWmlv1DQ8GDnNnDUdgMwPNpdbrOLxzEYugjucl2gBmabYide0+IBnRvLIJj
         wluD2Cn3EMZ1VpRHvY2N4iiQ/jQ/x83oe4aPGuzHcgV01kBmr9QMxu9iquMu7AV+6oYh
         yiGOgySo7PT+Cjq8Z9fcYasjcWqLjKZAYFbUT8OIM9fWM1xyrOjubzTz5fNwgQtbygil
         XvH/p9eRlVc2aSsUWuG6PUFQVUeV5pli5V64OAoxF0V+O9/kZeIkuXIYBkNqapp6CO4b
         eKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778227021; x=1778831821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYZ0URUYB1WuhiYjiJmcY+ddhxixfkGcYj97wiGCaoA=;
        b=UyqeQG7+090gcMeNgbZt0YKOzrHJ6Qym5z9NZlApIwVv/tmj85KY/ecIGQKAXEakjZ
         hr67bKLXwKQPVQOq0686DgAdJCmCH4AmZO/QK629Rhc5pp8JmbexFplLAYeNXVd1nk/m
         2SS//jVLW4tLYrnGzutG9AOLw5Y8/S/meP9epLFGIHdX6chvqsSldetrCLlaJvOgF2PA
         nm9GdjqPIqzwg3ylWT7KkmBqqYqeftLfjyFtLYjap6eDP+vCFCXhQCeZB7cyoEG63vIG
         dh9fHxp2EP0tWtgf6M7AXWc3QKAD81c9lySiY9VH5kA9rNkMQnQwIUkxPureCnzDC3IT
         ddQA==
X-Gm-Message-State: AOJu0YzzKJ6ILHZ1T/kjpwx9e5mxcZpenKBacEbbqGr8aeT9E8yb7EMo
	DOl4qS2GQt7s3THjr4DanaRJ3aSXFYoWUn30koXYq71E+fSNErecCWcTHurZm7KYzT21Gw==
X-Gm-Gg: Acq92OHFCwYlSECLE1uPxa+nKhLTvXplR2g/VJm0WrPDA5GyeJtN/gDEQMuGDmoKP4N
	4KeLjgiuqmQ8OvH35PBCIqjVaUBEkRIsaMF53idauBcV9YpeLmxjQmdG92fO3zAnnjWWtdk8Cs5
	ZCcZ9aO/YZhbTSzh+wE/xBdUlM0smgvaIDrz6VQ+fpp2fzWvksRIUVv2iUHxCgbEImD++FojHji
	1OtgCVx8itiufGLFlGcpJAo+DagQqADK2i1jDB7qa73GxoYlNGwNmPcbvCRlc7QNAyKV/2QL7/G
	6o0PMPqDMkf/sAv4LWyWoLmzGnVUBIaND72UH023pMygCKAMVetDr3l2nD4zK9Pcrk75emkRSbK
	h9Uty/RGeQKDNvmt0gKiJEI1uhv3TK/puP7ZEn1KVmvx0tSRDqrAkaXPPfmqadkweJ8mr6LpSI8
	dhDl9s/WUuMs4MHsOrQyMn0hNC2W6TpKDtFaeq+7n8E3f5q7K1vg==
X-Received: by 2002:a05:690c:10c:b0:79a:b8d6:110a with SMTP id 00721157ae682-7bf04b1bc56mr50424857b3.5.1778227021053;
        Fri, 08 May 2026 00:57:01 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6654ae22sm104420767b3.12.2026.05.08.00.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:56:59 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] media: ccs-pll: Fix OP_SYS_DDR handling in op_sys_clk_freq_hz_sdr calculation
Date: Fri,  8 May 2026 10:56:53 +0300
Message-ID: <20260508075653.1536443-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8450C4F367D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-60894-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

When OP_SYS_DDR flag is set, the PLL's effective SDR-equivalent
frequency should be based on the link frequency (bitrate per lane)
without an extra factor of 2, because two bits are transferred per
clock cycle. The current code always multiplies link_freq by 2,
overestimating the effective frequency for DDR mode. This leads to
excessive VCO frequencies and PLL calculation failures for high link
frequencies.

Fix this by halving the multiplication factor when OP_SYS_DDR is set.

All further calculations (pixel_rate_csi, mul/div, sys_clk_freq_hz,
pix_clk_freq_hz) remain consistent because sys_clk_freq_hz is
additionally shifted by op_sys_ddr().

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/ccs-pll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 1605cfa5db19..788dec797259 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -801,9 +801,11 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	switch (pll->bus_type) {
 	case CCS_PLL_BUS_TYPE_CSI2_DPHY:
 	case CCS_PLL_BUS_TYPE_CSI2_CPHY:
-		op_sys_clk_freq_hz_sdr = pll->link_freq * 2
+		op_sys_clk_freq_hz_sdr = pll->link_freq
 			* (pll->flags & CCS_PLL_FLAG_LANE_SPEED_MODEL ?
 			   1 : pll->csi2.lanes);
+		if (!(pll->flags & CCS_PLL_FLAG_OP_SYS_DDR))
+			op_sys_clk_freq_hz_sdr *= 2;
 		break;
 	default:
 		return -EINVAL;
-- 
2.52.0


