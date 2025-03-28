Return-Path: <linux-media+bounces-28945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CAAA74F6C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84E37167BFC
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620F01DF973;
	Fri, 28 Mar 2025 17:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NPh3su3y"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55F41DF97A;
	Fri, 28 Mar 2025 17:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183140; cv=fail; b=WYhvFreg4VqzluzH0WPiJhVAujnau+d4jgH6mItu8G1GdpoN2R2dJWmy9cTqjcu/hyKMUsIADoswfGKo8d2aMRnChNOn0oFiAxgdesqHpEKCQDZ+0nFRd1PW3bmujtXCJBa0BqYLy7LErP3CgLq3PG8CxPJL9nqcBXXQKloPue0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183140; c=relaxed/simple;
	bh=FEW971mqYDckTlqliO9ZrZLh4MZpDT0SU4fDmE1lJlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uGi03kiItVGzLxdoFBi+o9mfHDgdcp+8SAQap0S9kGP581c0JcD7JQEqVWCAGf3Kc0ttjeyN+QkZ2kxhde7JSB0UE84mOg0sCQYoTubf1mhZcqjFbmmaVVKkv2zGHy/QvIwesTpClGUllyneZRJ9j8ikzINU/4Tv9vs4YJ4dQJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NPh3su3y; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrYS7J7zjMsM/gWNRVgZNrJ6Krm3p7NC1bHgFDReYz0sqLX/SWgR3q74/FZozs9+rab4SFMufsfbodlu95cbga3CgIOdzYiyzM9b9N9ZiJpL8z7oPLgQAXXNZ48UefmyjgkPlfiqiF6Q8Z+Jp82wgEOSjhvKEA5YK/5idEUsieRMshzhaHDkKKw40/JC/x/qGmI+VikPMQkkwjxx1IMDK5kmNPklxDWhCA35urmzWn8j2SUtobdHazeyMEpKtgcvzVW0yQ50ARhV5UfY+c8KrzFKyNETDSbwMq9wqSAxsk4s6jg9Ti5ACdjqJK9c2cJnHFC9UBPXrMWK0WmJmo+/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPCAyGIaCpVn+CBKxCEdizeov7zcOBsaTTXln0USCBA=;
 b=KN7Kx/d64PTFqA96mYr1ylpEzJYKKUVzzKF43E6+x9x4ym7cH6lUZ8p4wDL9XciShWuEUU6A6vQx4m9LHBbjqglauEn+GTIjbwB/9wf+KAEoG74/JY+lMrJHJpou1x0j+fbf16ApS0L5bBOk1dUrVUgrvRPAmUJCqFy+vprs5r8flAPU+OJGT9aO7FTSfT4wtUn3puqVpkscBPdZ+3ANusnS6ezLYVLrZfcfFzNmOBuK8jjbvaotHApawrXJL9ada9N0u9YElJA1amgfkhAvc3xWIAcFHRgunDLX9PIA44VecDmwWPCzt9eCeIpzGubI4ZKtPKEqmIiCy9Y24jTYeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPCAyGIaCpVn+CBKxCEdizeov7zcOBsaTTXln0USCBA=;
 b=NPh3su3yyhQ+PIaQjBMDV6440stqqE6FA3ElM2xWew9WvWFrZs7B5cNg8DJUmKmA+HhR7aynNwy104Dx8ZuThVm+OcW1wNjB3vA7lFiPEB7vOZ/Hh4bIZEIhZgncK3GKjvsRTw52h5i8XEmeN/7AsdGa1e+lh/IbUx80HA1BBC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:32:17 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:32:16 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/17] media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
