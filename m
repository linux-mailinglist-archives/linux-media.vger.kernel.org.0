Return-Path: <linux-media+bounces-25511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38371A244D9
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1F24165602
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF2E1F76A9;
	Fri, 31 Jan 2025 21:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b3FOwF5E"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013016.outbound.protection.outlook.com [52.101.67.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2491F7093;
	Fri, 31 Jan 2025 21:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359321; cv=fail; b=iGQ8eWwNkDqhdeGAHRc4gDlhxh75DnSjpDryWiCNpSmab8q46SK2o5KbBVh8Lp/gIk1UpsWQzFoqkRKXKSFF4rBEJKhPSXxG2WqNJ48gBP1shjFbYOPc7yb1InydJyI1oaaKwo/E2HfqpCPs2KViOsjCykVengVD641HOAp083w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359321; c=relaxed/simple;
	bh=4r9JH6vrpZvAxpP81nA4kZrOt/IsEBx55cMPx5bNtAs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HFDMemtrPfSgqfU5TVOmmkwjsXul2olT5tNUXSUWNoW/OvzHR+SEj9gLQJ6eyxUqZGo/qJdgNxYTd3HbB+teINSDaRswLSZC+nAMvIc1Ba/sQnjog3Ijh7E4T9OeEgMNCeP6VwZ60eoO5eNg83f1yA2n9heFyupdT82ZKc0i4Yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b3FOwF5E; arc=fail smtp.client-ip=52.101.67.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwfif4XDPJtQ9YTDizwXejqo+1eWLY3/GWfC1CuenGgMhW38q1ky2jT5Bw2drh8fDegs1ju1aZUcqdgStzTjx6DJnL42zLGwaEHY6a751cxqXEu39hIF1y/uh2tQf0kuxEnap/A0XxBGYWHDEE9i5HxiE7WkGjhL3HN2BzHW0f66+Z5283RYLfM02Q0bXF+aErbYrhqBOvFtfUggnn5/4CxKBwzUPC6MkR2aemKZKM6IbWnQvKPKRxtNW+l1KI726JE6BTsWjHKdVDUqVbQ24JMUOfvtPvgOkeEF3YGwFBPKqChrvSEdgAGM8kXmUSUm0xoU6vSE7Lj3SH+XYjD+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLe6HU/0cJv6+UdD13frsMtL8KmccsU+tM3/Vv+YY9k=;
 b=RRDxdNbx827/WZRkp3MkQS9Qlt03J9USynD29PRnOBalSPNA31AR0J7ZFx86ZAD8G7zCm9HQ4j56cFdW/+Mlkl5HIg0Ni2XQDAAAySWP2bKkavhzfIjt1DGzOY4fdSpB5rYMdvEHXMl0Gs7zIC4Wy47A3ycDx4xsWn03WYfIHtJY8Lq3I22CDLVqjQ4jGQmTKod7wlxYYARfXYq43tseng4/R473J7RWaBZf7NqHauprlBpzbASIhLEtgbTAV2iDSn6J0iZvnVjbcxOxe3rtAh44tgRDAXG11K1BnlG0AELlWB4+qziwHIkdjsdrpvK8cW+zvlgR83rcLQ7PHz/Z6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLe6HU/0cJv6+UdD13frsMtL8KmccsU+tM3/Vv+YY9k=;
 b=b3FOwF5EwZa92XKbsyHzy8XBx7L/j49774n4bUxJDX4ZYkvOx3cxXphmMIZN0c/+nqfA9tU6r+QM02aaF3hUeyxZtI3vInxXFM1OEw5rtIqd74IpQavDwObFsCapT+HI+KzE9MeDXl4Rnlpth6yHpCv0XXGO1ID49s/hAvZ4wqwZBW5G+ZgXaGA7dCT9kZZXLzg3ysLcDCKfk8SBGRwKItiHpCthBsYSN5zebwaDI7ZE3Ua7Bej8U/FWvwmw7IUw8F+oZ3Z1on7FUIrqFDgHpFO43JCHFdNhv+uK6tdBQTej8pXyfS6kkHWXsIe+PKA4YKj2dC3CQL/a7glCrzaMkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:35:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:35:16 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:58 -0500
