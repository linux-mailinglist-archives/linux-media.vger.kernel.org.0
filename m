Return-Path: <linux-media+bounces-33717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60995AC9AE6
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 14:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8621E189FBD1
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 12:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B2D23BD1F;
	Sat, 31 May 2025 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vw0vbB6M"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB3412B63;
	Sat, 31 May 2025 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694139; cv=none; b=NJGq+q4lEqY0zGvTETdcXicCSiiMWm5lCMwqllx8FYs2n+TycIfaVmyAWNl07TYeJum3ZJ6tevaootOV2NV9KYZAtgpJS7NWXIkcL9pXXzl7cUDiUfqYcMrhZrB1qdVFt1vs1Yn/Z2TLcnix30Lu4KBa8sCrRCqphEMEwc+63hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694139; c=relaxed/simple;
	bh=c+8ZXnRrXYl4BAukTBnGw3niuz/E3mzQnIUtiZYPVVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mc6sOgKVnoOqQkzsA5sIPTxioKU5GJw4EZZBZQ3qMY6Ugp4syGuyGZ7g+SGtZaHE9WOEG9lesfw4VvOIsCBAOOptRGWSuk4DW7HhORjrYIGFZjAjpCvsMI3qNh+4X2MIGbmr9nCAalpF9V1bAjdwVoP6IWy/vCi1VMtpP4mdh6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vw0vbB6M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C236CC4CEEF;
	Sat, 31 May 2025 12:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748694139;
	bh=c+8ZXnRrXYl4BAukTBnGw3niuz/E3mzQnIUtiZYPVVs=;
	h=From:Date:Subject:To:Cc:From;
	b=Vw0vbB6MST6xdt5/LQw4H+Mi9Yty1C2BBDjPi4eFmVXanb4yZlK+9sudFLT2Y/vSM
	 R9SJY/7yHf0qfOia8ZPL84uZio4gRolRPO+0KTqLCOQplH3srPOOKkvSp8ZW2wCzyV
	 3QMTnF0JRYU/osZ/GiWQ8KECb0E34dkQcw6264OjBTtxdQw9cYeA+n3F3TAvPittrz
	 0JISQ2cB9KOCXz2QK5D2tBsBqqIJ6MudFR2G4c2uLmCLHM1MImbwAOC9iMaRAWxuey
	 aymOcA5CinC/c3Y2woM463GLqROwkfm81tZFVGNSpaqSfPWL6yvzjLNYC/+q7zQd/L
	 +/Y7JZSmhCu3g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 31 May 2025 14:22:00 +0200
Subject: [PATCH] media: venus: Fix MSM8998 frequency table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGf0OmgC/x3M3wpAMBSA8VfRubaaP8fwKpKYg1MabbOUvLvl8
 nfxfQ84skwO2uQBS4EdHyYiSxPQ22hWEjxHQy5zlFhkwh8naxHIXG5o6sFPu0BVYaVwLDUhxPC
 0tPD9T7v+fT8gveIqZAAAAA==
X-Change-ID: 20250531-topic-venus_98_tbl-5765675a4ce5
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Marc Gonzalez <mgonzalez@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748694135; l=1429;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gomQyg18tv6Q8Zc9/9SZYn+kdr7+yotxTgG692Uq7VY=;
 b=gPb55TPnGD4sQ4G2MDcWNEPl6U3XWKXNImSwmeGOoWybZ2rCj2dvJQvPh0NhtZUSmKSuuSqWp
 R08hF+IarNDAMk/nRr+l83rr5t9oT30MvUVSDaScsWrK55cd78ZvosF
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fill in the correct data for the production SKU.

Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index d305d74bb152d21133c4dfa23805b17274426a5c..2bb514c322692475ed58198e17f906f894d81cf4 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -709,11 +709,11 @@ static const struct venus_resources msm8996_res = {
 };
 
 static const struct freq_tbl msm8998_freq_table[] = {
-	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
-	{  972000, 465000000 },	/* 4k UHD @ 30 */
-	{  489600, 360000000 },	/* 1080p @ 60 */
-	{  244800, 186000000 },	/* 1080p @ 30 */
-	{  108000, 100000000 },	/* 720p @ 30 */
+	{ 1728000, 533000000 },	/* 4k UHD @ 60 (decode only) */
+	{ 1036800, 444000000 },	/* 2k @ 120 */
+	{  829440, 355200000 },	/* 4k @ 44 */
+	{  489600, 269330000 },/* 4k @ 30 */
+	{  108000, 200000000 },	/* 1080p @ 60 */
 };
 
 static const struct reg_val msm8998_reg_preset[] = {

---
base-commit: 2a628f951ed54c30a232230b5b58349d2a8dbb11
change-id: 20250531-topic-venus_98_tbl-5765675a4ce5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