Date: Fri, 28 Mar 2025 18:29:46 +0100
Message-ID: <20250328173032.423322-11-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7b7a3d6d-f907-42bf-e212-08dd6e1e7bf8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M4hpVSTOc3uRI2M44X1THkNffEzGaq1kyE6QGRyBj2G3tb2OEEtW8qJ9BKE+?=
 =?us-ascii?Q?3mgi6u0pF3EOqrQKLmrV5ZoICcpbI54K5N46MeO4T9Q81Za/zsDtpRwm6DP3?=
 =?us-ascii?Q?bt1V7pch6NPebJ+nSMIWlpvsJ9u1E5uH+Ar4lqym9jsbUR/MQih0T4WvAVeN?=
 =?us-ascii?Q?ytpmqhxoAwAaEKiyGUshjghktjHrRGk09dTNeracGvoaJxky412CEG1U4R0U?=
 =?us-ascii?Q?7CrPzKeU9H3GiWpIkH/n0NXx2Que67YV4jTMwIqga2cpZW7i4oEdTA06z9Wp?=
 =?us-ascii?Q?4KdNDXRwn6OEY6pRaGwQHUp7BWiKLnd62WDhDEscXPfOsfNdABJMR0Mc4Wq3?=
 =?us-ascii?Q?FIA10TCChKIyIlN8IuVxpI3M4d1K4Kcr5O/OCbV77CG2xKGpMpYZRPmZ4wHM?=
 =?us-ascii?Q?RUoYlwsNWqPKbS6NQqzyvi2HWUrret7Boc5660s62rZ91icBER7w4ftApNAZ?=
 =?us-ascii?Q?w3IKWJvFEKxOiXE57ePC6WJpEJnrlTfvfKSai+q7uP2Ywk89kF4InVM7ii78?=
 =?us-ascii?Q?d6hgrKQyqe83QT1feRquTPCgtMKcH8E+hjSYHlsoyIdCszdRP1SLU6orszdZ?=
 =?us-ascii?Q?eq1VIH6F02HmxFCYeUT56+uQQhkpFdhnqrugDo5nvFp7uzc7kokYiUG4X0O1?=
 =?us-ascii?Q?OXyIjrbMrIXd34Wqkw4hrPRSsRm7pr/lfMGDAJ0CJEOkN3k5Z68Qe++sAnX6?=
 =?us-ascii?Q?1qY/pylWM0myPzEXSMGRiqb6SPalpcxddIXrT+Q70tlyKyxbNRqfGHvzUrUm?=
 =?us-ascii?Q?/pbhMW2lUXylDBDI7iCRGdeYpMnJ6H+23Dqf8aQXlIAFullxzLQ+avCuLZtb?=
 =?us-ascii?Q?5ujIw6bAL497ZQPi3MLgDp7uYEu7mX5MHsILXfgNCb5vaxjD+Hu1K/iIH9zh?=
 =?us-ascii?Q?6iuNoVQrJfZ9jK6ppismwvq+uYMoy7QhQAAZ23F4HWDQgyfQ45Sm0nuX2stl?=
 =?us-ascii?Q?nu1RCZqwawas0+FQHgR5oVIZLgPvaq7E/LwNCR0ql5ItCxNRqgsiwt4qWlpw?=
 =?us-ascii?Q?GI5Iekm6pXUoj7SiaIiennn4OJqItaegnXSpg/Kcv9BSUv9BRPNV7RfrvILx?=
 =?us-ascii?Q?Ar/7WuXfKsXJaFe/0K3jkWA+yU1mV3EgvYVLDd19T6VwETbF7zf2OhXwKvZW?=
 =?us-ascii?Q?rajAO1SXrCbkck5oy8O52Hha/tTpB0+rXCBoHQbFQfERb1T06EzyIMO3QAQh?=
 =?us-ascii?Q?Qr2Vwt9CCfovsK459hDx3mEZBeYzw9cIA8wnTXHJ0YOEBhY/ibUNwb6gazDg?=
 =?us-ascii?Q?i6suGfLiFlG458zQxDm0gdrQREeXU+QgdMhL/t9koNAyqA/z1GSPVabO3dW9?=
 =?us-ascii?Q?mD869bZsFrbONjLMVYucyz+XGFq37DcqQUpcVjFEDHZzGCg9n43iQdnxcgTA?=
 =?us-ascii?Q?e7B2zTJpBV+/GY3fq5mNQ6JOoIwrOJDXI0z9xuPe9nwlPMwbglvtN+5en17J?=
 =?us-ascii?Q?RLDe3Rtm/9VH0F234PnyU4f2ajpF30OtqfOPcbazau46XxXjB3nmOQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?29cXIPs9J6k5z3loj/fGP8tkAI2PQ4EgxrFsMw2+CSWZZVUdM6VZkPY0EwYs?=
 =?us-ascii?Q?ierOb9j7uOahqBUSuUrSQNGdCjDysHeZ0MJBvD99OGMLVzVmJFRNhwcKD2yt?=
 =?us-ascii?Q?aw22Jn89BI8Lv0suexyMGN+mzVEnPqjPP3LAuKTDJSHg1a8K1hILVMlj2Kbd?=
 =?us-ascii?Q?cnUZ/k/dXs0KXzUDEsHbzc2W9YwPlC7idmVMB1A0p72aRHD2X/3RkIDg1VFw?=
 =?us-ascii?Q?cgF+Ki0aVGEjs7dxSFRQVXNG+xjinIiorhK3esLe39tgMpggmpAeUKMSrAiK?=
 =?us-ascii?Q?/wW6duvV3rkvknpUwHQC87AxQ9w0r3g0n1qeWL+yfpbc0cOBOsC1w5yhgC83?=
 =?us-ascii?Q?6ZDJeh8aBK+7ccyBAKtdi/UCMzlUtquyj54IkSWwh6vAvcg1Lq1UE/yp33Mp?=
 =?us-ascii?Q?Uai+YCj4hiucYQ2uR/pyi1Qy+42LBMk4C8PirPMNtakH9rP8IAta0lgwoJ68?=
 =?us-ascii?Q?Dq6ukC/Jtonyt3YPM1jY5X8rmreKMAixXwgYV5n6mvzwS1GL2fyjL+k/N0hb?=
 =?us-ascii?Q?ydz0+1CL1rVmIGxs3qkvFc5T9IOcFG8iDjDF46ZBbBPRFPrqgY4g67In3Pzn?=
 =?us-ascii?Q?P2HLiZugqfRhICxvLMUxMrkz+oODs5jIzKcB4VT/4MbUbSXy+sM1PE69dbt4?=
 =?us-ascii?Q?dUHMuKTiWkPBPiBhbLmpiFer+5pvpHsLWlxorAokz+vRGIAhBYf6vaFmD2kN?=
 =?us-ascii?Q?bOFtVMJILKN/IB1raptq7jm4dHKClJMsDYoi0us6nmmBqv7OOo0V2dv3AVh0?=
 =?us-ascii?Q?zX5HZ8AgNHduABwwwSrqTEeHCkzsxyoN0KprfyYS8IQWO9Pk0zRmUdLmH8yd?=
 =?us-ascii?Q?6IehrwiSWTOEGGtgQnRGdGkqQ87ELGwzrL08qcB6MdMdUK14ztqk08/qvvEO?=
 =?us-ascii?Q?wGb1+ozp4YOvMdLlFoHnPw1Ox9U5h+jcwN+zDOpJok+Gpr2ofVMnBf1CT1pr?=
 =?us-ascii?Q?xV+KxlljxFSsHEvXt3ClqT02lYEIoMbAJVIL5XlPyUOZckEds1RJbsRvl7VW?=
 =?us-ascii?Q?t5ZSapwDqCrIVWzkzwY7N/iAAB/W4Hy5XfgjRgO6le+WVx7oj8iMPHsbxyGn?=
 =?us-ascii?Q?SicOhbehr2oPS6ybVSwH5HlxuHtWRA+10RIlnJ6kSnFDVjUXHopfXKNeX6Yu?=
 =?us-ascii?Q?tX+817heX9BU+D+vhvG1Z7X4beMlC9UOK65vffPCq69c8dTAuxSnQr/K4ORG?=
 =?us-ascii?Q?2ioFM1WnnL2bI7Sw52GKj9KfiIIjfv47q1OcrUFoTR8MGqVal0YRzDiS7cln?=
 =?us-ascii?Q?mvisi87I2MCl8SXCD1oHprYQWNnolKl6EWUwL8pm4RIPAjAh6u7bL/8KEJI0?=
 =?us-ascii?Q?Rq3R0V6odcHuZBrzfvaXay90bWPMqEid5He3Z0VP3Kf/Ftrfs/0ASXErnyi7?=
 =?us-ascii?Q?9ZvuoQWX6fcZgzdhARmfeQFb3UeAd/4JxNaeluQVd1PhaYcQ20AgNYhuAQ2H?=
 =?us-ascii?Q?pbK236mLNAIlBS+T/bjlgCy8LnFYovry66KWs34pLc8qfq9zWhL4OieLdOON?=
 =?us-ascii?Q?XO6GwzSmkdNSuJGwFr7KlvUQlyOZXrrkIKmgFJqMu2TNUvtK9cG/CpRdkCKz?=
 =?us-ascii?Q?W7Gz7lMQyn8ammCrPzg3idStUCTZBr8Its+0FT/Ztsn4yLKEXenSd8SDFCpJ?=
 =?us-ascii?Q?YJfug+2YXRDerzHkCzXf8+s=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7a3d6d-f907-42bf-e212-08dd6e1e7bf8
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:32:16.7508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFTAHqDh8ZKBhqWjftbGmQ/OMfE5oeERXRXnFIo3xYR6/KWWSImXTuVp/h8EApHRRMmwLgd33ALYTFNrEQ03LsxjSwLHA0u6DfIUGJA53iqol2uiWC3XKDLG1M1Le+c3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The D-PHY on the RZ/V2H(P) SoC is different from the D-PHY on the RZ/G2L
SoC. To handle this difference, function pointers for D-PHY enable/disable
have been added, and the `struct rzg2l_csi2_info` pointer is passed as OF
data.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Moved CRUm_SWAPCTL write of rzv2h_csi2_dphy_enable function under the error
   check as suggested by LPinchart.
 - Moved rzv2h_csi2_info after rzv2h_csi2_dphy_enable() as suggested by LPinchart
 - Collected tag.

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e4781105eadc0..9243306e2aa98 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -85,6 +85,15 @@
 					 CSIDPHYSKW0_UTIL_DL2_SKW_ADJ(1) | \
 					 CSIDPHYSKW0_UTIL_DL3_SKW_ADJ(1))
 
