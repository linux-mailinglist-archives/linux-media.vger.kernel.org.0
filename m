Return-Path: <linux-media+bounces-27005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9C3A459CF
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 10:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CB2E3A9643
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0E3215189;
	Wed, 26 Feb 2025 09:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O8Kfd7Xr"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2078.outbound.protection.outlook.com [40.107.247.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D38C1E5B85
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561472; cv=fail; b=qhf0/5UUwGj1bNHaGGfWbdF7lnnvdn0SXLxhRJ6+XOi0m3se64R54iaXToJATJ8okvRkYP/1DZoDQ8OBUUzeiUGh/BLF0wmPs0Vxy0TgdWmn1mUVSlpMBTw0Z1DHJOvKx+BHKgYuIe16x/LLKBTWuFzZfuUc/1B1tIzq9Qc+9l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561472; c=relaxed/simple;
	bh=N/+NZgLn2Y6xHi6BCmfWpwGf+RGJdYARss3j0Y1KFmE=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U+SLKetosReI85Xi+K4cuSCDnea9J5e2bxMIb6KYco1WGgy41Vmba78QTlyj1ZLaGKUZmBz47ZKUiALYb3sBzLKxn74lJOPB7xjn58767Vnsp+/RQb+NAndgqbCkaMFT/mPrPBx3pd4lzSL6i75xGzQZ3j9g8bHRx6WjTKE0lRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O8Kfd7Xr; arc=fail smtp.client-ip=40.107.247.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flNwPKo63PM8ZJtfK+/1lJD+re/i4HRV9n4ngo+AmYlMphiAXs8jLiRoJnNhIvJ3gsMDQ9GTw0tDVnem17DLefOmQlMJdgbINEKnsJhSNSe9J9yCrteixhcqgPY423Wndc/4T7B5MdU+268RnBresSIyeONiESz1TI7/Zb162WcMrO2eZ6hGf5xNMbjmH8dYKYAvABbEj1Sk2k3g1IKahZCWaLpD5ts4T2O0cgvPBObvURnfrO37zbTALsbQxiaxVmaFy0ylkITdiQzcYjF06vjc3/Sl1UMaEBPrxf+x2xiem4ERNMDDGW5ICPZ465wmy6fVALu1uCWThfhUgeW8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkvkPLr2Q6tHLePJTt5mkBta+yoSvFLvPOdOfhKA7DQ=;
 b=tTZcGBFKiqtelu4OK7U7c8NFmfNR5a50xInQ9DMtFHivTiK3lcuXcshYeCsdxoVFadrgAFo/ILaUNA0cs5g5hFc/OZKJ8B/ENHmsAxJjZIBoZc4/XQOK2ZKkrpF9BMre1hjfxPPIQrtKHRERrZ+KDO1gFEn6HGH+1a3zrj00hU5Uwb7f7k+jgYwKMNjdGzZnkAmRqUP3yar8zRWOUoteB60GOJM1Pbbn0SlJ0LgB7c2xyBwPr8RS8WpBK85lsJJWhZz/k2ikqAdTM7OjNZ6d2BK55KVD2C7XDIb3ovP7V+UP7YosrYeLJ1OrLeObnSWH4aVUg6BuOPCehRCR0awvTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkvkPLr2Q6tHLePJTt5mkBta+yoSvFLvPOdOfhKA7DQ=;
 b=O8Kfd7XrrXMODcwpsVXWaQCB4agjU+DU6d7Cq4cNLF0uuszja/rr5TxSdpY7T8CPJapVjF4rfDWUsoOdK/GHwUuTQIHi/xl77Rxj2EQLx9Lld+McZ2LMafpNT4LIeX5fpVbXH6owGZ3EN5Lnww595KYQh6RaJlZkfMEgFWCuOc7ihm6ba0CGj5IFaJK6Z1uSVYT4EPXth2PUdfzxcZVeAs+3uxvumKpHXGudnBVr/EL0Rs9zUJne2O9NJpDyV8WxjMNE22QynT61kFf+z64bcdV1jHfDEGuaz+lh5HGVW57Z+V1uws5hFhEbiQlRH3CyRjO9Buc9KsBksw3C22bFVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DBBPR04MB7578.eurprd04.prod.outlook.com (2603:10a6:10:208::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 09:17:47 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 09:17:47 +0000
Message-ID: <dfa7f382-e537-4d91-870d-fed5d6d13060@nxp.com>
Date: Wed, 26 Feb 2025 11:17:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 04/15] media: Documentation: Add subdev configuration
 models, raw sensor model
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 Julien Vuillaumier <julien.vuillaumier@nxp.com>
Cc: hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
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
 Hans de Goede <hdegoede@redhat.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-5-sakari.ailus@linux.intel.com>
 <89f75abe-6db9-4cb7-ae51-7eeb6fc0600b@nxp.com>
