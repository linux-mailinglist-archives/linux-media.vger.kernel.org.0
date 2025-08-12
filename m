Return-Path: <linux-media+bounces-39557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE4B222F2
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD9EF5010E4
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB5F2E973E;
	Tue, 12 Aug 2025 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V5g86fXD"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998012E973B;
	Tue, 12 Aug 2025 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990395; cv=fail; b=qAq8osy0mWwwDzVOet6ArxTgvKUJQ1v/Eu5RuZXSXdNUEQRcf8khxPr/CVre0tEtmwPY8nLGTBZUX0wblA85Q6ZFuipHSNW+DQqN8P74rjtfSN2v/m0HaX13lIGP2ojzFXV362ByxLDu9kxkKNqXnl5Ag083agGcsZzMcq53gnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990395; c=relaxed/simple;
	bh=yVEhF6NIlvKAF7roM4aEr9BhlgvzYwqUUoRszvEx9Ks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jjxni4qPSyi2Efgy0oVLuY6ftOlk5X/fsW5kfeEEmm6H2pGj9coEmuK9jhFVcs/oKwEw5mEa7B7nZpPN+MoPsWRDuI04jLy1cyWcMd4Q3PfvxkuExDkmvpkZOS6KnNpGEv55bDnu0fr/IKTij01hF18eoZaXU5b+iGCDMlfahTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V5g86fXD; arc=fail smtp.client-ip=40.107.130.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EaebNwkKh9JJJ8vdDhdMsgfmWKYrwnhHDw/QlWsdy0/n5+y8agHG4LjUSDVbTI4G3Nj+7oISp79VY3mJjgYobTlWPGqFZ6GBNmCqpWOms4GJZyBaqPSsWiYxguSdA8mx7rBckTQ2MhONXiPcuyS34NP6zcqqnbmVX6v/bDPvmYWlcRkfrleL/he/sV/fbWJYm4MswWc462LvdtCNYLIRjsMNuFQKCMAnJbpjRoaG8gHpDkq4YlB8Hk2dljIG22nkxck9w7JK5oFUsxSk5Rmv/qDqwXufhmcU5+1D3WiG+L03L2wuod/XVoVXGMyyD5TPyGJkL8iYBI4AngAXcjfLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bjm/4SOcTyhhzOaQG9LD6Hg5sSE911nmhyFldazbYDU=;
 b=XkHxQo8WqTRA3qL2nR7tdx5yt7nzGAsO/8C9VNPPPJyqwjE4wbZrs1PPx/v7tX7x3xPttLx4Hm9aJyjhJtz1f/IjYGcwXsz3sEmt0sz3u8qiBXldf0Sdtch1RORp/pC2K/B/CBfY/KClLTcpl0HMeReuHhDVI2HohFwnWlCv2VpOK9ZaX5BTOSCCtv6YHF1fQPbTA+B4JkPTxvoBobb/Y11AC0Nq6wBylcWFuUijLRwvrkOoGwbxZxRXyn49IXDTHwu668GTFNrqZNEWnADU+66KZOjkBK9aE3qzFVDUKdqX/LRCvQnOgrAMRJBfZa9XUG0bTN6Jrb+Yf/oFz3mKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bjm/4SOcTyhhzOaQG9LD6Hg5sSE911nmhyFldazbYDU=;
 b=V5g86fXD1rFw4vmuRz3Jse3syHN2OiBisA2PmQS1pBs7kIK4QA4qZihatf7COH6e69sDQBUTVWvPZ3YHyveAM6SnN6m6/CBzS8D8OEGrk/GzpvH+XXg7eLw2et32xkmqjJ+BmDa0cXTnvBXvQZlfaws9dI/+r84yBRaicANwcczkRdZ/i++I2zFxDD3p2NLO67+Fxat92Qs7w6bENKmRowES/uC1EIvU0dDq6dx8OH6XzSbOZ9RFGA2XP5BacjxSUrz/kL66OnX2firbPILu62FSQQdD+7b3AZmqu3c+Wu8L5OTbIt/oJniOymmGnkcYCEfNOcL7RXeUSR00lldpig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM7PR04MB6904.eurprd04.prod.outlook.com (2603:10a6:20b:106::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 09:19:50 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 09:19:50 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH v3 2/3] media: imx8mq-mipi-csi2: Add RGB format support
