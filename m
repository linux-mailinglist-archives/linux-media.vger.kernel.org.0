Return-Path: <linux-media+bounces-25851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A45A2DF97
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 18:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26C443A6289
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 17:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3B41E0DB0;
	Sun,  9 Feb 2025 17:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fjIteTWG"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63AA1F95E
	for <linux-media@vger.kernel.org>; Sun,  9 Feb 2025 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739123316; cv=fail; b=eYsy5WRrrtFe5ijPOq5KKMHY5AuQUdli9vgyGTMt+oxqD9MFwYSTIVGAhI4N58uZrZohKUXt5texlD/byhn/R326MU1tUg/CnMS2nHVE8wvTe0yDGR9tKNFxqUu692uhb/NQgmhhHn5TDEW9n8uOf21bmwt3mUColqqOKp+BkyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739123316; c=relaxed/simple;
	bh=ciC4o1eMaLmvrYbb9LROEsqZHyjZ7ybLwmjSXhpMKmU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J1hJ1fCQ3WTnuAef4ZZng1pks95xvVwRCg63wwHHyuVmN55oBlOF1SOg0qzCiZsNcqLMWOFF0uUMMAoJzOe5LrJ+TnTaC5tSJ6m85ERVXPCBNs+yAcZKTXPh06iN+3io0q5+vO6PUkvAy0aGsdpmwhLiqxYgv7PVcBwdkt653lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fjIteTWG; arc=fail smtp.client-ip=40.107.22.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKOZW/f0JxpymsKBql95cSfhdMxlM4JV1qPq5CFEr3D6b2iiweySP1zp7/XObnr49byCpbyPQkNsrSeJipTogt1FyPuL4VyteSDLh30gdrKJgZeBN9JJdCzTwIdk+VotTbJlm+mLt2jocvJ1CYFt3+QnVGzCMyMZyqvixRxRs8MqhC0zZQiTaj0bWQgKxsrMC6mrhB+0WkIls4Yi4kG2nkRqIeIpdYAnf+STGkTJ4yO8rb7HlMsj5paCBR/D68J8/EQt98he0VgIh7/cRiCOcXg5mMybkadqlbhYUtUBUSItZN1I2GBvMfsjIDAJx05wNSq0QkEmwgpFNoLRVug6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZI8/Uwu/t7MXQIea6xPuXx+86ZvmNQ9SgidLINGLRjs=;
 b=GJPht7ndink+B9cBmOGgzEixuv+GB+ctEzEcy8HhjZUXrpVSBinV5XMWphfiuwNsKQWZIyPesCNu8fWf+9JhbevgLXEFBvDSDoJo1fScSrZJwwBdjC2uDMnzEeJKWJfn5ABQa2uitbArBazWKjy2jKBuYb7an2r0DF3c11VH+UrW2+X998w/JxNceyDSYIM2k/QUqDaULPwEtsMRnqDKcrDV4sz3ogV54ffObjWj9hxueXwPJ6hnkvPWayZBQKxSVBmlW6i9ozzlvJOxqSX1GepJ+40fmaZpNa1hfB/Rg6qCkQhB8LoBYj2+jKq2vPqK0tcms6NuYmbOAMLephyUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZI8/Uwu/t7MXQIea6xPuXx+86ZvmNQ9SgidLINGLRjs=;
 b=fjIteTWGZk4PHOGYEU5XXLhSUkNcrhheB4VffwwVyqhPRDM7GyXSQT7bl6KaAPOah94VRtVnhy2v98czT4qM2/W5TdlW2KyOKGqr4n0FEjom+qkTxgXLguCf+Bow/5OidQZIfTZLURNpyZsO++tSIMgY20sfi5ZS597+GoxTTP19i5Er6K7YX0tjD/ALTxlxrZJpfR3OgZ5dYK2k4lRIWZUgbDHOOhNQvjVWsONOzItQpJ9IKDJhFiG6tq9okrQh+rd1AqbT9lYHoIkvJY0IL3TMOSsNqJnwGPhfvjSml/NShimGBNpKna8TkwoejJmLL9mCHUW1zEO8pXTSE6eS1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM9PR04MB8842.eurprd04.prod.outlook.com (2603:10a6:20b:409::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sun, 9 Feb
 2025 17:48:31 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8422.012; Sun, 9 Feb 2025
 17:48:31 +0000
Message-ID: <d70aa0d1-9453-42ef-bede-debdad504dc8@nxp.com>
Date: Sun, 9 Feb 2025 19:48:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] [RFC v5 11/15] media: Documentation: Document luma-only
 mbus codes and CFA for cameras
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
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
 <20250203085853.1361401-12-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250203085853.1361401-12-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::14) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM9PR04MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c481203-2dd1-4fd7-3a97-08dd4931f753
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TGE0dWNqZGJEZkJBRk1qL1VIQ3FUbXJ2Q0JKMkdOL0RZczE0MUJTUWZDNlZv?=
 =?utf-8?B?bk9YTkR5SUFzeFl1M2RkaEpLN2JOVVE4bks1eHNvb0xpNjJtWkpIN1FmdUc5?=
 =?utf-8?B?S2lPdnp5RTVaRmpma3RDOFdEbVB5czdkSitReGR6SDhUeGU1dGhDS0FMV2Ex?=
 =?utf-8?B?eTYxdEYxT2o2QWZQK0ZieXBmTmVIUGFSU09PaHNxb1JYaEh5Tk9pcWltNnlr?=
 =?utf-8?B?cHFsN1AydnpuYjUwamJSS1RKdDdBcy85dyszRlQ3ajQya2Y2K1dUenpRK0Zw?=
 =?utf-8?B?ekVINCs3VEVxM2F6bGxzb2IzNmFEK0RyY1Jqd29iQUhMVWVTdEwzVWZadHdT?=
 =?utf-8?B?OHBOaXJkTXNJaGJ2UUVBOHRNTGRPNHhaY1NldDI1Ukh1V0VoNG5SQndNUisv?=
 =?utf-8?B?cUN0R3NORldYVnpWTU1TekFraEUrNjRpQ2d5NnZnVGNMMG9XRjc4Q0NsSXV4?=
 =?utf-8?B?YjFsSUtGYVFPWTVlcmd4OTdhR3hMQmpUR1IvVm9tQ3Y3aXZLcmhpRFpBcFNS?=
 =?utf-8?B?MG51cms5WHMvTEg0eWsxc2hJMEE1bzBYZHl4N3MxOEdtK0wzWUYwbEtLbVNE?=
 =?utf-8?B?aTU1cG54Szk3U1JxejBOMkJlUlJJcUgwditpRGJTRHIwRzBqRWlwQkRFL2dT?=
 =?utf-8?B?UXFjSWR4L2pBMU5LTlBCYy9oNDFGbmRQYW1HSUpQOElnVkVwZ2piQ2ZLQzN2?=
 =?utf-8?B?ZE1YVS95Y1dHY0ltZDd2a2E4bkhLSXlUeDFXZUd1RVhyNHFDUXAvaDArbmxt?=
 =?utf-8?B?dkNaWklnQTdSWnh5elZ1MlFhZ2VCQnBxL0lFOUxCeWlnV3hxS29QQTc0K2ZV?=
 =?utf-8?B?bW1KM1NDd0lXVkJYZSttKzloa0tzWFFBL2o2VWF1UzZUZWRGR1pENjhUZ20r?=
 =?utf-8?B?dmdvZWhhejF2TTUzRXV2UjdTcFl0ZmlFM1FGblZFUVZWelYycU1OQkJPOTNI?=
 =?utf-8?B?U28vNncvVlJIZHB0cjZRMGhXMEVmRHJsbjRUMmlFSitRK3NmUWZ1UTM0TVdF?=
 =?utf-8?B?NjlianNKU0tkSlRsSlduMmYwSlZGbWExZUE4NHdBN3EzK2cxalh4SldvUGh0?=
 =?utf-8?B?V2tMdFNPOENja3JxRHUvaXlxZWp2MVdOaGdLV09kM0NMTFhoTmhicXY0MzFs?=
 =?utf-8?B?QklvNVFCYXR6YTdweWdPMXp0Ulo3ZHE3OUErR0gwMFBQMU5ZU0JYZmFmK0VB?=
 =?utf-8?B?RkRQMWtaMDFNakNSd2FwRWZwUWErOVR3cVdCcHA1dzhsazNScHZUZXFUaUVj?=
 =?utf-8?B?Y0ZjaVBqaGlOb05EWUxyVjdYeEJwalBUVTRGZjBoaFU1RlVFQ0Z3dnRLSjQ2?=
 =?utf-8?B?K3lXaElFR3BoLzNSNWJMR290R2J4THpPcGNqa3FzTHNnS3YydUxoNDFWYXlV?=
 =?utf-8?B?ekRlaWo1VTdGZFo0dElnTW1XWUsxQ0xuWS8vMFZFNmxtTTdQUkd5NUR2cEVt?=
 =?utf-8?B?b09tV0gvNURkdkJtbmhUNDg2cnNJRFhNMThDMU1XdEwxdytrVitMVUlzNHhQ?=
 =?utf-8?B?MnJianordE1HRk9yVW5LeHBMcmUzZzFVOVR0RXpqN0NaUVFmY2Uyb3RDTmNW?=
 =?utf-8?B?QlNRcVJYZXRZUWx2QXg2STBxT0NBUDNOVHVua3hZWWRTSWRjUm9ucUVyd01P?=
 =?utf-8?B?ZjlnRHlhZmxvSC82N2VIblRjZTFUeFo4bzNRdG5PRXdLQVlETjJrSHdlcTEz?=
 =?utf-8?B?ZG01cEUzMmxaMDZsNk9aVXlyRGp2YW5xSGV6WGo0UTU2Vi9sMlU0eUF2WEp5?=
 =?utf-8?B?blRWSmlaTWd6NUtkcTFHaDhCNkZmZDZEUDZERlBXNWNKVlE3Ly9NR1RLbnJX?=
 =?utf-8?B?ZkplY0ZnUkpOZGlLTXR5TjIzMHZLYU9sTC9zT3AyTE9SR1MvTUpGbkJzcnEz?=
 =?utf-8?Q?YJM9tkeFhRnuz?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Wmh5RjdUWmtOUk9BMzFPNjdqQno5VWtULzRDbXFhcGZvcE9BclFmUHFScjAy?=
 =?utf-8?B?Q0FmZHgyeHpQSGJ2YWpGM2JjdlUvRDEybUloL0VWaDhibEY5UVNyaVl3WThO?=
 =?utf-8?B?U3JzNy9seXVQV2wvN3cyZkxmSnNFTXhIdy82NDIxU2NLLzVoUnd1dUN5dTlD?=
 =?utf-8?B?cW1UcEZxVVU1b3hNYXRKenVtSjF1MmVDTUw1eFBSUHgwWDdWQWRVV09CYklK?=
 =?utf-8?B?LzZxTzNLaWo1cEl4SEp1bXNSODgvVmpRQlRQSXBoS3d6aTNWV1YzcUE5WnM5?=
 =?utf-8?B?M09JeWFtMW9LOHdZbVBpMS9PYm14MFpGc2ordkorbFoxYWVHZ3lTVngzSTVC?=
 =?utf-8?B?T0ZpWDJYZmNrbkE2ZkZ4SGZ6dFJFYlFVN2sybGdJb1FoMzUwSHIwY3RianF4?=
 =?utf-8?B?VHAzVnJxTFBuSVFidVJMZmdVYTB5eVFLSlROcWY2VDBFSjhZcHRTK0Jkcnh6?=
 =?utf-8?B?MjBsNDhkYVhjckFKN0R0TncyNEthWGRqa2UzUEFXUDNHNTZLeHlieGpZcHYr?=
 =?utf-8?B?cDNzMG91aVh5MmV6V3dkWXpWS3pzQ0VwVzZtSTRjS3JsQy9vQWsvVkdFZWdI?=
 =?utf-8?B?VXF6YWFUOWozbEYxekdqZm5OV0N5dXZPUlFNdlFYcUp0aTRmbDBoekc0MzQ2?=
 =?utf-8?B?b1NqMTVxTmVIS2dmaEZHTzVZV3ZiS2FpWW82V09ORUdzYWRwVmZGZWUvMFdO?=
 =?utf-8?B?Q0VlUGxyb2FGNktrOENYRGhTUXJVWmtPdXVENWVVYlNmL3oyUk9rYWNkWkVE?=
 =?utf-8?B?WkpzVEJiZHVzNWl1LytsOXRYMTR2aVRvK3MxN0hxaFpCNEJaRDJXdlpNZWFZ?=
 =?utf-8?B?ZXE3VWpna3dZam9ZS0xMYzJVbnA1VTZCVy9SNmlpT2NiQnJaTU51L0ZEYUtS?=
 =?utf-8?B?V0l3Q2t0RGxLV2VMY3J3aEE0OExubnd1aHRocDFlV3FGUzNnRTN5b0RZVXJs?=
 =?utf-8?B?MzBSRDY0UWZsNk1IOU9neEFXR0lqNHdKRGQ2YlZhN3lDZ1M0azBoZTVIZ2NQ?=
 =?utf-8?B?YklmRUcwbkFuWE9mTmlGNVZvdkhDbWd0Y090cW9qRlNYelhqbFJreDlrRFkw?=
 =?utf-8?B?ZldaZjNrNGd4WXBrelBoTU1DdjlEK3RDZm5ZYXdCSHJmUjJ6RFJaVFpYYUZw?=
 =?utf-8?B?OVR6RHVTMGs0enBPeWhMQWtGc3l4MEZhUjQ3RmdkR0NGRlJ0K3U4M0tLS1Vm?=
 =?utf-8?B?bm9oZVoyanVOYUllYnVIem5EaWZyUStrY2F3WlV2OW1jcEwrNTM5QzdSSWZC?=
 =?utf-8?B?V2pZR1RIZ2cwTzZIbVB0N0JrOFBpc3BkT1MySkFyZjFrNnozbWhJRFRUbWxP?=
 =?utf-8?B?NERTVHA2eEN1Q3l1Rk9ITjNiWDJtUGR2cnBZRTNvVEd0dkpBV0t0RDl1S0s3?=
 =?utf-8?B?Rzc0YXBrb3ZGWWtzelBvbTJhMnE2cDJtTWVJbFBoSTB0bGxlUHBDM0c0TFVN?=
 =?utf-8?B?alFNUWk0cHQwL0RLWUNQUTMwSUtBbWJDZUNVZ1NaTHlXVTBrb0pCSmQ3bFBo?=
 =?utf-8?B?Sjl5aklkRDhpcFVycE9kSnFxV0Y5Qk44NXRmVHBQeE5Hbnh2c0oyeDlqbEJi?=
 =?utf-8?B?OHdNZG5JV1B0NUIxWFArclN1MlliWGNXN0ZxK3pjVk9veE9Nc2F2SFIxVmd1?=
 =?utf-8?B?eDlHNXllSEs5c2NTUTlVWURBZHp6Z05UZXBBNVlUeWZldlpsWjZsYmVQTmFV?=
 =?utf-8?B?ckZkSnBhazlMcUc4TzF0QU11T0lQNkpUK0V2TDNtR2lyeXk2SEI4a21IaVBE?=
 =?utf-8?B?d3dBZEVrN3JmWXBuWnYzb2k1cGlpR08xZUZnTW9wd1IybTRtaUdyOW5jdmx4?=
 =?utf-8?B?RmN1TEpKRHZDdWlqVVp2VjJVbzVQbCtvRCthck1VL2txeVhWeVRnaUd5OVFY?=
 =?utf-8?B?ZEZmNW8xUGtJNEZqOUZuOGRITDBGZXFyMGY5Yk5kdDFXUDRHU0dpVHVLZU8z?=
 =?utf-8?B?bENtYUdkOFQvaWZpSnpKM1RNSEtnSUFVaGppeC9SMkZrMlNuUk5OUC9XQ3Vo?=
 =?utf-8?B?TXRub2lqeTlwSjFjTFVYVVpkRU80YUVGZW5tMytLMFBJR3AvUkJIZlRHekpo?=
 =?utf-8?B?VzJpUkRpVDFlNVhJeUM2V29hdHJ0RWhpVGNrc3FCWjRteHlsRXlDVjZzYzVk?=
 =?utf-8?Q?12sg0pN8tWA9XmcFUbrNMEyn/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c481203-2dd1-4fd7-3a97-08dd4931f753
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 17:48:30.9335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnQ2SzbKtr6iSPdP0Xk8NBZfCJVb9U9cfgPTvHn2q71yuJYvV85oM/Pj6ykndv07yxJ6OBkwUdUPPNSLRkoKYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8842

