Return-Path: <linux-media+bounces-49886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65892CF2A36
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 10:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F6B130493C9
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 09:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC80433468F;
	Mon,  5 Jan 2026 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="DNp4FsXs"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020127.outbound.protection.outlook.com [52.101.225.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43B0332EA3;
	Mon,  5 Jan 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603886; cv=fail; b=sFR6vk1MzP/uMNpAawqOErscFz6+V8AMwaamWp6Jgri9m7vwBlEMGbKDLw2XMJ5E5GlaE7TWYfXMUQ/5j3ytzqiPnu/ueCNJoMJzxJae78TVGZt2+hDtHMpsXrYgzRSNOPFjBi8IK6iR8d+zRIeSF3TvYYE+tFm1W9MaHzGc+Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603886; c=relaxed/simple;
	bh=47SSyVudXDRrhJNX/vzDB1u23YTxGvliOMofzZQP9zY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XN7UQdbmczmw3qvrqLMl64SYn3/qYfkHqeYR3hCxvNJ0lYlzTvTcCmSx+6DSRkUSy8r/dxxo815tuFXG0ppMmWLLFP/6D21ogbssDh/PPtRNwBw94yfTgBHujpqtJUEA0gb+e4j9O67DJcxBax6QsXZw04t1fJ/dQFhn4bGAE9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=DNp4FsXs; arc=fail smtp.client-ip=52.101.225.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HC0nuk09ispgT1YYGzaqxmPJkfl3kCt24orJUJNEyw939ofo2U3/+6DSm7+XRgTcQcbCRRkO7pYWEZ4j3YIXnrE+fFo/GO0k9ZKh1TIW88NYdYtLXokpa2dCUMQdiuVw4iKhWax/JXWCdp8ZK5P7Hpo74sEVrnPHCsvJoWEq0AEilqsXNuwzMKDvJjjRUqH6zUJm60oWHl+Y6UJ118iAm2n/UkxTHRxhfewi6hVXaalFhhawIrruKatx5FRO1E/w4HZgXq6Run54NCIm5YHA5gry561XzWTJHIL9QO5389dZuDnD8R2+sPRYHBm0LBwUX1HglrrnS+XHNmEqEhBcZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvDDL5PnNI7GJl/6ikk2eDmXVtp4qruiJvvL3iEuqx0=;
 b=rn4FFCiV+ptddH6v3u9T8ujAlyYpOie5l0UVlAHhPS5v5vi88kbKf9eSZMexIkgD9vKAZBK0P2vMtMSskscZoLHQ/NGGZyErNtoFSZo1VKxjPAHjd65Hj4zu+FJB7NZcjGztVlGmTH/F3CdqNMCpBhIBkuwt5GuqHgBhXBaGCpKwZbfD+ofFcsGb+jqr6+jLHd+SOOeRGNCKqOJq3QpZTXRKaq+4P7RhhAaLZYBC/5zlLDr8J0EBGZgeoIK7WoMdp5RlqJ2lbAe4rkqihO4cvB0kkJkaKyCRZMmosDZAszXL0+HeXv19L5li5nmxgx45uslmz9YjschPLjsOmnti4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvDDL5PnNI7GJl/6ikk2eDmXVtp4qruiJvvL3iEuqx0=;
 b=DNp4FsXsnOB6X+7VVsWDqmCgXfZ+8wfptryiv6ZOxdVz54X02ghXM9Ot7TbNMD5UGuj3gsdJNOkY6Xx8FsKF9n7tzquOHZ7FAbH0jAH3wm+BVLL/2q+iUnhXIKk7YF7iYdVQ4TFLgEvfaZClLF+Uioku7mEeESiaEh5CQ+p3Phf68Pcztolx2eLgR3vJ9FpCvYypS0wTquHWLv2xeEn6SEveuVsgoUenpIbnuk0MbJ6LshSD8sgYVNkNWFfuV3E/wdXRDG5Vo9uCAZAj1jHwsQuZ2BAo5AGneIEddFm3vNIMqSQFXiZBElStRkdOWWRgdSvr29WVzPfle9+ML1VD3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN0P287MB2001.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:04:39 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:04:39 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Date: Mon,  5 Jan 2026 14:34:02 +0530
Message-Id: <20260105090410.108479-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105090410.108479-1-himanshu.bhavani@siliconsignals.io>
References: <20260105090410.108479-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::12) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN0P287MB2001:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0044e0-5a9d-4e2d-f603-08de4c3974fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HM9X2yZWfXvJSX881SaFVIlbRovSU/ugjMPXazK4xkIHp+/bcfzyvBE9ttd5?=
 =?us-ascii?Q?xU4pn7ljZOhBPt+Peol4sii1/iDnSoqZbM1/gtXh9K7s7ZdhPJEbwuDU4TM2?=
 =?us-ascii?Q?rvwLSxPWgriXyTKqw029RtLggPOaeMNa/NqrMqeylqLHMv5vtVmkruGX1yeY?=
 =?us-ascii?Q?ETZ+ZNUrnexuHBrBptn6f1xp17rAlq3ImW0cV5L3flD8t+Sppqxa+IPh6vwp?=
 =?us-ascii?Q?gl4G5g5QpCp2p7rvq9b2xdhO/EJr0p6eEFwTvvGhOpglebgc4kXzIm7tivAV?=
 =?us-ascii?Q?TABcX4673pEYNEOH7W1GcnZ+6mYJPaKHA68SFal7Ffal5M8gbViid8kgEusX?=
 =?us-ascii?Q?vD0aP27aPKwXMiZtw3G2q+zwUp7RpmDjaO5CDP+Gnzu/vmVEZRo56lU7Qkys?=
 =?us-ascii?Q?Hcuzr0jXKEelTRsSfxhRubF2pgpE7+ZO1hcNFiUsNxv/pq9RBE2rb4u59cd+?=
 =?us-ascii?Q?aanZ1dLp1vhmjkEnNFhGE3DSx5Kk3Zl8IRNXn+IDyNZXNjsbHUinLc4Xt4uH?=
 =?us-ascii?Q?U/nRjd11C5fi0QG9amakAByzO6i93dhlAadk10vaB24I+cphDK4XMn/gTMV+?=
 =?us-ascii?Q?UyM1J7rgbHLpBdLNNrnHRcrnGZQsZnH6XuXHDPZrFRKVfSMGYhLrTphtGz6q?=
 =?us-ascii?Q?77gtFxu5s5Qpe/71PxzjftxzKAXsxIIG9XuWhLo1s2Yv0e6qAVTLb/QKxYTb?=
 =?us-ascii?Q?X3MnF0nDpIGJQF7KNV/ZWBpKx+/7eLgtzb3YnroQRHdszs5f+rcf830nZpW2?=
 =?us-ascii?Q?+S1v3f04SfIyeMQgGIbYBQPb+bxBemh2yBJUbDZLxiw30j4yWhBjCeBC82hZ?=
 =?us-ascii?Q?9UTxBZ1rpLPpVJtw8eUMIZhDraYH5kbKU3C8cinskR0DRcAfA17BjZZlWxbD?=
 =?us-ascii?Q?Xu5Qmd41OwxyWTM+JG8BhxJ5xnHqF0v0CjQmhuSoCBs/M4DJgM2BX51DYQIG?=
 =?us-ascii?Q?yPvTdDz9HWNFfbIWNfNfoBGWC/S5bXySPB1RusIZA/7tRYOrpg6NOfg+J7c/?=
 =?us-ascii?Q?+Ew0nTjxllHndKnl13mw4LSDUmHEE3CdI/Vex0+1vfchMbVRVd7eB6ieHSZT?=
 =?us-ascii?Q?LmQyB3bnexOco7vBMk0Zozr1Bvgfg9hz9gHqbUziBULsC5nvpSo4IrX3jGni?=
 =?us-ascii?Q?nQRvFZTiuByfz/b+r1hJy6l9I2hf8v9mgBE3ZohEjNGs505j3MF9W5ApaHWM?=
 =?us-ascii?Q?EfmMlJw4e5Kdbwg6QWgWtZoRW1sfaeyPRcmnnAMm6m43h2DDafKV9uHstAai?=
 =?us-ascii?Q?HWWmlWblqE0/5LE5evojvjFKcJ6mTw2UnJZrSNL+uZVgLl4nde+EmsSG80RT?=
 =?us-ascii?Q?RrPpxQyld4IyiUJUCbdUHD1A4aMoAKDgPP1ITF2l+VzWJI2uWLdbRq0tFe3n?=
 =?us-ascii?Q?k/nZ8fijEUOzJvMQXxYsE2Kxj0PRHD233DsMBTt4paAGll8AbtPwr1Tr7U3s?=
 =?us-ascii?Q?kxAmvdwOwea+pbi/RWQh7pK22ZdrfxXMFNDyPIuKeYhTMAD9JYjam2mRj+D/?=
 =?us-ascii?Q?R7JFbiw/tTNwoV/hBDknz8N5JCv614xjSio0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HRZB1KKjiNowQ8FzPd2k+0fAYs2MIw22NmM+DSbKJ2rdKb7dBet2JQLIG7kj?=
 =?us-ascii?Q?gCg4vdPcjgkLPQz8YnEr+ZWXCBY6FPlDv9w9Jq4yxA5p9QkYp0BMLsMD+Wwi?=
 =?us-ascii?Q?2+UKzNf4frswkaPXrGBuZc9/xwjrbg2gxXnt5/Wf27a20zudoGJ23rm4SAVq?=
 =?us-ascii?Q?O4z80sBvUPRKeu4y1iikr2NvisZKGXNAA3RWoHcP4zYOzE4xznIiKPQAbvHL?=
 =?us-ascii?Q?AKczWnWnrq1uOT6P/XcNHtNwtP3cnr9stul9a4UbxCwI7kT2GIbXTGFToFPK?=
 =?us-ascii?Q?z+P5E2v44h80JRrfBDKpEysEbj1acFf68o2HGVZJ1NtVt47DcU9QyoyEl09K?=
 =?us-ascii?Q?CPely9+om+2mgcI77YGpwu/RqqEA8YqdMEPEvL6j4jxq7ZIkLFuEHKq+uKJu?=
 =?us-ascii?Q?/X713ptPZRH/yryeVG4/PSOuTMa3lAYGKtVvbIxADVITF5/KBH1UnRsTzDw/?=
 =?us-ascii?Q?pI51fAeIshiGY6QoNteblCA2+SmMQZ/FS3doZkJxc0Fa0PdtaFGBJGbtc3Hq?=
 =?us-ascii?Q?CYgnzqSB8Jd456iBPkUZmEm/f1z9HYY7pD8aOAvQM7JQpJm2dPyZXaIlrreg?=
 =?us-ascii?Q?sqtHjDCLiiSxUggUSSiQx9OIxZL+RpED0rcejpNx9hPsNpGO6A/wIN2VKd7E?=
 =?us-ascii?Q?3M7QMfnny86uklyjJyTi60HkxNOWK7Tt0Z4MKjG0/Wul2N98Jczll1sN8FIy?=
 =?us-ascii?Q?IjQyx8BzsZkQ5Xjvvffg32tZy2NCE+Z6G57jv0+06ZNABLdk6RfL7yc8rXxr?=
 =?us-ascii?Q?hpPohKK8zYhWPC5BDSwhDQDvp33h+vC8W03l8d8ju9UIqtwY8i+YmI9Xar5G?=
 =?us-ascii?Q?tJD4JpGaNdhPzyT/BQC4R0cjNeB0trAl3JfcI9A38837gZNeDcddbl/MtD/l?=
 =?us-ascii?Q?oTey1QNCxc95WasaptJvkmKnQqDbTYYoySIROUX1xM5BSfCBjibcw1sRxJWc?=
 =?us-ascii?Q?8vV3E490T42VRjNGfaTBWOOKt62Hex8wk2pyf7C8mKYn9v3fUSYBTfgCkP53?=
 =?us-ascii?Q?5j31Jidv9dQhFtMkCx1yBqQyCXIbtUODu7n5u11gwVZtI60CTGqLixDUXj2v?=
 =?us-ascii?Q?iXMM6DvpfHKxCY13HMB++aWk/tEIdzw+loAojcJBM02rPK8BqmVQHgoqptbi?=
 =?us-ascii?Q?eraaRCKy/qiXKPHgnrTEhHcqmYv9JExvxXfSXxmBPaFX11tjtYlvfNSrySKC?=
 =?us-ascii?Q?IB1qoe6+JmDRkQS0hzJgX5uo/v81gvHByazt6cE3eD+HWaW4AOY53kysFLRX?=
 =?us-ascii?Q?97F76W9QH5Mw962Bu1OCMkHN5+TkzLBVMhKZTi4na+8OIA43l7SGjaiJhwQJ?=
 =?us-ascii?Q?/1tD241qFAfSm5IjzDcH898a9KVV8ZL6l+OeLYMvSyNrilxmUdn9ROY1+njn?=
 =?us-ascii?Q?akuK2W1QIJK228kpBFRTDDkbN7+rnuTkgPffzUqaFgVSUqnNfYR5TvwXXUQw?=
 =?us-ascii?Q?jSUKICNsSkuMNgrQt/prSKHDpKceJrQR6EblA3n7GyOcwXqhXBnZIz5HpePd?=
 =?us-ascii?Q?CPIpAnO+xRYhxLCAKXSPsmWsQ4Zt3kb4xa5RF/ZaksIvTB9W0/U0WQe/GD1i?=
 =?us-ascii?Q?SIvquAj3BzE2WT9BZTkQIocg4OS7hUFFc6JuUZh65Q5rK+vstfQZzdJXVhcI?=
 =?us-ascii?Q?hWNrFxqXUBz2a6fN2RLqXi68GDfgSZgi8/x+/rr255OOqwq+0L/J4BYtoSJA?=
 =?us-ascii?Q?b0Mrzlwy9JZ298Qc7J10wphond0OpoODfaOEGNlua5t2W/Q1xq2YCApMZhKn?=
 =?us-ascii?Q?zeLuHwsJQGpUg9MrY1tsgVCdk5wuKGUJf01IbxW3ZIyUC0AsnBOy?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0044e0-5a9d-4e2d-f603-08de4c3974fa
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 09:04:39.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTOgQWEqXOhuGZAHNRW8d93Px/OCmRNA/wDQQY6wIN0LwJWTnbMQu7olpy0sYsE1YWl5dtKO0AKnm02tW2Ya+f7QwqjgJbmvX9WGh07Gq9rp7mkyO2T0FbANXmdUQHQx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB2001

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

Add bindings for Omnivision OS05B10 sensor.

Add MAINTAINERS entry for Omnivision OS05B10 binding documentation

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
new file mode 100644
index 000000000000..b76771d81851
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS05B10 Image Sensor
+
+maintainers:
+  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+
+description:
+  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
+  1/2.78" optical format.
+
+properties:
+  compatible:
+    const: ovti,os05b10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital Domain Power Supply (1.2v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@36 {
+            compatible = "ovti,os05b10";
+            reg = <0x36>;
+            clocks = <&os05b10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os05b10_avdd_2v8>;
+            dvdd-supply = <&os05b10_dvdd_1v2>;
+            dovdd-supply = <&os05b10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 663e86eb9ff1..c85915d5d20e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19234,6 +19234,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS05B10 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+
 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
--
2.34.1


