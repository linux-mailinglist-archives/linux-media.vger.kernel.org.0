Return-Path: <linux-media+bounces-28935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E237A74F3E
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D99E6189143A
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44631DDA0E;
	Fri, 28 Mar 2025 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="euqLfTOw"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0E81805E;
	Fri, 28 Mar 2025 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183069; cv=fail; b=eF8zxoPp3pa7RmtAjfFkNhB25llZJ1J7KzOLv/F/51CcuRUqc3dZDMifq8eAg+BpvGndthJVxGVEQKD4GhWyIBKi5c/lhyWh1+S/Sr/0P0O//fpGaRb1A5ZrSj5H4WNf7tEF6RjFiiYvZ6mEHHgsMQ0xr6DfeqORJLlEgkSWTz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183069; c=relaxed/simple;
	bh=Riabw4GaQPzGEidC7l8KjXuh0TPOufq8M3wcqZLBBnw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KDOXCeAhtPQmgJbnnptaLYr4X7h071Vdz4xAC1fXT2x7XGSrpS98LIe+mxny5nkx+Bf0v9LCOeco9V0we8aj9eKX7lo1O04WZzwIKotPtqUqCBER4ofVoMT6wB9revGgcOxjiKm5QCmJtLjOXyFxl1QdlsSaYkyU7TV53k4eXFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=euqLfTOw; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jtk32pdCfXAzHS6fkwYS1qtG130HPiNamcjWwlehGQnTxw2SgWAPfyCce3p7IWsOv+Kw0bDH0om84Hd5C+el/iv9U1epd5iA5jdi4nywNfSEIiw+v8GgJDOOWxlPXv5Btoi6mEW8MDHEm9i+DpUwUMpCY7dM57VmOobLh19dABI61htc8nZAuZmZWf1J4fCLZK0ia/CytecRmm+/ywdqJLapUED+1eW2cw+H8THj3s+CB0GRxW6La2WFV2NveBPrf9wL9BnvOPJGLtFRFkDmadr23pQAMwBVcLJLf2c+K/7sBzNq+d98OZXb8h0jigJcTLbqDSIH5V0EvIsP22tZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93hNrxQTbc4mTgpeGH3iGkLy2QQqFv6t6aP6H+cDIWc=;
 b=eno3RI6IXa1zfol+g6hyaHIgOPoM9aPODSyg6qMpJkTCrGJ5i8BUIenB0qiE5MOe6P55BOSsLezvqGyAp7Zyzi8xTA5JngcEKHRGW8xSLJKM5pURKeeIPg3YV2QqzsgX/OSbi7Nh3Ny1OTs6JFra82iM8hlu1EwD28EWrQwvGRG7urZXDI/4jUmjLZ401IP159Pzif5IjNtWyOODcAtkAwOCfgdrTSI/5NakHIBkgq5IFpqCyjO89iWG2Jois3bTb/0JZ/3Ba6lKcQ7yH/xH3U7UJPRj4lrdEoYJmCgWsjuTtT/IAG9jPJM1HSUFBUCYDYh8etJuEWtyhmJ+oLjfzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93hNrxQTbc4mTgpeGH3iGkLy2QQqFv6t6aP6H+cDIWc=;
 b=euqLfTOwUE4AzCciqsBzXMfy2HNj8qDBzTYDNqI2reOnO1ZkjMpEVfhCBfyPk6x6dROMvr31koyUNk0DoquuueKiNt6Vh27FELe0vKLXUVV2d+/sH5TJvoEbYexgx0L6FI5H1HWG7slOVEgSuVMfbCUaWrfQjj6zWYi0ICPhzoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:30:58 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:30:57 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/17] media: rzg2l-cru: Add support for RZ/G3E (CSI2, CRU)
