Return-Path: <linux-media+bounces-57457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KVlC/T3x2lMfQUAu9opvQ
	(envelope-from <linux-media+bounces-57457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:47:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F7E34EFAD
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 763913042264
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25F3347FDE;
	Sat, 28 Mar 2026 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="YPNI6/M0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB3731715C;
	Sat, 28 Mar 2026 15:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712559; cv=fail; b=VWvMaFpw3sOChMhGcAcW32dxtm54yGq17a986W6+gAb2VekpatOub7AZ5JWYNwC6NKI1mdhRWbhbzqZQeKI8lpey6tq0TCokzUMpoOhhFOm1X5hs2lC5aegmzdUX0m5SYCKP1VUEkk7mlfsVvdZdoGoeRBInmjn4+Qf+7/UYYIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712559; c=relaxed/simple;
	bh=88U1lhp2VVWiN8KVqwtx6Zc+M9NvaHVT4EJZmPjb5kE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bPafRohI+xiUIOBiHeG+vvuVk3UhjgGzVeWwpqrd05h2MxbED5OkgNm9OiKYHOXvz9HG8Bh3PSOdbkCIkyQ3FPPTrhklAwVl6xozhIdEb919ftPIdGPfYm8Qf239k7ibyunTqAcivYehgJRa2OFgHax95bA7Vg7+1wrCJciDUPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=YPNI6/M0; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SFQV9g754860;
	Sat, 28 Mar 2026 08:41:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=up/lvxlYv1tjT+GFCabs8HrcHs7aAmHuFcVJ3UW+dL4=; b=
	YPNI6/M0EcOgjdAnYwgB0jys3sabNZae0Z67pF9IuIlBSKK5ay9se2RfeHFsCXA8
	1mqIjXe3cU9vmD4r8Up0fvexjPjwbAwxJrnRcifvgPBZV6j68wF+BbMtswWi37Bk
	oNSOUhlYnDXkYxiBqnRunY7kVB7Ud2TLPvHVk1W34S3kvABfIF7brNso1/HHSohf
	WD4SY6Om8JAalVCTnjmYFTynDl6FlJkD8X9zbLddomlkAQ2yf1E84C9AV4rv1ru+
	Ae1WTEMlCHodD3z34ySPOetBB4S+Lt+YDLYLfaud1pmCIv4qlPXqONCCAgFE5PoV
	83qY+fk2GYVVuex+EuEGKg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010010.outbound.protection.outlook.com [40.93.198.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6egbr44p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Mar 2026 08:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/qvha5om+QKfNdWg574D7l7b8f1iL6DorhsGBt8zci4BFoz8Mp7s+O4d5UbSbDT7jOig+YUkCrJDijw8qXzAWG8hyAje7mZ5VGu1C3xeIKupVIhAzTknCp4GKecvPAenk2+5cdIlIgQdr61M9ozyqE/uK+QF+euSXwasiqzuLFf61rgqekFYuJbX2FwCwcaEw16Souul7xh65jBdnyTtdo8QWlvK6Qlk5Inv2o5m0O7vtK7KUCiNqY7ppyGiNAWhRsnu+qnKXuNbYEe0SnagunfgHfT5pI75OEFccB6Q98CRb/SoWFnZoTgNAl4W37z+hKLPG/jgVBXotUljHzJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=up/lvxlYv1tjT+GFCabs8HrcHs7aAmHuFcVJ3UW+dL4=;
 b=QkAZUWzPYdXaMdl8BWz4oSd5n9Vyy1tHTC+fcdxpR8miNgVwnfUtDADxCk4EqZj+SMGcgvOzyUhx8h4qrxHuokwJJBXUvWYa0IcbkDyBIDn6J7h69y5PNUoeCaq+a91SkIjzZg2os+KV15HR9RotFNCygQELSOpa4IqFAS2lp5ALWOyw5WBLMTtvVHKgTsLZBWqxlx0cbuYYKamp2XzMZuKG8nM0aBNH8TLsb/vWXeoeLSuI5STXC9g6s0SOHWbxWWeXv2D+jnV0IZV5mkV4DzlM/9CTZ+yPo7mX57suyZXq2AfIolkPEyMxBndm7mzpnYq1dGm9FQ4qW6lK0+V9EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CO1PR11MB5041.namprd11.prod.outlook.com
 (2603:10b6:303:90::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Sat, 28 Mar
 2026 15:41:32 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%8]) with mapi id 15.20.9745.007; Sat, 28 Mar 2026
 15:41:32 +0000
Message-ID: <f8369ece-ff7e-438d-84b5-0e924597246d@windriver.com>
Date: Sat, 28 Mar 2026 23:41:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: ov5645: Convert to CCI register access
 helpers
To: Prabhakar <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260328132902.776757-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <20260328132902.776757-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::23) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CO1PR11MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: 046d24bf-6b1c-4bec-96bb-08de8ce07bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020|22082099003|18092099006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4BajCEAqTee+yd3BuulkVglkKB6rnP5SGfjq//hEMWQ8Z4lJKNRMLENpaPLhoC0YoA5FjlQtpZRQJDfOA9MxDS1QrnqONW1h/8PvPgJu5/Cth+1DE3YxigbiWoB+v5wvU4sEuNDldTB2wgtbHOZUpqOP8+BLaQDjT1YIk3RE1Ix07n5lNjZEKpRpZ2VrEY7mYs02PktRjRT2lCVHiIoiqCHH1J27L/35o78ZPv/DsJy6VT5i0ciMh9kCIEeM/28SOZlWY0PqS9AOyLQlDacrd0u+GBv0/YAEDq9y5t8pphtfj3mJx7mcmC3NFOTzA8bYwviggQdhZ/YBDwGCcFF9BVsm7jyQ7AiZsOn4SrMxT1A7hrTomObAvzT+Rdz4gkg66DLpV7s7kb88/KOqn5xCIj76ATlgElZl6HVxD8jQXoFHF/gdpk3E2Gu+FWRgMsYXTSoZRD19Hy1muBFMoEI1pIc/bnc5xqogalUWu++nsK738RcgLBSHZGtnxLuhS97LsKj+fuo0vwq1XiFLwGmXB35/6ZSR604fER6gh1A50ac9YKiRgdPtPeIFd/wqZZuOb6Nj/L9caIJ1ZIfRNGr9eDMAIUaNCWbyoMlQaIdnM7KSRINDK673xp5fvtF9zZuxLE3lHUu8qpnwBlcJj7RZs0KjqsSV6x0ZcoJk6jEQUXJItHs2tuW/fuCamaAuicSC0HHAkVfN3BDDIJM1NrYa9Y9zBYxT4+zbkF2yFPqiVcuhZVOD40DbGoXXrCaT1JU+Oj4PiO7PPfhn/tDdcdc6Ow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020)(22082099003)(18092099006)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFVsbVVoWEN0N2E2QTlmeWNvQ0tHamhBUWlJMVpjOXd3Uk56akVodHBFc1Qx?=
 =?utf-8?B?dm5KS0tpcUFMMHUwZjJHb2pabVFtMGpZWkF1YWNiQXkyYlRCaEI5UmlXNG5l?=
 =?utf-8?B?TnpmWXFxVmVxY3lQa2N6dHloNnd3TjJ1WlZRbE44bDVFeU96L1lhN0pVWTNX?=
 =?utf-8?B?L0NLc1phOFYxMnhxK0tnSXg4VU56UW51eWVzbnpwa0dHN2Z0b3JHSFVBT1V6?=
 =?utf-8?B?eldFS09BeGNsRTB3Ly9TL0JSdDd3V1FzZ0NDZ1dQaVo2YzBKWVliV1JvN3Ns?=
 =?utf-8?B?OUNZYUZXeXZtUktNSW1wSHVlWndiUVpqWEpUK0ZRa0s5ZTJNTkVMaG9Jd1lu?=
 =?utf-8?B?RFFkMWlNcnlhZEN4MXZ6L052UEV6NU95bEQ4UDB0OW5sTFYrY2lCZXlSa2pL?=
 =?utf-8?B?M3RRZHdQSWRNQWQva21zdERFTFNJMEEvOFFHWkt3Y2czekFLb1hIdmUxbVNa?=
 =?utf-8?B?YlBLc096NTJ5Qk94SzVDVU12ZXQyOE9DSlN0bllyREl6M3FPNFNMRktheGFE?=
 =?utf-8?B?alVNUDM0MTdMRWttS0svN2Y5NzNOQkZ2b1pCNERGM2lVSkdRMHl4b0EreTlJ?=
 =?utf-8?B?WWlkTnE5RHZGb0ZpN0YySUw1aXhLczcrWUc0WUl5WVhqczJ4OGhpZmIzVnJh?=
 =?utf-8?B?dzh3Q0IwZlBLT0c3aWZMVWtlVzFsMWsyQ0ZJa3JSaVlDb1ozK3g4WUUvUFh5?=
 =?utf-8?B?L2pWbkJ0ellWUm95LzVzUytRb3ZWeEVsT1NBMDhoVjBvb2ltQ01aOWhuWnlX?=
 =?utf-8?B?YXVLRTNFamY2bWNGTC9TQUVzbTlmbi91a2NjN09HcmY4NXRUTVZtY1lHT0Rx?=
 =?utf-8?B?WDM4ZzBvTllXRCt0ZGlPL0hnMUZaOWdQOU15Q1RNQStjY3R4VWVpT3ZGcjg0?=
 =?utf-8?B?bFB4WXhiekF1Q2QweE9XZmhHUnBSNXhjUHZsRGc4V1kzRjJnM2ttcmNlRGhL?=
 =?utf-8?B?KzEzb2RQRmxBOTIyQzEyeW5EanRQMDVBcVJYK0ZDbTZSVGc0YjR5UGN0YWZR?=
 =?utf-8?B?SGw4R0t1ZHpPdnVXUWYyVkVVZE16aXJLZGVPM2s1aXAvTWxxSEpZSXpCRDlZ?=
 =?utf-8?B?Ly9Fc21oTkkxUXlJaEZXaXA3VkJEdGxqUVQvcENQT3pyT0kvWWdyQ3NRNGVB?=
 =?utf-8?B?b2xrMk9KeUtaRjRIcjRiK0doUjBPSXZJUTdjemZQbUtZZU9qaEdxaDFhUDlx?=
 =?utf-8?B?Mm5SWkRhaW4vZEpQbFlVMVRJbU9IS2JHWnJIS0ZGdUpZWkVsTFkwazdCOTFv?=
 =?utf-8?B?RFdvK0VibTNMZmFRL1NTWlEwN2twQ2xmREUwU0RkRnIxNGpaUlRyWlhLbTF0?=
 =?utf-8?B?NmtNOGp3dnlwOVZQZWFFaC9TL3RjZUlzdk9sLy9SNEdXOVlSTTFPMHgrMEtI?=
 =?utf-8?B?Y3FoRCtIZ2o4T2FEL0l6VUorVzM3azhia2d2QWVCVXB5Ni81bHk2UzdXWU5T?=
 =?utf-8?B?NFNNc1FjSHo1RnNBdW9BaytoTUhLOGJZTTl0bEpDZVd1UlM4WTNUdm5mdHpP?=
 =?utf-8?B?ejdHL2R0eEZOZXNyS3c1Sm1OaEhheUtodk5jelhmLzcraXR6UHY4ZjJsMTBp?=
 =?utf-8?B?WG9CZlB6SitoNW4zY2NBSGI0cFk2K3hvOU9zSTltZW5MNFhlb2tSUTRQa1l0?=
 =?utf-8?B?ZnFiaVRkTDB6bEI4MmFmdGNuSStEeUpHTVhnektzZm85OXRjcVRUbHZ2VklF?=
 =?utf-8?B?MG5YY2x5ZGpsQUZyd251cVlrMWZlUC8vY002NnVUYUVxT21adkpzbFYyM2Rq?=
 =?utf-8?B?TE9VR091cEowV3REU241ZldTTTh6MlBEWDNQOWVUS1RCdStLcTRNNVBCVmJi?=
 =?utf-8?B?MkoxTnJ4enFzdHZPRUNPUlZpRzBZbHE1aHdFbEpBcDRBMEN4SVpmMTBlNXlM?=
 =?utf-8?B?ZDhqQS9jT3dNalp1c0NYc1o2cVhHVC9oWHVKc0tXODNUcUw3VzhIczVNMnhT?=
 =?utf-8?B?N1pwQThTanZrNmdrTGJnSmFoM1c0V1FTMUFLb0Fzbzh0SG9WR2hrWHFJemNB?=
 =?utf-8?B?RzlNZ0E4Znp0MlphdlF3YTNkVzZXM1hFcmp6V3NrWnBuSWcxK3NIS0Izemx4?=
 =?utf-8?B?Rlh3enNWb2tBWEJvUmx0VTh2RUh6K3A3UFJkYlA2TnVkMlpvcFBjVVNiSDJT?=
 =?utf-8?B?aE1VK3NrWklyNXYrOG9YdFdFazRONDc4d2FhVktabUdvbzdrNndQaElnTUlG?=
 =?utf-8?B?eC9IMVQ5ZUw0cUdrcHBWeGRHQmtXV25ydUcwdm9LUUg2VDJFaUQvNTBWcEwr?=
 =?utf-8?B?QUJJMGJFcnh4enV2V2twa2dRNG9UMkZPZTQ1Vkt0dGRLUnFqWkEyWVZ5T2Zo?=
 =?utf-8?B?TWI1V0htNTBBNHk5LzlmTUdUK3FRb1RFZGtJemRKc2tlTWw4S0FPNzVvd1Fl?=
 =?utf-8?Q?ArNAScPOJM7/HssICVuev7qwMOtB2hDo0+WWHjg+keEGl?=
