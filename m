Return-Path: <linux-media+bounces-38223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5655B0E63F
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 00:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE051165A94
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 22:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30683287257;
	Tue, 22 Jul 2025 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bdfO6i0r"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012009.outbound.protection.outlook.com [52.101.71.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D9246776
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 22:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753222494; cv=fail; b=laPYi/xzGnltD0bBrEfU+vOB9i4skJPecnsKXl2Er0qjx27cwug2arafe+aIlbtw3W8B4cfbff/EV643A0S+o2KCZFCRy2IjkNoYNpaV2qD3UpazDy0Uq00DJGCRhxuDyrX2FHgGVLix6j65sgt2QvtzbOjlBPBZNX3qi8fYSc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753222494; c=relaxed/simple;
	bh=DBm02np3bBT7fa8JVdr1zUwOoxp5zCUyBWYm9oy4slo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a/YzyqQqnuRRjDop8gZJcf2bfuuJl3jeMkSHP8xc5bu+K5lgn4XKgNgHBkCw6lwq0BotpS81zQqBCljBofatWtyXttoQGA+9UaPEWkWu5k2BeQjIb9ctnFGZkjp4A4hTdb5j2ikwnEdUZvC4Nf+cKkWHD9KPWnbz43vWFK09eJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bdfO6i0r; arc=fail smtp.client-ip=52.101.71.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sR4JAKxFeO4HsYnpOgbG7l+E2+elq3eBHbPUW8I/AwtEMrA1eW5TJpYsZpU4IDQJNFLx38OGTLvESe4YLZUTZLJ1tEwMxZbxa+ZHykt3xk6nKnPkJ+t4fUA4sBdzyDUQpgQbz4xaU9aaWIP0yCN/HqfLFoNKSjAn+YSIQSGVbdburexPXNN0czK/lhhmhSPFJCpmORmuQWvsZ5BN1Hz2LBz+pd0dER3Ewflxn2cLWC/34hCOcDQzqm8TyIu6cy2JRSWL/t32jDyHMfqqR2DiyTKtajwlnbtwr/ZRmJAoapWWQY5obt+zUUcj9w2Ue/IN+nq6oTyiKtcIIUkhhbdHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m01lLKN+wd8bSy14gc3DWwcyV9yMTfzehdj56xM3/XU=;
 b=kh/Knvt+nmQ2AoSnM+NjUw2CWEIAX4+0oVUFuiG+kCCaRJFzK7Brn07JX5nrxA2CCbsB0XbpTB4QxEpw/ZoA1oVb2aaos80CeiH5m4gEtuM+LadzhdbOwl6iPpl8dJBhEx/BMcsptrEPYWgvNwjXup+J/691TqWgyae4lKz5BU3G8O1qkfwrEklTdhog84lQ9P3dXqHgCLiY2XY7vJmFnU6GIbqMwZ1UEcTjvJX7VGWqEpoIrFk7YAguNt6wV2yBLWjEmeZNjn6oGSo06IwFnXLD+bCB+4FiPnnj9V8Z5Ckc51L4MBsSicB1EZasoksLdc98cZ1z4ajvaP8TMBGN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m01lLKN+wd8bSy14gc3DWwcyV9yMTfzehdj56xM3/XU=;
 b=bdfO6i0rGDLVhBkUJDP2h+ifcm3vxBW4jZVDACujdKwqsvHaR24tiNvxjx1YCBpAyYpcQ3ARThvbnurBqmJz9L0gykEFJM7O2NQfibaNecC96Yhd/f9vLs+qS23m/zJfp1xB3K8Bt7Fnkt6/hOGheSCTwwRVK72K042xokAodEEnA+yZcsZaDxWPqMt15KNnanTWKouXwuyoSdoa1TCZ4lkS/hc4v6C7nponYR2uPdAfm7HSh6ZxxFSarGhbuji0qQz1QXqXk8J3TgqImj+j3nlazqCXZYsAwpqdOXZcnCDvfLCvkg7b0MqbLHdIziNw7NYeBwHM8EHx/HGDSDSCcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 22:14:50 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 22:14:49 +0000
