Return-Path: <linux-media+bounces-38221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F694B0E639
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 00:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38B657B3427
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 22:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D412868AC;
	Tue, 22 Jul 2025 22:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f0QSaood"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5DD2E371F
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 22:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753222367; cv=fail; b=CW+r0mQ9MJH03NaKYfEDxAe5thxUvVcGtXIjOKxqANFlXGm4+7BXV5Q50wN+xR3zPnKEWOYBvqf+tNTy0gnOrLUzLVwA/ZwBP8KqOZFdnPLC3Zxapm+fGDZWHQwCC/HgFlLGFqrH2Vqgr1/Vo+DIR6+MGs9BMfvfIcT27DtnPE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753222367; c=relaxed/simple;
	bh=TCfLBIAKC3toM9q77SA3YKdH71lPJz47OruPihnasy4=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=knudkOIDBX4AFOO7oYDfj301Dys+JMjL/Gkr89oECUvs2iNeTPD6dMXUQMYtezlveovepni5YLTzqMeyViWXzsR4svYjvuo18vF1olydBSAHYzcc3NVG1uUd8FPmpy9HWhPoiMI4ztbLVdnCh752C9tQ7eS5qXpb9OGE9EdKzzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f0QSaood; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=httnfSGZl1StsbJNZkl/SRim6MXiv+w2Ccc2aUOraTdnBeQfirmmI/L8kczT8D0uhhZJqaM1JtwE8CcK9+Bf42dw0o+Z8/ITzlouIof2QMDKzfDStPH5gOhipEAEIuCDOusIK72geG53LtRkVgDxQt51iTTIjsRF8m5gmsSLmYXGqd5sFgs7pkXHCN8d1GgIO5aijIW/J5GDzCPtx/gP1JNxQ56nVB1gAyXAJZGjwEQfZgcrQhijvMPBy/Aa6yfmEXLGsbPdccdyPYD/+v69qVJc0sfv2D380qdt3oYLsHZXtpmxtjkhI4lyo4KdbISxlGuEVZ+Cuv397+HFqKedQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbnItrMs3auwNjIy/YEvLbX2jzcu+QveEj2CYJjEYmw=;
 b=suiuYh9tIGpjWS18H3CiNKzNkWMHhDXQO28KSYTYNzwIMG5F11nbFMIV77+MFB9oXdqpZoU+sYdI5NNGec+PhE4n7J4efSff9L+h8tURqhkSaKg7j7fXJQpxBW2qxZthAmQrr5GYa1wSfCNaKsXhOT8lWUp1QEhwKRuoYNKxLzOzoypLMRaD6teKDS22yuiYbYaeDQWVfrQ4icoOfVMwJf85yYKV1/v+zqYto+vADDBzwcUwSBPNa3V7JkSIzKjqplYAFNzw3YHJ5kglVlcrxQAvLYWSvyKhvebdMdVneRTeTamdcQ9EZ3HUgqU7vLrkcBp2cW3eSqNcQEPOHlXeJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbnItrMs3auwNjIy/YEvLbX2jzcu+QveEj2CYJjEYmw=;
 b=f0QSaoodAgLxreWgwvSXgXe03B9ypPuyu0nbx4PRecfacoFGQjxyLpWSLBSJM+jAjeN2adHAk3jJqhgf86f5AVbEVl6s0imycwp4fmhTMoiiZFOZq/4sJ61MzHNTDopW/ReGNzrdL3bGsJkH0O8/AYU5w0gr+5GTF5uICgt6en8ZXYKF7ltYpMP0G66hMu7g58QaJ9yJfHa/BkB96RK4aWDpwFcb+enOUZFJsjPZlo5LbTXZ1euqKl1FiEksWP9k/xbG2D8B60m+t+xj8XhSNEikoBlk+rz0L4+mn5rfoRxQJF+2yNx0SnQYs8Y9DUZrEnsW88tMAMob+zrkNB14uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS8PR04MB9046.eurprd04.prod.outlook.com (2603:10a6:20b:441::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 22:12:40 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 22:12:40 +0000
Message-ID: <789b4ddc-f7f9-4c0d-8bef-cedc4dea5186@nxp.com>
Date: Wed, 23 Jul 2025 01:12:33 +0300
User-Agent: Mozilla Thunderbird
From: Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH v10 16/64] media: uapi: Add new media bus codes for
 generic raw formats
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-17-sakari.ailus@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20250619115836.1946016-17-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0080.eurprd04.prod.outlook.com
 (2603:10a6:803:64::15) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS8PR04MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c100f3-d833-40b0-2301-08ddc96cdf78
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RytsUmdGaFRMNEQ0ZnRLaUtWb2R5dDl5MFBlT3dqeVovMUg5cDRpSDBNSVZl?=
 =?utf-8?B?bTcvcDZtR2JIckkyaXhzVjc2SXEzUVRNeEEvcjg0cmM4dlgwdEZkZExJUTZ5?=
 =?utf-8?B?OXZINDVuZGRmOStsZmZ3S0lzRWdYQnFwMXM2NENqL2J0L2pJYU5Sd01DOElm?=
 =?utf-8?B?dDE4SklCTk9WcldEU0d3dTJRZW04OUpHVnBaQm1RY3RNSFAvWFlKZmhRaExV?=
 =?utf-8?B?YlhXVjZBTGgxNU1LdENZRHpuRWJlQ2VtazNtNDBZeTFnN25GZDF3dlhlMTV2?=
 =?utf-8?B?eTlTMnQ2S1l0TU5laEl0Yi9tcXMwU3pLaGF3Q0dDM0pNOG1GT1N0WHZmaGtr?=
 =?utf-8?B?ZWprUEV5d3hySVpQQWx6RzEyUE9ZYmhsWlZLeS9OSXRFK0pveE0yQUJ1UUxM?=
 =?utf-8?B?NGNSdlpXK2pRWm9QUFkxTkJDZFhpYkxwMkxlcFFUUFNERmFCdEQwTitGbS9j?=
 =?utf-8?B?Ni8vZ3EzRmVkRHVzWDlqWTFML2cralkvWDhlbGJtTHQwL2MzUjc1UmIzajNj?=
 =?utf-8?B?eW40TEZmSk1QOWh5VDkzMjd6cjBPZTQwMDlKTTN5ZDVlamFLeFZuTFhkQzR5?=
 =?utf-8?B?OG5CeVdFQ3gxVlF1THgvQ3BzZUVkL2pKU0E0WWthT0VUcUNDWTh2a1pEcmZK?=
 =?utf-8?B?Z3NNWkxJOWV6c1h3MVFtaFdpM2NvRHByWWx5TmlsN3NFZUN6Nk5pSTBuNXhM?=
 =?utf-8?B?V09pSWtZY2tMZXE3ZjkvY2R2d1RoS3pheDZnWmhwaHNPYW9qT2tkdHlDbnA1?=
 =?utf-8?B?R2JWWi9BQkpmdU1TUERMWWRaNXZnUzVBeFlGWFhReUNPWngxSHN1VUtsWnNy?=
 =?utf-8?B?MWRNMmZzejR6SEI5b2ZjOEJEQk5RcE9Ydko2RU9lNjk2emdIS21KZEx2UzFk?=
 =?utf-8?B?MTJKN3FkVCt2ZXgyZENKMXR0MmMvY2wrUU9sUUphV0ZqS0U2SjZkTUpORFQz?=
 =?utf-8?B?enRyU2I2K0kxV24vVC8zSFplSEJ4eWlxTzhYamxrVFZtc1E1cXBOdHJPMm8y?=
 =?utf-8?B?alkwWncxUTBTSVpWRkdXK2NXemlZdFFia2dPL01ieWJLZDgzQlMzMDVEd3F2?=
 =?utf-8?B?dUlFTFprSi9tRU13OERmdXhBTWJwM1VNank3QzdWbzRLS3F3ZE93TVlWUlBq?=
 =?utf-8?B?bjgxQkd1UU9iNmZFRWFFWVBwTmdmdnVKZDNRSnlKVXE4SDlNVHZiSXRlVnVj?=
 =?utf-8?B?MkZ5cS9EbVdETDBGejdrNWFYOFh2dnd3c1RxaFlkK1JabG52WFlxd3V4emJS?=
 =?utf-8?B?L1h3VEpacnZnNVV1L21OY1hDWUpoOHdrZFlnZldXUEpIYVErUU53cGtoU0Ru?=
 =?utf-8?B?M2lyVnJoR1kwVlVQRWM2cjBpTU8vcGNtc1cxWjFod3hnMG9wcWVTZ1NpczhN?=
 =?utf-8?B?TGlycDlsMmVqNHI1TitXQ0VBUEhXa3JJbzJYWWZsV05INlBkditGcjNXYWJj?=
 =?utf-8?B?dDRqTnhBc1p4UmFJbTkwSWxLUFQ3Qkh0Y05CTzZHUytqSzlNQU5qYURKVmhn?=
 =?utf-8?B?VVZwOVJLbExFTms1cE1OYnJUbDdsTjF3ajZsZS84NVVmR2JNRVp6K1pQNWNa?=
 =?utf-8?B?SGdjZTZ0UWc2c08vOUE2b3ZqOE1HTU4vVW55aTVyR3JqZjZtRWlWUHA2RzJ5?=
 =?utf-8?B?QThQL001dzBHajhwL3BneGR4a1YwcjhyWHRvOTBUdDRUZXR5WGpqZkdsMW5H?=
 =?utf-8?B?aEVibFR1THFyYXhTWVN5bWdTbzVSNitmYzIyYjR4UkhmclFGeGlyVnB5L3pO?=
 =?utf-8?B?U08xcHNmaXFPK2NXdFBIZlpWNUtKdzFjRVVuUFZKcmkyaEVnaXA3aUJzYWp0?=
 =?utf-8?B?Ukhic3JCeVVOMmVqaktGRy9EbnFhVTFHZXZMSHNldWJCblBuVm1USjd6KzE1?=
 =?utf-8?B?dldpeCtCRGo0ejRKVlJzdS9QcytxbVo5WG1acnVsWWt5bkJ0eEMxQlRJWlhh?=
 =?utf-8?B?cmtsajNYMHlZZGFEV0w1b3VyWlFDSnRrK001YkRCL1VBQjhNWXdwMnpwSHZV?=
 =?utf-8?Q?SrH3XA1yT0LjORoarvoxLU2mjnQS1A=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a1dWYVlsS3VxQ1NUTmY4Q1pncFp5MFBFRVhDc1AycDlLYzE4SlkrMGUvTm5K?=
 =?utf-8?B?eDRscmxVTHF6bkRSbVhaNE9ob2tPQ1RHcWNlSlQ1b3ZiV2psUmFOUVYzQ29n?=
 =?utf-8?B?cHczZkR2WGZvdG1FY0NBS1k5RkhvSDBJcENVQWlNd1U0Q2pIaVlvTlY2T0Q1?=
 =?utf-8?B?MTQrVzcwall5c1MrNlBUdXM3QlRCY24rZkQyNmViMkRsK0dDOXlBMWVHVkFo?=
 =?utf-8?B?VjhHWENVT29sV3FXUkg2dVJJNmFKV2dWNWFseW5wNjNLYVp5cVcxWE9VaWk5?=
 =?utf-8?B?VmpEQ0haOW1BQW1yY01ObTUzWUJtM3d2OG1wN1dWMHdZeGMyVTdNVllYQmtC?=
 =?utf-8?B?UTlOc3pocEZmbTBmY3lacUFWTjFjUk16K0pHQm1rMHBhZVBJUnBvN096T0ZC?=
 =?utf-8?B?VEdxOGJ6MVZzREpXSkNGcFY2TVBlaC9DY1UwMFJKZEcyU05zQXJkekpQZ3BF?=
 =?utf-8?B?bTZYVTJaU2E1NjJCNzdmV2tqU0FtWDhnLzFlT1BQREMxYmg3cVhWMkdWdnpq?=
 =?utf-8?B?bG9lTUtBYU5Nb1hCaWdTOHFJUks4cERXOTAvS2JpTys5OTZWUnZMem9IVDc4?=
 =?utf-8?B?SW9xRmsyUUNmbU9rRzc2RnRWeTlxWWNlQjhDOWRmc2JXZ2c0RFR1dGpxWWpt?=
 =?utf-8?B?UGxaaHN5Yk1pWGZSaGpTMm5SZXhZa3IvM09PTlZkdElZV00wbUQrV25IRmIw?=
 =?utf-8?B?RFQ4WjNhRStjYjY2YW5GZE5YUW9pUmdmTDdsRXdCejY2RzZSU2c5WFRmZGtk?=
 =?utf-8?B?eWJNcitqTDM4aTZNZW5WYVlyWDVuNStQRXVaSzk5TkJjTnFCZmphMTNvd1k2?=
 =?utf-8?B?T2FiSDdBaVIvTnlINUZNMEExWDdCTExSR0twNkZzdnV1MDJvaVhGTEo3eDBv?=
 =?utf-8?B?dVRnNm8rZHlnQ0MrL1BXamNkRktPaHh1ekQ5d0o5QlhBV2ljRm9XMmRLdFlV?=
 =?utf-8?B?c2h3ZmVCcW5jQjZWMldILzluQ3NCUFMvRjAzNU1HMjlXUkNPcERZOEZnVkJS?=
 =?utf-8?B?Q3ZxNW44TE9RYTRCM1ZpUkJTbkZzMVk4SnUzWnlwT25YYmNoZDJ4M3p6N0hM?=
 =?utf-8?B?ajVzaG5qU0RLTlFOSnBMeEt2c0VLSGF1Z0FMWnlLOHVwUkwyM0pMV1Ztc01k?=
 =?utf-8?B?YWJUdlNnWGFScjk0cVBvdkNyNlB6bms4djRYNU51Z09iUm1ZcEtnU2NiVytG?=
 =?utf-8?B?VjhmZ2lJdHhtbjkveDVpVEY2VWlVaFFWemFNR3dMYXE0Q0hhU0NHYzV6UTBY?=
 =?utf-8?B?aENybmFsUGlLQlBnMWtVV0dmMTNyMkRNZDZoWHRXRlcvbWxuVE1Pd2hGWlJ6?=
 =?utf-8?B?NlZBUnBSNFVoa1dEZGRJeGM4SXZJays1cUNLWUxHWUs3bURGWDZGSjY4OS9V?=
 =?utf-8?B?NGRwbzF1a05Bc3B3YkdwbFptRGRxS0NYSzJPZUZDS2RzMXovNWNNL2UyY1VD?=
 =?utf-8?B?SUxGd0szSUZnaXF4RS9JSlBrY01EMVo4b3ZhUlU0c0hvajB6ekdVUlZrajQr?=
 =?utf-8?B?N3hId3lJUXZOZ0JvNWY0MGcvL1U1ZEFIL2pZa3ZsTEs0ajNOOVlvbnF2S3B1?=
 =?utf-8?B?anMxVWFVbFZXSEM0OFFJZktwOHdBZndwVVoySm4zUkQzUHI1Vy9KYTcrU0Ju?=
 =?utf-8?B?VFFLQ3ZSVmcvVUxZUG1FZEFpQnpTR0RuajJXVHJPc2FUTUo5OFJGWm9ib0J3?=
 =?utf-8?B?YW9XWXVLVFRmK2QxMHhXdmxXTUdNUm9TMXdqdlpocFFtdEkvTnNOcmw4WWVY?=
 =?utf-8?B?eEExd2tNbmhxdDJsUVRjYmpMWVpNS3NTQVk5bDR3dFZoRDhjcWpSQTV5cC9Z?=
 =?utf-8?B?WnY4OHNURyt4OVBpQnBGb2JuMmJPUzM2cWpJVVBpaWF3a1ZFa3BteE02aExI?=
 =?utf-8?B?blBrTWZabVRFejcrWEoxUERsN2FhTWY3S21aWEVOYXY3YVFwMGNreUp3YVJv?=
 =?utf-8?B?UUt4Z1dDM0xPdTJUVDFXVEZRR2U0ZkhDditMUGh1Z1ZkVHpEU1RLVkI4SUNs?=
 =?utf-8?B?a1FlTmNQQmpxaDcrc0FpaXcrMW9BYnh5SmJBSDVaSTBNS1hvbndMbExuSC8r?=
 =?utf-8?B?RFZ5R3kyVXVVSDlXY2NlTW1BdHhXNS9CSWNQWmNFNjFKRkI4clROSlZMcURo?=
 =?utf-8?Q?afjmE9WrX7doc3jZxathzCzV8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c100f3-d833-40b0-2301-08ddc96cdf78
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 22:12:40.0977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2U0jErUnI5fNyxv0Wgqx17oCZMlTtLvlB77wkSdMnhjXE1IlyAHQJWER5/SSJmOCtWpLxZ4HC6L0mzKT/gpPLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9046

