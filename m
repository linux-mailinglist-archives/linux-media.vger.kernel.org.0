Return-Path: <linux-media+bounces-25507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C103A244CD
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5DE91643A3
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252811F63EC;
	Fri, 31 Jan 2025 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZekVgyG8"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DCA1F63DF;
	Fri, 31 Jan 2025 21:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359298; cv=fail; b=M/NUwnOOMF6ZiybkLnPoOF9n5yDrjWgCPHuj2dwDcYtdS2DUGgvhK5AcoVjUPEC1K20yDSfrOMLd1eoAP19YkunqQAZzdPTtZifGkV+MIm8uo4dCPFzALy4P/8ZwUuENpBEl2SAY3aHY4lJysxudRhvp5cb/16Pa6rotMsQUcoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359298; c=relaxed/simple;
	bh=CPvDy3Ge2QOQh4jJmGCEfP1PLWvtY8UqiifcOnps5gU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=grKYjALU+6oWCJSjeP3o/AnHmbdndyzFaB0XIz5DkXqGJsQLnU4I4DnLTkXDAcku8m3ICbCyaY1VxM3H4wBkNeRp3TmwQEzoM3WmbPrZ1a0k2Cf9Ot4CqUb3D/TLZjtBRrSszTjHZ3qGpouSoidnGUgT0/D1XBsXnnDFVgvpOe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZekVgyG8; arc=fail smtp.client-ip=52.101.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmjNuB5vRbMXOAYxMRaY/gskHFZZX/4E4/FhAGDhHPX4hEZBX4B6Wa7gY0LNJpZLfLmI3mIjEHCxYXGg6BHQXM4qzBl7Ll0fIJ10eyAya4BtEI2mAT15cnYBQbBylGzEZsPpyTc0f0j0DW6+ZfvAkmhTxfGtSu8uupfMmPY/BXuHrSgYYDglhQIb/FYOQM9hciV29dy07sU2uOx3UGhsJfLTayjetJ7gmYSH6/9gy8aCaXaPFiKXlyNA9vvOqKtXNcb1c/x0raQtpgKcK/yeiPqhNAo2TBm/yLKTJW/MsWctqWzV1EdIJDFuWzZfM7yELQAamyZXFsArTL1ERQcX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HSKfbaLEraRA+Gx53ZKU1HqU557OEjqeB1wIjDieYo=;
 b=sbhKgYCYWKE9NG/yJBjDMrIGozwzsedCxX3EeLe2nBxOSir56JbSzZlkHRaYVe4gWXFvv0YH1TzpgPkNcu8F6x1NPC4BbOfxsUCsxtj9dBXKD9QoKVSv/FqsKUimyCHs+4mZ2gWi40rSkXYlwNsqFE0rhrjt4vlixCe8sWoDKMAAZVgnRE44d62hRDz2MY/UXf5gRbs1Fwm7yRrq3mpG2C/J163oKmGBOI07qCrB5Nq4a5DG1+ApOD7iAZFyL4KzoHtT+1BgQlb8Shs2LAJKAQF69Oun1P0LraA+0axZI0/7a/CTS4fEeS/pXwjrv0TD+Lgn+7TIR2a0pBJe69ESPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HSKfbaLEraRA+Gx53ZKU1HqU557OEjqeB1wIjDieYo=;
 b=ZekVgyG81A/8yY1cxUQO03Sv8ZjINWeBLIsrVdzCeUfQmStynVa43xc+vi0AIsVvejCywk/glVCxbIx2Yots8A55o37IaZs7/3oDaBe/Omay0nQDSD5NM1aVTl63Hsccs63EMe9maTyTAoeqFOtw3R8+/8rrpDH8bmhLe3UFaK2u8D9akzXERzJCLpfoF6JGDEL5Duye8ulapDj2+uVaSt81KOeqh8nW3zsbFE/otaph2hb1v7bGHkOVUF8fM62bnGl2D801RhWgEMu7ngWTl5cosoVy0njTzU3mNyTWYdfq2Spg4BsG0MDulm9n4fLzX1iJCYa7IubboWp7RCPNcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:53 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:53 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:54 -0500
Subject: [PATCH 09/14] media: imx8mq-mipi-csi2: Add imx8mq_plat_data for
 different compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-9-319402ab606a@nxp.com>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
