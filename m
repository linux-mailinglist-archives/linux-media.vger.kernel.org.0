Return-Path: <linux-media+bounces-20973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D659BDE86
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 401161F245C7
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 06:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C59D19258E;
	Wed,  6 Nov 2024 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gsBaj9iv"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A1191F86;
	Wed,  6 Nov 2024 06:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873312; cv=fail; b=PXwn/Vy8VpVMW3gVvbSqzq4MLjr18ewIJlJ7tCUpI2lqp46Le+a+FdgU0wXmKj5uJnStGraMlny7Md+inv7pYViG5VEiN2+h95YCw5MCGgC19HAKYonZ8hyr8hNT1lEaz8uhqe9r6HYbQZi8aN3Nvc/JGEr3igSMhRASjgqn2+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873312; c=relaxed/simple;
	bh=tCVlQ3w2V9I1KlogmSlRSJ4thYZGT3jxrO9w+HxkGxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qeQd8LN1j1+32JZfN6TipayXYChxT0ZPYNA8fD/Wf0hu7ZXfqapGWRp+DlHexVIohti8iGBDOMdPZbv+ix7sTBFNdVY7sm2nfDthC7+kLfCpLK2i5yGJvFgyqYSPmLVKO1OVHHnvvjcl57Q5L9R0Mpen0f3dd3pneGJkLUN8gb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gsBaj9iv; arc=fail smtp.client-ip=40.107.20.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4oV/g3OSs1cLSEsL3RpONTSjx0EvqvjvKmgSDat1wOoYFkXYNVJYnJxeurdgqBPhEyx+Ml/y6pwIw0wWEfJf5sA/iL4NLZ2vQKGh0E0NrJcLf/6BeuD5DjvoGpBQewE8Di82R3lo5/huC7fTAAQqal+HxYt14pOhV1NfuiQWWmLARs276GenMz2UUTkJhttrZufFDFnS94wKndsco6pQJTafQP8jWTujcdI03r/yPXH4o5PubDtRMM3wCvwItVMfLPLV7+cm9ybqo6m8+jBvd2VGR1w8QXQGYdzntIGs66kihvLwOI0qv0Jgz49zwSUpw7zldhE/Wx8IjZIoZeZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1KBz4blLYJUSN1vn0vSjwuM6Lv08zEmF9YUkX1Ekd4=;
 b=i85Iyx4v3Xfy2wnxB25rjfhcH3uYuCw/UgzPgpA4/6Kv+XHsLzAVGvESQSZVAPm3CX29MtJKHjX53hYZTuiZv9IQqeb/UDVb4jN8ZZyJvo0Uq3wwf+ipw1cOI/DESx96ov7Yv3jdt+JAtTmlIzTWyvx8hhdrzfu1zIsBmZNuJ/42qJkG7TEutLdqjHXSWBGOunybmAdMpvOThKZE80OpYxy1ijeT7KMO0IEZRz0SCU9aWlK6TfRCGR2HMRXgsfP6QZwqVAya/I3S8e4RyEJ0iVmZLqJNNP0APvPjLfE8xK5aqDr61ysQ3goI3lsBQc862CbAVd7H+SUq82OTv8uumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1KBz4blLYJUSN1vn0vSjwuM6Lv08zEmF9YUkX1Ekd4=;
 b=gsBaj9iv7RyoD46eqbukoP0z1WGionqGym4TsEN56yu7uUu4f/C5fqKzSYU6ry7sWA+Ht5ge5BSmLHGnVRQUNCYhWVfCuFEzXEbq+VleJWx6Bsh123YvVTOet/b+IIKVQuHrpQtNDIWHA4bhK7T2eqW0AeSWuLomeyqCo+lXKf7es1IJJVX6SHRKGRs/YKtD6DseSb1JhHHN40X8m5hwsCXcspCZ/sPFDQe+3BdBLkzZ6l+iu+Ef4fB0Kj9w1y3rIEYiiZvgf6EJAfkzCs7/+Nelv1g0qqJWqNXQsdBiFICqdshfG1XlJRNpPXvTBPSORLgUD13udvmyYtHF3nPI/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10506.eurprd04.prod.outlook.com (2603:10a6:102:41e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 06:08:28 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 06:08:28 +0000
From: ming.qian@oss.nxp.com
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
	ming.qian@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/4] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Date: Wed,  6 Nov 2024 15:07:49 +0900
