Return-Path: <linux-media+bounces-50950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE36D38F73
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 16:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D69630274DA
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 15:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F5B24DCF9;
	Sat, 17 Jan 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="py4Lu3HS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391A21D3CD;
	Sat, 17 Jan 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768664182; cv=none; b=Uve+K3uvoAZkXuRzRP1X6SbUjAQpBxbgCaaKRnutUDdYnTxOQ2GOY1TcnSLuu69XYnFjG8W9Wqeh6EIxTv0kzI0zVGY5QCYLKykbjaExprVul1EGAo4BzlPwOOf3HWse9An1FDxm4JfE13oHCov9SshYpWR+zRg0NvwdY22puLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768664182; c=relaxed/simple;
	bh=tB6CKOcLCKRLvag2fVDftQ2qhtZeo9gQPSCm41oUyyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bYPS6TP2DgZJhLy8X2Z95rZsQdEB344nJAvLKQdT56Ywmal4SCFl7qRRIwetunAAH4AWhuxTP4pqnt/9daqNKZ8VfZ/c8fqvGmHVhjeq6I5UYdpTMNF6XDb9Kfgpwi8YzMJtoqZFWmkTr4hci4ZMe2P8K5oDITDvOjev6ZLsM3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=py4Lu3HS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7778C2BCAF;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768664181;
	bh=tB6CKOcLCKRLvag2fVDftQ2qhtZeo9gQPSCm41oUyyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=py4Lu3HS6xAv1nQE32Fa0EA0M5H98u/IsrqJN8Qi7Sm1aT28XgcwU8fr4SujI/uvS
	 b1X/jMwPMODwMRFkzj0ngag3h9ribhPjdjURhink7vukW/mNsPng73yXxJvMKRzx4H
	 cmyBntc1Nibxef/D2gZWa6G7dvrjjzeyakFF66CWU7hsv9kXYM86XcZ4JPc9aGy8pc
	 AlVyjgYPlhyAMyY5YnVgQsVWGbvi5mODeS87DggqyZjfVWxmmbsmcN1aRhlgti/3vp
	 UoB/0enxC726yex1qWkm7Y8RbWNBXj7QDHivxQpqoTxNMGkQJnj1U8I1lPtOC0peuH
	 hKTCwozKA308g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD57BC9832E;
	Sat, 17 Jan 2026 15:36:21 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 17 Jan 2026 16:36:19 +0100
Subject: [PATCH v3 4/8] media: qcom: camss: Initialize lanes after lane
 configuration is available
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-qcom-cphy-v3-4-8ce76a06f7db@ixit.cz>
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
In-Reply-To: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4053; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=bN/t/C2GIShfOVzwRvV0BWuY9NdSDBbpfhU0nMkYHkI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpa6xz7DgM5S1pYqMViRfwCQUU2lkTIKXtTFd9b
 AHuyvR2+JmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaWuscwAKCRBgAj/E00kg
 csy0EACsZ1JU/z1qreP3l7SvXlF2izDtAyf6FDXOrTxKmkdOzfdSpUU1sXT/vUILv/qNiTIxRU6
 K8tVPqGJyEakyaU62d+DLsBbzXMq1Kmav1uMYxyQcgJb5l2PuFJ1KSOgIWsz75fjvzQqk2LWXSu
 bFNLue/w7IffBp5ci25hsH4N/YWZ15abbPoYWvgUtSiZiZZwILTwBcaX6/J8Ve2iBxi8XB3Dq8B
 sEG3/IrIDM9885t8rbFAoV3jSHr35ilWnYZewLkMU9yHZmXeUmZhZdnIui14lc9L6KT8J5A6EUt
 gAVjAK+Tp5Vcq7YyTqNTF3oJ5VvBTifOuukEDrab/Ko9MGDKgXsxrDpM07xDHvfn3b5C5DerHXK
 lE1I83GV15wD/eKa0czpHoV4aqPYlpq++n7LuVJIqwXq8hSqr8s8fidNx/A53eMBxTNelBoflo9
 fLEPv074T59DIEJlc2X056HS9MLZHWweqw0aKRM+9y6XjOyLbNOYubXpM697aD4afjZhdu3j/ta
 B354o15bM3LSRE82AOyESXCvu/liskC2cTskjK4RBSVwWR3eTiItQSXHolqI1Aq12X3I9lyTRL9
 OhhrLEd/tE2MBZgR7ZiegQQE4huJCqiB43LNQfsVzgLxP1umvRCIrnU9nDt9ahwVEkRkzdvHc+t
 EwWJWTLG4vKDO3w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Petr Hodina <phodina@protonmail.com>

The lanes must not be initialized before the driver has access to
the lane configuration, as it depends on whether D-PHY or C-PHY mode
is in use. Move the lane initialization to a later stage where the
configuration structures are available.

Signed-off-by: Petr Hodina <phodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 91 ++++++++++++++--------
 1 file changed, 57 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f3a8625511e1e..9e8470358515f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1048,6 +1048,62 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
 	u8 val;
 	int i;
 
+	switch (csiphy->camss->res->version) {
+	case CAMSS_845:
+		{ /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_sdm845[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
+		}
+		break;
+	case CAMSS_2290:
+	case CAMSS_6150:
+		{ /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_qcm2290[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
+		}
+		break;
+	case CAMSS_7280:
+	case CAMSS_8250:
+		{ /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_sm8250[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
+		}
+		break;
+	case CAMSS_8280XP:
+		{ /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_sc8280xp[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
+		}
+		break;
+	case CAMSS_X1E80100:
+		{ /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_x1e80100[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
+		}
+		break;
+	case CAMSS_8550:
+		{ /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_sm8550[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
+		}
+		break;
+	case CAMSS_8650:
+		{ /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_sm8650[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
+		}
+		break;
+	case CAMSS_8300:
+	case CAMSS_8775P:
+		{ /* V4L2_MBUS_CSI2_DPHY */
+			regs->lane_regs = &lane_regs_sa8775p[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
+		}
+		break;
+	default:
+		break;
+	}
+
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
 	val = 0;
@@ -1119,49 +1175,16 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		return -ENOMEM;
 
 	csiphy->regs = regs;
-	regs->offset = 0x800;
 	regs->common_status_offset = 0xb0;
 
 	switch (csiphy->camss->res->version) {
-	case CAMSS_845:
-		regs->lane_regs = &lane_regs_sdm845[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
-		break;
-	case CAMSS_2290:
-	case CAMSS_6150:
-		regs->lane_regs = &lane_regs_qcm2290[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
-		break;
-	case CAMSS_7280:
-	case CAMSS_8250:
-		regs->lane_regs = &lane_regs_sm8250[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
-		break;
-	case CAMSS_8280XP:
-		regs->lane_regs = &lane_regs_sc8280xp[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
-		break;
 	case CAMSS_X1E80100:
-		regs->lane_regs = &lane_regs_x1e80100[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
-		regs->offset = 0x1000;
-		break;
 	case CAMSS_8550:
-		regs->lane_regs = &lane_regs_sm8550[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
-		regs->offset = 0x1000;
-		break;
 	case CAMSS_8650:
-		regs->lane_regs = &lane_regs_sm8650[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
 		regs->offset = 0x1000;
 		break;
-	case CAMSS_8300:
-	case CAMSS_8775P:
-		regs->lane_regs = &lane_regs_sa8775p[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
-		break;
 	default:
+		regs->offset = 0x800;
 		break;
 	}
 

-- 
2.51.0



