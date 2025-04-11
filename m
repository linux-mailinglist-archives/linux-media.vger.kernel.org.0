Return-Path: <linux-media+bounces-30000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F824A855B8
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 09:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47C799A3672
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 07:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D537293466;
	Fri, 11 Apr 2025 07:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bI9FHnKy"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD628CF4B;
	Fri, 11 Apr 2025 07:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357466; cv=fail; b=XSSeBE5uEhR+wUZ9wsK4zvr+DltPFnzb0mOvosj1N2rpFYywPBGJeNvI6oQQW/DSOxZNpjGS1h2VYFSkTfOXqckUxwsjuRCsCweN7AYejX1APSakkxjanVonfv3E4xNnnTKVxFM7g6HMlx1P+P777Yh/ATIM/nqLmDZHMYGFATs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357466; c=relaxed/simple;
	bh=uLZkDebR0QH8JMrAkvn/qtp0EKXj47Jn1HYsgPbqXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RX81mR6t70+Doo6hW3W/cPW/QoytJCfxiDznUlAt9g0Rg6n+9npD7fEoh6W5z0MhtpTU7ktqaKahwQuIqoImtkQnLPPJxE9cLBDAvkDCvMSH3XFevyyt0e7CvsWwi6bI9KJeayhbcEho7YyBpS3+jtWnbSdcr0hPs2T6tpSK6D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bI9FHnKy; arc=fail smtp.client-ip=40.107.159.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dS4tDKfiELb/fWcrQauSpyWHX77EdsND4nsU4UPsFMo5E+e8RZje4n6Q63kkUF7HVBAY640mCvQycTw5BCSdcZ1Uwt3/Dc6DgZJNcUUVQc+CleOyWCir6sgccKgYzQ8ghuq9yxj4VILCFv9XP9soPp8VdzIfVqWULM5baqmy60T6oxsHEd2H5VhgGBwCgJBq0YHWF/CwVBQFp0CMXQz0qqm8lQZYzfZA4prnVnXmzxqycRDxaWtR6N/g17FNz9VQi9q0TZ+LX6sdbCSttqFSf6T13P6Ds0S7KDOW7/zYddrbCXUOqSgYt+zMqoSwByCIPmbg2sEOsUabIEu0rl5N7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E08vKhOf2WuIC9zih/brsm2bNqPGo7Fbm/Mk1ai+ErE=;
 b=dY15KwpX//ObuMhCmxu2OueP4lD8q/WCmRcpCtxC2490nHS17hhY5LtiH1xkVoDmBR/HzPcVZQZ6x8MS6sZzsuJpuAkEMAgFwg9GU6sGXRnn3L/bMu+0/N+IibOweCBQEcUuPiNJ+ZJMrniJHShRvj8R5tdK48/ZsKPrOap1TRzO47JkmWLhMWvik9RfqkK92lQTYln60q2WU8Quhz8SAetznsief0OaLBD6AR4aR8GyteG0Z6kwPAQdUWmwxJ1rzG0+iAEFlmXi95adk9L9hv4k4grJK5TFg+CGbnxJyh/c0y6s5+qEpoDHDc9lCQtJT2SVoLrZHDlU6WHOG/BLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E08vKhOf2WuIC9zih/brsm2bNqPGo7Fbm/Mk1ai+ErE=;
 b=bI9FHnKySEiFDuRplVj21QSrIBYW+GMkhQICbXmWCF5n7JKrHEbpIZ8ZFotIAStUyICQrEq1B2D6e3x5WXS+SOgQwU5R+27vsVE6MvewE3WwrdMZPBfrDmRS8BnHVIE2zkDZByraZNarUlIF+TzI5AZS7u5wTTzRnzgeyK4YQp/OWTZjIVpp6xma7qRHBRiZZ+h8+G1aLR/IVLcVI2Z8Q5edEomuuqif97Zza/R/Uc5SmqBBXTWZiClYW78cgCTIuUPBRPo8s2NngDW/IqBDdz8SXpn/RK8kkX0eb6z1sMbBh7EbYUr8SM3mQI3xvQvOI4Wb2387CEE/0+Bco3GWJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 07:44:21 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 07:44:20 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/4] media: imx-jpeg: Fix some motion-jpeg decoding
