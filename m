Return-Path: <linux-media+bounces-50917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11443D33839
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEF8530A2788
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 16:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA3639526A;
	Fri, 16 Jan 2026 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UgwnJQ5r"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13B396D3A;
	Fri, 16 Jan 2026 16:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580992; cv=fail; b=WrJuOOu2W0yN17SZ7AxEGmEVqPZqVbeNKY02E/5WTKHXOfSZ7zVXQ2+d3mV2pK6QUas57x4awSqttb4uEYkf4mTYUKZTAna0yGwDB1V37eIbWlBcuC2i5dT1Lj70Y+ZmroPC4Wlf8B2lrISSjIIIyGDxR3uwIZ6HD/MJ4hveZuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580992; c=relaxed/simple;
	bh=V5s0+xr4FB+C7enMAsRsoO8JlZONnC0dplnnICAkgaE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AdNFfuzSJ+iziWQwzDY6cCPMsBoBhRcnpC0ejtSihzTXzvgdFiWEoc+i1K2pbkhWfTsfgEN7liARUVaU+8RbASgL+DHBUrrAvQuRbhi4X9Y7Q2KPodwrc0j9V7Y3x1HU/AjA+z4hDleWvlyFyGpxuwsGSwZWn1RJvWlYFwo0Okw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UgwnJQ5r; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYvbiU9xyuO+o+9L06HCHuxNyVL6mogM1XRInf3UYdPMF2/8WEYSsPFK2iN7z+lQ+1ZYYtMKU3gVBokNNxH/eORmCGO2aQZVkUTiriH/Tj1J7FL6I2aJ1cMQnqzIaoQn1vbg1u8vnT+VVcPXwMxKT03zSSSjpymHZN5uE1f10GGkbq5gT1EIbTnz0xbafmtXZeZh2EA1r5xU38MP/n4SZ0m3HeEUWJdyEDKTAp+gYoB0iA3KY52t2fRltsq9iOdoZm3MGVOGeYDunVXR45E5K9mIyZ8PBguq6PkNQk1+sF2lFpiKO8OBca5WC76l+FA82uiO46HsCSo3GUP8oGaLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OT8Z2TYJROLREx5o2oyzXBC9PH9tHUMT+3xPPO86YC8=;
 b=g7vGNNnUlXqfNGWLFMEQ8sudP6+pSw9xM2VV1nQxhyE3OTSvm22tp3k5mEgzenBhAI6Y93Y+JfKtRdUNAbdPbaO0mZy93AkQohtrBjuIMUDtfb4NtYjhQqjR+jElpDScPP1qTby25UWENk7ZXQYFR7emVis9Blhn0P0fqKyxMx3KPbIzW1xSbxR38k9nyRNjolq7VaQgeeD0QgcaXEtT+fir2gUNpN314eh4iTGBhbo3CmSKfTvzR4by52xfKtGVfpsLnWaMFYi4SAMTV6PaQzA2o/6bWu11AinBHomt6b1n63yGtpLGQhkC9M+iawGsO3iahyJmYacmVrIF9lIOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OT8Z2TYJROLREx5o2oyzXBC9PH9tHUMT+3xPPO86YC8=;
 b=UgwnJQ5rueCy3F7MluIjI6QhTyaQ2VuJYPjFAd34v/QnAmTySfLvRyniack+b0jOD6Ifekd3sdRCdPk2aQ2ytyJEOTh1I6GPP/dWOnWSTzD2lucNQp6z8c6stlcDFBf63AVm3evmmfNGCGgwXhnreShwqgCeXchHiC63CMtYcM/TLohHzvQfToZ7SmK/DuImjJI4eBK5IpjTac4d+8OnRzIZmeit0XiFjzxcCWcCB2LAk1Q3FUysrktyk0kuPlaYOwBERmsvxcW4GxwDd6npk1dZcCFQbuRkHMwlQV5LExfEwDVf9GnrsF1wdJrnnU97oaf2bjInwNlzONbPPpZ0sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB11433.eurprd04.prod.outlook.com (2603:10a6:10:5d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 16:29:48 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:29:48 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 16 Jan 2026 11:29:22 -0500
Subject: [PATCH v4 4/4] media: nxp: Add dev_err_probe() to all error paths
 in *async_register() helpers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-cam_cleanup-v4-4-29ce01640443@nxp.com>
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
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768580970; l=5116;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=V5s0+xr4FB+C7enMAsRsoO8JlZONnC0dplnnICAkgaE=;
 b=yNK415qQ5JA0O/95SMngBnTVPAyeaIqB5Xho3mo4Ic1aA8+OZDq0uqBM+bunHF32xErEUgDAe
 U4Lq6pOjP6+CeujWtpIP81iK/nx/f81p1u+/36eH0hbj7Cbby8KBXNC
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
X-MS-Office365-Filtering-Correlation-Id: 8bd43185-5cd6-49fd-b3d8-08de551c774e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Nm5XMW9zMTJ4WG0zUWlESjVKeTJNVUI4MUM2YXVpSGRtUzNhazZNam1tNUdN?=
 =?utf-8?B?LzBZOHpBQThhbU1uUW9ZUVVIeVBmNTNqTERtZlhQMkNrSnE1WC80c3phTy9U?=
 =?utf-8?B?SDZrL3FRWENGb0RXZnRHK3VXMjRQaDBQUmgwTGdiN0FHdDJNK05OTWRTUFRD?=
 =?utf-8?B?WHRJR0ZVRzB2ZktYejhNMnRtU011bEdKQndwK2pVbzF4bUxZMU4yZVVXLzha?=
 =?utf-8?B?Uk9tYTZ1MUY5dDFkeXlIL3JhTndFOThLM1BpK2ljV1phd0NTV0o0Uk1GeXND?=
 =?utf-8?B?aUFLaE5RSjI1NlAxSC8wVWhZOGJJSU1WT1JWbUphSWxFdzJJblhSUGFSL1ZD?=
 =?utf-8?B?NjBTOTIxa0lnZGxEZDFHbFE2RXFKYndXbVByUjdNZytOVlNFUEtzYmZkbVlm?=
 =?utf-8?B?UGUxSEd3ZC96UVU1UHUxV2htQllZeGlGTkROM3NEVTlVQlNTZzlHczIvelNF?=
 =?utf-8?B?c04wUDhJdWhsTWhJMFMxSmNIZG5JZjNPcExaZmRLOXZvaVpVeGFNeXBHdEJW?=
 =?utf-8?B?MEdjQmhFajVJZnlrd0ZoNUVudkxtc1B0Q0xUTFVoSWFIM3ZIMGJxZjJ5SnVD?=
 =?utf-8?B?dHZDQ0lldnRMdHRLU2hETmdYdWhaZWU3ZjV1b2NlNERxbkVWaC9hT3ZLK2Q4?=
 =?utf-8?B?bkEyajJ3UkF3RVVGVFB1V0h6M0V3RjNGU2NxQjRoVnJJUCs2WmxXcWRQbW56?=
 =?utf-8?B?dktzYTZSdXhLRzV2VGNBRHppaHJjNUlLNVBoUzRBLzFuQ0EwR1BiWldZTEdV?=
 =?utf-8?B?YXo4UlJobFN1ck1TeGZoYzQ1N2xMUUlJWGJTU0JqNlFtQWFqWWRNalBoczJm?=
 =?utf-8?B?aTlqcTRUS2t6RkR5VjdVSEJaeGxLeHQybkN6OEc5a3A3VEhlOUlySXUreFBu?=
 =?utf-8?B?UHFOQ1N4eDVtMGg4SHVkR0EvUlFjdFFXUktpUGxhZ2lPeDFwMCs2RFBVa05m?=
 =?utf-8?B?SmxvOW1xWFp0RkFoMSt5SEp3R2cyMW1pdVRaNkJnd2FnZGdXNmc1R1QySGI1?=
 =?utf-8?B?a0VQSldacksreGdnVktZUlIxU3h5UjRpMkw1azJEWHBHZVdtUlo2T2JjcjBB?=
 =?utf-8?B?c2xvbytPMDBuYkdPZ0VteTZLQlJOaElLNVB3UGJSR21OeDg1RHJ1TzMyMy9m?=
 =?utf-8?B?cG93ZkN5d05rZDhIME1iVVRPY2lnNVdGci9teDQ5Y0V6cjFVQzZGUWZVUktp?=
 =?utf-8?B?TEcySi9BOTdhR0JwWlB5S1A1RmlaVGFTQnlYUWYwR1ViTVM4QXB0cU1HaFcv?=
 =?utf-8?B?dncvZzBZNXF2bk12eUNkSXVYU2tCUHF1RWpiTnVFTVhyVEhQcXZudlJvT090?=
 =?utf-8?B?YUdqTVNIOVB1Q0lEMnlYcnRxcVAvL1RJNzBjZXNoNEZYRnhndlhXVWFQazhP?=
 =?utf-8?B?UTBBUjdKRGFBKzZCa3VrSUsrUkdkK0VTTkV1ZXNtbXZhOXlIbXhEd3ptNDNO?=
 =?utf-8?B?SDhBV3llVXc5d0dKcW9JSHZKQjhOSWdISWtmekc2K1V6VU1wajJ5SEgzZ1M1?=
 =?utf-8?B?QnMxOHViMVpzYVcyWFBNQnR0Z1RobGIvdWZQbVAvU2NxVVJYeFMzaTE2NmtR?=
 =?utf-8?B?TGU1b2YwbnNhcDVYL1ZtaThjZHZzQ0dKSlhWZ3ZkWG9BQkNyZkV6OVphN2hw?=
 =?utf-8?B?NmpGR2JDYzRHZlVTb0k1ZUkycDF1K1g1MjlqVXFkMlgwZTlwbXlOSTV6dE94?=
 =?utf-8?B?ejFzT2pTc2JaTjN4enpGYlhFVzVZYlRpVlZPa2RJZ0pkZW0wR2xLSWZHR1lh?=
 =?utf-8?B?cGN2ZXRtcXpCS2pmSWJmZ2kzQVBJQ3poeUFzN2c4MnNhTkV0QVlnNnBza055?=
 =?utf-8?B?a1o5amxOQmVjQTJYT1RYeEdVSFg1YVd0Ym54NzR2S09hcWJWbEJBT3VUbkg2?=
 =?utf-8?B?ek9iQW9EQ05jM01taUdRWWJzRnA3LzJLNzFFd3BGMnJnQzlZUi9CQjVTUSth?=
 =?utf-8?B?SDlRMDZEU3oyYzcrWHFWa0JCZVdDRHA4aVRBT09WeVc0SnFYNUIyTFZGcDI2?=
 =?utf-8?B?U1diZmhLZHUyc0tGbVY3eDhxY0RXM0MrR0pmS29wMXovYjVQblBOdzhMblds?=
 =?utf-8?B?MDFrdHpVeE0vdWxkZC9iLzliVVVmNXRmOHdZMGtkUDMySVBHWmpQSHRKZzZz?=
 =?utf-8?B?a2laQ0hHYi9oVXpVOXdlSHRINU1XYUVzSktRYjRTcThndGlPeWRnQWd1RFE0?=
 =?utf-8?Q?VDmC8d8ZfDQfLkB4o0Osiz/qTfJZStp0QvXslII8mNtS?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?S1M2TVAydm82ZHptdVZyNC9rY01DbUdPTWFhR0RpNnZQWjlqekExcU4vTWVo?=
 =?utf-8?B?VWYvUzZrb3NQZ1dycldHcy9jbUJOK0RjMDYvYVh3VWhGWUNBdU1mRVc4bVM2?=
 =?utf-8?B?dklDZlQvTzdMWHpZaEtPSDNKWjYvUWJSRVdFaUpvSVNKMlAvcEI4emtEWFBl?=
 =?utf-8?B?cERjVWVxUFNpR2hzSGZOTEFjOVBQRHlqQUN5QmJKdlBPOWQ2L1VWc3pHUWVw?=
 =?utf-8?B?L3dVdUtEYzRCUDAwVW1CWW0zclYyeU5tN0dqOVhNSFkySUlyTnkrWUdFQ2JE?=
 =?utf-8?B?S0FpZFBIaW9kNjhTeWhtWWJmL2NwU1IzaGY5a3YxNEdWMG81eWN2c1MxTnQr?=
 =?utf-8?B?NitHaXBtaVZucmNIUnBVZlR5clBVN3puamlWS29qd3dleDhmRUVpMjB2KzlR?=
 =?utf-8?B?NGlCa0F0eGExR3NCeVFIanpXaVZZZk8waXRxd1BvTDRyN3FNRTM4NUxXbjVS?=
 =?utf-8?B?NUVySkd3anlIOGRxZWZqZnJOV1lHY1R0eVVSbmFpVlAxaHh6dGx3QndhdXJv?=
 =?utf-8?B?cDRNWEk0Qkc4NDdEbXdEbjZKUGtlK1ZNVDc0ZnBTbWpQZEhhWnFZS2ZsMGJo?=
 =?utf-8?B?V3d1c2xUYkhrWlRmS09SUXJrKzlJd2pIUWJrVDhMTGNXZVVZMUxPdW4rc25l?=
 =?utf-8?B?RHNHdFNRTWNFK05oc1JqVkZXL1VCN2NyTEFIZitLY0RUbmRsc0xKbGdKYUtx?=
 =?utf-8?B?V1g5WWNBWUowRGlVTCtuV202LzBWUWpDeWtmOEhFWFZPbk5TWlAyVkt5TjZR?=
 =?utf-8?B?NEo0ejhtNnZ4bXAzMVFwZHRKR2IxZkJYSjdZb0l3Q3ROcVNJOGM0OUE0QmFT?=
 =?utf-8?B?QUpFOTh0NWxyWDcxTmU0Sk5lMmxlMCtqZzBsN1ZsT09jQUFzT2xaRWNlTmlt?=
 =?utf-8?B?NmRPMGhRcThmQWNYK1dhZzhra0FzYk1kTXprcnBabVEvbGpRbFRZa3MzeUV5?=
 =?utf-8?B?K2UvV2N4WC9OWEdXdUF6Ymt2UHhIN2pTQTJrQ3Rlam9PN3pmWHFrcnQ5S2Rk?=
 =?utf-8?B?S0NwSEVLcXJ1dWZHUjRlUXZZZjU5UkRLRzB5QTFVZS8yZFNpWFF5ZHFBS3BL?=
 =?utf-8?B?eTdJdm1aSTlwc3BlSUJUZTFRTjVCM09lVFZXVWVMQWVCazBLa3U5ZGEwM0h0?=
 =?utf-8?B?c2hCRldBOTE2MEVuZFpIQVhwVUNabDMyN0EyZUFIMEh2SHU0czBPeDdFRUZ0?=
 =?utf-8?B?K2xHOHIyZ0VmWk9aYWdZdjcvTlJ4bVFBeW9wL0dSOG9QS2hqZ0JCN0VtRFRN?=
 =?utf-8?B?K2VZMUxLMmpqRUVRbm1iVXNsa1U5ZG1VN3B4ODIxT3RWQStqWjZ4STNOUysx?=
 =?utf-8?B?RGNiMU45SzREUGQzSU96ODNNZW03S21HaC9QZHBKa1BmazlHYUNPbEJQdFI4?=
 =?utf-8?B?UUdNc3grYmhudlpvcERIdnY0Wnh6U2phcWs2djBObEpzZXhxbmtPY3NWNGtJ?=
 =?utf-8?B?MHpnKzFvWVRWcnQzRXZpV09rWUFDN3dML0doQVFiS1ZDcEw3bUUvV2ZsWnNs?=
 =?utf-8?B?SUVsbXVMcXRwVFIwcmVOMG45S1hIaUV2YkdGYXNSRGtiZUFKZnZwMVRDN2JB?=
 =?utf-8?B?d2ViajBFN0JkMTBzQkZnODFYV0dTT1FadVRFVVF3QXFIWDVnODJRbk1iY3lt?=
 =?utf-8?B?Ym5rcEptdGdHcWpSTzRIOFFBZEtzK2ZDTHNmcVFibUN6ajBza3Z0TFU4TzN0?=
 =?utf-8?B?OThaQ0RYd2tRcXJoUWxQcG5ja3lFTXloRGhMeUJWUHYvUnFPMngzK1ByVXZV?=
 =?utf-8?B?aVdEN0NzREthZWV4OTdJc0VOaU96WUhlY2RaOW9pYVVodnVldzJ2dGNFUWhS?=
 =?utf-8?B?eDJXTUNGZGFpSGxUY1pDdEhVTGJBeWpKeFNObnNJek1XWEF3enI1SjVaMW1H?=
 =?utf-8?B?OThYM25rT0wxR2FjVnJ5QlJHNkI2dCs2M2dSMGt4amdERjN6ckRLaFkzSm5m?=
 =?utf-8?B?QmFQckpjS2FZTDI2YkFQWUsyQTg1a0IrWnJYTFF1d0hUNGViYnVGVXRLTkIx?=
 =?utf-8?B?UE1zNmwyZ2NKVFN0enlHN0JwTGVsbmFLcmJteEk2VFJWWkh2R3NzMnNqbHkr?=
 =?utf-8?B?ek9sWGdocnpMS3A1WFR1ZXV1L0lad3ljR2lNK2lPUVg1SDJuMVNLVkYrWTRF?=
 =?utf-8?B?L2hwRjhDa3Zva0hvNzFKWDdIOVdXS0xtYVV5R2hGTHFTWWRsZVQ3QjNObDNS?=
 =?utf-8?B?RXhzZUFWRERtNUFlYkd0cU1WOGhFU0p4TlFMODFEeGc1NGZmaEJnMmFGMDFX?=
 =?utf-8?B?VG05LzdWenZvOHIySXB2YUQzdHNDYXpBYkQ3Y1VjenA2UURsNkE3enJUNmRM?=
 =?utf-8?Q?PafOf/KICER0SvAQds?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd43185-5cd6-49fd-b3d8-08de551c774e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:29:48.3694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ANDBOEIGKrAHK3Uu6s6Z+ywzPwAZzAWod1XmaRSCYQcFQ9JuWht5pe//svhyUCS5ZRpZPCNzGnQ2lklz25IBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11433

Add dev_err_probe() to all error branches in the *async_register() helpers
to provide clearer diagnostic information when device registration fails.

Drop the explicit error message after returning from
mipi_csis_async_register(), as the error is already reported by this
helper.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- new patch
---
 drivers/media/platform/nxp/imx-mipi-csis.c    | 31 ++++++++++++++++-----------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 27 ++++++++++++++---------
 2 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 9a43fd1eb0bcee7ac0c47f28ad89012de45a70d9..85098824f4917b3cda3aa71c4ed0a41939283e12 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1359,18 +1359,18 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
 						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
-		return -ENOTCONN;
+		return dev_err_probe(csis->dev, -ENOTCONN,
+				     "failed to get remote endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		return ret;
+		return dev_err_probe(csis->dev, ret,
+				     "failed to parse endpoint\n");
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
-		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
-			dev_err(csis->dev,
-				"data lanes reordering is not supported");
-			return -EINVAL;
-		}
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
+			return dev_err_probe(csis->dev, -EINVAL,
+					     "data lanes reordering is not supported");
 	}
 
 	csis->bus = vep.bus.mipi_csi2;
