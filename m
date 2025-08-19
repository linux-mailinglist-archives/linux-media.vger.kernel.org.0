Return-Path: <linux-media+bounces-40219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA60B2B830
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 06:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C7A55E678E
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 03:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C4230E0EA;
	Tue, 19 Aug 2025 03:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UDFSU5uf"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E33E30DD00;
	Tue, 19 Aug 2025 03:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755575962; cv=fail; b=jQ1l1XZ9FVxY2XckXr0kkrPar4Hm3rxPLGe++3Jn3oqhc642cl6iVnWvoTAWz1mEtA6WJmM8o5N67BIjSFB9SwdjamFEkGe6mMSaf7bmlJMdKW65m0wiLik8zTzmPDS2wG3dTZRcbGeDqM2QaEeBdkxMN0NVkkysqOxVXjpNV0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755575962; c=relaxed/simple;
	bh=hTwDs/AV52GhLDf9FbVjQIQ6VSOWHjFvTeVUti0NTsU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MxXz1yFGDmgrIJ5Axbxyaz4V4cej/XAx+cPeN6hFnOjri7jwyHWYbuGrSSPkzmpH8NkpB7yhm+1iEPFzEq/fsc/84tB9YfQWX3+LC1vvwyQZ4NwlDPyD5eP7MTWDDw+6wP3Kl3O+UV87ZgfhrRJi178IKWdYo2rPisYQ+xLrJDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UDFSU5uf; arc=fail smtp.client-ip=52.101.72.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtnjEzfLXSsY9cCcOcMdaaMXVg/qDV/EU4myLaFvYZmXwYHOELmum1GIOHW8PiafzETVcI+mhF8RxR9a7PM0fmqGOGENh4/q3meFjX2lJWnyEyLWTrI21DQL7c+G/ZNEKpkQVKX3l74tt9FzMr6j3LUtgkmDeeNYE7O6KL8CTlBuOBDuPfYANEbTpHRwjq8pNqlzoycJfG8ZpNZHPjAmKS+GQNDBI87AZJqy9s25wD0IO3ASdlbfUFGesczU9gKSZSyQ6SVG4pQ7R0ll4wOwnOxeA1QbdQ7zwNgGO8tAbeVW9kTsptSgQX7OyN06rYHAmyLvmfDOqWHjC5UFi5nGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW+6q39KT6F419wZ1Rru2ChZBwoOb1JET68HNDM/Ifk=;
 b=f/OPrUONhi5lqBPJ/aVD8MFP/76bDOwRhTLtH92MwYyCD8FCEfd4avzKzoJJbZ8ch+rWvGCdCFNYCiEzscWpVk1yYes4iBC4gUCuJ6b5H5H39rgJpeS82hKSGTltdpCURE7JDLvW0mcu76PL5RcksfWBvQBgtoMHwdCUUaI9WBtu4kpjAPHxQBXcLziuXFTaR1VsenckSIEkgV1bC/KEWGHVRkGGyKeT6AfTcQx4ymJHoqPFsv8jyDUjujvkWWWiuNpJMabgh2KPhhgcc4t0D9SAC1bUbH0U+QPlmCp3mDl1ppVTIbPTtLZAfszftzH/sPKYwOwsKh0+GIhw8xIqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SW+6q39KT6F419wZ1Rru2ChZBwoOb1JET68HNDM/Ifk=;
 b=UDFSU5ufuuQxgSfCL837Rbsqr1RcbfuU5HDw/TDUrIrCaf2UXUBLb5jo4U37QI7p+rcPEkXWl7k8+fqqNsNkLNUTgQ7lA32H8XUUq2zNREdeojO7pywuRWqc0IJvAMKqmVOwYPEyqQKzwsvrUkGapKP1E8+izfp9WaoX4tqH6QcRTqg7SG27IW9RVmPzB7yAbHcguHZD/VjmhUPzg8CelZI8+mM8ihSfGQ/4Q2gxAJTMJ3v2qEDxcTQoEuAOZgBt4XYhqFlly9ICA/UfxLiFZsAhXSlfOWi3YZ1Dc8cw5cXgjx1z1Z7pI35ENtyDPOMFgk7oGHp7fGSxBei/N4yMOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM8PR04MB7475.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 03:59:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 03:59:17 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Tue, 19 Aug 2025 11:58:03 +0800
Subject: [PATCH v4 4/4] media: imx8mq-mipi-csi2: Implement .get_frame_desc
 subdev callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-csi2_imx8mq-v4-4-c16b1d8f88a9@nxp.com>
