Return-Path: <linux-media+bounces-17268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9C966F96
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 07:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 842AA1C21473
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 05:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1396A152786;
	Sat, 31 Aug 2024 05:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u0A6yKwS";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gX4wxYP2"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91502E405;
	Sat, 31 Aug 2024 05:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725083964; cv=fail; b=L2qcLcErddu1jlXj7vSQF9kru6kTPUmSd5ubrbO4tdKzZpXWpRxTvEpscizeWjPcZ0ZNqki/nZCAEVIZ1HTuciPIq7I3C5YRGtLzaRmVexN7/uLujuaQilCBywIjgPiV5o7r3jfvqN8d0nFUyfO4E1d0xUvxuozdh4Jx9xFjxsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725083964; c=relaxed/simple;
	bh=1fVfdYXOoT2r6hMVmYl5PSxyVA67fjmINsFJ0FKIPjM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OPQHUwCvcX3aaWcAw4/9A1KVTDBZrP5uk4v8oTYA3u+06b6Mg9m8JKDAz1zLzXkv1jxVs87ABlaZTctKA1/hE1B3WYQE3m9hGYA7W1pyy+mqmsmqa6TJ9s2QhKtSmcEWHeUvCG3iQFZUKb2w2u9BEgyvgKPFqf04tUHJTfI+Lpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=u0A6yKwS; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=gX4wxYP2; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 25b5a3b6675e11ef8593d301e5c8a9c0-20240831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=1fVfdYXOoT2r6hMVmYl5PSxyVA67fjmINsFJ0FKIPjM=;
	b=u0A6yKwShZ5btEXfjOspi/fJzsX0RLVYfPfgCM3VlTIqYirGZqie1qgvDxMglg8kOJQpJFR3ZQU5T+XzDqNEJgdX/WWUzMv83/000iFs4TlJoc59DUA+Ah566b/ulZxXm73HVvgB22kJKfp/4AUCQ24F0jxxYbXhfFoox2gLOto=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:91cb30c5-2660-4e69-916d-abfd73108e52,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:460f38bf-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 25b5a3b6675e11ef8593d301e5c8a9c0-20240831
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1261406211; Sat, 31 Aug 2024 13:59:12 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 31 Aug 2024 13:59:13 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 31 Aug 2024 13:59:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIaahohUkQ8tM+WnsyfYLkTInnbITMEFccJqDgujxLe5BKPQb+iDBMAFsm6DC40k1FmQmVwcpFJvXOz/RTGg7yhpr7rMXP9Ry9B4iPxxTXmHho6A8qwtCMuJkSmlrmBdCAf3v9Kpg4UrAdDlSgPc3gm/PseCKKUyo2ZV6tMaZDGktBCIJTBnRy9oih5lFV3uBSAhbfoazM1YSQGnXxIJUx4Fc7673fhIKs9UtUISckFWw+Eur2/kOC52O7t1JnfEyxpyM8vDIcIXrqyArkG5yILp/Y+6NUTkRs9eknwlGaiDm4/yN2S/ewzWZpm4h6yxbqYnHhCRWOLc+RuwVpYlsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fVfdYXOoT2r6hMVmYl5PSxyVA67fjmINsFJ0FKIPjM=;
 b=RMVAxtqrb4STzSzryX0/KCpYJAujUvVB9htMJxTHVl1eCy2vDUanTmlh/gaoOK+A1YUlGY6HFgAfOjli1B8lriMnkqPsPU7ZSkoXjmJmL3ElrDPtY+j/6xjR0WElsn3M/hEcIHEjS+yJc05Hzirxt7PsBzBooxH8d4zb3db1DCdeiue4He9q0sB1asQ9hefX6YIDWNpjJXpWqlpWQbW89Iw/kVAcRaUXVZzI8TSXBF7Lv/JzBw0/ZJoQ5zPPW9mtkTIAt/IWbWR7AcHM3shGN0wIsqCURgI3HiaWtNSTtRLre8SjnbetD9K9oOEoSRPR2K+TNxkpIBeNfnymsn+OBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fVfdYXOoT2r6hMVmYl5PSxyVA67fjmINsFJ0FKIPjM=;
 b=gX4wxYP2OKJncEu6ZhQ2b12GTeJFuPAiRfAF/K+cZRt0kvXK6ktGn/TXe6Ea/pH5Gjgl8cNHKqDnyEHgvF5UIXxOEN13ywGezD/mfJCYMxB0x0iNhazbRpn9fqT5n7wt3ibEuljEye6bbOqoS90ntqVF2X5cPiLe6snlJthtOtk=
