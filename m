Return-Path: <linux-media+bounces-35702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6BAE4D7E
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 21:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A85843B83ED
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 19:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCDE2D3A69;
	Mon, 23 Jun 2025 19:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rnw7wcno"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ACA2D5404;
	Mon, 23 Jun 2025 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706302; cv=fail; b=aVoUr+kzlXwT0DfXUwWxxN3iYIDoWC0LVKME6DvjcQLk2EcGaXa2gc/UP7nfg5yE0oh8z2RFNss3TMMWFaxjmD5psDoKiQRvpIxODpvYX2rYWggkNsoBTEon+HiRvZ4LiokS0vQHmv3G0NqAMK8cUlcIcd3vUcc26JiNvJZGDK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706302; c=relaxed/simple;
	bh=0r2mX8bCkRLJg/bo4osGOxk2BBc3mt76xiIlRtmWbFo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=B4r6HwnKb36W7kcjgWL3NIDRQqObNA47aDimpgCejdPKHrAQpYIzLgXlsV94kQra3IsPFFKr0tyb3/k2i9WavSoU/9gSHDMhejrrjOjejBavClJfx5ZruGkmmzcItIrLxDzppTmquZBZ4jl0i3yRc5a1FCW1p3sinAHoqJ+3IMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rnw7wcno; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0P1kgLftAqh0kuPnKHus3pUzGJPY9ZKge3NPnLSWuaSX0aiYkYBVJyWVDqET0Z7W72rD0hdXMrfhnNjkNRNp7f6tO7vz/YnlmXG6J+JKInS580MyrLksWjgLFXEQmpBwCPhaEPIvXwpg63EbYzFTzN/z0cWr0MSJPa2FBMxdOZIdPc7uqanEamF7ejQUUNtaZV4J8PQT5G6PcHk+PniNHnRd5CBVWbHIr2RDD4Fof92xehhZy8HaIvMDGorOOZvcOpQYGAYpDd2bBCUDRoQG9NHXPhlFpbYchW7TKpW+NnsNg+opdC5+pUFGK/r1TpdS4JnhInYE1lWA8gVMGyABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJohEy9TKkwf4Oi7qdcVrP2KeuoG+gn9MilsPIjeQQA=;
 b=YCTsHzHjVriL7I2L7rkuXe7RtY3lklEAWR3ZTxFAQ1e5qYKgjc1Z/XgD4S8GkXqPbYo7PvXd9OgaAzCrXgcMYXNexC5e8AjOPOqowBDtX8erq1r17CX7sNCiUkuK1E9Xcl4+VmPeh3ljpAaXtUoFgsnk/CsMC1ZmPfhZrgftpsibIu5gNfMgU9yyclVpNpLsh93+oO4JDb2nRUeFBKWdwCqC2Cr7RxX2vZichZDDMQgahLMQaRZLNPyKxO+J7dfkuFc6Zql/4gtzNYSc0G74SWPA7oHcHL6/UrcVydzYIv3J1afLrWuuuO197DMkUR4sdFwUKWYOmI7sMXOFCOr1Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJohEy9TKkwf4Oi7qdcVrP2KeuoG+gn9MilsPIjeQQA=;
 b=Rnw7wcno5zFjsyZ4gUeIZvSgQ0v4qqTV6isgEiE8UKVrvqKGnzdmRCQ/wajwA3yJ++otC+uZ/i9MeKDKVh08qVfBuQjzXbDJwiZxyiEvyzlACWo1aG9yBN1YdAtkqKks8cfy3Jxmgn0/S0+vTs90cPpANGRvq6iGeKsJ479mAnTkhKdtzs1P/unUIHqvh8/NXJQPTpRnqSeS8VTvTqP7OGjlqF9KKNOCh7oVvOon9ohz0v8RhUJSFsUZLDqPKu3NxA289amrI3s8R+42PEPSMCAS4eRzYY2xsAq48Tj2jZpxFh9umMXKHcQm5yDhJiEa0D/jt1hMU65ALJXj+j4rnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10212.eurprd04.prod.outlook.com (2603:10a6:800:243::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 19:18:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 19:18:14 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 23 Jun 2025 15:17:38 -0400
Subject: [PATCH v3 2/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-ap1302-v3-2-c9ca5b791494@nxp.com>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
In-Reply-To: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kumar M <anil.mamidala@xilinx.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Stefan Hladnik <stefan.hladnik@gmail.com>, 
 Florian Rebaudo <frebaudo@witekio.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750706282; l=83539;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=oSiiRGCwWzrX103x+8/6qm/yue93Ou7fUbTSpc5YQw0=;
 b=BSiCuiajdTSz/U08eTGF1ATxtXY/EWEllazRzdhoIW/OxGR5HbTzB9m7hDG37gkzkW5/nOEvH
 shco9YpnST+BGRkm3u1BXu7d0jIKoX59RIai67vwqljD/QfIBJTPriC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0095.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10212:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b42580-fc24-488c-ffc5-08ddb28ab332
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VUdlRkczTnRFQk84OTVmbDZQOGFCRXFuamNHbjBwSDEyYnlyU3NnUG1EWURw?=
 =?utf-8?B?RW0vb2o2c3ptZWRHeDlNOXYxQUYrZWw0QTAxYStremk3RlBaM3BsbXRaaTlU?=
 =?utf-8?B?UGNsNWRLZnNoOUZ5ZWsySFg3YTllSkI4cFU4amtXQWpUdXAxd01nMDVLaFhw?=
 =?utf-8?B?NUQzZmp3bkRQWjR0V2FDOTBkQVdLL0hYVUhOczkwczNRc2N6YjFmRGtTR2g4?=
 =?utf-8?B?cVBWdHNCNDFxOWJnSFJwVHJPV1NFTHl1dWd3QXQrYTZ4bUtQbGU3WVZNb1JV?=
 =?utf-8?B?c3N1RGRvbmhWSnNlTWM5alNnV2tYK2VUcHZXWndQUHN2aWNCT3VtVVZBUW9M?=
 =?utf-8?B?a3hrcElubHFPVTVDQ01RbWkyek8xeC9kUnp2VlpHQjY0TW9UZFB0L1U1M0lj?=
 =?utf-8?B?ODRwaVErNzJyeS9SMTI5VnVxSmpjVU9wNUlnaXBTM0dkWFdWS09ubkdCZlRN?=
 =?utf-8?B?Wmpoc1Bid0doc3d4RmVUNWtwdk5BamVjOUp0ZjFlUEdqUnV1WW1XK1RwempE?=
 =?utf-8?B?bW1ac2xUMTlSS0d1dUxyaTRJeWNTRU1IVE5mUDFDOVZMdnNQRTZZSXo5eGdT?=
 =?utf-8?B?KzFRMHlCbVQwb3NRT0c3bmRaSVcvSWpsZkZrY2tGVUU5TGduN0lscmdBOWlt?=
 =?utf-8?B?VFdDMjR2QnZISkFoRm9pcGl5bjUrRWsySVNrMEZ5TjV1UFdrOVg4cXhybVBI?=
 =?utf-8?B?MjhTQ0RnVDVmSzRkM3hqWVhEVzVDakxpRHgzTkJnektjWmFocFNYRGY2ZzNL?=
 =?utf-8?B?VTRiNU5XcnBwYnl1Nml4cG9WWVE0QlNkK3ROaUpNQ0FWOWMwUVZ2OFN3OXJ6?=
 =?utf-8?B?Uzc2YzZKbWY4cTF4Z2F6bzhTYlY3cncwNEttTWJiODMrZTVwUFpUeFVvY05t?=
 =?utf-8?B?dVFuS0VZamRXNUNvdkpKMFE2MjQ1OVJUaGNYOWF2YWZzRjNyeVg3ZjkvZGJV?=
 =?utf-8?B?MHRIR1FzNjFEWHFBNDFGVlNZaW03U1JZall0OXFqQ2hCR1pVaEtyY0ZJZ2Qv?=
 =?utf-8?B?ZDgzTXgrbjN2aHNrRUhqYVAvQjFzRldjc040cHErYm9kZXpiSDhJeFRGMEtw?=
 =?utf-8?B?RmU1cW1FZllST3hTWU9rSUtrVnl2TnhsR3Q0SUFHRVI1OTRHNnUzRWh3VUJS?=
 =?utf-8?B?MFRoZlZDY0k5TUFTY0VEVG1mcTVRRkE2RnRlMHRjMmNEM0dxTHJRMTdTQlpU?=
 =?utf-8?B?cytwQ1BxSW9YamJNRE9PaEJONy9WTjBlYXV5cHJHbktnVGhLL1pGVDFrcDBY?=
 =?utf-8?B?N2JqblNKQXpzOCtnNjR2c014ZnVvQis0Mlo0NlJ4ZCtURXhYeUpDRVVWckQ2?=
 =?utf-8?B?MlZ1K3RtODhXa0djcXdUeHRVLzdHYzNrN2tNcUdCaXhhYUNUa2djMytOT0Yw?=
 =?utf-8?B?ZU4xNmdSbTA5UmlRbFN3d052bTdWSzdmL1J6OU9VVkROVm1BQ3dkVEFOZTFo?=
 =?utf-8?B?QXN4UWFTOWxBYVJqWm0rT2lHcC9GSHNsdkNLRDJJY3RkdHY0UEhvbG9uenlL?=
 =?utf-8?B?YVBlc1dQdHNnTmo1TTdjZkhYL1FlQ3lFK215bWYrQlArZWYxc21lRktObUtW?=
 =?utf-8?B?dnZ1MWdnTmhLdWRWdTNHeFN1dDgxeFdNS0IyVEVQdVQyUFpVUStIaGdhb1hD?=
 =?utf-8?B?VFdGQjJpQitDTWo5b3BOak9OR0R1RDYwWEF5dnYxZGhXbnR4NnRiZ3BIeEJI?=
 =?utf-8?B?V0ZnQ3gydks3VDNVYVcwazBDdEZ3d2FQMFdsTm1mdDdQSkZLbW1acEhVcHl1?=
 =?utf-8?B?VytMemllZm1jb3dzYmxSVlpmeHN6WGFvM3ZjQ0Q5dVFlL1BNU1NjN29uZWFh?=
 =?utf-8?B?YTJpVzVEaWUzcTVPbFEwblVKVENlQ0hvQlVFd2Z5TEJBS2M1eXFVenlDaVdR?=
 =?utf-8?B?ZCtoU2o5RUtXUFNQUW1sTlhTTjd1WU9OaTFhaGNkSTY1V3R5RGVJeHpCazA0?=
 =?utf-8?B?VmR0ZXdTWnFWVTJoVzBZRGRBMFB3b0xGQjRuNHEvVG1VS2U2TnZINWhMN3li?=
 =?utf-8?B?cndEc3AzSHBnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VVBIR2MyZlZvUmZ5K1N4UzNZcWJmYVFDNzZxVTY0RzVkVDJpTUFhVUF5SHhE?=
 =?utf-8?B?bVQvcm93d0FsMkJ2cXBqNlQ3c1lpQTF4SnE1L2I0Y3pPcnJMUGhHb0w3Zm1m?=
 =?utf-8?B?Zjl6OGxLWkg1YkVQZUh6THpRWnp1SHplNnV1RVFZODJjQVlKNERvNGI2Y3hE?=
 =?utf-8?B?NE5wNlVPZnlYTlh1aWNoYzhkbnlhM050Qmk3bWVuNFBXb3hCZlZHTVVhZTA4?=
 =?utf-8?B?dk5iNjkxZmZzVnl0ZGF6Qkw3eXVQQkM4U1diSUI1ZlVDaExZU1FjbWtlTnlW?=
 =?utf-8?B?Z0p0RisvWlFOekFUUG9SamZaZHZwdlVDc3lkSEd5TUJma1JhZ2tZc1VCS21w?=
 =?utf-8?B?bUdTWUx2MG1UanI2bkxVYnVsekhKSm1uZG9IRnJxZnBWTmFka3ZKU1AydWMz?=
 =?utf-8?B?cjlSSHNZVlpYSmE1cmI5QnZqL2pTTzhKNnNRYkZPT1NvZy9ucFB2cndObWph?=
 =?utf-8?B?MEx6Uk9INFdNd21QL2w3QUpZZWpYejA2RWhsVEY1bEVuRktlRTA4a2xrb041?=
 =?utf-8?B?OSthRWtWQlBwSkRtVFpOQ0ZRcDE0d1VzWWxjaHlhbDBsTmRSSld2dzJ3RnhC?=
 =?utf-8?B?VGxVV3lCbk1vTjZ0WkJhekJmNHQ4bzVFSEl5RWY2Q1RTcXd5MnN4NDV4ZHVN?=
 =?utf-8?B?b2FZRDczTVJYbzJ4bnd0V0lKc2wxeDBRYnc5aFRxZUszNXoyZ3czZmV5R0py?=
 =?utf-8?B?OS95anoycE04Uk0xaStOdENsbWpUYWtJQVcvb2hYdTdlaDRZN2pyaGExUWZl?=
 =?utf-8?B?UnMra2tvQjAvOHUyb0dacnEyQm5ZZXpLekV2SlRUbDhXdkoyKzdJb1FMSzJO?=
 =?utf-8?B?Nm4zcUVTMTZXTjRyRjBycnNVQWpUZk5MOW8vYzJQMFl2eGJCRExFRmxnazli?=
 =?utf-8?B?ZDYraTRpZFd5SFhSSkRGamtCaS9mZzd4eEd2YVBJM2tibmhDWTB4dlZtRVRF?=
 =?utf-8?B?OWVQL0JSUVRET1l5UmtnSEV5YytlSjV6TjBDdzdpLzlYU3Jsd2NKZkhiNnBV?=
 =?utf-8?B?S21ObzN1WnJKL1pLMDdLMlhscEVua3VET0JUaXlpNGs4VERLcG03M09uTEVn?=
 =?utf-8?B?QnQyTGJuVWN5WnlFd1A0ZzRvN3dOMUtkZ1dhMmRxT1BrY3R4U045Vm8yN1RG?=
 =?utf-8?B?aVU4UTJCUXpzTEJuQ01EZVdvTmpsaGFGV0kwS3ZValVTQTdOaGtUQ0huc0x1?=
 =?utf-8?B?SnhOMW5Ba0twV1VGMHpHT2RVcnVUaXM0OGFOSTZkcXFrcHpjQUNFRzBoR2pV?=
 =?utf-8?B?NmlWRGtuRlk3aVpNbFM4OGdOd0tYUTQwektyYmlnVkh2KzdCOUVDN3hqcUxx?=
 =?utf-8?B?N1BHRElhSHRUQ0JCcGZPZ0N0WU4rYTVXdUQxQ09NYXQ0cUhRd0ZaQkZ5QzRp?=
 =?utf-8?B?SW1WUjNiZDFhc1hHZWdDTDlsOEFRSDdDdFYwTEFlblFmNVVyNWlrK3d0bnBw?=
 =?utf-8?B?S0tOL01ybThrcktBUDllekRNd0tMby92bDJESVYrODRDK0NPQXdRcmc3Zk5Y?=
 =?utf-8?B?eUJQSEZNelBLZWN6SEtXWGREaEY5WkI2bXBVZTQzNEVtbC9TRHZvcmQ3MGlS?=
 =?utf-8?B?Tk04V2xGbjI2R0pNbHo4Y09rZUJpOUxvWkNNdGZOSE9xODVTQ3pZSWM2Ujgr?=
 =?utf-8?B?ZUpyek13WHdIcjlsS0JJQXpzbnlsRjQrbHFDRG52eTNoalY1cFZRRXZLb1Bt?=
 =?utf-8?B?aEQ5UG5ZcEZ3cFVnTVFzOEpweUwxbE0vdDM4RWxzT3FFVnE2WWhkM2xjekVI?=
 =?utf-8?B?c0g0N293Z21RRGJSVE1QcDBtWXJaYWNNU01OZlU5elNjNlZVTThWUGcrTUlS?=
 =?utf-8?B?azd6NGUxRkxjTjVlRi95d0kyQjBpTndKcmRDaWJnb1pQMkhacW1Rb1p3cGFq?=
 =?utf-8?B?aXgvWFlhNlNFanRPczNIb0lMZXNPNE1PUWkwdGNXalFiWExzajBWOVEzUFZH?=
 =?utf-8?B?STBEUlRuZkUyMVRjM0FWSmdwSGdQS1lJRHphYytoNGwycHJwSTNudG9iZHJv?=
 =?utf-8?B?NXVaSWFxMVh0Rk5wY2RlNzBFMy9ndktEK1pyNGY2WFJBUFdlWE01eW82Tmdu?=
 =?utf-8?B?TE9paGRtVm4vTVJIKzF1US9HUDk2c2NnSFhyWjhsL0VpNHdVaVRSUklSTWRQ?=
 =?utf-8?Q?9AgRxN2b0bJkl5B++vjhp5ugc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b42580-fc24-488c-ffc5-08ddb28ab332
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 19:18:14.1743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fEax7x6XFSV63WjwtDlGjK8ufu/9Dumu3MPnHKYQUHJ1LyT2KrWBgkNipRVpXxDggYO/kpVuZ11hHAFBj307Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10212

From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>

The AP1302 is a standalone ISP for ON Semiconductor sensors.
AP1302 ISP supports single and dual sensor inputs. The driver
code supports AR1335, AR0144 and AR0330 sensors with single and
dual mode by loading the corresponding firmware.

Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v3:
- add extra empty line between difference register define
- add bits.h
- use GEN_MASK and align regiser bit define from 31 to 0.
- add ap1302_sensor_supply
- add enable gpio
- update firmware header format
- update raw sensor supply delay time
- use gpiod_set_value_cansleep() insteand gpiod_set_value()
- update use latest v4l2 api
- use ctrl_to_sd() helper function
- add ap1302_g_volatile_ctrl()
- remove ap1302_get_fmt()
- use guard for mutex.
- use dev_err_probe
- use devm_add_action_or_reset to simple error handle at probe.
- use read_poll_timeout() simple dma idle polling.

previous upstream:
https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
---
 MAINTAINERS                |    1 +
 drivers/media/i2c/Kconfig  |    9 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/ap1302.c | 2838 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 2849 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1362d351f2574..c1acbeed078da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1774,6 +1774,7 @@ S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
 F:	Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
+F:	drivers/media/i2c/ap1302.c
 
 APEX EMBEDDED SYSTEMS STX104 IIO DRIVER
 M:	William Breathitt Gray <wbg@kernel.org>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e68202954a8fd..2e0ba7254073f 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -35,6 +35,15 @@ menuconfig VIDEO_CAMERA_SENSOR
 
 if VIDEO_CAMERA_SENSOR
 
+config VIDEO_AP1302
+	tristate "ON Semiconductor AP1302 ISP"
+	help
+	  This is a Video4Linux2 sensor-level driver for the ON Semiconductor
+	  AP1302 ISP.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called ap1302.
+
 config VIDEO_APTINA_PLL
 	tristate
 
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 5873d29433ee5..aeb86c219c71c 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_VIDEO_ADV7842) += adv7842.o
 obj-$(CONFIG_VIDEO_AK7375) += ak7375.o
 obj-$(CONFIG_VIDEO_AK881X) += ak881x.o
 obj-$(CONFIG_VIDEO_ALVIUM_CSI2) += alvium-csi2.o
+obj-$(CONFIG_VIDEO_AP1302) += ap1302.o
 obj-$(CONFIG_VIDEO_APTINA_PLL) += aptina-pll.o
 obj-$(CONFIG_VIDEO_AR0521) += ar0521.o
 obj-$(CONFIG_VIDEO_BT819) += bt819.o
diff --git a/drivers/media/i2c/ap1302.c b/drivers/media/i2c/ap1302.c
new file mode 100644
index 0000000000000..ea875fef58341
--- /dev/null
+++ b/drivers/media/i2c/ap1302.c
@@ -0,0 +1,2838 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for the AP1302 external camera ISP from ON Semiconductor
+ *
+ * Copyright (C) 2021, Witekio, Inc.
+ * Copyright (C) 2021, Xilinx, Inc.
+ * Copyright (C) 2021, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/media.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_graph.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#include <media/media-entity.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define AP1302_FW_WINDOW_SIZE			0x2000
+#define AP1302_FW_WINDOW_OFFSET			0x8000
+
+#define AP1302_MIN_WIDTH			24U
+#define AP1302_MIN_HEIGHT			16U
+#define AP1302_MAX_WIDTH			4224U
+#define AP1302_MAX_HEIGHT			4092U
+
+#define AP1302_REG_16BIT(n)			((2 << 24) | (n))
+#define AP1302_REG_32BIT(n)			((4 << 24) | (n))
+#define AP1302_REG_SIZE(n)			((n) >> 24)
+#define AP1302_REG_PAGE_MASK			GENMASK(23, 16)
+#define AP1302_REG_PAGE(n)			((n) & AP1302_REG_PAGE_MASK)
+#define AP1302_REG_ADDR(n)			((n) & GENMASK(15, 0))
+
+/* Info Registers */
+#define AP1302_CHIP_VERSION			AP1302_REG_16BIT(0x0000)
+#define AP1302_CHIP_ID				0x0265
+#define AP1302_FRAME_CNT			AP1302_REG_16BIT(0x0002)
+#define AP1302_ERROR				AP1302_REG_16BIT(0x0006)
+#define AP1302_ERR_FILE				AP1302_REG_32BIT(0x0008)
+#define AP1302_ERR_LINE				AP1302_REG_16BIT(0x000c)
+#define AP1302_SIPM_ERR_0			AP1302_REG_16BIT(0x0014)
+#define AP1302_SIPM_ERR_1			AP1302_REG_16BIT(0x0016)
+#define AP1302_CHIP_REV				AP1302_REG_16BIT(0x0050)
+#define AP1302_CON_BUF(n)			AP1302_REG_16BIT(0x0a2c + (n))
+#define AP1302_CON_BUF_SIZE			512
+
+/* Control Registers */
+#define AP1302_DZ_TGT_FCT			AP1302_REG_16BIT(0x1010)
+
+#define AP1302_SFX_MODE				AP1302_REG_16BIT(0x1016)
+#define AP1302_SFX_MODE_SFX_NORMAL		(0U << 0)
+#define AP1302_SFX_MODE_SFX_ALIEN		(1U << 0)
+#define AP1302_SFX_MODE_SFX_ANTIQUE		(2U << 0)
+#define AP1302_SFX_MODE_SFX_BW			(3U << 0)
+#define AP1302_SFX_MODE_SFX_EMBOSS		(4U << 0)
+#define AP1302_SFX_MODE_SFX_EMBOSS_COLORED	(5U << 0)
+#define AP1302_SFX_MODE_SFX_GRAYSCALE		(6U << 0)
+#define AP1302_SFX_MODE_SFX_NEGATIVE		(7U << 0)
+#define AP1302_SFX_MODE_SFX_BLUISH		(8U << 0)
+#define AP1302_SFX_MODE_SFX_GREENISH		(9U << 0)
+#define AP1302_SFX_MODE_SFX_REDISH		(10U << 0)
+#define AP1302_SFX_MODE_SFX_POSTERIZE1		(11U << 0)
+#define AP1302_SFX_MODE_SFX_POSTERIZE2		(12U << 0)
+#define AP1302_SFX_MODE_SFX_SEPIA1		(13U << 0)
+#define AP1302_SFX_MODE_SFX_SEPIA2		(14U << 0)
+#define AP1302_SFX_MODE_SFX_SKETCH		(15U << 0)
+#define AP1302_SFX_MODE_SFX_SOLARIZE		(16U << 0)
+#define AP1302_SFX_MODE_SFX_FOGGY		(17U << 0)
+
+#define AP1302_ATOMIC				AP1302_REG_16BIT(0x1184)
+#define AP1302_ATOMIC_MODE			BIT(2)
+#define AP1302_ATOMIC_FINISH			BIT(1)
+#define AP1302_ATOMIC_RECORD			BIT(0)
+
+/*
+ * Preview Context Registers (preview_*). AP1302 supports 3 "contexts"
+ * (Preview, Snapshot, Video). These can be programmed for different size,
+ * format, FPS, etc. There is no functional difference between the contexts,
+ * so the only potential benefit of using them is reduced number of register
+ * writes when switching output modes (if your concern is atomicity, see
+ * "atomic" register).
+ * So there's virtually no benefit in using contexts for this driver and it
+ * would significantly increase complexity. Let's use preview context only.
+ */
+#define AP1302_PREVIEW_WIDTH			AP1302_REG_16BIT(0x2000)
+#define AP1302_PREVIEW_HEIGHT			AP1302_REG_16BIT(0x2002)
+#define AP1302_PREVIEW_ROI_X0			AP1302_REG_16BIT(0x2004)
+#define AP1302_PREVIEW_ROI_Y0			AP1302_REG_16BIT(0x2006)
+#define AP1302_PREVIEW_ROI_X1			AP1302_REG_16BIT(0x2008)
+#define AP1302_PREVIEW_ROI_Y1			AP1302_REG_16BIT(0x200a)
+
+#define AP1302_PREVIEW_OUT_FMT			AP1302_REG_16BIT(0x2012)
+#define AP1302_PREVIEW_OUT_FMT_IPIPE_BYPASS	BIT(13)
+#define AP1302_PREVIEW_OUT_FMT_SS		BIT(12)
+#define AP1302_PREVIEW_OUT_FMT_FAKE_EN		BIT(11)
+#define AP1302_PREVIEW_OUT_FMT_ST_EN		BIT(10)
+#define AP1302_PREVIEW_OUT_FMT_IIS_NONE		(0U << 8)
+#define AP1302_PREVIEW_OUT_FMT_IIS_POST_VIEW	(1U << 8)
+#define AP1302_PREVIEW_OUT_FMT_IIS_VIDEO	(2U << 8)
+#define AP1302_PREVIEW_OUT_FMT_IIS_BUBBLE	(3U << 8)
+#define AP1302_PREVIEW_OUT_FMT_FT_JPEG_422	(0U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_JPEG_420	(1U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_YUV		(3U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RGB		(4U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_YUV_JFIF	(5U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW8		(8U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW10		(9U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW12		(10U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_RAW16		(11U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG8		(12U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG10		(13U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG12		(14U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FT_DNG16		(15U << 4)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_ROTATE	BIT(2)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_SCAN	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_JFIF	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_JPEG_EXIF	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_888	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_565	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_555M	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RGB_555L	(3U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_YUV_422	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_YUV_420	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_YUV_400	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_SENSOR	(0U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CAPTURE	(1U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CP	(2U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_BPC	(3U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_IHDR	(4U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_PP	(5U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_DENSH	(6U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_PM	(7U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_GC	(8U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CURVE	(9U << 0)
+#define AP1302_PREVIEW_OUT_FMT_FST_RAW_CCONV	(10U << 0)
+
+#define AP1302_PREVIEW_S1_SENSOR_MODE		AP1302_REG_16BIT(0x202e)
+
+#define AP1302_PREVIEW_HINF_CTRL		AP1302_REG_16BIT(0x2030)
+#define AP1302_PREVIEW_HINF_CTRL_BT656_LE	BIT(15)
+#define AP1302_PREVIEW_HINF_CTRL_BT656_16BIT	BIT(14)
+#define AP1302_PREVIEW_HINF_CTRL_MUX_DELAY(n)	((n) << 8)
+#define AP1302_PREVIEW_HINF_CTRL_LV_POL		BIT(7)
+#define AP1302_PREVIEW_HINF_CTRL_FV_POL		BIT(6)
+#define AP1302_PREVIEW_HINF_CTRL_MIPI_CONT_CLK	BIT(5)
+#define AP1302_PREVIEW_HINF_CTRL_SPOOF		BIT(4)
+#define AP1302_PREVIEW_HINF_CTRL_MIPI_MODE	BIT(3)
+#define AP1302_PREVIEW_HINF_CTRL_MIPI_LANES(n)	((n) << 0)
+
+/* IQ Registers */
+#define AP1302_AE_CTRL				AP1302_REG_16BIT(0x5002)
+#define AP1302_AE_CTRL_STATS_SEL		BIT(11)
+#define AP1302_AE_CTRL_IMM			BIT(10)
+#define AP1302_AE_CTRL_ROUND_ISO		BIT(9)
+#define AP1302_AE_CTRL_UROI_FACE		BIT(7)
+#define AP1302_AE_CTRL_UROI_LOCK		BIT(6)
+#define AP1302_AE_CTRL_UROI_BOUND		BIT(5)
+#define AP1302_AE_CTRL_IMM1			BIT(4)
+#define AP1302_AE_CTRL_MANUAL_EXP_TIME_GAIN	(0U << 0)
+#define AP1302_AE_CTRL_MANUAL_BV_EXP_TIME	(1U << 0)
+#define AP1302_AE_CTRL_MANUAL_BV_GAIN		(2U << 0)
+#define AP1302_AE_CTRL_MANUAL_BV_ISO		(3U << 0)
+#define AP1302_AE_CTRL_AUTO_BV_EXP_TIME		(9U << 0)
+#define AP1302_AE_CTRL_AUTO_BV_GAIN		(10U << 0)
+#define AP1302_AE_CTRL_AUTO_BV_ISO		(11U << 0)
+#define AP1302_AE_CTRL_FULL_AUTO		(12U << 0)
+#define AP1302_AE_CTRL_MODE_MASK		0x000f
+
+#define AP1302_AE_MANUAL_GAIN			AP1302_REG_16BIT(0x5006)
+#define AP1302_AE_BV_OFF			AP1302_REG_16BIT(0x5014)
+#define AP1302_AE_MET				AP1302_REG_16BIT(0x503E)
+
+#define AP1302_AWB_CTRL				AP1302_REG_16BIT(0x5100)
+#define AP1302_AWB_CTRL_RECALC			BIT(13)
+#define AP1302_AWB_CTRL_POSTGAIN		BIT(12)
+#define AP1302_AWB_CTRL_UNGAIN			BIT(11)
+#define AP1302_AWB_CTRL_CLIP			BIT(10)
+#define AP1302_AWB_CTRL_SKY			BIT(9)
+#define AP1302_AWB_CTRL_FLASH			BIT(8)
+#define AP1302_AWB_CTRL_FACE_OFF		(0U << 6)
+#define AP1302_AWB_CTRL_FACE_IGNORE		(1U << 6)
+#define AP1302_AWB_CTRL_FACE_CONSTRAINED	(2U << 6)
+#define AP1302_AWB_CTRL_FACE_ONLY		(3U << 6)
+#define AP1302_AWB_CTRL_IMM			BIT(5)
+#define AP1302_AWB_CTRL_IMM1			BIT(4)
+#define AP1302_AWB_CTRL_MODE_OFF		(0U << 0)
+#define AP1302_AWB_CTRL_MODE_HORIZON		(1U << 0)
+#define AP1302_AWB_CTRL_MODE_A			(2U << 0)
+#define AP1302_AWB_CTRL_MODE_CWF		(3U << 0)
+#define AP1302_AWB_CTRL_MODE_D50		(4U << 0)
+#define AP1302_AWB_CTRL_MODE_D65		(5U << 0)
+#define AP1302_AWB_CTRL_MODE_D75		(6U << 0)
+#define AP1302_AWB_CTRL_MODE_MANUAL		(7U << 0)
+#define AP1302_AWB_CTRL_MODE_MEASURE		(8U << 0)
+#define AP1302_AWB_CTRL_MODE_AUTO		(15U << 0)
+#define AP1302_AWB_CTRL_MODE_MASK		0x000f
+
+#define AP1302_FLICK_CTRL			AP1302_REG_16BIT(0x5440)
+#define AP1302_FLICK_CTRL_FREQ(n)		((n) << 8)
+#define AP1302_FLICK_CTRL_ETC_IHDR_UP		BIT(6)
+#define AP1302_FLICK_CTRL_ETC_DIS		BIT(5)
+#define AP1302_FLICK_CTRL_FRC_OVERRIDE_MAX_ET	BIT(4)
+#define AP1302_FLICK_CTRL_FRC_OVERRIDE_UPPER_ET	BIT(3)
+#define AP1302_FLICK_CTRL_FRC_EN		BIT(2)
+#define AP1302_FLICK_CTRL_MODE_DISABLED		(0U << 0)
+#define AP1302_FLICK_CTRL_MODE_MANUAL		(1U << 0)
+#define AP1302_FLICK_CTRL_MODE_AUTO		(2U << 0)
+
+#define AP1302_SCENE_CTRL			AP1302_REG_16BIT(0x5454)
+#define AP1302_SCENE_CTRL_MODE_NORMAL		(0U << 0)
+#define AP1302_SCENE_CTRL_MODE_PORTRAIT		(1U << 0)
+#define AP1302_SCENE_CTRL_MODE_LANDSCAPE	(2U << 0)
+#define AP1302_SCENE_CTRL_MODE_SPORT		(3U << 0)
+#define AP1302_SCENE_CTRL_MODE_CLOSE_UP		(4U << 0)
+#define AP1302_SCENE_CTRL_MODE_NIGHT		(5U << 0)
+#define AP1302_SCENE_CTRL_MODE_TWILIGHT		(6U << 0)
+#define AP1302_SCENE_CTRL_MODE_BACKLIGHT	(7U << 0)
+#define AP1302_SCENE_CTRL_MODE_HIGH_SENSITIVE	(8U << 0)
+#define AP1302_SCENE_CTRL_MODE_NIGHT_PORTRAIT	(9U << 0)
+#define AP1302_SCENE_CTRL_MODE_BEACH		(10U << 0)
+#define AP1302_SCENE_CTRL_MODE_DOCUMENT		(11U << 0)
+#define AP1302_SCENE_CTRL_MODE_PARTY		(12U << 0)
+#define AP1302_SCENE_CTRL_MODE_FIREWORKS	(13U << 0)
+#define AP1302_SCENE_CTRL_MODE_SUNSET		(14U << 0)
+#define AP1302_SCENE_CTRL_MODE_AUTO		(0xffU << 0)
+
+/* System Registers */
+#define AP1302_BOOTDATA_STAGE			AP1302_REG_16BIT(0x6002)
+#define AP1302_WARNING(n)			AP1302_REG_16BIT(0x6004 + (n) * 2)
+
+#define AP1302_SENSOR_SELECT			AP1302_REG_16BIT(0x600c)
+#define AP1302_SENSOR_SELECT_TP_MODE(n)		((n) << 8)
+#define AP1302_SENSOR_SELECT_PATTERN_ON		BIT(7)
+#define AP1302_SENSOR_SELECT_MODE_3D_ON		BIT(6)
+#define AP1302_SENSOR_SELECT_CLOCK		BIT(5)
+#define AP1302_SENSOR_SELECT_SINF_MIPI		BIT(4)
+#define AP1302_SENSOR_SELECT_YUV		BIT(2)
+#define AP1302_SENSOR_SELECT_SENSOR_TP		(0U << 0)
+#define AP1302_SENSOR_SELECT_SENSOR(n)		(((n) + 1) << 0)
+
+#define AP1302_SYS_START			AP1302_REG_16BIT(0x601a)
+#define AP1302_SYS_START_PLL_LOCK		BIT(15)
+#define AP1302_SYS_START_LOAD_OTP		BIT(12)
+#define AP1302_SYS_START_RESTART_ERROR		BIT(11)
+#define AP1302_SYS_START_STALL_STATUS		BIT(9)
+#define AP1302_SYS_START_STALL_EN		BIT(8)
+#define AP1302_SYS_START_STALL_MODE_FRAME	(0U << 6)
+#define AP1302_SYS_START_STALL_MODE_DISABLED	(1U << 6)
+#define AP1302_SYS_START_STALL_MODE_POWER_DOWN	(2U << 6)
+#define AP1302_SYS_START_GO			BIT(4)
+#define AP1302_SYS_START_PATCH_FUN		BIT(1)
+#define AP1302_SYS_START_PLL_INIT		BIT(0)
+
+#define AP1302_DMA_SRC				AP1302_REG_32BIT(0x60a0)
+
+#define AP1302_DMA_DST				AP1302_REG_32BIT(0x60a4)
+#define AP1302_DMA_SIP_SIPM(n)			((n) << 26)
+#define AP1302_DMA_SIP_DATA_16_BIT		BIT(25)
+#define AP1302_DMA_SIP_ADDR_16_BIT		BIT(24)
+#define AP1302_DMA_SIP_ID(n)			((n) << 17)
+#define AP1302_DMA_SIP_REG(n)			((n) << 0)
+
+#define AP1302_DMA_SIZE				AP1302_REG_32BIT(0x60a8)
+
+#define AP1302_DMA_CTRL				AP1302_REG_16BIT(0x60ac)
+#define AP1302_DMA_CTRL_SCH_NORMAL		(0 << 12)
+#define AP1302_DMA_CTRL_SCH_NEXT		(1 << 12)
+#define AP1302_DMA_CTRL_SCH_NOW			(2 << 12)
+#define AP1302_DMA_CTRL_DST_REG			(0 << 8)
+#define AP1302_DMA_CTRL_DST_SRAM		(1 << 8)
+#define AP1302_DMA_CTRL_DST_SPI			(2 << 8)
+#define AP1302_DMA_CTRL_DST_SIP			(3 << 8)
+#define AP1302_DMA_CTRL_SRC_REG			(0 << 4)
+#define AP1302_DMA_CTRL_SRC_SRAM		(1 << 4)
+#define AP1302_DMA_CTRL_SRC_SPI			(2 << 4)
+#define AP1302_DMA_CTRL_SRC_SIP			(3 << 4)
+#define AP1302_DMA_CTRL_MODE_32_BIT		BIT(3)
+#define AP1302_DMA_CTRL_MODE_MASK		(7 << 0)
+#define AP1302_DMA_CTRL_MODE_IDLE		(0 << 0)
+#define AP1302_DMA_CTRL_MODE_SET		(1 << 0)
+#define AP1302_DMA_CTRL_MODE_COPY		(2 << 0)
+#define AP1302_DMA_CTRL_MODE_MAP		(3 << 0)
+#define AP1302_DMA_CTRL_MODE_UNPACK		(4 << 0)
+#define AP1302_DMA_CTRL_MODE_OTP_READ		(5 << 0)
+#define AP1302_DMA_CTRL_MODE_SIP_PROBE		(6 << 0)
+
+#define AP1302_BRIGHTNESS			AP1302_REG_16BIT(0x7000)
+#define AP1302_CONTRAST				AP1302_REG_16BIT(0x7002)
+#define AP1302_SATURATION			AP1302_REG_16BIT(0x7006)
+#define AP1302_GAMMA				AP1302_REG_16BIT(0x700A)
+
+/* Misc Registers */
+#define AP1302_REG_ADV_START			0xe000
+#define AP1302_ADVANCED_BASE			AP1302_REG_32BIT(0xf038)
+#define AP1302_SIP_CRC				AP1302_REG_16BIT(0xf052)
+
+/* Advanced System Registers */
+#define AP1302_ADV_IRQ_SYS_INTE			AP1302_REG_32BIT(0x00230000)
+#define AP1302_ADV_IRQ_SYS_INTE_TEST_COUNT	BIT(25)
+#define AP1302_ADV_IRQ_SYS_INTE_HINF_1		BIT(24)
+#define AP1302_ADV_IRQ_SYS_INTE_HINF_0		BIT(23)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_B_MIPI_L	(7U << 20)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_B_MIPI	BIT(19)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_A_MIPI_L	(15U << 14)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF_A_MIPI	BIT(13)
+#define AP1302_ADV_IRQ_SYS_INTE_SINF		BIT(12)
+#define AP1302_ADV_IRQ_SYS_INTE_IPIPE_S		BIT(11)
+#define AP1302_ADV_IRQ_SYS_INTE_IPIPE_B		BIT(10)
+#define AP1302_ADV_IRQ_SYS_INTE_IPIPE_A		BIT(9)
+#define AP1302_ADV_IRQ_SYS_INTE_IP		BIT(8)
+#define AP1302_ADV_IRQ_SYS_INTE_TIMER		BIT(7)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPM		(3U << 6)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPS_ADR_RANGE	BIT(5)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPS_DIRECT_WRITE	BIT(4)
+#define AP1302_ADV_IRQ_SYS_INTE_SIPS_FIFO_WRITE	BIT(3)
+#define AP1302_ADV_IRQ_SYS_INTE_SPI		BIT(2)
+#define AP1302_ADV_IRQ_SYS_INTE_GPIO_CNT	BIT(1)
+#define AP1302_ADV_IRQ_SYS_INTE_GPIO_PIN	BIT(0)
+
+/* Advanced Slave MIPI Registers */
+#define AP1302_ADV_SINF_MIPI_INTERNAL_p_LANE_n_STAT(p, n) \
+	AP1302_REG_32BIT(0x00420008 + (p) * 0x50000 + (n) * 0x20)
+#define AP1302_LANE_ERR_LP_VAL(n)		(((n) >> 30) & 3)
+#define AP1302_LANE_ERR_STATE(n)		(((n) >> 24) & 0xf)
+#define AP1302_LANE_ERR				BIT(18)
+#define AP1302_LANE_ABORT			BIT(17)
+#define AP1302_LANE_LP_VAL(n)			(((n) >> 6) & 3)
+#define AP1302_LANE_STATE(n)			((n) & 0xf)
+#define AP1302_LANE_STATE_STOP_S		0x0
+#define AP1302_LANE_STATE_HS_REQ_S		0x1
+#define AP1302_LANE_STATE_LP_REQ_S		0x2
+#define AP1302_LANE_STATE_HS_S			0x3
+#define AP1302_LANE_STATE_LP_S			0x4
+#define AP1302_LANE_STATE_ESC_REQ_S		0x5
+#define AP1302_LANE_STATE_TURN_REQ_S		0x6
+#define AP1302_LANE_STATE_ESC_S			0x7
+#define AP1302_LANE_STATE_ESC_0			0x8
+#define AP1302_LANE_STATE_ESC_1			0x9
+#define AP1302_LANE_STATE_TURN_S		0xa
+#define AP1302_LANE_STATE_TURN_MARK		0xb
+#define AP1302_LANE_STATE_ERROR_S		0xc
+
+#define AP1302_ADV_CAPTURE_A_FV_CNT		AP1302_REG_32BIT(0x00490040)
+
+struct ap1302_device;
+
+enum {
+	AP1302_PAD_SINK_0,
+	AP1302_PAD_SINK_1,
+	AP1302_PAD_SOURCE,
+	AP1302_PAD_MAX,
+};
+
+struct ap1302_format_info {
+	unsigned int code;
+	u16 out_fmt;
+	u32 data_type;
+};
+
+struct ap1302_format {
+	struct v4l2_mbus_framefmt format;
+	const struct ap1302_format_info *info;
+};
+
+struct ap1302_size {
+	unsigned int width;
+	unsigned int height;
+};
+
+struct ap1302_sensor_supply {
+	const char *name;
+	unsigned int post_delay_us;
+};
+
+static const struct ap1302_sensor_supply ap1302_supplies[] = {
+	{ .name = "dvdd", .post_delay_us = 2000, },
+	{ .name = "hmisc", .post_delay_us = 2000, },
+	{ .name = "smisc", .post_delay_us = 2000, },
+};
+
+#define AP1302_NUM_SUPPLIES	ARRAY_SIZE(ap1302_supplies)
+
+struct ap1302_sensor_info {
+	const char *model;
+	const char *name;
+	unsigned int i2c_addr;
+	struct ap1302_size resolution;
+	u32 format;
+	const struct ap1302_sensor_supply *supplies;
+};
+
+struct ap1302_sensor {
+	struct ap1302_device *ap1302;
+	unsigned int index;
+
+	struct device_node *of_node;
+	struct device *dev;
+	unsigned int num_supplies;
+	struct regulator_bulk_data *supplies;
+
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+};
+
+static inline struct ap1302_sensor *to_ap1302_sensor(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ap1302_sensor, sd);
+}
+
+struct ap1302_device {
+	struct device *dev;
+	struct i2c_client *client;
+
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *standby_gpio;
+	struct gpio_desc *isp_en_gpio;
+	struct clk *clock;
+	struct regmap *regmap16;
+	struct regmap *regmap32;
+	u32 reg_page;
+
+	const struct firmware *fw;
+
+	struct v4l2_fwnode_endpoint bus_cfg;
+
+	struct mutex lock;	/* Protects formats */
+
+	struct v4l2_subdev sd;
+	struct media_pad pads[AP1302_PAD_MAX];
+	unsigned int width_factor;
+	bool streaming;
+
+	struct v4l2_ctrl_handler ctrls;
+
+	const struct ap1302_sensor_info *sensor_info;
+	struct ap1302_sensor sensors[2];
+
+	struct regulator_bulk_data supplies[AP1302_NUM_SUPPLIES];
+
+	struct {
+		struct dentry *dir;
+		struct mutex lock; /* Protects debugfs access */
+		u32 sipm_addr;
+	} debugfs;
+};
+
+static inline struct ap1302_device *to_ap1302(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ap1302_device, sd);
+}
+
+struct ap1302_firmware_header {
+	u32 crc;
+	u32 checksum;
+	u32 pll_init_size;
+	u32 total_size;
+} __packed;
+
+static const struct ap1302_format_info supported_video_formats[] = {
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.out_fmt = AP1302_PREVIEW_OUT_FMT_FT_YUV_JFIF |
+			   AP1302_PREVIEW_OUT_FMT_FST_YUV_422,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
+	}, {
+		.code = MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+		.out_fmt = AP1302_PREVIEW_OUT_FMT_FT_YUV_JFIF |
+			   AP1302_PREVIEW_OUT_FMT_FST_YUV_420,
+		.data_type = MIPI_CSI2_DT_YUV420_8B,
+	},
+};
+
+/* -----------------------------------------------------------------------------
+ * Sensor Info
+ */
+
+static const struct ap1302_sensor_info ap1302_sensor_info[] = {
+	{
+		.model = "onnn,ar0144",
+		.name = "ar0144",
+		.i2c_addr = 0x10,
+		.resolution = { 1280, 800 },
+		.format = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.supplies = (const struct ap1302_sensor_supply[]) {
+			{ "vaa", 100 },
+			{ "vddio", 100 },
+			{ "vdd", 0 },
+			{ },
+		},
+	}, {
+		.model = "onnn,ar0330",
+		.name = "ar0330",
+		.i2c_addr = 0x10,
+		.resolution = { 2304, 1536 },
+		.format = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.supplies = (const struct ap1302_sensor_supply[]) {
+			{ "vddpll", 0 },
+			{ "vaa", 0 },
+			{ "vdd", 0 },
+			{ "vddio", 0 },
+			{ },
+		},
+	}, {
+		.model = "onnn,ar1335",
+		.name = "ar1335",
+		.i2c_addr = 0x36,
+		.resolution = { 4208, 3120 },
+		.format = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.supplies = (const struct ap1302_sensor_supply[]) {
+			{ "vaa", 0 },
+			{ "vddio", 0 },
+			{ "vdd", 0 },
+			{ },
+		},
+	},
+};
+
+static const struct ap1302_sensor_info ap1302_sensor_info_tpg = {
+	.model = "",
+	.name = "tpg",
+	.resolution = { 1920, 1080 },
+};
+
+/* -----------------------------------------------------------------------------
+ * Register Configuration
+ */
+
+static const struct regmap_config ap1302_reg16_config = {
+	.name = "val_16bits",
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_stride = 2,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.cache_type = REGCACHE_NONE,
+};
+
+static const struct regmap_config ap1302_reg32_config = {
+	.name = "val_32bits",
+	.reg_bits = 16,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.cache_type = REGCACHE_NONE,
+};
+
+static int __ap1302_write(struct ap1302_device *ap1302, u32 reg, u32 val)
+{
+	unsigned int size = AP1302_REG_SIZE(reg);
+	u16 addr = AP1302_REG_ADDR(reg);
+	int ret;
+
+	switch (size) {
+	case 2:
+		ret = regmap_write(ap1302->regmap16, addr, val);
+		break;
+	case 4:
+		ret = regmap_write(ap1302->regmap32, addr, val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret) {
+		dev_err(ap1302->dev, "%s: register 0x%04x %s failed: %d\n",
+			__func__, addr, "write", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ap1302_write(struct ap1302_device *ap1302, u32 reg, u32 val,
+			int *err)
+{
+	u32 page = AP1302_REG_PAGE(reg);
+	int ret;
+
+	if (err && *err)
+		return *err;
+
+	if (page) {
+		if (ap1302->reg_page != page) {
+			ret = __ap1302_write(ap1302, AP1302_ADVANCED_BASE,
+					     page);
+			if (ret < 0)
+				goto done;
+
+			ap1302->reg_page = page;
+		}
+
+		reg &= ~AP1302_REG_PAGE_MASK;
+		reg += AP1302_REG_ADV_START;
+	}
+
+	ret = __ap1302_write(ap1302, reg, val);
+
+done:
+	if (err && ret)
+		*err = ret;
+
+	return ret;
+}
+
+static int __ap1302_read(struct ap1302_device *ap1302, u32 reg, u32 *val)
+{
+	unsigned int size = AP1302_REG_SIZE(reg);
+	u16 addr = AP1302_REG_ADDR(reg);
+	int ret;
+
+	switch (size) {
+	case 2:
+		ret = regmap_read(ap1302->regmap16, addr, val);
+		break;
+	case 4:
+		ret = regmap_read(ap1302->regmap32, addr, val);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret) {
+		dev_err(ap1302->dev, "%s: register 0x%04x %s failed: %d\n",
+			__func__, addr, "read", ret);
+		return ret;
+	}
+
+	dev_dbg(ap1302->dev, "%s: R0x%04x = 0x%0*x\n", __func__,
+		addr, size * 2, *val);
+
+	return 0;
+}
+
+static int ap1302_read(struct ap1302_device *ap1302, u32 reg, u32 *val)
+{
+	u32 page = AP1302_REG_PAGE(reg);
+	int ret;
+
+	if (page) {
+		if (ap1302->reg_page != page) {
+			ret = __ap1302_write(ap1302, AP1302_ADVANCED_BASE,
+					     page);
+			if (ret < 0)
+				return ret;
+
+			ap1302->reg_page = page;
+		}
+
+		reg &= ~AP1302_REG_PAGE_MASK;
+		reg += AP1302_REG_ADV_START;
+	}
+
+	return __ap1302_read(ap1302, reg, val);
+}
+
+/* -----------------------------------------------------------------------------
+ * Sensor Registers Access
+ *
+ * Read and write sensor registers through the AP1302 DMA interface.
+ */
+
+static int ap1302_dma_wait_idle(struct ap1302_device *ap1302)
+{
+	int ret, val;
+	u32 ctrl;
+
+	ret = read_poll_timeout(ap1302_read, val,
+				val < 0 ||
+				((ctrl & AP1302_DMA_CTRL_MODE_MASK) == AP1302_DMA_CTRL_MODE_IDLE),
+				1000, 50000, 0, ap1302, AP1302_DMA_CTRL, &ctrl);
+
+	if (val < 0)
+		return val;
+
+	return ret;
+}
+
+static int ap1302_sipm_read(struct ap1302_device *ap1302, unsigned int port,
+			    u32 reg, u32 *val)
+{
+	unsigned int size = AP1302_REG_SIZE(reg);
+	u32 src;
+	int ret;
+
+	if (size > 2)
+		return -EINVAL;
+
+	ret = ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	ap1302_write(ap1302, AP1302_DMA_SIZE, size, &ret);
+	src = AP1302_DMA_SIP_SIPM(port) |
+	      (size == 2 ? AP1302_DMA_SIP_DATA_16_BIT : 0) |
+	      AP1302_DMA_SIP_ADDR_16_BIT |
+	      AP1302_DMA_SIP_ID(ap1302->sensor_info->i2c_addr) |
+	      AP1302_DMA_SIP_REG(AP1302_REG_ADDR(reg));
+	ap1302_write(ap1302, AP1302_DMA_SRC, src, &ret);
+
+	/*
+	 * Use the AP1302_DMA_DST register as both the destination address, and
+	 * the scratch pad to store the read value.
+	 */
+	ap1302_write(ap1302, AP1302_DMA_DST, AP1302_REG_ADDR(AP1302_DMA_DST),
+		     &ret);
+
+	ap1302_write(ap1302, AP1302_DMA_CTRL,
+		     AP1302_DMA_CTRL_SCH_NORMAL |
+		     AP1302_DMA_CTRL_DST_REG |
+		     AP1302_DMA_CTRL_SRC_SIP |
+		     AP1302_DMA_CTRL_MODE_COPY, &ret);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_read(ap1302, AP1302_DMA_DST, val);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The value is stored in big-endian at the DMA_DST address. The regmap
+	 * uses big-endian, so 8-bit values are stored in bits 31:24 and 16-bit
+	 * values in bits 23:16.
+	 */
+	*val >>= 32 - size * 8;
+
+	return 0;
+}
+
+static int ap1302_sipm_write(struct ap1302_device *ap1302, unsigned int port,
+			     u32 reg, u32 val)
+{
+	unsigned int size = AP1302_REG_SIZE(reg);
+	u32 dst;
+	int ret;
+
+	if (size > 2)
+		return -EINVAL;
+
+	ret = ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	ap1302_write(ap1302, AP1302_DMA_SIZE, size, &ret);
+
+	/*
+	 * Use the AP1302_DMA_SRC register as both the source address, and the
+	 * scratch pad to store the write value.
+	 *
+	 * As the AP1302 uses big endian, to store the value at address DMA_SRC
+	 * it must be written in the high order bits of the registers. However,
+	 * 8-bit values seem to be incorrectly handled by the AP1302, which
+	 * expects them to be stored at DMA_SRC + 1 instead of DMA_SRC. The
+	 * value is thus unconditionally shifted by 16 bits, unlike for DMA
+	 * reads.
+	 */
+	ap1302_write(ap1302, AP1302_DMA_SRC,
+		     (val << 16) | AP1302_REG_ADDR(AP1302_DMA_SRC), &ret);
+	if (ret < 0)
+		return ret;
+
+	dst = AP1302_DMA_SIP_SIPM(port) |
+	      (size == 2 ? AP1302_DMA_SIP_DATA_16_BIT : 0) |
+	      AP1302_DMA_SIP_ADDR_16_BIT |
+	      AP1302_DMA_SIP_ID(ap1302->sensor_info->i2c_addr) |
+	      AP1302_DMA_SIP_REG(AP1302_REG_ADDR(reg));
+	ap1302_write(ap1302, AP1302_DMA_DST, dst, &ret);
+
+	ap1302_write(ap1302, AP1302_DMA_CTRL,
+		     AP1302_DMA_CTRL_SCH_NORMAL |
+		     AP1302_DMA_CTRL_DST_SIP |
+		     AP1302_DMA_CTRL_SRC_REG |
+		     AP1302_DMA_CTRL_MODE_COPY, &ret);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_dma_wait_idle(ap1302);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Debugfs
+ */
+
+static int ap1302_sipm_addr_get(void *arg, u64 *val)
+{
+	struct ap1302_device *ap1302 = arg;
+
+	guard(mutex)(&ap1302->debugfs.lock);
+
+	*val = ap1302->debugfs.sipm_addr;
+
+	return 0;
+}
+
+static int ap1302_sipm_addr_set(void *arg, u64 val)
+{
+	struct ap1302_device *ap1302 = arg;
+
+	if (val & ~0x8700ffff)
+		return -EINVAL;
+
+	switch ((val >> 24) & 7) {
+	case 1:
+	case 2:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	guard(mutex)(&ap1302->debugfs.lock);
+	ap1302->debugfs.sipm_addr = val;
+
+	return 0;
+}
+
+static int ap1302_sipm_data_get(void *arg, u64 *val)
+{
+	struct ap1302_device *ap1302 = arg;
+	u32 value;
+	u32 addr;
+	int ret;
+
+	guard(mutex)(&ap1302->debugfs.lock);
+
+	addr = ap1302->debugfs.sipm_addr;
+	if (!addr)
+		return -EINVAL;
+
+	ret = ap1302_sipm_read(ap1302, addr >> 30, addr & ~BIT(31), &value);
+	if (!ret)
+		*val = value;
+
+	return ret;
+}
+
+static int ap1302_sipm_data_set(void *arg, u64 val)
+{
+	struct ap1302_device *ap1302 = arg;
+	u32 addr;
+
+	guard(mutex)(&ap1302->debugfs.lock);
+
+	addr = ap1302->debugfs.sipm_addr;
+	if (!addr)
+		return -EINVAL;
+
+	return ap1302_sipm_write(ap1302, addr >> 30, addr & ~BIT(31), val);
+}
+
+/*
+ * The sipm_addr and sipm_data attributes expose access to the sensor I2C bus.
+ *
+ * To read or write a register, sipm_addr has to first be written with the
+ * register address. The address is a 32-bit integer formatted as follows.
+ *
+ * I000 0SSS 0000 0000 RRRR RRRR RRRR RRRR
+ *
+ * I: SIPM index (0 or 1)
+ * S: Size (1: 8-bit, 2: 16-bit)
+ * R: Register address (16-bit)
+ *
+ * The sipm_data attribute can then be read to read the register value, or
+ * written to write it.
+ */
+
+DEFINE_DEBUGFS_ATTRIBUTE(ap1302_sipm_addr_fops, ap1302_sipm_addr_get,
+			 ap1302_sipm_addr_set, "0x%08llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(ap1302_sipm_data_fops, ap1302_sipm_data_get,
+			 ap1302_sipm_data_set, "0x%08llx\n");
+
+static void ap1302_debugfs_init(struct ap1302_device *ap1302)
+{
+	struct dentry *dir;
+	char name[16];
+
+	mutex_init(&ap1302->debugfs.lock);
+
+	snprintf(name, sizeof(name), "ap1302.%s", dev_name(ap1302->dev));
+
+	dir = debugfs_create_dir(name, NULL);
+	if (IS_ERR(dir))
+		return;
+
+	ap1302->debugfs.dir = dir;
+
+	debugfs_create_file_unsafe("sipm_addr", 0600, ap1302->debugfs.dir,
+				   ap1302, &ap1302_sipm_addr_fops);
+	debugfs_create_file_unsafe("sipm_data", 0600, ap1302->debugfs.dir,
+				   ap1302, &ap1302_sipm_data_fops);
+}
+
+static void ap1302_debugfs_cleanup(void *data)
+{
+	struct ap1302_device *ap1302 = data;
+
+	debugfs_remove_recursive(ap1302->debugfs.dir);
+	mutex_destroy(&ap1302->debugfs.lock);
+}
+
+/* -----------------------------------------------------------------------------
+ * Power Handling
+ */
+
+static int ap1302_power_on_sensors(struct ap1302_device *ap1302)
+{
+	struct ap1302_sensor *sensor;
+	unsigned int i, j;
+	int ret;
+
+	if (!ap1302->sensor_info->supplies)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		sensor = &ap1302->sensors[i];
+		ret = 0;
+
+		for (j = 0; j < sensor->num_supplies; ++j) {
+			unsigned int delay;
+
+			/*
+			 * We can't use regulator_bulk_enable() as it would
+			 * enable all supplies in parallel, breaking the sensor
+			 * power sequencing constraints.
+			 */
+			ret = regulator_enable(sensor->supplies[j].consumer);
+			if (ret < 0) {
+				dev_err(ap1302->dev,
+					"Failed to enable supply %u for sensor %u\n",
+					j, i);
+				goto error;
+			}
+
+			delay = ap1302->sensor_info->supplies[j].post_delay_us;
+			usleep_range(delay, delay + 100);
+		}
+	}
+
+	return 0;
+
+error:
+	for (; j > 0; --j)
+		regulator_disable(sensor->supplies[j - 1].consumer);
+
+	for (; i > 0; --i) {
+		sensor = &ap1302->sensors[i - 1];
+		regulator_bulk_disable(sensor->num_supplies, sensor->supplies);
+	}
+
+	return ret;
+}
+
+static void ap1302_power_off_sensors(struct ap1302_device *ap1302)
+{
+	unsigned int i;
+
+	if (!ap1302->sensor_info->supplies)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor = &ap1302->sensors[i];
+
+		regulator_bulk_disable(sensor->num_supplies, sensor->supplies);
+	}
+}
+
+static int ap1302_power_on(struct ap1302_device *ap1302)
+{
+	int ret;
+	int i;
+
+	/* 0. RESET was asserted when getting the GPIO. */
+	gpiod_set_value_cansleep(ap1302->reset_gpio, 1);
+
+	/* 1. Assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		gpiod_set_value_cansleep(ap1302->standby_gpio, 1);
+		usleep_range(200, 1000);
+	}
+
+	/* 2. Power up the regulators. To be implemented. */
+	for (i = 0; i < AP1302_NUM_SUPPLIES; ++i) {
+		unsigned int delay;
+
+		ret = regulator_enable(ap1302->supplies[i].consumer);
+		if (ret < 0) {
+			dev_err(ap1302->dev, "enable regulator fail\n");
+			return ret;
+		}
+
+		delay = ap1302_supplies[i].post_delay_us;
+		usleep_range(delay, delay + 100);
+	}
+
+	/* 3. De-assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		gpiod_set_value_cansleep(ap1302->standby_gpio, 0);
+		usleep_range(200, 1000);
+	}
+
+	/* 4. Turn the clock on. */
+	ret = clk_prepare_enable(ap1302->clock);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "Failed to enable clock: %d\n", ret);
+		return ret;
+	}
+
+	/* 5. De-assert RESET. */
+	gpiod_set_value_cansleep(ap1302->reset_gpio, 0);
+
+	/*
+	 * 6. Wait for the AP1302 to initialize. The datasheet doesn't specify
+	 * how long this takes.
+	 */
+	usleep_range(10000, 11000);
+
+	return 0;
+}
+
+static void ap1302_power_off(struct ap1302_device *ap1302)
+{
+	/* 1. Assert RESET. */
+	gpiod_set_value_cansleep(ap1302->reset_gpio, 1);
+
+	/* 2. Turn the clock off. */
+	clk_disable_unprepare(ap1302->clock);
+
+	/* 3. Assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		gpiod_set_value_cansleep(ap1302->standby_gpio, 1);
+		usleep_range(200, 1000);
+	}
+
+	/* 4. Power down the regulators. To be implemented. */
+	regulator_bulk_disable(AP1302_NUM_SUPPLIES, ap1302->supplies);
+
+	/* 5. De-assert STANDBY. */
+	if (ap1302->standby_gpio) {
+		usleep_range(200, 1000);
+		gpiod_set_value_cansleep(ap1302->standby_gpio, 0);
+	}
+}
+
+/* -----------------------------------------------------------------------------
+ * Hardware Configuration
+ */
+
+static int ap1302_dump_console(struct ap1302_device *ap1302)
+{
+	u8 *buffer;
+	u8 *endp;
+	u8 *p;
+	int ret;
+
+	buffer = kmalloc(AP1302_CON_BUF_SIZE + 1, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	ret = regmap_raw_read(ap1302->regmap16, AP1302_CON_BUF(0), buffer,
+			      AP1302_CON_BUF_SIZE);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "Failed to read console buffer: %d\n",
+			ret);
+		goto done;
+	}
+
+	print_hex_dump(KERN_INFO, "console ", DUMP_PREFIX_OFFSET, 16, 1, buffer,
+		       AP1302_CON_BUF_SIZE, true);
+
+	buffer[AP1302_CON_BUF_SIZE] = '\0';
+
+	for (p = buffer; p < buffer + AP1302_CON_BUF_SIZE && *p; p = endp + 1) {
+		endp = strchrnul(p, '\n');
+		*endp = '\0';
+
+		pr_info("console %s\n", p);
+	}
+
+	ret = 0;
+
+done:
+	kfree(buffer);
+	return ret;
+}
+
+static const struct ap1302_format_info *find_info_by_code(u32 code)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(supported_video_formats); i++) {
+		if (supported_video_formats[i].code == code)
+			break;
+	}
+
+	if (i >= ARRAY_SIZE(supported_video_formats))
+		return &supported_video_formats[0];
+
+	return &supported_video_formats[i];
+}
+
+static int ap1302_configure(struct ap1302_device *ap1302)
+{
+	const struct v4l2_mbus_framefmt *format;
+	const struct ap1302_format_info *info;
+	struct v4l2_subdev *sd = &ap1302->sd;
+	struct v4l2_subdev_state *state;
+	unsigned int data_lanes = ap1302->bus_cfg.bus.mipi_csi2.num_data_lanes;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	format = v4l2_subdev_state_get_format(state, AP1302_PAD_SOURCE);
+
+	info = find_info_by_code(format->code);
+
+	ap1302_write(ap1302, AP1302_PREVIEW_HINF_CTRL,
+		     AP1302_PREVIEW_HINF_CTRL_SPOOF |
+		     AP1302_PREVIEW_HINF_CTRL_MIPI_LANES(data_lanes), &ret);
+
+	ap1302_write(ap1302, AP1302_PREVIEW_WIDTH,
+		     format->width / ap1302->width_factor, &ret);
+	ap1302_write(ap1302, AP1302_PREVIEW_HEIGHT,
+		     format->height, &ret);
+	ap1302_write(ap1302, AP1302_PREVIEW_OUT_FMT,
+		     info->out_fmt, &ret);
+
+	if (ret < 0)
+		goto unlock_state;
+
+	__v4l2_ctrl_handler_setup(&ap1302->ctrls);
+
+unlock_state:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static int ap1302_stall(struct ap1302_device *ap1302, bool stall)
+{
+	int ret = 0;
+
+	if (stall) {
+		ap1302_write(ap1302, AP1302_SYS_START,
+			     AP1302_SYS_START_PLL_LOCK |
+			     AP1302_SYS_START_STALL_MODE_DISABLED, &ret);
+		ap1302_write(ap1302, AP1302_SYS_START,
+			     AP1302_SYS_START_PLL_LOCK |
+			     AP1302_SYS_START_STALL_EN |
+			     AP1302_SYS_START_STALL_MODE_DISABLED, &ret);
+		if (ret < 0)
+			return ret;
+
+		msleep(200);
+		return ret;
+	} else {
+		return ap1302_write(ap1302, AP1302_SYS_START,
+				    AP1302_SYS_START_PLL_LOCK |
+				    AP1302_SYS_START_STALL_STATUS |
+				    AP1302_SYS_START_STALL_EN |
+				    AP1302_SYS_START_STALL_MODE_DISABLED, NULL);
+	}
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Controls
+ */
+
+static u16 ap1302_wb_values[] = {
+	AP1302_AWB_CTRL_MODE_OFF,	/* V4L2_WHITE_BALANCE_MANUAL */
+	AP1302_AWB_CTRL_MODE_AUTO,	/* V4L2_WHITE_BALANCE_AUTO */
+	AP1302_AWB_CTRL_MODE_A,		/* V4L2_WHITE_BALANCE_INCANDESCENT */
+	AP1302_AWB_CTRL_MODE_D50,	/* V4L2_WHITE_BALANCE_FLUORESCENT */
+	AP1302_AWB_CTRL_MODE_D65,	/* V4L2_WHITE_BALANCE_FLUORESCENT_H */
+	AP1302_AWB_CTRL_MODE_HORIZON,	/* V4L2_WHITE_BALANCE_HORIZON */
+	AP1302_AWB_CTRL_MODE_D65,	/* V4L2_WHITE_BALANCE_DAYLIGHT */
+	AP1302_AWB_CTRL_MODE_AUTO,	/* V4L2_WHITE_BALANCE_FLASH */
+	AP1302_AWB_CTRL_MODE_D75,	/* V4L2_WHITE_BALANCE_CLOUDY */
+	AP1302_AWB_CTRL_MODE_D75,	/* V4L2_WHITE_BALANCE_SHADE */
+};
+
+static inline struct ap1302_device *ctrl_to_sd(struct v4l2_ctrl *ctrl)
+{
+	return container_of(ctrl->handler, struct ap1302_device, ctrls);
+}
+
+static int ap1302_set_wb_mode(struct ap1302_device *ap1302, s32 mode)
+{
+	u32 val;
+	int ret;
+
+	ret = ap1302_read(ap1302, AP1302_AWB_CTRL, &val);
+	if (ret)
+		return ret;
+	val &= ~AP1302_AWB_CTRL_MODE_MASK;
+	val |= ap1302_wb_values[mode];
+
+	if (mode == V4L2_WHITE_BALANCE_FLASH)
+		val |= AP1302_AWB_CTRL_FLASH;
+	else
+		val &= ~AP1302_AWB_CTRL_FLASH;
+
+	return ap1302_write(ap1302, AP1302_AWB_CTRL, val, NULL);
+}
+
+static int ap1302_set_exposure(struct ap1302_device *ap1302, s32 mode)
+{
+	u32 val;
+	int ret;
+
+	ret = ap1302_read(ap1302, AP1302_AE_CTRL, &val);
+	if (ret)
+		return ret;
+
+	val &= ~AP1302_AE_CTRL_MODE_MASK;
+	val |= mode;
+
+	return ap1302_write(ap1302, AP1302_AE_CTRL, val, NULL);
+}
+
+static int ap1302_set_exp_met(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_AE_MET, val, NULL);
+}
+
+static int ap1302_set_gain(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_AE_MANUAL_GAIN, val, NULL);
+}
+
+static int ap1302_set_contrast(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_CONTRAST, val, NULL);
+}
+
+static int ap1302_set_brightness(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_BRIGHTNESS, val, NULL);
+}
+
+static int ap1302_set_saturation(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_SATURATION, val, NULL);
+}
+
+static int ap1302_set_gamma(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_GAMMA, val, NULL);
+}
+
+static int ap1302_set_zoom(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_DZ_TGT_FCT, val, NULL);
+}
+
+static u16 ap1302_sfx_values[] = {
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_NONE */
+	AP1302_SFX_MODE_SFX_BW,		/* V4L2_COLORFX_BW */
+	AP1302_SFX_MODE_SFX_SEPIA1,	/* V4L2_COLORFX_SEPIA */
+	AP1302_SFX_MODE_SFX_NEGATIVE,	/* V4L2_COLORFX_NEGATIVE */
+	AP1302_SFX_MODE_SFX_EMBOSS,	/* V4L2_COLORFX_EMBOSS */
+	AP1302_SFX_MODE_SFX_SKETCH,	/* V4L2_COLORFX_SKETCH */
+	AP1302_SFX_MODE_SFX_BLUISH,	/* V4L2_COLORFX_SKY_BLUE */
+	AP1302_SFX_MODE_SFX_GREENISH,	/* V4L2_COLORFX_GRASS_GREEN */
+	AP1302_SFX_MODE_SFX_REDISH,	/* V4L2_COLORFX_SKIN_WHITEN */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_VIVID */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_AQUA */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_ART_FREEZE */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_SILHOUETTE */
+	AP1302_SFX_MODE_SFX_SOLARIZE, /* V4L2_COLORFX_SOLARIZATION */
+	AP1302_SFX_MODE_SFX_ANTIQUE, /* V4L2_COLORFX_ANTIQUE */
+	AP1302_SFX_MODE_SFX_NORMAL,	/* V4L2_COLORFX_SET_CBCR */
+};
+
+static int ap1302_set_special_effect(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_SFX_MODE, ap1302_sfx_values[val], NULL);
+}
+
+static u16 ap1302_scene_mode_values[] = {
+	AP1302_SCENE_CTRL_MODE_NORMAL,		/* V4L2_SCENE_MODE_NONE */
+	AP1302_SCENE_CTRL_MODE_BACKLIGHT,	/* V4L2_SCENE_MODE_BACKLIGHT */
+	AP1302_SCENE_CTRL_MODE_BEACH,		/* V4L2_SCENE_MODE_BEACH_SNOW */
+	AP1302_SCENE_CTRL_MODE_TWILIGHT,	/* V4L2_SCENE_MODE_CANDLE_LIGHT */
+	AP1302_SCENE_CTRL_MODE_NORMAL,		/* V4L2_SCENE_MODE_DAWN_DUSK */
+	AP1302_SCENE_CTRL_MODE_NORMAL,		/* V4L2_SCENE_MODE_FALL_COLORS */
+	AP1302_SCENE_CTRL_MODE_FIREWORKS,	/* V4L2_SCENE_MODE_FIREWORKS */
+	AP1302_SCENE_CTRL_MODE_LANDSCAPE,	/* V4L2_SCENE_MODE_LANDSCAPE */
+	AP1302_SCENE_CTRL_MODE_NIGHT,		/* V4L2_SCENE_MODE_NIGHT */
+	AP1302_SCENE_CTRL_MODE_PARTY,		/* V4L2_SCENE_MODE_PARTY_INDOOR */
+	AP1302_SCENE_CTRL_MODE_PORTRAIT,	/* V4L2_SCENE_MODE_PORTRAIT */
+	AP1302_SCENE_CTRL_MODE_SPORT,		/* V4L2_SCENE_MODE_SPORTS */
+	AP1302_SCENE_CTRL_MODE_SUNSET,		/* V4L2_SCENE_MODE_SUNSET */
+	AP1302_SCENE_CTRL_MODE_DOCUMENT,	/* V4L2_SCENE_MODE_TEXT */
+};
+
+static int ap1302_set_scene_mode(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_SCENE_CTRL,
+			    ap1302_scene_mode_values[val], NULL);
+}
+
+static const u16 ap1302_flicker_values[] = {
+	AP1302_FLICK_CTRL_MODE_DISABLED,
+	AP1302_FLICK_CTRL_FREQ(50) | AP1302_FLICK_CTRL_MODE_MANUAL,
+	AP1302_FLICK_CTRL_FREQ(60) | AP1302_FLICK_CTRL_MODE_MANUAL,
+	AP1302_FLICK_CTRL_MODE_AUTO,
+};
+
+static int ap1302_set_flicker_freq(struct ap1302_device *ap1302, s32 val)
+{
+	return ap1302_write(ap1302, AP1302_FLICK_CTRL,
+			    ap1302_flicker_values[val], NULL);
+}
+
+static int ap1302_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ap1302_device *ap1302 = ctrl_to_sd(ctrl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
+		return ap1302_set_wb_mode(ap1302, ctrl->val);
+
+	case V4L2_CID_EXPOSURE:
+		return ap1302_set_exposure(ap1302, ctrl->val);
+
+	case V4L2_CID_EXPOSURE_METERING:
+		return ap1302_set_exp_met(ap1302, ctrl->val);
+
+	case V4L2_CID_GAIN:
+		return ap1302_set_gain(ap1302, ctrl->val);
+
+	case V4L2_CID_GAMMA:
+		return ap1302_set_gamma(ap1302, ctrl->val);
+
+	case V4L2_CID_CONTRAST:
+		return ap1302_set_contrast(ap1302, ctrl->val);
+
+	case V4L2_CID_BRIGHTNESS:
+		return ap1302_set_brightness(ap1302, ctrl->val);
+
+	case V4L2_CID_SATURATION:
+		return ap1302_set_saturation(ap1302, ctrl->val);
+
+	case V4L2_CID_ZOOM_ABSOLUTE:
+		return ap1302_set_zoom(ap1302, ctrl->val);
+
+	case V4L2_CID_COLORFX:
+		return ap1302_set_special_effect(ap1302, ctrl->val);
+
+	case V4L2_CID_SCENE_MODE:
+		return ap1302_set_scene_mode(ap1302, ctrl->val);
+
+	case V4L2_CID_POWER_LINE_FREQUENCY:
+		return ap1302_set_flicker_freq(ap1302, ctrl->val);
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static const s64 ap1302_link_freqs[] = {
+	445000000,
+};
+
+static int ap1302_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ap1302_device *ap1302 = ctrl_to_sd(ctrl);
+	int i;
+	u32 val;
+
+	switch (ctrl->id) {
+	case V4L2_CID_LINK_FREQ:
+		ap1302_read(ap1302, AP1302_REG_16BIT(0x0068), &val);
+		for (i = 0; i < ARRAY_SIZE(ap1302_link_freqs); i++) {
+			if (ap1302_link_freqs[i] == (val / 2) * 1000000)
+				break;
+		}
+		WARN_ON(i == ARRAY_SIZE(ap1302_link_freqs));
+		__v4l2_ctrl_s_ctrl(ctrl, i);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops ap1302_ctrl_ops = {
+	.s_ctrl = ap1302_s_ctrl,
+	.g_volatile_ctrl = ap1302_g_volatile_ctrl,
+};
+
+static const struct v4l2_ctrl_config ap1302_ctrls[] = {
+	{
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE,
+		.min = 0,
+		.max = 9,
+		.def = 1,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_GAMMA,
+		.name = "Gamma",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x0100,
+		.max = 0xFFFF,
+		.step = 0x100,
+		.def = 0x1000,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_CONTRAST,
+		.name = "Contrast",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x100,
+		.max = 0xFFFF,
+		.step = 0x100,
+		.def = 0x100,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_BRIGHTNESS,
+		.name = "Brightness",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x100,
+		.max = 0xFFFF,
+		.step = 0x100,
+		.def = 0x100,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_SATURATION,
+		.name = "Saturation",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x0100,
+		.max = 0xFFFF,
+		.step = 0x100,
+		.def = 0x1000,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_EXPOSURE,
+		.name = "Exposure",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x0,
+		.max = 0xC,
+		.step = 1,
+		.def = 0xC,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_EXPOSURE_METERING,
+		.name = "Exposure Metering",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x0,
+		.max = 0x3,
+		.step = 1,
+		.def = 0x1,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_GAIN,
+		.name = "Gain",
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.min = 0x0100,
+		.max = 0xFFFF,
+		.step = 0x100,
+		.def = 0x100,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_ZOOM_ABSOLUTE,
+		.min = 0x0100,
+		.max = 0x1000,
+		.step = 1,
+		.def = 0x0100,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_COLORFX,
+		.min = 0,
+		.max = 15,
+		.def = 0,
+		.menu_skip_mask = BIT(15) | BIT(12) | BIT(11) | BIT(10) | BIT(9),
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_SCENE_MODE,
+		.min = 0,
+		.max = 13,
+		.def = 0,
+		.menu_skip_mask = BIT(5) | BIT(4),
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_POWER_LINE_FREQUENCY,
+		.min = 0,
+		.max = 3,
+		.def = 3,
+	}, {
+		.ops = &ap1302_ctrl_ops,
+		.id = V4L2_CID_LINK_FREQ,
+		.min = 0,
+		.max = ARRAY_SIZE(ap1302_link_freqs) - 1,
+		.def = 0,
+		.qmenu_int = ap1302_link_freqs,
+	},
+};
+
+static int ap1302_ctrls_init(struct ap1302_device *ap1302)
+{
+	struct v4l2_fwnode_device_properties props;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_ctrl_handler_init(&ap1302->ctrls, ARRAY_SIZE(ap1302_ctrls));
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302_ctrls); i++)
+		v4l2_ctrl_new_custom(&ap1302->ctrls, &ap1302_ctrls[i], NULL);
+
+	if (ap1302->ctrls.error) {
+		ret = ap1302->ctrls.error;
+		goto free_ctrls;
+	}
+
+	ret = v4l2_fwnode_device_parse(ap1302->dev, &props);
+	if (ret)
+		goto free_ctrls;
+
+	ret = v4l2_ctrl_new_fwnode_properties(&ap1302->ctrls,
+					      &ap1302_ctrl_ops, &props);
+	if (ret)
+		goto free_ctrls;
+
+	/* Use same lock for controls as for everything else. */
+	ap1302->ctrls.lock = &ap1302->lock;
+	ap1302->sd.ctrl_handler = &ap1302->ctrls;
+
+	return 0;
+
+free_ctrls:
+	v4l2_ctrl_handler_free(&ap1302->ctrls);
+	return ret;
+}
+
+static void ap1302_ctrls_cleanup(struct ap1302_device *ap1302)
+{
+	v4l2_ctrl_handler_free(&ap1302->ctrls);
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Subdev Operations
+ */
+
+static int ap1302_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	const struct ap1302_sensor_info *info = ap1302->sensor_info;
+	unsigned int pad;
+
+	for (pad = 0; pad < AP1302_PAD_MAX; ++pad) {
+		struct v4l2_mbus_framefmt *format =
+			v4l2_subdev_state_get_format(state, pad);
+
+		format->width = info->resolution.width;
+		format->height = info->resolution.height;
+
+		/*
+		 * The source pad combines images side by side in multi-sensor
+		 * setup.
+		 */
+		if (pad == AP1302_PAD_SOURCE) {
+			format->width *= ap1302->width_factor;
+			format->code = supported_video_formats[0].code;
+		} else {
+			format->code = info->format;
+		}
+
+		format->field = V4L2_FIELD_NONE;
+		format->colorspace = V4L2_COLORSPACE_SRGB;
+	}
+
+	return 0;
+}
+
+static int ap1302_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+
+	if (code->pad != AP1302_PAD_SOURCE) {
+		/*
+		 * On the sink pads, only the format produced by the sensor is
+		 * supported.
+		 */
+		if (code->index)
+			return -EINVAL;
+
+		code->code = ap1302->sensor_info->format;
+	} else {
+		/* On the source pad, multiple formats are supported. */
+		if (code->index >= ARRAY_SIZE(supported_video_formats))
+			return -EINVAL;
+
+		code->code = supported_video_formats[code->index].code;
+	}
+
+	return 0;
+}
+
+static int ap1302_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+
+	if (fse->index)
+		return -EINVAL;
+
+	if (fse->pad != AP1302_PAD_SOURCE) {
+		/*
+		 * On the sink pads, only the size produced by the sensor is
+		 * supported.
+		 */
+		if (fse->code != ap1302->sensor_info->format)
+			return -EINVAL;
+
+		fse->min_width = ap1302->sensor_info->resolution.width;
+		fse->min_height = ap1302->sensor_info->resolution.height;
+		fse->max_width = ap1302->sensor_info->resolution.width;
+		fse->max_height = ap1302->sensor_info->resolution.height;
+	} else {
+		/*
+		 * On the source pad, the AP1302 can freely scale within the
+		 * scaler's limits.
+		 */
+		if (fse->index > ARRAY_SIZE(supported_video_formats))
+			return -EINVAL;
+
+		fse->min_width = AP1302_MIN_WIDTH * ap1302->width_factor;
+		fse->min_height = AP1302_MIN_HEIGHT;
+		fse->max_width = AP1302_MAX_WIDTH;
+		fse->max_height = AP1302_MAX_HEIGHT;
+	}
+
+	return 0;
+}
+
+static int ap1302_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	const struct ap1302_format_info *info = NULL;
+	struct v4l2_mbus_framefmt *format;
+	unsigned int i;
+
+	/* Formats on the sink pads can't be changed. */
+	if (fmt->pad != AP1302_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, state, fmt);
+
+	format = v4l2_subdev_state_get_format(state, fmt->pad, fmt->stream);
+
+	/* Validate the media bus code, default to the first supported value. */
+	for (i = 0; i < ARRAY_SIZE(supported_video_formats); i++) {
+		if (supported_video_formats[i].code == fmt->format.code) {
+			info = &supported_video_formats[i];
+			break;
+		}
+	}
+
+	if (!info)
+		info = &supported_video_formats[0];
+
+	/*
+	 * Clamp the size. The width must be a multiple of 4 (or 8 in the
+	 * dual-sensor case) and the height a multiple of 2.
+	 */
+	fmt->format.width = clamp(ALIGN_DOWN(fmt->format.width,
+					     4 * ap1302->width_factor),
+				  AP1302_MIN_WIDTH * ap1302->width_factor,
+				  AP1302_MAX_WIDTH);
+	fmt->format.height = clamp(ALIGN_DOWN(fmt->format.height, 2),
+				   AP1302_MIN_HEIGHT, AP1302_MAX_HEIGHT);
+
+	guard(mutex)(&ap1302->lock);
+
+	format->width = fmt->format.width;
+	format->height = fmt->format.height;
+	format->code = info->code;
+
+	fmt->format = *format;
+
+	return 0;
+}
+
+static int ap1302_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	const struct ap1302_size *resolution = &ap1302->sensor_info->resolution;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = resolution->width * ap1302->width_factor;
+		sel->r.height = resolution->height;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ap1302_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	const struct v4l2_mbus_framefmt *format;
+	const struct ap1302_format_info *info;
+	struct v4l2_subdev_state *state;
+
+	if (pad != AP1302_PAD_SOURCE || !fd)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	format = v4l2_subdev_state_get_format(state, AP1302_PAD_SOURCE);
+
+	info = find_info_by_code(format->code);
+
+	memset(fd, 0x0, sizeof(*fd));
+
+	scoped_guard(mutex, &ap1302->lock) {
+		fd->entry[0].flags = 0;
+		fd->entry[0].pixelcode = info->code;
+		fd->entry[0].bus.csi2.vc = 0;
+		fd->entry[0].bus.csi2.dt = info->data_type;
+	}
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	v4l2_subdev_unlock_state(state);
+	return 0;
+}
+
+static int ap1302_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	int ret = 0;
+
+	guard(mutex)(&ap1302->lock);
+
+	if (enable == ap1302->streaming)
+		goto done;
+
+	if (enable) {
+		ret = ap1302_configure(ap1302);
+		if (ret < 0)
+			goto done;
+
+		ret = ap1302_stall(ap1302, false);
+		if (!ret)
+			ap1302->streaming = true;
+	} else {
+		ret = ap1302_stall(ap1302, true);
+		if (!ret)
+			ap1302->streaming = false;
+	}
+
+done:
+	if (ret < 0)
+		dev_err(ap1302->dev, "Failed to %s stream: %d\n",
+			enable ? "start" : "stop", ret);
+
+	return ret;
+}
+
+static const char * const ap1302_warnings[] = {
+	"HINF_BANDWIDTH",
+	"FLICKER_DETECTION",
+	"FACED_NE",
+	"SMILED_NE",
+	"HINF_OVERRUN",
+	NULL,
+	"FRAME_TOO_SMALL",
+	"MISSING_PHASES",
+	"SPOOF_UNDERRUN",
+	"JPEG_NOLAST",
+	"NO_IN_FREQ_SPEC",
+	"SINF0",
+	"SINF1",
+	"CAPTURE0",
+	"CAPTURE1",
+	"ISR_UNHANDLED",
+	"INTERLEAVE_SPOOF",
+	"INTERLEAVE_BUF",
+	"COORD_OUT_OF_RANGE",
+	"ICP_CLOCKING",
+	"SENSOR_CLOCKING",
+	"SENSOR_NO_IHDR",
+	"DIVIDE_BY_ZERO",
+	"INT0_UNDERRUN",
+	"INT1_UNDERRUN",
+	"SCRATCHPAD_TOO_BIG",
+	"OTP_RECORD_READ",
+	"NO_LSC_IN_OTP",
+	"GPIO_INT_LOST",
+	"NO_PDAF_DATA",
+	"FAR_PDAF_ACCESS_SKIP",
+	"PDAF_ERROR",
+	"ATM_TVI_BOUNDS",
+	"SIPM_0_RTY",
+	"SIPM_1_TRY",
+	"SIPM_0_NO_ACK",
+	"SIPM_1_NO_ACK",
+	"SMILE_DIS",
+	"DVS_DIS",
+	"TEST_DIS",
+	"SENSOR_LV2LV",
+	"SENSOR_FV2FV",
+	"FRAME_LOST",
+};
+
+static const char * const ap1302_lane_states[] = {
+	"stop_s",
+	"hs_req_s",
+	"lp_req_s",
+	"hs_s",
+	"lp_s",
+	"esc_req_s",
+	"turn_req_s",
+	"esc_s",
+	"esc_0",
+	"esc_1",
+	"turn_s",
+	"turn_mark",
+	"error_s",
+};
+
+#define NUM_LANES 4
+static void ap1302_log_lane_state(struct ap1302_sensor *sensor,
+				  unsigned int index)
+{
+	static const char * const lp_states[] = {
+		"00", "10", "01", "11",
+	};
+	unsigned int counts[NUM_LANES][ARRAY_SIZE(ap1302_lane_states)];
+	unsigned int samples = 0;
+	unsigned int lane;
+	unsigned int i;
+	u32 first[NUM_LANES] = { 0, };
+	u32 last[NUM_LANES] = { 0, };
+	int ret;
+
+	memset(counts, 0, sizeof(counts));
+
+	for (i = 0; i < 1000; ++i) {
+		u32 values[NUM_LANES];
+
+		/*
+		 * Read the state of all lanes and skip read errors and invalid
+		 * values.
+		 */
+		for (lane = 0; lane < NUM_LANES; ++lane) {
+			ret = ap1302_read(sensor->ap1302,
+					  AP1302_ADV_SINF_MIPI_INTERNAL_p_LANE_n_STAT(index, lane),
+					  &values[lane]);
+			if (ret < 0)
+				break;
+
+			if (AP1302_LANE_STATE(values[lane]) >=
+			    ARRAY_SIZE(ap1302_lane_states)) {
+				ret = -EINVAL;
+				break;
+			}
+		}
+
+		if (ret < 0)
+			continue;
+
+		/* Accumulate the samples and save the first and last states. */
+		for (lane = 0; lane < NUM_LANES; ++lane)
+			counts[lane][AP1302_LANE_STATE(values[lane])]++;
+
+		if (!samples)
+			memcpy(first, values, sizeof(first));
+		memcpy(last, values, sizeof(last));
+
+		samples++;
+	}
+
+	if (!samples)
+		return;
+
+	/*
+	 * Print the LP state from the first sample, the error state from the
+	 * last sample, and the states accumulators for each lane.
+	 */
+	for (lane = 0; lane < NUM_LANES; ++lane) {
+		u32 state = last[lane];
+		char error_msg[25] = "";
+
+		if (state & (AP1302_LANE_ERR | AP1302_LANE_ABORT)) {
+			unsigned int err = AP1302_LANE_ERR_STATE(state);
+			const char *err_state = NULL;
+
+			err_state = err < ARRAY_SIZE(ap1302_lane_states)
+				  ? ap1302_lane_states[err] : "INVALID";
+
+			snprintf(error_msg, sizeof(error_msg), "ERR (%s%s) %s LP%s",
+				 state & AP1302_LANE_ERR ? "E" : "",
+				 state & AP1302_LANE_ABORT ? "A" : "",
+				 err_state,
+				 lp_states[AP1302_LANE_ERR_LP_VAL(state)]);
+		}
+
+		dev_info(sensor->ap1302->dev, "SINF%u L%u state: LP%s %s",
+			 index, lane, lp_states[AP1302_LANE_LP_VAL(first[lane])],
+			 error_msg);
+	}
+
+	/* Reset the error flags. */
+	for (lane = 0; lane < NUM_LANES; ++lane)
+		ap1302_write(sensor->ap1302,
+			     AP1302_ADV_SINF_MIPI_INTERNAL_p_LANE_n_STAT(index, lane),
+			     AP1302_LANE_ERR | AP1302_LANE_ABORT, NULL);
+}
+
+static int ap1302_log_status(struct v4l2_subdev *sd)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	u16 frame_count_brac;
+	u16 frame_count_hinf;
+	u16 frame_count_icp;
+	u32 warning[4];
+	u32 error[3];
+	unsigned int i;
+	u32 value;
+	int ret;
+
+	/* Dump the console buffer. */
+	ret = ap1302_dump_console(ap1302);
+	if (ret < 0)
+		return ret;
+
+	/* Print errors. */
+	ret = ap1302_read(ap1302, AP1302_ERROR, &error[0]);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_read(ap1302, AP1302_ERR_FILE, &error[1]);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_read(ap1302, AP1302_ERR_LINE, &error[2]);
+	if (ret < 0)
+		return ret;
+
+	dev_info(ap1302->dev, "ERROR: 0x%04x (file 0x%08x:%u)\n",
+		 error[0], error[1], error[2]);
+
+	ret = ap1302_read(ap1302, AP1302_SIPM_ERR_0, &error[0]);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_read(ap1302, AP1302_SIPM_ERR_1, &error[1]);
+	if (ret < 0)
+		return ret;
+
+	dev_info(ap1302->dev, "SIPM_ERR [0] 0x%04x [1] 0x%04x\n",
+		 error[0], error[1]);
+
+	/* Print warnings. */
+	for (i = 0; i < ARRAY_SIZE(warning); ++i) {
+		ret = ap1302_read(ap1302, AP1302_WARNING(i), &warning[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	dev_info(ap1302->dev,
+		 "WARNING [0] 0x%04x [1] 0x%04x [2] 0x%04x [3] 0x%04x\n",
+		 warning[0], warning[1], warning[2], warning[3]);
+
+	for (i = 0; i < ARRAY_SIZE(ap1302_warnings); ++i) {
+		if ((warning[i / 16] & BIT(i % 16)) &&
+		    ap1302_warnings[i])
+			dev_info(ap1302->dev, "- WARN_%s\n",
+				 ap1302_warnings[i]);
+	}
+
+	/* Print the frame counter. */
+	ret = ap1302_read(ap1302, AP1302_FRAME_CNT, &value);
+	if (ret < 0)
+		return ret;
+
+	frame_count_hinf = value >> 8;
+	frame_count_brac = value & 0xff;
+
+	ret = ap1302_read(ap1302, AP1302_ADV_CAPTURE_A_FV_CNT, &value);
+	if (ret < 0)
+		return ret;
+
+	frame_count_icp = value & 0xffff;
+
+	dev_info(ap1302->dev, "Frame counters: ICP %u, HINF %u, BRAC %u\n",
+		 frame_count_icp, frame_count_hinf, frame_count_brac);
+
+	/* Sample the lane state. */
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor = &ap1302->sensors[i];
+
+		if (!sensor->ap1302)
+			continue;
+
+		ap1302_log_lane_state(sensor, i);
+	}
+
+	return 0;
+}
+
+static int ap1302_subdev_registered(struct v4l2_subdev *sd)
+{
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor = &ap1302->sensors[i];
+
+		if (!sensor->dev)
+			continue;
+
+		dev_dbg(ap1302->dev, "registering sensor %u\n", i);
+
+		ret = v4l2_device_register_subdev(sd->v4l2_dev, &sensor->sd);
+		if (ret)
+			return ret;
+
+		ret = media_create_pad_link(&sensor->sd.entity, 0,
+					    &sd->entity, i,
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations ap1302_media_ops = {
+	.link_validate = v4l2_subdev_link_validate
+};
+
+static const struct v4l2_subdev_pad_ops ap1302_pad_ops = {
+	.enum_mbus_code = ap1302_enum_mbus_code,
+	.enum_frame_size = ap1302_enum_frame_size,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ap1302_set_fmt,
+	.get_selection = ap1302_get_selection,
+	.set_selection = ap1302_get_selection,
+	.get_frame_desc = ap1302_get_frame_desc,
+};
+
+static const struct v4l2_subdev_video_ops ap1302_video_ops = {
+	.s_stream = ap1302_s_stream,
+};
+
+static const struct v4l2_subdev_core_ops ap1302_core_ops = {
+	.log_status = ap1302_log_status,
+};
+
+static const struct v4l2_subdev_ops ap1302_subdev_ops = {
+	.core = &ap1302_core_ops,
+	.video = &ap1302_video_ops,
+	.pad = &ap1302_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ap1302_subdev_internal_ops = {
+	.registered = ap1302_subdev_registered,
+	.init_state = ap1302_init_state,
+};
+
+/* -----------------------------------------------------------------------------
+ * Sensor
+ */
+
+static int ap1302_sensor_enum_mbus_code(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ap1302_sensor *sensor = to_ap1302_sensor(sd);
+	const struct ap1302_sensor_info *info = sensor->ap1302->sensor_info;
+
+	if (code->index)
+		return -EINVAL;
+
+	code->code = info->format;
+
+	return 0;
+}
+
+static int ap1302_sensor_enum_frame_size(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *state,
+					 struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct ap1302_sensor *sensor = to_ap1302_sensor(sd);
+	const struct ap1302_sensor_info *info = sensor->ap1302->sensor_info;
+
+	if (fse->index)
+		return -EINVAL;
+
+	if (fse->code != info->format)
+		return -EINVAL;
+
+	fse->min_width = info->resolution.width;
+	fse->min_height = info->resolution.height;
+	fse->max_width = info->resolution.width;
+	fse->max_height = info->resolution.height;
+
+	return 0;
+}
+
+static int ap1302_sensor_get_fmt(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct ap1302_sensor *sensor = to_ap1302_sensor(sd);
+	const struct ap1302_sensor_info *info = sensor->ap1302->sensor_info;
+
+	memset(&fmt->format, 0, sizeof(fmt->format));
+
+	fmt->format.width = info->resolution.width;
+	fmt->format.height = info->resolution.height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.code = info->format;
+	fmt->format.colorspace = V4L2_COLORSPACE_SRGB;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops ap1302_sensor_pad_ops = {
+	.enum_mbus_code = ap1302_sensor_enum_mbus_code,
+	.enum_frame_size = ap1302_sensor_enum_frame_size,
+	.get_fmt = ap1302_sensor_get_fmt,
+	.set_fmt = ap1302_sensor_get_fmt,
+};
+
+static const struct v4l2_subdev_ops ap1302_sensor_subdev_ops = {
+	.pad = &ap1302_sensor_pad_ops,
+};
+
+static void ap1302_sensor_dev_release(struct device *dev)
+{
+	of_node_put(dev->of_node);
+	kfree(dev);
+}
+
+static int ap1302_sensor_init(struct ap1302_sensor *sensor, unsigned int index)
+{
+	struct ap1302_device *ap1302 = sensor->ap1302;
+	struct v4l2_subdev *sd = &sensor->sd;
+	unsigned int i;
+	int ret;
+
+	sensor->index = index;
+
+	/*
+	 * Register a device for the sensor, to support usage of the regulator
+	 * API.
+	 */
+	sensor->dev = kzalloc(sizeof(*sensor->dev), GFP_KERNEL);
+	if (!sensor->dev)
+		return -ENOMEM;
+
+	sensor->dev->parent = ap1302->dev;
+	sensor->dev->of_node = of_node_get(sensor->of_node);
+	sensor->dev->release = &ap1302_sensor_dev_release;
+	dev_set_name(sensor->dev, "%s-%s.%u", dev_name(ap1302->dev),
+		     ap1302->sensor_info->name, index);
+
+	ret = device_register(sensor->dev);
+	if (ret < 0) {
+		dev_err(ap1302->dev,
+			"Failed to register device for sensor %u\n", index);
+		goto error;
+	}
+
+	/* Retrieve the power supplies for the sensor, if any. */
+	if (ap1302->sensor_info->supplies) {
+		const struct ap1302_sensor_supply *supplies =
+			ap1302->sensor_info->supplies;
+		unsigned int num_supplies;
+
+		for (num_supplies = 0; supplies[num_supplies].name;)
+			++num_supplies;
+
+		sensor->supplies = devm_kcalloc(ap1302->dev, num_supplies,
+						sizeof(*sensor->supplies),
+						GFP_KERNEL);
+		if (!sensor->supplies) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		for (i = 0; i < num_supplies; ++i)
+			sensor->supplies[i].supply = supplies[i].name;
+
+		ret = regulator_bulk_get(sensor->dev, num_supplies,
+					 sensor->supplies);
+		if (ret < 0) {
+			dev_err(ap1302->dev,
+				"Failed to get supplies for sensor %u\n",
+				 index);
+			goto error;
+		}
+
+		sensor->num_supplies = i;
+	}
+
+	sd->dev = sensor->dev;
+	v4l2_subdev_init(sd, &ap1302_sensor_subdev_ops);
+
+	snprintf(sd->name, sizeof(sd->name), "%s %u",
+		 ap1302->sensor_info->name, index);
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, 1, &sensor->pad);
+	if (ret < 0) {
+		dev_err(ap1302->dev,
+			"failed to initialize media entity for sensor %u: %d\n",
+			index, ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	return ret;
+}
+
+static void ap1302_sensor_cleanup(struct ap1302_sensor *sensor)
+{
+	media_entity_cleanup(&sensor->sd.entity);
+
+	if (sensor->num_supplies)
+		regulator_bulk_free(sensor->num_supplies, sensor->supplies);
+
+	if (sensor->dev) {
+		if (device_is_registered(sensor->dev))
+			device_unregister(sensor->dev);
+		else
+			put_device(sensor->dev);
+	}
+
+	of_node_put(sensor->of_node);
+}
+
+/* -----------------------------------------------------------------------------
+ * Boot & Firmware Handling
+ */
+
+static int ap1302_request_firmware(struct ap1302_device *ap1302)
+{
+	static const char * const suffixes[] = {
+		"",
+		"_single",
+		"_dual",
+	};
+
+	const struct ap1302_firmware_header *fw_hdr;
+	unsigned int num_sensors;
+	unsigned int fw_size;
+	unsigned int i;
+	char name[64];
+	int ret;
+
+	for (i = 0, num_sensors = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		if (ap1302->sensors[i].dev)
+			num_sensors++;
+	}
+
+	ret = snprintf(name, sizeof(name), "ap1302_%s%s_fw.bin",
+		       ap1302->sensor_info->name, suffixes[num_sensors]);
+	if (ret >= sizeof(name)) {
+		dev_err(ap1302->dev, "Firmware name too long\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(ap1302->dev, "Requesting firmware %s\n", name);
+
+	ret = request_firmware(&ap1302->fw, name, ap1302->dev);
+	if (ret) {
+		dev_err(ap1302->dev, "Failed to request firmware: %d\n", ret);
+		return ret;
+	}
+
+	if (ap1302->fw->size < sizeof(*fw_hdr)) {
+		dev_err(ap1302->dev, "Invalid firmware: too small\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * The firmware binary contains a header defined by the
+	 * ap1302_firmware_header structure. The firmware itself (also referred
+	 * to as bootdata) follows the header. Perform sanity checks to ensure
+	 * the firmware is valid.
+	 */
+	fw_hdr = (const struct ap1302_firmware_header *)ap1302->fw->data;
+	fw_size = ap1302->fw->size - sizeof(*fw_hdr);
+
+	if (fw_hdr->pll_init_size > fw_size) {
+		dev_err(ap1302->dev,
+			"Invalid firmware: PLL init size too large\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * ap1302_write_fw_window() - Write a piece of firmware to the AP1302
+ * @win_pos: Firmware load window current position
+ * @buf: Firmware data buffer
+ * @len: Firmware data length
+ *
+ * The firmware is loaded through a window in the registers space. Writes are
+ * sequential starting at address 0x8000, and must wrap around when reaching
+ * 0x9fff. This function write the firmware data stored in @buf to the AP1302,
+ * keeping track of the window position in the @win_pos argument.
+ */
+static int ap1302_write_fw_window(struct ap1302_device *ap1302, const u8 *buf,
+				  u32 len, unsigned int *win_pos)
+{
+	while (len > 0) {
+		unsigned int write_addr;
+		unsigned int write_size;
+		int ret;
+
+		/*
+		 * Write at most len bytes, from the current position to the
+		 * end of the window.
+		 */
+		write_addr = *win_pos + AP1302_FW_WINDOW_OFFSET;
+		write_size = min(len, AP1302_FW_WINDOW_SIZE - *win_pos);
+
+		ret = regmap_raw_write(ap1302->regmap16, write_addr, buf,
+				       write_size);
+		if (ret)
+			return ret;
+
+		buf += write_size;
+		len -= write_size;
+
+		*win_pos += write_size;
+		if (*win_pos >= AP1302_FW_WINDOW_SIZE)
+			*win_pos = 0;
+	}
+
+	return 0;
+}
+
+static int ap1302_load_firmware(struct ap1302_device *ap1302)
+{
+	const struct ap1302_firmware_header *fw_hdr;
+	unsigned int win_pos = 0;
+	unsigned int fw_size;
+	const u8 *fw_data;
+	int crc;
+	int ret;
+
+	fw_hdr = (const struct ap1302_firmware_header *)ap1302->fw->data;
+	fw_data = (u8 *)&fw_hdr[1];
+	fw_size = ap1302->fw->size - sizeof(*fw_hdr);
+
+	/* Clear the CRC register. */
+	ret = ap1302_write(ap1302, AP1302_SIP_CRC, 0xffff, NULL);
+	if (ret)
+		return ret;
+
+	/*
+	 * Load the PLL initialization settings, set the bootdata stage to 2 to
+	 * apply the basic_init_hp settings, and wait 1ms for the PLL to lock.
+	 */
+	ret = ap1302_write_fw_window(ap1302, fw_data, fw_hdr->pll_init_size,
+				     &win_pos);
+	if (ret)
+		return ret;
+
+	ret = ap1302_write(ap1302, AP1302_BOOTDATA_STAGE, 0x0002, NULL);
+	if (ret)
+		return ret;
+
+	usleep_range(1000, 2000);
+
+	/* Load the rest of the bootdata content and verify the CRC. */
+	ret = ap1302_write_fw_window(ap1302, fw_data + fw_hdr->pll_init_size,
+				     fw_size - fw_hdr->pll_init_size, &win_pos);
+	if (ret)
+		return ret;
+
+	msleep(40);
+
+	ret = ap1302_read(ap1302, AP1302_SIP_CRC, &crc);
+	if (ret)
+		return ret;
+
+	if (crc != fw_hdr->crc) {
+		dev_warn(ap1302->dev,
+			 "CRC mismatch: expected 0x%04x, got 0x%04x\n",
+			 fw_hdr->crc, crc);
+		return -EAGAIN;
+	}
+
+	/*
+	 * Write 0xffff to the bootdata_stage register to indicate to the
+	 * AP1302 that the whole bootdata content has been loaded.
+	 */
+	ret = ap1302_write(ap1302, AP1302_BOOTDATA_STAGE, 0xffff, NULL);
+	if (ret)
+		return ret;
+
+	/* The AP1302 starts outputting frames right after boot, stop it. */
+	ret = ap1302_stall(ap1302, true);
+	if (!ret)
+		ap1302->streaming = false;
+
+	return ret;
+}
+
+static int ap1302_detect_chip(struct ap1302_device *ap1302)
+{
+	unsigned int version;
+	unsigned int revision;
+	int ret;
+
+	ret = ap1302_read(ap1302, AP1302_CHIP_VERSION, &version);
+	if (ret)
+		return ret;
+
+	ret = ap1302_read(ap1302, AP1302_CHIP_REV, &revision);
+	if (ret)
+		return ret;
+
+	if (version != AP1302_CHIP_ID) {
+		dev_err(ap1302->dev,
+			"Invalid chip version, expected 0x%04x, got 0x%04x\n",
+			AP1302_CHIP_ID, version);
+		return -EINVAL;
+	}
+
+	dev_info(ap1302->dev, "AP1302 revision %u.%u.%u detected\n",
+		 (revision & 0xf000) >> 12, (revision & 0x0f00) >> 8,
+		 revision & 0x00ff);
+
+	return 0;
+}
+
+static int ap1302_hw_init(struct ap1302_device *ap1302)
+{
+	unsigned int retries;
+	int ret;
+
+	/* Request and validate the firmware. */
+	ret = ap1302_request_firmware(ap1302);
+	if (ret)
+		return ret;
+
+	/*
+	 * Power the sensors first, as the firmware will access them once it
+	 * gets loaded.
+	 */
+	ret = ap1302_power_on_sensors(ap1302);
+	if (ret < 0)
+		goto error_firmware;
+
+#define MAX_FW_LOAD_RETRIES 3
+	/*
+	 * Load the firmware, retrying in case of CRC errors. The AP1302 is
+	 * reset with a full power cycle between each attempt.
+	 */
+	for (retries = 0; retries < MAX_FW_LOAD_RETRIES; ++retries) {
+		ret = ap1302_power_on(ap1302);
+		if (ret < 0)
+			goto error_power_sensors;
+
+		ret = ap1302_detect_chip(ap1302);
+		if (ret)
+			goto error_power;
+
+		ret = ap1302_load_firmware(ap1302);
+		if (!ret)
+			break;
+
+		if (ret != -EAGAIN)
+			goto error_power;
+
+		ap1302_power_off(ap1302);
+	}
+
+	if (retries == MAX_FW_LOAD_RETRIES) {
+		dev_err(ap1302->dev,
+			"Firmware load retries exceeded, aborting\n");
+		ret = -ETIMEDOUT;
+		goto error_power_sensors;
+	}
+
+	return 0;
+
+error_power:
+	ap1302_power_off(ap1302);
+error_power_sensors:
+	ap1302_power_off_sensors(ap1302);
+error_firmware:
+	release_firmware(ap1302->fw);
+
+	return ret;
+}
+
+static void ap1302_hw_cleanup(void *data)
+{
+	struct ap1302_device *ap1302 = data;
+
+	ap1302_power_off(ap1302);
+	ap1302_power_off_sensors(ap1302);
+}
+
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
+
+static int ap1302_config_v4l2(struct ap1302_device *ap1302)
+{
+	struct v4l2_subdev *sd;
+	unsigned int i;
+	int ret;
+
+	sd = &ap1302->sd;
+	sd->dev = ap1302->dev;
+	v4l2_i2c_subdev_init(sd, ap1302->client, &ap1302_subdev_ops);
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->internal_ops = &ap1302_subdev_internal_ops;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	sd->entity.ops = &ap1302_media_ops;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->pads); ++i)
+		ap1302->pads[i].flags = i == AP1302_PAD_SOURCE
+				      ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+
+	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(ap1302->pads),
+				     ap1302->pads);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "media_entity_init failed %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret) {
+		dev_err(ap1302->dev, "subdev finalize init failure\n");
+		goto error_media;
+	}
+
+	ret = ap1302_ctrls_init(ap1302);
+	if (ret < 0)
+		goto error_media;
+
+	ret = v4l2_async_register_subdev(sd);
+	if (ret < 0) {
+		dev_err(ap1302->dev, "v4l2_async_register_subdev failed %d\n", ret);
+		goto error_ctrls;
+	}
+
+	return 0;
+
+error_ctrls:
+	ap1302_ctrls_cleanup(ap1302);
+error_media:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+
+static const struct ap1302_sensor_info *ap1302_find_sensor_info(struct device_node *np)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302_sensor_info); ++i) {
+		const struct ap1302_sensor_info *info = &ap1302_sensor_info[i];
+
+		if (of_device_is_compatible(np, info->model))
+			return info;
+	}
+
+	return NULL;
+}
+
+static int ap1302_parse_of(struct ap1302_device *ap1302)
+{
+	static const struct ap1302_sensor_info *info[AP1302_PAD_SOURCE] = {
+		&ap1302_sensor_info_tpg,
+		&ap1302_sensor_info_tpg,
+	};
+	static const struct ap1302_sensor_info *cur;
+	struct device *dev = ap1302->dev;
+	struct fwnode_handle *ep;
+	int num_sensors = 0;
+	unsigned int i;
+	int ret;
+
+	ap1302->clock = devm_clk_get(dev, NULL);
+	if (IS_ERR(ap1302->clock))
+		return dev_err_probe(dev, PTR_ERR(ap1302->clock),
+				      "Failed to get clock\n");
+
+	ap1302->reset_gpio = devm_gpiod_get(dev, "reset",
+					    GPIOD_OUT_HIGH);
+	if (IS_ERR(ap1302->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ap1302->reset_gpio),
+				     "Can't get reset GPIO\n");
+
+	ap1302->standby_gpio = devm_gpiod_get_optional(dev, "standby",
+						       GPIOD_OUT_LOW);
+	if (IS_ERR(ap1302->standby_gpio))
+		dev_err_probe(dev, PTR_ERR(ap1302->standby_gpio),
+			      "Can't get standby GPIO\n");
+
+	ap1302->isp_en_gpio = devm_gpiod_get_optional(dev, "enable",
+						      GPIOD_OUT_HIGH);
+	if (IS_ERR(ap1302->isp_en_gpio))
+		dev_err_probe(dev, PTR_ERR(ap1302->isp_en_gpio),
+			      "Can't get enable GPIO\n");
+
+	gpiod_set_value_cansleep(ap1302->isp_en_gpio, 1);
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
+					     AP1302_PAD_SOURCE, 0,
+					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		dev_err_probe(dev, -EINVAL, "no sink port found\n");
+
+	ap1302->bus_cfg.bus_type = V4L2_MBUS_CSI2_DPHY;
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &ap1302->bus_cfg);
+	if (ret < 0)
+		dev_err_probe(dev, ret, "Failed to parse bus configuration\n");
+
+	for (i = 0; i < AP1302_PAD_SOURCE; i++) {
+		struct device_node *__free(device_node) node = NULL;
+
+		node = of_graph_get_port_by_id(dev->of_node, i);
+
+		if (node) {
+			struct ap1302_sensor *sensor = &ap1302->sensors[i];
+
+			cur = ap1302_find_sensor_info(node);
+			if (!cur)
+				return dev_err_probe(dev, -EINVAL,
+						     "Unsupported sensor connected\n");
+			info[i] = cur;
+			num_sensors++;
+
+			sensor->ap1302 = ap1302;
+			sensor->of_node = no_free_ptr(node);
+		}
+	}
+
+	/* port@0 and port@1 is not existed */
+	if (num_sensors == 0) {
+		ap1302->width_factor = 1;
+		cur = &ap1302_sensor_info_tpg;
+	} else {
+		ap1302->width_factor = num_sensors;
+	}
+
+	if (num_sensors == 2)
+		if (info[0] != info[1])
+			return dev_err_probe(dev, -EINVAL,
+					     "Port 0 and Port 1 have connect to the same sensor\n");
+
+	ap1302->sensor_info = cur;
+
+	return ret;
+}
+
+static void ap1302_cleanup(void *data)
+{
+	struct ap1302_device *ap1302 = data;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor = &ap1302->sensors[i];
+
+		if (!sensor->ap1302)
+			continue;
+
+		ap1302_sensor_cleanup(sensor);
+	}
+
+	v4l2_fwnode_endpoint_free(&ap1302->bus_cfg);
+
+	mutex_destroy(&ap1302->lock);
+}
+
+static int ap1302_probe(struct i2c_client *client)
+{
+	struct ap1302_device *ap1302;
+	unsigned int i;
+	int ret;
+
+	ap1302 = devm_kzalloc(&client->dev, sizeof(*ap1302), GFP_KERNEL);
+	if (!ap1302)
+		return -ENOMEM;
+
+	ap1302->dev = &client->dev;
+	ap1302->client = client;
+
+	mutex_init(&ap1302->lock);
+
+	ap1302->regmap16 = devm_regmap_init_i2c(client, &ap1302_reg16_config);
+	if (IS_ERR(ap1302->regmap16))
+		dev_err_probe(ap1302->dev, -ENODEV,  "regmap16 init failed: %ld\n",
+			      PTR_ERR(ap1302->regmap16));
+
+	ap1302->regmap32 = devm_regmap_init_i2c(client, &ap1302_reg32_config);
+	if (IS_ERR(ap1302->regmap32))
+		dev_err_probe(ap1302->dev, -ENODEV, "regmap32 init failed: %ld\n",
+			      PTR_ERR(ap1302->regmap32));
+
+	ret = ap1302_parse_of(ap1302);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(ap1302->dev, ap1302_cleanup, ap1302);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(ap1302->sensors); ++i) {
+		struct ap1302_sensor *sensor = &ap1302->sensors[i];
+
+		if (!sensor->ap1302)
+			continue;
+
+		ret = ap1302_sensor_init(sensor, i);
+		if (ret < 0)
+			return ret;
+	}
+
+	for (i = 0; i < AP1302_NUM_SUPPLIES; ++i)
+		ap1302->supplies[i].supply = ap1302_supplies[i].name;
+
+	ret = devm_regulator_bulk_get(&client->dev, AP1302_NUM_SUPPLIES,
+				      ap1302->supplies);
+	if (ret < 0)
+		return ret;
+
+	ret = ap1302_hw_init(ap1302);
+	if (ret)
+		return ret;
+
+	ap1302_debugfs_init(ap1302);
+
+	ret = devm_add_action_or_reset(ap1302->dev, ap1302_debugfs_cleanup, ap1302);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(ap1302->dev, ap1302_hw_cleanup, ap1302);
+	if (ret)
+		return ret;
+
+	ret = ap1302_config_v4l2(ap1302);
+	if (ret)
+		return ret;
+
+	dev_dbg(ap1302->dev, "%d: successfully\n", __LINE__);
+
+	return 0;
+}
+
+static void ap1302_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ap1302_device *ap1302 = to_ap1302(sd);
+
+	release_firmware(ap1302->fw);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+
+	ap1302_ctrls_cleanup(ap1302);
+}
+
+static const struct of_device_id ap1302_of_id_table[] = {
+	{ .compatible = "onnn,ap1302" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ap1302_of_id_table);
+
+static struct i2c_driver ap1302_i2c_driver = {
+	.driver = {
+		.name	= "ap1302",
+		.of_match_table	= ap1302_of_id_table,
+	},
+	.probe		= ap1302_probe,
+	.remove		= ap1302_remove,
+};
+
+module_i2c_driver(ap1302_i2c_driver);
+
+MODULE_AUTHOR("Florian Rebaudo <frebaudo@witekio.com>");
+MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
+MODULE_AUTHOR("Anil Kumar M <anil.mamidala@xilinx.com>");
+
+MODULE_DESCRIPTION("ON Semiconductor AP1302 ISP driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


