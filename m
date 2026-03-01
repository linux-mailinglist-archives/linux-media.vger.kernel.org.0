Return-Path: <linux-media+bounces-54000-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +su8C3veo2mGQgUAu9opvQ
	(envelope-from <linux-media+bounces-54000-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 07:36:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8001CEA3D
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 07:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB4CD301D043
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 06:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7011C549F;
	Sun,  1 Mar 2026 06:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="brBsIdVe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633D831354F;
	Sun,  1 Mar 2026 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772346992; cv=fail; b=Q+6+dCypiyffJmEpTXmQ7bXDt7kOL6QntY8GUG9m4E7Osf8qgU044rAPZzpwGYOBTo6xQJIA+snElex0ugTfjJnj9plHZitsMa5qckPnqc00akQihXWE3PNLdK5UKuGgJ0PMxSLr5i1VIsgYfSizdQXLWRi/Dn4/GuE9oV3lqeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772346992; c=relaxed/simple;
	bh=WrKYRJgYOH8xFAH/oxWN03RbuxLyBDxzR+ORCyCch58=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X837TAr32/fufNo0MR/Dr/ncitTfiYVJUg7m0JjKk7Z5euHSgmmohxJooSDD68zTGkTRkTo6xF2/q3mEWmxV+lQMGDxRJjv5HtCkUkzA667sGh/Y+02bKrzB7stLIiHp1Avw4z0hNQeoftDAO3dMsvP8DCwtnQ7HJSjPqlsuBSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=brBsIdVe; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6216UFD63418410;
	Sat, 28 Feb 2026 22:35:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=gJ35SEl0GK+jibPGVE0ysDYNq/TMvacIHeXjafT1zz8=; b=
	brBsIdVeZeYfhLYVi66tSx7aS1Zc6cWAHqYtQOUoN55hqJZNrxvUUi+8YfEO8y3F
	YuKq64kk0lssACljDCCVQ+weyC5Guc05CZD2tFIE49fDRhLM8R7QSBmrChvlKBZz
	hfzc9PtJKjp6hHTZ/Zuc1+zcn0p7if3MpsqDywVWctbbxHPJ4nrOWcOmS8nSxhyz
	1ZXpv9T3AMhIvweQlD7eisjABRKOkL4UmXDz3CzHJbnpkOZIqbVAnn+hGzzAa+0C
	pK2HPCUIEEZ/oFGNiTMKUv7tsQPPUHQlDXfUckoln3GJMzcTVDlhWKf+vRRH9ZBl
	G7pu7RIkwrXKgcC8PsB1AQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012048.outbound.protection.outlook.com [40.107.200.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rggsbh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 22:35:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swvYIpVsbf7WhoKTmoAYw4VTtx5f/6OiZDEv1jEN4bC3kG4HVuAmqkAbfjH40XpCUb9QPJVS0u4DGLMEWd3KXPpzFR2J0ebp6EiJ5MiJky51c5EE9UUMjAW8D39dx0ymj7rT9M9n8pjFv0jazc4VpvbUhO1A5bK+C0Rfx0lNjF/JnDB0NinVLNE4dgeDcWyVDIHCWWU+rzF2pxS98EBcladGKu7r+HLTkHvIrwYmOxO2P5Zw/EsIcPN5bGN7IpYW/16DE/qvEXQcS3tP1UeVTVSHZ98bL9YZ9kMaj+ns2ETVr9xzCelb+EdmNpC3MfHLqarzy/ACxKRQyGlAGHhIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJ35SEl0GK+jibPGVE0ysDYNq/TMvacIHeXjafT1zz8=;
 b=EQP2osvzbEaTwLokKgP4LOh03ORiiaNRSfuOlS2TcnNB36s0AZ+rX31EAzGNjk+Lu250WAnN5kSHWfI/9F7PNpfVeFRja0evRXLjWhQ6LLMLAaedP3imRw4lZGeo7xFEK60aUmbpKFC9ccCMZMblzGKYe6V9Yp/Sxo8Va2toVCA7CjigKZl2G8rZKtXTx8gekEZQwDdOcWL5ClZBf5XaJ+b9Ik6ylcV7ayuqaJseIQKc9jdFDgk2GzPeq3L568Z3z64wKI4xM7rAOtJLTaStYCRmeN+gZbBGdVWz7yrIxd31I+jvDyddMzYNyhWJ2DS/arSGAit4EXtEdo9y++IKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DS4PPF07B018B9F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Sun, 1 Mar
 2026 06:35:32 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 06:35:32 +0000
Message-ID: <9df76198-073d-4958-aafe-e01bf9511925@windriver.com>
Date: Sun, 1 Mar 2026 14:35:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: i2c: ov9282: Convert to CCI register access
 helpers
To: Tarang Raval <tarang.raval@siliconsignals.io>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
        "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "jai.luthra@ideasonboard.com" <jai.luthra@ideasonboard.com>,
        "richard.leitner@linux.dev" <richard.leitner@linux.dev>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260228083401.1007434-1-xiaolei.wang@windriver.com>
 <20260228083401.1007434-2-xiaolei.wang@windriver.com>
 <PN3P287MB18290DAB4344D5671227E6CD8B70A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <PN3P287MB18290DAB4344D5671227E6CD8B70A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DS4PPF07B018B9F:EE_
X-MS-Office365-Filtering-Correlation-Id: 392953f7-768a-4fbf-5943-08de775cbc8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	hemaEaSb8MtTcgB1l697B0qOt3azrewbr3WBs4lH3fhtsoXQCmeobEBNK0WrBMiZjy700rrAdUdT3r2xFDkNgbNzBx/uOQensMXtfNSknThOoSjhpT92M3ZYs2AijutR/Nga5s4F8+DKDev9rLiyDhf8Vil+I7miBPaKeyTUawRhWPXP8bsmoL5Sf5b3u3OrC+Pau9xrDRCRqoolGMECYYQAlCOePfha21J3oYFYGVgxKUMQ5Gp8MoR0ZoiTaRN9GcOK1W4O8TAQCOII7RvXtxT46awF9dNLVDg5sxV8VT49RIhUSpAyV8IiCQcFAPuls/O0Z5sgUdj3Z6VrblyadRDSAoHqAbGu0z/j2XiXzxu9stnmnZaIr7v04GwyTN5TqWmxv7Ed4meJ1Gi6rPLpwpAYCFGkJktVbalmFeQQbHumbSNFrSLnFMN24JPvMlxaSiBYy9xCLvxB5UWR6vCgqWJ/MUjXlEdbDOj0qQAwubapGxzuAr/zXbHQM/VD984dG3ZFU+PDMn/t+tN1jvc9ISRNBLDJmVuMMudOmqc3ihtnS0BHdA/9A4O8W26KoawT7u8V6satnwE0HvAq3IGs5IMT/5dYaA9E3ORmYQGJ16UD4m0zJfFh4jhudQ1omresiGBbJp/42QGLq6sXDOlBWrVJOmp4BhLCJaTZ9Bs73kxy7xCTv39lUkN3qahiQNCJC6sEz/i9qYWVf9HMkgx8WQ9l37LeZsPDsTLzxFE4etAL7wEjzahazJmiL/wbIE871i8LMaHtfLOLHtnD+xUSUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWtGcWRpOXhuNjdFeENYeVpmaklHdmNUZE1IZVp5ZmtPdmhncGNhZUgzVHBP?=
 =?utf-8?B?c3dXTjRNY2luYW5tVFBJYXpJQUVIb2kyNWM2WWZtR1pxUE5ZbWVHUXJ1VWVI?=
 =?utf-8?B?aWNuVWlGUjNIVHJnenZDdXFBN1dsc0dOYmVhVFlpa3cyTm5qMG1aQnY5UW9J?=
 =?utf-8?B?RVpBNm4yQkxINjJCSGExbmtTSkNiTzYwWjZmRDVTRmV1dy9INExjczI1eVhh?=
 =?utf-8?B?V0hRMDRra0dVcTFTTlpIS29BcnZocjNONjdNMk9ORERGaEpwVVdhTURkckor?=
 =?utf-8?B?K3M4UUwvMlBjVkNsTHpnbXFiWEJ6d04vR01UT243TzRIUzVYZlRROU4ySVVw?=
 =?utf-8?B?SDluTEpxaWo2YlVtSDc5eUtPVFlUcmg3UHVhZjhWbVhoNUw2MWVBb0crRUl0?=
 =?utf-8?B?eklDL1pqOEo2dVdxNUozell3Z25ZOEZwQnpKTFg3R1JpMDZYcVI1MThMOHo0?=
 =?utf-8?B?c3BWY0RKSzc2eFhmcWxxbFBUYU1xU0x0UmVSUGw0eUxscHh0eGxSZFBPY3F4?=
 =?utf-8?B?MklaVndya082emhwdEJnc0RxRjFaaHZ4MXdFYmhUTmFTTDZ5ZFlML0ZUT2h1?=
 =?utf-8?B?RWxDaU9QRWRLMGRDSlZxNGhLcGVBNUNyMDNBS1Z3ZEs3a3d5UEtZRmYvWnJE?=
 =?utf-8?B?NkZuZTNYMGpBWVJrMjUyUlI2d0FKU1RHdTFRNERuVG9CUUgyTXZZb0NlQkcw?=
 =?utf-8?B?S3doaStHbnlnY3g0T3FCQmhvWktYK25WendsNGZkUkYzRkVZNnZpVEhveVMv?=
 =?utf-8?B?dlRLblNISkFrVnN4dG8vVU1SUnhkaGVDVEhENHFDZ1RyR3h6Z0xMSXBpL0ZU?=
 =?utf-8?B?dnFsbUNtbmZIVEN6blRRMUE3UTBrZnhERHJXdksrSDIvc2N4QUxJWFRzbXpJ?=
 =?utf-8?B?OW11TFliNmR5OEQ5MFJjTHk2UWMweXdLUUpBaUZwNnRuTVd4ZlNzbURuVWFZ?=
 =?utf-8?B?Vzdjall5Zkw3OU5XZDBVbFpCdHdFbTJYOFVQejA0VFVnMW1WS1VjQXVzY1d0?=
 =?utf-8?B?azhSa1YwY3pMUVZHRmJoKzhwQXhVdVJaZGlaVEthTTJmc2Vjd0FZK3ZQdW44?=
 =?utf-8?B?aCtRM0UySjd6bFJYTkd1dzI4NXkxUDVjSXJoV3FpRlR2Mk9JYXh3dE85SUVn?=
 =?utf-8?B?Vk1lVndKcDJnVjVzRGt4Q01PVkJVbWdhWU5YSDR0c3QySHd4RjFMc1MwNjlC?=
 =?utf-8?B?VkdoS3F4RHcwc3NLVG40UzRoMXRXYnVzdytwdERIVisrTEpxZWo4aFVJYU1C?=
 =?utf-8?B?NjZGcEFBeWl2NjAwM3JlWVUxMzloWlpCc2E1TTF4SVdRcGJWK0dzYnYrelpn?=
 =?utf-8?B?ZFVjZnBESGhUL1BuSW50OG1aamo5MmZ2aXZ3N000V05xbGMwckhmandKNGow?=
 =?utf-8?B?SkpPZ3JtWHJQZDdlQU9Fcm8zOWl3RTZtWGdWMVNRaU5HdjhCSjUrSlljMkZD?=
 =?utf-8?B?LzJhRWJ3N2VuT3A2VSsxaUZXTnZKdTVBTE1iM01tMzVTQmxpMDM2dGV5TGJx?=
 =?utf-8?B?NFNhMEo1MndJay9CSklaSklTUHlEWXNKdm1kYXJaRlAxK0d2UUJWQUdaeHhs?=
 =?utf-8?B?M0tkbWtSYXBzSmZuL0xnOVZBRnY3VnBsTm9USDVXcFh3UjhBVjZWU3R2Vk1m?=
 =?utf-8?B?RklyU0RXY1NORkozcjZqMGFwdEtlVlBmYTNJKzRWUWtVY3FzMHhXV1QxVUd1?=
 =?utf-8?B?U3hpcmkrZ1hPaFhYd1FmSGpxVnY4K0FueE83T3VSSXRwcDhHZFBkNVJoVGhh?=
 =?utf-8?B?aXFCSldDMGdVVDB3QUd5QkRmSlVjYTZWTFh1V0RWakpOQ2JHd0RpYjM4WjZL?=
 =?utf-8?B?RVlhM2xVa3Y5b1JCWldCd0VoWmZRK0p2TEM3VlM3SjFFb1JuMEhkZlNRYkd3?=
 =?utf-8?B?dVBaZFBvTUNMRFJpZndMNWwrbUc3blNjeGJSQkhtTE9VTEkyUTF5YXJQd2U0?=
 =?utf-8?B?RzNNdzZhcE1kUmFOdTJORGhFSDRaTW9iRVdBOFkxd0dYZVNnOG1waXkxeFgz?=
 =?utf-8?B?ckdvZmlCQTdodXJHOGhYZC9hWFoxUlUrM0ZBZlR5RUJXRitadVB3TEFlczZD?=
 =?utf-8?B?OVZHcXpBWXAzMVBCVEl3TzlZekZoN2d1VnN1U1hlUWw1UHg4VTA1bU9MNmh5?=
 =?utf-8?B?a0pPSmRzK1AzL1FiM3B0MlBHTC9oWG5YOHdLUTB4a1d2aUZnNk5SZ3NaTTJ0?=
 =?utf-8?B?N1FsK0hlOXBHNk5heVlwRU05VHlyMmhUSC9XSFNWUEU3SlNLTk9QY3pqR1My?=
 =?utf-8?B?Z04wdmxycXVQQWk4UlFiM1pUWHFCZUlYbGgvOXdMeDZDWC9TVWZkVGJHYVFM?=
 =?utf-8?B?Tlo2MzdCU0tTa1BSMElBSGl0YThLTXNTaUlaRGIwVEI1bE14Z210eUdHUVJZ?=
 =?utf-8?Q?YIrJFQhnQXwJKpv94Y5wylArOMV5ksBcBYoMeiPzOix9g?=
X-MS-Exchange-AntiSpam-MessageData-1: 4HddHd1BVlnFyN/f5gNglr/id+eUdb36doM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392953f7-768a-4fbf-5943-08de775cbc8d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 06:35:32.1598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qbe6aHteCtGL6g7MkVIE2ZCMMsXG1svxB0LZeFtW9+ZCMUp7bLJFCx3tTSyti9tssyEGGGKjWoPfWo8LknYtgaGEawiY+BM9GdRKEJ5seSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF07B018B9F
X-Proofpoint-GUID: 9FPuvEt9aDf7Og50EEJIewh84YMfV2a1
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a3de36 cx=c_pps
 a=JJStoDgKLvGmSPu1zToK9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=t7CeM3EgAAAA:8 a=lSGgB6LZaLj-mNiQp9MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9FPuvEt9aDf7Og50EEJIewh84YMfV2a1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA1NSBTYWx0ZWRfX22DZAyHgEZHI
 tByLZPRom/Ld6uDRW450vQNbh268NnBkRLJBa0LuTI5d/VeamFz9OjEnCHgSgfUI68Zk0VSy0GL
 w5PlFrrjBzBfiMFY6zESbffl7M+s9yw6tNhWNIGTlqa8ohHxiPinE6WRNIof42ICeT4k3d3TBDS
 vM3S2OOrGGQcrf1+QnWTYkDWveygY2nBN6ZuuiDFR6ex2IYZ84cgeAvwi0l3ZSgYo/zN957bStI
 c4DWtui91L2AMWUT2nGyWWi4c5rTz6N9ARgXO7YV6z6w9sTBPjX3WkjpXubp3+4bUlr4Jtd3h9L
 ct3qV4tatcKNC1NQ5mnS0vGEpiD7UVnMZ9VotK/AFN8GwCogDNcu21ef44/jSPeTOrdRG+eE+DC
 2Jkil9JvzqMm9ocIiL7OY4jxLRymXOTZr9YQ4qdGASGAWbJ4cvIvLqaCZ5yZzLSaAv7X+uSkH8p
 dl/brSFTEBq/jYfoCBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-54000-lists,linux-media=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[siliconsignals.io,linux.intel.com,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:mid,windriver.com:dkim,windriver.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B8001CEA3D
X-Rspamd-Action: no action


On 3/1/26 02:12, Tarang Raval wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
>> Use the new common CCI register access helpers to replace the private
>> register access helpers in the ov9282 driver. This simplifies the driver
>> by reducing the amount of code.
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ...
>
>>   /**
>>    * ov9282_update_controls() - Update control ranges based on streaming mode
>>    * @ov9282: pointer to ov9282 device
>> @@ -639,15 +536,15 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>>          dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
>>                  exposure, exposure_us, gain);
>>
>> -       ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
>> +       ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
>>          if (ret)
>>                  return ret;
>>
>> -       ret = ov9282_write_reg(ov9282, OV9282_REG_EXPOSURE, 3, exposure << 4);
>> +       ret = cci_write(ov9282->regmap, OV9282_REG_EXPOSURE, exposure << 4, NULL);
>>          if (ret)
>>                  goto error_release_group_hold;
>>
>> -       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
>> +       ret = cci_write(ov9282->regmap, OV9282_REG_AGAIN, gain, NULL);
>>          if (ret)
>>                  goto error_release_group_hold;
>>
>> @@ -656,62 +553,11 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>>                                         OV9282_STROBE_FRAME_SPAN_DEFAULT);
>>
>>   error_release_group_hold:
>> -       ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
>> +       cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
> If all the operations above succeed but releasing the group hold fails,
> you still return success, which is wrong.
>
> This case is rare, but it’s better to fix the error path.
>
> I think we should do something like this:
>
> error_release_group_hold:
>       int ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
>
>       return ret ? ret : ret_hold;
Hi Tarang,

Thank you for catching this!

  I'll fix it in v2 with:

error_release_group_hold:
     int ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
     return ret ? ret : ret_hold;

Best Regards,
Xiaolei
>
>>          return ret;
>>   }
> Other than this issue, the patch looks good to me.
>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>
> Best Regards,
> Tarang

