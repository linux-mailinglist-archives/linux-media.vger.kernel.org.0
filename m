Return-Path: <linux-media+bounces-28639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9BEA6DECF
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 16:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFB6A3AE283
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 15:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D0C481DD;
	Mon, 24 Mar 2025 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YyzsTNPb"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013005.outbound.protection.outlook.com [52.101.67.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2B25E446;
	Mon, 24 Mar 2025 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742830330; cv=fail; b=Q0JgnmdevirzwOzD7unz2a7BWycPlfa/HKbyyMAFYUE5BAbzz5fSxETtSH3GhOD3qbOOLKFInxPRcxusXwFlvKWndy8hb0irKcb6/n3fDKQWb8WQXv4zHwgyjkkcmaGf/g3f13+bgi2vKwOY1jAHhJI7jx61bSXOdltNmONyoTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742830330; c=relaxed/simple;
	bh=rTIfTxuB2D/InCxdiAhunxztWJHbcCdaVLEgDtgKLoc=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RZCNYZIO7QuEU2+d6i+Iu8ZRfVzPRskC3jdyIVwjG4pel3ZADLn6Snku9gJbEPaDcCJ95ZtcHigg/9and7LH83Jo9rt7R6YR7r6vJ5Jx2EMgpYfku25SBQmMUrFvJRoISawSRX3H9m4I4BZPfRQ+72abWWUfBiMoLo+TQ6SY6SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YyzsTNPb; arc=fail smtp.client-ip=52.101.67.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7hSyZFKneY73u7CpvJe3mxO80CAkPYTJbvvPP1E6NxS9BTT840Dux8mpAUJV5uq7nh+oFzrp9wPcIaifr2StA1HZFGrZ3Eq+nsI+yet61CzW0m19zGFCI9OjVzrqcLokaHkcDLpTwsBVaXjD1JeLPbJ2GVOxdDqUtC2y9lVLehn+onQOKeWnvtRHd/3HoylXSeplNWwTwjacODluMa3FfYVM99CQbdso0ejTouzkB1yWLwLS3Y8upUnKJ319IJHulvWusa16TAxyMswcA86iB6fQP3liHRlIz4wb39UlK8OqA8Lk5l9qI0IdAPbyIawvnmYUj5EyJoTdE6U2YtaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+Pm3d2JuKTV8f0Xc7+PW/FaYCJOAk2vDSM2H7/bUBg=;
 b=JW38hRzdgJxkl5aID2kM65BHtVgXxtLlkC/l1lH72atO54klPLOx92PDiuRDeRdsyrPU8xsL++7HfuVBFw7eX26jBYhezWW63aZ6s9VsitzHAhN4p/U7NNOaPEnfPWynLV4oDW83B740MGXBnIPxxvzbKS2GoGipZmQyHreCOZiHHSMzFkWv/cq6QPNWSCG1dF/0gFqCJ5xRzS8anee6oflHfNs/arDvZdGwTF+0fsmkhswwNt9rCbG9RDyfUZ4KMqnKCrXlnHVDit6utkx4PM6pyFFvI/w+K+9XP1FvZlEspncqJV3TUcvidcFKgS3H60Tax4T49QyUw3LuDWTGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+Pm3d2JuKTV8f0Xc7+PW/FaYCJOAk2vDSM2H7/bUBg=;
 b=YyzsTNPbrQpMM40g+7aVeqGwi8VPxajDQlQyzlSfbX94vi/BFgSZZaFZoJvaTWAJoA/F0p+BNnPEBqWsv9n+DNOaYaxifm9nMc1Z5vCumh+H+lyuiZeMOuhMDiY5iuLsGUtRy1Jetk3+qPSQsIZvM4XU9UrU80iWbly2ue19wZ9GNGrbr1EU21ueniSbhmAJMJeQSVTL0OVPOk8OBxJ0nXTO1vy6OJulL73TqHsf2WRSJuPxNXSxhJqkwX60qs6JsdR+etH0KuWzdxB13MPagGpBrkt90sxRXk6xFYKjLjmh3Eh/8l26C/qCHgVskxZ7nHJN42C9HbM6CR12yVYM0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8862.eurprd04.prod.outlook.com (2603:10a6:102:20d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 15:32:04 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 15:32:04 +0000
Message-ID: <6f0168b5-6f79-470e-a8f8-bed8d2495826@nxp.com>
Date: Mon, 24 Mar 2025 17:32:01 +0200
User-Agent: Mozilla Thunderbird
From: Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor
 driver
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "bryan.odonoghue@linaro.org"
 <bryan.odonoghue@linaro.org>, Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 LnxRevLi <LnxRevLi@nxp.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "mike.rudenko@gmail.com" <mike.rudenko@gmail.com>,
 "alain.volmat@foss.st.com" <alain.volmat@foss.st.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "umang.jain@ideasonboard.com" <umang.jain@ideasonboard.com>,
 "zhi.mao@mediatek.com" <zhi.mao@mediatek.com>,
 "festevam@denx.de" <festevam@denx.de>,
 Julien Vuillaumier <julien.vuillaumier@nxp.com>,
 "devarsht@ti.com" <devarsht@ti.com>, "r-donadkar@ti.com"
 <r-donadkar@ti.com>, Oliver Brown <oliver.brown@nxp.com>
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-3-mirela.rabulea@nxp.com>
 <46eescbpdyjr3ljlhyv7fwzxksuln5s57xqgv7nim4yon57im3@22slmk45taf2>
Content-Language: en-US
In-Reply-To: <46eescbpdyjr3ljlhyv7fwzxksuln5s57xqgv7nim4yon57im3@22slmk45taf2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0103.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::20) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: b5198381-616e-44d7-0e93-08dd6ae9079a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czg2RG5iV2l6dmFVL0o5cXBtZlBHNEduZHpPQmdqQnFWR2wwUW4zcG5uSjZq?=
 =?utf-8?B?aEdqRE9iWUpqT2s4WkFzYk00US9hbGdTWEM2TnRvUXQ0YWZNd0o5cmtqRlV5?=
 =?utf-8?B?MUV4UEpPdllmbTBJbE9Mdnd5Q0pOMzhCRnlqOTNRdHVUUjVWZVRwcmdxMURV?=
 =?utf-8?B?aXRlOWloeUVuUUJrNXlDbThUa0ppaVk2Q0pJTWx0VUxCQUZIbmVrRkpzZlJB?=
 =?utf-8?B?ZS9MOEVpZjhhWE9QK2ZhWmY1VHhqQUJ5WS9wOS8zbSs4RmhxdzQ2ckE0UXJy?=
 =?utf-8?B?RDRhd3A5Rjh3a09FbVdrRVVrVzROZUJtWW8zNUdtU2FMUHdtdlFWbnI1akFj?=
 =?utf-8?B?QmJYbXdUdnl0VVZlVjBFSHJFZGNEdGZSM0hUUHEzK0tMeCtjU3gvQlBUaDZL?=
 =?utf-8?B?QXhYcGhTU2lVNS9NRFcvamx4SityejlDalVPOFRaRHZwWXp6eFRRSzlJazA3?=
 =?utf-8?B?c2hoMTFUVkxDVWcxV3o0U2wyYWZpMndNRHppcWtWT0Zmc3dCL1dnbThLRVEw?=
 =?utf-8?B?MDV5SGExdWRtUlpXRXdOc290c3dJSlEyL2FCckxIeHY3WnNMM3YvcDNnNHM4?=
 =?utf-8?B?ekFSQnh4UzVQbGxkZW9vcm82QTNoRXprNTVOdVdJRkRaYk1iQXRrNVExQW50?=
 =?utf-8?B?VjFXZXR6UHN6ckJuQXJpaDJ5ekE4Wi9Neit6UVUwSGd6Z1JUYS81Z2F3aEw4?=
 =?utf-8?B?N0M1TVE1cXZYV2pXSEQrUUxPQ0Mrb25say9pZmI3c0dWYUlBNDVVczlSRW8y?=
 =?utf-8?B?TERoVVEwUjRpakxJM1lBM1RTUG1lcGZMeW40Y1lQMlRnek93VGRCMW82aFZP?=
 =?utf-8?B?VUJ3U2FsUGkvUnRhNCsyQ1dlTThPSVlVd0hqQkQzVWlnclFBRTJJZ1pnaS90?=
 =?utf-8?B?VDFUZjFCblF6VGhIUlR1OTFvcWtIZ1JITm00K3FGRFpseWN5eGE1R2dJOFNl?=
 =?utf-8?B?SnhEODh4akttaDdpdFU0Y0xiSms3ZzRXZDRwNDVFVXo3b0xxRStqYXJNa0h4?=
 =?utf-8?B?ZkpMb1Y5a0tOL08rU3JrWitqTkdVb1ppRjhKMll1b1B5K1Q1N2pidGh0SGNi?=
 =?utf-8?B?V1I1ZGpncTNYV2oxdUZqWVVBRFoxQmNuN052aHdzaFJtZnNJT2RhRnIyUnk4?=
 =?utf-8?B?UXdJQksyV1RPTVZLZlIwaEdGN3huNE9qbURSWHlZcEcrVWVvR0ZoV2pkc200?=
 =?utf-8?B?M0R1aU9Mbnl5SFlRMmFhdU9lNm9KTUdrNFhMMWR6bnRCT1VmRENsQkQ5eTZx?=
 =?utf-8?B?UUZRdXJNVGYxMTM2VGdSSkZiK29hS3JoYWZac01DUkdVaURUTmYraWVRaVVQ?=
 =?utf-8?B?cHV3QzdsaGFCRytjNHBVN25OcnpzYTY0NlkzZXpzNU5EWFdtYi9rR2dOU0hV?=
 =?utf-8?B?ZFd0cVZRQ010bFdMdjJ3anZlUW9mV0dsQmI0NkRlL0NvRDlYakdqYnkvL2tC?=
 =?utf-8?B?by8xeWl0ZmJ5amxlYmVCdER4SllnaEgyOG1MQVg3dEpVcnh2SUNEZHZHNVM2?=
 =?utf-8?B?cjdHR0tDR1JQZVE3OUdGQ0xadDFOcGRoMFo0dDI3aHZ0YXNqc0hzOUVRSTh0?=
 =?utf-8?B?bWd3eHc1M0dXOTkzTmNyU0NqNE5PcXRrcWc0bEhUYUdZRll6L2tVZjdVU3ZV?=
 =?utf-8?B?VmJPREFtaUQzNStaNURaMkU2YnF2K2xMbUdhTkEzUTBJNG5VVHd0eHNHcVly?=
 =?utf-8?B?TVJabHdDWjJMYnpKNDJQRDNMV05EQVJZNFVnMWNlSHUwSitRSFpSUlJqRjBj?=
 =?utf-8?B?TDV2Z1FtbGRkOVc0ekVKYkUxcWRrZHpuS3hMWEVITGU0bkppb2lyaElWWC9q?=
 =?utf-8?B?YTJDcks4a2RZNTFmanN1VGdUS2h5Uk5VYml1d1owZ2c4NEdidlRlamNwVjZC?=
 =?utf-8?Q?cpFdvopmIwHWh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVJBN2duWWdUeWVDd21Lbk52RXlTd1I5S01BSXdlcVBOcWJiMHpYdkUvdWJW?=
 =?utf-8?B?L0JXRitDT1Jwcld3SHRUZjV2dUtKNzlIY0ZvQTArQ0E1YXJqdFUwOUpMZmJU?=
 =?utf-8?B?cUZvN2FUSkQ3RkxhN09KRGdXMEVucE9XdXBkbjk4MExwN1JPQml1NVYxNzBM?=
 =?utf-8?B?dzBYM1JhWnAwQmgxeFFsWmQzcDM0TTFmVWJDTlVNa0pkTkFQTmlFV25zeVV5?=
 =?utf-8?B?QUdJVDYxelVLSUtIOTFjck5jcE9yamtxVFB1M2ZUZklTVUQyZy9XODB4Rnp5?=
 =?utf-8?B?UGtsd2F1ZW5NT2JGNTZYODV3dFpsY0ZvNWYxc3NlakJlcU51eGo2VDA3dUQy?=
 =?utf-8?B?QnVLS1VkWXoxT3dYSHRueHgxVDgyNG5HbzdrMGU5bFl1Z2ZkcUxUL0I4SFhK?=
 =?utf-8?B?cWd1L3BBMTh2ZHVRNVNnZUZnVktCSThVWjNOdmcwRm9oMVM5c1F2b21CTVFz?=
 =?utf-8?B?ZnhuaGhrMDk0dkIwWmp3ejNXbld1eDBDTWRMMG4rZHlZY2w3ckgyem55M3Rj?=
 =?utf-8?B?bi90eVNyM2dCZzByemVmZW9GTkNiS1pKYzRITHV5eVpHUmxGZnA4RE4reWhD?=
 =?utf-8?B?RnF1SVFyOTJiQkEyUmppYXg1SkpTMFdrT0JpWVRtbVJyalhLc0w5VkRLWkEz?=
 =?utf-8?B?MGp1VGxqeFAwYjlxWldHZmJiTlhsRDVWaGtnMWtTOW4xYjdzRVlyWXZicm10?=
 =?utf-8?B?Q2RRVWUvWGNnMGVIMTNlOEVTM1BLWFI3WG1HNXlWLzl3VTNsQzY2Ym1NS2F1?=
 =?utf-8?B?Z0g5aUNhTitCbEo0SFNRRlgwbmlTaGtxcEZpdHRIS2p4eEFub25maDUzMk9I?=
 =?utf-8?B?MU1EOWkwSjJBU0hGdVRlZEhKSlVqaTNNSE5BNS8vSFYxbDRrUWUxMDkyVnN5?=
 =?utf-8?B?RGp5bVlXN0pCMFU3SUFoSDVoRFgrWWlESGdhUEFTVlN4NmNpYi9hL1BYRFdx?=
 =?utf-8?B?Yy9yUHVITlh2OXNrck51eGIvZzJOR3Y4VUcyd1pUcXYyWkhUYktMOFFjMU14?=
 =?utf-8?B?d1d3R1FFS3NFaGgyaHd4UENINW5adHBMQnArUm5oYythRVVjWERUaHVsZ2lJ?=
 =?utf-8?B?NVVGOTVrR0xSZHgvdEY3VEd2UWlmbVhMWXJTZzZNMU5MekpCVkdMN242YVcz?=
 =?utf-8?B?a3FRWmJwdFUvM2YwdzN3T3FnQjNRbURlUG94aHM1dFlhTjVvQjNWdi9lZEw2?=
 =?utf-8?B?S1lOelc4QlBFcmdNRElSakhrcEs4VlVvTCthRkpNaGllSWd5TWlVN0EwT0dO?=
 =?utf-8?B?NHduRGlRdU5xOHF3SDhpRFdSTk0wWU43MG1RcTZmWm84TEh1UjE4ODVHbitp?=
 =?utf-8?B?ZGpRZ0xDV1VZTzJsRGF1Q1BBUTNqaUZNZU1UR1NoZG9OUVFNRUl4UzFlU0o3?=
 =?utf-8?B?SFNKSEZBa2JLOUhNR2VQai9pU0xXeU5QNldnd1orYzdNR3NuZmF5K1d4QkZE?=
 =?utf-8?B?ZkNQc1Y0bU5HdDB2MWI0bGRlaVJ2K0ozbTdPdUhXOVQrLzNjYlg5QlQxVG51?=
 =?utf-8?B?Yi9kL2JLU1FCWVVmSUEwV1NqcHFPYWNLUzJueS91aVIzSnpxZ3ZwU3AzNStn?=
 =?utf-8?B?dXk1eW10L0RLRjVFUW8zcTc4VlZnZGI3WUcySXJRUGlScFA4UkgzL1JVMkpl?=
 =?utf-8?B?eWg2VVZDK1BFMVBVU2paaFl0MTBHWGxKT2xCc014bEpPdWljeHB6WnFtOW0r?=
 =?utf-8?B?VkVVRWZLeENWVlUra0VTWktzaUVpMnV6eTdybHYxU291aVN2bVRJSWR6dllu?=
 =?utf-8?B?bG1ORXUxRlVMSFMvUm5TckhCS1VKdjcvWk9teTNIMWUzS2RRWURjQk1Fendy?=
 =?utf-8?B?T0szVXNVQ2NyMU5NYVBTNXJ5WnBUbzFoM3JLMUR4cmdYNWU1Z0FTdXpkeFkr?=
 =?utf-8?B?WlFDL1ZId09FUlZJV0VCQUxTbk5maDRhVWlrSm4wQjk3ZGhVTzc2QkE0c2t0?=
 =?utf-8?B?bDZDb2dJdWRrQ05tWk83YlRNZVNqRk1XNFMzUGwyNDJrMzkzR3VkU1pLWVNa?=
 =?utf-8?B?YlY0OW85QjBEUWVMSCt1dThCNHFsUUZqOTZzWjJzRDV1SVdxc1JWNnlhd1Fj?=
 =?utf-8?B?OTBwTTE3cVprMjQxNEZWdXk4Sm0rQmFhRGtBYXhGNTArbzFuKzFqcFhoT2hV?=
 =?utf-8?Q?b8lU04OeH5X4vl/WEikTXDyVE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5198381-616e-44d7-0e93-08dd6ae9079a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 15:32:04.5477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0l+PyH70b9id+YmDlO43F9oaN6lMlUVQPis5FzYx6tqllZUpynGQchNY8aVtefXhOloYTp49bboRuTicZuVDKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8862

