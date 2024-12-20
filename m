Return-Path: <linux-media+bounces-23875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 382729F924A
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AFC618979C3
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178932156E1;
	Fri, 20 Dec 2024 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cUJ4Ninj"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93997215198;
	Fri, 20 Dec 2024 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698169; cv=fail; b=PGbYoHH/5GeBf09O1WvJPbVPkCSjdWD+0P3gcVOPdNst9tDXOsaOz+bx12eUT5KaXu5J2cYl5wNHFc/cGv1MAo+3HQy0ThYrK2likviWLpG2Qp9LF73dpUrWmeQurnLA1kiKkm4q4U+5F1jT7EYM/wkinE6bD9i/8U0rOqQiluI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698169; c=relaxed/simple;
	bh=fgmnUM5+DfxZ2551PiU1M1gvecssHhkodQh/F4aJlnc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fkfh24rxJ4VUbvzAc2k1VHOE198ckA7cgLRuV4+RIzPCxjT64zEHTW2pvjbtky+PcrIUIkJ8n2oRXz7qz/9f9UmkI0EGwBD2CXXw1kU/x2oQccMWly9pMGRnf3hiwx3c8V1VQIDodoKa+xzj0JDkb0KMGeF6f+Rcs71yonBHVjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cUJ4Ninj; arc=fail smtp.client-ip=40.107.247.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vg6DWu/ypJvlIDUeUhen4UfrlAr7sKgt9TBovUuaaHiBSccznSSBFNKB0SlqTNcsjyaT1SoY6aJ2Av6GGIQjDc0GX0Dm4K8fVqklFh9NozFPggGugCmiJPNm3BOjG9XwiOrxzdniIIrxPs4ADoP1vvgifdNdduBueqKZtK5sQ+lEIelYpQyOeDXCjYV6cVYXNI1jQZthAPxB7nQ3uKJJ+KAdFYT0FvcVgXyW4fLN9WVx6LF4/n28uMoz5d1XoPI7xb66HVdcuZeVQ4LPbERSIWwVYdgh8KkYIzqEcdxqkFsZqFB4rTHQnnCA5HQgjbpUouWLbdUPOvWjXHEPFXOdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQIpKB7yu3QVnJOnzy0O5IgwDdSSdcNr6tiwZ67nQpA=;
 b=N2wuYSbaEwdNNn/I4uWmaR7l/jtSLP/IdDmyi8zhT4RppbT94gte1pk+b+VSiEJHMW8TnQldlgjHS8kS6ZSWW4bHQQzvt6qtNDxJmn2uC0ZnHUz0sU8GNDKfW7xzYdICpGK7ckRoyIwWsuAxwSBerKPzilaGoFLr79zxTxomoxbCJi37sbMZoDm5HIYVg3UDq2HHJHoQUjkWh6UTWk3c2qWT4trR+h2YEpLKjg5X4OlZHa3NOtWmKwk2arlgDXFurOhHd8ysqMScXXA8HsQ4ydzIsua2W/+RoKbq+j+Y/eWDK6aWi47MUYK0Wex8V+i2In9HKSk6BoEtQOOqWYjzqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQIpKB7yu3QVnJOnzy0O5IgwDdSSdcNr6tiwZ67nQpA=;
 b=cUJ4Ninjx1T06C7mxIRqXCuggllzMgPEBWXVZxXk5HI3b38cSJDEi3XRFI2TGYBmTe6bnyg53gx8iZNcV/9MxKYhMwi+l6WEeeM9XfpmADmP7bA3He9QIv6jPEntjweqV29keHySZEhsXRQMLrhP++hiuuUw81q2ATjnVWgTmvc/kqFRMu9ftDZ5BMPiGelOATtnTY9UEBpxDbUF6mb0Dl8bse8Htk6JwLBN+ycHqFFWrnynajUIdtU7N5vjWL1YcrBQPATiUFgwoRYmEjXuCUs/YAcO8gliEdJTX6jtqje/+hGyJRJr97iFb7BpRSSrCW2G6e5tkpUiWRMiDTkMBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by GVXPR04MB10047.eurprd04.prod.outlook.com (2603:10a6:150:117::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 12:36:04 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 12:36:03 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 1/3] staging: media: max96712: fix typo
