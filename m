Return-Path: <linux-media+bounces-40661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5FFB30578
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3C197BCFA1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F2F34A337;
	Thu, 21 Aug 2025 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HpHba11V"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB35934A328;
	Thu, 21 Aug 2025 20:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807400; cv=fail; b=Je6TuEfAVKluELjXmQ5JF7/WeHvJeO2y1rcS/Hr7o8oXjyd1FRxN4f8PjIMr5/MozFiCnIkjDcnNs4Q7IkcX8zA+Rp2SoRgda3eSMUp5P8rW5+l9TTqg8HOCSJqRQ9Sl5Qonw7tLZEYHd8bLHrJ4Dx3EBo9DZc1i/L+qPfKlif4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807400; c=relaxed/simple;
	bh=LJheYFsFE3gTgbB/4exm7kW6px7qSqmIClCgzXMKKxs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aIpDT+/C7l6rPXRZnmQsxKNlI7p1VI2Td2rqX94njltg7n7TdE8UMHk37ih8IevKgSuZiHgdP3g5P3Lzy3QCsy+VrG7yr9aIafaX2aKMWgwlyhsH0rCQomn8c3yltmZdofVtMlcR38evpnSwtJp7zpSPKub9wUdw1G9MBjlWPiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HpHba11V; arc=fail smtp.client-ip=52.101.84.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ek4sspxPtD2ql+kKnfLE1fKs6uUa8tgGwdO27JHZ9pYKw6wgGIX4YOeAdTajjvPvWIWlad0iHkxuEufqAZldGIEPlblBo82oXiIOuL7epAxo035Rjd4TaAzx+n7PCrg/f607OqbEaJ3b6AuvOMWVuJa9N+eKotCpkq6lsi7fz7eYUKL/WysPfHj7G3XvFtdbyBjPpdV5uIADBpHU054fSAIGMzzrn0EmaIw297lB3VpC5KziUALlC7vM62IJaVL5aqpGLGXOoTbh8fOO5hmD7R9rWH90iPJgGpSi/1egpuzTJodJUiF2wDVKoNxUqbtZlTJD7ZNbBrAZhpOd+Z1Kuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWDSKYGOK866sldsSpKS6S3hnBKaYQtP/Dg7w21A5r4=;
 b=CEduPT3vyXzzc0wQ1C05ODvbTLe1YoIgWjugC927SsCIsTAAkYuWfRCp/IPvyxJ8vOpdBXx6RwVe2VDHOeBvw1JCUZ5vtliXeNyz4wlNQy1cd/GfG30H1h1zl5oeRQCmNmnyk07Vv6nrdbYt0S94DP/eIp1d7hFlf7kMtvOqCOKhyjQK4+upNdnldWpRxxk555aKo9k+oAepn1vc+//bAAYzKuDhkz0IcAQC2xEEOF7qCWIhKAxLkvHC+QurKD3tpnsh+AIkuQ/jZY7V5HT0epJzGG0HAALQbw0RSXEaQUc0CeaBzVd5qn/p19wNn0OldtYXR4FN4M2y5wI+HkTgUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWDSKYGOK866sldsSpKS6S3hnBKaYQtP/Dg7w21A5r4=;
 b=HpHba11VS+tV9etTqCemBG3U3jiL913Noi+8x256O6PQ6NtXY3Vo4kQFbKb9LQUB5xILJCw6q3ACW76GUWrgc3FtlA/BeZ10nMUY6oFxk93vlzUUDrlgWTZ9t1Qk6H8mIiRB1Ldb1hFlkZUfOsScyN1klUOZgCQfw1Z3K9O9XBA7b+6REa/OKM3TLJYIkQKanbf+O4PSqP/Urx5DFumGk/oLy/oO5j5gl79xMETm4ctEjjsvKR4DEoXlmkkdDyK5PvFiFNAcH3Ft8oBnUJ5fmzwEx7HyrxvNi3GC0tzhlqF5VrxaRYXCfsq62mHHav7YaBUg4Ph7ZIH3PDMrwNQECg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:16:33 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:16:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:39 -0400
