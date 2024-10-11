Return-Path: <linux-media+bounces-19414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E3C99A11B
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 12:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 819341C21259
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 10:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671A1210C10;
	Fri, 11 Oct 2024 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jlrKm41I"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2076.outbound.protection.outlook.com [40.107.103.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EA820B20E;
	Fri, 11 Oct 2024 10:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641836; cv=fail; b=ty8D4PKt6GRzV25eGOjcLWG5mU/AHO1aMrnLO6C2WJwyFgcAZYFJcFTfYObvR6DKJK6oo/yPc+XDfyV6bGOD5zq9Fzi1LWXJD2rYoYEx/+tSmb3TNEZZwaDxgZNfZbRwW34xFhnRaXUEtfASpz3guxHekTHbpVb2obcJgAILeqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641836; c=relaxed/simple;
	bh=oN5mFu9o8KpzLDabdrO3gph7t+OKJP/d5E0tZaBBu18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MwMT4Tt+D31ICHbIndBU3a9g+i6Ag116oPk9fNBgW4cR1SbqMpZ906Q0ay8Rugp0FG35zh7ye/Cs6y7JATuIZmgMNKN/jKcCkb7Vd2B0X9vTUpIwhhv/v1vsn6rMARza+85LiIS2xDpr6neBnzOZuybTgT6/U/dP97Dac0he6uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jlrKm41I; arc=fail smtp.client-ip=40.107.103.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3wNbi9Rn3fuW0SPgvmd8yz2al3HM54IsQB44SST+a2p7S8ZqFhUzwmkIA08V+6XjoyfYMQzsn3SvxUyyEmbcSoDEL8Njplok/8/YH4JYjvC1y/69xUkmrzN4DONb9iYh5ZNIYDXw6OuXQibGwJorr/Lrj7I3+vcA45iVSLnLApd6WwdjLeb0ncPsyJtMjKMw5rPIl00IJIsYh4YSWnzLSUh5HzhFm866VghkM+R1T/RWaVfFsQT/xcRTLfrDo0aTlIBMDht1T5Qr4wIAG+bbR/XzFQEf0vYjNNIHgPSaMfh1J9dHCpY6JO3QqS+jsaV/IdVi78bMnSWp3maKYZI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3DD74N0aDT/Zn+7smF/wnfhSjcLvgLlw6FInG+HZQ0=;
 b=OPESD+vNJO/cPeMnkGx1gI/oUps/g1abMSWrs53bEeV0pZPH+HqbFxx2xGeComcHhT5s9wPZUqy/4qu3BQvOHvfBpQ/N3yJekvBpyfOwKKta3KTaFwTAJVpYsdb0GpkzA5ptqZItSkTaRX7k5uLY0nxy3ewPNz3UfMzcKW4pJqEgjCtxd8bI5bFCz8uyDNrpqLvmjrtiNpPf5TuzaB36kk767UoPnUE/CM5Ls7Z5BQmuTURI1OHCadV2QElDOLQG8Sbmafy+gDhKlI16WWugNfgTbIR/KUIgaGxHfDkVxxN8avVT73NnzT+LFKKojS25CCmPKqpaObY+fm8fvuWu5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3DD74N0aDT/Zn+7smF/wnfhSjcLvgLlw6FInG+HZQ0=;
 b=jlrKm41IBlXl47xDCpe/0vuOY9/PNiY17csxXoy/xWcYFv4zjHcOdH1w8czwCCyi7nTPaT3ti/ajF9Db56rrCqUu519xref7DjfDcHSXqcj6MHAeEwN8rJ0pgtCtx6BvUyVzOC2Q0QfLjS1CcowysGaJKAWnTwYx58FMDD+RnBu20S1G7b9J9XgsUk/KvaLQVNfMhLUXBu+q0jY08CFriW/mlPdQMSCDhS7vKdlyZ2xYDdo1MSq/jW2VNVaROXODC+6GloRp6/R0Vf5ESQnrFbISqVyArQa6Bj9lwC9amEzzK7TFh/EpWIDmRUl44lO5tlDPllzJt1DInasJZmCG+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB8852.eurprd04.prod.outlook.com (2603:10a6:20b:42f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 10:17:10 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 10:17:10 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo@jmondi.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.d,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: nxp: imx8-isi: Add i.MX8ULP support
Date: Fri, 11 Oct 2024 18:17:12 +0800
Message-Id: <20241011101711.704226-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011101711.704226-1-guoniu.zhou@oss.nxp.com>
References: <20241011101711.704226-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:4:54::34) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8ffece-4684-47a3-4ea6-08dce9ddddfb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WnREZ1Vqb2ZjRWhwVjR3NTIwVnBHTzMwODY4akhqNXNNVlQ2bFh3MHhPU0JG?=
 =?utf-8?B?aDY0UnB6Qy9pd3BlV3QwNDVCZUU5TE5OSTl5Mzd5ZllYRElQYzBYM0pxcG4v?=
 =?utf-8?B?NzBTV0hkZDVMcFMzd0xNTm5pSmZCMEFubm9hNFpaNExwNzNSNXpDUzE3eGF0?=
 =?utf-8?B?MzZKUGI0ZGdyY3pOZUx4SlRlVEUzMDRVRXlXUisvRUxNVTBCUDd2NEYybzJW?=
 =?utf-8?B?YUFDQmQzOWFYOWtoaGd4K2FoYUl6K0p2RU9qazlvbldGWks3WDRCUE9BYXho?=
 =?utf-8?B?QWo2UXpuUXhTS25iWHBCczNJRFZ0RkpyemhXc29EOEdXMERkeUsxZUlLelV0?=
 =?utf-8?B?MVRmODNVRUdKS1dzTUxjYm1acEpodm9sNGZqU3B1SDIwSFBvUUhtMEpLekRy?=
 =?utf-8?B?SWlMSTFUZy83MllKdHpYeFI3bDAzUW9JakxvZ2toMjJwWVhJQUZRaFpTZytI?=
 =?utf-8?B?Rkdrd2UzNmtlaU1xM1RveTRpb1V4TjhzZE5KVkIxcTdNNXM3VzJwNmRqTHZv?=
 =?utf-8?B?MXJINThoUHFqMGh1VWlkMFNCVXpjNDhyV1RhbWxxcGRURys3MzhFTWhRWnJV?=
 =?utf-8?B?cXQ1b2FXb08wVWhRaTJqNDcrU2NqWmVRUG1aWGxQaE9XS3JNd0w2RzY5WTA0?=
 =?utf-8?B?UUxKRms2YlQ4M1ZmdmtjeUZLYllGMVdnaFF3azMrMCt1WHJyelg2cDF5eDIy?=
 =?utf-8?B?UGF4bmhzb3JGNFpjN1V1cWI0N1hlOFF5ME1zTjNzVFhVdzdWZlIvK3ZKMjcw?=
 =?utf-8?B?K3BmWWIrMTNvQ2ZZLzZmbkFmdGVNemlLTnFXTGtsdTNZM254MGxkcU0wdSti?=
 =?utf-8?B?bVZ6L3BDU2tSRmNCTkgrMGh3U3lTU3BWZEVHcGRHY2lnaTh3Mks5U0J5SU55?=
 =?utf-8?B?UGVocW9RZmhhb200WXJ3Q3J1UE5jekcreTIyVmtNdEltVVdqM25IMk50eWRN?=
 =?utf-8?B?ZXJDTlkvdnhxSUEyV3J0Nk1aclpjbG1kS0F2ajc2Y1dWc3h1d0FMTFNScWlj?=
 =?utf-8?B?cXdoQTMxYmVkZnJKSGd0WCtaUnNOaXlmNVhyYkxlMDF2NGxTREFHQ3NKMnp5?=
 =?utf-8?B?ZC9iZzU4ZkhoZ1VXaWkxRHB6SmRJWFJ6WlZaOElmb3dSY21pOVpsQWM1UWVY?=
 =?utf-8?B?SjFFdFVLZWVWL3lBc2NHZSs0YkVRUGIxK3RndHNIenZXSzZlREdvUVZzOTBr?=
 =?utf-8?B?QjIrUXUzYUMxa3RBQ2RObngvSnQyeVY3OHZZMXBFaVZpa2k2dlAveFNHditR?=
 =?utf-8?B?ZHNBSzlaTWovUDRtQ3cweUhmNmlueXJXZEdOR0d5ZExLVi9sVUdEMlcvYmF3?=
 =?utf-8?B?QllxSm9td2dlTzg0ZXdoMWtpY2VMT01jcDZDN1lWL0RHbVhwUmJZSjBjL1lj?=
 =?utf-8?B?Z001QTZJdFhzQ2J5MkV5dmoyWUhiWkY4c251VkQ3WDM0SmVnaExXc2Zqd3lP?=
 =?utf-8?B?c3BhNWRocnYvZFFsc1hVdFloU0ZEdGpPUm1WTWdVMjVpRWI4NDcyL1loeGZi?=
 =?utf-8?B?Vkc2bUYvVGpaU0JlTHRRZE5kcERsS0p0U05pZ29JNUJhWTdGd2FqSWhmQm0y?=
 =?utf-8?B?UEwweVl0N0xLOHNOdFp4M0dyQ2hwQXpRYWVLcHFFbHRxVUVGY05rZ2hpU1Aw?=
 =?utf-8?B?T3ZvQ2FYb0d0Zk1GekdVSmJSOVBmZjdvcWg1U0ZWdVZyanFFajE3RU1jcTlx?=
 =?utf-8?B?dGF6bytTd29oWXhmSm9JeTlZRm9nb2p1SHJ1RUJ5ZnI1RGVQWGJucDlNRHlI?=
 =?utf-8?B?UTJaRCs4djdmM1QyUzY0ZVJxQXBiNzlhSDhBTkNTRDFyNXUycFduemlQRW5o?=
 =?utf-8?B?Vlo5TTY3QklZZ0hBS3h4UT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TEw0UTdtYjBQbzVvZW1LdTFndXVrRVVuZW5DaGxQTlFWdmk1QTZvcXlLZkRY?=
 =?utf-8?B?WVVzMFNONGR3Uk5OSjZvRWVqQ0ZkU3IyQTdkSi9lN3RFNGJCbll1SnF3RnJW?=
 =?utf-8?B?cVB4aU9TMThteDAvM2hQbmR0cFIzUE84dU5TblBVQ3duWTMxNkNjaEtjcS9k?=
 =?utf-8?B?OXhKUGRkL1R6WHRuWTRXVzl3eGs0N0MzQ2IzeHFJK29RMFVGdklUU1ltNFl0?=
 =?utf-8?B?ejdhUHpZaDZORlRRY280Nk5uWmQ5NmVpMTJuSWRaYWlUY0s0TVRabE1ta1Zw?=
 =?utf-8?B?bmd5ZjN6VGZxcjN6emNjQks4SFN4R0dFK3dZTWdDNDM5RUQvTW9Gbkp1Z2Na?=
 =?utf-8?B?QmNNYXNKS2RFTE5DVXZJN0NuWVFQMkE5MVJvN3ptRmtWQThscWRiQ0prQVY1?=
 =?utf-8?B?MjFrVHhNMysvM0JrTHphb3ZidWp5b1BDZW5ZeTRsUm1HZEM5aTFKemtLNDR5?=
 =?utf-8?B?a2d3TjdiUHhSemYzS0hIeGhZVytmRlZaYjZQM2xzd3FRbDR1MFptMjRBUysx?=
 =?utf-8?B?dTliWFk1Mkh5TTFSekkyb2tCVVVNczZBa0Nrc2VMSnZaMW82VU9PWTU3TGJk?=
 =?utf-8?B?OHpJdTVNWCt2ZkhVaXVyQ3ZTbU43SVJIaUw1UmNNakIvT1V0eU15KzZoUDR3?=
 =?utf-8?B?Rkt2ZlhSMFpPSTg4SmtsbVJaZEh6cEREYjh6ckc4RzM2NWlUYWtLbkIwdndI?=
 =?utf-8?B?KytMYVhicXJaaGdoSDdGTU5HQ255amNqa3k1dFZwdlhadVNxSXcvdFpyNTAw?=
 =?utf-8?B?TGEvNFdSVXVyYmhsSE1YUFh4aGdXTEtqcnY0dlR5UFJtRXZsRExUa2gvdTNG?=
 =?utf-8?B?YStyeTNiMW1wcC93UVQwNmtQMGRKZWIvN2h6Nkd2cnp2QkE1Mkl4YjBrckQr?=
 =?utf-8?B?SVNZTmlGaW5nWUplR1QvVmwreUxmMlBwSjZTcE43a0pOdkJYRWNvRXpMUXh2?=
 =?utf-8?B?cXFSS0lIWWp6RHVqOWpBMVh2WXN5WGFuTG92Z0tmZ3BaL1MrUHFVRmpNdWRV?=
 =?utf-8?B?RW1VdS9hS1laay9abThPcmxnSVFwTVBwZ0cvRWJmQW9XZ1N1UE9GY2xBTkhz?=
 =?utf-8?B?TStMSmFqUHp0TkhqNzNja0c1RWZ5azMxYWpJVnJ6a2VtMmxRZTRDQTQvQ0Ny?=
 =?utf-8?B?ZnJuNU1UWElBY0Q2Zyt3RzUzUmcrM3c0S2F1K2sxc0h5SHB2RGJIOGVnOUxU?=
 =?utf-8?B?QkxHWVVFblZPMEFram9leXVET1VXbTAxOG5aYVd2eGhIYnFPVmFWbURTZ1pi?=
 =?utf-8?B?YzRFWFVTR1pVSjgrVTdrR2hrTUFuWmFYczNrc0p2NG12SUJDMERhZjNWcjdh?=
 =?utf-8?B?SWJDRHlqYWk1Q3MrdE1VVk9xWFJIZjd1dFIzMVkxYWJseVRFSFFhTjVIb1Rk?=
 =?utf-8?B?YU9GR0RFeTg4OTVZL3kzLzB2QmhzMTB4d003SjVhVE9tOGNFUnNwWlZ6dno3?=
 =?utf-8?B?OEZ2VVo2SU1sZ1MrVitQUkZDL0MrR0pLK1U2MDBoMDB2azJUQlpQbEE2cnlV?=
 =?utf-8?B?VmJhYzZyWTNXVXRCejFRNUdiUG82cFdZdC8raVU2bWplSDhrQlp0MEMxYlJx?=
 =?utf-8?B?L0t0UjhkOXNSbnB0T0Q4Qi9ySTBrMktFa2UvYXQvdEFrT0xTTDVmcnVEUnU0?=
 =?utf-8?B?T2x4ZHd6cFZ0QkxDRzl2U3l6cnFwTDAyQ2F2UndOc1JuMnB0ZzRQRWE5ME16?=
 =?utf-8?B?ajRrK3hzbkFaaEtUeW1SQ1RxVGdLVENwT3lSQnpSeWxvSkdoK3pWRDhOUmdE?=
 =?utf-8?B?M0VoYWtFNUNtQ3JxY0N0bVI2OU5pd2NGK2ZsZTJ0V0ZTN3EyRkxXR2trWllL?=
 =?utf-8?B?bzQ4K3N3d3FPb3lhaTZmYkIvZEIvMjZIUEo1MUVwb2l2KzRTMkNuVmpPUi9K?=
 =?utf-8?B?emJaa2RHamUwY0loS2FVekRGd0VadjBFYWpDNVVRdXNIeXR0dFBKYWRsOVpM?=
 =?utf-8?B?dlZydmdITXE4Y2JRVmRHQmt2UHBHMkh3OEtNSExaSVVyWXNjcmgyR083Y2FG?=
 =?utf-8?B?YUtQSnhMNkViaEhMSDZZeGhYYzJZdHhqdW14OUdDRWNhNE04eHY2NzZ1bk9Z?=
 =?utf-8?B?b0NCVzczQlp6ZEVySU5JMC9TQXUrRDFtNUlRSzFBbU9wbERyWjdJbUtHdlZN?=
 =?utf-8?Q?Yulvnt1a5KIrUFCEkPjyH/cDZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8ffece-4684-47a3-4ea6-08dce9ddddfb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 10:17:10.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PmPVXLNMha71unFPIaPzzr1t58fvn1Yw61NRN5X5O6KGiJ0d+dWUjud3E05+YVxCi20Gh0H+SJjorGWhPnr1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8852

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add ISI support for i.MX8ULP.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c      | 18 ++++++++++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h      |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c2013995049c..f5d076d7f50b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -279,6 +279,10 @@ static const struct clk_bulk_data mxc_imx8mn_clks[] = {
 	{ .id = "apb" },
 };
 
+static const struct clk_bulk_data mxc_imx8ulp_clks[] = {
+	{ .id = "per" },
+};
+
 static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.model			= MXC_ISI_IMX8MN,
 	.num_ports		= 1,
@@ -307,6 +311,19 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
+static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
+	.model			= MXC_ISI_IMX8ULP,
+	.num_ports		= 1,
+	.num_channels		= 1,
+	.reg_offset		= 0x0,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8ulp_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8ulp_clks),
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.model			= MXC_ISI_IMX93,
 	.num_ports		= 1,
@@ -528,6 +545,7 @@ static void mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 2810ebe9b5f7..9c7fe9e5f941 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -158,6 +158,7 @@ struct mxc_gasket_ops {
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX8ULP,
 	MXC_ISI_IMX93,
 };
 
-- 
2.34.1