Date: Fri, 20 Dec 2024 14:35:48 +0200
Message-Id: <20241220123551.696330-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220123551.696330-1-laurentiu.palcu@oss.nxp.com>
References: <20241220123551.696330-1-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::25) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|GVXPR04MB10047:EE_
X-MS-Office365-Filtering-Correlation-Id: a246cd42-adb6-429a-efe3-08dd20f2de2b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3NSUG40aHhZVlkvWmZ1MlFtL2RPZmdpL1doYTVqL21ZaE9aYlk2NVI0UVhJ?=
 =?utf-8?B?bHhKME9CZkpncE84VUVOT2FabVRuZThtVG1zZjJETTlabXJVYkJibGpLUXpT?=
 =?utf-8?B?SmlYdmZzbE9BcEVaTzBPRE5ueGFRTGd1ZVNJeEhDQ25GaGExdXZya2tNUmJu?=
 =?utf-8?B?dkFnMW5GeFdoU05mR1FEU1NOc3ZVQ3EvKzQrVmdNVU1VVWZrVCswSEJWTm1i?=
 =?utf-8?B?bndST1hTK21tUHJSTkFkVHEvaDRMZXI4SmM1b3VnMDBTZDFYT0h0YUxiRmU1?=
 =?utf-8?B?RlYxUXlFdWhoZlNNdU9LVXE1N05CVW13T3ArR0MvV1JQRFFvNGx0VXJ2c3Br?=
 =?utf-8?B?OS9ZeTlHT041WGp2RzBQanBGa2h5c1dYV3h5Zmd5aHJpcW4zbk1Qam9sNUlk?=
 =?utf-8?B?OEt5Sm94NURiYUR0Q0drcjVNc3piUVpIT1I2UjR4VlVIU3lIQUNVZ2dobXNo?=
 =?utf-8?B?ZXl1TllnZnMvL0xQdThkYmtZUTZqb3B3UEhkQzI5bHdkMWI2VGhOM2Y3UWlU?=
 =?utf-8?B?ejl4aEdGREZuWTlQbk4rNUV6dzErd0dtL0hxTkN3MnR0N3Z3V1o0NnJvZ2NM?=
 =?utf-8?B?dk5ESUp2eDU3SlY0ZWRiQTVTVmRRUTE0M1h5dEhDTFB2V2t3MUZaVWsyNE1Y?=
 =?utf-8?B?VFlobCtuZjFScm5HZ0NBRXdEd0lKclBxNWFDQkVkbEp3cHZ5TmlqN3cxR056?=
 =?utf-8?B?T2FqQnYySmd0dFo1d1Raa0VLRWFCU3FjV3hIL1RDZFM4Um50TkdZOWN3SWdO?=
 =?utf-8?B?UlhkczZ0c1lwbStIOFVRK1ZqTmZ1L0I0ckd1TzVPTEJnc1dkTEYvZHJjSURJ?=
 =?utf-8?B?ak1KQ0g2cE1PemhBMjVSUnRIREtEckt5cnUralRWbXg5WUk3blBTZHpoR3Q1?=
 =?utf-8?B?Umt1azk4MUtRSjl6eko5bElnWWkraDRyb2NjWWJnb0ZXdmcrbE9rRmk0Z3Rj?=
 =?utf-8?B?bXloa1NEVERYK0Q3TmhaaW1Qc0grNUJaT0lHdUFLV3U3SXI2RS9uTkFRa1NB?=
 =?utf-8?B?Z0tFWVBiZFZiZlRqbGgyVldVQ205c0I3TXF6clJTdVREemlsMlNWNExTRmhL?=
 =?utf-8?B?d1NFeWQ3L0doUmFMUm8zejlQNDVLV0xqcFZRbGZ2QnRVbEgxMDNVM0htMHRZ?=
 =?utf-8?B?ZTlGZjdGTHhpVGhqOTNERGx6d1FpQUxqbEtRNlp1Qm1FUFhNNFN1RXJidDJz?=
 =?utf-8?B?QTg4Ni9SUzJCcVFvcnYvSlF6czliV1RkcUNFK1dYUktmaHdOZDFIcFd6Uk9Z?=
 =?utf-8?B?M1dRUllOZUhldDBHMXUyaFNGeG1NcVBQcWprNThjeW5aVk9HL2FYYmpDK2Ru?=
 =?utf-8?B?dmI5eElENDdIWm9ZbFBlUy92ZmhtQ1ljTHAyTFhuYmE2YkJFSjRmNmNTRHQr?=
 =?utf-8?B?bWJGWi9ValRsYW1CRStMTmZVUnh6cG4wei9kRzRMdjF5aXV0RDk5K0hLM3VC?=
 =?utf-8?B?VjlERTNFNDhiejVoclIvcXZZeXVCTS9BQitHQk1JZ0x5cFM1VnlCMTdSNG5O?=
 =?utf-8?B?b3dxUUxWT0ZBMGgxck03QWxwZXNXQ00wdnJ5SkkrcG1jYnhxTFBXdnBSaHpM?=
 =?utf-8?B?T0lMVzdBdlowbHlnMVdzL0U2QnF0WDd5c0dNbmdZSVA5L25XWVE5UldGc3NV?=
 =?utf-8?B?bjl5V3M1VHNlcVNkOU8ySzJyN283bmovRnJmUGowVjYyRGMwWllJREVZdVdB?=
 =?utf-8?B?QkxYbTFYd3MzWklvbnNzcXVMS1BWY2pDZXdPUlNOMTRUanR0cXZoMHM2S2cw?=
 =?utf-8?B?OU5Uc3dSb212RGNpZnR0VWJDOGxYT1Rrd1R2Q0xDQ1MzaG9SVldhSlB0ejFo?=
 =?utf-8?B?b3BvSm5SdEE3dG8vcGpoNGE3TS96SWZNU1NuNlBQWDRxUXpZMTZWd21UYVNO?=
 =?utf-8?Q?YAZ748KXB4W8j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UURnVkhGZ0FZTTNlVzBMK1g5N0FxTWJLOTRyM0lsMVRwbmtRVFA4bUpuempp?=
 =?utf-8?B?R0luaVIrejdyQWNrcStFWG11OUFTRzdXcVhYQWZqUmlMdlZocFU2VUJPSnlU?=
 =?utf-8?B?dmN5L1UzUGlQZ2NYajY5UmJNdG9kMzQwd2dSLzZNMEh3dU9LVTRETTdERmsr?=
 =?utf-8?B?emdQM3daNFBRRS9lbzczenhEMTE0WTRTLzY3K1QrRDdneVpRSlJPUkFTS3Rj?=
 =?utf-8?B?UFk1L2NpZUpjS2tOblNES3BCVkNNRURzUU5GeC9xTEtjKzFianJ2WThRVlhs?=
 =?utf-8?B?em01NTRPaC9FaUVJTnlpQ1Q3Q3FpTUtYZFZ1OVZ3dWFLL1lweE1PV0ZyMWlm?=
 =?utf-8?B?clZ3amhsT0VWNWF4NWw4VGRoeUpGaFFTUzVoWmdReVRlaUhXZzd6MHp3UUd6?=
 =?utf-8?B?S0huUnR5a3d4Vm5WL1pKcGtwZ3liRkRsaXdRNm1rd0diUFB0R3ozN0ZSeUQx?=
 =?utf-8?B?RzdUSDJjWENtYUNFQTVDcGRlVEZuTnZHSnIvMHFnb1NQOTZGQmx2eDZ5Slho?=
 =?utf-8?B?SUlCdVBraVF5cGZTRUdKeFpORnZHdFR2ZVlObFVMekNYOUg0S1ovSWg4UEtD?=
 =?utf-8?B?YURESjJZRHltS045c29aZVdkNDltZGlsRHgwRTkxV3hMN3pURzV3SWpEcE9S?=
 =?utf-8?B?dmZ3N1h4ajdRelBrMFdrdUY2N2NxYi82NkZRcXVIYUNvUHhVT2IrWXBmdVZ2?=
 =?utf-8?B?YUFpQ0wzSEx2czdpSHVTcmtWYXdrakVNMTJxY1JxRkpnTWtRVnRTVzlwUHdE?=
 =?utf-8?B?UFRqVUN1N2Z5VEtQU3QvMW4zMEhzOWE5V21GWmJPRlVQUkhvckU2YXFtblEw?=
 =?utf-8?B?MGpmQytYdTFXYTZuM3A5ajlYQUc2RUdTWFhobnhVdGM5MUg2b0tBOVhKdWlC?=
 =?utf-8?B?Y3o3amZrRFZaQWVrQlQwZ21scnB3ZlpJOUVtTGJHeStFRmVpV3ljTE92ZUFv?=
 =?utf-8?B?SWZXZVBJb2FlSDlTYUpyOWVLcXNvT1U0VGR4TTJqS3owRGRrMGZxcnVMbWRa?=
 =?utf-8?B?QWRYOGd6VGpMazFYbC9Hdmh5ZElaWnBRdG5keFMrSzVIK2pSQzJ6OHFUZW9I?=
 =?utf-8?B?M1pVU0ZOSkFlM2V3RHR6T0QzazB0UGJzcS8yUnpYYnpzZ2JndTMyZnJBclBn?=
 =?utf-8?B?SWR1OFFlTlQzcFRsLzlOc2JJRlJTWjVHUU1SaTMvcCtZRVFCd3FrQWZlTmY2?=
 =?utf-8?B?OVU2dGQrc0pBUEtpSkNUR2YxdmFtSXVLaFI2V2oweXQwQWlXZ3RNZGhoT2RN?=
 =?utf-8?B?Nzk5M2wwU2R3Q2Q5bjdEQVF4NUNRb1RHVSthL3YvQXhxNnpKZklpRTF4enpu?=
 =?utf-8?B?a3NETS85M204dS9udkJiVUdkRUtZTE9hVVNCdWhJSm54aGRyTEJFRDUxMThY?=
 =?utf-8?B?eGtQcnlGZFE5WWRNR2RTcW1aUXZpQVV2L1NwZzJMdTlNYkRnUGNHYTQ5Uzd6?=
 =?utf-8?B?TW5waERmbFdvQnJOTFVBeFdDSmpEWWZBaUI3VE9KaGpEL0NNdzJ0SHVXN0Fy?=
 =?utf-8?B?TGFETGozOUVXTUVCaWpCWlJ4QVJoamM0NVZZa3dFeTBsUmlheVNrbEh6djNE?=
 =?utf-8?B?K3lNYk1ScGRCV09NdTNWMkxraE5OdERkV3Q2ZE5uRVZEd1dTRVlDTC9keXBq?=
 =?utf-8?B?N21SanNXQ2F0R2NHREQrZDhUOEVzcFNMMGgrWVZBK1E2YlkwRnlqVG9CaWVV?=
 =?utf-8?B?NjY0YmQrdUlKWXJMbmxnZzJqZ2JHK1ZYeWVmeHhVd05ZL2JtbmEwemt1ODR1?=
 =?utf-8?B?N2I5R2NLMVJFZmhvdmFtQWtKczRlK1BlallKclJ5Y0tqaU9Ya0NXYyttZEJj?=
 =?utf-8?B?bWxob0JQVzU3aTltN2dvTVhycWJ0bE1ya0EyZHRIWSttVytXRzNFYStMWGtv?=
 =?utf-8?B?c3p5NHhRbWQ1cmR2em1qdmlhZEZGaHR1c3k0am1WVk16ZkJpQU5KTjlQWVRF?=
 =?utf-8?B?cDFFR2hSZ3pEaE1BOTRBc1VEaGttaFFQU0c4eGU3LzRJckp1YitqOGFOYm90?=
 =?utf-8?B?Wmg3MU1Wb2YrTUNKZklua0hvcjNnRDhLcVM4Rys1SGFzbVhjV2tUT1VDcEtK?=
 =?utf-8?B?SmFvTk82aC92YlNXSXVBVFk0cDV4ZXNzVE5yK3hoT0FYU0cybFcyUG1TOHhV?=
 =?utf-8?B?azlRamkzOWlpSy9vck9zZXp4ejg5Wk1oM2djVjhJMXlWZnk2QnczSHplSTYx?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a246cd42-adb6-429a-efe3-08dd20f2de2b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:36:03.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+kaJxoFyXNnyxsZSyz71oAWWlQ4Lo0GK1YAgKuNwOPE+khLysPvnJ4iSwh+VUayCATMRPv4vh/DwuStYOzexA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10047

Fix a typo in VS_LOW expression.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/staging/media/max96712/max96712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 0751b2e048958..5228f9ec60859 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -182,7 +182,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	max96712_write_bulk_value(priv, 0x1052, 0, 3);
 	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
 	max96712_write_bulk_value(priv, 0x1058,
-				  (v_active + v_fp + + v_bp) * h_tot, 3);
+				  (v_active + v_fp + v_bp) * h_tot, 3);
 	max96712_write_bulk_value(priv, 0x105b, 0, 3);
 	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
 	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
-- 
2.34.1


