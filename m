Return-Path: <linux-media+bounces-20036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C279A9D31
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 10:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421FA1C2125D
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDC8194C89;
	Tue, 22 Oct 2024 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kNBgdfqx"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010037.outbound.protection.outlook.com [52.101.69.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3771C1946A4;
	Tue, 22 Oct 2024 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729586487; cv=fail; b=iVaVJnnV0OLrX9fiWm3904GR8LT27d7ystU+sKPFs9cMTE98y/KfGSHlkbGve3ic4vHlvBZ546WwYKOgQy/MdWR6cJCnC5tgNk82YW3IvQdWOs1I+IwEjcsvTnpPxl4amGcpbROZyAW8fp0Iy0OJ/u4vh0kmGWnqxF7Jajygq/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729586487; c=relaxed/simple;
	bh=Q249qcROMKLF1grc6bN9/23JwNByrYyjw+ixGk9KOPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WMVuVtV1fePryPaD5Y8AlQmKtGuDdYN8ANeqAK2bHSjq6lXQ2yCGark319DJIIJ7sM+HRYt6eUzvDF3AIza4HV57LT8Zw3UIzCo3ExYrhHWZ3svjLLyloVe4ieQ0TDhxWK7s+eBnuBEFQ/XYzUqFfnZF1sowMmhTPywq+uYQxwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kNBgdfqx; arc=fail smtp.client-ip=52.101.69.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7DJn/0MVifXM7XzLyWHVUIQjLonUshUS7ctRdzsKfTLk0r2qwsEVV5RTy5LxrlEFbZG9MLRSWsZnB6vN45JEAg8zqFaswyAOojQUADb4RdmzUUNPNeHJ7CrQlBtjz/ednxIZKdBw3TrQ1z9TmEwktOee4hXWdnyyZoxv4SBD7esFljq5ELSOfCLDthMTlVYANicc6ym2aqXVdeWoYnZgsABwA73/61jHIqZXuzKRwkNtIT+RQCLTN0IIgVeCkKBNxG5eUdtTZawPtPAbYjuIoouRV6LGFXIJZxp4GMwr0Gb9N6MLMzYhEg1Dsfca4JNjHEZtnMhoGXxRxOmxVjeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCbepeNg5bUGuvQ8pE2dwsEeKpIwNwNOTWxgIB3MnUw=;
 b=NFJT68cuc52LkHrO5JamBi28Cq3dtog98AM36Co0tlKqHAd47Tt8EUM/6SEJSlueHLq9p1nTxhEgsiIA5oGWCWBBGaQ676Lk4UkWWT+Yj2LTO3Gxzz1uuU/o0VrGysuY4nfb+WoXDc+DvtrPDYlzvzVZkPGusn5VN9lb0B4hBn1AsClov/wnRK49PJ8vaYBP4nA0dqQY2AQ6utv7Di0uwJE7BpGJyTCdR7/zaIleE2m9SnSjroxdIJlmMTBaddebRj1uK5tevLD6764/mHyO6uTmYsiIg4pHo6XdwSpyChOGnVnfDhZAGICvLoiv7Gd258sunhw3xXoopQT/3lJdYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCbepeNg5bUGuvQ8pE2dwsEeKpIwNwNOTWxgIB3MnUw=;
 b=kNBgdfqxXsz7hLmMukdx0MM3QTDJ+evOe3oT7oJkho+9VLrdnvAyEwdWxdci0wId/LLl6il7sx8ymqD7oIlN6illQ0JKACfiMi2TsYeY6zk/7yaGfDJUVebt0Jo+H6Y9E/FzAOH9Ti9/+K8CXlQdrZDcypvL9hrj/MHTJbhUbPaCkH/6r8fQuD2gEQqO7m4ukykaL6BpdohI4idE5nUs2zHpsT2E7lPK3bcyxApdMZnosmkQQVxMC9wk8tUM+NXtHD8dJlDVxzyhKdv3EDmkp/aR+k3fS/sR/bD1pRrYwXLxiCJskYrShqLSbm4ZXpBdHEAmyRGl7Xlvqt6OlAK4FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB7831.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 08:41:20 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 08:41:20 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v3 3/4] media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
