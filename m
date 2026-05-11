Return-Path: <linux-media+bounces-61120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK5QLFHZAWqvlQEAu9opvQ
	(envelope-from <linux-media+bounces-61120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:27:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E3350EE12
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9F493017E42
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 13:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBC83F2110;
	Mon, 11 May 2026 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bzboNfOy"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5403EDAA2;
	Mon, 11 May 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506021; cv=fail; b=hcBUxPVFaQyD7HIMqntDyNH89CzpmGBRE+71RkyEC596i83Lch8Bh302D7xVm7HyGiErTqSSNznOK7WfywFETIIwKb1ji3TYBVtXiwcUcezEZ/mTZ2azk3A6IowqinoDLLbFuMuhhA08SxJlQydS9p2sMmgG/jM0i5kUODzpcAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506021; c=relaxed/simple;
	bh=ZiPinRjRWh74IIMtXxGhvMKulmTEe1M878r5XQiTpfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hBiQNwcxK1ZDmPkYC9HvYeuaYcZlWyDVMQ3vjgFwV5+cUDWGpgyHlHxDQrndIVBPJdYvQfoV7qIelQ0ypIIlh/2WetWxqPMY4x4+FuOailBbOJRm/U2/YFll552AdxhNUMSKTK6MGI6w6uN1gSw9yWpnFBzgdlmFE7dpky50OW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bzboNfOy; arc=fail smtp.client-ip=52.101.84.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMkZaKooyh5QJ/NCZTWIEjeplWPcGkrTera/A61PgfuL61IH728wkkUsyEOHD799dgb5IPm6Z9NhUu4oqJMB+MqttzmoxqrJWdK0O1FzdvlCgaCTDcgimVK9tJKfMjzycgfusuw4uxtAX6tu7jdFZJoarS8kxvENsfxT2bY3UhSsxBMcrzfrTY0Za9dEhglzajPQNn2zFNY/Z2rhd/CB1CH4UbNFLT89RquDeH46VL7IHpkp2P/E3tITowJUAlqSYPXcgjq48syC53b9t9bD1TYjkwke/oZEZv9f62X0hIUw28tg8O/ZlCnp6vo06BwVlWUs+OYLccwyAep/jZqtIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEw0zQINT0Ls6Zd53xpAgKbjmjOp+fGic3T2ycVfz2Q=;
 b=j5HOkmOE1TCixSd+FAS4zH2AViEeZguUMmIBapDp9NaEVnXjAhKlXgPAcQ0NLtzMjTe4KKrwgNOmVLPYT/e4d19H71Mnu5f+ST5hqSZ02yRsCNcJeYmQIDaxBoc8WYHq/ATvkFNCX7btI6+Auiz1QGfoLS/nlEnJnxuox7JaWR9kCDix757IoQyiy7cCGgXMZlNpcSb3femU6RAE9V/qQGUetguLmHoEZMxtP5w2qkH9BVRCKgbI075ITChBnkp3d43W8JvDRhp9g3n+KO+g9xxVmvpXpYGRXO45G0n6hhpkqHr55L0Md7X2+fBhi54OSx8bAc9Ym2C7vDzB6D2WpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEw0zQINT0Ls6Zd53xpAgKbjmjOp+fGic3T2ycVfz2Q=;
 b=bzboNfOyAdvRBim4VVyXApq7Nl8HMAFAKwpDn8Pem+J0yJlFr1ElrXIFj4LiB51pQlGvGd5fKPka4BXMhxRsIHB1R49SUHFeY8jdJfS3yKligsXzkr47RKyFnsMdX5aXpe3vSJv6qtukd9v6hHver8hVVK2Y4rXCYfWBXUYSqHh7GU7zKmGY5ZiDZIttuc7hu0NvleBEggcXnOlECfjPyigNCCqDLGfxthbs52HcwQAgIn8yD1GTR2H7an0CzHTNkzTQUq6/G+DMBgJCdYEsdMEzSJCB+3ijx/XhcAVove6mKnOfUduVo+yQbDkUpNORaUjlX7roX183Gq57RR3w0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AM9PR04MB8131.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ed::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:26:56 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:26:56 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	geert@linux-m68k.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v2 3/8] media: Add meta formats supported by NXP neoisp driver