Subject: [PATCH v3 04/31] media: staging: media: imx6-mipi-csi2: replace
 space with tab for alignment
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-4-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=4945;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=LJheYFsFE3gTgbB/4exm7kW6px7qSqmIClCgzXMKKxs=;
 b=jMD6eJMAsVHPop33Cjce3ajECgBKKA0LXb9gwf/ubOGiRabyniC1R2WJ03NKpAnIMpNyHdXPi
 dKBct8Ak2btD1d8ov9LVcBHtpQYQtTO0eitK+4ryZH2LEUwxQwO0X2r
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f2f335-75ba-4a6b-6b72-08dde0ef9f97
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eDlPV25EVmdVdjFOSWVBYzFBOXhxaVVVTmhudHlOdi93a0hoMDIzbDIycHI5?=
 =?utf-8?B?KzRLaVE5WXF0b0s3NmdvdkJJY0ZEVW82cEhkNnhnb1RldkJxNGVQZHhMaTdN?=
 =?utf-8?B?SVNUTTJqU2oxaFo3MVRJVFAxWkR6WGdtbGlkNDJmcGZkQlVTc3NIMEpOS3hm?=
 =?utf-8?B?NFlMVC8yeUZSTE1DU01tckFQOFRUWHV2VVRpOXREYW8vYXNrN1RJak9BdVMw?=
 =?utf-8?B?TGcveSswUkNweDV4SXFIYmZ2QTI4MlIrL0pjYnVFbFFwcnBLK1lhaTFRT2h0?=
 =?utf-8?B?R04vcXZ1M0UyZ0ZXL2dhRlh5QWhqMHFVczBBSitWdGo3c01yTE45QmdHY2xQ?=
 =?utf-8?B?L0pYOEx6WG9GZ1ZvK2preWdzYkp4MDNmSDJBa1pneDBFT1FxT2JxWnZxMGg1?=
 =?utf-8?B?QkREVlFXS1hSRXpoWTJhMVhDS2hITUN2OFFjVHV5SzJwelpIY1h3eGVVUGRv?=
 =?utf-8?B?Wi94QlVHOWlqK1UyMEF6MGpxVDlzajN4MUhBcTZ3MytFYVVNS2FKekZqNUxO?=
 =?utf-8?B?R05lSS9GQmJjK2pKTEVNQ3JacStYWklCNkNPRVZuY1h6K2tVZ2MwOUFQVFdM?=
 =?utf-8?B?Zzh0UVRJcStzbEhEQnBRR1kvLzZpWWFEdjhOWDdXV2V0RlFwNHhhNmNBeGZp?=
 =?utf-8?B?ZkJjSkpDRmpETWxqa0NsbytGRVlnWURLRUt1TGxDamdPWm0rNis0NVBXWm9W?=
 =?utf-8?B?Ky82T2VVUFRDQk5CMHZMcHNSdGxaMFROUWlRcmdGeWRvbkQ5ZGNtQnpGeTZK?=
 =?utf-8?B?YWFtRzVjUWVTR0p1MzFmTFhmZEM4WTU2VlF3eXJFSW1nMk41cy95QWtmL0J1?=
 =?utf-8?B?TnZ3OEd4VStHZkkwY09ZK0xpaUUwL3VPTlRSYmM4Z1FJL2Qza01abTJCS2xk?=
 =?utf-8?B?Ykh3dExZdTVSL2Ezb2ZiRTc2VVZxcUZhbEtuaCt0N3Rra2ZmOXd4S1YxMHRS?=
 =?utf-8?B?RktOZERlcUl0Y3EwOHdTNHd6cU5aUi85UTdnaWpGMU9QRDhnYlcxNG5lRGlk?=
 =?utf-8?B?cXppK0orVmFxT3N4a093eFdWVXdhVHJITW85SERKSWlzaFVrYW53OUlNTlJ3?=
 =?utf-8?B?NzFSVVF6ZTJPK2ZUOGFoYWlLczVTbEV1SFV0OEo1V0l3N0NMT2QzQ3NLVzZ1?=
 =?utf-8?B?b3RYKzNRaFljUUNMWHBWTmgxdWhwUTI4NmhYYTFadGVMaDN1NTBFZWNQYllz?=
 =?utf-8?B?QUxQekUxY0JRWG5PL2RrWEhsTEZMNTVWVUtRblV2T05OR3FIK3Jaa0pIeUpt?=
 =?utf-8?B?RGQ0RUZIWnJ3bmliY0d0YmRhTFFkRHFTeWNVWjkvLzNrUkNMaHc1d1E4RkNh?=
 =?utf-8?B?Z2QwYXcxM3UvblUwMzFobDIvdHBFRU5BQlcweW0rSVNYbnZKYzhzSk44T3NO?=
 =?utf-8?B?cElRaFRGd0JLV01oM0t6MjJFMDlsOGpDSW9iRHAvN21URGNscmV1cmNDUGpG?=
 =?utf-8?B?RTNQaGlGd3RvSVR6S0Uxd3RnQ2llSWlWa3MrUlFob0ovSmltSkNQSU9tU2Jt?=
 =?utf-8?B?MHZOazgzdGM2SE45R2taaGNOOGRmOTZGSHlodHgxYk12cUJoTlBKUHplYVRl?=
 =?utf-8?B?RjRDS1dNd2FwRzhZRzN3aXFmd053SGhUaERYT3ZFQU9Oc2tBSDJEeFZQeTJI?=
 =?utf-8?B?ZlNuVXR3NnFBWnRxSWVHRDJ5REFuSjZ6aFU1cEZYNVYrMnJuWXQwQ0RYcFhu?=
 =?utf-8?B?QkR1c2dhZGp1ZTByOUhqRGdFMG9qRDVFaGtVZG8zaUp1clcxQ1RpMU1kK2Qy?=
 =?utf-8?B?OVIvSk5NcnMvUlIxQkpDZUNsUDl0S0h4SHZmaldDNDJCQmtSdjRPWUQ2WGF6?=
 =?utf-8?B?aDRJTnFtUUwwQit4WGhvd2dPOEZySVUvaWFVYlBiME16S25LSi9FZnh1dkdX?=
 =?utf-8?B?TFB2TmRDN1dpS2VVSE1ocHAvaFJkUU9leU1PRkppV092VXVNTmFaYjNGczhB?=
 =?utf-8?B?Tm80Z1VZVTRqZ3AxbWVYejB3azlmQ1d4VWlrWXAyM2FKYVYybzNXdC9QRTJ6?=
 =?utf-8?Q?z3y3fIKzzncdccSzVJbairDAuNZnGM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dm1kWnNXd1NjdER5UlU2RWZCcXMrcWZSQTE2RFkzUDYvY1lNcFJwcXJzN0lE?=
 =?utf-8?B?YUFLMm1wSmpmSmRJdVM2WGZBZU1UYTJRcEZjdGtrbXRtWXZFWEd4K0VGeGl3?=
 =?utf-8?B?U09RaVJXR2NiNm1RNy9zSmpQUFBPbUNQVzg4NmtTWXFXb0NRdFAvcmQ3dHR2?=
 =?utf-8?B?MkExUTdWc3VRRnpRUHhTT3h6NmtoOWFYeTFsOWw2ZUtoSjhaY0VlVWFvemtT?=
 =?utf-8?B?cUV1VHhXSDVkTnRXUGNzVWx5MDhZQ1o4K1Jzam8xTGtCb0REbnJRVGhka0F5?=
 =?utf-8?B?c1BNek1rbGkydG9nMitzYy9BeWw5T05CL3pOV3p3THBiRGZqdThPdmIwRHFO?=
 =?utf-8?B?d2pQNkJ2QmxzY0M0OEN1dTdlTkJEdkoxVElWMk5ORVhsME9BUDVobkxBdkh5?=
 =?utf-8?B?ZC9RZ2pxLzJPd2owalJ5TnNTWmNWZ3JRS0cvTnkrc2FVTGdTdFBKTG8xV1Jy?=
 =?utf-8?B?L3JpdFhkSFNIZzRaM0NrMjFRb2M3MWNBdUtId3lzeGNxaCtNNEQ0V2gvUmsy?=
 =?utf-8?B?M0YxRW84ejlzMUNnRm1iKzhVMExncGZTOXJpUGljUzE4YjNJZTJPdGNRRll3?=
 =?utf-8?B?Z2dhbkpXdzQxbVVSTyt4bDhGY2w2QUp2SnRYcUx6SHFJZmZvY0dMbUZneWo3?=
 =?utf-8?B?SVFTeTdjcXJlWFI3L2VEVGxQcVYyYThqcVNBQXJVclF4MjhlSE9BVmVtdmhr?=
 =?utf-8?B?ODM0cWF0YzBzeUZUSFBRZ2JUclVzc1pmZHNaWTFlVU42Kys3ZC9WSWplSmxv?=
 =?utf-8?B?dEcwU2gzS2lrcmZyUkpWK2ZTeG5vcndYZjVSOHBYTzEvZ0xOVzYwc1NEUExF?=
 =?utf-8?B?N1NNc0FRNFFNai9EN0V1WE10K24weE9memNSMjhTUlAxSmNoeE9hTExVdTNs?=
 =?utf-8?B?UUkxTWFXZGZNeDNMa2xKbDZZOUhGKzRHSVVuK2hUZXlWOEt4WWxaL3IvUVR4?=
 =?utf-8?B?NDNSQzJ5cHVDbnRZSTRGNzRyd0I5a0hVeExqdHZHMVg1NEthbkQ2UXdxOVFX?=
 =?utf-8?B?OXVURzdNejJrYWVwc1UvZjU2OTYxM3NEN1gxWE1NK1B0RFdlU3JBdHgyaG43?=
 =?utf-8?B?TnBja3hRSXpHS0hzM2EyekdvOHVjSnQ0SVFvNDJ3ZitOdWhSd3lZcXlRVVlQ?=
 =?utf-8?B?c1B5SXNJUTNVNnRWWVMwaTNMbDRqRkZVQThzVGpuenlQVHNjeTB4UXdpNzNj?=
 =?utf-8?B?SW9QcFNRZUxPNkZ2OXI4bjV3aGhXNWZxUmY2UktEZUxlRHFaTVBhdjFkN2d4?=
 =?utf-8?B?S0xPdUxUdkRUeWlIcHVsdG00VUprU2phbFpiaTFGNk1FVUducDhDNFV3NXBt?=
 =?utf-8?B?SU9aUCtibVZTcnp2ZEZtY0ZyQzVzb1U4QmVOd1E4cUVsam0yakxKU1htTVNU?=
 =?utf-8?B?VXFRV2NoQ0xMdFZMQ1BSeXdFUmk2WU05OUlTd3UvWWZ3MkROLzJMSTFnL0Rx?=
 =?utf-8?B?azVRdlRYS3U5akp0M2crZ2dxc3JGRmRWYmpuMVArL1VxUE45enM0eCtFeHhv?=
 =?utf-8?B?aElCbGl6bFJIckd6TkF2WnlhV0QvK0p1Z0xmTnUyU0YwY2YrYjFxVk1MemtW?=
 =?utf-8?B?R09nN0V3Tm1raGJQRXdyVW1RSmRtNVd5WTVodjR0VE5lcDRaM0IrTk1DSkRD?=
 =?utf-8?B?TFlBSFpkeWUzbU5xdGh3ZUgweWloblM0eHRYd2poNElDUGJjQlJ6THBBdnVT?=
 =?utf-8?B?Nm9KNWpJdy9sb3BMd1FKYW1MMWlnWDFzeTNRcktqYmxNMzZteEk5Y2c2eVpq?=
 =?utf-8?B?b05PcEpHT2lldllIdWkyWkZiZnpMZXl6dXFnQVhYcktjcTg1MmRXTTdNTW9i?=
 =?utf-8?B?OUFHbm9qa2tMNkNidTN1VW50SHNhdUxITkl3QnBMSkRiZFQyVFhPMldsRXQx?=
 =?utf-8?B?RTNIcWpIRnBaVlBXU0htSUQxWGdkS0RNR0dSWWZUMk1aY3R4TUlPdG5LQUMx?=
 =?utf-8?B?OFdvc3k2RHpzQ1BzUWF5Y0l3bUR1VTB1NTJyNGpETW5IOHFJZG1mOUkxK3Zu?=
 =?utf-8?B?US9Pd1hhOTB6V1cyNTQzSERPZERtVVZpTXpTSldrZEV0dHFEQ1IvTHByZDVO?=
 =?utf-8?B?RXZIWGhCa05VaHRLa0p3QW5waHhWWFBXQjBiNk9OQlI0cUdlZXlYYS9iY0FJ?=
 =?utf-8?Q?p/Xo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f2f335-75ba-4a6b-6b72-08dde0ef9f97
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:16:33.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLzm5hdr1kDgystJEFbJXb3YV+LZGt+Jf7K4jVchAk9fDYPi/2YPIVTSFDilFjdtc5oXJG9zmDycrhueqRZ7KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