Date: Tue, 22 Oct 2024 17:40:39 +0900
Message-ID: <20241022084040.3390878-4-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241022084040.3390878-1-ming.qian@nxp.com>
References: <20241022084040.3390878-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: c8083c02-1d00-4d31-3320-08dcf2754d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ubYsDon1wgebcd5rnkSTrTJhxbuOTL9TAfKxTmEfz7PL75/jJ9bIBPWp3MMM?=
 =?us-ascii?Q?rx3DqtZmYKrvLt+ywfAp1LqWlZnsICPB7ZFRVl2f/RDov/zcPujKUyUu+0tW?=
 =?us-ascii?Q?VJgEF3gxI/UE+BnUmGVeKqAHFm0pbp6kBUBdg6KQ1mwoLFF8CmvygxaU/2WM?=
 =?us-ascii?Q?x8b/SbKoKUqdBlLcP5UE/zY/+6BPeDEjaohi8dcJzuHK6fXwjQwe6nMMe2Gu?=
 =?us-ascii?Q?BK8IEurzas43WfL+kJ4jGBmCmL1WlMpV6D0urbPFb5mk+9tcbyamEhyqMey5?=
 =?us-ascii?Q?KBLczsMdG9jz2kZvEONIIE6aAA3V31rmGn9sxYQLHil6lkZHRIvHdfoXevLk?=
 =?us-ascii?Q?KpW2y92Q5VHo2r8iwOzCwhGWTz2+iom0tam+MxmE1pdUXbDhm3WOT98bzZAn?=
 =?us-ascii?Q?HjiHa/bvfu+5+CDMnjnigUYOrr4wUiN39nQfPD5n8XYtBr4pX5fN3og2WBon?=
 =?us-ascii?Q?eRA0w20Ne8i8Idrr8qcYuWw6E3IgWJFbnbVlJwD1UieNWGt1QH2qUnUPIsLq?=
 =?us-ascii?Q?f0TkJ7qIbtHj9rR0vjd3CWvbu+Je4Pv4TZMm1t7eEVR+1cxnmUJ5FoJgaogl?=
 =?us-ascii?Q?6yUw7p4ACB5b3BnWkvXO8BLCgJ+d1ms5mQX1Gh2XWX/pHh/ck3AFrL+8/lWK?=
 =?us-ascii?Q?GWatXv6oBzWNZg+4t27Vfkp/w/7NFpvOOY2TdDSy8t9p3LPnr3aOb1WWuPp5?=
 =?us-ascii?Q?UEMtDA27hb1Ha0oqCvKZAZY9L/LNg2AcnV921848E+nDjc3kgZUWYszEaSv5?=
 =?us-ascii?Q?orK1uGEAT3+LK87MixkjfU000tap7DEBhG455QcoKBpP8C9INupIlS7stQQl?=
 =?us-ascii?Q?0RWX/t84kVUKndvg8YgBVpjp1Gj81Yqa8GWoYq+hunH2u0GOM174UpK+Sc9Q?=
 =?us-ascii?Q?+immryKB9xQYZ2zLzRyq6dXNujU02Xdu/Ma1ygnKZ+shve8o3mQmR7BZa+Vc?=
 =?us-ascii?Q?Vq96Pp5VsKG16og34PEWenzKGn3aV4ORGmGn7Osdw+GoLdAexWknyCPZoNCm?=
 =?us-ascii?Q?WYZF291+hvlQh6A7XDSytPB3AwK+0KBHoXvaCV4wfhSaqAJXRSGMT9VlNhtY?=
 =?us-ascii?Q?sQlO5itUYtc6yLhBGqYX6r6UGDyw+8/VqWu9BInHVAoy4gxTeX34SVnLTYdo?=
 =?us-ascii?Q?7X8DbqxLwoqw/ZxNIstAJmhrlh49+OhYteoVSLPcial5cXnNHlj6EyHTsLZ5?=
 =?us-ascii?Q?C4fHvt9RXwKWxBNZIP2qmgOTEAZIidkKy4Pb/mFFLWtM++y/M/bU+F1YMAjz?=
 =?us-ascii?Q?yuZSzw31QVbPxQZxkRGm+KqeoYX8v6JJsNjr0HSwRpCpxkygpti6eB4QojiM?=
 =?us-ascii?Q?0RI2LsaNsyiFiIpzLh7HD/gJxDkNITEcfOObMib6i1TrlMXYLfssjo+8HLjw?=
 =?us-ascii?Q?/67MlRM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ouZwe6yr8MqWgesS9srpXKn3FBmVxdRlFWyWMcCb9BOoKgNuKIvTDeBrFw+s?=
 =?us-ascii?Q?pkxr92dEm+Pnn58GxDbVUAr43TEfFFgvreNAdK5n7BK+PJVE2FOZLkuvyxPD?=
 =?us-ascii?Q?aemVkSYagvlflEqJPh2XTTsnOrAmpDXSPSHQ7FlRfQ2D9OHsGAmKuH1iNO39?=
 =?us-ascii?Q?Ph8RuK4O96Vo4UCJx0MYBFSb2omGu+qldzrcmUjHWTC8UIUzfEselAt7hXOg?=
 =?us-ascii?Q?IdgPYAFJVl/rYjzMrw3vNkkNIt1NPqe6tlU9e37MbnpOHNZbXdtFgxuDYwmJ?=
 =?us-ascii?Q?p3WLBkSNEVagkDdDrd47OCNQM/mVr8SAETObAUpdpJ2mEPDeKgXa7YCPwIXv?=
 =?us-ascii?Q?7IAl05K5vUFUKMGyUisX0Fn5N1gl6PUDw32pJz0lWbhRBlqeFswbw0ZTq9xL?=
 =?us-ascii?Q?xyRlb6THoF0ONxOz/TxXHXbI7VVUZmfbeOf5SQdnA0I4YSnjCFq5p0lZqY2O?=
 =?us-ascii?Q?E+/E9vOlhAOeO+tzwCiQAqmbg49GtETKuOlB5jEEw7QAOFVLLZ630olVuevl?=
 =?us-ascii?Q?z7EprcBO4HkZ2uADXT3zCQpq3pcdm+X9TTeVVxT+UO1m0OktNWXdE2eRL4/h?=
 =?us-ascii?Q?nisahIirk7UDNYyQieRZcCgUgy/hURNU1QCJQgQ4pHYBzke4rxlKlrct/UEx?=
 =?us-ascii?Q?aLvdUK144U/IHpPdGPkUdSZvNOoGHDbS8kkyYOPwEZ0uuvreBhYqIKN91ZFW?=
 =?us-ascii?Q?b0BahXaOhsSfLdQ3v2pVqVuJBXb9IuaLosuoHOoTaK0SjXb1WEryQlt9Wvof?=
 =?us-ascii?Q?9ywtW6jT/wEUA553tJ1pm33YaqXFOd2NIQkxA5EdOAoEom+DOh+ndsZx0PSg?=
 =?us-ascii?Q?3Hfmkz8an5XU3Lrcvxk4T+Woy93gRfKhE9FwCdwgA72yzwv11+ahEd2nJEH7?=
 =?us-ascii?Q?VY3uXLnwqgYtsRp0qCr2zJO6o0eu3yRcyq4jpzVY/jT5G4f1BQfc8DxYf63q?=
 =?us-ascii?Q?eFr31Z3GnbxL5CrUvVmjDpP9GrUkyIZ7CuViRbbBF6j1bHx1rsPU/4nYHeYO?=
 =?us-ascii?Q?NgVyo37id+v9KS1WlUKn2Tr1eXqpzNjwFhk2GF65pXEcFbJViKqyj7RSRPsJ?=
 =?us-ascii?Q?bgfPsO2n+v9WJIJXXPbMOaIW0+jRKVYNTcOx4f2vu8W5SqXLRrDHSjYredH1?=
 =?us-ascii?Q?u+glgPX4ig+BsZcpJNxAWye53+juyXpKVu9+3FwFVi6A9KRCvqKGZ1TwlyoA?=
 =?us-ascii?Q?tNv2vauc70G/6KnQD5dKktwSBH65Ve4fQq4+m9qb+a3y5+MdRJMeHANBPhuh?=
 =?us-ascii?Q?g7ljuzAEHr58nPzxPMaE+46OITncuCqWDAei+BBue1sObJTRr3ht8/lvTiZT?=
 =?us-ascii?Q?cHd4XJjDScOIdkz33kH0DG1nXFJ2kfvcdu8oyX6AtDF50fogTEmhmHx0kHwv?=
 =?us-ascii?Q?S7s5ew9i0jzsPTBvOjoGPJ74qumt6FCqnBgjMX7gkB+lmxrbgxTgwHva6k7B?=
 =?us-ascii?Q?olT7G5aSJNwl0CXSDyCpiVkqDm2i7OtSZYF7EKQx3p9O9a89h5EN6A6aGm1B?=
 =?us-ascii?Q?q+SnKT1JfEi3AGJA98MfKc1cfYc/27Hy5A7cqfg27VGkFeKWVWEKiKleVa+O?=
 =?us-ascii?Q?Q8FWiW8LO9dnA5Jb1d65RaFcb0HykDm87pTOdLOA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8083c02-1d00-4d31-3320-08dcf2754d15
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:41:20.1499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9fhxUa4bqwyEt5lA4KdGWcHuXxDHFYDwYt4RnurlWTzq286iWQFBxi2aP6ZCOkY/qNWLyMjq/WYAryjcx3fOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7831

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Add the capability of retrieving the min and max values of a
compound control.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  22 ++-
 .../media/v4l/vidioc-queryctrl.rst            |   9 +-
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   4 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 +++++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 153 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  60 ++++++-
 include/uapi/linux/videodev2.h                |   3 +
 10 files changed, 272 insertions(+), 49 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b74a74ac06fc..b8698b85bd80 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -338,14 +338,26 @@ still cause this situation.
       - Which value of the control to get/set/try.
     * - :cspan:`2` ``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of
 	the control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
