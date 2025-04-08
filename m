Return-Path: <linux-media+bounces-29682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56788A817F7
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F465448EDA
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01990256C7A;
	Tue,  8 Apr 2025 21:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aQuax8oc"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2075.outbound.protection.outlook.com [40.107.241.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D565255239;
	Tue,  8 Apr 2025 21:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149255; cv=fail; b=HCR7IGZyICsjIuqLn+5kb71VfnU02m14CCXrsqxk4jChvscHjrjIiAr73Fhh+lE1xt8xQjRvJ8RuD0TlDuC9waciHGZVy71ecOISOjOCrMZeI5JYi2Yy+3wFbS7hZnx5cR6CUCe/qHiESXd3BQWHX2KCcggSu90EtrQaF3Htn3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149255; c=relaxed/simple;
	bh=NmWY5lQ0wDC6DARs+42lOLmZRItY9ghCAf/PRetKaOE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jcCSe/LAU0oKiXWpJyH9fwaqY4LGFNCm1nKJ38pXeQf+TTMe4xSQIg0UGhx+nbN3EZdcUd4dqQXdEYYBlg8xu0VpUzSkf8eXozRBOdBYx7Kk4kAmLhzpHayQ+/Jz/vUC7/fd/3jmo1QUzchZLrxKrokvdBkA76XWZqbQREtvXOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aQuax8oc; arc=fail smtp.client-ip=40.107.241.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAFGuHzUG0p7FnXiR83BIbF/WMSDgR6YByHMkRiaDlF9wXA9FWThy3idWiMsYnV5L40KPBKD6zbLkkA8AnxDnueDf4KLVRvGCKIO4YttLWHFrn9ejDOVHHFfu7M63fcI5CVFCCXr20iwG7nI05xld0zBJK5my1Fdh2sUJIbtIR/f50zyskQxYD3Gt1Dk4H6t6v3fhVkvMYL4ELUuRGvZuKWiS10cdHifeZcJLmlw984AdHy0MuKLc55JHPskh2ivSh46vKKYibf2R9MQ9s88FZtAif1JzYGrHcWj6ZJ0Om4VJYSy0N9h5lgdF6BLfGybNysWjwHlfLu5dwO8oKH6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7HJQ2hAoXZ3YLXCtp8CmzB59RjwMxfkFMOMkFzI9l8=;
 b=bphicueNXT7+GP0+7gPlh8sOSwQKU2F6ZTIV4LGB5bxk8ru9r1/OXneaTsI7kQYfRBTKRj4m8T2x8LbtOYU/FvqbnbV8E5SI4HLRs+cypy3WmeQzAiX7PcarWFOoHxHx29hwF24D0DT1BWHje+AWXnBjdXSiCSYjOtKwmJ1kCWPE74cHAPhfH2fUHa29raQCv5b9VC5o+vWTfHExh1PKVsUd9Bsl40lfVczoC3oKMt1sTGDWeY0rMhq8KAWMVg69UJc65vSrRKsAo4MBrx5KSdvE5k7hG9zVM3j7g+OT56xNGspXxYBadNYVq7sCOdFOU7OVwn2Y3Gh/oW1cTSeCzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7HJQ2hAoXZ3YLXCtp8CmzB59RjwMxfkFMOMkFzI9l8=;
 b=aQuax8ochjxWI8VLVO4efRoSbgrBFMcBb99GV7zuksN68LtrOW7JKc67uEPpa8quv4zUHB8zLkOhJzvDB2tvrwZAGmUvP82JzPVcWdXulhI8oW/Rd4E/zcO2YRyCFfoAgpyOl9RfEMuLY8FExIvG0x6nMY1VUlT6pymivcRUNL1NrArPJDnpkiJAtO24T1noOql5tp3ZjByB/vTyYI+3/pzRdsrjgCXjCx7vqbP6GdCd6qJh+uhtIn3AmB3rqXwDZDCJNJacKoMK110g3yScrmfTLWeWxU476UZ9p1jEUpSVZt5buEc2Utb4HUfHllGWIvfkHAfQQ1hmvtEkbvAtHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:10 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:02 -0400
Subject: [PATCH v4 04/13] media: nxp: imx8-isi: Use devm_clk_bulk_get_all()
 to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-4-ef695f1b47c4@nxp.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
