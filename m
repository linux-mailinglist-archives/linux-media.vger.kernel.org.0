Return-Path: <linux-media+bounces-29879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4CA83C3C
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28107440EEC
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22C12054F6;
	Thu, 10 Apr 2025 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="n47tIC77"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4611E5B9D;
	Thu, 10 Apr 2025 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272825; cv=fail; b=I735Lt/Uguc/IOghyLvRpmHPz0RUbP2VnR38Pr4kJ5pHvLCKafKzMN8YTF9mMkSMLuqlUIUUNIS5DPMJK2MidzMocc33l1f4maL7pp/IFAtQAQdV03/R26Kj1Aauc6oCRiyE5nYEryhCVRGRb8BlB9GJsCrcE6KvpSGxDkeKHLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272825; c=relaxed/simple;
	bh=GwC/pnvXfePMeOSqvF7zTcSuX9PSb4MHw0m9fpN4+AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dZu+CCFiMzoXpmpspS4Ab7eLqkFsPAxu4qUO9CytuXz4+VhOWkwFyqZO/W4Bp18AUEsfpDWuyajkV684vO05CqAfCkXWhzpCrs8XpUq/7t7IPg1qM/zMAlFngw+a9eWoRmHos659LNlL3LBqA+39I4hBC3GaElbtl208NXBThq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=n47tIC77; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKQ3YIbsrkH+V+YfY32f2b1oYwITUgaeN5bnCQ8NRJdlv9gVvQYnEzoak+LPOw2P0cXMrjbmFMzQLbwrXDp0AkyIJANuq3aFT6EjHo6EyN1J6YvWH03de2bEXW3HvyJyV+tcutQT9faD3BbfeAjdd/RirkaBPmki9t+BU6Acy/kYeggp1qBoCQBXCuFofNNMrKqFvON8Tlljp0CjYGOKq1qrHocI3ySlOUuRJngwl8cOCGm05yXkutSdCcvPPU5wYvxii26YIx2ycbm/aQEbBiwFMInsw8EamE9LBd75c+K5Y3SHydKIsxCz+XtGKCwdSUum0vF20Ozw67L8yi+bog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+sJ/VKw9i+wYzK6ThZ2MwoL2lHU0JgBemf00RHc+9E=;
 b=mA+cSakRlzWA37IVSVLwLtwcZ+WCZyzEt7oYfsr0GLOlInToZ3QTBiOmmXjX/LW0KR926DKfzB18eS0k/ByR57+B/OXsgMsuynCGtR02Iln5lZfizc3EgG7AkT7aJKHfviiPbxPPlXOnOawWwtD1Hx27KVIYPP+oRWvl3bvKQCiMtqJTVylXcvUdSYGURkxa9zcn5QSlvjTTwVYzur6LhT3yI1IVexNivCMycCaS7XY5f3y18kecavNS6Ewj1pcKgRByfJMvUJFp+Q3eCMfdan4gQa7aT6AO++zZMHLB3R6eTsT/EFtGPlhvGjzMpzwgvmB3feAl6WsKqDa+HkWoXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+sJ/VKw9i+wYzK6ThZ2MwoL2lHU0JgBemf00RHc+9E=;
 b=n47tIC77k/jmBiBnBuUbKr+yhcA7w+4SMpOKQhtBq2sbuDAhDT7O71FbOxv2Aokwk9dB5+GcQ7XURFmh0xvgVLHWgrrRXlB2PFoX4MyaIbGxcv68SxlXDCH6M2pPvHHmz+bO8XmBWolEtPbEZyfd9QhOjDs7m0lXN3DJMLyLEHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB10119.jpnprd01.prod.outlook.com (2603:1096:400:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 08:13:37 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:13:37 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
Date: Thu, 10 Apr 2025 10:12:05 +0200
Message-ID: <20250410081300.3133959-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB10119:EE_
X-MS-Office365-Filtering-Correlation-Id: deff0415-f2a8-4716-4184-08dd7807982b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LvfUxMFXOu+kNuci9EQta9/velWbgY9HFVCe3tqNBFfVYwns5CAsccJoVPBY?=
 =?us-ascii?Q?pAxZgmH57WfNPIWy+vEdI3QnK/FxfGn6RxYqVMTbt3QjhL7gxePvKOsp9Rwh?=
 =?us-ascii?Q?P1rTQKq54A+w/OxljvSMZKCJOFjnwTs7D6vozcbSBvSjAFJ9gkJmlQMZ2C2r?=
 =?us-ascii?Q?4ZaDFTQAtWiMivAAP71XMQpr8kUIZAi5LTxt8zaRAPYGmAg+VlnS0CMU3Nvq?=
 =?us-ascii?Q?okfUonA6hmZRPYiXrVDlypUBbKDbPpL4tMCIr2NTERHpqYXVleHm+pFMqCMN?=
 =?us-ascii?Q?idbLeQPh6A1EdNzUUalAN0ELdaBxakB9SCCoU4qzwlKYZD3EXZSGNTFRXRJl?=
 =?us-ascii?Q?A3b4rzyN/+wRA7PkvJszzmw52P+e5qMy6rLNuCch8nW8vSv4HRCk2m+gDyb2?=
 =?us-ascii?Q?PLu/Kc9gnxMrqEM4BevZ2K2PK3ZeN7IlIXwRMnAnK0AlIU6wNbWQAYhh2qYN?=
 =?us-ascii?Q?jHraZTNBISGH+KqlzUPT3lH7TN3B2LK4gAprSl6wNHCNdQPi+33rZrhWFQgF?=
 =?us-ascii?Q?3joP5K1ViefvjSSqASA4VotHttB5J+u7SqMp4Ui0Cae5ggNyBXGXsLA3ysHv?=
 =?us-ascii?Q?vNAmVe++sZwPlCT2Bcv+B7h0MqStJRQ/TUNqq20qjSu7IPakERSPFKgtBOSn?=
 =?us-ascii?Q?tSBGhl2WojOrF1nB18RY0IJdu7MbM46U7FWGvaxczxguIRzr4rY0eXlj4koF?=
 =?us-ascii?Q?iGsqMs9XsNUmk47N5AnCWTBEIGgy4dOFJgSGeTgrAG3+J6Z7WhJJhkUbtR8/?=
 =?us-ascii?Q?z89s3fQnSU6UTusfMG3PzkqWU/wnPGeT5rQcj4CnCu1txc1fSJpDYCDIXuDA?=
 =?us-ascii?Q?ihi9qrcrxK1o6b/boWG4fvXd3W1ygqJg8JmxhjlT5zdtSbz7OcKFUAicKVfA?=
 =?us-ascii?Q?KWr0FcllSbcaS4y1e375TiYH8Zyk5Xgec2tJSQrctbDEzLMr7qnL8f4d7QXm?=
 =?us-ascii?Q?e/4uaEMnk/mJ7eXY3rx4xv3GgdbvF84KwGW8giTmDL+tyn4WYhBz/hyUWuCP?=
 =?us-ascii?Q?I5dbLI2Z2nxtMafd7ytM3y/fLGYAvSSURJRIvwuiebY7fDjfusE54HrUvI86?=
 =?us-ascii?Q?GnGBApXF+mPZXMcsR/l9+smc0jxZugqicqZksffdC761db4Rjn+bcvpbHJI2?=
 =?us-ascii?Q?Rs7jLHMMCEj6pLl5RjX0xRyzTBDWE3bHhTda1gFydQDcPTy/bUlFQfH0mO83?=
 =?us-ascii?Q?HnZveiTO56XUG4dUks+WC1g+DRi8cmbJ2GM7Be9SKcDD7qWNmBk8alYtlBEr?=
 =?us-ascii?Q?8JgfzTYLIC9ozCY946EtTyeWlCy3Q0ElGw3EqfBAk5F2626AsZrETkhMieZ3?=
 =?us-ascii?Q?626DBhbEUH4rToRhynUy6vvzf7Iir/7n850Sc4Dy/qFqV56OZ8BgOIB++lRD?=
 =?us-ascii?Q?laTHtiB9XPQpFm6yvkhOPCdzFitso6LI21z6QBobFuyjMINzjOpGZU9j2W1c?=
 =?us-ascii?Q?8Eu3EGQZYO0OIYTwBH1T501lW9+iNZmgSiSAmHUnEzoIdbaBppTWhQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MUEJnq54ziyf/3L3o7uKHsEe8abCa7AtzsIY32/8G3ZXkNqThuKo0x+yjUsT?=
 =?us-ascii?Q?EhoB/BT2lHohTFBPp2YyfFyb1LJlBRVmcoI3M0SITpUAPM86IzCwtS6WpWIq?=
 =?us-ascii?Q?IhCndcaQkahJabuuRB/ISP93zW4Sk9E4nlSo4hsWme04e9oMdDZBu7JSuTpg?=
 =?us-ascii?Q?zSt5sAlXj+UfnSPNvsmTj04eq2mI8bNLgRqVmzq+CcqQLobt2GCM3MISK/bH?=
 =?us-ascii?Q?3nUWK1kD8gXD84gz0qCOCFiPylvOd//2/oqyxBxuLo+YPZxy+FgVNCTvUdlt?=
 =?us-ascii?Q?Ykdpivw0HN5eLzUDewIe2GqChIRxhp7j27Nmqdb7pYIn8H7SdmYLXD3mEhlG?=
 =?us-ascii?Q?1q9S/x2pT7L0yU3s8cQXZp+U6ETmMaoPY809BTekIZ3asIZOcmGA5eS1E9We?=
 =?us-ascii?Q?C9soPnZT39b4NCXbJJKpyi3kEnCnFt+WWv+YgZmuaQgLlf96TJwcGgAkrO7Y?=
 =?us-ascii?Q?YlpwxaK9BXruHzmEF2meiKH4BeN3+JGmyvlve9eMHh6l9Y/JhRkMXNME6Fo7?=
 =?us-ascii?Q?p0GvfpdgH2bYVHlhozDy07pUHXmuENlgciRTMYC/rPOpoqtUWsCtvXrZkLMt?=
 =?us-ascii?Q?6yMts3x216wn4xRFVc3i5Uj+2U9nQ2FyHCDLTc/7kmEgZB8CDivOMMqG1mcE?=
 =?us-ascii?Q?l1KDTFpRrWuB/zeHD5c5w2wBd4aWwPn8TOQ1JzDBcDINTft6mmSZB9O4PB47?=
 =?us-ascii?Q?m3XXTZgX0YF95+RYnSB1dMfGemEDpwEXrhoWwi4dPbQ1/WAVtsDRzI6jZGnd?=
 =?us-ascii?Q?mE5785E4GW5484pZaynVYG0U04JrekWLMsHegwxOdvvCRMjagEG6FHZrK7pp?=
 =?us-ascii?Q?un75kZfuvNmGmxPBUrHj5POVIpb0QLNRXqrP6KqJidS6zRS3LQpB7rd4M8aN?=
 =?us-ascii?Q?DRQGNSDeeezaajKIOp3AJt76ESUwgvTsApjduvSnsCUGeDBSyAmuYs/rEWfI?=
 =?us-ascii?Q?L8fNT99gabCb4OfOHL93asjAaT5y4MAT1GXmAIsrorakAxomToP8nkvRmJit?=
 =?us-ascii?Q?bmR5agThaPBdagJ3annLL03Md1DA1cl2bdiUsglUuwMR1J35IoKPiB0AtWYN?=
 =?us-ascii?Q?YSnWaNEDJYHAookLKYX5EYrKVrEmHEFQtlKCEhbLCIt1EVUPPMAxr7qy9nBb?=
 =?us-ascii?Q?Z4YoZL3FCfq0q8AYfoCFxV3qWKrS2Fx31hKQL6VNvbPySe4obVDeJJIc0Rv2?=
 =?us-ascii?Q?3sMF9AqGPmQea8mFCcJnlTSIOOui6hABsODraHsE7j2rca+FukIO2FEmTM3u?=
 =?us-ascii?Q?0Tat6PyqLykEMx8gD2xqLH4cpBhf+Cu2VCq5H7tmdMo8KkvXepYfVLr1I5cR?=
 =?us-ascii?Q?JBlWhtfiH06HHDi/8DP3dJR7ovJO4x7n4xjQ2Bi8jHeOsSSznBSdtAc1yHm1?=
 =?us-ascii?Q?qxC3XcAidP2V7RxhaXnCnfG1prdplsASbFK4BsQhwQkwX43Kr543Jfz5S0zZ?=
 =?us-ascii?Q?T1Nx3BvTwaMF6tdkC8YKOiHPq7Nb1xOudJ/heXwER5wPGbYr+SJXExpfc+/4?=
 =?us-ascii?Q?K/23KFQewCsc6HFgO45RhzX1In5VvhhAvwhz6kXOl9g8ez2g762RYtpFGFWS?=
 =?us-ascii?Q?xVhuMycMm+JkaEKAyrTQHrPKMwUpOwuZpL3ri9vMizkn7kN/TnETEEINCiGD?=
 =?us-ascii?Q?6Qo6LUMdN6zJcgJBwYWO6Gk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deff0415-f2a8-4716-4184-08dd7807982b
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:13:37.3147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxfngj2xHhQviWI+knYUTlGDgeN6fITS15vMPtqlKo8SPt2erljWkp1VZtg/09wLpa1p5OkLT2uM7OTp5NIdEKd33ZndmRTMOtbSShZmoywA7dnRVmlLCwrDQJxeXByX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10119

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
found on the Renesas RZ/G2L SoC, with the following differences:
- A different D-PHY
- Additional registers for the MIPI CSI-2 link
- Only two clocks

Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Dropped empty line as suggested by LPinchart
 - Fixed minItems into else conditional block as suggested by RHerring

Changes since v2:
 - Collected tags
 - Fixed CRU_CMN_RSTB description as suggested by LPinchart

Changes since v3:
 - Fixed CRU_CMN_RSTB description as suggested by GUytterhoeven

 .../bindings/media/renesas,rzg2l-csi2.yaml    | 59 ++++++++++++++-----
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 7faa12fecd5bb..1f9ee37584b34 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -17,12 +17,14 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-csi2       # RZ/G2UL
-          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
-          - renesas,r9a07g054-csi2       # RZ/V2L
-      - const: renesas,rzg2l-csi2
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-csi2 # RZ/G2UL
+              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
+              - renesas,r9a07g054-csi2 # RZ/V2L
+          - const: renesas,rzg2l-csi2
+      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
     maxItems: 1
@@ -31,16 +33,24 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Internal clock for connecting CRU and MIPI
-      - description: CRU Main clock
-      - description: CRU Register access clock
+    oneOf:
+      - items:
+          - description: Internal clock for connecting CRU and MIPI
+          - description: CRU Main clock
+          - description: CRU Register access clock
+      - items:
+          - description: CRU Main clock
+          - description: CRU Register access clock
 
   clock-names:
-    items:
-      - const: system
-      - const: video
-      - const: apb
+    oneOf:
+      - items:
+          - const: system
+          - const: video
+          - const: apb
+      - items:
+          - const: video
+          - const: apb
 
   power-domains:
     maxItems: 1
@@ -48,7 +58,7 @@ properties:
   resets:
     items:
       - description: CRU_PRESETN reset terminal
-      - description: CRU_CMN_RSTB reset terminal
+      - description: D-PHY reset (CRU_CMN_RSTB or CRU_n_S_RESETN)
 
   reset-names:
     items:
@@ -101,6 +111,25 @@ required:
   - reset-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-csi2
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+    else:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