-	value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
-	these controls have to be retrieved from a request or tried/set for
-	a request. In the latter case the ``request_fd`` field contains the
+	value of the control, ``V4L2_CTRL_WHICH_MIN_VAL`` will return the minimum
+	value of the control, and ``V4L2_CTRL_WHICH_MAX_VAL`` will return the maximum
+	value of the control. ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
+	the control value has to be retrieved from a request or tried/set for
+	a request. In that case the ``request_fd`` field contains the
 	file descriptor of the request that should be used. If the device
 	does not support requests, then ``EACCES`` will be returned.
 
-	When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
-	get the default value of the control, you cannot set or try it.
+	When using ``V4L2_CTRL_WHICH_DEF_VAL``, ``V4L2_CTRL_WHICH_MIN_VAL``
+	or ``V4L2_CTRL_WHICH_MAX_VAL`` be aware that you can only get the
+	default/minimum/maximum value of the control, you cannot set or try it.
+
+	Whether a control supports querying the minimum and maximum values using
+	``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` is indicated
+	by the ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. Most non-compound
+	control types support this. For controls with compound types, the
+	definition of minimum/maximum values are provided by
+	the control documentation. If a compound control does not document the
+	meaning of minimum/maximum value, then querying the minimum or maximum
+	value will result in the error code -EINVAL.
 
 	For backwards compatibility you can also use a control class here
 	(see :ref:`ctrl-class`). In that case all controls have to
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 56d5c8b0b88b..3815732f6a9b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -447,7 +447,10 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_rect`, containing a rectangle described by
 	the position of its top-left corner, the width and the height. Units
