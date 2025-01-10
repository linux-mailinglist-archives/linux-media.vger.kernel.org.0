Return-Path: <linux-media+bounces-24565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D5A0854B
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 03:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 417B23A74D4
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 02:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D0B1E103B;
	Fri, 10 Jan 2025 02:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b7c9dRfh"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299223FB31;
	Fri, 10 Jan 2025 02:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736475920; cv=fail; b=bhdutUBY1Jahu27USpl50Mz45JIIbkZwOTMO5vK1Q17k7sFitLl+gi2oF7WewhhwcQq+HMiqC6iBoFRAvVzcLw9YM9ubp6a9iTOxa5eBYU9UpMcaoEJLI3eCdf7+gKGqvV9LbXDq5Rkjq45oVzQdOBjmti0Xf9acoV7uQKxqO4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736475920; c=relaxed/simple;
	bh=c9JBVzt3EfM8Jct6t5V+d3rfUXWS/pCH7epy6nbIv6U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hodEQ4XpZptIP84U1XSoZ3hRn4UZOYpgQPRVSG7E5Q7XkC1jOu5c5YqukEYAVcrIuDXktLxjCbsU0sB8kbRlFF2dCD2XG7qbh04An3Ds3LZTwfojpOXMddmTaF9BqT1IZFTZqR57iArVGw2uOgDUsNKjgkbn8Obu4Rg3cwhV7RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b7c9dRfh; arc=fail smtp.client-ip=40.107.22.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTHuW5c5GM2s58k/q0sUA7JDgvdK+GFjKP2scR4OQTbh23g/aljuCPxnHoouB/F0ZHN0imumn/O9rDxdj1D9W79cjILIlEXzZ5KZFhsoY4Cr6JzlE0hwTIROeu8brBhM3W70RsJchGJJko/DZqQqKPToYkxhN82bxPKKNhE/RCV/uLJog5i6qTBqTZnLhyMjk/YgYuBXODyNramqnIXEaNMbEinicjcDeJtMbORbRVe42WixRq7CQRmDYdp8UwDLpGE/Mys4pcpwYc2FUR3krNeD0GQEgARZYqJHEozbEC8zozvatYZveyJe7M1Vi/V/KCsKTAok4Q8y5b6Vlk4+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IwgAwzjR6D4MYF8zB1C5w9zUGdzGRCQqw+TGjqlxLM=;
 b=asUyLjtJMTcCUMc5VVypGWfS5D8OJtfvFjc7NsX76wVgeVV9+BHrlpJKYDilAf/5TvurDHA/QSprSyDvqoFMcpgWtFZZguOCHK/NvYBaSsmRKXpc/fjiSDepq7rDYMmNFphHc22ktoqEhDsxvOn3lOhoVypIJEXxzt+aG1C/j2zx1eCQqkPNaYy58j4SC5J7Of4dD3nZS5qPQMRrrGZ2oTY2WrmS+VJPzCzAL7vPLSsvue6JW/+crht3rTUACk+rcceRAPZic9dE+HVRj6g/czdr2LbpPDVBovWHFZoXVu81jEAUlMC6qM+++Jd9aagDFTYUWa246VW5lbFHwY7tQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IwgAwzjR6D4MYF8zB1C5w9zUGdzGRCQqw+TGjqlxLM=;
 b=b7c9dRfhjYt5XKp7RJvhlz7nSSZAycuzklFpgUjLv7rxJ8udZ1UoTImauO0qAsZxXHoD06vOeIkx5hzM2FWtJ63XGgv4nJRb4Nv+cOC82uDzZ5crH6e4LJr8kQMRKh92V4u7V0xG7WU97/eKHlWCBYm5oheYVzG8FbIbx+s9zr8Zp5QLMrM2AdxSx8cm22BgkTYxMuYlt7zohbv2pesr7TcL4EKJ7A2jNYNU7cewfLYAZecwOApF5NpzLxhcxDhJU2oYZ57gTbmHGwXLyvg5uKyn/jbuviZ4lSQR/4d3u7yxyn8bMtFYTjzrDbltyeDGayVxGDHJ7m1Je4R2gVO+8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM7PR04MB6872.eurprd04.prod.outlook.com (2603:10a6:20b:106::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 02:25:14 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 02:25:13 +0000
Message-ID: <008e32de-d0ac-4835-9024-c59fddc320de@oss.nxp.com>
Date: Fri, 10 Jan 2025 10:25:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: docs: dev-decoder: Trigger dynamic source change
 for colorspace
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250107053622.1287461-1-ming.qian@oss.nxp.com>
 <dcae7fbb810ebfa6e539c3b45c20e1d659600d80.camel@ndufresne.ca>
 <1c1bb1b3-7e58-4a49-83bb-2c560cd66858@oss.nxp.com>
 <bed10b8bcd85b4c03737107ac0aea1375d18a50e.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <bed10b8bcd85b4c03737107ac0aea1375d18a50e.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM7PR04MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aca39bd-c8b7-45e9-21e0-08dd311e0362
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkN2Mkd2RW1UZ0hCN2U4b1FiTE5ZZjFrb2hCRWlBSHUzajdVTmU0TkRBRXZv?=
 =?utf-8?B?clphUi91ZG54K1BsRW1IT1F1VEtKZjBKZGNMUjNoS1NkU09FRUh1aE02ZTFl?=
 =?utf-8?B?ckFtNDI2aEZNTHFmeHVZQmlEU1dvcXV4dUh1VWVxS1JFeE1Ua2dTY3pUMllj?=
 =?utf-8?B?bTZHS0xJMEtXUnV5bHh2a056d1djV3dlTDU0VWVOVVJuWUxtclZWRjBjei81?=
 =?utf-8?B?ZjUyOVZxL2NKeEo4ODhiVnJKTmNONDl4UFN2U2VqdDg0VWMyTE5uZjZhNEQw?=
 =?utf-8?B?UVp4MVMveElSNDZmMjhJYlU0dUJXRkRWNzZ4cHh3RWlLSHNVSmpFYmpLS0xx?=
 =?utf-8?B?aFZQWThYSzhtNExpMXQxMEhla1dodzAvcmNPb3JRVVlqMEZ5Mjhud3VJQVNw?=
 =?utf-8?B?SmQ5anlMUDBDV3ZFMkkwdjhKZmhIdlltLzRDdytwY3RYZ1R5bnhLOWJ5SmhB?=
 =?utf-8?B?QWMzTnZOcW1wb2tpdjNxbGpIZktpTUF3MURwR2JBaDFTK09uUVZUWnBtbWNS?=
 =?utf-8?B?VmkxVHI2VjJuaU9rRHlOclRueXh2RXE0QWlHRHpqMkdOdExsTVNiRzNMdFR0?=
 =?utf-8?B?SGhxd2VNcjEwSEViQ1ZpQzVDYzNJY2RKaERlUE1QZzFpUHJPYSsxTlM4OVJv?=
 =?utf-8?B?VkNXTTVITHp5eFB3MkpHVThZbzVCWmpGWmg3S3hLMm9FN2JIcjl1Y3l1UnBu?=
 =?utf-8?B?dWRPelFHZzk3UGJvZnBEMTVtZEZRNUozNXlwaG1xWnhlK0ZsYkdRSXBsUWMr?=
 =?utf-8?B?NVU5bG4zb0RPSm5qUU00dVhNOUFReGNBL0VtdVNsWUEydGpoNEpIUmVrODU4?=
 =?utf-8?B?ZEkrZElkYWtaQk9BTGhqWnFhOVBUOTNBZkNCNUpDT3BIeFRUZ20zTnpDUnpa?=
 =?utf-8?B?cjhrZlFSSG1wNHVNYnljeURDNFo1czVveHYwRndBYUNERW1oZVJnODFSRXNx?=
 =?utf-8?B?L0F1djJaZjBHSHVDbHl1OHpsc0QwN2JjYmRKVHpXZUxoVjBuaHcrR2VmV0E0?=
 =?utf-8?B?eEc4czkwdFN1N3Q3L01RUVViL00wRCs3WWRVekZDeTY2eVRPTEQxT3NBVXNj?=
 =?utf-8?B?MjhvRXNZWm54SGRxWTFueUx4UER5azZreWZBYm1aNHlkYTIzMkpjNU1RVHUr?=
 =?utf-8?B?L2hkbU1lRWZYejJ0NjBEdDNsWVpkY2R4V2JnRW9McitpMnR6UVFLd2llYlpQ?=
 =?utf-8?B?M1ZNSUExVnNNRzRCTjZZVE4rTTFEWmZsOWkyUENQSXRPb3Z2UERpaDBaMVU0?=
 =?utf-8?B?UXZmdkxtVXdnbEgrN0ZxbjQvMUR1K0srR2Y1R1lnbEoyR0p6em9jaHViZmJQ?=
 =?utf-8?B?U2lCajBiWVVWL2xBRjFiMnM5OGtUNDkyNG5jN1RGQkJ3Vms4NTVIcGlyQkh4?=
 =?utf-8?B?YnlVRHFGeHZ6KzBna2tzTW1RaVUya1U5ODJ3bXNyeDlUMkVYWkRQeGRQQ3Nu?=
 =?utf-8?B?NlhCMVpPbDRSZzkvaXFTYzVWei9nQ0FCTFREK004YTlFUHZYUGVZZVJlc3BP?=
 =?utf-8?B?cHlOM0RYMVduT1V3cnMvNEFkT3ZrUit5VVZhSFgrZEZGWFFUekIxTDVvMnpo?=
 =?utf-8?B?S0cySW9pQWdCUlJ1Z1hCdzc1VGtXSHJuclk1aEpldDVJbFpLUWl5NFZkUUdq?=
 =?utf-8?B?enZ0YmhaWk44Uy9TbFg4WG1ZU1BPV2tZVVo2ZklSemNLVy9maXlwWUJkc3NG?=
 =?utf-8?B?dTExbU10eGx5SEtyam5IcnJBY2hlOXJjaTZzOWYyaWU0OWF0YVJYNnY0OWkv?=
 =?utf-8?B?UlNkT0c5dzdwSC80R3N3NndRL05VMTI2NlgvL3I3SHFkN2hmZEM2aFhIVTVY?=
 =?utf-8?B?NjJ3NVRXNGxMbzNFTGVJTC84aHFnbkp2SURHRFVGdzJDMmI0WGE2TTFKZm1Z?=
 =?utf-8?Q?l5ovsVmtw4iI+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFcvSGE0THFnYnVwVjA5NXB4WnNwKzVzdjZCaGl4MnFaTDBuZ0F5a2RuaUYr?=
 =?utf-8?B?M0VseldNK3FDZU4rTUgvcVlqdThCMStaUVlHQjFpTFRYZDM3NU0wMHcvTmd0?=
 =?utf-8?B?MTk0NTh3U3JYOXVRYWgwNGF1MGR3Y1drS3cyU3BUd21USUh2cCtJRXhCWWlM?=
 =?utf-8?B?VDJhSk9oMkw0U0FnYmhCYi9ZZDFUUXNFdklhZjdRQmZ5YVU4RFViMURZRE03?=
 =?utf-8?B?L1gwaGg1YUdiL01EcWFsYXpzR3dwL3Noc25BbFRkWkpRaWh1ZFhDdDZZK1Zw?=
 =?utf-8?B?MmdVaXJqa3krUUsxREVFS0pjRG5rS0ZralNKUldTYXJKVTRucUg3SGduUWRU?=
 =?utf-8?B?b1o4a3FYLzNvU01sNDZvcVhncEJJVmRBaENxV09FOWpQZ3lGdW9zNEhWRHdm?=
 =?utf-8?B?VnJYVytSamlnWlVwSFkwekpuTmxaRjV3cnB5VDI0VXhFYTFsckxGcDJxYkdB?=
 =?utf-8?B?elFVT3FRc1d0OW94ZndoRUwzLyt2K3Z5dkNjSStFbUI4T2s4UzJGUFNDUXIr?=
 =?utf-8?B?MVJua3JHSXdTVCtnZ1JiSk1DbTBucG9KNXh6M2VSL0wwN2R4SVRsSnBVMDJP?=
 =?utf-8?B?ckR5aU0xTkl2RkJiWUxFQVBWVlZpR0EwVG5CcHNYR1kxMVNZOHRBcmxVRkxq?=
 =?utf-8?B?anEranFEMFRGVUVRLzJxbnh2YjJEMzRETjRFbU5VL213YTFvaVJUaEpyaVRG?=
 =?utf-8?B?OXRibE5FRUFJNGV5My9QM29peVJTcnFKa2xZcmgrQWJsckdvTjlNQkUxN1Zl?=
 =?utf-8?B?UHptVHZXNzVlSzkybEIyS0REZmtiL08vUnVmbG5STmpLQTN2QlZXaGFoMHV3?=
 =?utf-8?B?Zkk5bkFaWUYvLzNSb2dzT3NCYWNXUHN0UUJyV2RlR3h2YmV6clFKTGxObUd0?=
 =?utf-8?B?c1FOS0ZraGVHZ1dYMzc2UUM5Y0UrWXV5YTEwQ2R0UUFZRG54TGY1Zng3U0F4?=
 =?utf-8?B?d2g4U1lCTnVyY0o1K2Y0aGt3bkwzdUppbXJWaDFzbGlKK0FFdkcvMFJGd2RN?=
 =?utf-8?B?T1BnMVFxcDhQRTRhdVBjaHZPNk1nL0NrQnpzZnRqWTVhNUxueDBiMkh1V0Zh?=
 =?utf-8?B?YVZIblh6UDJlcjhUVXZDdm5wQzhuYlBKU2NjVS9pTUN0aXp3Q0x5SjdPQmVX?=
 =?utf-8?B?WHNtZkRDY1JFaFI4c21KYnI0NlViLy9uQ0VDdW1RYlVqSFlUcDBycmdGb1c4?=
 =?utf-8?B?Y0hMMk1YcWpXMVRhUTRRU3BwRFMwSFZuV2NoRTJSVEgwcGtVU3dNOVNyNmZj?=
 =?utf-8?B?UXpZQTJXWlRzT09rTW1kZnd4TUJCZDdmOWkyOFUrVW5XaGQ1NVhKdm9TQzEx?=
 =?utf-8?B?UXl5VitVWVkreWtMTnBlS1h3VlJpeSs5Z2I4d2t1Vm96NlloNUpBNEtJYkZT?=
 =?utf-8?B?TDQvKzVENGpkTytPVTJoZzFKQ3ZycFlqTDFIbEhETjBCMlVLOUhwZHZGQkZJ?=
 =?utf-8?B?cjdXcjZkaVlBSjE0ZDc3cFFUcUJQTC9wU2ZrZVJjTDBLNDJWdEtCL1dmR1V4?=
 =?utf-8?B?UGdHOHl3LzNHT1BmRVNHTmNjYjZTbTliczdJMHVwcnQ0ck41eXhpaWM3blZH?=
 =?utf-8?B?dU1sT1Zwa013T0RVV25HakNsNzNEbEplN3BleU9BVFlJV2lRZnJjTFBRc3I5?=
 =?utf-8?B?SXhRdEVGTldyU1lkVHVZU2hoZ2djZ0hPRm5nTGhqdGdPTHZ2VTBUUFBzVFVu?=
 =?utf-8?B?TzNWVXNidWh4MHU4KysyUzMzSWMvN0FoajZLeFMxSnYxSHpSR3Z3UkVJaW1T?=
 =?utf-8?B?eFB0dVlNbENVdWVxLzlWQ2FtVTNLZ2tPYU1YTnZqUmk3Y1diTCs4Tys1OEpC?=
 =?utf-8?B?UTcwRksyV2g3Mm95QVRXREdqRVBBMDlRYitLUFB2bjBvbEpEeXRxWmJwdE95?=
 =?utf-8?B?aG9MclJYOGdqYVB1UWl2dnczNFcrRWdzNllzZnZ4VmNlU0pQWUZSYW5nV2V5?=
 =?utf-8?B?QVBkak9qUS8zSFJKZ29yMlNIL0JoQ2xjTnJxelZKaGhOM0FyWCtZYUx0bHpR?=
 =?utf-8?B?K0NVQWIvaTVhUXhkSWdEVEdoZUkvQTFKVFZVUlRDUi9LYkJoTXJqMTZvVlpw?=
 =?utf-8?B?WlZ0d3M1TGNkaC9HUlc4dFZXVWdDbHZqamdkVnVYcTQyUGhXTUZJNlYwRlZ5?=
 =?utf-8?Q?84IZymAtAFGR+ZyGT8Nh8l8Iv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aca39bd-c8b7-45e9-21e0-08dd311e0362
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 02:25:13.8087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoXjcSGxpBi6TIMQJh9dOyUyoa97+swpXZZOsKw6MTsO8LfluP9F23de9XMlDwXS5kq97qbLPJPqyMsaxqM7Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6872

Hi Nicolas,

On 2025/1/10 0:03, Nicolas Dufresne wrote:
> Le jeudi 09 janvier 2025 à 10:25 +0800, Ming Qian(OSS) a écrit :
>> Hi Nicolas,
>>
>> On 2025/1/9 3:34, Nicolas Dufresne wrote:
>>> Hi,
>>>
>>> Le mardi 07 janvier 2025 à 14:36 +0900, Ming Qian a écrit :
>>>> If colorspace changes, the client needs to renegotiate the pipeline,
>>>> otherwise the decoded frame may not be displayed correctly.
>>>>
>>>> If it can trigger an source change event, then client can switch to the
>>>> correct stream setting. And each frame can be displayed properly.
>>>>
>>>> So add colorspace as a trigger parameter for dynamic resolution change.
>>>>
>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>> ---
>>>>    Documentation/userspace-api/media/v4l/dev-decoder.rst | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>>> index ef8e8cf31f90..49566569ad26 100644
>>>> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>>> @@ -932,7 +932,9 @@ reflected by corresponding queries):
>>>>    
>>>>    * the minimum number of buffers needed for decoding,
>>>>    
>>>> -* bit-depth of the bitstream has been changed.
>>>> +* bit-depth of the bitstream has been changed,
>>>> +
>>>> +* colorspace of the bitstream has been changed.
>>>
>>> Did you really mean colorspace in the way this term is used in V4L2 ? What we
>>> want this event to be used for is when the capture storage size or amount
>>> changes, perhaps you mean when the capture pixelformat changes ? This will
>>> indeed happen if you change the bit-depth, subsampling (not mentioned here
>>> either) or change the way colors are repsented (RGB, YCbCr, etc.).
>>>
>>
>> I am referring to the following attributes in v4l2_pix_fmt:
>> 	__u32		colorspace;	/* enum v4l2_colorspace */
>> 	__u32		ycbcr_enc;	/* enum v4l2_ycbcr_encoding */
>> 	__u32		quantization;	/* enum v4l2_quantization */
>> 	__u32		xfer_func;	/* enum v4l2_xfer_func */
>>
>> For decoder, they are parsed from the sequence header.
>> Our issue is that when only these properties change in the middle of
>> some bitstream, but not the resolution or dpb amount, the decoder needs
>> to nofity the user.  As these properties are in v4l2_pix fmt, user need
>> to get/set them via VIDIOC_G_FMT/VIDIOC_S_FMT.
>> So in my opinion, it's reasonable to nitify user a source change event,
>> then user can call v4l_g_fmt() and renegotiate the pipeline.
>>
>> Apart from this, all I can think of is that user call v4l_g_fmt() before
>> dequeueing each frame. But I don't think this is a good idea.
> 
> I agree an event is better then this ...
> 
>>
>> As these properties are parts of the v4l2_format, I think it's
>> reasonable to handle their changes via the dynamic source change flow.
>>
>> We're currently facing some real cases on android.
>>
>> Or do you have any good suggestions? Then I can give a try.
> 
> But I think this is too much to put this under the changes
>    
>     #define V4L2_EVENT_SRC_CH_RESOLUTION            (1 << 0)
> 
> We include under "resolution" everything that affects the allocation. So perhaps
> for this one we can introduce
> 
>     #define V4L2_EVENT_SRC_CH_COLORSPACE            (2 << 0)
> 
> Of course, userspace implementation will be needed. Anyone one else have an
> opinion here ?
> 
> Nicolas
> 

I agree with you.
Defining a new colorspace changes does make things more clearer.
And it can avoid buffer reallocations. Then it will not affect the
existing flow.

Maybe I can prepare a v2 patch after doing some basic verification.

Thanks,
Ming


>>
>> Thanks,
>> Ming
>>
>>>>    
>>>>    Whenever that happens, the decoder must proceed as follows:
>>>>    
>>>
> 

