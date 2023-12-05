Return-Path: <linux-media+bounces-1681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D5A8057B8
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 15:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1962281C83
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 14:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3313065EBD;
	Tue,  5 Dec 2023 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="x66sFntJ"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A563AF
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 06:47:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq6qkExbv7CFli/WTCfMlbRcP6Bn3DPLqcmZkGnl4PUjp2l2/zv3CdJJWggDYNoegIZp3gPbSchtPa3l9zeYkreezx1BXQEjAGOOPrYom7bcLYrv7/Sd15FKBARXZGkUGJb5OHG4WXcHHFj0PZ+SpXiUJEPMQ9KtPbbRjbxgs8BEzSwkVAFuhYFGuWLdvl6JA34iZu11mhS+7Iw7kX//7EgP8a/ijoxpKlupFM+0vTBNVS8xJ7G9e1fFoGwphI4wnXnTuScdmD5G4/d6MXtcecDY+k5EQ2QoakxB+BWEzMf3Ss4WO33ZUNcZnww3vswAuwdjxswMXlSNB5GjAgKcOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hiEEs+mPCN73WBZogz7t7jgi3fasi0BVuPxbFGTCO0=;
 b=Wry8CBzysIzjznvDaGXJafKwS13flU05Redz0KnKCj+Xcl0P437zsELYNfQHvT3ZV0t439/mqi/ZjD3cm1lZwMchufZA4atwpThovLKvnUEWuHt5HBvalhkl6tLp2QAESKvRE9dP9kOS7QolNR9+KhoLFKQvmXXeSH7XKBzEPFOZRQLswqFKl0PpDQpAZZoWXvQH51GSVtanwy13lF567f0tSu6tS6vFBEDAmHL3mWcr20keUNNp3G/J5tuNqrnheFq7mwTkyQ7wnLWr5/0Otl04G6Ao+iTNJ2TgyVo62rJjIrGfNpXS5gn9AJCDeivkB8kJWylEwApdBRNuQmdZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hiEEs+mPCN73WBZogz7t7jgi3fasi0BVuPxbFGTCO0=;
 b=x66sFntJo61cDc2xsEMiGPCONAGm6ilPjCqs6pF6vbMUiqpJETAh74OEvJWkUDFCVrcEtrd+SUqmjrFLyNbqXW6daXAoi0LODaKTAiOGsGfNlg+9WAcdZLny7PTdVtXZjZMo2euINzrbfXhp5dEujQjrpRIvK+TBnTPAgVS1P4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by DU0PR08MB9583.eurprd08.prod.outlook.com (2603:10a6:10:449::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 14:47:18 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::8ca3:f021:1c:4a4f]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::8ca3:f021:1c:4a4f%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 14:47:18 +0000
