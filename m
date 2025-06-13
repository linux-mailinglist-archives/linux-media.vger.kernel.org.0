Return-Path: <linux-media+bounces-34712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7850AD8563
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BBA316AE3B
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03CA27281E;
	Fri, 13 Jun 2025 08:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="UXDw02qN"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013049.outbound.protection.outlook.com [40.107.44.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0455272809;
	Fri, 13 Jun 2025 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802941; cv=fail; b=MEejhuSsOoIDqzLgbwgXq8vbSku1V1+J1Z04msIr6q/0xd0tdr9JEi6bUwFwU+AkSZnDKdG/QuQTTAZiVUJmhqKSGBYnHGZ+P4n0lW7KTs/zUCLs5F4dWodiLRUVEH+1I9nkQf1JdudcN+y4fzIhQ4SM14AabJpFc/tVYu6UPAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802941; c=relaxed/simple;
	bh=KLqhA/hvvLHHNZTUL4HbxmaQVz0s7ldMlbNqZdrozTk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P2pOmKewk21+1zPqnVz8mq4xr6TRO3lnVv4Ld3LmD3TSjHPlvGYLynKsFV/887Dk1f1PAvz4L9oJHCg8OkINngHAPcXXPrCIy6LtFkSWIpqgF3oC2JtHu2fAOr86/fkW1CcpyCPY053OfcM7GJ44oYG54wIGROKt0ZKxPfkEvyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=UXDw02qN; arc=fail smtp.client-ip=40.107.44.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCnvjdy62B+TdrzssnLV6ouWxz+beWrMx3+U+1ne2QNoTEPswTbPbxKEgsr9zo+sjSVTt6aX7FL5y0x16pNBSldOJQ7W8/R2ZYMnc7/NFM7DwCk8i6AcDCFylcyVuFJZ5asbrcG8eN8/eb6qU8O/JlshynmpqtMrTdGKlhA2IIdRFjvtIOVV3P/1nazFXLXAnhMhXYckNiVspPMphGrolcwAJGpwFfM3RwX4xv7eCbIS3Go8wFl2z4afx7CKXQqBysGpEo14BcZF/tE59HV/B0fLSkedU9RzLi1cpUjWb6wrX/NFAKzdgg6y/Mf+BBzGyDVOZDH0sTJRI0kELI0NVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5mp+vhE/QPrRcN5FW3y2uZ01YhIWKnRaNDly0QFSlc=;
 b=JjUYw/nmLUMQVHLYAbznDqJVpwurRMpN+30GkAXHd+WBUc2F3TBLH1lW8dOMxpFml76HDUtjXIWGVp4AhW4QV2kKPISAJ+eaF7adbhfloQ/ZND62uZWjRweyeG2n871BcRgxwk7O9jrFEzHm4L2SN9YSiIAj3x5EbjRgMnUF7FvaQIMnTijCbQHiqb5iAqQEZVnwHQWz1K/PWfeVXP4wicQC7GbhhcKHCy7Etc9tCVbMWAsWmyaarVUek2x07mr0j6E+u5u9ZeBG7ZE65On54pc7xQtcFiSrUkOGGQSaJYL9bNKxGw0bP/eUuKjam3mHl+8FBrfaKVHkyzktkuqPcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5mp+vhE/QPrRcN5FW3y2uZ01YhIWKnRaNDly0QFSlc=;
 b=UXDw02qNLHA0bVgYtNFBGJg7mkhx5ul/3PQW+QDaQB/RG4SaD7kwFQsVkSA2mU2K1HFu13qa8KKb5qRcWXmqYe5ZfPj5vV3L4gvJxuDY31Ngc4chp1VcRdHBLtavtSRSZL6exZnMvjRhFhyzTAxNcQJPmfpQMMgCwEBboT41S4r5ELG/buHl4O4B58fl3BqLp40tq65CJVRfFGvjaKWzgBMBQyeaZp0l3UNpZ2OWujK+M4vtLwhFOKJZxkf/7vG4ptVuhY36Ec5bvKTTgXg9lrgbPVMFAcB3ENj/VtOVF36stbDO2P4CPon7jprk/ZkfHgGTDMkeSLH7ViQ+8Vzvng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com (2603:1096:604:2ac::8)
 by KL1PR0601MB5535.apcprd06.prod.outlook.com (2603:1096:820:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 08:22:11 +0000
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49]) by OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49%4]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 08:22:10 +0000
From: Pan Chuang <panchuang@vivo.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 2/3] pci: cx23885: cimax2: Use str_read_write() helper
Date: Fri, 13 Jun 2025 16:21:56 +0800
Message-Id: <20250613082157.50040-3-panchuang@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20250613082157.50040-1-panchuang@vivo.com>
References: <20250613082157.50040-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0067.apcprd02.prod.outlook.com
 (2603:1096:4:54::31) To OS8PR06MB7663.apcprd06.prod.outlook.com
 (2603:1096:604:2ac::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS8PR06MB7663:EE_|KL1PR0601MB5535:EE_
X-MS-Office365-Filtering-Correlation-Id: f86fa693-4845-4e55-5216-08ddaa5364c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?inMib7Er21AFkDQllSZ/8d3bqsSELGvYuGBpwqosVrTlMIcIaYa+DaB2z/+N?=
 =?us-ascii?Q?uI3MMihHdFNkIWqIN5PIS9EB42mWzksvV6QjOWPPHqtikqk8mGydu1HKdMKW?=
 =?us-ascii?Q?KrxigQuaHRkUYWQDk+2Uey0i8XWjkuPJ6yP8ISRiSBOUVp80sptG/tjEyJG1?=
 =?us-ascii?Q?gLJ5ywHX3UiqMkgxAvGwpBBHSMO3DB2lplyR8NmhH44cJnelacFlBrPf99rA?=
 =?us-ascii?Q?Tq7gX3QOjucwiW0XmkWTx8Lq8U17Ms4tpoqt39T2Y8nZeCZia3gwz1UfPNwM?=
 =?us-ascii?Q?nuLnsCoSXk8G6pYD4SDXY+G4g0rCJ12DUj34PyUQHxm42lgru3Yb0ffRur5g?=
 =?us-ascii?Q?2KAEZy17HsITyQjWIqOFEPCREHTDmWpOL4csM0UtVjIXUei8fO5SH/uHGwcv?=
 =?us-ascii?Q?dNtze9R0yjxQALzeH8D0hjHMgOZpxUbIFAaMnZZiWdaVI2oqEVWhNEadUa2I?=
 =?us-ascii?Q?dTfZUWps5/9koVegeHsTZP3Fc24OcF9gdGRXKqGJx85odIglUvA5DMeDOksp?=
 =?us-ascii?Q?sZURE+JBAAwrdPdIoipyGEKfXmhDr76wXEU9pOsh8JRDJRGiohuFyVYAY9Hz?=
 =?us-ascii?Q?4EeXj3wTin46x42GDStaW7sb4+pYWnKL4htYVVwIUd1WCh5DBh3QRPGykreg?=
 =?us-ascii?Q?cvgLaEgbCDpxcqIidVUsKLQHgRTmTzw40yu0MMCuf21Nm/BkXIthrU1DU1x5?=
 =?us-ascii?Q?51ksKOMpGSu0zXmBfUXzxUoM9J5H/Ryoh4iekoOvHDwClM8Qdc5HZoCP5kHd?=
 =?us-ascii?Q?lBiqgsVMBKUcynlPCPNLGvZNxN8KP4WtNrJb4+64j4Y/0trfCYxdawxdPIa4?=
 =?us-ascii?Q?9DRU47QKFOeNpBJlqbl1f4BOf7bkFpU0H8UHo10alr7pxcb070HNnFF7qgup?=
 =?us-ascii?Q?XQn7bbuDHP9IPbLsTZzz7zP9TrXxlAbxA8BpfGIV9mT8SKv39uos7VbGi//q?=
 =?us-ascii?Q?Ag4YQhPf2larmxCBSfVZPg2hO4+KgF3Gz/ak1RltHpDD8JyAxT54Bv8JGbbR?=
 =?us-ascii?Q?JLc5A8dGarwL8QCKicr7d3u/HCkRfGiU09P4UYm7/0n6mrIhe9OMo+RSv7n+?=
 =?us-ascii?Q?tTdOyp6k//hUC/2E0tlUZYP9xwpmGm3lq3aADtRQhzfJatNPH2bdV5vqMrXg?=
 =?us-ascii?Q?z2gLsdA3dz960+hxitI13CUbLV8ROI5s0AZD+9KS4i4IIWx3GAXcYWF87Deu?=
 =?us-ascii?Q?jbXFvKiExwZ2E3Mlgzo1nuKvDOpP4QBPJrdroPASAdc1CGmRD2InfGS8sGHW?=
 =?us-ascii?Q?NJWWtRk1nDqk7QDy6AmGtgWOXhvIV/nx27MexoA58UQ1d47U9KsVyXuePOqu?=
 =?us-ascii?Q?bEEJz3zUPUOxRQEPd0rPRnHaXsroLthoJiVc7wwuZS8Xxj1UTcX2NasGVduC?=
 =?us-ascii?Q?0o0ppZ7I9UVhgZZynFRWnsoI7pU0AYdd15EUAimd13KdhhJedPlt53UJmEvx?=
 =?us-ascii?Q?973FRtLco2o/0wN41uKbnJXR2PxXZtF4FBzAY5L+1PqQCyvVAC/abA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7663.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MmZpIbQFHALRXq7v/Df8ic/Xe15f77Q2QKW190HX1gm+yRoMGLoYruQCeN03?=
 =?us-ascii?Q?5pjgMNwdYYImb/6Dlpk7Rgtthl5UjFxQUQeNbw7CeUDKs5bB0RuxZtYxplrc?=
 =?us-ascii?Q?JJlpG62UDWTZg6qOoySRwqnHuq9uykzr2sGy3gHwD00dvC8DTBOKeVGAuN+B?=
 =?us-ascii?Q?JkTlq9NyxsDCi5+TtCZsr6ODJLqIQOC6A15o3Jtz4YnQC28+89tIAFBF8h9t?=
 =?us-ascii?Q?g2x/x7quP9TXafKtrp7QHKoNON7px3jx0s6ibdRbGGzoXB5nXdEPD1aS1mmM?=
 =?us-ascii?Q?5mO+snzaB7DVP0sqY3WptJgV+8ftzp3xmw4eoAkBVGyDqcX86VYubFC0TUs1?=
 =?us-ascii?Q?3wJUxkBRM/W2iWGdc/DIgGHn+IWGMs6dAZl3o5bFeu5E5WB47UmtC1wB2q5R?=
 =?us-ascii?Q?kVUNTLrUuHgZgSWip+d6NCfqGd7WCJx/dr+RSSxeRkGU21B3CjqZpPhtpS4P?=
 =?us-ascii?Q?TP9fQ3Cw/1jvnCMYfibueIo6N9QJFrTm+cDSJDWdYMQ0hMUfSpI1zZt6+pCW?=
 =?us-ascii?Q?0EjkHs0sA/kx3748JSSTW3h3/ME2acvnV1MI9eg6pPb1xDdEtLTgmZ+PXRRM?=
 =?us-ascii?Q?MMpKryD/pFsbKq1hQqYtWI2GvgdWl6PHCDduEliyWXIgFgSc70IoJ3dLiACL?=
 =?us-ascii?Q?DaLBd7YvYWUI58H91t83PwMckQONhLS2OhPkiqFQ0pafytmGAdSJmb0epCVh?=
 =?us-ascii?Q?EXHjTZxAdBKcLqXM/BUfTOsQxZYjeGCJOfny5JAaa/Lru7ivH8qL46by78D0?=
 =?us-ascii?Q?EOY54HTXZ8Dh8Wr8vWsBGtzLVz625YE6BR1wrAF1+ZdSGon0yaqR5LfQVUYM?=
 =?us-ascii?Q?X1DJN/gAEA8k041eg6b1XWoQ7DdiQw7W1eocvinodT1u8MJuQrbLFVumEh6c?=
 =?us-ascii?Q?xEQhrPs42tGGEJHHjxGqJGVptS8zFjXxsK5vCUvEC89+5RaIxtNrQCsqoDVR?=
 =?us-ascii?Q?ByaXsbOI4ZMD5RZL1IdsqZnTjOJV0eK58ahtANc6yZTV1THZG0AqgGNU6Nfq?=
 =?us-ascii?Q?N2uU2EbBJFeooYFjwA4GhjFeZA95BJbaN936YeDfN8ioMb3evQGIzgn6pHT6?=
 =?us-ascii?Q?rGZXNFPRljdYG/f7ok2h0RI56W6QAcIq5GcXeur76K7Zuk5tOSF6xF4F6T3g?=
 =?us-ascii?Q?AaLzarOBuasufR5ZsEnJPjsUHL7xI2vSW6o1Bb6qwgOBRv0m71RIk85aIxcb?=
 =?us-ascii?Q?63Ug/4zgP2yPbjsd8blL+Z7DVVFopHi2qdGAjFIVKdmX8g7csiXpzKx9WzRG?=
 =?us-ascii?Q?dlyALZDgFKc5INfjZCP9DWuQP/PZ5X3oLYEKQmZxfkCCv38BTwNWHcWDnu7G?=
 =?us-ascii?Q?dDPMNCxT5JbgX01EKIkHcgrE9byF1M+iF+MTL/sX91LyAJ+GchuFX+jLsm2R?=
 =?us-ascii?Q?6JkA+g94mXLLpcyOxB/JcKWuRG1PPUaAnnk+58wQNZE+rQIfFR7+WnR64F6/?=
 =?us-ascii?Q?tQdVQTBi3Jv2Q84IYL6lfLzhc6XOwwNIzD8tqqzMkcm30x+knZN78SAgW1zS?=
 =?us-ascii?Q?Efs8EBZQ/O0SQjdj9HJmnOwW6mQ+TxprwYiq1lx7aPXLMTvxND0CPqBzWSKd?=
 =?us-ascii?Q?4Kp2h+uSp2jTe7Q0CFYHQEeeIad4o6g8BhQ8ScBh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86fa693-4845-4e55-5216-08ddaa5364c2
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7663.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 08:22:10.8645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DI/K+sPMjla4vEZZVmB8nCGJ4r11L/BqT9+efrykBTjiToC/VIYK4SosfVd+ClHOHCRIz05I9uDAQLdsZzrxZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5535

Remove hard-coded strings by using the str_read_write() helper.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/media/pci/cx23885/cimax2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx23885/cimax2.c b/drivers/media/pci/cx23885/cimax2.c
index 06e41f92092d..458fa779274a 100644
--- a/drivers/media/pci/cx23885/cimax2.c
+++ b/drivers/media/pci/cx23885/cimax2.c
@@ -224,7 +224,7 @@ static int netup_ci_op_cam(struct dvb_ca_en50221 *en50221, int slot,
 			return -EREMOTEIO;
 
 	ci_dbg_print("%s: %s: chipaddr=[0x%x] addr=[0x%02x], %s=%x\n", __func__,
-			(read) ? "read" : "write", state->ci_i2c_addr, addr,
+			str_read_write(read), state->ci_i2c_addr, addr,
 			(flag == NETUP_CI_CTL) ? "ctl" : "mem",
 			(read) ? mem : data);
 
-- 
2.39.0