Date: Tue, 12 Aug 2025 17:18:56 +0800
Message-Id: <20250812091856.1036170-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812091856.1036170-1-guoniu.zhou@oss.nxp.com>
References: <20250812091856.1036170-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM7PR04MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ebd5a85-f956-4f6a-e94d-08ddd98163af
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?R092Q2w0blRiZzVmL2h3VElCTDRmWFM2L01KcUJrSG9YZnViOVZFb3NJS2tM?=
 =?utf-8?B?L3pFMFpxekRVd1UxZm9mcXcyZjZKenEybnVZci9MTTBvWGhNQzBQZFd5ZStU?=
 =?utf-8?B?TjZRa29uenlRT2RqbGM0T3pZa2Rmc0RmVTY0N0I3WVBrWndPL2lTSWdIV3ZG?=
 =?utf-8?B?d1R1OUNXdFJzWkxNZlc0N01tdnVTZmlaY2hlaUk5eXkvbU5kLzFkRzBiR2Fi?=
 =?utf-8?B?WTRqU05DbUIzT2hQQUxxa29jeU5KbFNGR0JsRVFTZXljVnZzWFIwOGwvWGl5?=
 =?utf-8?B?bWoydk5veWNEeFl0bWdKWjJaNkR4OUJad1hzdlJEMHVua0lWbVRVMEdOT21K?=
 =?utf-8?B?WG1zRkVmcUZZZSt4OVJyVlFoQy9QWGNaM1duazIveDJRQWhmREkwc3k2SEpa?=
 =?utf-8?B?MXZQZE5WUUpXWCs0bCtGVXlpeWg0SW1GK0Nkb0k2aTRscG5VWFVkcTZXQWgx?=
 =?utf-8?B?b1U1ZFdnMzQwVGFoc1pVa25sK2Jzc1Z5SVJUSVFqa1Q4WGt1akhxNU5HeFg1?=
 =?utf-8?B?WTBFU2hnWDBNS1JMQmtmV0k0K0QrVElzd3B0VlB0M0xlRTU1ZDFtVTkwMk91?=
 =?utf-8?B?bUFreFk4RUE4TFJkSldPbTd5OS9CQ3FqcFlCdmF4Ynk2emFmb2d3ZitUSnJT?=
 =?utf-8?B?VEJuWEZHUjBwazhoWU1XNlQ4dDVNdTVlMUJna1JjWnNCRkozenlBTkcveWxl?=
 =?utf-8?B?K0JrRThKTXN3MWYzOExtRzRqblhmbmZGc2dsT0F1S2xNQndPZFRFZkU0UWhQ?=
 =?utf-8?B?VEpvNkp2ZlhqR0RBVWFmQ1B2Nk91RTBkb2ZmMDBPUkw2allLbURXVGdoU0xP?=
 =?utf-8?B?UFJQMFVUYklUQjdHUzZ4YUkxTnFuVUo5SjFTQ0FpMmVwR2l0cFhNWlBBUzlp?=
 =?utf-8?B?eUxUWENqajVrM2RUSFpRUndqM250NkovN09XbkFNaE5yM0g4RUlVR1ovbXBB?=
 =?utf-8?B?bzZKMUdESnpYVURxMVJsK2FRMFMyQVBjR0xSTEdmZkNoVURrYXpVdUZJYmpW?=
 =?utf-8?B?VEhLR2lZejRLdWN1dWRncDZHOUF1RGZrOHd1VVZha1lRenRMekFRUEhNTW5k?=
 =?utf-8?B?WmhQWWhzT0ZwM085THNxMkt5azR3WUYxWjRwTUN5elZ5VDRHZmdpTWJzVDFI?=
 =?utf-8?B?NVFxQWVpUjcrZ1RIQkI5ell0WjVIMEI4MHE5MkJLMDZSQmtrVTJ0WkVQNE45?=
 =?utf-8?B?TzBqU29JdlgrZHB2WU1yS012a2duRVhZaW9vUHRkOWcvVFlFS3p4MnZyV1p0?=
 =?utf-8?B?WVh4YU85Q2N1WFZlYURsY25EWlJmSHMybTByWVZvNlVuKzUzUG9YZmNGdmo0?=
 =?utf-8?B?di9PTCtMa0ZUMFBFSlJmQmlrbFM3bUxaSUJFR0NhUXVRTFdoNGM1R2dJRUlo?=
 =?utf-8?B?YjdVcUFNNVlhV1ZucCt3UkJTMEdDYkMrV0FIZ2pwWWRuUDU4QkxJdmNVNmxH?=
 =?utf-8?B?UUExQmx4ZjJaNy93YnpMd25LblQvc2RoTFVoZDhVUzAyMWMzZE5JRTZqRFBa?=
 =?utf-8?B?R1VzTUgrUlVyRUpRb0dUL2dnSDV0ZlJDbURTKzk3cmN0ZXBiVDJnUldvSUFF?=
 =?utf-8?B?LzlwYU1YMzJVTklwSEFaREl0V0FCWWlmU0h3b2NHcFNLRUtoWDc0cjBNbkZa?=
 =?utf-8?B?a2xjNHZBdjFXRlNCRXlrMm92aEJtUzZrZFNGZzNEWklSRjJESzJQTHFMa21i?=
 =?utf-8?B?SjlaQ2lJc1MyczVzUXZXRE5rdDJBNkFZUGxjYXA1cjdKK2NsWmVVQ0s1MUJG?=
 =?utf-8?B?WlNyYjlQalo3UzBUTS9sUm4vMWpZMmc1VFl0bkdVSi85T1VaMG9Pb2RpK1Zr?=
 =?utf-8?B?SXlTWmprOHNhUDFqb25sNWVBbjNYeW9GSFRHOStVRzBGUExnMXNZUFNLUnRC?=
 =?utf-8?B?WDRVbkhCMFdiMGNZYXpwUlZiaXlkL2pwVG1EN3pmTXhOZVRnTExoVFhudTJw?=
 =?utf-8?B?Uk51RjBGdWVyZ0pDTXRZTkRZMlpldXY0Ulp3UjZnMnpxN25XaERqTjFsQ295?=
 =?utf-8?B?RlphbFpmZnVnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WGV3SzlyQlprVjJoa2UzZkpnWnVaekhBWU9lbENITE51Vlg1aGxUSFBEbkoz?=
 =?utf-8?B?L04yejE0OFhSbUY1elIxZXJ4UTNhUlpScVFDbVVmWkNtcng0NXA3RThXcHg5?=
 =?utf-8?B?aUdXS3RlQ0IvS1lMVTM1ZXR2OVB5a0hPalp0S2xVQmRVbktwK3lMVkxTZmFQ?=
 =?utf-8?B?Y0x6TmZ5c1dvdGQxZ211Q1I3K1pPWSswMHVuWjFuTHd3MVdiU3dPbDh6VitP?=
 =?utf-8?B?YXMvTHJhZHBsRlBtYnIxL2xKdG96WitIVkJWR1loU21ZSjF1cUpyZ3YvQ1Rn?=
 =?utf-8?B?SjNhQmMwR01IODdmTzFjZ0lzbzJhZU1DZVZzcE9jZFk0RWZULytTNDB6czR1?=
 =?utf-8?B?OGRPMHlmd04vU3d3bUxES3djYXl5bzlSQTBCbXVKWTgwMnNhYW5LZW56TWFi?=
 =?utf-8?B?R0lDV3RiRzR6bTl0eE9EbW9zT3I2MHhMS1VQZ3RLNlVaZ09xczdjMC8xMUdn?=
 =?utf-8?B?dEljTm93ZkpoRTFNZmZBNTJjZTVVckpqRVUrRnRoZTVpS0hrZkRVMkc0Ungy?=
 =?utf-8?B?R0RhWFJoTjlTZTRNdjZUQVZURHFyck8xdTVyZHozekR0K0xpTkxjR3BMTE5u?=
 =?utf-8?B?d2ZrckNGZUkvV0NPNEtNdG9EQ0dOMm0zRDBUQ2ltL05ySVlaMWtBWndvQkVx?=
 =?utf-8?B?dWYxbUZNVThucEhRa0ZNR0pnQzl5dVF0YTNXOFFSRVlaSyt5Z0hsUDJXM0xS?=
 =?utf-8?B?Zitza2NqWEZsSEN2SUJpV0toTlNuSmsxZlhMcUdscXBXQU52UG9aOVhVSmxH?=
 =?utf-8?B?UEN1NXJmUzJZYVpDMjlvU0J4NnkwaC8xWTJsVzh2UGpyMm5mN0F4M204OWJK?=
 =?utf-8?B?MjQ2YmpPMmVRYjk3enR0Y2x2MXhHcmhGQTlKUkVRajhseHV4a0ZGVVExbWFn?=
 =?utf-8?B?eEdhc1Rod1hTc05HcngyNWN6L1cwbjkxbHNzekhZNVZ4RlA1ZlVZVVJRTVdw?=
 =?utf-8?B?VkV1aHRYZm9Jb3B4VE80SHg4ZTRld0J0ais4SkVYbHUxQm4xYTJwelRjOENo?=
 =?utf-8?B?S2tqaEdUMkxwSWMrSGc3anpoQ29KL2NyL0VLTTRRQVVGQ082ZXpCWlY2RmdG?=
 =?utf-8?B?WEhVanpzTTlsOTZYZ1pjVk1OYkp4Slc2eXlVOGx5UjlJakg0RDg1WW1HTU1x?=
 =?utf-8?B?amFZRFRFRUVrbDNlWHdhU1ViaDhjVkxsTWEzS2ZlSE80UkJ6M3RVKzg0Qmt3?=
 =?utf-8?B?TjI2WEEvRitmNGxiOU5nVmx1cklPbjlkVGVuN2JpK0dBWVQ0dFVWVE9EOEE5?=
 =?utf-8?B?SmpwNnlZY0FDWWQrWkhGSHk0dzFNakZIRUFLTzR6QWZ0WWRJemt0SkxuaXJr?=
 =?utf-8?B?ZU1JQnNUeFVFa2svOWtUbTdqNXd1MkpTSkJkZTY5ZFpwY2VISDVXM0cwei9R?=
 =?utf-8?B?VEJ4NTNidTRXVGc3NlBaRDQ3cEs4NjA3VlpuVDlOdVVLOE5vcHhkRW5oeHRv?=
 =?utf-8?B?STcvbEJBbTlpbzJjTGZCL09pb2M1Qk1jNkVLUUFoZjZjT011azJCNEVIZFV5?=
 =?utf-8?B?OE4rSHJrdnQ4S1VJQWtpZEpPUEFId2pyMmhiVmlQd3VXRjVpU1NtanV6M1ZR?=
 =?utf-8?B?dTZaRThyM2wrTjBhREdIVzlxNnJUVk9FOUdlVERENVRicVE3Wlc5enJOUlJt?=
 =?utf-8?B?R1ZLNTQ3Nkp0WU1YSkRhWUs3NDZzK0dEOUtuZGptVEp1VEx2WDd5SjZZSE9m?=
 =?utf-8?B?VjhPTWxTSTJ1cGtZbUIrK0kySFU3b2lpU2JEMTN0YXRUcFBCQmFGUFB2N0FO?=
 =?utf-8?B?SlJpekV5SktORmFZbkI1UUpZU3l4bDYxdFlLdE1UWkQzZDE0Z0NxZFgyTjA4?=
 =?utf-8?B?aTQzRWZVT0oyK3pUN2lYczlnZFBrTXJSTTNpbEJ5ZmNEOEk3WlFuQjFON0FH?=
 =?utf-8?B?bTVsNnhNdXhRcjJXZFBLY0kzUFhYaDE0ODhiWTQ0SWljcyt6bnFDbktiaWV5?=
 =?utf-8?B?Z1J2cThJWm9vdlRVbUlNTmFKN2VTL3Mrd25tMlNOU2JXbGxpMEVXYVBZT2g3?=
 =?utf-8?B?ODNDMTNSUTN3RGpwQmJlOEs2cFo1MHNCbkZxQW1VVmVUOWErZXVHM2ZaUG14?=
 =?utf-8?B?VWUzN0U3VkhyZW9JM3dnN2Q0cVFFUm9WOTR4eS9ORkxsWFRBMjRROGJ1UnJL?=
 =?utf-8?B?cjV5VCtjbi9WRGlaZVhiNFdQUDRWVGVWOHI3Vm1LSDZBZzJwWFl4dHNlMWxX?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebd5a85-f956-4f6a-e94d-08ddd98163af
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:19:50.7059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcCfrVl1eZtGycEcwpk7DMOKiqZujDEpUybiTGZqyN50WYrufWhiLpLNHhG0TB0PTKK76zWONU3YeVPT9dW+6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6904

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Add format RGB565 and RGB24 support.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 7495400adc22..3de9007ad122 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -348,6 +348,16 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.data_type = MIPI_CSI2_DT_YUV422_8B,
 		.width = 16,
+	},
+	/* RGB formats. */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.data_type = MIPI_CSI2_DT_RGB565,
+		.width = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+		.width = 24,
 	}
 };
 
-- 
2.34.1


