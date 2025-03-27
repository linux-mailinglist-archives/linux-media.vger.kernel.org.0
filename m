Return-Path: <linux-media+bounces-28888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FAFA73F5A
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B5501896170
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 20:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BA11D618A;
	Thu, 27 Mar 2025 20:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nczhwZUN"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2086.outbound.protection.outlook.com [40.107.241.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A61C84B7;
	Thu, 27 Mar 2025 20:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743107686; cv=fail; b=tX7O18QC6++Fzhbwm91zUoI0PJalRjV7D4e9VsBldzUzeNijijgM1vXOP+6lJhgITGnI/IshOczDg5jVqSLiaSB6j7UZxzdWtsbqBjsPDjhyOl5qFqVWv2yJm3HKbZkJNJKlaU7XVzcNP/JEjK1LT6k5d6dNwD9d75UtgoMqZUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743107686; c=relaxed/simple;
	bh=FgKfQ4zcT1TS17jDHOKRQgicTBEhdLhGPWPFeLeP32o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=otZultkr0iCICPxLTG8dCEo3Hq7eYgByRxiWYvDi+BvTQbcx/bUnzelQLjf1Vos5fQjB9oVkkuCaeLJME38e+8S4Yn+L03xL2gPCAbMzf9Yv4Qf0O7tbE4bOJBAGc83gYyVN74wrd+CI9n1CkPgxaHsChVCzCX6TskcG9VvsgiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nczhwZUN; arc=fail smtp.client-ip=40.107.241.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4WHiBaReMnAZsrutBW9Khl3hPQrTIMu/Wfmg6b6qGI+bNwwsMO6YvG/EtGWUoMWUkCgLXcEEvriE2LUeuVzFV2kIjne5GbGX4qZ1HUQQRctgvadKCV36Pdqa7OZzeFLcMsW/+4JGYRGCwD7zuWSbQZL+arkAHQdSn+9pvtyryaRCp28gwGlAAOaIayBQo4C/HGV7PPjFM9dBvxiYEXxeAfI46jIM8o4ECvsHgdfKfrSux5zhZLeqsKVIh7BlEqOl+DypOAv8ub3MkWPFIQYuxcHRXoNEV37YUFBjpKhrLbKEMXf+FCTgCsop9iO/YMBh0gTHx40MFnFwBxNZrDtSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7e4dqky0AuSmxMqVM2ZY11VJxm663vAkjBFGDuOW3XA=;
 b=TBGrAmCCvQDurtrUIMKUQ1XeLX/I7YgIIwge5tMo3zhs2mbCfFT6/9U1ptvZhRMsmYLucRjWAc2sufLy8bhcOZ2w3CGD0Y6ujQN9qoyGZesJRhiuOfkJW3hlt5Y9R/j1JDQyui8uMo0A+h1STb2OxGjDiee4E5ALvYzOyKmPQCg8BuoAVBe4aonlc/pbB7IB9ioUSCSxuIaoTPGZ1CwXas/fKwGPpRgxb1s7nIdDL9LGfvjbHi56SK6V2p3z9PuBFs/fgMCADeTzvcWHf+Cj7q4odIGiF/FaxgBg24D5An5WLWz13iPKx0N0O9BLUb0yzGbuQsG9rv7B7z1DWTtjyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7e4dqky0AuSmxMqVM2ZY11VJxm663vAkjBFGDuOW3XA=;
 b=nczhwZUNOFCJSz3iT0YX/PeggjWNMQWwKOZDPr1tbThpFfEx/uX586TG6alFWFursNIokCP2EaoM6W10ms/ON2BFvkQVIfGYbP0sM7N2I3pwt8FZBumXcmai725SaOUuvj51/N7lEN83wo7mIxrWP0eXw0gRtoO3ISaSiR1ADSGdS7EJi1+0le9t/U34Mqp+SmNcOuR35hAIbcpCZyQAtd8ezwwWL24OVcUcfujqMFqr41FdsAjXWVOHyQPYVmIdhAoOtuJSU5AOFqpWcTs2P0LWZO7X6ahm3UsEh7w272qJZXqZwGNg5GnGt85/wwwnDKKAXwwGaJipAwj4O78NSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB8059.eurprd04.prod.outlook.com (2603:10a6:10:1e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 20:34:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 20:34:40 +0000
Date: Thu, 27 Mar 2025 16:34:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 04/12] media: nxp: imx8-isi: Allow num_sources to be
 greater than num_sink
