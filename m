Return-Path: <linux-media+bounces-40087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC69B29997
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBFDB7A134F
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C5E27057C;
	Mon, 18 Aug 2025 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lC/B0AcR"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FF61EEF9;
	Mon, 18 Aug 2025 06:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755498198; cv=fail; b=nRE/50YcZegREkt9BKmZdF3gilom1/574a5cwA10lEDXsWvHh1DFS2mGgGIq+86K0e+QnMIzttnjTMND5XCBioh7E5R5Ziixjf9/nQwsBZdtC6DmNYtD4c2w+GtjwT/XeNnngCvKl2eQ33b5Zgx9/GW1+GCWqmSEFdrVgCvehA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755498198; c=relaxed/simple;
	bh=mDm0M7XaGdMC5wpHMH3jITAuRThVnHI58yFcH3MYGLU=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=uI6+E2TuCeLRu++tgY/3CP0Cglnd8MRPe6ieEksum5bA5UBdy4WQSPgfRzX6HHuzOFqqZtXaigGXyJ9qmAKtfUmoegqHypgqtkm/JHypy3a2HS1cPd/Zs/seALnxRsV+iSBmfvjA4JLKVIyU7Wej9TsgGqHxLxls6c/YDyEaUjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lC/B0AcR; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcWq0aJ9Myr5WdNg3fpqdH9IIFJhSS8j/kgYATITs2fSH5JbfbnHE4n+JrUoa4ni1WlfDBuDlEVAhBYw5+RQlvTjfUSd+EsrJBE88dAV+zht5lkb0ULhZKhPtD0G60PySz8/dwDUwOu43JYaLE0iqPNkx40/+b6GuTMEl7Yng8JkKJlG0t95OdGZlgfWc2BOWb26g6n4iegUu17lQMnHo/qta2Glu6Kxc+HKYWwJ2+v4b8dpfmZUiWbIvG22Q+fKFjOXPZIcM7Km+7E4p8eZIUwbRKrbmUCcLCZ97i3vcePXLs1oIaX0OOMufdTOkiWSMqBPsvA6m5vBJgCU7UME+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNjEbK41JGkEYG0KbpRnz40yhQiueuBdwkvoALmZIco=;
 b=lOPhO0J9boW6KIa4B4zSiwH0U/eChgKjpfDHJnJt86232/uUKAwFqjkejAzeWDN8CsrlzW3XrO3xo0MpiCJthkPICylsLYuf1O94cBjZUuraQ+/GdaLkn3rxVlrjac7BZ9na7q+8huVcx+IPkQ2iRb5AnQnSKywnlTKI6Fnv5l6PXLAu3UhJEe0er6RU04pl0VLVVthDvXmyIETRWfa7L+RqhusftNjPCzhExH5ysrejb5MN1LF1D+GmaLaq9byxiXBIRFFb4zpBx3F9LkNO6Kieorlv42QlR1iTL1A+DAs0qpoUwJNdYZy5kjdjH0UuOKUYWtw42k+RYPnncG7tVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNjEbK41JGkEYG0KbpRnz40yhQiueuBdwkvoALmZIco=;
 b=lC/B0AcRDKOEyc82xmEwovmoaJT3ed6IO4lq8rc+6Udg0+pnaZea79fXLHK+ePWoNq+gmTGLJwSZ9yaQv46WbNfYG3Rkd7dPTezpF3D13DFnA2taWg+Y26O8nB3AGjdDXOlDcuRK+EKjAj2F8iHZzhSrt4tXlVjmDnukc5S2dHFnJHkYBIHLPe9ClARXlNAyVWPTYcQhek82nfmLQGcshfut2Dbx+MASTgJVay/b92PKiTR+h9h5p6lGPdm2A3Hr1hG+F0c6i733M8lYw/HDpVGUJyboLB91YlFuvjqkl45ezlLjo+ScNhUOQoas9Hf0mce2gyPphD7Nw4kz8YqprA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 06:23:10 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 06:23:10 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Mon, 18 Aug 2025 14:22:34 +0800
Subject: [PATCH] media: nxp: imx8-isi: Fix streamon/streamoff calls are
 imbalanced issue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-isi_m2m-v1-1-bbe2b774d4bf@nxp.com>
X-B4-Tracking: v=1; b=H4sIAKnGomgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0MLXaCK+FyjXN3EZFMjY2OLxFRLI1MloOqCotS0zAqwSdGxtbUAQ3w
 rhlkAAAA=
