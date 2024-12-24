Return-Path: <linux-media+bounces-24020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0A59FB853
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 02:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56D6B1883FC4
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 01:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364D2433A0;
	Tue, 24 Dec 2024 01:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="kILpCW68"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1802.securemx.jp [210.130.202.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A88818D;
	Tue, 24 Dec 2024 01:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004651; cv=fail; b=fZgBJI0DsJvG/fRDayT/HzJYH6eBtB0ya/Bi7t8tQzENeq6NeWhn9POc3IAvOxjbqHqW4FMOZPEm981VhSSWhgDMAYG3iUmJiVDIms4VrdbArzZ7Co/J7vyt5kyi8rcD052MP0RrVpx5JHNzmj1JpLSNG5v34XX71LsSqxhpAkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004651; c=relaxed/simple;
	bh=YHQTloqRdLxWBrQPVMgLrNgTng3YCNlNpa1ZhUjjxdw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IL1lx69DI/oFFn30IjE/3GMBzmiJ4tE4NGU/cgeWa6kR1tHOtpruhRCK1O6Nr0dmg1AaF7BKhcU2xxE9KyhpQt2n3YkYIgOKdxlvgnw2oJgDAKVK7bBdv8RY34tfW4BYLwN2dXl0kUXdlXwMAvzz6keubB7cg6pn/Yr9ibpOQ4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=kILpCW68; arc=fail smtp.client-ip=210.130.202.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1802) id 4BO0NNIU4076105; Tue, 24 Dec 2024 09:23:23 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1734999764;x=1736209364;bh=YHQTloqRdLxWBrQPVMgLrNgTng3YCNlNpa1ZhUj
	jxdw=;b=kILpCW68j9jF7hQHopCCEoOAj0q6CtUdRW3ZpSy21qgUSO0STbvzTiGaCovpEKdO5Ofp2
	r0uSZ2Fr75b+6aIK458KMoF6MxrhUgqPGYOByZbEQYJ1esoq0NuNwHS8rkUtSeBgtHRoeqDZMcX4S
	PmKZw9mq4lQ3c11j01gedQgJqHpBPqx4vqslAygcjVWKy88Y99ZflfercHd7Xfs7AADvgMleAFD51
	q3wVrWfvANBrkPaokYf1+uxWnzFE33B1pYrMsGuacnfJ2d+NP+cwtfvb0t9q9PEsB9RAgxitppknj
	e7ezG14g4bM9U9dnxflEdvYrA6ygbIueLIctATcf9A==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 4BO0MhJc001418; Tue, 24 Dec 2024 09:22:44 +0900
X-Iguazu-Qid: 2yAbyr8UmcEH3c3Z1O
X-Iguazu-QSIG: v=2; s=0; t=1734999763; q=2yAbyr8UmcEH3c3Z1O; m=Jvp0jeFv6RBPppWfo6iW6to7eYpu+h2k9t+2C38+1Nk=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1803) id 4BO0Mevn1643397
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 09:22:41 +0900
X-SA-MID: 34640866
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNmyWfZmGGt+9vhWX0xhJt9xbA52kBR2BqAvlUHzsxHxaxcazcKwIuOJIwkI3a4ziUx5OPWCQybyXQo0zY4oAaWM7BWEyN+rXsLZRpkBdzRu9oty8kYcNrf7CJXTI5AouZ/FZP+oPjkLxIYKwEOb/n7DZpv+agMou7nWHwQQ02+iZxYFmrfZqHnlYuvGLm2gOEwFmi7ozB4kRoVMx65S+ZRhYMX8Q+mVEq9/JPf+C1mIcaUUJokrQpxSFwlnb0WUHz71ze6vLKnnh9AxRqXsLFmdMsxvdN2cYk9josLmsoaonWu2hJ34PZwirw5t5Q9sL0MkfE31ZTr9KDCc24DTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHQTloqRdLxWBrQPVMgLrNgTng3YCNlNpa1ZhUjjxdw=;
 b=wY3yocbMgefQ60/9bjfIGKzmI+aZl7x7VsJnM5wfMpB3AGzQiNka7tuDj6l73HRD2R5ZnZIeUPu99z7qdlmHz7VMCSROBIvVnIhNV3TfTWYSkmpbqCvUsPJlsJxHsXxmZScCv5t8UloBN6F/m2wvRpooXUBGSxk9YpfDLPPhaCCXsNrNAce7XfpBtR32qZ6j/p846bKgFIcBDzoZ+Lpe7BV/YrfULe4tWDmHl0BF5ckIsjqIJPr8WisUJ7KdfkvaWtIXCI/+at5ZmudwLB7uUX2fzmUR97qnPJCaNHiUAzvjlEh/SxqN/CvTgbPAHal7WVYTkvflhZ9xKiEkqtM2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <krzk@kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: RE: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Thread-Topic: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Thread-Index: AQHbPxt/idUf3Bq9z0S8YY+kie6O9bLHxYCAgCHo9VCAAGB+AIAKpA4A
