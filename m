Return-Path: <linux-media+bounces-49783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5046CEB6B2
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 08:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15343302D5E6
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 07:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B968230FF32;
	Wed, 31 Dec 2025 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="PXN0DNCh"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021110.outbound.protection.outlook.com [40.107.51.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C22474C14;
	Wed, 31 Dec 2025 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767164846; cv=fail; b=eFTxuDMVEWulLI8oRxbNHTacMFfHbtGJiIrrNoi50/aeavAGEZS7Ym3deahajvX7fJSdz0DqYKxlIeVWsqqLFKY5gVclNKdMkHpNmnBjIQSGAzPGr8TUHbUhxO5xEMt2P/0SyzSyCTbmrzp+XB1sDIMg2UMQJ3T5egyxupskcCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767164846; c=relaxed/simple;
	bh=4uquAgiusq3hyeXx59e2J+J/JShq9iFBt3tUhy8GobE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QJwQhxerMNu7FpXm2G/6Wzb9B8gbhKWDN5sVh5t5s/cJo3+ev/faJgSuk/fk15Yg8TnnK6K8ISKv6r3AyWws7pVHmfsNYchodr+/oZp7yAEZJJUvO75p7RqG83sajAaYwDIALl24/6/tp3gBmO7er1o/K3+hl+Oh1IbBanxYE/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=PXN0DNCh; arc=fail smtp.client-ip=40.107.51.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5o5lYBBooEEJq3br6TZ6cN5hy1RGIA54YNuH6nLxBXgqyuWTHM+33boZa5evJ4EIUvcsclzNcFFFPyXod6CIg6O12jTTRlpnRKLVTC1dFq0HjoFzW7rroRK2lUU6rd5vsqilNejkSNGIsLDvrB0feQbdmfowU5QgPjPx7IxHbvM8LjeOnRGqQD9M5WT568qzo0ARNj7XkolkN0X3/fxhu4MFDqGOLsBxUXAmThZYpwgwDQKCVzkLxW6FnISAWppOcfy3xMdcFZmoRX8U1rgBn1HVR9fFGtdpjSqaM2WX1Nx3+bN0i7g8ksBqQNPFBuS/T3Gw2ZkxCPl/P7S5xmdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiApiGOjr4E2RHjq9JKml/UvJRwi4rYFCUeZRp4QtC4=;
 b=hUwH/tFZItMkLKHVjvh7MJOo2y4VEE1kEuATol7b8TSGgoY5v/i1fqYJDVvgFmJsJZNEqWyhrHtdoe3FAkvXQTRgct4i5XDquOVqUNnZ5vDSVgD35W918RBKZfEon8yxYQQNzjCEmg0JNyOPiMyWUmQXa2gcFcyPdXSOskipWrJg36Q5yXFYNeaQDbznPxSjinEN3+0WfXo3xo2YM7u8nhV10a/mmZQDTaoM3jaCPPV6ZcOiBhPdzKnTYn8LWpjZYDlpZ/JGfWvMB1Xb5Lwmv/51YZ9Xcy7B0oi+e7F8gkU0c2Y/C8KjENcJ4yX8X9OdFhiCQGyh2ZvQbjG+GhHseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiApiGOjr4E2RHjq9JKml/UvJRwi4rYFCUeZRp4QtC4=;
 b=PXN0DNChP+7rxh9hjkpsdCcS9L/t21WLmYVfys+gHlE6/Mwtvfmyl802je4lo0A3pKJeq15soz3hQhv3fwopAF+y7zBV0k7Kp2cTNDOj+61I28U0vzddYz2xtvSxGNdRnDKlrys/fBkRJBOV/RgrJ/A6XJ1HKybgvOqm4PduEfwc84QhwvIYT17hVqgONP2cU7ywWKEe/TvHEqBoZ2RyGGlso0bkfaWy3qljNs4qJ7JWwYjim9wDTSI/2PQ2s6n2Q1QHM35dT4chDawZHssRQVpn8NxnXN3BHj9a+3sv0ShKNNSOHNlXKeOt3cNDlpYzqLQCwAHCW8JO2WX+DWz2NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN2P287MB2030.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c9::8)
 by PN3PPF4232800D2.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::9e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 07:07:19 +0000