References: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
In-Reply-To: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755575933; l=2047;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=hTwDs/AV52GhLDf9FbVjQIQ6VSOWHjFvTeVUti0NTsU=;
 b=asXHLDcddkVZg+fXmCMmOcQf6iDkUQDsyjT3vQohf0c/nSPc3cp0Ba2pIMBCNivl+mYzwuQGb
 Mti0YyTB2c4D2M6C0bHtQDIl2qJgsy5aW+XJ9AQPNKF8EOi5arhdDK2
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM8PR04MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c12929-1896-4e1b-d7b2-08ddded4c4ab
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Y0VGcGJSV0RiVldPNTNvL1RZanRyekE5VGlRVTBwckI4NGtoalJkbzR0dGdZ?=
 =?utf-8?B?dHZiZm9kWTJZNC84bmhnc21yV3dVcnFESjVHTk8yMVB3VWlRYkNRWHZINkZw?=
 =?utf-8?B?dE9UWE01eHJOUnhIM3c5cFFpbkNRY2c0QzE5U01qVWpPUnhRQjhxWFE0YU9O?=
 =?utf-8?B?azU4S3dSazViTC9jbXYvQUtxV1VsVmhGL0VGMk1oeFVvSWtNSDZHcDU0L1RV?=
 =?utf-8?B?OGdvYWNQTldCWE16Uk5oK3RjelZZMVNqVmZ2NUF2SHE0TzVGRWZvdERpU1ox?=
 =?utf-8?B?dkxwWTdWT0FlN0s2N1RQSXY2MVpyRXR6SVVTeUNwSmJYTGdON1dteUtvaUYv?=
 =?utf-8?B?OEdFWk13TGljbXpJNlJKYUVBb1lSR3d6TWZDd0JDU3NOTXJlNmtxbGovMFoz?=
 =?utf-8?B?NFhsYmRPYXJYNGltZUxXZE45S1V2ejdqWFpIdHBBTGQwREZEek9ONlMzSHdG?=
 =?utf-8?B?ai84UlpldGNDWDQvMFI5RkNObTBLUVdiTnZDVDh5alNyK2JBRmM2dWtabEMx?=
 =?utf-8?B?Skx0ZFpNcitRenZheXJKd0QxSHZzU2Z6OSsya3p3Q2J4dnd0Vi9yemZOd1JT?=
 =?utf-8?B?cWZYc2xYYWJsa1ZPVktrRW1uSkRoUStoQ2pkTmpOVGZXV2VOQVROQnlQR3lr?=
 =?utf-8?B?U3FpMzVWcFU2VXY1ckM1OW5nVkJLMXJBMzhINTIrNERIcXpMUGlmdUNuQzZk?=
 =?utf-8?B?WVdRV2JGOENjMlZKKy9JVWQ3dHZoTk5IL0tKRlJSa2NPNHF5NDFDVUpSMHpS?=
 =?utf-8?B?SUQyanFEV3hqMWVMTUw2bGlxc0Z4NG1lc1Z4SXFqQXNNSkR1K0orQVFhdjNt?=
 =?utf-8?B?Y0dtUXl3MzRtU1IydkdMRG1MUWhkVzJDQm44eFNzWjVINEYxcHdYKzc1eEpG?=
 =?utf-8?B?S3lKWWgrU2hoQ1pkRXVjMWxjZGtWZUczc20vRzc0KzE3cEt0d2NTY09PS1BR?=
 =?utf-8?B?bGsrL0FCNEtZQmtRSDltZVFpSFJFZVVkOEQ4TzcyQkJ2U0NLMUtSdTlIaTVI?=
 =?utf-8?B?Uk5QcUlmb09TZmo4MnlWNGJzcS93WXA5SzduWG1sR3BZNURyRTBXWUVaeE5U?=
 =?utf-8?B?ellQYXpydmtocTQ5YStxQ3RWSXJiSVZ5T21DSXJwdG9QQ2txRi9kQ3M2blRS?=
 =?utf-8?B?WFVSQXY1UkRibVMxd3RrMENKNmg0c200MVhaTmFhYnFqZEg5OVh6YWhwZ0NK?=
 =?utf-8?B?aVlWOEFXM3VDZnBqMUxxdFZybTJYV1FTSU9GZXJGYlVnTXQwQi9nTkEzZXJH?=
 =?utf-8?B?enRsOG5KSVhrOW9oZ2VBU2NMZ2NOVWdOekRIWHBlakFUT2g1QU9xVmNaQVpy?=
 =?utf-8?B?UXduTFkwSVhPYitjWDlmS25HMkNRa3FnQitSdFc1bTBmNTFLLzhuQUhvWWlU?=
 =?utf-8?B?VmxzcllKMzEvRUpjOGtiVUQ3WHlFa202WFlxRmp3aWRIWFUyMytPekpqUEht?=
 =?utf-8?B?c1JDRGI0VHlpQjBYQkw5TE9WanFaRHRwN1VVM2VQKy80ZWhIMXRvUzRINFBX?=
 =?utf-8?B?VWJvdlpPTjV0blZFeWJUTVdkY0I1L2pEZHhJbVVqS3RFbExzcURFWk5rN3hj?=
 =?utf-8?B?YWNKUGhDYzBmdElQQ0xVUFJOYnVKNThNcmI0MHVLYVQ4ZVJZdnZTc0ZtZGhG?=
 =?utf-8?B?ZUpUSS82aUFLR0FBYldOd25KV0EvbG5ENVpyTldzb3JVNUlwNXIyTjU4aU5J?=
 =?utf-8?B?OExpSWR5eVM3NWFtZzhVeGFVOVN3d1VXckJqWktZbk81L1JMdytXWHk5dWRG?=
 =?utf-8?B?aDZiWEZWNldwVzV4c251cEhENkd5NjlRdkVmK0plOXQ3bXBoQ3pENXhQamZX?=
 =?utf-8?B?d3dFdnRpd2dMR21CQTJ2S3IxTVJKeWFack1UTFBvM09XaVUweS9yNFA1VHdo?=
 =?utf-8?B?ZmEwY210SHhCRFRkamhjRi95U1RmWkVPZWJSR0hEdkdQcktHU2haQ2tpS01s?=
 =?utf-8?B?Vkw1Q3FHdEQrZDQ4UGRiWndSNTVYVkZMbVpjTjE3M0VFSTJXc0FiSEFvODc1?=
 =?utf-8?B?b1czUmdVcGFnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eTY0Y2VhYmZOS3NDcHdNQkNkYndycHJJU08vU2swZlljSEZOdzRSSHFvNFps?=
 =?utf-8?B?ZHlYUzVvbTVSL2sva0FvZVQwbDlFWndIWGJFeDZoWU5vR3QyOVh5eWNzSzJ0?=
 =?utf-8?B?R3dDL3pCbGZQRkY0OEhQbjFZazU5RTFSaUlwNTRzOENQaHZZcjJuejhOSGk2?=
 =?utf-8?B?Tm1GaG02RlhmS3VUQnhuby8ySDh4Y29CVE0ySjBqY1YybE8xN3poTjRXZ1dL?=
 =?utf-8?B?bmJHVk1UeHFieE16MHNzYldMWUFuSGNpbDJmUHhZK2RNVE9SR1lPZzIxaE02?=
 =?utf-8?B?amZ6M2VSMFdWNUFISU8xMGdRdjNPcWVRcmZacXdFWFZ6TWdCV2M5YXQ2V092?=
 =?utf-8?B?cDhOWXRTUW01Y1pMbUpSYkszUThPTi96Q2J1SHkva29NM0FuS09zczZxUlA5?=
 =?utf-8?B?eS9wVFZxY1lxZ1FpR2Z4dktHWDg3Z2dveUVaaWkvd0JUQUdldGtUd0dPZTJj?=
 =?utf-8?B?clhtMDE1eThaZzBFdFBiZEZGc0tvZVlxY1Q4TFZpcjdOdHQrVFdxZUpOWFF6?=
 =?utf-8?B?dC9BbFpSaDNSaFdEODBGQksxTS9UaVdiaTlucjhFU1JJMkdVRDBWeFdYc2l1?=
 =?utf-8?B?c3dXd2pjSmRNYysyUGQrYUFNOWtpTHU3aFdGMjU1VTEyVDhtTk41ZTVLYlUw?=
 =?utf-8?B?M1cyMUVkdHVVQWNQZlhDUlFSNnozbXNjeXBLT1NUWWFDMEJNSWxwR2U1YmlI?=
 =?utf-8?B?YnFBaVZManZYWHVhWTlsbSswcFhBUU5US3V1UHE3RTRGQ2l2Wmh6bzdFZ1Ez?=
 =?utf-8?B?Q0NWK3JieUtYNTM5MlJOUFVhRVVjSEVJS1hIYTNCOGNIcFBNU1pNeUpja2ZC?=
 =?utf-8?B?amRhK3ZoZEdlVVJPc3h0NzNMaGFlbVc5bklUaWs1bzArNUgwVzM0V2hJY3Fj?=
 =?utf-8?B?bEl4bXloRm1uSGxZaGRNRUIzbTJaeGZ1N2ZkM0FjRTVZcVMyTjRYMDBFUkhQ?=
 =?utf-8?B?YVhSdTRWRys3WldzZnVuVG8zVTNmV0hyTE9EUHZ4NXozSHJMb04yY0lFaUxs?=
 =?utf-8?B?UVhZOEZiU3JmeXJ1eWRISmEwSFNabVVzdWxITWw0enFCanFPWnFkL2srSDh0?=
 =?utf-8?B?UnBwZXZLUkpWMmZtd2taNWloaFBlQURUT2VVSVptVkRDN3V0MlkwR2ZRemFZ?=
 =?utf-8?B?ZENwNk5ydDVYdFJWdmkwT2R2OGhuQkMzU3loZG92a3p5RktJY2x5TUJTMXRn?=
 =?utf-8?B?QlNyNlZ1MXZ4NGRpbXAxMlFrc1Fka1ppTjZFK2o2ajYzbW1XVXJnQ096REFM?=
 =?utf-8?B?WDlMeVBMdTBhYjlMTncreFp4YjQ5VS8vamY0TS9Pc0pQK3V4SXJlSFBlT3Qw?=
 =?utf-8?B?RUl0MUd1dzZnNFBvSXBMZTVpQ3hMekpCbkRLZkVyVGE4NzhWTXQ1ZHIyaG9i?=
 =?utf-8?B?RmsxVEI5VElUdzN4Tk1EYUxZWFpjNk51S1B5WTJrK2NGdGV3MWY3Tys4WHVI?=
 =?utf-8?B?dnoxSm1HSEs5TmZEUkxRZkE2M01xY080MU40Y2xQakQvbWVQWG5IYVhEM1ZW?=
 =?utf-8?B?S0pscmpxWEwycTBoOW9Rck10bXBQRkpDMDJxTHd5RTlKODVKcW1JbklBaGY0?=
 =?utf-8?B?eGJ1N0RLbk5jQUYyVksrd0tXYzl3N1VJNFlueUZ4S3grUnBwV3pOblVPOTMr?=
 =?utf-8?B?ZVZhbTJDSVg0d0ZTS2lUbU53eDQ5UmgwQWl6b2ZzeWpHc1I4NVJHTVMxdmdI?=
 =?utf-8?B?ZTgvVlBMRWJUM3dCSUZGUlJTNEkwRmJhaFR1bEpJVHpyZ01FTnpYUUlhWjVr?=
 =?utf-8?B?Q1IrMG1rN0tpOHJHc0ZCdEhxWkswMk5jY1cxV0U4V2lpcDFEZ2t1UFlBekZK?=
 =?utf-8?B?cFUzaCtmN2dGdEhISnYyMUthc2VLbU1ucThxenpIU2kzaENYZ3pHOTg2TXRB?=
 =?utf-8?B?M0VZQ0ZMUVp0ckxJWis4VkpJdGtBR1dvd3Mvc2N1eWtZdGlEd3g4Z0ZwTC80?=
 =?utf-8?B?aEJWeFB6NHBlTmFwWk5HUUNaTVhpWHRmQVg5T3p5NXFhc0tsWEJTcXp5UlA0?=
 =?utf-8?B?Qzcybk80blpxbzhBRkdqc1J4SmJkS2RBSEJYR3dBNnpEb08xOVF6WE9Cd3Nl?=
 =?utf-8?B?R215TTIyTXpPKy8zTGt6V2MvbGUzb3h1NVdXWExDcFR0WlZ1YnRyUFF1T0RN?=
 =?utf-8?Q?fq1/6/6Y2Zj/KEiAexZWrQvLY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c12929-1896-4e1b-d7b2-08ddded4c4ab
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:59:17.2194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivRKPKVrDTFCb7cqsOoMlA4B5oPgs2aIYkeDYOc3Hc7qj5GG9kX/nUMtycGoXs9YTS2o21FHQjTsMRMKnOht+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7475

