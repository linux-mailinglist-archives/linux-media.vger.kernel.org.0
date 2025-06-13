Return-Path: <linux-media+bounces-34711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF865AD8561
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6348189681A
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE5E27280D;
	Fri, 13 Jun 2025 08:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="hIfVoJ9v"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013049.outbound.protection.outlook.com [40.107.44.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9923126B749;
	Fri, 13 Jun 2025 08:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802939; cv=fail; b=YSzz/WUiVi5F80OfsfXiNN+gcwz4dW3CQCRJpIUBpCX8O3+cXWjRF+pAoJL3Gu/1CHrxDV6y3A8X4PeICPun+tsdu2GQWOkalThXtXEpKLVifMQN2PQscbDnUjq08DUn+w2vDLRl5Akrc2bn+EpSqxTa3td4vTuXAtG1tego2NY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802939; c=relaxed/simple;
	bh=c1hmJHwuNkpx+HQxsio/HuKYLy3lp928zt464+A62Ss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AMcIE94kZ883x7Q1bAwjpGbpjFlNBjIIIkFOD/eUDQi3ztBOh11X9egtdXs+rR6Cg2zE7rkQa4f0Me7ZECjGA9/yxtQUroL9lygNqnHoqxuLOcl1izWkFg1RbiMQESamVWx52+sONw073eyu5ZbM4P3MzJI45IkkWIcChSkRwUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=hIfVoJ9v; arc=fail smtp.client-ip=40.107.44.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EE5pLKI34ePvj9rh6Xw1NXHXbf/z0OFTE7g1Gqm4EinirZz5eldY4SHccR65bTO4zjxwj2xC1pfKhMYaueJPjugaMldLOhmrOdvyHAngDBmyNDxt+sMPwu6G+NKUIhgnab+kMIK0s7N9Md9KzDYS7h/TN4SkjaCXWPhszsfZDhpYfcafuKHhYuiy0aWA60qOCt97hFOJzVI37i4mtY4jgPoXcZkYxqH1AstOoeQGB4FqdK/XJttBlz+OAfbuK1UVaeMmwKBiCDaaRr1q6SR2TFZSAci1INEKFVPovoOBpNbsYIQrcZWtkWbXlwGbr/MCJ+CZPeJ6w8oaS9+gwu+NyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/VTp1IV1EzVdJij6k3oS9vENDopVfjD8fUOaPLRuj8=;
 b=v00AOGLNGOV+ArsQqmvKIoYrUhXvAVRV5RNXAei+j6joWVSufo99rl8R/C0wI+DQbcv0ZTP68KlmhhGls+MbK6yy1fk+EOPV4Ysussa5pzOXPDq9aXka3HGIV13W7aghsbeaiyjvukRzAdu8ytZlAFOliDINH6jTvVvplqlbjUd40a3f6PzQ8B9k7aud8yIWvA7dV0zGVAx/ibSNhS3NRiNuYLqJHnFIKThB2V814UoW7xY1uIwY3qKPqxRigdm6QzsZthjvKLJAxOLRj3uuwpnrjxzY9tpVoA72yaNr+rODuC0XG1OOFvyuS7hheSgTGt1JixqPiBDvKiIo4GLUEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/VTp1IV1EzVdJij6k3oS9vENDopVfjD8fUOaPLRuj8=;
 b=hIfVoJ9v1RZHkoKXL1u5MXP2MCJgyHYNBwQ1S9akzkp7gD/OPQI11YUTGx8G5GfIv20nfc9tWdQZv7y4ZrGFJ64kgZSt8soqb0Fw7/h6QJk1ZuwfL20bgMkWsTy3/3Ggqx1axpifUHZs1qNONzf3rMmfJkqNENA+uENlsoRLPmn5Hsr8nzjNMs/HE0ibTrVXedQ0MiHfVhqkadmc67N9UBk6n2dYMUuurTQhutY2UNgdJjIDLUHI2boiJbPJi2xHLs/VGyTFH/EOspCW7tWFMFfdhwq4mDSOMzLE5qQJWAQBUI4ahF6zyF9jQyHvZIdpg2MzuYIugjZbXlHJT8tiHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com (2603:1096:604:2ac::8)
 by KL1PR0601MB5535.apcprd06.prod.outlook.com (2603:1096:820:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 08:22:12 +0000
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49]) by OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49%4]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 08:22:12 +0000
From: Pan Chuang <panchuang@vivo.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 3/3] pci: cx23885: cx23888-ir: Use str_yes_no() and str_enabled_disabled() helper
Date: Fri, 13 Jun 2025 16:21:57 +0800
Message-Id: <20250613082157.50040-4-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7f05cb41-c472-4edc-f3ea-08ddaa536589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2bAkQt0F3paXkz4tQBrCtxmVNEtdWHW5it0oMHEKUmn3qj9RvQkHGKtVa3jE?=
 =?us-ascii?Q?slSFMGEimjQXFimgZze7SSkqqkU+mh4oGTCy5za9l4wjPgTDObne0jE1KAcD?=
 =?us-ascii?Q?g7/IHDYRNJvchZVJU8w2aecpu9bofvJ84C7mus18inf4m1fLMHzmuB5/EHq+?=
 =?us-ascii?Q?1xwG5uYRPipYgL7CtAb4JUn2Qfk99+F7aE40nFIL2ZW1d/72tDCzXHVYkbNu?=
 =?us-ascii?Q?/z/HgFQzHpKsqesY/PdPNBJ4Hzcqt4x/DLSG4xjhBiwB3EzHaK/+RWnpr65z?=
 =?us-ascii?Q?s/ptfLPqx2XOizrbab/vLUm+MmWgdVUCTGqBpHX/ixj8DNxsK4WAVAoi1NgC?=
 =?us-ascii?Q?R9pU++TzC5pTvBt5PHgvM2l3tY9cmuTlXeehTJvB+ViGuNILjxzXbyPBs6fi?=
 =?us-ascii?Q?rizDgGnWHahY6cQiak+oUePnSwL9qhbCFiyHG3UsgOQH1BXX/c+lHjmE6Irt?=
 =?us-ascii?Q?k4r1Ac1T5UsvyKJuBbaSLPMbI/OPXbbtJmKbJUHL19QbmU7nP4woIhy1x/F6?=
 =?us-ascii?Q?RdqVolkw6q19qlO5hD1RzdWJ+KdI0D7LeYd3pN5KgA69yRCIzycZnIw1iKN1?=
 =?us-ascii?Q?iU0iwlZCiLHBHXI+xBYgOdWTZRkXySGbspgpX5bw5w5I4H8lGCRQtKaw/qH1?=
 =?us-ascii?Q?kDkZ67Z4FU46rFhjMMK78FRsGVsuTWKYWPtpZUWi9oV/r82DmLDVNxOCCLZ9?=
 =?us-ascii?Q?s4xIFfI7jVrGj1xsPJxOzLedF9paLvY0ov3OdqiWpoNzlPcunGSvKYLCxgE0?=
 =?us-ascii?Q?dnLXv3qMHFPMgyUhMTMwBaQKSnnqHtabvsIt/aD5y2dr4aeLXk6YbPbCns7l?=
 =?us-ascii?Q?YuAAt66vIdwWKSa71NfDltByHZgHpyS64cqJhEzt94hRJpprYDJQgN7ng+c/?=
 =?us-ascii?Q?vMcHPReYeCtmWXalTycV+82xHUPf0irLoThziWY06fhYYf6B4/vFRZEsi0Un?=
 =?us-ascii?Q?43Hf6j6qnXhIY+oQ+DtF6yWqwcvX8+HZc8CAwCJtFX+xILOAyUrpzdXWoWdI?=
 =?us-ascii?Q?N6/U8gRjKpivZTsAZ/aqLxrbT2iIcSZvRUHwPkVxRtSsnfCYaFR/4UHvn1p0?=
 =?us-ascii?Q?EW+pNElinp8foT1hOZochpooJP3Xcek0FjVM9ilPAkfCtdxtiR477DS7PS5c?=
 =?us-ascii?Q?rd0aAuXBLfpuH8T2PREUsHte2/lCY6JIfv2NuvEtglDxOTwlK8qLHk0sDfJ9?=
 =?us-ascii?Q?FQ8Ul5iszTkVmg18OENsOp7Py+vcqcX4byZaxqAf2Le1Pxo8NtsML0oREv5S?=
 =?us-ascii?Q?c34vPlpret5XN4BkDvEMIR6iPkmSIXXgPmvxrDjIZ0zYNkIsd3mkL+4MLDkx?=
 =?us-ascii?Q?1NMyLtRIdYnirdLT3Beq407p+ZrhCCrSggk7SWZ5Y9qyF4+IQsj/9KC/mMUG?=
 =?us-ascii?Q?CYUWQjIuaXTtBfgDhEuT+Cu61bT18A4BDwjTdnE1FdqgPoSUhsnsDNFQYBwd?=
 =?us-ascii?Q?TmlpK98vueW2QeU6UxBOvODP3dYqSCJy5ls6Azo1iLxy6U6gMI5PLg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7663.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?goeR0STcOVQtWmlqWosjMULZ8UGqh5nke1BXlRlWTOgVXSeACMYgT4jfkbeg?=
 =?us-ascii?Q?A0yjKQPXYphT3HY2/aHh3sf4NpKj0PNXW37gfRBmUle95twO6D3+59lKizcZ?=
 =?us-ascii?Q?u5mVaa1ZieapnbkuxAZuQGiR1H4yWb6wPOltsqRx5v8xS39wL3HMrdwhDFnT?=
 =?us-ascii?Q?tkBEMV88UlLtF2si0BaFfCL6UaeqYNG7isMDSA+78GNw4uNuq5f+KI5NEsAj?=
 =?us-ascii?Q?38ODndrCE0t9bOGGjuXal90r98LLOUUv8wFsxpsiSaPFONoIPkdDmRTui5LX?=
 =?us-ascii?Q?iVIIfvpGLfYBh7JauDouTNeKBOHwpkZNvfBUy3pPoMWGGpdT/MTBpaQ4MU0V?=
 =?us-ascii?Q?RCxRJ3TnNEPh4PPIiLiXNT/Pp4SVA7lE2Qv7fz9Mq47KZtj3JAqV2PNynXPb?=
 =?us-ascii?Q?oPgdsEZZlCoY7SAG6gKpn/99PXp332CXslZBIPGzX30MPmKB7ONK3Opkl8CG?=
 =?us-ascii?Q?Rwnmi/9AvdmI5EItxUENtc97AibbFbrTzVNwU7jWZ/mbwgC/cDVhTAWj+J5j?=
 =?us-ascii?Q?EvAtcTSFO+OJHtoRhGrFpf9LB6LjJw1WSI7WxN6qZm2mgUb8NY5vqollZsSN?=
 =?us-ascii?Q?wHbMdq+XWcBhZuM69WqObYwql8+Ko1ZcWa2yORnYT3ZYyiOU6q3cmkvlEB9I?=
 =?us-ascii?Q?+jS54SuTdar/PNMCg0dXq8HNuvQBveKoHctrJwnOrH2KsDzD0E+ZW718BfZI?=
 =?us-ascii?Q?Em3MkrRSY3mu4ngWqHK3cm1kpmX/UykbsT1AgVndt6XJlIYFLhSI4x1nG8qZ?=
 =?us-ascii?Q?6oNQWyFcy44luv5HyRkcnvYiFzRj014+Q1FN8TL/K63c/Pqi80LHQj47eRyi?=
 =?us-ascii?Q?j8qCr2xLmtryW1p6UMEAQR2dO8RdLRnIAx8hU+RO4p/cevwpbCkm//wY6qyK?=
 =?us-ascii?Q?AR0tDE128qylrIM0Zc9x0H7GDEJOC1UjPtQoMi9JCHaPmzgGoxKzuATs7zv0?=
 =?us-ascii?Q?GtEL9Lj6p5QwDckqe1u29wPTlu0T8xhgV7RH62iOE33JJIYNwh/R0LNKfKon?=
 =?us-ascii?Q?cd9mUdncMM8wJwOwyEWwRb3KcnkAeJ1UqMCCjlf8mRqEzONuqYLSJZBndk4H?=
 =?us-ascii?Q?j1/+xJ1xGxS+odn3EGRu/YMN3YpNWOmYVX1MoXyr9HC+i7armwO/R7+xBN4r?=
 =?us-ascii?Q?M7fseTtuvVJDheb7qrK7FIwjadkYf0z1ykA78A9bkCXlvOXD/0x9ELpfdi0o?=
 =?us-ascii?Q?7cPa3yT5EdxYPQXXoOVfQL2uEMVNZVL9O9BDXW73jUUhryrSt0RCuxTJL9mJ?=
 =?us-ascii?Q?ktbdh8rM6Lfk0VtHue8OGGCg5Y9Fs2p8wLNO77DDWXNR0A4ETJaGc44RwgmC?=
 =?us-ascii?Q?UqsOcIx4HuqO2h6IjuBYYBbnLnagKIhzKvXdTi6+zh4QqhV5tCRNkG53xpIF?=
 =?us-ascii?Q?5Ffso1yNiN37oz3nAi+He6TG3HUwZX5t23DwM7zB0qjLT30VxhM3UR7SKATu?=
 =?us-ascii?Q?YXp13kRb/oPQfibShTw8n+t1qXqq8HnmdRBwtSr83SEsRlIEvsC7goREeHvc?=
 =?us-ascii?Q?npPJobqnexw28OMlM9I4V9W8Zf78hWPAnHrUTnhF/kE1PV7cRLserR94M/NI?=
 =?us-ascii?Q?1Zf0qrOcFwsSyPq8K87KqkVy9SqhtdEzvLq1ofoT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f05cb41-c472-4edc-f3ea-08ddaa536589
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7663.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 08:22:12.1204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gd83aR0SQdZf5ar5bNZKr6qFzIG8EN4mtEx5T6EcCbXHCtupE0OiGFk3X/d02ogh0+EmIDl1WY+gDBmcjHZHsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5535

