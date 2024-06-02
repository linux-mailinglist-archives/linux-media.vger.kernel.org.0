Return-Path: <linux-media+bounces-12388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794CC8D7668
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 16:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3267D2813E5
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 14:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB1F482C8;
	Sun,  2 Jun 2024 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LIWkbNCd"
X-Original-To: linux-media@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-210.smtpout.orange.fr [193.252.23.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51862AEE0;
	Sun,  2 Jun 2024 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717339087; cv=none; b=MdiWH1GT+ZfwWC9AkCkeulfs8KWKpqHrLvl0ueqYBdgtOdrRYQofyqLp/9JqkyjMx6oCYLj9ZW7nzAdvq+3ye40VluYKAj+7vA2TcombHucWvsPxRNv31UrrOtSSpnSrxwPN4FeDKEWXKarGTrUc97khaJiqBu6E05Xjn/7pmR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717339087; c=relaxed/simple;
	bh=LVysQP63kxgkOPJHDyBMkif3ydpiiR5UrzTv9VFOl8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PbStoFn79rYOap8TCWHYaNF2qLEdhQm5f42AvsgA8KX+Ap0Mj2tbk2G9jsWpY+Z0lgc5qOQMWMNoo927GOKJwYhzooS+NYOY0gAGDOnQ9E+EU+NPiffe8lrY2E09tsHcU8wEMY/+fJ59nc9mC7ljpiDt9fszqw+O4sXJg83IiFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=LIWkbNCd; arc=none smtp.client-ip=193.252.23.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id DmCns7nHE13tqDmCnsrjoC; Sun, 02 Jun 2024 16:29:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1717338547;
	bh=dcmvFoYnZSeTd8Kj+AiRlBV6qhwSnFlJXOzqirkIDKI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=LIWkbNCd6zg0rtja3DStnWdGogy3nvoA9T+e2ySWipMxQ9jydRKgLoHXT/kDBMLQY
	 CbLbVJHriAfr6I94ftpHLQpJYuAVzTTRGk9u9pohxEP9CrgVlCr4z3fgsW+89cH0IO
	 447SIjK5yUp5tzZ4Hxsnghpj+d4uvtJjz8/tQ6LpDYT9nbwk6pBk9FBTBzQJDdG0J+
	 sy8h1EvOzojsc8fI7NeXV1MzBswZE+7/vqy0CsoQhWfwlRD4Amo6aI6SxP91i90pAQ
	 7zvWE1s/BPtThw82pWhoCrqOLREqTi4HjcWEmVA1i98UpHR4o6EgE3zmzBgmi4nDpz
	 +OTZSaCoEB+mQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Jun 2024 16:29:07 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] media: venus: Constify struct dec_bufsize_ops and enc_bufsize_ops
Date: Sun,  2 Jun 2024 16:27:34 +0200
Message-ID: <9bc4b24a55c42fa49125cae0304c8b0f208550b1.1717313173.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"struct dec_bufsize_ops and "struct enc_bufsize_ops" are not modified in
this driver.

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
   text	   data	    bss	    dec	    hex	filename
  12494	    822	      0	  13316	   3404	drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o

After:
   text	   data	    bss	    dec	    hex	filename
  12766	    566	      0	  13332	   3414	drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in v2:
   - Add missing prefix in the subject

v1: https://lore.kernel.org/all/9bc4b28a55c42fa4a125c3e03d4c8b0f208550b4.1717313173.git.christophe.jaillet@wanadoo.fr/

While looking at lore to find the reference above, I found that this
patch had already been sent by Rikard Falkeborn <rikard.falkeborn@gmail.com>
See: https://lore.kernel.org/all/20211212123534.4473-1-rikard.falkeborn@gmail.com/

So, if applied, credits should be for him.
So feel free to add a Co-Developed-by:, Reported-by:, Suggested-by: or
whatever makes sense, including removing my Signed-off-by: to put his if
it sounds better to do it this way.

 .../platform/qcom/venus/hfi_plat_bufs_v6.c    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
index f5a655973c08..6289166786ec 100644
--- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
@@ -1063,51 +1063,51 @@ struct enc_bufsize_ops {
 	u32 (*persist)(void);
 };
 
-static struct dec_bufsize_ops dec_h264_ops = {
+static const struct dec_bufsize_ops dec_h264_ops = {
 	.scratch = h264d_scratch_size,
 	.scratch1 = h264d_scratch1_size,
 	.persist1 = h264d_persist1_size,
 };
 
-static struct dec_bufsize_ops dec_h265_ops = {
+static const struct dec_bufsize_ops dec_h265_ops = {
 	.scratch = h265d_scratch_size,
 	.scratch1 = h265d_scratch1_size,
 	.persist1 = h265d_persist1_size,
 };
 
-static struct dec_bufsize_ops dec_vp8_ops = {
+static const struct dec_bufsize_ops dec_vp8_ops = {
 	.scratch = vpxd_scratch_size,
 	.scratch1 = vp8d_scratch1_size,
 	.persist1 = vp8d_persist1_size,
 };
 
-static struct dec_bufsize_ops dec_vp9_ops = {
+static const struct dec_bufsize_ops dec_vp9_ops = {
 	.scratch = vpxd_scratch_size,
 	.scratch1 = vp9d_scratch1_size,
 	.persist1 = vp9d_persist1_size,
 };
 
-static struct dec_bufsize_ops dec_mpeg2_ops = {
+static const struct dec_bufsize_ops dec_mpeg2_ops = {
 	.scratch = mpeg2d_scratch_size,
 	.scratch1 = mpeg2d_scratch1_size,
 	.persist1 = mpeg2d_persist1_size,
 };
 
-static struct enc_bufsize_ops enc_h264_ops = {
+static const struct enc_bufsize_ops enc_h264_ops = {
 	.scratch = h264e_scratch_size,
 	.scratch1 = h264e_scratch1_size,
 	.scratch2 = enc_scratch2_size,
 	.persist = enc_persist_size,
 };
 
-static struct enc_bufsize_ops enc_h265_ops = {
+static const struct enc_bufsize_ops enc_h265_ops = {
 	.scratch = h265e_scratch_size,
 	.scratch1 = h265e_scratch1_size,
 	.scratch2 = enc_scratch2_size,
 	.persist = enc_persist_size,
 };
 
-static struct enc_bufsize_ops enc_vp8_ops = {
+static const struct enc_bufsize_ops enc_vp8_ops = {
 	.scratch = vp8e_scratch_size,
 	.scratch1 = vp8e_scratch1_size,
 	.scratch2 = enc_scratch2_size,
@@ -1186,7 +1186,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
 	u32 codec = params->codec;
 	u32 width = params->width, height = params->height, out_min_count;
 	u32 out_width = params->out_width, out_height = params->out_height;
-	struct dec_bufsize_ops *dec_ops;
+	const struct dec_bufsize_ops *dec_ops;
 	bool is_secondary_output = params->dec.is_secondary_output;
 	bool is_interlaced = params->dec.is_interlaced;
 	u32 max_mbs_per_frame = params->dec.max_mbs_per_frame;
@@ -1260,7 +1260,7 @@ static int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
 		      struct hfi_buffer_requirements *bufreq)
 {
 	enum hfi_version version = params->version;
-	struct enc_bufsize_ops *enc_ops;
+	const struct enc_bufsize_ops *enc_ops;
 	u32 width = params->width;
 	u32 height = params->height;
 	bool is_tenbit = params->enc.is_tenbit;
-- 
2.45.1


