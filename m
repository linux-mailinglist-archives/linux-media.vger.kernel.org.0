Return-Path: <linux-media+bounces-27581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D9CA4FB96
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AFE23AB4CD
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633E020967B;
	Wed,  5 Mar 2025 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="FILwfEAA"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9201FC7FE;
	Wed,  5 Mar 2025 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169759; cv=fail; b=DThd7f9/n85w8uFnElrp8U0O9xwgve9l9XglWQARGW9SUJpg6nel8+qsteNvqmSH+drqEEJi5bWJIV8wQtSzZ9OKgjSHqPH3ObT2/b/HJ02SueVf6tVzJiCMRrZW8uuuHvpGedd8ki2O9Y4v5vokJ72fKeLCVuMQFrWNRpyc7b4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169759; c=relaxed/simple;
	bh=pVMNGUV1PB/mobzQMPLtPz/ep7urQ9B8qlXQsWqrHRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X6eUy18TPzNhseqp82O46rzN/qGBH9VmaixKX+n2ZKzc9aS0DDYLyimB9sUvsduK55Ee+xK2FIOvGY8GJOGikPEF/XUHGQlcCszvnYYEv8L1JSsAK8wTmlwe051TQgyu0DOF2y1FZRKYV/U6J9bsW1YjgXNOeTxr7QgaUvwFMnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=FILwfEAA; arc=fail smtp.client-ip=40.107.22.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLncD6a7OOWd5BAnpgFcbbp2mR0fDbslLNksK+m94n1V00WcVdDNxS9mOJu50BzlI3yAFDe13LlsMqShDriwl7s0DaIZFmasNfXdDlLXIaUtucSZZqM9FejPQMkYwRcAbOw2pIosckXCdvwSXr5GFzfOTv6/97ThiQC8ZObVNeGZT3oqc9qDz/4F+PTA4vl4s4KNXLckkwXdF0tQQ7I8rabCmP2A+To1QXOZSDHMEFC8DXPk5pQ92L1wQUmehpKa7s4zA3aWm82DMqddwy44tUgZAX4ct2cng7SggReQLPGRvZkjy+K4K/XNgtYVc/xAZq18WwkUhogEljIfTbb94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jxq85QUHaK1HU0Nbdgh9OedAClT/R2aPCyYfhzt6uiI=;
 b=byzIEyiBGkIx4c8Az34u4+JQFe4giM/GS4zMKaLy/NO8q1vDjrJ03D+RIdJEtpM/ZHs8Tyya27kmBjTqfJ3xFf7Fsw7LbQVjcEhkmHcqEuaF7yk572iXBJ/cyHfDKekiPx5m6wA0WyaRw4YH0x7YRRNVfvpX961mdzCSAAeumteI8JFDOktKoGwemc9nFUHNBnjoLLsDWQ/5tJslffpgSUbsiIzGl/rmMTGjWj0GvXAJyF7oy4WXc365ospcM3TPHkWze5tppd3OwKTnoZXlrcmYgCUpRchVvq6B8IMtiVdJ6PNlxv84fdfwaORWZ5uOst83/CXq5Mb2GwVkAkUUIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jxq85QUHaK1HU0Nbdgh9OedAClT/R2aPCyYfhzt6uiI=;
 b=FILwfEAAvdvteo7hxWM+EUgI1p/dwMvd9U67Pt+OyTvnQT3iRjVD66f8Dm0uspLgV87qvAza6cZlT57sbEDAdKZ5llvqYTAD1zcY9EUGMXp8VQGZCDhGH1dbHBOGvJfGhBr7iP2xv8Rhu+3f05wCukpk3eWk8j14GKYA05gi1gzNypq3SL2O4Ru3XnuDDjePIFoKTir2Ow8/NuXE8lKx354wuUYUSVgDbh6RGvXPd95Pg4KPezCoc0zeQQMz+eRjgJVXatMmiAss3hPBllT40sx0FC+AjqSRM5nkV62qMau3NgTZFKV5ROaWrPoIZI6h4bPrnwgMfsxWbXn/6Wr9xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AM9PR03MB7266.eurprd03.prod.outlook.com (2603:10a6:20b:261::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 10:15:54 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:15:54 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v3 4/6] media: mt9m114: Allow set_selection while streaming
