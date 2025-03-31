Return-Path: <linux-media+bounces-29076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60294A76B2C
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 17:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65D09188C730
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 15:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352532147EB;
	Mon, 31 Mar 2025 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hf2+liF7"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FAB2144BB;
	Mon, 31 Mar 2025 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435767; cv=fail; b=QdSaMVy5WDu7keKLHwU9ZMjVRIxncfAg75yaamGZaurwxuR51YzREpb3kUCXfaDnzGbYb6luGe3VAxSXCWdRVL06olSGb0M3WWhZ1mEay7GLHRQO4yFE8dvIBwzgyksX5jvD+4F7/9x9M1E/ZIlVZQmKiZCpYovsAFsSRb7swtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435767; c=relaxed/simple;
	bh=UeVoWGC5iOnBKz+BUzbjEjtNyoD34EWxs5NK0NPuwcs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YOesoJWrm/q3u0KXybLoMCUXoEKU1Rfd42pr++4c6bwK48uav9RJJpZ9kCsCD9W/FXlJIzvpCL34K9pRgwbU3RgTuMl1x1h6ac2aw1ZH9Eg0BxFnjbHAkAdSBwGo2dBBDHw70N6V9fy1VqtIm8Zrfaqgx3TfIe6+9BCq7ObLsqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hf2+liF7; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kf1lVl/zfa6oBSQpDUpAJnXT6uP1c30PRveRs1DfxnvYYYwVzf5lNL38nsWfi116wDytdiWigkKjSQ8Vk2eZNlf6dQxwUzcJUm2v3heaVDmB11pS8rljeJRzUHZR4Ioxma/jUEcRgJ5dyw2zkDKH2Sn3gfs8bFRBghyAN2XSFLZHOaYyHM+qaXY8FrVQJSojFGs6ULy6A9Tr2wayMWmwg69XZzUvyY5xFwvoyhPsKTnBJw4GdbMewbxXcVTu6xX3lzM9vQozarIB7yvZGlAMcAS3xgd++/KdrX3dk+Lkkq7DqKKlsrlkxiAVB2YZfjZu42pirQuzlHLpHiB75ZOPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPxNQcrY3Wnga7/ZYNb5SpJ/nhGDnR+xyV7GONTvi28=;
 b=ocIVvYSUB10uzJBDmH3Q8HiMLw5/NeNANG+MQqTqg+N4NfrzOyu7kq+KzPBJUjmaJZuupsoTAoJaUSNKn3OYxlt4j890kSV2PbHl7T1PhNAB85ap4yIBvRzB2cPCkXsWRizyHgajW14VomL5HB2irJzlS2Ks6Qf7n9Rv3OKJEt7FYBIZEIrf5Fn1VaO+NEylxu3t412nsuV/ie0SNeKoA54fFa0Bl3Q4Xs3cgmvmMJ5r3qfJpZ4PsWU+JhhWsvwcVm3563b87d0LmZ6C5Q048TMo6lIrdfMdBQEhK2r3jxTfA3wtwJPQZERkVk5ZdZ6nBdshvzwffjf/3Qle4cDxHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPxNQcrY3Wnga7/ZYNb5SpJ/nhGDnR+xyV7GONTvi28=;
 b=Hf2+liF7vO6pWQqORMrzqVHIc82nECq2EkLS7J9nG5kUg09vKFmj4KVPHO5h8tjwQ3Tn+6DE179G4dHZrDFg4Ku6WHne9gicrxUGfjOnly/FcFEcjuF2/VVBZJFA3BKIAwkII1IQLAD4YA9IMDL7xZRmhoTNTdwq/8+RBTxj3OJ49OS2K+n7LnrUisrDTv3yDyipm+RIC3cMKDsAKeMXULLIvRCsxU5+/AdK0Bbm77vffKP7U9REz2Y16sT5tBjis44rF4vpDqYUGYh8gq3itD99E2f84/Xy4Fd/thbGFdoyFiWpeZ0hI1iK/Mpxn9EHvSbZEVlYJ7tSjbYgC+JJRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8237.eurprd04.prod.outlook.com (2603:10a6:102:1cc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Mon, 31 Mar
 2025 15:42:42 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 15:42:41 +0000
Message-ID: <2fc622c4-04a3-4069-93d9-0b2388226fb4@nxp.com>
Date: Mon, 31 Mar 2025 18:42:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S
 raw sensor driver
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "bryan.odonoghue@linaro.org"
 <bryan.odonoghue@linaro.org>, Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 LnxRevLi <LnxRevLi@nxp.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "mike.rudenko@gmail.com" <mike.rudenko@gmail.com>,
 "alain.volmat@foss.st.com" <alain.volmat@foss.st.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "umang.jain@ideasonboard.com" <umang.jain@ideasonboard.com>,
 "zhi.mao@mediatek.com" <zhi.mao@mediatek.com>,
 "festevam@denx.de" <festevam@denx.de>,
 Julien Vuillaumier <julien.vuillaumier@nxp.com>,
 "devarsht@ti.com" <devarsht@ti.com>, "r-donadkar@ti.com"
 <r-donadkar@ti.com>, Oliver Brown <oliver.brown@nxp.com>
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-3-mirela.rabulea@nxp.com>
 <46eescbpdyjr3ljlhyv7fwzxksuln5s57xqgv7nim4yon57im3@22slmk45taf2>
 <6f0168b5-6f79-470e-a8f8-bed8d2495826@nxp.com>
 <pzbbtaltu7wcrsjvjg6n2x33uwm3us4uwpykektc7xlj47s7pz@odqzjc64db2i>
 <9e4e8d6d-f4f0-4332-a30c-ab0429e1526d@nxp.com>
 <qzgdjeogowudvtrd5p7heank2puifzsppcovo2bctysfzt7u7t@kakpfjj5mm23>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <qzgdjeogowudvtrd5p7heank2puifzsppcovo2bctysfzt7u7t@kakpfjj5mm23>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0146.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::13) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1b14f6-0345-4e84-9dd6-08dd706aac2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dktYeGU5VTBrOE16emc1d2phZ2daUjRsT0VzdTZqVlI0aTllN0Ntd1k4TGNN?=
 =?utf-8?B?TGxNaU16VXdTaWc0T0JCTUlnUExpeGo0a0RoUDRaZS82clRPWThRc3VDNU85?=
 =?utf-8?B?T3NCRDU4bFhCQUxBYWlhblJxOUpZV2x3VklwaktOQUR3cFdlSjAzS0V1aTFw?=
 =?utf-8?B?N1JaQUZTUmpnTEREU3FPZW9mVmpTbnN1Mkw5L2xVOEoxLzBrUHNxWGd2UkJS?=
 =?utf-8?B?T0hEZ3UyRmFPbUlPTlJqN2tVMTNVdlpBdnA4Y25Sc0tGMGZuTnk1Q2w2ZVdT?=
 =?utf-8?B?TXJWT3lhZnVjK0Y1WURHZXZ0Y1IrUStOVXVpbVRkQ0tpQzJLNmZQK3BmUHhx?=
 =?utf-8?B?Q1F0V000Zlg4ZGpsNXVPUU51amRESXUrM3hPRTJZeFNOR3dGdUNQSUd6Y010?=
 =?utf-8?B?YmdVeFJvUE8zQVdNNko5K2UyOG9tSlRLVERvMkhGRTRZa0MydEFjRkNpUitT?=
 =?utf-8?B?SGNGUEtIWTdOL1cyTU5Ha0dJa2RmOHcrR3RkRW1RRm5wd1gybkNtclpUNUw0?=
 =?utf-8?B?VElKekwxL0hUb1RYeW43OTlnb3RYRmZQOXIvUHQrdi9aWWtuUXJQRE5DZzQ3?=
 =?utf-8?B?ZTFkK1RGZXpVdmZ4bW9CY0RtZDJwTVNTZklmcUNmSjdYMjJBbFc4bmJoOGlQ?=
 =?utf-8?B?ODV4cVk4TVRmOWRSQVRRTEN2L1dSREtEU0tLaVFFelpDZFhBUXhCbHI2cGpW?=
 =?utf-8?B?c2pWbmt0S0VZTW8vVzBMUWtHcFFzOTc1L1ptSXlaempYYTVVQW0wQ0M2SDAw?=
 =?utf-8?B?eXlCZVBKWlJlNGNKUGs4eFNWL01maDJYcG1kK0ovQVE1c1lOdE1DcEExdzRy?=
 =?utf-8?B?SW01dmREVy90WGJ2Si9MTXJwRVducENXblZUajFjdGlxSmswVE02WHkxbXpB?=
 =?utf-8?B?QUMvMFVkVnR1cGdQdXBzRWRKWFhzUDM0QWhjbnZ0dXk4UWxJZW1zTlZYREZn?=
 =?utf-8?B?YklJU1JhVm0xNlRFQXE0RkhZRGlNakxXckdPUHhGTk12RTUrVjFNZzdsM2ND?=
 =?utf-8?B?dm92YnR4QkdDSUE3eXp0dGxSNzVZVWIvMDQ4TWM5VUxaNnpKWE1qVW1NRVFP?=
 =?utf-8?B?R1A0SFdWdGYraFVrZzB0MGtoeVVibnRVT1Vhdm1xdVNCenRGeU5vMzEwZVN6?=
 =?utf-8?B?ZXYrdm9wellyKzFScWdjc2NqRnhEMlp1LzYyUHZUaC9uSFRJRndOaFR6MmNp?=
 =?utf-8?B?Tkg3L3BzenJtY3c3VG11SDdBS09oMzU1bUY5N2o3dVY2VWNsSUNOcXJ3YmpU?=
 =?utf-8?B?L3lUWFdRWEt4RFVJb2t5VmpWdStTRC90UEF5aWtpVXNjdDh2Q2FKbnN5b05x?=
 =?utf-8?B?NlBuK04wUjYvbEIzZnZCWk9wRnhZVmNEWGNmcFQ4ZnY2TDFOSW0zY1V2MjRq?=
 =?utf-8?B?eEw0V3VnUU8wdHRBUmNpa0RWNC9XZG5YSjVpdkdZUmptUXNuQjd2WlJkNDAy?=
 =?utf-8?B?RlpMMXZYVkhZeW15dGsvWlRlMm5XOWpMbENQUHc4K1dvQU9xc2szTy9CTEx6?=
 =?utf-8?B?MjB5cXg5Smk5OGl2blpRUkNKVnI5MTRra0VLYW1jNHZCYnFhWkVKTkVINVF5?=
 =?utf-8?B?alFDU0xaUmVWeTlZQnAyUzNDT1lQOTZscjNiN0JveVBvaHJ1bk83bU9MSFZr?=
 =?utf-8?B?UUoxVnlheXRETGl6cHRualdSR21VU2h3ODlDSURIdFFwd1BkY3plYnVUSjhR?=
 =?utf-8?B?MEV5NUtQWTkvTEFwSTBoUFFqUGRTbThITmlxTlNXclN5S1lNTFhVeUtkUldG?=
 =?utf-8?B?SGdMdTBHY1p4cDNKeFdlOGt2UDZDcHpxNlBnN0FmVVo4MjF3U01taGJ0eVh0?=
 =?utf-8?B?V1lnWUIxcnFaMEoxaFZOdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjdBUzh5cmlmMmxIZ3lQSWlYajEwWS9kejNBbWZDSDdKVUFVWjQ4MHZrNlBo?=
 =?utf-8?B?b2x2dXdSaFBTOG1uVjh6U29CTkJab0VnWjVwdFl2NzNKbDBLY2pSZ2Vlc3FU?=
 =?utf-8?B?NURiR1ZlTHFTdDYyQnZFdmJ3TlJkQ0pFTFBPR0U2WFQ1V29kVTFXeFBCZ2tZ?=
 =?utf-8?B?ZW16ZTBWMlpjWlJBN2EyaFNOc1o5WEIxTzRlVGFRWVRyWVJSbXB2WDhLaVVW?=
 =?utf-8?B?dWZmY2haRDNOZ3N3d1N4TmkwNXliVWNrM0RIa0JoNTdrZXZTNXJjVGFLckZj?=
 =?utf-8?B?dzIyekVuVitxUjZsdXdKR1lIaUVRUFFZKzhMaVNFYmFnWkRoYWRpd3UzQ3dy?=
 =?utf-8?B?bU1nVG96Ty9FTTdYaldEYU02Mm16WEY0a0Y2VHlLV3c1MlV6bU1YSGd1NERR?=
 =?utf-8?B?bUg3Q05adXJoV1B3MW5ObXFMSWdzeEJXOTdDdHBuUUEyc1Vhbk9MeGJRZ0xV?=
 =?utf-8?B?WXpiVnJRK1dWc1phQjNmSjZ5YjgzVlYzZmp1eWRyd3FmVEUxdzhkWFJpQTBu?=
 =?utf-8?B?SW53dmI2eURBTktWOU5Fd2ZENmFkcnZWVkNBNWNJdkQxU2NzTXphaVp1RkpP?=
 =?utf-8?B?eFcxYWNEUFVxelpiL3VGTTVnMGwyekJhZjc4d3RYV3BGd3pKUDg3VUFqOTda?=
 =?utf-8?B?SU9KM1RtVGpiV2xUalQ3UFhBRXVvdmFpRWF1NllpRVR2Q2ZKc0JWS3JJMzNi?=
 =?utf-8?B?Y1Y5NE1UeHptTGFseVVEdzdyamFQWDU0aHJtTlFZd3dTNjVJQmRoUmJ0bVZp?=
 =?utf-8?B?dGd6K09xVlplTTdzRjlFOVBzd3JoZHY5aU01UG5Walc1dVk0dkszekNBVEVF?=
 =?utf-8?B?MXBObnJmU2VGR1diME4rTDA0a0lxRnp5ZHM5U1F3bng4UlppUlI4UENnTFZ4?=
 =?utf-8?B?cCttcC9SRmZhcnh2QjZweEszaEwwbERZLzdadk1TZ0FYeWQ0UEtJSlR3Rzgr?=
 =?utf-8?B?OW0vZnFyd3o5SkhlOEtNcXlZd1lQZ25BV2VsT0dwNmw0Q3ptY3Jxb29peHlX?=
 =?utf-8?B?UTVKb0x2SUNPcytzTmNGOHRVWEFxbEd2TVR2Mm9WbFFlTFdha2I1SkJ3TWI0?=
 =?utf-8?B?Y1MrOHN2cStKNElka2hmOXd3MzNrTUVnMC9TUTY1bDRvWk9DRFloNFF6MkR5?=
 =?utf-8?B?OHd6dmt5L0tKdDV4dDhHbUxvQi9qRmR2Y1dCeFVZSWdIaWt5b21qdzc2anhw?=
 =?utf-8?B?aGhyWi9uOGZrZkJST0E4UkdqWjhNL1lmUlhXVnRsTmlka1JxTmp6a2N3UGNI?=
 =?utf-8?B?YUZGZ3BEWVJQKzRMdDE3VFUvbW9PUHBqa3Y3YVl2NzR5eWlvZWlrUkwyY0V2?=
 =?utf-8?B?UkM1WkZPYldHSXNhblJxQ29ja2t3VFJzZFZnS3ZKTDNQTkQ0ZXZNZVFDaXdM?=
 =?utf-8?B?dUR3ZmdnSWNDb2k4MkIxcFBDSjk2RWxYU1JpWjgxQzJFcithWldyRGRKdVEx?=
 =?utf-8?B?YkVxU3BJcGVqcFlTam1ZMmNxdjhmWTExNlg3TytJYm5ManlNQlpBN0hGTzFR?=
 =?utf-8?B?d1o0SkVMMXNhdTNJRkcycm1FYUdDZnVvZmVLNk1kcWVKeUdjZ2VzZmllTXlw?=
 =?utf-8?B?L0hDM3pEWFUwaDRUbkJ3d1BWSGYxVjlRRitEdkErWk5TK0JhRi9LcFB4SjE2?=
 =?utf-8?B?bGZpa2pBbG5oem5uRG1JaG92SGhQT1pxVWRURU53U2dJdVZzSHkwVXdBUEFD?=
 =?utf-8?B?YndITG9ReGhqcytVbm9NaU5qZ0xYaDZhOFEzLzRXUFludDh5cEFmN05NOUNG?=
 =?utf-8?B?UkNHdmR5a0lsR002aUtPbkxtWHlaY2k2R2FDbm1LSy9GMndsWjAySWdheXNF?=
 =?utf-8?B?cy9CaVFVL2JPOWk1UnBHWnZDcWJITzBvRExkQ1YvS21FK2RkcURibCtvOHNz?=
 =?utf-8?B?Z2hiRmk4bGVFL05oc0xCb0VpNDMrTTJUNmE0eGIyVGpPekN2bW01YjZoTy9P?=
 =?utf-8?B?ZVRMQnRvcUNvdWVFWG12L3hSYnBJVEJpRHFMLzczZHNiY2IycGFyanY0VXQ1?=
 =?utf-8?B?NkxaVHE2TVlub0VKZDdyV0U1cUpic0FwcjZicU51WHJ0QnhQZTE3Q1VUOVBY?=
 =?utf-8?B?ak4yNzRockc1RVJoSzYrMzRkNGRYWWNVVnAvZGtzNHIxd1JUMnVWMm5vMldx?=
 =?utf-8?Q?UGNdKVjl9vJHvs0IZUY/XoGw0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1b14f6-0345-4e84-9dd6-08dd706aac2e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 15:42:41.8652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7bNi4tzFcabo30uFBN+AhDtbjq3pwv+lkMerF9Ok9j+FDTAgIWswcOMxLDyEy+jHGYcos+jZHSMTj0P+/S0Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8237