+/* DPHY registers on RZ/V2H(P) SoC */
+#define CRUm_S_TIMCTL			0x41c
+#define CRUm_S_TIMCTL_S_HSSETTLECTL(x)	((x) << 8)
+
+#define CRUm_S_DPHYCTL_MSB		0x434
+#define CRUm_S_DPHYCTL_MSB_DESKEW	BIT(1)
+
+#define CRUm_SWAPCTL			0x438
+
 #define VSRSTS_RETRIES			20
 
 #define RZG2L_CSI2_MIN_WIDTH		320
@@ -140,6 +149,30 @@ struct rzg2l_csi2_timings {
 	u32 max_hsfreq;
 };
 
+struct rzv2h_csi2_s_hssettlectl {
+	unsigned int hsfreq;
+	u16 s_hssettlectl;
+};
+
+static const struct rzv2h_csi2_s_hssettlectl rzv2h_s_hssettlectl[] = {
+	{   90,  1 }, {  130,  2 }, {  180,  3 },
+	{  220,  4 }, {  270,  5 }, {  310,  6 },
+	{  360,  7 }, {  400,  8 }, {  450,  9 },
+	{  490, 10 }, {  540, 11 }, {  580, 12 },
+	{  630, 13 }, {  670, 14 }, {  720, 15 },
+	{  760, 16 }, {  810, 17 }, {  850, 18 },
+	{  900, 19 }, {  940, 20 }, {  990, 21 },
+	{ 1030, 22 }, { 1080, 23 }, { 1120, 24 },
+	{ 1170, 25 }, { 1220, 26 }, { 1260, 27 },
+	{ 1310, 28 }, { 1350, 29 }, { 1400, 30 },
+	{ 1440, 31 }, { 1490, 32 }, { 1530, 33 },
+	{ 1580, 34 }, { 1620, 35 }, { 1670, 36 },
+	{ 1710, 37 }, { 1760, 38 }, { 1800, 39 },
+	{ 1850, 40 }, { 1890, 41 }, { 1940, 42 },
+	{ 1980, 43 }, { 2030, 44 }, { 2070, 45 },
+	{ 2100, 46 },
+};
+
 static const struct rzg2l_csi2_timings rzg2l_csi2_global_timings[] = {
 	{
 		.max_hsfreq = 80,
@@ -434,6 +467,64 @@ static int rzg2l_csi2_mipi_link_disable(struct rzg2l_csi2 *csi2)
 	return 0;
 }
 
+static int rzv2h_csi2_dphy_disable(struct rzg2l_csi2 *csi2)
+{
+	int ret;
+
+	/* Reset the CRU (D-PHY) */
+	ret = reset_control_assert(csi2->cmn_rstb);
+	if (ret)
+		return ret;
+
+	csi2->dphy_enabled = false;
+
+	return 0;
+}
+
+static int rzv2h_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
+{
+	unsigned int i;
+	u16 hssettle;
+	int mbps;
+
+	mbps = rzg2l_csi2_calc_mbps(csi2);
+	if (mbps < 0)
+		return mbps;
+
+	csi2->hsfreq = mbps;
+
+	for (i = 0; i < ARRAY_SIZE(rzv2h_s_hssettlectl); i++) {
+		if (csi2->hsfreq <= rzv2h_s_hssettlectl[i].hsfreq)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(rzv2h_s_hssettlectl))
+		return -EINVAL;
+
+	rzg2l_csi2_write(csi2, CRUm_SWAPCTL, 0);
+
+	hssettle = rzv2h_s_hssettlectl[i].s_hssettlectl;
+	rzg2l_csi2_write(csi2, CRUm_S_TIMCTL,
+			 CRUm_S_TIMCTL_S_HSSETTLECTL(hssettle));
+
+	if (csi2->hsfreq > 1500)
+		rzg2l_csi2_set(csi2, CRUm_S_DPHYCTL_MSB,
+			       CRUm_S_DPHYCTL_MSB_DESKEW);
+	else
+		rzg2l_csi2_clr(csi2, CRUm_S_DPHYCTL_MSB,
+			       CRUm_S_DPHYCTL_MSB_DESKEW);
+
+	csi2->dphy_enabled = true;
+
+	return 0;
+}
+
+static const struct rzg2l_csi2_info rzv2h_csi2_info = {
+	.dphy_enable = rzv2h_csi2_dphy_enable,
+	.dphy_disable = rzv2h_csi2_dphy_disable,
+	.has_system_clk = false,
+};
+
 static int rzg2l_csi2_mipi_link_setting(struct v4l2_subdev *sd, bool on)
 {
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
@@ -910,6 +1001,10 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
+	{
+		.compatible = "renesas,r9a09g057-csi2",
+		.data = &rzv2h_csi2_info,
+	},
 	{
 		.compatible = "renesas,rzg2l-csi2",
 		.data = &rzg2l_csi2_info,
-- 
2.43.0