Implement .get_frame_desc subdev callback since downstream subdev
need to get frame description.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 79c8b56c051eb96cf45bff8803041b294b8c4f89..bc30ba83fc97ee79e8fe87b58bf443e8aa4801fb 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -670,6 +670,37 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx8mq_mipi_csi_get_frame_desc(struct v4l2_subdev *sd,
+					  unsigned int pad,
+					  struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
+	const struct csi2_pix_format *csi2_fmt;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (pad != MIPI_CSI2_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SOURCE);
+	csi2_fmt = find_csi2_format(fmt->code);
+	v4l2_subdev_unlock_state(state);
+
+	if (!csi2_fmt)
+		return -EPIPE;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	entry->flags = 0;
+	entry->pixelcode = csi2_fmt->code;
+	entry->bus.csi2.vc = 0;
+	entry->bus.csi2.dt = media_bus_fmt_to_csi2_dt(csi2_fmt->code);
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx8mq_mipi_csi_video_ops = {
 	.s_stream	= imx8mq_mipi_csi_s_stream,
 };
@@ -678,6 +709,7 @@ static const struct v4l2_subdev_pad_ops imx8mq_mipi_csi_pad_ops = {
 	.enum_mbus_code		= imx8mq_mipi_csi_enum_mbus_code,
 	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= imx8mq_mipi_csi_set_fmt,
+	.get_frame_desc		= imx8mq_mipi_csi_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops imx8mq_mipi_csi_subdev_ops = {

-- 
2.34.1