X-MS-Exchange-AntiSpam-MessageData-1: jo5yWM9sdmHph5XpDQrPssme90nIYk80c9M=
X-Exchange-RoutingPolicyChecked:
	BnZYWF7ztOE8kJHIwAw342EhBkpun48TeoodgNicu73WKronyyAoG34xinhivcrYz4sCETkOXcVZpgmmYtLRWFB9SwEXSdudBVSeIu0CfX34IpliJbr5NpwjR8Vd1j2lWQjuWdOOkz+QkZbzkk706xL5x8OeMIumgNldRTq+hYWolAVOa8oCLdVjrWfGPRUT1rhOM2s3omKDDTEHxsC9Df1kfS/xyGqIbYKPKBC0cJ4jfQvFJvzZV8YkBjEiDE5OvPiLL8abmERMIgeQNJooir9T4LAEcJki5aEbW0OpvGCs38Yzr4VhikqPCAdzIaNKnltoTJPq6YWiJtSQGMA5gA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046d24bf-6b1c-4bec-96bb-08de8ce07bf2
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 15:41:31.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xb5HDS88hsc8un3UHoBFoWxghPR4Cu0b0LsrjwA6y8yGdhC4NokwY5mRFRWiVwabgQcMY1VAele6Lbf2sol+Bf7YObSViSKedrieI4pcc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDExNSBTYWx0ZWRfX5cfJqo6l4sZ+
 gohzELRMP+CiF0vgKC6arK9Y4cjuJUY6kvTkjCCTQqjBB7UgN8LzKZ3rrVwUEvtz6dY71fS3b/9
 xVFMWmhQrBNVr73T2arFeCfmI4IATMyQWk2AVTauZjJxoUshpOTWpYC37omx4lDVc/F1gFK55la
 oqSF4C5GSXXDppx4zFpvZLz9pbY8ztTD+XUlJ6VW0MyEZqDubxu6rb4xMB3X/SzbCAh1/WdZOAY
 EfYfAcYhobY/289oIiSHaE7CU9yTQGyGtWY0fJUO0XPRxF2nmdbeJslS2W9G00ctvsCH4nzw6uz
 W2iTUGszLQcgCZb6LbycTyHuM6YdUuubZWma/IZ218YPp+PSSfavAoz7NwSB3nUDJBCYltrFXO+
 UTdd2x/L+HMLnXPaxnQmOvqFD/LiTX7RYxpFHh1Lo7isnRB/YPbT71cr0QPu8HRtF8JANzNR6Df
 RQujSZRp+NhMZXARm2w==
X-Proofpoint-ORIG-GUID: LaBygkwcvlCVHDaEJAvrtg-50wikWx1m
X-Proofpoint-GUID: LaBygkwcvlCVHDaEJAvrtg-50wikWx1m
X-Authority-Analysis: v=2.4 cv=fvrRpV4f c=1 sm=1 tr=0 ts=69c7f6b1 cx=c_pps
 a=aTIAhetxxWeNPRurEgqQXA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=yC-0_ovQAAAA:8 a=t7CeM3EgAAAA:8 a=EQeVhRvLkbv1Po9i5lMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603280115
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57457-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.intel.com,oss.qualcomm.com,ideasonboard.com,linaro.org,foss.st.com,siliconsignals.io];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49F7E34EFAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

Thanks for the update.

On 3/28/26 21:29, Prabhakar wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Convert the ov5645 driver to use the V4L2 CCI register access helpers
> and regmap infrastructure instead of the custom I2C register access
> implementation.
>
> Keep ov5645_set_register_array() as ov5645_global_init_setting requires
> a delay between specific register writes, which cannot be expressed
> through the generic CCI multi-write helper.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Fixed selecting V4L2_CCI_I2C config option for the OV5645 driver.
> - Fixed checkpatch warnings limiting to 80 characters per line.
> ---
>   drivers/media/i2c/Kconfig  |   1 +
>   drivers/media/i2c/ov5645.c | 907 ++++++++++++++++++-------------------
>   2 files changed, 435 insertions(+), 473 deletions(-)
>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 20482be35f26..8d7dafba85ca 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -533,6 +533,7 @@ config VIDEO_OV5640
>   config VIDEO_OV5645
>          tristate "OmniVision OV5645 sensor support"
>          depends on OF
> +       select V4L2_CCI_I2C
>          help
>            This is a Video4Linux2 sensor driver for the OmniVision
>            OV5645 camera.
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index df9001fce44d..1cfccbdf1406 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -25,40 +25,42 @@
>   #include <linux/of.h>
>   #include <linux/of_graph.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   #include <media/mipi-csi2.h>
> +#include <media/v4l2-cci.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-fwnode.h>
>   #include <media/v4l2-subdev.h>
>
> -#define OV5645_SYSTEM_CTRL0            0x3008
> +#define OV5645_SYSTEM_CTRL0            CCI_REG8(0x3008)
>   #define                OV5645_SYSTEM_CTRL0_START       0x02
>   #define                OV5645_SYSTEM_CTRL0_STOP        0x42
> -#define OV5645_CHIP_ID_HIGH            0x300a
> +#define OV5645_CHIP_ID_HIGH            CCI_REG8(0x300a)
>   #define                OV5645_CHIP_ID_HIGH_BYTE        0x56
> -#define OV5645_CHIP_ID_LOW             0x300b
> +#define OV5645_CHIP_ID_LOW             CCI_REG8(0x300b)
Since 0x300a and 0x300b are contiguous, you could simplify this to a
single CCI_REG16 read:

     #define OV5645_CHIP_ID        CCI_REG16(0x300a)

     #define OV5645_CHIP_ID_VALUE    0x5645

