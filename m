Return-Path: <linux-media+bounces-3784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 457C783013B
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 09:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 116FEB24A96
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 08:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10F8EAD8;
	Wed, 17 Jan 2024 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="Ti1qCZcD"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E99F11CAE
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705479932; cv=fail; b=UzmRW1vAt4QHL8AYwcuToFZSBHOZvE1D/NZGB14cFictWLlce0n/ydOwjKoDp+uYIBGiyow936KQlBIkV7qpitQkCVsAbD14kHApdDhEVIECDHgq/rPQNwM4dZHtYJGUQ06fT1+no8NGiLmrFJHP2dnasQJDd29hRC7zbeFB51Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705479932; c=relaxed/simple;
	bh=7RvKAPtqLV47Q2xjrI9s8snTA7EdJ+ADei2YEJEF/oA=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:Message-ID:Date:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped; b=EH0en76eJsnhQReW60YMgphda/HFca0Uy+4OkHeL/2wDktdHk0w2uYVsxTJP3ZLH+wzPf17ZpxGGH+NzOHZY9t6Zc4n0Zs5SlxAbpwo5ZMP8D2Iz3lOI+SSaCvkdgCQ5XaKApVNISNX8w6g0nibYzQDxKSfjwGOPTjVc6c+yxOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=Ti1qCZcD; arc=fail smtp.client-ip=40.107.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nh6pGkxqTc3egyJg8zDVJw4Knvnlox5QfjGcwVHNCn28m0xoPNxq9RBXb5Rj+iOT3nVI9JygdDk5Xd45+YiSabhAInO0ZQRmgs2LgFQpBVOjLcFzlcQw6oxOSzNGf/+jYYAIYgpAkW1G4yO77SUaLbTS8oA86OLAQPgzBf4TLgGHHIUXWG4Sksf+X/DPH8KNFSStEoEGPzp9BoVUchSyefHhJ3k5nfKKegw7ZJdP4AkelActMuAPkd83EVIrFjEU1etaHTroDlxffGgPIiSZVVe8VtuVjMiXXRPlucUvJmm8g89mnl+n2+CqUpc/g9i+HlPzFFlJJEEDp45G7b0r6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2qC0Wka6cT2/JCmEfRtm+x17I+oFWAczUcsYMgjBdY=;
 b=a2Z17nMfSRnDtzDjkqMphckrUy6r24DwI7hbBplWsEIjcMnmspPdkMm47YsUBPF1BuZc58Hfs4atg4DoiFXjfa3RM+y2l6c5i2gi0lrHTicwlnMy5gDWiYLd0nAb2RAu2xMEt54QGmgvk/uNVglIUWj3Q4memqWrFXJ0sHQvA5OCSwdkbcczjrMJqKG/2afk1CHGYXjQchErNm+/U7wgyXUs52kSuxYquw9xIMpNQ1C50pRI2cgZiJ/ELPFlv5jE6UCADXDP8W1C5u6LSo7l0nhv3t0xAYpg3gkLPYQ4z6feDzZhEV2ueTM/JtDcR55eq5IJdg3Fx17WgrfpD3vwOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2qC0Wka6cT2/JCmEfRtm+x17I+oFWAczUcsYMgjBdY=;
 b=Ti1qCZcDW/OQW7Gv/kYHYtskW9iEIa8kECxM9XaCWDUuNfFBTjO19a1kxKwa33ZPohDgFyB7krLMNYivHf7m4C6A3P5uyW1y92NDwCmQznz0XZIVkXaxevtUFZYxkSVt+w1XlT92ZjpCCJDpBW058yrUxkBEPoOPbiESH4M87hI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB4PR08MB8198.eurprd08.prod.outlook.com (2603:10a6:10:382::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 08:25:26 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::c9d:3887:1410:2704]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::c9d:3887:1410:2704%6]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 08:25:26 +0000
