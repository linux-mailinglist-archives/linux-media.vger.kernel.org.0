Return-Path: <linux-media+bounces-49229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6969CCD2CAD
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 10:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7C883024E7F
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 09:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED2E3081BE;
	Sat, 20 Dec 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b="LFKnt305"
X-Original-To: linux-media@vger.kernel.org
Received: from sender2-pp-o94.zoho.in (sender2-pp-o94.zoho.in [169.148.134.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B6830648A;
	Sat, 20 Dec 2025 09:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=169.148.134.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224573; cv=pass; b=MTlSwJa0JwDRdxXvC01qLKa9baPsaF+6UpaaLt9w49WMIzcz1BGmnYY67Bp/nqn4LS+0567Bc+iEkPYxrq+qb9ZZeHB2OeFlnInBMWqC8RZV3zXdXRg88Sgoms0MD9aA+7Ldi8RkWfVRAPKD3dEvINv83LhZ4n+JoMkrR2XsgBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224573; c=relaxed/simple;
	bh=lIDV3YDxGMZM7ohwrit0EDfKY6xK6RYq0N7RBhTXMDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZzRULTbleGf3fkviYcRc12s/Q8H+9/OENh+H8ffeQCrsiD2NW89vjOSPCZa+5gEfPf0Jx/Kee2o3vXsBpgvhH0TTZebSvA3k6sI6al85H8cweOSpf2T4NFwbUm8t2tOucz+nkDvtOtRMN+ankcjFR1dEE4xuG/XTvO+vB+MiAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=preyas17@zohomail.in header.b=LFKnt305; arc=pass smtp.client-ip=169.148.134.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
ARC-Seal: i=1; a=rsa-sha256; t=1766224547; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=eQ99VcIYIHe5+rMlD8GgE/rJx0SasOR+EmlLETVF1oCo6LGKp66EW3rgdTLfA590yVqWkaJ6QMSdKQSBwLtFiN4+cljNNkO2SGear+pMRV8PzCfM/24NrPo+qaXDccCqoHpAgwWE7GQHd0U1EnOaBoR9NlUHe5OLHQaKhXFYXF4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1766224547; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=l7B4KeEROqMTQxumpACuP3DUdkgOWu1FxozFjCQGO5o=; 
	b=b9QRJKWWIWkbL6X8yeYQlJGX6DrKl8XZapFfki+AI1fHP0rQGTDADfe5vCVFUbDWYrGsV4PJRHMcSYIYO+VuJsaFz4AIwjDbkycZLJENK1Tj/VdpNI6OzvM1sTLmLhVyPmhG4p/J6bQ2pERhcF3tCB0u1oIbilCM/AYw3g+U5j8=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=preyas17@zohomail.in;
	dmarc=pass header.from=<preyas17@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766224547;
	s=zoho; d=zohomail.in; i=preyas17@zohomail.in;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=l7B4KeEROqMTQxumpACuP3DUdkgOWu1FxozFjCQGO5o=;
	b=LFKnt305fYxfMjb/R2jgGnyPcwLILNVByJoHSjGYH3bb8CCGTIKMzM1hO96FEvml
	TrPj3xMfeUL4k6O0FuAn4jcDk9cDtR12VPNbTPXbUqDYMJ5odCGyCTXBwyPOJl+68fi
	Vy6Li+yR79SisHRtJF9CwWxrlv1amyV1xgboA76U=
Received: by mx.zoho.in with SMTPS id 1766224546882859.357808512768;
	Sat, 20 Dec 2025 15:25:46 +0530 (IST)
From: Preyas <preyas17@zohomail.in>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Preyas Sharma <preyas17@zohomail.in>
Subject: [PATCH 1/2] staging: media: av7110: fix checkpatch warning in av7110_hw.c
Date: Sat, 20 Dec 2025 09:55:19 +0000
Message-ID: <20251220095521.36992-2-preyas17@zohomail.in>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220095521.36992-1-preyas17@zohomail.in>
References: <20251220095521.36992-1-preyas17@zohomail.in>
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