Remove hard-coded strings by using the str_yes_no() and
str_enabled_disabled() helper.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/media/pci/cx23885/cx23888-ir.c | 36 +++++++++++++-------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23888-ir.c b/drivers/media/pci/cx23885/cx23888-ir.c
index 222d04421468..85ca564fd3ab 100644
--- a/drivers/media/pci/cx23885/cx23888-ir.c
+++ b/drivers/media/pci/cx23885/cx23888-ir.c
@@ -930,11 +930,11 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "IR Receiver:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_RXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_RXE));
 	v4l2_info(sd, "\tDemodulation from a carrier:       %s\n",
-		  cntrl & CNTRL_DMD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_DMD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_RFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_RFE));
 	switch (cntrl & CNTRL_EDG) {
 	case CNTRL_EDG_NONE:
 		s = "disabled";
@@ -993,37 +993,37 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, rxclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, rxclk));
 	v4l2_info(sd, "\tLow pass filter:                   %s\n",
-		  filtr ? "enabled" : "disabled");
+		  str_enabled_disabled(filtr));
 	if (filtr)
 		v4l2_info(sd, "\tMin acceptable pulse width (LPF):  %u us, %u ns\n",
 			  lpf_count_to_us(filtr),
 			  lpf_count_to_ns(filtr));
 	v4l2_info(sd, "\tPulse width timer timed-out:       %s\n",
-		  stats & STATS_RTO ? "yes" : "no");
+		  str_yes_no(stats & STATS_RTO));
 	v4l2_info(sd, "\tPulse width timer time-out intr:   %s\n",
-		  irqen & IRQEN_RTE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RTE));
 	v4l2_info(sd, "\tFIFO overrun:                      %s\n",
-		  stats & STATS_ROR ? "yes" : "no");
+		  str_yes_no(stats & STATS_ROR));
 	v4l2_info(sd, "\tFIFO overrun interrupt:            %s\n",
-		  irqen & IRQEN_ROE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_ROE));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_RBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_RBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_RSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_RSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_RSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RSE));
 
 	v4l2_info(sd, "IR Transmitter:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_TXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_TXE));
 	v4l2_info(sd, "\tModulation onto a carrier:         %s\n",
-		  cntrl & CNTRL_MOD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_MOD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_TFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_TFE));
 	v4l2_info(sd, "\tFIFO interrupt watermark:          %s\n",
 		  cntrl & CNTRL_TIC ? "not empty" : "half full or less");
 	v4l2_info(sd, "\tOutput pin level inversion         %s\n",
-		  cntrl & CNTRL_IVO ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_IVO));
 	v4l2_info(sd, "\tCarrier polarity:                  %s\n",
 		  cntrl & CNTRL_CPL ? "space:burst mark:noburst"
 				    : "space:noburst mark:burst");
@@ -1037,11 +1037,11 @@ static int cx23888_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, txclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, txclk));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_TBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_TBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_TSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_TSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_TSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_TSE));
 
 	return 0;
 }
-- 
2.39.0