Date: Mon, 11 May 2026 15:26:23 +0200
Message-ID: <20260511132629.1300868-4-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
References: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc65658-60fd-42a9-2599-08deaf60f8b8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|19092799006|22082099003|56012099003|18002099003|11063799003|921020|38350700014|3023799003;
X-Microsoft-Antispam-Message-Info:
 L45Q9vo0iG8O1TIbPF00+B0IC2aXdFXRBIumjNy8yBI5D4Quxk00kSyk36xo3J+q9Rg8zDGyPMsE1y2p/Sls7buV2v8VWopR4PyHKJto0LfQ4ycCAJWaIrXCkfxEE/9G1fT3oJcW2NBt/9PX9IiF0Ix6SKz2pUZ+jpFxsLIB/bDD4ClM4ZJ4kBR55UNNhIvyAtHmn2D39ZuZnyZTHjvP+elv89H5OHKPRFX7l5gHFuyg5ra8cZoXpgYSXqFmt98VSD8w8U7/cKntU8OPWYh8wlEQtLVoYzrpmSeoaLIVx6e/cCejucBK0B9TJqcIl3A1K0jN4AFG6OLpkENUWUT5i61eGaOM+xHouX70RcMrRz2cb9mvNWevFUL510N1frSsVfwLptqRtXUmBz/EJapNFBCCE4OocRGOdgcYclD5HDVui/pJbMa4yYmu2xd6qHz1pmhFfx8IFAGs+AeN/gLv/V+b4Wis0B5/n/40eWIvNJL7C4qupTqzmiFwE0qHFP4lY1M+ODNhTSJaDB5EIhAC7XCpflgr9mwjaaXd7reNNRBsBNhLxaX35H6HugwRV3HLiH7KBH7iBBvYGWeUsk8b3XQ7iocw1Qjz2aUbErIIeEkmIRPvKHbDI4KtZM0Tau22LlH8c1QJpYVXIuG7hM7hGoeRhIzw8dfaNqy01cmnLNYhnNP6QHuhUjdJn+fbJ+UHfg/qd2Mv0FeephnbO3F7nljSvQZnV9Fk99YEKCZYFClb+oTpoRjNEmhdjABSrWfq6zhAwBq0IgdYPO2eAGd2yg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(19092799006)(22082099003)(56012099003)(18002099003)(11063799003)(921020)(38350700014)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?BDpc2wZ2HxwAY4EPUa1znqUtfudNFiBR8rUrDXFgrGFxX73zaHzctuP/tdGm?=
 =?us-ascii?Q?zL0CTmVPRmNfIaQU8oLgmFy2n5HKk1ry2fxrjthzmzRvZyVCFBeOQ55GhQGh?=
 =?us-ascii?Q?RKWbKONCs+Ufw6zlfTw6zyv8mYF+2aUcn+fpwlOxIWuF/bTL6FMDxeJb+WE3?=
 =?us-ascii?Q?ZTfdBNr+STq3G6Q+ZPConWwngPy9jWALgzdvAnDRM08V/nnCHN/iT0c35Lqu?=
 =?us-ascii?Q?TFKhvePPSm3CGzlwfnrcRl7A4+BpT52aFjuR5HKwtN/29/aVc9vt7c/0pkBu?=
 =?us-ascii?Q?rhjDfaiWXbRNYWt1E7CzDBPtka1Y1hJ6uwvXsgSkqo6QYYBJUMMFHIuZanv7?=
 =?us-ascii?Q?NKOsYizBikHOwvd4e1PlJOtVt6oKcKsw0T3mHX0DQJ1w5NsajHkksir2vUmZ?=
 =?us-ascii?Q?QpJBq+x1OMAcRgZcUPtDcOdfcSb7H/lrV2FkdfTkJ/BYVBXxCLQpm5iXPgyp?=
 =?us-ascii?Q?+EeIkpysG38iQlVRcoh+GZEqeQHC9fhNFFrCZ7go+RzbeqPKw7Zlcgz4kB6A?=
 =?us-ascii?Q?YRVZRPFQqPOUWuWqgqjDILLzHvO+fCN7Njqn4kvPY6V62G1b0Lw5zy8EKdNH?=
 =?us-ascii?Q?xRlbii2688TIeLybG84vjZJ8H70CXgLqdQjf4idBUsGLY5tdRE8nv8EVH4r8?=
 =?us-ascii?Q?WzCHheWcvsulISdO8UJ0ovlEkIR/nMP/JhlXLKsB5SXVpHVZTYReMlUp3vel?=
 =?us-ascii?Q?IGgECIMatQhB+XzyvNrIXGz2VrYlX87GFjQFVpDfdVdK0nMu+bDHZGIFwcZF?=
 =?us-ascii?Q?jcWeBCpr85suNUuzOCJAXfLh21+btEDS0Iqs+feQg2y5xZ1jQMOwsOap7Zqz?=
 =?us-ascii?Q?sZJY1qgqy8gQ/54P0u74ybTod938SIYcLbG6AmjECqvbt+c7qAk+yhK7YHzV?=
 =?us-ascii?Q?w896PByJu+v89RklxVLafXk5WwlJz2B3I+b3OA21uVcNTLWPsfDeQs7+AFY0?=
 =?us-ascii?Q?2aA5MhwsRWtUzoMUzs3v97IXaWJPZOTCupixQxda4g5/RKQm8DrjHeNlfgAl?=
 =?us-ascii?Q?/MO1NWJ51rbuOECuUcovpBVwUzVFkB6Cx530STefiBawxJBVC+YaVPrH4ZIT?=
 =?us-ascii?Q?IazK0PYrwIfTCFnAT6Jz/a7vu0vXJp3GJwBFTlbs2nn3+3oGIy6nrDU/U/OQ?=
 =?us-ascii?Q?qXDptpgJ90fhmViNewwV98DWotViGjYYxx1TYD9vvOa7wlfkcWNcRBPw1y+i?=
 =?us-ascii?Q?KPrbeB8zv0U4m4PSsnFczTKTkWxsCSz/zHj/1h0BuqqwDYERE6mghn0uSHbY?=
 =?us-ascii?Q?WKWxeGUiWspLa+l7G7iv3g153EBRfGexMWJk9F3CMvYgsVv6gYGlIGxReaA5?=
 =?us-ascii?Q?Zm/IOr2HNQrDPD91f76Oxxo/F/VUKMJH7lnX+GyGaZlolusldNDESlMp3OYt?=
 =?us-ascii?Q?FgfTndnN5pQLhkzOhHIXtCW3pIL6Cz2XkDV8lrYJd7QNrof0r4QRy0u7G/ND?=
 =?us-ascii?Q?DkSaTJlMKxwWgbjqEtEFjckLw9eeJphySjGcqG8PnbnEAkAIuL9xNsJCcwH1?=
 =?us-ascii?Q?no2SOFWVzV955I07C6YiafwYO6jOov0LYVfRf1vZzBW1Q9l+7TFoG0MNrhLv?=
 =?us-ascii?Q?1IjhWQbC1R1VUxLXA5iucq6h3YMq+QPhy3j6dU9b4VZ6eKnvKK4XSOVCvtQz?=
 =?us-ascii?Q?V0qGM7oEZWU2N3rpq2W1/XHQfVFaD+3u058BIPwWUqTJm95B8j4t6tpS3KsL?=
 =?us-ascii?Q?PVNognwT5Efh1cSKeoJT/k3rPDr3y/8PdoKXBIwdLmcBWq6SSgPGb5ACTMoh?=
 =?us-ascii?Q?qiLJTnYrSQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc65658-60fd-42a9-2599-08deaf60f8b8
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:26:55.9893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWxWq32Hk5oA0D3Ujn+YMNer1C6dwv2BOTC8Tvk1uPMDDBamGgiICdh4INY6irZVExPjzp34vFjWON8RGOSkyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Rspamd-Queue-Id: 46E3350EE12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61120-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Action: no action

This patch adds new v4l2 meta formats definitions and descriptions used by
neoisp driver for the parameters and statistics buffers:
 - `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` used for the generic v4l2-isp
extensible parameters structure, supporting a non-fixed-size buffer and
changeable ISP configuration blocks.
 - `V4L2_META_FMT_NEO_ISP_EXT_STATS` used for the generic v4l2-isp
extensible statistics structure, supporting a non-fixed-size buffer
and changeable ISP statistics blocks.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2b650f4ec3c..acc60dc69d31 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_NEO_ISP_EXT_PARAMS:	descr = "NXP Neo ISP ext 3A Parameters"; break;
+	case V4L2_META_FMT_NEO_ISP_EXT_STATS:	descr = "NXP Neo ISP ext 3A Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc..e1656520b312 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -889,6 +889,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for NXP NEOISP sub-system */
+#define V4L2_META_FMT_NEO_ISP_EXT_PARAMS	v4l2_fourcc('N', 'N', 'E', 'P') /* NXP NEOISP Extensible Parameters */
+#define V4L2_META_FMT_NEO_ISP_EXT_STATS		v4l2_fourcc('N', 'N', 'E', 'S') /* NXP NEOISP Extensible Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.51.0


