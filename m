Return-Path: <linux-media+bounces-26957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 942ACA44194
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 15:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F9737AE910
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B7326A08B;
	Tue, 25 Feb 2025 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="qNu61WLI"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023076.outbound.protection.outlook.com [40.107.162.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668ED269CEC
	for <linux-media@vger.kernel.org>; Tue, 25 Feb 2025 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740491876; cv=fail; b=YYFzGliWamPwvWolCk17w2lnTZIjLpAQrhOwnePwW5v9Qt3n2Gfy7P+Wt4xQzLEd8l/aifkSAfZ23RIPwIfwxg+s3c2ef8qTa0gl9XapMrDDXGeTrZj8FJ8I04sqoZQyeugxRtw0XN45+WepWq8SIa2cz8GzITWucNXbWsjRDq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740491876; c=relaxed/simple;
	bh=oscfNvOaKpfSEZwtyOSeCUz5SQ9mXVQdaUfY0tbsE0U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BAaNa1zclh0YZ0+lmtuMo3Qng6HOvLM/az6Bf+nnoDhkYhqSTNoK6szsj2wiiQEuUCXA38P2bY60gpL/MlNxh17LBQZjCN0UC4+GDMkbw2KGl84KCvHfB1HPGZFjNm0dBeS+tXJ5LYyryKvr/ETBm4xJDoN/kH3oSFKEY2QLNc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=qNu61WLI; arc=fail smtp.client-ip=40.107.162.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSAyWDindk/8mSNTbDjS9ZkiSwkE4iB1lS6q/E/Vl1pMy4Mj992JaNVsnMxZYyDYQ0zzZUr8AM+FM4rJP6HjmeYykGIUHN2ti3dwvTQDt0V4RlaBEwggjxpKF4ix3ePWLb0esgEGR5gz3QkYdTGA3CRZJW3pw+XqmdAH9WDU279ivd9804l9MzBY0VqkXxgX7+sjN6lSvuX2gWbU6CwyMQvMlD9guy6MBWypk8iNKVGvaoafW7QcghlsihpUxFjXRSiMOcOMg1uIzAqxKG+MSHQ7Ex6mSnpUfCREVBiHdWuBebUqP7TlisgGbxl5GXBJ+u5ToLF6tQmq0fhvEwzJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oscfNvOaKpfSEZwtyOSeCUz5SQ9mXVQdaUfY0tbsE0U=;
 b=X5NwnF3wj19LWaJP0p6xM/PM535wxeXPTJKaVHLISpS+W8xSmpxxq5D4IcOrHkEYRNdaqQfQ/cQbhaMLgB0DLefJ7gnEZvPgSG45wj1fJMu5PCnfgbi4U2afc5DISyeL5fDeqE7r7O/oLmNoPZTR5bUwzcEjWLjivVximQoAZARU/vcocK5OPiDERt5uZYZTpJSzo3+kfiium71AEcnngZnROBq7ol1Ojvq6QvpW+LDR3nlxrthUm783bLPlqOaWQMr5BKsp197gm5fbjUGyjTD5EhZ0Xk/MwjqGkkxjE2fpP1yduT/qqmQb5uPS40OWZshWL2iUuXDRrvf3LKh5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oscfNvOaKpfSEZwtyOSeCUz5SQ9mXVQdaUfY0tbsE0U=;
 b=qNu61WLI4w2ZykycQNMAjtCtKdoAmFKFhK9alaZ9Mae9JLiC2JXuKRzJAwVvdhVt7zEMZlFomnWKWrM7QU/cpd4nXs3V0aot5Wv/9hEDjkDgAZ057yxjIYQOtBvi/4CN80C/vWNiaAVvSsnfW/A0TV8WEGGwO87NXEW37UkwoIQ=
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com (2603:10a6:20b:512::15)
 by DB9PR08MB7422.eurprd08.prod.outlook.com (2603:10a6:10:371::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 13:57:49 +0000
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726]) by AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 13:57:47 +0000
From: Gerald Loacker <Gerald.Loacker@wolfvision.net>
To: Michael Riesch <Michael.Riesch@wolfvision.net>, Alexander Shiyan
	<eagle.alexander923@gmail.com>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 2/4] media: i2c: imx415: Add missing ADBIT1 register for
 setup output format
