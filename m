Return-Path: <linux-media+bounces-58804-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GATwOctZ32n1RwAAu9opvQ
	(envelope-from <linux-media+bounces-58804-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:26:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA1C4028C0
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D42A63044EFE
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4406633B6DA;
	Wed, 15 Apr 2026 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="RPOGndfX"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021094.outbound.protection.outlook.com [40.107.42.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3636C3368BE;
	Wed, 15 Apr 2026 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245154; cv=fail; b=d5jOlyKkibe0dMx3EDIV4vTzYSJ7K2r9czIDl3/mwIcsSj2CsWZ5hji73Culk9K6YA6jazLXqWEM3D71ffxxR7VlkY9W1qiSJIOyofUggisE7M6oBb5IpZDoi1mzPRuz1dQyURA2VwAuWSOAXEtBBvZ624EQ3RE3RPwkkVi5hII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245154; c=relaxed/simple;
	bh=kZhcXfwTnmvqpUkQxc+WosEdOo8DQDwb8KyK9cLKuYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pzBL974uc52QNfijhzsVEiDcNl4n5dieUivKmNzwLwAlLM7VuTl3Y2JbYKTOmb4yqFunQ0lS/nEFPhUGjPJOlsAoy+zKJ8h7AfqJz7CtAvA5RGFpyWlm8YHpQFhVDHhvu6I4DfRx+u7TkgUNcb4Dd0M9IUEqLIR7IUHdMGfGxbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=RPOGndfX; arc=fail smtp.client-ip=40.107.42.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkRQsYDbrPbtZtSTthptMk6gaEVkJyCLNr9DSqhI/v5GXJ1R3WwrIi3wEbJmvb5X7rdoyPaxslLQzTlWhkxLErr/qELN5HZ0NpT94utFuIRSbmMfOdI77CXlY2mG/92yduVFxgVxcFf9ElfF1R8t5hsHFhfLqceAk7l1o8kbFh7IIEQZGI0BJzlCa/5qc0oslxby1Vz2JFWc70Vq3cxyN/9Xydm6j2nDzZ3vSRtUnACa/AgN+4py4h9ilakmVCZ3t3pLBVwFr5lGALCqC/5ABs5RwPDYpuuMnsKJsWmQtT44PEX6dw2YVMDddWU/HNhUuy6dS70PGthttfGlKFFxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La322k3sVuG/Cqr94bwFsseU8L+RVxJY8bC96sXymQ4=;
 b=QemnL8PhwTZLMlpIZCyexPXJHdaWYcTOhVQKQT29fC96HU882dYf5i1v3QmuB5QGRHJYk7EBnMkBtvD6QUW3mAH2h7zvMzIeSqr3SZyh9NR4vNJvwZDlezL2SK7SzTRZshgN1LjNLF5KgS8tlD5EVtm0COo7LBaIlLUIVTVZnFxNpcp8AT8IcYGWJKObfvaki62szdPR6N0q69UdxVOFvclWsrasZl6dWAbdcwgfEjlM/iGjlrWdDdI/xXpxQjjWWYnkf598dxztDpKS/udnAATJjPSg+TNkezf4hmyS1Hp18fTCQZseDE3pN9W2qlLJq2/BgF/OSrx4Vv7Xo9d/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La322k3sVuG/Cqr94bwFsseU8L+RVxJY8bC96sXymQ4=;
 b=RPOGndfXWGgXVoxxZYZviAh9OnsPBVudx9Mz/i2L0a6L/PcioP9caWFNnf+qmfRxCS1Z5hzYSrnNJCWBuy+n8kP7zOtMHiwtEPLzpRydsWan+JDCJnNczyOQQ/KGhU65MkPymfdi/humne6AzvmWHfNF6qnr+Gclz89/JlSvsMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE1P216MB1414.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.50; Wed, 15 Apr
 2026 09:25:49 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:25:49 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	marek.vasut@mailbox.org,
	ming.qian@oss.nxp.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [RFC PATCH v5 9/9] arm64: dts: freescale: imx95: Add video codec node
Date: Wed, 15 Apr 2026 18:25:29 +0900
Message-Id: <20260415092529.577-10-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415092529.577-1-nas.chung@chipsnmedia.com>
References: <20260415092529.577-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0163.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::11) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SE1P216MB1414:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a11892-f219-4c0e-ea75-08de9ad0fb02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5GUPMFeuV+Ir3D6Cwvc1dS5egtvO+yFCEVJII/0V+QOC6QpuT9YsVWk/Za2HK1fHQlR/+Wbv5URngxmqwD4UvUeWUVfAADtYRXnUSoMGVKLrBhlq9IPqcICKrnT3TCcJGR45QqpkaIh82pIarBrxMEfni9te4Swn5j++BExE2bD/Z47vEhVSCpA4tJmURKdSeHGQsIjGWnby7HlchUqm0zbhFnJtZbqkjLmNZ5utdA7ar3tIA5h5cYDU3QNmuLFNk8WjzEtLOQWbtBMI39ruggM72hdvZKGRf+fTI0P0RZhJFLY6CFGCeWARi903qUWLsv/jhHjKmo74tKuX4PyNBPrF5PBfBRX4W1E+dDvfQ+y/a0kqEkVQjWySf1gWJHxPR6Cftk2/WwS1lQJYfaQRXh459Ce8MghGMnZCwpwAo71ShuxOSCA29SM4PI8YGyVqmr0wDEUsLBSQxGqE+u9fCB2AG+fxzLPWTFDTvg5DTCn9FEfyMeJ5rb0TOVVE+3kNGyomXeMmPghtw6U7tB7oFnlDPeNaoVI1TAKEizLzOz3OapqwqOIevs2mMGVCW1z3AxyReQg9cdkDGTfg4xNukSU83N/hJfHqrXb64lsmlOxtgeVTqw/hMJ+Bn4pGKquJVbp8CcUbioCBqKaE8W/uuvKgGdNe+/DntdYmEnD0KcR9Dmjp0bL6pZumonthlX1+CXuGa/CAsMNeq3ThKA623bwcYCiFoWPpSyIRHONsuhiWGNhabcO/RsmAOgGJqQXDxGcf8F4eDlXpvwLgui6ur3llxIZI9WAzrBLF4mrE8s0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?upGQKUPI9vWRWI2S9VEeS14vmFo196bUk91fvXa22UAZ3zjZWCVfDDQD3IIy?=
 =?us-ascii?Q?80eZE0MJ7P+vLhvV2ukZHE5dfMdQmobL0T1sWTj7xpALPfWbPSJoqhs5sX9q?=
 =?us-ascii?Q?a7gDAAbpS259A+DL4skN49+S2Y+8Nh/VObFeCeaM01vIZ6Vcw7Qa6cavOstk?=
 =?us-ascii?Q?/rdq/8pc/JUCs9vHuomqETUvBGKiJu6iQTqEOA0l0+klzjiyoj+HRZ8Qa0If?=
 =?us-ascii?Q?+6UXjVF03dJFjReVid0tB4xgs/NNp61fIfH1ZbsfR0kZRdDUghpd9NwwHX0C?=
 =?us-ascii?Q?zpB8OiAjouHPltx2qNfkWwnGYlMhrN4Y+FyxJVg4/vyntK13qnnmGjWgbmf+?=
 =?us-ascii?Q?GVEbX0/s0atSGHa/5JFSq5C8Jau7EZp4F5bQ0Zb+TLZPCkNx/19V3bsWqC/E?=
 =?us-ascii?Q?Oq8WTHwAtIPLl3CzfBgiSCWq9NUGS0kWzmjG3/QOcuygel0oxS/t8vxbs7RH?=
 =?us-ascii?Q?rWKRF4aE35y2P+Tnjuj1nAwIefdf3eN8RMwecfmN7KgtIG84a34qAVQVLc14?=
 =?us-ascii?Q?ZuPhMDQWM1qIpdvtyBoRwZWEkzkICgFwz+D2g6m1lcfBOYNuDxZBVlFQLQja?=
 =?us-ascii?Q?nPSX9MlBrDC0UfYQwgB2EPs5erGEEVxlQN+9V+ST4ktW5q66BOq1ugMCqsD1?=
 =?us-ascii?Q?X6PHVZ3LHxocwei/xLl+JQMhuKu7CCF2n508le1ksae5CLrHe7Q1rNiaeAw5?=
 =?us-ascii?Q?DhCkZL0BmnqVFAVSFqm5BWfGLFHRH4zfYqmY2/TlW/tlpn/H4PdYdp7MU5jM?=
 =?us-ascii?Q?zqHVwWO7JChfBMAxws3be1+LHUUGA5yk0PbuJLiGm0kuCdh9CzISM1afVfpf?=
 =?us-ascii?Q?b6juGrD8gEBLbEzWsDPOmj9/09M/zeX20nduIinlREV1cCQT7obeU1s3PDyi?=
 =?us-ascii?Q?9FCQczVCHourlHVZu/6feUa8wIuE0LU8xzz12S9NCRBjKF2VGkaiUMmecvgi?=
 =?us-ascii?Q?k61NqEX1+31/EVXZSrPw2KQDsIDIO7lm1CpU2F+t+w3u/p3+X6h/zlESZhOF?=
 =?us-ascii?Q?nArJVNuH0a4rmJKrnGxhD9uOCUwJ7J1EedKPtSomslYPbSiNYlLvCBH5xJ0l?=
 =?us-ascii?Q?5ET7HEdriGc7y6xFuDrUzqyP0hkeVdj0XCHmOzcTefzsbw16+CR+hCV/8WsR?=
 =?us-ascii?Q?UnpNeQ1aP0wfuMGM/x3rRW+UoqQACIfpQm16HFixCD5esowa/0/vJrHT222V?=
 =?us-ascii?Q?x6PWx2LQp96eF4jSA7L9SEI5u30arLYIGQh/uUny2+B7cuHmP4mi35fpi8Zl?=
 =?us-ascii?Q?kQsuUMYwnQtsGZSlKTMgoD9LFQxPdEdzp/Ao1wzbCpd9ISvxhJRqZF27WpEG?=
 =?us-ascii?Q?FYWG4WCDPwr21RfQ5HHvnK9tL8cxUjoUlzI4HuBhr2A+HE25JQGP5M18BXMV?=
 =?us-ascii?Q?dPXpLAMmfJkrUyyjId5smwEKpt4ovfoxHjOKh5m/I/z/xp5+vfrNZaYxmz8m?=
 =?us-ascii?Q?EXR290U2DyhAeuo6du+wwAZTVH0lPxYIeNW7HVEQbsT7KtZMNFktDHwWuFkN?=
 =?us-ascii?Q?phInbfLZ29l/oTOmX+qQBnNt3Vn/Tvr0JvHS8xdBA8lfjVMSGJTSisAT/c5A?=
 =?us-ascii?Q?1OR59NcLl49z/fQ5sqtxoxg2/jvUtlZOAtR6DNrH1eyWRCROzUPwHIay13y9?=
 =?us-ascii?Q?n3jk9yjok7AeW0qkGUokdwXnPmeAwesrqL6/93h+9qP1rr+hciLxZ35SJL6A?=
 =?us-ascii?Q?5PStz33oUEAorj1+vZ8XTiTzMdLHkDsGrfCtSOhhWZgvQjvSO8j2IYndccgn?=
 =?us-ascii?Q?Mn8KucYS3tATRimYNQb7uv7pMAsfLuM=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a11892-f219-4c0e-ea75-08de9ad0fb02
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:25:48.9410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZepswzAp/7i2vJU0K4sNH3Cf5K/wwcJagcVhLa0dweRDJs8TlcW+KsyVsIsiZOl1kggwlwDs4yqB6rpTIlFvK2jprzPsfNQ7x/bGQZYf+HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1414
X-Spamd-Result: default: False [3.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58804-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,pengutronix.de];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.993];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4c4a0000:email,4c4b0000:email,chipsnmedia.com:email,chipsnmedia.com:dkim,chipsnmedia.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,4c500000:email,5.66.33.96:email]
X-Rspamd-Queue-Id: 8DA1C4028C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Chips and Media wave633 video codec node on IMX95 SoCs.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../boot/dts/freescale/imx95-15x15-evk.dts    |  7 +++-
 .../boot/dts/freescale/imx95-15x15-frdm.dts   |  5 +++
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 10 ++++++
 .../dts/freescale/imx95-19x19-verdin-evk.dts  | 10 ++++++
 .../dts/freescale/imx95-phycore-fpsc.dtsi     | 10 ++++++
 .../dts/freescale/imx95-toradex-smarc-dev.dts |  5 +++
 .../dts/freescale/imx95-toradex-smarc.dtsi    |  5 +++
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  |  7 +++-
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 35 +++++++++++++++++++
 9 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index d4184fb8b28c..2c841e476d17 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -215,7 +215,7 @@ rsc_table: rsc-table@88220000 {
 			no-map;
 		};
 
