Return-Path: <linux-media+bounces-25796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCD7A2C17F
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 12:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CC1A188727E
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 11:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86C51DED58;
	Fri,  7 Feb 2025 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nFUMJi20"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581542417FE;
	Fri,  7 Feb 2025 11:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738927813; cv=fail; b=I178UF5Mw/KUBt3QBi2oqarEp8uADVXZJ29bKyPZUK+w3JhhhK3dYZ/T6ZC8lRsKjgsjH6dYpRr8bcopCobxP9PscFVg0padMvs28syaXPR5c9xyn6Dsh0UQP8lXZiQfCfUlIauFFs4jQ7c8QS6XudE6OD9NqxOc0P4PsqGLJ5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738927813; c=relaxed/simple;
	bh=A+Y7wax5aVM6pMdqjVFJKof0/DROpc8gc/4Moelggpo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dlib6Dbvkn1EePQUen6VhaCtXv0Ea5WrBIk7nqWiazFgxw54k9IaxwyAScFkwXJm/e9x615/1C3YyzJCBPVgodV4v7lbaqHu1wY+5q+nV8QMHGVZkGsS4/ncgH3+D18sPensFyAGAaKBcNkFpXYH7diLZzZWPiFL6hLbyJqDVro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nFUMJi20; arc=fail smtp.client-ip=40.107.21.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCOKtqA47VBgecsPAjVopHxWfBOC/sbKaugsbngn4R9Q1MpF+vvp/sdEVOV2Eq8ytwoGzyon5joz++t0CWjei1aYd8rY9jK+5myWSvQOLx7F/8nIbv2ptGVY5fU5uuCVvdxHfdTiGGKWieVJ6rLISjyETh5ASufYn10lQOCr7DjAjhzXn2VOlH2YwvSGdEecQ6nT6Tw8izrnQjT88NtUgUhQ2D2azgtrhsij+B11eFst9MXFwfSReuaPWdPGPa8VUuKWfeSnkBDQ290cbdUZNIT9LqYo6LR4v+4ea/1Eb+7FVbI9OwODHyOrjrdEJL2HXB3nh0gYCbfzxErF3Yd4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAsbKF6gDO8myT5tx/n0FRXdc3Lj5fu4rJ9vu44eYVM=;
 b=jQknGstyWJ63KbIRDRkW6WvM9RPpxZYeqHTC3b8+5KOp0p9wJUOcuKYMRa9ykU5HWzDwQ5K0ZDSqqu3WC2Upihpij8GmyXn575Z5dgjmx2a7rQBfB4PK85dvUCva5XdkqDh2ZWUfc4DEeFCfOp++4V7zeJwYt0cKYklZlT8OpZMhXfCVDwKv15S8GIXnSYsOj4Dfpr/doqAQe24czaZul9mURfxb+G5iso7dpVQcyd6Jx8QeipIwdrWTJpweS4BrHVdOO8YMWGmIoDtK4NNR/3+plh+lx/jJJhhDIUaH+GCGsjwNILJQ7SMaYvW8nx0gc2sz0vYS6XiIPxY4fymfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAsbKF6gDO8myT5tx/n0FRXdc3Lj5fu4rJ9vu44eYVM=;
 b=nFUMJi20SQ0mHPV9BgWWiIP/6+mHJmwNpzSA/kctWHcuWKQIcD1gl+aAtIWtwHmEdr4u3mDt+NcHTDByPVwfACFOmfbuELTmwRkhVhhnn77raaLz0vGgVR4deHuYGGWzfFM+/y45QRHbNFFpjWU96NREy76QzHF7iCOzAnOMHjFX3QbrM0NYCgCPC8270p5+BGqyC5b3+4fpiTyJNrtn3Rzt2Tkxd3jKodVCmOqiFfqumwijuFYqM5pgd4DD6ormt7ablKOSBv5VFYubJA0c2OQWrgUrWU96lQRNcqpo9iUhSsHZWvbXdiq4RXl4LCTxasKNs6pXOK7kO8A5nE47HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Fri, 7 Feb
 2025 11:30:07 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 11:30:07 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 0/5] media/i2c: max96717: a few changes