Received: from TYZPR03MB5566.apcprd03.prod.outlook.com (2603:1096:400:53::7)
 by KL1PR03MB8003.apcprd03.prod.outlook.com (2603:1096:820:fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sat, 31 Aug
 2024 05:59:09 +0000
Received: from TYZPR03MB5566.apcprd03.prod.outlook.com
 ([fe80::dbc2:ff5c:56d:2187]) by TYZPR03MB5566.apcprd03.prod.outlook.com
 ([fe80::dbc2:ff5c:56d:2187%5]) with mapi id 15.20.7897.027; Sat, 31 Aug 2024
 05:59:08 +0000
From: =?utf-8?B?WmhpIE1hbyAo5q+b5pm6KQ==?= <zhi.mao@mediatek.com>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
	=?utf-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?=
	<shengnan.wang@mediatek.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?= <Yaya.Chang@mediatek.com>,
	"10572168@qq.com" <10572168@qq.com>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] media: i2c: improve suspend/resume switch performance for
 GT9769 VCM driver
Thread-Topic: [PATCH] media: i2c: improve suspend/resume switch performance
 for GT9769 VCM driver
Thread-Index: AQHa8HgE2hhnaOSfD02hIfL2V+0nk7I8XS4AgASXqYA=
Date: Sat, 31 Aug 2024 05:59:08 +0000
Message-ID: <fc21ede819d54cd55ecf26239ad1957348e34cfb.camel@mediatek.com>
References: <20240817073452.21627-1-zhi.mao@mediatek.com>
	 <Zs7W9PDY2ny5JI8w@kekkonen.localdomain>