-		vpu_boot: vpu-boot@a0000000 {
+		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
 		};
@@ -1157,6 +1157,11 @@ &wdog3 {
 	status = "okay";
 };
 
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
+
 &xcvr {
 	clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
 		 <&scmi_clk IMX95_CLK_SPDIF>,
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index ca1c4966c867..106186c75f9c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -962,3 +962,8 @@ &usdhc3 {
 &wdog3 {
 	status = "okay";
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index aaa0da55a22b..0ee5f9700fd3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -76,6 +76,11 @@ linux_cma: linux,cma {
 			linux,cma-default;
 			reusable;
 		};
+
+		vpu_boot: memory@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -1142,3 +1147,8 @@ &tpm6 {
 	pinctrl-0 = <&pinctrl_tpm6>;
 	status = "okay";
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
index 2b0ff232f680..c35ad2466b19 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
@@ -65,6 +65,11 @@ linux_cma: linux,cma {
 			linux,cma-default;
 			reusable;
 		};
+
+		vpu_boot: memory@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	reg_1p8v: regulator-1p8v {
@@ -693,3 +698,8 @@ pinctrl_usdhc3: usdhc3grp {
 			<IMX95_PAD_SD3_DATA3__USDHC3_DATA3		0x138e>;
 	};
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi b/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
index 7519d5bd06ba..b713d4159e35 100644
--- a/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi
@@ -59,6 +59,11 @@ linux,cma {
 			size = <0 0x3c000000>;
 			linux,cma-default;
 		};
+
+		vpu_boot: memory@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 
@@ -654,3 +659,8 @@ &usdhc3 { /* FPSC SDIO */
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	pinctrl-names = "default";
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 5b05f256fd52..5bdfdab8647e 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -275,3 +275,8 @@ &usb3_phy {
 &usdhc2 {
 	status = "okay";
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 5932ba238a8a..10e6d1fbb8e2 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -156,6 +156,11 @@ linux_cma: linux,cma {
 			alloc-ranges = <0 0x80000000 0 0x7f000000>;
 			linux,cma-default;
 		};
+
+		vpu_boot: memory@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 456129f4a682..a7b5b517e021 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -40,7 +40,7 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vpu_boot: vpu-boot@a0000000 {
+		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
 		};
@@ -801,3 +801,8 @@ pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
 	};
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	sram = <&sram1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c88..de8fb19c7e3b 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -2005,6 +2005,41 @@ vpu_blk_ctrl: clock-controller@4c410000 {
 			assigned-clock-rates = <133333333>, <667000000>, <500000000>;
 		};
 
+		vpu: video-codec@4c4c0000 {
+			compatible = "nxp,imx95-vpu";
+			reg = <0x0 0x4c4c0000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX95_CLK_VPU>,
+				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+			clock-names = "core", "vpublk";
+			power-domains = <&scmi_devpd IMX95_PD_VPU>,
+					<&scmi_perf IMX95_PERF_VPU>;
+			power-domain-names = "vpu", "perf";
+			#cooling-cells = <2>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			interface@4c480000 {
+				reg = <0x0 0x4c480000 0x0 0x10000>;
+				interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c490000 {
+				reg = <0x0 0x4c490000 0x0 0x10000>;
+				interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c4a0000 {
+				reg = <0x0 0x4c4a0000 0x0 0x10000>;
+				interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c4b0000 {
+				reg = <0x0 0x4c4b0000 0x0 0x10000>;
+				interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		jpegdec: jpegdec@4c500000 {
 			compatible = "nxp,imx95-jpgdec", "nxp,imx8qxp-jpgdec";
 			reg = <0x0 0x4C500000 0x0 0x00050000>;
-- 
2.31.1


