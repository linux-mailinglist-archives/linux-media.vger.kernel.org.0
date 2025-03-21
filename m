Return-Path: <linux-media+bounces-28570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B417FA6BE19
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21EC51897CB6
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 15:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419BA1E5729;
	Fri, 21 Mar 2025 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="DrBrIuc6"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53001DDA09;
	Fri, 21 Mar 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570187; cv=fail; b=kLrwjGT/SyS7xctdJdApnB8Kj7lC53PXLbBsNsRajF9oBkR+cWm+P9N0FC53dO16nQEkGBxbKNbie4s3zRWIRCP4N/GsV3OVAxVL5FViYwDiGfY2m9OTw2IMcdPVKkFVJIOU9ekRGTZbRsfOJy2NQ3Bohy8XUAghnm2/M2zADZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570187; c=relaxed/simple;
	bh=w4mkfal+aGcs2g6M22OgCv+xc8fD9iOhGsI5nu9kN/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XNqQKHagO7J2h7LzlvOl/xTuo/ZRMYnEvTKehMPyMaZHpQ5P64G04i/yfuORUcRKFlnQdUSnQGyq6WebxGciMx1mFilQLtrVfmNmqjTZPTYR2gzwXnGzq15MMYZ67IieLfMkAq/BtH0KHkqfgmR97XwFmZpIh5xgjxqCD53Ceg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=DrBrIuc6; arc=fail smtp.client-ip=40.107.20.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ER4GXFasFin+AjEzI7sXdrbdI85TE3H4WpCyxtOi8UfgAZdEmLaFQvO1IqUA1E80TuFqLfJhVNOy+8d9CZD8OnO9o1S/qMEKMfk1W5j8TZ0ki03lmPPWRvNgpwZDvZ+Drz6grpvGJVS81FbsQ3VicDjBXP6ZDJENTmldfrubeLzYJm4Sx1QZE5PuB/PAVOpg+D7tsFUGqJPcfB5cW9KOMsY6YatWuU08Uh9/vko15WxnCe3OlYUo+9O/Jf0u77xNf9l2qSeWyuGEYWdX3sMgRJdKAOhTtQN55AN7whYX3Pcx87Bd+2RvsZwyvu9455LSVQbVWQNA6i1fseqweMbSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJH3rQ/5vwA+BKIRxkB2lGJiGTgluDGsWcQcP3SSQVY=;
 b=g9ln16VIkozDaNLnyltWbjBh8qWRgG3xg//GZRQT0t8TZpvXNctxSpzd1VWL/8D+TAgyoGz1Y81tdXQ4N4kWO0I2Ps5Y+PwoQ+gBRSmNpwKVvkezxHtGrYYdAG8nNSaGlW+iwagVxXN4FnaKIlYTiWSELJdxug/jkt/wkNgAMTp8fqYOlZtNDBuut3hhJQc2CBpXInieRaFaAXLPbLBZQmalVv73bzzemqeEjGP+E12dct39tB6DCEkt1jkZOQzq11QCxJG/Y1L99aV2lP3v5K+G+rAw38GWxM+W4FVyemavFEpAKArsPilnEDmFlIvdtRnav3RoupPwl80/rsBatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJH3rQ/5vwA+BKIRxkB2lGJiGTgluDGsWcQcP3SSQVY=;
 b=DrBrIuc6Fl70FlzhRSAJy8pqUFX2irwIJ+p8qLcu82btwz6SwF3WOUHzwlMGzOGEyMr7B19J+53AGnKa0q2HfklDcGAZIc1aKWA0VaouEW+isdgG4C09r1X1mzjrIZuQeTyC2BoqSmeMe/4RrGL+V7jz1aJyduwj3s0bekxNC3S4QjVDvgHnQvb3EIV34+IfdqAGupgWAW888jd2gvlX0ovmRg12BFvwW9eC8fjD3tY6lFX1C8hBHN68UNFRJZYsKtsZdI0rot0P/soipo1u0woslZh4uMIlf2uDJXnaY1Y8o8IMoTqA28MCnnMaes/t7/GwYgpAn/VV6278HpyKCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by VI0PR03MB10284.eurprd03.prod.outlook.com (2603:10a6:800:1b9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 15:16:22 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 15:16:22 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v4 1/1] media: imx: csi: Parse link configuration from fw_node
