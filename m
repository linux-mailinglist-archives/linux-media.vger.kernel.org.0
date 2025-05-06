Return-Path: <linux-media+bounces-31809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D35AAB81F
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A29817F526
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 06:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26065252295;
	Tue,  6 May 2025 01:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ox.ac.uk header.i=@ox.ac.uk header.b="IgDJBjWe";
	dkim=pass (2048-bit key) header.d=UniOxfordNexus.onmicrosoft.com header.i=@UniOxfordNexus.onmicrosoft.com header.b="OwFgESjn"
X-Original-To: linux-media@vger.kernel.org
Received: from fallback4.mail.ox.ac.uk (fallback4.mail.ox.ac.uk [129.67.1.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06DB1FFC50;
	Tue,  6 May 2025 00:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=129.67.1.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746490201; cv=fail; b=ZJ4ywOtTjT62DnbdNKgunqNYeL/LWs6oUm+sGWiC2pIaz3Iw9GJ8RREtPXJGMrshP8mJryZ83jVdhgfisVDB01KRJLo1J0logOl9cxdfep1A2RQmtyG4TMwKP2DGV7sJY5RsEF0pVqckPL+pu0KXzsg+qiXBLD3Mxw6ZU2w08hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746490201; c=relaxed/simple;
	bh=g97GCpyXHBIIM3AsnjtgtkGQhFXQj2H1fslNuw+FehE=;
	h=Message-ID:Date:From:Subject:To:CC:Content-Type:MIME-Version; b=Tl3MwP63PD9dJOrPkayKaEZw/NKp8V7olhlS8NltbMURfJsWtIKCBkvbvWP6VwybPLUkwM5naO5PExBdONj5w4yiBGUnVza1JSsK4HkEHw/PEbT03Z2z7+7V2UTdrOTrw6K9KPmHHiEaAHPTEfrE9KBh2R7DL3JmcvWsPDACOxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=magd.ox.ac.uk; spf=pass smtp.mailfrom=magd.ox.ac.uk; dkim=pass (2048-bit key) header.d=ox.ac.uk header.i=@ox.ac.uk header.b=IgDJBjWe; dkim=pass (2048-bit key) header.d=UniOxfordNexus.onmicrosoft.com header.i=@UniOxfordNexus.onmicrosoft.com header.b=OwFgESjn; arc=fail smtp.client-ip=129.67.1.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=magd.ox.ac.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magd.ox.ac.uk
Received: from relay20.mail.ox.ac.uk ([163.1.2.170])
	by fallback4.mail.ox.ac.uk with esmtp (Exim 4.92)
	(envelope-from <praveen.balakrishnan@magd.ox.ac.uk>)
	id 1uC5sg-00066s-IQ; Tue, 06 May 2025 01:09:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ox.ac.uk;
	 s=flood; h=MIME-Version:Content-Type:CC:To:Subject:From:Date:Message-ID:
	reply-to; bh=rRUDPu/KlEolW2QzGPmIO5OVmtj6e1H6JMHUXO8pAZ4=; t=1746490194;
	x=1747354194; b=IgDJBjWeH/QMQ/pPLZJcm8NS/KIU/WXSwQWa8DJFs8zwd6fkf4aqPxcgrqKUL
	/DLfCnhKopay7Bvsqpb9yVG0DJPok+8mIpLozqz0CvTopiTXvt9bqf5NUlhFR4OBx6Vi+jzIvlyoD
	6MloMfe+Qt+qNNAuljZUz7v+VywbBUwoTdvJuy/fTiBH2OSKq10VWTC/uVW/GOdnd2bApo2GnFl6t
	5IQC/ZQyoeY21+YXnQAH92ovdbmNVGizsabqzNW7q6AJHVjHIm8cBCJ7Cvepd0mUmanA3iB/UhPAH
	dLW27gTkdiTORYx1n/tE4TMN9RtOgBqTvvoCt6zLGdXBWfoInQ==;
Received: from ex01.nexus.ox.ac.uk ([163.1.154.241] helo=EX01.ad.oak.ox.ac.uk)
	by relay20.mail.ox.ac.uk with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <praveen.balakrishnan@magd.ox.ac.uk>)
	id 1uC5sP-0002B6-FS; Tue, 06 May 2025 01:09:37 +0100
Received: from EX02.ad.oak.ox.ac.uk (163.1.154.242) by EX01.ad.oak.ox.ac.uk
 (163.1.154.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 6 May
 2025 01:09:36 +0100
Received: from CWXP265CU008.outbound.protection.outlook.com (40.93.68.1) by
 EX02.ad.oak.ox.ac.uk (163.1.154.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Tue, 6 May 2025 01:09:36 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHE80ne5Is+XxNaQNNcWXCdjlw5Ej6xuZ1ip0G9IVJ7C0ol4ztwbSNRKDuuIzCuL56I/Uzmh9pG8Q9itSLA8/FjRnuQFM2QPp6mYsF8slyGd+Rfkm8yuGTvRXRxqJOxyp4aTa6XZImwCC8T5sQczd+lGHg/jV4DsVp4e2hd4UtaiLZFMUVg7SjiIShCWKss5wq7MkX/UAC7IGvcXC1wNjVKDAv+ZIYxd0WGWf4En/zfTS1ooVpDhQ/c/pRyNfTszywgr5QRVwvgcoZ/bKKZQ/5r7ph4kUMEIcXz1xY5E5PHkduBKJ3PuHtXYwBkZwFn9VDb8Weg16uNgygiJPyvS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRUDPu/KlEolW2QzGPmIO5OVmtj6e1H6JMHUXO8pAZ4=;
 b=QTAnZX4uuMTmnnvfqgmSOyRLQ8j3gNhjqwtdVsc7lC/FMlv9zNQOY/ZOpCPbN9eOeGqsBDKfr3nbuqkPVDYeLvluy4YLVFhYJfq7oLukI1e4Jdb5ej9YYzcSEtdhANMYclSk/+TAcsSAsbHqJFSYmkvnAlc4DP1qoj+Ay4jxOSAWBgbIuh8p/lCuAFp4cOoO6BNk6aZ92+nX7BrCfENBTOGz6V2fXHMPIL0CQLZ4zfl60GjTGMePvFyrq3hCBTHTokGhNuoZoBaENaSKC+geoKO5tzvJyUSTAkOWu/LUGuOK67cny5Fyb57Jbs47iY0bjiWvoYGBSVPgevNlK3s8/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=magd.ox.ac.uk; dmarc=pass action=none
 header.from=magd.ox.ac.uk; dkim=pass header.d=magd.ox.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=UniOxfordNexus.onmicrosoft.com; s=selector2-UniOxfordNexus-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRUDPu/KlEolW2QzGPmIO5OVmtj6e1H6JMHUXO8pAZ4=;
 b=OwFgESjny25bKxUeGkxbVczdJ3K8Q2QRzy2Gz/a5wPSs07kkZPvqAXR6twb/IOG1cOFTMnQtpXgFG08m5w7X2ZkIzOLC99Oa/h6vgSupcRAO6xOnE5yER0DxJ74M4ebMVQrAdrzUW6ZliwdNRX5jGAbTOzXcMgri+o1zM4ijcvyVkGASg0+cW64mTE7yyqmTN/pi2LsyMmuidWG4EHusJREm4Ir8bLEVEaO3hRuai5IfUMSe3iXpg34pPviJPZYZ88qJZuY24cZWohENyjB2Z2ZHdV9TYH3d2XlqRYi0MhfS/ei5Co5/FHXsN8/oUXmPP6BYk2GkB9zogOEwO9B3lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=magd.ox.ac.uk;
Received: from LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:323::12)
 by LO6P265MB6160.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 00:09:34 +0000
Received: from LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
 ([fe80::639f:86e3:3b7c:f6dd]) by LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
 ([fe80::639f:86e3:3b7c:f6dd%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 00:09:34 +0000
Message-ID: <9f2b7c8a-b322-4dff-a5ef-7a2625df2685@magd.ox.ac.uk>
Date: Tue, 6 May 2025 01:09:33 +0100
User-Agent: Mozilla Thunderbird
From: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>
Subject: [PATCH v2] media: dvb-usb: az6027: fix return value of
 az6027_i2c_xfer()
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<christophe.jaillet@wanadoo.fr>
CC: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
	<syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::20) To LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:323::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO6P265MB6985:EE_|LO6P265MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: 650eb29a-d15a-43c1-a02a-08dd8c324855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|41320700013|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk9oUkZ1NGd0dnkzNkhUek43WnM4QUovOWJJU3pmQ2taUStwUEJJUTdIWTFB?=
 =?utf-8?B?UERFUTUrSFdLMjdOVE05M0JQWmYxanIvOUFmVUFhUGorMy9yY2NtalBta1Z6?=
 =?utf-8?B?SDhLSTdsSXRFU1NPWHRGTkNXTGx6Z0k3d01zVkUyUngyOWxsTjRrVHNwZFFw?=
 =?utf-8?B?L1lEa05QdTJvVDJqTGdQSjFtckVjZDc3Y3hMdDlyYUIvM2JQVm5Ia0tSK0k4?=
 =?utf-8?B?Q096cVJzUXp6aWdzQ0VpWXFaVWRjZ1gvazloRURhQnNuenNnWjNvTTNWclor?=
 =?utf-8?B?QWd4YWFSSWlLVHBrVzVieDcvVXFlTmZ1UzJNYUZZTmV6VjJ5NjU0TnJ4Vjdu?=
 =?utf-8?B?eXJVdHhiSG9VRDFSU0U3TnRGSkloNmVwejlFcm1obXV5K1BaSFNPbU9LcFp2?=
 =?utf-8?B?MUxPUEV1Z2VPRTBQNm96dTJGQnJsd0xleTZuS0t6cnhmZnMyekZiTGIwRldP?=
 =?utf-8?B?MXY5enRwWUpzbjRHMjc5Rk9iM1ZJZDFsbjlLS0ZaaHYvRVVsYVprNitTNzc2?=
 =?utf-8?B?NUNDU29WTmZnMm5sNGo5b09RRDZwQ0toSkhkekRGbnZvTzI4WFcvbFJST0U3?=
 =?utf-8?B?VHVwOFFMT0tnUTc0LzU3RVZmanN6NDBWRVUycjBZVTNVQU9vdDlBTTVoeUZH?=
 =?utf-8?B?ajJoOEFFM1psUTNQVzErUHNiY2lkaDh0Z2V1MDQ4a0NsdVpXL2cyemNzcEUw?=
 =?utf-8?B?cUg3SG80MXBsTGlURmo1TE51TEp1UmJiTmJUUDZuVHFzZCs1QktjSmszems3?=
 =?utf-8?B?cnpNWUpqelhjcSsrZEpuMmwvdThRV0lkcTRXOGRxcEVYNXpLMlM0R2s1S0sv?=
 =?utf-8?B?c1lKUVBWUS9NbnJYZnlUOFhRUXFpU3I1MWllVk1ybnBtSnVUaXpKcGQxL21o?=
 =?utf-8?B?QzZDRkEzNEx2bm1zdm10WlFnbDVOU0VwSGZnRjNhVFVBeDBsaVRqYXEzeEY1?=
 =?utf-8?B?WlZoM1FMTFMwYTdxSHJxZWgyWlJMOGoydEtEdDAwcG1mVXBMNnpsMHZCYlQr?=
 =?utf-8?B?QS80NEpuTFptSFhJRVNNQlJKMjNZL2JLc3c2ay9hNGdJbUJuYnJucnlsVWlP?=
 =?utf-8?B?MXExK2ZJSmNxeklNSnIrYS9wdzcyS3E4TU5OWW5yTW1VVktZc09zYWFuWm1O?=
 =?utf-8?B?RFVybTVaWGNYV3pGRUphbXVPMGFPeG1rQlJmYi9ra1hEdXpNSmg0WkcxemNW?=
 =?utf-8?B?aUVMN2trTFoyQ040U2hkV0JtUC9WOG84Y3ZTY2R6OGVNd0t5RzZGNDYyNld1?=
 =?utf-8?B?Vk1DeTZGbVl3NzZXc05jd21kdUJIRkd2YStVVmV0MC9VZFBFYSs1Z2VwaXc5?=
 =?utf-8?B?UjJHQVI1dG40dm9kUktaNFNSeklsU1krcTN2eGNJaU9IMDI0dnRTUTV5MTVy?=
 =?utf-8?B?ZGFKTGpuaEpPbm9LTUZnZE4wbi9lTW16ZFNwQ2RoOEtCMkFJZVhFbXlva1FQ?=
 =?utf-8?B?ZDNBcVpybUsrWTVPZjU3TG9RR1JjRE1WS3hHZ2pLSDk1dm81QkdLTkhJWWVT?=
 =?utf-8?B?cjVZcThLd0NBbmxrWkdFVEdPTXdKN1pZOGxuY0Z3aFB5YlZqS2tCTlVQRFpR?=
 =?utf-8?B?eTl5NkVIc0dLTkNoNVBFUWcxZTZnTkN4MDFmMDI3NXFvNkpVc1NvTnU3NDEz?=
 =?utf-8?B?S29kS3RZSnRDZ2ZvTFIzci8rYnczZlRyY0lzeisvelp6VENCOUVnZ25Kb1E5?=
 =?utf-8?B?eDc2T3pUcU0xZWwraXl4bElHM1BkMmJPWnpoMGpOT09zdS9paUdXVFVPekFG?=
 =?utf-8?B?VDQ2cFpvSjBXN2s4S0xHa08wQ0tKU3QyOWlJZkNBZ1ZXNENsMWVaUXE3WHhX?=
 =?utf-8?Q?/U84335KvDCe7T1A/l5XLwYGC9czW8mIM9bEo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(376014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkhzWlRGZ2hrRVVzQy80bFh1QXl3dVFEOExqMk0zRU9QNCtOVHBZSk1QdkNN?=
 =?utf-8?B?NDh6YW9SNHA3ZkZaYU01UngwOFViSTB4SFlkY3I2ak1ndVlBUkZHY3JTRVhm?=
 =?utf-8?B?TnVwOXJ1Zk5RU1FQdFVkWGM2SDJhbGtsek1PblBoQ3pOZ29wQndFZUdZbjBa?=
 =?utf-8?B?QWNSc3R3K3QzSXRvTysrTmxXNDM3VURlamJINU5TNXFndForY1BDYVpwYXlE?=
 =?utf-8?B?ZXYyT0V2NWlmK2U5Zk1DYXloY2VHWHdKeEdrVGcyZ0hqWklyVjlBRzRPL3FS?=
 =?utf-8?B?RVhCc0JLbWwwaktRSkdDZGk1QnFhVDVLU0JpbktDcVhQWURYaUdVekVLVC9V?=
 =?utf-8?B?VHJEeHZhV0RiNHBTSE1CQXNUWjBSQWlJdi9LUktjYWtCNGZDR05kWldIbmpZ?=
 =?utf-8?B?anVDS1pNckVPL1BDdmJFQlI3V1c1d0NUdERoNVExRmxUbzM1czIyTDNaMHZV?=
 =?utf-8?B?V2xLNG5wSE9VOU1PNlV0VnhjRGw0WWx6bWdyVVJRVldDSkFrZU1yc3FpR3l2?=
 =?utf-8?B?bHRlTVl0VjM2ZGJLN1kzVHJTOTNsT2RTQVpMSWMrSlY5d1VVaFBncGdJN0da?=
 =?utf-8?B?R3RvR1BUVWplNEZqOXNaYXZ3aEQ2cXJvTzlhUGxOMmRMb3lnU1BmZndVQnM5?=
 =?utf-8?B?ZS9wa0d1b2MyUTBhY2c1aEE3L0NMWFJIVHBSMEt4UTJyeFhqVGQzR3lMVFVj?=
 =?utf-8?B?bWlhZjZtSG1Lc0lySCs5VVZ4dnFHRUZ4VWxwdGZ6MFVBc1gvaFVyY2hZWkRt?=
 =?utf-8?B?TW1sQ2krZ01adi82K3FUdWFRU3F5SmNxQUVCTEdQZ0FXZDFub2FoNWNvMStG?=
 =?utf-8?B?ZmQ5ZTRyeGdkdk9ReWRPN0pkVVI0QUpFZHlFdVRCYU1uU1dVbmFQNzg4bEht?=
 =?utf-8?B?elI1bFVaSEpmMEJrV3VTYWFSSnltamFiNmZKcEl4RmlFRkRhZURySm9iUmRP?=
 =?utf-8?B?TTBwSUhzWFZrOU0vcTg0VktpTjFFa0xIc1dCVVcxdmRmVEJxWW83T3dZdWVY?=
 =?utf-8?B?clIwSmtCTDlpdG91YUlMMGxZVkhrWExIWWxyZis0VFVnZXNFeWJ4OGxnOThi?=
 =?utf-8?B?VmtzNEwyNzVWUGQrNThGNUNXQkVYS041MlFYMTNIb0F5NzF0TW91N05yVUtC?=
 =?utf-8?B?WS9IaHVCaVRMWUVXYW1vOVQ5SEg4S0QrL0VTUStCME85eFNvTE9JNVZ1blV6?=
 =?utf-8?B?M3MzRktsSXpjOXpBeGJCZmt3WnpIeURJSSs5L3Y4MjRWVzhRVGFjUjhCM2Vv?=
 =?utf-8?B?VDFCV0hhcVJFcWtJd3g4QmhMU011OEVac0dvdFdUaVZLMmdOL1RvcW53N1lL?=
 =?utf-8?B?ZnF2blg2WERZNlBlcWdTVzFpazgwRW9xZkQxZ1A5OGJmUFRTL1VkcGd2OSt6?=
 =?utf-8?B?dm9xckl4amNRR1ZTWWVnN1ZmVE1Bb0FpQ3BoZDdVaFJ2bVY1c2VLbm9XNmNz?=
 =?utf-8?B?d3FRYUMzNWp0K1U1WVBsOXptNVBsT0R5S1JMUEQzTTFTMDBGOHNYT0EvMzVD?=
 =?utf-8?B?QVRVZG1sdjV0SHNjR0NITk5yQTlqaGk3QlVBbjRFbWJIcFlSN1FwZEVkaDVH?=
 =?utf-8?B?cW5iUWxIanphMUVQdlpJUUtFQjJRWW50U1JHZHM2enhhTTR1Z2dYYy9ua2hh?=
 =?utf-8?B?Nmx6Z2grTlFsMy8zN1NTejN3ekMxeitpQlp1SUN2YnJNQklFYXpmQnFtMk5D?=
 =?utf-8?B?Qm1HL1BQUW8vZGhxbmJNNjIxMVl4Tkllb2tWOGtKWUJhb003TVBPSVdJejRa?=
 =?utf-8?B?Z29SenZtYVgveGd5OTA5UEh2bWVITWM1Q3dkbmtQejBiTjZKQUNXbjNGL2FO?=
 =?utf-8?B?c3JCRzdVWDRoRE9DeWM0aDdhVTBCeHc3RGdKd2tmYy9BSi9XYWtmUXo3d1Rp?=
 =?utf-8?B?L0hNY0F6QmRyL1V4NFIwQUd6Mm9WR3kxeSszdDAxQzVFT1R3bFlZRmdtWG5k?=
 =?utf-8?B?TlVDeFY0STBEa3NlV0FrY1hYNUF1TlpyV2E3RzZXSVBkMk9IZEwzUjlEclU5?=
 =?utf-8?B?WkV0NDdFU2h5QVVCdEp4MW5heElualZBaHhCbWQrVEJyTWwwUWlqS0RZZTQw?=
 =?utf-8?B?ZThWRlZ6cHdaWW9GcEZzSmxTUy8vTVJvK2oyV3YrRHdZaVFYQkZKUzF0c1Jt?=
 =?utf-8?Q?2yv5Mi9f+hMYYQ1ItN/x+1CoU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 650eb29a-d15a-43c1-a02a-08dd8c324855
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 00:09:34.7433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: cc95de1b-97f5-4f93-b4ba-fe68b852cf91
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbGr5ZF07nPLvkwx3jfiwesUC0OmQ0y4/f9ADQr1M5DMxVQIlaugKbONghJIIHO5+HSP/X7HvfkzsMma2CZJbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6160
X-OriginatorOrg: magd.ox.ac.uk
X-NTG-DKIM-verify: pass 

syzbot found an infoleak bug triggered by the az6027 driver [1].

In az6027_i2c_xfer, the return value counts the number of messages
passed to it, when it should count actually executed messages. As a
result, i2cdev_ioctl_smbus can copy an unwritten buffer to the user.

Introduce a separate return value counter that only counts executed
messages.

[1] https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb

Reported-by: syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb
Tested-by: syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com
Fixes: 76f9a820c867 ("V4L/DVB: AZ6027: Initial import of the driver")
Signed-off-by: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>
---
Changes in v2:
- Added missing Fixes: tag to the commit message.
- Apologies for the duplicate email; it was sent unintentionally due to
  an issue with my email client.
---
 drivers/media/usb/dvb-usb/az6027.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/az6027.c b/drivers/media/usb/dvb-usb/az6027.c
index 056935d3cbd6..be9cbbd4723d 100644
--- a/drivers/media/usb/dvb-usb/az6027.c
+++ b/drivers/media/usb/dvb-usb/az6027.c
@@ -957,6 +957,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 	int length;
 	u8 req;
 	u8 *data;
+	int ret = 0;
 
 	data = kmalloc(256, GFP_KERNEL);
 	if (!data)
@@ -976,12 +977,13 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 			req = 0xBE;
 			index = 0;
 			if (msg[i].len < 1) {
-				i = -EOPNOTSUPP;
+				ret = -EOPNOTSUPP;
 				break;
 			}
 			value = msg[i].buf[0] & 0x00ff;
 			length = 1;
 			az6027_usb_out_op(d, req, value, index, data, length);
+			ret++;
 		}
 
 		if (msg[i].addr == 0xd0) {
@@ -1001,12 +1003,13 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 					msg[i + 1].buf[j] = data[j + 5];
 
 				i++;
+				ret++;
 			} else {
 
 				/* demod 16bit addr */
 				req = 0xBD;
 				if (msg[i].len < 1) {
-					i = -EOPNOTSUPP;
+					ret = -EOPNOTSUPP;
 					break;
 				}
 				index = (((msg[i].buf[0] << 8) & 0xff00) | (msg[i].buf[1] & 0x00ff));
@@ -1017,6 +1020,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 					data[j] = msg[i].buf[j + 2];
 				az6027_usb_out_op(d, req, value, index, data, length);
 			}
+			ret++;
 		}
 
 		if (msg[i].addr == 0xc0) {
@@ -1035,7 +1039,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 
 				req = 0xBD;
 				if (msg[i].len < 1) {
-					i = -EOPNOTSUPP;
+					ret = -EOPNOTSUPP;
 					break;
 				}
 				index = msg[i].buf[0] & 0x00FF;
@@ -1048,12 +1052,13 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 
 				az6027_usb_out_op(d, req, value, index, data, length);
 			}
+			ret++;
 		}
 	}
 	mutex_unlock(&d->i2c_mutex);
 	kfree(data);
 
-	return i;
+	return ret;
 }
 
 
-- 
2.39.5