Message-ID: <ce6153ae-10fe-4160-b1d7-4b431f4d45f3@nxp.com>
Date: Wed, 23 Jul 2025 01:14:44 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 19/64] media: v4l: uapi: Add a control for color
 pattern flipping effect
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
 <20250619115836.1946016-20-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250619115836.1946016-20-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0261.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::34) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM9PR04MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a460a6-fc3b-4617-49ca-08ddc96d2cbb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SlUxeUpVcjl0MnRFZGlhcVZKNTBoNy9MVmxROE93V3ZCR1p4dFJnVTN4Nkhv?=
 =?utf-8?B?c1ZMbnNwM0wzd1hjKzZCbHJHbDFJaDAyTktZcDFRazFxUVRYeVpKNjdjdzNU?=
 =?utf-8?B?R21TNHlNRCtudWJ3RXpHNjZ3eWhmM0JPNjBOU2ZBZDJvZm0xM2ZWNjFyWkp2?=
 =?utf-8?B?SFhHbFNTSEVHdnl4RDBKRDgxc3dWWjN6N2NCckFTeGgzV1hTK2RuNW4rQUZi?=
 =?utf-8?B?aHN0UmJmcmtCU0tGR1lEM2p2ekpMVG04dkpDYk94cHdhWStqYzFyYzN6UDZZ?=
 =?utf-8?B?cC9JUitobEpVbFJzNE5VR29rV3ZFRG5reDRPNGZ4OVhzMmF0ek5COGFXb1Er?=
 =?utf-8?B?OGZWYUtqMzlQa3Z2UkRDc3VPRVRzSlZRdkd0ck9TMnM1N3ZZZHY4WTBMT3Bi?=
 =?utf-8?B?eGhwK1NWUjBDNkduQUtFUEV1b1cwYTA4QWs0WVVORm9kelZNY0EveUlieFhC?=
 =?utf-8?B?dllDcEZrSUY1Qmo2YmZhWW8xalBaemtVMEwvNXpUL0NFeTZrc28wdWVtWkFv?=
 =?utf-8?B?aWxZSlhnTDhjY3d5V2FYMGhGTGJCdUVKSVc3V2VpeGtOelo0bkhNLyt5UnpT?=
 =?utf-8?B?Y1hvdmZDVnUwalBuYkUxb05FSDhPVndEZXRsZkRKQWZ1S2h5eVk2YUpCOFZC?=
 =?utf-8?B?a3R3c1NLaEVDRGdKRXJJMDVMRDJnQ3VPZjBnQmw5ZnZ1NkVvVy9KWnJ3MmQw?=
 =?utf-8?B?T09BUFRHKy8wREtyUENyNFUxa3lSRlg1RUZkZzI2U2NNeWt4cGNqMU10anZs?=
 =?utf-8?B?WStzRG1VYmFSOEx0WGh1MDVnY0YzejFNUUtGZGsvZ283YXFtdldMeUUxNEkw?=
 =?utf-8?B?N2FDalVHMmNhSnFMc29zb2hLV0gyMlVWSzVua2t3Q1BLQWtMdFVsdXhSM0tt?=
 =?utf-8?B?OUxhT0ZKSUpUbXZwZnRkc3VJNllJNVZwaWlWN2k5VzZYaUt2eWlBcXhYWHhC?=
 =?utf-8?B?cVVzdkxWbmhySlBDOUxqWG1KMlllTWMwaTkxYUpjeXAzUXJoWUQrY0x2TkNZ?=
 =?utf-8?B?Vy9lZzFzTW1wSHc3KzhQUnpMN1lSMzFHbFJ2MSt2azM5RFFhek5HSmR6cEJv?=
 =?utf-8?B?SnVidEhLeml3bE9uQkVUYWFGb0hPaCtsWHFEem4vMWMzY3ZLSk9jUlhaTDF0?=
 =?utf-8?B?TkxPR0dIdFM0NWZUTjA4dkt1U3RjbUg5VUdyYkkzMzN6SWRtUHlJWXBHTXBa?=
 =?utf-8?B?TzJtQ1pUMFJyUUpXeUNrVDNyQ0ZmcnJRUW56bEg4cWlpaDhxcmU1VXZ1akVl?=
 =?utf-8?B?elhsYWRabDRVcXhlSTRhcE1wcG5hTUxZU201N2tHcTdhYk9PS1hHNjE1K3VG?=
 =?utf-8?B?dkFOUWU1TW1MOEhZWG1VRGZqUmkwYUJnelJnMWUrT1dCSU1qVUVZajJkby9I?=
 =?utf-8?B?d2JmVS8vR3poREhjd2pIRFBHOG1Pd284cVRZZThhNU5PcWl3TEx3ZUJ0YkJu?=
 =?utf-8?B?Tmd3SkE5cU55aFROV3I0WEVIK2dHSDF3QWJCOEUyNmU3RU1QMzYzUGlpaDVG?=
 =?utf-8?B?UUFvUmEySXN4bVJqLzhJdE1IUk5MVTRGbmo0YTVzSnhMU29pU2thOWNhZ1Vo?=
 =?utf-8?B?ZFhBRlB5SFlaM1dzL1F4LzZKaHJ0OTIzZ1JJbmM4OWY2c2JvbFJOcE9wRng5?=
 =?utf-8?B?NVdSV2RRelVlOTc0bG1DbnJIckxvNGRjM1R1Nzd2cDh5NFFSNTRIbHc3SEZs?=
 =?utf-8?B?bnVJaDB5MEpPRlRjd0ZRc2xIQ0NCQlNSNXVQSnZ1RHFjQ1VvaTV4SDcwbnNS?=
 =?utf-8?B?d2ZwVGFwUEVqNGZEaHhueHV5Rm12eU5VM3FVN3JaT3IyTWNVajZRek1ZS3lB?=
 =?utf-8?B?bHczdEJaZnhVY0lRRHQ4Mk1rNDlXZlhTd3F5aGJxT08vUzlJdGp0T1VjRlAx?=
 =?utf-8?B?eWIzdW40eDBIYTJYNHh1cUJyalNoL3J5T3hTWHJ1M0lwNUxGa25GS1I5R3RQ?=
 =?utf-8?B?N2tXZU9PNjRWRjYyc3dtMGprbldUYlQzSkNIK0FtblJCSDE1OWlQTlYwREZH?=
 =?utf-8?B?ckcrb1RzRkN3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?L09sU21LNnpuZHBycE9mbHkwOEFML0tXeFlIRTBCUjRsU3VVazlQU2Rid001?=
 =?utf-8?B?VjlzUjcyQ1Y4OGtVUHRzcmhWN1Mwd01WK2ZSVDZ0NzlNTXg1cGVCNDNlWk1U?=
 =?utf-8?B?T0V0eGRmK2x6VndHR3RyOU8rY1QzRExoWXVmaUZMM0JTWHNQTVljMCtidnla?=
 =?utf-8?B?NmhRL2pHdC94OHJTb0hMNzFMeFJtdkJtUUdseUhMREVidGFtOUUwY1B3TTdi?=
 =?utf-8?B?Zm9HdkhzVTBBbm9pRWFPZ2t5Z2MxS2dndGV4R2RsOFhJbUZBWHlQSVd0MnRT?=
 =?utf-8?B?dkF4RW53RkVNbndOYTgvRVExRjdtK1hYbnJEK04yS0tqUWNLTU1sNEpGTk5K?=
 =?utf-8?B?K1MxTTAwL1Rpb2hoc25PK2N2U2RKcUJ5R0VIVHNmeVpYdEtpQkxCTGVyazVE?=
 =?utf-8?B?dElqMitMQW4zT2djVzVSU0pPTjhTdlRncVpzb09GVTFva3poazFtMkd1VUUr?=
 =?utf-8?B?NWxKT2NHOWFLT0F1THptZHFsTUtyU2Z5dG5SdUtuelg3SG9rejBzMWYrNlVu?=
 =?utf-8?B?d2RyZmVDR0JuYVF6MDFNdEtHSVp1N3lUT1F1ZFBQaENBbHhMcEh6WHVCK1Zk?=
 =?utf-8?B?Y3ZyaVRXZ085WDFCTUFZUW9hNDA2VmNVRkNkeHd6MlJtalI1c01jNVo3R3R5?=
 =?utf-8?B?UlBJeExHMFlmblJ3NXQ1K2g1UFMzaFBicVFUc2s0bjlxYzllZDA4QUJPQUND?=
 =?utf-8?B?R1BnYnRyQ1pLcEdxNVIxREhnWXVFSGN5THRpVkQ0eWtjYmNvbkxUTnpMUVhY?=
 =?utf-8?B?RzhGUmVDRTdhMW9vZHkvWElJWGV1SE5DSnJ4blJxTUtqY2pXTjRGYmhLbTBo?=
 =?utf-8?B?c2VSUkFnKzUya05rTUJUQmtqVmNWT3o5a2dHakxNY0tJdG9sSDdSTG5KWndw?=
 =?utf-8?B?SkowYmdPVnpYemVISE1BUUJhWCtYQ1ZPNmxNR1BTU3FUUVhTTG1HWktCcnI4?=
 =?utf-8?B?d1R0Ty9YWEIrcGl3cktYdDJsTGd1Mm00eXBQNW96SjY3cjVORXNyajBUcmNt?=
 =?utf-8?B?dWhPRENxdGkzTTRUMEQ0MTZLUlcvZjZId2pIVlB2cy9CbXo0ek5uMlpRRzha?=
 =?utf-8?B?cUFTakRpN0lhdmlNUEw0azVZdUt6KzBVSTN4NWE0Tm13M2RERTVQUjYrVTZy?=
 =?utf-8?B?ZVA1SjF1K0JEVFFmY1BYRk9tRGlDcHdZU3JWOTY5RXZNczBvT1dwSmFIM0hE?=
 =?utf-8?B?SmFxQ1pJVkpyOEl2Szh4OTVpa3kyb2hrenJZZDV2d25LWjNqcElRQmhONVFq?=
 =?utf-8?B?TXJtUmd6ZG5XYmljNE82OVE4TTM2bXcxclVuSGpISk9ydXVyemg0OU05SGh4?=
 =?utf-8?B?ZmkwbkFCVnJzb0V6ZE5NSWxsL3RNdGJJVlhJRXdJcGRnMEpoOC9kL2hlWHdq?=
 =?utf-8?B?cGZNN2dGS25BclBWenNEaVR3V0dIVnZDWmNpOFdsSlA2VFRHTjRHN0pGd0px?=
 =?utf-8?B?dEc1bFIxeWRrSDdwRmZ1VjlOek1OTHVwMUc1cGpSa010NnNNc0JuN25OLzJj?=
 =?utf-8?B?L3FObEJ1MSsvTW1KWkhGRjJKa2QySlNyTElnTlhtQmljMUNMSWM2bHl6SHFK?=
 =?utf-8?B?aGkrZzNPdmNEdTFUaUFqN2dIMVN6bmEvZ2MyTUl3VlBpYk9XcWdadVJodlVZ?=
 =?utf-8?B?TWlMN0kycEsvU0tNVGlZVDhGaFV1R25laUY4SW5LUi9tZTQvN2VQcEJUT2pE?=
 =?utf-8?B?SlZ6dEdFWUdWeE9GcjhOdWRPRTdzbzlDTlJtRjlzdzNyUk5uUmdQMXUvcHNH?=
 =?utf-8?B?akYwY0VJOWZGOEhEcHNwTnVrU0NETTF4UGdkeWFEMFNQbXh4akRwVFQ0T3F5?=
 =?utf-8?B?c09JdnZ6bDZrTEV0Rm1ZRm5iTnNvNlR4YlRLdVRiOFRWYndUdUhkWTA0b24x?=
 =?utf-8?B?VHhGbWx3a2NaN2QyNDVIVEFIWkhIK3V1R3FBZEpNS3k1bTlUN3ZJdHN4K0JL?=
 =?utf-8?B?a2lNdGd4KzJHcWdHalNwTzRXdnY0Vldxd3RMYzIvbldNVWpKSXdYeWdQMnNN?=
 =?utf-8?B?SXJNK0xtRzk3REhBZHJ4enhnL3FoVG9uSWUxOTY2Yi9xVVRGRVI3OEVTTjVn?=
 =?utf-8?B?dXRJdE5YcXBoSWZpMkRBdlh0dmF4WUROWk1LeHlJVURyVWlBQWRtMDN5TElq?=
 =?utf-8?Q?cEXEEuWCKSUSgJYAN07z4Yt5h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a460a6-fc3b-4617-49ca-08ddc96d2cbb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 22:14:49.7719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dn9VHpPKpx448vZwD7IrCOssbE1oP3fLNk9tLgBnItB1DVLNr13xEs/4kyr17n61buSx01ccFd67VHnIWHaSZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8603