-	depend on the use case.
+	depend on the use case. Support for ``V4L2_CTRL_WHICH_MIN_VAL`` and
+	``V4L2_CTRL_WHICH_MAX_VAL`` is optional and depends on the
+	``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. See the documentation of
+	the specific control on how to interpret the minimum and maximum values.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
@@ -664,6 +667,10 @@ See also the examples in :ref:`control`.
 	``dims[0]``. So setting the control with a differently sized
 	array will change the ``elems`` field when the control is
 	queried afterwards.
+    * - ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX``
+      - 0x1000
+      - This control supports getting minimum and maximum values using
+	vidioc_g_ext_ctrls with V4L2_CTRL_WHICH_MIN/MAX_VAL.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 3cf1380b52b0..35d3456cc812 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -396,6 +396,7 @@ replace define V4L2_CTRL_FLAG_HAS_PAYLOAD control-flags
 replace define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE control-flags
 replace define V4L2_CTRL_FLAG_MODIFY_LAYOUT control-flags
 replace define V4L2_CTRL_FLAG_DYNAMIC_ARRAY control-flags
+replace define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX control-flags
 
 replace define V4L2_CTRL_FLAG_NEXT_CTRL control
 replace define V4L2_CTRL_FLAG_NEXT_COMPOUND control
@@ -570,6 +571,8 @@ ignore define V4L2_CTRL_DRIVER_PRIV
 ignore define V4L2_CTRL_MAX_DIMS
 ignore define V4L2_CTRL_WHICH_CUR_VAL
 ignore define V4L2_CTRL_WHICH_DEF_VAL
+ignore define V4L2_CTRL_WHICH_MIN_VAL
+ignore define V4L2_CTRL_WHICH_MAX_VAL
 ignore define V4L2_CTRL_WHICH_REQUEST_VAL
 ignore define V4L2_OUT_CAP_CUSTOM_TIMINGS
 ignore define V4L2_CID_MAX_CTRLS
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4962cfe7c83d..b0439005ec71 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -774,7 +774,9 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	imx214->unit_size = v4l2_ctrl_new_std_compound(ctrl_hdlr,
 				NULL,
 				V4L2_CID_UNIT_CELL_SIZE,
-				v4l2_ctrl_ptr_create((void *)&unit_size));
+				v4l2_ctrl_ptr_create((void *)&unit_size),
+				v4l2_ctrl_ptr_create(NULL),
+				v4l2_ctrl_ptr_create(NULL));
 
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx214_ctrl_ops, &props);
 
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index d9d2a293f3ef..7f370438d655 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -607,11 +607,16 @@ int venc_ctrl_init(struct venus_inst *inst)
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
-				   v4l2_ctrl_ptr_create(&p_hdr10_cll));
+				   v4l2_ctrl_ptr_create(&p_hdr10_cll),
+				   v4l2_ctrl_ptr_create(NULL),
+				   v4l2_ctrl_ptr_create(NULL));
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
-				   v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering));
+				   v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering),
+				   v4l2_ctrl_ptr_create(NULL),
+				   v4l2_ctrl_ptr_create(NULL));
+
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
 			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE,
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index e5a364efd5e6..d44fbad95c11 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -94,6 +94,22 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 	return ptr_to_user(c, ctrl, ctrl->p_new);
 }
 
