Return-Path: <linux-media+bounces-52370-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKDDMClpiWks8gQAu9opvQ
	(envelope-from <linux-media+bounces-52370-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 05:57:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AFE10BA63
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 05:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 945C6301B713
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 04:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFBF285CAE;
	Mon,  9 Feb 2026 04:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ohxorud.com header.i=@ohxorud.com header.b="Ctv7lfd3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A52F22D7B5
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 04:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770612976; cv=none; b=UZUeXXidtGNgvEpkLd3NZSCsQowo/1qj/0zqf4dD8lRBdvEbfAG+28Sr4BAlwkZzBlJz+6A7ZnTPOgOyF8ECzoMsSfSfDeF+7/73U9Zq0C4sIfmgwVl1QvbIz/DOMMS9Xc94vbQ3lxbqw6pXAEgbbzk83FRjwzRCzWhWQdqJL+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770612976; c=relaxed/simple;
	bh=0qdPE6Xk1TGDepERf1UWroxDVhRl25vdaR0BUTMitY4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOXtbCdLHONbUfJNePVukNj9/ONVwJNiMpW9llUr3ripqlw94FMuesh8k7PvuPKQFDk9ecHjy/7IbXguVK8gEgjCEDNUSgAeasGpPwVIePzjOJpUXGXXB0XQUD5pR4+oRvYJ/68QmDchZxeWmQ0LJp5lUqVjPIKcg8YqExy/kAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ohxorud.com; spf=pass smtp.mailfrom=ohxorud.com; dkim=pass (2048-bit key) header.d=ohxorud.com header.i=@ohxorud.com header.b=Ctv7lfd3; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ohxorud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ohxorud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ohxorud.com;
	s=protonmail3; t=1770612960; x=1770872160;
	bh=ajd/UspWcW7+BIH+zDFNN7edDjgmws2dKm7KSuRm1ik=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ctv7lfd3QkFeC34CE0lUnvxmGxW4rt6Tm97SeDAbLAhmhVNNyQtzXKiuKV8oe9l0z
	 K0iP7LGJ+/yYz/SiBmv3XVK73ex2qh1kEH5kr9Qy2IT4AvUkSQguln7KPnVJX7rR/z
	 Kp8bHbfkq7sTP+obnpmdJ4xPVZFk+2Pc0Dt3X89un3vZHn8V7P1VD5MlztJ0hktYsW
	 QhdVZ+o7ByD+K5w1Msvic8QHCX4PgnlNwip9T2y/HPBENnLt7lSbxJFXKmVH6pfRPg
	 3YB4H5bxbhtr5mg6CVMP6b3racUJbZuJNr5Y+bD+xaOBBH0fblPl/w2nSis+rZB4CN
	 kSa33TVJ8oNlA==
Date: Mon, 09 Feb 2026 04:55:57 +0000
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>
From: Taekyung Oh <ohxorud@ohxorud.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Taekyung Oh <ohxorud@ohxorud.com>
Subject: [PATCH 2/2] staging: media: atomisp: remove dead code in ov2722.h
Message-ID: <20260209045514.40352-3-ohxorud@ohxorud.com>
In-Reply-To: <20260209045514.40352-1-ohxorud@ohxorud.com>
References: <20260209045514.40352-1-ohxorud@ohxorud.com>
Feedback-ID: 133357498:user:proton
X-Pm-Message-ID: be873f84bcc1d2bcb994b7455d36f383cb94cbae
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ohxorud.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ohxorud.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52370-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ohxorud.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ohxorud@ohxorud.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ohxorud.com:email,ohxorud.com:dkim,ohxorud.com:mid]
X-Rspamd-Queue-Id: 26AFE10BA63
X-Rspamd-Action: no action

Remove unused code blocks enclosed in #if 0 to clean up the code.

Signed-off-by: Taekyung Oh <ohxorud@ohxorud.com>
---
 drivers/staging/media/atomisp/i2c/ov2722.h | 637 ---------------------
 1 file changed, 637 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/m=
edia/atomisp/i2c/ov2722.h
index c69f0086c..9e18ac85e 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -232,339 +232,6 @@ struct ov2722_write_ctrl {
 =09struct ov2722_write_buffer buffer;
 };