Date: Fri, 21 Mar 2025 16:06:15 +0100
Message-Id: <20250321150615.381112-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321150615.381112-1-mathis.foerst@mt.com>
References: <20250321150615.381112-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0071.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::17) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|VI0PR03MB10284:EE_
X-MS-Office365-Filtering-Correlation-Id: 041c8504-a598-4148-2724-08dd688b568d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PK3gDM4N9l01zLaAhLjWHx+wfi1QhnfP2l2DaS4Ymlf9cyGLcjtINupyrkln?=
 =?us-ascii?Q?preKH+FT30/cZlE00amnwNmN8hOnzUBjavwCBv+Oo6aSgMANvx3dxc4C2W3r?=
 =?us-ascii?Q?uFwSZlCblarCId8n0HHF2r30GH8dLA1dtb8Rch+cyVE8+nXKSLthKXWnGe7Q?=
 =?us-ascii?Q?xV+VdYKUaSOfatVUVU/O7CzrYf4bDd2mw3NZvxR9IrmCO+SstaB1V7tFRv0D?=
 =?us-ascii?Q?ALknG0gDuvohAkUQAEeo9Uyxrn2PD7czQS9J6Hwn2I9JaO6p2LJUuFqFiJrw?=
 =?us-ascii?Q?Pmo/RsgmdLE8uh2jtDW6RQ/WBrt4hZyDaiKm/yazRJO0nP2JCFIflzXA3OhE?=
 =?us-ascii?Q?g5Nvgio+vn6tFaCnP0UrYlHbu0VKyVwIw+UJGIsB3UxZSX3vAK6H6DZgGL2+?=
 =?us-ascii?Q?aDXMtZmYZqi3/601wjAWt/4fRH2EP+2A/klLlFFytKPyKgO60Rs5HTdUSvvZ?=
 =?us-ascii?Q?GxHpq3/jr7uzDnviFi6sPbmNVoCtcPlyMV8++Y08/mPaZEcNTKk/CdY3CUDh?=
 =?us-ascii?Q?MvWHKPwh5B6Nqiz+lemu9ZBgWvXE11qzD2gvcM4yjhzKlKgdxnsyOHD5orHf?=
 =?us-ascii?Q?pTu+Ds53DaepYC2h7cvuboWX9aB2/2l0E093AM6EWJtEH8zqo2Rsk6ndnnHo?=
 =?us-ascii?Q?i8JhOcgyqQdmaI3jnEu3BE8BmdEj9rJihTcR5gkhxOJ1oxr+lCsxvUxD5oaY?=
 =?us-ascii?Q?nnIp8A+XUdaoUz2i3Np3Qylb2DssJeVo5qQgdCvkgTRbZniigJ3QbcWJIYtQ?=
 =?us-ascii?Q?lvIbLV6pGbusTe+Tf9PiUvuI/EfrV8Efh6FMwPQ9uV/g2XqDjksgkL1TQaMt?=
 =?us-ascii?Q?cqDKSqh5j2C2vkXk4dhbCVDjIKYw2tCsxJFGvNqCA+0q272PlX/3W0jSc9BG?=
 =?us-ascii?Q?Kiwh1l4xAFz0Qamn56llEyIirYBmm3SdKJ2vC7lr8QirW+2/vI/0solsm0s8?=
 =?us-ascii?Q?6Awz2S7rrggaKAvtcCXYa0/fdqTEcgKqi39ASSHYwhPL3EzLOge/EbDu79+d?=
 =?us-ascii?Q?2icMNTgjFi+6Sw7RW5xtZ5qqK0HciZXrT0aj3j4hoc1XSkmqgbfK9HIE4Rag?=
 =?us-ascii?Q?FOIl4HubvtqQlMAAl71YAUFZqJRCCLYZ9kkNehyK17KwtVgD3bA/Qx1de3Os?=
 =?us-ascii?Q?NQYVX4oMw7lYs4vdTONm6SRWg56zmiG0XoSxGG4bb46iL9xhiyMdo2R1fecv?=
 =?us-ascii?Q?NR04NVNOkD8OjyRukqpK8RBE4WwYqV5eAnZn0w0hL1VQPZPASY/t7Cl8UiHP?=
 =?us-ascii?Q?8jq1+kL0N01gFtfEOryj3DzSMOtTYcJeGLC3ppMbcY5XPLbaq7kTe3hPaOAf?=
 =?us-ascii?Q?04hC0X0IJuNB9gwpG8TbeNpqwuAvR66SiYouSQZKlyUxXGGVSGVZCssfIVPe?=
 =?us-ascii?Q?EBdZ0kHHE1GfgitRHGS8NlJhser37Ji0WbuzkskR5znjq8F5/DHhp3fEYRUU?=
 =?us-ascii?Q?KIhK4eLEn9+bJM9tRm+5q1C1pO7aowh3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tqY5nMIhmAxcOW8oEhkCZOZIQyLw+G4HagzZ4Bb9UGp9LJQ0ggzqXUbSCEmR?=
 =?us-ascii?Q?FYHn942DUUiiVRWHoVJQgCN9YI/S03MkSGn9bA70BcosahRqkKoLNUZD50ZU?=
 =?us-ascii?Q?q/wmhDOtCNp1DNvpnTrxqYZ6hvhG7qm40M9NqSaj/GR5eASzR+K5udlqoQ5y?=
 =?us-ascii?Q?eTGc/+YnkaYpdMDdoUTOt1e/mL8ylRn7WRUwjLvADwVr6v4kc+l5yd6Gwp4M?=
 =?us-ascii?Q?aCxRhySfO7DT3NUjRqknbT82BSQSEt2kQyKCJU6r9Rx+KSj8EVokyNbNZvgR?=
 =?us-ascii?Q?mycB/zRIElFZ+8bbmMX5RJ7r3afF2CJhq9AYbkGIvAGOfG7JXrfYCLDWXGdZ?=
 =?us-ascii?Q?kISamWQdfwl2pbYZwArUvberPb/G5m9cZwLmqzg3F3P4451tgWi1ssjMIoT/?=
 =?us-ascii?Q?ybZByvyPxDNnrR7NQR0w2/VfLFP71dR1d1dm3hLLCjJuYgZc9KQIuzE5FSd+?=
 =?us-ascii?Q?z+cVZD0JPsPMuQKZUsA6SEVNRY6IrIhsC6p/rjpw9zkB7wqj8xZsM+6mVjxO?=
 =?us-ascii?Q?EtTCZDObuXdZRJshiRodFsrVnj8yj66exlDy7v1ccLHD0QSKeXizITdB9KUy?=
 =?us-ascii?Q?QJbsKNqA1/mDaqzOojVyAovcaVfE4KMJGIFa95BWVjN7QDJvQzTKjbvXafYs?=
 =?us-ascii?Q?LMyvNR8l62snfhU2FeScXnXoXw9RIEHZnYeh9nsdZlaBJdVDbhYhNhxviJLp?=
 =?us-ascii?Q?FUqxMZxaAVJl4UThw18KosuxHLtbYHlDHBNbl5qoAbYefQ3d/PsFSbSD31p8?=
 =?us-ascii?Q?vbgjmg1/MZJWnh2Lr6RSP6YFTbcUNZrVjh80wYkhwD2Bk2KJ3wqZKHsOcZt9?=
 =?us-ascii?Q?I4X7pK6mNdCa/UCc6E8qtBf+6mfIO7p3RYnzI4YDUmEYtrktI7GqO6gFiU/1?=
 =?us-ascii?Q?Hk7PIyaGdrYEj+FoKMclkc94L8uuRpx7ZFoupM3ZPBNHQDzNjo1R6e88duJk?=
 =?us-ascii?Q?bOdCSoSL4axMebVCNQoYGQnzF1wyOogOy/+3TzN35JAs+Z1qtcHorDHlwi2+?=
 =?us-ascii?Q?ElTytJE3+h10TKGuHmxSDNlpb+93LPxEHDtEnU0z/Rw0n42ENUDZ41mVLATr?=
 =?us-ascii?Q?pLzmjT0RR4Prdor/0LAqQxTIgKy9C7gp+zceipttuEmuWyFfV8M044a7aikb?=
 =?us-ascii?Q?wS7Z3bvkucRmXvPZXN2N4+3SC33Zs9r0Igjxre/CDYIaGe1JSvBtEO2oauvy?=
 =?us-ascii?Q?0xXJt+L2j1s5rPgqOItm/vu1XhONw174G8aG71hdlQ1d7m6FT4j7hpKevr2W?=
 =?us-ascii?Q?1pBr5KG0tW13SFDbImVu+ayXcC3ZhkQayknkTH5mR8EneAPZgsP1b0Ll3G5D?=
 =?us-ascii?Q?NgqbIBmIiD4Tt0mwnwKGjD7oS8+FMNkrfTuimTQq+ZrzyvxyT4s0IDLZiil8?=
 =?us-ascii?Q?4652J7SIL6jB3I3WV8Ya0e6sdCsTBmNFhwuuUc16X/o2ERiRTCJ7XFu1VXEO?=
 =?us-ascii?Q?hCpin5KTJ+paxqD7kI0kh1PwkaHnI0xx1hn38NlIGdIlhZAwx5cgaaUMVrm1?=
 =?us-ascii?Q?EHpDys99qH99aHnxKduLdw6GuaVnf0xf98lwvtrroW7+Vg1q6KkaiXo5UJW3?=
 =?us-ascii?Q?yqZbdrs8N4oeVL/VNmKBY0J05UUY5CoE2JCR8aoJ?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041c8504-a598-4148-2724-08dd688b568d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 15:16:21.9773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SZ//eiM4FnJ1W+RWIxkFFvku4E7Dj6OjfKpexorKadN64RL0X4h8rw7AWsTiVOcpIXu1L9lpCy+2flhUQ+Caw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10284