In-Reply-To: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=4942;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=NmWY5lQ0wDC6DARs+42lOLmZRItY9ghCAf/PRetKaOE=;
 b=PlRAskn940mlyeA2Pxt5d7GFwL7NxNOmByoEXcu4hc9JE1iio5wMJYFTtDpEeDhfHqx1FoJU+
 3kvnbGjZ82HCdyThePWO+vp4IuHHFy1DG0sjQ2wft8uQoy1VqvlWW3N
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:510:2da::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: c0702599-682c-4f33-52dd-08dd76e7e4ac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RTBXTE9FYXJvOWExWUNPVDRhaHVPaGVPaGVITGR6YU1KcEhHRkFzbmpUU2NC?=
 =?utf-8?B?YjVYWC9vWGU5RmpwOFBYRTI0Z0cxaGIwa3Y3QkNTMDlMNTJhT05SeThrbGEx?=
 =?utf-8?B?cWd2cXJJNXRmcFdkZlVtdFhqZmpROXZVNTE4VTh3SG9YQ3RjWGhJNGVjT2U2?=
 =?utf-8?B?K3RjUS9sOW1STjdVSVRCU3RKWTU1VXByaXI5bHJaY0hVd0V6Z2pCNG01SXBX?=
 =?utf-8?B?N0Qrc3NDZ1VobkNaTmQ0MjhZUURzYlpWUHl4YW55Z2kwVEpqN3VuWU9scmkv?=
 =?utf-8?B?NCs5bkJHOENKeHBNTkpKbXlNVkI4d3pCSHhjVDFvT3hic2FCVkdqb3k3Vjhz?=
 =?utf-8?B?SVc0R2hrUGtSTGJhNWFCSzlzUzdSMjlhdHRUUnlqN1E5S1Q0eUhITnc2RERP?=
 =?utf-8?B?Tmo1cTFmOUttUFRrY0g1Z2VrcUJRd0t6YXRzWGhFeUI1V1grOEtoNnRpU00z?=
 =?utf-8?B?SWR0c2U4SzV1L3RSanpwSmxsNjdqRFNBOVMrNHQzdHNrenB1K1FtMEE1TjM0?=
 =?utf-8?B?cHowZ3FsanBPV3RaNUpsUlRRbUdOTWVvTmVyKzh6VzFnU1dlN1RFTWZuQlNk?=
 =?utf-8?B?Y3lIanZ5a1pSYVJBMkZtaWFKSkk2bVpQajFsMEx2RFBuZ1RlS1I2aUFsUmR6?=
 =?utf-8?B?ekQ5WG9YRzI3ZWNEdFphc2p2Mlp6WE9PU25kVlpQbGFLa0E3QmJGOVFBYkdl?=
 =?utf-8?B?WjE3WXcwY2c1RTdRWVNvQzV4OG1QQ3FlaFJOeDJrUWgrSUxMa3JSTlNWYnFH?=
 =?utf-8?B?M3VxR2VtT1pjaDJXMUM1SVVOR3FlUWJZQVF6K0NHa1h0T3YwT1BYdjJMM08x?=
 =?utf-8?B?cG1jVlQyVGlUQlU0YzNjUWloRnVycitRRnZTQjNUMVVYcDdLZmZJZlNGa3VT?=
 =?utf-8?B?eXMyMDR6WVB0b3o1NHl5ZXIveHBWYmxSelVyRG5lc1M0VjJRd3NFaUlJaTVT?=
 =?utf-8?B?Y2g0VWI5Q2dlMjZQZXFoYkhNWXJvY0l2R0JXcnh0TWlHRnEySGRGYVlkTUEr?=
 =?utf-8?B?TldtVSs1dzNyZzF4cnY2di81cXN0bG42dGRRSmpSQ3hLcEs5bVRSejNhNUdF?=
 =?utf-8?B?WjNaclI4YUJrTlVxeG5YQ3ZNRDZneUJXM3I2OWpRQlBrOUxGa0xYbnJEblpY?=
 =?utf-8?B?V2R5RlBBQzB6NDllNTkwV0tTQjI0bDdON2dQVkcwTkNrOW1wd3o2eEN4YWlL?=
 =?utf-8?B?YW5SN1ZrU1RRaUtEbnpLQjBPNkR6aUZoUG02N1VVQW5Jd1lLN2loN21HN2pi?=
 =?utf-8?B?clQwZHhHSHczVEZrWHB5c0crY0ViTTZDOStnaTRMNm9TTE10VTYyWVRaRkpP?=
 =?utf-8?B?YWt0Y2ZvOU5GbnhhYzExSzVMZFRKczNwdGRZbTVCVHZRTzNaMFBoYVc3Zkkz?=
 =?utf-8?B?TU5nMlJGY0xwY3kveEVSVm5IcTY1ckxqekYvTk5DcUhwVmM2VVk1S0JJanAx?=
 =?utf-8?B?STJyZVFRR1lxTWl1bnA3U3lnMjRjV1FERVpKbDdSQ2ZBVFIxbHZtTHYrcUJt?=
 =?utf-8?B?cm84TTJUTkVmRWJUc1E3Mk1qTFVLcHRyUnRrcW5hMWVlSmgxYm1jNGljdUM0?=
 =?utf-8?B?V21iTXpwUUQwaUVSWEJRbEdydTFha1pCRk5uYzlUT0tXay8rY29ZWEtXdmdp?=
 =?utf-8?B?bzQ2WDYrdHRPUi9CMmNzTEp4ZDFIV1dDRWNrYUpBdzNlUnJzdmNLcEwrT0Vz?=
 =?utf-8?B?WmhVRWk4dWlVc1d0SkthRGFkdER4b0FudVI1ZTJRWER5ZVFLSjVPcHd6a1Bu?=
 =?utf-8?B?MERvSEVIVHJzaW5LaEdJWGVDejZyTkt5S2cvbFVUNFdRNlJxR2dlZHdKeUky?=
 =?utf-8?B?Z1BDcCtlNmxTZUxaUTdjd3dpVy8xbzRUdjdZdE9QcFRqNFRUTnpFcXB1YlNF?=
 =?utf-8?B?cjNZOXBkcjJCaENVR1UzS1JMNnBubVh1a0ZjSkY0Y2UwVndmYUl4QWNWMGxN?=
 =?utf-8?B?aGQ3RE45S3hXN2FDSENGN2JlbkhPT3NuSWFrV2g4cXVmS2lTbklWZk9aQmZX?=
 =?utf-8?B?SmswcTdUZTZBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cTEvNmxpT04reU9BM3FJOHpIQVNEajhCbzNEV0lXSkFtRlFIT1NRVHFyK2tE?=
 =?utf-8?B?c2QrQmpDYUFERG85dHJqTlZqcUFkaW50QytMaWhNRDl3YTMvU0hjQU12UEpY?=
 =?utf-8?B?ZCtxdHEvaUZHTjBUcDRkbGJ0TVRsWTlPR055ak1JV2ZGVWswZVd6UGxzNk9W?=
 =?utf-8?B?ZkFBR0lGQUpBaDgyZmtRVCs4ZjlqRFdCOEhKajVJbTVOUEFldE5URXBxS3pa?=
 =?utf-8?B?a2Q5WVJhdVdOTDNzaEJyaGRlQVZzNUJmY0VGQUlyQmRSR1NSQmVUbWFQdUZL?=
 =?utf-8?B?bDNsYmdqaTNzR2Z3YnhzOCt1bUhZbVhGL005ZWNGaUdCTTAvcVNwQTNqZnFz?=
 =?utf-8?B?ZHZraGE1OTB6ajk3ajluajVMZG1sWVhTUjFZeGlDS2hhOGIycFhjUWlzUUhD?=
 =?utf-8?B?VFNaUUFwN2pycCtNQU1zKzJCZUMzSUU4L3plczRUTVpDR3pkOXVRYVMxSTI5?=
 =?utf-8?B?bWIxZWdmZ2tmRGJGMlNPcFZCd0ZmTElsS29jSEdmajlsR1NRMml3SjJsc2hR?=
 =?utf-8?B?Nmh3c0NiV0F3YkVkOGI1OGFOUVpCdEFxd3NMeXFjL1A0RzRSNGFKSHV3L1ZE?=
 =?utf-8?B?b0pvYTQyTm5ra011TWpRVFJwTDRlSElsK2NEMFdIK25Od2QyMi9oWUJhT0tR?=
 =?utf-8?B?T2dyODJpNEVMTUFKSlJNTHZpamUybncyU0l1YXV5Y3JING5JN1hCY1ltbmtC?=
 =?utf-8?B?ZVdqMTB5YUJvRFRBNkRmQUtiUWFJMVdnRE5FcmkvV2NEajJITzJJdEk5RHll?=
 =?utf-8?B?L1ZjTkhTLzdZV285WUJkdGlUNXB3dEtUcElVb3FpemFqWTBZalh6M3MvUkMw?=
 =?utf-8?B?OEU0Q3hzT0E5RE9manV3M2hRSkxiZCtUdXJKcjRJLzRxcUIvSVdjc1diWTNx?=
 =?utf-8?B?dmxvZHFqUlNDc2wyTUFXcjdiNTlnQ0puelFTOEhseVZLUkR0V2wrOHM5TnFR?=
 =?utf-8?B?UUhWdHVkRE5SVXFVWHZjT29HSE1KTnVtWEw2UFNFbjhhYmc1NjdiN0w2UGJq?=
 =?utf-8?B?bERwNWdvUmtvdERCa1NERTV0R1B5K0RkWFF6c2Y0RWZWN2ttOTg4L1cvbUlK?=
 =?utf-8?B?Vy9iRXd3VGwwT05rZTlkOGM4MFMxeTMvRHZUMUNpeDJERENRNHhyaU5WU3Fl?=
 =?utf-8?B?YkN2UzVvY1d4b2JsZjlCc0NRR09DRURQUEFNMzFRczRLTGpaaUhGL1p0VDNM?=
 =?utf-8?B?VXJTNXRtUlpBTnZ2UExBSGw2NW1ZZkI4UXUzM2JxNy82b2UwTER0VVNnV1Nr?=
 =?utf-8?B?THFMaERkV1BQZ21RWW44clFKeDh1RzBrbllWTC9DaWtQRUFOaktKVmNKeUZ2?=
 =?utf-8?B?cFp5K0pXbFAwcEhzS1pGRG5NM0xqaUZSUTc5QjVxR3JiWnA2M3V2K2RGVita?=
 =?utf-8?B?dkphTk5xUEVUZkFRRWRQaFVKejNvUGczbG40R3hmd3kxbjR5ckRqUzJTU0Nz?=
 =?utf-8?B?NkV6dEZKTWlpRTF4RUtFK2o3Yi9ZOTVKVjJ3M2w1OEdFRTB3ZFA2YTlNNDRF?=
 =?utf-8?B?eTkzY0hYZXQxYjl2ZGtLNlp2WnpZbHRyVU42RUdJMGEvcElUYWtqZ0NiS3ln?=
 =?utf-8?B?YW1FUG1sc1ZDcEwyK2c4OWVuMzI0OEtoMFRxa1JhSmZCRE9qdVBWRk9yZmJi?=
 =?utf-8?B?N0JFWU5wNEl6UzZWOWVmVS9DMmV2eGpaVnlURFlhQVM0NzhGb0V3SHpka1k5?=
 =?utf-8?B?SzVxa1ZySWlRMmYwU3NLbTczVS9mYWZqdkR2TnFqMkFJbGZ4eUowUVMwb1J3?=
 =?utf-8?B?Vm9EeldCVTFqS1pIMkYyVVBxeDJLaUg0RVk4K3ArYU0vWGh2c0pmOEtJWDcx?=
 =?utf-8?B?SDREWW5yQ3VYelBPZUF6YndvaEpMMnJqb0ttand1ZDZXTFFzaW9BYy9vb0dS?=
 =?utf-8?B?bUQxU3BnWXNrU0R2Qk1SZFY1bDRtSzVFcUJheGc1TXhMR2ZNbnFMNEtlbnFp?=
 =?utf-8?B?RW13bmZuV09IT1M2SFB4RlVLR09HY2w4ZXRZSTJub1Y0eUFNQVdJbnNqc2dX?=
 =?utf-8?B?SDdjMkpQU0RsRXE4UzNjZTlFTEdPTnViTFQzREQzeXdONU5wOTU1WWFtMWp3?=
 =?utf-8?B?d092V2daWkhGUzdTYlFXUkIrQ2RKNXRPUFBiajgrVmtsOFFSdFE4WUEvLzlt?=
 =?utf-8?Q?74WoSODheJteUp/KWQpmmPaBg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0702599-682c-4f33-52dd-08dd76e7e4ac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:10.4399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O18uGwRJ02k5iNws/sb8VvJekrDp/r8eRYP2qW+iCPbUfV/E9kzXOMt9Qhrp+7ZAAUlJR7JUimGmx6s3rBFCLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