Hi Sakari,

On 03.02.2025 10:58, Sakari Ailus wrote:
> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
>
>
> Document the use of luma-only mbus codes for camera sensors and how the
> V4L2_CID_COLOUR_PATTERN and V4L2_CID_COLOUR_PATTERN_FLIP controls are used
> to convey the colour filter array pattern on UAPI.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
>   .../media/v4l/ext-ctrls-image-source.rst            |  4 ++++
>   2 files changed, 17 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 5bc4c79d230c..91e5305458b9 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -41,6 +41,19 @@ format set on a source pad at the end of the device's internal pipeline.
>
>   Most sensor drivers are implemented this way.
>
> +V4L2_CID_COLOUR_PATTERN, luma-only mbus formats, flipping and cropping
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +For raw image data originating from camera sensors, :ref:`luma-only mbus codes
> +MEDIA_BUS_FMT_Yx_1Xx (where 'x' is the bit depth) <v4l2-mbus-pixelcode-yuv8>`
> +are used as Colour Filter Array (CFA) agnostic raw formats. The
> +``V4L2_CID_COLOUR_PATTERN <image-source-control-colour-pattern>`` control in the
> +same sub-device defines the native colour pattern of the device. Flipping may
> +further affect the readout pattern as indicated by the
> +``V4L2_CID_COLOUR_PATTERN_FLIP <image-source-control-colour-pattern-flip>``
> +control. Further on, cropping also has an effect on the pattern if cropped
> +amount is not divisible by the size of the pattern, horizontally and vertically.
> +