+/* Helper function: copy the minimum control value back to the caller */
+static int min_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
+{
+	ctrl->type_ops->minimum(ctrl, 0, ctrl->p_new);
+
+	return ptr_to_user(c, ctrl, ctrl->p_new);
+}
+
+/* Helper function: copy the maximum control value back to the caller */
+static int max_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
+{
+	ctrl->type_ops->maximum(ctrl, 0, ctrl->p_new);
+
+	return ptr_to_user(c, ctrl, ctrl->p_new);
+}
+
 /* Helper function: copy the caller-provider value as the new control value */
 static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 {
@@ -229,8 +245,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 		cs->error_idx = i;
 
 		if (cs->which &&
-		    cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
-		    cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
+		    (cs->which < V4L2_CTRL_WHICH_DEF_VAL ||
+		     cs->which > V4L2_CTRL_WHICH_MAX_VAL) &&
 		    V4L2_CTRL_ID2WHICH(id) != cs->which) {
 			dprintk(vdev,
 				"invalid which 0x%x or control id 0x%x\n",
@@ -259,6 +275,15 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 			return -EINVAL;
 		}
 
+		if (!(ctrl->flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) &&
+		    (cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
+		     cs->which == V4L2_CTRL_WHICH_MAX_VAL)) {
+			dprintk(vdev,
+				"invalid which 0x%x or control id 0x%x\n",
+				cs->which, id);
+			return -EINVAL;
+		}
+
 		if (ctrl->cluster[0]->ncontrols > 1)
 			have_clusters = true;
 		if (ctrl->cluster[0] != ctrl)
@@ -368,8 +393,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
  */
 static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
 {
-	if (which == 0 || which == V4L2_CTRL_WHICH_DEF_VAL ||
-	    which == V4L2_CTRL_WHICH_REQUEST_VAL)
+	if (which == 0 || (which >= V4L2_CTRL_WHICH_DEF_VAL &&
+			   which <= V4L2_CTRL_WHICH_MAX_VAL))
 		return 0;
 	return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
 }
@@ -389,10 +414,12 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 	struct v4l2_ctrl_helper *helpers = helper;
 	int ret;
 	int i, j;
-	bool is_default, is_request;
+	bool is_default, is_request, is_min, is_max;
 
 	is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
 	is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
+	is_min = (cs->which == V4L2_CTRL_WHICH_MIN_VAL);
+	is_max = (cs->which == V4L2_CTRL_WHICH_MAX_VAL);
 
 	cs->error_idx = cs->count;
 	cs->which = V4L2_CTRL_ID2WHICH(cs->which);
@@ -432,13 +459,14 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 
 		/*
 		 * g_volatile_ctrl will update the new control values.
-		 * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL and
+		 * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL,
+		 * V4L2_CTRL_WHICH_MIN_VAL, V4L2_CTRL_WHICH_MAX_VAL and
 		 * V4L2_CTRL_WHICH_REQUEST_VAL. In the case of requests
 		 * it is v4l2_ctrl_request_complete() that copies the
 		 * volatile controls at the time of request completion
 		 * to the request, so you don't want to do that again.
 		 */
-		if (!is_default && !is_request &&
+		if (!is_default && !is_request && !is_min && !is_max &&
 		    ((master->flags & V4L2_CTRL_FLAG_VOLATILE) ||
 		    (master->has_volatiles && !is_cur_manual(master)))) {
 			for (j = 0; j < master->ncontrols; j++)
@@ -467,6 +495,10 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 				ret = -ENOMEM;
 			else if (is_request && ref->p_req_valid)
 				ret = req_to_user(cs->controls + idx, ref);
+			else if (is_min)
+				ret = min_to_user(cs->controls + idx, ref->ctrl);
+			else if (is_max)
+				ret = max_to_user(cs->controls + idx, ref->ctrl);
 			else if (is_volatile)
 				ret = new_to_user(cs->controls + idx, ref->ctrl);
 			else
@@ -564,9 +596,11 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
 
 	cs->error_idx = cs->count;
 
-	/* Default value cannot be changed */
-	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL) {
-		dprintk(vdev, "%s: cannot change default value\n",
+	/* Default/minimum/maximum values cannot be changed */
+	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL ||
+	    cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
+	    cs->which == V4L2_CTRL_WHICH_MAX_VAL) {
+		dprintk(vdev, "%s: cannot change default/min/max value\n",
 			video_device_node_name(vdev));
 		return -EINVAL;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 4c8744c8cd96..a3abbde5379b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -182,29 +182,64 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
-void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
-			    union v4l2_ctrl_ptr ptr)
+static void std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx, union v4l2_ctrl_ptr ptr)
+{
+	void *p = ptr.p + idx * ctrl->elem_size;
+
+	if (ctrl->p_min.p_const)
+		memcpy(p, ctrl->p_min.p_const, ctrl->elem_size);
+	else
+		memset(p, 0, ctrl->elem_size);
+}
+
+static void std_max_compound(const struct v4l2_ctrl *ctrl, u32 idx, union v4l2_ctrl_ptr ptr)
+{
+	void *p = ptr.p + idx * ctrl->elem_size;
+
+	if (ctrl->p_max.p_const)
+		memcpy(p, ctrl->p_max.p_const, ctrl->elem_size);
+	else
+		memset(p, 0, ctrl->elem_size);
+}
+
+static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+				     u32 which, union v4l2_ctrl_ptr ptr)
 {
 	unsigned int i;
 	u32 tot_elems = ctrl->elems;
 	u32 elems = tot_elems - from_idx;
+	s64 value;
 
-	if (from_idx >= tot_elems)
+	switch (which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		value = ctrl->default_value;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		value = ctrl->maximum;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		value = ctrl->minimum;
+		break;
+	default:
 		return;
+	}
 
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_STRING:
+		if (which == V4L2_CTRL_WHICH_DEF_VAL)
+			value = ctrl->minimum;
+
 		for (i = from_idx; i < tot_elems; i++) {
 			unsigned int offset = i * ctrl->elem_size;
 
-			memset(ptr.p_char + offset, ' ', ctrl->minimum);
-			ptr.p_char[offset + ctrl->minimum] = '\0';
+			memset(ptr.p_char + offset, ' ', value);
+			ptr.p_char[offset + value] = '\0';
 		}
 		break;
 	case V4L2_CTRL_TYPE_INTEGER64:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_s64[i] = ctrl->default_value;
+				ptr.p_s64[i] = value;
 		} else {
 			memset(ptr.p_s64 + from_idx, 0, elems * sizeof(s64));
 		}
@@ -214,9 +249,9 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_BITMASK:
 	case V4L2_CTRL_TYPE_BOOLEAN:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_s32[i] = ctrl->default_value;
+				ptr.p_s32[i] = value;
 		} else {
 			memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
 		}
@@ -226,32 +261,63 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
 		break;
 	case V4L2_CTRL_TYPE_U8:
-		memset(ptr.p_u8 + from_idx, ctrl->default_value, elems);
+		memset(ptr.p_u8 + from_idx, value, elems);
 		break;
 	case V4L2_CTRL_TYPE_U16:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_u16[i] = ctrl->default_value;
+				ptr.p_u16[i] = value;
 		} else {
 			memset(ptr.p_u16 + from_idx, 0, elems * sizeof(u16));
 		}
 		break;
 	case V4L2_CTRL_TYPE_U32:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_u32[i] = ctrl->default_value;
