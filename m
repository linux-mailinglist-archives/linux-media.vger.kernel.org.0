Return-Path: <linux-media+bounces-49230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E54F1CD2CB0
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 10:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E135A302650F
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 09:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E64308F07;
	Sat, 20 Dec 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b="Ew/4JbVE"
X-Original-To: linux-media@vger.kernel.org
Received: from sender2-pp-o94.zoho.in (sender2-pp-o94.zoho.in [169.148.134.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AFD305E01;
	Sat, 20 Dec 2025 09:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=169.148.134.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224573; cv=pass; b=gtUnQTl3NIFTkmrVd/Edz6HVoiL90MwmuQ3jxh+iBXTKrBTvayQDRb6esbkfF/dRdte+O0or5B84WUACZs8TYGNqqvYrZtNsd7xnT2HQLpoeFqnWdlRG3prMHGgaiigyp/IlijFoAailpYhLJf0Fcqa3+yeECi4aD+d6ayt/YxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224573; c=relaxed/simple;
	bh=lIDV3YDxGMZM7ohwrit0EDfKY6xK6RYq0N7RBhTXMDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tjLbMHIB8PrpgcuIT6ErTuuc51MQGaIOVSANRJ+TJesNdquHis4pTKawAS9vkMpEjYzdN5r8TXilSnAgHx2MNBG05M6NAPvQO06r9tC/4CLQ0Lry58HZa+Z7bP3yP1EHVbAIB6w102XOayOOS0iMXmyzfwo8JPVbCRzRx+EhnUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b=Ew/4JbVE; arc=pass smtp.client-ip=169.148.134.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
ARC-Seal: i=1; a=rsa-sha256; t=1766224548; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=BeG21Bhzx1uj2n4ItB+TXks3xEC+AQsH/DaCP+4TMKyWfn+hzUukKLOwV8tJaVV1QlPWM0Wtw2ArdKbt8I3ouJpL/KZjxmpKOPDy0uHO3hTZSL4X6omMsLR1Aqrn24j4/7fJKnBcwtB1BR4M22wCKZt01hU8DAvO+uZ+cotIrww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1766224548; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=l7B4KeEROqMTQxumpACuP3DUdkgOWu1FxozFjCQGO5o=; 
	b=eIdAxl9H2lo+4MZi7JV4YSxURwCd5Gbib9rRj1zwaxpAP9mBya807+jjzvINmhn6PClW64kGNV1mGceBLeuDtpwZvcwLrmYXvsUYZMw/X4V9NWpiHQSGFnhjHNi47FrI0kD0HhTpqjwqPyinaUBne3AmwuFLHR0PD5SZOqZe21k=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=preyas17@zohomail.in;
	dmarc=pass header.from=<preyas17@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766224548;
	s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=l7B4KeEROqMTQxumpACuP3DUdkgOWu1FxozFjCQGO5o=;
	b=Ew/4JbVE2gX343uQkWoFZTwkPIA4AMQNCVqQrsl6XYDgjNYXVcSRFWy3tJuiNDB7
	nBrIHwEUIVpf7oHbmZiRkcCGmCquuA0NWbR65oXAzyu5K+1EtXdPIZ8AIncyJW1bg85
	gMXefodhxtzXgnw9Qm5mRymGIquPerrp4SbxR1YU=
Received: by mx.zoho.in with SMTPS id 1766224546213262.609486881879;
	Sat, 20 Dec 2025 15:25:46 +0530 (IST)
From: Preyas <preyas17@zohomail.in>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Preyas Sharma <preyas17@zohomail.in>
Subject: [PATCH] staging: av7110: use usleep_range for short waits
Date: Sat, 20 Dec 2025 09:55:18 +0000
Message-ID: <20251220095521.36992-1-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Preyas Sharma <preyas17@zohomail.in>

Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
---
 drivers/staging/media/av7110/av7110_hw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/media/av7110/av7110_hw.c
index bf8e6dca40e5..49ce295771e4 100644
--- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -312,7 +312,7 @@ int av7110_wait_msgstate(struct av7110 *av7110, u16 flags)
 			pr_err("%s(): timeout waiting for MSGSTATE %04x\n", __func__, stat & flags);
 			return -ETIMEDOUT;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 	return 0;
 }
@@ -343,7 +343,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, u16 *buf, int length)
 			av7110->arm_errors++;
 			return -ETIMEDOUT;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	if (FW_VERSION(av7110->arm_app) <= 0x261f)
@@ -359,7 +359,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, u16 *buf, int length)
 			pr_err("%s(): timeout waiting for HANDSHAKE_REG\n", __func__);
 			return -ETIMEDOUT;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 #endif
 
@@ -405,7 +405,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, u16 *buf, int length)
 				av7110->arm_errors++;
 				return -ETIMEDOUT;
 			}
-			msleep(1);
+			usleep_range(1000, 2000);
 		}
 	}
 
@@ -433,7 +433,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, u16 *buf, int length)
 			       __func__, (buf[0] >> 8) & 0xff);
 			return -ETIMEDOUT;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	stat = rdebi(av7110, DEBINOSWAP, MSGSTATE, 0, 2);
@@ -559,7 +559,7 @@ int av7110_fw_request(struct av7110 *av7110, u16 *request_buf,
 			return -ETIMEDOUT;
 		}
 #ifdef _NOHANDSHAKE
-		msleep(1);
+		usleep_range(1000, 2000);
 #endif
 	}
 
@@ -574,7 +574,7 @@ int av7110_fw_request(struct av7110 *av7110, u16 *request_buf,
 			mutex_unlock(&av7110->dcomlock);
 			return -ETIMEDOUT;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 #endif
 
@@ -719,7 +719,7 @@ static int FlushText(struct av7110 *av7110)
 			mutex_unlock(&av7110->dcomlock);
 			return -ETIMEDOUT;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 	mutex_unlock(&av7110->dcomlock);
 	return 0;
@@ -745,7 +745,7 @@ static int WriteText(struct av7110 *av7110, u8 win, u16 x, u16 y, char *buf)
 			mutex_unlock(&av7110->dcomlock);
 			return -ETIMEDOUT;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 #ifndef _NOHANDSHAKE
 	start = jiffies;
@@ -758,7 +758,7 @@ static int WriteText(struct av7110 *av7110, u8 win, u16 x, u16 y, char *buf)
 			mutex_unlock(&av7110->dcomlock);
 			return -ETIMEDOUT;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 #endif
 	for (i = 0; i < length / 2; i++)
-- 
2.43.0


