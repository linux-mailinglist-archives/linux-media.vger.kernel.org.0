Return-Path: <linux-media+bounces-60316-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGt2ObjH+GlQ0gIAu9opvQ
	(envelope-from <linux-media+bounces-60316-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:22:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC064C14BC
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 18:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F3843028ECB
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 16:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829E73E3155;
	Mon,  4 May 2026 16:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OKgF/CA3"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BD61DA62E;
	Mon,  4 May 2026 16:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777911723; cv=fail; b=HT7gVWST49ebbuMEIgjc21z6FjbzG39Y2ZrPfgfY0wPjohmQwP/FxGo0GcxMN/oG3PMmz+BoWiIAz/40r4ewcSANGPHR4URqbBoFAot8ZrRIGxJENI/ym7u721NZfLsNvJuj46Rg6Oq6piZBNxrt7OjompNbpFH4uIy1dbd1Isc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777911723; c=relaxed/simple;
	bh=Keurgo9+jUuxivhaVM9URj40hPha6RYu0NPJD5hZQTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j/2C6OQdLyZ9fLVm8piZVy4QMDFDHZaaeBbHM6p70XMKJA+70mo9SDCmhN7ZdBUybedjNZZElzlkSbmRBRwONxVhHrd/rgAcldKfoxeZRVSe/XADFj6q2beokPOBA03po6kiZmG0irfmDEj2EZeKNOFPMn94nBc405mOJw3RJ00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OKgF/CA3; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAp200Ksre9QMhv6VsZpRo/UtmS+AxBmPl4LIfKG0T4o3mLfxhEeUyFYdldAtGC8ZKdoSbg4P0RtW9Rvxny6cYW9MEQQr4v+hzbgpxSrBnkIsBMPEnXF1LsIbrEs4eNve2jNrHGWbBmQUgB6y7TFoyQTjQdSr75LLJrNwbujFWtCuD422VUlhbf6xbBPNjW/iC0SJAwLI/OkqXtWauVqf8E/mOkJDVDNGHZZBJxKdHmfYrX2tzY7lsOelPkzwDiXsNf71XVXNTIEiQQDK/EVqHX+tPrmA5bLmYbVg0lqQQEdvSla9reqaETD2sFmsxj3qopTFaWIhDEXTi/Vf57Srg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBQBzRLaJBHS+BpazzoTNjXunhEtTbeF5sq/2idu8k0=;
 b=IFcxhvgw3L3XOKjt3b/f2sRXT0KUD1JXhO2C3jbWFVWeGSExMmRVU80R+9c9uI/uf9hkbSAR2EOu11GGjJsnFWmG77kcgOGqx0HsjN1scvn9wSPude3phKTEhexILn45P2GmblErRh+xcmPM64KUwMK+A7nJzO4gsObpjKTQjIk5EC0jDDjEhEw2SF5+EKSqCbrZ28CGJhuNEsX5TLfTYYR5iWjqtz2xgjQU6xDECax3uCwQpISo1xcBUCSOtr6rbDFy6in5BkAu1+jZNRO8q7s/yy3WoQBohlKSt6ud564cJNAenDMF4FvOa1qeYJtQckDElKksyLIDAu8d3TOb1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBQBzRLaJBHS+BpazzoTNjXunhEtTbeF5sq/2idu8k0=;
 b=OKgF/CA3CxxUeQ2ZdmCkwsOR9tUrE+ZKvpTsT507tSuJ86EfpBi0aMvqApdh1KNNhFRzPZwED9xB7zVMqWn6vNHJjT8CmqqgZM9n3FkXL/7JTFLltVNwpW3i1p7S5ixHGCUK6rMOk8VuWn5HnidN1jsqhBkD4f60MC8hFrHVElZZMxltfcIVLvK+xB8prEEF8g4WhOZM9nGQHfcKVxeJYlHg8HFx3wdRkW0bteRLswoMWGFXpU5Qt6phOtZkrS9C2UwKKOQ4q64QPKqSydl1EI7066daEfdDmTSn9LpaYZ4Ro4Tsk4foVc0z5Tiu3S9Ut1Nr250z9Xd6O6mG3hPxsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7381.eurprd04.prod.outlook.com (2603:10a6:10:1a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 16:21:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 16:21:58 +0000
Date: Mon, 4 May 2026 12:21:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
	s.riedmueller@phytec.de, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] media: imx8-isi: fix resource leaks in probe error
 paths and remove
Message-ID: <afjHnSEYm4t0rko8@lizhi-Precision-Tower-5810>
References: <20260424231926.406079-1-xiaolei.wang@windriver.com>
 <20260424231926.406079-4-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424231926.406079-4-xiaolei.wang@windriver.com>
X-ClientProxiedBy: SN6PR16CA0038.namprd16.prod.outlook.com
 (2603:10b6:805:ca::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 43220419-2fc5-418d-0250-08dea9f94382
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|7416014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 hd3a0Vsu1szdXSIFgQNbtKaQHNjVSe9tYZfpRZGCCXv1MMY/COVqkktQefevvFR9C1FOEMiBShvFkAmhFiwNsvWA7/9PYciW1D9W282MWfsgfd9Bw25xs07CXAvW+Xg8aoAP1X3wtifq3Hgi/HsDA69k6dWDB6393BmAPyjgZlEUggXgCSPIQcbBPvP07w5ImBuHuhYh6fBKZHxpDc9kteUHHzBLLyOvc3LpNpS7gqLEmS8AanFRd5gS7CWDPIX7wiESgbCLP6m7iAPpCQAbeadL9hYOAkI2aQE1eUvlWmsJhnCsrcwjkNTuYsQGZNSSVrYPWTa/NR0HJ7/8OFWlQYiLMYndzA9fM8uSv398jZkAKnoyWasOuXxVdRCm8ckV/RA0ZeTC+nmUVVeihD+Cpja9XDuJy7D5QvRoSW3nSH64qixk6b6RT4Pu1EsTGvKMFRzNLP2ZPC19FjJiC0IC8h3tMXz+Uzls/09F2leMHRE7owpYb3HLkn1/R+0g/LmcvuAxRLaMq3MgzaGqrSBlabSdDBnZFxUmJGPqMpA/cOxcaDLniwMvC/dU+IkD2zyT6hY5aSV290GjC469MAHAxAxB8oTSlkG07ojwK14PFLhMCjbmVmVtAiDGfiYP4hDULNIYf/hWr0Ee66Q5GW6qxQMwtiY/dhfrPlenmxqfyac9gRgxx9gY5E+GDNDgwngqeFXNv6ftS1ZorCVrcoBw8y81zXOwCGR95n2m/6YRBIfTkEvBvwtUTc9cpxaTYlY8
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(7416014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WWt4VUNRRnBXZDlhMVlFWGVLWURzZk95dHRUWk5yckV2OWt2Ykd4RkdWNXlL?=
 =?utf-8?B?MjdjMXdVazBicnZkUjArcWFNUzlmWFhqdGNxZ2xVV1V1RFRLVUJQMFNXZzc3?=
 =?utf-8?B?blBHYWkzQmFWVGtid2NqcnZsamVWQ085TE1mYmFMbk14YkEwM2RVNFIwbEV1?=
 =?utf-8?B?aWxCVXdtUGYyR1V2ck9HdW9EcVJJMVRCMlR2eTA3VVZLZmp2dHlFbzAyQ0dr?=
 =?utf-8?B?c3JGZnRoYWg5ZERKbStOdUl5SUdmWmlDeTlYcE1USXBrZ01HT2VXMExaWTh0?=
 =?utf-8?B?RU1UeE82cHk3TGhjajg4L1NFdG15N25ieTcwVHFUNXhpVzI3RHNJZkxZWWNm?=
 =?utf-8?B?aDBwM0k3cWNjejVyVWtWUnJuNlI3aEdkRlZ5cml5NjB0UWwvVk85blNkQlZO?=
 =?utf-8?B?U1BzZGVLZU4vclBQaWlpbHN2SytVK1VzMUtzSHlGSE1kSjg2S2E1MmNyb2hn?=
 =?utf-8?B?a1hmZDB3T0l4WUdaYTNxemJNc3dxMVBEcWF4VURselZMQnRmMWpRUTdUU1ho?=
 =?utf-8?B?SnJIb0FzU2psSmlneTYzNEtydUNMZjVBOWJOQjZoM0hYc2lhbHlXZFNtdkZX?=
 =?utf-8?B?YUNta285WUIyOE8wOVFQT2J6RWxqcFBIamxyWHArYjRyVkpZMk8vMTNuQ0J0?=
 =?utf-8?B?MGlORjlmL2ZINkg1MWZJQVR0b3pFbG5mNVpPa09Fa3JGRC9zNzZIWjc4K2hy?=
 =?utf-8?B?eFpseTdZTy84OE5oVXFlQmpRcmNEeWRaeTVsRERDZWVKZ1lFVTBvcG1aWU9k?=
 =?utf-8?B?WjFCUnpnWU5mZTJNaGs3RlB0bk9wSGtNcXI4djk3VTByNWpCSlByK043ajFX?=
 =?utf-8?B?N3RENFpyNVlJTk5CcHIzbXo2dWhHU09VZndrbG9tT29XUDdrcXp1WUJnVlJZ?=
 =?utf-8?B?MVNNTG4wSUdrbTQrclViMzdRRnNocklHSXdQVnhTbWpscEdSSHFNNnZlZ2Jp?=
 =?utf-8?B?aXVWMEcrY2VwT0d4VldiMmt4MHVIcnF1YzVKakQ0cVJqMENiWHRac1NaY0tt?=
 =?utf-8?B?eWVoMjR5RnJTSWE2WElYSHVkMXBIU3NUSCtERFF2YjlPQVBwMC9QUkFpVnd6?=
 =?utf-8?B?ek0wWDhheDZnK3IxOXVSNEZPclVoaHYvZmxSeUpUREFjeCtRNmQvOVArdndV?=
 =?utf-8?B?UEdraXJ3MElUZVhpZDUvTVhlVVFlZUpGaFFtSkhGNGc2UU45RVBFL21XZWpW?=
 =?utf-8?B?T3B5RzNqNnlranUreEZTdVZxVS9DZ25rMkMzSVIyZkUrSG53OStISy9OUXJx?=
 =?utf-8?B?NUxhWHdmbVRRTEVpNC9RR2I3Ynd1T0lFUE1md0hxZ1JTMEwyMXdXUStwbk5j?=
 =?utf-8?B?Ny9BL2xGeDVSc2ZiM3ZOV01yNmZvMXBHTDAxY0NWUXB3UVBySFlwZVc4K2NT?=
 =?utf-8?B?MENaWUNWeGZ1OUNyTFJvcmZnZE5mbUp4REZoRFNyb08wVFlFUm15SnE1Ulg2?=
 =?utf-8?B?aHRKVWtVN0x2YWNRT2xDUUdsT2hSZWFNZGlDS0NNQ3hYTmNpYno1dXZkM0hv?=
 =?utf-8?B?akJCVWJacVh6d3NyZlJZTEV0SWRsMHNZd3BjSEE0VDFSVkJKd1NzdVVJN25p?=
 =?utf-8?B?d1lGdEY2RkFzSnp3VEZwQ2wwNDRRK3c2OUhCMmpzTmErUmtrM2FVeHBkSE1s?=
 =?utf-8?B?U2xYekxONElVS0dRYWdudnAxTzlIeVhWVVlCZ21PSGt1eDJlTENtMWpDMnJW?=
 =?utf-8?B?YzNKUlZoUys5SXNFdlp1Y1BDQUdYUThUbVJXem5wNi9JRnpxU2Y1bGNnV21v?=
 =?utf-8?B?ODc5eVBHQWZMYTFmZGZEVDFQNHhtN2JBbnNHdGVIL1VLNFlhYnI4RFF5b2Qv?=
 =?utf-8?B?aXB0ek9Ha1FFOFJPVHpKa3E4VDZLVC9YRXdPMEJmQXRYWTJNanphK1J0REQx?=
 =?utf-8?B?c0QvN3Q1ZW1rNldSSmxjajJCUHRIMTZyUXByQ1ZLSENXeWNVZ2VDK0FHQmFZ?=
 =?utf-8?B?empXUFBRVUNBTXA4UDZtbVRYRTNwN3VBTXhyYzUrTGF3SWRYVmRaTWlpMitj?=
 =?utf-8?B?SWhkMEJNTnhKSnFiOFNGdTVRR2ZJeVlucUMwY0d4RzA4Z0M4MnNGV09NWmph?=
 =?utf-8?B?NmFhYXVweVBYR3U3MXEyUC9GZ2lXUERNZjRwUysxQnYwdTlmZmhQRU9mbTZ5?=
 =?utf-8?B?eEJqNlBjY0c3V2tPVFllcmx4Y1YrL1A1Ulo5a1NvNGNxcHBEdWJERHlKRTJa?=
 =?utf-8?B?ZlBjdVcydFBpT09zMHpuc1M3L05LRmJYS3lKMmpmZWFQblZOWFZtQnVCS0pH?=
 =?utf-8?B?Szdudm9naEtMazNkSC9IbTBOWi95NmdUMmIrUUlxUy9yV3Z1cEtIN0VVUndm?=
 =?utf-8?Q?UgiaQTuTkfAmIf8x7l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43220419-2fc5-418d-0250-08dea9f94382
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 16:21:58.0429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Z093VK35k6jtyBACD8cDi/Xw0CDnEQEBzsK3oEwmkDy1pIeqKZm7Vr/PCi5sSqkF50rX+/PW93OEH8qgAsc/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7381
X-Rspamd-Queue-Id: 4EC064C14BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60316-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,nxp.com,jmondi.org,phytec.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:email,nxp.com:dkim]

On Sat, Apr 25, 2026 at 07:19:26AM +0800, Xiaolei Wang wrote:
> mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
> frees it on any probe failure path or in mxc_isi_remove(), leaking
> the allocation on every failed probe and every normal unbind.
>
> Additionally, when mxc_isi_pipe_init() fails partway through the
> channel loop or when mxc_isi_v4l2_init() fails, the already
> initialized pipes are not cleaned up — their media entities and
> mutexes are leaked.

Although it simple change, it is two problems, suggest use two patches to
fix it.

Frank
>
> Fix the pipes memory leak by switching from kzalloc_objs() to
> devm_kcalloc(), which ties the allocation lifetime to the device
> and eliminates the need for explicit kfree() in all error paths
> and in mxc_isi_remove().
>
> Fix the pipe init leak by cleaning up already-initialized pipes
> in the err_xbar error path.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 2d639b789910..8533a979d60a 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -485,7 +485,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
>
>  	isi->pdata = of_device_get_match_data(dev);
>
> -	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
> +	isi->pipes = devm_kcalloc(dev, isi->pdata->num_channels,
> +				  sizeof(*isi->pipes), GFP_KERNEL);
>  	if (!isi->pipes)
>  		return -ENOMEM;
>
> @@ -538,6 +539,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	return 0;
>
>  err_xbar:
> +	while (i--)
> +		mxc_isi_pipe_cleanup(&isi->pipes[i]);
>  	mxc_isi_crossbar_cleanup(&isi->crossbar);
>
>  	return ret;
> --
> 2.43.0
>

