Return-Path: <linux-media+bounces-65649-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PZ5JNJk5PWrvzQgAu9opvQ
	(envelope-from <linux-media+bounces-65649-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:22:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ED76C693E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:22:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=GWTSKGog;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65649-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65649-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 248C830C654E
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 14:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871C23655E0;
	Thu, 25 Jun 2026 14:17:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2AF35CB76;
	Thu, 25 Jun 2026 14:17:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782397062; cv=fail; b=gXsFcTvWMJI6AnO1Ys2RA4KqoTa9k5nURaO8OoXsCYq56rg1amFwTU1DunRLjNbsd55UZivOSTwSczu62zzLdSV5l6UTcUxAe9dH7a2kIzhnLW7o/jNyOOURaPUZJMyiYG7qOvfRMPeDv6v2KOG1lPzob1EMFWuerMMvYTuXtwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782397062; c=relaxed/simple;
	bh=qycNj4bJTyShVQJ20ZlsY1htZElEb//SGQcOLwq/RVc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HSTzZNcZQwWlxGQKgNwDUqGfpZD93x/YLy2R8bgX/qYrlOOc1zxEoJpl/xbUe/QyIXfzwRa8tycIVyZjQxSrXbnO1MqtViurwt8n2MhsLqyX7bbHvc3fE4FK3Ra3JyICshvHDzZ4OxdfAjOBg5Z6TmeagsK7hwQN9Evq+bu3Hr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GWTSKGog; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTN/llOyNooJ7LZQyH2hOddxd60u0J1KXiYVQFumX7Ufx1t8DaXC5CHKPgFrWNoJOx6FR7ccqQOPdEELFbRio0PWg1lzBIie5C1Cc8ztvhVurq9CXF9YI8Z/kZA7rpDKaiA3bE9PRSnzGYjsw+eNkufJ/pzWPSc3EWzDEF/zdWsuI51H0AxixiGQXIV9oTP6/MspahJZ1oR7dcYmMh6NAZxLhcdoeMjiSooEuob35RaFTOIu7FNiX4sZT3mKRxyyhe/6BWDA3uL3uacQuXUs7CM+cjCWZD2L5xo97MYIXXraTd7VMLmjucKcie4zld3j9yUgXFDteRtaPZ+kl0Odjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uewdp4prfdxHbMJmug+CMOjRCWE5Rcu3v3jMqJWF9SI=;
 b=B/I9xiNAxd4H9Q7qPfQUjhjXTVsXdmOhWc9T5booGJAzFADDs2EQKIabXrJ8Rv+DykwIbxulVKlsnYNs7TJK7DHGXNT5hmUcNbsWGvc4Dgk+khPK9IfSgjy+9znwv8pn27UdjAMJ0+WKeX/55yCg6hwAsG1uPmdEY/uAwuQB+rlzPSCn6r1VEGTBHlXUSVzrA7RjipAlGs/DeW1rMZ4qWyIEo7NKPV8pRx6q+Wd3xF576fdNFgo3oUCNQrwHIMk615IXuVJBjVDT5YtT2Wwd7jXpnYfBzYIM49XRBIun5pC1bcoRWILkRU8xBcYOacBHDH9rpF45otemHjwew3Am/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uewdp4prfdxHbMJmug+CMOjRCWE5Rcu3v3jMqJWF9SI=;
 b=GWTSKGogrNlkjI5GOCCJQYAxzBBh9cYmxa9XAd6dTAfgd7GtClnGbUs5jJ1z5rbrCjVvqy+UgKH4xZtCx3AyMifazV2hTdOQBirgx33d83elyTDmki+QIB3t/Pn9b9RddKjBoS33NLoPaZyQ5TXh53Orra907uxUf6XnesGxGg/vUZS7t2LkLAh9jSfI0CJvLXoW0/lLTyb0ey//A1u4mrTi1vs2lqEMwqZL94evPNg4I+nPcVwrEAtSd9vaZV8fP3vrrfEYQ9xyFk6EvHB5O123c01oph6I66UCZdDx5+diuAxb2aCOu9Tsb/5RZXg1oXe/kTOxgajXAGQzhSfJbA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11888.eurprd04.prod.outlook.com (2603:10a6:102:519::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 14:17:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 14:17:37 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 25 Jun 2026 10:17:21 -0400
Subject: [PATCH v3 1/4] device property: Introduce
 fwnode_graph_for_each_endpoint_scoped()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-fw_scoped-v3-1-ffd0868e498d@nxp.com>
References: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
In-Reply-To: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782397047; l=1925;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Y69Hr5/bPtlYsM6f69leqRo6wSl0g6ilzLm7Cy7oH4M=;
 b=+y5OMV1EPsE5aQBw8b8Jzq4P7kv0E1PMigAQV1KYRV4LyVcWqadn7UWZLUIT8p0bHtRKeeaD2
 6/mlaRxF04/DujLM08H14lNf5zbKGpwDpZtw/7TbmtcVyw3uH0wneuJ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR04CA0111.namprd04.prod.outlook.com
 (2603:10b6:806:122::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11888:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de1e610-ab91-40a2-bc3d-08ded2c4821e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|19092799006|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 EWYNAsQKQ89ScRMFAaf4AnNehu8jwshCnWJ8UCmJhC34wFIu8HZrkoyuXXEulHGvFOeFRFhO0LQG24PX1FK5D7PUUa2ppVE2VkGguwOZXYls6Ey6MvMGjcHaRLP7I2pfcDxgadYGMySeglE53bdoTPufclkL7WYIasJXKFujJVLE4wni1vRHcFjgJnnX8pzg6bSts6HL/19JRxAJ9iuxg3U9O+El0d+6zFigITKAHWj2KAaBx1vmXBHKdSK9jGV+uJNmLvjy5kwBVRPEV+c7obxJmEs+HpiOzUBNid75vF4XZujZvmocogsjw+G0xpaNjHh2OSCTUAQwo7UKKmhpCOdFiuDPNzZXbroH/x3MXkyq4bPcFTkS1eTQ/gVvOql4E79P1zZtjzRqdWymaDZp62O+weUyxtlA5RSik0LicspPN3SnvwgyCgvSEksNHuuSQAoybfUMuH8g9k9PeCbjqo1y87H0tYSmbeu8kzC3ZkPX0qmVhRKK7sHyGIc6gA9CPy7lez2+LIQ/GvpFZy4aU2hB1g6ycRJ+lRBIhPkUlPl5FBmolijw21zO01CbCSv1MY/8oVt37CJYLoT0c+XuRPf542jZjVTYJJRaS8Q1EjFjK4OWLnyVW3jqtrPdXwzIyGVOBpZNC5TTpLokaLTLPRFz4b7W8Ah/uYEXh51+bzycJEoV9UPrNQRrmu5EdZQbHDt3Thih4Z+7YPPPL/PoLw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dkRSMDBwU2dvWHBOek1DUVppamk5dVVyMXlzTkJDdlUvM3FMbWo2bTZ1Slds?=
 =?utf-8?B?WFJjMWt5SjRvMzhxaFhkWE5OQ2xiZzJXeXdRSWR1MFZXMmY5TnUrSExvbjB1?=
 =?utf-8?B?ODl0cTk3UnViWVlVRVFucnBNY1NQY3NLZy8wUE4wR2hBbUJ0R1NLandOVGJs?=
 =?utf-8?B?akM4bldnQ0NJUmhZR2tlSEd0YTVGMW1RVUNDOE5XdXIwM0FvcnpiVldQY0o3?=
 =?utf-8?B?cElFRWFZYVpFKzYrQzJtSDVySHRzS0ZMZ1pxMVFMMlBEalpHOUxBaEhDdEZ0?=
 =?utf-8?B?TDFuSzNFNkdjenAvL1p2ZWpkY0gxdnR5Zk5NVm9qNlVuL3BoMEIwRWtZOUR1?=
 =?utf-8?B?ZGQxVnI2L0Fzb2JWVEZHWHUxS2piWnR3K1I0cTE4diszWWNqWWF3YTdRczVs?=
 =?utf-8?B?allLSmlWQ3p6ems0M0VOMnpuamM1S0h6ZlhoYTAvdVpPM2VWQ1RyeW16dXNY?=
 =?utf-8?B?VHU3YWk1QmF5a2h4QXcwM2ZsK0Vib1RwSElGUUVTQVRkMlpTWnZtdXUwaGI5?=
 =?utf-8?B?UXo2MFhmakVYZ1pDaEJ4NGk4Zk5MTVA5QjByRGJwUzRCNm1iWGlnU1ptRC9n?=
 =?utf-8?B?cSs4Ykd6UjBJVFVXU1psV1RKMGljRU1uTVZBYkIzdjQyOW5wZHhsUjg2TGEz?=
 =?utf-8?B?RkhsRnFLbDdRSDhTajBXU2hydmZnWHJvMEdzQUpnTFo4eGN2YVlnSi9PSjBu?=
 =?utf-8?B?STRGb1ZLTDdHNE9Pb2dhalcyOXBMNVlzaFBVWmRCMU5zRWYrL1l4Smt1enR3?=
 =?utf-8?B?YlU1MnhNd1ltUUtVcUpIMmJQNmdvMzk0UlRMS2ViRGJYTng2VkFqdTZSRTJx?=
 =?utf-8?B?RDZhdE9qci9OOFdOUUFaTVEzU2ZTNzl0WGV6ZDZaejVVNURmNFlmaVdncWEw?=
 =?utf-8?B?Sm1oQXdWVkxOVUYybHROZ0JOTzZZY1UxZTZsMGIzdnRnS3B2dXNvTWpxcjRk?=
 =?utf-8?B?TVA0NzhWQzFVODk1TW5xTng2bktPYWI1Q05FUFd0RmYvRzZCVEZZTlZQb1R1?=
 =?utf-8?B?KzBWbW44MFNtL2RNY3hNakloTERtQnpKNDk4d0tmQU9SeDJHVE5JYzJFbVZ4?=
 =?utf-8?B?ck9XTHltd0tLRHNzOXlvanJqTFJXc1VoV085Rmh0cHd6d0VPcjRnRy93Y2Qx?=
 =?utf-8?B?NU91MElLR0x0cVZKSnpCbTlFLzIyQW82TmxyeW1qdE1IczVrKzNDQ3c5ZmR3?=
 =?utf-8?B?TVdycXFXWTk1eW9FYU1vWEJDTHNxdFZjUmxyNWZmNGdNbFB3U3Y0REUyYnZh?=
 =?utf-8?B?aUJZUDJtaHlzakpsN3hrQ09Pd3diMG9zSk93TVNTM3ZGK3dkNEZmNy91MW9W?=
 =?utf-8?B?V29WMEozMTdpeTAyWWdWZXQwT25UbXFUdGVzOU8raWEzOWdVTlgzRlZZT2U2?=
 =?utf-8?B?SVBxcElMQ0lXVlpkUFVGd1NIVy9KVUo1WDJWME5EdnFTOW5QeFUvdHd1Mmsx?=
 =?utf-8?B?MWRJZzVORFcra0Vsb0NPU2FNeWpQczFEL3Rwd00xenQwNit3VlNhdW9Ua3ha?=
 =?utf-8?B?Q3hrZmtONlNWRTVFcVQvRllaRVB0WHlqSWRrejBFbHlBMFBHOTFiK2poaHEv?=
 =?utf-8?B?QVYyU3MrTk1JSHU2aDdzdmVVV3doektVenlEWmV1SUpJNEtDa3JPTEcremlo?=
 =?utf-8?B?TTladzcxTFVUZlhNaWZQWXRFakpOOTMwYW9PUFZ4K01lMk9ud3F2eGU2NkJW?=
 =?utf-8?B?d1VMOGsxNlp4Y2hnS1B5VnBXVythdWVDR2NZUjV1ZDZUQkMvWE5DQktXNDli?=
 =?utf-8?B?QmRtd2FJbXNFTTVEc3dWamczblRiVldDME83dFdZR1lJVmZwdk5qTzFWZXUy?=
 =?utf-8?B?WkhVWDluWDNCNVNkaFU1L0FKdEVKYVM0Qnk4REdJUmgzM011WkVYTjFtZXp3?=
 =?utf-8?B?TDY0bHVwcXNvUGZteUY3VzZBc1ZMdEMxMXV5NGxOcVAxOXdkMjZQdlFBd2lw?=
 =?utf-8?B?bHYxb05ESXpRZWk1VkNRMTFLdmFBd05UV21xaUVHU2hjNHhKOXg3OHhmV1dr?=
 =?utf-8?B?ZFNSMWl4TE54UjlDZ3FQY3RRN055L2svWjBZdFFJNnRuSGFTT1hLOVNQZEVw?=
 =?utf-8?B?ZGxxNGlza092K2FoTXlRdVhKSFRjZVc0alcydkJoWmF0Y1I3QVRPc0wrLzZw?=
 =?utf-8?B?Y2hDSTRLV05LaFluQTcvekl5Qzh6UFMyRHFJa2hqNkdXeEg1S0QzN1YwaVNs?=
 =?utf-8?B?NlZDTlJzQ0ZqRW5McWFjeXp4ZEk3enZkSy8yekpWTWYzbzlyNXhTb05qeDM3?=
 =?utf-8?B?UzAyK3Bid1ZBNVNqK2xFMnZGemx5MlpZOFBEQnNCcjdLcUVKS09wK0FsVTFt?=
 =?utf-8?B?TnBsK2hveFhsc0xOTlpvemhzenF1RFlWbitKNXFHR05LRmN4UkxBaUJtSEln?=
 =?utf-8?Q?qFisa1nmROt/MEo0+V5/uTQtUqoPxXVyqAy8b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de1e610-ab91-40a2-bc3d-08ded2c4821e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 14:17:37.3868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKBgeL6kkbERUOlN1ObKx6FaZYuCgiz+oo0bbnWVEEBSv6FoS52nsyhZobNCLnQNWKWv0krs6Exz1I1LZtHoAScFyQOCak4cjW08Joxrv6dBzTD7rL2XfXfMJ8kRUIoL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11888
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,m:laurent.pinchart+renesas@ideasonboard.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65649-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.nxp.com:from_mime,ideasonboard.com:email,nxp.com:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50ED76C693E

From: Frank Li <Frank.Li@nxp.com>

Similar to recently propose for_each_child_of_node_scoped() this new
version of the loop macro instantiates a new local struct fwnode_handle *
that uses the __free(fwnode_handle) auto cleanup handling so that if a
reference to a node is held on early exit from the loop the reference will
be released. If the loop runs to completion, the child pointer will be NULL
and no action will be taken.

The reason this is useful is that it removes the need for
fwnode_handle_put() on early loop exits. If there is a need to retain the
reference, then return_ptr(child) or no_free_ptr(child) may be used to
safely disable the auto cleanup.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- fix missed a tab before \

change in v2
- collect Andy and Guoniu's reviewed-by tags
- fix indention
- remove extra space in commit message
---
 include/linux/property.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/property.h b/include/linux/property.h
index 14c304db46648..c71177ca16a95 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -545,6 +545,11 @@ unsigned int fwnode_graph_get_endpoint_count(const struct fwnode_handle *fwnode,
 	for (child = fwnode_graph_get_next_endpoint(fwnode, NULL); child;	\
 	     child = fwnode_graph_get_next_endpoint(fwnode, child))
 
+#define fwnode_graph_for_each_endpoint_scoped(fwnode, child)			\
+	for (struct fwnode_handle *child __free(fwnode_handle) =		\
+		fwnode_graph_get_next_endpoint(fwnode, NULL);			\
+	     child; child = fwnode_graph_get_next_endpoint(fwnode, child))
+
 int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 				struct fwnode_endpoint *endpoint);
 

-- 
2.43.0