Date: Fri, 28 Mar 2025 18:29:36 +0100
Message-ID: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5209c6-ce5d-4549-2928-08dd6e1e4c75
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JzdKRjuGHQpONy7QXQnmLeL+WKSqBKg0VIqG6uxY3zaz4rDJsacavUUwtOgL?=
 =?us-ascii?Q?q/GTqGqoq3XwR9AL/1L5/k9hHNzyoYjL28P0119mf5J3cYS7KbHqGhgCuvVQ?=
 =?us-ascii?Q?Oqk/pjw1DNnDuKFBXvcdELwHvExHxiL8HCrQzoiTEdSbAekNDAaHYUzI09M9?=
 =?us-ascii?Q?rBG5u9B9AriD2yMyclkXanRLHGV8WMUBFoBLYyFTz51/nAFs5tpjDvmxXZNN?=
 =?us-ascii?Q?2nhGb8b3p4Nk4YU8uX7KdC+YasipDi3BsnRLB9hyV8xVZiK0g7/eLJMKFJ6l?=
 =?us-ascii?Q?jrKxoingvVdjPNYTPS9QLCsyIkoqtmmXu9/zFf2CpZwCH/auiFmGF0No4yKw?=
 =?us-ascii?Q?lX8fGDhLUWkXnjNGuAs8n/ne2tUa+2O92hy7sVugiPuUa7BjWQmO54qQB3bY?=
 =?us-ascii?Q?ETGfZew2XsHHivimHkzGnPsjiMVY9JoGvmKZt2jovhaMaBECZPLh0O1L0a5V?=
 =?us-ascii?Q?snKa7IKuEW/vQF0LFRUhNyvxvZhJLhKWaA3MXIY2D8xqvZr5qZwF4WZwHVgn?=
 =?us-ascii?Q?0CcCTQRnuDf2upi1rG2wf3HZPtUVhtdscBkmPzzUjCUP6hZju0ezPC5695p5?=
 =?us-ascii?Q?t4MVaYEuhi9yD22G80Z0INKGFrP5clqKUrWKfIXxLdISss4hn9AY/iTGR1JB?=
 =?us-ascii?Q?WmUYjvtjaiFWOaThhroXWYNbCxTEg4e3hjbveoY9mSboFENfhFgZJA7Geddn?=
 =?us-ascii?Q?GRLyx/3dpj75qLp8g9RcB9UA0XGOygCt3J2+eey5hvFSdcKtMNBy7mEKQIdA?=
 =?us-ascii?Q?2HEScG5c85KMSdR4Hr0Fht2sz/NfA0bENhtCSbBVfwa23c0BGkaCAMtTCgyK?=
 =?us-ascii?Q?4U9sNLi4yV5ip00dm/2VzT2Utrytm6sJTPzlMeaawAy8e0DfRu6gWLiyeA2e?=
 =?us-ascii?Q?4GV4aaQ6p0vgl6GqiDW9MH1fBq4DJMceuJP+co3GTrW3wD3rAxa0tR2bnh/3?=
 =?us-ascii?Q?VSz+a663MHpWBGzoDyXcaYN4PW6RYSgu6MNzFiHk71kRVMHTQ+0QyI9+c6RR?=
 =?us-ascii?Q?ulq38Wc0qDo99KvaW/IsSSpXznrl0jlsrrmgR5bQFcOSRrxoHHeMomXhUNWG?=
 =?us-ascii?Q?7Jk/Kx4IPVRQHKB3VqI/3joW1u8I9ChjUZaHupRA9cscijA35I/xS1/TA0xn?=
 =?us-ascii?Q?ivWhEwjGcLjmueoy82UigqENkVDqu4ZV5+LRK1Nsl1utR0AaTVHLVjMqFDoO?=
 =?us-ascii?Q?Kbf+j3ghdX78szwxmxQGShQj45wpx+hKh78zdtetPSLnBtCWcTqb3udRnXxd?=
 =?us-ascii?Q?gzyYi/G+kPKqAEBRNHxGlFseDokuGeRUkBd37bTT+xKzwbiN0ubFBCRsVh1i?=
 =?us-ascii?Q?tViulnml2HOYOE9SABbLyt9+hVoFEny1iNJoMd3bglqIoM1Lf1WSbEKUAOvl?=
 =?us-ascii?Q?sdf0YjgpeI3PJ6DdqChhWbIPcxTjydj4zj7kYEJJYXtIT5covMMRaA+p4ROQ?=
 =?us-ascii?Q?d2TdjBtsiRcXl6AyFvBRfDb6ZrTrT4EAiJ1ZGl1wGqlsOcIx59OjfA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1lS4fqXAOR18+FKFZDxpSSxa/NTWr+YG2hyw5lxtZGp8/znjDOzy44Ceb9NQ?=
 =?us-ascii?Q?V0pVoeHobkKkId2+HCnyWlnwI5X3Tnn4e0zH0WpFD3EIQnbI0PyykwUSJvl1?=
 =?us-ascii?Q?2+L7oyaniSmMMLY4IiF6Awd+I9g+3GS37AqDxVDJLjnURctdQZTZxWrJY4x8?=
 =?us-ascii?Q?Flx/sI3lYoRbi9+aKTBnWSwy9NAzLygZM3jYNi7/cqLq5PqER3eMFg/3oY6t?=
 =?us-ascii?Q?KTX7I+CUz+BgRYACLH0s/rOQhU+UUL5uxi9/lFGMq4mEsL84Q3QeLqg9QP/i?=
 =?us-ascii?Q?MQzA/R0geLUouNHA4ZlyiyPBxPjkmCBT2UCSwIbByAXRO9F3jQpV1Q+d5zRi?=
 =?us-ascii?Q?EP9u6bc+nIWz+aWTHOJ8l4sw7I9fkRZTPW9OU088+YyY2Xk4E1RdEnFfxfLZ?=
 =?us-ascii?Q?SCsETG+rWBpdxYMW4dnOJfIJgLTsvOkyLWlDcA3mdM5Hin/C/XP9CVFra9AK?=
 =?us-ascii?Q?LUtv3pjPVXqehZY4M0XEcyUjGcvY6Co4+StHj+iCc90/w0MMOWOXhYLflMkD?=
 =?us-ascii?Q?RABTn9eZCytUjhjTAVLr9Y2+xhdnh1UeQ9v0cTp6t52a+Mw626EuOS/zIumh?=
 =?us-ascii?Q?eN+fZsm5Wg5WEcf8tgjOOnrGuuto1A7WB1AgnKK12C0BWFb9wj7poJvogs/D?=
 =?us-ascii?Q?GpfkKs6e759UPx4ty1bsTRvXoNmkmAn/zd5o5CFA2eiCPmg2iiwuX14MrIke?=
 =?us-ascii?Q?XFBM0L5QpCVkMn2rMPq6ILhlLGajnSL/q/Sx7beingDHOuV72d/izPD+X5ae?=
 =?us-ascii?Q?Y0GG+1r/Ym+kJMJJoc+6r++yP39i50cON30aPr1jq/cR156jYRt/ehbeA7JG?=
 =?us-ascii?Q?xjNi8XIPyGXrtdKlwk7jc2LaeXh/GLulXe04oGaEDHrNKBtQMDzqYoxtYPOF?=
 =?us-ascii?Q?7qvmKonf/inAI3PHg4AkdoufhQvpfaFkLcTHzFekAyun/Mo+XHfYw3sjZ0nv?=
 =?us-ascii?Q?EtfOE10jjRjdK/IM7HFKiqPwzZ/r+vVWFrNS9qbSD0ap6n6fqkc7SV6pX+G2?=
 =?us-ascii?Q?4++HQGBT9eFCGNbJQb4Ee4jZdsiMjxY+NmO4xbUC61eqRVYNW5WF+ByJmfmX?=
 =?us-ascii?Q?fFyHIk0zwcP6UX53HNZdv6dz/j+04J964iwPOl9K37Q4pI1gHM8D0U+nD4v9?=
 =?us-ascii?Q?7YJDYLIQ+7Un7KhGLZAtYir3pabMVKsd4W3dIJWDWA3uTK2f2/D3KYKeoovZ?=
 =?us-ascii?Q?KXWual528NGa3k52fS+0Y86JCUmdHkX4wHGRmElx8gPJrgXYFJOPR5676HR9?=
 =?us-ascii?Q?aieLhg0ZqvBdrpDwA5Q/mIt1DhN+gV/MCFnCDBRaXTUFw/nOzjEl7i6WbsiJ?=
 =?us-ascii?Q?fKjgvvs/52CQpn6lNYF6Z+pFK2sloZc/nI9K6BduKe9JLH+vUJV7rWI37IHy?=
 =?us-ascii?Q?Zd7BdgxJd+WeESpYOcl3dPVi9nw/eVyB++WYJcAhQT0DONZGAOuSKUcVAvaM?=
 =?us-ascii?Q?77ESNbyylB/xTg/RHmIvJJtKjp9y7euN6k9uFuc2fV3wRA8xutqxkI3AtvWK?=
 =?us-ascii?Q?Bcyekt8wozhqhzl5BCeKLeyfjjEfwF8cEQlJSyigTmRKbX6ihc1cDmLt5mF2?=
 =?us-ascii?Q?cy2TBDA/4BJ/XOOTApVIeKMq0t46PvYm/Zrqmhph4tNro253V9lYD7GbH9sO?=
 =?us-ascii?Q?I4xYTLzwsQmLSGz5frhLZZo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5209c6-ce5d-4549-2928-08dd6e1e4c75
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:30:57.0644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BO/4eptxtk2xeYMHJiaKF4GNa4s+Vz3yEJHwXLk3raM3tWrAwbitwK6wT8F2NLhO8kNpAeOLNHwtfq/TGHj+p4Z21ThFLHnCWrjNwDFNzhicypFSpQnTTiJt5D05cnNt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