Date: Fri,  7 Feb 2025 13:29:52 +0200
Message-Id: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0302CA0002.eurprd03.prod.outlook.com
 (2603:10a6:205:2::15) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: d704bf51-2024-4081-29b9-08dd476ac63b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q2Yu84XyaxVsnyrI5XWgwaw/cb9J0TxGSC1KqaVkwhIOSZNbqIitqJ2X7ayh?=
 =?us-ascii?Q?d+sf+1IQFElRU2fhaXoWOQD1SqnjYJf/3wTlDIaa1mb1Uv4IOCi7D1XclLtA?=
 =?us-ascii?Q?kV8JH6n6S4ZvaIASvSRb4U+OBuW233nd0cTm7D/O8byBgRvuFA/Nesik/5Rg?=
 =?us-ascii?Q?PMMJrekuKsOKmhfbYqydQZWS6aVYk2A6Yp+WpygVkpJ3YWcCMOSn2hw47qWq?=
 =?us-ascii?Q?lKVmpRDwl8VWR+uuDDZkSkxS5eT4sKpMgVPdjhhUZC8KMoq6juBFcZtRPBO+?=
 =?us-ascii?Q?s7mZ7ebwKr3esdAgexKq/NXSksknc2hXouIx3QKaZ3uNu6pRTup07j1+qkvW?=
 =?us-ascii?Q?LTkWhmJfLPts2a11r2FqCAM4+dnVcCYPg2GCyP8wNfpSQFmOD0Bh0BB8VVvh?=
 =?us-ascii?Q?nFSEJT6XbVYP6oMcDGK3PD9ztfLArM/ycgg3z3S63Q9E+mY1NsKdSKN8L5tO?=
 =?us-ascii?Q?YAaLAGIma7fZt0M4xxAbXCM0Yx234Xl/2lutQXO5dVx/4a7AhT1UnNodNtSI?=
 =?us-ascii?Q?ghIDRvWHeo9gArys4L+ZE7NBYO1qlbNNKbRNZ22QX6wX8jOVhaE0gPNldZG/?=
 =?us-ascii?Q?tf9x+vizEiP6/iS6g47YYNJBJFB6NqyGdVGjAf3eX3n3eFwb1IRiw3vg2skH?=
 =?us-ascii?Q?HHI5Uz4Xvj7wyhd9Xz42A2JG8y7KpRCHM+gsXgHwX9YgMCC23ACG39lzncJi?=
 =?us-ascii?Q?8rz2Nem7nceBZReWkWdSuo3EULOQI1Qn6RU8/BNglVfNHaANSpquoLOzG5wC?=
 =?us-ascii?Q?ddhsPJ53j3VUw9RdI8Np0V7MR9DLtX3WxEznKvjs0+C0yHHHHqMKl0uUcIGB?=
 =?us-ascii?Q?AsV+QGbbK0w4hmQlFO6H7no8xK/FAisbO9zC5gNNUxxGMkaGfBBVmvzlrKii?=
 =?us-ascii?Q?VN5NtQauGzAJHfQVF8RSDMh1FAIczqozIGRqr/vaPbPVQdcfEONdkG5y/xIs?=
 =?us-ascii?Q?52MFUUcfLPeepN3hRToNa7woia8cizT4pt1IY08lHiuEDvf0mr1lbdn4A7DX?=
 =?us-ascii?Q?Vp8JFUL7Rym360orhzo5Ab+wPgHGnFfCfudnkN01nE2CVax+9BmZSXKcdaiT?=
 =?us-ascii?Q?3mW2KloduvUjJ0ek2IrWVbxMPI3pzJLPbeRvv8oAdtVuUa6H6cXJJY6F4tu6?=
 =?us-ascii?Q?qnY12dxrWstyHQDta8HFNMZQeMugs9NPcradXo3VfB7TjJWM8/NeX2fZAe7w?=
 =?us-ascii?Q?WYPCfXmi9y+2UZ8MnDNkeX0kXb1XHwTSvTGzDLj+qH4Rzfob/mZDiV15mpVf?=
 =?us-ascii?Q?EO+c8zSSn8hPGElgpWxHaLSPo+aIKegDY3lrhMJM7aLMMxgMTWmkG5xTePZ6?=
 =?us-ascii?Q?G7c7cqmRoGqiVXm0eHPOJw4itxee+JX8+LJixLWz3wLXLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8/PeLfL1JDYH+qnnFjqse+hBb8YBVTBWkDrTz2lP4mG0iT7Ikpn6/dH/9cs1?=
 =?us-ascii?Q?V4tKcxkzJO602fDZ1DeeehTm1NiW1i87lLdOeLVOHMglBpRR99N7uKvGlkKQ?=
 =?us-ascii?Q?jGAiyD8NN9W52j5zssD3iEKCqR7guVz/bl4MpaJnWeQzuv6iC0U8DzI5USbR?=
 =?us-ascii?Q?2NJDCgF51N8YMI295xv9MAJSYAnebXRWxgCn6xVEDG24VIl2XzzI0e6AjKsK?=
 =?us-ascii?Q?EetlFACz7rhfEOeJkkwOtMH/FF1SH6yyeJoj2EA3QCG8PaX3cm1zVqsZwLIQ?=
 =?us-ascii?Q?ZKbdSrlDGahIvg7QqzbPGeq+RubNP+fIQhkDL3tQ8Pe4wwNXYE2r+JNJCOYC?=
 =?us-ascii?Q?YOxAn0MieB7qsvOAzdJ+1LXLKXdzi5MGIJaNbYKHlFCWp1lbfz31lqpyVgrb?=
 =?us-ascii?Q?EKY9aaY65EYhAu8nVWEZdhQiZeatjJcmqlXWeNxLxlDeSiooIN69Bl60ESyA?=
 =?us-ascii?Q?o0oAQxkDqDocNKMKAkFIoOT1rJvmYD1x3NNGqVZpDaPFoj69ufTCrHjMCBhY?=
 =?us-ascii?Q?0PSlS1EeQACVsWWs0ydy/RQMledjspuCKS7UO50oYMQInQoWOSgKypJS2eC1?=
 =?us-ascii?Q?8DT4otKuPRyNtvRp9JBa9+TGFNpVTfxl83hE8jSHTu/iZq7aBIlxC5P7E/O6?=
 =?us-ascii?Q?5M09TjRql6D60SB34r8YSc07+daBCSUKwRD9KxH+qObnuv7OeaG3FY0+H3dj?=
 =?us-ascii?Q?3Z2Ttb9cI6xekzHxt3RbNIbgdd99Yg50sxyCcWPjtkesuZUfJVdl0j6WxYCU?=
 =?us-ascii?Q?r+wRSh7Tbjyifs+Jcebk6W/LCMt7OGTo1bOcBP2XKk8StOu0hh2ieZqyurcx?=
 =?us-ascii?Q?6V+H1TZkoPp0m6c124FzD4PTMxNQOvSvcJEjPvXHiZBEDQO3+NgZaw1XkUsS?=
 =?us-ascii?Q?uN640Gw0KKqWzU0t3TlTlwPhRIoy79p4iUoTfhSTTCnTlxAuCckSDuAVBfD3?=
 =?us-ascii?Q?2mcK1uADXMIy6PnrIHikl+fSH/KQeDyYR1FEduG79kI0R1SOeCL7XBbyz0Ji?=
 =?us-ascii?Q?5E5Y2bwYNbEzIobjSROH3X/fP4nkjZCqhCpL2XeXR/zJ/eaQ0KdCYvIurx4V?=
 =?us-ascii?Q?5TdkxYHoep5lGl/bcLGuKAFU43JBkB6/l6KrLtRKd3CmYPoufSOYBaImoEV2?=
 =?us-ascii?Q?5pWHN6ShBdneKFgpmmD36+xkuuSz8J1Dy88fK6Iy/O5yELBArZ2kjIgrq5Gq?=
 =?us-ascii?Q?anUSI7NiFbYoz5/ftoSwGhMjPZTZhGWbWI5ixpEZUOSvlIVeBBxFZnSFyxvs?=
 =?us-ascii?Q?f63T4Gnk8QIlHVwepLEQ1TbGs4UqeYL//tvl03pE+iE9oXjEi8LEsfzlaEEX?=
 =?us-ascii?Q?LuPkwAcd+hjcjbyT5WkwLyOnJhYMl45SGHvMwjB+isO8yseA/earf3CErHc2?=
 =?us-ascii?Q?HGK34ZDl4WvExGmS2zV/jL4i5ot4wmvwYRDx4DBd9O7x3pq85zeB51W8uIsT?=
 =?us-ascii?Q?HLYEbR7y9N2LtPBYXnSDPTdgX0hndf/z73+FEjKXfkxmTkn1/Ao5DVLRi6rH?=
 =?us-ascii?Q?hw1iksnPh1jFJJHanBuRNug3kXGzl/R/3UJozYgoZCFt1DV1997quxfNX4+M?=
 =?us-ascii?Q?CJFdps9qll9FEA4KBtOWltGhnKMg/83gOFT9jvaDpjqXnQb9DNRT7yQLbQ2I?=
 =?us-ascii?Q?kw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d704bf51-2024-4081-29b9-08dd476ac63b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:30:07.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jjc3Wb96Y1Jr9cJk4mhQ2+Glzj/w2Cvh6MwVyaPsTAv1QoCD8Ltpv1LkcYg3FAk1COS3nU64gW1ESNbfmiuhbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