Message-ID: <e14a0d97-7a99-4ad6-8938-3e0025437ed6@wolfvision.net>
Date: Tue, 5 Dec 2023 15:47:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: i2c: imx415: Add more supported modes
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
References: <20231205090557.298680-1-alexander.stein@ew.tq-group.com>
 <20231205090557.298680-4-alexander.stein@ew.tq-group.com>
 <20231205104509.GB17394@pendragon.ideasonboard.com>
 <12337827.O9o76ZdvQC@steina-w>
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <12337827.O9o76ZdvQC@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::47) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|DU0PR08MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: be50f3ea-4441-4f67-7d0c-08dbf5a11443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qmGxRs9nLBQxIQfR9FLeFFTwKegtcPb302jVzNPLL7Me+hZFun00Ssyzq0+WqJhTKL6YVP8JZtzlWPlKTR6l3ZKHW8Mx5yme+3+ppGXg34z3o/QxPZa69QjGy27KRS8QGPs1ZabaC35+1zfunNdkCXRyFU6vBlD2th1qVDKzCExwZX6t+Y+GrJUqRCUUsLXKHpp6OLqETq1kZMigY2N0jYGI9dMOcli4PFdTJWq8EPcJG5fl5CYYSPVPLvGaOsABqqiLwkX9gqzAbiGcytpRUSBwwDuPMDBFNxLu/bi2QvOmVBmWJAaRn2VeliLmETHN37JPD6rc9uokX2zmgrSdoGl/NfU6NSRDqoPkl8Cs0KzNXnQFUCDvD7Yt7odzwvmIb2ZROoPrTCrYkBKhzn/+D7iUY4bSsIOo4n4BJpqY3ipUaJ408FA25vIk1miWmBKLugIDvurcfplJDtaZtGMm82Dqlq9da0JqXeZxnXSger6nmcvjfpruTqfPBuAYiKRv85mqO7Gt+cbKUBaxYRCM3WExNL50Gp0Lv6BsiaLyW/XVlQggGEoxIAAXJt9zXyEEVyBKNXDmTtolmivXpgEcfj83E2zVBGvTvzdBvbZbC5jkp0NhNsNdXIC8BbidXw5N6uQHyfBkYMurDz08Z3lDFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4544.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(346002)(366004)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(478600001)(6512007)(6666004)(2616005)(8936002)(8676002)(4326008)(66556008)(66946007)(66476007)(38100700002)(110136005)(54906003)(31686004)(316002)(26005)(83380400001)(6486002)(6506007)(36916002)(44832011)(31696002)(2906002)(5660300002)(30864003)(41300700001)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3YrYnFuOHZZVHZVaE5mQWE1UThncEtmTVRZdkdDM3JJdTdjak43Y2EwVDBE?=
 =?utf-8?B?UTNIcUU4R21nek5qMW9nSFIrNEpSYWlGaUkyRW0xejRkeGE5Q2p5QTN5VVZH?=
 =?utf-8?B?NXh2bGluSDFnWmRJbkh6d1I4YmFBQkt0UmlNVVlkWlZ0RW56M1B0L3FFNVJ6?=
 =?utf-8?B?amJNeXZtTU84QllnSmtQbVRUbU51aTBTTy9OKy9oUTcyblN6ZGh0ZUtoNnY2?=
 =?utf-8?B?aFMycGlwcEovZi8vVk9DNXRmM3BEWXFmZzhZWTgwTmtWazBIN3oxNDJCUlBQ?=
 =?utf-8?B?azlhWE9FRzgwQmREb2JKRWtRS1VhRTNJamJLWGJlQzhHRzhDNWFSQ1VobStZ?=
 =?utf-8?B?Umc0bmJKK2NEUWFlenMvMzlISUV0N2w2ZlY0UkF1VUVCa01XYzVvaEo3eUt6?=
 =?utf-8?B?SWorMGpwdGtjRW15eUVHSkxWb3ZUalVUbWNULzJFRk03d2xyc21tQ3FFTG0r?=
 =?utf-8?B?bUN6dmlYdzJJdWhpTjdBL1p0eXNVUm5QeFN5ekY0MmlhdlE5VFBIOUY2R1pX?=
 =?utf-8?B?R3llUmRGRG4xS1FCWCtjU3ZFL3RYNHgvWmN3UmVFRlMzckp1dGZWNEN2Z3Zq?=
 =?utf-8?B?eGpNM3pPNmZPL3RNQmd4VzhoOWx2NGlqNWlSUVFwKy9CVnYvWThyRTZpTGRL?=
 =?utf-8?B?bnlrWVJaWkdpb0tBSVA0dURwN2FLU3dvdm45YUNqU1d2VVQvVVdVY2U3SDR6?=
 =?utf-8?B?bkp4WUZpL1FrcDVpQjhWY0F6Z0J6VmhLZjJiQncyTWc1cm1BRjBNcW4rdWJ0?=
 =?utf-8?B?STFLbkFZUDh0SmN0TnlNZDV2blY1T2cvRTIzdGRDME41Y0Nxd1Q4WG1za0pi?=
 =?utf-8?B?bmVsTmRURW9DNlBpQmlkMkt0S3AyOVlaajArN1JLSWROWlEzZDZCSVBCY2hP?=
 =?utf-8?B?cU5zZ00xQkVJT2UvWUNmdktHK3FzM3oveVc3bEZ1MzBHMkFJZ1V3cHRlOWhR?=
 =?utf-8?B?MFkzVWpkUWV0L2NkaWVRSHFxcit6OEszdXdSSTRldkJlbHdZWUE4bzlyNWNH?=
 =?utf-8?B?cnRMWmNiNHZTSEdhdExFVXhuc2lQNm1kNDBXZFpOaG5nYUJzaUxpY0YzMGdl?=
 =?utf-8?B?M1pjRmNNeUloU3NuN0xqWC9QVGc2WmdaOE9ZdjhocGhVQnZXVkx4TWZqbTdL?=
 =?utf-8?B?RC9oT1Z6bTI1SE45STk3eUsxUnZhSmxScVd6cU1YTUt1a3B2WkhhamtYZ253?=
 =?utf-8?B?Vng2c0w5VmI0KzBDclZxc2hDa2ZWNTBSVEtITjUzdE9ha2UvYXJqanFuTElx?=
 =?utf-8?B?NUtmWUFsWFF6T3JlcXpCbjZtTURPNWF1SlRjSndjMzVxZlJySzFQZUN0Zlg1?=
 =?utf-8?B?bitrMlFFclQvSnRoTk5NeVQ0RHdNUFhoNXd3VHFEWVZaYzEyaGlLN0l1SS9j?=
 =?utf-8?B?dk05VzVza0wzZWpiTm9oazlkWm9vQWh4a0NSaURWT1QrVU81MEpSeFdlWGNP?=
 =?utf-8?B?V2Y2VVVKakRMckE1NmlKN2J6YzFYb3NiYkFjOFZjT0E0WWdJQ0R3UldwK1VC?=
 =?utf-8?B?ZmpnWFRJNjErN3M5NSt3WkJ0U2ZCR2kxUkswLzcwdDM2NXg4MGR4T0k5NWxZ?=
 =?utf-8?B?N01lbzFkQ05jVVZFNzhZaU5MWWdLRzhyT0NIQjlhRGpYMDllOXV3K3BRcW5Q?=
 =?utf-8?B?cFFqOCtNYVpuYWVUaXJ2NHRFUTFIZ2RtLzNBOE9kY2NKaUpUQ1kzcGlzdzhU?=
 =?utf-8?B?LzNKUEgyMU9TTDY0b1JMZUFmRnVlZVhtNVd5ak5tQzFSbVBUaFJKWUl1dzVC?=
 =?utf-8?B?eENmeHpzejN4RlVwSmJrbXRGWnBLMXg1aHBkT1gzQWloY25kYTVzM25HZWZx?=
 =?utf-8?B?L3pXdmNZY0poazdLUmhHZVpRdkdWZU91dzVMWm13c3dzMFRHMm5xM2xiZGJZ?=
 =?utf-8?B?U3VvekV0TWpXSGhpWXd0NFFLTkJlOFFCQ1RJZVhEQjFyNEE4NE9sVlBpVFFz?=
 =?utf-8?B?YXZsZFFMZHlwb1EzQTEwSDY2ejB2aHJKSU1sQStXQmU4TmcyOFVoVFprTXhv?=
 =?utf-8?B?R1VWSVRKb2ZJZzg3QmlzTzRrbjV6SFk1dGI2Qk1uOVBYUlB0OXg3WFp3NmFP?=
 =?utf-8?B?T25vemVRWmplcDZvRFVJL3hScVluTjNEZ0FMaC9pK2o0WlppemJJZm1hY3Fq?=
 =?utf-8?B?YWExRVBsMytSY2Jkd0kzNFJTSUNvVTZNTm84cFBRMkM0L010ZnQ2c2RmUlFP?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: be50f3ea-4441-4f67-7d0c-08dbf5a11443
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 14:47:18.3364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFbQe44nnD2sYgXUn0DWQRvT0PVUHFTgpd8YKJKLahjV9Dyjjp8Z7PLk0ugm1XYwMyeAWurmC4UoxmTu+Z3061dKrlzyqRkrIWKYRRaqG5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9583