+				ptr.p_u32[i] = value;
 		} else {
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
 	default:
-		for (i = from_idx; i < tot_elems; i++)
-			std_init_compound(ctrl, i, ptr);
+		for (i = from_idx; i < tot_elems; i++) {
+			switch (which) {
+			case V4L2_CTRL_WHICH_DEF_VAL:
+				std_init_compound(ctrl, i, ptr);
+				break;
+			case V4L2_CTRL_WHICH_MAX_VAL:
+				std_max_compound(ctrl, i, ptr);
+				break;
+			case V4L2_CTRL_WHICH_MIN_VAL:
+				std_min_compound(ctrl, i, ptr);
+				break;
+			}
+		}
 		break;
 	}
 }
+
+void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			    union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_DEF_VAL, ptr);
+}
 EXPORT_SYMBOL(v4l2_ctrl_type_op_init);
 
+void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MIN_VAL, ptr);
+}
+EXPORT_SYMBOL(v4l2_ctrl_type_op_minimum);
+
+void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MAX_VAL, ptr);
+}
+EXPORT_SYMBOL(v4l2_ctrl_type_op_maximum);
+
 void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 {
 	union v4l2_ctrl_ptr ptr = ctrl->p_cur;
@@ -1296,6 +1362,8 @@ EXPORT_SYMBOL(v4l2_ctrl_type_op_validate);
 static const struct v4l2_ctrl_type_ops std_type_ops = {
 	.equal = v4l2_ctrl_type_op_equal,
 	.init = v4l2_ctrl_type_op_init,
+	.minimum = v4l2_ctrl_type_op_minimum,
+	.maximum = v4l2_ctrl_type_op_maximum,
 	.log = v4l2_ctrl_type_op_log,
 	.validate = v4l2_ctrl_type_op_validate,
 };
@@ -1768,7 +1836,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			s64 min, s64 max, u64 step, s64 def,
 			const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
 			u32 flags, const char * const *qmenu,
-			const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
+			const s64 *qmenu_int,
+			const union v4l2_ctrl_ptr p_def,
+			const union v4l2_ctrl_ptr p_min,
+			const union v4l2_ctrl_ptr p_max,
 			void *priv)
 {
 	struct v4l2_ctrl *ctrl;
@@ -1892,6 +1963,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		break;
 	}
 