Received: from PN2P287MB2030.INDP287.PROD.OUTLOOK.COM
 ([fe80::85bb:6572:ae6c:5a15]) by PN2P287MB2030.INDP287.PROD.OUTLOOK.COM
 ([fe80::85bb:6572:ae6c:5a15%3]) with mapi id 15.20.9456.008; Wed, 31 Dec 2025
 07:07:19 +0000
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
Subject: [PATCH v7 0/2] media: i2c: Add os05b10 camera sensor driver
Date: Wed, 31 Dec 2025 12:36:36 +0530
Message-Id: <20251231070645.16434-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::11) To PN2P287MB2030.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1c9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2P287MB2030:EE_|PN3PPF4232800D2:EE_
X-MS-Office365-Filtering-Correlation-Id: c297f54a-b516-4f7f-252f-08de483b3d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?91fNknkpnFoQz1waTRYBdIeasoK1jn9r3nYxduoO7lpAdRWgY8pIjl4w5dYA?=
 =?us-ascii?Q?VYRrOoN2Cchlluj3jEBxEchOW8T2avFerbVmlj2XgY6w97fMXymLhMo5+mfO?=
 =?us-ascii?Q?lvJE/QSRxFrIzX0VosCfOVGWdtzfxO262sdev13NaIykjG44e9tR76q0aEhs?=
 =?us-ascii?Q?5KEwYbp484hyqMtABsk0fFxpNUfXm61OM5KqOubnO2L5TbbRumLklNJ+fZwm?=
 =?us-ascii?Q?Ga9a0/4pHJXJhOm8IufX2/HUr/W6ZFffai2aZoTGvcYmbdQa2SWS6Sv7yykn?=
 =?us-ascii?Q?Dy0mLdNlWV8zfsZBWcnfIMhS3kwlG4UfNeC8uIsHQkN0ynNdyd996jUDiwq3?=
 =?us-ascii?Q?62n//LpkLBhZp/WFus7HChKo3v0bemH3CobvvX74eIERy4xWSvCUo7wN4Rdg?=
 =?us-ascii?Q?PY2s9yeKJrnMJ6PHrX2nfvvCV+v9RWwiSZkH+xDCuOKG2rdt5zmaGTby+50v?=
 =?us-ascii?Q?+H0XJYMGWsmvJ24tgsMa1sxka/9WOL3USjRArvnDPi2QDZ3i0IHcJbnnGXCU?=
 =?us-ascii?Q?ANHKxGGrTRFJFXqSixXQlJm2p5NFkm3Zl20ik//ufNfRxzvqa/yREuHwgGpv?=
 =?us-ascii?Q?lh629KBwc3YGzQgD803ZKdLsXTBjXvFQwr7u5VRBCrrcH8Z3K+O90DAJ3h4B?=
 =?us-ascii?Q?eJ9AZjs8vo0EJPqZJKaNrwbLC2VYT7BE9dFALX+yU7Fm4dJ2q5gO6LRfOjRh?=
 =?us-ascii?Q?86q/II+RccUSwEJbpWmc8FT1Net5L16bTrZQcW8lhnzykEaxxz6GgUofXkv3?=
 =?us-ascii?Q?Dg9Jf8ZJG/mEdrkga1UTX3cUdqnM8zyp7OlEyOBe8+EA4EA11RQVEn3c1woF?=
 =?us-ascii?Q?HF2d0hdU1+jyojs6Mzj+A9KuVBQufHt29im7d6mMgQx7Xr5ibgnMS5CUOx/e?=
 =?us-ascii?Q?+kDjpKtgFJBJTcGNdXqOHzkyU/TS/5hOE9S4BolLAptT3yDSUQHUhWrnrj6/?=
 =?us-ascii?Q?CfQwH0n8AdIaUxB/mGUxHePUYdbvBMA+3Zn3b1JiSYlwSZ0FZEv2wS+Lpj5F?=
 =?us-ascii?Q?TYGlEPDfE5IZilVIzARs5O6VDYprEffvYfWJin71FkbfvwQFsw2Kj5Oc2b8U?=
 =?us-ascii?Q?zIV2C3vJkdVoX29au3oBZhZcd+uUdIiOc9URdN7WkZ418YILJGGaSJJ9tvsf?=
 =?us-ascii?Q?uQCRTgU4W1GqMYm3yPTLXFm0l0BdnGY51ISQ/jqnxO6rHoMzennXwis0yt0O?=
 =?us-ascii?Q?Meuqlg6DA77eKLeliL+SP/LbYlQeTVPrSougRTOzndqDTlCVcgH8freuFEeD?=
 =?us-ascii?Q?7DKVuUwWz0B2Zb0XhoQXZNbcBugmQhzbdRIdVBX23p13LY+KsSLmz8R4wROO?=
 =?us-ascii?Q?HAi9vRisbQGQWUFiu/Y89IRyBEq+8S8kcPzT2+3/rNt4Y70xagOj3SztmYXM?=
 =?us-ascii?Q?h8tWL5LzesOawXR/v4v31efVosUKvxYBZQrpj7tm4o8N25IZC14JmHsg5bBE?=
 =?us-ascii?Q?ZAt4Okt7n6GFJFv54pIQ3WGhE9epypNcIIIIwt2ceIuzgfzEiDqp+m3kr0mR?=
 =?us-ascii?Q?YDASYCr8KrG1bYgtOIjlrY4mL0ArqLenvCae?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB2030.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H9bdyGdDyoFSdv5Rk6J19COes1uImL2yxEEResqPcBxdU9B5XkePovCIr7Lf?=
 =?us-ascii?Q?5IKHAbAwIxMfPgGHC/d1lRxDWlOA/OMD1K23lwEg4ZkBtzSPFd6DsJ759Bwq?=
 =?us-ascii?Q?65qD2geGsHgR99bS6rsXAnQDOVHDEb5gUnbHB4Pzh89nTjf63VgnIFBGH8EO?=
 =?us-ascii?Q?oV/FzTu346nRTvJ47qmioI6V+/ouRgAqwXN2BQy2b0UlQ2foGq89k6LNHarr?=
 =?us-ascii?Q?gKZHPMHUThCFUu+w9RgWSCIYSBIvXae9o6SSph8USEECWlN+6Ug5QgYN8GTs?=
 =?us-ascii?Q?j9YSjU8HtiDl0QmzvZP2pstyHhE6hrZYW8HkCqRF7Mm74vOsXtw/M9fehQoy?=
 =?us-ascii?Q?LnGycB0X+Q2rHWbUsaAezmezlANZMNiF1DQ18gQOraqKTmtmS1aUQ9nPWhTH?=
 =?us-ascii?Q?OzwwWstEzInZwiYQxuqd/34ax7Jpx1B7f0lJvDhX1IGUKXoOY/n9IAW9qmrB?=
 =?us-ascii?Q?gteVe1Pito7bHFeTzC93dXvnsgcB8e4u7OkschSRpsL5eJOm0iGWSX2vRt7H?=
 =?us-ascii?Q?1l993FdQ9paGTY5qY7XkkZXP2A08CVoNuU2NWzOeC8weMnGIZaEZAEkisZQK?=
 =?us-ascii?Q?0sRIVtOLnc3DsRmyYaieomjr/TpPcMwFBjiGwqWb5Sob2cSzitalgzZRsspC?=
 =?us-ascii?Q?XfCxi/QUw8Wi9QVDnX8Zj0/qU9CLTOvaMtCSpy0oadq9PbwtEx7XyAv+aGbW?=
 =?us-ascii?Q?ldxvos4AlN34HNV+RnYJ576oZE37ZDMOyXfllo4HqhAndS3uG5JlvfGsxbNr?=
 =?us-ascii?Q?85sJfUdzu95PpvomNhYsMRYC+8beJLpxvqriECdzgvl8MJdunNtClGwafH7X?=
 =?us-ascii?Q?IYRouMKjvLFA4hrsOJxNSgKVOW8EsX8+FtQHpTB98SlqOfTGBCZbMbjzBIco?=
 =?us-ascii?Q?eo+P8sLqJ5e+FpfI9WbyB9EJ/7OQLVJkYw1GYTkU4tUFNzpqO3Wo40RRrdkT?=
 =?us-ascii?Q?6oIxvK0Iu0nF9YMW3cC6Y7+Ml9/7vCmFHUfV2J70bzMKEYPFwRWMg7SjF3s6?=
 =?us-ascii?Q?gG9sm70S5qiPaZJ8YU93plXt2DyMkmthuFgIzT35oAYnSwH8cdP6NApGvKpY?=
 =?us-ascii?Q?fxQO1vk9aPME8Wp0cC7w91LEoq9YsIc3IKFWsuEPiMuv55LQtrpy8Qht92d+?=
 =?us-ascii?Q?4XvO5q/4kDto+i3ukkImhMmQzJ+pbkNZ/mPYrVnOp5EBbGSI31tTqOvhUXbH?=
 =?us-ascii?Q?dxnF+SJJ+ZYw4jwEAn8GeJ2eMNYjOjoMMGXQeinPooincz0t7eeEr5h8WQTc?=
 =?us-ascii?Q?6aBNC+m6YhBXHPqQieOdSRyBSfmekgqRTGsMW5jaWPrKSVXVPghzR+GO8Vkb?=
 =?us-ascii?Q?4rNEePTs0wYHotT33BKcSB4F8+v41gFSgpdjjbxeUaPBcD3tjivqWKvy97Fg?=
 =?us-ascii?Q?eX2KFZ3tYCLyBN55PqS5/8AgqfOnwzfWmc1NY8TgxLx2YdeJfZwuh6DZgDKi?=
 =?us-ascii?Q?+ST2kNfOAVEzyIhzN6is2TukupDpxKuOOFKQjO0SjyolrPAcbfhe9Fev2VYI?=
 =?us-ascii?Q?D2kpxRaAxZc7wCu0e7uLwp2oGQmyg0F7XGSZOS9q5/z+xJcbqbmslxK4wLa4?=
 =?us-ascii?Q?BltgOxd8BxkmAf0cvyls/C+Ko0SxQ9HOc9CXQnoWrFfpkQVLzK59yR2s1pOg?=
 =?us-ascii?Q?JH6L+I2PVM/fJz1+Ffl2/In5EnQl3nWe0i38Zrxv5CezKhGclHepY49uUDv4?=
 =?us-ascii?Q?o9M036+Pz29Jpp9tFZo0qV4uLJ3N6507p/7HmQfs2AR73o7N8FuYKi8hfJUX?=
 =?us-ascii?Q?ZdV4QHpjugLJebvJ9rmC/vmd9mNQhQ7DrTCGSd93bdk3WSdKk7F4?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c297f54a-b516-4f7f-252f-08de483b3d01
X-MS-Exchange-CrossTenant-AuthSource: PN2P287MB2030.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 07:07:19.7927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1Pe7ybZc4UXGAfmMp/4um/D1XjS9FzX12XzW5uSF7xp8tiyLXpZ9rKUxWluE7tvt2wpUJGVd5v8d+ELdwCje0d7zxjim9s9+dqPGnFCm4Hldnlywl115eMk2HB0Emkn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF4232800D2

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

v6 -> v7

In Patch 2/2:
- dropped __func__ from print statements
- Switch to fwnode_graph_get_endpoint_by_id().

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
 drivers/media/i2c/os05b10.c                   | 1115 +++++++++++++++++
 5 files changed, 1237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 create mode 100644 drivers/media/i2c/os05b10.c

--
2.34.1


