Return-Path: <linux-media+bounces-24352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 833D3A04663
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 17:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBFA0188863E
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 16:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F0E1F8925;
	Tue,  7 Jan 2025 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="kz2mDRUx"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552611F758F;
	Tue,  7 Jan 2025 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267386; cv=none; b=OGK1gaQpvQp5beitgTQz1momVGk/Vx4eHGkGI+XuKibB7CAeafCOyRv36gBw4o2VtwKuRiDrBzrsURfHcgKuFVitt7duF5WZVRTbc7opwWtdEKfDPmQSHSBVwMHmE9k8OmkmDwevFnuhcqWMiw+vy5D79dj+G0UG8DUX9i6sMOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267386; c=relaxed/simple;
	bh=sQ3I39FmNltTxKG0blHPWtL5XgvSfGHtwyEcdLD4l7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c63PLOVyPuAfWapfbqwEdHUX/Qw+PWQbAwr5PFEnjsNjqt41KvOqWzeU9tTby/HWfGnlG3iU8sBw251IapKHL84EG7Y9sk2VSyakfZ4T4pyLzPk+0ur61YlLtHkqQatzJpKtaAqxzG1DSRmR0mg72K6Hu/uo8NxoICpvka1isIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=kz2mDRUx; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Pta881QDQYLER5lqhnZcD4uTjqZF5/hzmw5ythV9xCA=; b=kz2mDRUx5aK+0WgU8m7s3salYK
	2wfW9kzKJa/ISqmjf1eVcWaAQIlAZVVo1MUrpUDz23YfUMNELLNIoLKeO8hT5E6rrhSesjxP0hTf6
	53s4nznewMKNEimd1b4wLFea08CHWJeqAUrnMj97JNEqiXp9QRql8VDmP6LSQkoGTbP0=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:55823 helo=localhost.localdomain)
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1tVC6x-0056pg-K0; Tue, 07 Jan 2025 17:07:19 +0100
From: Matthias Fend <matthias.fend@emfend.at>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: m.felsch@pengutronix.de,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: tc358746: improve calculation of the D-PHY timing registers
Date: Tue,  7 Jan 2025 17:07:01 +0100
Message-Id: <20250107160702.641703-2-matthias.fend@emfend.at>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107160702.641703-1-matthias.fend@emfend.at>
References: <20250107160702.641703-1-matthias.fend@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  The TC358746 supports RAW formats with 8, 10, 12, and 14-bit
    depths. Since pixel data is transported transparently without modifying the
    pixel arrangement, all Bayer patterns (RGGB, BGGR, GRBG, GBRG) [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment

When calculating D-PHY registers, using data rates that are not multiples
of 16 can lead to precision loss in division operations. This can result in
register values that produce timing violations against the MIPI standard.

An example:
cfg->hs_clk_rate = 294MHz
hf_clk = 18

If the desired value in cfg->init is 100us, which is the minimum allowed
value, then the LINEINITCNT register is calculated as 1799. But since the
actual clock is 18.375MHz instead of 18MHz, this setting results in a time
that is shorter than 100us and thus violates the standard. The correct
value for LINEINITCNT would be 1837.

Improve the precision of calculations by using Hz instead of MHz as unit.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/tc358746.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 5eccd4ffd84d..883ca40709a9 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -485,24 +485,20 @@ static int tc358746_apply_misc_config(struct tc358746 *tc358746)
 	return err;
 }
 
-/* Use MHz as base so the div needs no u64 */
-static u32 tc358746_cfg_to_cnt(unsigned int cfg_val,
-			       unsigned int clk_mhz,
-			       unsigned int time_base)
+static u32 tc358746_cfg_to_cnt(unsigned long cfg_val, unsigned long clk_hz,
+			       unsigned long long time_base)
 {
-	return DIV_ROUND_UP(cfg_val * clk_mhz, time_base);
+	return div64_u64((u64)cfg_val * clk_hz + time_base - 1, time_base);
 }
 
-static u32 tc358746_ps_to_cnt(unsigned int cfg_val,
-			      unsigned int clk_mhz)
+static u32 tc358746_ps_to_cnt(unsigned long cfg_val, unsigned long clk_hz)
 {
-	return tc358746_cfg_to_cnt(cfg_val, clk_mhz, USEC_PER_SEC);
+	return tc358746_cfg_to_cnt(cfg_val, clk_hz, PSEC_PER_SEC);
 }
 
-static u32 tc358746_us_to_cnt(unsigned int cfg_val,
-			      unsigned int clk_mhz)
+static u32 tc358746_us_to_cnt(unsigned long cfg_val, unsigned long clk_hz)
 {
-	return tc358746_cfg_to_cnt(cfg_val, clk_mhz, 1);
+	return tc358746_cfg_to_cnt(cfg_val, clk_hz, USEC_PER_SEC);
 }
 
 static int tc358746_apply_dphy_config(struct tc358746 *tc358746)
@@ -517,7 +513,6 @@ static int tc358746_apply_dphy_config(struct tc358746 *tc358746)
 
 	/* The hs_byte_clk is also called SYSCLK in the excel sheet */
 	hs_byte_clk = cfg->hs_clk_rate / 8;
-	hs_byte_clk /= HZ_PER_MHZ;
 	hf_clk = hs_byte_clk / 2;
 
 	val = tc358746_us_to_cnt(cfg->init, hf_clk) - 1;
-- 
2.34.1


