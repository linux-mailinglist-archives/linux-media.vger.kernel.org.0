Return-Path: <linux-media+bounces-27079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE78DA4654A
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A5F6173D18
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357DC22256E;
	Wed, 26 Feb 2025 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="GCY5hMU+"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC89921E0BF;
	Wed, 26 Feb 2025 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584405; cv=fail; b=ErGYX82T/GSpWbthzo1aEK3spqyrBsKymrkSrikM/BVk3trYL0zCnM4tKXvBZ9KkxQJTZO7p/YZMJ1R2t8kzagP1GcjnvbBSCq2878pDD3oEa5+b1EMyunWl0UozRvUZQqQEBL53J0PQVZFvLbcwnUop5SuA/onLf2JFfAJeBsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584405; c=relaxed/simple;
	bh=OX1ZdROEMjnlj8gVmNSQqRrZvKRi2OQgZ512YHLUV+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C8GiSY4ON3KIG029IPuPHf79BKdsVlXRPhYWsGpHfuYiY+VKxCvT3aI2FDqNy5d0UlJO9NiCCbjzh93FTsCdjww+UKFhJtHxHwYZ1IWhrjzKA1B5wo7gYU+tkE3VM273uX2GHzumC9pixIJq/CZAkw3X4QkzfzCpXihgVwn5P48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=GCY5hMU+; arc=fail smtp.client-ip=40.107.21.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P68pzKlWBFHFA57sIqq/RUDgYZVZwLSYV+xw5EUE/Mt113GEw3pRh3k6EMAgL4RtxyLl0LzXbvXU/J/O5eufMqLL9eYvXUGIux/d+1DDqDhXKAqFxPvDXD+XU1aWx4I6YDAu/5cG3jbTqGrmbVmP4syYVvTDq/6TYDxy4HVKqgAINu0wKj+IkeKTVRTvfMqoudlovzJBYI119AIa+F9VvoVfK2ZGr9HtBcid/a2HTNgo8FlhvXCM3s2CY5NNk8UI0ebMTlMyWBU/Cm7zmnd4RWWgJnun68+/NwxdQ5NXVYc41NCLVmI0maLPzFwkv5hC/x7HGgo+qRaymAIR+mf67A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib8KwctYeEy3grroBh22E90oTXNjxgMBTWQ9NxbcJcw=;
 b=zG0DmFrGLdZsgxlAWB77RU9Vn5n2HAhn9Bnn+KYckXlqEYkXBTKdPJKZ+8amSps+YSxC2HBR5bax+1TdH0Q0R7E+ntE3dbTigpzusptAVFHEfu8pFERpnoWc39nLvQv98Og8wgxWrvW7Ne+W2ZBp9CBViQmSvKOPjRslCQhP58D9xMVWnsCzEqbI2BMHVZ4gTf8odMRJ9+l3Xlx0rQdqunZ6DoOdYbXRQJBJwOPe5+z5UGkfQGozun7/49eTVuyQB9KmgRdGTReuWOwW7nccO4ebQ1kk9Z7V6nkwlJQSlhU9FVvLxAjP8wvu70yYPVloq4wMPyhkbBBAE/TzVrDmSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib8KwctYeEy3grroBh22E90oTXNjxgMBTWQ9NxbcJcw=;
 b=GCY5hMU+lGPF4sTUZrY6UxMe8Gd9PF19lvr3EDOXkbV+4MkEdFDn5BtCYoOf5jBytqfkJJSvqwkW+6zSfWxPrWlTi+4FElGo4Zto80l+b03CizOhG25unfUidOh7v4naA5MA8v0wfMypF1VUXx77fKqe5Ec8O4sQSOD5Zh8gy0pF9JXE9joyEDlc0oJz0nmrynZsZLFkitQQ76XtNKSwTFzrVtjtRsgTymhmtMwaIqMl+m6orMkd9LOPgqjUhperMEFrmdO7nsGg7mYp1eieAaM0B4nVA2M9GN9yo7EjxqcLNl4QosuYMB+vOiSjEqO9lk0UC7AGsHL8AL0cGAhUGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by GV2PR03MB8559.eurprd03.prod.outlook.com (2603:10a6:150:af::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 15:39:58 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:39:58 +0000
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
	manuel.traut@mt.com
Subject: [PATCH v1 2/8] MT9M114: Add pad-slew-rate DT-binding
Date: Wed, 26 Feb 2025 16:39:23 +0100
Message-Id: <20250226153929.274562-3-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226153929.274562-1-mathis.foerst@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0090.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::23) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|GV2PR03MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b2c80e-d91d-4ec9-f6e6-08dd567bd391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SnnQOna9tHbcOYvNNynupNNVn+GHsrQga9QjSzWqFZeqvxJc7FV5ZlG89gI3?=
 =?us-ascii?Q?AUI+TM0vLZ7sAmiiqG+bT09rFNgMof/+PClsc8hiAWxKhkfyDWI4FFkaX2+a?=
 =?us-ascii?Q?7LGN5ri4/nlDPpniJrw0fP/Qc+4b1HIktBYQhmu+0NqKO6/eWIK1Sx6yn5gC?=
 =?us-ascii?Q?epQUQ5NEpX67f8awQWxz/snFQvN0K6UccuLEhAiFrhsXNga540al/BbH0MpK?=
 =?us-ascii?Q?qmIIbDWN926b+QBnrdt3RdMms+FXdAOqdKMhL7av//1xM+61hvnCbOBpts3C?=
 =?us-ascii?Q?V3B/JYy6NkTWsZ7EMuWKC1hQ+wwK1VJjlBUC/zG8vmLkLlTddCnQSk2ytQTl?=
 =?us-ascii?Q?s8aYflt3H2O87pBOdvq+umIKTjsMG57JOKszuhVz3PgtkO+xBpBQJx7D29rY?=
 =?us-ascii?Q?oVjyfa0oEfq43nj5cSa5IX4+8ngR9OM7wOrz9wyc5/oCI29ekDdx4FQHZ+tH?=
 =?us-ascii?Q?dRGOMuwSnmJO9YJ/qMJoRjtcZCdi57jGfAceyY1S5N/2dgarlxcgW4Ft/QcL?=
 =?us-ascii?Q?ar0DLGvsrJHY7YKjV86a7HlqgjsUDlC+onoUCSD7Lhuv07sH6DRCtxR9jOp6?=
 =?us-ascii?Q?TTxZoMX+gXp4uc8a37PTkDlEvc19sFA+KwmLpWSZFrhgolZGYuu8aHog6GDg?=
 =?us-ascii?Q?lIXrA+HdI+wlmQ3S5dafiIcMCm53UYZStW3hy+m9WXrqLWGVf+k/3jAEpMi7?=
 =?us-ascii?Q?v8XVxz4MC5p1DXZq+mWJpotcPzKHTeLI9O0qoiuZtHy1Im/30D36W1Giu8EV?=
 =?us-ascii?Q?hs3YSpXOEQo+ROll4S34KOY08G5Ne37cyNlLOO2yQgmEL9W09sokLVZLgQ6c?=
 =?us-ascii?Q?yeC8AMlB6epvZVnCTAgxg97pmmDnv2avAX9HL8wBPgQdJ2D78inbhSGs/RkS?=
 =?us-ascii?Q?fMGOgE1Ax1TqymiZjeVEzUWa+3UpbCR6yXAyCcNPI3omXWEj6RwsaNTn6Gtz?=
 =?us-ascii?Q?YKarC6DGPg3/NFQ1IhljukZP4QqJy99MnS5RQZZ4slxG/fSlyNnS5J0jryGV?=
 =?us-ascii?Q?jIE1zwlrIQpQ22Nw92JjSofg9dbR7TBChszfwWkKAhtXv5fIY9cPh4fL0zES?=
 =?us-ascii?Q?uxeJ1L6ocyEPLpm+BKlSypRN71lX7rq+sCoRjs5+rKkzv7AmfwisgOaRtZQa?=
 =?us-ascii?Q?OR/rcP3mT58SIpZ8nYx2mwms20uAk1EUO1vzzaiRJHpdPyMZpP07aZ9OVJYf?=
 =?us-ascii?Q?BMTw0yoR9J9+sJoRVmZvS08dTDU6P3TJmZwjBfD+6ElYQNHgFmr9ivxErSPg?=
 =?us-ascii?Q?ZWNa1E+/Vo5qxI5nhNKBxc3OTB/gonlqtpXHDVwK2CiDkxtl1n4hkc9YYcUf?=
 =?us-ascii?Q?ZYcFY+2qqvr7NPq1iUCcsBQ0GqxxVuoXUghoYM2ZYgXJ7ZBhQL1QU3xyQYJ8?=
 =?us-ascii?Q?JfUyCtmXN37qPjnecqc5czxFhTo1xWL9ZtQfKXUReWWCtbQ7BgnBzvTK/eRu?=
 =?us-ascii?Q?8Kxf3SBmOYScuC2nbgWpgBkoAp21krVN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F65DncaERK/BVcseqRHunaEpc3Kw18rp3h9zjK0hTS2+WIkEXsoSNPTrCkP1?=
 =?us-ascii?Q?6mfGfWOVaHO2rJdoRsOLcIm1LHsHzqXliF8FC/pCBxBH/jPmUMNRVWEwp5SN?=
 =?us-ascii?Q?6elNLBGKXxmy6cbQA8zZFaZbCT4Nsre41trOmKrQz7ZnbAbsDtoAOq1192Ky?=
 =?us-ascii?Q?Q/plkMp/6k6ILVFg/yfl4Z2gfETvSJASryGxTW69mr0xekkst47vOypn/pNQ?=
 =?us-ascii?Q?cj7OD8pdzfLqBIvigvX94diYQxu6ZHR8qnJzQaJ22YvQMMdPbc+38HheN5TC?=
 =?us-ascii?Q?D2ATEh89yB35m18jfiQu1AEjkQX2DtCLw9g6gTRatHGSFTx0R/QjLUTyTfPM?=
 =?us-ascii?Q?KxA+pzLswK6hYlfJg4DyUI0rwX7SxqddcmJGWlRRpNcZo89Xl8Io4gzxfg3Z?=
 =?us-ascii?Q?l9/1W80UuDaCA4zk7LLIL8sbNI3Mv8wvJ/dFoA9Z6TYjc7yNOdBhgbxMuTKv?=
 =?us-ascii?Q?tpxF9HBVsMJwohZU9tEsFdoch+LkmKXpqQyxnnHt1wMliedO+PibfvYVcLLY?=
 =?us-ascii?Q?XSv42z+pngSK8em5FW5YebZtXgKTC79Mx4ssLnnHGLU5VTmIqLT8dTi7oWof?=
 =?us-ascii?Q?n0E79nd9ZyHCHPMPFYwZXwfx04b7xPIq7Vp+H4Hq6JfwVZKwti9OaxfM6/We?=
 =?us-ascii?Q?Q+33eA+Tbmy/tJJxese5qt2P4bhNyuXlZ9+Fk9WkhRnWlgBCv7eMpztaDup9?=
 =?us-ascii?Q?EZ8K760Yts1lg19Lhr1g/2c2xzZI3P3yMrEh2B2jDSkuEkrlQkq45slpHO5O?=
 =?us-ascii?Q?3HIGsqkKSUtE2CheNklLVbFuFN+iUf0oABdlYchpZv9HHBSUgZewtMfGCJhR?=
 =?us-ascii?Q?UO8o3SOQgsjpDJb6AychwTIfBQt8Y+/ci4TvaM0xfn9OreCMiW5M6Sxku70B?=
 =?us-ascii?Q?iF/9r2EDVTCVKwQ4Hu2VO8YgGOyFMhxxlDflFbf4ud+5pUd4i9g8fluPiaoA?=
 =?us-ascii?Q?8nx5EC6BDhA9u4NxPApT9Gzgj0uEPRT5aDgWUWIYsrr+z9Gl0x0y+BBBol0/?=
 =?us-ascii?Q?cwlP5e0hb6bVFHhwaDFbZ6w5lN952eSiNqeBcbMG6lhNPEhduzZ0fPyx3l5I?=
 =?us-ascii?Q?05J46z6qTpHGN1iHAg4X4OmPioghI2pxlITytRKtHcivzaScYcpUuPDSgWbH?=
 =?us-ascii?Q?zZCj2o9FpBdX0Vbtdb0nMaluJmaS24QZpb7uNTxdF5/1f4omWJXGnD+Jm9aq?=
 =?us-ascii?Q?n65r8xEoYdQH4QMe5IS7qTspk+f+DrqeERWcayNKCa+yExKny0I/c9Qr16gj?=
 =?us-ascii?Q?bdIkSxFGZZBdXEGlEInehjGjvlCUc4s38yDIMwp82LzqQ6B+lKklhVIwRQO3?=
 =?us-ascii?Q?pXwI5LBzNHZ7KAjqL8AHXFkUlwcJ+blYnqbuYNyDcYQzGmkxIcFMKkGWB0bv?=
 =?us-ascii?Q?hvEqdCyla9/AM2/Xeaf5G4evxixnl1/UfaOv+9fUnOv8wZ3/W2zJIMgk8bc4?=
 =?us-ascii?Q?Jmck1U99jD/qELHYWzaHt8niNQ/4JXCwLM9XqIYUr0JqJQS62/AEulmQzsoi?=
 =?us-ascii?Q?atRC31ojiY4/BMElzJHAnAIDkBKJncZK41H+/uns4nPeoZR7Tj582eTilYWl?=
 =?us-ascii?Q?JRzR4IUfqWmohw8UitSxtmp4htPpzogF4EnAlNr8HQP86Kt02XkeJXziqcCf?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b2c80e-d91d-4ec9-f6e6-08dd567bd391
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:39:58.8142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2HzKXG/uKPy5sI+N8LqVYp8ZX2j4sz/cfHiG+y+f0bRdzGlxQVdEm0bmS1o7YO6XfuEtl3ZZVOdIGwlK7QDow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8559

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Add the 'pad-slew-rate' property to the MT9M114 DT-bindings for selecting
the desired slew rate.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index 72e258d57186..666afe10c538 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -74,6 +74,12 @@ properties:
     description: Bypass the internal PLL of the sensor to use EXTCLK directly as SYSCLK.
     type: boolean
 
+  onnn,slew-rate:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: Slew rate ot the output pads DOUT[7:0], LINE_VALID, FRAME_VALID and PIXCLK
+    minimum: 0
+    maximum: 7
+
 required:
   - compatible
   - reg
-- 
2.34.1