Use devm_clk_bulk_get_all() helper to simplify clock handle code.

No functional changes intended.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 46 +++-------------------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 +-
 2 files changed, 6 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index ecfc95882f903..015350c6f2784 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -275,11 +275,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
 	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
 };
 
-static const struct clk_bulk_data mxc_imx8mn_clks[] = {
-	{ .id = "axi" },
-	{ .id = "apb" },
-};
-
 static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.model			= MXC_ISI_IMX8MN,
 	.num_ports		= 1,
@@ -287,8 +282,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.reg_offset		= 0,
 	.ier_reg		= &mxc_imx8_isi_ier_v1,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.clks			= mxc_imx8mn_clks,
-	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= false,
 	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= false,
@@ -301,8 +294,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.reg_offset		= 0x2000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.clks			= mxc_imx8mn_clks,
-	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= true,
 	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= true,
@@ -315,8 +306,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
 	.reg_offset		= 0x0,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.clks			= mxc_imx8mn_clks,
-	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= false,
 };
@@ -328,8 +317,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.reg_offset		= 0,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.clks			= mxc_imx8mn_clks,
-	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
 	.buf_active_reverse	= true,
 	.gasket_ops		= &mxc_imx93_gasket_ops,
 	.has_36bit_dma		= false,
@@ -386,7 +373,7 @@ static int mxc_isi_runtime_suspend(struct device *dev)
 {
 	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
 
-	clk_bulk_disable_unprepare(isi->pdata->num_clks, isi->clks);
+	clk_bulk_disable_unprepare(isi->num_clks, isi->clks);
 
 	return 0;
 }
