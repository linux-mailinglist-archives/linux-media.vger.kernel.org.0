Return-Path: <linux-media+bounces-25968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB35A2FB4E
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A14D0164C75
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDD125332E;
	Mon, 10 Feb 2025 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GjAPm04o"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011019.outbound.protection.outlook.com [52.101.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A41253325;
	Mon, 10 Feb 2025 21:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221251; cv=fail; b=Wla7Tbe+jCzD+Pdy+qTgqDbglZw+/yBEc6Ipdl2QGir/f0/ULsn1dyoZ2+rWqBQYC6kEESSizzT34L+tCUNlrZzI8Q3a+6ffqbB9xIalALx5zDs+VZZdJfnRFqFfUhca09EvCckGT32kaa2ryzGK0uFtsxE4gZ2xMYyX5QrtGu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221251; c=relaxed/simple;
	bh=C2nUdUDeX5xlA/WdcD/fjeIAtJMPO7saLQ9Hz770Cec=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=baeH0vAYgvmVMy5be7X1SvSCGboufO58f7IVyCsYzPpBPIVc6KxnPcfsWtAA97kKMfD2hh1/cxZV/0DR6UnTSaiHAq/0cr06khnnCQpAsupIB57EL53BwovLyuCpM3gv2FAAzaeNknl9eyTe2eqY6ADfuHQ6Q/BlMpMns6i2HtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GjAPm04o; arc=fail smtp.client-ip=52.101.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkK2GkahNuT6xOGyfn6VdwQtF09IQa9eWOGopa4cg0RQlH0yNjO/wc2mAqFe/2PAG/YIrHcj5xSu9DHDx3zB60L6Qf+Qg8gATSt1Ww9wTk0lJFjsZKi5O0mz1uuGt9hre6VP97XaihFToinXOqBdR1i8gWw7DYQM0gmcopMCp27NnpHKspACr3UPGS6iDW0UP7a1ifLYWwBqstRuTA2iwvWVkfzvZVxvRFX7ct5BztZL1daatN6nsVlEDdbsTcprrLFCLCDBH/JEssUecbgIC9rpFcLpKHhtBTLHHyZyuH5Xp5KljxhM1E9LPdC9YZ7Z0v/Y2/ohvGxFydPyw1fuww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nj9Wq4hxZKZUpcoHbg2zFAzhONsjMMZ7cNzpRzkFtd4=;
 b=WNVSI34cc7dP/4f29YRCrENIDxHtq00A/o9aRSNZhBF/xaaJ6fkfUQbXWUGIyUwLaG1DhiHX1jM98/f6K1heT4uv3fOAfT2HED4svzKG07jBE1SaPH4ynrepCBz67if/lk3tWnP4oI2FXFJSXoE7hnyU4qbS7dOI1zf+vsTk4LYj+amwz/ZyQzK9MiyfPSZAcoBegoKYSYxATX1RTiSldjjpK5NwoQ6Thv51JltEHPEOLHpLQZehUdoPnd1nWxJ7TV68Mgnj/jTjMh/9Be3soBTfeVSaSH+LIHpnqrnSqL6AqxxgxDKY1tlKoRxDLbQWR3G2EbKZ7aoCSEWn50MUdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nj9Wq4hxZKZUpcoHbg2zFAzhONsjMMZ7cNzpRzkFtd4=;
 b=GjAPm04ooAfSRyrTmpM1OzSurG+Y4C7IyjJ3TrqMrV9H2BxGFRzIrIEjDYEJqnthhRQMujPvedcoLy4sLx/0pfm6sABJ+v07S4k5+gTiRJv5wDoZy5KOHuuPUURDeshc0rWNSPeFvExUyzZ4b9xy23jVDxd2vnGThkp4xTzVs+7eqHKcDG2EuHS4UrnwKqlCGMhkj601vArAYyzke8LdAhwN0ODH0OOeTaYpp/nEJKrvWVtw7U+G0oX9pntFF2lErM/HkX97fjho14aTR/P3k2SsWj0NuOmJaj6PwtHn9LbAHLXuHC88K78tn9MP9h4dMBUE5Hqe+EkbwSGyIccl2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10238.eurprd04.prod.outlook.com (2603:10a6:102:404::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 21:00:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:45 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:30 -0500
Subject: [PATCH v3 11/12] arm64: dts: imx8q: add linux,cma node for
 imx8qm-mek and imx8qxp-mek
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-11-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=1608;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=C2nUdUDeX5xlA/WdcD/fjeIAtJMPO7saLQ9Hz770Cec=;
 b=QgcRhlSUZrx6X/mGynTIr9kxGnw89CaDD9hJckS+SJef7GYpAzowo2yJqdkoQTB6xrYEPgQqZ
 xNMqB24iJkfC3KFhKAbar281v5AZyA/2MqoHUGuuqhpaaJbvCYKIThk
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10238:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1d0104-bc3a-4a8c-654d-08dd4a15fd1e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cWkxWTlnT3hYbTVja2hkaXRaRHVLa2diSXhNbEpCTHJXclFFWm9WSGg5Qlla?=
 =?utf-8?B?TXZkdHkrVFNrN3lZVm1ucU0zdFVGOEp2OEtoQ3cvWTBKaWM1dmJDYUZPQ3hJ?=
 =?utf-8?B?RjNqQmRzcjExRHY2eGJyelRyOHFkVEowZjRqU2x1UnErQkh0by9uNW5URXBN?=
 =?utf-8?B?Qk9ZWmtoR2tnVjFTaDRxRjZEN1pkOTQ4TlNZR3BYancwQnFWaFFXOEJaV1Vw?=
 =?utf-8?B?MTlMWUtGakgwcS9Bcm1FbkJ1NkdzeCszZ0ZhUXcyWmlJTXZpeXIrQ053WU5I?=
 =?utf-8?B?bnUwWVJ2RzJwdXdwWnVBejlYYzFXVjF0L3JtY0JUZWU5Z0tFQndoM1dXTm5s?=
 =?utf-8?B?RU05S3RhYmM2RGNhLzFsS0V2YVA1b3hUQmRHUk9BRmhTejQ1NDc1aTNteU52?=
 =?utf-8?B?a3NBUE1GZW5kdEdtcXJhcUFNVXdvWXYwZFQ3QkIwQ09XNmxBMXdMRnRiYzVX?=
 =?utf-8?B?RDBRM0JCa2tUWlF4d0JMQ1MrWkQ2NWhMU0FYeC90cHo0MGViTVMrdURsZEk2?=
 =?utf-8?B?U2N4UVpoem9pd2haUzdaR3I5emtJeVUyWVVwa2xuSTNSKzIvNXQrVmxBQmxN?=
 =?utf-8?B?K05NVXFRcnZYM3ZHMzFEZmhobFd3MHJoUXhPc1JpMFNodmI1ajNQUUJVZ0Ir?=
 =?utf-8?B?QWFBVks3NUNJWUJudmY4Ky9nRnllZ2tlc3dsTnRTYWNPQm9uY2FiT0o5Nkhw?=
 =?utf-8?B?VEJYK1VJOWU3dlU0VWR1R0lOU3Y3TFhRZnF1M21uME4vTTlnYTBJNFpXaWgr?=
 =?utf-8?B?L0pNUkYrT3pwQk9kY2IyQlBzanR2UUc1U3lzeG5RMk5DRjJMK1BZc1FkTmlE?=
 =?utf-8?B?aHE3aW9Sd0JYU0tHLzBFTVpqdHE4R0VHRFZqZ3h6cXUwRlluWEUybzZYdUtF?=
 =?utf-8?B?VzFJdCs0U0xKL25yeURjZmdqMVRPdHNZV05kT25rWmJIZWxEQ2QzNG1xL1ZC?=
 =?utf-8?B?ekRpZjljM3hxTHhnWjNYNnlLK2xkRzZwdUJsNDIvMFB5VEFWQW1QbHBUdlpy?=
 =?utf-8?B?NnIyTStCdHJYT1FzU2tyUHNvRFdXUFFqbEFRZGFrYk1xbzBEc21pejIzU2hX?=
 =?utf-8?B?WSsvaHU0M2FCeDcvSTdPTjl0blBHTFREL2IvTEIvcHhOSTRaWlhHeDBNVnBO?=
 =?utf-8?B?eTc3VTQzNkJNV2h6c2pXaEJVRTR5eDJhV2ZMa1MyRiswa1hKbnBJajVlczZW?=
 =?utf-8?B?NXExWEhoUVBUU1ZUQVU0RWFrV2FXc1RFU25NSzlqaXUvV1JNVnhobktUSW5W?=
 =?utf-8?B?ak9rSTBFbHNwUk1HTTRPM3ZXUmQ2c0FncXJnRGtuYndFVWZiamZUamljWXNC?=
 =?utf-8?B?M1dac3B5R0VtR3hGNkJLY3dkVTY2TWlKdUVQeGJBMGpVM0ZWQjZPZVE1YXZR?=
 =?utf-8?B?Y3c3c2E3Y1lRU2lGYWI3Vjc1TGVEL3lVZFR4NlhJakdxbm5nbXBQMGJCbDVP?=
 =?utf-8?B?VnBHWlJWVTBGSzFkUjYwa0ZwTHNSalNHM1dEOG5tUFYxZXV3TmVFaDJudmlB?=
 =?utf-8?B?eThJWW9ncnFBTWxQY0RvQlJ0cCtMcS9BREhRd3NvT05hSERSVWRiSmNOWWlT?=
 =?utf-8?B?NTlJR09NbEFxQ0JmMG5qc1V1SGMreFBLanpIeHR2am9IQXErWUFCN2UrZEFh?=
 =?utf-8?B?dVNQSUlETHRGY3lsTlpaTjEvN05oMGtINU1rL2xsTDVZdVRCMXo3eXBwVFRL?=
 =?utf-8?B?UDR0aHZpUXk0bm95dEtldUVxNDIySjVDaDBDNGRlMEtmOG9pTXZEdkpDeGN1?=
 =?utf-8?B?cW5CK215eUxUeFZvd0NEVWlrQ0dhWmw4MVQ4Uk0yMi93eDBScWRYSzQ3VldC?=
 =?utf-8?B?c1V4dFFCK1lNTm5GVk0ycExyMVlBUHdTRS9pa0k3VGdTK3hkSHpJUGdoOURq?=
 =?utf-8?B?N0gzK3p6ZE93dkNBZDFCSElzQUNEWmloMzR6aGpIRWlUNGJyM0JxVG13dEpy?=
 =?utf-8?Q?zOMPLuW1QZy0m/e8XJWDybCIFKrJVhNa?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?M2V0MHhxS0JuNVpmMFJ0dHZReUp5OHE0MEVTRFZveU82ekxZcG1zS3NuWEFD?=
 =?utf-8?B?d0VTWFF1VHZINlFRcldPYzJSWlNwblJIL2cvUGl5QlE0WlRSNFJkcmpoTzU0?=
 =?utf-8?B?ZGtmUmtVV2IxZEJBT09PNFA1K2l6cS9WQXdQQzV5V0d2SmRKYVAyeHVBM1RJ?=
 =?utf-8?B?WW5reWxyNTYwQUhreldUbXFzc0djVFBFbkFuTGk0TE1NU203Sk9CUmlaV2lx?=
 =?utf-8?B?Y2xuamk2Qzh3RnZWMlhLSi9DR2I2VGh0eEVmdFlLZWNYaU93anpWMmJ5Sk5p?=
 =?utf-8?B?RytZOTJKaCtOUmVoV2pjZm4xY2twcXMwa21UV3NSUDBKSDZvWnY3Vmt1S1hL?=
 =?utf-8?B?a1pOS1Y2TGNGeVRxWG0yeTlRRWltOTZscENrcnczSzNIbkxRRDM3NmFuMnpM?=
 =?utf-8?B?ellObjBnVCt4aWdEL2JhNklEWmJOaXZtK3kwOHNRRmE5TDZaVngyOTdleG1N?=
 =?utf-8?B?a1ZsakxnUWphQlBxbjdWY1FsRENxNWpnYlpIMUs0eEVYazNUSnlVdG1zNWR0?=
 =?utf-8?B?Rm1jNXR1VFZBNUZTOE9GdkwxeDlJTVI0aFhMN1VId1daVDdYdC9vRUw2b3BK?=
 =?utf-8?B?aFBOeDUydlpWYnNjY0FoUEJ6WEZZWjEwTHZSWGNPcitJQ2pROUNzV0F1MGhJ?=
 =?utf-8?B?Vm1TaUxvTzJ5Zm5XNktDL3lLalZBUldGK2JBbDVaL20yZ0lCLytqWVpzWnph?=
 =?utf-8?B?VHBHZXBjL2hUb29jVlhjc1MreXNkeThVSHpDbEV6TFVXWXhIbHYyZUh5L3lU?=
 =?utf-8?B?cDhzOGM1TW5aOUg1RnlPMlN5Q1BONitxZjErdmJnYnNlMmVlWm43R1M2cnlt?=
 =?utf-8?B?ZnQ1bmV6aGlDRGR6MTl1QUtmMTFWNHdlZnNwbkgxNnM0bXRoZWtSZ2g0WjNo?=
 =?utf-8?B?OGpMV2RTSFdjV1pYSGc4Y1laaDNCRWZYRXRHcXUwcm9HT3FMRjc0SXVqVzVj?=
 =?utf-8?B?c1BEMDRyQThxRk5aNHkrZ0xFQmxSZCtuN1RCNTA3d2VVcmVpb1lxQ0ZkaGtS?=
 =?utf-8?B?RUpPLzFWdHpvMDBaQlp6T3pldE5iekJmTExKQXZaOG9MRjNiVmlMMHRzaW9M?=
 =?utf-8?B?YzhoVUxOLzEreWdNemt5NEcxcU5QNG12aDYrYStJUHRERXpLaDhiVG5Ncm5I?=
 =?utf-8?B?eXlJSlBqNGNKaEFhaU9RZW94eWRGUFljRzNZa0hQZ0REVnl0ZkVNTXQ2dWYr?=
 =?utf-8?B?UHd1ZnN3d0h4OTF2UUo4SWt6VVpJUm04ekJjMThqNVUxT0xmc2pmZmM2TWxG?=
 =?utf-8?B?bVFSSElPR3VoZGdnTXBvMGhDK1hILzJScFBBSVMvQ2R1K3RMTDU4ay8zeUwz?=
 =?utf-8?B?NUVVMnFBd2VvNXJ1andaNS9JWFRBd3JLL2c3engrMlc1R2RIb2pHRUhoWXlo?=
 =?utf-8?B?N3ZFOGxUMWd3OTVLWmowTFJUS3Z2WGJwT1k1ckJjSVJkSXFpR2ZYTFVzOHFl?=
 =?utf-8?B?dWVtcEZvOXVYNkFqSUhpaHVUQ21hMWsyNjN2NjRUU0VrNWxDQmk4WlBJKzZk?=
 =?utf-8?B?MUV5bE9pWmQ4d2RMcEFvdXA1eDhFSGNVdGtCS3RCLytCOVNFc2xmK3dXelVq?=
 =?utf-8?B?bWRkbEhNTm5tb3dDR3lOeUUwS0taZVdoVTdzSFJHaldSQStMajRnNEZhMHQz?=
 =?utf-8?B?MXA4SnZyaUdpOXE4Q0ozRHFtRjNlNjlCbmpqTHBYblE2Vy9seUlOYzQwOVZm?=
 =?utf-8?B?c0R6QWM0OTNHY3dmbjV5d0NUQ3VxZnBMUVF3SFpPdlFWamZmLzgzL0tvM0NS?=
 =?utf-8?B?Z1VJdXZETUhYWCt6VXZEaUkrZkkzQytmZHMyRUpkb0VzN21CWGxMTWVJdVkw?=
 =?utf-8?B?M001bFVJOEQ5VEdzOEZSdnJ0bFFNZWhnUVVmM0VjeER2MlUwZGVwS1E4VkZC?=
 =?utf-8?B?SXAvRXRhYk9oRlc5WEFxUzFkdjlDTWs0dGdaMmhUWEs2Y3hiZXpSVWNhalAx?=
 =?utf-8?B?NDdMZEw5ZjZ3YmQwV0ZaWHh5c2h2TlYzcE9xZHNZdS94VjhGcnZjRzhwWkFw?=
 =?utf-8?B?T3lidXV2NnVmVWdqaTNrcmhNS3Qzd2hybWF3MTVSNVVuZ3c5OVBYTklsbW5z?=
 =?utf-8?B?dW5tOGprSitqeVpkaXNubzZFbzF0aEQ0b2VIU210YXBuRWdWNm1Ma2dQVTgw?=
 =?utf-8?Q?fpGQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1d0104-bc3a-4a8c-654d-08dd4a15fd1e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:45.8924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YmLytmhPz75xhGdTvq46MWABMBYLVlIHiofqJZG2RWN8mCyp1cAv6pJDrWpZ7Ef6VwqK8wOsOyPDHkXqWNUxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10238

Add linux,cma node because some devices, such as camera, need big continue
physical memory.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v3
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


