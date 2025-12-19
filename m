Return-Path: <linux-media+bounces-49138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD8ECCF044
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5EBA3012ED2
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 08:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1522C1788;
	Fri, 19 Dec 2025 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Psx6y1dU"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021125.outbound.protection.outlook.com [40.107.57.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF203A1E9E;
	Fri, 19 Dec 2025 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766133948; cv=fail; b=k13z1LG6XGebEneNrPPhWbIG/FkajNMvj1E6KTOrTdtM6Nm8Qcfic24/R+bp23t53j0r8ZZOf/ln5lZWb2a4Dz7bpUS5kzcLNeP/3WOVWm/nJMnwOlkhMzHKCBng2gA7DiczATWfBAm6u5Up+H8PH0RPZ0A9hZUJq+zWtPNMuk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766133948; c=relaxed/simple;
	bh=qdCupkfgVxiPDrNPsEemTQUmF4rU8F2tT5b4EYrzWbo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YMkE1OyF3olhIKJvDKBeQpQ4AycrySVLJ2E08hFeoxMlnQsz1Hl3veX+wkQIwBHZYFNoLP2WZQoTBGvF/eBghZ1Av5bYXlyo2rNmx//lVhO+fn1LEDF94w5/Bs/Js9lcW9m4clcxJrCHkxou75SStEgFOT+6D5sraLdradJX+Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Psx6y1dU; arc=fail smtp.client-ip=40.107.57.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiUoUbqhn+VqUmtiJAdLnxrJZmfBl4K/0bPN7B5zRqQnP9qA7KI0DpQvseQsJS6FBcz06RnXoQyCmyZjtyGJ0oo31IEYKuw09JxKjMAidUbWTx35QnkeWPPv8pKmSMTJ1h6gijD4Wd9UPSuCPlMPHt8+i4/q7vuLOcI/31yGguX50lTsqt+WH5kbG0Qr7AflToEYJVw+XamwB/ebIK8DD0yDuOWROgNXgXbz8amPm43gPwTk8npCxP0zjp1MvFtnw5dcYzWtO5AXuO8K5u8su2Bxaw7PzyuZPtpreERtyApSzUW8z+YbVx2mutrvpVzeC9YHzhRSsviIURHWAhstng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgzfKj1F3ARXLxn3T+57Xume0A87mrSyGEZmcehyByM=;
 b=K0V+wTmwTffHVy1wCnZv8BB6/i2vyZGqXaI8Ltlc/RGWR63MFGOM4J0dygq0I7ZaHMEw3/XSSNDYnInxpnc7ADUoujcBPfEy3Bhx//YTcbrAgbDwsa0PDyvF5oQi6B+RK7k60+zRZ9dooCPLyT/dj0oV/fcrz8ujKXVVr/y0vT5Sv0hZF1qQiwSStebusCVvVrShcVjZvg2KwBSVMT1wWZcFFFf1I5Fy3xpyxll9S5WsXGK15QCA5A0rKBaPyjLEWZ+Sg/GuLQops1Xsbx8PxSAFM0vXgvknWhRZWUPt0kf0cZSEB1qucl1pQuPDt4hz14JtnE7HwdRGbJyfMd4BFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgzfKj1F3ARXLxn3T+57Xume0A87mrSyGEZmcehyByM=;
 b=Psx6y1dUug1hhrU+uNnrX0G72gFsZcVp2tkEfN+CFCHdaY55HA4SWzFZAZ7nXq+SkwbOrkgX3ZeBmTfENE9tUKtjItsXX0Uy7AweR/686Gg+lSz8skV0yl++IBvMnpSwU9RxYOF6SCDVhYSgAbQbcQPwgU1M8IrWruvOLZIrFdXEUUAj3m/ppQFgGrnAvU4VzJgMSJun3rrmmStISE1bAvnsQzjMu/UJtnadgwuXwe1nABLe9TNo+MZm8596l8FPvHO60iGSQJte6RA3P1OO+c/w27qG0z3KrJT7kvWmOzDEOIAtMIfubH/2/+HgFihSEz62mtWx5IuQVNT5m8eI5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB1066.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 08:45:42 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 08:45:42 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2]  media: i2c: Add os05b10 camera sensor driver