@@ -396,7 +383,7 @@ static int mxc_isi_runtime_resume(struct device *dev)
 	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_bulk_prepare_enable(isi->pdata->num_clks, isi->clks);
+	ret = clk_bulk_prepare_enable(isi->num_clks, isi->clks);
 	if (ret) {
 		dev_err(dev, "Failed to enable clocks (%d)\n", ret);
 		return ret;
@@ -414,27 +401,6 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
  * Probe, remove & driver
  */
 
-static int mxc_isi_clk_get(struct mxc_isi_dev *isi)
-{
-	unsigned int size = isi->pdata->num_clks
-			  * sizeof(*isi->clks);
-	int ret;
-
-	isi->clks = devm_kmemdup(isi->dev, isi->pdata->clks, size, GFP_KERNEL);
-	if (!isi->clks)
-		return -ENOMEM;
-
-	ret = devm_clk_bulk_get(isi->dev, isi->pdata->num_clks,
-				isi->clks);
-	if (ret < 0) {
-		dev_err(isi->dev, "Failed to acquire clocks: %d\n",
-			ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int mxc_isi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -457,11 +423,9 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	if (!isi->pipes)
 		return -ENOMEM;
 
-	ret = mxc_isi_clk_get(isi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to get clocks\n");
-		return ret;
-	}
+	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
+	if (isi->num_clks < 0)
+		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
 
 	isi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(isi->regs)) {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index e7534a80af7b4..bd3cfe5fbe063 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -169,8 +169,6 @@ struct mxc_isi_plat_data {
 	const struct mxc_isi_ier_reg  *ier_reg;
 	const struct mxc_isi_set_thd *set_thd;
 	const struct mxc_gasket_ops *gasket_ops;
-	const struct clk_bulk_data *clks;
-	unsigned int num_clks;
 	bool buf_active_reverse;
 	bool has_36bit_dma;
 };
@@ -282,6 +280,7 @@ struct mxc_isi_dev {
 
 	void __iomem			*regs;
 	struct clk_bulk_data		*clks;
+	int				num_clks;
 	struct regmap			*gasket;
 
 	struct mxc_isi_crossbar		crossbar;

-- 
2.34.1