Message-ID: <Z+W2WAVEdlh2Ufhk@lizhi-Precision-Tower-5810>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-4-324f5105accc@nxp.com>
 <CAHCN7x+6_xxkx-Fft6WnfsVyqy_v3c732uKuEanrP64jv3Kj1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7x+6_xxkx-Fft6WnfsVyqy_v3c732uKuEanrP64jv3Kj1g@mail.gmail.com>
X-ClientProxiedBy: PH7PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:510:174::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ce7d86-7be7-47fa-d463-08dd6d6eccc2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZysyeFIyK0pYOW9Cc2F2OHlQR1MwclNodnFuSDRVY2MzeEROVTVkUHEzOCsy?=
 =?utf-8?B?NE5iRTFYd1A1T0YwL1p2cGJSbmppdjBPNWcxQzhVVTRkVzRDMkZIdUEwcWhi?=
 =?utf-8?B?VEtZZWZFSS9KU1Mvbmk1ZnhES3JLcE83dW1tUG5ac3BKMnovR2UzOW1ycVNp?=
 =?utf-8?B?V1huVUVOYUtIZlByaVpIaEkwRkFWbDNDNm0xblhZRy9sMWZ0TStyNng2L25u?=
 =?utf-8?B?T1pXNS9ncVJ5bUR1blJIQUJ0WVRvR0JVMXhyMHdnMlVKQVlqU01IM0UyN2M2?=
 =?utf-8?B?YSszQVN1U283T0FBb3U0dFVNMFphU0I5SFVjZFZxbEF4cEI4UmxSQ2U2bGpB?=
 =?utf-8?B?OHVRUkl0MXJ4RVB5Mld1WVE5eW8vTjhJVHRzZzR2U2thZEZWTkhlcFYwbHMr?=
 =?utf-8?B?WlRoc2plRG9yWjNXVEZabW41ZW1Lbm92ZFZCeFhqK2cxWE5NVEpJbnEwVVdr?=
 =?utf-8?B?Z2VrZjBNWmtIQ1RiaGxXbHJKcnZGVklKT3lIaUlKYzZSUWU3ZDdLdTdMQldv?=
 =?utf-8?B?akJoMDFOKy80b3QzMkJ0MFFDc1JRRUtULzNQVmNXblY0emZocWNjNEJqOGd5?=
 =?utf-8?B?cU1KdGlRdTBzMDVLTWFjNDZ3a2RjLzNtNjl5VTQyNTVOVlZHRFFKbHFJNmRO?=
 =?utf-8?B?QVhzOVNwQkJlN0Irdk1FTU9rTmEyNVRSK2FBMTNDRzRDOGp5NHRZRE1LUEla?=
 =?utf-8?B?WUV5WDE1YTlIcHIxcm9LRXovZVlDdC9qRFgzMXNERkoxdDNEdmtYUDdiOGtE?=
 =?utf-8?B?Y3BsTjNCUEdBZU5jY0NuUlNFNTVxQUhMbWxUUE85Z05XaHc3OU9hS0RNTkpH?=
 =?utf-8?B?c04yK2xiY0FnRHBWa1NUWEJ3QkFZQjd1Q1FEa2lpYzBBRUxjajhpbWZXMGNB?=
 =?utf-8?B?a1BrUm84ZGl3OFZlRENEQTJLT3ZVc2IrdXpGbkhpSmJ1dFpTZENScTFieVRX?=
 =?utf-8?B?VEdzZk5Gbk41VHJwejJUUHdqOTN1eGczUnlhMHV0SElxZEtTY1pDYzdYTEJU?=
 =?utf-8?B?TGtkakNpQXZIL0lQSFpOTFd4TVBrWGlUWmhRbkp3U0hCdXVQSmRkRnAxQnZ1?=
 =?utf-8?B?aXNlWXowSDZvMlMrcndtQVd5cEpXcEJUVUczdjJjTU9acFRKcnpQVnUzdE9S?=
 =?utf-8?B?NWJ2cDVsQjY0WlVoYXh1eEZ5dDAwTEpIL3poV2lVdU1JM0lxWXZPM0RleENR?=
 =?utf-8?B?K282T0phdEZ0cmYvMC9XMHpCcEZNMkdiUE81QmF3dktMMnNldTA2VXB1UnJY?=
 =?utf-8?B?d3pEa1JyUmVUc0tvbTNLMmJHdDJSZW5YNFZDT1ZUVENHOXY0cmdQdTJUT1l4?=
 =?utf-8?B?UDJSV1B6ZkxZelNKakp5czdVemlPN2lSZGdmcUhST3BoTEpqN2hidHhkaW8w?=
 =?utf-8?B?N3c3ZlVvNTRrOVMydlFQQjhQUnJHMGUxcHFZb3Z1U1B2QTlzcXNiVlZsUTBN?=
 =?utf-8?B?WWgxQkZ5RnJDS20zVll5Wkw1OUo0Wkl6cGJHWU5QR2JBNW9Gb3lHZXZsQ3BY?=
 =?utf-8?B?cFZvVVduekFESGpjc3lrb3QzaVRMYjQ2aURvSWdkaXZmSVVrNm0wak1DdjEw?=
 =?utf-8?B?UngzVUczLzR4eUF1YXJFdnZqU0F4VDUvcDNBZkk5cHQ5cnNZRFhYMTFjdUY5?=
 =?utf-8?B?OFJWOXVWbUhWaDZjOWVIdG5NeUpFa3c5d1NJOXNHMU1ERnF4S3hrWkE5N3ky?=
 =?utf-8?B?NXhCUlphdDAyZ0NIMXY5WXlOVk9MMTBHczJlU2tNdGU3UHNvN1FBQUhiL05R?=
 =?utf-8?B?MkMyZkpBSzF3eGltT0JjcnFqY1RmWnZlVEtrRGwxM0Z1RWgvVitRd2lOMWRV?=
 =?utf-8?B?OVV4Mlh6aTF4QmEwWU9nUURIZUhSMFZpOUFLcEtROHRCb3NLN3ljbjlUT2JF?=
 =?utf-8?B?TElqSDBMQ3N5cDJFR1FDODVkRXVnYldPNmJtY1YydTNSeU1SQzBCNTd5NkZY?=
 =?utf-8?Q?O173zNnAm+ZP8h5ynt5TB9pCSGEgYmj8?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NnU0L0FMcjRTZ2xlR1cyVkF6WnZTZFY4WHZZVGlnTndtcmgwNVZBY3h1eW10?=
 =?utf-8?B?VCs1dTJkQlNRNlZKdy90bC8wQUVuZ3B6NC9XcmFudWZKT2lCelJXWmdWT2tX?=
 =?utf-8?B?ekFyanBBWVJPV2I3S1IrMmdXTHRmcGpjaG00Q2Jqam4xcm5CdUpTbTE5ODA2?=
 =?utf-8?B?Qm00RnhocjVYSitzTURvajY2YUFtaEFkaDB0RzVLZjZyQkVka0RxeWJUclBY?=
 =?utf-8?B?ZU15NUxFZEJPVTU5aFJxS2hjN3Jwc2lYUlBleUJkbzU3UkxuZ294QzZkWkRC?=
 =?utf-8?B?ZTFEUHlQQ3NpeERuRSs5QjFycDVFZU56OWpDWG5TenIrK1U2ZjlXaFZRVjZw?=
 =?utf-8?B?RFZCMDBzRUhyT1hyTTB3OCtkZ2FUWjZDdkZxenhMN3kxZUhBV2tRbzd5U2Vx?=
 =?utf-8?B?MkVNMVBZUUFNOVhrK29Uc25hR3d0MGE5Q2FJRDI5bC8vaXZETkhnMmlKSVJx?=
 =?utf-8?B?WGNlb05LTjlNdG9kb3g2MDJvSWNPSTZYV2NTbm14c2pxbHVqcU1vVDg3QWdr?=
 =?utf-8?B?U3NSeFFYVDRJQitNblVua3NHQm5HZTY0UXNVaTRLdyt6ZmtZNFM0bU5LdTlq?=
 =?utf-8?B?SkVEc3VPcjN3TC83V0tUMVZIVmlMWUNKN3NIdng0cXlRcGI1S1VPNEZVeHhp?=
 =?utf-8?B?MnJ6UUYwK2FQcFRCT2FYajFMK1FWU2pJWW5Dc0pRbkpYbXoya09Da3l6T2dX?=
 =?utf-8?B?MTd6S1pPb3d4RU5mSjVRdTJrVmpLUlZpYk4vRUd4V1h1WjA1UWJacUZqdnlw?=
 =?utf-8?B?K1MwV2J3dEdQbGY3UWg1TVI1WFN6MEgvTFJvWklpNWNXZ0tCcXdkTVQzNDFx?=
 =?utf-8?B?YTJaaCtmS1hNdVQxUFp6T1FtcFNwY0xvSVNYWjFMa3F0Z2VhQnNKYVFScmts?=
 =?utf-8?B?WkIzWlJuTlZNZmZpTHZLQTh2bUtMcmovenRLdFgzeElmSm1sQ1Y5Wm9xY0Rv?=
 =?utf-8?B?Tk1INjRXakRhOEFMNTlpT0V4eUJFRU5tT0Z4aEx3bGlZcUdldTZHb0dMY2M3?=
 =?utf-8?B?NUhCSktQUnp2NFI1K3ZuaEhDajQwdjZEZUx5ZkVqN2JBcjhEbkZlS1hmT0RY?=
 =?utf-8?B?VURQenpEYjR3eVNOTkt3NXJGOGNDRExjL3p3RTlQb3RzL3NlSFhxRkxnVENw?=
 =?utf-8?B?Vy9BMGlPRHF6KzBVNmdDRjRvQmpBeWtEVVRLS01UUXpMSVRyVG9CQ0pDVG15?=
 =?utf-8?B?Z1J0RDhJNEgyMFlXOERxT1pMUzlSR3EyWUtNSGFEc1dvVUJFNnk5V3BvbURv?=
 =?utf-8?B?SmF4SElYZ1R4aUJ5NkRsZFpnbTA0Wk1WRnFvY0tjcTN5bCtZRnZhbUkrQW5F?=
 =?utf-8?B?MW0zRzBCRzRnbXRlVHE0aksrdVE3Y2hWYWhFajNmaFhVTEd4NWpkVDBRbmlp?=
 =?utf-8?B?YlVTSUhzYkx5M05vRlFPUEdqQkFxNWVsU1diTzJnaXZkTHYvRU4rSlJLc1oy?=
 =?utf-8?B?Sm5CZkptbnhDOVhXc3J5SExBdCt6YmZyVWR0ZkFKc2FUS0F2RmFQaHNMWXFW?=
 =?utf-8?B?TmZtTnp0Z0dhVUFoSTN1Ui8wRXFmeTc5SmgzMUNJYms4bkw5MWJucEhzRkhs?=
 =?utf-8?B?WitNWXdLMXdkKzh0OHVRb29FRzZhalpPSWF1aVoxYXlFMUovNGpTWUJiVEU4?=
 =?utf-8?B?Tm05amF1bEw2aXFtaDNlMG5lN2V4YzBiTWxwZzFnY1h6YjhoemY2NnpkeGZZ?=
 =?utf-8?B?Qko1cFhGMVBnYTJQQ0I4MHRzMkt0NEVOMXJLczlOdENyVVlHY1BXRlBVUWxt?=
 =?utf-8?B?anAxME95Z1JYZzVkR0o4UUJscWp5U0czaWlzbHMxVTY3Q0d6UjFkaE5ZaERm?=
 =?utf-8?B?MjB1TTl5SS9ubzhpSzl0QzhMSk5PQ2ZBeVpaRTJ1b1FLUEtyY2hna29RdXdI?=
 =?utf-8?B?UitjZFhBZXAwcWJPY3YzVW5RUmdqci9vSmwxQTJBVHFJOUp0d3ZSZlN1SENV?=
 =?utf-8?B?ME9vY0xCMW1Jc3Z2dXlrK0ZDUjRIemRac3drSkNFMTdYNS8zRTl5NWVMcGJM?=
 =?utf-8?B?aHBZMkt6QnlMYVcvVFdjb0FMemNiU2JnTzdZWjVUSnJqNFdSNTFpcnd4eGRu?=
 =?utf-8?B?R2YrZkpIY1ZVUGwwMG52VG5TVUVPN3ZKQ2tHRFAzVm03MUMwQnYyeGtRWWw4?=
 =?utf-8?Q?+tBniC6dZE6sRssENMoYTZtHE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ce7d86-7be7-47fa-d463-08dd6d6eccc2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 20:34:40.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weHsgyXEnuU0DikAMGp6KpAosY4c8FwxwHBxy2Z51gG8yCzwoSxyjnb5SY3+8PpO9VXG9OfdGF3vPreXMvO1xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8059