Date: Fri, 19 Dec 2025 14:15:17 +0530
Message-Id: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::9) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA0P287MB1066:EE_
X-MS-Office365-Filtering-Correlation-Id: a45269fd-65a1-4eb9-a878-08de3edafe32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xw50iaZJCG+kBTZFoQ2Y/JrqTdnfVZ5rYjYcyVB9MoUYEA3TswuKwHA/8MsW?=
 =?us-ascii?Q?iX/z5O//7uMGLGgOdUGZE/nXThDlq8MmxTrwpyLnRkwSRHxEt7bg9yuqxon5?=
 =?us-ascii?Q?2t48RxxUYCjsSXawmpIFe/y+frTHcgY4l7hr4RDm5fiMJoPVRa+5takRQWhN?=
 =?us-ascii?Q?tyDiUcs2nUTh+uln3uBjSFxZV18X7kheF273cpiTZ9olh775bJjF2h69ae9a?=
 =?us-ascii?Q?/gbts9+2fRQmZ45nTYFn3aM0paQEQp9BbemEzRvHSWs/oP8DzU5uD6xj1rrK?=
 =?us-ascii?Q?abp9YSo/C8RFvTGmxcyxU7A0Ki0IeNkGmd8d8GSp/ypPvPxzq+s6YC+ZfRpJ?=
 =?us-ascii?Q?NrhA/Oo5UrQSs/Pv2u7oVyNjf5uLO75bCJHt3XJ7pQepy5wL4t/N8XoX+sIH?=
 =?us-ascii?Q?j2PBzCc+XPQxgJoOrcOPvRGzY/Lownzdqs9mKFLJ/lCOMTlEA5YG4yrh+/X0?=
 =?us-ascii?Q?hrrtBPRphP0uuy2kM+9P87jU9VdAKPxmxelYgqUpcPruduT+vwdKeb2LlUr6?=
 =?us-ascii?Q?X9nLMml6+cool9F+eKJZn/YSM1ozVZ/jyBkjYBW5b+22N+uJS/XXaT6Yr8TX?=
 =?us-ascii?Q?JRmsKceVeBzUeGwcF5ndtHLPdxvIlX3f+pKSJm/vGmXVKruBiGAKxcLRwKrA?=
 =?us-ascii?Q?DzPjnFYk/rk6h0QETd78t/U26itEU1PjBPP3BQ5CmVRUG2H0XJ2mE4/tu6dO?=
 =?us-ascii?Q?jTG1xww7rnI83gWwZI3nHaUr3p8np3PYNq9pBWithkkbbZVfui9NnFFdpXqX?=
 =?us-ascii?Q?aYIKONtvu2IOZ3IyNNZZ3slKsZ7K1Sc+Dv/68tUXrBha+k7zXcmHHIXbxfp8?=
 =?us-ascii?Q?7eMo1/nbPE5YywbYOQ0vyAeVPd2fGzbRpFcteaZDEBDQstHEUsoG+1FjikZ7?=
 =?us-ascii?Q?MYaQlcEMJDfFjQoKoU1VFaoRoI0S1lKClOCOOhBKqXg7fufVMtcxpYk+FwcC?=
 =?us-ascii?Q?vyO50R5cgyyvZOPFZxL26ojCS2+UiqHXcsYHFU/dM1dNRgHU31sNTZpPOQRV?=
 =?us-ascii?Q?pNULkT4AtSdG+ac+9H1RYGIKUH+9g/96dNFNCZeQYVAuVkbyNwynybcugwzz?=
 =?us-ascii?Q?wJjqUavyo4Wn3pJjAzfoBG2pYysDYuIdfemkf4pRHH6YGJGKlCKsMY9/S6qy?=
 =?us-ascii?Q?/5YNKKm31HzdH0ZLFWg5kf6gjWxBg4dT7zIqqe+HMUDXbRSY3IQ0DJYMr3uL?=
 =?us-ascii?Q?aLOGsttilDzZC1DNUDjSGir1PFdsa95UkfBrZZvs/ggJ3axk5HN0x5Qxymtp?=
 =?us-ascii?Q?58u4Kh8pj1M4JtxcqVWGWMKV1wcLn/S24FddkHuh/W8neTF2E+4beKg7s1uQ?=
 =?us-ascii?Q?IOhBvVe4dk9edg4+stNzTP0v/WAnZMKfmc4cCCfchbeIS2lIO7O0RSqJ1Zl6?=
 =?us-ascii?Q?NLKxpi25F9W0j+AMSM0b0fS+c39dxg8pfJK68RGlK81ZCNc75yMq3fFix/Cl?=
 =?us-ascii?Q?SN0g/+mdeSWzzpZtNbIdr1Hk7MtpZo9EF5ao+2wlSsLvhJrN9oJ9mA1fwvF4?=
 =?us-ascii?Q?0CxMGHO2IM4e21M+aB94cttKG6nwhYNWnKK5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OjuazQh9+5o6/nokVOlW/FdX1z0xJqpAitC9J3jTWZ7ORoBtg9iLon6cIwcD?=
 =?us-ascii?Q?MPc4aYFhI3REuSMJGbIjColeAhh/420JZeK7VpZEq3AeuvJy3Vj9y3H+ePHD?=
 =?us-ascii?Q?ZWnYRgQE5EBctcy3u2xczxGRegsk2N5jhWWL39EpDF7hSZDbhA0mnYDnBvc6?=
 =?us-ascii?Q?rHgw02RkfT3cmLDMWUfNzh1LxQqGGxDqnD9abwWxHKv/sr6D/co5w1qsM/Kd?=
 =?us-ascii?Q?J8RPcbNPq+fVo9JSfvACnoC57U/ZLVdfRvsCQIaDopPNdPojsvbgAqtLCW0S?=
 =?us-ascii?Q?YLfwJ4cyIWxPbQXSvSzRAU9AxhWjKTf4n3KmP23YT8I76G1qyihnJIPhxod0?=
 =?us-ascii?Q?bzUIy8+LCCrVT4436g5pFHrYOYuzniMksYleaoWRjzgxms6Ep1KwJjhBmwbM?=
 =?us-ascii?Q?8BwwWgQzSXjLYn8eYfmZGMfn8jQWNqMn9fRI/mWzfk8pWZshKu7bl4armQyC?=
 =?us-ascii?Q?lovdu9MmO9rS+jnH+TpIXnWZhOeJJQJ6MH+M3ntDY+ibqevDss2TsTxr520p?=
 =?us-ascii?Q?BuJ6B5eY/tPmW0D/4avNQTl5qfIA0rWm24MPmQq9nIQZTn0nD3rwp+bsa7em?=
 =?us-ascii?Q?2Y02aXgM0cA6Z5U+AFTKnvPnYdIeBNC4DL/kNXXMRSoO2kDBBYwNgl4kmTjd?=
 =?us-ascii?Q?ZVB8ogMqqp3cGu9LosFhBP5eLLnsErTIL6CnEM8UfrSnwGCWdqGbrG2YfyBM?=
 =?us-ascii?Q?0DjVIDYq2TWWzTimI1nZCdMsMQcNgccCkmTr+rBZTlD+X+Wa9WLYQoPcH/4t?=
 =?us-ascii?Q?BTjwsbx8XkaN0An8Cc5DzYTysy1vXwpzM4C8Xe4wO90lc7MA4pvbJY9/w/MG?=
 =?us-ascii?Q?RvkLc58t3T/i3UaLwsuhpSTRZyg645bY3P7ifcaWHXEf4JSbQr8t1qKNtbhg?=
 =?us-ascii?Q?fxhBqoAKuh5EX+BSD6L7pXGcnksxScKR47mU0ifLMlL+SD8yQeWCfARkD7/B?=
 =?us-ascii?Q?wVEGtctOOF4SisZQ2woGbkM7p8kCA2W8uUTj+T7OombpD6Es9RSnVyTsl6+F?=
 =?us-ascii?Q?6K76Yp0BKd9sWYhsAQH0KvSQr4iSoq3K1S1DTa3UxzMVQpc+tJf/TDjXxTuj?=
 =?us-ascii?Q?LVZ69HGwRdd8pfaOPoeIMgxJdyT793Z9TlDMqvkQvHUp31zH6XewcH1dIpfw?=
 =?us-ascii?Q?zyybjc/YzjnTc7AeAl7ipgDYqdoVOU9IZ9p0rV+f1pWlQUsO3GtOzEkzW0KH?=
 =?us-ascii?Q?/+hmbD+jgOm3S16LwwtJ+uj62JknLTMPZ78TvRf1wcMbEbTluBAvA68lXMm2?=
 =?us-ascii?Q?5t84FCXie3djrJAf90mQuB73qTMF+YT/FQOnzFCAA587N9t8Uri7Aad2zi8/?=
 =?us-ascii?Q?sCzs6IAtQ1nKeRLru+nJ/nOtVoKLOqH0wtEf8k9by664cY2kDUgNs6nXvjiP?=
 =?us-ascii?Q?LvUWuqJ0TAtWU3slabEDHVlApxB6ouzq2827JcywhcQla1UIKIDAZhHdLR8i?=
 =?us-ascii?Q?V2ra9nemVqEpcW69BDKX62+gKYk6AW0QQLEQjKbRpaDlMmr3cA9b+hTL3j7v?=
 =?us-ascii?Q?s4ejRXxpXNaqaq6meZUT5RCV+aG7bDU75n7JMcboFA01aob5HMLMQK6Ewf6d?=
 =?us-ascii?Q?h2pkMNG6g7MXeDSoO3DoZ4/3PnnfLacwvvcrN4plmURUT9pQYf3SC/4hw+aO?=
 =?us-ascii?Q?pLXtO5ZNTogrTE4hl2wej1Y=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: a45269fd-65a1-4eb9-a878-08de3edafe32
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:45:42.3538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5P55HF1ylYcOKUDF4c92ofmHb13eXb9Y8tw1I3FxYYDW+NMflQbMlIuIyAcsaaP00ZcKJou9dITl518lUQJnWG+Pg4/RTAkSk9O4r5s7WZaPU+JJSNg3z139kDvuMWY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1066