Content-Language: en-US
In-Reply-To: <89f75abe-6db9-4cb7-ae51-7eeb6fc0600b@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0137.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::30) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DBBPR04MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6dce6e-b2da-4ba9-5f70-08dd56466f63
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MEpsZFFvQ0l3QXZ3aFdMTVBKWmo1YzAxL3ZpTmlQL0prSzdERWhnYVpsbysv?=
 =?utf-8?B?c1JCM2NSbVg0bjM2WEYzTmJsWHlWNlo3dXU4M3p5cWJSdXVLbHVuOEZBTHdn?=
 =?utf-8?B?bTN6am1XNzNoaVpUZmowa0RyMVZtcE9ObVdkTlk3VWxXOVYrSzM1OGRBRHc5?=
 =?utf-8?B?aDBaM1ZZV1crWkNwZ3NuQmR6MG5YeVlEWlJXWFp5SWRPbkxaVUF0clo3VGFS?=
 =?utf-8?B?M0xvY1UrSjVGWVZRNExIMXh2T2phZnNkTFluUGxNdjNQRkpMQnB6cTJiTll3?=
 =?utf-8?B?OU5wM1JNRU9QM3Fqd01Ua1lKTGptYysrcUpkVmJaSE1idGRacUZsYk1vYlFS?=
 =?utf-8?B?QVd3N1RCQmlyNVBDS0x6TGpEMThLRHRKazBiVmE0SVNwRVlUVVdjemVOWnVv?=
 =?utf-8?B?aGhkNWJsUUVUM242am5tdkJWTDVrWkVzY21KRGtiVVBYcDF3dnJZRDdpcWEx?=
 =?utf-8?B?ckhqU2d3dnd3enFaV0sraVBRSkk3MG5vTy9GMTlmaFZVN1Qrak5KSnVHZlBl?=
 =?utf-8?B?VlFPK1E1WFVzbmY1ZlNid09ldVpGL2hZb2hQczVuWUNSZlBFUUhNZ2RRT2s1?=
 =?utf-8?B?RExUdWtJUGZlVEpxYTkzYml6bE81MXhpV0Y0MEgzTEoxUG8yMlI0dnUyeEE3?=
 =?utf-8?B?MmNTamJMdVMyNG1oVW9rTk5xT29qUVQvUXJFQk45bFZ5YUUramJQb3ZCbzRp?=
 =?utf-8?B?dGRNVk5yMHJORHZ4eU9CN0xsYmpGS2dNS3Z6UUtOYWJZSGlVdE9vSmMxMi9z?=
 =?utf-8?B?Wmx3d3JCL0JPeXRDZStYMXR4R2w1R0pVS280czNiM2cwTkM1QXZVWHNWVHkz?=
 =?utf-8?B?WnhRTld4aXNNYUx1UTJOYkpkZXFXMXdFcjRpTEthSE9keHVvcDhZUkd1TTZ2?=
 =?utf-8?B?S3hiZVFPamxXV0pjcGpha2dkQVYydE5FRGlCRnJpWHpXQ1JmcGxHMzhnRW1N?=
 =?utf-8?B?TzUxc0xYUXkvV2ErUHdjZnlzOXk1M1ZhTnRhM25BcTIyMjQ0VEkwTktrb3hW?=
 =?utf-8?B?VWtDKzVWTXEwWWpZTzFNOGtVNGNPdFlmWkNUVVJpMDNMZHNlcFVEK0EreXRD?=
 =?utf-8?B?bVpBZ0ZjaDVNWkVpMWREVnJ2bUtkRU1sbmQ0c3o0Z29MOHZqRmpsaDVSZlla?=
 =?utf-8?B?SmlQazRZdE90SHJzNTdWd3NQV01SZjNYV3dpak8rM1BiM0tQV1VheFhJVkF3?=
 =?utf-8?B?Y1cra1ROQ0FkMXptSmsrTXBoT2pJTHZ2cUw4TmovZzFIUy9GT2QxUUdrS2po?=
 =?utf-8?B?bDVkYUNtcG83Y0dwZmExVmxCWm9Oem44MFhka0NLemFDNUVXVjFESUMvbEw3?=
 =?utf-8?B?U0hZcUY5cmFuNzJ0RXh0amwvNklYYTVnWWpVTGFicU93bTZZVEt3Z1h1a3o0?=
 =?utf-8?B?alRxb21UV3duREZYOGN4aElEK0xrZGJBMzRCVkZJaEpMUXhDVlkxRUFNSXBz?=
 =?utf-8?B?dGNJSFdNN2FyV0QvT0V5UGFJRUhiZk1HZVdlemRuUTB0V1VXVUtHYnJpTW5s?=
 =?utf-8?B?L21jUVR2MTFYbXA5cjZKMnBwNHVjVXJZSUZjL0V1b2JtVnZaNlcyRG05TWtO?=
 =?utf-8?B?WGk5eUdpOCt3WXVxMzFBejhYRzVsWjVzeUFpQ01STDlnMmJNanQvZG9kWURt?=
 =?utf-8?B?aDN2aXZmOXVjTi9tQUdCc3huYzJSZXBxVWorNkFISEViWmFtVlgyei9vTGp5?=
 =?utf-8?B?VUFPS1lBcDNhZW9OaVlKYyttaytqS2REOHhQVkdiTnJiVnRYTWNIcjE4UnVO?=
 =?utf-8?B?eUk0M3dEWkdnUnhMRUdRTlFoTlNua1dPTlpLbFUxcHNkWkk0VXNUWGp0bXlW?=
 =?utf-8?B?cXVJQ055THhVcjllRldaTzdvMXJaKy8zYVNuM093RGtXYmpVOFpSSGhsUm9o?=
 =?utf-8?Q?B945ha0WthXQi?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OUpyeCtMVU1xazYyT2NySVF0MmtySkNPTmlSZmptcUdTUHIzanFPendxcTJG?=
 =?utf-8?B?YU1vb1p3ODZKU3luc0RaVGUyZUxoMWJ2VGRxNFVaWkRtTjU5RTlOem9CVHpy?=
 =?utf-8?B?UnpQV1NsL1lkSWdveDdnWWFwMER2anVaeVcvQThzV005clJ6L2N3WkM2OWNF?=
 =?utf-8?B?K3FJVEk0clFpeGxCcS8wZ3BxMmkxOE5Gdjd1SkovRENJTmRReUo4c0dDNTYy?=
 =?utf-8?B?aWxkQWNXTmFhR3pPREQ0Njcvc1hVTUV3dzQyVkxSblE0VzVONFNVd2JBcUVi?=
 =?utf-8?B?L05hT0pvR0xLS0ZMak01Y0VDZFczVXI0UENnSHNLUXAzRmNtTit0VjgvOFEz?=
 =?utf-8?B?Q3B0QkkyWG9Da09zbG14bks0S3VVR1FHZTVLd0YyNCt4UlpVTE9SbVhQZERU?=
 =?utf-8?B?bHZoN2ZKVmxlKzRUTG5YQWpualNiMk94V2MxMFJpeTRaeEVZWlhHK2VqNGQr?=
 =?utf-8?B?ZURTd2lCdkVVWUk3a1VRRWhpa1c2SFI4dGhjMU1laENjeG5SZ25EMk9aMUI2?=
 =?utf-8?B?a1ZDNjNVaS9SWEgxTzFqY1cyeFJqN2dkL2hrdG1GRXNGU2h0N0FXYnZEVWpp?=
 =?utf-8?B?a1U2UU81YWF2emxRWXZIaEp4eWJxbnNXTXloSW83NElOSHZPdzY0VHlXTVkx?=
 =?utf-8?B?eHllOFpNSll4Q0wvMEJZVWRMYUZVMjNHZ3RYTFE1RkFGRFNRTktReUVhRzU4?=
 =?utf-8?B?V0JrUUFZWlNicEpJWnd2d3VkUHJZenNPVFZ4Y0FuL2syRXlpYmNwNThoVW9O?=
 =?utf-8?B?SGNxcTBPeVdtWm8yNGZBdDNvTWkvYll0YitxUVJaQzVMQS9MalU2OStzLzAv?=
 =?utf-8?B?cXVtMUl3YXJvZXgzWjVld3Z2dGxDR3A0RUJTVVpWRDdEUVpIS3Z0TkZyeFNy?=
 =?utf-8?B?V25JSkpFdHhBcWtwd1NTT2ZNMWFHN1F4Y0ZOM2x0RlQrWTJNU09yWmxYZWgz?=
 =?utf-8?B?bnNUdEdRVE05aWtLTDc0eWhOVldLWjhHVktyNDNEZkNDeG1acXd2NGlXVzVr?=
 =?utf-8?B?czd4ZTRFK21taGlkdmI2RkhOb1YwQzNxVGxZVTNBaXVuMXI5S0R0UFlFeUNK?=
 =?utf-8?B?K3BvdWRzcUNkcVNSS05xU044WGhUWW1sUjYwWVFIKzAxQWZ0UEJJWnk1Q25q?=
 =?utf-8?B?NVBBcDNrRm9reDI3Z2gyUUlHZzN6ZHVUM0VkMWFwYi9tWHlRb09FUk1OWlRE?=
 =?utf-8?B?MWJJV2ZnYkltRER0OWdDZVZkeU80RVM1cWVHV3FRa0tQSDd2U2FhWVJaN3Zt?=
 =?utf-8?B?c3UvNkd0VzBRNkdjUTY0VnFUbmdSd1hwZndQRlRHeE1rS0E4RWRrTEpMbS9K?=
 =?utf-8?B?elVjbnlvUlJkd2ZWRnRLd0RpbGFWUUJ2czZNaVBiNkt1c2JCSmJZcGlETU5W?=
 =?utf-8?B?dG5pT2wzZ3VORE5ZcS80V3Z1N0RDR1FNaERTRUdZaVdmOEdzMlBOL0hKa0RZ?=
 =?utf-8?B?aUdQUWhkWWpadHBOb1NIdDd3YW1PQmtxMlExcUNqK3VGbWhzK2JRcDNNM1V5?=
 =?utf-8?B?elZ0TVFXaUlQdTNiTGhSNDg3cVE4Q0pJZCtTVW9QWmpvU2U5c2EwOTIzbVZ6?=
 =?utf-8?B?L0t1WHhyMnIyZ3ltcXJ0L1E2Z2JEYnZkdFBiTDFxQXBEcWZnYi9qR3RBTTV2?=
 =?utf-8?B?djVrbHpLTTdpUHFUcUhKMTR1UWh3cys2NU5Rd3h5UTdKbm1vaEltcWRtRFFD?=
 =?utf-8?B?Z3Q4MEZCUENpZUc0ZThPdkVLMVhRVVdLSXJGOUJ1eDJZTFJ2Mk1KMUdiL2Ux?=
 =?utf-8?B?MStIbHJrV2dVcUlOcFJOYUNlTDlyaU52NFlwZ0ZLc0drVXIzMnVpeXhsaG95?=
 =?utf-8?B?Slh4RXFsdWVmNnlEcWhtdEpxODcxOUZTZytGd3pQVDdIVFNaM2ZYQzhjTGEx?=
 =?utf-8?B?cFR4MGpHQk5MSFhoVU1QOEZ4WitPRElxd1FOZ3ROOXRKT0xIVmFXQU11MElD?=
 =?utf-8?B?TEVSQmxGNFdiV3RGYjZNb2h3cmIwQ0k2eS8xSGd5aDVqRGs5T2RON0thcmh5?=
 =?utf-8?B?THBuQ3lVQmNZWXNmbWEwRmoybGtmaDBCY1hyaEpmWWdreUZFWlFTWjhJRjRS?=
 =?utf-8?B?SEN0eThaemJEaC9JckE2Y20vRS9KbzZpM29lc29vWDVrUi9SZ1VIY2lPSGNi?=
 =?utf-8?B?SlAwUWFFWjJpU2tyMERYY01mRlJZOVM4dU4vZ3pHSWZBZzY0YWdNa0VzMnVx?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6dce6e-b2da-4ba9-5f70-08dd56466f63
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 09:17:47.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzV/2wfXLZHKOyJz4jkC+yx5nKTavr4ZJfDpjefKtSGZSUODjWxLmnEznw1W9CpjEbOVbNKlFPRNfhV6XS1LmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7578