X-Change-ID: 20250818-isi_m2m-ac52338ae925
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: Christian Hemp <c.hemp@phytec.de>, Jacopo Mondi <jacopo@jmondi.org>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755498183; l=3797;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=mDm0M7XaGdMC5wpHMH3jITAuRThVnHI58yFcH3MYGLU=;
 b=zazTFBdNYc+j8tm65MvuOHSNR87FA2KMoHBRUp0SooqUKVUcDPa3Wko4CqRLDJLoXicwYspLY
 9ukdq77bcFeABF9GLelyftCiPkUjN5XBGsGj7cMWLxTMC+7lBani1/P
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB9901:EE_
X-MS-Office365-Filtering-Correlation-Id: 280eaba0-5df8-4144-1e09-08ddde1fb3b5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?a2xLaTJCekg2cEdQMURpZG1lL29udkxyMkxsY3ViL1dRSVFYMFI1ZGROcnA4?=
 =?utf-8?B?aCtwZm52N2c0bjhUUDE5RFcrSHhhdnMvZWJ6aXlaaGpyODNuaWtWMC8wZ00v?=
 =?utf-8?B?ZzVpbFFSVVNJcFBUcFZvMVVnRFNwanZNQ0dhSXF3Qm11OFVnUzRUSW9EWGdI?=
 =?utf-8?B?b1FmSW9maStMQUk0NUhRV0lVUWZXaFdwY2JRUXVCSmVNWVU5bGZ2eWtwRVBL?=
 =?utf-8?B?WmVaQThqMStJdVVCYm1QTWlpSHhDcGpjQzQzaEZGSy9rdG5qdnZMZmRLREsw?=
 =?utf-8?B?aVNrb3hPK3ZVQzNBbWM5WDNNRUpxWTZIMXlEOVdnQXFEWlFFSmNrS0NJcE1C?=
 =?utf-8?B?cjhyVnh4VE1KTHhyL2JXcWhOUlg1L0o0WDR3QWRDbGVUYUhJZXB0WklHVHly?=
 =?utf-8?B?bER5c2UwWk4rcW12dXFJMUpSSDFqVGI4blh4Rlc5RVhISzlncHpwU3RiS1V2?=
 =?utf-8?B?Y3JyK1BXMVRHb05SWDdhbndudGwrRitkbFZuRmtxaEx5VU1nNEJ1NjNBS3FH?=
 =?utf-8?B?ZVdqS1VRNjUycVlvYjl1cnJ4U2pMVkorbTV2d1JwbzhqV0Z3SFVHZG44VjZl?=
 =?utf-8?B?VGJwSjlGZVg0SGNqcXF2YkJTdjRZRDB3OCtmT2NlS3RVbzBQL3Rtc3U5TUlI?=
 =?utf-8?B?eUFRT3Z2dnBNdkVXOVZwTGlWOE8rTnpvM0VEZ3pvV0hxQ1pROFc1RlNFRmVi?=
 =?utf-8?B?ZUd5ZzIxLzlPZE5URGZFWEVKUWtmL0ZUWXpmb1R2U05uRGRBWHBHTjk3azZ2?=
 =?utf-8?B?MkFwbEtzdzZ5QTNPYm5IRWc5R0RvQmJJMDl1R0JXRmlCT29oT3JGaXB3NldL?=
 =?utf-8?B?YzF4ZFowUS9seVdvSWJhMWpRT1JzMm80eWxVdDFzdUVmS2ZjWndpNEpRb2Uw?=
 =?utf-8?B?bEtzU3VGQ2tDRlUyb21ld1ZXU3dEN2U5bksyRUg2dVgxUTRnWDVTWVhOa1JI?=
 =?utf-8?B?Y3VOQ25TSjdYaXdyUjFSeVNhN21sbGtyZHZGajFoV2pWSE5HYndUYU9lMEU0?=
 =?utf-8?B?N3U5dHVoMXJqMENkQVJpbUZsMGFFUGFReTJkUDlRM2Yrazg4WjN6LzZtUzBK?=
 =?utf-8?B?VG5RUUhSZE5IRjd2cmhsU0prVDBtRkJwbHNxMldVblJ1Qkt3VlV4b0xyR2Zq?=
 =?utf-8?B?OWtWWXc4K24wQmJ3cjJqL3hxQTJxcHVxRjZZcHk3ZDJFdTAxVC8zR1FwNW1H?=
 =?utf-8?B?RTBLcVg0dUZNVHZOSSsyZ3NHZnB0Y1FpYXBZNk04SjlRYVBpbDRoY1d1ZkVY?=
 =?utf-8?B?U1UyQU5STzZNTXdxQjNGNzB6RnVYZ3BKN1d3alBweWwwVEJCbEpmWitnMHZn?=
 =?utf-8?B?NXpIVVZ5eTdWYnFaT20rTGduL3hnSG40bjVWb2cyUW1yWFYxbnp3WkhSeEl0?=
 =?utf-8?B?MEdJUzNhQlQwWXQ0N1ZCSzFOMG9BZnowWHBjVWI5TFBpTHVjTUJEZ01McU94?=
 =?utf-8?B?cWJoNjMycjdTVktZR3lJZS9Od25JbWNWbTN3QldYRWRLT1BsVDB1RUFJQ0lv?=
 =?utf-8?B?TlpPV1Y0VWwrbW45S3JRWUxKb0lhYmFBL0k1aUs0bFQvRkxEdUJ1dXpsT0Yw?=
 =?utf-8?B?SjF2U3FJVnI2VEdmaGdzclJBajhwQVpaaWJoczR1NjFFZW9zOXpFNmlGNHgv?=
 =?utf-8?B?TFdqU0ZEcllvV1BoZk1HOWRnMjdqN200TkI4T3FUdjloMDlPTDZ6VllJUVha?=
 =?utf-8?B?RVVLOS9tVXkwYlU3cWEzaVdoR3QyT0wxb0ttU0xiWTluS0JDQ3FDM09jVHRH?=
 =?utf-8?B?UVVHM1NrU2ttZytvTWIzNVJJSjRzZGJheXVZaVV4TzdScENLY0xickcvSElr?=
 =?utf-8?B?L3gyYTlJc0FoRzZjVjFnQWZJNFQ4Sll0UWxhaXEwR1BqMUp3Q2lWaXVBYmRw?=
 =?utf-8?B?ekVtODJFcnFXckczODQ0bjJod3BKNGdPazFGMTEwbDhQQ0EwUW8xbFJnMjZ2?=
 =?utf-8?B?OHBZTDE3dkpJR3A3T1NqbitIdEVTM0o5d3ZDVnJSb3NFMmhRb0M3aHl2Mk5J?=
 =?utf-8?B?ZXRxd01aYXN3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?LzVVbHJuczB3eUZXUmtsL2hiVklRTHRhdGF6L1Z0bTZUVHhXM0xldWhmYjFO?=
 =?utf-8?B?YmNubmlRL25ZcG5mODhyUlFPUmxMWi9BeFZhRTRKaGhOVTR3Mk9sRGFRd3Vl?=
 =?utf-8?B?YktseHRNS25Ydzl3ZXRaRGFaMGd4d2NZeVBKNWNseEUxc1YrTEhOdXhkT3o1?=
 =?utf-8?B?OXhqTmFFOEFyUm5TQUJ1SlFnM2VLSVBIcFkzUnN3K1o2OWhVNi9lZGc4TzNs?=
 =?utf-8?B?L2p4UUZnVEFhMUlqTnlicERWVDRsNVV5ZjBNNjhLeHJadUQwS0dTam93dWZk?=
 =?utf-8?B?aCtwUldLdkJmRjNENG1ENGhNTTJrMzNPMUp5eFdTL01oRVd3S1FGQjB3Vm0y?=
 =?utf-8?B?Q0ZUT2kyY01mZHdtbkFjakhlYldlSnRIWDZRZ1VialpScldUdnI3UDZyM2JB?=
 =?utf-8?B?amtzNzBnRHpTeGlpUHUya2QyQ0J6bUY3Z0xSbzNnMURKWmRmWVdWNzZBd2Zv?=
 =?utf-8?B?K2w1b1dXeTNySW40dzZMTHdtMDlJSlJ0bzc4R0xNcHR6VDEvbno3Umc5K2Nw?=
 =?utf-8?B?T2RDekozeGFsQ3d3UDhOK2NYVStuUmoyRDArRlRqdnJhdURnS1pkWmFnVlNr?=
 =?utf-8?B?ZXdPZ09oV1JQZXlsbW8xdUg5dFIva1BYc3hZUDFKcmk5Z1BTNFRKR2dxNGVs?=
 =?utf-8?B?a2UzSDRzc1V4UTNkQ3JVM3RwajNOUWpRenY2dktrZU44MVpBTHQzSHA5NjhN?=
 =?utf-8?B?SXUzYi9LNE9VT2tzSHRvY1lLaVNrWUY5bzBlYi9lK2lYSHZVWlN4bC9HSFNY?=
 =?utf-8?B?emY4VmUxZWxPbmtNZVpVZGtsRGdBMERvQkRYSi9GS3FHWDliazFZT3Q2S2x6?=
 =?utf-8?B?UFBmYVlpeUtXd1piR1pjcWJidGlXalRTL0FESklqY0NvOGZSMGNIcURDM0Zk?=
 =?utf-8?B?RUx0MFUxdzQ0eWFrYVN0Um5VV0dXa01odkRpakdtZU84S0J6QlhRRFdMRVlI?=
 =?utf-8?B?OFlMNGNVdlEwb3p1ZFh2TjF0SktPMzl4QVRmY1k2TTBVWkQ1RUduZ1VKUEtJ?=
 =?utf-8?B?T1dHMm5kZzcxS3VpV0R1K280S3d4VTVHMC9BUGVmaGxMU0JwS2ZHMTlnZmFy?=
 =?utf-8?B?NmkwaXI4QUJzd1dBUURpS2lySUdENi90R2phaTFjUWJVQ1FxNkZZNVFMeEtF?=
 =?utf-8?B?TUlnT2RURWIzSlZBbjFIOHdjcU81SFNCS01xRmVWTXUreDFEVmY0elJVd01F?=
 =?utf-8?B?M3hIYUljdEJGWXhSUlZpaDRsQkV3eWtGRUhDcSt1Mkl0azhkMGI1NDY1bnMz?=
 =?utf-8?B?alQrKzRNVlNqM2EzUFhRVTh0bDhsaVVGcEw1VDdLNGxHdjF1TkhmUk5uOUNL?=
 =?utf-8?B?MUNKcm1peENKOXNDR0ZSQU5UWVovR0JCS3FrNUs0dWU4eDk3TllRNGhFNi9x?=
 =?utf-8?B?Q29kMFNYUDdhK3dkbmkzRllDSmUrNUZSZS9vc1Q0TDlTa2lBV2N0Ni80U1Zt?=
 =?utf-8?B?bnU3T2NmUVgrNFozZkR6ZU1Rc3F1aExEMzNUNEowWk9DOWNQS0ZzSE5LYWJD?=
 =?utf-8?B?UVFrWjRPOG1TWlBVcXg5bGNqZExaRGd6TmxXNHJUVlhEQjk5S2ozeERpZ2lQ?=
 =?utf-8?B?aUdtQ3ZoTDh5TlFURzVyU3hkN1FIS3JQQ0NDaldKUkFtNzFKUnk3ODZzM0oy?=
 =?utf-8?B?L2FKeUdnUTYyNFIyK0lBYkNBWDl4aUU3SVhtZTg3L1d4TWFYcVhJaXI0cy8r?=
 =?utf-8?B?dVpNY1dOTldyRzFvbEdMTEJ1V1RRYndVNDJhelpzL3NSYWY3WE1zcXpjelBp?=
 =?utf-8?B?OHNsODN5ZmVBYlo0aG5Nbkx2VVRCSmorb2s0cnBSbnVXSlQrSUhTVmErdGwx?=
 =?utf-8?B?UHlIZWJjVXJFWEdyUllxemV5eDNQcDh6Wmg0WXlQRmNRYUFqeFNoSVU2dzBK?=
 =?utf-8?B?TFRNdmp5cytBdktnaGxYTVg4SStiYWUrbmdDaUNHSncvNVIwMklacW1lTGNG?=
 =?utf-8?B?TXd6WUppaGtJT0lFSGFrUWFzSlh1YkVIeURFOTlaVVNRc255YnZFdC85bmdV?=
 =?utf-8?B?WjlBWERNdWFPNmhnWWNkNHhmelBjUVBDSHM3enNuSXV2bERrcG5TcEc2NWto?=
 =?utf-8?B?bDg4Ukc1clFwMFpYNTFBQm11aWJzaGI1QVVWclRqL2x4aTZDQ0grcGtqUTNH?=
 =?utf-8?Q?Gy5cqWFrG8SkVTwvPnh5u9SsK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280eaba0-5df8-4144-1e09-08ddde1fb3b5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 06:23:10.0143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wz7G90yP/0lYxymqhX1+XtLYrNH+1Lfvo3tPXeNg/IIOE36V7i6yS6ns53tFmc2qfPl8w+17wASZQ0DZK3VsHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

