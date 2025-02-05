Return-Path: <linux-media+bounces-25698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14976A29746
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 317A9164E28
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985701FDA73;
	Wed,  5 Feb 2025 17:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mV3RFyug"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BDE212B14;
	Wed,  5 Feb 2025 17:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738776008; cv=fail; b=uDS2n9FmaHLOs9S9Gl7Vu+/GDTZ3KantZWijzNKGznA3cVCDertZ6l/TnCMdru4fbzllGLQTkLEyX8RgyRGzAsuTLuNX9/54tbD6T5bUq3TdU8sDKwPcjpfpq8ZScm1/gKXLmaZByUUJC8YHt0JJ9qT7lKCXgwzqfOs3X85zZGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738776008; c=relaxed/simple;
	bh=LG41m58de84AgwucsEEId2TtxmqdhMB7W7wtNwcYBw0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hDR876X5p4IjPm6MPs++xM7UosKK99Opn6eqGfus8xTtJ1MHfYkbzGeYVmelAXaL8Rvhk90kydxyu2A5C0XDsktOehZyaONY8GDXAM5n/1RE3pNqNXMJOXd/6zFMrNEV5iYZb+udvcHCzYEjkdgu+oTQtV8ALlK2CizL18N45Eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mV3RFyug; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSgpKYnNM9o+YPmdALlWhlkKpMVrbYWa8L6/p0Y1+qh/eu8j+PpAWhOtX0s2WNcbkXDvBmnBBEF8gX0Bzuiw1EmUSzaD2ar0Zp+P7hBYJLEqZXX/QB/uW04PRBbFccm9d82pjG+DTZavp0fEuclt/XnmUJ4/nWZCaDcm6C7Nb48AOWTML3jJ9rEQAnzL/2wQY+zRWKGqeFf5MLg/w25VTVakW4sUCe/a/VpSO1YmdEBHhPxbMMMpreDPPVQmW6r+vfZSr+c9+NEaurJmjfzRLnXR1kIh2ulbCKZu1B7oUHlHsJRCm35T8GwDHIDVZj0LC0diQ06rmiqoSK8iuGMKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNcdgA+hFawXUvXNzz48NDxkUPDDNEvwr+mjWUv+5Ws=;
 b=hR3flmTpfY3uM3Y+1hhhmrXE2sPJbWq9CCB6vUxwvjKjAdQE6T+Tk/MpcloYQ0MdhrC6/OQ8qC4dMnfO+EyK2BC34awWnCiFSSChHI3Kw4cGB5rADKPzj2BChIVi0mrmt32RPKXDazY5cE+11ebBdiz+aJPRfeqKjfChesmYYE3lTxWgjgx9nfCDpgi+FOSSkFZjjqnXxdYIgXoVszA325ZWeUQqQnNA5m0eK4FuSBPl7ZYVPiIJsSwqLN+ZRtky/x1MixS68mPm2kWdARre1scMSlIySIEQuYE52VSycrBGGpWNyT6uFCGTWvojBFiIyPzKh6pZTQvIaZreiFW9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNcdgA+hFawXUvXNzz48NDxkUPDDNEvwr+mjWUv+5Ws=;
 b=mV3RFyugWzKDtYS3ekgKrH3BfNCxWLnCKMCAVAkW6xXOQAGoWLKhxllxMEb96+/DdDxM3c+v4TTHXahvuJg0BAHOl8FmirZjJ/gBj3r2ye83girY9ps3z7tAf8LVxJNHjyagpDnmoSKY6Ig02Cu7mWZnV4DfejcCV4nPoWzabzUGDjfyawRCj9r0m+qTv6W5loMKsoDSbDhOzHeaf+tX3wKF4NKlXE/aOmlN4hGrw2gRj6GZtWrI9rnc5PuIBP87IbWRDcviGHIDAZeoRK9IF9+UGriWM0UqneE2weAGTP+QEbxYRSnld5aoHQ989ucYTMHWPLbggGi5nmUJX8ks+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 17:20:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:20:03 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:22 -0500
