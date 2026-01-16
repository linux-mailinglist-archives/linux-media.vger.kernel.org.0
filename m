Return-Path: <linux-media+bounces-50914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88272D33815
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53963304010F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 16:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9091D396B62;
	Fri, 16 Jan 2026 16:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lf9NfbWB"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF63090C9;
	Fri, 16 Jan 2026 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580981; cv=fail; b=EwV800TgFRdw3V4QKR3mrwueIpS+UBahqJdY01c6sngkuvqKLj4EYieRbocQzPFaF51IFKvnKWn7rDQ+OGj8j+sgwD26F8As+WLVDcVZ9IlJ5U5x8+CE25nJJRd1doQcAmh0umN43ED4TPox4RCVcykmVIQ/iLY9wfR6+FKn2tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580981; c=relaxed/simple;
	bh=0s6uiKHv37flI+riV1pXyuMRgyZ7LuQsN+bdg/6Yfgc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=clY29odggyo+zFBeVIbu28XNCMknJYURqWpgIpb+a6ZSsXdaGaXrTh6Umc+IKyWRgGmyOaXITxDB5AdXi1dYTplAJbWnL0sFv4uwP74LtMpQxQ/Yv9kIX+Rd8oRw41FcSp6nLpjTjlv7mCWUb2Y0ssnfk8cIzDmoAoONKhARYh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lf9NfbWB; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNm4ksULxrq4dSmKAatM2RfXzY6mnE/oCwYuqEmrDkLYSmQeuXlZEhM7DBTzu3MFZ/WryFF2T5LYJMGMXd1TQx6VmmyaLpFxrFS76oPl9H2KWMD2Zh1eryp9FJVw1ytTZUL4Pov5/37LLpmDqliow1KS2KSCFkkUOltD2e18NMxhNHI6VQG/lNdhr1qiAW5NQWE3hkM9duI43N9mjNw2JHHo9iI9LQ1h+TvTHxXm22ILPkTZHx9HwPJeo/KeVHLxPDuetKyzuS9kgLjMyWnZ5BxNos6cjiXOXA6DBKDtqvPP7J5j7tw9HOox5nhPNjqhcEZxzo3Mj6yGdcrziyok7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMfu8YX5EFWjefaKoq0ooAG5IDfnoeQp0TYjN5gpe/U=;
 b=ShjtGwtvTZezYUiEhSS6oDd68G6VCT2O0dWecvPgwv6pabjPUxBkXylMlhTVT+TBOs13uZzj64ctDjN+K+W2Gciav0arHMkWrZOE5btCstuXFVgh1XHY5s87g9uUrad12A+JxbDVKDhd6/600UBmkMU4et34J+0fdYBb5dj3WSxVHU5M9YMkSOscMlnl8bEXcFsxolMwgNjrTShhf5ZOINSN1Ray1eM6Nat97OBw7IzvQMZQr1rnJKH+96Rqc6dcitbPLqdnIZxX13T+jlpELwm0FCHSSWRfOaDqCoFFgC7UhPtfBPwtUOrARw3+ZfV0PFeFByOQQ4B463pjmKMdFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMfu8YX5EFWjefaKoq0ooAG5IDfnoeQp0TYjN5gpe/U=;
 b=lf9NfbWB7SXimKWtaEK+mhYvfw+DE/V/F1QUCv5JVFdRuXmxHmOseoBMks1sPyQsLIAve8owjc7LEGoXUdJdiVh2rD14Rh6qDluSJRXy7+kaLLAQfwAeSjrrx3JAfspFM7CdX1H5kSWpbQsAwciYlt9v6usQXzG7K7mIlJMYgs41hwrU9o/0xtGFldVbbpakYQFregKE721KauvqS+nJTz/gqchkbth3Ukzee48um7R7jnD+EDWDLWZirtmns9IoenpJXuCeZqD6J04eoUoKe4lSK0lshPyxmzG2qxchstk9SWxDeFEJO0NmLbtgxLXksPbxGBVwtnnIDq+ZBVIz8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB11433.eurprd04.prod.outlook.com (2603:10a6:10:5d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 16:29:38 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:29:38 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 16 Jan 2026 11:29:19 -0500
Subject: [PATCH v4 1/4] media: nxp: use dev_err_probe() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-cam_cleanup-v4-1-29ce01640443@nxp.com>
References: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
In-Reply-To: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768580970; l=5258;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=0s6uiKHv37flI+riV1pXyuMRgyZ7LuQsN+bdg/6Yfgc=;
 b=UvuZupgM5juo9D15p9Dx2rs2KbhXko+jw8ftSPCfPE2tkWvLLyoCdWFJs3yAqF9JNuj8W+xUm
 HXXH2fU4Qy/B3ZIZG5PNL+xmooGUTLsZ+q9V6Pp31NFsSNL2NzAzOwo
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB11433:EE_
X-MS-Office365-Filtering-Correlation-Id: a1092b6a-5fe4-4ff4-16b0-08de551c7123
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZHUwUFVWb0I3RDE5ZlhEd09TQVoxT1lvcEFYY2hjcndDVFRKSG5LSU1tT3Q3?=
 =?utf-8?B?ZVlEeVhWRlBoRk1lTkIrcjFyVjR6ZHNnbUJtZTBoZDFGRWZnaDY5eU9GZlFL?=
 =?utf-8?B?NWltaTd2SDBQbjNCMTlxd1BTRHBENWlGVTVuenAxbEI5OVZiTUdUaXFlZ0FU?=
 =?utf-8?B?SUd1bmlCVUJZSHJqV21CN1JNRGdUUk9LN2l1Z0U4b2hEbDhjNU8vRDVsOWhB?=
 =?utf-8?B?ZGI2ZG9BM1JrSmZXSDEzdmxnQ2VtVktrZXJZelNRZkllNW56OHRlbUtYWkNW?=
 =?utf-8?B?eCtjenpYcTh2R2pNYTRRWjVMZm1OMHpDQVNzNG5NL1RrcUFERW9qaytvWkdl?=
 =?utf-8?B?ZGJWeUJlN1FrbnkvQUo4c2IzbDNNbjkwdGFyeFcvdGtoV3E0VVlCdEVzV0Za?=
 =?utf-8?B?alRwWkZBYnkvcDdqSUU1ejM0WWlpeUt1VS9uaUdTNzF1bWdhL0c1K0ljV1Bn?=
 =?utf-8?B?UGFJemZIelBFN2lFNmxzNzV0R1UyRVdveHhEYVpvMnVaTE1CSFlWS0hxSmhW?=
 =?utf-8?B?U2JFTU1JMGhDbkpUMjZMZm05NXZocXhaenQzK0ZxSGE1b2ZtOGtmZGYvdGs1?=
 =?utf-8?B?YTZibE9TdVh0MnBsVWRBYWVNSFVPcjZHK1RJOU9sMitLVTlYMnRjeHdYVHJo?=
 =?utf-8?B?NnU0SzVpVldpUGVoVWhqVTZ1eTJra3BkWVBqbDV0MXJEeVR2NFl0QkhYVERM?=
 =?utf-8?B?U0tCZHExdFBXUWJYdFJ1THVpdHBGTE5OM1VWWkJENi9rQ2o5NmdrNlVkK2NW?=
 =?utf-8?B?QURVVWppaXBXTGZxbkxsa1JJNWFJR0pJWkNvbXA5NFZBWXVtbVoxaU0yNENt?=
 =?utf-8?B?N3pISnM5MDgrbzBIbE80ZXhtcDlPc0tqMml0K2hOWnd4aTRkUkNpd2oyNmJW?=
 =?utf-8?B?blY5dVV3eWExSk5QeTZTMlN6b1AvZ0NtTVREUlZFRXVOMXBOVDRyd0Z1SWky?=
 =?utf-8?B?NzZSdjZqVkhEcDZaRVpGTGNTUjZlcEFuV2E4SlBmWVFJU2NJNzhMaWdab3Vt?=
 =?utf-8?B?YVJCRmY3NW5SVFRrYkJFQ1hBV01xQ3Z2eDRYTjVacVNVRFJpS3pLTXhzZGxa?=
 =?utf-8?B?ZGNtUUZOYVhYcGpEMGRCazd2bnExTzZFVlMraklDOVhCLzA0Y1crQlpnZHcr?=
 =?utf-8?B?ZFBMQ1FVUFVYL2VJZ1drN0srbFFVdXI5UjhOT1E1ZTJ6aWo1REZtN0twMmJa?=
 =?utf-8?B?YWNjYUMwOUFSMHNkaFZLRFdUQmhOSUd6RVZ5Wko4bkgzUlVvNW1jT1JZSk5T?=
 =?utf-8?B?M2toRkIzNkxQOUhyaUhqYWxpc0EyVHNpOWRRM3dzVWtWS3pHQXVGMW9KRklp?=
 =?utf-8?B?VzgzOW85RU5pT1YwcVM4QnN6bUpIenRqeGE1dlZFVXF4TFpFbDAyK3V2UFNl?=
 =?utf-8?B?b1J3L2E4cytZRHp3VjRHVExIbE9aejE2N3VraWdobWo4NU9EckdkT1FRN0ZN?=
 =?utf-8?B?VjloU09IZHNJZnBFQmNQcm1scjFEN09XMXdqbTQzeU9ZU2FUZ0h0ZlAwSTc0?=
 =?utf-8?B?RXJCaThlQ04vajF3ZUF4WlFOdXFqK2dkUmgrOGFXV1F6clFraVNJWWQzZk5v?=
 =?utf-8?B?dWg1c0tUZWlQZ05UQSs0dHdhWEZ1eGV1dG1KdGxKMTNHK0pFWVYxMng1bk5M?=
 =?utf-8?B?OUd3L3dQVW5SbEV0OHBKMnpjVlVza1AyMVk0Q0xJb0VieDc0RnlsbTlNSnB0?=
 =?utf-8?B?d1FpRU04b1NXOEpWemVlMkFEaDJNVHJmdC95empvVTVXeDJMWWJvYStkSFBs?=
 =?utf-8?B?cWdGOUVlamhPcllIYmpmSENZeHdFM0N4MW4zaDczZFZWSC9YNDYrL0F2VHZm?=
 =?utf-8?B?aFg3UWVxRFNMWE9MQm9TTzdoamNqa2xRTm9OdXVMSGRDUmlXZlJZamVkL1JJ?=
 =?utf-8?B?ZGdNQzhSQTkyT0hlQ2JVRmMrOHdpUnZmUTNjdVBLRGw5KzdjWDZtWFc3YjFT?=
 =?utf-8?B?cXIwcUFCa1YxY29hNjlBdFRuOE80enNaa0NWZTk1MGJuQ1ppUVBxcDVpcUE1?=
 =?utf-8?B?T0VXSVdHaGhlOTJwUmgwQzY0Ulh3S01ZejFGQkJxN3NGWEplRVZaY0w5QTND?=
 =?utf-8?B?cTlnbWRydXovRmdzdW9IdUNrSHZQZ2pyc3JGZnlRM2tJQmt3TGNQRmZnWDVo?=
 =?utf-8?B?NkVzWFlFeU9ibG9EeUtTR2dUb0Z5V1dZNWhqRk9TWjNCaWFFTWoxK0JJblU3?=
 =?utf-8?Q?pXHKAQMp9iBL9lo5W9e/LYZs+EOVgPoh54T0QLuQ1XtT?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RG5mblh3R3Y5Mi9VOVVCM1lnM01VbkxEVHcrVHJ1VGdjdWJFUFhSTVdmUnFN?=
 =?utf-8?B?RXVkdzhsWWxEeEVNVHpsWDZWcGdHSmdyRlRSdmkweDdCMW9vN1M4VDBIRnlF?=
 =?utf-8?B?K054UExOWi9rc2pmdTlJZEs4VS9TZ0lmYmdzb2tmaXdiai9ZZGF4Zm5FRWp3?=
 =?utf-8?B?SjdGNWo2eStEQTZmelpBUjJibHBWMVVWL1BTNkwxcklhREhnT2tGWDd3Y1Zy?=
 =?utf-8?B?aWpocnJjZW9xSVE2ckZqODlFNzg5a2pZbHE4aHB4dUxTTW10c3BZZUtiZy9N?=
 =?utf-8?B?Q1ozS1IxL29SZ2VwUFkxUjBhMERVcDRQM1Z3T0FQa2JMVk5rc3EwNlRPVmlB?=
 =?utf-8?B?QjNPYjhlM0Z0WFQ0cHNzUThxc0Rmd0VGM281cnlyQlM0aGFtdlEvc2dyMFRQ?=
 =?utf-8?B?SW85ZEl6cC9PcmNMcGM2OFdKSXU5WWJ5cHhmVVJ4QUZDam52L25VRTBjeFpF?=
 =?utf-8?B?ZkI3ditKN0hMT09zMTlMS1drRVdPZXFHK2FyYi9xVDZUbTRvQlVBQkxPaGQz?=
 =?utf-8?B?a0NpOGprUnk0UHJZTVhiVEpBOGpRZmZhTHR0MS93bUF6Rk5XUHM0Vm5Cc1Qz?=
 =?utf-8?B?MXpiSTRGY3ErbzQ3bEhjOTQ2dnoyUmlDZEo0Sjd6cjNmOVgwVU1Od2xrdWkx?=
 =?utf-8?B?VmVRanpYK2dXcVVNcEIvTS84MGdUN21POGtJVmZCcEM2SFV0ZmY5b0p6UnFU?=
 =?utf-8?B?R2tqMlBTYjZZdG5MSnpKWnFCRGlieTRINzE3NWZVMGJuYzlOZ0VHMTlMQ2x1?=
 =?utf-8?B?aFNTQ0tlSFJxcHVuaTdmV1lCYk5wM0tVWFNIMTZMOXgweTdlbzdwQ3FiWFlF?=
 =?utf-8?B?cE9pNi9RNW4zbmp3K2RDMmx2UStDNjI1NXRXMlVEb1hubmFQYURHUUhoZzha?=
 =?utf-8?B?cmpidi9BVDlhY2tIUmN5dWlaRzM2bUpDWVFTeTNlSllMSUs2c2VNSHZGdTdQ?=
 =?utf-8?B?UHk3dUVGQURWd3lhNUZsSE1rNC9aelF1d1lLU2EvM1B3S0dBWFRJR3I4OUxj?=
 =?utf-8?B?U0UvazhIWTNEWEU0R08wQzYyNnNMbkphRGNUeUpuRGJtU2ZPeHVYbTNpOER6?=
 =?utf-8?B?WFZxYnZmOHRiUXpHa0Y1T2pyeTFFR3djR21JZlQxVU9tYW9NLys1V3FDVVJT?=
 =?utf-8?B?TlIwcUFRQnhzbW83RWNYaEJDbzRxaGUzTGVEZEozbTdJemVKcEZIaERNUEhv?=
 =?utf-8?B?T1piRVRxVU52Um42Q2NQejBNS3NSTVNETjRDQzc3QlZSS0JPT1p2VXhrd0hS?=
 =?utf-8?B?MlB6UkNhT3Q1OGVYYW9KdHJ3Ujk2WVd0cU12OFE2SzhabGVmK3B3Tkp5R0lE?=
 =?utf-8?B?bVFSMWpQSHkvYXVYUmtVb2czaHJET3dzTXNET3FYSHlkTmUvdEdoQTlPMXU2?=
 =?utf-8?B?M1FDTlVRSzEzeDZzSDU5dlhQSFBkb282R3RVNGxVWkNoOXZwWFpoa1FjQkM1?=
 =?utf-8?B?RXRpNCtKQXBYdlgrZk5mcW0yeHVSU3F2clZzbGdtSEFrZXJubEhMa1U1SUNT?=
 =?utf-8?B?by9zZHRqMGtBQUFmckRpS3NpeHVXaXJoUmF4WWRzVWg5S25iRC81Mmw4dnhM?=
 =?utf-8?B?WGx5YUJSM0dCUXNqTFdQTUdXaEhKY0xnT2lDN0Z4b2F0cUxObTl0WFhTbEFO?=
 =?utf-8?B?ZXRaYmkySm56MDViTDRsTWd4bnh4eTErcGx0Z1VwMmJuNHdGZ3RHcnF0UHNv?=
 =?utf-8?B?dWZpOEZJQXZENzRkVW13SnRNODl2WGlhUkd3cUdQS3pjZmJzMHJXOUJFLzJi?=
 =?utf-8?B?ODRPSkhrRjhUTWsxR2x2VEJ5ZkIrV2EvVU9PREFBenlCTUE2QU5VWCtLWG5t?=
 =?utf-8?B?bHhIYm05cXRVRGhGNHZKTUw0Ukt5Sy85T29JL2ZlQlJEMEwxekNDODQvQVpn?=
 =?utf-8?B?eCtramcwQzdobmxkTjdKR05EVzNwQ2ZKOEladVR1RVFja2JZQVltOG1WMnpZ?=
 =?utf-8?B?R0lWVUJjdXNlaFI0TktHYk5paEdDNXBlUm5pNWNwdjE3MjhUckRWOVVjVnZQ?=
 =?utf-8?B?d0txUHpyb3ZBdG1wa3UwS3RGU2RJMSs4eGhKTTJmR00rMnIycW5RVTRvUnpr?=
 =?utf-8?B?ZkR6dWUxTGh6MkJndWltSnI2VWZKaE1WTjlkMjNIWFNVbFl4S0JGL3U2cnhL?=
 =?utf-8?B?U1lUZGpFQVB1REpaeXRSQmVXcmZ4bUdBeEE0SXlNRlg1S2hNUlpNR0N3ZDg3?=
 =?utf-8?B?MWJjWWtrUDhTdE1ncHRvbHAraUZYcnNzUFZvb3RHbTlRM3dlM0NUOERXTnRS?=
 =?utf-8?B?eHdNWU9aaHA4ODFweEdCMlB1Q0VtcXRIOU5yQlVtNkdqU0Y2UENhdldDTzRI?=
 =?utf-8?Q?phV4/8pi/E88sxEsjV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1092b6a-5fe4-4ff4-16b0-08de551c7123
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:29:37.9884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOQFJ8xCNr9TMTzuG3vGdGwxuqvQu2IU7qk6Pja4MS1AbTFjBdnyNs1SfBsBoaO1AineYfkPIS3hs9MU3gyQrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11433

Use dev_err_probe() to simplify the code. Drop the explicit error message
after returning from imx8mq_mipi_csi_parse_dt(), as the error is already
reported by this helper.

No functional change.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v3
- add Alexander Stein's review tag
- fix error message grammer

change in v2:
- add  Laurent Pinchart review tags
- wrap error message to new line
- remove error code print in dev_err_probe();
- drop error messaage at imx8mq_mipi_csi_parse_dt()
---
 drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++---
 drivers/media/platform/nxp/imx7-media-csi.c   | 14 ++++--------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 33 ++++++++++++---------------
 3 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c22e2f86b1e0aa84ec1a76061 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	/* Now that the hardware is initialized, request the interrupt. */
 	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
 			       dev_name(dev), csis);
