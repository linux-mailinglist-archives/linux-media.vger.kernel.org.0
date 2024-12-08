Return-Path: <linux-media+bounces-22837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E319E8380
	for <lists+linux-media@lfdr.de>; Sun,  8 Dec 2024 05:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDF952818D7
	for <lists+linux-media@lfdr.de>; Sun,  8 Dec 2024 04:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BD72AE6A;
	Sun,  8 Dec 2024 04:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="r2bNnv0L"
X-Original-To: linux-media@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFE64690;
	Sun,  8 Dec 2024 04:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733630479; cv=none; b=TJZ2PwY4dHGhexuZ04RP3FFWygBt3N3PH0Ps48Q5lxWqxM7GhOLaRakRolrUTTSyI0aI4OZEZc1i9vItBSVYBjv++kTrJjhiWaj5br8UcSvWLhX0gK6I4i+gBPoHDQ5GiqMFYbjFgZVBRdoTdz3a+wES6LjwWhCt81ESsm5JJNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733630479; c=relaxed/simple;
	bh=rywh8j+vsOGen2cnijZ4sX5uDqP9nf0EX8pEGP499QM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VF7GmtHDClNP5FrV0PRIB87+gD2xtCAA+g9HD+XOwmyUc3ZCCFangt7EGCFXOfHip7AVkF0B2Eb5lmzYWKmxKbJzAulohL7DBtEtd95xuvKgCzQtznIChSRJFew+aynUn1H95nzcKQOfT8CTObp4L8MWGWBcQn5zzFQ1AVB8JSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=r2bNnv0L; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from newone.lan (99-158-29-91.lightspeed.miamfl.sbcglobal.net [99.158.29.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id A321E1662D2;
	Sun,  8 Dec 2024 05:01:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1733630465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kv9gGodx3BkdkBDxZJOBxwhrGWYOwsmC1Hy2kXTJCJY=;
	b=r2bNnv0LZj/3CGFgy/YbDmOCOvo82yIZQFgsWpk0j0wB7FMupD/4cYa8UEVtDkIWsG2Pag
	tt4nf3O5t9/XWK1tGmECng5uhts1qlJCEaTXnC5VBgV3K7eDqGLBqZevyvDyQ9WYzjCVSN
	P4URMmOzeA8738QYfOPBh6fUkbipP5Q=
From: David Heidelberg <david@ixit.cz>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: qcom: camss: Add sm845 named power-domain support
Date: Sat,  7 Dec 2024 23:00:48 -0500
Message-ID: <20241208040055.30509-1-david@ixit.cz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Caleb Connolly <caleb.connolly@linaro.org>

Declare power-domain names "top", "ife0" and "ife1" eponymously for the
power-domains TITAN_TOP_GDSC, IFE_0_GDSC and IFE_1_GDSC respectively.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git ./drivers/media/platform/qcom/camss/camss.c ./drivers/media/platform/qcom/camss/camss.c
index 67fb11cbe865..62c556c4fcf8 100644
--- ./drivers/media/platform/qcom/camss/camss.c
+++ ./drivers/media/platform/qcom/camss/camss.c
@@ -927,6 +927,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.interrupt = { "vfe0" },
 		.vfe = {
 			.line_num = 4,
+			.pd_name = "ife0",
 			.has_pd = true,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
@@ -954,6 +955,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.interrupt = { "vfe1" },
 		.vfe = {
 			.line_num = 4,
+			.pd_name = "ife1",
 			.has_pd = true,
 			.hw_ops = &vfe_ops_170,
 			.formats_rdi = &vfe_formats_rdi_845,
@@ -2647,6 +2649,7 @@ static const struct camss_resources sdm660_resources = {
 
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
+	.pd_name = "top",
 	.csiphy_res = csiphy_res_845,
 	.csid_res = csid_res_845,
 	.vfe_res = vfe_res_845,
-- 
2.45.2