On Thu, Mar 27, 2025 at 03:02:29PM -0500, Adam Ford wrote:
> On Mon, Feb 10, 2025 at 3:01 PM Frank Li <Frank.Li@nxp.com> wrote:
> >
> > Allow num_sources (drvdata: num_channels) to be greater than num_sink
> > (drvdata: num_ports + 1).
> >
> > ISI support stream multiplexing, such as differentiates multiple cameras
> > from a single 2-lane MIPI input, or duplicates input stream into multiple
> > outputs. So num_channels may be greater than num_ports at some platform.
>
> Can you tell me which platforms support this?

iMX8QM.

>  Is this through
> virtual channels, or do you physically connect lanes 1 and 2 to one
> camera and lanes 3 and 4 to another?

Not like that.  for example, camera 0 as input0

channels 0 can covert input0 to RGB format to memory 1
channels 1 can scale down input0 to to memory 2

I think it most likely use for channel0 to preview image, channel1 to save
input to file on storage.

Frank
>
> adam
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v1 to v3
> > - none
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > index 93a55c97cd173..ba5b2d3617a23 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > @@ -188,11 +188,11 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
> >          * Create a 1:1 mapping between pixel link inputs and outputs to
> >          * pipelines by default.
> >          */
> > -       routes = kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL);
> > +       routes = kcalloc(xbar->num_sinks - 1, sizeof(*routes), GFP_KERNEL);
> >         if (!routes)
> >                 return -ENOMEM;
> >
> > -       for (i = 0; i < xbar->num_sources; ++i) {
> > +       for (i = 0; i < xbar->num_sinks - 1; ++i) {
> >                 struct v4l2_subdev_route *route = &routes[i];
> >
> >                 route->sink_pad = i;
> > @@ -200,7 +200,7 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
> >                 route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
> >         }
> >
> > -       routing.num_routes = xbar->num_sources;
> > +       routing.num_routes = xbar->num_sinks - 1;
> >         routing.routes = routes;
> >
> >         ret = __mxc_isi_crossbar_set_routing(sd, state, &routing);
> > @@ -453,7 +453,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
> >          * the memory input.
> >          */
> >         xbar->num_sinks = isi->pdata->num_ports + 1;
> > -       xbar->num_sources = isi->pdata->num_ports;
> > +       xbar->num_sources = isi->pdata->num_channels;
> >         num_pads = xbar->num_sinks + xbar->num_sources;
> >
> >         xbar->pads = kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL);
> >
> > --
> > 2.34.1
> >
> >