Message-ID: <20241106060752.205074-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241106060752.205074-1-ming.qian@oss.nxp.com>
References: <20241106060752.205074-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10506:EE_
X-MS-Office365-Filtering-Correlation-Id: cecb7cd1-ad32-40bf-208a-08dcfe296e56
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9dgZVtxU1CFQTmGbLJx3Ft88+BmTYYVlZlGb5AE1EuR7VWC/OUPlkT78uB3x?=
 =?us-ascii?Q?jmXKxzufcKtp203yuWkhVrVSzas6lRbzuh9+bjt37ZeKa1wG8ptruEAZ7/iy?=
 =?us-ascii?Q?HfoWExB/ZySZYOvKEMJC6yE9y+v4/6eWq+QlEZ4lyeihJcVNzdwNJZkk4uxv?=
 =?us-ascii?Q?/PjZ+tqdrNRPV7YZ+ws1eDMdflI4EkOLVETCOI+Rdct0oZwYPrAEUMUd5alp?=
 =?us-ascii?Q?gUodRvCf/yqaTAbbGsXEd+YyvBx4hX+/NJ1lUIGeKpNWCEUe6LcEJxV49Xwj?=
 =?us-ascii?Q?eeOzZf6N0435SYy9QngcBXYroRjbsarjR/lQqVXmAk0TyWKgE0tDnBhkFnKy?=
 =?us-ascii?Q?14ymoRYfJN64WVQMylYag98vFy6PQeOCCHYYPDWqtmwXXVf3gYikCD0xMjY5?=
 =?us-ascii?Q?4WVp3+zn/1eQF1mS0jb6fkwGD30sYiaopb00HDeDUWsJljzwQp6yvsJ/sIEk?=
 =?us-ascii?Q?P/jfXQrRH4hbl+p3H0CuV5aUQCW6QtUrUvRlMgDpArIo8WnBXt1SlaPiZ6rX?=
 =?us-ascii?Q?u03t49IScX22ajZLf3zikZc5XtRKgXUR2xRCiHNiJr13eMqEu4qmFAwFeZEd?=
 =?us-ascii?Q?RIebx4npKFNTgt2RcCQ6ddCdecn1DVSLPDEzE797uGjZG2B4gTbgkNduM7UV?=
 =?us-ascii?Q?pMY1UR0v/6KuyUA9/s0X9DDova5/aLWtzj/HbTkuNa3IeliZBpUiziAvjZU6?=
 =?us-ascii?Q?Z9vbZ7BzC1sNwCHGfvYzWSzdtKatbPbsbtjHCk/0YUlu31SdgZHX0KP4szKE?=
 =?us-ascii?Q?miit+HTG2F6AriZzi7cr2anEGddSxFOqc1Ro48MDUuPdS/35GUEyK1uk12ML?=
 =?us-ascii?Q?tGABxbAfbZpywUJfzwXdLHrwz8C0AzlVrbbmXLe85ABZKdhoGmYCf4oJZE+B?=
 =?us-ascii?Q?CQg1hW5/NgLv7lFTQjDKJziqG7TPrr1E7p0Y2Ub/nTp3JEiWAT4wOhHYv2n/?=
 =?us-ascii?Q?dBFR5APFfQ1mjgFKP4kyDE1FZkpFwl2GTnDTzPhRf/oZcSIAM4/dxWVduLbp?=
 =?us-ascii?Q?X1dEeRhI5XRrcnENcJZ6Qs4ahE6iVc5na2EhGxV7XUTrLHC6MkruVQ+WIwlt?=
 =?us-ascii?Q?SmLpvxxphhuma9+G2Jcdq0qnzmzAN91nkLd9ZI5fOBLN/spbdj39DSeSwYIS?=
 =?us-ascii?Q?W3FqyQ+S+IyKEN7druVP9A3VPiOh+FFgZDoL7Jm9mRHv0McjerBvJUQEqxQo?=
 =?us-ascii?Q?/MziWVjjRW7L59wm0HpFNkgrLw/p7TQDPBBuZpqDATjkk7sM6SnaFAEziMQ9?=
 =?us-ascii?Q?5k8qz9C/LMOm8OuQl9DmGU81LaCtODDI4zUYAZ7P/LowcPsemRBzjnGjSg6J?=
 =?us-ascii?Q?J+k5ERT7ayyKLpzih7l/JzltkuPOmck6IYrbzoHrJQoDKYIr/4FnF6nNN/uT?=
 =?us-ascii?Q?6qQ6oQ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W1kKz28sHjWk0utY3ZDGfglNVR8vUeCRJRMU2NZo2qpC9IHiUIw7XxCL1ybz?=
 =?us-ascii?Q?oPN4VAJaz8JxMMxX/TDFrghroCcMuXlQOBfa2Fc3fiqbIqoTT/e45y1/DiCs?=
 =?us-ascii?Q?+4QqSm0TgvhBDqgEH5BJbU+p5P4EFhRParitA0cPjeMNLZ8Kj2jBzShhaI7l?=
 =?us-ascii?Q?wr69xxDWA+T/wBdlm0q8b3NbUYAbUKMVt88v3efknwO6hazuZZGCSQQXN2Kj?=
 =?us-ascii?Q?xPYJXKkw6RSmP647f3gjwfHB+4h0Fp2YtwPzv0x/IVSvyO7dJNQys9MpL0/X?=
 =?us-ascii?Q?6LIuYeiTvc2dVhZt2TBH5SJQXbMhECVgvrWqifde/cj8vjlu3TtdxLI/FwRd?=
 =?us-ascii?Q?YunZFpR66SxsStQ/xntGMJdj6ai0el0WPujZHTRqIT0kva4e0dChx1QyOzEJ?=
 =?us-ascii?Q?yt/EmFMDxFZ2mC5K0hMxowlEQHoSAud2SIcyXIXvu4KOXlLwVIzVwMFgq9EQ?=
 =?us-ascii?Q?3T/bMi38UytmXtxWd8Qqctn3CgxyBoCnX1+TgqMDrZva3L88WGoygPXw9ysb?=
 =?us-ascii?Q?NZI76S/65cOLn7Z4zLonCKBztaefpTbqjPm6z5DtID84Tc5tzRdH/9i+qGc2?=
 =?us-ascii?Q?AY3qzm1BLudRSRrHjMel3qG3X+YRUfFdYQEqj3j2jwVf5fdKWlPiimHcF2wN?=
 =?us-ascii?Q?mUMfEag9gauY/JoCUEGAMwYEJjMHcRhVWiHLGHE5xqA13a5Xq950noC+m/FW?=
 =?us-ascii?Q?hk7xFxmiB33nxUmIhwOmLD1vECgt8dvyx7rx3VOPJXc5NS0n++Hio3bFvzFV?=
 =?us-ascii?Q?u9hgpRX0oKo/mVvNa4udtQ0cQWLPrE0K+yGgfU51DrjxW8LDcXoaGNxSlLYI?=
 =?us-ascii?Q?+0iuW3duaAnAsJxTuQwWTka3Zl2wQwSioU0w2IMRl+I6ElV+QsAicgF8dSEx?=
 =?us-ascii?Q?Gct7/OY4wre4lihny02qJLVEFCL+GsG+z3BDbrsyoD35hNECPYTMo5sSzPFs?=
 =?us-ascii?Q?LkWlDwg50b/1oJVYSAwtu4FKfSSz9xS+0k3aD8sIVtYPGllA3Qoicvm4ll3Q?=
 =?us-ascii?Q?rVFWHvOLOK6G2A3CZ1B8cB39fApLi99QotNdsKhi+dz+ZPzKncV4yp/SI0eO?=
 =?us-ascii?Q?8xOMirR3FK5QR27QTjPqbCUsah/5xIGh5YSFuCnWbIgOujSnNO6+G6508fB1?=
 =?us-ascii?Q?8mTF1kBRSIxaq1CSDRlKAh8iqtebWq2TRrTeiETGP3+diAN0JB3n4KYm9WEe?=
 =?us-ascii?Q?r4MvppMgMtXWAQcTuFC+NNfLgR0EUN/4mTLcqS2ZvqX1+WRKoQQ41qCINvRm?=
 =?us-ascii?Q?0aW2O3YteQWT9mh9GwxBFNNL5h1ApZgQXfxpVLBiFE2mmbweC/6grWSqkgAG?=
 =?us-ascii?Q?WXJyhHXo6B/pGadMxPRQ6S0lGbThsRQfN8Am167rFuOboDEABedccdgOx7KM?=
 =?us-ascii?Q?SWSzoyDK1E4gRZPvbMA8j7Tsnz4XFsJ8U++nApb5yDyse0WGMzMEphARp6ZH?=
 =?us-ascii?Q?B5eDAF7dCT5vzMFML/1zsve60ZyfTIEXZfKxudGRbJmbdqyEmzIq+QNPH1Kc?=
 =?us-ascii?Q?/FTdNbWcd8wcYEyCawbvXNj+t363qj3ILWSINiW/+8QSjPa/sttZh7A4GnwW?=
 =?us-ascii?Q?aAr9eo/Q5GKf5NS/3gE8loDDWAeWYOPrf+BLWITJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cecb7cd1-ad32-40bf-208a-08dcfe296e56
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 06:08:28.0863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wr9f8reWy9YU2IJZBGF0jscsLpm9cZMytNqUe0wJrI5gEfLLhDlzgXh+2qzvFt+kwc9tfjCxdZu/BBbWty/YRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10506