Hi Sakari,

On 6/19/25 14:57, Sakari Ailus wrote:
> 
> 
> Add new media bus codes for generic raw formats that are not specific to
> the colour filter array but that simply specify the bit depth. The layout
> (packing) of the data is interface specific.
> 
> The rest of the properties of the format are specified with controls in
> the image source.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../media/v4l/subdev-formats.rst              | 40 +++++++++++++++++++
>   include/uapi/linux/media-bus-format.h         | 10 +++++
>   2 files changed, 50 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 9ef1bc22ad9c..c06d8c83e2b8 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -3434,6 +3434,46 @@ organization is given as an example for the first pixel only.
> 
>       \endgroup
> 
> +Generic raw formats on serial interfaces
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Those formats transfer (largely) unprocessed raw pixel data typically from raw
> +camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
> +interfaces. The packing of the data on the bus is determined by the hardware,
> +however the bit depth is still specific to the format.
> +
> +The colour components and the native pixel order are determined by the
> +``V4L2_CID_COLOUR_PATTERN`` control. Whether or not flipping controls
> +(``V4L2_CID_HFLIP`` and ``V4L2_CID_VFLIP``) affect the pattern is conveyed via
> +the ``V4L2_CID_COLOUR_PATTERN_MODIFY`` control.

I am a bit confused, my understanding was that we will use Y formats, 
did something change since your last [RFC v5 11/15] media: 
Documentation: Document luma-only mbus codes and CFA for cameras?