The Omnivision OS05B10 is a 1/2.78-Inch CMOS image sensor with an
active array size of 2592 x 1944.

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Supported resolution: 2592 x 1944 @ 60fps (SBGGR10).

The driver is tested on mainline branch v6.17 on IMX8MP Verdin Toradex.

v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 6.17.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 9 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev3: 44, Succeeded: 44, Failed: 0, Warnings: 0

v5 -> v6

In Patch 2/2:
- removed the unnecessary header includes
- Misc cleanups as per review feedback
- fixed reset gpios to devm_gpiod_get_optional()

v4 -> v5

In Patch 2/2:
- removed the unused link_freq_index

v3 -> v4

In Patch 1/2:
- Move supply voltage information from driver comments to DT binding descriptions.

In Patch 2/2:
- removed pixel_rate pointer as control is fixed.
- fixed default statement in os05b10_set_ctrl() to "ret = -EINVAL"
- sort the list in "reverse Chrismas tree"
- remove redundant check from os05b10_enum_frame_size()
- add a check for number of data-lanes

v2 -> v3

In Patch 1/2:
- Fixed space symbol is missing before 'optical'
- Changed the reset pin control to "active low"

In Patch 2/2:
- Correct the module name in Kconfig
- Fixed use of dev_err_probe() on endpoint parse failure
- used devm_v4l2_sensor_clk_get() instead of devm_clk_get()

v1 -> v2

In Patch 1/2:
- Fixed indentation.

In Patch 2/2:
- Fixed bug in probe() removed unused variable "ret"

Elgin Perumbilly (1):
  dt-bindings: media: i2c: Add os05b10 sensor

Himanshu Bhavani (1):
  media: i2c: add os05b10 image sensor driver

 .../bindings/media/i2c/ovti,os05b10.yaml      |  103 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/os05b10.c                   | 1108 +++++++++++++++++
 5 files changed, 1230 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 create mode 100644 drivers/media/i2c/os05b10.c

--
2.34.1