+	if (type < V4L2_CTRL_COMPOUND_TYPES &&
+	    type != V4L2_CTRL_TYPE_BUTTON &&
+	    type != V4L2_CTRL_TYPE_CTRL_CLASS &&
+	    type != V4L2_CTRL_TYPE_STRING)
+		flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+
 	/* Sanity checks */
 	if (id == 0 || name == NULL || !elem_size ||
 	    id >= V4L2_CID_PRIVATE_BASE ||
@@ -1900,6 +1977,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		handler_set_err(hdl, -ERANGE);
 		return NULL;
 	}
+
 	err = check_range(type, min, max, step, def);
 	if (err) {
 		handler_set_err(hdl, err);
@@ -1941,6 +2019,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
 		sz_extra += elem_size;
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_min.p_const)
+		sz_extra += elem_size;
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_max.p_const)
+		sz_extra += elem_size;
 
 	ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
 	if (ctrl == NULL) {
@@ -2006,6 +2088,22 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
 	}
 
+	if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
+		void *ptr = ctrl->p_def.p;
+
+		if (p_min.p_const) {
+			ptr += elem_size;
+			ctrl->p_min.p = ptr;
+			memcpy(ctrl->p_min.p, p_min.p_const, elem_size);
+		}
+
+		if (p_max.p_const) {
+			ptr += elem_size;
+			ctrl->p_max.p = ptr;
+			memcpy(ctrl->p_max.p, p_max.p_const, elem_size);
+		}
+	}
+
 	ctrl->type_ops->init(ctrl, 0, ctrl->p_cur);
 	cur_to_new(ctrl);
 
@@ -2056,7 +2154,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
 			cfg->dims, cfg->elem_size,
-			flags, qmenu, qmenu_int, cfg->p_def, priv);
+			flags, qmenu, qmenu_int, cfg->p_def, cfg->p_min,
+			cfg->p_max, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
 	return ctrl;
@@ -2081,7 +2180,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, ptr_null, NULL);
+			     flags, NULL, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std);
 
@@ -2114,7 +2214,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, qmenu_int, ptr_null, NULL);
+			     flags, qmenu, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
 
@@ -2146,7 +2247,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, NULL, ptr_null, NULL);
+			     flags, qmenu, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
@@ -2154,7 +2256,9 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
 /* Helper function for standard compound controls */
 struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 				const struct v4l2_ctrl_ops *ops, u32 id,
-				const union v4l2_ctrl_ptr p_def)
+				const union v4l2_ctrl_ptr p_def,
+				const union v4l2_ctrl_ptr p_min,
+				const union v4l2_ctrl_ptr p_max)
 {
 	const char *name;
 	enum v4l2_ctrl_type type;
@@ -2168,7 +2272,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, p_def, NULL);
+			     flags, NULL, NULL, p_def, p_min, p_max, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
 
@@ -2192,7 +2296,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, 0, def, NULL, 0,
-			     flags, NULL, qmenu_int, ptr_null, NULL);
+			     flags, NULL, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..bfdba96e938c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -893,7 +893,9 @@ static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
 			return false;
 		break;
 	case V4L2_CTRL_WHICH_DEF_VAL:
