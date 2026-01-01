Return-Path: <linux-media+bounces-49812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 772EECECBE7
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 02:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76B28300FF88
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 01:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2956C27BF7C;
	Thu,  1 Jan 2026 01:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="Nq41dhe5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69321A3029;
	Thu,  1 Jan 2026 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767231148; cv=fail; b=UVrqLhz+EX+ALQweFLIUm2CatKlEYFm70az4RJZWEiBGcY/GpgV+UNLtIzD/9fY2oIxcR+9ddzrTTTiMxkoX/W8m9nrtFZkDvy6syUjAjDpehXkZUKsgbdbMa0mX8cS4wMe37guq+nBAsoeJ/3ddkXi5LDrQ3XDCECk0qV769S8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767231148; c=relaxed/simple;
	bh=FGeLkXCp63FtrH3eaBW6/dYIDOKMc1ZZUMQqc0F1BBI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TueRd+4mhErCVZOQOPT4/FLUNmsthjSAj5s+Bw4+i6KGqJG5ymOuUj+YkEL+BwMJenm466WPBV0GrPrsFg9ca3dQtftW7jkeuVKFfqjLpkwd1/nfR8Dvu45zCf5xTAyssYS3ICYKlixl4I4uhRWS9odu8OBbGFyH5BKIowjoMD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=Nq41dhe5; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601109MS147600;
	Thu, 1 Jan 2026 01:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cRLDerZM+OEySBnu2v7QjHK/6dC3JY1OeAapUFbEM6o=; b=
	Nq41dhe5ZTWrXjp4iONC5wwq5fNX77N1vCdH6F7j0Dz04ipL4BLTsi3mAPYy1Fxq
	ODYahZmU1m8ZfQhMdwuwB7cYav73yPOXJ5A3gEcfRyC+HZwpeLRNYGuGxMMHV6oF
	AthFGy99cXft8/CHuKpMEdz25jxeeiMtWn8gdpA5E3hR6vxXXKNVnZl5ax6K5/MK
	9pUBeePM5jpLwe2I0ODZjnZTs1bvymZ2N4PdbdgFjdeWMkiTJEMemjGYyDM9uWOc
	blwS2EmOYrhcOYXsJkE9UPDWPihb42snFPAgsK5rDpIfQWOANHRBR2fBUkY27VRR
	JV3dHON/qw0y8rl5BDeA/g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4v8wb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 01:31:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hc0qP8i0/29qR/U0r+OxAeW/JQdasZEOlAlAQ5sVsvaIXShZweWpxFbJUr39CTtq3X99bnGncNtybgdMcK32cetTE6ZqLx8ZAwmP3fj4cOmu6uxY4eaPpt439MiZIdtDNICy2q2Qr7AN80kii2Sbt9Jx0+CGAnuJ9cLEsPcLXNNH66Myd6tHm2/J+hrFRGwbVkL5SMvrZVxrTz0cw8YzyvDMTZuI/NLW8/DqZ2fztaQLOTGxHY4VMqzTdrGDv+dO/55kJKWmGOiDGhjOR3gFNlBlk1LP7PFn4Nk04Ah6F7D/oJgIFvPLBoWGnmsW8uSC/HgsTnUDst0afhgcamiNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRLDerZM+OEySBnu2v7QjHK/6dC3JY1OeAapUFbEM6o=;
 b=ER+2bSzjV/v9EmGirIJJIi1fSZu6Leuxlg4TEgxbdhACBFAbk163cGgw6AouK8NY3kIyRn+FAfF2DhNnyxtcn3O1QVw/i06tDmUHN98FX6lKUKsoXJzMDfSFwEPYKr2i6hMFQWVnmXDmSWl8IlH/bmg4Azls7yGO2BprjxPEz6+ScpPrcLu+zZem3lUVA2PvH2cIoLgHJs6gtZA/utrVovFfuiZztT0bsYSOZpUSMN4U3UUUM0BIKqpQToSBiTRdTQI6mEHogZ9ww2J+N8ArGxy5UrReLexFCt52QPn9GhC5N5AS1NR1lKqQEqeRqqJTAspsI6/xOABTohcDuAw64g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by SJ0PR11MB5118.namprd11.prod.outlook.com
 (2603:10b6:a03:2dd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 01:31:49 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 01:31:49 +0000
Message-ID: <2c36d6f0-63b0-4009-8099-80ed5e0a4566@windriver.com>
Date: Thu, 1 Jan 2026 09:31:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: i2c: ov5647: Convert to CCI register access
 helpers
To: Tarang Raval <tarang.raval@siliconsignals.io>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
        "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "jai.luthra@ideasonboard.com" <jai.luthra@ideasonboard.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
 <20251231083924.2657165-2-xiaolei.wang@windriver.com>
 <PN3P287MB182970BB2FE2A28D5515A0428BBDA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <PN3P287MB182970BB2FE2A28D5515A0428BBDA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0150.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::17) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|SJ0PR11MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b2bc1b-0ea8-4d96-743c-08de48d588e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1V6cElNRC9OM3M1TFM1d0VaM25mYnZ4TWdXc1lNWkpyRG85ckxjcnhRQ1Fy?=
 =?utf-8?B?YjZyVlcwejdjaVZOMWRXT0Zmc0dWY1BIUmVGTTU2R3FKYzdLTm53MTlnWllJ?=
 =?utf-8?B?b1ZqczF3cVF5MHZiZ1VNaEt0SS9paFA0TTRqeUhrUnR0dkdDempBNDZWc1hs?=
 =?utf-8?B?MmxxVlBmUGZpUzNMbFNNZy9vbDdnZThXS0hDYWo2S0NSVmw5Y3lMM1RpZkxz?=
 =?utf-8?B?ZGdvMU5VMitxZXdPMlpzSlJ5WitSQm5uUGhHNEhtZ2ZEQ0lDRnZIanlRNnF4?=
 =?utf-8?B?NHNacEdTTm1aekNxOGRBdHhkN0ZmVDEwd0hUcmpaMGtST1BUR2NldHo2TEFI?=
 =?utf-8?B?OC9wNFhqa2VoRWxXUXkyV2xRNWlaam1vVll4UGdhRUNwMWdxTnFqK1pnR3Y4?=
 =?utf-8?B?NkgwQSt1RW1KUjBNYmRMbHdtQmZCRDdIM0tqSDE2dDRWcDVWS3VHYlAyV3Ja?=
 =?utf-8?B?TEU3eWJBclltYy8wUGhJamJ6RnhvS0JWcjFRUkpJVzBodXhDbzdxdVJ5OU44?=
 =?utf-8?B?WUVqV21FcE81QjRhZ3pBVXFzVzZrWDdwVzNQSmRWL0dnTVNYUlNzVlBJaEND?=
 =?utf-8?B?UWJsUDdQWDJnSnMrQ1RCSnZpekdvYTd0bzhMQ1MvbmFjRXNjWkc2YmN4TTIz?=
 =?utf-8?B?bm1jU3lhL2xBaW5oMjR4cVAvQlNYcVgrOEVxeklTRXVUTXd1NkpwcmtOcVJs?=
 =?utf-8?B?M0lFTG4vRjhuY0cyS2lzUXovNlBmeWoxYkhEeWczYnVxY0lVRkJNMWozUWVn?=
 =?utf-8?B?OWdyVFhBb0xDYVh2WThacXo3aUNoR1FsRHlHTUJyanZvajhJWDZ6RDY5N0NG?=
 =?utf-8?B?RnYwWXI3THFlTnFSYTRMSVlWbTBVNDhKU2pWamxkK1VsRm9ZaXN2bnQwWTcy?=
 =?utf-8?B?bDIwNEJ0dkNqd05ESGRKcjRuMWFNZjYrOEFaYitQQVc3TitOMDdCLzhqamdx?=
 =?utf-8?B?eE9HMWxBeXpmRndzeC83L29YUk0wNUpPYU1KZFcrQjBUVlFXQTlBSVZYR21U?=
 =?utf-8?B?dGtmWWRYNGIwcWZzQ3doUTVNREptYmNOZW5qbXg3SW80NnhmcTJ4NG5Jb0xE?=
 =?utf-8?B?V1BJcXl0cDJGV2ZtSTRaUUROSDVLTFJvWWNGV2pZM25qeFJFam02U2Jlc2JN?=
 =?utf-8?B?TzI2VUpJUit4bjVDcEZhR1pvb3FqaEFjNSttNnBZbUZvVkxDdFl3QmNHWi95?=
 =?utf-8?B?SEhoN3JNc1hMZlRPaTFTZThJZSs0S1NvV045MDZJVXBKUlpWdEpmQ0tCTEJY?=
 =?utf-8?B?QXhxNnRwTGkzQUlOVlhqdEZrd3RVd3Bhc1lTcUwzYlM5RzByOEVIM1pnUWpU?=
 =?utf-8?B?WXp2WTRPMjgvaHhhb0tnUnM5Q25QM3F3OVdYanJJQVhHYkRvbHN0Q3VQd1Mz?=
 =?utf-8?B?TUtYRnRDak5xRHYzVXdzK3JJbUJEMDV4MGtnbmRhZXR2L1kxK1hpNjFrcmlm?=
 =?utf-8?B?cnZXVkhSc2xwbytuWmExa3Bob2VzbzlHSXk1emVvbTEvNVhka0JWcHdJOGNN?=
 =?utf-8?B?VTh4L0JtN25Fd2lib09RWGxJOW5xL3g3THZoR1A3V1g5VE5HLzhmT0F1UGNK?=
 =?utf-8?B?UmZiVVF0Y2V4cFpmbS8wSU5rMEpTLzRkaForRStFM3FxajhHbllrcUFGWmVh?=
 =?utf-8?B?dUsvbC9VRHBwMlMxeWJBS1JITjdobGVaY0szVHFBSXYvS0drUWQwU1E5SlUy?=
 =?utf-8?B?YlhUd2psUlJrUnlXdEFzclQ1Qzg1OThuM1FYa2V6RGt4UDNIaTh2UWxUeE9z?=
 =?utf-8?B?NEdhNTdoRTd5WmhaQ2xGUHBib2dkWTdDa3JNYjZHMnVmNDRxTExuYXYxODI1?=
 =?utf-8?B?UXV5WVN1MnhrWUNuNHk1am81djgxb2lyWFNVd0Vwc3B5aENiaERCdlM1Wi94?=
 =?utf-8?B?UnVubW1ieGc3TG9LSHpsUjAydUlNcXQ2UmM3ckhWd1M1RWtSdHpXRFRaVjl5?=
 =?utf-8?B?Nk5WNHdQZ3NMRUxCK0Q3QjI1YkdEK2laTVhTV1BWQkh3QXNWR0ZKcGJHK3k0?=
 =?utf-8?Q?nXw2ww6UDxjTaAHzHvwWNJ9u1V6EII=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVJPM0JxT0tMWFgwMzdIRjc4dURvTkJRdWFuSjV5Ylo0UkZyVnNYaFhVZm9O?=
 =?utf-8?B?Q1BzS3VwQ0xLTnNhUVAvcDVSNG0yK1M5aHppWVk5MnIyZDhMRWpZSWRMZmdW?=
 =?utf-8?B?VnV1TGxOTDQrZFpEMFdXWkpUTFRacWprMXZLdVV6SVVnN1R1dXQ3TmZlUEhN?=
 =?utf-8?B?bDByeFU4RVJBaWRqQzYzU2FRRlhlYyszczFsTmxsUkRjclh6R2FrRnFnbi9S?=
 =?utf-8?B?ckI1SG5KNzlQRGtvaUZiSVJEaFQvbmpzVjZWd1B6L3VaZUZZUXV2QW9sY09S?=
 =?utf-8?B?N3lMcDdzWld0YzEvOTZSSFVEQUxoeFlDaFB2bU40Z3crK1gycWp2TUY4VDlz?=
 =?utf-8?B?dnNCWmtUNllSU2hBaEZzcTdCMmR2OUpFenhLczQyWSsxSmhCOXZZdW1zNHVx?=
 =?utf-8?B?WXVQMVBpSk9DMjhQdjBDRjRJelZqSHZpZ0UzYzMvQmM0NmZKKzF3UHdLMjZC?=
 =?utf-8?B?b20yZUZVaDNQcWN4cE02dWc5dEg2cEhmNmZoNjhLM2tmbHNPdzc5Q3NGQ3Bs?=
 =?utf-8?B?YUMxRElHVXZidENtL3FtLzZ6VlhSTGNxODJFdlZneHdYeXFhMDB3WW1Sc1Ny?=
 =?utf-8?B?aGVvQ2QyeVV6Z3ZIR3k3QmlEeFZUZWd4QmxrOGFWeVVKNDFPOFBhNkl4WFpI?=
 =?utf-8?B?Y1E0aE9CcHJma2gyU2FJZW4yZ0gxaUpSejAyQmswZGZUeGNwV0FnZmJxNnVW?=
 =?utf-8?B?TndGdmQ5c3Q4QXdmaU1hRms5elRGVUZLNG9DQWtCbW9pRG1GaDN6bzVJQTJK?=
 =?utf-8?B?YklYNnUrc3hDVk9OVUFPR3MyVzdud2t5RlcrR2JQTkxTR1FoM1NPbGJGY01o?=
 =?utf-8?B?LzdNajZLSmJ1SWJ0VkVKR2hlb0RXNnU4YzdXKzZmTEI5ajhvYzZLMDg3SVdl?=
 =?utf-8?B?eE9RWDVBOVcxUXdkU2NsQ3VYU251dTFxRWQwbjhma2hvY2xMemx6MDM2MlVN?=
 =?utf-8?B?RC9jQ2gvUmFPSDFuUVpYOHpsZ0lYaFFQWHhPR1hZRm5OVjYxNlRlNlNOVlhO?=
 =?utf-8?B?RXpYc3k1NEZYSTh0UkxNRkdYWE1CNTlZQWdyU3RxcElkVTBRM3FUQXM2enBv?=
 =?utf-8?B?Q2liYmxENGxzRzU1VzZ0MkhlWEZwMGF2VzF1SGxidURMc21IVnVUTHNVd1Nk?=
 =?utf-8?B?RVJSWU1uWTFuQVRRbkxnK0RKOXBhMHFhUGUwU2d5Qm04Q0Y1NG1pSWtRYVE0?=
 =?utf-8?B?ai9DUjVCZXVEa3g3SU9GaXB3bXV6aFVLSEVhTTlFdWlMTDMxbGJmWVN5YlNs?=
 =?utf-8?B?eXM2dDRnRThJZHhpeUIyS1JQR3NLd3N5UXV5TGo1RFduZHQwUWRlWXFkRmtY?=
 =?utf-8?B?MlFJMlIrYkYrT1hmTVhrSnhMNHpuOWEvYlZoWTNHK2tWL0NPVG40Ykl4a1Fp?=
 =?utf-8?B?eXcxNGQ2MmtxS1NWN3JSclVlTTlmWDNwMTZLL1dQSnJBWHNjL3R0REdta2tk?=
 =?utf-8?B?QzBzbVFSVW9PWkh1UTFYalhyZExFK3NSQjRaWmgxL29vcUdFYXQxdG9kU2Vi?=
 =?utf-8?B?ckpGRElmMVl3ektUWThuZFUzSnJnTi82a0J6M2hxUDNjRkVaNVlvdEdicnRl?=
 =?utf-8?B?eCtFcDZpblNRYWxRSVdnbVljZUprU1V6RDRLWmNNcll3YnNuNFBTdjQxT2RT?=
 =?utf-8?B?RzduWWxsK1Y0eWFUNCtlaXM2dWsyZUw1U1lLUW0vSEluSHhYN2pUWTdmV2Ri?=
 =?utf-8?B?OGtRNGNQTTEzcC9vajhzOG5LUTU1MlRTUEFNbzlHZnI3VythZTM2eVdTS2Zq?=
 =?utf-8?B?cHlqd003czVOS0s5c1RmZnh2NGxKanUxMmRRRkVEWlUzYjVWdzJudVdXc3Fu?=
 =?utf-8?B?dVlYK2Q1Q2tlM2R5YktWRTU1bVdFSzRWWnBrbmhYamh1akpBd2VCeW8xOWww?=
 =?utf-8?B?MmY3WjBRY1B4TGFhNjdxTGk2UjFWS2FYMHJWZUd3OC9Cb1hEbFZYWnFuRndq?=
 =?utf-8?B?ZGhzZFYxVFNkakVSRzFlcHcwcWc5dC9GWjNqUGpGSTM1MHJiV2MwbXkzYktM?=
 =?utf-8?B?ZU4yZVY1VkVCZ0RKTzZ4b2c0VkN1Vkl3T014NWlkZjZJTHVBWXZiRG9sc0li?=
 =?utf-8?B?QXVOWUs3QWZ0UnR6NFJIR000cWdwL1V1aHV0bDlMUm5VQnM4WjY2bHJhNHBr?=
 =?utf-8?B?c2tVVXp3b1hnT29oRW9TQWJSSHdKOUVFa3NpQWg2NXNVT0M3MVdTV2J5NDlv?=
 =?utf-8?B?ZmtoaVhPajJiNjgzVW4xdWt6YlNORlJ4Qm9Obk1JdG4rRFZ1MGExZXQvWkY5?=
 =?utf-8?B?aXpuckp1ZjhrZ2IrbzRwcTFFWm9wZ2JRVml0NnV5VUhRRlN3M2ZEZ013UmZr?=
 =?utf-8?B?SFRGWWFCTEQ1RUdHR0NXKzJyZG9oY0tZM2VOVnkzUVRhSGtma2x5aUZQTnpP?=
 =?utf-8?Q?tyr1H7d2namKgDmFEPOrlLBnsuP1JmOop9ryA7Yeou1QY?=