Dear All,

In preparation of supporting the CRU/CSI2 IPs found into the Renesas RZ/G3E
SoC, this series adds driver/dt-bindings support.
This adds also some minor fixes into rzg2l-csi2 and rzg2l-core drivers.

The series was tested in an out of tree branch with the following hw pipeline:

ov5645 image sensor (Coral Camera) -> rzg3e CSI2 -> rzg3e CRU
imx219 image sensor (Pi PiNoir Camera Module V2.1) -> rzg3e CSI2 -> rzg3e CRU

base commit: e21edb1638e82 (tag: next-20250328, linux-next/master)

------
Some logs:

root@smarc-rzg3e:~# media-ctl -p
Media controller API version 6.14.0

Media device information
------------------------
driver          rzg2l_cru
model           renesas,r9a09g047-cru
serial
bus info        platform:16000000.video
hw revision     0x0
driver version  6.14.0

Device topology
- entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
                <- "ov5645 0-003c":0 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
                -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]

- entity 4: ov5645 0-003c (1 pad, 1 link, 0 routes)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev1
        pad0: Source
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb
                 crop:(0,0)/1280x960]
                -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]

- entity 8: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev2
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
                <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
                -> "CRU output":0 [ENABLED,IMMUTABLE]

- entity 17: CRU output (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
        pad0: Sink
                <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev0
v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev0:

Driver Info:
        Driver version   : 6.14.0
        Capabilities     : 0x00[  466.011745] csi-16000400.csi2: =================  START STATUS  =================
000000

Requir[  466.011745] csi-16000400.csi2: =================  START STATUS  =================
ed ioctls:
        tes[  466.029168] csi-16000400.csi2: ==================  END STATUS  ==================
t VIDIOC_SUDBEV_[  466.029168] csi-16000400.csi2: ==================  END STATUS  ==================
QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev0 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev0: 44, Succeeded: 44, Failed: 0, Warnings: 0
root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev1
v4l2-compliance 1.26.1-5142, 64 [  478.758872] ov5645 0-003c: =================  START STATUS  =================
bits, 64-bit tim[  478.758872] ov5645 0-003c: =================  START STATUS  =================
e_t
v4l2-compli[  478.775381] ov5645 0-003c: ==================  END STATUS  ==================
ance SHA: 4aee01[  478.775381] ov5645 0-003c: ==================  END STATUS  ==================
a02792 2023-12-1[  478.785470] systemd-journald[107]: Sent WATCHDOG=1 notification.
2 21:40:38

Co[  478.785470] systemd-journald[107]: Sent WATCHDOG=1 notification.
mpliance test for device /dev/v4l-subdev1:

Driver Info:
        Driver version   : 6.14.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev1 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev1: 44, Succeeded: 44, Failed: 0, Warnings: 0
root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev2
v4l2-compliance 1.26.1-5142, 64 [  488.827763] cru-ip-16000000.video: =================  START STATUS  =================
bits, 64-bit tim[  488.827763] cru-ip-16000000.video: =================  START STATUS  =================
e_t
v4l2-compli[  488.845579] cru-ip-16000000.video: ==================  END STATUS  ==================
ance SHA: 4aee01[  488.845579] cru-ip-16000000.video: ==================  END STATUS  ==================
a02792 2023-12-12 21:40:38

Compliance test for rzg2l_cru device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 6.14.0
        Capabilities     : 0x00000000
Media Driver Info:
        Driver name      : rzg2l_cru
        Model            : renesas,r9a09g047-cru
        Serial           :
        Bus info         : platform:16000000.video
        Media version    : 6.14.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.14.0
Interface Info:
        ID               : 0x0300000f
        Type             : V4L Sub-Device
Entity Info:
        ID               : 0x00000008 (8)
        Name             : cru-ip-16000000.video
        Function         : Video Pixel Formatter
        Pad 0x01000009   : 0: Sink, Must Connect
          Link 0x02000015: from remote pad 0x1000003 of entity 'csi-16000400.csi2' (Video Interface Bridge): Data, Enabled, Immutable
        Pad 0x0100000a   : 1: Source, Must Connect
          Link 0x02000017: to remote pad 0x1000012 of entity 'CRU output' (V4L2 I/O): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Try VIDIOC_SUBDEV_G/S_FMT: OK
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Active VIDIOC_SUBDEV_G/S_FMT: OK
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Try VIDIOC_SUBDEV_G/S_FMT: OK
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Active VIDIOC_SUBDEV_G/S_FMT: OK
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for rzg2l_cru device /dev/v4l-subdev2: 59, Succeeded: 59, Failed: 0, Warnings: 0

Thanks & Regards,
Tommaso

Lad Prabhakar (12):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
  media: rzg2l-cru: csi2: Use local variable for struct device in
    rzg2l_csi2_probe()
  media: rzg2l-cru: rzg2l-core: Use local variable for struct device in
    rzg2l_cru_probe()
  media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
  media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
  media: rzg2l-cru: Add register mapping support
  media: rzg2l-cru: Pass resolution limits via OF data
  media: rzg2l-cru: Add image_conv offset to OF data
  media: rzg2l-cru: Add IRQ handler to OF data
  media: rzg2l-cru: Add function pointer to check if FIFO is empty
  media: rzg2l-cru: Add function pointer to configure CSI
  media: rzg2l-cru: Add support for RZ/G3E SoC

Tommaso Merciai (5):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2
    block
  media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
  media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
  media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
  media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC

 .../bindings/media/renesas,rzg2l-cru.yaml     |  65 +++-
 .../bindings/media/renesas,rzg2l-csi2.yaml    |  62 +++-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 148 ++++++++-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  91 ++++--
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  39 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 165 ++++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  13 +-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 298 ++++++++++++++++--
 8 files changed, 749 insertions(+), 132 deletions(-)

-- 
2.43.0