-		/* Default value cannot be changed */
+	case V4L2_CTRL_WHICH_MIN_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		/* Default, minimum or maximum value cannot be changed */
 		if (ioctl == VIDIOC_S_EXT_CTRLS ||
 		    ioctl == VIDIOC_TRY_EXT_CTRLS) {
 			c->error_idx = c->count;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b0db167a3ac4..4bce1af5259a 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -133,6 +133,8 @@ struct v4l2_ctrl_ops {
  *
  * @equal: return true if all ctrl->elems array elements are equal.
  * @init: initialize the value for array elements from from_idx to ctrl->elems.
+ * @minimum: set the value to the minimum value of the control.
+ * @maximum: set the value to the maximum value of the control.
  * @log: log the value.
  * @validate: validate the value for ctrl->new_elems array elements.
  *	Return 0 on success and a negative value otherwise.
@@ -142,6 +144,10 @@ struct v4l2_ctrl_type_ops {
 		      union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2);
 	void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		     union v4l2_ctrl_ptr ptr);
+	void (*minimum)(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr);
+	void (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr);
 	void (*log)(const struct v4l2_ctrl *ctrl);
 	int (*validate)(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
 };
@@ -247,6 +253,12 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  * @p_def:	The control's default value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer (for compound controls only).
+ * @p_min:	The control's minimum value represented via a union which
+ *		provides a standard way of accessing control types
+ *		through a pointer (for compound controls only).
+ * @p_max:	The control's maximum value represented via a union which
+ *		provides a standard way of accessing control types
+ *		through a pointer (for compound controls only).
  * @p_cur:	The control's current value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer.
@@ -306,6 +318,8 @@ struct v4l2_ctrl {
 	} cur;
 
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	union v4l2_ctrl_ptr p_new;
 	union v4l2_ctrl_ptr p_cur;
 };
@@ -425,6 +439,8 @@ struct v4l2_ctrl_handler {
  * @step:	The control's step value for non-menu controls.
  * @def:	The control's default value.
  * @p_def:	The control's default value for compound controls.
+ * @p_min:	The control's minimum value for compound controls.
+ * @p_max:	The control's maximum value for compound controls.
  * @dims:	The size of each dimension.
  * @elem_size:	The size in bytes of the control.
  * @flags:	The control's flags.
@@ -454,6 +470,8 @@ struct v4l2_ctrl_config {
 	u64 step;
 	s64 def;
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 elem_size;
 	u32 flags;
@@ -723,17 +741,25 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
  * @ops:       The control ops.
  * @id:        The control ID.
  * @p_def:     The control's default value.
+ * @p_min:     The control's minimum value.
+ * @p_max:     The control's maximum value.
  *
- * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
- * to the @p_def field. Use v4l2_ctrl_ptr_create() to create @p_def from a
- * pointer. Use v4l2_ctrl_ptr_create(NULL) if the default value of the
- * compound control should be all zeroes.
+ * Same as v4l2_ctrl_new_std(), but with support for compound controls.
+ * To fill in the @p_def, @p_min and @p_max fields, use v4l2_ctrl_ptr_create()
+ * to convert a pointer to a const union v4l2_ctrl_ptr.
+ * Use v4l2_ctrl_ptr_create(NULL) if you want the default, minimum or maximum
+ * value of the compound control to be all zeroes.
+ * If the compound control does not set the ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX``
+ * flag, then it does not has minimum and maximum values. In that case just use
+ * v4l2_ctrl_ptr_create(NULL) for the @p_min and @p_max arguments.
  *
  */
 struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 					     const struct v4l2_ctrl_ops *ops,
 					     u32 id,
-					     const union v4l2_ctrl_ptr p_def);
+					     const union v4l2_ctrl_ptr p_def,
+					     const union v4l2_ctrl_ptr p_min,
+					     const union v4l2_ctrl_ptr p_max);
 
 /**
  * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
@@ -1571,6 +1597,30 @@ bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl,
 void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			    union v4l2_ctrl_ptr ptr);
 
+/**
+ * v4l2_ctrl_type_op_minimum - Default v4l2_ctrl_type_ops minimum callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @from_idx: Starting element index.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr);
+
+/**
+ * v4l2_ctrl_type_op_maximum - Default v4l2_ctrl_type_ops maximum callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @from_idx: Starting element index.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr);
+
 /**
  * v4l2_ctrl_type_op_log - Default v4l2_ctrl_type_ops log callback.
  *
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c1c2ae150d30..c8cb2796130f 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1912,6 +1912,8 @@ struct v4l2_ext_controls {
 #define V4L2_CTRL_WHICH_CUR_VAL   0
 #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
 #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
+#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
+#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
 
 enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_INTEGER	     = 1,
@@ -2019,6 +2021,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
 #define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
+#define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX 0x1000
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
-- 
2.43.0-rc1