=20
-/*
- * Register settings for various resolution
- */
-#if 0
-static const struct ov2722_reg ov2722_QVGA_30fps[] =3D {
-=09{OV2722_8BIT, 0x3718, 0x10},
-=09{OV2722_8BIT, 0x3702, 0x0c},
-=09{OV2722_8BIT, 0x373a, 0x1c},
-=09{OV2722_8BIT, 0x3715, 0x01},
-=09{OV2722_8BIT, 0x3703, 0x0c},
-=09{OV2722_8BIT, 0x3705, 0x06},
-=09{OV2722_8BIT, 0x3730, 0x0e},
-=09{OV2722_8BIT, 0x3704, 0x1c},
-=09{OV2722_8BIT, 0x3f06, 0x00},
-=09{OV2722_8BIT, 0x371c, 0x00},
-=09{OV2722_8BIT, 0x371d, 0x46},
-=09{OV2722_8BIT, 0x371e, 0x00},
-=09{OV2722_8BIT, 0x371f, 0x63},
-=09{OV2722_8BIT, 0x3708, 0x61},
-=09{OV2722_8BIT, 0x3709, 0x12},
-=09{OV2722_8BIT, 0x3800, 0x01},
-=09{OV2722_8BIT, 0x3801, 0x42}, /* H crop start: 322 */
-=09{OV2722_8BIT, 0x3802, 0x00},
-=09{OV2722_8BIT, 0x3803, 0x20}, /* V crop start: 32 */
-=09{OV2722_8BIT, 0x3804, 0x06},
-=09{OV2722_8BIT, 0x3805, 0x95}, /* H crop end:  1685 */
-=09{OV2722_8BIT, 0x3806, 0x04},
-=09{OV2722_8BIT, 0x3807, 0x27}, /* V crop end:  1063 */
-=09{OV2722_8BIT, 0x3808, 0x01},
-=09{OV2722_8BIT, 0x3809, 0x50}, /* H output size: 336 */
-=09{OV2722_8BIT, 0x380a, 0x01},
-=09{OV2722_8BIT, 0x380b, 0x00}, /* V output size: 256 */
-
-=09/* H blank timing */
-=09{OV2722_8BIT, 0x380c, 0x08},
-=09{OV2722_8BIT, 0x380d, 0x00}, /* H total size: 2048 */
-=09{OV2722_8BIT, 0x380e, 0x04},
-=09{OV2722_8BIT, 0x380f, 0xa0}, /* V total size: 1184 */
-=09{OV2722_8BIT, 0x3810, 0x00},
-=09{OV2722_8BIT, 0x3811, 0x04}, /* H window offset: 5 */
-=09{OV2722_8BIT, 0x3812, 0x00},
-=09{OV2722_8BIT, 0x3813, 0x01}, /* V window offset: 2 */
-=09{OV2722_8BIT, 0x3820, 0xc0},
-=09{OV2722_8BIT, 0x3821, 0x06}, /* flip isp*/
-=09{OV2722_8BIT, 0x3814, 0x71},
-=09{OV2722_8BIT, 0x3815, 0x71},
-=09{OV2722_8BIT, 0x3612, 0x49},
-=09{OV2722_8BIT, 0x3618, 0x00},
-=09{OV2722_8BIT, 0x3a08, 0x01},
-=09{OV2722_8BIT, 0x3a09, 0xc3},
-=09{OV2722_8BIT, 0x3a0a, 0x01},
-=09{OV2722_8BIT, 0x3a0b, 0x77},
-=09{OV2722_8BIT, 0x3a0d, 0x00},
-=09{OV2722_8BIT, 0x3a0e, 0x00},
-=09{OV2722_8BIT, 0x4520, 0x09},
-=09{OV2722_8BIT, 0x4837, 0x1b},
-=09{OV2722_8BIT, 0x3000, 0xff},
-=09{OV2722_8BIT, 0x3001, 0xff},
-=09{OV2722_8BIT, 0x3002, 0xf0},
-=09{OV2722_8BIT, 0x3600, 0x08},
-=09{OV2722_8BIT, 0x3621, 0xc0},
-=09{OV2722_8BIT, 0x3632, 0x53}, /* added for power opt */
-=09{OV2722_8BIT, 0x3633, 0x63},
-=09{OV2722_8BIT, 0x3634, 0x24},
-=09{OV2722_8BIT, 0x3f01, 0x0c},
-=09{OV2722_8BIT, 0x5001, 0xc1}, /* v_en, h_en, blc_en */
-=09{OV2722_8BIT, 0x3614, 0xf0},
-=09{OV2722_8BIT, 0x3630, 0x2d},
-=09{OV2722_8BIT, 0x370b, 0x62},
-=09{OV2722_8BIT, 0x3706, 0x61},
-=09{OV2722_8BIT, 0x4000, 0x02},
-=09{OV2722_8BIT, 0x4002, 0xc5},
-=09{OV2722_8BIT, 0x4005, 0x08},
-=09{OV2722_8BIT, 0x404f, 0x84},
-=09{OV2722_8BIT, 0x4051, 0x00},
-=09{OV2722_8BIT, 0x5000, 0xff},
-=09{OV2722_8BIT, 0x3a18, 0x00},
-=09{OV2722_8BIT, 0x3a19, 0x80},
-=09{OV2722_8BIT, 0x4521, 0x00},
-=09{OV2722_8BIT, 0x5183, 0xb0}, /* AWB red */
-=09{OV2722_8BIT, 0x5184, 0xb0}, /* AWB green */
-=09{OV2722_8BIT, 0x5185, 0xb0}, /* AWB blue */
-=09{OV2722_8BIT, 0x5180, 0x03}, /* AWB manual mode */
-=09{OV2722_8BIT, 0x370c, 0x0c},
-=09{OV2722_8BIT, 0x4800, 0x24}, /* clk lane gate enable */
-=09{OV2722_8BIT, 0x3035, 0x00},
-=09{OV2722_8BIT, 0x3036, 0x26},
-=09{OV2722_8BIT, 0x3037, 0xa1},
-=09{OV2722_8BIT, 0x303e, 0x19},
-=09{OV2722_8BIT, 0x3038, 0x06},
-=09{OV2722_8BIT, 0x3018, 0x04},
-
-=09/* Added for power optimization */
-=09{OV2722_8BIT, 0x3000, 0x00},
-=09{OV2722_8BIT, 0x3001, 0x00},
-=09{OV2722_8BIT, 0x3002, 0x00},
-=09{OV2722_8BIT, 0x3a0f, 0x40},
-=09{OV2722_8BIT, 0x3a10, 0x38},
-=09{OV2722_8BIT, 0x3a1b, 0x48},
-=09{OV2722_8BIT, 0x3a1e, 0x30},
-=09{OV2722_8BIT, 0x3a11, 0x90},
-=09{OV2722_8BIT, 0x3a1f, 0x10},
-=09{OV2722_8BIT, 0x3011, 0x22},
-=09{OV2722_8BIT, 0x3a00, 0x58},
-=09{OV2722_8BIT, 0x3503, 0x17},
-=09{OV2722_8BIT, 0x3500, 0x00},
-=09{OV2722_8BIT, 0x3501, 0x46},
-=09{OV2722_8BIT, 0x3502, 0x00},
-=09{OV2722_8BIT, 0x3508, 0x00},
-=09{OV2722_8BIT, 0x3509, 0x10},
-=09{OV2722_TOK_TERM, 0, 0},
-
-};
-
-static const struct ov2722_reg ov2722_480P_30fps[] =3D {
-=09{OV2722_8BIT, 0x3718, 0x10},
-=09{OV2722_8BIT, 0x3702, 0x18},
-=09{OV2722_8BIT, 0x373a, 0x3c},
-=09{OV2722_8BIT, 0x3715, 0x01},
-=09{OV2722_8BIT, 0x3703, 0x1d},
-=09{OV2722_8BIT, 0x3705, 0x12},
-=09{OV2722_8BIT, 0x3730, 0x1f},
-=09{OV2722_8BIT, 0x3704, 0x3f},
-=09{OV2722_8BIT, 0x3f06, 0x1d},
-=09{OV2722_8BIT, 0x371c, 0x00},
-=09{OV2722_8BIT, 0x371d, 0x83},
-=09{OV2722_8BIT, 0x371e, 0x00},
-=09{OV2722_8BIT, 0x371f, 0xbd},
-=09{OV2722_8BIT, 0x3708, 0x63},
-=09{OV2722_8BIT, 0x3709, 0x52},
-=09{OV2722_8BIT, 0x3800, 0x00},
-=09{OV2722_8BIT, 0x3801, 0xf2}, /* H crop start: 322 - 80 =3D 242*/
-=09{OV2722_8BIT, 0x3802, 0x00},
-=09{OV2722_8BIT, 0x3803, 0x20}, /* V crop start:  32*/
-=09{OV2722_8BIT, 0x3804, 0x06},
-=09{OV2722_8BIT, 0x3805, 0xBB}, /* H crop end:   1643 + 80 =3D 1723*/
-=09{OV2722_8BIT, 0x3806, 0x04},
-=09{OV2722_8BIT, 0x3807, 0x03}, /* V crop end:   1027*/
-=09{OV2722_8BIT, 0x3808, 0x02},
-=09{OV2722_8BIT, 0x3809, 0xE0}, /* H output size: 656 +80 =3D 736*/
-=09{OV2722_8BIT, 0x380a, 0x01},
-=09{OV2722_8BIT, 0x380b, 0xF0}, /* V output size: 496 */
-
-=09/* H blank timing */
-=09{OV2722_8BIT, 0x380c, 0x08},
-=09{OV2722_8BIT, 0x380d, 0x00}, /* H total size: 2048 */
-=09{OV2722_8BIT, 0x380e, 0x04},
-=09{OV2722_8BIT, 0x380f, 0xa0}, /* V total size: 1184 */
-=09{OV2722_8BIT, 0x3810, 0x00},
-=09{OV2722_8BIT, 0x3811, 0x04}, /* H window offset: 5 */
-=09{OV2722_8BIT, 0x3812, 0x00},
-=09{OV2722_8BIT, 0x3813, 0x01}, /* V window offset: 2 */
-=09{OV2722_8BIT, 0x3820, 0x80},
-=09{OV2722_8BIT, 0x3821, 0x06}, /* flip isp*/
-=09{OV2722_8BIT, 0x3814, 0x31},
-=09{OV2722_8BIT, 0x3815, 0x31},
-=09{OV2722_8BIT, 0x3612, 0x4b},
-=09{OV2722_8BIT, 0x3618, 0x04},
-=09{OV2722_8BIT, 0x3a08, 0x02},
-=09{OV2722_8BIT, 0x3a09, 0x67},
-=09{OV2722_8BIT, 0x3a0a, 0x02},
-=09{OV2722_8BIT, 0x3a0b, 0x00},
-=09{OV2722_8BIT, 0x3a0d, 0x00},
-=09{OV2722_8BIT, 0x3a0e, 0x00},
-=09{OV2722_8BIT, 0x4520, 0x0a},
-=09{OV2722_8BIT, 0x4837, 0x1b},
-=09{OV2722_8BIT, 0x3000, 0xff},
-=09{OV2722_8BIT, 0x3001, 0xff},
-=09{OV2722_8BIT, 0x3002, 0xf0},
-=09{OV2722_8BIT, 0x3600, 0x08},
-=09{OV2722_8BIT, 0x3621, 0xc0},
-=09{OV2722_8BIT, 0x3632, 0x53}, /* added for power opt */
-=09{OV2722_8BIT, 0x3633, 0x63},
-=09{OV2722_8BIT, 0x3634, 0x24},
-=09{OV2722_8BIT, 0x3f01, 0x0c},
-=09{OV2722_8BIT, 0x5001, 0xc1}, /* v_en, h_en, blc_en */
-=09{OV2722_8BIT, 0x3614, 0xf0},
-=09{OV2722_8BIT, 0x3630, 0x2d},
-=09{OV2722_8BIT, 0x370b, 0x62},
-=09{OV2722_8BIT, 0x3706, 0x61},
-=09{OV2722_8BIT, 0x4000, 0x02},
-=09{OV2722_8BIT, 0x4002, 0xc5},
-=09{OV2722_8BIT, 0x4005, 0x08},
-=09{OV2722_8BIT, 0x404f, 0x84},
-=09{OV2722_8BIT, 0x4051, 0x00},
-=09{OV2722_8BIT, 0x5000, 0xff},
-=09{OV2722_8BIT, 0x3a18, 0x00},
-=09{OV2722_8BIT, 0x3a19, 0x80},
-=09{OV2722_8BIT, 0x4521, 0x00},
-=09{OV2722_8BIT, 0x5183, 0xb0}, /* AWB red */
-=09{OV2722_8BIT, 0x5184, 0xb0}, /* AWB green */
-=09{OV2722_8BIT, 0x5185, 0xb0}, /* AWB blue */
-=09{OV2722_8BIT, 0x5180, 0x03}, /* AWB manual mode */
-=09{OV2722_8BIT, 0x370c, 0x0c},
-=09{OV2722_8BIT, 0x4800, 0x24}, /* clk lane gate enable */
-=09{OV2722_8BIT, 0x3035, 0x00},
-=09{OV2722_8BIT, 0x3036, 0x26},
-=09{OV2722_8BIT, 0x3037, 0xa1},
-=09{OV2722_8BIT, 0x303e, 0x19},
-=09{OV2722_8BIT, 0x3038, 0x06},
-=09{OV2722_8BIT, 0x3018, 0x04},
-
-=09/* Added for power optimization */
-=09{OV2722_8BIT, 0x3000, 0x00},
-=09{OV2722_8BIT, 0x3001, 0x00},
-=09{OV2722_8BIT, 0x3002, 0x00},
-=09{OV2722_8BIT, 0x3a0f, 0x40},
-=09{OV2722_8BIT, 0x3a10, 0x38},
-=09{OV2722_8BIT, 0x3a1b, 0x48},
-=09{OV2722_8BIT, 0x3a1e, 0x30},
-=09{OV2722_8BIT, 0x3a11, 0x90},
-=09{OV2722_8BIT, 0x3a1f, 0x10},
-=09{OV2722_8BIT, 0x3011, 0x22},
-=09{OV2722_8BIT, 0x3a00, 0x58},
-=09{OV2722_8BIT, 0x3503, 0x17},
-=09{OV2722_8BIT, 0x3500, 0x00},
-=09{OV2722_8BIT, 0x3501, 0x46},
-=09{OV2722_8BIT, 0x3502, 0x00},
-=09{OV2722_8BIT, 0x3508, 0x00},
-=09{OV2722_8BIT, 0x3509, 0x10},
-=09{OV2722_TOK_TERM, 0, 0},
-};
-
-static const struct ov2722_reg ov2722_VGA_30fps[] =3D {
-=09{OV2722_8BIT, 0x3718, 0x10},
-=09{OV2722_8BIT, 0x3702, 0x18},
-=09{OV2722_8BIT, 0x373a, 0x3c},
-=09{OV2722_8BIT, 0x3715, 0x01},
-=09{OV2722_8BIT, 0x3703, 0x1d},
-=09{OV2722_8BIT, 0x3705, 0x12},
-=09{OV2722_8BIT, 0x3730, 0x1f},
-=09{OV2722_8BIT, 0x3704, 0x3f},
-=09{OV2722_8BIT, 0x3f06, 0x1d},
-=09{OV2722_8BIT, 0x371c, 0x00},
-=09{OV2722_8BIT, 0x371d, 0x83},
-=09{OV2722_8BIT, 0x371e, 0x00},
-=09{OV2722_8BIT, 0x371f, 0xbd},
-=09{OV2722_8BIT, 0x3708, 0x63},
-=09{OV2722_8BIT, 0x3709, 0x52},
-=09{OV2722_8BIT, 0x3800, 0x01},
-=09{OV2722_8BIT, 0x3801, 0x42}, /* H crop start: 322 */
-=09{OV2722_8BIT, 0x3802, 0x00},
-=09{OV2722_8BIT, 0x3803, 0x20}, /* V crop start:  32*/
-=09{OV2722_8BIT, 0x3804, 0x06},
-=09{OV2722_8BIT, 0x3805, 0x6B}, /* H crop end:   1643*/
-=09{OV2722_8BIT, 0x3806, 0x04},
-=09{OV2722_8BIT, 0x3807, 0x03}, /* V crop end:   1027*/
-=09{OV2722_8BIT, 0x3808, 0x02},
-=09{OV2722_8BIT, 0x3809, 0x90}, /* H output size: 656 */
-=09{OV2722_8BIT, 0x380a, 0x01},
-=09{OV2722_8BIT, 0x380b, 0xF0}, /* V output size: 496 */
-
-=09/* H blank timing */
-=09{OV2722_8BIT, 0x380c, 0x08},
-=09{OV2722_8BIT, 0x380d, 0x00}, /* H total size: 2048 */
-=09{OV2722_8BIT, 0x380e, 0x04},
-=09{OV2722_8BIT, 0x380f, 0xa0}, /* V total size: 1184 */
-=09{OV2722_8BIT, 0x3810, 0x00},
-=09{OV2722_8BIT, 0x3811, 0x04}, /* H window offset: 5 */
-=09{OV2722_8BIT, 0x3812, 0x00},
-=09{OV2722_8BIT, 0x3813, 0x01}, /* V window offset: 2 */
-=09{OV2722_8BIT, 0x3820, 0x80},
-=09{OV2722_8BIT, 0x3821, 0x06}, /* flip isp*/
-=09{OV2722_8BIT, 0x3814, 0x31},
-=09{OV2722_8BIT, 0x3815, 0x31},
-=09{OV2722_8BIT, 0x3612, 0x4b},
-=09{OV2722_8BIT, 0x3618, 0x04},
-=09{OV2722_8BIT, 0x3a08, 0x02},
-=09{OV2722_8BIT, 0x3a09, 0x67},
-=09{OV2722_8BIT, 0x3a0a, 0x02},
-=09{OV2722_8BIT, 0x3a0b, 0x00},
-=09{OV2722_8BIT, 0x3a0d, 0x00},
-=09{OV2722_8BIT, 0x3a0e, 0x00},
-=09{OV2722_8BIT, 0x4520, 0x0a},
-=09{OV2722_8BIT, 0x4837, 0x29},
-=09{OV2722_8BIT, 0x3000, 0xff},
-=09{OV2722_8BIT, 0x3001, 0xff},
-=09{OV2722_8BIT, 0x3002, 0xf0},
-=09{OV2722_8BIT, 0x3600, 0x08},
-=09{OV2722_8BIT, 0x3621, 0xc0},
-=09{OV2722_8BIT, 0x3632, 0x53}, /* added for power opt */
-=09{OV2722_8BIT, 0x3633, 0x63},
-=09{OV2722_8BIT, 0x3634, 0x24},
-=09{OV2722_8BIT, 0x3f01, 0x0c},
-=09{OV2722_8BIT, 0x5001, 0xc1}, /* v_en, h_en, blc_en */
-=09{OV2722_8BIT, 0x3614, 0xf0},
-=09{OV2722_8BIT, 0x3630, 0x2d},
-=09{OV2722_8BIT, 0x370b, 0x62},
-=09{OV2722_8BIT, 0x3706, 0x61},
-=09{OV2722_8BIT, 0x4000, 0x02},
-=09{OV2722_8BIT, 0x4002, 0xc5},
-=09{OV2722_8BIT, 0x4005, 0x08},
-=09{OV2722_8BIT, 0x404f, 0x84},
-=09{OV2722_8BIT, 0x4051, 0x00},
-=09{OV2722_8BIT, 0x5000, 0xff},
-=09{OV2722_8BIT, 0x3a18, 0x00},
-=09{OV2722_8BIT, 0x3a19, 0x80},
-=09{OV2722_8BIT, 0x4521, 0x00},
-=09{OV2722_8BIT, 0x5183, 0xb0}, /* AWB red */
-=09{OV2722_8BIT, 0x5184, 0xb0}, /* AWB green */
-=09{OV2722_8BIT, 0x5185, 0xb0}, /* AWB blue */
-=09{OV2722_8BIT, 0x5180, 0x03}, /* AWB manual mode */
-=09{OV2722_8BIT, 0x370c, 0x0c},
-=09{OV2722_8BIT, 0x4800, 0x24}, /* clk lane gate enable */
-=09{OV2722_8BIT, 0x3035, 0x00},
-=09{OV2722_8BIT, 0x3036, 0x26},
-=09{OV2722_8BIT, 0x3037, 0xa1},
-=09{OV2722_8BIT, 0x303e, 0x19},
-=09{OV2722_8BIT, 0x3038, 0x06},
-=09{OV2722_8BIT, 0x3018, 0x04},
-
-=09/* Added for power optimization */
-=09{OV2722_8BIT, 0x3000, 0x00},
-=09{OV2722_8BIT, 0x3001, 0x00},
-=09{OV2722_8BIT, 0x3002, 0x00},
-=09{OV2722_8BIT, 0x3a0f, 0x40},
-=09{OV2722_8BIT, 0x3a10, 0x38},
-=09{OV2722_8BIT, 0x3a1b, 0x48},
-=09{OV2722_8BIT, 0x3a1e, 0x30},
-=09{OV2722_8BIT, 0x3a11, 0x90},
-=09{OV2722_8BIT, 0x3a1f, 0x10},
-=09{OV2722_8BIT, 0x3011, 0x22},
-=09{OV2722_8BIT, 0x3a00, 0x58},
-=09{OV2722_8BIT, 0x3503, 0x17},
-=09{OV2722_8BIT, 0x3500, 0x00},
-=09{OV2722_8BIT, 0x3501, 0x46},
-=09{OV2722_8BIT, 0x3502, 0x00},
-=09{OV2722_8BIT, 0x3508, 0x00},
-=09{OV2722_8BIT, 0x3509, 0x10},
-=09{OV2722_TOK_TERM, 0, 0},
-};
-#endif
-
 static const struct ov2722_reg ov2722_1632_1092_30fps[] =3D {
     /* For stand wait for a whole frame complete.(vblank) */
 =09{OV2722_8BIT, 0x3021, 0x03},
@@ -768,115 +435,6 @@ static const struct ov2722_reg ov2722_1452_1092_30fps=
[] =3D {
 =09{OV2722_TOK_TERM, 0, 0}
 };
=20
-#if 0
-static const struct ov2722_reg ov2722_1M3_30fps[] =3D {
-=09{OV2722_8BIT, 0x3718, 0x10},
-=09{OV2722_8BIT, 0x3702, 0x24},
-=09{OV2722_8BIT, 0x373a, 0x60},
-=09{OV2722_8BIT, 0x3715, 0x01},
-=09{OV2722_8BIT, 0x3703, 0x2e},
-=09{OV2722_8BIT, 0x3705, 0x10},
-=09{OV2722_8BIT, 0x3730, 0x30},
-=09{OV2722_8BIT, 0x3704, 0x62},
-=09{OV2722_8BIT, 0x3f06, 0x3a},
-=09{OV2722_8BIT, 0x371c, 0x00},
-=09{OV2722_8BIT, 0x371d, 0xc4},
-=09{OV2722_8BIT, 0x371e, 0x01},
-=09{OV2722_8BIT, 0x371f, 0x0d},
-=09{OV2722_8BIT, 0x3708, 0x61},
-=09{OV2722_8BIT, 0x3709, 0x12},
-=09{OV2722_8BIT, 0x3800, 0x01},
-=09{OV2722_8BIT, 0x3801, 0x4a},=09/* H crop start: 330 */
-=09{OV2722_8BIT, 0x3802, 0x00},
-=09{OV2722_8BIT, 0x3803, 0x03},=09/* V crop start: 3 */
-=09{OV2722_8BIT, 0x3804, 0x06},
-=09{OV2722_8BIT, 0x3805, 0xe1},=09/* H crop end:  1761 */
-=09{OV2722_8BIT, 0x3806, 0x04},
-=09{OV2722_8BIT, 0x3807, 0x47},=09/* V crop end:  1095 */
-=09{OV2722_8BIT, 0x3808, 0x05},
-=09{OV2722_8BIT, 0x3809, 0x88},=09/* H output size: 1416 */
-=09{OV2722_8BIT, 0x380a, 0x04},
-=09{OV2722_8BIT, 0x380b, 0x0a},=09/* V output size: 1034 */
-
-=09/* H blank timing */
-=09{OV2722_8BIT, 0x380c, 0x08},
-=09{OV2722_8BIT, 0x380d, 0x00},=09/* H total size: 2048 */
-=09{OV2722_8BIT, 0x380e, 0x04},
-=09{OV2722_8BIT, 0x380f, 0xa0},=09/* V total size: 1184 */
-=09{OV2722_8BIT, 0x3810, 0x00},
-=09{OV2722_8BIT, 0x3811, 0x05},=09/* H window offset: 5 */
-=09{OV2722_8BIT, 0x3812, 0x00},
-=09{OV2722_8BIT, 0x3813, 0x02},=09/* V window offset: 2 */
-=09{OV2722_8BIT, 0x3820, 0x80},
-=09{OV2722_8BIT, 0x3821, 0x06},=09/* flip isp */
-=09{OV2722_8BIT, 0x3814, 0x11},
-=09{OV2722_8BIT, 0x3815, 0x11},
-=09{OV2722_8BIT, 0x3612, 0x0b},
-=09{OV2722_8BIT, 0x3618, 0x04},
-=09{OV2722_8BIT, 0x3a08, 0x01},
-=09{OV2722_8BIT, 0x3a09, 0x50},
-=09{OV2722_8BIT, 0x3a0a, 0x01},
-=09{OV2722_8BIT, 0x3a0b, 0x18},
-=09{OV2722_8BIT, 0x3a0d, 0x03},
-=09{OV2722_8BIT, 0x3a0e, 0x03},
-=09{OV2722_8BIT, 0x4520, 0x00},
-=09{OV2722_8BIT, 0x4837, 0x1b},
-=09{OV2722_8BIT, 0x3000, 0xff},
-=09{OV2722_8BIT, 0x3001, 0xff},
-=09{OV2722_8BIT, 0x3002, 0xf0},
-=09{OV2722_8BIT, 0x3600, 0x08},
-=09{OV2722_8BIT, 0x3621, 0xc0},
-=09{OV2722_8BIT, 0x3632, 0xd2},=09/* added for power opt */
-=09{OV2722_8BIT, 0x3633, 0x23},
-=09{OV2722_8BIT, 0x3634, 0x54},
-=09{OV2722_8BIT, 0x3f01, 0x0c},
-=09{OV2722_8BIT, 0x5001, 0xc1},=09/* v_en, h_en, blc_en */
-=09{OV2722_8BIT, 0x3614, 0xf0},
-=09{OV2722_8BIT, 0x3630, 0x2d},
-=09{OV2722_8BIT, 0x370b, 0x62},
-=09{OV2722_8BIT, 0x3706, 0x61},
-=09{OV2722_8BIT, 0x4000, 0x02},
-=09{OV2722_8BIT, 0x4002, 0xc5},
-=09{OV2722_8BIT, 0x4005, 0x08},
-=09{OV2722_8BIT, 0x404f, 0x84},
-=09{OV2722_8BIT, 0x4051, 0x00},
-=09{OV2722_8BIT, 0x5000, 0xcf},
-=09{OV2722_8BIT, 0x3a18, 0x00},
-=09{OV2722_8BIT, 0x3a19, 0x80},
-=09{OV2722_8BIT, 0x4521, 0x00},
-=09{OV2722_8BIT, 0x5183, 0xb0},=09/* AWB red */
-=09{OV2722_8BIT, 0x5184, 0xb0},=09/* AWB green */
-=09{OV2722_8BIT, 0x5185, 0xb0},=09/* AWB blue */
-=09{OV2722_8BIT, 0x5180, 0x03},=09/* AWB manual mode */
-=09{OV2722_8BIT, 0x370c, 0x0c},
-=09{OV2722_8BIT, 0x4800, 0x24},=09/* clk lane gate enable */
-=09{OV2722_8BIT, 0x3035, 0x00},
-=09{OV2722_8BIT, 0x3036, 0x26},
-=09{OV2722_8BIT, 0x3037, 0xa1},
-=09{OV2722_8BIT, 0x303e, 0x19},
-=09{OV2722_8BIT, 0x3038, 0x06},
-=09{OV2722_8BIT, 0x3018, 0x04},
-
-=09/* Added for power optimization */
-=09{OV2722_8BIT, 0x3000, 0x00},
-=09{OV2722_8BIT, 0x3001, 0x00},
-=09{OV2722_8BIT, 0x3002, 0x00},
-=09{OV2722_8BIT, 0x3a0f, 0x40},
-=09{OV2722_8BIT, 0x3a10, 0x38},
-=09{OV2722_8BIT, 0x3a1b, 0x48},
-=09{OV2722_8BIT, 0x3a1e, 0x30},
-=09{OV2722_8BIT, 0x3a11, 0x90},
-=09{OV2722_8BIT, 0x3a1f, 0x10},
-=09{OV2722_8BIT, 0x3503, 0x17},
-=09{OV2722_8BIT, 0x3500, 0x00},
-=09{OV2722_8BIT, 0x3501, 0x46},
-=09{OV2722_8BIT, 0x3502, 0x00},
-=09{OV2722_8BIT, 0x3508, 0x00},
-=09{OV2722_8BIT, 0x3509, 0x10},
-=09{OV2722_TOK_TERM, 0, 0},
-};
-#endif
-
 static const struct ov2722_reg ov2722_1080p_30fps[] =3D {
     /* For stand wait for a whole frame complete.(vblank) */
 =09{OV2722_8BIT, 0x3021, 0x03},
@@ -982,108 +540,6 @@ static const struct ov2722_reg ov2722_1080p_30fps[] =
=3D {
 =09{OV2722_TOK_TERM, 0, 0}
 };
=20
-#if 0 /* Currently unused */
-static const struct ov2722_reg ov2722_720p_30fps[] =3D {
-=09{OV2722_8BIT, 0x3021, 0x03},
-=09{OV2722_8BIT, 0x3718, 0x10},
-=09{OV2722_8BIT, 0x3702, 0x24},
-=09{OV2722_8BIT, 0x373a, 0x60},
-=09{OV2722_8BIT, 0x3715, 0x01},
-=09{OV2722_8BIT, 0x3703, 0x2e},
-=09{OV2722_8BIT, 0x3705, 0x10},
-=09{OV2722_8BIT, 0x3730, 0x30},
-=09{OV2722_8BIT, 0x3704, 0x62},
-=09{OV2722_8BIT, 0x3f06, 0x3a},
-=09{OV2722_8BIT, 0x371c, 0x00},
-=09{OV2722_8BIT, 0x371d, 0xc4},
-=09{OV2722_8BIT, 0x371e, 0x01},
-=09{OV2722_8BIT, 0x371f, 0x0d},
-=09{OV2722_8BIT, 0x3708, 0x61},
-=09{OV2722_8BIT, 0x3709, 0x12},
-=09{OV2722_8BIT, 0x3800, 0x01},
-=09{OV2722_8BIT, 0x3801, 0x40}, /* H crop start: 320 */
-=09{OV2722_8BIT, 0x3802, 0x00},
-=09{OV2722_8BIT, 0x3803, 0xb1}, /* V crop start: 177 */
-=09{OV2722_8BIT, 0x3804, 0x06},
-=09{OV2722_8BIT, 0x3805, 0x55}, /* H crop end: 1621 */
-=09{OV2722_8BIT, 0x3806, 0x03},
-=09{OV2722_8BIT, 0x3807, 0x95}, /* V crop end: 918 */
-=09{OV2722_8BIT, 0x3808, 0x05},
-=09{OV2722_8BIT, 0x3809, 0x10}, /* H output size: 0x0788=3D=3D1928 */
-=09{OV2722_8BIT, 0x380a, 0x02},
-=09{OV2722_8BIT, 0x380b, 0xe0}, /* output size: 0x02DE=3D=3D734 */
-=09{OV2722_8BIT, 0x380c, 0x08},
-=09{OV2722_8BIT, 0x380d, 0x00}, /* H timing: 2048 */
-=09{OV2722_8BIT, 0x380e, 0x04},
-=09{OV2722_8BIT, 0x380f, 0xa3}, /* V timing: 1187 */
-=09{OV2722_8BIT, 0x3810, 0x00},
-=09{OV2722_8BIT, 0x3811, 0x03}, /* H window offset: 3 */
-=09{OV2722_8BIT, 0x3812, 0x00},
-=09{OV2722_8BIT, 0x3813, 0x02}, /* V window offset: 2 */
-=09{OV2722_8BIT, 0x3820, 0x80},
-=09{OV2722_8BIT, 0x3821, 0x06}, /* mirror */
-=09{OV2722_8BIT, 0x3814, 0x11},
-=09{OV2722_8BIT, 0x3815, 0x11},
-=09{OV2722_8BIT, 0x3612, 0x0b},
-=09{OV2722_8BIT, 0x3618, 0x04},
-=09{OV2722_8BIT, 0x3a08, 0x01},
-=09{OV2722_8BIT, 0x3a09, 0x50},
-=09{OV2722_8BIT, 0x3a0a, 0x01},
-=09{OV2722_8BIT, 0x3a0b, 0x18},
-=09{OV2722_8BIT, 0x3a0d, 0x03},
-=09{OV2722_8BIT, 0x3a0e, 0x03},
-=09{OV2722_8BIT, 0x4520, 0x00},
-=09{OV2722_8BIT, 0x4837, 0x1b},
-=09{OV2722_8BIT, 0x3600, 0x08},
-=09{OV2722_8BIT, 0x3621, 0xc0},
-=09{OV2722_8BIT, 0x3632, 0xd2}, /* added for power opt */
-=09{OV2722_8BIT, 0x3633, 0x23},
-=09{OV2722_8BIT, 0x3634, 0x54},
-=09{OV2722_8BIT, 0x3f01, 0x0c},
-=09{OV2722_8BIT, 0x5001, 0xc1},
-=09{OV2722_8BIT, 0x3614, 0xf0},
-=09{OV2722_8BIT, 0x3630, 0x2d},
-=09{OV2722_8BIT, 0x370b, 0x62},
-=09{OV2722_8BIT, 0x3706, 0x61},
-=09{OV2722_8BIT, 0x4000, 0x02},
-=09{OV2722_8BIT, 0x4002, 0xc5},
-=09{OV2722_8BIT, 0x4005, 0x08},
-=09{OV2722_8BIT, 0x404f, 0x84},
-=09{OV2722_8BIT, 0x4051, 0x00},
-=09{OV2722_8BIT, 0x5000, 0xcf}, /* manual 3a */
-=09{OV2722_8BIT, 0x301d, 0xf0}, /* enable group hold */
-=09{OV2722_8BIT, 0x3a18, 0x00},
-=09{OV2722_8BIT, 0x3a19, 0x80},
-=09{OV2722_8BIT, 0x4521, 0x00},
-=09{OV2722_8BIT, 0x5183, 0xb0},
-=09{OV2722_8BIT, 0x5184, 0xb0},
-=09{OV2722_8BIT, 0x5185, 0xb0},
-=09{OV2722_8BIT, 0x370c, 0x0c},
-=09{OV2722_8BIT, 0x3035, 0x00},
-=09{OV2722_8BIT, 0x3036, 0x26}, /* {0x3036, 0x2c}, //422.4 MHz */
-=09{OV2722_8BIT, 0x3037, 0xa1},
-=09{OV2722_8BIT, 0x303e, 0x19},
-=09{OV2722_8BIT, 0x3038, 0x06},
-=09{OV2722_8BIT, 0x3018, 0x04},
-=09{OV2722_8BIT, 0x3000, 0x00}, /* added for power optimization */
-=09{OV2722_8BIT, 0x3001, 0x00},
-=09{OV2722_8BIT, 0x3002, 0x00},
-=09{OV2722_8BIT, 0x3a0f, 0x40},
-=09{OV2722_8BIT, 0x3a10, 0x38},
-=09{OV2722_8BIT, 0x3a1b, 0x48},
-=09{OV2722_8BIT, 0x3a1e, 0x30},
-=09{OV2722_8BIT, 0x3a11, 0x90},
-=09{OV2722_8BIT, 0x3a1f, 0x10},
-=09{OV2722_8BIT, 0x3503, 0x17}, /* manual 3a */
-=09{OV2722_8BIT, 0x3500, 0x00},
-=09{OV2722_8BIT, 0x3501, 0x3F},
-=09{OV2722_8BIT, 0x3502, 0x00},
-=09{OV2722_8BIT, 0x3508, 0x00},
-=09{OV2722_8BIT, 0x3509, 0x00},
-=09{OV2722_TOK_TERM, 0, 0},
-};
-#endif
-
 static struct ov2722_resolution ov2722_res_preview[] =3D {
 =09{
 =09=09.desc =3D "ov2722_1632_1092_30fps",
@@ -1128,99 +584,6 @@ static struct ov2722_resolution ov2722_res_preview[] =
=3D {
=20
 #define N_RES_PREVIEW (ARRAY_SIZE(ov2722_res_preview))
=20
-/*
- * Disable non-preview configurations until the configuration selection is
- * improved.
- */
-#if 0
-struct ov2722_resolution ov2722_res_still[] =3D {
-=09{
-=09=09.desc =3D "ov2722_480P_30fps",
-=09=09.width =3D 1632,
-=09=09.height =3D 1092,
-=09=09.fps =3D 30,
-=09=09.pix_clk_freq =3D 85,
-=09=09.used =3D 0,
-=09=09.pixels_per_line =3D 2260,
-=09=09.lines_per_frame =3D 1244,
-=09=09.skip_frames =3D 3,
-=09=09.regs =3D ov2722_1632_1092_30fps,
-=09=09.mipi_freq =3D 422400,
-=09},
-=09{
-=09=09.desc =3D "ov2722_1452_1092_30fps",
-=09=09.width =3D 1452,
-=09=09.height =3D 1092,
-=09=09.fps =3D 30,
-=09=09.pix_clk_freq =3D 85,
-=09=09.used =3D 0,
-=09=09.pixels_per_line =3D 2260,
-=09=09.lines_per_frame =3D 1244,
-=09=09.skip_frames =3D 3,
-=09=09.regs =3D ov2722_1452_1092_30fps,
-=09=09.mipi_freq =3D 422400,
-=09},
-=09{
-=09=09.desc =3D "ov2722_1080P_30fps",
-=09=09.width =3D 1932,
-=09=09.height =3D 1092,
-=09=09.pix_clk_freq =3D 69,
-=09=09.fps =3D 30,
-=09=09.used =3D 0,
-=09=09.pixels_per_line =3D 2068,
-=09=09.lines_per_frame =3D 1114,
-=09=09.skip_frames =3D 3,
-=09=09.regs =3D ov2722_1080p_30fps,
-=09=09.mipi_freq =3D 345600,
-=09},
-};
-
-#define N_RES_STILL (ARRAY_SIZE(ov2722_res_still))
-
-struct ov2722_resolution ov2722_res_video[] =3D {
-=09{
-=09=09.desc =3D "ov2722_QVGA_30fps",
-=09=09.width =3D 336,
-=09=09.height =3D 256,
-=09=09.fps =3D 30,
-=09=09.pix_clk_freq =3D 73,
-=09=09.used =3D 0,
-=09=09.pixels_per_line =3D 2048,
-=09=09.lines_per_frame =3D 1184,
-=09=09.skip_frames =3D 3,
-=09=09.regs =3D ov2722_QVGA_30fps,
-=09=09.mipi_freq =3D 364800,
-=09},
-=09{
-=09=09.desc =3D "ov2722_480P_30fps",
-=09=09.width =3D 736,
-=09=09.height =3D 496,
-=09=09.fps =3D 30,
-=09=09.pix_clk_freq =3D 73,
-=09=09.used =3D 0,
-=09=09.pixels_per_line =3D 2048,
-=09=09.lines_per_frame =3D 1184,
-=09=09.skip_frames =3D 3,
-=09=09.regs =3D ov2722_480P_30fps,
-=09},
-=09{
-=09=09.desc =3D "ov2722_1080P_30fps",
-=09=09.width =3D 1932,
-=09=09.height =3D 1092,
-=09=09.pix_clk_freq =3D 69,
-=09=09.fps =3D 30,
-=09=09.used =3D 0,
-=09=09.pixels_per_line =3D 2068,
-=09=09.lines_per_frame =3D 1114,
-=09=09.skip_frames =3D 3,
-=09=09.regs =3D ov2722_1080p_30fps,
-=09=09.mipi_freq =3D 345600,
-=09},
-};
-
-#define N_RES_VIDEO (ARRAY_SIZE(ov2722_res_video))
-#endif
-
 static struct ov2722_resolution *ov2722_res =3D ov2722_res_preview;
 static unsigned long N_RES =3D N_RES_PREVIEW;
 #endif
--=20
2.50.1 (Apple Git-155)