Hi Jai,

On 28.03.2025 10:37, Jai Luthra wrote:
> On Mar 26, 2025 at 17:32:55 +0200, Mirela Rabulea wrote:
>> Hi Jai,
>>
>> On 25.03.2025 18:02, Jai Luthra wrote:
>>> On Mar 24, 2025 at 17:32:01 +0200, Mirela Rabulea wrote:
>>>> Hi Jai and all,
>>>>
>>>> On Mar 19, 2025 at 16:40:30 +0530, Jai Luthra wrote:
>>>>> Hi Mirela,
>>>>>
>>>>> Thanks a lot for your patch/series.
>>>>>
>>>>> On Mar 05, 2025 at 11:43:57 +0200, Mirela Rabulea wrote:
>>>>>> Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
>>>>>>
>>>>>> The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
>>>>>> active array size of 2592 x 1944.
>>>>>>
>>>>>> The following features are supported for OX05B1S:
>>>>>> - Manual exposure an gain control support
>>>>>> - vblank/hblank control support
>>>>>> - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)
>>>>>>
>>>>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>>>>>> ---
>>>>>> Changes in v4:
>>>>>> 	Switch to Y media bus codes. The CFA pattern control will be implemented when patches get merged, or maybe separatelly as RFC?
>>>>>> 	Add pixel_rate member to mode struct, remove fps member. We do not have information how to calculate the pixel rate from the PLL parameters that can be made public.
>>>>>> 	Use register macros for the registers that are documented. User register group macros, where individual registers are not documented
>>>>>> 	Remove some uneeded local variable initialisations
>>>>>> 	Fix extra/missing spaces
>>>>>> 	Add missing ending \n
>>>>>> 	Use return -ENODEV & return 0 to ease reading
>>>>>> 	Rename retval to ret in probe for consistency
>>>>>> 	Use devm_mutex_init instead of mutex_init
>>>>>> 	Replace more dev_err's with dev_err_probe
>>>>>> 	Constify more structs
>>>>>> 	Remove some unneded ending commas after a terminator
>>>>>> 	Fix smatch error in ox05b1s_s_ctrl: error: typename in expression
>>>>>> 	Fix a seeries of smatch warnings like: warning: symbol 'ovx5b_init_setting_2592x1944' was not declared. Should it be static?
>>>>>> 	Shorten some more lines to 80 columns
>>>>>>
>>>>>> Changes in v3:
>>>>>> 	Use helpers from v4l2-cci.h (drop ox05b1s_write_reg, ox05b1s_read_reg, ox05b1s_set_hts/vts/exp/analog_gain, ox05b1s_regmap_config)
>>>>>> 	Don't hardcode timing registers: remove timing registers x_output_size/y_output_size from register configuration list, add them to ox05b1s_apply_current_mode
>>>>>> 	Remove HTS,VTS from register config list as they are written by HBLANK and VBLANK controls through __v4l2_ctrl_handler_setup
>>>>>> 	ox05b1s register config cleaning (remove all registers that were at their default value, and more, keep only what seems mandatory to be able to stream)
>>>>>> 	Use const for ox05b1s_supported_modes
>>>>>> 	Device should be silent on success, use dev_dbg.
>>>>>> 	Drop unneeded {}
>>>>>> 	Fixed an error introduced in v2 in ox05b1s_nearest_size (set_fmt for 4k BGGR12 mode was stuck)
>>>>>> 	Fix an issue in ox05b1s_set_fmt, the format was saved in subdev state only for _TRY, save it also for _ACTIVE
>>>>>>
>>>>>> Changes in v2:
>>>>>> 	Use dev_err_probe for missing clock, since it is now required property, and use NULL for devm_clk_get (no name for single clock), remove check for non NULL sensor->sensor_clk
>>>>>> 	Remove dev_err message for devm_regmap_init_i2c allocation error
>>>>>> 	Added spaces inside brackets, wrap lines to 80
>>>>>> 	Remove some redundant initializations
>>>>>> 	Add regulators
>>>>>> 	Make "sizes" a pointer
>>>>>> 		Use struct v4l2_area instead of u32[2] array
>>>>>> 		Remove the count for supported_modes[] and supported_codes[], instead use sentinel element at the end
>>>>>> 		Consequently, update ox05b1s_enum_mbus_code, ox05b1s_enum_frame_size, ox05b1s_nearest_size, ox05b1s_find_code, to not use the count
>>>>>> 	Remove .h files for modes, however did not move this code in the driver file but added a separate c file for all supported modes
>>>>>> 	Refactor register lists to allow multiple register arrays per mode
>>>>>> 	Use GPL-2.0-only instead of GPL-2.0
>>>>>>
>>>>>>    drivers/media/i2c/Kconfig                 |   1 +
>>>>>>    drivers/media/i2c/Makefile                |   1 +
>>>>>>    drivers/media/i2c/ox05b1s/Kconfig         |  10 +
>>>>>>    drivers/media/i2c/ox05b1s/Makefile        |   2 +
>>>>>>    drivers/media/i2c/ox05b1s/ox05b1s.h       |  22 +
>>>>>>    drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 951 ++++++++++++++++++++++
>>>>>>    drivers/media/i2c/ox05b1s/ox05b1s_modes.c |  77 ++
>>>>>>    7 files changed, 1064 insertions(+)
>>>>>>    create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
>>>>>>    create mode 100644 drivers/media/i2c/ox05b1s/Makefile
>>>>>>    create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
>>>>>>    create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>>>>>>    create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c
>>>>>>
>>>>> [snip]
>>>>>> diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>>>>>> b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..1026216ddd5b
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
>>>>>> @@ -0,0 +1,951 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>> +/*
>>>>>> + * A V4L2 driver for Omnivision OX05B1S RGB-IR camera.
>>>>>> + * Copyright (C) 2024, NXP
>>>>>> + *
>>>>>> + * Inspired from Sony imx219, imx290, imx214 and imx334 camera drivers
>>>>>> + *
>>>>>> + */
>>>>>> +
>>>>>> +#include <linux/clk.h>
>>>>>> +#include <linux/pm_runtime.h>
>>>>>> +#include <linux/regmap.h>
>>>>>> +#include <linux/regulator/consumer.h>
>>>>>> +#include <media/v4l2-cci.h>
>>>>>> +#include <media/mipi-csi2.h>
>>>>>> +#include <media/v4l2-ctrls.h>
>>>>>> +#include <media/v4l2-device.h>
>>>>>> +#include <media/v4l2-fwnode.h>
>>>>>> +
>>>>>> +#include "ox05b1s.h"
>>>>>> +
>>>>>> +#define OX05B1S_SENS_PAD_SOURCE	0
>>>>>> +#define OX05B1S_SENS_PADS_NUM	1
>>>>>> +
>>>>>> +#define OX05B1S_REG_SW_STB		CCI_REG8(0x0100)
>>>>>> +#define OX05B1S_REG_SW_RST		CCI_REG8(0x0103)
>>>>>> +#define OX05B1S_REG_CHIP_ID		CCI_REG24(0x300a)
>>>>>> +#define OX05B1S_REG_TIMING_HTS		CCI_REG16(0x380c)
>>>>>> +#define OX05B1S_REG_TIMING_VTS		CCI_REG16(0x380e)
>>>>>> +#define OX05B1S_REG_EXPOSURE		CCI_REG16(0x3501)
>>>>>> +#define OX05B1S_REG_GAIN		CCI_REG16(0x3508)
>>>>> There is a non-trivial overlap of registers between this driver and
>>>>> ov9282.c which supports OV9281/OV9282 (1MP Mono).
>>>>>
>>>>> There are two other Omnivision sensors, OV2311 (2MP Mono) and OV2312
>>>>> (2MP 4x4 RGB-IR Bayer) with an even larger register overlap with OX05B1S
>>>>> and OS08A20. Unfortunately those two have separate downstream drivers in
>>>>> RPi and TI linux downstream trees respectively, and haven't yet been
>>>>> posted upstream.
>>>> Thanks for sharing this information, I was unaware. The question of
>>>> how much similarity should two sensors share, in order to stay in the
>>>> same driver, was also on my mind for some time, and I’d be glad to
>>>> hear more opinions on it ;)
>>>>
>>> Same here :)
>>>
>>>>> It would be ideal to have a single driver for all of these Omnivision
>>>>> sensors, or if not, at least a common C module that can implement the
>>>>> shared functionality like gain, exposure, blanking (vts & hts) in a
>>>>> single place, as this will make maintenance much easier.
>>>> I would need to get more information on the sensors you mentioned in order
>>>> to issue an informed opinion. So far, with the OX05B1S and OS08A20, I have
>>>> found some small differences regarding exposure and digital gain registers,
>>>> so the overlap is not perfect, I expect it will also not be a perfect
>>>> overlap with the other sensors you mentioned.
>>>>
>>> Sure, I had some experience with supporting OV2312 and OX05B1S in the
>>> downstream TI linux tree, and while they share the registers for
>>> exposure and gain, there are some other differences in features, aside
>>> from the 2MP vs 5MP resolution.
>>>
>>>>> My question here to you and the maintainers is, would it be okay to use
>>>>> this driver as a baseline to integrate all these different sensors
>>>>> together? And secondly, would you like to take a look at supporting
>>>>> ov9282, so the other driver can be dropped?
>>>>>
>>>> For the first question, I don't know what to say, and I cannot tell if
>>>> we are far or close for this patch-set to be accepted. Also, I am
>>>> unsure about how maintenance would go on a driver claiming to support
>>>> a multitude of sensors, who could test them all, whenever something
>>>> changes? Are you thinking to add ov2311/12 as other compatibles to
>>>> this driver?
>>>>
>>> While it would be ideal to have OV2312 support within this driver if
>>> there is a significant register overlap, it might still require some
>>> effort, as TI's downstream drivers for the RGBIR sensors capture two
>>> streams with different exposure, gain and IR flash values, and different
>>> MIPI CSI virtual channels, using the group hold functionality. Which
>>> IIUC may be quite different from what your patches implement, and will
>>> require adding streams/routing support so the userspace can configure.
>> You are not alone on this ;)
>>
>> We have an internal solution for adding streams/routing support to this
>> driver, we used it both for ox05b1s (AB mode with 2 pixel streams on
>> separate virtual channels) and for os08a20 (staggered hdr mode with 2 pixel
>> streams on separate virtual channels), and also a separate stream for
>> embedded data (same VC but a different mipi data type). I did not post these
>> patches because of 2 reasons:
> Ah that's good to know that you also use AB mode, as combining the
> drivers makes even more sense now.
>
>> 1. We are waiting for internal pads to be accepted, and possibly the common
>> raw sensor model
> I wasn't aware of the raw sensor model series, will read up more on that
> as that also seems to have an easier way to represent RGB-Ir bayer
> formats.
>
>> 2. There are issues with the individual control (exposure, analog and
>> digital gain) per exposure/context, with the current available standard
>> controls. This is an entire topic on its own, maybe I should start a
>> separate discussion thread on that.
>>
> Yes individual controls, be it for internal pads or per-stream, will be
> a requirement for multi-stream sensor drivers. I have proposed a topic
> to discuss this with the rest of the community at the Media Summit being
> held on May 13 in Nice. [1]
>
> Do you have plans to attend the summit? In any case, please feel free to
> start a RFC discussion thread on it :)
>
> One idea is to move the controls in the v4l2_subdev_state, which would
> make it easier to specify pad/stream combinations, but I am not yet sure
> on what the userspace ioctls will look like for that.
>
> [1] https://lore.kernel.org/linux-media/sbhsskq7kzrl5bkbqbijxszz7hfg34pjajgdmw23x7aseztyy3@26zcjwnjkpl4/