Hi Alexander,

thanks for updating this driver.

Am 05.12.2023 um 12:12 schrieb Alexander Stein:
> Hi Laurent,
> 
> Am Dienstag, 5. Dezember 2023, 11:45:09 CET schrieb Laurent Pinchart:
>> Hi Alexander,
>>
>> Thank you for the patch.
>>
>> On Tue, Dec 05, 2023 at 10:05:57AM +0100, Alexander Stein wrote:
>>> These modes are listed in section "All-pixel mode" of the datasheet
>>> IMX415-AAQR-C (Rev. E19504, 2019/05/21).
>>> hmax_pix and pixel_rate are taken from the comment above the mode list.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>>
>>>  drivers/media/i2c/imx415.c | 362 +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 362 insertions(+)
>>>
>>> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
>>> index a222b9134aa2..48b8ae6d790d 100644
>>> --- a/drivers/media/i2c/imx415.c
>>> +++ b/drivers/media/i2c/imx415.c
>>> @@ -445,6 +445,38 @@ static const struct imx415_clk_params
>>> imx415_clk_params[] = {> 
>>>  	},
>>>  
>>>  };
>>>
>>> +/* all-pixel 2-lane 594 Mbps 10 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_2_594[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x0CE4 },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
>>> +	{ IMX415_TCLKPOST, 0x0067 },
>>> +	{ IMX415_TCLKPREPARE, 0x0027 },
>>> +	{ IMX415_TCLKTRAIL, 0x0027 },
>>> +	{ IMX415_TCLKZERO, 0x00B7 },
>>> +	{ IMX415_THSPREPARE, 0x002F },
>>> +	{ IMX415_THSZERO, 0x004F },
>>> +	{ IMX415_THSTRAIL, 0x002F },
>>> +	{ IMX415_THSEXIT, 0x0047 },
>>> +	{ IMX415_TLPX, 0x0027 },
>>> +};
>>> +
>>> +/* all-pixel 2-lane 891 Mbps 15 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_2_891[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x0898 },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
>>> +	{ IMX415_TCLKPOST, 0x007F },
>>> +	{ IMX415_TCLKPREPARE, 0x0037 },
>>> +	{ IMX415_TCLKTRAIL, 0x0037 },
>>> +	{ IMX415_TCLKZERO, 0x00F7 },
>>> +	{ IMX415_THSPREPARE, 0x003F },
>>> +	{ IMX415_THSZERO, 0x006F },
>>> +	{ IMX415_THSTRAIL, 0x003F },
>>> +	{ IMX415_THSEXIT, 0x005F },
>>> +	{ IMX415_TLPX, 0x002F },
>>> +};
>>> +
>>>
>>>  /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
>>>  static const struct cci_reg_sequence imx415_mode_2_720[] = {
>>>  
>>>  	{ IMX415_VMAX, 0x08CA },
>>>
>>> @@ -461,6 +493,38 @@ static const struct cci_reg_sequence
>>> imx415_mode_2_720[] = {> 
>>>  	{ IMX415_TLPX, 0x0027 },
>>>  
>>>  };
>>>
>>> +/* all-pixel 2-lane 1782 Mbps 30 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_2_1782[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x044C },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
>>> +	{ IMX415_TCLKPOST, 0x00B7 },
>>> +	{ IMX415_TCLKPREPARE, 0x0067 },
>>> +	{ IMX415_TCLKTRAIL, 0x006F },
>>> +	{ IMX415_TCLKZERO, 0x01DF },
>>> +	{ IMX415_THSPREPARE, 0x006F },
>>> +	{ IMX415_THSZERO, 0x00CF },
>>> +	{ IMX415_THSTRAIL, 0x006F },
>>> +	{ IMX415_THSEXIT, 0x00B7 },
>>> +	{ IMX415_TLPX, 0x005F },
>>> +};
>>> +
>>> +/* all-pixel 2-lane 2079 Mbps 30 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_2_2079[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x044C },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
>>> +	{ IMX415_TCLKPOST, 0x00D7 },
>>> +	{ IMX415_TCLKPREPARE, 0x007F },
>>> +	{ IMX415_TCLKTRAIL, 0x007F },
>>> +	{ IMX415_TCLKZERO, 0x0237 },
>>> +	{ IMX415_THSPREPARE, 0x0087 },
>>> +	{ IMX415_THSZERO, 0x00EF },
>>> +	{ IMX415_THSTRAIL, 0x0087 },
>>> +	{ IMX415_THSEXIT, 0x00DF },
>>> +	{ IMX415_TLPX, 0x006F },
>>> +};
>>> +
>>>
>>>  /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
>>>  static const struct cci_reg_sequence imx415_mode_2_1440[] = {
>>>  
>>>  	{ IMX415_VMAX, 0x08CA },
>>>
>>> @@ -477,6 +541,70 @@ static const struct cci_reg_sequence
>>> imx415_mode_2_1440[] = {> 
>>>  	{ IMX415_TLPX, 0x004F },
>>>  
>>>  };
>>>
>>> +/* all-pixel 4-lane 594 Mbps 20 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_4_594_20fps[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x0672 },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
>>> +	{ IMX415_TCLKPOST, 0x0067 },
>>> +	{ IMX415_TCLKPREPARE, 0x0027 },
>>> +	{ IMX415_TCLKTRAIL, 0x0027 },
>>> +	{ IMX415_TCLKZERO, 0x00B7 },
>>> +	{ IMX415_THSPREPARE, 0x002F },
>>> +	{ IMX415_THSZERO, 0x004F },
>>> +	{ IMX415_THSTRAIL, 0x002F },
>>> +	{ IMX415_THSEXIT, 0x0047 },
>>> +	{ IMX415_TLPX, 0x0027 },
>>> +};
>>> +
>>> +/* all-pixel 4-lane 594 Mbps 25 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_4_594_25fps[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x0528 },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
>>> +	{ IMX415_TCLKPOST, 0x0067 },
>>> +	{ IMX415_TCLKPREPARE, 0x0027 },
>>> +	{ IMX415_TCLKTRAIL, 0x0027 },
>>> +	{ IMX415_TCLKZERO, 0x00B7 },
>>> +	{ IMX415_THSPREPARE, 0x002F },
>>> +	{ IMX415_THSZERO, 0x004F },
>>> +	{ IMX415_THSTRAIL, 0x002F },
>>> +	{ IMX415_THSEXIT, 0x0047 },
>>> +	{ IMX415_TLPX, 0x0027 },
>>> +};
>>> +
>>> +/* all-pixel 4-lane 720 Mbps 25 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_4_720_25fps[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x0500 },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
>>> +	{ IMX415_TCLKPOST, 0x006F },
>>> +	{ IMX415_TCLKPREPARE, 0x002F },
>>> +	{ IMX415_TCLKTRAIL, 0x002F },
>>> +	{ IMX415_TCLKZERO, 0x00BF },
>>> +	{ IMX415_THSPREPARE, 0x002F },
>>> +	{ IMX415_THSZERO, 0x0057 },
>>> +	{ IMX415_THSTRAIL, 0x002F },
>>> +	{ IMX415_THSEXIT, 0x004F },
>>> +	{ IMX415_TLPX, 0x0027 },
>>> +};
>>> +
>>> +/* all-pixel 4-lane 720 Mbps 30.01 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_4_720_30fps[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x042A },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
>>> +	{ IMX415_TCLKPOST, 0x006F },
>>> +	{ IMX415_TCLKPREPARE, 0x002F },
>>> +	{ IMX415_TCLKTRAIL, 0x002F },
>>> +	{ IMX415_TCLKZERO, 0x00BF },
>>> +	{ IMX415_THSPREPARE, 0x002F },
>>> +	{ IMX415_THSZERO, 0x0057 },
>>> +	{ IMX415_THSTRAIL, 0x002F },
>>> +	{ IMX415_THSEXIT, 0x004F },
>>> +	{ IMX415_TLPX, 0x0027 },
>>> +};
>>> +
>>>
>>>  /* all-pixel 4-lane 891 Mbps 30 Hz mode */
>>>  static const struct cci_reg_sequence imx415_mode_4_891[] = {
>>>  
>>>  	{ IMX415_VMAX, 0x08CA },
>>>
>>> @@ -493,6 +621,102 @@ static const struct cci_reg_sequence
>>> imx415_mode_4_891[] = {> 
>>>  	{ IMX415_TLPX, 0x002F },
>>>  
>>>  };
>>>
>>> +/* all-pixel 4-lane 1440 Mbps 30.01 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_4_1440_30fps[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x042A },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
>>> +	{ IMX415_TCLKPOST, 0x009F },
>>> +	{ IMX415_TCLKPREPARE, 0x0057 },
>>> +	{ IMX415_TCLKTRAIL, 0x0057 },
>>> +	{ IMX415_TCLKZERO, 0x0187 },
>>> +	{ IMX415_THSPREPARE, 0x005F },
>>> +	{ IMX415_THSZERO, 0x00A7 },
>>> +	{ IMX415_THSTRAIL, 0x005F },
>>> +	{ IMX415_THSEXIT, 0x0097 },
>>> +	{ IMX415_TLPX, 0x004F },
>>> +};
>>> +
>>> +/* all-pixel 4-lane 1440 Mbps 60.03 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_4_1440_60fps[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x0215 },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
>>> +	{ IMX415_TCLKPOST, 0x009F },
>>> +	{ IMX415_TCLKPREPARE, 0x0057 },
>>> +	{ IMX415_TCLKTRAIL, 0x0057 },
>>> +	{ IMX415_TCLKZERO, 0x0187 },
>>> +	{ IMX415_THSPREPARE, 0x005F },
>>> +	{ IMX415_THSZERO, 0x00A7 },
>>> +	{ IMX415_THSTRAIL, 0x005F },
>>> +	{ IMX415_THSEXIT, 0x0097 },
>>> +	{ IMX415_TLPX, 0x004F },
>>> +};
>>> +
>>> +/* all-pixel 4-lane 1485 Mbps 60 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_4_1485[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x0226 },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
>>> +	{ IMX415_TCLKPOST, 0x00A7 },
>>> +	{ IMX415_TCLKPREPARE, 0x0057 },
>>> +	{ IMX415_TCLKTRAIL, 0x005F },
>>> +	{ IMX415_TCLKZERO, 0x0197 },
>>> +	{ IMX415_THSPREPARE, 0x005F },
>>> +	{ IMX415_THSZERO, 0x00AF },
>>> +	{ IMX415_THSTRAIL, 0x005F },
>>> +	{ IMX415_THSEXIT, 0x009F },
>>> +	{ IMX415_TLPX, 0x004F },
>>> +};
>>> +
>>> +/* all-pixel 4-lane 1782 Mbps 60 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_4_1782[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x0226 },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
>>> +	{ IMX415_TCLKPOST, 0x00B7 },
>>> +	{ IMX415_TCLKPREPARE, 0x0067 },
>>> +	{ IMX415_TCLKTRAIL, 0x006F },
>>> +	{ IMX415_TCLKZERO, 0x01DF },
>>> +	{ IMX415_THSPREPARE, 0x006F },
>>> +	{ IMX415_THSZERO, 0x00CF },
>>> +	{ IMX415_THSTRAIL, 0x006F },
>>> +	{ IMX415_THSEXIT, 0x00B7 },
>>> +	{ IMX415_TLPX, 0x005F },
>>> +};
>>> +
>>> +/* all-pixel 4-lane 2079 Mbps 60 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_4_2079[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x0226 },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
>>> +	{ IMX415_TCLKPOST, 0x00D7 },
>>> +	{ IMX415_TCLKPREPARE, 0x007F },
>>> +	{ IMX415_TCLKTRAIL, 0x007F },
>>> +	{ IMX415_TCLKZERO, 0x0237 },
>>> +	{ IMX415_THSPREPARE, 0x0087 },
>>> +	{ IMX415_THSZERO, 0x00EF },
>>> +	{ IMX415_THSTRAIL, 0x0087 },
>>> +	{ IMX415_THSEXIT, 0x00DF },
>>> +	{ IMX415_TLPX, 0x006F },
>>> +};
>>> +
>>> +/* all-pixel 4-lane 2376 Mbps 60 Hz mode */
>>> +static const struct cci_reg_sequence imx415_mode_4_2376[] = {
>>> +	{ IMX415_VMAX, 0x08CA },
>>> +	{ IMX415_HMAX, 0x016E },
>>> +	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
>>> +	{ IMX415_TCLKPOST, 0x00E7 },
>>> +	{ IMX415_TCLKPREPARE, 0x008F },
>>> +	{ IMX415_TCLKTRAIL, 0x008F },
>>> +	{ IMX415_TCLKZERO, 0x027F },
>>> +	{ IMX415_THSPREPARE, 0x0097 },
>>> +	{ IMX415_THSZERO, 0x010F },
>>> +	{ IMX415_THSTRAIL, 0x0097 },
>>> +	{ IMX415_THSEXIT, 0x00F7 },
>>> +	{ IMX415_TLPX, 0x007F },
>>> +};
>>> +
>>>
>>>  struct imx415_mode_reg_list {
>>>  
>>>  	u32 num_of_regs;
>>>  	const struct cci_reg_sequence *regs;
>>>
>>> @@ -536,6 +760,26 @@ struct imx415_mode {
>>>
>>>  /* mode configs */
>>>  static const struct imx415_mode supported_modes[] = {
>>>
>>> +	{
>>> +		.lane_rate = 594000000,
>>> +		.lanes = 2,
>>> +		.hmax_pix = 4400,
>>> +		.pixel_rate = 99000000,
>>> +		.reg_list = {
>>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_594),
>>> +			.regs = imx415_mode_2_594,
>>> +		},
>>> +	},
>>> +	{
>>> +		.lane_rate = 891000000,
>>> +		.lanes = 2,
>>> +		.hmax_pix = 4400,
>>> +		.pixel_rate = 148500000,
>>> +		.reg_list = {
>>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_891),
>>> +			.regs = imx415_mode_2_891,
>>> +		},
>>> +	},
>>>
>>>  	{
>>>  	
>>>  		.lane_rate = 720000000,
>>>  		.lanes = 2,
>>>
>>> @@ -547,6 +791,24 @@ static const struct imx415_mode supported_modes[] = {
>>>
>>>  		},
>>>  	
>>>  	},
>>>  	{
>>>
>>> +		.lane_rate = 1782000000,
>>> +		.lanes = 2,
>>> +		.hmax_pix = 4400,
>>> +		.pixel_rate = 297000000,
>>> +		.reg_list = {
>>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_1782),
>>> +			.regs = imx415_mode_2_1782,
>>> +		},
>>> +	},	{
>>> +		.lane_rate = 2079000000,
>>> +		.lanes = 2,
>>> +		.hmax_pix = 4400,
>>> +		.pixel_rate = 304615385,
>>> +		.reg_list = {
>>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_2_2079),
>>> +			.regs = imx415_mode_2_2079,
>>> +		},
>>> +	},	{
>>>
>>>  		.lane_rate = 1440000000,
>>>  		.lanes = 2,
>>>  		.hmax_pix = 4510,
>>>
>>> @@ -556,6 +818,46 @@ static const struct imx415_mode supported_modes[] = {
>>>
>>>  			.regs = imx415_mode_2_1440,
>>>  		
>>>  		},
>>>  	
>>>  	},
>>>
>>> +	{
>>> +		.lane_rate = 594000000,
>>> +		.lanes = 4,
>>> +		.hmax_pix = 5500,
>>> +		.pixel_rate = 247500000,
>>> +		.reg_list = {
>>> +			.num_of_regs = 
> ARRAY_SIZE(imx415_mode_4_594_20fps),
>>> +			.regs = imx415_mode_4_594_20fps,
>>> +		},
>>> +	},
>>> +	{
>>> +		.lane_rate = 594000000,
>>> +		.lanes = 4,
>>
>> The mode is selected from the number of data lanes and the lane rate.
>> They're the same as the previous entry, so this entry will never be
>> selected. Same below.
> 
> I noticed that as well. The datasheet lists different FPS for the same link 
> frequency / lane combination, only HMAX being different. Right now HMAX/VMAX 
> is fixed, so is FPS.
> I am aware there is no way to select between these modes, but I added them for 
> completeness.
> 
> Best regards
> Alexander
> 

I'd prefer to only add common and tested modes. We have to keep in mind
that in future we may want to add more features as 12 bit support or
HDR. Adding all modes could make this more complex.

Regards,
Gerald

>>
>>> +		.hmax_pix = 4400,
>>> +		.pixel_rate = 247500000,
>>> +		.reg_list = {
>>> +			.num_of_regs = 
> ARRAY_SIZE(imx415_mode_4_594_25fps),
>>> +			.regs = imx415_mode_4_594_25fps,
>>> +		},
>>> +	},
>>> +	{
>>> +		.lane_rate = 720000000,
>>> +		.lanes = 4,
>>> +		.hmax_pix = 4400,
>>> +		.pixel_rate = 247500000,
>>> +		.reg_list = {
>>> +			.num_of_regs = 
> ARRAY_SIZE(imx415_mode_4_720_25fps),
>>> +			.regs = imx415_mode_4_720_25fps,
>>> +		},
>>> +	},
>>> +	{
>>> +		.lane_rate = 720000000,
>>> +		.lanes = 4,
>>> +		.hmax_pix = 4510,
>>> +		.pixel_rate = 304615385,
>>> +		.reg_list = {
>>> +			.num_of_regs = 
> ARRAY_SIZE(imx415_mode_4_720_30fps),
>>> +			.regs = imx415_mode_4_720_30fps,
>>> +		},
>>> +	},
>>>
>>>  	{
>>>  	
>>>  		.lane_rate = 891000000,
>>>  		.lanes = 4,
>>>
>>> @@ -566,6 +868,66 @@ static const struct imx415_mode supported_modes[] = {
>>>
>>>  			.regs = imx415_mode_4_891,
>>>  		
>>>  		},
>>>  	
>>>  	},
>>>
>>> +	{
>>> +		.lane_rate = 1440000000,
>>> +		.lanes = 4,
>>> +		.hmax_pix = 4510,
>>> +		.pixel_rate = 304615385,
>>> +		.reg_list = {
>>> +			.num_of_regs = 
> ARRAY_SIZE(imx415_mode_4_1440_30fps),
>>> +			.regs = imx415_mode_4_1440_30fps,
>>> +		},
>>> +	},
>>> +	{
>>> +		.lane_rate = 1440000000,
>>> +		.lanes = 4,
>>> +		.hmax_pix = 4510,
>>> +		.pixel_rate = 609230769,
>>> +		.reg_list = {
>>> +			.num_of_regs = 
> ARRAY_SIZE(imx415_mode_4_1440_60fps),
>>> +			.regs = imx415_mode_4_1440_60fps,
>>> +		},
>>> +	},
>>> +	{
>>> +		.lane_rate = 1485000000,
>>> +		.lanes = 4,
>>> +		.hmax_pix = 4400,
>>> +		.pixel_rate = 594000000,
>>> +		.reg_list = {
>>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1485),
>>> +			.regs = imx415_mode_4_1485,
>>> +		},
>>> +	},
>>> +	{
>>> +		.lane_rate = 1782000000,
>>> +		.lanes = 4,
>>> +		.hmax_pix = 4400,
>>> +		.pixel_rate = 594000000,
>>> +		.reg_list = {
>>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_1782),
>>> +			.regs = imx415_mode_4_1782,
>>> +		},
>>> +	},
>>> +	{
>>> +		.lane_rate = 2079000000,
>>> +		.lanes = 4,
>>> +		.hmax_pix = 4400,
>>> +		.pixel_rate = 594000000,
>>> +		.reg_list = {
>>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_2079),
>>> +			.regs = imx415_mode_4_2079,
>>> +		},
>>> +	},
>>> +	{
>>> +		.lane_rate = 12376000000,
>>> +		.lanes = 4,
>>> +		.hmax_pix = 4392,
>>> +		.pixel_rate = 891000000,
>>> +		.reg_list = {
>>> +			.num_of_regs = ARRAY_SIZE(imx415_mode_4_2376),
>>> +			.regs = imx415_mode_4_2376,
>>> +		},
>>> +	},
>>>
>>>  };
>>>  
>>>  static const char *const imx415_test_pattern_menu[] = {
> 
> 