If streamon/streamoff calls are imbalanced, such as exit application
with Ctrl+C when streaming, m2m usage_count will never reach to zero
and ISI channel won't be freed. Besides from that, if the input line
width is more 2K and exit with Ctrl+C when streaming, it will trigger
kernel panic, like bellow:

[ 59.222120] ------------[ cut here ]------------
[ 59.226758] WARNING: drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:631 at mxc_isi_channel_chain+0xa4/0x120, CPU#4: v4l2-ctl/654
[ 59.238569] Modules linked in: ap1302
[ 59.242231] CPU: 4 UID: 0 PID: 654 Comm: v4l2-ctl Not tainted 6.16.0-rc4-next-20250704-06511-gff0e002d480a-dirty #258 PREEMPT
[ 59.253597] Hardware name: NXP i.MX95 15X15 board (DT)
[ 59.258720] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 59.265669] pc : mxc_isi_channel_chain+0xa4/0x120
[ 59.270358] lr : mxc_isi_channel_chain+0x44/0x120
[ 59.275047] sp : ffff8000848c3b40
[ 59.278348] x29: ffff8000848c3b40 x28: ffff0000859b4c98 x27: ffff800081939f00
[ 59.285472] x26: 000000000000000a x25: ffff0000859b4cb8 x24: 0000000000000001
[ 59.292597] x23: ffff0000816f4760 x22: ffff0000816f4258 x21: ffff000084ceb780
[ 59.299720] x20: ffff000084342ff8 x19: ffff000084340000 x18: 0000000000000000
[ 59.306845] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffdb369e1c
[ 59.313969] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[ 59.321093] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[ 59.328217] x8 : ffff8000848c3d48 x7 : ffff800081930b30 x6 : ffff800081930b30
[ 59.335340] x5 : ffff0000859b6000 x4 : ffff80008193ae80 x3 : ffff800081022420
[ 59.342464] x2 : ffff0000852f6900 x1 : 0000000000000001 x0 : ffff000084341000
[ 59.349590] Call trace:
[ 59.352025]  mxc_isi_channel_chain+0xa4/0x120 (P)
[ 59.356722]  mxc_isi_m2m_streamon+0x160/0x20c
[ 59.361072]  v4l_streamon+0x24/0x30
[ 59.364556]  __video_do_ioctl+0x40c/0x4a0
[ 59.368560]  video_usercopy+0x2bc/0x690
[ 59.372382]  video_ioctl2+0x18/0x24
[ 59.375857]  v4l2_ioctl+0x40/0x60
[ 59.379168]  __arm64_sys_ioctl+0xac/0x104
[ 59.383172]  invoke_syscall+0x48/0x104
[ 59.386916]  el0_svc_common.constprop.0+0xc0/0xe0
[ 59.391613]  do_el0_svc+0x1c/0x28
[ 59.394915]  el0_svc+0x34/0xf4
[ 59.397966]  el0t_64_sync_handler+0xa0/0xe4
[ 59.402143]  el0t_64_sync+0x198/0x19c
[ 59.405801] ---[ end trace 0000000000000000 ]---
		VIDIOC_STREAMON returned -1 (Invalid argument)

So check the queue streaming status when application close and call
streamoff to fix the issue.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 22e49d3a128732c077beb7ac2e2f688e0899f8e2..7650a9fe6b093e2b4e09e3e66b624c8c019c8583 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -709,6 +709,14 @@ static int mxc_isi_m2m_release(struct file *file)
 	struct mxc_isi_m2m *m2m = video_drvdata(file);
 	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(file->private_data);
 
+	if (ctx->queues.out.streaming)
+		mxc_isi_m2m_streamoff(file, &ctx->fh,
+				      V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	if (ctx->queues.cap.streaming)
+		mxc_isi_m2m_streamoff(file, &ctx->fh,
+				      V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mxc_isi_m2m_ctx_ctrls_delete(ctx);
 

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250818-isi_m2m-ac52338ae925

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