The imx-media-csi driver requires upstream camera drivers to implement
the subdev-pad-op "get_mbus_config" [0]. Camera drivers that don't
implement this function are not usable on the i.MX6.

The docs for get_mbus_config [1] say:
@get_mbus_config: get the media bus configuration of a remote sub-device.
            The media bus configuration is usually retrieved from the
            firmware interface at sub-device probe time, immediately
            applied to the hardware and eventually adjusted by the
            driver.

Currently, the imx-media-csi driver is not incorporating the information
from the firmware interface and therefore relies on the implementation of
get_mbus_config by the camera driver.

To be compatible with camera drivers not implementing get_mbus_config
(which is the usual case), use the bus information from the fw interface:

The camera does not necessarily has a direct media bus link to the CSI as
the video-mux and/or the MIPI CSI-2 receiver of the i.MX6 might be in
between them on the media pipeline.
The CSI driver already implements the functionality to find the connected
camera sub-device to call get_mbus_config on it.

At this point the driver is modified as follows:
In the case that get_mbus_config is not implemented by the upstream
camera, try to get its endpoint configuration from the firmware interface
usign v4l2_fwnode_endpoint_parse.
For the supported mbus_types (V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656 and
V4L2_MBUS_CSI2_DPHY), extract the mbus_config from the endpoint
configuration.
For all other mbus_types, return an error.