Thanks for letting me know, yes that is interesting, I will participate, 
if not in person, at least remotely. I will reply to the indicated 
thread, after we decide on our agenda.

Regards,

Mirela

>
>>>> I agree there is a great deal of similarity shared across many raw,
>>>> mode-based sensor drivers, and it sounds good to have some common framework.
>>>> Some steps were done with the common raw sensor model. I would definitely
>>>> also like to hear more expert opinions on this.
>>>>
>>>> For the second question, as of now, we do not have any of the sensors you
>>>> mentioned, unfortunately. I could help in the future to test patches for
>>>> this driver on the sensors that we already have, but cannot make any
>>>> promises for what I do not have, best effort if we find these sensors in a
>>>> form factor that will work for our boards.
>>>>
>>> I agree, having a single maintainer would not be feasible given
>>> different sensor modules may have incompatible connectors. But yes it
>>> should be okay to provide a T-By tag or a Nack on the shared driver if a
>>> patch breaks your particular hardware or usecase, similar to how other
>>> popular sensor drivers are maintained like IMX219 or OV5640.
>> Sounds ok to me, we cannot guarantee to test the other sensors, but having
>> T-by tag from other users will hopefully cover it.
> Thanks.
>
>>>>> Anyway thanks again for your series, hopefully this will give a good
>>>>> starting point for upstreaming OV2311 and OV2312 soon.
>>>>>
>>>> I would like to know more about the OV2312 (RGB-Ir) sensor and if it
>>>> has many similarities with OX05B1S.  What hardware are you using to
>>>> test this sensor? And what interface to connect the sensor? We are
>>>> working with MIPI-CSI on most imx boards, and also RPI on imx93.
>>> For OV2312 I have used this FPDLink module [1] with the Arducam V3Link
>>> board [2] that connects to the EVM using 22-pin FFC MIPI-CSI connector
>>> that is pin-compatible with the RPi5 connector.
>>>
>>> [1]: https://leopardimaging.com/wp-content/uploads/2024/03/LI-OV2312-FPDLINKIII_Datasheet.pdf
>>> [2]: https://www.arducam.com/downloads/datasheet/Arducam_V3Link_Datasheet.pdf
>> Thanks, we don't have any ser/des involved in the ox05b1s/os08a20 case, if
>> we will ever get into the position to try ov2312, probably we will look for
>> some solution for imx95-15x15 board, on the RPi connector (22-pin), cannot
>> tell if it will work, one can never tell what may go wrong.
> Makes sense.
>
>>>>    Regards,
>>>>
>>>> Mirela
>>> PS: Your mail client broke the quotations on your reply. I have fixed
>>> those here, but might be a good idea to double-check your client
>>> settings.
>> Sorry about that, I may have edited the draft from both Thunderbird and
>> Outlook. Hope this will be ok, sending from Thunderbird now as plain text
>> only.
>>
> No problem, this mail looks okay.
>
>> Regards,
>>
>> Mirela
>>
> Thanks,
> Jai