Date: Fri, 11 Apr 2025 15:43:39 +0800
Message-ID: <20250411074347.809-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 27329c9c-08d7-427f-0291-08dd78ccab6b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6/4+c4PhqdKq90MSA4+NXY2V9JBHcFcV8lOAuHqQHGFKpHmNx6WXwOqWvkFy?=
 =?us-ascii?Q?KJPD50Sn+wUi6jYFQ5xKAkDFY8IqFbLnxB04zxmewUwFScIpLtdJ1i1C3d5S?=
 =?us-ascii?Q?PlVJq8Z7h1QfBr9R6xB9UyOeQB0waTdicBy88/J+L1WWgjYtTRgbaC1PJye3?=
 =?us-ascii?Q?atmhzS49TCdDNDDJRPlSAeCslW+dUl3+obpaY5XDr2y29778QwcEkrTtUmu8?=
 =?us-ascii?Q?l2j6oF7/9USCwBc4mxvBfhIVDWlGBjF1DbkYUGFpqNmx+cRdiGB0VSnq/Z0v?=
 =?us-ascii?Q?HXXk26y8QnJ6SaNqQB/W4NG4h0sj14IBJCAVKwJzSo6ttwjv7m2ipNZln3Ih?=
 =?us-ascii?Q?01x74YOS9MQdLQnvrhAMVZqcW8tGWUrLk9KlmBfOQqUd+XeJGZjyuiT3dhpl?=
 =?us-ascii?Q?jtOLYlQ91tCHMzWb8JPRNC5Ydn7f3et+uFD97YXi2cQQ87M4NTzo4CokWAj1?=
 =?us-ascii?Q?sgf7uuQRl2tdtdUNgJAfbijWDf68oUoHJcfrbd3bLkHw/GCa8D5PVzRCDM+a?=
 =?us-ascii?Q?nHrMTkYBvC070e1jYoc8OdWizpkAgxQoReDpswmy1O4Iin+M404389NrO7wC?=
 =?us-ascii?Q?5iUCA1LCOzP7xHD1wvBOHDUHptn5hsUcBvjCmv+A6gOuFPlHzrb6kJ4wICci?=
 =?us-ascii?Q?R55ZQlWiKm7WsivAZ8dPl52E5VcOuu6/6V0Rq6DXoS8SUfA0WcUyfgOfU9o7?=
 =?us-ascii?Q?9PMs5WIxM0kVvIH2GFeXYle1dTQjsjo/DAhy9g3TunBuOce5Wabqon+AOH6b?=
 =?us-ascii?Q?bScUu+0XK1mWb7AFGHhEgHzIrksQyiOknOQD2wN0cZFNYZeG5zyizB79Dtbw?=
 =?us-ascii?Q?yeuCGlqll2ualD5C9uPIg4par6TTiZLANzG3VbZ8mZl3rgxlo3AMowg1RZFG?=
 =?us-ascii?Q?iKLT6kYz9v/Nnt61r3HRhQ7tPl4BJYjYpgR9RlKYgdXmRpji5Be6/d3Vl88Z?=
 =?us-ascii?Q?4OgGM+TeH6vyBhH4ETeMmMnuK7i6TfQDUExOT7ChnTMi0i1ykJcl4tylN9eT?=
 =?us-ascii?Q?9aP8k8DA3N4g7R4sM94bsGQkrmBIv/6cA18vNpmyeKJxcxtmiNgtsrikah+P?=
 =?us-ascii?Q?3m9vuQY8RIhNBBsnA1xjHc3pBBEBOJSDmUexCx9NBJXc2Y/eLZDGV44RbCTZ?=
 =?us-ascii?Q?j4aL+zq3xRt0e6UNsUtxl+E9dMtBZ4MdHV+O7fxIdwpjByZU73U3rWP7aetR?=
 =?us-ascii?Q?vcHzpw84aafniTcU7ShuChZw7KaVBq/j8DU39mbQ5wpFwSESnJTS/v4ap5mt?=
 =?us-ascii?Q?BO8zsfJ8kRJH08xFbbYiXElSwN07t17OC828GVrESFf64aEosP1uI8VqxVoY?=
 =?us-ascii?Q?+11WMGp0eyS7Z7stmDgVFov+EeLvMXON7IM7f///6IEtFa22SX56nKjbdPMY?=
 =?us-ascii?Q?RE6GuHQv78KNTfzbtZKtTXz20en085JBK8jtoan8fGsg9BY1emDukPyartgd?=
 =?us-ascii?Q?g97Jea24ECsbd8BjwvxD89VzdHGZKjXyTc7QEgo2f4LmIIngX1Y8ZBnWb4cC?=
 =?us-ascii?Q?kxwxibBkgsBP8II=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LDP4yCPes2xpd21ApkbCOuNKVDVMycODhPEWVWXjxGFTjG2mEmnf7nueZc3i?=
 =?us-ascii?Q?Qxj6tNCT+RCEbYdDBLr8uD5juDj8k98yy+qwUbMpRPCgCgvTP21xG19Mzx9+?=
 =?us-ascii?Q?iDnxaxb+sPK16iypv7DhP23mMO2KEBnPi6UxxpGJqFNtJEj08QFu4m0wgzLd?=
 =?us-ascii?Q?Rv1VK6iEIAPTdIWey4/RlswcQZPb8qzZYKdQCsUs/oYbYGEK4nZbVgawwliO?=
 =?us-ascii?Q?JhpbKkMgrQ3A3TPbi0nkkIYLBZyjIhS1qW0aX7WWlmuNw5mr4w5v8A1JLQvm?=
 =?us-ascii?Q?OPgCbieX9lViyh8eLnkpcN6PqmGa+n/nI5hXHFOC+XRkI5JnePTu6tFw6nc/?=
 =?us-ascii?Q?vG2XC76pXHWRDJwl7r91b9A03k0CMfhv75xGC4500L/zZsA0fTJkXCX/bvUI?=
 =?us-ascii?Q?6YguMC4/nEO9tL+hR3P1R/FpTFy2DPEiV2jHGzjU+GjdadIGbxB+FF8ryuS/?=
 =?us-ascii?Q?Ianl9+FKFzvO9vUbWQ9GFf5/l+VPIOWu67C+6iSGd+xV6DMMzIM+PCzzOl2/?=
 =?us-ascii?Q?4e5I7YlTS0b4q+GQ6ttarCTNtDeyorGa0tko1iR9cNb63CEuf/kDsQyEN6tV?=
 =?us-ascii?Q?r6YiA5zjkYJyPGqgrAmLDOwKXQHVFZYFXIS3GC1HalrXOQ+cVgiKpCiVqibb?=
 =?us-ascii?Q?hi/HhdwuHr3y/GsYpnEyB9U/oxXNeNdA1425flcFC7JSTeTgzNz5yZ1WTP6Q?=
 =?us-ascii?Q?rwtePn+nkKD3VS8nnAyM0YrhBk/6a9jsQz297tPrmOG39j6NTCXaxyQbzhGj?=
 =?us-ascii?Q?iPBZ44nqaeUY6E1q3nPXjZHyTbUkX3yf9NkdGWdWxvk17TgJD2LsLlvrZciz?=
 =?us-ascii?Q?beWHv80z8+gx1iQz76NQdSVhkoYTYOJUZin2koWFStWIMSy/hr+4OU/LUE8u?=
 =?us-ascii?Q?3zs6Rg+pPJZ9vobKtnQUyzQYx2jAHZySxIUTH52Yq8SdYmU5DP9iLTnTbIxm?=
 =?us-ascii?Q?E9y+xLDbQ+2rkOoY1REVE9ndqFfwoK7ybH5JsdzLRW9blWpJEYNBvAtf2Hy/?=
 =?us-ascii?Q?icOXrKslNQ+Q2KRzHRxKPtWXUom8rl75jT3Gq98QBEC9LEMhAfBDnUfN8nI2?=
 =?us-ascii?Q?tQDPbia/CIrA/zDa/SClrNMA0ghdzuDb/sA0NJOZZRzhrCAKr7XETZ6EPmIG?=
 =?us-ascii?Q?1s7atZEGmE9UD8/2u86/8g0UWYWe++Cyl1PKcir8xBwIaUDjA61DPSx2MTIE?=
 =?us-ascii?Q?YWO6On+5cpvLzUz27GVir4xSJlhZU4tFHrlXZ41s+fKVaPZ8otq3981PEXWO?=
 =?us-ascii?Q?vkBxqFye+ZEj+EXvs1PTMEDqhVjkFovAnffH9gTT/n/QK6UM5g+nZtP2l++U?=
 =?us-ascii?Q?yTwx6Rs8rm4WmHjCFWJyyXPBmFMMPfTtgCpwjfViEhHeP4Bqg1Njy8u2uN22?=
 =?us-ascii?Q?I+r/iaQ9UhB+QO8Ki60GKMfew9TEwtDY3Hjaf10N1DGoZzckejD+aufNDjNN?=
 =?us-ascii?Q?nKqDhymS+ZKjIlqwDF8SaphQSyqVYQoJFxQ27dHcrhKITokuqvtZKTZ6rUX7?=
 =?us-ascii?Q?Q62/hoKrLctqzowlkdcR8iyFjA7tI6AzYvExfuAQtAFFSbxQlEROiiGppVB4?=
 =?us-ascii?Q?1Nq6zei8yyl/xVroyqPUMan+KifXxrK82zNf+kB0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27329c9c-08d7-427f-0291-08dd78ccab6b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 07:44:20.7996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9IHHjNITj0uLjP0uaWni4sqEYIBLsIsPKUTaU57Yd1EDPODIXPCwsb9drW06qAU+8PWXws46EtAXpR2zzSbZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

From: Ming Qian <ming.qian@oss.nxp.com>

To support decoding motion-jpeg without DHT, driver will try to decode a
pattern jpeg before actual jpeg frame by use of linked descriptors
(This is called "repeat mode"), then the DHT in the pattern jpeg can be
used for decoding the motion-jpeg.

But there is some hardware limitation in the repeat mode, that may cause
corruption or decoding timeout.

Try to make workaround for these limitation in this patchset.

Ming Qian (4):
  media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
  media: imx-jpeg: Cleanup after an allocation error
  media: imx-jpeg: Change the pattern size to 128x64
  media: imx-jpeg: Check decoding is ongoing for motion-jpeg

 .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 120 +++++++++++++-----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |   5 +
 3 files changed, 97 insertions(+), 29 deletions(-)

-- 
2.43.0-rc1


