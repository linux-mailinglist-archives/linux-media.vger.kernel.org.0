Return-Path: <linux-media+bounces-25505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8DEA244C7
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A9343A30BF
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374981F472A;
	Fri, 31 Jan 2025 21:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kck9iYH4"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5781F5600;
	Fri, 31 Jan 2025 21:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359287; cv=fail; b=O6PzTirTDEMhmsefdTo2xy+PNjUVRT33CZ+ny2yk6ke2t31J9BGue8/jaBDwdc+SePp1J5EbVo4ZtmfL6KzMRcOFYzrK9QdTuKMXb9/mVWHMGRQQiA1t+eZC8Hkb8B6VwT3+FvnaRBNEM0A6bUUBrpiHFpHQAKwFon3ETfraeHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359287; c=relaxed/simple;
	bh=tscqvOYKx7ykaDjl+4U/r7amChrdpZfnlGxBcMh8jjA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mh1vIHauS/eMgu+lkoZFX236TDKSv5/k3u5GoPWW3hfBfLY+5JzrhUjEpyNW27DrKSfoSAR/wqiuxwnmAXQ7uyqvPwmAvNYcMs1LGUxcVnqCwIW8Y/kn2CkJM0k9AVZ9RxDM4Z5qRroaDUFkMJ3M97zOFm4pe97c4PbKZblq8LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kck9iYH4; arc=fail smtp.client-ip=52.101.70.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GoEIwNYla18iN5+98qtA3ffzo6tkOatxJRoFTOgE6RPaikDY/as61SEIoLdHCYkv9mcjMPKgxSH3W7aQ7yFNsUhrwoPf3Lip9YfmjfrOHivRiXNm3gqnAIOhYmNDkmWPofFlSB9wQYrrFA3kGNTzzj9vkbwHsEJSyhcS9nK4dYdrO+RmRf8m60dYBCed/6B5arew5Pp2zRcXqEVHEfrJf067eNrbgflx4vuJM6WPeoXa2BcQCwvqVjmXHybG5nYA21T1IxutKF9AtVmXXBwzSWPpZNfioqZUDkBH0Z3FCo7GBUREiduzlpEMR/yQxBdItMAxayWr2FYaSM6s0Si46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pf2vlhQI33JLuIp+otVW543/HqPHvOAvfOmaixq3qw=;
 b=eAwrgiViEMshI4nHTA+5YxXzXKU8AV2jpfemu2uUZipXXvyEWZjSSDb/F/QRv8y5sZW7PEEeRTCYBuuxWimggr0Xg5qQgAFPYKcMQU2XkAv+9v53ZllXk0bv7dB9ntQy51wChWUxMKj4VOfblFB+5oOmm5lYt8Cb0mbHn3ycF1DDw0TeHba+rjoGVS7Nixxq9NWU/t0iYxe+ALrmjH9XBOA0wMgpDrRL5ICWt26uhMdLxTMy4bt7rTrOmAEv4PW3jYzizHpooQCjXQg7z9746V4v2YHS3nElKKDgjRYpkbf7EfwJQ1f7CxlPGNDqBVb08t/vQBFwLJOKzZSQ+XWG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pf2vlhQI33JLuIp+otVW543/HqPHvOAvfOmaixq3qw=;
 b=kck9iYH4nDVTF9KXDCoqCoWYAUFqRTeKcAGrHunYSGZ/WS3qALDfBOoaM3XYEZ53KSBM3DqpgY668BDkXbcmrdNXq4NkjAX1x/PWUz1zqHIeCw9tCkLLZ4fLwm2Ep+Db4de67TQgPlNIVExc2ZErcZQ8G+C697o0Bt9PWQlsHOWyj5IiYZ2J2Pi+1T8iO4Nm6buKMDFjaiYmvcIa/WT3Q2w/WhUDX/WBBf+6LjFsyeg2194RmOQ7A3SDlUExAJ5a0HVkH6iic35HPc4Kzu1MTO0aIAaUCtpcP5fVQOho0XcI0VcnDByzp4YTMu2gwN0sCvXPw5ns4Alw9ygWpR8N0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:52 -0500
