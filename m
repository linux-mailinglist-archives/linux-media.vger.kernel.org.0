Return-Path: <linux-media+bounces-37598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D26B0393C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 10:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9138A189F853
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 08:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785F523BF9F;
	Mon, 14 Jul 2025 08:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="wtyK4GGG"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010031.outbound.protection.outlook.com [52.101.84.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160A823B613;
	Mon, 14 Jul 2025 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481204; cv=fail; b=mCiR1SUcWhU5C4Ix+a+tVEDL/Az0jp68wxMjmjPVpe8TkcnXGwFvxF/9hWDO2NuVPick2z8OuhV6X1NjLATz1l4EoMtUdJnyE1k0ad3U8UHfhS3IaxztUflufCtAeHnZJytDQsnxzFoThNe5puZKBb6YvOwH6dPHVW2GCite/Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481204; c=relaxed/simple;
	bh=wPoIkd+hOeRwY+SmjUg+qV5+VE/n76/WQjJuy+uLtNc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=scnPic3CZ+G0EnD8nLbh3eqO10PpTRCBFLOtMpAZgVSHOUU5QspqvZ0Gjdl2tOQZ+ryn35fPQjpev4X1IMhkJvKw0bWoHxOIAA3ooOicgE8bL5PU46bNuUu/I9qunY0hkfgsh3JYqkMhxgmDSd2MMYWq7/fkkk8x3lX0KRpWTqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=wtyK4GGG; arc=fail smtp.client-ip=52.101.84.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VP0VVkfDiVQb8I9UVLZxAz+rrYD3a3BuIkUM6Dxfn+oCdAwws5aTMk3OhG3kmrkbc8z+rIY+d605hH7xRX/PHLXRoYbwwlcTg48OUBVtQX9fYxT6YTwzqoN91sx/5hpDzK2O11WSKtaIwvNJr/QHBAjOViQYJ3NSwiCpR05a0EHrXennV6iPjWrkKwJlFeVms1mCUI7xiWv779AssKksGROPCL0XUcF92tsQd3WOv2dxm06JCQIQ6lYsrF7fRBtdxDwDNsy0claOvipHA6+mn8p8kQEMaFqnTUsI41mCLA7DKCygdP9MJDP5BQhbd7WnzqfJEMI/KnUqTqKyI6Zx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pS3oJCl+ysthpiwoxmB4fqi6bC8wJg7i5qOPIUWPd0=;
 b=lJU61/AG6UjgS9c2kw4StKKK47bH5FC9RcdjVTW6p5qA9vXf/pO5D08dpgik0UQYDv61ARqmtf7k6biwrMfIsW/P9Wb7c4wTRpPTUHhAYRXZ1D/6gXTHBW2BS7UFem+GM9tOOvOeLFy6Bc8/D652K0k7GttlmJpjUX4AjX/GUKU1exjH4cvas/PZBQG2HuqOKZrAcXKWitRF0wuM2L5z5vt/BRSr+Ynd06M12/GjrE/X6/4vHYDSYoJUAvIpyYCbPatl5Vgpk3vfNnIv5/IClonkCDIXDP3y+doRbzfytOAixyz//gX3UuQ8apXYuOWBA8II/VA3pWbVYB9RJR+NvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pS3oJCl+ysthpiwoxmB4fqi6bC8wJg7i5qOPIUWPd0=;
 b=wtyK4GGG09hvtt9E56dpwbJl5Jf6c6bzLupp9IXZ/XfGJha86WMp80PPKpLeCSO+pHFzmpVvROw4LhfJvVc/cvc+eEGgCv+VkUxMbTY/t+tlT/YvWHBhZCulwhvJSZPVIzQYqOKHKR3WBX5+v5uX/dcJgx2U4u9/jDbHIxydhVq+QOt6uZO4bD0vD7b8qmRdDOVv7ddy6fNLwnV8I0dI8kifXgfodiMhLwi+TFclmxuT5eiz5JHLEhYywYOJTsFmWvbfEImjltH/5CfwDZUULZMuQcmCu0VSs6hNmTy0Kiu6vXe0JaKvkoBOWM7zxuWTvlyTUr20OI1vNdSWLnVu/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com (2603:10a6:10:2cc::22)
 by DB8PR03MB6250.eurprd03.prod.outlook.com (2603:10a6:10:136::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 08:19:59 +0000
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54]) by DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54%3]) with mapi id 15.20.8922.023; Mon, 14 Jul 2025
 08:19:59 +0000
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
Subject: [PATCH v5 RESEND 0/1] media: imx: csi: Parse link configuration from fw_node
Date: Mon, 14 Jul 2025 10:19:12 +0200
Message-Id: <20250714081913.516481-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0009.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::19) To DB9PR03MB7755.eurprd03.prod.outlook.com
 (2603:10a6:10:2cc::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB7755:EE_|DB8PR03MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 68364f6e-f309-4d97-28db-08ddc2af3911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pWp/NViEQAodDIZjZ18txDkLjm0zMqlP9YoPmU4eAhXLoYEci+RBQt+ttgHx?=
 =?us-ascii?Q?TKaODhGCswA301oXo+MPH9v68FQeckKFd48WCd1Rbzm1RPv19mFuigGCJD8Y?=
 =?us-ascii?Q?vS5vMx3FKlYQauAIN3iDcbCRfiSk+rzlrAuMdoMxxwTP4OCEd4VlSGZK0Xlh?=
 =?us-ascii?Q?v0z5LufdC/Uw8pkeavb79fnEtJTIdwerRVTT0LMR4aQFV/3JuxhHeXWn/X+B?=
 =?us-ascii?Q?MjXXYl3lJL5/j9jwPlGnxCl1ytDkCt9p+eMyCfeiXO++wxSknZM8FHdTPLik?=
 =?us-ascii?Q?3CJhuZ3MwZ95lfo78TWLa7lq3H1ko4Bm7DO6t8GBfNaFbzIjIbEGV/tNQ8Ka?=
 =?us-ascii?Q?Iy1Ig2+hPKUpmYv19QLqeu6x23QSjORaYwbD9DvQb/XZ7MTZ+YZ7/ngJAgso?=
 =?us-ascii?Q?CJnGuuIXZYEuM0mlByX0ZkYFcLBEMJ2LUusdxMdj3X0o9qmr4ZKg23b3AIqt?=
 =?us-ascii?Q?rhC6+V+7JZK+mocGxsKxvgHdYtaB2GTZl/FscDjRBiD+1vQJcd+SUItbehDG?=
 =?us-ascii?Q?HKrbfE1L36gEky5r9ttNknruNTm/PdUWnrOyKLC8y4QH3xjxBLxxwIBeBL1N?=
 =?us-ascii?Q?M0n44LhRyhql0rIqd+XlXZbipw0p/yfQ7av/LQ4xqTTUyw1lKDgyItja43xx?=
 =?us-ascii?Q?4h73FsvlAH61zvp1IglqcV2mSWeLUh7q3HW7GJrryXmwz5tyw8ZfN0Fgw9Pg?=
 =?us-ascii?Q?MGqYyAcVrnu+RFjPIYXbkN5K65nJGUXn9XFtzFMZTsAohBoLTXxi0mXj/bte?=
 =?us-ascii?Q?3HPDNyCo0ixrXa7433ajgE8EIxrgMwx1QL4vuDBq96fbReNjqkWkde0gflOg?=
 =?us-ascii?Q?wQyM59apK6vb2jILgw1dtfvxtNsTZkvHHwZyY4tBVp270cmrY/v+ptp9xSSP?=
 =?us-ascii?Q?/2D2hcHLZY3/t6moElOuettd/e3TTHg9AuLxDnHmUX/NAG9mb0q1AvsGp0iB?=
 =?us-ascii?Q?SwJmxYQND6d4CzKqQ6FzxU3cOYDZS4gk1K0PYZU8LStHwv9TJgxA33NxfmZ+?=
 =?us-ascii?Q?pR6C0uugHGcHgjvzJ5NBOHcRMxzXjiIeM4x+V5OHH7JuU4Eujx9Kjwxzrh0s?=
 =?us-ascii?Q?lE9aoDmMu4u3q8TIFbhYdR2mnn0+/95/QNHgThBp6SW0/t84YSq6nyu6Tuvk?=
 =?us-ascii?Q?LvEDKIunjq/Rf4GCwFuijdHAzbU56PtnZP5FCfnLdKJIKTBioIPR4ZJOJhcO?=
 =?us-ascii?Q?oIZP9HqTiDBivyqqIro61rr7STLea++50btd3DuQWmXv6s9rBsW8P4c0evJq?=
 =?us-ascii?Q?af5fcgVSfIbZ3sU8aop1bQK/KQoGT2rx/ertH0PANK+ksL6AOER7/DK2aFga?=
 =?us-ascii?Q?iUwZCPb5FbzXpevagWtcjMSxL8RVT2W7f7ldO4rpMYwWk3tr4JeyROiu/6KG?=
 =?us-ascii?Q?FAI2Jxlz189qVOfwj8n7B5KPlgamJRtdC5jW03iD3Yha/p1ukTH4+oyjYAqQ?=
 =?us-ascii?Q?ZCiX+OCdHj2KjLrJLNgiWBOLNX2ufszGS+SaeP+AbTUaHvmo4GQZBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB7755.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6t31iorciMZUOo5jUmrx+z7X52V5rAfcQdzlPebgiZpn44I60FCaI16XGknP?=
 =?us-ascii?Q?PyCGeXbyHVgEE+gj8SLA9983md7W76BB1n1/kf3MWSyliACGgu8lOSkjuqRt?=
 =?us-ascii?Q?apkhzCpRXK/LDt45xtTKszQWPYq7mOJlbuU3eNoyF+A8ohHGvsA+r3nTXqmD?=
 =?us-ascii?Q?1lht1uqVk/q0le9bhvQZK1IwCuN1hxtS4hPx2GBkNRwiBBSTOiYOTgweAURI?=
 =?us-ascii?Q?2KvRpHG55dR4gR+cVnGuCcdxUSAr7BUFn5U40eetq3u3ysAl6edrJj7ZM0cP?=
 =?us-ascii?Q?8KtsLB1sVi2qEggRcDR77CFoBKfOiNLFPoCVcPdfkPkW0YTq772CaXXMXTRP?=
 =?us-ascii?Q?t2TiAOFvfwFAxmD96YqGr0qRQUIY5s1Iyjl8NMaIYTU4UsTfyutxMw448Mtg?=
 =?us-ascii?Q?+dndAECbcr7vx6Hi5dVUPm52bp1qMXKGNZRH4JUq/u21QRCyD/rznj8y3hTP?=
 =?us-ascii?Q?hXg/ZRxVaWYsFzL7l9F/SB+b0VQEC4NSs6X+CJBxYxZ/nQ4zmVMgfufG9Iq7?=
 =?us-ascii?Q?eHLNGnwzAtowj7XLbfdQ7MEJaRULVOY642Y/DrIb8APsGocu3lisexMW+yKX?=
 =?us-ascii?Q?UTYnq3t9UL5VZ5vmNH6kLYw07NOS9koh5kLZphc19zGGjiea721siqMMGCs6?=
 =?us-ascii?Q?s8V0N2aNRljf/XNu2M8iOHM14MXNAenQLm6u+QeS+VDig7nC5wr69DViwJuB?=
 =?us-ascii?Q?lO0asqNEAnSL2sCnR51WrtxVSgak8YlPIHxh1pznn5xUcF3puzqtB9QRzAsI?=
 =?us-ascii?Q?Ap1oDQMrg1v5eTic7NNtve99E58nkfI9SkiyBDIhWMBCXzgSpay/Ei9PWV3T?=
 =?us-ascii?Q?xKPGfigKWhYfJChcSaAmbk7113SI8Y0oirsWzfSTXhK7cdv/zy1wVEcnKn+w?=
 =?us-ascii?Q?gYGmSUnSDSXVQCyorrx1CimcXRGKOsCB98jzfR4NCMjTFy/XwwIzZsgpMrgV?=
 =?us-ascii?Q?IaWrqb8/lBsdkeOm19pypqKNaxIgXR+HKDuOFZS1MqcZ7xgjw6TK+SVQwzIl?=
 =?us-ascii?Q?0JtmhbehoulERLEOZNahRESnA439Hd7kJyg5aqg+iE7QnDt19L+gm13qlvPt?=
 =?us-ascii?Q?hJZhI8dbytZf94hhQ0wSXG8SKfzcaGgRgW8h/yM8bDlbmFiQwGF7dfh69Tsg?=
 =?us-ascii?Q?9uHlftnJwepKJ4Osh2k3QsaaKLfM2b9XEKh3ThFAY4i5XJKr+J0aOhT+DUct?=
 =?us-ascii?Q?AlUE0Ast/uAEQfp7lauGNwnt/MyqKqrZZs8otaIJcFan7F44TKXiekp/+MsK?=
 =?us-ascii?Q?FRAmRf4w7UQJQVlRfvHCgAv0pJFg9HayNGZmm3/tD/76lQFBc+PMMc5qk2Dh?=
 =?us-ascii?Q?KGON5PuYds38RjEkaal4HbimYGxutAZgvxhTwwDY8RVITzFKA25Ex+AiDRJ+?=
 =?us-ascii?Q?YaCE6frkEmrzJDpo2DP0bno9xcj0FE/ibIMfr5nyXipGm+oh6l/+V+4Da2cN?=
 =?us-ascii?Q?ojx9lkrjv9dA/V1ZAYSuVU68TlwkDbMCAKLsKnEcIvE2Z8srZHR5Xs9q4aET?=
 =?us-ascii?Q?n4iwHnDdEASPbdGCzDTfZcSV0nkAi+fqzyavQJD1sIB2QX3k4P8kiWP7fold?=
 =?us-ascii?Q?ak53VJZVGU5DYEVRG6CGXgtwxCcg+ua/WSYd/W4H?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68364f6e-f309-4d97-28db-08ddc2af3911
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7755.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 08:19:59.0814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kqc3/nwRQLjeOstByccY3oTSAymU/ugmpZiYIfej0T3BlIhgvVRWn/nGBKiKJeAFD1P3A2CCDvtu96o/nptcRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6250

Hi,

this patch fixes the imx-media-csi driver to work with camera drivers that
do not implement the subdev-pad-operation "get_mbus_format".

It's the follow up of this discussion:
https://lore.kernel.org/linux-media/Z8AoA6WjbXQufqR6@kekkonen.localdomain/

Changelog:
v3 -> v4:
- Determine the expected mbus_type based on the link topology. If the
  parallel port is used, try to parse the endpoint as V4L2_MBUS_PARALLEL
  and as V4L2_MBUS_BT656.

v2 -> v3:
- Factor out the function "csi_parse_upstream_fw_link_config" for better
  readability.

v1 -> v2:
- No changes (I submitted the wrong patch. I'm sorry for that)

Link to v1 discussion:
https://lore.kernel.org/linux-media/20250305113802.897087-1-mathis.foerst@mt.com/

I tested the changes successfully on an i.MX6DL with an MT9M114 and an
MT9V032 camera. They both use the parallel camera interface.
Sadly, I don't have the hardware to test with a MIPI CSI-2 camera.

Best regards,
Mathis Foerst


Mathis Foerst (1):
  media: imx: csi: Parse link configuration from fw_node

 drivers/staging/media/imx/imx-media-csi.c | 62 +++++++++++++++++++++--
 1 file changed, 58 insertions(+), 4 deletions(-)


base-commit: a8598c7de1bcd94461ca54c972efa9b4ea501fb9
-- 
2.34.1