Note that parsing the mbus_config from the fw interface is not done during
probing because the camera that's connected to the CSI can change based on
the selected input of the video-mux at runtime.

[0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
[1] include/media/v4l2-subdev.h - line 814

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 62 +++++++++++++++++++++--
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 3edbc57be2ca..bb5437d9c033 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -158,6 +158,50 @@ static inline bool requires_passthrough(struct v4l2_mbus_config *mbus_cfg,
 		 infmt->code != MEDIA_BUS_FMT_YUYV8_2X8);
 }
 
+static int csi_parse_upstream_fw_link_config(struct csi_priv *priv,
+					     struct v4l2_subdev *remote_sd,
+					     struct v4l2_mbus_config *mbus_cfg)
+{
+	struct fwnode_handle *ep_node;
+	struct v4l2_fwnode_endpoint ep = { .bus_type = mbus_cfg->type };
+	int ret;
+
+	ep_node = fwnode_graph_get_endpoint_by_id(dev_fwnode(remote_sd->dev),
+						  0, 0,
+						  FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep_node)
+		return -ENOTCONN;
+
+	ret = v4l2_fwnode_endpoint_parse(ep_node, &ep);
+	/*
+	 * Retry with V4L2_MBUS_BT656 if parsing fails with V4L2_MBUS_PARALLEL
+	 * as the parallel interface supports both MBUS types.
+	 */
+	if (ret == -ENXIO && mbus_cfg->type == V4L2_MBUS_PARALLEL) {
+		ep.bus_type = V4L2_MBUS_BT656;
+		ret = v4l2_fwnode_endpoint_parse(ep_node, &ep);
+	}
+	fwnode_handle_put(ep_node);
+	if (ret)
+		return ret;
+
+	switch (ep.bus_type) {
+	case V4L2_MBUS_PARALLEL:
+	case V4L2_MBUS_BT656:
+		mbus_cfg->bus.parallel = ep.bus.parallel;
+		break;
+	case V4L2_MBUS_CSI2_DPHY:
+		mbus_cfg->bus.mipi_csi2 = ep.bus.mipi_csi2;
+		break;
+	default:
+		v4l2_err(&priv->sd, "Unsupported mbus_type: %i\n",
+			 ep.bus_type);
+		return -EINVAL;
+	}
+	mbus_cfg->type = ep.bus_type;
+	return 0;
+}
+
 /*
  * Queries the media bus config of the upstream entity that provides data to
  * the CSI. This will either be the entity directly upstream from the CSI-2
@@ -175,6 +219,7 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
 		return -EPIPE;
 
 	sd = priv->src_sd;
+	mbus_cfg->type = V4L2_MBUS_CSI2_DPHY;
 
 	switch (sd->grp_id) {
 	case IMX_MEDIA_GRP_ID_CSI_MUX:
@@ -186,8 +231,14 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
 		sd = imx_media_pipeline_subdev(&sd->entity,
 					       IMX_MEDIA_GRP_ID_CSI2,
 					       true);
-		if (IS_ERR(sd))
+		if (IS_ERR(sd)) {
 			sd = priv->src_sd;
+			/*
+			 * If the CSI-2 receiver is not on the path, the
+			 * parallel port is in use.
+			 */
+			mbus_cfg->type = V4L2_MBUS_PARALLEL;
+		}
 		break;
 	case IMX_MEDIA_GRP_ID_CSI2:
 		break;
@@ -211,9 +262,12 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
 	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
 			       remote_pad->index, mbus_cfg);
 	if (ret == -ENOIOCTLCMD)
-		v4l2_err(&priv->sd,
-			 "entity %s does not implement get_mbus_config()\n",
-			 remote_pad->entity->name);
+		/*
+		 * If the upstream sd does not implement get_mbus_config,
+		 * try to parse the link configuration from its fw_node
+		 */
+		ret = csi_parse_upstream_fw_link_config(priv, remote_sd,
+							mbus_cfg);
 
 	return ret;
 }
-- 
2.34.1