Subject: [PATCH 07/14] media: imx8-isi: Add support for i.MX8QM and
 i.MX8QXP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-7-319402ab606a@nxp.com>
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
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=3555;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=A4z6XQP+PLeK0xyKR3sCZcOLH+Q5jIXDTo+sf8T+3j8=;
 b=cfe58CewxdkNj2u+Zq4iaSn9Ds6hZ467UXXyqd6pwxuyP2fdqEijm4J5DC/KXHYpyG0Q+HlGz
 TTnTmDTHVkrAcE298M6bDThZdfe59ZfgBPu1oGbf1YfH6CY/tXW0KuQ
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
X-MS-Office365-Filtering-Correlation-Id: 6e4ac5d8-b753-4d62-cf17-08dd423f1256
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?S0lvR2d0Y1lpQVhxbzliS2FCUEovN3I1ZU9ORitNTXQ2Nk1WTCs0MUR0ZDN0?=
 =?utf-8?B?bEtyVGwwV2pwR0hUb2ZoVm53RUpqZHF4TFJUZ3I3ZUc2d1dPRWFOUzhMMjJx?=
 =?utf-8?B?WnJoMjcyRHFZUU5SSUxxcVBId0hPL0x2V1FVc2NGMGFwZmhNbC9sdXM0ZTMz?=
 =?utf-8?B?cm15dlltajRGdkJVb1E2dXEzaGVybHA3SVJURHdjRE0wOHFNcU5yVmRIaHRN?=
 =?utf-8?B?SXkyVDhwQmh2UkRXMmpLWG1McmhDbEdLc1JWZVAwZDA0NFpnMEpacnlhUDFE?=
 =?utf-8?B?T0pUd0NUN1QxUnNxTTJobkRFRlFnKzZPNUg4QVc2K3liYVF0dXAvQytRTXkz?=
 =?utf-8?B?QXV1c1VNRkhQOTMrT1BrVUZ5aStBSmRYMEtvTVFkM0s3VjdMVWtLaFIxbERY?=
 =?utf-8?B?eEdUT09Qc1NUbzAwRUhoRDJHZXJSdFcyaVFibStRS3k0TWh3eDBGQjNNZW1W?=
 =?utf-8?B?MkV6Y21mMGwwUS9WWURIY2J2V0FkUldHS25rRG5peXVqeHdIWmxkMVR6MWtP?=
 =?utf-8?B?MExTZ3UxM3hXeUQwano2WnFJR3NmMlRyaFpYMWVMc0lPYXQ3aFZMT1FVc3BN?=
 =?utf-8?B?RjRCZFpBWW0vWjdaeHMyWmR0VGpsYXB2dStLWVNtNW1LL1o5SlhaMVFKQUhF?=
 =?utf-8?B?ZTFFT3o5T1JaYzB0dERWWk9tM2xNejZvcW50SUtvTnZhYmE0VDBKbHFwcWYz?=
 =?utf-8?B?N25IU1dNVFZKNUJMR29LbjhJU2EweDNzOS85V3J4UFBhOU9qNnFxQ1pZQlVY?=
 =?utf-8?B?dnRCamxiMFRFemcralU2WDNWQjljaXhZYzhBS1RtMXNNSzhWZ1NaZ0NQZVI1?=
 =?utf-8?B?WXpNUVhQVjFjRy9QMmk2UmdsRWxsMFlTNXpBMzlkcThGdmtqd0FwdTVRaFBY?=
 =?utf-8?B?UHJsa2tjSWhtd3NnYXFFbnFNT0lsd1BwOXViQWVQYWxaN01zWWdnZ0IwYkhh?=
 =?utf-8?B?aTIvazBHYUJKZVpoR0p2ZXI3NEFiVUprZFEzOFM1eVBCUjVNRkR1VTdrTXdy?=
 =?utf-8?B?NW5XWUxlRjY5bEdaU2ZQUmhrU3JUV1BUd1VaeXMzUjNSOWc3Z29uZzhOV0or?=
 =?utf-8?B?S3RTdzBvaFl3TDhyakRyYkU1akIxNHArUjNjKzVVVVF0MEYveTVPeENpR3hk?=
 =?utf-8?B?SnJhWUJ0N3AwUE5kU1lMN1A0ZDdjS2ZMMnZacEVsWmd5Ymx4RVNxY3VWTTNW?=
 =?utf-8?B?Y2kwUG1qL2pSb0hsZXVzZFhWL2tzVG5hQnVXU0tWeXMzSlA0dXFmU3FCTEZS?=
 =?utf-8?B?TWFtWHAyMUtXd3JpdkM1M0dEYzY0QmVLSzVWTll2cXdBV3VhZjJVQlBaTVB3?=
 =?utf-8?B?cHkxcndYY0E4WTJFYS91NysxdFZQTGVlOTJnYWwrUTdYMTRXNThIZ0MvZDhz?=
 =?utf-8?B?dzlUNTcwV1RkTmNzZTc4b3NUZTlxa1pJbW1ucDR4MFJKcHlPUjFFREpkM1Qr?=
 =?utf-8?B?TjAxYlZqTkdIQ1JEWlYxQXNWbnJ2Zm5zdk05UU1yS2hWdHNqMXNJSnYvR3gv?=
 =?utf-8?B?NEVXa09uUlF5U2YrNEdRdkpUcVIva0VYWEx5WGRiNC8rVllMUG5BTXN3NSs1?=
 =?utf-8?B?aUtLR1dzMVlGeWtialg4cnJ0MHRZdWZGNWZzTjdZNEVyaHgrRGNCa0E1T2J2?=
 =?utf-8?B?VHMvNXJ6UDR1cTA5NWZoOUU0dGx1OElGa2JCSlZYZU5RZE1tcnBYWDhrTEl2?=
 =?utf-8?B?MjNsbUtFUUs5VndiaHNjKzlMSm1DSzk4dFc5WnhrNEsxalFlcjJRVTgvRU1o?=
 =?utf-8?B?OEtpSURIZWIvb0hoT3JIM3lzUnc3OVQ2TG1HU29ENlprM2lJeFR0bzRhbUpT?=
 =?utf-8?B?L1pIRWxHWVFudFRleFhrSkp6TlFrYnNRMTNiTFlnSVVjNzZLTkg5b1Awa0Ro?=
 =?utf-8?B?dDdiTHVyeTc2cFZ6WGdlOE8rVmpMWnhPd3JoQkpBdTNVRzNDTHZDYzFnVDY0?=
 =?utf-8?B?UUtiU0w3UDlYdHFpc0FTWTQ1dnREcXMvVzhMeC8yYU1hakxRdmhTeW9EV3Ex?=
 =?utf-8?B?bmdZd01jcFJnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WEV2Y2srMmhCTWFZUHdNUDdpcGpMTW1mOUNScmVHTy9BZ0RnYzFjZ21kTFpi?=
 =?utf-8?B?aGV0Wlc0M2pYNWhnSTRvazdGMUt0VzZQRG9IUmdYVVl0VjVSSjF6ZFpCbHBv?=
 =?utf-8?B?NnFPZTZHMDlIdHl2bDdiUXpPMGNJeDFRZFpITGNyRkNYcXc5TnFiYk1MUzMr?=
 =?utf-8?B?VnlGQVJ5bXIzSnNuWGt5L01zUlpwc3dEN0hsdXJuUFpCQlg5T0xOeGI1NEFV?=
 =?utf-8?B?M1A0QmJrUFBFREs2V3hCNW5zNzNUTU1FZ3lIdkJldVNsc0dGN1lONW5CZlo2?=
 =?utf-8?B?MzdzNTkvcmYyd0JNWTBYQ2NjYzFTWSt6UUdrZ2ZrVnJ3YnRodlVJRlI0cktD?=
 =?utf-8?B?T25BWEFQRTE3U3JYSzlBbG9WcWlTM21aTVBCMHpiaGFuTXVmdGJXZ2dWVTk2?=
 =?utf-8?B?ZWRnU3A4WVFIMnJxTFI2VE1IdmFZS1dUQytTell6RnlWeTl5RGxLQWM0R1RL?=
 =?utf-8?B?THVLaXBsREt3Q2VqTERVUEFrVDZFdWNJWUpSblJIaVFXaFRlSTNrY254WEJJ?=
 =?utf-8?B?dGk4MHBQSGN6RE4zeEhTMWR1eHVqT05ZNVJwQ3cwc2ZwL3ZZWWduYmRHalVy?=
 =?utf-8?B?UDl2a1FSb3ovVDhoYUVJdWw3WGNhZm5OdXpVUTI2TXZxQXg2dmNWZE5BZU9i?=
 =?utf-8?B?ZUFJTHBYczZFZmg1R3lMc2ZqenVRazBJL3I2RzV0Q1VXMDgxeFlmbmpGbWRw?=
 =?utf-8?B?QmZFc3Npd1FocTVMbmo4NnlWanR2cHdvdHdqMEhMRk8xWXFleFlkU09Ucmdh?=
 =?utf-8?B?VDhUaUszNlpwcEl6VHJyQ1BHcno0MlJ5Q2h0Vlc3eG5rT3VhVkdwS1ZSRnJa?=
 =?utf-8?B?Z2tyNVYxbGZuZUJxWCtva0Fkd2pXbFBvcmN3TVhrK0Y5RUNZRlZtbzZ2NlBF?=
 =?utf-8?B?bkNQMUZuT2NLLzFLS3Rqd3JRL0JmNlR2WFM0djFEbUtabjh2Z0NNQ0lJK1Vs?=
 =?utf-8?B?V3E1aE5ZUkVTRk1qZVNFSzA4UE1ON3ArYTlPUnR6Y2FiSjZqSHVwZHlKSFp6?=
 =?utf-8?B?YnI0bEdqWUt4Nk9lRktrMGtuc2hVRUZyMmhPaEhKSWp0dHRkemtkbml0K2tS?=
 =?utf-8?B?cDhObFV1NlhvVHAxOGo1dFc0NXp3UC85RUVOTFpuOE90R3RwM0pYT09BV2Rp?=
 =?utf-8?B?TW1qWFVSZS9aajc0UG1uVkRtWG5jTHFmbXNBdFJuSzlUVmlFZXZjWktRb0NO?=
 =?utf-8?B?QXJYM3FMcnloUm9Nc2xTalpqdU04SHRmd0k4N2dmbGRtTzRBRXpuUlpRam00?=
 =?utf-8?B?S0ZqNG9pT0RGeGRVMHlGZTNaVmdKL2tqcFRYL0NZeVRKUWxBMTR0a01OWDQz?=
 =?utf-8?B?R0tNVnV1NDQvVkJWTVpJTnhCOUFVcjJXQ1ZvRi9DOFlwUUdsTGhmVWk0L25u?=
 =?utf-8?B?TFBXTUw0cmx4RVdRMXZLalpUbUkwS29RU3R1SFE5OG14MlBpM3BxU1dBOWZD?=
 =?utf-8?B?THl4V1dTTWFtQWJIUFFwSUR2UzFEZEJnWUt1VEdEUnRpeXF1TTcrQ3BvVURi?=
 =?utf-8?B?cHh1T1RNODZJdnNuTlR5TkhxMkdyYXdkaEttVUhoKzR4dnRpaWpjeXRiV3Fu?=
 =?utf-8?B?dTNLdnovUUNMUHlvcStLRVhwbEtjNjJ0QlNNZnZOdEVtRHRwc1JpUXUwK1BT?=
 =?utf-8?B?ZmRCM0gwQ1FuZXNpUEQwQnQ1VkZJZmVxZWdua2YvT3RlU3g5USs2Sy9ocUJI?=
 =?utf-8?B?bzRYUGZ6UzBGazJQWmtOQkhSRk55YkVVRm40WFkwbFIvcGptWCtQZTRiSE11?=
 =?utf-8?B?WkNGeWlQczIwTUpabUkzekdRRCt1WkJLUWxoVVRKU1NvSUNUenFHaTFkdC9K?=
 =?utf-8?B?bndmVkx5dk1ObXNBTnk5bk5qaHZOWC9wZFlnZWdGK1NKSWczZ1E2VjZxQVRj?=
 =?utf-8?B?cDZ4RDl3QWJIOUhlMzdTNitRUXZPa2tVNTFab3RTYkJGSEhURnZoL2hTT0xt?=
 =?utf-8?B?QVhZbU9QZ2RpTFNsaFYvbDZiMDBmR1dEd0tLRFRkVHZGMVRZQUhRNW5WS2dx?=
 =?utf-8?B?VldTMHpkZ0tPRlZ2ZE56d2twUEs3Yytoc2JTdlI1dFFkTUtxWlZXRWJyWGw2?=
 =?utf-8?B?VnpKU1JKNUVURnJBbXVhcG9RdWZ6KzQwcTZmRC9PM2lvYkZnNWNkZTJqd0tI?=
 =?utf-8?Q?iqfUT1sS5fYc6huwcrCx29yMX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4ac5d8-b753-4d62-cf17-08dd423f1256
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:41.5586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/PcT35EjBikMgJXPrIxhN4i3W6PGfSf7BqXuEwjG7QfMwsETKPQDPLKt5zuUW1OF3a2r/ITLa6Aj5q3hc1G9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