https://lore.kernel.org/linux-media/20250203085853.1361401-12-sakari.ailus@linux.intel.com/


Also, please replace V4L2_CID_COLOUR_PATTERN with V4L2_CID_COLOR_PATTERN.

I don't see any V4L2_CID_COLOUR_PATTERN_MODIFY or 
V4L2_CID_COLOR_PATTERN_MODIFY control.


> +
> +.. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: Generic raw formats on serial buses
> +    :header-rows:  1
> +    :stub-columns: 0
> +    :widths:       1 1
> +
> +    * - Format name
> +      - Bit depth
> +    * - MEDIA_BUS_FMT_RAW_8
> +      - 8
> +    * - MEDIA_BUS_FMT_RAW_10
> +      - 10
> +    * - MEDIA_BUS_FMT_RAW_12
> +      - 12
> +    * - MEDIA_BUS_FMT_RAW_14
> +      - 14
> +    * - MEDIA_BUS_FMT_RAW_16
> +      - 16
> +    * - MEDIA_BUS_FMT_RAW_20
> +      - 20
> +    * - MEDIA_BUS_FMT_RAW_24
> +      - 24
> +    * - MEDIA_BUS_FMT_RAW_28
> +      - 28

This table does not look very useful, bit depth is obvious from format name.

Regards,
Mirela

> 
>   Packed YUV Formats
>   ^^^^^^^^^^^^^^^^^^
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index ff62056feed5..3abae4c77c6d 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -185,4 +185,14 @@
>   #define MEDIA_BUS_FMT_META_20                  0x8006
>   #define MEDIA_BUS_FMT_META_24                  0x8007
> 
> +/* Generic (CFA independent) pixel data formats. Next is 0xa009. */
> +#define MEDIA_BUS_FMT_RAW_8                    0xa001
> +#define MEDIA_BUS_FMT_RAW_10                   0xa002
> +#define MEDIA_BUS_FMT_RAW_12                   0xa003
> +#define MEDIA_BUS_FMT_RAW_14                   0xa004
> +#define MEDIA_BUS_FMT_RAW_16                   0xa005
> +#define MEDIA_BUS_FMT_RAW_20                   0xa006
> +#define MEDIA_BUS_FMT_RAW_24                   0xa007
> +#define MEDIA_BUS_FMT_RAW_28                   0xa008
> +
>   #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> --
> 2.39.5
> 