Message-ID: <cedd7707-de3b-4cda-8407-9a93f6145770@wolfvision.net>
Date: Wed, 17 Jan 2024 09:25:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] media: imx415: Add more clock configurations
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: linux-media@vger.kernel.org
References: <20240117073936.2812336-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240117073936.2812336-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0155.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::39) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB4PR08MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: d6465814-74e4-4f1f-9642-08dc1735db36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X6Dln6GpWLTV58IZ0WO6R+2hD4VxAH3mVufzEYuFRC43wM0QhvgbEiCK8XNo/nP6JzuBVADvJzVKRkFaO9xEh8dJWSGSiIHjNjQHNFDLBjk7/rF3loSf7FShlKM9CsAjYOt+jQle93jllnB3Z+RlDkNvxn7IOsGZ/QIOu7oHF5r7N5VBGZnXd8M48VOEsC3ZahfFsHLO8MAVIpMZ8/7SfpxkmNISPtd221nLcbgLRRGIlyJ8+OWG4rrNm7HasGevB//ZMPil3V58FmvD4HNcVUgKTXWOV/VkvHIyNDSgWH0PkX1/2JCoOZ2MDtQE4W+WrxIdfDYYbJCAYSoGR2C/Kj3zzEEH1unDV0CbR+Mky4a+rPvOIilmNQQvguMdn3iaTsIUnhmuZpKNN9p4WCK1/H+p2jOzOKZmJu4bcsP44glQOK0U0PsdLaQJfP+KmJaTsy7owSJSGq0O8mRIlpJOa/da5zHxPqocrfilqBJtWVv25G7XD7QK8w88bTp2b3bYw69GFFtqATzpODA79AtUbLVd1rQJYfcPG8Cdm3Oz4siTX2R/BsfFKxBaKIjMbDLsHYnAVFZoDhkexVWKR4KXuUEe9gM6hb6HL7m5jO2HTpdymSPeceCoIIwrkNK51YUtYzhlIRiSFQjJfNq+iL3waQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39840400004)(396003)(376002)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38100700002)(5660300002)(41300700001)(31696002)(86362001)(2906002)(36756003)(6512007)(6636002)(2616005)(110136005)(66476007)(316002)(66946007)(478600001)(66556008)(6486002)(6666004)(53546011)(6506007)(36916002)(83380400001)(44832011)(8676002)(4326008)(8936002)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHF2RWZucFFudTVXVXJjRys3M0o0cjIwM2Fyc1BTbmVyT1ZibWF6UlVQUGhk?=
 =?utf-8?B?eCt1OFQ0cEhTaGhLaEpZREJJTm1aZWVvNis0bTNZZEZYVGJkcVVENlBEazVW?=
 =?utf-8?B?ajd5RDhqMzF6TmFSK0U3WDBFYU91bVpjcVY4R0xmSnhxekUwbE93Y3M4cVpV?=
 =?utf-8?B?TXgrZExtMUhJUUE3NE9sZXlUSHZQTTRudjVWdmtEWDVtTXh6NS8wdW11NGtX?=
 =?utf-8?B?clBJemo1eDNKdzQyaUpLaWw5OVNWS2hyeWlkRXdsR2hva0pheWdha3VLaTdH?=
 =?utf-8?B?K2lKQVJKMWJxY0NGZElWV2tIZ3VSUGg0NzBzRDNiZEJRNDVoM2hLWDVJSms5?=
 =?utf-8?B?VGVEajNCbWRmUlVRZ1E4VUUwOFFRTW5tN3JvOUl2RmF0U1ZXMG1kN1NOb2s2?=
 =?utf-8?B?YS9QY01iYXQwdE4xYlQ2MTk0Vkg5OE1uWnBPZGtHZ2NyUnRjWVdUUnJTR2s0?=
 =?utf-8?B?L2k0cXROSnk3RC9HSVBUb0Q4ZFMzMEF1VTBEQnhtMC9rc2k2WnNJZjdRbU1u?=
 =?utf-8?B?SkF0SnFQVmcvcXZzekw0cWhnYTRUSUwyUlpXV2E2R3VnSWcrdWJybFdocC9G?=
 =?utf-8?B?MFZHVnNncnB2eEhGaFFuZC9acTZlYXdYSFViVVFjY2RUMytPT3YzVzFOK2JR?=
 =?utf-8?B?Smt3RDVBc2lhRlQ5V3lCV3VRbGRaWlQ4OE1YS3ErQ1UxdW1SRFcwSm1qc1B2?=
 =?utf-8?B?aHQ3akRmSTRQL0RLTnNCeDFFbUdUQ0twbng2SGEweGxDSC9ITG5LYUpDc3hy?=
 =?utf-8?B?Y2ZDaHhBOG1UdUJvR2daYU1JcDZKdnFCc1h3dVZoVnN4bkFwMGdKbUNLdkRz?=
 =?utf-8?B?QXZJWWs1UmNBdmZINTRod3FGczZzRzJBOWxsQitzYi91LzhXb1djUUZndFpX?=
 =?utf-8?B?WDd2bFZyRUFNakNnMVZtTjJuSHlicFRCei9Qd1JhUVhMZ2JPbllQNno4cjRz?=
 =?utf-8?B?cldvK25rdHFpNVNMK1hERnM2dGY1WnJsN0J3Y2lVanN6YnlEQkdOTjZROEZJ?=
 =?utf-8?B?QVZvdEcxTDhWNk5QMzJnSWNPbmRjVjc0dTBCenNZcGpYdkFuaWtjUFRPV1Bm?=
 =?utf-8?B?czJCMmF3RDVsaStGejNEWXp6NWJkWjdhQWRKK0ZJVk9oNEw1K1FLN0o3OXFl?=
 =?utf-8?B?SEdILzh2bjIweG0xd1dDVWNYZ1ZoMUY0c2lscTBPeEZNV3d2eStaWUJkZ0t3?=
 =?utf-8?B?RFNCYThEekg4ZDZSR1MyZVZNS0VnUDVJNjZWWis4eWJFZUtnaUZCVTFHZ2Vz?=
 =?utf-8?B?eDJVVmxubUtpRk9EWjBHTW1lQWVHK0tPa2xFdng3Ykt5djRLeDhBYllZSUd4?=
 =?utf-8?B?Rk4rWmo2cC84eDFxcjdxUG9PRGhjUWZlemFySnhCOHVhNEF0TWxFZStUM3R0?=
 =?utf-8?B?ZmIrbFd6SE1TU1FxanpXNXdOYmo1VUE3L0wwT3Y3bm5yc3lKdWg2RHhKSlJI?=
 =?utf-8?B?eTZVcUxLWDd0a3Q2a2tmREQreE9mUnkxUVFjRWErVFhqaWdNQndsZVZ5UEd2?=
 =?utf-8?B?RVRLQTU5V3B0aHFCQzJPUnl5TnZZUXpYQUxwYzlNdGplVXkwc1ZaQ2pYZlNo?=
 =?utf-8?B?RjRSUERDUzlCc2FVNUZ5azVJOVdyd0FoNk54clJRZnJnWTN5VC82TTJKdFFX?=
 =?utf-8?B?WWp2TkVlU1c2bnZrdnRxMjBUOHJQYWVsMGdHVFBFZStJS2hRU2N5cWdZcmYz?=
 =?utf-8?B?Rnd6YVRWMjlQcTVlVG5yRVFKTmVJNVV2V2ViSWNBdFBoRTdOb0lSNXhmcENz?=
 =?utf-8?B?VzAxbmZ6Nkt1c1FyL1lZZGo0WE5HWS9qejROODB2cWZFRFc5ZG9sVVhIOHFn?=
 =?utf-8?B?ZWNTaHpKY0pCUnFYYS82RUYrYkFxdkpOakpYMkQ3L2xuVnZ2MWFGMmx5SkhQ?=
 =?utf-8?B?d3BMUW1KU05jSjBTMkZDT09ibU00QlBRQWhjNTBocXRVK0tNSUFWU3VKbVhD?=
 =?utf-8?B?Zlpna0VxVUZuTHRRZWMyZmgveVc5aFRGL0cvQTNKbG52WUJaZWdVTE9jZGdC?=
 =?utf-8?B?Y05KMXc4bnE3ZXl0UGtMUGlKYW5LOTMwUU1rQTFDZWE3d2g1Q2c2YmhqN0Fj?=
 =?utf-8?B?RW9mTUNwRGwvYWNJTG5nWUlUNVA2cjRzMTVRcWxqOGllRlVoVFBuTHhBaTVT?=
 =?utf-8?B?Rllib202VEM2MXhiNjRPMTRpOU4vNGh3MVRSdkpSUW9DSjFCYUVMdEVOZ0JI?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d6465814-74e4-4f1f-9642-08dc1735db36
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 08:25:25.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuCb+36RfUqN3W1kwkMqincMZSFQlFEvTDIwGMMrmocr8fctpxUhBTFp/WRtFXjLnWWST3LBPOxZEcrk9UdcjBx2+5CT4jO3IGZGzMMxdDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8198