@@ -1382,15 +1382,22 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
 					      struct v4l2_async_connection);
 	if (IS_ERR(asd))
-		return PTR_ERR(asd);
+		return dev_err_probe(csis->dev, PTR_ERR(asd),
+				     "failed to add remote fwmode to notifier\n");
 
 	csis->notifier.ops = &mipi_csis_notify_ops;
 
 	ret = v4l2_async_nf_register(&csis->notifier);
 	if (ret)
-		return ret;
+		return dev_err_probe(csis->dev, ret,
+				     "failed to register notifier\n");
 
-	return v4l2_async_register_subdev(&csis->sd);
+	ret = v4l2_async_register_subdev(&csis->sd);
+	if (ret)
+		return dev_err_probe(csis->dev, ret,
+				     "failed to register subdev\n");
+
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------
@@ -1549,10 +1556,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, &csis->sd);
 
 	ret = mipi_csis_async_register(csis);
-	if (ret < 0) {
-		dev_err(dev, "async register failed: %d\n", ret);
+	if (ret < 0)
 		goto err_cleanup;
-	}
 
 	/* Initialize debugfs. */
 	mipi_csis_debugfs_init(csis);
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 9d946b68cf59d9f4fb3413fc90219efd380d9d95..b3b9e9dc8a95c76628d573824c12f9391fb7b4a0 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -727,18 +727,18 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
 						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