Hi Jai and all,

On 19.03.2025 13:10, Jai Luthra wrote:

    Hi Mirela,

    Thanks a lot for your patch/series.

    On Mar 05, 2025 at 11:43:57 +0200, Mirela Rabulea wrote:

        Add a v4l2subdevice  driver for theOmnivision  OX05B1S RGB-IR sensor.

        TheOmnivision  OX05B1S is a 1/2.5-Inch CMOS image sensor with an

        active array size of 2592 x 1944.

        The following features are supported for OX05B1S:

        - Manual exposure an gain control support

        -vblank/hblank  control support

        - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)

        Signed-off-by: Mirela Rabulea<mirela.rabulea@nxp.com>  <mailto:mirela.rabulea@nxp.com>

        ---

        Changes in v4:

        Switch to Y media bus codes. The CFA pattern control will be implemented when patches get merged, or maybeseparatelly  as RFC?

        Addpixel_rate  member to mode struct, remove fps member. We do not have information how to calculate the pixel rate from the PLL parameters that can be made public.

        Use register macros for the registers that are documented. User register group macros, where individual registers are not documented

        Remove someuneeded  local variableinitialisations

        Fix extra/missing spaces

        Add missing ending \n

        Use return -ENODEV & return 0 to ease reading

        Renameretval  to ret in probe for consistency

        Usedevm_mutex_init  instead ofmutex_init

        Replace moredev_err's  withdev_err_probe

        Constify  more structs

        Remove someunneded  ending commas after a terminator

        Fixsmatch  error in ox05b1s_s_ctrl: error:typename  in expression

        Fix aseeries  ofsmatch  warnings like: warning: symbol 'ovx5b_init_setting_2592x1944' was not declared. Should it be static?

        Shorten some more lines to 80 columns

        Changes in v3:

        Use helpers from v4l2-cci.h (drop ox05b1s_write_reg, ox05b1s_read_reg, ox05b1s_set_hts/vts/exp/analog_gain, ox05b1s_regmap_config)

        Don't hardcode timing registers: remove timing registersx_output_size/y_output_size  from register configuration list, add them to ox05b1s_apply_current_mode

        Remove HTS,VTS from register config list as they are written by HBLANK and VBLANK controls through __v4l2_ctrl_handler_setup

        ox05b1s register config cleaning (remove all registers that were at their default value, and more, keep only what seems mandatory to be able to stream)

        Use const for ox05b1s_supported_modes

        Device should be silent on success, usedev_dbg.

        Drop unneeded {}

        Fixed an error introduced in v2 in ox05b1s_nearest_size (set_fmt  for 4k BGGR12 mode was stuck)

        Fix an issue in ox05b1s_set_fmt, the format was saved insubdev  state only for _TRY, save it also for _ACTIVE

        Changes in v2:

        Usedev_err_probe  for missing clock, since it is now required property, and use NULL fordevm_clk_get  (no name for single clock), remove check fornon NULL  sensor->sensor_clk

        Removedev_err  message for devm_regmap_init_i2c allocation error

        Added spaces inside brackets, wrap lines to 80

        Remove some redundant initializations

        Add regulators

        Make "sizes" a pointer

        Use struct v4l2_area instead of u32[2] array

        Remove the count forsupported_modes[] andsupported_codes[], instead use sentinel element at the end

        Consequently, update ox05b1s_enum_mbus_code, ox05b1s_enum_frame_size, ox05b1s_nearest_size, ox05b1s_find_code, to not use the count

        Remove .h files for modes, however did not move this code in the driver file but added a separate c file for all supported modes

        Refactor register lists to allow multiple register arrays per mode

        Use GPL-2.0-only instead of GPL-2.0

          drivers/media/i2c/Kconfig|1 +

          drivers/media/i2c/Makefile|1 +

          drivers/media/i2c/ox05b1s/Kconfig|10 +

          drivers/media/i2c/ox05b1s/Makefile|2 +

          drivers/media/i2c/ox05b1s/ox05b1s.h|22 +

          drivers/media/i2c/ox05b1s/ox05b1s_mipi.c| 951 ++++++++++++++++++++++

          drivers/media/i2c/ox05b1s/ox05b1s_modes.c |77 ++

          7 files changed, 1064 insertions(+)

          create mode 100644 drivers/media/i2c/ox05b1s/Kconfig

          create mode 100644 drivers/media/i2c/ox05b1s/Makefile

          create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h

          create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c

          create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c

    [snip]

        diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c

        b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c

        new file mode 100644

        index 000000000000..1026216ddd5b

        --- /dev/null

        +++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c

        @@ -0,0 +1,951 @@

        +// SPDX-License-Identifier: GPL-2.0-only

        +/*

        + * A V4L2 driver forOmnivision  OX05B1S RGB-IR camera.

        + * Copyright (C) 2024, NXP

        + *

        + * Inspired from Sony imx219, imx290, imx214 and imx334 camera drivers

        + *

        + */

        +

        +#include <linux/clk.h>

        +#include <linux/pm_runtime.h>

        +#include <linux/regmap.h>

        +#include <linux/regulator/consumer.h>

        +#include <media/v4l2-cci.h>

        +#include <media/mipi-csi2.h>

        +#include <media/v4l2-ctrls.h>

        +#include <media/v4l2-device.h>

        +#include <media/v4l2-fwnode.h>

        +

        +#include "ox05b1s.h"

        +

        +#define OX05B1S_SENS_PAD_SOURCE0

        +#define OX05B1S_SENS_PADS_NUM1

        +

        +#define OX05B1S_REG_SW_STBCCI_REG8(0x0100)

        +#define OX05B1S_REG_SW_RSTCCI_REG8(0x0103)

        +#define OX05B1S_REG_CHIP_IDCCI_REG24(0x300a)

        +#define OX05B1S_REG_TIMING_HTSCCI_REG16(0x380c)

        +#define OX05B1S_REG_TIMING_VTSCCI_REG16(0x380e)

        +#define OX05B1S_REG_EXPOSURECCI_REG16(0x3501)

        +#define OX05B1S_REG_GAINCCI_REG16(0x3508)

    There is a non-trivial overlap of registers between this driver and

    ov9282.c which supports OV9281/OV9282 (1MP Mono).

    There are two otherOmnivision  sensors, OV2311 (2MP Mono) and OV2312

    (2MP 4x4 RGB-IR Bayer) with an even larger register overlap with OX05B1S

    and OS08A20. Unfortunately those two have separate downstream drivers in

    RPi and TIlinux  downstream trees respectively, and haven't yet been

    posted upstream.