Subject: [PATCH v2 13/14] arm64: dts: imx8q: add linux,cma node for
 imx8qm-mek and imx8qxp-mek
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-13-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=1608;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=LG41m58de84AgwucsEEId2TtxmqdhMB7W7wtNwcYBw0=;
 b=YtVlCJGd8BsU4jXWoINEfREs5S9B6o4nUu4wv32Lde8jWg2Esj1ACsAe+8UECf9tVS5zU7k0v
 QlQFYdUuwGiAyAjNiOQN8JwRWDK0RSlIvfQ4edURaeScUyFy5btx1HS
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 7453b8f8-42cf-42de-17ec-08dd460953d3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cUpTNjFuNWlZajU3NWl6ekRwbDYvK2d1bXA0L2Q2b01YbjBET0FHeEoxS3RQ?=
 =?utf-8?B?c1V6bjBpeHF2aGNWalE5cEVJQm8xYWhmWkZ3OVJHdWEzYzJ2ZGRnc0xEM3pU?=
 =?utf-8?B?QWZINE9zUitwa2pqTlNQT0syZ2VMdDRQbXJMVUd2MHZkeXY5cFlaSGhQV1dE?=
 =?utf-8?B?THk5Qk9hQktRRWk1MkVYT1pxRmU3aXMycDNTYzdZNGgzbUFQdkNIWll2UVFu?=
 =?utf-8?B?VjliR2hISnM1SGJ6bnVBcTR6SFA2bUR0a1Vzd2ZDOGFkVTZuNUhqeXJ3RUxE?=
 =?utf-8?B?U2ZGbGFqOExVbDRsVmhNSWRrZU9ENHMvR3VVODY4M2dvNW04dXc3Qm1SbzY5?=
 =?utf-8?B?TUtNN0F2aEU4WTBpK3VuemFqbjUrNkJJOEpWK01NNW1ZVnU3Y0ZDZzZBNFpw?=
 =?utf-8?B?aXNpd25PaHVYVjA0aXJoZk5FaXdhdEFnM2F5THdoek9CUWVnN2JYajdUMHAx?=
 =?utf-8?B?WGUvblBGV1pGWkhTMTZZbnhiOXhKeHdhM2xpTWNvcHlvS1hXMTU4YjFBL20v?=
 =?utf-8?B?ZGFuSFpSUUhscHdOSzdNcXQydnJmR29JMXJHL1Z3WnIyNTBJcG1CWVJ1ZXVQ?=
 =?utf-8?B?Q1c1L3pDWjUyZm84aTMwZy9RUjQ4OEdUOFgvVzhHSnZ3VDhGd0dWUkd4Ylky?=
 =?utf-8?B?TTBDWEp2T0Ewb3N0N2tqRlNYOVZodXFmVDNNU1pnQWtOT1F1dExHcnhZQVF6?=
 =?utf-8?B?MmVXZjc3WVRzRlQxcHRGanBTMFdQck9HUjVTeSthUjhKbG9LYVc3Vmg4by9G?=
 =?utf-8?B?V1JoTHZSRkVQejVaQnlJRHkwNm05SlpKUjVCS3RxVndmQmJwWk9SY1A2NmQz?=
 =?utf-8?B?OHAzakcwVUlxL0lWODhhdnZuOVRxeWpnVjV5RDI1SGdTQlgxL0l3UmZaYlBz?=
 =?utf-8?B?QWtFcjFxMEFwZ0ZVNzQ0eG9LNGRiMy9wZ0F1TEhuZ1NPZ240ZzFOVUZVR0Q4?=
 =?utf-8?B?aFZmM3VBeGNlSmJ4eks1SFhoekJLWnBDcExoWHJlajZNcUFOWU5nNlBReTJo?=
 =?utf-8?B?R2xScEVLU0tGREoweTRwY3F5TEFVR3FFVHZNRC91UmNJd2xQZk9JUFVPS0ZZ?=
 =?utf-8?B?SHBUZGlsRUszTlhkVjFBSVZSNzVQZDFER1dkYzN1a1VTMHlDcnlGdjczMVdq?=
 =?utf-8?B?cktnMU5ZMndWSVE1K3JBZFZpbmVQdmViSnRTZ3gvQVJXeU1JRElyRXRINjUv?=
 =?utf-8?B?eTJGcFNRcUxWcTV5SWNnMGFOUXVhU0o0YXB6SCs0SHRqazFvUHVEZkN6WEZJ?=
 =?utf-8?B?TEhmbW9SZDVNMVFUN2JZa3p3SUVSVTFiNWZVMU1QWUY2d3Z3SDRPSko0bUF3?=
 =?utf-8?B?R3lvQkpBTVgzRDRMbXhCRWttR1VGZTVCNkVaeXlhbGNnTmwydXFpMHJ6K1hZ?=
 =?utf-8?B?eUs2UytNeWV0YzZ2Ti9kemtmUnYxeE9yaExISjhKM0xDc1lGY3hBajdQSXJy?=
 =?utf-8?B?VTIrL0d5VncrenRWeU1RUWN5ZktyUjQwdEtLY2xENmdOaG02ZWtVSkpUSUNF?=
 =?utf-8?B?SzFyYlRFK21UL003QUd5WGlEK1laT2RQektIbmI2emkvZEtFL3lJMXcyazBU?=
 =?utf-8?B?SnNJWXN2cnh4UnVKZEVXOWg3eDdLZ2p2WTU5MGMxN3htVzBKOEFiY3BEK0lF?=
 =?utf-8?B?SUVicm1aNGM3RG0yaVJoOGZ3Ky9rQlN1dDl2c2ZxbDJpUUczZTM2WmVwYnlt?=
 =?utf-8?B?aWlYSU1pdVNWOTJSMFZSWTVzSVZJWExPMmFjVUYwb0V4ZG5sUlJRQkgrcGZp?=
 =?utf-8?B?NUtmTWJOUGNNWTZFRjBWZ0ZmUXBGYlNGa3IvK2NaMGxyZERNcmpvbENzRjBZ?=
 =?utf-8?B?SVpTeURxK283bDhRZERuR3NaK2kwT2hNQjhPOGEwZlYwRWxicVdKa3I2VUZC?=
 =?utf-8?B?MmUxV29Na1hsMjFGT0dua1Fqd081Uyt4enMzVGg4V0JRU05wdTdSVXBEL3VJ?=
 =?utf-8?Q?j7g9iCMPTPprcR3Oh4oO35Tw9XjRQXZA?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VEJDTlRiRnBZZ1MwZGhaRmVJMitnV3dmUjUrOHZURTFNUWU4YzJVWGs5NUtC?=
 =?utf-8?B?bjN3M214a1NJelU0QWhEZ0QwVUQ0VkR4eTIvckk5V1pKcnpNb0Z6d1YzanZM?=
 =?utf-8?B?YkRrWXVhekhCQ1lTVFdWYWtyOGV4S2JNTmoyKzcyUmpFbnB1SUhBTlR1bXNZ?=
 =?utf-8?B?YjBSV1JRbTBlM0xINlFIa1N6NHp0UTJYM2pKcUl2Rm9XSThBb25PQnJQZStX?=
 =?utf-8?B?ckdqZDdqNlBQcDJ2U2MwbzVONUNuSGxQRitZMDk0SEtUVzBYVHdNRlZRV1Fa?=
 =?utf-8?B?eUJCRk5zWE83SDVNNmdQb1U1QkdJTjJJbE9VMlF6eCs2M0NLdDkzUE1ibGc3?=
 =?utf-8?B?UFNpYlozbXFkZG9NVUtnRzRMNmxNSTJCa3YzR3NrUjM0cFJUWVY5RUZGeEFE?=
 =?utf-8?B?SDNPQVl3M1ZXYkNSQ2d1MVFwUWpTZ3BTNmxrK3BzT29FS2lDRnJMdHI1SE8v?=
 =?utf-8?B?SERrenE0NTlqa1dwT1J6OVVtcm56aVBETzFDbVJ6SFh4UnU4Ylk5RTlSdUk4?=
 =?utf-8?B?NTcvV1lhY2xOWGZINDB4a3pMa0xORHpnZ1NPL2tNb2plV1lmcFlIOGVkZWV1?=
 =?utf-8?B?Q0xsa0h5R1RINmVRa0wweisyVXJVOHhuQUowcGdXSzNSa2lmS2JrNHptTTJ2?=
 =?utf-8?B?VTd3ZFNnd0JyMkdQK2ZEU2FwWVJLQk5jYURseUZ4SWlkVmxBNDdBeldHV1E0?=
 =?utf-8?B?TzV4R3JMMG05ajZHMmlzeU55OE1GYXdjOGVUQlZmOWhBRnIrNmFWV3NPTXU3?=
 =?utf-8?B?bllQektxT0F0MElMT0lxYkNLQndwbURzR2hTcVpCY2lydVdYMVVpSDNuZ0dG?=
 =?utf-8?B?ZlQwaEw0WkFXeEFRc21mbjBHTHVPR0Q3dWhZekRKWXNLcXB3VmpsOFlRVmp5?=
 =?utf-8?B?Q1pJN0Y4QVFlQnkzN3lzRDYzTWlXc3pMVnNGTnNWb3YxV0g3eTJTVHZhR3hj?=
 =?utf-8?B?eEJNTWZkTHhmT0V1SEpCNE9TbXBGOWVrc3VrWFpOWjlZYlJTN0pRSmU0VGNo?=
 =?utf-8?B?dTllVlJlU3gyaFBiOFZiR0tma2w5bmhnSWNHSUEvMktBeW5uTkFiOEVRaDRW?=
 =?utf-8?B?WExaQ240QmxINmV5eTliZ0M3QU1pY24xT1B0TS9WVmVGTDBUQXhVd2F3NC9O?=
 =?utf-8?B?MXlTRTh1NlFEQnJ5QiswSnlFQWxYNUgzVnR3K29wZ2owU3U1NncvdFFDdXdR?=
 =?utf-8?B?ajNnSnpocGJVOVZoQnZFbEJmblFFNEhaSGFtdDZ3UHEvRkVyTVg5alJvMUlr?=
 =?utf-8?B?SXVraXZsbFZuemluT1RrWm5VakVXSHM2NzNuYkVraklEOHFINU9sd1YzNWdS?=
 =?utf-8?B?NlJJN0RRWnN2a1FOU3VHZ2JTR1B2N2xUckE5ZHh4MW5sRE40MWdhTm9CTGt4?=
 =?utf-8?B?UEkvM3NXbjh4bmN3eG1yZEIyeTB4Zmg2MHo5cUJIQkxMMC90RzdENkdEem0y?=
 =?utf-8?B?ejlTZ2ZxaGtiVnZjTmVXWlZITDlmTTFGOU5Md0FBQStSalJqbTRiaUY3ZUVB?=
 =?utf-8?B?VkI4MGNkNkxGRUJlQkJOZXFoMmp4SVg0Q2R0T2tTVHRnOTdHcEpwL2E0aFJQ?=
 =?utf-8?B?enFkeGNSN3BMR3VNZTNCcmFqb2dXbjhtVUZtS0M5VW5pemdINWZvMmhXRzNo?=
 =?utf-8?B?WmtpeHRCc1Q3amVpa0pqbDgzV1VZV2o0c0RFc0dEV2tFSFVWWDBHcGlzNEYr?=
 =?utf-8?B?SEZiYlcwcHpTb2JCNUFyVlh2VXZvWXNjU3h5STJqMFpjZEp4VnNpeWwzckFM?=
 =?utf-8?B?ejZXZk9ucjhISEtmck1mT2ZuUmZxVElHR1dyVTBHc3BqQ1d1VllvN0xkUnNq?=
 =?utf-8?B?NUJ4R1RJNTM5VlR3RUxGYTNtZEpIUGU3YmlkOXFUSmNTQTd4NG1xeGJqTkYw?=
 =?utf-8?B?ZktaSVArOG9qb25ocGtyRmgyMEZYRlJMeXNUcWNCWkdIclB5bkk0K0NrOGdY?=
 =?utf-8?B?cERGTVNsN2pEZXY2eTFNam5OcnRiSmp2MEJpQVdIdUtBWHozWFI4MnlHTnM1?=
 =?utf-8?B?OHd6Rnd5a1lDZTZEdldKRHJMb2VocEhpUFNITGFTeGk3VEVSNmVFVjE0M0Ur?=
 =?utf-8?B?ZDVEV1VqT08wRCtYanVYRUcrc1VyblpPVnZDQzUyWk1ESDk1dnRJZ2hIUXNv?=
 =?utf-8?Q?EPfaSK9dNyowvSKQ9tGl4QzDW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7453b8f8-42cf-42de-17ec-08dd460953d3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:20:03.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LczXWzrv7oYxla+GPBYJ73rWJX0GTzKuqQPq1wbf6iGqEJA5WBBPwV6DjKqQuMCNEgFUNvy7KD3RG7fG38Maqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

Add linux,cma node because some devices, such as camera, need big continue
physical memory.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- none
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 9 +++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 8 ++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 50fd3370f7dce..61ef00f4259e1 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -113,6 +113,15 @@ dsp_vdev0buffer: memory@94300000 {
 			reg = <0 0x94300000 0 0x100000>;
 			no-map;
 		};
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+			reusable;
+		};
 	};
 
 	lvds_backlight0: backlight-lvds0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index be79c793213a5..89c6516c5ba90 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -56,6 +56,14 @@ dsp_vdev0buffer: memory@94300000 {
 			reg = <0 0x94300000 0 0x100000>;
 			no-map;
 		};
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+			reusable;
+		};
 	};
 
 	reg_usdhc2_vmmc: usdhc2-vmmc {

-- 
2.34.1