From: Robert Chiras <robert.chiras@nxp.com>

Add compatibles and platform data for i.MX8QM and i.MX8QXP platforms.
There are 8 ISI channels on i.MX8QM while there are only 5 channels on
i.MX8QXP.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Reviewed-by: Robby Cai <robby.cai@nxp.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 47 ++++++++++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
 2 files changed, 49 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 1e79b1211b603..a3237d76f7aa5 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -274,6 +274,25 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
 	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
 };
 
+static const struct clk_bulk_data mxc_imx8qm_clks[] = {
+	{ .id = "per0" },
+	{ .id = "per1" },
+	{ .id = "per2" },
+	{ .id = "per3" },
+	{ .id = "per4" },
+	{ .id = "per5" },
+	{ .id = "per6" },
+	{ .id = "per7" },
+};
+
+static const struct clk_bulk_data mxc_imx8qxp_clks[] = {
+	{ .id = "per0" },
+	{ .id = "per4" },
+	{ .id = "per5" },
+	{ .id = "per6" },
+	{ .id = "per7" },
+};
+
 static const struct clk_bulk_data mxc_imx8mn_clks[] = {
 	{ .id = "axi" },
 	{ .id = "apb" },
@@ -334,6 +353,32 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx8qm_data = {
+	.model			= MXC_ISI_IMX8QM,
+	.num_ports		= 5,
+	.num_channels		= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v1,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8qm_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8qm_clks),
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
+static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
+	.model			= MXC_ISI_IMX8QXP,
+	.num_ports		= 5,
+	.num_channels		= 5,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v1,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8qxp_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8qxp_clks),
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -541,6 +586,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
+	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
 	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 9c7fe9e5f941f..496cad3f9423d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -158,6 +158,8 @@ struct mxc_gasket_ops {
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX8QM,
+	MXC_ISI_IMX8QXP,
 	MXC_ISI_IMX8ULP,
 	MXC_ISI_IMX93,
 };

-- 
2.34.1


