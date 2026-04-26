Return-Path: <linux-media+bounces-59633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBlkG0Uf7mmRqwAAu9opvQ
	(envelope-from <linux-media+bounces-59633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 16:20:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5F746A4D2
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 16:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B2D0301653D
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 14:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F20E364EA5;
	Sun, 26 Apr 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="crxWSXnf"
X-Original-To: linux-media@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022077.outbound.protection.outlook.com [52.101.96.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830251F7916;
	Sun, 26 Apr 2026 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777213237; cv=fail; b=uEKc0fl9ZmaJ5JsaAB5pchxP+kRwDuCqPas10imgq0VHDBz7O9Gt5W3V5ss5WUWvJhd0YSJAZvRJfuLPIlSgOa+kRXSyuqhpLqnaHKZv6bySvOuthMiWK8ud0SbKw/tND8PxcESUC5Tj2chR9/4PgYIic/Rr4b7q6TMb0DSRgRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777213237; c=relaxed/simple;
	bh=Fl2Dlm879ESdDf4SdyYSoC+9hnln6BGlzuxLmOrZEGk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=aRPdAAynEiDALk8dM41rd5cMdEC+mm3J5ggauUDSJFsAxueuOZY12NhGWFvxOOnE3BdipvdEkb0ZjLc1s/Q9LiSX+iTcTnPkrAX82gyEikXGn+RRV8aW4hn+r2nL+rWo1bWdG6OMlTotKNEoqQ0FIpLjYM3puTfcY+ZnfPm22Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=crxWSXnf; arc=fail smtp.client-ip=52.101.96.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSdEFgTcGfhBPMJXgr5w8JhJjMIg4FfmQxwfkvAGGBevI4QGo/wKcfj3YPLlnRHMxqgi2gZnNQikDS5lnqc/+2j7+pMwPt5ZpJj7J9HY8Wm1R5Y/XM8nnwNJzBBJxcU3PyEC+4+3+vzN0zoYgYh1C5HP74s5Bq+MQYxzTxprIcbz3Iwy/Mb7K7jSUNTfXNMcwTnN0dmZaSHseIA+XuFuK4Ap6H6k0T5LeDlkGApaL2rYII1TAlz9eJCjWjTi+BsswmHb4WgyrQ5ScrWCntVymOPmXLHzZ/j9BDG6atW60a/oee+gZElLmZV8jLnWj6WNjX93AHTNP1xD3JtT/WsRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFjjlU+u92aIfJdIjkWHPqi1RWeexZS8Gp+GPDyW+zI=;
 b=nZY89yKOYqimWSiFXLT8xrIeJ5e9nOIbHqIB/PVc7rzYyK/llYf5xolb91Q/6801sLb43XAwUBC8mOO7RsOrse3bawi1ncPNozlz2qeUyxR77kU6UUpL4Obhawc1YxlHdX9y8xZk+IwISoRAfRCLlnc/DwVqBf2LFpkd6KnbY/xxKPtYzoOKCc70quutYvEij6vKwmLikM6ZSXxceZMIbUvuTGN2qehc19Tu7p8VgnjJlE6os/FZMwZqaGlaFg7VKDDtAW2uxRzn3Tjl4afmUpGbhxlGxm189PTW4B5C3ss+8IFqD6g5uf0kQWDaEd6dRGRSD22ECXwiNTGFjAFSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFjjlU+u92aIfJdIjkWHPqi1RWeexZS8Gp+GPDyW+zI=;
 b=crxWSXnfTJqlz9QF0elEylEE/UPTuPMcmfjO+T8yRDRP498N6QeaChMiyLBIzW6NhjgplLDCiiKaCBJrfqhVad9ZBMpo1f6H8biicgvYhYxXGAOUq5DEt9mOqXaaBSvwOXP780tE6cD8QDtRtDeSIMaKWYJUhK893S5FZorwuUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB9250.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.23; Sun, 26 Apr
 2026 14:20:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Sun, 26 Apr 2026
 14:20:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Apr 2026 15:20:31 +0100
Message-Id: <DI35IFD8M019.2WGRH5ADW6NOG@garyguo.net>
Cc: <maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
 <chleroy@kernel.org>, <peterz@infradead.org>, <jpoimboe@kernel.org>,
 <jbaron@akamai.com>, <aliceryhl@google.com>, <rostedt@goodmis.org>,
 <ardb@kernel.org>, <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <dakr@kernel.org>, <nathan@kernel.org>, <nick.desaulniers+lkml@gmail.com>,
 <morbo@google.com>, <justinstitt@google.com>, <tamird@kernel.org>,
 <arnd@arndb.de>, <nsc@kernel.org>, <simona.vetter@ffwll.ch>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>, "Link Mauve" <linkmauve@linkmauve.fr>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
From: "Gary Guo" <gary@garyguo.net>
To: "Mukesh Kumar Chaurasiya" <mkchauras@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260424054742.45832-1-mkchauras@gmail.com>
 <20260424054742.45832-6-mkchauras@gmail.com>
 <DI1E781QPU8F.1C28PL0089NP6@garyguo.net>
 <ae3C2gqzoVaovY-h@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <ae3C2gqzoVaovY-h@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
X-ClientProxiedBy: LO4P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: d712c940-9cc6-49d4-69c3-08dea39ef98f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Hbopwm2jPZA7jTq3nkGxDoNLGFNYrTTMAw2dKD1zlsjC73idePJsDDElG8jzAqo5APysbIq9lf/fj4auv4aiiMLbGLxyTDcawUA5PRXPHwSsnetOuKlJUSjB43ePZ+RhKCayrT1yUz0uF6REnsbeqgm28pALZ/ny1pYNKtYF2w7MFQSy0h+ptJP5opFm5X3sZsmEks4BaPW3/Jb7OHPZuBLwk5j0aZc4h969iKnukf3VfPfYFWTMqzv9mYtyvoT0l3c8zC3qlzZE35geWAF61Cbyg7apZT5TrX2EHZk3PR9tYEpwd4DbXLzcItB6RFwsLzGDwArChcgTxHx/zZ60wL7uagpjUykA6CR7i8VrU2mDToSue+hKNQhlEFXNhNZ53X+KybLRzQ6zbyt7NTB95aCUKNOFR/stRN8R/o05p5WGdGSAuw7MR7Ue/zZRKsVJniu43FvsTSm27PJ1FtDuU4/RMjdYySy+bfCmd0yIT9CFLIEL2gzHamZyH2A3s17K3ipE2M/cjn4MvyAkbpKarJMES9mF20UFO/JIAypnCgfzGbr6VTO3DIL0dcypjpjuWRGP2KId8rgGY92Aspwjfw6U/P7BuUnk/8m/Vo3brVauyt3roLvtvKD1bt8L1KQoxbuhuuIliu7jbQoCbccA8cusxh1j2i6JDlKoWh5bo/CnFUxDvP7wtjG6ZHnbfhi0RKZGTQRiVrNHgUdnyoi+zC8myfttM7P0fzOvls1J0l4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ris1TDZoZEtXU29PZEJlL1lTb3NSU1ptcDRoSmc0b0tiUmZXVERvdzFPaDJt?=
 =?utf-8?B?eThsL0cxek1TK1BBM0lNYlVRZ24xSEttcC9WcG40RG96cE1od2lVMUVaa1hB?=
 =?utf-8?B?QXhqM0lIajFEQVNtMG1yVnBPNG9mQVR6SkFlQThaQTJIb2lNQTJwTXhVU0dL?=
 =?utf-8?B?VTZMOEpyb1VZTmJVbE9Qc3BQZmNYdWh5VnhXdUt1bkJ3elE3VnVkYk10V2J1?=
 =?utf-8?B?QjN2UXdzWWZ4WjhaTWZ3M3RFazhGVlFOdDFqRGVOUmpmNGhpNFZxNFIrcGQx?=
 =?utf-8?B?dndacTQrb3ppTVZmS3Nyamp3djg2WXdpb1JiZTlzYmhBNk4zdlJHLythcCtF?=
 =?utf-8?B?bkVhRUpybWFKcDlyaTgzS3NKNnZIcHlMOHZIOVdjVnNuem81b2JoTkt3V29k?=
 =?utf-8?B?UjN2VTBnYnAwVVRpcFN3SHowbHNNS1NmZ2lJVnhXcXBUcmFaWDVpeGFsTzFo?=
 =?utf-8?B?R3JpRHdBQWJZSmR0dkpxZTgwUHY0eHJPM3RvSUUxTXg1bkNJajJWOEN2TnJ2?=
 =?utf-8?B?dE9qUXkwTTFmOVZiOEd6T0JBc2VzSHJmQXZjeW1OVnZ5K2J1MStKNUlBNDBn?=
 =?utf-8?B?ZFJDYSthSkpzNGtPNzRsSjVjNy83QkUyL1NQamROR3pxdytjc1JaQlhOVGNL?=
 =?utf-8?B?My9aaWNiZ05PY3ZETUZBNEVSN255WG1FSlpQb0RQQU1DTGJubUx3NkxOaC9E?=
 =?utf-8?B?Nkx2Mkgva0p1THFnVktvUmg3T1U4YVBEb3FaRGZZei9vREhlVjhWNTkxaEh4?=
 =?utf-8?B?WHZYMmQzK1d1TW9MWHgvcTZjVWcrS3pSNTZER2RqSE1GdkJ2cEtXdy9TRjFr?=
 =?utf-8?B?MHVZNkxkS3VBYlpIV3ZTSmZNMW1yWXkyZFBTVEVsOTd1N0pacTNxL1pqaHZw?=
 =?utf-8?B?bXZ1Z3NrazJGN1hINmhnelg4UzloazhyRUpUVjdGTEJUem9DK1Y0VmU1ams1?=
 =?utf-8?B?R1ZuQXl4R09oU2dDSGE0UHZmZHpmWmF0My9EeXZ0L25jVlpVNUZINThmaVM0?=
 =?utf-8?B?V0V0TndjVDF1Q2I1UjB1bWZrN0tadWY2ZkxpRHorUDdBK29xbGozZDAxb3k5?=
 =?utf-8?B?dUVIZWFMUVNlZ3pubXBUcmVGRjNBakNxaVVoa0VVWm1tbU9MSDBZcXZwTStp?=
 =?utf-8?B?c2FtSDNMNTY0aWdOTlU4S1M3b0V5dEVxM3l2NDdJbWl1Q0hRdU9BY2tkMUU4?=
 =?utf-8?B?a0FjL0dtK25odk5qM2pNTE5UZFhXcGlrWTdSaHlTM3hqVnlEWnlHZW5LU01N?=
 =?utf-8?B?SlNLZnRIR3dEUy9aWi9HM05LRHgvQi81b1lpL25GQnUyY2VHM0t2a3FESDd4?=
 =?utf-8?B?cEFHSjJQWDNqNURiTGNwUDNXY2VrdlJHeEVycHV1NGY5MWlZY2h3NHNJMXI1?=
 =?utf-8?B?TFNsWlVvNlhwWnpRTVozckx2Nk8yMWFobkYvMlVPN1lsRnY1UGtRVFRwQVpj?=
 =?utf-8?B?Y0txSkpvUSt6bU9SK2xCbzBGT296SVB1R1hERExldHhOQTNVa0syd0twdUZl?=
 =?utf-8?B?QitwRDJieTBFWW5DZ0U0aHZTZUdwTFo2c21XZldZd1FIZC9rQ1J5QXRHMGZW?=
 =?utf-8?B?OVZRMUlxT0Q5RVVwL0w2WlNVamU4Ri9RZVNkL3BFV1pSV2k1U1g0WlRrWkxR?=
 =?utf-8?B?U0FWM2tNWVhHRkVQeU9YVlZWL0JKeTAwd3lEV2MvTUs2ZjFETEpYNUV0K0g4?=
 =?utf-8?B?SnIyWlA4TU9xbVU4amRIL3U2RFpCVkprVUZtYndSTm5pTzZOMzVvWEwrNDBo?=
 =?utf-8?B?MGR1ck5BT2RsVXBsWWhDMFZFcHBtVGFQUmxKYVBrSStUMUxZcDc4em52YlRC?=
 =?utf-8?B?Q2VYRGNQUHk0b0RhWlJEQkV0M3d5MjQvTEhwak5DNUMwTWhscWVrWlh6Qmx6?=
 =?utf-8?B?L0dZS2w3UkIwN0dSUnBLRHpwNjFuaHB6WThvem5ySk5UdE5DUlhMNHJzSldp?=
 =?utf-8?B?c3hweis5aEV4VDFqQ25hcytqOWFoNnpiMlVvcGNINWVHcmgvT20vdDFDRTdv?=
 =?utf-8?B?MXljUVVkL21WbzVRZmFSVWRiQzdBeUw0RWZ4am1BOFpxU0dJemJBSGprV1ph?=
 =?utf-8?B?S05UckpsMzFRUC9mYVRnOEhGVnFQcHV5M01VMEdxYjJldFllb0s0MFY1UjRw?=
 =?utf-8?B?U3BZTi9EanpJVFQ1T0xaaUwrdUdMY1c0RDVLQTc1eENseFVpYlZIS2djNGRE?=
 =?utf-8?B?Uk5wL0lHcWppSG9vQ3ZjZUV3N3ZZZDlBWnoySHUxRzlqL2pOS0JWQ2lTTm91?=
 =?utf-8?B?L0kwMXdEVlRkTGpnVUdja0lwYldPZmpVTHlyTmtmZnNjNnAvN3BnbmtuSDE5?=
 =?utf-8?B?UndjbHlOZHhIaGFGd09OR3QvS1VSd3hVTjhITWt4RVU1cnJWa3NkUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d712c940-9cc6-49d4-69c3-08dea39ef98f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 14:20:32.1214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKDTle5ekvgHm44TV8Od/Bip2XYCPZreg7JAEmkIUugyRoXNRTHPrIEkB4Yt4v9bcs1W7CgW/P+C/lCTjw7zaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9250
X-Rspamd-Queue-Id: ED5F746A4D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59633-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,garyguo.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,linkmauve.fr];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:mid]