Date: Wed,  5 Mar 2025 11:14:51 +0100
Message-Id: <20250305101453.708270-5-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305101453.708270-1-mathis.foerst@mt.com>
References: <20250305101453.708270-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0035.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::20) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AM9PR03MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d99bcb4-4181-46f3-bf76-08dd5bceb6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TxI8sYCsU3dC9N2I+FsmlhxtO/OmqXS0uUOyZ8gteNAdj/0ohc+Pw1wZ+FQo?=
 =?us-ascii?Q?7vzVnCjlTVMtOgpV5/AYYWXQPpPn385YMm3l6Otrb7o5Rl4ah4h5kikbmVUY?=
 =?us-ascii?Q?2EDg7FE1e0EH2DSLQcxA60XXW1SaItZiqyi1uIuIIT3tec2C3UYgQAfBFIeb?=
 =?us-ascii?Q?Jo8YhY7TgZ6KWvI279fFuJ4eTXNMKGekCbesHRy6Om/FpuRDFv8y9PU3OSSJ?=
 =?us-ascii?Q?2M6IkdwkKvWnehoo6QvPbGX7O35nMC/TXOPLxpJTyMN7pHJC6arsNaAhhxmG?=
 =?us-ascii?Q?oe5vvOBizFse+nYtlsZW2omgeJrj5UshsLFEBacsmEgzy4ppf/hMML3jaZGt?=
 =?us-ascii?Q?7aj1JgceoBOTDYpWmjy0Vq1tjRHHRyQcVkepFfUfdKbab2f238QUfOFSft8X?=
 =?us-ascii?Q?exvoHgzS4nMn7iiaiy+bbY6dKCBNYxYn7uoQOWE0SMf+08ewIf44Q3z/J38E?=
 =?us-ascii?Q?sDL4VsITLOj11woSsaq0Ylp5w8FEJkMgUc8FJQeqBXWEtJ9c96yyT7LG4yfx?=
 =?us-ascii?Q?0SY5w57hJDS7c0aZbjq0L6ESy+JQWzNUuNxo3k9Y6NDhciLhhac0bFO5/dc3?=
 =?us-ascii?Q?9HegtbKGSxDU2Gsgyc+7Dhkfh5QMAoISM2QbgMgK64K4G8NR7ZKRIgRex5ZM?=
 =?us-ascii?Q?Zu5H6DjCtZ+OYD2N22tsyzHfuFSJ6PDfeJqQ7C0wbvi/GdoICS3UAjU66DO9?=
 =?us-ascii?Q?yi6nDr6mlj2AXtHgI/JZizgKWbfuwUGvzhAp/CvDt5yzGV234MySDFjxw1P/?=
 =?us-ascii?Q?DgQsvfI1nncEUWkfob9nnB3AmIbvOny24i5BNd9Zf8qLneQGCwrqlgLkv/JI?=
 =?us-ascii?Q?8GTRP1n6pm50zWBZbmLmLOtC89ZO/OX+VCJoYcd87cCc2TUOQp+9r4XDEKlc?=
 =?us-ascii?Q?NNaCrbucjQwDa5g/jLlobPSq4OEe0+kIFzG7ht2MQm/sWgoYRONQf8YSNon8?=
 =?us-ascii?Q?7mCOM/dnC4vmaGKIpCSd47zIPgw5SqlPQ7ZqItKXL7ljZ6UaVLxUc5XmPCWb?=
 =?us-ascii?Q?KZ8k3/3EqSI6BdVMT3t05WmuFTcP6xYVcvPYlia8gmSdew02HR3ZAYrBH6+Z?=
 =?us-ascii?Q?svv5aOKuyQmqfd4RJj2fVka45C4PPWGtlcXfsDJu+py4PK1VUe6pe0kJE6yY?=
 =?us-ascii?Q?aYZedIN/qHtJfGUxM8Vao/O8oWLej9TpbALMYWMXWvCmzsc0L43KO1MxAzcQ?=
 =?us-ascii?Q?hXLOfUmtX2oMxa9YEz3x2h0WNOekMLkAHH/g+Z7/UwMRzXRXMJrEpFzc0fnr?=
 =?us-ascii?Q?tjr/FWKm9i7wFtF4XGBO8hYEPjRkP5fbuHo4GRZFLXTQfkKm6YKhpbA40CY6?=
 =?us-ascii?Q?TENtBW2Qo0ypfJfyHXIYXuh8XAWLV9CEHLxbSHXHypqSz7SjUrpcn5MghnZ6?=
 =?us-ascii?Q?vLHyGk9aSu40SF0bDNOnMLAr/g1eizCU0vFdfJfqVH7U289AIRd3HPsw27CL?=
 =?us-ascii?Q?znpLkDKJKxCHBWAcyMbYti7ItOAyPiav?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KHZM7u79FQz3DbV5ZdWsHWNE/aanR1LFGjDJvUBwsiqlbK2J4oXBb1NMgOQ+?=
 =?us-ascii?Q?w5VHCrLs63zBDxNf0BFNOVrC3RkTm8v73c1klZdH7wHEHPlPxQRDO/xzrkw1?=
 =?us-ascii?Q?3FNiVGjzBNp53dikL3DmxsIXlc+apAmCR3+PPVDBRxSN3wwMHhgthgcUkwV8?=
 =?us-ascii?Q?YPlwWmQDHhK7jJp3dBr+RUm3pWCKvsKV1oho6MqlvV6NWabxBSbh8NXTJTIj?=
 =?us-ascii?Q?9gUysrc4cAF3Spxfaqr4Sum+/mTMtzEP7Wn7Fbvp7FjgzpAmVKjwj99Ise1v?=
 =?us-ascii?Q?u2mWAIFi/Bq0hnwinhDYFBkDYJTBlM103fTgNHoaJL/TRTai9a5n5EAGL6/t?=
 =?us-ascii?Q?LJt+l/WA7ZJrfjbgkeAzvL66Bzgl2OHkzS2lugarlfMMTQGcPAVbu1dTx+/5?=
 =?us-ascii?Q?YJrK6/8lH121MR0T/HJq9H7tdMRkDLcMBKSOdPr/DeTSAz7463oHsRN4Mn7a?=
 =?us-ascii?Q?Z/m+6tGmN7k5iLHlFhibSj2y8NksM1nJZzF036XjnxwhW6YLwGiogk7WKIPB?=
 =?us-ascii?Q?PVx5eG7rp+w1bs1kzzTESu8w2PcC8Le1p9IZ1FKaJe1/qpQqc9JkoEDb5ZfQ?=
 =?us-ascii?Q?QwiqVLyHIth2nuaV2fG5JFmYBcGMMNvp94DuuzbmJlritJ+VKCsEo5hvGCWe?=
 =?us-ascii?Q?vp2U2uhWqtmgzB9t2gKXTf+B6xiA/1Gv9DEMVkYDi7ewoboGPiasA5aqOFV/?=
 =?us-ascii?Q?LFlhwpMdF83cXhKX92CYuakzG0rYWuI/4ArP2cq0nPzJa7YTG4TPtlMtoJls?=
 =?us-ascii?Q?T0gUttjKiDR/5nIRHNVtazcwBwJt/9Qgnhte1+w4GTS1jTcY+kuCitYlD7F0?=
 =?us-ascii?Q?y4bghZHu6IzI56hEucX9Hl/LP130BDGjZLb6LuLbozrhK3PcRwrRvWU0HnBH?=
 =?us-ascii?Q?THWrr3Fw1Zz/xomm038G6G75r8Y260HXN6xmiO2pNiOtxaQKKtW0Nwgv1IxB?=
 =?us-ascii?Q?yV3nTPK0DvFT+67n7XyStEs1I+0NYi0yJq39WsGkg4NmQV9HLcOA8KULUHS4?=
 =?us-ascii?Q?XGf8tQr6ZTDcKO8rQAotKH1c0vB3GIBGLKk/xwKC5LgH5gdNDIOYs8/mh9SL?=
 =?us-ascii?Q?uO5tfZqy7aqhEKkemYZ4lliHLXzFFiCPYjWQAHZbwl120COF4Mw9T8YpwIal?=
 =?us-ascii?Q?5FNWpkEMyqJg3h8ycQEGtTtCXLJoqo7V5Tod1ndXhLe49qZVAlcBeWKvRaOA?=
 =?us-ascii?Q?yfB4jPMaWw8XqxXqZ6/UwLGq5w47PU59UGeRA/qdn5V6gB7fDLxbQSNKY2bk?=
 =?us-ascii?Q?swJcj+3OMwJ4PZxN8EAGkoazJW46HB65Kf9VgZps2oO9Jkim+MfhMkbwDhDy?=
 =?us-ascii?Q?2pnFwTT+F/OGZGQ9LI7IupNcwpR4ZxESG3Pe0LjhVNQlBOG5p3uz0IxPjDy9?=
 =?us-ascii?Q?AxiC8InOUv7dnCYIgRgkk0ccz0EW336f447avQEtoBIiZH78InaNtAaYxENh?=
 =?us-ascii?Q?GdxjuofmS5QRoU74+ZpSFbSBeta5TGe39Xgv2PGbxy4MsFYsPHqo4zPSdnVy?=
 =?us-ascii?Q?VvSNdxe4qLfroQbAuXvl0b50b9e0slwHVT4CiNV34hMdH4//RyPaGb1B/jlB?=
 =?us-ascii?Q?VQO79XkN6nLfm7zjLksl9XTsR2j2XYTp5eI70B7k?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d99bcb4-4181-46f3-bf76-08dd5bceb6ac
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:15:54.4281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vp/tyw9IpOzpZO9RVbilfuRWi0IiZ2MheqONUIC30z8BSq/yx/1bju9z/hpW1J8JpuZkxCKHaPXh7SHm2Cr1dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7266