Date: Tue, 24 Dec 2024 00:17:36 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY3PR01MB99820C0030835E8201FC2B6892032@TY3PR01MB9982.jpnprd01.prod.outlook.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
 <04a7ebf7-2924-4894-bc53-ba77e2f64fae@kernel.org>
 <TY3PR01MB99822E6161ED319B4DE855B492042@TY3PR01MB9982.jpnprd01.prod.outlook.com>
 <d5294015-4790-490e-8136-615039a5c733@kernel.org>
In-Reply-To: <d5294015-4790-490e-8136-615039a5c733@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB9982:EE_|OSYPR01MB5400:EE_
x-ms-office365-filtering-correlation-id: d371d947-ea09-4d57-bd4b-08dd23b05e66
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NkdnTThJQXEySXpiWmdUMXFRbFZwbTRwRUhzMThhWmxLWFVjT0FGbVJHdDVO?=
 =?utf-8?B?emZiQjVOSm4rZzJrVlZkMko3M1o4U3J5bERPQTAwVGVmUGlTNnpZUE1vZ2FM?=
 =?utf-8?B?UXlOc2Nxb2tzZG1ySitrRGRON3BaTGNFbVNPSkxrK0dkMlhWVS9odzVTOWVz?=
 =?utf-8?B?dXcrVDVyYWtNS2sxbFhocGlTeW4vWVNZaUlZSzdZVGhLaWhEbVlrS3ZzbzJa?=
 =?utf-8?B?RFI0Z2ZzVStlcHE4aEdpS1AwbVNTazBZQ01taXBHWTBLbnlFMCtmOU9wQW5L?=
 =?utf-8?B?SE5uc2VOeG0yU0tqa0xrVWNHMFJJd3NLRzZoQ2lqUG44V3M0Z2pEUzQrQXg2?=
 =?utf-8?B?QXdNSHlybW9DZURGWk1YaFRxa0hjUEhqRzVsSXdMUjNBTXlyeUFRTjloVlVE?=
 =?utf-8?B?TldvMExKS3Qwd3cvc2xrYW9YbWM3M3g0U2l4MXAvT2pSVjV2Y2hDSjl3T0N2?=
 =?utf-8?B?NW9IeTJ4QjhhMkp4VzNyZGZiak5NYTZwU1FybHYwSW8xeEs0eFlsY0VwNyt1?=
 =?utf-8?B?MWdwelFucXZNYlBLQlV4eUNTenFXS0FMZVU2UTFTdlRVbDgvRk1lclRqczVL?=
 =?utf-8?B?b3hMVWc5SmdIWkt4TzhvbGR1SFY5aTdOT2ZCbTcxWHBRYXhnWTNlVzZRelVq?=
 =?utf-8?B?R2RUVy8ydGw1OS8xR2kzRmtUcDhTSlE0bDAxdm9CWXpWV1JMUHVtYS9FdmV2?=
 =?utf-8?B?TzVoVk1LV0o0MHAxK0tna0pXRTdNZWRST2tHQktWTEp3RzZJOTg4ZStqZ2xi?=
 =?utf-8?B?WDBzRll3eDdSaW9KYTdpZnd1RVc4bEJ4WVgzVHlPSlRnbmdXcno1eGE5NHZw?=
 =?utf-8?B?RkQ3NVBjV0I4VXM4dDNhMTRvY3hESi9pTHlEVkU4L3JIeDRvQW4vTWhiMndW?=
 =?utf-8?B?d0FZSjU1TnJOWVZKaDdjMFZacHB2azNHUzFnODErOXBPMFUxNjZFZVdCdTFF?=
 =?utf-8?B?cytYQ0JSMTVMdm0xZlpjUDdkc0x3NXVTL0o4cFZVOUY2VVArVWVSODFPcFpr?=
 =?utf-8?B?WmxqMXNBOU12UzRFS0VJMi9pLzBuUHljencxRWE2eC92S2s5MnFJc01ianRZ?=
 =?utf-8?B?QS9sc01MVHJHMHdRRG5wdVNoNTFXS3o5OUpNa3RWZjRxYjNEV2RSVzNoMFV0?=
 =?utf-8?B?QzdHMk9PaTUvcGd3cnh3Z3BNRmVxcE93VFlHVU9RNjFSRkZhMCtiVFc3eHlN?=
 =?utf-8?B?dVRGREc5Q29qODZMeWl3d1FvYXUvVFlxM3lCd0NZUjFQK0ZhQWhHeXFTYnIz?=
 =?utf-8?B?emVVZjVXQXIvQVVZblIrSXg5Ulh6SHNQOGppTS95UVdqVmQxNW5GUWVJeTFC?=
 =?utf-8?B?MXlhbFhJU2dOWEttTnFkdzArOUVZNnd0NElZWk1RY3cyRWRhRGtlQmc1VzNk?=
 =?utf-8?B?ak00YWZRZ1p6Zk11MUM0Ty9IeXlQQXBVY2tyTFE5dXNGM1BKU3FDRExhaUl1?=
 =?utf-8?B?eWJiQ1ZCSW5HNFRXRVNtT2VCZnpBbTZ5Znk5ZGhqeHRTVkg5Zy9PYitQTldw?=
 =?utf-8?B?M2NURHJqeXN0ZmFRYmYyWVhDTW5KMjhWUDV4ZjRxb3pSTTFldXhIck0rNkFZ?=
 =?utf-8?B?WGFDall0cW1WSjZ4RWlsTGh6cG4wYVlYei9mWUpZRWdyWTNyVHJqL01vTFRI?=
 =?utf-8?B?aytILzVyZGE3SjFDWHVNZHA0dzU5bFFVZnl3RW56T21tVS9kMktmUEcyeDZp?=
 =?utf-8?B?b25vV1lobWI5UUs0ZEc2YyttSWxaMjd6SkhlWUZ1dEplZFBQZ0hWc0FrN3Y0?=
 =?utf-8?B?VkU2dEFLSzJEbzF6bThWdWpjMk9ia0ZCNm9DSHlrdWd0MHNxNklnaWI4Z0Rt?=
 =?utf-8?B?alNJNzhSQXloTWZZb3RnMURJYWNBODJKOTZDbTBWVXMrZ3JpeTZCSUg0cnBy?=
 =?utf-8?B?RUd3azY4NE8vaU0xbEdyaGxvYitLdlliYlRDM2hiVWRWUTJUK3JXWklhNHBx?=
 =?utf-8?Q?oPmXIKO56D+cAJGFYV/HZtYzhyeRcaxe?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB9982.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aUdxdGJTVnd4a2x3bUF4MWNMN0pNQmpsMm5wZDFWWkxYeFZwN3doQlZVSWMr?=
 =?utf-8?B?aWE2bC90T3BnYU1VUStLeXJPc29CMlp3QVcyUWpRR01VNW9NZ2NWeEpkckxo?=
 =?utf-8?B?bjNkT3NpcUMxKzF6U1A5UUZqbzBTWDluZDROMkgrMTcyUW0zTEpxU2F5dG9N?=
 =?utf-8?B?YzBkNGFyZi9YeU5Bb2pzQVMzaE1WOWk2N01ETDBvN0ZPbjRwUDhraGwwQ2pr?=
 =?utf-8?B?YlJJa1hyNlRleDVqTmxFWFMxR1RtbnhIVmN1b2tVMmtJNzY5QVNHVHNnQitW?=
 =?utf-8?B?YTR0R3NlVVRlWDhtSWV0WEI5ZzdrN0l0VGFnaWJ4bnBiSzZxYkVubHZjWHYv?=
 =?utf-8?B?QmlqZElaRE5YZlRCV2RjNDJ1RDl5WlZnWDl1TEhGdUE5UUNualNEL1ZWcUhq?=
 =?utf-8?B?T3QvYmpSMXdaMGlDUDUzcXBybkdZYmJrUVhvWlkzMGNQMytGbmJRck5oTUM5?=
 =?utf-8?B?SUJ5TnZjcXVhNWcxcmFjZUJXNFFoczY0NFg0ZWVDckNOa2E0RUtJb05jc2FI?=
 =?utf-8?B?T0J1OUYxZk9oRit5QXBWcEM4cW1qQlhoTnBqTWlrZnFJclY5T1hraDUxbzMy?=
 =?utf-8?B?Y1Vhb0l2MS9nUHM3YmEzbTRPUjJIN0liL0hqYTk3UlR3WDlmRElHYlNWUWxM?=
 =?utf-8?B?czdtQVhFOGZaeTN4djhUeG8rMXhhamhYUjhLRnN3WnRxQ2tRYzFzNldEdjFl?=
 =?utf-8?B?Ri9nVDRCYkJRbUhMclgzQkoxc3dFdzh3eHkxbU15SnFjeVZzcnpuaEM1R1dX?=
 =?utf-8?B?TEF2OGUyZ3ByYmxzSFcxbk1jbkZOS0RBMGQzNTAwVHpsdTRoWjJOc1JXZHp3?=
 =?utf-8?B?Q21vWTFjeFZ4d2pBK1RWbXVwVFRLNk5EbUQ0SzhOa1VDWHhlVlYzaE1WblJ2?=
 =?utf-8?B?dkpXVWUzWjd5NGJ2cCtOQVh1NWd2SEtjWkVyTDkxeFJES3oyYUNaRG14SDl0?=
 =?utf-8?B?bEdyd3lnOEJPbXY2b2NDWGtkT2ZWMkxxZ2RmeFRVTWV1a05SSW0vdFVIWUdy?=
 =?utf-8?B?aDV5Yk1sa01EV2NWQ2lrenFObk14UkhSSWZ2QVpSSSs4OGE4QUZVWjM1TFpQ?=
 =?utf-8?B?MUNRS0FXSlJ4VnEvandJNE9oVWNadjdlN08vdklBMHpnS1BrZEd4a0N4OGxw?=
 =?utf-8?B?cGw3TmVRc0tpbW1OL3Blc3BtRlJPeHJQbkhFemVLbDZFNEhaMXlpa213Zms1?=
 =?utf-8?B?Y1BaQXVPTkhteHVhQk1sUVlxTzFESjhpM1daZGl4d1hBZ1hVK2FGY2ovUDQx?=
 =?utf-8?B?K0tQQ0RiTXZJWkMwRFlGUHJKM2VhSHc5ajU1L2lpaFNVTVVZM0FKNDJmcEZH?=
 =?utf-8?B?NnoxcHU3WmtnS2dOV0dLWTBWUjZwZHBqVHpJWGdGSXNyTUtPbnFSUjR4ZExi?=
 =?utf-8?B?WnppbnJ2SXcxa3EwSWJtekxuR0F5S3lXREJxNmJxaEVsSFlubTMvdjVwM1h6?=
 =?utf-8?B?RWVPWkdvKzRxOU0vY05LcUdVblVyc2Z4T0w1dmZzaE12YWFQekM5QlZmTzRV?=
 =?utf-8?B?enM2Ungrcloxc21uc3hWRU5Mc3B0K2dZbHZmQVR4TDIzYUJVTVBaS01za010?=
 =?utf-8?B?amhlS05HbWJSN1AxK3BGd1FqS0lzL1VrdFpOb2RXWDVDcHNjZG5ybUJaRHdn?=
 =?utf-8?B?Sm9VcmE3K3JUaGN5UFM1ZzlCdTJoM2t4d1ZsODlncWVqWERJME5Gc2t1N3V6?=
 =?utf-8?B?ejFqZUtEZDhnZ1JFOGJsbGdwR21kOG52b1FXVlp4MXRaME0zZjF4OWdyZ1pi?=
 =?utf-8?B?R2VYZjY4TzdRVkVGSmNRbG4zTUlYeitteGNMU1VvbTkrNGlIREkwUkpTVnMr?=
 =?utf-8?B?UVRRWUhuc1ExSjFKSmVIYlo3V2tuK2RxMnArTDdwMXZnQmdKNGpUUFdHMStR?=
 =?utf-8?B?YktiQlQvOU02M1VqVDdjdDZGeGNRcUdXV1ZDemZGdi9HREpVeEMwZXFZRllk?=
 =?utf-8?B?a0JPL25zU2I1NGJWMiswbURlbm1ndnFzODh4YVJEQmcrdUEwTnBZaWxmbU1u?=
 =?utf-8?B?VU4yK2xTQmVibkRlZWd2SnJ0ZU9uMytpelFMRTNmYno3UjJ1R0g3Y1dXeHJM?=
 =?utf-8?B?bkViMmN3cWhyOUhJZyt0Zi9KMjQ1Qnk1cFJYWElQaHBGV3Z5MW11TVVkRVVX?=
 =?utf-8?B?eFYyOHk4Z0dXMm5EbWNJUHF1c2FoMEszRkZWRS80bWdqSzdJYnJra2tIa3JF?=
 =?utf-8?B?U0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB9982.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d371d947-ea09-4d57-bd4b-08dd23b05e66
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 00:17:36.1075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jtXi0XTBdbiSAtwY/97zOifqTOYurlNNNPzCanpnNzT25QqaoaR8j8ebj3ln13M810vRQhfkoyNcBgqKBI/gVcdKNHKlwXbMM6NOSeumm4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5400

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxNywgMjAy
NCAyOjQzIFBNDQo+IFRvOiBpc2hpa2F3YSB5dWppKOefs+W3nSDmgqDlj7gg4peL77yy77yk77yj
4pah77yh77yp77y077yj4peL77yl77yh6ZaLKQ0KPiA8eXVqaTIuaXNoaWthd2FAdG9zaGliYS5j
by5qcD47IGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbTsNCj4gbWNoZWhhYkBrZXJu
ZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsNCj4gY29ub3IrZHRA
a2VybmVsLm9yZzsgc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbTsgaHZlcmt1aWwtY2lzY29A
eHM0YWxsLm5sOw0KPiBpd2FtYXRzdSBub2J1aGlybyjlsqnmnb4g5L+h5rSLIOKXi++8pO+8qe+8
tO+8o+KWoe+8pO+8qe+8tOKXi++8r++8s++8tCkNCj4gPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3No
aWJhLmNvLmpwPg0KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEy
IDIvOF0gZHQtYmluZGluZ3M6IG1lZGlhOiBwbGF0Zm9ybTogdmlzY29udGk6IEFkZA0KPiBUb3No
aWJhIFZpc2NvbnRpIFZpZGVvIElucHV0IEludGVyZmFjZQ0KPiANCj4gT24gMTcvMTIvMjAyNCAw
MTowMCwgeXVqaTIuaXNoaWthd2FAdG9zaGliYS5jby5qcCB3cm90ZToNCj4gPiBIZWxsbyBLcnp5
c3p0b2YNCj4gPg0KPiA+IFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcNCj4gPg0KPiA+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+DQo+ID4+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMjUsIDIwMjQgNzow
OCBQTQ0KPiA+PiBUbzogaXNoaWthd2EgeXVqaSjnn7Plt50g5oKg5Y+4IOKXi++8su+8pO+8o+KW
oe+8oe+8qe+8tO+8o+KXi++8pe+8oemWiykNCj4gPj4gPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEu
Y28uanA+OyBMYXVyZW50IFBpbmNoYXJ0DQo+ID4+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+OyBNYXVybyBDYXJ2YWxobyBDaGVoYWINCj4gPj4gPG1jaGVoYWJAa2VybmVsLm9y
Zz47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YNCj4gPj4gS296bG93
c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5v
cmc+Ow0KPiA+PiBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+OyBI
YW5zIFZlcmt1aWwNCj4gPj4gPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD47IGl3YW1hdHN1IG5v
YnVoaXJvKOWyqeadviDkv6HmtIsg4peL77yk77yp77y077yj4pah77yk77ypDQo+IO+8tOKXi++8
r++8s++8tCkNCj4gPj4gPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpwPg0KPiA+PiBD
YzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOw0KPiA+PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEyIDIvOF0gZHQt
YmluZGluZ3M6IG1lZGlhOiBwbGF0Zm9ybTogdmlzY29udGk6DQo+ID4+IEFkZCBUb3NoaWJhIFZp
c2NvbnRpIFZpZGVvIElucHV0IEludGVyZmFjZQ0KPiA+Pg0KPiA+PiBPbiAyNS8xMS8yMDI0IDEw
OjIxLCBZdWppIElzaGlrYXdhIHdyb3RlOg0KPiA+Pj4gQWRkcyB0aGUgRGV2aWNlIFRyZWUgYmlu
ZGluZyBkb2N1bWVudGF0aW9uIHRoYXQgYWxsb3dzIHRvIGRlc2NyaWJlDQo+ID4+PiB0aGUgVmlk
ZW8gSW5wdXQgSW50ZXJmYWNlIGZvdW5kIGluIFRvc2hpYmEgVmlzY29udGkgU29Dcy4NCj4gPj4+
DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBZdWppIElzaGlrYXdhIDx5dWppMi5pc2hpa2F3YUB0b3No
aWJhLmNvLmpwPg0KPiA+Pj4gUmV2aWV3ZWQtYnk6IE5vYnVoaXJvIEl3YW1hdHN1IDxub2J1aGly
bzEuaXdhbWF0c3VAdG9zaGliYS5jby5qcD4NCj4gPj4NCj4gPj4gV2h5IHRoaXMgdGFnIHN0YXll
ZCBhbmQgb3RoZXIgd2FzIHJlbW92ZWQ/IFdoYXQgd2FzIHRoZSByZWFzb24gb2YgdGFnDQo+ID4+
IHJlbW92YWw/DQo+ID4+DQo+ID4NCj4gPiBUaGUgc3RheWVkIHRhZyBpcyBkdWUgdG8gaW50ZXJu
YWwgcmV2aWV3Lg0KPiANCj4gRGlkIHRoZSBpbnRlcm5hbCByZXZpZXcgcmVhbGx5IGhhcHBlbmVk
PyBIb3cgaXMgaXQgdGhhdCBpbW1lZGlhdGVseSBuZXcgdmVyc2lvbg0KPiBoYXMgaW50ZXJuYWwg
cmV2aWV3IHdpdGhvdXQgYW55IHRyYWNlcz8NCj4gDQo+IEkgaGF2ZSBkb3VidHMgdGhpcyByZXZp
ZXcgaGFwcGVuZWQgaW4gdGhlIGNvbnRleHQgb2YgcmV2aWV3ZXIncyBzdGF0ZW1lbnQgb2YNCj4g
b3ZlcnNpZ2h0Lg0KPiANCj4gDQo+ID4gVGhlIHJlbW92ZWQgdGFnIGlzIGR1ZSB0byBjb2RlJ3Mg
Y2hhbmdlIChzcGxpdCBvZiBjc2kycnggcGFydCkgYWZ0ZXIgdGhlIGxhc3QNCj4gcmV2aWV3Lg0K
PiA+IElmIHRoZSBjb2RlIGlzIGxhcmdlbHkgY2hhbmdlZCBmb2xsb3dpbmcgdGhlIGluc3RydWN0
aW9uIG9mIGFub3RoZXINCj4gPiByZXZpZXdlciBhZnRlciBvYnRhaW5pbmcgdGhlIHRhZ3MsIGhv
dyBzaG91bGQgdGhlIHRhZ3MgYmUgaGFuZGxlZD8NCj4gDQo+IERyb3AgYWxsIHJldmlld3MgYW5k
IHBlcmZvcm0gcmV2aWV3cyBvbiB0aGUgbGlzdC4NCj4gDQo+IFN1Y2ggaW50ZXJuYWwgcmV2aWV3
IGFwcGVhcmluZyBhZnRlcndhcmRzIGlzIHJhdGhlciBhIHByb29mIGl0IHlvdSBhcmUgYWRkaW5n
DQo+IGp1c3QgdGhlIHRhZ3MgdG8gc2F0aXNmeSB5b3VyIHByb2Nlc3MuIEkgaGF2ZSBubyB3YXkg
dG8gZXZlbiB2ZXJpZnkgd2hldGhlciB0aGF0DQo+IHBlcnNvbiBwZXJmb3JtZWQgYW55IHJlYXNv
bmFibGUgcmV2aWV3IG9yIG1heWJlIGp1c3QgYWNrZWQgeW91ciBwYXRjaC4gSQ0KPiBjYW5ub3Qg
ZXZlbiB2ZXJpZnkgdGhhdCB0aGF0IHBlcnNvbiB1bmRlcnN0YW5kcyB0aGUgcmV2aWV3ZXIncyBz
dGF0ZW1lbnQgb2YNCj4gb3ZlcnNpZ2h0Lg0KPiANCg0KSSB1bmRlcnN0YW5kIHRoZSBpbXBvcnRh
bmNlIGFuZCB1c2FnZSBvZiB0aGUgUmV2aWV3ZWQtYnkgdGFnLg0KV2Ugd2lsbCBjb250aW51ZSB0
byBjb25kdWN0IGludGVybmFsIHJldmlld3MsIGJ1dCBmcm9tIG5vdyBvbiwgSSB3aWxsIGFkZCB0
aGUgdGFnIHRvIHJldmlld3MgZGlzY3Vzc2VkIGluIHRoZSBvcGVuIG1haWxpbmcgbGlzdC4NCg0K
PiANCj4gLi4uDQo+IA0KPiA+Pj4NCj4gPj4+IENoYW5nZWxvZyB2MTE6DQo+ID4+PiAtIG5vIGNo
YW5nZQ0KPiA+Pj4NCj4gPj4+IENoYW5nZWxvZyB2MTI6DQo+ID4+PiAtIHJlbW92ZSBwcm9wZXJ0
eSAiY2xvY2stbm9uY29udGludW91cyIgYXMgVklJRiBzd2l0Y2hlcyBib3RoIG1vZGVzDQo+ID4+
PiBhdXRvbWF0aWNhbGx5DQo+ID4+PiAtIHJlbW92ZSBwcm9wZXJ0eSAibGluay1mcmVxdWVuY2ll
cyIgYXMgVklJRiBkb2VzIG5vdCB1c2UgdGhlDQo+ID4+PiBpbmZvcm1hdGlvbg0KPiA+Pg0KPiA+
PiBEcml2ZXIgZG9lcyBub3QgdXNlIG9yIGhhcmR3YXJlIHN1cHBvcnRzIG9ubHkgb25lIGZyZXF1
ZW5jeT8NCj4gPj4NCj4gPg0KPiA+IE15IGNvbW1lbnQgd2FzIGluY29ycmVjdC4NCj4gPiBJdCBz
aG91bGQgYmUgIkRyaXZlciBkb2VzIG5vdCB1c2UgdGhlIGluZm9ybWF0aW9uIg0KPiANCj4gVGhl
biB0aGlzIGlzIG5vdCB0aGF0IGhlbHBpbmcuIE1heWJlIGhhcmR3YXJlIHN1cHBvcnRzIG9ubHkg
b25lIGZyZXF1ZW5jeT8NCj4gDQoNClRoZSByZWFzb24gZm9yIHRoZSByZW1vdmFsIGlzIHRoZSBo
YXJkd2FyZSBQTEwgaXMgY29uZmlndXJlZCB1c2luZyBpbmZvcm1hdGlvbiBmcm9tIHRoZSBzZW5z
b3IncyBWNEwyX0NJRF9QSVhFTF9SQVRFIGNvbnRyb2wuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cj4gS3J6eXN6dG9mDQoNCkJlc3QgcmVnYXJkcywNCll1amkgSXNoaWthd2ENCg==