On Sun Apr 26, 2026 at 8:52 AM BST, Mukesh Kumar Chaurasiya wrote:
> On Fri, Apr 24, 2026 at 01:43:43PM +0100, Gary Guo wrote:
>> On Fri Apr 24, 2026 at 6:47 AM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
>> > From: Link Mauve <linkmauve@linkmauve.fr>
>> >
>> > The core crate currently depends on these two functions for i64/u64/
>> > i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t us=
e that in
>> > the kernel so let=E2=80=99s panic if they are ever called.
>> >
>> > This doesn=E2=80=99t yet fix drm_panic_qr.rs, which also uses __udivdi=
3 when
>> > CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy, but at least makes the rest of the ke=
rnel
>> > build on PPC32.
>>=20
>> Can we always build libcore with `-C opt-level=3D2` even if
>> `CONFIG_CC_OPTIMIZE_FOR_SIZE` is specified? It feels like a better fix t=
han
>> stubbing things out.
>>=20
>> Best,
>> Gary
>>=20
> The issue is not coming from libcore itself. It's the driver that's
> causing this.

Sorry. I quoted the wrong part. I was asking if compiling libcore with O2 g=
ets
rid of its use of the builtins, as that's what the change this commit is fo=
r.

Formatting of u64 will be needed, so we should make sure that these works a=
s
intended.

