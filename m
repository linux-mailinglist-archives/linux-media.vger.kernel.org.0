Return-Path: <linux-media+bounces-29731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7253AA8223B
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCE11462BE9
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 10:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E5F245012;
	Wed,  9 Apr 2025 10:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wFTmYc8p"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010042.outbound.protection.outlook.com [52.101.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6D925C6E3;
	Wed,  9 Apr 2025 10:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744194828; cv=fail; b=DBs0G9ywLxH6CzpZlGdZXK9DRJ97aalWVXwrwKfw4bAIyclOj+pABdLUMK3853aHEDdRC5glqjKvL4vHiLxkeTkbPCr9aMTiz1e77viTFMLfPZQ6QTe+f1mVZVFONe71LQIi5MC/gmZDdIIyDxN/iADrukfUJFkrKEF4poWeaj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744194828; c=relaxed/simple;
	bh=gSGYVkjO8rbbfKNCxCTXS29yHSRbxAdSR2mnbkZJWNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FundPhRXSfKAT1ZsoWIDGuDxtVOn0QP30egjPuf4WQvz1uAWvhmmcmw9Uc+chhXk14u7/dVGxtU5LM/G05bY2/rb0m6Lh5omxKKjnzDQ+MkqHOGIuV2w/uktEycw9rob8yBVde3W+Wjz8XSKPYWONfk4QtWsMCMrPX2Odo3+Qcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wFTmYc8p; arc=fail smtp.client-ip=52.101.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByqH439WztWorUwBGLjE124NVPykxuZU28zQq1flnKQ2+JqJZY5jvbrcHLBtLoAHjg/Z6ay6ktjeUZjl2uBiXPeOOA+ReOMh6uXFrgIV1Z0H0ZoGNPkhwpm/qlMjgmNA82e23se8dBvyyIGvAXqtVqVEuO+1byjTlfevn+cKOKBX8Ikt8dVHT0M7/lwGbbfeMAEyizfmqii+XqtZ6Xn2IZq2MHVU82lUqL0udlLbjihbwoIrA1QxE0aUffKNFsgT57irqovQisMCRffMF8lDw7aKE7h2UBJl9umxJJRzce0PpMxL2uWgig0ae4HfOeqlSvU3BpDSThr0y5cV6cl2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exRTNxzGtI6TW0sZRvFA368LM2VvdFBSxOnhsBg8pxk=;
 b=GLMkVyPhthXYPBZ5+/3JZCBdhvFWY+uB6vUgpS7nSgntnI0RP/EQnph7LhfeKSdkgk6llcQlkUCaR6J/e6kOnuQSnDZAXvj16IPfyZIPjj9D46oYw/aMNLOYR9hFv25TjjYDo1it5OE6PXnUUGD19JPHH1ke2Q+Ha2JuR2OT6w1R2DUObgcxzVQ33mYbnEEA19yaQ6gkIAJFlnJeVXjLIqPmIqTQZoUvhdghb/ImlH10SbNTYk+CD1k7n3b1GabyhyDc38NwVgaFkLCHQySFjqiSvIzndgbJ8qo1ARtsd4ldeGjkyddyEXvlqsY8ZDV9CDohiUnnvGU7Cx/PnyvQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exRTNxzGtI6TW0sZRvFA368LM2VvdFBSxOnhsBg8pxk=;
 b=wFTmYc8p6SsBpFrdlMJrRK+/EbkUmTpDLbhuN2Ea09rpjyTOGw9cvHhGDFp+mcg/c2wmREsOLW19rC3tSc4ciusS2+PgwscMUwLBGdrTYbItl5f8+F86a6JVnJb2FEatJuIaTT5rzEV4MBHt0gEqTcDDJt5k0zO0uILHD/kJ9EE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSCPR01MB16106.jpnprd01.prod.outlook.com (2603:1096:604:3e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 10:33:38 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 10:33:38 +0000
Date: Wed, 9 Apr 2025 12:33:21 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
Message-ID: <Z_ZM8QJXZhJ-pEec@tom-desktop>
References: <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sJQnyJb_uq9yEcjHRW7ZFOw3g2XQyygcozWTgMjrYxRQ@mail.gmail.com>
 <TY3PR01MB113462DC897E0DB681B1C020F86AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8ukJ+_Bhy-4nU_CFD4rMoTRxEY-q+bXHHZ-9Mz8gQ362A@mail.gmail.com>
 <20250402092618.GH4845@pendragon.ideasonboard.com>
 <TY3PR01MB11346DF814762C667FF97074286AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tsCEhmhNSbMMiuN6b2rJCoSekf+-e6EHr5wE5C000ZxQ@mail.gmail.com>
 <20250409012914.GD31475@pendragon.ideasonboard.com>
 <TY3PR01MB11346A5CBFD05A51E351DCE6586B42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB11346A5CBFD05A51E351DCE6586B42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSCPR01MB16106:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2e5842-723e-4657-a444-08dd7751fce4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cDBiQTdXRWliSkQzWHErekJiNWx1WXBiYWpMWVVLOTJ6SVF4RGNOTkFRYTZm?=
 =?utf-8?B?YU5jblladG8wNkJmYkFwd0N3K0Z2RlNIUzltVEkvcDBGRzNiRWJZWlQ1U2hT?=
 =?utf-8?B?amJaa0pnOWJnTzdaOElVUmRjN2JsVUR2UmNDM1dYYTlBNXI4Rk05QzNJSDVR?=
 =?utf-8?B?N2p2citGRG5oa2prcHNFcmxRUEVNcXdESFo1cWNkTkFQMlgzc01oZnlNTUdS?=
 =?utf-8?B?elV6U2FmOWRhaFltcm1hU25Xd3QvY0ZieGVteCtUWGdzSm5jMVp6MVdyUk95?=
 =?utf-8?B?cGpSeEowellkNXE1NUNzUVRLVWlLTWx0QUU2Uk51eTJIdGRVSVkzYyt0Z0Rk?=
 =?utf-8?B?QVNmTXhZZE1RclVEWHNrQ3VxdUx6WjFka1hNQnpLSWJEdW04Q0xZWFd0Q3Fp?=
 =?utf-8?B?TVhuQTY0R2pNa3Nta211SDJwM25VYjM5V053Y0tQNGt4TlZMQWdNYk15YnU1?=
 =?utf-8?B?U0Ird1B3TzZiazZQQnQxbUdoZC9mTStBNm9XWVZ4eWF6ZWRBWmw0SzNSUmJK?=
 =?utf-8?B?eTJNNGVTbHFwYW5ZZE11ZUFBdkgreUJvSmJUTkxNRENSUTUzd0RNSW0zNnNU?=
 =?utf-8?B?NUtaQ1NVY25KNkx0VzJodVNBR01HY1RQSFJJYjZuZHU1akVadlp3aUhKMEhS?=
 =?utf-8?B?dnhIaVlTaVRObE51ZUhPZkg3cUpPNmIyZlBoYXVFdkd5aUdLMzBVakhaVlR1?=
 =?utf-8?B?bTRJVyt1Z0YwUEpJWVJYSmI5TmpjM1p6WDIrVjZieFpmOVZwNjJMNXFIN2Vy?=
 =?utf-8?B?d25ZZHQwZTB6V0tLOXFHbFhaaTQvTVpSMWY0MGg4VE5tYTZyWXVsdEFWc0Nx?=
 =?utf-8?B?ZEZ3N1V4NklJNStxc0Z6dFhYaWd2TWZpRUJxWFdpeFJCdTFiYTNrZFBvQzd3?=
 =?utf-8?B?MHdiM1RSMkw0bXpRcXhuc3JBU2hDWDVKY21MUU5MRGJEblBoWVlJYnVWQWVR?=
 =?utf-8?B?a0t6WFZMRThGb0txaGxpVGJHaHFtQWlPbkttdTVYQ2FRay95VW5ESzlUTHpw?=
 =?utf-8?B?TmNuS08rTzdTS1Yyei94YjdoK3NMcnhVYW1Uc21BVGhhZ2psWkZIdHN1eTlH?=
 =?utf-8?B?Z0ROcURFMmdzZEk3N0oxTk1UZXlUZkZmdXNZVUdWb3UwSHhkWWVTOE9MS1pO?=
 =?utf-8?B?TGUvbFU2VkpBMmhrUVFhQkNDUkRsbEFjN0VOOG41Y29DYjdtZ3FHa3hCbUhX?=
 =?utf-8?B?QXBMdWtFNmpaaDg0V2pPR2R1dk1sTTJqVUlJQS8vWFF6aDAwTFZhV2xPUlZr?=
 =?utf-8?B?RkxjMG9NcFpxck5TMnNpSDArZmY2M2VHS1dwK1l0ZnhUaWhhOUtZa3ZFQzBJ?=
 =?utf-8?B?NERaMm43Z0ZMT1NSemJSNkpTa1NDVWszMHJDL3VYcXpIZ255ZDhuaU82OEtE?=
 =?utf-8?B?VnErcWZRNmRYWkdodFlxSzRoYlRCNWJuaEZ5OFpTd2lwMlhXcG4yMEZMWU1H?=
 =?utf-8?B?bGkyYWcwTWYxS0tON3ZzUTVBTHhuZUJhaWk2UnYwbkhVR3IzamRQOXJqV1ZU?=
 =?utf-8?B?QzFYR2xua1VMQnZRNTB0ZWpHbGVJUE5FR3d4cHlXTU1qbVk2UTdXbzhlbDBK?=
 =?utf-8?B?TlJvbFBjK2tNR3NSWk5NaDF2TS9ObjRHcWFBQS90QnZmSkVJWkU1NmowN2po?=
 =?utf-8?B?QnVZZU9GWnlDTERqNDNMWmRJbXpEMit6T09JVlJZRDdhbVc5d0dwNE14cXdY?=
 =?utf-8?B?VHJxeVBPdWp1UUJEZlBOdjFjaklXZ0R2dEpUa2NVSkdRRVQ0RDVLSUJLamox?=
 =?utf-8?B?T3czYXQ1cyttZDZJTnpMZ2kyYkZYMm5HV3R1U3RoQ2lpWlJzeVRvOCszbjBF?=
 =?utf-8?B?dWpoM2p4RXhCRXdYelZQRmVYbXhJano5aE1XcVZTZHFEdjZuVDdqVWFKVDJZ?=
 =?utf-8?B?MVNxRXZqckhKdWgxN1JQWEFRTFQzejk1eVlWSlVsZUREb2ZpRHZLcVduYjVw?=
 =?utf-8?Q?DnzM/kM37L6MBCUvZGU/BO14n6E1KQP6?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QWhiV3c4SUpNclBkMGdHbWFBTUQyRGpUYWR4R2dONGtwZTh5aU5KU1R5S0hp?=
 =?utf-8?B?ZUFXMU03MWY5QmRTOVVUTWwxTjI2Zy9tdFB1U1dBM1QzQkd1MzI3L2JWUWpt?=
 =?utf-8?B?L0JmYi9VcUFzKzhRQXI3YWljbWo5WE5jcmlnZUNVRk9GMEI2aTEwTXZSUDRu?=
 =?utf-8?B?V3NNekI2YlcxNWR2cXBVbzlQR3FhaHBPbFdpSmZEWEZsZVFDT3dnVlNhVFFm?=
 =?utf-8?B?YjQrRklucEh0enIyWVdHK2JEODVLdW9JUWhnUThqeEVGYUZ0L0tMUlJCenFK?=
 =?utf-8?B?dEx2WStiTURmR3prZVRJUXVHcFRzVTFJUGRmSis1MlExeGx3MEVseVBoSkps?=
 =?utf-8?B?Yzh0bGdocG9EWmc5Rk5tM2JJazYva3NQOVpoTHlNZVp0WDdVaTJoTHN3VEtw?=
 =?utf-8?B?L2dsU0pwelFFYnlrbzVocGM5RmVUeThMcjZLSHVldmhoRDI0WURad2hUc0V2?=
 =?utf-8?B?aEt1OTBQRkZvV0tCejIyZ1lHdnpzWE9NWnFBakx4Qm42WWI1ZkNTMTVGaTZa?=
 =?utf-8?B?T09RVTBDdS8vK2ZpU3pBb3VlMStOTmJMOUQvUmVqY2VMVE9uNjZBRlhmYkJC?=
 =?utf-8?B?c2ZXM1ZuTDBzZm85eWU3VmJ0YWI0LzdocUFOdGIzK1JRQnNURnFRZXA0eGxR?=
 =?utf-8?B?UFdpRVdZOThqQzRoM0d1SlY2U1BSam14em4rRG5Ec2ljSkt0T3N3U2wrZnNI?=
 =?utf-8?B?WUdBdVB1cU9meCtsQWlLeUk0b016R2krK0NGWEJJTHFYRVZUV2pockYvd2J0?=
 =?utf-8?B?dUZWcnpsOGpMd01sc2hVbWVKdWNtOTRqeFpxTDJudC9mN0taM3BTWkllSCtT?=
 =?utf-8?B?K0NaR0M5c2JYbFBpQzVxNHk5OEczZlhsMllOd3ZCSDVqODQ2SVpBbDBpMjhR?=
 =?utf-8?B?dUpXNDRid00yZzd6ZEc3d1RDU29DeWVEMGRYTnBPdmRBc1lFajJNWnB0b05M?=
 =?utf-8?B?VFBhMGQrYXlzM1p2b25OcGNjbWdNUHl4RkpLM29mK2JSOENwWXhMeUk3RW95?=
 =?utf-8?B?MkVGbzRZcUExQ1didm16ekJwNEdoNTRWMzFLcXdRK3lsNkNKT09BYVlhQTlN?=
 =?utf-8?B?NVdXSjhEM3J1azlzakJVa3lDdFVSRW1JUTVPZ2pHa2RBRVBkMkJDVXY2Z3Y1?=
 =?utf-8?B?bGxva3kxd29rRXAzd2dWdEN2NUFWQlQ3T0lTeFI3VUxiUzh6Nk1FNlpBbkxM?=
 =?utf-8?B?TENuTTU2R2NDRjNDN1UvTENSdDR4eXVtWUJSVXNGUzQxbDVDSXZBOEVObE94?=
 =?utf-8?B?T3dybXpnYjBGdTJ1NTlKelowcEFjZlhzRVN2anRHUlZ6Nnd0VytzSGtaTDdZ?=
 =?utf-8?B?T2RMS3RvaHd6M3BGZzNDNnk4Wml4ZHdCRTYwRkNFUGhINWxidG92RG56ZU53?=
 =?utf-8?B?c1N6aXNOZC83V25kangxSFVUck1GTE1iTk9jc2ZoVXRGWlR1bWpNL3hkSVBK?=
 =?utf-8?B?NTVHc0FlNFMwQlNjRWNnSGtEdTM2ZUJJRkM4WjVCNUw2TFJTbzVRU0I5bU4y?=
 =?utf-8?B?cWQ0K3VWVUtaUFV5TjlScS9NQW5uUWVaQzAzVlljbEU5LzB1WmZZdXJWczZa?=
 =?utf-8?B?a1MrTlFjQmtETzBPckhSUW52TlpTOCtIcjlHV1ZGQ0oxdkt6L205R00rWWcv?=
 =?utf-8?B?cUNxaGlncXdnUkpkNm9DcUsvRDIzbTE4UG4zZi9uQkJZdUl0aHlmYnBDTXBj?=
 =?utf-8?B?THp4NlNGTkdjSzArcmpRNFgvK09CaGdYVjlyNmpCOWhiWDhFTGx0RmVRMmhM?=
 =?utf-8?B?VWdYbHVuZFVjVytOU3BaTXRxcjBlN0x2R0lxRFpLTC80QlEwQndHWmZ5Rnhq?=
 =?utf-8?B?NkVrYUx2a0lPa3JFK2g0SEptbnFzckZITW9HL3hWVHdGMVFRcVdqM1NjSzB6?=
 =?utf-8?B?ZWtscWpLRlJuc2NiRTl3SHBXdVpEVDkxeXlkMDIxb2Q1TXZRMDF0QTVvcTUy?=
 =?utf-8?B?Z3piUEx2VWhWUmk5VjMvak5icTVaakxZQ3J5WXlicXVFNmM4elloYzdJNkt2?=
 =?utf-8?B?b3J6UzBOZnVzc09CMks2ZmRXeWsxZUpzYXcvY0RwT2hHTU9RK0MvWWZoMXBl?=
 =?utf-8?B?QTNvVHdPWllNcDZ3SDlSMVNqNEdNNHNiV3JZKzVpSmluUlpRWlA1ZGVNWUFV?=
 =?utf-8?B?MGFnLzNGajZQaE1aM3g4LzgzV2pBNjRFYlZiRWhtWlR5VE1adnVUZmE2VkVq?=
 =?utf-8?Q?toBvUfs2C7i8tYX+fP5VVsE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2e5842-723e-4657-a444-08dd7751fce4
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 10:33:37.9563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpLlqY3Aog8o9brgtHuuFu/Igav3UXV1ulWdL40TOvwKSQYbqtVx7E3+uAVMP0KRZG+BSqCqvtvxzY31r75K4951BSQsZLImIvzo4JEtBdIXTHj80j8L6aeLL32vb1BN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16106

Hi Laurent, Biju, Prabhakar,

Thanks all for the inputs!

On Wed, Apr 09, 2025 at 07:25:43AM +0000, Biju Das wrote:
> Hi Laurent,
> 
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 09 April 2025 02:29
> > Subject: Re: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
> > 
> > On Mon, Apr 07, 2025 at 04:55:33PM +0000, Lad, Prabhakar wrote:
> > > On Wed, Apr 2, 2025 at 10:39 AM Biju Das wrote:
> > > > On 02 April 2025 10:26, Laurent Pinchart wrote:
> > > > > On Wed, Apr 02, 2025 at 08:25:06AM +0000, Lad, Prabhakar wrote:
> > > > > > On Wed, Apr 2, 2025 at 9:20 AM Biju Das wrote:
> > > > > > > On 02 April 2025 08:35, Lad, Prabhakar wrote:
> > > > > > > > On Wed, Apr 2, 2025 at 7:31 AM Biju Das wrote:
> > > > > > > > > > On 28 March 2025 17:30, Tommaso Merciai wrote:
> > > > > > > > > > From: Lad Prabhakar
> > > > > > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > > >
> > > > > > > > > > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs,
> > > > > > > > > > which have a CRU-IP that is mostly identical to RZ/G2L
> > > > > > > > > > but with different register offsets and additional
> > > > > > > > > > registers. Introduce a flexible register mapping
> > > > > > > > > > mechanism to handle these variations.
> > > > > > > > > >
> > > > > > > > > > Define the `rzg2l_cru_info` structure to store register
> > > > > > > > > > mappings and pass it as part of the OF match data.
> > > > > > > > > > Update the read/write functions to check out-of-bound
> > > > > > > > > > accesses and use indexed register offsets from
> > > > > > > > > > `rzg2l_cru_info`, ensuring compatibility across different SoC variants.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Lad Prabhakar
> > > > > > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > > > Signed-off-by: Tommaso Merciai
> > > > > > > > > > <tommaso.merciai.xr@bp.renesas.com>
> > > > > > > > > > ---
> > > > > > > > > > Changes since v2:
> > > > > > > > > >  - Implemented new rzg2l_cru_write/read() that now are checking out-of-bound
> > > > > > > > > >    accesses as suggested by LPinchart.
> > > > > > > > > >  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
> > > > > > > > > >  - Update commit body
> > > > > > > > > >
> > > > > > > > > > Changes since v4:
> > > > > > > > > >  - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
> > > > > > > > > >    as __always_inline
> > > > > > > > > >
> > > > > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
> > > > > > > > > >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
> > > > > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> > > > > > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58
> > > > > > > > > > ++++++++++++++--
> > > > > > > > > >  4 files changed, 139 insertions(+), 35 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git
> > > > > > > > > > a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > > > > index eed9d2bd08414..abc2a979833aa 100644
> > > > > > > > > > ---
> > > > > > > > > > a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cor
> > > > > > > > > > +++ e.c
> > > > > > > > > > @@ -22,6 +22,7 @@
> > > > > > > > > >  #include <media/v4l2-mc.h>
> > > > > > > > > >
> > > > > > > > > >  #include "rzg2l-cru.h"
> > > > > > > > > > +#include "rzg2l-cru-regs.h"
> > > > > > > > > >
> > > > > > > > > >  static inline struct rzg2l_cru_dev
> > > > > > > > > > *notifier_to_cru(struct v4l2_async_notifier *n)  { @@
> > > > > > > > > > -269,6 +270,9 @@ static int rzg2l_cru_probe(struct
> > > > > > > > > > platform_device *pdev)
> > > > > > > > > >
> > > > > > > > > >       cru->dev = dev;
> > > > > > > > > >       cru->info = of_device_get_match_data(dev);
> > > > > > > > > > +     if (!cru->info)
> > > > > > > > > > +             return dev_err_probe(dev, -EINVAL,
> > > > > > > > > > +                                  "Failed to get OF
> > > > > > > > > > + match data\n");
> > > > > > > > > >
> > > > > > > > > >       irq = platform_get_irq(pdev, 0);
> > > > > > > > > >       if (irq < 0)
> > > > > > > > > > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> > > > > > > > > >       rzg2l_cru_dma_unregister(cru);  }
> > > > > > > > > >
> > > > > > > > > > +static const u16 rzg2l_cru_regs[] = {
> > > > > > > > > > +     [CRUnCTRL] = 0x0,
> > > > > > > > > > +     [CRUnIE] = 0x4,
> > > > > > > > > > +     [CRUnINTS] = 0x8,
> > > > > > > > > > +     [CRUnRST] = 0xc,
> > > > > > > > > > +     [AMnMB1ADDRL] = 0x100,
> > > > > > > > > > +     [AMnMB1ADDRH] = 0x104,
> > > > > > > > > > +     [AMnMB2ADDRL] = 0x108,
> > > > > > > > > > +     [AMnMB2ADDRH] = 0x10c,
> > > > > > > > > > +     [AMnMB3ADDRL] = 0x110,
> > > > > > > > > > +     [AMnMB3ADDRH] = 0x114,
> > > > > > > > > > +     [AMnMB4ADDRL] = 0x118,
> > > > > > > > > > +     [AMnMB4ADDRH] = 0x11c,
> > > > > > > > > > +     [AMnMB5ADDRL] = 0x120,
> > > > > > > > > > +     [AMnMB5ADDRH] = 0x124,
> > > > > > > > > > +     [AMnMB6ADDRL] = 0x128,
> > > > > > > > > > +     [AMnMB6ADDRH] = 0x12c,
> > > > > > > > > > +     [AMnMB7ADDRL] = 0x130,
> > > > > > > > > > +     [AMnMB7ADDRH] = 0x134,
> > > > > > > > > > +     [AMnMB8ADDRL] = 0x138,
> > > > > > > > > > +     [AMnMB8ADDRH] = 0x13c,
> > > > > > > > > > +     [AMnMBVALID] = 0x148,
> > > > > > > > > > +     [AMnMBS] = 0x14c,
> > > > > > > > > > +     [AMnAXIATTR] = 0x158,
> > > > > > > > > > +     [AMnFIFOPNTR] = 0x168,
> > > > > > > > > > +     [AMnAXISTP] = 0x174,
> > > > > > > > > > +     [AMnAXISTPACK] = 0x178,
> > > > > > > > > > +     [ICnEN] = 0x200,
> > > > > > > > > > +     [ICnMC] = 0x208,
> > > > > > > > > > +     [ICnMS] = 0x254,
> > > > > > > > > > +     [ICnDMR] = 0x26c,
> > > > > > > > > > +};
> > > > > > > > >
> > > > > > > > > Do we need enum, can't we use struct instead with all these entries instead?
> > > > > > > > >
> > > > > > > > What benefit do you foresee when using struct? With the
> > > > > > > > current approach being used a minimal diff is generated when
> > > > > > > > switched to struct there will be lots of changes.
> > > > > > >
> > > > > > > The mapping is convinient when you want to iterate throught it.
> > > > > > > Here, if you just want to access the offset value from its
> > > > > > > name, a structure looks more appropriate.
> > > > > >
> > > > > > Thanks, as this patch has been reviewed by Laurent a couple of
> > > > > > times we will change this to struct If he insists.
> > > > >
> > > > > How would a struct look like ? I'm not sure what is being proposed.
> > > >
> > > > It will be
> > > >
> > > > struct rzg2l_cru_regs {
> > > >         u16 cru_n_ctrl;
> > > >         u16 cru_n_ie;
> > > >         u16 cru_n_ints;
> > > >         u16 cru_n_rst;
> > > > };
> > > >
> > > > static const struct rzg2l_cru_regs rzg2l_cru_regs = {
> > > >         .cru_n_ctrl = 0x0,
> > > >         .cru_n_ie = 0x4,
> > > >         .cru_n_ints = 0x8,
> > > >         .cru_n_rst = 0xc,
> > > > };
> > > >
> > > > You can access it using info->regs->cru_n_ctrl instead of
> > > > info->regs[CRUnCTRL] This is proposal.
> > >
> > > Are you OK with the above proposal?
> > 
> > I may be missing something, but I don't see why this would be a significantly better option. It seems
> > it would make the callers more complex, and decrease readability.
> 
> 
> Basically,
> I guess sruct  will allow us to avoid (WARN_ON(offset >= RZG2L_CRU_MAX_REG) and
>    BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG); checks as there is no array, so there is no
>    buffer overrun condition and also we can drop enum aswell.
> 
> So, if using struct decreases readability and makes the code complex,
> then current patch is fine.

For v6 I'm going to keep the current registers mapping implementation
adding fixes suggested by Laurent.

Thanks & Regards,
Tommaso

> 
> Cheers,
> Biju
> 
> 
> 