Hi,

This series adds support for:
 * get_frame_sync(), so that we can pass the VCs and DTs from the
   incoming sensor streams over to the downstream drivers (CSI, ISI);
 * frame synchronization in multi-sensor setups. This one comes with
   some dt-bindings changes in order to allow the user to specify the
   incoming GPIO RX ID and the output pin;
 * operation mode override. This would allow toggling from the pin
   configured mode (for example: pixel mode) to the other one (tunneling
   mode). Also, vice versa is possible as well but the driver only
   supports tunneling mode currently;

On the frame synchronization bindings, I would need some advice on the
property naming. Recently, I sent a RFC adding support for MAX96724
deserializer chip, see [1], and I also added support for FSYNC for that
chip. The max96724 property is also named "maxim,fsync-config" but,
since the chip is a deserializer and it's the one actually sending the
FSYNC signal, that property has an extra item: the fsync mode.

My question is: would it be OK to have the same "maxim,fsync-config"
property name for both or should we have different names?

[1] https://patchwork.linuxtv.org/project/linux-media/list/?series=14427

Thanks,
Laurentiu

Laurentiu Palcu (5):
  media/i2c: max96717: change internal regulator voltage
  media/i2c: max96717: implement the .get_frame_desc() operation
  dt-bindings: i2c: maxim,max96717: add new properties
  media/i2c: max96717: add FSYNC support
  media/i2c: max96717: allow user to override operation mode from DT

 .../bindings/media/i2c/maxim,max96717.yaml    |  28 ++++
 drivers/media/i2c/max96717.c                  | 137 +++++++++++++++++-
 2 files changed, 157 insertions(+), 8 deletions(-)

-- 
2.34.1