Subject: [PATCH 13/14] arm64: dts: imx8q: add linux,cma node for imx8qm-mek
 and imx8qxp-mek
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-13-319402ab606a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=1573;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=4r9JH6vrpZvAxpP81nA4kZrOt/IsEBx55cMPx5bNtAs=;
 b=VT0uOTW+A1OjEK9lOnn9sv5yhwc48bQRKEjSRWgkCKmoO9zNnaw2ARXXlKOG/r6ste2cAuwel
 0VCJtqSQotxAbBmCpChdcNo0G1UBX879E3zwgKXPcTP42nCt4VFa32v
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
X-MS-Office365-Filtering-Correlation-Id: 3c9845a3-7354-47a6-8f8e-08dd423f2717
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YTNKQit5V0NPYTV2R1BHQ05EaWI3aWZQV284Q0NvSGU0RWVEcS84SStuRFE1?=
 =?utf-8?B?ejlIT3pJQVo3cGllaDV4K2dsUmI0bWNJQ3YrdE5tdmZtSU1rOWVKWnYvVUR6?=
 =?utf-8?B?WGp0TFViUzhtN09kOStuWklxWHVYWVpBTWwzODBuRFp3VUJSNzdjRVlLWldT?=
 =?utf-8?B?TVJ5dXFTN3hhdEVYcENhc1Z3RDJ3TEpVL21HVEFRdnZOZ04xNzBPQjJzSVpj?=
 =?utf-8?B?YjdNR2ZOMFptdW80em9Ndm1DS2tWQ3l1NEJKbnRaYmk2VTZYMm1DWGFSWnBa?=
 =?utf-8?B?QnZ3RW9YRVFGcUJXVmQxWHNJWnQ1TEo1SEFsMTF1TzhtamhTOHpFd2QrQzNR?=
 =?utf-8?B?by9uT1BLN0tJVEFZUTNiRFZpRGdsTko4NzNhUTJJVkpnaC93NTVzeDQ5NGhx?=
 =?utf-8?B?Q1Y2NzRhU1BvYWZCa0daT3g2Tjk1N21hTWxLTEVxNVZibmEzUXYzYVpOSVQ0?=
 =?utf-8?B?cmFia1Q0alNjOHI2QndHNTgzT09sN1UxbmFBbnYwVkhaa0EySFpHTGNzOGVo?=
 =?utf-8?B?b2xnd0xpTXpDek5WNmZTeVpGVDhRMjVPYVQrSURUdi93MGVzTkY4SmRpeUEw?=
 =?utf-8?B?a2ZvMG9uR0c4VmlnMW14YzRyR2J6MVk1SmtlckZySENwVnhXM0YzNEtNMVhL?=
 =?utf-8?B?RVhRVEJaWXAwa1ZCNFc3d2VGZ24rOTgxMitOc2hBRFh5dEthVUtIdyt2Z3Ur?=
 =?utf-8?B?Nk5nb1IrMkw3T1pEMGRVY3pYNGFyQnQwYXIrYlcwTTJGa2swUEpQUi9KaE9q?=
 =?utf-8?B?Nk9vd2lkeUttL0cyY3ZHKzZrYVhGQitMOTlNRW1YYjlQOUR6Wjdpb3h6ejc3?=
 =?utf-8?B?VDhJK21GejB3TmlMeDFXS2p6YVZTSFlGQ0UxcHFKNlhFV3J3Z3U0ZCs2R0di?=
 =?utf-8?B?M3VvT2NHUUp2Ym1UaHRXM2pmZDd5NzQ3bTlWWTIxU3RIQTNOTEtKem5GV05V?=
 =?utf-8?B?Nmw2ZnEzaS81TkRjSlVETUt0MkNyRGptaVozcmtGdXpQZTN5MWI4UUcrR3dG?=
 =?utf-8?B?a0svMWN1ZHJxUW1kSzM2RGhPVnpxVy9OYTNEOFB6bWtFWnZ1cVZKVzh5aVQ0?=
 =?utf-8?B?R0tBUlZUZDFGWGV5STVXc1lmdVN3VjcvVnlzQU1SRUlGL1N3RHJJejBJK3NJ?=
 =?utf-8?B?WU9yRVlSZU5yZWo5Y3hsL0MvS2NoTGF5cGNuYkxwTEhUNVY2ejVnYWxsc3VX?=
 =?utf-8?B?eHM3L2tRQzRVZHFxM25xYUIzMzI4aUtwWWJWYUhnNkZDVVYxcmdFY1JQQW56?=
 =?utf-8?B?NjMvVE9hOXNTYVFPd3QyWHl3Zmk5TUE1ZzhXV29lSUpYbTVyT2ZsZzRGUTJn?=
 =?utf-8?B?VllkaWZZeVVnWWU2N3ZyT1pweGxpNVltL2dVbS9kc0xldytKdWREYnFsdG9O?=
 =?utf-8?B?b2t4eklXZG5pbm91ck5NYkZ2Y04reWd6Q3NacWEwdEYxSFROd0treFpRNUp3?=
 =?utf-8?B?UkxIdVJCaHUxR3piMDQrQVBKbndpY2tVeGI0d0x2dHlnU0dvSWV0SGl1V0lR?=
 =?utf-8?B?QlVkd05sa2pWV0lMSVQ2UFgxdWRUa1ExSVQ5MGVTbWVZUGNUNHdKOEhWaktl?=
 =?utf-8?B?TCs2ckcrUVdqTWY2ZDhqa1RZVGF1KzlOWklBRk9pdmZydzhoMmNIaWtGL3Br?=
 =?utf-8?B?T0ordFBHVEZCRWpDL0N2cW52NTV4aXVJYmUrQjQwNzFNUkhzRzFHb21kdFEy?=
 =?utf-8?B?blJFejJVTkhBS0p3QmFEa2RrNys0NE0ydkp6d2xNZnVTWElRYjRXMXFadE1O?=
 =?utf-8?B?d0l2cEdzenNVd2ZjSGFTNld0ZTViTllJdVdCQnRSS2hjamczZFYybk51b2Nt?=
 =?utf-8?B?Z3UwRVl6dS8vUjJtR3FxR3l5YklsYjlKSFFtZDhRd2RFQzlyWUZzMGhEb3BE?=
 =?utf-8?B?SENPR3k5QTZXVkVod0NuRVhtRzRXNWpJcjBOaFlSdXYySFo3MlpSVC9teGQr?=
 =?utf-8?Q?3Ke7qnx+31Yz0eFy2pycWzb0CAfjWa/U?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SUlRSm1NL2VmMFZ5dlJneVBjYXRWT3NWOEY2SFRyMVM3dklibUhUU20wRFU5?=
 =?utf-8?B?QVF4VzRkRWk2Zm5sOFBDWHVpRWYwZXVid2pCOWxaaTljVGszMC9oeE9ERkZw?=
 =?utf-8?B?ZURuektaYnZFSjBmK2d3WnlkWVk4ekFmaVpXNExZS2c1eG9jZ0t0VVZUVGlq?=
 =?utf-8?B?Q282V0tSQ1ljN0dWcVd3R0xxR2laNDk3M0QxUGp2clNNTkZ3cFIxY3k1YmFF?=
 =?utf-8?B?dG55MUJmS2xnNDdlZTlCMFdaaDMzVE1Va2xMUFZTdHk2UkJUZFRLaGVHZmhP?=
 =?utf-8?B?RUxwbXRZc2RPSm9ZY2RZbnNaUzJPMlRySXpRTUthNE5rQktSNElWY2pmRzJ2?=
 =?utf-8?B?TnJTMEtpSUpDbFJVZUJ2a0JTamNWNjhiYlVyT1hBa2lFNHNkNm5PblVvWTRN?=
 =?utf-8?B?MUVkMnJRV085WVpzMGFHR3JJWC9hZkp5b1ozV2hKb2I3WCthanZJZ1pOaFp1?=
 =?utf-8?B?bzNLdDc2Z1M5NGV6TW1jVFAyRHVaeUlhdWdEM0trSUF3Yk9jSlRTWFJZU2lm?=
 =?utf-8?B?N2lnSXJXMmdqSXdaMElNWUd1UnZKRFdlZi9nNGNHcFFWbHJFRmR5bjFWYjJC?=
 =?utf-8?B?SDRTcHgzZHhuMG9Zbm5sRDZCa3Ywcm9hbnR5SU1PQk4xWGY1YlI3WFI1WjVU?=
 =?utf-8?B?N2QxNkYwTVEwaGcrOEd4VzA5UFA0V3pMK0ZEK0NNajFiYmNidTk1SndqS2hQ?=
 =?utf-8?B?N0R3TlV5ZXhpNm45bUV3RTdtWnBiMVUwQ3U2UnRBK2tlMFltQWM1eVdTMWJk?=
 =?utf-8?B?bnM4ZjZQOW9hZ3FtTURnb25tNDg5M2VnbTJnaTFWK0VSQVlYdWt1T29qTEh6?=
 =?utf-8?B?L21naWRWdzBYZi9HNGxubkZlRVBpcFZqMEdKLzU0SW9LRGJ3d3VBMUtnUWZP?=
 =?utf-8?B?bnFsaEhpdDlFNzVmcC9wUWltUTBBZTFSM3ZDMWJYejVUWmlPK3IyaUlVTFRR?=
 =?utf-8?B?SE01TVpoeEo2LzFiZlhrQjNtWHVjSlI2RFBrZHJXSzQ3TmFoNlVyMkdCU215?=
 =?utf-8?B?SWZsOXBzSk1ITU51S0loSVUzTzRnNnVsUnpsOS9PM0hPUWlFNm9Zd29zRmRD?=
 =?utf-8?B?UEo2UERzNlVnYllJMExsSkhBSGl4MWJkRVEyblo5d3pocy9DL0NhVXVrSk9a?=
 =?utf-8?B?am4wMDNzbnJ3bE04eDJLeUlQYkhnM3BDK3NFZmVvSkdzSFl6aFJBR2diVDh3?=
 =?utf-8?B?SWtnck0weGtFSHg4eld4MVZreUVnZkl5OTdtZmYvVEMybWg3NmlwaDZoSjRV?=
 =?utf-8?B?TWMxUXdBd2FOM1hYRHdGaDZvdnJYY2p6ZHh6M0VoUG1ONHArM0tLTmZ5ejdQ?=
 =?utf-8?B?ZGY4M05vRjNvbTZwc25KTlczSWduZ2plZG5LV3liVitLaHNvRXgxQWw4bzlD?=
 =?utf-8?B?aVorRCt1WW1DbGRXMWJOZlJaSFY0a3M4cWp3eEx2QVpZUnN2QkcveXoxQXA4?=
 =?utf-8?B?NGhsYjlQcjl3U0k5SDM5bzN5MzRqNk5BUUNvdnJUMlRjN0dqY1E5K0xWdnVS?=
 =?utf-8?B?Z2FoeUxiRFFqYlNhOXlKNVhYWU5SNEt0VFVkRUlWaFNPb2JzQXJPWjJBd2ZO?=
 =?utf-8?B?bTdwS2FSd1ZhYWFWdDJReHllTjA4dkNUQTVaTDA3MDgyNG1KYi84UklCS0xQ?=
 =?utf-8?B?OE9kQXYzQ0RPYlptSEU2cDh4d1JyU2dzV2U0YkhZdDg0MXRYSWw0NVZaNUE1?=
 =?utf-8?B?dzNLbUxqbkVaSXRaR2U4OElFTEVqdkpESU9QVE9KcFVBK0xNYXk2Mm5NWFli?=
 =?utf-8?B?WVhiTlN4TmQ4VUgwNGVrMjNNRFBxdmYzVzZsV2JFK1poWVczSG9qVlhmUTZN?=
 =?utf-8?B?QTVJMmtvdDdWUjNLQzNiMFpLU3A3WVp5UytucmlPYzRUVGVUQXBqTmpURzJI?=
 =?utf-8?B?Rm9VcC9FdlN4ZDJLS3hva3RWL1pMRHoxVEFWNGJ4d3FpWXd2a2orTTVNc0pB?=
 =?utf-8?B?M1diU040Qzc2Nk91U2R2a1NKaEtTU2RNZEdHMzdDVFdmY3c3U3p4czkxdnRt?=
 =?utf-8?B?aWN3N3FGN0d6M1BxSHo1dUFxcGRoNW9DRE9CSkRpRWFuWVR4bE1QcWFnQlhy?=
 =?utf-8?B?QUIvdVlHTXJwMzZFYXhWR0daWnJwZXNQWlZmTFJEc05oS1VjaThPOXJ2ZU9a?=
 =?utf-8?Q?z/JI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9845a3-7354-47a6-8f8e-08dd423f2717
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:35:16.3660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ObKnqtANvwSLwgDB+eIQafgagCL2Uz2a+BPXorF2567Aqgt/dNQrsiq0g7R0Wtn+5M09RtPlNwaOed0Op8Vfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

Add linux,cma node because some devices, such as camera, need big continue
physical memory.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
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