-	if (ret) {
-		dev_err(dev, "Interrupt request failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Interrupt request failed\n");
 
 	/* Initialize and register the subdev. */
 	ret = mipi_csis_subdev_init(csis);
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..7ddc7ba06e3d4e007013821f67d783898a15461f 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -2218,11 +2218,9 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	/* Acquire resources and install interrupt handler. */
 	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
-	if (IS_ERR(csi->mclk)) {
-		ret = PTR_ERR(csi->mclk);
-		dev_err(dev, "Failed to get mclk: %d", ret);
-		return ret;
-	}
+	if (IS_ERR(csi->mclk))
+		return dev_err_probe(dev, PTR_ERR(csi->mclk),
+				     "Failed to get mclk\n");
 
 	csi->irq = platform_get_irq(pdev, 0);
 	if (csi->irq < 0)
@@ -2236,10 +2234,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
 			       (void *)csi);
-	if (ret < 0) {
-		dev_err(dev, "Request CSI IRQ failed.\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
 
 	/* Initialize all the media device infrastructure. */
 	ret = imx7_csi_media_init(csi);
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 0851f4a9ae52d3096f454da643cfdc5017e000b1..83da050a1dcbad1d41c94de0e352dcafe3f25e62 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 	int ret = 0;
 
 	state->rst = devm_reset_control_array_get_exclusive(dev);
-	if (IS_ERR(state->rst)) {
-		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
-		return PTR_ERR(state->rst);
-	}
+	if (IS_ERR(state->rst))
+		return dev_err_probe(dev, PTR_ERR(state->rst),
+				     "Failed to get reset\n");
 
 	if (state->pdata->use_reg_csr) {
 		const struct regmap_config regmap_config = {
@@ -977,24 +976,22 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 
 	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
 					 ARRAY_SIZE(out_val));
-	if (ret) {
-		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "property %s not found\n",
+				    "fsl,mipi-phy-gpr");
 
 	ph = *out_val;
 
 	node = of_find_node_by_phandle(ph);
-	if (!node) {
-		dev_err(dev, "Error finding node by phandle\n");
-		return -ENODEV;
-	}
+	if (!node)
+		return dev_err_probe(dev, -ENODEV,
+				     "Error finding node by phandle\n");
+
 	state->phy_gpr = syscon_node_to_regmap(node);
 	of_node_put(node);
-	if (IS_ERR(state->phy_gpr)) {
-		dev_err(dev, "failed to get gpr regmap: %pe\n", state->phy_gpr);
-		return PTR_ERR(state->phy_gpr);
-	}
+	if (IS_ERR(state->phy_gpr))
+		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
+				     "failed to get gpr regmap\n");
 
 	state->phy_gpr_reg = out_val[1];
 	dev_dbg(dev, "phy gpr register set to 0x%x\n", state->phy_gpr_reg);
@@ -1017,10 +1014,8 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	state->pdata = of_device_get_match_data(dev);
 
 	ret = imx8mq_mipi_csi_parse_dt(state);
-	if (ret < 0) {
-		dev_err(dev, "Failed to parse device tree: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Acquire resources. */
 	state->regs = devm_platform_ioremap_resource(pdev, 0);

-- 
2.34.1