Hi Sakari,

On 09.02.2025 17:42, Mirela Rabulea wrote:
> Hi Sakari,
>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>
> Regards,
>
> Mirela
>
> On 03.02.2025 10:58, Sakari Ailus wrote:
>> Sub-device configuration models define what V4L2 API elements are
>> available on a compliant sub-device and how do they behave.
>>
>> The patch also adds a model for common raw sensors.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   .../media/drivers/camera-sensor.rst           |   4 +
>>   .../media/v4l/common-raw-sensor.dia           | 441 ++++++++++++++++++
>>   .../media/v4l/common-raw-sensor.svg           | 134 ++++++
>>   .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
>>   .../media/v4l/subdev-config-model.rst         | 209 +++++++++
>>   5 files changed, 790 insertions(+)
>>   create mode 100644 
>> Documentation/userspace-api/media/v4l/common-raw-sensor.dia
>>   create mode 100644 
>> Documentation/userspace-api/media/v4l/common-raw-sensor.svg
>>   create mode 100644 
>> Documentation/userspace-api/media/v4l/subdev-config-model.rst
>>
>> ...

>> +
>> +Common raw camera sensor model
>> +------------------------------
>> +
>> +The common raw camera sensor model defines a set of enumeration and
>> +configuration interfaces (formats, selections etc.) that cover the 
>> vast majority
>> +of functionality of raw camera sensors. Not all of the interfaces are
>> +necessarily offered by all drivers.
>> +
>> +A sub-device complies with the common raw sensor model if the
>> +``V4L2_CONFIG_MODEL_COMMON_RAW`` bit is set in the 
>> ``V4L2_CID_CONFIG_MODEL``
>> +control of the sub-device.
>> +
>> +The common raw camera sensor model is aligned with
>> +:ref:`media_using_camera_sensor_drivers`. Please refer to that 
>> regarding aspects
>> +not specified here.
>> +
>> +Each camera sensor implementing the common raw sensor model exposes 
>> a single
>> +V4L2 sub-device. The sub-device contains a single source pad (0) and 
>> two or more
>> +internal pads: an image data internal pad (1) and optionally an 
>> embedded data
>> +pad (2). Additionally, further internal pads may be supported for other
>> +features, in which case they are documented separately for the given 
>> device.

One more question here, to be sure I understand correctly. So, in order 
to be compliant with the common raw camera sensor model, in case a raw 
sensor will need more than 2 internal pads, the expectation is to keep 
image on pad 0, edata on pad 1, and add more needed pads? Or is it 
acceptable that a driver completely changes the pad numbering according 
to it's needs, as long as it is documented?

The case I am targeting is os08a20 hdr sensor, with: pad1-image long 
exposure, pad2-edata, pad3-image short exposure. So far, so good, I guess.

I don't know if there will be such a case for a sensor driver which does 
not support embedded data, but will need to support other internal pads, 
and in such a case, how should pad numbering look like?


Thanks,

Mirela