Hi Alexander,

On 1/17/24 08:39, Alexander Stein wrote:
> Hi,
> 
> this small series converts the driver to using CCI helpers.
> On top of that more clock setups are added to the driver.
> These are all taken from the datasheet. I suspect they all can be calculated
> dynamically later on.
> Tested on TQMa8MPxL + MBa8MPxL + ISP + Vision Components IMX415 camera.
> 
> While working on the driver I notived that imx415 sets mbus code to
> MEDIA_BUS_FMT_SGBRG10_1X10, while imx290 uses MEDIA_BUS_FMT_SRGGB10_1X10.
> But the datasheets show the same color coding pattern. But both settings seem
> to be correct, e.g. the resulting image has correct colors.
> 
> I had to remove the identity check locally. I suspect that Vision Components
> interjects reading some registers.
> 
> Changes in v4:
> * Fixed reading chip ID
> * Collected Laurent's R-b
> 
> Changes in v3:
> * Lower case register definitions
> * Add missing variable initialization
> * Fix line lengths on several locations
> * Simplify imx415_s_ctrl()'s cci_write usage
> * Suffix lane_rate (u64) values by UL
> 
> Changes in v2:
> * Removed explicit selection of REGMAP_I2C
> * Dropped patch 3 for now. Mode selection shall be done by dynamic VMAX/HMAX
>   calculations later on
> 
> Best regards,
> Alexander
> 
> Alexander Stein (2):
>   media: i2c: imx415: Convert to new CCI register access helpers
>   media: i2c: imx415: Add more clock configurations
> 
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/imx415.c | 672 +++++++++++++++++++++++--------------
>  2 files changed, 430 insertions(+), 243 deletions(-)
> 

very nice! Haven't had a chance to test your series yet, but it LGTM.
For both patches

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>

Thanks and best regards,
Michael

