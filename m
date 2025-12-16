Return-Path: <linux-media+bounces-48851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92878CC1393
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 08:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 018793022AA4
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 07:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3298E336EFB;
	Tue, 16 Dec 2025 07:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="BiuCfwaV"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021106.outbound.protection.outlook.com [40.107.57.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED5933710F;
	Tue, 16 Dec 2025 07:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868429; cv=fail; b=WwbxaoKsLJnM8lzLVlVW1MQ8ntKCvegCJZqWdPTIlaT/SE+4tkW+PbCNh16vZ5RvbYCtoPpZ1YXjtRvf9NTtbuLYY8UgAnz95rW9TlSFUa9nsFktdZNkeWy/CrmQUCqemE4zmhyO1OmKNe+psneiA5uNi4enD/mRO7b3cecTpfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868429; c=relaxed/simple;
	bh=7Kq4ETcfO8ggRNBJfKb8X4lbrDTEolLPkScxUBkAgcg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IJh0Mng/AZLNl5dSopsA6QuuMwLZdgOs978XrWefxEIXNul9sJPRI04lfnQQylZIFbzfJgxFl+ARBHu3aU2T8s8IREydt5YHFDj1qNdIzAMfLEFCBKPqWaDC7x6Bv3vlYzS8ZhtLUGTdBae1M2v7UXF0Olqy6HVB9A4GfsiUsxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=BiuCfwaV; arc=fail smtp.client-ip=40.107.57.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qx0hfU7K1ktZ4mWuQLWYMi4quSzrGidAuIlEFsFuMTMnqIm9NmoiIYsnVatj+UCcMnZy7m1iLT2+xWEaIMkJAxzoa3PUadgVfKVqL4D3EUXpLvwrYh3z76eYPImxWv/WvmW0oE69d5buz9bNiXXo8OFRgsasCdc3kB2DHhM4w74U0OyEDhA+URkUemnOP2ddpwNoj8A20PY6HYXK+zcAmkzg4P+uIWJu9EIMni6ak5/Oe7LN18aTt5CUsHxDM++R+qvTfvfyL6aOiUZYof+8pcWuVO2iLrFAPp+X4YQ4yZyewrHPGv1NiplIGtGJ2BEY7nh7KM71K2TMkyiyJtfkrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7J8bvJmbbVtYe2xD9QMDsjZvrb5kGsqn5A4qCgd/F74=;
 b=EvKilsZ41WsgP0M81Y2Ics+wxbaU0oWhFPdUw5RPMzl1AQPyr2ut7ZdHCWl7pG7iCiyCGuygxVr3r/QYgWgH/F/HBVnkgoIwwANs5fvCHn56kPj0JH8lMfEZ9DVbC4aWaaEGya97D9Uw749aquy7Oj7cM7DEazlxVdoEBXX+MdrIZQX75YHfeAC7OKxZDRgABxqqVSytC6HYhfZPi2yuLpNcOnQbeU47hzjdvjCZThLHBrZVVKsqi+vdWMfxbtP2AGuqEacnPdpoNKSfHspN7lqrc08lumdG/y5DTVIjDPQoUV5L1183hhOTBU5+3GTil1649NFyNx7UqfVv0+k1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7J8bvJmbbVtYe2xD9QMDsjZvrb5kGsqn5A4qCgd/F74=;
 b=BiuCfwaVSN33GfyHchxd6SwH5z/jU2TgIS4QWTmQxfH2bqqj7RxzwmFVlTpBO6ZGszq433Duz77CEOj+CQ05MlEIhNJM1+2NGtI8thbClFZZsldtCgNA2fGYCQ9I6vGqHeaXlnSbrmvhFzwBK+tAjf/PBbfNpm2jlusLJXib2gF8CU3/gJwZX6eiOdmUNtxbuwsbPfJC5SfVW9hX5CdKO7rWlDHQ1i3S6J1/SPpmUI5DPRNuz9JYjjS904FfWAEVXlc548ZEivUxRXaVjQouIx0UiXtnqLcNZ1aJ3luErI5kg+7DIRXzDcI6+h/4InzssjM1jv7T3ic7qqCUgcJMIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN2P287MB2109.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:00:20 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 07:00:20 +0000
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
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] media: i2c: Add os05b10 camera sensor driver
Date: Tue, 16 Dec 2025 12:29:48 +0530
Message-Id: <20251216065956.13604-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN2P287MB2109:EE_
X-MS-Office365-Filtering-Correlation-Id: ed19595e-4cb3-4ac3-9ca9-08de3c70c6ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XZWpTvJDAQIqrYKhVGeMFZHgToG5NB3saeRCY8I5xfdofAG6mTfA7OjSsvhJ?=
 =?us-ascii?Q?gUDdtM8fV9NCWWBYV7zpUeC8ghlvcfLTT2Ai82AVu+V1C1u+Z7HDuE9BuiCj?=
 =?us-ascii?Q?YMleDJLHjTAKhCOmLx3WaU2Rg12ZcECgPwkbGKddng3544t9vuYrf4OdIPMG?=
 =?us-ascii?Q?FiTY9H63etBi6o7zVCAFyxGWXcw0vT+6Qrc9y33+65YfO1RW90MjGF5D+2OP?=
 =?us-ascii?Q?syqWvdoUg0kpTNA7Ro5lDDOdUYMP2ANZQxBuYGnutlvCxre5/Ktm26U13d8T?=
 =?us-ascii?Q?+Yl+Iv9Fw4z0PvGXJ8NN1Z+1cVhZXWI4IfvS/cY/sVR9I4gxZ9l9BPAzr1dk?=
 =?us-ascii?Q?9dzT+wkYzZDw0AHhrAsgVIj1/htLXUaGj3KKl5dYJEqYfcZu/x8WakioGdJS?=
 =?us-ascii?Q?c1w3OFADn92MB3TZHU7RDqvT+pIMBvs3Ou4rrT4rt/uHAUW8U17OPk6c2+Pl?=
 =?us-ascii?Q?IYkvE5+IBB0CwqDaTb8mNzGbi5vVXYo6OrL8ujbrj+ulSo+8Hjs5aZkS8CmR?=
 =?us-ascii?Q?Pl3FBEqFzhknbK6ZDTQ2vUFVox5uTKkkFd7DaoLmoA4JsE3D2UAhq0K2weyA?=
 =?us-ascii?Q?v5ECl8+b/076B6VyhlkNNqhvIeOO/S0iihrrvn6vu8+qrnYXedTcr6wTCIl5?=
 =?us-ascii?Q?18ImRK8G0PUURYDOoyALrObszbZV1aFXLQ2Vx6gzH+++lfacYgbfH3MC0Q0J?=
 =?us-ascii?Q?98MtqbtWdOjYKN4fAxr7cyJBgiyuSO4bKI6/ISYp/a+c/HcSHSeUt5g3Q2Y8?=
 =?us-ascii?Q?esoxdtZO6Sk8O0Za7Kk1STqXYJSLhS9ZH5EX7YQzk8C0KremQY3XZWoBjRRF?=
 =?us-ascii?Q?BnHa34RhWvJsOPuhWPnk4v7aPnRI2tdj0izkEHSWGuSMhZ9api7oHUdVjjp7?=
 =?us-ascii?Q?skSVx2Wwf/qXKfUrlgbg+IQ0+rObyJehSEkkckIGyfqepB3sPXGc/NvgfijY?=
 =?us-ascii?Q?nE7vLOgv/DcRk4ityQA6ZzV+xwQ4N5GStiyo3FC9+aZ+8Z0NgzJQkAxGm4kK?=
 =?us-ascii?Q?0BGAKttF0XYj5N23DuXs57MAHwfz0FFC/aRDRPwtIgpoYkxxFHZsiN++bieL?=
 =?us-ascii?Q?9py4cApL7HTEQ8AfoxjuCKPU9aK9z5FzAxvdn0fiX+NPho5DfKs8IPMV+9tj?=
 =?us-ascii?Q?txB9tHALZ3QriIY9BAUgOixpEGOeAgW5z7jF5k3ML3whyklPnVDsc2FguqJd?=
 =?us-ascii?Q?dd2n+ZgZEIKw9sw2zBik/a2GTDEe+nca62BGwQmlew/Qm7Y0HkO/HeoB9vCN?=
 =?us-ascii?Q?M3Q7bD/NnWvIrYbmdFJKwrN7mGW/KgV/emXpaO83EunZgdKT0sedG7snilC8?=
 =?us-ascii?Q?boBUmdZ8+uqlixZ3dkuIBExJ5HAluiIV1B6oMUg0wqmSDDPWju/QOdWqbr6l?=
 =?us-ascii?Q?BmGp2102ahicioyT8RMEHRsta8YXk7pwAH1BKeBuErh4x4FugN/LwFZUrLnH?=
 =?us-ascii?Q?R9+4BnFHaDAKyalEgUm4wAT0w+WT3HwrF6LBVLXFQOiG660fTvDaxkZR4BIn?=
 =?us-ascii?Q?qmOUrRcRdac5UF6fnR12kLI4/GuFnU8JHUyT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?udS7zGtFD6jlEen4ySPtt7mMzZuOtC9NyLoRD2Gj9jioTFaDCaEc9PT0vcHP?=
 =?us-ascii?Q?l2Jhk8deejqbH/ZgGxMqgQXoiouJoKiNxc/0ux66vaduu5n6ToWZStlf/rZi?=
 =?us-ascii?Q?ICM6AsUQ3YrPZEWQCQIwe0HJ05RlG2cW9WvFAEZwyYKWR4zu9gWIfb/1qjIy?=
 =?us-ascii?Q?+eSt3aWnj4HLbFdl7SYN/UPtvepBkYT7l5vrMA7f3/RZxio8+l8IbZu3lUZM?=
 =?us-ascii?Q?vMacENEFKfyuektsiEwOuF0Vkz+vyBHMfZT67hXHK+jVNd8j5adPvaUsiTFa?=
 =?us-ascii?Q?7/x1KZSY24VuaLvkxBnqYHny9JC47E9bLhGOynqlod1clwXrLe053gduAH2n?=
 =?us-ascii?Q?E/s/ZV1yXslsnCgfuqmH1Dw00G0CZGQ1dkqZ1dAbVNcs4QS3Nu5/XRO/PrFi?=
 =?us-ascii?Q?3VoTMpNwpQtLM5RC0y0yD0F7/2KKD1ky14cgulDfI4M5BUGxNwbdksi+X6Jx?=
 =?us-ascii?Q?aFzlM2CSFAv/DYCsJDH4GPqrf/MkoSx9JKCSc9S23CsoBBaCF3MRCkVRsV/U?=
 =?us-ascii?Q?WT8X5GmFefQdsN1pO9tsXC6fRkXSl0GjHVBa+7OSyTZKB/iLwg54qHyLO18A?=
 =?us-ascii?Q?ZRil0/3RCyHKoPpNlIh2ZBqtpE4WJ7YcE8Uno2Cq1RyN5tDio6iD1lH5HDLP?=
 =?us-ascii?Q?fC/VEj/cLkZM5ZgRRhd/6thBThaIMExc9BxfxpJuGbcST4FVxUdumoF6hhbW?=
 =?us-ascii?Q?ez2JdGSzF6i3gcPpIhGPl4zGsNr17XQbMgbN9Aq3z9fYF2rq3b9GMl1pW0Sh?=
 =?us-ascii?Q?aSCG5jEBQ+84daOwHEyUhPZD7iRR+PyTt2kZKBUeb9R7oqap3gz8mNyVTLXb?=
 =?us-ascii?Q?Cxqdr72u1NECNCHZS4+qN1/fhsrL6EjJyKNZMZHYcaMPm5lvU22krnsuks60?=
 =?us-ascii?Q?UhZ4ICMHgNjTbhVKuTuRCbcS+J+5amHwW2wUvWmHwDL3pupPR7rHIPHSMfVS?=
 =?us-ascii?Q?1NehXx2rPuDOtWsqic6WogaI22C8ICwD7sRiPOi69Ykad8L2gM7MuysmmfV7?=
 =?us-ascii?Q?4nfOpDjGTI+iFT++Kfn7Ah0KInicgVeI/0wzKZErqq+rOuLveiTIhTsMa/0E?=
 =?us-ascii?Q?incpVyVXxul0ngw5v6PwV+wYLOmo+s7uaWr4YRliJquCNVSDL9vZI9dH4F1h?=
 =?us-ascii?Q?dCO0Xl8FWZ0/ik9Xmg8MmRj8B7liCSPpjNpplHUflHi0KbO6qZ8AtsmQoXC5?=
 =?us-ascii?Q?vY6qCVY0toOjZHgDoPmIambNr9ST5b9EbrU5CB8jxobs3ky13hNlzqXgAt7J?=
 =?us-ascii?Q?K5QtrDN1baBQORXS7U5qKZU4jcTBHJh2Sx7lMVWGl8zbkiajRG4w/gqZ8bED?=
 =?us-ascii?Q?/9eU9D10VwpegbPvoOqNabX2U6Y3pV6QS+K+4oSxyO50JvbLPDB7byYHGmf1?=
 =?us-ascii?Q?SLZiSBAY79gOVyWnehrEf2LIoSum+GRwFcpO21FWRdrpMfQKAiJbv+BBjuMk?=
 =?us-ascii?Q?h4XtKauk94hv/04aS2D8+Zjmv56Sb1Vgm1440C750TgtSk4v8JTTM+rmOxUf?=
 =?us-ascii?Q?gRU17V/JP73u6TG6Dmj2968I1phRP6/bOFSLFl7mN993yED0TpuTdl9kVxpt?=
 =?us-ascii?Q?flaEZ7sgg9dmkiWXVtkASN/dpNHeem5uflr5NTacFXg6ySHiY4yLranT+1Tg?=
 =?us-ascii?Q?f8rq/tlxK80OKImkbIFc5+I=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: ed19595e-4cb3-4ac3-9ca9-08de3c70c6ee
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:00:20.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ptuoogp3+GReq4F6lyJfCYrRGEELkLgJ9aYNFdJHkaNmbFT1oHy7wg4lHwp4HD+x2zFolMpHgeUlVaLC5y8ctLUMGNG6XfXVw28cEZO5GoVJkwPfmg7IfAE6AoccA2Nr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2109

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

Elgin Perumbilly (1):
  dt-bindings: media: i2c: Add os05b10 sensor

Himanshu Bhavani (1):
  media: i2c: add os05b10 image sensor driver

 .../bindings/media/i2c/ovti,os05b10.yaml      |  103 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/os05b10.c                   | 1110 +++++++++++++++++
 5 files changed, 1232 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 create mode 100644 drivers/media/i2c/os05b10.c

--
2.34.1


