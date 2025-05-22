Return-Path: <linux-media+bounces-33207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3126AC14E2
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 416101B654E8
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBFF2BE7B7;
	Thu, 22 May 2025 19:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwgLfahV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E51C27715;
	Thu, 22 May 2025 19:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747942652; cv=none; b=Q+y6XJReIlz21NAHhvwTfzybWs1Fw+EOlqEDD3yz9dOiwAmiIJztQwO2kn0kRcDILrZD4WitIRlEWgF/ZYBOuNQoGJqt4TFpfefcM66G2I4WhuDIAawCEINd7nwB7KbNFau3YthjR819MR5sx7XH52IpQsXMcgHr915xMpbp/zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747942652; c=relaxed/simple;
	bh=tQhN0Wlq5U9IF4ibaFAIEumKywaW+1/Fd4rXq0uGPyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ldQuJ+g3MboGZSXRoUgmkyDb6zze3AatLuN4Bc+XlE6I0GU02Jub0WQfypkIgJZ32RXzK+F36xrQoiIeulezS+ZhDRjfAnMNbuDnFV7wwaDgxmQWN/kVsC3peHCxj5leJS9Kbu/+MarkGpMpYaHKEQ+YM4yeraVMr3L1g/bH8Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwgLfahV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB70C4CEE4;
	Thu, 22 May 2025 19:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747942651;
	bh=tQhN0Wlq5U9IF4ibaFAIEumKywaW+1/Fd4rXq0uGPyE=;
	h=From:Date:Subject:To:Cc:From;
	b=gwgLfahV58B4AzMYeRQT00MdJCQ4kQgITPco0s364G9AMSF0yvSgrSsQicWHGo84I
	 pdAQvGu1q6C7WpV7IjOP681misukPx8REhl2YJp3jjKzAB6ed2CtsnbO6zmlG5uONT
	 jyLXZ5ChP0AslRvlyfv1+GNukXDkB4w6P4pc6Mf5o0V6jOGlF0pyhzmqdEDmNQd2aD
	 YEsXvVBcwAdxiBLNws0kl5mdiDs9XcysOGQj7ADagvtfg0rB0bcdP0n0BZpeFYNGiI
	 bM6M8iGPSnwgBQvvQ4iSf33abzrErAy2j1+5Vv1kh8fQo/eqzBnmlR8QuLfIG2waPB
	 ClBYXjQwvVy2Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 22 May 2025 21:37:22 +0200
Subject: [PATCH] media: qcom: camss: Fix SM8250 IFE0/1 max clock rate
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-topic-8250_camss_ifeclkfix-v1-1-349350d31238@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPF8L2gC/x3MSwqAMAwA0atI1hZqoCheRUS0phr80ogIxbsbX
 L5ZTAKhyCRQZwki3Sx87Ioiz8DP/T6R4VENaNFZh2iu42RvKlXn+02k40B+XQI/hgYsSxxD4dC
 CDs5Imv95077vB5jB3w1sAAAA
X-Change-ID: 20250522-topic-8250_camss_ifeclkfix-eb2772df1520
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Jonathan Marek <jonathan@marek.ca>, 
 Julian Grahsl <jgrahsl@snap.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747942648; l=1524;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=+rl9kXV8XXJloQWBKyExK8MuwgoAL3jm+NqlxZwlAKI=;
 b=vd25Z5v/JH/GX4uuQKhTFyUS7UNKO6DGywicc1jZu7gHG6X/ObK0uWNWG3+T0Zom1iKs8hMe2
 M8siK1x0R1XBUjN8sTR4ovfdapdZyu49A7sgplg0DV102B02XPoP7L6
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

720 MHz was used on the prototype revision (v1), use the 680 MHz that
our clock driver expects.

Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Jordan Crouse <jordan@cosmicpenguin.net>
---
 drivers/media/platform/qcom/camss/camss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06f42875702f02f9d8d83d06ddaa972eacb593f8..4507131c651d392055d2f69c8ebcaf484c830c99 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1355,7 +1355,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 0 },
 				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 350000000, 475000000, 576000000, 680000000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "vfe0" },
@@ -1381,7 +1381,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 0 },
 				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 350000000, 475000000, 576000000, 680000000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "vfe1" },

---
base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
change-id: 20250522-topic-8250_camss_ifeclkfix-eb2772df1520

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