In-Reply-To: <Zs7W9PDY2ny5JI8w@kekkonen.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5566:EE_|KL1PR03MB8003:EE_
x-ms-office365-filtering-correlation-id: de48ce97-324a-4d9f-d6dd-08dcc982075f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eE04TVlrQkp1dFJVUzROV3F5V095VUppcFlkZloyK2U3anV3VXJ1ODk1bytB?=
 =?utf-8?B?T3R5dHpKZXZDUXl5dkk5Y2o3cGNCa1dvRjdLV2RKUW9lL2QvTHVNWTZFRGcz?=
 =?utf-8?B?MEI1TzVRUWxXVDZGN0ZXMC8xd3ZYbXozYTY1b0xpN3c1c0gvb1FoZ2RGVzFC?=
 =?utf-8?B?NmFQazNnZnI0KzNFVWcydWp4VTJ2a1QreUtJYVk1ejhDQ2VaeEx0Qi9oZ2pX?=
 =?utf-8?B?b1RTM3JuN1NCTkxQc2ZnWStSMGI2N2VxZ2ZpOGNxdWVIQVJNQU1QNVV4OUc1?=
 =?utf-8?B?ci9TdWNhMlNaSThMeTNWZzVzb0V4bGNxUzU2cGZFVmo4dC9lc1kwNnFZM0Rv?=
 =?utf-8?B?YXhuTUN6cEpIcmd1akJSQ09oRzlTVVJMQzY5bGdYOGRzbkxHSElmUEtBeTNu?=
 =?utf-8?B?dmVMRHJEL2U5VlFIWlpyY0FReUx3ME1qdkRSUjhUV3VONDc1STRMdHJsMHJP?=
 =?utf-8?B?djJ4WEliV2EzcnhrWFVPVjM3ZGhiZm1tVkh0dDhOZUJLamk5c0RPKzlNVTEx?=
 =?utf-8?B?eVFNU2FtMUNTdmtVU0o2cmRWSndUNVcvWnk4T003ZHM2SWpydU5Rcms0VXpO?=
 =?utf-8?B?eFIyeURreWEyanlGejdybHd5SlY5bVhFM1EzbUgvUWJjTXoyOVh1MGJVUVU5?=
 =?utf-8?B?UzA5SkN3OEtMbjdoYmR2MVlsczFGYWJMTzBIenpWTUdwUk5MVjkrOEF3V1BT?=
 =?utf-8?B?ejF2bUNIN1UxQVI4Rm1sTTRNSmduQllDZXJrZ0t5YUhUZkppeUUvZmpKNWR4?=
 =?utf-8?B?a1NMMFc5TVdwbDgrSGNKSDY2UXdrWGdsZ3VpZDNtb2s2enlreU9DUjMvT3ZD?=
 =?utf-8?B?TWpZRjNCaFVTOHBlekN2NERMcHhaSmlNbjZFd0t5MU1kcWE1WHZKSkFtb2hn?=
 =?utf-8?B?SmxvNS9Mb3pWd1loeUR1b3grdVBUSUhwZ1JQbDNyQ0RlN1lXSlpmTmxsRFdK?=
 =?utf-8?B?d1V3WUJwVlp1dnVoTGl4UzRxMmtEa3J5cDM0c0ZYZTd6NWwzcGxHVUE4MWFF?=
 =?utf-8?B?S3FYZStNdHFjRTF5VUpHclJpYlJvTlVnZ3I0UXZMbVhpTEdoRlplWnVYZjkx?=
 =?utf-8?B?eEZNTDdKSkJsQjJZN1NNdkEwc050SytrQ3VNb1FRTkRwMUEraTR0UXNlSFpr?=
 =?utf-8?B?VTAyWFZsMkhJTXRzSHJGdUpZOC9Jamw2VTZZL1pEdWVaWW1BN3JhRUxSZVFN?=
 =?utf-8?B?bDVXTG5kY0pFdEtuNjJMejhoaklKdlZRUVkyMy94dGZaZWVNQnFlNmtXdVB1?=
 =?utf-8?B?NXhZNlRqMkVGSlFmM25jK1VQYjVuZkN1YVBiVEpkNzB0dS9jLzVkMGJjc2FT?=
 =?utf-8?B?djZlci9CeHRTVTN1bE9NMERoaGhURFJYL1E0TnFaTnVDMlBTZzRNMFpBM1Na?=
 =?utf-8?B?QU1sTkl1b1dIckczdnJWOTI5dlRScFgxc2RhaGgwcmI2b2IrRHRKYjNScW1p?=
 =?utf-8?B?NVBtWEozTmhSUThaczR0UXhwZlRsczRrOFduVnB3blA1V3pTUlc5NUdQSUxJ?=
 =?utf-8?B?dThSSXlGVUh6QXlYc2RYLzQ2VEJxT1IwVVhpamF5ckRXeXBQL1lJbmNlZmxn?=
 =?utf-8?B?Z1RNRjBKV0ZXVXpzTGVPQ2FCVS9NN29XcHo0NzgwVFFwWDF4L3c2Mkp2VzRK?=
 =?utf-8?B?eU9PbkN1a0VNQkhwcUQzVUZydUMwQjhJR09VMWxaUEIwcHc3dnUrdDRnWUlD?=
 =?utf-8?B?VXA4R3MwcGpjaEFRWmlWdGdDRXhmTjFKcVF2M2dYd3BFNng5Z0hHT0VBZTl1?=
 =?utf-8?B?ZXI4cUJBcG1Jb2NFU3A2N1lsNDN4WTlNOWtrTU9Kdjk5L21Lb1pIc1pyM3dw?=
 =?utf-8?B?bExaVTMydmhEdnE4Zy9UaDNxZWlSdCtpRittenUzSDM2UVJtbGY3M2JOUno1?=
 =?utf-8?B?QUR1U0cxVS9PQTdyL0owTjRHNjlKV0pjeEVUVEg5MXZlRFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5566.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEMrMzAyVDZWR0dmT2d3dk5ITHdHbk5iUDlLcGtiN1RHMGRvV2QyRkhPTXlx?=
 =?utf-8?B?bW9LTDNRU3NPVmpmUklsUGdFYTkxQm9PVnhWb3BGVzcvaU05ZnBzbktjNG5B?=
 =?utf-8?B?S3hHOXdlZWFvUG56ZmtEMlpKd2NtcmJGc1FzUjBvWlhMUTlucytWN1UxUGlF?=
 =?utf-8?B?bzZqemlGL2hBSVhJOWJNa0M2a08zWkI1RGI2YTBhOGcyOGp2ZkdkY09ETlVp?=
 =?utf-8?B?ckk1QTR3R0R4YlZ3WEJXNG16czZCR05GSno2RHFTRlp1SHNKRE5wd2hnYW9l?=
 =?utf-8?B?c2lJb2Ztc1pCaHk4UFg4Um0weCswWlIyRFo2dE5LWjNTYzZzeVh2dVAzeW45?=
 =?utf-8?B?aFNZdTdlR0psc1hJMDBySkFCb1J2eC9BYkxEUlRKbHNocHRpazc1Z0pUZGl0?=
 =?utf-8?B?N1ZQMysydkJXcW42NXlaM1JRZWRsTmNRelY2Z0hhNGlLS0NsS3Boa0JDL1RM?=
 =?utf-8?B?SThnekZoUTdLV3JSQnJLUjNYQVZQMUFBVnRsZ3ZkUFJqTUd5V0theUNsUjds?=
 =?utf-8?B?aWZ5WVcrcHFPL3BPT0k3UXdQeGsyajEyUEUvNlVEdXdSWlRranExN0lQNnp1?=
 =?utf-8?B?UzRWK0dDYTl0cUlXRzJDNGQ3Q1Z5ZHk2cVgvZjhBaFJ1WkdiQUtINVFocG9P?=
 =?utf-8?B?eVBRNmRJSTRLZXM5YWxDQU5iSCtpSDdaaWhVcVgzSWtnQzR3ZVpWVWFJMmlG?=
 =?utf-8?B?THc0Qy9ESE9WQWg1R2FId2F6SXB5YWdFRkdIQTdnaU9aY1BUWDc3NE4rYXhp?=
 =?utf-8?B?MDdoTmM0czJOSUN3aExra016Y2w0ZjE2RVdoY3JUdEdjMXg5enlkYjhlQVNH?=
 =?utf-8?B?dzVRb28rSTdQZVptaFJSdWVTZlJFV1d3OXVMMnlWVW5tV0lsVXI4UGxaK1hJ?=
 =?utf-8?B?S0hjSUs5U2FRREhjR0JJY1Nyams3dWlWSlBsTDhXOTNSTlZ6bkJabkpENVR6?=
 =?utf-8?B?bDE2OEhNQnM0UUU5cnluR3JYVE9oUFBGMHpWUVJ0aUp3d2RxaHoyQUhmKzJC?=
 =?utf-8?B?eEtSR016NFdjU1Z4VGxvb25QQUV3L1N6eFNvanRQSHYzRjVLWkYyTVZCbTRx?=
 =?utf-8?B?THpTc21GNTU0MWtnU3RlaXZZNUFGV2FYM1JKR3Q5SE5nb3k1b1gvaTUrRW1I?=
 =?utf-8?B?QlhLYVVXR1JYRHlHOXFrVHBaQzUvY3BmOFYraURpRHNVbjVuRVM5c21QaW54?=
 =?utf-8?B?VUUreG42TVMvV3RJcndZSnBCMUpsUGcwTlJSTDlEREdPWjlQUHhieWNsOHJB?=
 =?utf-8?B?WXhkMUhGVDdiaVlqeEdoYjltYlVVTU9NRnV3OVFRTDFJS1hTVkE2MlVjSVh6?=
 =?utf-8?B?VE0rdE9iemkvZmkwRzNoS3RTeWUwbUxhU2N0U1dMNFFpNnd1eHVBQXJkV1dY?=
 =?utf-8?B?RHlxL05uVVhMenltcVlJV1pDTkZaaGI1NXRwWGg3L0pKNThqVThnVHAzdXNL?=
 =?utf-8?B?UHI3UUp4SU5NZUVjZWZDdGFrL0RuTXJWZ0xTclZleWhwK0U2OHdsTXFVeDQx?=
 =?utf-8?B?bUtYYWpSMWxvYytBSXBQNjVoU3pMdHhNTjhGL0o0cmptZzBMVHMwMW9Cazkv?=
 =?utf-8?B?TWRsSTlmZTl2b3RyYklQNE1JWTk4ZHpVQ3k0VTlaV1JveWNzOE9GQllkcDNT?=
 =?utf-8?B?dXhlZlpYR2RlNnlqSXV2SVJqRVExV1A3eFRISGtQK3pnNE5vSWFEYytXcFJB?=
 =?utf-8?B?RVdETlFEVTBmUDlsNEkvVHVVK3Z2c3IzdVVnY1NSUncrZit3SlRvTFl5N0lj?=
 =?utf-8?B?RUJRSFhmalRJL0M4ZnFlOGJzN2Npd09tcjdlWEFoTkpER3RudnBGS1ZFM3JG?=
 =?utf-8?B?ajIvUkNPYis5M0wwcmovK3k4SWJjbGRQbjhVVXhhb2xXTGUwRlI1aGFGZlkv?=
 =?utf-8?B?THFVcWlBZG44N2hMa0FXOGJlV1FkbVRaUjlxVE1TS2ppaHdsdTZQcDl3bGtD?=
 =?utf-8?B?aW80ckVNMEJNYmNSMjZMTU11Q1lxWXppS0d3TmkzczJYeFF0L0tETUdYZEZ0?=
 =?utf-8?B?YUZGVVFWQVo0MFowRlQyS1J6eVdEcGxqMms0RG1oV25VTU1oekYvWHl3TGdX?=
 =?utf-8?B?b3NvM240UmRXQTdpMUZNZ1ZwaFlPVU5KYWZFUlZXbXlVL3VwbVZJM0pzaW1N?=
 =?utf-8?Q?9NB+MXqceoEr7CLvmyOn6UL2u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA086CCF78304249B4740C30F0D3A8A9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5566.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de48ce97-324a-4d9f-d6dd-08dcc982075f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2024 05:59:08.6006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bam4fIohSFo4hhJQ6wRpvKDfOnalw+wOT7kHcl06Sx4NeHfm7FPDQw+3JHTah0F4Q3PhdrovBJO7DCyRVam79g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8003
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--23.995400-8.000000
X-TMASE-MatchedRID: 9M69yBZ2Ml7UL3YCMmnG4reiCVGXv/W5EtdrY/Wb3fPagsZM0qVv18kU
	hKWc+gwPyGJ1SiZNgOOsXAiB6VK48AbbLE2rYg/9wvqOGBrge3t2esxkSbCUdJ722hDqHosTedq
	BKI1+HkOBxVMEoPNtzFwGtnf+OY/E1M73D0qKwJQ0JY9d6s3vaRQK/sD1nu4x9YBezwhBfW4qs/
	W5tPmMB+eYIeZ4JIRKHffNvoFVX5aRuOvEu8nosJ3iEJrvFJmhGiQ8GIEGP39Lgo8+IIHbcBlNx
	iPQSlnn4538uJtNlEoXQODJ7Qy5n1q/w+Qp55pkGVyS87Wb4lz54F/2i/DwjQlbhF7ZTanL0e3z
	oApb3g3i8zVgXoAltj2Xsf5MVCB1t7DW3B48kkHdB/CxWTRRuyUIayx+Skid
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--23.995400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	06FAA48067782B306ED161661492439ADE4106B339F4A2019D541F9CA997C07C2000:8