Thread-Topic: [PATCH 2/4] media: i2c: imx415: Add missing ADBIT1 register for
 setup output format
Thread-Index: AQHbgrTAiq2byrQW60mNtT/n8tVN+LNQZ3gAgAAi94CABzLngIAAV75w
Date: Tue, 25 Feb 2025 13:57:46 +0000
Message-ID:
 <AS4PR08MB7735CC3C1EB6625F3A07FC47F7C32@AS4PR08MB7735.eurprd08.prod.outlook.com>
References: <20250219094637.607615-1-eagle.alexander923@gmail.com>
 <20250219094637.607615-2-eagle.alexander923@gmail.com>
 <CAPY8ntC4MbKBb6j9Xj4+=U1G3bOAZuxS9kMdHtTBWwX3AOHuuw@mail.gmail.com>
 <CAP1tNvQ77CuBAWrkySQvYhXngHoDfbkYaz=zE+74V6__aKUunA@mail.gmail.com>
 <3cf56fa5-00cb-4fff-9fd0-d0b832c33e10@wolfvision.net>
In-Reply-To: <3cf56fa5-00cb-4fff-9fd0-d0b832c33e10@wolfvision.net>
Accept-Language: de-AT, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR08MB7735:EE_|DB9PR08MB7422:EE_
x-ms-office365-filtering-correlation-id: e8169d38-6929-45b9-4090-08dd55a46266
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dmQzQzUvTHZXVzBlTFJoQStmdlBvNkpLUlpFbXphb1BPSnhFWmgxOVc0aWh1?=
 =?utf-8?B?anJoRy9VT0pLTzJaa2h1Y0NGZGdxeWY3RkkrTU9haTlMLzk0L1Y3azJDdkI0?=
 =?utf-8?B?ZVpmWE5ZTWpkTnMreEhpVkI1WnhOeDBibHRKd3lCcUdHWUc2QTdJdWhYZERw?=
 =?utf-8?B?bkFRMm0zWno2SDJjMjdaVFVNYVkyajdqSnNiaXpTTU1xS3FCQlV1bzBsd3pq?=
 =?utf-8?B?M0VxRjBpU2xvMzk2R0dZMVh2NjZDT1N1L0VyOWRYMGsxcUgxZXhQZEhCVUtL?=
 =?utf-8?B?L2draDl1cVVlNjRvRHZsY3F6Z2pwTjhIS3Q5RTgyUlB6RS9tUnVwSUhmK2Uz?=
 =?utf-8?B?N0ZQOUxlanU4YjUrTHBST0FEVDhwM1Z5RWVOcnA1Z1lnVHFjUlA0MzJxcGlS?=
 =?utf-8?B?L3pLNzJtd2U0d2d0a2k0OEZFNXNGM3laZGxTeXo0SGJKbjZ6eFNqVkQzUkMx?=
 =?utf-8?B?Zk5VbVJ4cDRtMHJQVWZZUGhmZXN2LzdrdDlTQkN2aWNtT3RwSDYzOVVZZWVs?=
 =?utf-8?B?ZVpSV0VtZDlWQU9wNGtjUXVVYlVkY1hEcVBBTlpWRUVBTmZPdm1QUHRDNit6?=
 =?utf-8?B?MTl4SlljQjB0aHJERVMvencxa1UrcEtpMnFhaSt3anlaQklyRTNoVmR6eTZp?=
 =?utf-8?B?RWFIRUxMakg2N2tHdWY4QmxHWXh3ZVBxTmNjeEFmQkhVWUpjSVI4cXYvelV3?=
 =?utf-8?B?c2JuZXE3YUxpanhTZm55K1FZUXAyYlkvUGtkTy9YODFTeFVaYy8wUUJhVlk4?=
 =?utf-8?B?SmV1UXBvREw3UVFReFVSZzVDZEdWUWtTV3VFYW9EeU5wZzNuOVVWRzh2UEtP?=
 =?utf-8?B?NW1FUlMvWnlFS240M2RTTjhQT0FEdlYrdE1vSDdORkxtMWdTVzQySmJXVk0v?=
 =?utf-8?B?c2NQa2JzZ0tBbk16dmIvMnJjeG9nTjZjMktpTHFiSXpqa3hCV2d0SWhhdkxk?=
 =?utf-8?B?S2dVUVR2UHBPMXZXejJ2M2Z0dnJGeW1vdmtxZnBxYk5sVW9nOGtJZUFtdjlv?=
 =?utf-8?B?bGI2S1RLYXFseUFsdTVKQ3E3ZTFZNVFwcGdmQXJpd2FSTDlINHR0dU9sVkNm?=
 =?utf-8?B?V1ZEQllGMTlQRmx6SERjRnlMbElaZnJiOHBuMy83UlNTSldZNHJ6bGpydmlv?=
 =?utf-8?B?bHBjNWN4OGlIeUVQeWI1U21JNkJibkdEV0Zsak5senZ4WG45TUdMeEZTRWR0?=
 =?utf-8?B?WlZxSDlZTFRHTS9ZZm50SlJ5SHByQWE5bWh5SzJiNW82YmcrWFJFbGlnQVhq?=
 =?utf-8?B?QWFWMXNmaXhjRzhidjVhcW1xekloSENjSWdaMEI2SzNXK1prWmt4amh5ZHhT?=
 =?utf-8?B?N1RhMlJlQWNZVm9pQm40OEpUaVkzUEpzdFZrbUc5RzkzNlVLekhTQkcweTg3?=
 =?utf-8?B?cTEzNFRkSC9iaEovUWpNU1dubDdEYU5Tdk5yRVhSZFZOQ2VtZFdIdHpYZ1Vo?=
 =?utf-8?B?cHhUeUoxOWFUUlRLQnpMdDdVNG4vTldRc2ZTZG9IWVVPb1o0MTYrN2gzREFY?=
 =?utf-8?B?Uk9GazFsYmhEdmJKd1dDNk0zNzVnM1Byd0NLZU9BdGo1V0FjR2tLeHhtdXov?=
 =?utf-8?B?Ry9zM0I5citZSlR3TzgwNERXOHRrcVFXL0lLTm5FVkE0WjJBU2FZbUxVMVEr?=
 =?utf-8?B?TDRWZFNyQlBFM1FqZzA1M0lKYlkvMWV0Um9UTUFGWFZqcHB3ZnBYTi85VlFE?=
 =?utf-8?B?Q2dBUllwRFpBR3M1RXJzdmI5MjFkMHBiU0F1R3BwYTM1S05FWHJtVEFma00r?=
 =?utf-8?B?eHY0bFI2elgwQ3paVktWVXh3aVVNRERwZ3BrdnlNdkN3THBvdVpxeUkzQXgv?=
 =?utf-8?B?QitSemV6cWk4Q0VUaDBVVjMvZTJsaVE3SUZBc1paRGtyd25VNXhKeFFEbSth?=
 =?utf-8?B?c3BPaENkTm5Hb2RYRzY3ZHJIemVYb2gwMjFOb0FXSVQ5RE4zRXR1dFZqWEU4?=
 =?utf-8?Q?Er4JlKZRzK8Ckhg46H8J2WRHregHlwyv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Um84bWNVbnl5WE9ONlRnckVqTGhNM3ZmWUU1YjRrbVhmNUVzd09yQTFqK1JZ?=
 =?utf-8?B?R24yUmJGQjB3RUY4ZEhWbmJmdGFzeGJhdG40anJkdEFEMllEdTZpVjhNOWU3?=
 =?utf-8?B?Qy9iTjJINFl1cloza1lsWW1KdGN1ZnM0VXZTUlN2UUIzejdjS3R1c0k3RThh?=
 =?utf-8?B?L2dzQ1RvK0V6Q0JQWThhRkdUb3ZmWlNEL0VmOVVHcHVWSFdWOWZkOFpsRjYx?=
 =?utf-8?B?YlB4NVlYb2FSSU1OaTZIYS9zNllkODdjaG5pYUFubll6RWd0a1J4dWhlRHNX?=
 =?utf-8?B?Qi9ZNXdSZm5PNXYrNExrZmIxRVBVVUZWSTVrQVdkcU1oYlFzeWhSa04vdzNR?=
 =?utf-8?B?V2FCWkJEM1hrZFhKWjBoWmpyaS80K21WenpFak9Ld3o2NDVuaHN1NUw4N1ow?=
 =?utf-8?B?M1VFei9TWEdYWnFmcVFwV0FWa1l2TzN3dkVleFZHQS9oQlVHNUd4bjIrR0VS?=
 =?utf-8?B?R3NhaHlFaEpGMDYwRjlQY3pwYWs2aktXdTN6TU8vZTVWVlI4RCtiK0diUFRX?=
 =?utf-8?B?TUpBWUVPQ2JrSnpFSzdvN0d0aitxd0JyUi90czhqMXhuQ091ZzVqcStoZTRT?=
 =?utf-8?B?R2tsdE5IRmNjOXVDQk0yNE5najdVd1pwKzZBanRnM1lFQUhucmEwYUZmbTlK?=
 =?utf-8?B?eVpSUFBXcVQrMWpFYUp6YW9DZlBicEx4b0NHblp2L1FISElmbnlOQkhBc2lN?=
 =?utf-8?B?THZicWZOOUh1NFZtaUs0MnQ4elM5VS9wWnlVZmtLWUF2V28zK0lzSWJEeDJS?=
 =?utf-8?B?UFk0dnAyblYwa0w3SGl0TGtEckh3K01oOWhnZlhUdjRjYkZVMFRxM3pBekZF?=
 =?utf-8?B?R1BBbWszdVJkL0RFU2JTVVV6ZnpKVFg3b2FpMTMrSjgzb2loR1BDTUc1SVNk?=
 =?utf-8?B?ekRQbjdUTDJCTFMvajdNWkJGbjVIelA3eWRpaTY0ZGwrbFUrdGlocUJBTXhl?=
 =?utf-8?B?TnVnM3FiMUxtUGJWYUV2Qm14NW5QTmExNG5hTmhId09BR0NtbWNJZHNma3hs?=
 =?utf-8?B?VU9PbXpVVy9qUWgwL1REZ3QxaFltMWNKQnYvaEdiZG9YU2dZeTV0RXRkZTBm?=
 =?utf-8?B?ZVJueEtQQnBtZnQzeEh1VFJhZlRmeFpseEZDVVJVb3Fhdk0vQkdwREVHTFdU?=
 =?utf-8?B?b05mMis5QW1YOXEvSlhhV3JoekRiTHRwRlhzSkwzVEh0KzVlUE1DcmloWEZs?=
 =?utf-8?B?VmNsNVFVV015N2F6ek5NRHdMRVNuQ3czV0Jadi9BMHc3SkxWbHZvTTFINFI3?=
 =?utf-8?B?b0JEZ3NoTWVzMHJWS0RoS2dzM1FlWVYxeDlDM28rM1Vnc01sVTZJbjNQYUhh?=
 =?utf-8?B?V0ZsR0Z1cmhxMEhMMTd1MjBZT21SSE5Xd0tQbHNwVG5LSVcweUdZeWhSZm94?=
 =?utf-8?B?WXNGeDd0LzVJNzVVSVFDMXNNMkhWZDM5WmViSGpEM1BDK0ZaSGpoY2lzamxI?=
 =?utf-8?B?NjVvN3dKZmU4SjVMZ242ZUswZmtGaTMvelVVekpvWGpLR21IU1BBSGZ5djJ5?=
 =?utf-8?B?dHBtSk14N1IwYy9YRnhLRVZzNDZGMGpTSkZPWXZ5SUhncUtaVmR3L21xQ3g1?=
 =?utf-8?B?N1JYVEpnN24wT0pjM1ZHcnpHQ1M1ZmZ6dnowckNrQktlaXZQV3FOQkZScXBC?=
 =?utf-8?B?bVZYTy90SXBlSFptdGZMaUhyVDhUN1hlc2dSL3AyUWlrOHdQTEZQZ0lFSUdU?=
 =?utf-8?B?Y2hUSWVwMVRacjlaNU5GT0J1SUxwRmdxMFRUZERSOWRMeVhzZ2hHT1ZQRlVU?=
 =?utf-8?B?ZkpMajJrbVJlV0w5OVFsRnU2M0VqNDNXYUszcXhkcFk3Qml6MmNSaStoVVgy?=
 =?utf-8?B?NXBOOXUxWmNzcFozaWZ2SER0M3VDRTRJRHdqc3NvZStHZUM0LzBKRWJSc3Av?=
 =?utf-8?B?TndTOVFtWWtSRElrL0IrTDZ6S2JyU2dJcFF0Vnp1WW44NWQ2T2c4TWEyQTMr?=
 =?utf-8?B?ZU55SzRPNXFJZmRHOEEydG5TdjErODRGdW82d2ZNWTlMQlIyWXdpRnlsVzY2?=
 =?utf-8?B?Z29xaStXd3JjMFNGa3NOU3VQdUtyLzVVU25iVFZCRzVRVE9vc1Zpbk5GQzJr?=
 =?utf-8?B?OFk4MUFmZjZNZWJNakJ2Qm02ZUpMaDFFY1o0MVZuWU1sQmVPL3NrRkRoc2RR?=
 =?utf-8?B?aGZGekZmbitGODNrZCtCWHEvRytyNmJtdHNlWW0wMmx5UHZPTlVzY2VYb3Np?=
 =?utf-8?B?ZFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8169d38-6929-45b9-4090-08dd55a46266
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 13:57:46.9806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQqdcbdFgPE9SvFWr/Y1LlVyzuEpULYd6QL0BfgjEYia34HUC2ifImcSBSF+SUoeO0v8LRLnMvvgeHd0yjSuhIB1QyQbdKKP+FEm8KX6rB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7422