Replace space with tab to follow coding convention. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 92 +++++++++++++++---------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index dd8c7b3233bccfc34b59e0f0ff813b36752e1526..42256441b881d9f132ad7ff899d6f1e35643b4ac 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -23,65 +23,65 @@
  * there must be 5 pads: 1 input pad from sensor, and
  * the 4 virtual channel output pads
  */
-#define CSI2_SINK_PAD       0
-#define CSI2_NUM_SINK_PADS  1
-#define CSI2_NUM_SRC_PADS   4
-#define CSI2_NUM_PADS       5
+#define CSI2_SINK_PAD		0
+#define CSI2_NUM_SINK_PADS	1
+#define CSI2_NUM_SRC_PADS	4
+#define CSI2_NUM_PADS		5
 
 /*
  * The default maximum bit-rate per lane in Mbps, if the
  * source subdev does not provide V4L2_CID_LINK_FREQ.
  */
-#define CSI2_DEFAULT_MAX_MBPS 849
+#define CSI2_DEFAULT_MAX_MBPS	849
 
 struct csi2_dev {
-	struct device          *dev;
-	struct v4l2_subdev      sd;
-	struct v4l2_async_notifier notifier;
-	struct media_pad       pad[CSI2_NUM_PADS];
-	struct clk             *dphy_clk;
-	struct clk             *pllref_clk;
-	struct clk             *pix_clk; /* what is this? */
-	void __iomem           *base;
-
-	struct v4l2_subdev	*remote;
-	unsigned int		remote_pad;
-	unsigned short		data_lanes;
+	struct device			*dev;
+	struct v4l2_subdev		sd;
+	struct v4l2_async_notifier	notifier;
+	struct media_pad		pad[CSI2_NUM_PADS];
+	struct clk			*dphy_clk;
+	struct clk			*pllref_clk;
+	struct clk			*pix_clk; /* what is this? */
+	void __iomem			*base;
+
+	struct v4l2_subdev		*remote;
+	unsigned int			remote_pad;
+	unsigned short			data_lanes;
 
 	/* lock to protect all members below */
-	struct mutex lock;
+	struct mutex			lock;
 
-	struct v4l2_mbus_framefmt format_mbus;
+	struct v4l2_mbus_framefmt	format_mbus;
 
-	int                     stream_count;
-	struct v4l2_subdev      *src_sd;
-	bool                    sink_linked[CSI2_NUM_SRC_PADS];
+	int				stream_count;
+	struct v4l2_subdev		*src_sd;
+	bool				sink_linked[CSI2_NUM_SRC_PADS];
 };
 
 #define DEVICE_NAME "imx6-mipi-csi2"
 
 /* Register offsets */