In-Reply-To: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=4259;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=CXhxbITFSLWBmd22rrPhYJoChgSX254KvnZOLWQTyXQ=;
 b=QwiRZ5xBjXOIeB0M3FdlWsSAu/utg+3PXTgjI6yiqEtUsY+48Sgme8kpwRY8Yh2vdNk6UwAdZ
 WJKSbL2QeSgBr5ktJn78du06BZWd5tTjLxOXqERA3q+70t2PcYVIzSp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5f3fb6-e052-4acc-fa14-08dd423f1987
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?alBhY2w2UTVTdzU5MGpkNktHQnhEQzJITjEwNFhTbkRGU3EzbFJGT3dia3dY?=
 =?utf-8?B?clJOenRTWDVRUGJOYm1XV3RENFhSeUhhajVPK285aHhoWGhmeXFLYnZXSWdw?=
 =?utf-8?B?eHZSTWoyMUNNaElGVzNOc2QvYU9hTVVPWUJtajliYW9wMTlXbW9QTVl3cGh1?=
 =?utf-8?B?UnowRFRFdFRpVXMxNGhaQWtUdk9nWVNSMjRPaUpwVG5uNzJTRGhsYm9UQ2d2?=
 =?utf-8?B?N0cyVUMzYzBFOWIvWU9mYWllTVJnVlYxOEpWQVNmejg1SzZaQ1pQZGw4SjZl?=
 =?utf-8?B?NGpqQkF0QUV6b1NDZXM5MlhNbGpmMDhBV2dINTdkV3A4cVVRVCtiTWRJcU1t?=
 =?utf-8?B?b0JYM1RlcHFWRktiVk9DNno4T3dsanlkbE5VN1Zrc29SVHk3MHE3SnB2enlP?=
 =?utf-8?B?KzllaHVhQU0ycWdPL29vRHZ5aDg3UmlpYm81S3VWUkhQcFJ3dlh1SG00SjFN?=
 =?utf-8?B?YjVRYUpkM1FDSjFOM0piK3Z0NkRTK1hUV0hOem5LbnpTQzEwQnZNZjd6THQ4?=
 =?utf-8?B?b2VJWWRMTEtuRithM2dNeS9GWERycnowMVFXVmZzdEF1V2pYeWJ6QnJVMDdJ?=
 =?utf-8?B?THAwNkpvOUw1S1N3NVYrc3gwRVRZVHU2SG9WRWZ5QWdWVjRhODhqb1VvZjRE?=
 =?utf-8?B?aWM4citzWG5sSnNyKzM5TUdaVmFJU2krYndERFZBaUlPcFIvR3Y0SUV6Mk9I?=
 =?utf-8?B?ajQxV3YvdThPdkZmamtTUmtiVGF6M3VjWmhWdzJzaUpBN1Z4NW02Q25WWFc0?=
 =?utf-8?B?UjduSE1teEJTYTkvWmxIbG9FcDltcXZ6NHEvV2lhRFhFdGJWTlgwSjdxL1di?=
 =?utf-8?B?UEJ3amdtRDBPdHNpb05XYytlVHBwd2JSRVVwaVFLek9IVk96SWhYNERBWFFw?=
 =?utf-8?B?R3hESjBsWmxvaU56bHNVcUJzc2FTZndmeWZ1UlVkVDBLeklwTXJNQk9uM1dr?=
 =?utf-8?B?b3l1Q1JXMmN1S2JLT2NxRzV2M3hDUll0NHZYdGEreWppeUxtNThDSUZER1lN?=
 =?utf-8?B?WFAvL21pZ2x5cittTDcrcEtMSGJMcUlDLzNSMzhWdUZTTXE3anhlTEUrVlRz?=
 =?utf-8?B?NFhZTVRkMGE0TFIxRWV6NWdGTEMxVzhnK3ZGNmt6eDd2aDVlZWNHbXkyQ3dR?=
 =?utf-8?B?VzN0MlorTk9xVnE0NHNkT3hzbEdsSDladVFic0dYclpIb0Y4OVF6dFUyZ1Bs?=
 =?utf-8?B?Z25DLzVVWmQ1VG02ZmhqWi9xVUxvK2FjVW5PWXloQmpJNkF1NHczZHZYdEx5?=
 =?utf-8?B?ei9yV0xQd2hUY2UwZ0RINWF1ZklwcEpRZVBLczdDR1JGQzUxSTMwVjF4T2Y1?=
 =?utf-8?B?S2NkUmNieXdETkN4MG8ya2ZsZHpuUWVNaUg1Q2hqY0hnaW40YlZkWmtGVU5j?=
 =?utf-8?B?R0FQZUtlMnlzU0VPcVp5MG44VnJvaHpJSWVZdUd4TjJURXUyeDVjbWUvdnBQ?=
 =?utf-8?B?VUU4NUpJK2w5TlVCQ2U2OFZBUjgrSUFtdWxwU3dJVVlMUnRua2Y3MW03OHR2?=
 =?utf-8?B?Y2ZFZUpFc3R4WmpEeGUyU2JVK0lLeVJKT3pTbjB3Z0pJV2s0V1NiSWNOVi83?=
 =?utf-8?B?MlU4bFF3bXo5MGZtWW56WDZGZHJub2pjMjZLZnRJNTRxdUVDYVg2V0xneXFi?=
 =?utf-8?B?VTZuVU9HU2wyOWtRWmhDSkF3TkhuakNuNHJXWFRMSjI0RzhnWU9vVVlaWXBX?=
 =?utf-8?B?SUpXOU9KaDhCc2JTQWc4SWlxR3lqclhxSFRyU2xQQjkwMjBldEVZRTNuTlNw?=
 =?utf-8?B?MEF3di9sR0llRXhzRUVzc0w2UWcvblBTZ1FERS9mbXVaNlg0S2JQa09JMVVL?=
 =?utf-8?B?U2xSR3JqSUswbVo0MEgyMjVvUjFzOXA4MTRpZmw4eUl5OTZxT2NrWjVicXlK?=
 =?utf-8?B?TDhrTjYydloxYmJOL0ZOdEFZcHBQRUV0Z0ZjL2gvUWNpRWoxc0RzQmxla2Qr?=
 =?utf-8?B?ZWZuV3I4dFRFZko1WkFpTW0yWjZmLzB3WGxiY3pHdXQ2ZzA2ampINFEyaWlz?=
 =?utf-8?B?N2hJRnZMcFVnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WU5HeGZtbFZCTWQ4aEpqUC83TXNXenNMandvaG9hZU1pMUNYN0tmVWRFRU9i?=
 =?utf-8?B?ZU1FYmFUNU9qa2hraUw3SXMyRjVRNmpLZC81eVN3VkFpcUJQN2VKSm5CU0hJ?=
 =?utf-8?B?SDlRcjdLdUF2cWwvaXZYMHJWcG9XNWVENTcwNkZvbmlBM1pGUkdJWUljemNs?=
 =?utf-8?B?d1JvSUY4SjRUUEIzRTJFb0xXTjhJclNKaUFPQXlqaWRmblo3aWJnVStyRmkz?=
 =?utf-8?B?Vm0xN2dNMWM2WkpicDNPUEU3Q20rMlAra2xiTEI3K0FZdjJkL01ScUw5VUxK?=
 =?utf-8?B?cFF1N0RnenZnWVlBamJScmVLcmROSFF3dkNGY2lDVFcyQ2VrOVNtOWNHdVRS?=
 =?utf-8?B?U2lNSGhjakQ0Z0NBbFpRMjFIZEREOVV6emZlTXptWStLWGdhTjBaWHlEM25O?=
 =?utf-8?B?RzQzTTJvSnBtem80MXNicDJKamhlZEtYdi9hSnhhRTJKa0w3TlNFZGZMazc3?=
 =?utf-8?B?UkNPa1F3NXVEV2hJRU5NdXUzUHAyczJadlFGRDBnZzhVVUtSeTIyUGFET3dO?=
 =?utf-8?B?UWQ1ODdPS1FPTm9iYnVacklqNXFKQkdLWXE0a0NCdTNWKzBUY0N6RUhMSHAw?=
 =?utf-8?B?Ym1WdElnQks0TUJlOGg5aStXczlTYWdhQVk2Ui9WUHl1TVdzMk1ZTENNWWdR?=
 =?utf-8?B?eS8xbDAzZXZCK3RmTTU1RWE3cDdSL2ZzKyt3TDg3MnFMLy9VT092NEIzbFBh?=
 =?utf-8?B?bmFIcEp6SldHSEZERHIxVi92UW9HR0lnZkIwemwyQ25vSEZYUlJ6aFhwbjRU?=
 =?utf-8?B?dFE4RzgxT0lCL0kwNHgzT3FwV2x6NVZQTmJ5WkFGNVAyeUNvNi8xa3pMWkhp?=
 =?utf-8?B?K0R1L1AycmZFU3Q2NzdvZW9FRlJ2UWZhLzhqbllnLzRWMlIxZFFpcGQ2SmZk?=
 =?utf-8?B?VFJvcmM5VFlWbzZZQ29UYTRlZG9uTVBFQm04akNKcDZsWThPZkQzVkhQNWlp?=
 =?utf-8?B?bU9MR1gyVGM2UzVPazllOW9tSjhSV2U0OXJPTEZGOTRxWm1semw5c1BQQzB5?=
 =?utf-8?B?bFJ2cTlqN3VHdU13Nzl4dUpxQzNSb0NoV0lYbFJvS3lDNU5wNVcxQ3Q1T3dS?=
 =?utf-8?B?ZlFmNEl5WnZ6czRta2hobXlEYjg1SVVicEt1eUhpWUFMYlo0dkhJeC9jSVEv?=
 =?utf-8?B?VW4rN1k2YzdYVHJYcjZJWWxpMkxIN0RYSEEzbHhrS3FEVjRmOFA5ejhJUzMy?=
 =?utf-8?B?a2pqeXNtRjlKcW9VMzFQRnpLZ2k2NWFoWXpsWWpQeHkvd1JQOTk4RGU0L08r?=
 =?utf-8?B?VG0wMEt3ck1MbVJvZ1o5c0tMUU5zbVRkOGh2VnJCeEd4bGpWYWFNK3U1R1Bi?=
 =?utf-8?B?UHE4ZmN3RU1pbEVwUElZcS84THNXTnJlc1p3VDg5SURCQWUrZjVsTld2WWIy?=
 =?utf-8?B?SWVDWnFsZkZEUUZ0OWU2MUhLS2JiN1dtSUJJcGFGUkk1MVA1SUE0SE03WDBS?=
 =?utf-8?B?MFFBTXJsYjJPYVdZM3M5b1Z4WUZsb2lKTnd4L1MwdmZvS3Y5cEhOTlZCZXcy?=
 =?utf-8?B?ZHgxMEYxMW9GUFdld294WXdxSWxFZmo5ZmtldW1vMnRzSXVSODBrRzdqTDdS?=
 =?utf-8?B?WnpuaEsyOEU2ZUVEWTFWdktDNkpFVGhQanp4OFVjS3g2NWpiV2sxemxUS2hn?=
 =?utf-8?B?YTZzSlp6SmRRWUVRdFYwUjJ5alBQVFF0K3NqWTY1RjZGc3FBNDRiYnNrTDc3?=
 =?utf-8?B?dkNDVjhtK0NpYXVWeHRONzRVcUM3UGM2Z29VR2hiY1VFaWh3WDZ0Yzl1blBJ?=
 =?utf-8?B?djZObDZhVkx5Um5kS1JmWEZJSWE5TWdCTlVJbEF6YTFSaVdOUzhwSXJNRGVy?=
 =?utf-8?B?S1FOeUFvekJESjVkVDhuOGphVTEyT1BwVWJxWlk1RHo2S2tNa09BVWlTeHNq?=
 =?utf-8?B?WnR0dW1rdDlwMDFxcHVJU3B3Ly9SZjloYURjYU1TejZ5dlNveHNrZFFqQVRQ?=
 =?utf-8?B?MzVvNU9sUTU3bnUvT0g1KzZibnB0ODFLZHpkdGhLRzFIS2t6YWpxYy9hMHNM?=
 =?utf-8?B?NUhVQmJpUFhHOGdsVU1xS2ZXWHFOYnlDRUIvSGNCZlUvVXhVVmlRMmo3UWdR?=
 =?utf-8?B?S1BRSnR1NSt3c3ZEU1VRbzBYSzEzYkliMG1manQvdElCWFl3VCtCOE43dGE3?=
 =?utf-8?Q?M8cQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5f3fb6-e052-4acc-fa14-08dd423f1987
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:53.6653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2AobA3VjC2u+SZhJzLJayziPaM/uPQQ0REIjiIJCcKEYaU7aKCWII40jsk8bisvElexlfBkrh08J4QwGno3zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Introduce `imx8mq_plat_data` along with enable/disable callback operations
to facilitate support for new chips. No functional changes.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Reviewed-by: Robby Cai <robby.cai@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 60 ++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 1f2657cf6e824..b5eae56d92f49 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -62,6 +62,8 @@
 #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL	0x188
 #define CSI2RX_CFG_DISABLE_PAYLOAD_1		0x130
 