X-MS-Exchange-AntiSpam-MessageData-1: uKdcZdaAT39q5c0Z31qP5yxDl5yV1yZc0mk=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b2bc1b-0ea8-4d96-743c-08de48d588e5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 01:31:49.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwMb3qrMHirFeEKJDWCph5LCFSpdYGOgsU1JGT4iqUp5xyUzb6RXWXYvDAu9rLnGi7ROdvqY+ZqJfxfSDxZ/twQ+pOTjEsORL69Xf7Kz9OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5118
X-Proofpoint-ORIG-GUID: B6hXcvYvw0ywl8-utPlfq5REZbjJ6o-Q
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=6955ce88 cx=c_pps
 a=LdSsacNKwWtvIYfRw5AjOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=ZI-YlHDNCNprIR3wrT4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: B6hXcvYvw0ywl8-utPlfq5REZbjJ6o-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDAxMiBTYWx0ZWRfX81Q46zLKf3Ip
 HeDyOzb8toHanZGuQ63dR0cbR3IyZbFSqRsTxu2CyhwECTgXWVdmZVpUeldR4zJ6DmgnHVHOjTn
 iViBUZQNHFZUC3C1WuveYmXm+/sIZ2emJq28Q7vGRBzsmHoFi29M67Lfy4B1hzHlqfz65zRWtp7
 FM+qi/uBkXdv7V8WFZtbTqc/AhZlBMbeDJfsaWPjBBLm5HBvJ5uFVeNPJRJ8txEB+phTsX8ZmJ5
 wxCsiAi4h1WosO8kWghVSVKCckz+nFvRNElgOUcLbllPtNfyqRvcFIhmnfZx3F7EZFXAlo1M+hk
 dbqlb4WbRdRNVqebTWhOjWhtHLLjYYmUN041pJyHlsgw74ysk1j9nCOENT1ts/0WYDrBILIFuYc
 GuI7XK7vpUjtTXinUVFcdcKey3QNlA9jdyaDhLy3jaGBj/AgE00ieR3uyRBTWMEfQJRRDuOuj7Q
 CAAWTBE8eb15G5p/WdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010012