The rest looks good to me. With the above addressed:

Reviewed-by: Xiaolei Wang <Xiaolei.Wang@windriver.com>

>   #define                OV5645_CHIP_ID_LOW_BYTE         0x45
> -#define OV5645_IO_MIPI_CTRL00          0x300e
> -#define OV5645_PAD_OUTPUT00            0x3019
> -#define OV5645_AWB_MANUAL_CONTROL      0x3406
> +#define OV5645_IO_MIPI_CTRL00          CCI_REG8(0x300e)
> +#define OV5645_PAD_OUTPUT00            CCI_REG8(0x3019)
> +#define OV5645_AWB_MANUAL_CONTROL      CCI_REG8(0x3406)
>   #define                OV5645_AWB_MANUAL_ENABLE        BIT(0)
> -#define OV5645_AEC_PK_MANUAL           0x3503
> +#define OV5645_AEC_PK_MANUAL           CCI_REG8(0x3503)
>   #define                OV5645_AEC_MANUAL_ENABLE        BIT(0)
>   #define                OV5645_AGC_MANUAL_ENABLE        BIT(1)
> -#define OV5645_TIMING_TC_REG20         0x3820
> +#define OV5645_TIMING_TC_REG20         CCI_REG8(0x3820)
>   #define                OV5645_SENSOR_VFLIP             BIT(1)
>   #define                OV5645_ISP_VFLIP                BIT(2)
> -#define OV5645_TIMING_TC_REG21         0x3821
> +#define OV5645_TIMING_TC_REG21         CCI_REG8(0x3821)
>   #define                OV5645_SENSOR_MIRROR            BIT(1)
> -#define OV5645_MIPI_CTRL00             0x4800
> -#define OV5645_PRE_ISP_TEST_SETTING_1  0x503d
> +#define OV5645_MIPI_CTRL00             CCI_REG8(0x4800)
> +#define OV5645_PRE_ISP_TEST_SETTING_1  CCI_REG8(0x503d)
>   #define                OV5645_TEST_PATTERN_MASK        0x3
>   #define                OV5645_SET_TEST_PATTERN(x)      ((x) & OV5645_TEST_PATTERN_MASK)
>   #define                OV5645_TEST_PATTERN_ENABLE      BIT(7)
> -#define OV5645_SDE_SAT_U               0x5583
> -#define OV5645_SDE_SAT_V               0x5584
> +#define OV5645_SDE_SAT_U               CCI_REG8(0x5583)
> +#define OV5645_SDE_SAT_V               CCI_REG8(0x5584)
>
>   /* regulator supplies */
>   static const char * const ov5645_supply_name[] = {
> @@ -71,15 +73,10 @@ static const char * const ov5645_supply_name[] = {
>
>   #define OV5645_PAD_SOURCE      0
>
> -struct reg_value {
> -       u16 reg;
> -       u8 val;
> -};
> -
>   struct ov5645_mode_info {
>          u32 width;
>          u32 height;
> -       const struct reg_value *data;
> +       const struct cci_reg_sequence *data;
>          u32 data_size;
>          u32 pixel_clock;
>          u32 link_freq;
> @@ -88,6 +85,7 @@ struct ov5645_mode_info {
>   struct ov5645 {
>          struct i2c_client *i2c_client;
>          struct device *dev;
> +       struct regmap *regmap;
>          struct v4l2_subdev sd;
>          struct media_pad pad;
>          struct v4l2_fwnode_endpoint ep;
> @@ -103,9 +101,9 @@ struct ov5645 {
>          struct v4l2_ctrl *link_freq;
>
>          /* Cached register values */
> -       u8 aec_pk_manual;
> -       u8 timing_tc_reg20;
> -       u8 timing_tc_reg21;
> +       u64 aec_pk_manual;
> +       u64 timing_tc_reg20;
> +       u64 timing_tc_reg21;
>
>          struct gpio_desc *enable_gpio;
>          struct gpio_desc *rst_gpio;
> @@ -116,393 +114,393 @@ static inline struct ov5645 *to_ov5645(struct v4l2_subdev *sd)
>          return container_of(sd, struct ov5645, sd);
>   }
>
> -static const struct reg_value ov5645_global_init_setting[] = {
> -       { 0x3103, 0x11 },
> -       { 0x3008, 0x42 },
> -       { 0x3103, 0x03 },
> -       { 0x3503, 0x07 },
> -       { 0x3002, 0x1c },
> -       { 0x3006, 0xc3 },
> -       { 0x3017, 0x00 },
> -       { 0x3018, 0x00 },
> -       { 0x302e, 0x0b },
> -       { 0x3037, 0x13 },
> -       { 0x3108, 0x01 },
> -       { 0x3611, 0x06 },
> -       { 0x3500, 0x00 },
> -       { 0x3501, 0x01 },
> -       { 0x3502, 0x00 },
> -       { 0x350a, 0x00 },
> -       { 0x350b, 0x3f },
> -       { 0x3620, 0x33 },
> -       { 0x3621, 0xe0 },
> -       { 0x3622, 0x01 },
> -       { 0x3630, 0x2e },
> -       { 0x3631, 0x00 },
> -       { 0x3632, 0x32 },
> -       { 0x3633, 0x52 },
> -       { 0x3634, 0x70 },
> -       { 0x3635, 0x13 },
> -       { 0x3636, 0x03 },
> -       { 0x3703, 0x5a },
> -       { 0x3704, 0xa0 },
> -       { 0x3705, 0x1a },
> -       { 0x3709, 0x12 },
> -       { 0x370b, 0x61 },
> -       { 0x370f, 0x10 },
> -       { 0x3715, 0x78 },
> -       { 0x3717, 0x01 },
> -       { 0x371b, 0x20 },
> -       { 0x3731, 0x12 },
> -       { 0x3901, 0x0a },
> -       { 0x3905, 0x02 },
> -       { 0x3906, 0x10 },
> -       { 0x3719, 0x86 },
> -       { 0x3810, 0x00 },
> -       { 0x3811, 0x10 },
> -       { 0x3812, 0x00 },
> -       { 0x3821, 0x01 },
> -       { 0x3824, 0x01 },
> -       { 0x3826, 0x03 },
> -       { 0x3828, 0x08 },
> -       { 0x3a19, 0xf8 },
> -       { 0x3c01, 0x34 },
> -       { 0x3c04, 0x28 },
> -       { 0x3c05, 0x98 },
> -       { 0x3c07, 0x07 },
> -       { 0x3c09, 0xc2 },
> -       { 0x3c0a, 0x9c },
> -       { 0x3c0b, 0x40 },
> -       { 0x3c01, 0x34 },
> -       { 0x4001, 0x02 },
> -       { 0x4514, 0x00 },
> -       { 0x4520, 0xb0 },
> -       { 0x460b, 0x37 },
> -       { 0x460c, 0x20 },
> -       { 0x4818, 0x01 },
> -       { 0x481d, 0xf0 },
> -       { 0x481f, 0x50 },
> -       { 0x4823, 0x70 },
> -       { 0x4831, 0x14 },
> -       { 0x5000, 0xa7 },
> -       { 0x5001, 0x83 },
> -       { 0x501d, 0x00 },
> -       { 0x501f, 0x00 },
> -       { 0x503d, 0x00 },
> -       { 0x505c, 0x30 },
> -       { 0x5181, 0x59 },
> -       { 0x5183, 0x00 },
> -       { 0x5191, 0xf0 },
> -       { 0x5192, 0x03 },
> -       { 0x5684, 0x10 },
> -       { 0x5685, 0xa0 },
> -       { 0x5686, 0x0c },
> -       { 0x5687, 0x78 },
> -       { 0x5a00, 0x08 },
> -       { 0x5a21, 0x00 },
> -       { 0x5a24, 0x00 },
> -       { 0x3008, 0x02 },
> -       { 0x3503, 0x00 },
> -       { 0x5180, 0xff },
> -       { 0x5181, 0xf2 },
> -       { 0x5182, 0x00 },
> -       { 0x5183, 0x14 },
> -       { 0x5184, 0x25 },
> -       { 0x5185, 0x24 },
> -       { 0x5186, 0x09 },
> -       { 0x5187, 0x09 },
> -       { 0x5188, 0x0a },
> -       { 0x5189, 0x75 },
> -       { 0x518a, 0x52 },
> -       { 0x518b, 0xea },
> -       { 0x518c, 0xa8 },
> -       { 0x518d, 0x42 },
> -       { 0x518e, 0x38 },
> -       { 0x518f, 0x56 },
> -       { 0x5190, 0x42 },
> -       { 0x5191, 0xf8 },
> -       { 0x5192, 0x04 },
> -       { 0x5193, 0x70 },
> -       { 0x5194, 0xf0 },
> -       { 0x5195, 0xf0 },
> -       { 0x5196, 0x03 },
> -       { 0x5197, 0x01 },
> -       { 0x5198, 0x04 },
> -       { 0x5199, 0x12 },
> -       { 0x519a, 0x04 },
> -       { 0x519b, 0x00 },
> -       { 0x519c, 0x06 },
> -       { 0x519d, 0x82 },
> -       { 0x519e, 0x38 },
> -       { 0x5381, 0x1e },
> -       { 0x5382, 0x5b },
> -       { 0x5383, 0x08 },
> -       { 0x5384, 0x0a },
> -       { 0x5385, 0x7e },
> -       { 0x5386, 0x88 },
> -       { 0x5387, 0x7c },
> -       { 0x5388, 0x6c },
> -       { 0x5389, 0x10 },
> -       { 0x538a, 0x01 },
> -       { 0x538b, 0x98 },
> -       { 0x5300, 0x08 },
> -       { 0x5301, 0x30 },
> -       { 0x5302, 0x10 },
> -       { 0x5303, 0x00 },
> -       { 0x5304, 0x08 },
> -       { 0x5305, 0x30 },
> -       { 0x5306, 0x08 },
> -       { 0x5307, 0x16 },
> -       { 0x5309, 0x08 },
> -       { 0x530a, 0x30 },
> -       { 0x530b, 0x04 },
> -       { 0x530c, 0x06 },
> -       { 0x5480, 0x01 },
> -       { 0x5481, 0x08 },
> -       { 0x5482, 0x14 },
> -       { 0x5483, 0x28 },
> -       { 0x5484, 0x51 },
> -       { 0x5485, 0x65 },
> -       { 0x5486, 0x71 },
> -       { 0x5487, 0x7d },
> -       { 0x5488, 0x87 },
> -       { 0x5489, 0x91 },
> -       { 0x548a, 0x9a },
> -       { 0x548b, 0xaa },
> -       { 0x548c, 0xb8 },
> -       { 0x548d, 0xcd },
> -       { 0x548e, 0xdd },
> -       { 0x548f, 0xea },
> -       { 0x5490, 0x1d },
> -       { 0x5580, 0x02 },
> -       { 0x5583, 0x40 },
> -       { 0x5584, 0x10 },
> -       { 0x5589, 0x10 },
> -       { 0x558a, 0x00 },
> -       { 0x558b, 0xf8 },
> -       { 0x5800, 0x3f },
> -       { 0x5801, 0x16 },
> -       { 0x5802, 0x0e },
> -       { 0x5803, 0x0d },
> -       { 0x5804, 0x17 },
> -       { 0x5805, 0x3f },
> -       { 0x5806, 0x0b },
> -       { 0x5807, 0x06 },
> -       { 0x5808, 0x04 },
> -       { 0x5809, 0x04 },
> -       { 0x580a, 0x06 },
> -       { 0x580b, 0x0b },
> -       { 0x580c, 0x09 },
> -       { 0x580d, 0x03 },
> -       { 0x580e, 0x00 },
> -       { 0x580f, 0x00 },
> -       { 0x5810, 0x03 },
> -       { 0x5811, 0x08 },
> -       { 0x5812, 0x0a },
> -       { 0x5813, 0x03 },
> -       { 0x5814, 0x00 },
> -       { 0x5815, 0x00 },
> -       { 0x5816, 0x04 },
> -       { 0x5817, 0x09 },
> -       { 0x5818, 0x0f },
> -       { 0x5819, 0x08 },
> -       { 0x581a, 0x06 },
> -       { 0x581b, 0x06 },
> -       { 0x581c, 0x08 },
> -       { 0x581d, 0x0c },
> -       { 0x581e, 0x3f },
> -       { 0x581f, 0x1e },
> -       { 0x5820, 0x12 },
> -       { 0x5821, 0x13 },
> -       { 0x5822, 0x21 },
> -       { 0x5823, 0x3f },
> -       { 0x5824, 0x68 },
> -       { 0x5825, 0x28 },
> -       { 0x5826, 0x2c },
> -       { 0x5827, 0x28 },
> -       { 0x5828, 0x08 },
> -       { 0x5829, 0x48 },
> -       { 0x582a, 0x64 },
> -       { 0x582b, 0x62 },
> -       { 0x582c, 0x64 },
> -       { 0x582d, 0x28 },
> -       { 0x582e, 0x46 },
> -       { 0x582f, 0x62 },
> -       { 0x5830, 0x60 },
> -       { 0x5831, 0x62 },
> -       { 0x5832, 0x26 },
> -       { 0x5833, 0x48 },
> -       { 0x5834, 0x66 },
> -       { 0x5835, 0x44 },
> -       { 0x5836, 0x64 },
> -       { 0x5837, 0x28 },
> -       { 0x5838, 0x66 },
> -       { 0x5839, 0x48 },
> -       { 0x583a, 0x2c },
> -       { 0x583b, 0x28 },
> -       { 0x583c, 0x26 },
> -       { 0x583d, 0xae },
> -       { 0x5025, 0x00 },
> -       { 0x3a0f, 0x30 },
> -       { 0x3a10, 0x28 },
> -       { 0x3a1b, 0x30 },
> -       { 0x3a1e, 0x26 },
> -       { 0x3a11, 0x60 },
> -       { 0x3a1f, 0x14 },
> -       { 0x0601, 0x02 },
> -       { 0x3008, 0x42 },
> -       { 0x3008, 0x02 },
> +static const struct cci_reg_sequence ov5645_global_init_setting[] = {
> +       { CCI_REG8(0x3103), 0x11 },
> +       { CCI_REG8(0x3008), 0x42 },
> +       { CCI_REG8(0x3103), 0x03 },
> +       { CCI_REG8(0x3503), 0x07 },
> +       { CCI_REG8(0x3002), 0x1c },
> +       { CCI_REG8(0x3006), 0xc3 },
> +       { CCI_REG8(0x3017), 0x00 },
> +       { CCI_REG8(0x3018), 0x00 },
> +       { CCI_REG8(0x302e), 0x0b },
> +       { CCI_REG8(0x3037), 0x13 },
> +       { CCI_REG8(0x3108), 0x01 },
> +       { CCI_REG8(0x3611), 0x06 },
> +       { CCI_REG8(0x3500), 0x00 },
> +       { CCI_REG8(0x3501), 0x01 },
> +       { CCI_REG8(0x3502), 0x00 },
> +       { CCI_REG8(0x350a), 0x00 },
> +       { CCI_REG8(0x350b), 0x3f },
> +       { CCI_REG8(0x3620), 0x33 },
> +       { CCI_REG8(0x3621), 0xe0 },
> +       { CCI_REG8(0x3622), 0x01 },
> +       { CCI_REG8(0x3630), 0x2e },
> +       { CCI_REG8(0x3631), 0x00 },
> +       { CCI_REG8(0x3632), 0x32 },
> +       { CCI_REG8(0x3633), 0x52 },
> +       { CCI_REG8(0x3634), 0x70 },
> +       { CCI_REG8(0x3635), 0x13 },
> +       { CCI_REG8(0x3636), 0x03 },
> +       { CCI_REG8(0x3703), 0x5a },
> +       { CCI_REG8(0x3704), 0xa0 },
> +       { CCI_REG8(0x3705), 0x1a },
> +       { CCI_REG8(0x3709), 0x12 },
> +       { CCI_REG8(0x370b), 0x61 },
> +       { CCI_REG8(0x370f), 0x10 },
> +       { CCI_REG8(0x3715), 0x78 },
> +       { CCI_REG8(0x3717), 0x01 },
> +       { CCI_REG8(0x371b), 0x20 },
> +       { CCI_REG8(0x3731), 0x12 },
> +       { CCI_REG8(0x3901), 0x0a },
> +       { CCI_REG8(0x3905), 0x02 },
> +       { CCI_REG8(0x3906), 0x10 },
> +       { CCI_REG8(0x3719), 0x86 },
> +       { CCI_REG8(0x3810), 0x00 },
> +       { CCI_REG8(0x3811), 0x10 },
> +       { CCI_REG8(0x3812), 0x00 },
> +       { CCI_REG8(0x3821), 0x01 },
> +       { CCI_REG8(0x3824), 0x01 },
> +       { CCI_REG8(0x3826), 0x03 },
> +       { CCI_REG8(0x3828), 0x08 },
> +       { CCI_REG8(0x3a19), 0xf8 },
> +       { CCI_REG8(0x3c01), 0x34 },
> +       { CCI_REG8(0x3c04), 0x28 },
> +       { CCI_REG8(0x3c05), 0x98 },
> +       { CCI_REG8(0x3c07), 0x07 },
> +       { CCI_REG8(0x3c09), 0xc2 },
> +       { CCI_REG8(0x3c0a), 0x9c },
> +       { CCI_REG8(0x3c0b), 0x40 },
> +       { CCI_REG8(0x3c01), 0x34 },
> +       { CCI_REG8(0x4001), 0x02 },
> +       { CCI_REG8(0x4514), 0x00 },
> +       { CCI_REG8(0x4520), 0xb0 },
> +       { CCI_REG8(0x460b), 0x37 },
> +       { CCI_REG8(0x460c), 0x20 },
> +       { CCI_REG8(0x4818), 0x01 },
> +       { CCI_REG8(0x481d), 0xf0 },
> +       { CCI_REG8(0x481f), 0x50 },
> +       { CCI_REG8(0x4823), 0x70 },
> +       { CCI_REG8(0x4831), 0x14 },
> +       { CCI_REG8(0x5000), 0xa7 },
> +       { CCI_REG8(0x5001), 0x83 },
> +       { CCI_REG8(0x501d), 0x00 },
> +       { CCI_REG8(0x501f), 0x00 },
> +       { CCI_REG8(0x503d), 0x00 },
> +       { CCI_REG8(0x505c), 0x30 },
> +       { CCI_REG8(0x5181), 0x59 },
> +       { CCI_REG8(0x5183), 0x00 },
> +       { CCI_REG8(0x5191), 0xf0 },
> +       { CCI_REG8(0x5192), 0x03 },
> +       { CCI_REG8(0x5684), 0x10 },
> +       { CCI_REG8(0x5685), 0xa0 },
> +       { CCI_REG8(0x5686), 0x0c },
> +       { CCI_REG8(0x5687), 0x78 },
> +       { CCI_REG8(0x5a00), 0x08 },
> +       { CCI_REG8(0x5a21), 0x00 },
> +       { CCI_REG8(0x5a24), 0x00 },
> +       { CCI_REG8(0x3008), 0x02 },
> +       { CCI_REG8(0x3503), 0x00 },
> +       { CCI_REG8(0x5180), 0xff },
> +       { CCI_REG8(0x5181), 0xf2 },
> +       { CCI_REG8(0x5182), 0x00 },
> +       { CCI_REG8(0x5183), 0x14 },
> +       { CCI_REG8(0x5184), 0x25 },
> +       { CCI_REG8(0x5185), 0x24 },
> +       { CCI_REG8(0x5186), 0x09 },
> +       { CCI_REG8(0x5187), 0x09 },
> +       { CCI_REG8(0x5188), 0x0a },
> +       { CCI_REG8(0x5189), 0x75 },
> +       { CCI_REG8(0x518a), 0x52 },
> +       { CCI_REG8(0x518b), 0xea },
> +       { CCI_REG8(0x518c), 0xa8 },
> +       { CCI_REG8(0x518d), 0x42 },
> +       { CCI_REG8(0x518e), 0x38 },
> +       { CCI_REG8(0x518f), 0x56 },
> +       { CCI_REG8(0x5190), 0x42 },
> +       { CCI_REG8(0x5191), 0xf8 },
> +       { CCI_REG8(0x5192), 0x04 },
> +       { CCI_REG8(0x5193), 0x70 },
> +       { CCI_REG8(0x5194), 0xf0 },
> +       { CCI_REG8(0x5195), 0xf0 },
> +       { CCI_REG8(0x5196), 0x03 },
> +       { CCI_REG8(0x5197), 0x01 },
> +       { CCI_REG8(0x5198), 0x04 },
> +       { CCI_REG8(0x5199), 0x12 },
> +       { CCI_REG8(0x519a), 0x04 },
> +       { CCI_REG8(0x519b), 0x00 },
> +       { CCI_REG8(0x519c), 0x06 },
> +       { CCI_REG8(0x519d), 0x82 },
> +       { CCI_REG8(0x519e), 0x38 },
> +       { CCI_REG8(0x5381), 0x1e },
> +       { CCI_REG8(0x5382), 0x5b },
> +       { CCI_REG8(0x5383), 0x08 },
> +       { CCI_REG8(0x5384), 0x0a },
> +       { CCI_REG8(0x5385), 0x7e },
> +       { CCI_REG8(0x5386), 0x88 },
> +       { CCI_REG8(0x5387), 0x7c },
> +       { CCI_REG8(0x5388), 0x6c },
> +       { CCI_REG8(0x5389), 0x10 },
> +       { CCI_REG8(0x538a), 0x01 },
> +       { CCI_REG8(0x538b), 0x98 },
> +       { CCI_REG8(0x5300), 0x08 },
> +       { CCI_REG8(0x5301), 0x30 },
> +       { CCI_REG8(0x5302), 0x10 },
> +       { CCI_REG8(0x5303), 0x00 },
> +       { CCI_REG8(0x5304), 0x08 },
> +       { CCI_REG8(0x5305), 0x30 },
> +       { CCI_REG8(0x5306), 0x08 },
> +       { CCI_REG8(0x5307), 0x16 },
> +       { CCI_REG8(0x5309), 0x08 },
> +       { CCI_REG8(0x530a), 0x30 },
> +       { CCI_REG8(0x530b), 0x04 },
> +       { CCI_REG8(0x530c), 0x06 },
> +       { CCI_REG8(0x5480), 0x01 },
> +       { CCI_REG8(0x5481), 0x08 },
> +       { CCI_REG8(0x5482), 0x14 },
> +       { CCI_REG8(0x5483), 0x28 },
> +       { CCI_REG8(0x5484), 0x51 },
> +       { CCI_REG8(0x5485), 0x65 },
> +       { CCI_REG8(0x5486), 0x71 },
> +       { CCI_REG8(0x5487), 0x7d },
> +       { CCI_REG8(0x5488), 0x87 },
> +       { CCI_REG8(0x5489), 0x91 },
> +       { CCI_REG8(0x548a), 0x9a },
> +       { CCI_REG8(0x548b), 0xaa },
> +       { CCI_REG8(0x548c), 0xb8 },
> +       { CCI_REG8(0x548d), 0xcd },
> +       { CCI_REG8(0x548e), 0xdd },
> +       { CCI_REG8(0x548f), 0xea },
> +       { CCI_REG8(0x5490), 0x1d },
> +       { CCI_REG8(0x5580), 0x02 },
> +       { CCI_REG8(0x5583), 0x40 },
> +       { CCI_REG8(0x5584), 0x10 },
> +       { CCI_REG8(0x5589), 0x10 },
> +       { CCI_REG8(0x558a), 0x00 },
> +       { CCI_REG8(0x558b), 0xf8 },
> +       { CCI_REG8(0x5800), 0x3f },
> +       { CCI_REG8(0x5801), 0x16 },
> +       { CCI_REG8(0x5802), 0x0e },
> +       { CCI_REG8(0x5803), 0x0d },
> +       { CCI_REG8(0x5804), 0x17 },
> +       { CCI_REG8(0x5805), 0x3f },
> +       { CCI_REG8(0x5806), 0x0b },
> +       { CCI_REG8(0x5807), 0x06 },
> +       { CCI_REG8(0x5808), 0x04 },
> +       { CCI_REG8(0x5809), 0x04 },
> +       { CCI_REG8(0x580a), 0x06 },
> +       { CCI_REG8(0x580b), 0x0b },
> +       { CCI_REG8(0x580c), 0x09 },
> +       { CCI_REG8(0x580d), 0x03 },
> +       { CCI_REG8(0x580e), 0x00 },
> +       { CCI_REG8(0x580f), 0x00 },
> +       { CCI_REG8(0x5810), 0x03 },
> +       { CCI_REG8(0x5811), 0x08 },
> +       { CCI_REG8(0x5812), 0x0a },
> +       { CCI_REG8(0x5813), 0x03 },
> +       { CCI_REG8(0x5814), 0x00 },
> +       { CCI_REG8(0x5815), 0x00 },
> +       { CCI_REG8(0x5816), 0x04 },
> +       { CCI_REG8(0x5817), 0x09 },
> +       { CCI_REG8(0x5818), 0x0f },
> +       { CCI_REG8(0x5819), 0x08 },
> +       { CCI_REG8(0x581a), 0x06 },
> +       { CCI_REG8(0x581b), 0x06 },
> +       { CCI_REG8(0x581c), 0x08 },
> +       { CCI_REG8(0x581d), 0x0c },
> +       { CCI_REG8(0x581e), 0x3f },
> +       { CCI_REG8(0x581f), 0x1e },
> +       { CCI_REG8(0x5820), 0x12 },
> +       { CCI_REG8(0x5821), 0x13 },
> +       { CCI_REG8(0x5822), 0x21 },
> +       { CCI_REG8(0x5823), 0x3f },
> +       { CCI_REG8(0x5824), 0x68 },
> +       { CCI_REG8(0x5825), 0x28 },
> +       { CCI_REG8(0x5826), 0x2c },
> +       { CCI_REG8(0x5827), 0x28 },
> +       { CCI_REG8(0x5828), 0x08 },
> +       { CCI_REG8(0x5829), 0x48 },
> +       { CCI_REG8(0x582a), 0x64 },
> +       { CCI_REG8(0x582b), 0x62 },
> +       { CCI_REG8(0x582c), 0x64 },
> +       { CCI_REG8(0x582d), 0x28 },
> +       { CCI_REG8(0x582e), 0x46 },
> +       { CCI_REG8(0x582f), 0x62 },
> +       { CCI_REG8(0x5830), 0x60 },
> +       { CCI_REG8(0x5831), 0x62 },
> +       { CCI_REG8(0x5832), 0x26 },
> +       { CCI_REG8(0x5833), 0x48 },
> +       { CCI_REG8(0x5834), 0x66 },
> +       { CCI_REG8(0x5835), 0x44 },
> +       { CCI_REG8(0x5836), 0x64 },
> +       { CCI_REG8(0x5837), 0x28 },
> +       { CCI_REG8(0x5838), 0x66 },
> +       { CCI_REG8(0x5839), 0x48 },
> +       { CCI_REG8(0x583a), 0x2c },
> +       { CCI_REG8(0x583b), 0x28 },
> +       { CCI_REG8(0x583c), 0x26 },
> +       { CCI_REG8(0x583d), 0xae },
> +       { CCI_REG8(0x5025), 0x00 },
> +       { CCI_REG8(0x3a0f), 0x30 },
> +       { CCI_REG8(0x3a10), 0x28 },
> +       { CCI_REG8(0x3a1b), 0x30 },
> +       { CCI_REG8(0x3a1e), 0x26 },
> +       { CCI_REG8(0x3a11), 0x60 },
> +       { CCI_REG8(0x3a1f), 0x14 },
> +       { CCI_REG8(0x0601), 0x02 },
> +       { CCI_REG8(0x3008), 0x42 },
> +       { CCI_REG8(0x3008), 0x02 },
>          { OV5645_IO_MIPI_CTRL00, 0x40 },
>          { OV5645_MIPI_CTRL00, 0x24 },
>          { OV5645_PAD_OUTPUT00, 0x70 }
>   };
>
> -static const struct reg_value ov5645_setting_sxga[] = {
> -       { 0x3612, 0xa9 },
> -       { 0x3614, 0x50 },
> -       { 0x3618, 0x00 },
> -       { 0x3034, 0x18 },
> -       { 0x3035, 0x21 },
> -       { 0x3036, 0x70 },
> -       { 0x3600, 0x09 },
> -       { 0x3601, 0x43 },
> -       { 0x3708, 0x66 },
> -       { 0x370c, 0xc3 },
> -       { 0x3800, 0x00 },
> -       { 0x3801, 0x00 },
> -       { 0x3802, 0x00 },
> -       { 0x3803, 0x06 },
> -       { 0x3804, 0x0a },
> -       { 0x3805, 0x3f },
> -       { 0x3806, 0x07 },
> -       { 0x3807, 0x9d },
> -       { 0x3808, 0x05 },
> -       { 0x3809, 0x00 },
> -       { 0x380a, 0x03 },
> -       { 0x380b, 0xc0 },
> -       { 0x380c, 0x07 },
> -       { 0x380d, 0x68 },
> -       { 0x380e, 0x03 },
> -       { 0x380f, 0xd8 },
> -       { 0x3813, 0x06 },
> -       { 0x3814, 0x31 },
> -       { 0x3815, 0x31 },
> -       { 0x3820, 0x47 },
> -       { 0x3a02, 0x03 },
> -       { 0x3a03, 0xd8 },
> -       { 0x3a08, 0x01 },
> -       { 0x3a09, 0xf8 },
> -       { 0x3a0a, 0x01 },
> -       { 0x3a0b, 0xa4 },
> -       { 0x3a0e, 0x02 },
> -       { 0x3a0d, 0x02 },
> -       { 0x3a14, 0x03 },
> -       { 0x3a15, 0xd8 },
> -       { 0x3a18, 0x00 },
> -       { 0x4004, 0x02 },
> -       { 0x4005, 0x18 },
> -       { 0x4300, 0x32 },
> -       { 0x4202, 0x00 }
> +static const struct cci_reg_sequence ov5645_setting_sxga[] = {
> +       { CCI_REG8(0x3612), 0xa9 },
> +       { CCI_REG8(0x3614), 0x50 },
> +       { CCI_REG8(0x3618), 0x00 },
> +       { CCI_REG8(0x3034), 0x18 },
> +       { CCI_REG8(0x3035), 0x21 },
> +       { CCI_REG8(0x3036), 0x70 },
> +       { CCI_REG8(0x3600), 0x09 },
> +       { CCI_REG8(0x3601), 0x43 },
> +       { CCI_REG8(0x3708), 0x66 },
> +       { CCI_REG8(0x370c), 0xc3 },
> +       { CCI_REG8(0x3800), 0x00 },
> +       { CCI_REG8(0x3801), 0x00 },
> +       { CCI_REG8(0x3802), 0x00 },
> +       { CCI_REG8(0x3803), 0x06 },
> +       { CCI_REG8(0x3804), 0x0a },
> +       { CCI_REG8(0x3805), 0x3f },
> +       { CCI_REG8(0x3806), 0x07 },
> +       { CCI_REG8(0x3807), 0x9d },
> +       { CCI_REG8(0x3808), 0x05 },
> +       { CCI_REG8(0x3809), 0x00 },
> +       { CCI_REG8(0x380a), 0x03 },
> +       { CCI_REG8(0x380b), 0xc0 },
> +       { CCI_REG8(0x380c), 0x07 },
> +       { CCI_REG8(0x380d), 0x68 },
> +       { CCI_REG8(0x380e), 0x03 },
> +       { CCI_REG8(0x380f), 0xd8 },
> +       { CCI_REG8(0x3813), 0x06 },
> +       { CCI_REG8(0x3814), 0x31 },
> +       { CCI_REG8(0x3815), 0x31 },
> +       { CCI_REG8(0x3820), 0x47 },
> +       { CCI_REG8(0x3a02), 0x03 },
> +       { CCI_REG8(0x3a03), 0xd8 },
> +       { CCI_REG8(0x3a08), 0x01 },
> +       { CCI_REG8(0x3a09), 0xf8 },
> +       { CCI_REG8(0x3a0a), 0x01 },
> +       { CCI_REG8(0x3a0b), 0xa4 },
> +       { CCI_REG8(0x3a0e), 0x02 },
> +       { CCI_REG8(0x3a0d), 0x02 },
> +       { CCI_REG8(0x3a14), 0x03 },
> +       { CCI_REG8(0x3a15), 0xd8 },
> +       { CCI_REG8(0x3a18), 0x00 },
> +       { CCI_REG8(0x4004), 0x02 },
> +       { CCI_REG8(0x4005), 0x18 },
> +       { CCI_REG8(0x4300), 0x32 },
> +       { CCI_REG8(0x4202), 0x00 }
>   };
>
> -static const struct reg_value ov5645_setting_1080p[] = {
> -       { 0x3612, 0xab },
> -       { 0x3614, 0x50 },
> -       { 0x3618, 0x04 },
> -       { 0x3034, 0x18 },
> -       { 0x3035, 0x11 },
> -       { 0x3036, 0x54 },
> -       { 0x3600, 0x08 },
> -       { 0x3601, 0x33 },
> -       { 0x3708, 0x63 },
> -       { 0x370c, 0xc0 },
> -       { 0x3800, 0x01 },
> -       { 0x3801, 0x50 },
> -       { 0x3802, 0x01 },
> -       { 0x3803, 0xb2 },
> -       { 0x3804, 0x08 },
> -       { 0x3805, 0xef },
> -       { 0x3806, 0x05 },
> -       { 0x3807, 0xf1 },
> -       { 0x3808, 0x07 },
> -       { 0x3809, 0x80 },
> -       { 0x380a, 0x04 },
> -       { 0x380b, 0x38 },
> -       { 0x380c, 0x09 },
> -       { 0x380d, 0xc4 },
> -       { 0x380e, 0x04 },
> -       { 0x380f, 0x60 },
> -       { 0x3813, 0x04 },
> -       { 0x3814, 0x11 },
> -       { 0x3815, 0x11 },
> -       { 0x3820, 0x47 },
> -       { 0x4514, 0x88 },
> -       { 0x3a02, 0x04 },
> -       { 0x3a03, 0x60 },
> -       { 0x3a08, 0x01 },
> -       { 0x3a09, 0x50 },
> -       { 0x3a0a, 0x01 },
> -       { 0x3a0b, 0x18 },
> -       { 0x3a0e, 0x03 },
> -       { 0x3a0d, 0x04 },
> -       { 0x3a14, 0x04 },
> -       { 0x3a15, 0x60 },
> -       { 0x3a18, 0x00 },
> -       { 0x4004, 0x06 },
> -       { 0x4005, 0x18 },
> -       { 0x4300, 0x32 },
> -       { 0x4202, 0x00 },
> -       { 0x4837, 0x0b }
> +static const struct cci_reg_sequence ov5645_setting_1080p[] = {
> +       { CCI_REG8(0x3612), 0xab },
> +       { CCI_REG8(0x3614), 0x50 },
> +       { CCI_REG8(0x3618), 0x04 },
> +       { CCI_REG8(0x3034), 0x18 },
> +       { CCI_REG8(0x3035), 0x11 },
> +       { CCI_REG8(0x3036), 0x54 },
> +       { CCI_REG8(0x3600), 0x08 },
> +       { CCI_REG8(0x3601), 0x33 },
> +       { CCI_REG8(0x3708), 0x63 },
> +       { CCI_REG8(0x370c), 0xc0 },
> +       { CCI_REG8(0x3800), 0x01 },
> +       { CCI_REG8(0x3801), 0x50 },
> +       { CCI_REG8(0x3802), 0x01 },
> +       { CCI_REG8(0x3803), 0xb2 },
> +       { CCI_REG8(0x3804), 0x08 },
> +       { CCI_REG8(0x3805), 0xef },
> +       { CCI_REG8(0x3806), 0x05 },
> +       { CCI_REG8(0x3807), 0xf1 },
> +       { CCI_REG8(0x3808), 0x07 },
> +       { CCI_REG8(0x3809), 0x80 },
> +       { CCI_REG8(0x380a), 0x04 },
> +       { CCI_REG8(0x380b), 0x38 },
> +       { CCI_REG8(0x380c), 0x09 },
> +       { CCI_REG8(0x380d), 0xc4 },
> +       { CCI_REG8(0x380e), 0x04 },
> +       { CCI_REG8(0x380f), 0x60 },
> +       { CCI_REG8(0x3813), 0x04 },
> +       { CCI_REG8(0x3814), 0x11 },
> +       { CCI_REG8(0x3815), 0x11 },
> +       { CCI_REG8(0x3820), 0x47 },
> +       { CCI_REG8(0x4514), 0x88 },
> +       { CCI_REG8(0x3a02), 0x04 },
> +       { CCI_REG8(0x3a03), 0x60 },
> +       { CCI_REG8(0x3a08), 0x01 },
> +       { CCI_REG8(0x3a09), 0x50 },
> +       { CCI_REG8(0x3a0a), 0x01 },
> +       { CCI_REG8(0x3a0b), 0x18 },
> +       { CCI_REG8(0x3a0e), 0x03 },
> +       { CCI_REG8(0x3a0d), 0x04 },
> +       { CCI_REG8(0x3a14), 0x04 },
> +       { CCI_REG8(0x3a15), 0x60 },
> +       { CCI_REG8(0x3a18), 0x00 },
> +       { CCI_REG8(0x4004), 0x06 },
> +       { CCI_REG8(0x4005), 0x18 },
> +       { CCI_REG8(0x4300), 0x32 },
> +       { CCI_REG8(0x4202), 0x00 },
> +       { CCI_REG8(0x4837), 0x0b }
>   };
>
> -static const struct reg_value ov5645_setting_full[] = {
> -       { 0x3612, 0xab },
> -       { 0x3614, 0x50 },
> -       { 0x3618, 0x04 },
> -       { 0x3034, 0x18 },
> -       { 0x3035, 0x11 },
> -       { 0x3036, 0x54 },
> -       { 0x3600, 0x08 },
> -       { 0x3601, 0x33 },
> -       { 0x3708, 0x63 },
> -       { 0x370c, 0xc0 },
> -       { 0x3800, 0x00 },
> -       { 0x3801, 0x00 },
> -       { 0x3802, 0x00 },
> -       { 0x3803, 0x00 },
> -       { 0x3804, 0x0a },
> -       { 0x3805, 0x3f },
> -       { 0x3806, 0x07 },
> -       { 0x3807, 0x9f },
> -       { 0x3808, 0x0a },
> -       { 0x3809, 0x20 },
> -       { 0x380a, 0x07 },
> -       { 0x380b, 0x98 },
> -       { 0x380c, 0x0b },
> -       { 0x380d, 0x1c },
> -       { 0x380e, 0x07 },
> -       { 0x380f, 0xb0 },
> -       { 0x3813, 0x06 },
> -       { 0x3814, 0x11 },
> -       { 0x3815, 0x11 },
> -       { 0x3820, 0x47 },
> -       { 0x4514, 0x88 },
> -       { 0x3a02, 0x07 },
> -       { 0x3a03, 0xb0 },
> -       { 0x3a08, 0x01 },
> -       { 0x3a09, 0x27 },
> -       { 0x3a0a, 0x00 },
> -       { 0x3a0b, 0xf6 },
> -       { 0x3a0e, 0x06 },
> -       { 0x3a0d, 0x08 },
> -       { 0x3a14, 0x07 },
> -       { 0x3a15, 0xb0 },
> -       { 0x3a18, 0x01 },
> -       { 0x4004, 0x06 },
> -       { 0x4005, 0x18 },
> -       { 0x4300, 0x32 },
> -       { 0x4837, 0x0b },
> -       { 0x4202, 0x00 }
> +static const struct cci_reg_sequence ov5645_setting_full[] = {
> +       { CCI_REG8(0x3612), 0xab },
> +       { CCI_REG8(0x3614), 0x50 },
> +       { CCI_REG8(0x3618), 0x04 },
> +       { CCI_REG8(0x3034), 0x18 },
> +       { CCI_REG8(0x3035), 0x11 },
> +       { CCI_REG8(0x3036), 0x54 },
> +       { CCI_REG8(0x3600), 0x08 },
> +       { CCI_REG8(0x3601), 0x33 },
> +       { CCI_REG8(0x3708), 0x63 },
> +       { CCI_REG8(0x370c), 0xc0 },
> +       { CCI_REG8(0x3800), 0x00 },
> +       { CCI_REG8(0x3801), 0x00 },
> +       { CCI_REG8(0x3802), 0x00 },
> +       { CCI_REG8(0x3803), 0x00 },
> +       { CCI_REG8(0x3804), 0x0a },
> +       { CCI_REG8(0x3805), 0x3f },
> +       { CCI_REG8(0x3806), 0x07 },
> +       { CCI_REG8(0x3807), 0x9f },
> +       { CCI_REG8(0x3808), 0x0a },
> +       { CCI_REG8(0x3809), 0x20 },
> +       { CCI_REG8(0x380a), 0x07 },
> +       { CCI_REG8(0x380b), 0x98 },
> +       { CCI_REG8(0x380c), 0x0b },
> +       { CCI_REG8(0x380d), 0x1c },
> +       { CCI_REG8(0x380e), 0x07 },
> +       { CCI_REG8(0x380f), 0xb0 },
> +       { CCI_REG8(0x3813), 0x06 },
> +       { CCI_REG8(0x3814), 0x11 },
> +       { CCI_REG8(0x3815), 0x11 },
> +       { CCI_REG8(0x3820), 0x47 },
> +       { CCI_REG8(0x4514), 0x88 },
> +       { CCI_REG8(0x3a02), 0x07 },
> +       { CCI_REG8(0x3a03), 0xb0 },
> +       { CCI_REG8(0x3a08), 0x01 },
> +       { CCI_REG8(0x3a09), 0x27 },
> +       { CCI_REG8(0x3a0a), 0x00 },
> +       { CCI_REG8(0x3a0b), 0xf6 },
> +       { CCI_REG8(0x3a0e), 0x06 },
> +       { CCI_REG8(0x3a0d), 0x08 },
> +       { CCI_REG8(0x3a14), 0x07 },
> +       { CCI_REG8(0x3a15), 0xb0 },
> +       { CCI_REG8(0x3a18), 0x01 },
> +       { CCI_REG8(0x4004), 0x06 },
> +       { CCI_REG8(0x4005), 0x18 },
> +       { CCI_REG8(0x4300), 0x32 },
> +       { CCI_REG8(0x4837), 0x0b },
> +       { CCI_REG8(0x4202), 0x00 }
>   };
>
>   static const s64 link_freq[] = {
> @@ -537,50 +535,6 @@ static const struct ov5645_mode_info ov5645_mode_info_data[] = {
>          },
>   };
>
> -static int ov5645_write_reg(struct ov5645 *ov5645, u16 reg, u8 val)
> -{
> -       u8 regbuf[3];
> -       int ret;
> -
> -       regbuf[0] = reg >> 8;
> -       regbuf[1] = reg & 0xff;
> -       regbuf[2] = val;
> -
> -       ret = i2c_master_send(ov5645->i2c_client, regbuf, 3);
> -       if (ret < 0) {
> -               dev_err(ov5645->dev, "%s: write reg error %d: reg=%x, val=%x\n",
> -                       __func__, ret, reg, val);
> -               return ret;
> -       }
> -
> -       return 0;
> -}
> -
> -static int ov5645_read_reg(struct ov5645 *ov5645, u16 reg, u8 *val)
> -{
> -       u8 regbuf[2];
> -       int ret;
> -
> -       regbuf[0] = reg >> 8;
> -       regbuf[1] = reg & 0xff;
> -
> -       ret = i2c_master_send(ov5645->i2c_client, regbuf, 2);
> -       if (ret < 0) {
> -               dev_err(ov5645->dev, "%s: write reg error %d: reg=%x\n",
> -                       __func__, ret, reg);
> -               return ret;
> -       }
> -
> -       ret = i2c_master_recv(ov5645->i2c_client, val, 1);
> -       if (ret < 0) {
> -               dev_err(ov5645->dev, "%s: read reg error %d: reg=%x\n",
> -                       __func__, ret, reg);
> -               return ret;
> -       }
> -
> -       return 0;
> -}
> -
>   static int ov5645_set_aec_mode(struct ov5645 *ov5645, u32 mode)
>   {
>          u8 val = ov5645->aec_pk_manual;
> @@ -591,7 +545,7 @@ static int ov5645_set_aec_mode(struct ov5645 *ov5645, u32 mode)
>          else /* V4L2_EXPOSURE_MANUAL */
>                  val |= OV5645_AEC_MANUAL_ENABLE;
>
> -       ret = ov5645_write_reg(ov5645, OV5645_AEC_PK_MANUAL, val);
> +       ret = cci_write(ov5645->regmap, OV5645_AEC_PK_MANUAL, val, NULL);
>          if (!ret)
>                  ov5645->aec_pk_manual = val;
>
> @@ -608,7 +562,7 @@ static int ov5645_set_agc_mode(struct ov5645 *ov5645, u32 enable)
>          else
>                  val |= OV5645_AGC_MANUAL_ENABLE;
>
> -       ret = ov5645_write_reg(ov5645, OV5645_AEC_PK_MANUAL, val);
> +       ret = cci_write(ov5645->regmap, OV5645_AEC_PK_MANUAL, val, NULL);
>          if (!ret)
>                  ov5645->aec_pk_manual = val;
>
> @@ -616,14 +570,15 @@ static int ov5645_set_agc_mode(struct ov5645 *ov5645, u32 enable)
>   }
>
>   static int ov5645_set_register_array(struct ov5645 *ov5645,
> -                                    const struct reg_value *settings,
> +                                    const struct cci_reg_sequence *settings,
>                                       unsigned int num_settings)
>   {
>          unsigned int i;
>          int ret;
>
>          for (i = 0; i < num_settings; ++i, ++settings) {
> -               ret = ov5645_write_reg(ov5645, settings->reg, settings->val);
> +               ret = cci_write(ov5645->regmap, settings->reg,
> +                               settings->val, NULL);
>                  if (ret < 0)
>                          return ret;
>
> @@ -640,7 +595,7 @@ static void __ov5645_set_power_off(struct device *dev)
>          struct v4l2_subdev *sd = dev_get_drvdata(dev);
>          struct ov5645 *ov5645 = to_ov5645(sd);
>
> -       ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x58);
> +       cci_write(ov5645->regmap, OV5645_IO_MIPI_CTRL00, 0x58, NULL);
>          gpiod_set_value_cansleep(ov5645->rst_gpio, 1);
>          gpiod_set_value_cansleep(ov5645->enable_gpio, 0);
>          regulator_bulk_disable(OV5645_NUM_SUPPLIES, ov5645->supplies);
> @@ -704,11 +659,11 @@ static int ov5645_set_saturation(struct ov5645 *ov5645, s32 value)
>          u32 reg_value = (value * 0x10) + 0x40;
>          int ret;
>
> -       ret = ov5645_write_reg(ov5645, OV5645_SDE_SAT_U, reg_value);
> +       ret = cci_write(ov5645->regmap, OV5645_SDE_SAT_U, reg_value, NULL);
>          if (ret < 0)
>                  return ret;
>
> -       return ov5645_write_reg(ov5645, OV5645_SDE_SAT_V, reg_value);
> +       return cci_write(ov5645->regmap, OV5645_SDE_SAT_V, reg_value, NULL);
>   }
>
>   static int ov5645_set_hflip(struct ov5645 *ov5645, s32 value)
> @@ -721,7 +676,7 @@ static int ov5645_set_hflip(struct ov5645 *ov5645, s32 value)
>          else
>                  val |= (OV5645_SENSOR_MIRROR);
>
> -       ret = ov5645_write_reg(ov5645, OV5645_TIMING_TC_REG21, val);
> +       ret = cci_write(ov5645->regmap, OV5645_TIMING_TC_REG21, val, NULL);
>          if (!ret)
>                  ov5645->timing_tc_reg21 = val;
>
> @@ -738,7 +693,7 @@ static int ov5645_set_vflip(struct ov5645 *ov5645, s32 value)
>          else
>                  val &= ~(OV5645_SENSOR_VFLIP | OV5645_ISP_VFLIP);
>
> -       ret = ov5645_write_reg(ov5645, OV5645_TIMING_TC_REG20, val);
> +       ret = cci_write(ov5645->regmap, OV5645_TIMING_TC_REG20, val, NULL);
>          if (!ret)
>                  ov5645->timing_tc_reg20 = val;
>
> @@ -754,7 +709,8 @@ static int ov5645_set_test_pattern(struct ov5645 *ov5645, s32 value)
>                  val |= OV5645_TEST_PATTERN_ENABLE;
>          }
>
> -       return ov5645_write_reg(ov5645, OV5645_PRE_ISP_TEST_SETTING_1, val);
> +       return cci_write(ov5645->regmap, OV5645_PRE_ISP_TEST_SETTING_1,
> +                        val, NULL);
>   }
>
>   static const char * const ov5645_test_pattern_menu[] = {
> @@ -772,7 +728,7 @@ static int ov5645_set_awb(struct ov5645 *ov5645, s32 enable_auto)
>          if (!enable_auto)
>                  val = OV5645_AWB_MANUAL_ENABLE;
>
> -       return ov5645_write_reg(ov5645, OV5645_AWB_MANUAL_CONTROL, val);
> +       return cci_write(ov5645->regmap, OV5645_AWB_MANUAL_CONTROL, val, NULL);
>   }
>
>   static int ov5645_s_ctrl(struct v4l2_ctrl *ctrl)
> @@ -958,9 +914,8 @@ static int ov5645_enable_streams(struct v4l2_subdev *sd,
>          if (ret < 0)
>                  return ret;
>
> -       ret = ov5645_set_register_array(ov5645,
> -                                       ov5645->current_mode->data,
> -                                       ov5645->current_mode->data_size);
> +       ret = cci_multi_reg_write(ov5645->regmap, ov5645->current_mode->data,
> +                                 ov5645->current_mode->data_size, NULL);
>          if (ret < 0) {
>                  dev_err(ov5645->dev, "could not set mode %dx%d\n",
>                          ov5645->current_mode->width,
> @@ -973,12 +928,12 @@ static int ov5645_enable_streams(struct v4l2_subdev *sd,
>                  goto err_rpm_put;
>          }
>
> -       ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x45);
> +       ret = cci_write(ov5645->regmap, OV5645_IO_MIPI_CTRL00, 0x45, NULL);
>          if (ret < 0)
>                  goto err_rpm_put;
>
> -       ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
> -                              OV5645_SYSTEM_CTRL0_START);
> +       ret = cci_write(ov5645->regmap, OV5645_SYSTEM_CTRL0,
> +                       OV5645_SYSTEM_CTRL0_START, NULL);
>          if (ret < 0)
>                  goto err_rpm_put;
>
> @@ -996,12 +951,12 @@ static int ov5645_disable_streams(struct v4l2_subdev *sd,
>          struct ov5645 *ov5645 = to_ov5645(sd);
>          int ret;
>
> -       ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x40);
> +       ret = cci_write(ov5645->regmap, OV5645_IO_MIPI_CTRL00, 0x40, NULL);
>          if (ret < 0)
>                  goto rpm_put;
>
> -       ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
> -                              OV5645_SYSTEM_CTRL0_STOP);
> +       ret = cci_write(ov5645->regmap, OV5645_SYSTEM_CTRL0,
> +                       OV5645_SYSTEM_CTRL0_STOP, NULL);
>
>   rpm_put:
>          pm_runtime_put_autosuspend(ov5645->dev);
> @@ -1036,9 +991,9 @@ static const struct v4l2_subdev_internal_ops ov5645_internal_ops = {
>   static int ov5645_probe(struct i2c_client *client)
>   {
>          struct device *dev = &client->dev;
> +       u64 chip_id_high, chip_id_low;
>          struct device_node *endpoint;
>          struct ov5645 *ov5645;
> -       u8 chip_id_high, chip_id_low;
>          unsigned int i;
>          u32 xclk_freq;
>          int ret;
> @@ -1068,6 +1023,11 @@ static int ov5645_probe(struct i2c_client *client)
>                  return dev_err_probe(dev, -EINVAL,
>                                       "invalid bus type, must be CSI2\n");
>
> +       ov5645->regmap = devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(ov5645->regmap))
> +               return dev_err_probe(ov5645->dev, PTR_ERR(ov5645->regmap),
> +                                    "Failed to init CCI\n");
> +
>          /* get system clock (xclk) */
>          ov5645->xclk = devm_v4l2_sensor_clk_get_legacy(dev, NULL, false, 0);
>          if (IS_ERR(ov5645->xclk))
> @@ -1154,13 +1114,14 @@ static int ov5645_probe(struct i2c_client *client)
>          if (ret)
>                  goto free_entity;
>
> -       ret = ov5645_read_reg(ov5645, OV5645_CHIP_ID_HIGH, &chip_id_high);
> +       ret = cci_read(ov5645->regmap, OV5645_CHIP_ID_HIGH,
> +                      &chip_id_high, NULL);
>          if (ret < 0 || chip_id_high != OV5645_CHIP_ID_HIGH_BYTE) {
>                  ret = -ENODEV;
>                  dev_err_probe(dev, ret, "could not read ID high\n");
>                  goto power_down;
>          }
> -       ret = ov5645_read_reg(ov5645, OV5645_CHIP_ID_LOW, &chip_id_low);
> +       ret = cci_read(ov5645->regmap, OV5645_CHIP_ID_LOW, &chip_id_low, NULL);
>          if (ret < 0 || chip_id_low != OV5645_CHIP_ID_LOW_BYTE) {
>                  ret = -ENODEV;
>                  dev_err_probe(dev, ret, "could not read ID low\n");
> @@ -1169,24 +1130,24 @@ static int ov5645_probe(struct i2c_client *client)
>
>          dev_info(dev, "OV5645 detected at address 0x%02x\n", client->addr);
>
> -       ret = ov5645_read_reg(ov5645, OV5645_AEC_PK_MANUAL,
> -                             &ov5645->aec_pk_manual);
> +       ret = cci_read(ov5645->regmap, OV5645_AEC_PK_MANUAL,
> +                      &ov5645->aec_pk_manual, NULL);
>          if (ret < 0) {
>                  ret = -ENODEV;
>                  dev_err_probe(dev, ret, "could not read AEC/AGC mode\n");
>                  goto power_down;
>          }
>
> -       ret = ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG20,
> -                             &ov5645->timing_tc_reg20);
> +       ret = cci_read(ov5645->regmap, OV5645_TIMING_TC_REG20,
> +                      &ov5645->timing_tc_reg20, NULL);
>          if (ret < 0) {
>                  ret = -ENODEV;
>                  dev_err_probe(dev, ret, "could not read vflip value\n");
>                  goto power_down;
>          }
>
> -       ret = ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG21,
> -                             &ov5645->timing_tc_reg21);
> +       ret = cci_read(ov5645->regmap, OV5645_TIMING_TC_REG21,
> +                      &ov5645->timing_tc_reg21, NULL);
>          if (ret < 0) {
>                  ret = -ENODEV;
>                  dev_err_probe(dev, ret, "could not read hflip value\n");
> --
> 2.53.0
>