From: Yunke Cao <yunkec@google.com>

Add p_rect to struct v4l2_ext_control with basic support in
v4l2-ctrls.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/vidioc-g-ext-ctrls.rst              |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst  |  7 +++++++
 .../media/videodev2.h.rst.exceptions              |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c         | 15 ++++++++++++++-
 include/media/v4l2-ctrls.h                        |  2 ++
 include/uapi/linux/videodev2.h                    |  2 ++
 6 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 4d56c0528ad7..b74a74ac06fc 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -199,6 +199,10 @@ still cause this situation.
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AREA``.
+    * - struct :c:type:`v4l2_rect` *
+      - ``p_rect``
+      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_RECT``.
     * - struct :c:type:`v4l2_ctrl_h264_sps` *
       - ``p_h264_sps``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 4d38acafe8e1..56d5c8b0b88b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -441,6 +441,13 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_area`, containing the width and the height
         of a rectangular area. Units depend on the use case.
+    * - ``V4L2_CTRL_TYPE_RECT``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_rect`, containing a rectangle described by
+	the position of its top-left corner, the width and the height. Units
+	depend on the use case.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 429b5cdf05c3..3cf1380b52b0 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -150,6 +150,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7ba..d07869d55a96 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -370,7 +370,10 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
 		pr_cont("AV1_FILM_GRAIN");
 		break;