+struct csi_state;
+
 enum {
 	ST_POWERED	= 1,
 	ST_STREAMING	= 2,
@@ -83,11 +85,11 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 
 #define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
 
-#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
-#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
-#define	GPR_CSI2_1_HSEL			BIT(10)
-#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
-#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
+struct imx8mq_plat_data {
+	const char *name;
+	int (*enable)(struct csi_state *state, u32 hs_settle);
+	void (*disable)(struct csi_state *state);
+};
 
 /*
  * The send level configures the number of entries that must accumulate in
@@ -106,6 +108,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
 
 struct csi_state {
 	struct device *dev;
+	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
 	struct clk_bulk_data clks[CSI2_NUM_CLKS];
 	struct reset_control *rst;
@@ -137,6 +140,35 @@ struct csi2_pix_format {
 	u8 width;
 };
 
+/* -----------------------------------------------------------------------------
+ * i.MX8MQ GPR
+ */
+
+#define	GPR_CSI2_1_RX_ENABLE		BIT(13)
+#define	GPR_CSI2_1_VID_INTFC_ENB	BIT(12)
+#define	GPR_CSI2_1_HSEL			BIT(10)
+#define	GPR_CSI2_1_CONT_CLK_MODE	BIT(8)
+#define	GPR_CSI2_1_S_PRG_RXHS_SETTLE(x)	(((x) & 0x3f) << 2)
+
+static int imx8mq_gpr_enable(struct csi_state *state, u32 hs_settle)
+{
+	regmap_update_bits(state->phy_gpr,
+			   state->phy_gpr_reg,
+			   0x3fff,
+			   GPR_CSI2_1_RX_ENABLE |
+			   GPR_CSI2_1_VID_INTFC_ENB |
+			   GPR_CSI2_1_HSEL |
+			   GPR_CSI2_1_CONT_CLK_MODE |
+			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
+
+	return 0;
+}
+
+static const struct imx8mq_plat_data imx8mq_data = {
+	.name = "i.MX8MQ",
+	.enable = imx8mq_gpr_enable,
+};
+
 static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -364,14 +396,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
 	if (ret)
 		return ret;
 
-	regmap_update_bits(state->phy_gpr,
-			   state->phy_gpr_reg,
-			   0x3fff,
-			   GPR_CSI2_1_RX_ENABLE |
-			   GPR_CSI2_1_VID_INTFC_ENB |
-			   GPR_CSI2_1_HSEL |
-			   GPR_CSI2_1_CONT_CLK_MODE |
-			   GPR_CSI2_1_S_PRG_RXHS_SETTLE(hs_settle));
+	ret = state->pdata->enable(state, hs_settle);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -379,6 +406,9 @@ static int imx8mq_mipi_csi_start_stream(struct csi_state *state,
 static void imx8mq_mipi_csi_stop_stream(struct csi_state *state)
 {
 	imx8mq_mipi_csi_write(state, CSI2RX_CFG_DISABLE_DATA_LANES, 0xf);
+
+	if (state->pdata->disable)
+		state->pdata->disable(state);
 }
 
 /* -----------------------------------------------------------------------------
@@ -869,6 +899,8 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 	state->dev = dev;
 
+	state->pdata = of_device_get_match_data(dev);
+
 	ret = imx8mq_mipi_csi_parse_dt(state);
 	if (ret < 0) {
 		dev_err(dev, "Failed to parse device tree: %d\n", ret);
@@ -946,7 +978,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
-	{ .compatible = "fsl,imx8mq-mipi-csi2", },
+	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