-		return -ENOTCONN;
+		return dev_err_probe(state->dev, -ENOTCONN,
+				     "failed to get remote endpoint fwnode\n");
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		return ret;
+		return dev_err_probe(state->dev, ret,
+				     "failed parse endpoint fwnode\n");
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
-		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
-			dev_err(state->dev,
-				"data lanes reordering is not supported");
-			return -EINVAL;
-		}
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
+			return dev_err_probe(state->dev, -EINVAL,
+					     "data lanes reordering is not supported");
 	}
 
 	state->bus = vep.bus.mipi_csi2;
@@ -750,15 +750,22 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
 					      struct v4l2_async_connection);
 	if (IS_ERR(asd))
-		return PTR_ERR(asd);
+		return dev_err_probe(state->dev, PTR_ERR(asd),
+				     "failed add fwnode to notifier\n");
 
 	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
 
 	ret = v4l2_async_nf_register(&state->notifier);
 	if (ret)
-		return ret;
+		return dev_err_probe(state->dev, ret,
+				     "failed to register notifier\n");
 
-	return v4l2_async_register_subdev(&state->sd);
+	ret = v4l2_async_register_subdev(&state->sd);
+	if (ret)
+		return dev_err_probe(state->dev, ret,
+				     "failed to register subdev\n");
+
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------

-- 
2.34.1