-#define CSI2_VERSION            0x000
-#define CSI2_N_LANES            0x004
-#define CSI2_PHY_SHUTDOWNZ      0x008
-#define CSI2_DPHY_RSTZ          0x00c
-#define CSI2_RESETN             0x010
-#define CSI2_PHY_STATE          0x014
-#define PHY_STOPSTATEDATA_BIT   4
-#define PHY_STOPSTATEDATA(n)    BIT(PHY_STOPSTATEDATA_BIT + (n))
-#define PHY_RXCLKACTIVEHS       BIT(8)
-#define PHY_RXULPSCLKNOT        BIT(9)
-#define PHY_STOPSTATECLK        BIT(10)
-#define CSI2_DATA_IDS_1         0x018
-#define CSI2_DATA_IDS_2         0x01c
-#define CSI2_ERR1               0x020
-#define CSI2_ERR2               0x024
-#define CSI2_MSK1               0x028
-#define CSI2_MSK2               0x02c
-#define CSI2_PHY_TST_CTRL0      0x030
+#define CSI2_VERSION		0x000
+#define CSI2_N_LANES		0x004
+#define CSI2_PHY_SHUTDOWNZ	0x008
+#define CSI2_DPHY_RSTZ		0x00c
+#define CSI2_RESETN		0x010
+#define CSI2_PHY_STATE		0x014
+#define PHY_STOPSTATEDATA_BIT	4
+#define PHY_STOPSTATEDATA(n)	BIT(PHY_STOPSTATEDATA_BIT + (n))
+#define PHY_RXCLKACTIVEHS	BIT(8)
+#define PHY_RXULPSCLKNOT	BIT(9)
+#define PHY_STOPSTATECLK	BIT(10)
+#define CSI2_DATA_IDS_1		0x018
+#define CSI2_DATA_IDS_2		0x01c
+#define CSI2_ERR1		0x020
+#define CSI2_ERR2		0x024
+#define CSI2_MSK1		0x028
+#define CSI2_MSK2		0x02c
+#define CSI2_PHY_TST_CTRL0	0x030
 #define PHY_TESTCLR		BIT(0)
 #define PHY_TESTCLK		BIT(1)
-#define CSI2_PHY_TST_CTRL1      0x034
+#define CSI2_PHY_TST_CTRL1	0x034
 #define PHY_TESTEN		BIT(16)
 /*
  * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
@@ -106,13 +106,13 @@ static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
  * reference manual is as follows:
  *
  * 1. Deassert presetn signal (global reset).
- *        It's not clear what this "global reset" signal is (maybe APB
- *        global reset), but in any case this step would be probably
- *        be carried out during driver load in csi2_probe().
+ *	It's not clear what this "global reset" signal is (maybe APB
+ *	global reset), but in any case this step would be probably
+ *	be carried out during driver load in csi2_probe().
  *
  * 2. Configure MIPI Camera Sensor to put all Tx lanes in LP-11 state.
- *        This must be carried out by the MIPI sensor's s_power(ON) subdev
- *        op.
+ *	This must be carried out by the MIPI sensor's s_power(ON) subdev
+ *	op.
  *
  * 3. D-PHY initialization.
  * 4. CSI2 Controller programming (Set N_LANES, deassert PHY_SHUTDOWNZ,

-- 
2.34.1


