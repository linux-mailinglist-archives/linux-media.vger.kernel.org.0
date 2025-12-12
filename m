Return-Path: <linux-media+bounces-48697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4849ACB85C2
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 10:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF388302AF96
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 09:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA243112B0;
	Fri, 12 Dec 2025 09:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="cz7XsXm6"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021086.outbound.protection.outlook.com [40.107.51.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AB13B8D48;
	Fri, 12 Dec 2025 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530261; cv=fail; b=kFbuMsAJO3FhsmRXPVBzoA3lsxzfDnEwDedAzq5HJQywmGLyBupEtxY0ltZq+NOT9s0z9JlzT5T3hUv2j5Mr8anhCHBSqkVTYG4zHLSOa6G3vFydIqBr6WNRy+KccnIdtfqbC4otYJh0zwpwCfTwebURP8QhvD3QZMO0zl2PS20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530261; c=relaxed/simple;
	bh=KFplI5lHzNwIljr7ZQyv8qcLx2qe1ZFZi76O9moHkvg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=i8ihk3fLftP2c284DbeEgZtIH0Ayc1rRrALrwIXGMIRc6tH8SvDmkYez1TGsF0P86/1Wcykq9SW8WvpSQwbOKjPJiBEab1aVopWpBFmQdqoDkdNqt8hSsQZjCkjnJ9VBqYh6jpXqBJI+hfarf2hehpFCoeNIi9Ack/Yr0WGBku8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=cz7XsXm6; arc=fail smtp.client-ip=40.107.51.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBeQ3SrPP/NBOglrnhWX7FCtxnzDyUDiWO0pfSwA8A8uhMYNO2bDlBS4slYrNqdd6jZlfrpZZoRF+VcNEbBTRiUSSZzfOpYSbI1CQEKbah1Bw88MxbfphIn0Z+fxCAwxhnPD7mjx4OutxCYrYqviZ8s8udw+30f6gsjNC4ltCj7bzoa98djTW5VYFcJdeDKhJ0eYdONH+0JgyJfS15ftqPw3hzwbNRent1Hmn5bMS3K5FsRXS1V73Hs8qmbU8QUZz6TYfjO2+CEAoZ5bR63wLOsP8T3wnrGDCWNQPBtTpcpTXN0WhIQ+phxNF3pzpP2Ai6kOZB58VCQi3ti597Eqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EebfDiYuCLv/XmWAAMz9IGwneXdhGctMZvGn2QAW/Y=;
 b=stmTjrRuiR2jEEVaUX4c9GPH39Z5GyrvxImgCvQe25e291i6XGop1TpDF0VXMkLPnVl6z/ghO94MnUtCWVLV7nfF3PDouMB4j/QiJfTOGZ9R4NTAcXQGnftfo7vjWwsQ8AD6YTq+OHEroNU0XecyFx63elYf4h/bovzOTU0bjUiyHw2prAbB69SSTLybZg2hp7xOqm3SQx75B7kY8Flr2I3AJdkXhX46NNuoewIa0xi9XTnfgvf1bxfc8kA987mUfPbaTQLSDg0xbIKD2TmKYGU37ot/lwi0KoZXFE0nqlSFEZ4McoFOYko6+7TdDi7LV6fr5uVMJTaTOGAyST3C/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EebfDiYuCLv/XmWAAMz9IGwneXdhGctMZvGn2QAW/Y=;
 b=cz7XsXm6LSUoDdaY8ZtzcyqeFO/cwe9wD+qk0E1YbH5H6xKQZgwShEApkuEgLQRC8Mrj3sHFqLUnmDnGdWWTiPYLfIgWhBdsdytg2lo+Elh9hxa7PhDepgNQPfzeHiC4u5+8L1Mhz3v9QiSYu3XPsC2g0yn4A0nG6hDZenT2KkriksneWtXyolt//H8BXQrAIoEenwciUM3Vj7043VTji8T7Cxtj2OTlhKiAdDLIkbRXws+LJs+gSqrEfTZvbmM7aNQPp6wnfWI+ARaBPtsQY2mydUXmNuWzyYc5AMqwyOdW88yWAQQIkRq23+tEgZdILShHSZj+w3SdY32XqPy3Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN2P287MB1963.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:04:13 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:04:13 +0000
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
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: i2c: Add os05b10 camera sensor driver
Date: Fri, 12 Dec 2025 14:33:49 +0530
Message-Id: <20251212090358.44989-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::6) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN2P287MB1963:EE_
X-MS-Office365-Filtering-Correlation-Id: c854dac5-3eb5-45eb-246a-08de395d6b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M3Az/otr3LK98wauNcq6vL3SWippzCdbUN9hl1tcRMvEesx+omfICAs5FeeR?=
 =?us-ascii?Q?WWnEeXuK7olvF2fXocwSYJrsyhMzasTxNT+KOoK82A5ACfy1WpHmlV89kF+3?=
 =?us-ascii?Q?lffkbQQcLAOMCdXRvZelQV4XUmR3TD8ujIJCbiXT9YdXTW7YK07hY5klJaK4?=
 =?us-ascii?Q?MAp1ajPaZ/QC0AHkEtgSGM1JMf5+zjZv+VXOXx99RCeAlkSMQL8/L+AIpgVK?=
 =?us-ascii?Q?J7IZhcM5Paw10zZ1cA2GBdwWURABkYznVEfrkEg8U7U6CQeEturyXFAVDz1z?=
 =?us-ascii?Q?SFpaqRM3b2TBFWVQ8N8TXIiLWRKcUXe6siJ3YoGkidNm9pvIwpmMAWNY8Rey?=
 =?us-ascii?Q?x3q8UNu9v6BRJBNhr6mm//BpMvw320c+CrxPOawcUDcaGtHpSU+1nKepFDKm?=
 =?us-ascii?Q?I577W/U5wlDf3ny4GqtuLPr3ggzLMIRxY45pDL89HMwdw0GDBB7PKf2sX1Nr?=
 =?us-ascii?Q?e5NY9occY8FSZWSHLU04zQAVxTG0hVW2/vbNKtm730P7zoyQH6eWlT9WewZ1?=
 =?us-ascii?Q?OOyT4ExquxlOVkp8jxj7qfIcfIEM7A6ML67Np9Hm1us4Bk17JSkMzaKN+g+K?=
 =?us-ascii?Q?U7uYrQ4uy5/IuMJ465MSNz+4qJIhO02tmCXt5OYs6WXGF9jX65HJj7Sc45Ku?=
 =?us-ascii?Q?cLgdAncyVbpVNanzOOzXLTwinFjp0lGOEiieX8TYTd6lt5ZdtxYVJBPTUo8v?=
 =?us-ascii?Q?+8sdLBHlS6Dj/oPeQ7g4Ors3gNlyRITfSZpJo04E7ZrQWbxnKiUtfJcTW/aK?=
 =?us-ascii?Q?obTPY5uQEWAgZkGj06Lej94d/ZZOAScqHhHK6WsD4C+TNTnTEloV3qLUBeyQ?=
 =?us-ascii?Q?4waFVKXVIHWTQahVILagMr5n+CKsSl6vevHtjfyte5LBevgcchHJnksy/Xla?=
 =?us-ascii?Q?ggPKnFiBCpfeHPRPZ0OpDX8Jz78sZFA5XJ0M8QMKuSE1ercmBy/MCZuEqwLK?=
 =?us-ascii?Q?dQpiJu8HLgVxqUPAphhFQu+1Ouo2kMaq5HZoVFqWNcn7eFQQlsQn2daN7AkH?=
 =?us-ascii?Q?LWgHtIZe1SRSUZv4E3raVIfKwfEOq8nqmzwRYf37/W1A1omiMURM/SMjWrvu?=
 =?us-ascii?Q?jkextZozdj2gyY5nIzqqou2Mz4qjoV4D7/T4C25jGFgwLx4IpL4q7PVJEcgJ?=
 =?us-ascii?Q?VcydnffA9j8gkN+uEZP6iX1bBXFpGbkUf9pCeweDjuvXoWfKAVTncTxjqo28?=
 =?us-ascii?Q?8aYZe1/iL5fUbI/lHgYpgGi2Uv6xpJJ4wMjaelePW8R5y8Hkv4x1ZGr3QVci?=
 =?us-ascii?Q?mQGhWYo2O+2URKBgpfYQ2IAjjrrj5BblBEhEbpGgbr0e3YHaIoQiV0TvVB2o?=
 =?us-ascii?Q?0h5lOH9wdHx1TP5SmgF2OVgbSBfqRDLDSdvK3Ytgu/XGPAHXdp3INEZzfFsy?=
 =?us-ascii?Q?U9VGyyxN56RHjLoHq314SgLOApIg7YIPJ9ocY/Ykz/uAQD/YXlDbFfqTD8ho?=
 =?us-ascii?Q?U1dKmqj8Xgs14pdgSTo+HGFY4HqapYAoXgh8gDk2TxSpDVismkKmR7C0vSyZ?=
 =?us-ascii?Q?I1b/KcuVeoYhxbc+BRr85dRu5XN85dVzK0Zb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kDtcB4OYnxPWvyaDilPhVqxdzrsIK+P1eTPisePzksH2sg3MUk/4u77utfrP?=
 =?us-ascii?Q?fbNA1e/bOptuw9UHrgrTfr9RrZgkNimV6bSZ1XgYQ0QbTJ4LDSWKavBEmVTM?=
 =?us-ascii?Q?7I13Z/trb8ODO0Rpkny3zPF1SgzxyElUsiQPRSPlRbOYKnY/Q0va+8m2S015?=
 =?us-ascii?Q?mEcKmrkX8+eA8Bjz3eqeoHQWdqEXgwK4MBlXSSDoSO4f2LshYBXwSkerr/ze?=
 =?us-ascii?Q?D/PNvFp2k7oVM3nQQ2sTUGnJspq8NGxCyftdCKo7rrl1TwFyUz9ywuAPII2Z?=
 =?us-ascii?Q?i9I5n2X9IcBHXARkoAsIOivuKihYxhNuXqLCF00Ffz1sNz7SXUhtPbLmC1qO?=
 =?us-ascii?Q?JxBmiRW+aigUfj05MDDU1cc1OZqx7hdn0IpXtpyyk6Xc/dFfo/OlD4p/XqSQ?=
 =?us-ascii?Q?j4MPwx3aZHNn5QRPA+R2o9E5ynstgTESsuQxuqy4U9u2fyZVvbt+yRRAW4t2?=
 =?us-ascii?Q?LQkL52NhCDAA6mVrLSZTIRMrpqIdk9VVigoW2sEVQHuIEPlmSs83cT4eC1qb?=
 =?us-ascii?Q?mo0Ofh8frrZbN+U25ipH5IniGtMU8vzRikKzLVDDFcaqGYCEMSSHtOpxRwB2?=
 =?us-ascii?Q?GABLyt8EIRKBBDSYQpyUZVTxzu6eVGmEKiQkxhYd4GC1eFaWLLh0bqZpWZZh?=
 =?us-ascii?Q?U4upVzgKbcZS444Eo+SduOBwoWrld0sJxDyAG/jXGkkIOuZ7Ga4IDtmWjQTQ?=
 =?us-ascii?Q?FpiRQtxfeVk/hD03Wo8fiSDuuU0r22QNurcN+0ZLFrMYzUqZHOnJmuV39TId?=
 =?us-ascii?Q?XjGDwtlK+8kRwUHpDL/nd3ilCmRGDhYjXeiHggeouMyMPhLZ8iK48akQye7v?=
 =?us-ascii?Q?UgyDLzEgxhvzvuH0qwAPDql4lvWRf4ca5/q9MyVHapw7NWoxbHqnKhBqE3s1?=
 =?us-ascii?Q?wcI2C+12BjrB0gq7yvuOIFivMlio9vUIi2u/5Y1Bae8PTymmGzgeYRu0xm6A?=
 =?us-ascii?Q?wfzl3AIK8Ho0eizUU10GO9IgH+BNGbArdpcYZX/Tf988Uu6cYhGxGDHAYzFe?=
 =?us-ascii?Q?MDucgv9yZ36h7subKodYA6TCP6gISCnvPSTkVkDQQEp6FHGcKd1LeYykbok3?=
 =?us-ascii?Q?g29zU5OYaBbUpXyqAHN7utMR8SgFGoecCw2JlaX930EUwNiQQSVTPqI/V1K9?=
 =?us-ascii?Q?qtsb3yqBo/szbMk6+tpgkkapx+ZvwIDSIlAw/A74j2fKkAQuXKZtOkKvFprY?=
 =?us-ascii?Q?0+Z2XU9cNuGIRAaPUC7gJm+f77/ArTAVSTwrr7s845paUhx+NNHE2nOyxErI?=
 =?us-ascii?Q?m9rgPOsAycoCaNV6MOsNerrQ0qtmZoFk8DXCcZjI1EYfOxKwVlWRI5ee8An0?=
 =?us-ascii?Q?HkxGXEPGO1e68tkdNpvL3KuwY6j/8py547lI/1bptBYTuytrJs+yi4rGK1KR?=
 =?us-ascii?Q?B9MaUtvhnZcYAAGx7m0LEi80r9RtaSDNXRVtl+3XO8AmR1XqlrD0rZjOfyOo?=
 =?us-ascii?Q?OX8xpxnYtOyiJj0i7NBouBlgG1NK9NVYN4cWsK/y+aMMSz18bWUxgoQb+3cj?=
 =?us-ascii?Q?edt7YnfHJhOcTOf+poXjGEg8VNO5QqOK3NtSjg1f/c+yizxvZM9QTpqNUax5?=
 =?us-ascii?Q?2HNKcAVFKmNRQU2382Djn4rmiugHD+e+lEgjadKPK3B5yuGE7hpZ24P6E5U1?=
 =?us-ascii?Q?gptpnfzgltuJj55wOJ+amZM=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c854dac5-3eb5-45eb-246a-08de395d6b97
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:04:13.4079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bcSjDIpFOatfYXWeEiOf7QwwxHr41rKSm0M9AU9ip+TZ23vtvvQCl15vfEVTbdntoblZUqxqjLzRt1xmKhVgF0JnZEEcI6M1WsIJULtLoWOb5W7bPFR1ufcMf6AZwu2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1963

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
 drivers/media/i2c/os05b10.c                   | 1115 +++++++++++++++++
 5 files changed, 1237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 create mode 100644 drivers/media/i2c/os05b10.c

--
2.34.1