-
+	case V4L2_CTRL_TYPE_RECT:
+		pr_cont("(%d,%d)/%ux%u",
+			ptr.p_rect->left, ptr.p_rect->top, ptr.p_rect->width, ptr.p_rect->height);
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -815,6 +818,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
+	struct v4l2_rect *rect;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -1172,6 +1176,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CTRL_TYPE_RECT:
+		rect = p;
+		if (!rect->width || !rect->height)
+			return -EINVAL;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -1872,6 +1882,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
+	case V4L2_CTRL_TYPE_RECT:
+		elem_size = sizeof(struct v4l2_rect);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..b0db167a3ac4 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -56,6 +56,7 @@ struct video_device;
  * @p_av1_tile_group_entry:	Pointer to an AV1 tile group entry structure.
  * @p_av1_frame:		Pointer to an AV1 frame structure.
  * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
+ * @p_rect:			Pointer to a rectangle.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
+	struct v4l2_rect *p_rect;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..c1c2ae150d30 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1859,6 +1859,7 @@ struct v4l2_ext_control {
 		__s32 __user *p_s32;
 		__s64 __user *p_s64;
 		struct v4l2_area __user *p_area;
+		struct v4l2_rect __user *p_rect;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps __user *p_h264_pps;
 		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
@@ -1929,6 +1930,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
-- 
2.43.0-rc1