Thanks for sharing this information, I was unaware. The question of how 
much similarity should two sensors share, in order to stay in the same 
driver, was also on my mind for some time, and I’d be glad to hear more 
opinions on it ;)

    It would be ideal to have a single driver for all of theseOmnivision  

    sensors, or if not, at least a common C module that can implement the

    shared functionality like gain, exposure, blanking (vts  &hts) in a

    single place, as this will make maintenance much easier.

I would need to get more information on the sensors you mentioned in 
order to issue an informed opinion. So far, with the OX05B1S and 
OS08A20, I have found some small differences regarding exposure and 
digital gain registers, so the overlap is not perfect, I expect it will 
also not be a perfect overlap with the other sensors you mentioned.

    My question here to you and the maintainers is, would it be okay to use

    this driver as a baseline to integrate all these different sensors

    together? And secondly, would you like to take a look at supporting

    ov9282, so the other driver can be dropped?

For the first question, I don't know what to say, and I cannot tell if 
we are far or close for this patch-set to be accepted. Also, I am unsure 
about how maintenance would go on a driver claiming to support a 
multitude of sensors, who could test them all, whenever something 
changes? Are you thinking to add ov2311/12 as other compatibles to this 
driver?

I agree there is a great deal of similarity shared across many raw, 
mode-based sensor drivers, and it sounds good to have some common 
framework. Some steps were done with the common raw sensor model. I 
would definitely also like to hear more expert opinions on this.

For the second question, as of now, we do not have any of the sensors 
you mentioned, unfortunately. I could help in the future to test patches 
for this driver on the sensors that we already have, but cannot make any 
promises for what I do not have, best effort if we find these sensors in 
a form factor that will work for our boards.

    Anyway thanks again for your series, hopefully this will give a good

    starting point for upstreaming OV2311 and OV2312 soon.

I would like to know more about the OV2312 (RGB-Ir) sensor and if it has 
many similarities with OX05B1S.  What hardware are you using to test 
this sensor? And what interface to connect the sensor? We are working 
with MIPI-CSI on most imx boards, and also RPI on imx93.

  Regards,

Mirela

    Thanks,

    Jai

        +#define OX05B1S_REG_X_OUTPUT_SIZECCI_REG16(0x3808)

        +#define OX05B1S_REG_Y_OUTPUT_SIZECCI_REG16(0x380a)

        +

    [snip]