Ok, so it is clear now, the V4L2_CID_COLOUR_PATTERN stands for the 
"native colour pattern", as opposed to the "readout pattern". It is good 
to make the distinction.

Maybe the V4L2_CID_COLOUR_PATTERN control description in patch #7 could 
also be made more clear with regards to native vs readout pattern?

"This control determines the colour components and pixel order in the 
sensor's CFA (Colour Filter Array)..." => "This control reports the 
colour components and native pixel order in the sensor's CFA (Colour 
Filter Array)..." ?

Thanks,

Mirela

>   Frame interval configuration
>   ----------------------------
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index ecfa38c118e3..4b98a740236a 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -93,6 +93,8 @@ Image Source Control IDs
>       is reported as being (say) 128, then a value of 192 would represent
>       a gain of exactly 1.5.
>
> +.. _image-source-control-colour-pattern:
> +
>   ``V4L2_CID_COLOUR_PATTERN (integer)``
>       This control determines the colour components and pixel order in the
>       sensor's CFA (Colour Filter Array) when used in conjunction with
> @@ -103,6 +105,8 @@ Image Source Control IDs
>
>       This is a read-only control.
>
> +.. _image-source-control-colour-pattern-flip:
> +
>   ``V4L2_CID_COLOUR_PATTERN_FLIP (bitmask)``
>       Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
>       V4L2_CID_VFLIP) have an effect on the pixel order of the output colour
> --
> 2.39.5
>