Hi Sakari,

On 6/19/25 14:57, Sakari Ailus wrote:
> 
> 
> Add a bitmask control (V4L2_CID_COLOR_PATTERN_FLIP) to tell whether
> flipping results in a change in the sensor's color pattern, separately
> horizontally and vertically. The information is essential for raw formats
> when using generic raw mbus codes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
>   drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  2 ++
>   include/uapi/linux/v4l2-controls.h                     |  5 +++++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index b19aaaffbce0..43a62a85afb8 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -131,3 +131,13 @@ Image Source Control IDs
>         - Raw Bayer, with alternating lines beginning with green, blue pixels and
>           red, green pixels.
>         - 3
> +
> +``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
> +    Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and

Maybe "Report whether the horizontal or vertical flipping controls..." 
sounds more like a sentence?

Also, it looks like this is also a read-only control, so it would be 
nice to mention it also in this doc.

Regards,
Mirela

> +    V4L2_CID_VFLIP) have an effect on the pixel order of the output color
> +    pattern. Macros ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> +    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` define bitmasks for both bits. If
> +    either horizontal or vertical bit is set, the readout pattern order is that
> +    of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
> +    ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> +    ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 8119012c2638..9ec65998a8f7 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1156,6 +1156,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>          case V4L2_CID_TEST_PATTERN_GREENB:      return "Green (Blue) Pixel Value";
>          case V4L2_CID_NOTIFY_GAINS:             return "Notify Gains";
>          case V4L2_CID_COLOR_PATTERN:            return "Color Pattern";
> +       case V4L2_CID_COLOR_PATTERN_FLIP:       return "Color Pattern Flip";
> 
>          /* Image processing controls */
>          /* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1484,6 +1485,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>                  *type = V4L2_CTRL_TYPE_BITMASK;
>                  break;
>          case V4L2_CID_CONFIG_MODEL:
> +       case V4L2_CID_COLOR_PATTERN_FLIP:
>                  *flags |= V4L2_CTRL_FLAG_READ_ONLY;
>                  *type = V4L2_CTRL_TYPE_BITMASK;
>                  break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 09e5d5bbe7f8..740bf8544446 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1227,6 +1227,11 @@ enum v4l2_jpeg_chroma_subsampling {
>   #define V4L2_COLOR_PATTERN_BGGR                        2U
>   #define V4L2_COLOR_PATTERN_GBRG                        3U
> 
> +#define V4L2_CID_COLOR_PATTERN_FLIP            (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
> +#define V4L2_COLOR_PATTERN_FLIP_HORIZONTAL     (1U << 0)
> +#define V4L2_COLOR_PATTERN_FLIP_VERTICAL       (1U << 1)
> +#define V4L2_COLOR_PATTERN_FLIP_BOTH \
> +       (V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
> 
>   /* Image processing controls */
> 
> --
> 2.39.5
> 


