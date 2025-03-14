Return-Path: <linux-media+bounces-28235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210EA6146B
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1951B629BC
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD9220298F;
	Fri, 14 Mar 2025 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Jwkwgpg5"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867A1201032;
	Fri, 14 Mar 2025 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964488; cv=fail; b=L70+DXaVY4N0earSnJq6CmJjNkbzo07yoD653nqXCOVC5F8Q3Sizh/P8I0mwRh2dxAc1IhzjSrrpsX39kLf3lO68/+DA2RpNym7rWcwmGc5agl6a9S6Qg5aGNqZoyrqGYYuLw1J+x7GN+4P/lqQkWwPtflRA+1rm81BI42SPdhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964488; c=relaxed/simple;
	bh=UccYv181rPRuMNF8hdHWfcq985C1VbRIb6ce+3AG2cY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T6eLkMz2DFG0FohPIRc624R6l9269pqv/vATJh3K2z/EOYJhFvtwRcrk8Z5ymYgWISJVAusqWHdvJp/LUaOu+2AC8FSWhnpHGjank/5+G/4VZybn2pY1Qi5Jqm15G3IMHfknXmFEuVi+ujtpjM3I1rl747+CjBWVXKvhNrKkFRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Jwkwgpg5; arc=fail smtp.client-ip=40.107.21.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i94xId+FOgM6DgaQu61l8OzmRM6CDyx0Xb1S0gvxv7RgDdwWK5ZIKwOxbw/vrAdY7xPSfgLeBHC7HL9ltlmRF5NG7XR2u0pHh6ITmQKBWATeZyCiIkTF9TJymvpoitlKU0OOXK2y6GINqChyRSoTEQ39fsAI/mdZjGYxJIzkEedHq//1Y676AK1eGtXNCD0ytBBf8YjSrwEdYJ5HFCcKE9P5aSifhOyYHCKBFIcwW2CHso/sMWzg8pY2v4u+skqDkFztqKM97uYVF29E//qqloylqDJAhgpjrYtUrWxxolNDowvXjcQMRwvQ989t7S1UxnFEJZyADr7jRBINfbWM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cb+SEARfgQdeMn/vWlDMXAky7UAEXJ4n63Gtew6G/cQ=;
 b=OZ3CWLbA5v1XorriJbDw4sU1+Mz7tUJCGF2cBujWtsb5wK7EHwxv3G7HnwbHf+qTDLwpGQ51MscRJW8rNpHjYV/jD5nD4bJnMCYX/Hiq70IpMwTO9fwju1+UWTGmDHsPBZ+VWGGqJiAhOSKSxohIvkwweEAMjZF4p/rnSlZTc48MeoZQ9W3tR5/T7imFd5pz8zmNYcB9Vzio9NV4gNiAWyoAdTQCvvPXR0/Ptk8vxkDJylaWBjQR76WQWxK3Cb8u8+eyKaf3VIdbJ80jkqofW7IMuxVDyUo+ZjNCLZZdwEbITTYMA0gFs24d2mkC5WC4RYwQPSE2g/hKqUY9d0khnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cb+SEARfgQdeMn/vWlDMXAky7UAEXJ4n63Gtew6G/cQ=;
 b=Jwkwgpg5h3H0jd7taQm3TmBcy2aEf4CsSkZNAHXpwYd0o0s44NLbZrhvPaWtBD7V3zPMKhD4tCQjfCd/EWFPnyNv+JEaLeSrU7x89fjD7n1nU8Zo1eZ8Zm5Dpbl640JQMhiZlEss3Enj4fvPvdb8+7vyjs4L4PtNjVvsQoZLjW422gNiulbVQ5r11Kh++ouveHgVB9i+5VPr0xPCrjMg3hdOUFxPmF0WxVhqCFldcQv/xX83q5viJ8n23UjhIBVBgwKtDm0gp8c6xo/bZWrgUh1xF8S6IGBLD5R6N4DZ3ZwSfrs0mUliIW8dncAzAdZbni8/BqDOHkKu0cFeTR3eKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by DU0PR03MB8292.eurprd03.prod.outlook.com (2603:10a6:10:320::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 15:01:20 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 15:01:20 +0000
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
Subject: [PATCH v3 1/1] media: imx: csi: Parse link configuration from fw_node
Date: Fri, 14 Mar 2025 16:01:08 +0100
Message-Id: <20250314150108.254535-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314150108.254535-1-mathis.foerst@mt.com>
References: <20250314150108.254535-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0217.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::15) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DU0PR03MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: e0efcc1f-760f-4d37-f8b3-08dd6309147a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MU/7iPF5W92U3pj2mbyQiIMaDpEebAXMBDgQYFI2hNVVqGKmxfk9ZywpC8aB?=
 =?us-ascii?Q?KIl42NnSDueCfhX4CZ7Rs072u0+R74AOnY794ywINPI/+bvfrZUXzy31/Uv5?=
 =?us-ascii?Q?qvbSsfci5BNzfWU6AitfwaXb7YhaUtE+1DTySVHAyhRHl30CitQxW6INHv4O?=
 =?us-ascii?Q?jqM0jjftaqQVdEluX0VlCDA9Drg2Rw9k0GwDe+t6EJdQ0kdMPF9oBCpkj2XH?=
 =?us-ascii?Q?Zr9QVTNH9d/wr0sYQ+Y3WQIXhihS065U4QrBJ7V7vu5wbesbBV6tWbZmdVNx?=
 =?us-ascii?Q?A+PLdU71/HLpc+D8doZTCVoDcRxoDXVYMJo4wx/SOuk2KS5wN9Pwx5JCQHF5?=
 =?us-ascii?Q?5hAm5FNWY+z/BMdc2V0ymkcN/mjQt+AiLzelAmoWSbWdESMxRCT4O4qKnQSR?=
 =?us-ascii?Q?+Lo2ctjPTLmk4nM5aniWQCgUXmdR/BVKsY3h59uJQqka7cjtiFMnywGsUodG?=
 =?us-ascii?Q?ViPltBmgILYLDixLmLePJRUdgw4JCQBa4B7j3SY+FlaNJrJs43F88XNsjVt8?=
 =?us-ascii?Q?F81uviX+3N1cKlpKcgU7cPXTg7IeWqucyCvur0/m2gFlfGVQCOwsGY76/410?=
 =?us-ascii?Q?LruL7e3u1hYmUCrL1FNLO3JyrK5UuxktHCXBQs5F9jFW4+GrhXjbBO73RjNj?=
 =?us-ascii?Q?REofmgKY9w+dpG6DVRiHCc8SIBGcpx7Qip35rl7GFUpklBzSAmqD2d7Wz72S?=
 =?us-ascii?Q?gKJ9XV/Qd1pGrCjrZPGhB1BvjXLpcs+7ASVjmZBBu8EfjGWvB8sJFD911gaB?=
 =?us-ascii?Q?QRGk+iosHlLWeCAhaJFJDUGs5RQF+fxtkhUNSf+SNXsywUVeh4vCeApP2m0H?=
 =?us-ascii?Q?bPAdryDEer46I2ciaXJJL7K+mqMBJFk1pdJnMgrxzgOUT/QCKyR6i9i+dWM+?=
 =?us-ascii?Q?n57z5tdMWTCbBAZ94s7V0MeweFTyJaAgkX6jX6/pUQO8Ps+V8k6XCQBoCuF8?=
 =?us-ascii?Q?6axlNVzcZP+cwBhyUHpQTvHKWjTUY7aU/fa3k1Xq2+0QTO+Z4Lix7pVoq++G?=
 =?us-ascii?Q?w25gbEihHCkyCLWePu7YsB+PohzpVoeqXNhSBA9TF6PgZgEvtEbq9kjdMMiO?=
 =?us-ascii?Q?a8o8PT9t5SF/2Z8xYkKDCGmckYVXFNuvTVykvfc9KNvSKG7GipKTjFmN7ZO5?=
 =?us-ascii?Q?MdrKTnxOc0URDTu3TXMfBdCwJXo6XhaULR+ZwGhgJcz3xGl82TU+wHGyXEBo?=
 =?us-ascii?Q?9I1ZMB/RplSxJ5VE3CuPOvlGUljRk8h/+EY/b23jfvFxP1ImaLH6h4ssT71T?=
 =?us-ascii?Q?bt3illPwnw/Llos9CH9/KSZL8wjJTeoAiPjLpXyDVoXMUL6N7HjKJVgNiSYU?=
 =?us-ascii?Q?Oq4L7JuoXcjOMiETL9kCM3Exdz83lPUrr+jOK5cv4nvEzb4hLULtrDqXJfGU?=
 =?us-ascii?Q?AJh77hIOHlIpK7H1VNOPUnLIOW0PVK8AIOMitMu7+I6bknpUUbCyund3Eep/?=
 =?us-ascii?Q?xtl2btX+SM5sDdqQ+t8dtoKbrl22RMsL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1WAzUZcShM3TjyK2euZZSJ1SBFDJisXqdGUK8nv2kJMNhOZk2Da5G9RAtKKJ?=
 =?us-ascii?Q?mTIGZtVrbABvtKmPAaWkGNKQNTb3ZRugMQaoiOvzMtoKyY5hFJvUMjfLr3c9?=
 =?us-ascii?Q?ehnrAfgQfL1QM6AbqyAsLvkYkcys+6JLMxaXgRkFxvSNm/rmMABy/lbRNAra?=
 =?us-ascii?Q?K3x0waRDZVNjYVjrRuwK7/3MbcJQkXQPx57KdVgPiyIU5SUmHjCCAqyvZ1Is?=
 =?us-ascii?Q?d9nTVrQUEy1x4BUydb9htbBD+KtH3KYeHAn5VAxIcg3V4Drxs9iMgaGmcKv4?=
 =?us-ascii?Q?YCaZ92LZa3ckgPT6UHUTmQeXtGgENNLI6D6ulFUYKEvgEMiIXjI4fyMODcnk?=
 =?us-ascii?Q?YGnTiG1WIIukPS6H0FM8OmvkKzN62aLJ8m9LAz4dxuMWV8dA/97UIzKTqKrL?=
 =?us-ascii?Q?T+C6rVjNjwlg9YD4ZA62vJ7lxoaTpFMOzWBpHlw8L2aUmWRt53Futi0c13r4?=
 =?us-ascii?Q?lLvBJnAybd02NSHz6nLFh12lKzmKOgrgHHnzSmFH5XUCtm5iKmckD7MAN5kn?=
 =?us-ascii?Q?dG7HdzedsipK3UyaahDNdLyIPwXoM5H3B/wfvQEfmkmvKBPzZ1iVYF5pFnrg?=
 =?us-ascii?Q?JoUZ5wZfT4hRdYo+su50ZSP/Rt1Pf83LPQAFm3VBcbf9oFEBA+YDfRPri3zJ?=
 =?us-ascii?Q?wtACUV0XNh1OKw9kV3yDooVipdwg2bOK/PAlTKajplYFBoZ9H9d9HbQiTcQ8?=
 =?us-ascii?Q?ukDx0OlTO0Lf6t0TQbspOZfhR3wZwcvWAxhiGX0o9Z7icL0tkzHAx+cPJe2E?=
 =?us-ascii?Q?kQvFmQtPixIWBLoS4aTDsTddGJ3od+l9rsRwrSu1GZCeZWnGrl2DeOgfVRM8?=
 =?us-ascii?Q?SYH9OZIgzsN9V17s9MJLgu8Vm8iPyzZZcpdFVKX/xfxLpgcHaDXRVxRsSViO?=
 =?us-ascii?Q?enVYb5Ephd7FYyrXA25u6KnbPPY7wwi5atAZGtIRr2K9u8+M9rmgu1RiTxMz?=
 =?us-ascii?Q?9ACzH3Q0JVwXYdttMAtOqm9A1fFVn5GLV0k1fZFi0MfbqFkQH1qTqhUCOGpo?=
 =?us-ascii?Q?xiFifNuJNpoN+Ymiqz4x18aa10190QnZzRa8UU2hCse29RlGROubRKiE7Eof?=
 =?us-ascii?Q?Zv3m6CBRYNw6RgnhDDHjVO7JtlMkPXaCBKv/k7ecUMC8tyknRG3uiK/tTSuj?=
 =?us-ascii?Q?nDMUyDUgfYwn+qo7SxdXxF15B4sQRxWqBVIh00c5Y5g+VVUD5a7C2Wmrzytr?=
 =?us-ascii?Q?kzTcdxz10/XcMn7tt+hNv0Ui0BCWozCUiGOg32VM/CWWWA79TqL9E0718ov4?=
 =?us-ascii?Q?UrCg13mTwfaR5Xbkw066A/JZG7KkDvjISSBgzNXaBmtVCtL/4xkJk4HZAaSO?=
 =?us-ascii?Q?ThLRF1LwL0yl47jkJ0yFXkPIEmejfr/jXJJyz75QPr3KmP9UPWK3BQ+7OgfR?=
 =?us-ascii?Q?XyP7IG4EMkk6NZnop/tmj7CFG2Ydk5/7E5FD9OCsgjT9EdFN27/flJVxmimj?=
 =?us-ascii?Q?1+rnexNJcp0CLOLycl3BM9Ay3s1kiBIeLp/F4KOfBjkj2h4o/bp9IVZvKPZx?=
 =?us-ascii?Q?IDsjvx2vkLU/XG9m45eLa8zWr8RtRcDI5qNcYCtEuxhTePBmqQT8minVgkZx?=
 =?us-ascii?Q?rnBBOUDM6qasfjCgajL9f4ED0uIEU3ypXWlph4cf?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0efcc1f-760f-4d37-f8b3-08dd6309147a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 15:01:20.7823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGJ+mHEtyCoOhACbmxupEad9cHsMzTWSv3XSqNp60pib89ByuXduu/OleGF0mtv1phhmqTgEJZHM3VTmEqo6bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8292

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
 drivers/staging/media/imx/imx-media-csi.c | 45 +++++++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 3edbc57be2ca..e642b4cc6182 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -158,6 +158,42 @@ static inline bool requires_passthrough(struct v4l2_mbus_config *mbus_cfg,
 		 infmt->code != MEDIA_BUS_FMT_YUYV8_2X8);
 }
 
+static int csi_parse_upstream_fw_link_config(struct csi_priv *priv,
+					     struct v4l2_subdev *remote_sd,
+					     struct v4l2_mbus_config *mbus_cfg)
+{
+	struct fwnode_handle *ep_node;
+	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_UNKNOWN };
+	int ret;
+
+	ep_node = fwnode_graph_get_endpoint_by_id(dev_fwnode(remote_sd->dev),
+						  0, 0,
+						  FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep_node)
+		return -ENOTCONN;
+
+	ret = v4l2_fwnode_endpoint_parse(ep_node, &ep);
+	fwnode_handle_put(ep_node);
+	if (ret)
+		return ret;
+
+	mbus_cfg->type = ep.bus_type;
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
+	return 0;
+}
+
 /*
  * Queries the media bus config of the upstream entity that provides data to
  * the CSI. This will either be the entity directly upstream from the CSI-2
@@ -211,9 +247,12 @@ static int csi_get_upstream_mbus_config(struct csi_priv *priv,
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