On 12/31/25 18:26, Tarang Raval wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
>> Use the new common CCI register access helpers to replace the private
>> register access helpers in the ov5647 driver. This simplifies the driver
>> by reducing the amount of code.
>>   
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/i2c/Kconfig  |   1 +
>>   drivers/media/i2c/ov5647.c | 289 +++++++++++++------------------------
>>   2 files changed, 99 insertions(+), 191 deletions(-)
>>   
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 4b4db8c4f496..cce63349e71e 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -529,6 +529,7 @@ config VIDEO_OV5645
>>
>>   config VIDEO_OV5647
>>      tristate "OmniVision OV5647 sensor support"
>> +   select V4L2_CCI_I2C
>>      help
>>        This is a Video4Linux2 sensor driver for the OmniVision
>>        OV5647 camera.
>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
>> index e193fef4fced..cbcb760ba5cd 100644
>> --- a/drivers/media/i2c/ov5647.c
>> +++ b/drivers/media/i2c/ov5647.c
>> @@ -20,8 +20,10 @@
>>   #include <linux/module.h>
>>   #include <linux/of_graph.h>
>>   #include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>>   #include <linux/slab.h>
>>   #include <linux/videodev2.h>
>> +#include <media/v4l2-cci.h>
>>   #include <media/v4l2-ctrls.h>
>>   #include <media/v4l2-device.h>
>>   #include <media/v4l2-event.h>
>> @@ -41,24 +43,19 @@
>>   #define MIPI_CTRL00_BUS_IDLE                 BIT(2)
>>   #define MIPI_CTRL00_CLOCK_LANE_DISABLE       BIT(0)
>>
>> -#define OV5647_SW_STANDBY        0x0100
>> -#define OV5647_SW_RESET                0x0103
>> -#define OV5647_REG_CHIPID_H            0x300a
>> -#define OV5647_REG_CHIPID_L            0x300b
>> -#define OV5640_REG_PAD_OUT       0x300d
>> -#define OV5647_REG_EXP_HI        0x3500
>> -#define OV5647_REG_EXP_MID       0x3501
>> -#define OV5647_REG_EXP_LO        0x3502
>> -#define OV5647_REG_AEC_AGC       0x3503
>> -#define OV5647_REG_GAIN_HI       0x350a
>> -#define OV5647_REG_GAIN_LO       0x350b
>> -#define OV5647_REG_VTS_HI        0x380e
>> -#define OV5647_REG_VTS_LO        0x380f
>> -#define OV5647_REG_FRAME_OFF_NUMBER    0x4202
>> -#define OV5647_REG_MIPI_CTRL00         0x4800
>> -#define OV5647_REG_MIPI_CTRL14         0x4814
>> -#define OV5647_REG_AWB                 0x5001
>> -#define OV5647_REG_ISPCTRL3D           0x503d
>> +#define OV5647_SW_STANDBY        CCI_REG8(0x0100)
>> +#define OV5647_SW_RESET                CCI_REG8(0x0103)
>> +#define OV5647_REG_CHIPID        CCI_REG16(0x300a)
>> +#define OV5640_REG_PAD_OUT       CCI_REG8(0x300d)
>> +#define OV5647_REG_EXPOSURE            CCI_REG24(0x3500)
>> +#define OV5647_REG_AEC_AGC       CCI_REG8(0x3503)
>> +#define OV5647_REG_GAIN                CCI_REG16(0x350a)
>> +#define OV5647_REG_VTS                 CCI_REG16(0x380e)
>> +#define OV5647_REG_FRAME_OFF_NUMBER    CCI_REG8(0x4202)
>> +#define OV5647_REG_MIPI_CTRL00         CCI_REG8(0x4800)
>> +#define OV5647_REG_MIPI_CTRL14         CCI_REG8(0x4814)
>> +#define OV5647_REG_AWB                 CCI_REG8(0x5001)
>> +#define OV5647_REG_ISPCTRL3D           CCI_REG8(0x503d)
>>
>>   #define REG_TERM 0xfffe
>>   #define VAL_TERM 0xfe
>> @@ -81,23 +78,19 @@
>>   #define OV5647_EXPOSURE_DEFAULT        1000
>>   #define OV5647_EXPOSURE_MAX            65535
>>
>> -struct regval_list {
>> -   u16 addr;
>> -   u8 data;
>> -};
>> -
>>   struct ov5647_mode {
>>      struct v4l2_mbus_framefmt     format;
>>      struct v4l2_rect        crop;
>>      u64                     pixel_rate;
>>      int                     hts;
>>      int                     vts;
>> -   const struct regval_list      *reg_list;
>> +   const struct reg_sequence     *reg_list;
>>      unsigned int                  num_regs;
>>   };
>>
>>   struct ov5647 {
>>      struct v4l2_subdev            sd;
>> +   struct regmap                   *regmap;
>>      struct media_pad        pad;
>>      struct mutex                  lock;
>>      struct clk              *xclk;
>> @@ -130,19 +123,19 @@ static const u8 ov5647_test_pattern_val[] = {
>>      0x81, /* Random Data */
>>   };
>>
>> -static const struct regval_list sensor_oe_disable_regs[] = {
>> +static const struct reg_sequence sensor_oe_disable_regs[] = {
>>      {0x3000, 0x00},
>>      {0x3001, 0x00},
>>      {0x3002, 0x00},
>>   };
>>
>> -static const struct regval_list sensor_oe_enable_regs[] = {
>> +static const struct reg_sequence sensor_oe_enable_regs[] = {
>>      {0x3000, 0x0f},
>>      {0x3001, 0xff},
>>      {0x3002, 0xe4},
>>   };
>>
>> -static struct regval_list ov5647_2592x1944_10bpp[] = {
>> +static const struct reg_sequence ov5647_2592x1944_10bpp[] = {
>>      {0x0100, 0x00},
>>      {0x0103, 0x01},
>>      {0x3034, 0x1a},
>> @@ -230,8 +223,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
>>      {0x3503, 0x03},
>>      {0x0100, 0x01},
>>   };
>> -
> Please keep one blank line here. do not remove.
I will fix it in the next version.
>
>> -static struct regval_list ov5647_1080p30_10bpp[] = {
>> +static const struct reg_sequence ov5647_1080p30_10bpp[] = {
>>      {0x0100, 0x00},
>>      {0x0103, 0x01},
>>      {0x3034, 0x1a},
>> @@ -320,7 +312,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
>>      {0x0100, 0x01},
>>   };
>>
>> -static struct regval_list ov5647_2x2binned_10bpp[] = {
>> +static const struct reg_sequence ov5647_2x2binned_10bpp[] = {
>>      {0x0100, 0x00},
>>      {0x0103, 0x01},
>>      {0x3034, 0x1a},
>> @@ -413,7 +405,7 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
>>      {0x0100, 0x01},
>>   };
>>
>> -static struct regval_list ov5647_640x480_10bpp[] = {
>> +static const struct reg_sequence ov5647_640x480_10bpp[] = {
>>      {0x0100, 0x00},
>>      {0x0103, 0x01},
>>      {0x3035, 0x11},
>> @@ -594,109 +586,35 @@ static const struct ov5647_mode ov5647_modes[] = {
>>   #define OV5647_DEFAULT_MODE      (&ov5647_modes[3])
>>   #define OV5647_DEFAULT_FORMAT    (ov5647_modes[3].format)
>>
>> -static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
>> -{
>> -   unsigned char data[4] = { reg >> 8, reg & 0xff, val >> 8, val & 0xff};
>> -   struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -   int ret;
>> -
>> -   ret = i2c_master_send(client, data, 4);
>> -   if (ret < 0) {
>> -         dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
>> -               __func__, reg);
>> -         return ret;
>> -   }
>> -
>> -   return 0;
>> -}
>> -
>> -static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
>> -{
>> -   unsigned char data[3] = { reg >> 8, reg & 0xff, val};
>> -   struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -   int ret;
>> -
>> -   ret = i2c_master_send(client, data, 3);
>> -   if (ret < 0) {
>> -         dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
>> -                     __func__, reg);
>> -         return ret;
>> -   }
>> -
>> -   return 0;
>> -}
>> -
>> -static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
>> -{
>> -   struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -   u8 buf[2] = { reg >> 8, reg & 0xff };
>> -   struct i2c_msg msg[2];
>> -   int ret;
>> -
>> -   msg[0].addr = client->addr;
>> -   msg[0].flags = client->flags;
>> -   msg[0].buf = buf;
>> -   msg[0].len = sizeof(buf);
>> -
>> -   msg[1].addr = client->addr;
>> -   msg[1].flags = client->flags | I2C_M_RD;
>> -   msg[1].buf = buf;
>> -   msg[1].len = 1;
>> -
>> -   ret = i2c_transfer(client->adapter, msg, 2);
>> -   if (ret != 2) {
>> -         dev_err(&client->dev, "%s: i2c read error, reg: %x = %d\n",
>> -               __func__, reg, ret);
>> -         return ret >= 0 ? -EINVAL : ret;
>> -   }
>> -
>> -   *val = buf[0];
>> -
>> -   return 0;
>> -}
>> -
>> -static int ov5647_write_array(struct v4l2_subdev *sd,
>> -                     const struct regval_list *regs, int array_size)
>> -{
>> -   int i, ret;
>> -
>> -   for (i = 0; i < array_size; i++) {
>> -         ret = ov5647_write(sd, regs[i].addr, regs[i].data);
>> -         if (ret < 0)
>> -               return ret;
>> -   }
>> -
>> -   return 0;
>> -}
>> -
>>   static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
>>   {
>> -   u8 channel_id;
>> +   struct ov5647 *sensor = to_sensor(sd);
>> +   u64 channel_id;
>>      int ret;
>>
>> -   ret = ov5647_read(sd, OV5647_REG_MIPI_CTRL14, &channel_id);
>> +   ret = cci_read(sensor->regmap, OV5647_REG_MIPI_CTRL14, &channel_id, NULL);
>>      if (ret < 0)
>>            return ret;
>>
>>      channel_id &= ~(3 << 6);
>>
>> -   return ov5647_write(sd, OV5647_REG_MIPI_CTRL14,
>> -                   channel_id | (channel << 6));
>> +   return cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL14,
>> +                channel_id | (channel << 6), NULL);
>>   }
>>
>>   static int ov5647_set_mode(struct v4l2_subdev *sd)
>>   {
>>      struct i2c_client *client = v4l2_get_subdevdata(sd);
>>      struct ov5647 *sensor = to_sensor(sd);
>> -   u8 resetval, rdval;
>> +   u64 resetval, rdval;
>>      int ret;
>>
>> -   ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
>> +   ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
>>      if (ret < 0)
>>            return ret;
>>
>> -   ret = ov5647_write_array(sd, sensor->mode->reg_list,
>> -                      sensor->mode->num_regs);
>> +   ret = regmap_multi_reg_write(sensor->regmap, sensor->mode->reg_list,
>> +                          sensor->mode->num_regs);
>>      if (ret < 0) {
>>            dev_err(&client->dev, "write sensor default regs error\n");
>>            return ret;
>> @@ -706,13 +624,13 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>>      if (ret < 0)
>>            return ret;
>>
>> -   ret = ov5647_read(sd, OV5647_SW_STANDBY, &resetval);
>> +   ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &resetval, NULL);
>>      if (ret < 0)
>>            return ret;
>>
>>      if (!(resetval & 0x01)) {
>>            dev_err(&client->dev, "Device was in SW standby");
>> -         ret = ov5647_write(sd, OV5647_SW_STANDBY, 0x01);
>> +         ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, 0x01, NULL);
>>            if (ret < 0)
>>                  return ret;
> This feels wrong to me but anyway this is not related to your patch.

I'm sorry, I just noticed this. It's really suspicious. I hope someone can

answer this question. Until then, I'll remain unchanged.

>
>>      }
>> @@ -725,7 +643,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>>      struct i2c_client *client = v4l2_get_subdevdata(sd);
>>      struct ov5647 *sensor = to_sensor(sd);
>>      u8 val = MIPI_CTRL00_BUS_IDLE;
>> -   int ret;
>> +   int ret = 0;
> No need for zero initialization.
I will fix it in the next version.
>
>>      ret = ov5647_set_mode(sd);
>>      if (ret) {
>> @@ -742,32 +660,25 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>>            val |= MIPI_CTRL00_CLOCK_LANE_GATE |
>>                   MIPI_CTRL00_LINE_SYNC_ENABLE;
>>
>> -   ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
>> -   if (ret < 0)
>> -         return ret;
>> -
>> -   ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x00);
>> -   if (ret < 0)
>> -         return ret;
>> +   cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00, val, &ret);
>> +   cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
>> +   cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
>>
>> -   return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x00);
>> +   return ret;
>>   }
>>
>>   static int ov5647_stream_off(struct v4l2_subdev *sd)
>>   {
>> -   int ret;
>> +   struct ov5647 *sensor = to_sensor(sd);
>> +   int ret = 0;
>>
>> -   ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00,
>> -                  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
>> -                  MIPI_CTRL00_CLOCK_LANE_DISABLE);
>> -   if (ret < 0)
>> -         return ret;
>> +   cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
>> +           MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
>> +           MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
>> +   cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
>> +   cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
>>
>> -   ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x0f);
>> -   if (ret < 0)
>> -         return ret;
>> -
>> -   return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
>> +   return ret;
>>   }
>>
>>   static int ov5647_power_on(struct device *dev)
>> @@ -788,8 +699,8 @@ static int ov5647_power_on(struct device *dev)
>>            goto error_pwdn;
>>      }
>>
>> -   ret = ov5647_write_array(&sensor->sd, sensor_oe_enable_regs,
>> -                      ARRAY_SIZE(sensor_oe_enable_regs));
>> +   ret = regmap_multi_reg_write(sensor->regmap, sensor_oe_enable_regs,
>> +                          ARRAY_SIZE(sensor_oe_enable_regs));
>>      if (ret < 0) {
>>            dev_err(dev, "write sensor_oe_enable_regs error\n");
>>            goto error_clk_disable;
>> @@ -815,23 +726,23 @@ static int ov5647_power_on(struct device *dev)
>>   static int ov5647_power_off(struct device *dev)
>>   {
>>      struct ov5647 *sensor = dev_get_drvdata(dev);
>> -   u8 rdval;
>> +   u64 rdval;
>>      int ret;
>>
>>      dev_dbg(dev, "OV5647 power off\n");
>>
>> -   ret = ov5647_write_array(&sensor->sd, sensor_oe_disable_regs,
>> -                      ARRAY_SIZE(sensor_oe_disable_regs));
>> +   ret = regmap_multi_reg_write(sensor->regmap, sensor_oe_disable_regs,
>> +                          ARRAY_SIZE(sensor_oe_disable_regs));
>>      if (ret < 0)
>>            dev_dbg(dev, "disable oe failed\n");
>>
>>      /* Enter software standby */
>> -   ret = ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
>> +   ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
>>      if (ret < 0)
>>            dev_dbg(dev, "software standby failed\n");
>>
>>      rdval &= ~0x01;
>> -   ret = ov5647_write(&sensor->sd, OV5647_SW_STANDBY, rdval);
>> +   ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, rdval, NULL);
>>      if (ret < 0)
>>            dev_dbg(dev, "software standby failed\n");
>>
>> @@ -845,10 +756,11 @@ static int ov5647_power_off(struct device *dev)
>>   static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
>>                              struct v4l2_dbg_register *reg)
>>   {
>> +   struct ov5647 *sensor = to_sensor(sd);
>>      int ret;
>> -   u8 val;
>> +   u64 val;
>>
>> -   ret = ov5647_read(sd, reg->reg & 0xff, &val);
>> +   ret = cci_read(sensor->regmap, reg->reg & 0xff, &val, NULL);
>>      if (ret < 0)
>>            return ret;
>>
>> @@ -861,7 +773,9 @@ static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
>>   static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
>>                              const struct v4l2_dbg_register *reg)
>>   {
>> -   return ov5647_write(sd, reg->reg & 0xff, reg->val & 0xff);
>> +   struct ov5647 *sensor = to_sensor(sd);
>> +
>> +   return cci_write(sensor->regmap, reg->reg & 0xff, reg->val & 0xff, NULL);
>>   }
>>   #endif
>>
>> @@ -1089,33 +1003,27 @@ static const struct v4l2_subdev_ops ov5647_subdev_ops = {
>>
>>   static int ov5647_detect(struct v4l2_subdev *sd)
>>   {
>> +   struct ov5647 *sensor = to_sensor(sd);
>>      struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -   u8 read;
>> +   u64 read;
>>      int ret;
>>
>> -   ret = ov5647_write(sd, OV5647_SW_RESET, 0x01);
>> +   ret = cci_write(sensor->regmap, OV5647_SW_RESET, 0x01, NULL);
>>      if (ret < 0)
>>            return ret;
>>
>> -   ret = ov5647_read(sd, OV5647_REG_CHIPID_H, &read);
>> -   if (ret < 0)
>> -         return ret;
>> -
>> -   if (read != 0x56) {
>> -         dev_err(&client->dev, "ID High expected 0x56 got %x", read);
>> -         return -ENODEV;
>> -   }
>> -
>> -   ret = ov5647_read(sd, OV5647_REG_CHIPID_L, &read);
>> +   ret = cci_read(sensor->regmap, OV5647_REG_CHIPID, &read, NULL);
>>      if (ret < 0)
>> -         return ret;
>> +         return dev_err_probe(&client->dev, ret,
>> +                          "failed to read chip id %x\n",
>> +                          OV5647_REG_CHIPID);
>>
>> -   if (read != 0x47) {
>> -         dev_err(&client->dev, "ID Low expected 0x47 got %x", read);
>> +   if (read != 0x5647) {
> We should define a macro for the chip ID and use it here.
OK，I will define a chip ID.
>
>> +         dev_err(&client->dev, "Chip ID expected 0x5647 got 0x%llx", read);
>>            return -ENODEV;
>>      }
>>
>> -   return ov5647_write(sd, OV5647_SW_RESET, 0x00);
>> +   return cci_write(sensor->regmap, OV5647_SW_RESET, 0x00, NULL);
>>   }
>>
>>   static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>> @@ -1140,70 +1048,62 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
>>
>>   static int ov5647_s_auto_white_balance(struct v4l2_subdev *sd, u32 val)
>>   {
>> -   return ov5647_write(sd, OV5647_REG_AWB, val ? 1 : 0);
>> +   struct ov5647 *sensor = to_sensor(sd);
>> +
>> +   return cci_write(sensor->regmap, OV5647_REG_AWB, val ? 1 : 0, NULL);
>>   }
>>
>>   static int ov5647_s_autogain(struct v4l2_subdev *sd, u32 val)
>>   {
>> +   struct ov5647 *sensor = to_sensor(sd);
>>      int ret;
>> -   u8 reg;
>> +   u64 reg;
>>
>>      /* Non-zero turns on AGC by clearing bit 1.*/
>> -   ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
>> +   ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
>>      if (ret)
>>            return ret;
>>
>> -   return ov5647_write(sd, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
>> -                                       : reg | BIT(1));
>> +   return cci_write(sensor->regmap, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
>> +                                       : reg | BIT(1), NULL);
>>   }
>>
>>   static int ov5647_s_exposure_auto(struct v4l2_subdev *sd, u32 val)
>>   {
>> +   struct ov5647 *sensor = to_sensor(sd);
>>      int ret;
>> -   u8 reg;
>> +   u64 reg;
>>
>>      /*
>>       * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
>>       * clearing bit 0.
>>       */
>> -   ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
>> +   ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
>>      if (ret)
>>            return ret;
>>
>> -   return ov5647_write(sd, OV5647_REG_AEC_AGC,
>> +   return cci_write(sensor->regmap, OV5647_REG_AEC_AGC,
>>                      val == V4L2_EXPOSURE_MANUAL ? reg | BIT(0)
>> -                                       : reg & ~BIT(0));
>> +                                       : reg & ~BIT(0), NULL);
>>   }
>>
>>   static int ov5647_s_analogue_gain(struct v4l2_subdev *sd, u32 val)
>>   {
>> -   int ret;
>> +   struct ov5647 *sensor = to_sensor(sd);
>>
>>      /* 10 bits of gain, 2 in the high register. */
>> -   ret = ov5647_write(sd, OV5647_REG_GAIN_HI, (val >> 8) & 3);
>> -   if (ret)
>> -         return ret;
>> -
>> -   return ov5647_write(sd, OV5647_REG_GAIN_LO, val & 0xff);
>> +   return cci_write(sensor->regmap, OV5647_REG_GAIN, val & 0x3ff, NULL);
>>   }
>>
>>   static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
>>   {
>> -   int ret;
>> +   struct ov5647 *sensor = to_sensor(sd);
>>
>>      /*
>>       * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
>>       * which we leave as zero (and don't receive in "val").
>>       */
>> -   ret = ov5647_write(sd, OV5647_REG_EXP_HI, (val >> 12) & 0xf);
>> -   if (ret)
>> -         return ret;
>> -
>> -   ret = ov5647_write(sd, OV5647_REG_EXP_MID, (val >> 4) & 0xff);
>> -   if (ret)
>> -         return ret;
>> -
>> -   return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
>> +   return cci_write(sensor->regmap, OV5647_REG_EXPOSURE, val << 4, NULL);
>>   }
> We can now drop all contorls functions (except ov5647_s_exposure_auto / ov5647_s_autogain).
> Since there is only a single register write, we can write the register directly
> in the set control(like vblank).

You are correct. I will be handling all set control operations (including

ov5647_s_exposure_auto / ov5647_s_autogain) because Hans has already

commented on using cci_update_bits() instead of read/write operations, and

these two functions are no longer needed.

Best Regards,
Xiaolei

>
>>   static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>> @@ -1254,12 +1154,12 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>>            ret = ov5647_s_exposure(sd, ctrl->val);
>>            break;
>>      case V4L2_CID_VBLANK:
>> -         ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
>> -                          sensor->mode->format.height + ctrl->val);
>> +         ret = cci_write(sensor->regmap, OV5647_REG_VTS,
>> +                     sensor->mode->format.height + ctrl->val, NULL);
>>            break;
>>      case V4L2_CID_TEST_PATTERN:
>> -         ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
>> -                        ov5647_test_pattern_val[ctrl->val]);
>> +         ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
>> +                     ov5647_test_pattern_val[ctrl->val], NULL);
>>            break;
>>
>>      /* Read-only, but we adjust it based on mode. */
>> @@ -1435,6 +1335,13 @@ static int ov5647_probe(struct i2c_client *client)
>>      if (ret < 0)
>>            goto ctrl_handler_free;
>>
>> +   sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
>> +   if (IS_ERR(sensor->regmap)) {
>> +         ret = dev_err_probe(dev, PTR_ERR(sensor->regmap),
>> +                         "Failed to init CCI\n");
>> +         goto entity_cleanup;
>> +   }
>> +
>>      ret = ov5647_power_on(dev);
>>      if (ret)
>>            goto entity_cleanup;
>> --
>> 2.43.0
> with above changes
>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>
> Best Regards,
> Tarang