Best,
Gary

>
> Regards,
> Mukesh
>> >
>> > Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
>> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
>> > ---
>> >  rust/Makefile             | 4 ++++
>> >  rust/compiler_builtins.rs | 6 ++++++
>> >  2 files changed, 10 insertions(+)
>> >
>> > diff --git a/rust/Makefile b/rust/Makefile
>> > index 2a5428a5503d..ee11fba7a03d 100644
>> > --- a/rust/Makefile
>> > +++ b/rust/Makefile
>> > @@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV)=
,$(CONFIG_64BIT))),)
>> >  		__ashrti3 \
>> >  		__ashlti3 __lshrti3
>> >  endif
>> > +ifdef CONFIG_PPC32
>> > +	redirect-intrinsics +=3D \
>> > +		__udivdi3 __umoddi3
>> > +endif
>> > =20
>> >  ifdef CONFIG_MODVERSIONS
>> >  cmd_gendwarfksyms =3D $(if $(skip_gendwarfksyms),, \
>> > diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
>> > index dd16c1dc899c..fc6b54636dd5 100644
>> > --- a/rust/compiler_builtins.rs
>> > +++ b/rust/compiler_builtins.rs
>> > @@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
>> >      __aeabi_uldivmod,
>> >  });
>> > =20
>> > +#[cfg(target_arch =3D "powerpc")]
>> > +define_panicking_intrinsics!("`u64` division/modulo should not be use=
d", {
>> > +    __udivdi3,
>> > +    __umoddi3,
>> > +});
>> > +
>> >  // NOTE: if you are adding a new intrinsic here, you should also add =
it to
>> >  // `redirect-intrinsics` in `rust/Makefile`.
>>=20