The current implementation does not apply changes to the crop-
configuration of the sensor immediately if the sensor is in
streaming state. The user has to stop and restart the stream for
the changes to be applied.
The same holds for changes to the V4L2 controls HFLIP & VFLIP.
This can be undesirable e.g. in a calibration usecase where the user
wants to see the impact of his changes in a live video stream.

Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
in streaming state and issue a CONFIG_CHANGE to apply the changes
immediately.
Issue a CONFIG_CHANGE when the V4L2 controls HFLIP or VFLIP are set if the
sensor is in streaming state to apply the change immediately.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 9a49dab65180..65b9124e464f 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1098,6 +1098,13 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_update_bits(sensor->regmap,
 				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 				      mask, ctrl->val ? mask : 0, NULL);
+		if (ret)
+			return ret;
+		if (sensor->streaming) {
+			// Changing the flip config while streaming requires a CONFIG_CHANGE
+			ret = mt9m114_set_state(sensor,
+						MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+		}
 		break;
 
 	case V4L2_CID_VFLIP:
@@ -1105,6 +1112,13 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_update_bits(sensor->regmap,
 				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 				      mask, ctrl->val ? mask : 0, NULL);
+		if (ret)
+			return ret;
+		if (sensor->streaming) {
+			// Changing the flip config while streaming requires a CONFIG_CHANGE
+			ret = mt9m114_set_state(sensor,
+						MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+		}
 		break;
 
 	default:
@@ -1286,6 +1300,7 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	struct mt9m114 *sensor = pa_to_mt9m114(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
+	int ret = 0;
 
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
@@ -1316,10 +1331,21 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	format->width = crop->width;
 	format->height = crop->height;
 
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		mt9m114_pa_ctrl_update_blanking(sensor, format);
+	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return ret;
 
-	return 0;
+	mt9m114_pa_ctrl_update_blanking(sensor, format);
+
+	/* Apply values immediately if streaming */
+	if (sensor->streaming) {
+		ret = mt9m114_configure_pa(sensor, state);
+		if (ret)
+			return ret;
+		// Changing the cropping config requires a CONFIG_CHANGE
+		ret = mt9m114_set_state(sensor,	MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+	}
+
+	return ret;
 }
 
 static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {
-- 
2.34.1