SGkgU2FrYXJpLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQoNCk9uIFdlZCwgMjAyNC0w
OC0yOCBhdCAwNzo1MSArMDAwMCwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPiAgCSANCj4gRXh0ZXJu
YWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4g
IEhpIFpoaSwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gU2F0LCBBdWcg
MTcsIDIwMjQgYXQgMDM6MzQ6MDJQTSArMDgwMCwgWmhpIE1hbyB3cm90ZToNCj4gPiBHVDk3Njkg
VkNNIHBvd2VyLW9uIGRlZmF1bHQgc2V0dGluZyBpcyBQRD0wLA0KPiA+IHNvIGl0IGlzIG5vdCBu
ZWNlc3NhcnkgdG8gc2V0IGFnYWluIGluIGR3OTc2OF9pbml0IGZ1bmN0aW9uLA0KPiA+IGFuZCBp
dCBhbHNvIGhhcyBubyByZXF1aXJlbWVudCBvZiBzZXR0aW5nIFBEPTENCj4gPiBiZWZvcmUgcG93
ZXItb2ZmIGluIGR3OTc2OF9yZWxlYXNlIGZ1bmN0aW9uLg0KPiA+IEZvciBHVDk3NjkgVkNNLCBQ
RCBtb2RlIGNvbnRyb2wgd2lsbCBhZGQgZXh0cmEgdGltZQ0KPiA+IHdoZW4gc3dpdGNoaW5nIGJl
dHdlZW4gc3VzcGVuZCBhbmQgcmVzdW1lLg0KPiA+IGUuZy4gY2hyb21lIGNhbWVyYSBBUCBjYW4g
c3dpdGNoIGJldHdlZW4gdmlkZW8gYW5kIHBob3RvIG1vZGUsDQo+ID4gdGhlIGJlaGF2aW9yIGNv
cnJlc3BvbmRpbmcgdG8gVkNNIGlzIHN1c3BlbmQgYW5kIHJlc3VtZSwNCj4gPiBpdCB3aWxsIGNh
dXNlIGNhbWVyYSBwcmV2aWV3IGlzIG5vdCBzbW9vdGguDQo+IA0KPiBJZiB0aGlzIGlzIHRoZSBw
cm9ibGVtLCB3b3VsZG4ndCBlaXRoZXIgb2YgdGhlc2UgdHdvIGJlIGEgYmV0dGVyDQo+IG9wdGlv
bjoNCj4gDQo+IC0ga2VlcCB0aGUgZmlsZSBoYW5kbGUgb3BlbiBpbiB0aGUgdXNlciBzcGFjZSwg
dG8gYXZvaWQgcG93ZXJpbmcgb2ZmDQo+IHRoZQ0KPiAgIFZDTSBvcg0KPiANCj4gLSBhZGQgYXV0
b3N1c3BlbmQgc3VwcG9ydCB0byB0aGUgZHJpdmVyLg0KV2UgdXNlIGF1dG9zdXNwZW5kIGZ1Y250
aW9uIGNhbiBmaXggdGhpcyBpc3N1ZS4NCnBsZWFzZSByZXZpZXc6IA0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjQwODMxMDU1MzI4LjIyNDgyLTEtemhpLm1hb0BtZWRpYXRlay5jb20v
DQoNCj4gDQo+IEkgYWxzbyB3b3VsZG4ndCBkaWZmZXJlbnRpYXRlIGRyaXZlciBiZWhhdmlvdXIg
YmV0d2VlbiB0aGUgY2hpcHMuIElmDQo+IHRoZQ0KPiBoYXJkd2FyZSBkZWZhdWx0IHJlYWxseSBp
cyBkaWZmZXJlbnQgKGlzIGl0LCB0aGlzIGlzIHJhcmUgZm9yDQo+IHJlZ2lzdGVyLWNvbXBhdGli
bGUgcGFydHMpLCB0aGVuIHRoZSBkcml2ZXIgbmVlZHMgdG8gcmVwcm9ncmFtIGl0IChhdA0KPiBs
ZWFzdA0KPiBvbiB0aGUgb25lIHdpdGggYSBkaWZmZXJlbnQgZGVmYXVsdCkuDQo+IA0KPiAtLSAN
Cj4gS2luZCByZWdhcmRzLA0KPiANCj4gU2FrYXJpIEFpbHVzDQo=