SGkgQWxleGFuZGVyLA0KDQo+IC0tLS0tVXJzcHLDvG5nbGljaGUgTmFjaHJpY2h0LS0tLS0NCj4g
Vm9uOiBNaWNoYWVsIFJpZXNjaCA8TWljaGFlbC5SaWVzY2hAd29sZnZpc2lvbi5uZXQ+DQo+IEdl
c2VuZGV0OiBEaWVuc3RhZywgMjUuIEZlYnJ1YXIgMjAyNSAwOTo0NA0KPiBBbjogQWxleGFuZGVy
IFNoaXlhbiA8ZWFnbGUuYWxleGFuZGVyOTIzQGdtYWlsLmNvbT47IERhdmUgU3RldmVuc29uDQo+
IDxkYXZlLnN0ZXZlbnNvbkByYXNwYmVycnlwaS5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmc7IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT47
DQo+IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgR2VyYWxkIExv
YWNrZXINCj4gPEdlcmFsZC5Mb2Fja2VyQHdvbGZ2aXNpb24ubmV0Pg0KPiBCZXRyZWZmOiBSZTog
W1BBVENIIDIvNF0gbWVkaWE6IGkyYzogaW14NDE1OiBBZGQgbWlzc2luZyBBREJJVDEgcmVnaXN0
ZXIgZm9yIHNldHVwDQo+IG91dHB1dCBmb3JtYXQNCj4gDQo+IEhpIEFsZXhhbmRlciwgRGF2ZSwN
Cj4gDQo+IE9uIDIvMjAvMjUgMTk6NDcsIEFsZXhhbmRlciBTaGl5YW4gd3JvdGU6DQo+ID4gSGVs
bG8gRGF2ZS4NCj4gPg0KPiA+Pj4gVGhlIGlteDQxNSBzZW5zb3IgaGFzIG9uZSBtb3JlIHJlZ2lz
dGVyIGZvciBzZXR0aW5nIHRoZSBvdXRwdXQNCj4gPj4+IGZvcm1hdCAoMTAvMTIgYml0KSwgd2hp
Y2ggaXMgY3VycmVudGx5IG5vdCBpbiB0aGUgZHJpdmVyLg0KPiA+Pg0KPiA+PiBUaGUgZGF0YXNo
ZWV0IHN0YXRlcyBpdCBpcyB0aGUgImludGVybmFsIEEvRCBjb252ZXJzaW9uIGJpdHMiIHNldHRp
bmcsDQo+ID4+IG5vdCBvdXRwdXQgZm9ybWF0Lg0KPiA+PiBPdXRwdXQgZm9ybWF0IGlzIHNldCB2
aWEgTURCSVQgKHJlZyAweDMwMzIpLg0KPiA+Pg0KPiA+PiBUaGUgc2Vuc29yIG1heSB3ZWxsIGhh
cHBpbHkgdHJ1bmNhdGUgMTJiaXQgQS9EIHJlYWRvdXQgdG8gUkFXMTANCj4gPj4gb3V0cHV0LCBv
ciBsZWZ0IHNoaWZ0IDEwYml0IEEvRCB2YWx1ZXMgdG8gUkFXMTIgb3V0cHV0Lg0KPiA+Pg0KPiA+
PiBJJ2xsIGRlZmVyIHRvIFdvbGZ2aXNpb24gb24gdGhpcyBvbmUgYXMgSSB3b3VsZCBleHBlY3Qg
dGhlbSBhcyB0aGUNCj4gPj4gb3JpZ2luYWwgYXV0aG9ycyB0byBoYXZlIGJlZW4gZ2l2ZW4gYSBy
ZWdpc3RlciBsaXN0IGJ5IFNvbnkgZm9yIHRoZQ0KPiA+PiByZWFkb3V0IG1vZGVzIHRoYXQgdGhl
eSB3ZXJlIGludGVyZXN0ZWQgaW4uIFNvbnkgbWF5IHRoZXJlZm9yZSBoYXZlDQo+ID4+IHJlY29t
bWVuZGVkIHRoaXMgYXBwYXJlbnQgbWlzbWF0Y2ggaW4gQS9EIGRlcHRoIHZzIG91dHB1dCBmb3Jt
YXQuDQo+IA0KPiBDYzogR2VyYWxkIHdobyBpcyBhbHJlYWR5IGxvb2tpbmcgaW50byB0aGlzDQo+
IA0KPiBBcyBmYXIgYXMgSSBjYW4gZ2F0aGVyLCB0aGUgcmVnaXN0ZXIgaXMgbm90IGNydWNpYWwg
Zm9yIHRoZSBjb3JyZWN0DQo+IG9wZXJhdGlvbi4gVGhlIGNoaXAgd29ya3MgZmluZSBmb3IgdXMg
d2l0aCB0aGUgY3VycmVudCBkcml2ZXIgYW5kIEFEQklUMQ0KPiBpcyBub3QgbWVudGlvbmVkIGlu
IHRoZSByZWdpc3RlciBsaXN0cyBmb3IgdGhlIGRpZmZlcmVudCBtb2Rlcy4NCj4gDQo+IEhvd2V2
ZXIsIHdlIGhhdmUgc3VjY2Vzc2Z1bGx5IHNldCB0aGUgcmVnaXN0ZXIgaW4gYSBkaWZmZXJlbnQg
cHJvamVjdA0KPiAoTUNVICsgSU1YNDE1KS4NCj4gDQo+IFRoZSBwYXRjaCBtYXkgbm90IGJlIGVz
c2VudGlhbCwgYnV0IGl0IGlzIGNsZWFybHkgY29ycmVjdCBJTUhPLg0KPiANCg0KSXQncyBjb3Jy
ZWN0IHRoYXQgdGhpcyByZWdpc3RlciBuZWVkcyB0byBiZSBzZXQgdG8gemVybyBmb3IgMTAtYml0
IG9wZXJhdGlvbiANCmFjY29yZGluZyB0byB0aGUgZGF0YXNoZWV0LCBhbHRob3VnaCB0aGVyZSBh
cmUgbm8gdmlzaWJsZSBkaWZmZXJlbmNlcy4NCg0KUmV2aWV3ZWQtYnk6IEdlcmFsZCBMb2Fja2Vy
IDxnZXJhbGQubG9hY2tlckB3b2xmdmlzaW9uLm5ldD4NClRlc3RlZC1ieTogR2VyYWxkIExvYWNr
ZXIgPGdlcmFsZC5sb2Fja2VyQHdvbGZ2aXNpb24ubmV0Pg0KDQpCZXN0IHJlZ2FyZHMsDQpHZXJh
bGQNCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IE1pY2hhZWwNCj4gDQo+ID4NCj4gPiBBcyBmYXIgYXMg
SSBjYW4gc2VlIGZyb20gdGhlIGRhdGFzaGVldCwgdGhlICJPcGVyYXRpbmcgbW9kZSIgdGFibGUg
KHBhZ2UgNDgpDQo+ID4gY2xlYXJseSBzdGF0ZXMgdGhhdCB0aGUgQVMtY29udmVyc2lvbiBhbmQg
b3V0cHV0IGJpdCB3aWR0aCB2YWx1ZXMgYXJlIGVxdWFsLg0KPiA+DQo+ID4gVGhhbmtzIQ0KDQo=

