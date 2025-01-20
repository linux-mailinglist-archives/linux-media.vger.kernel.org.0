Return-Path: <linux-media+bounces-24915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BBEA164AB
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 01:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 770F63A54F3
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 00:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF228BEC;
	Mon, 20 Jan 2025 00:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="pP9eKBLa"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1122.securemx.jp [210.130.202.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC4184E;
	Mon, 20 Jan 2025 00:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737333452; cv=fail; b=N9+dvY9YI674KyRGsPmSfR7u9IJiOfpRNpFWMR8p8qNpJPNqU5/ZpFBOb803h7IPfuIcX8gpM8Fkm8YOnMXVUtWwo8kREf/s2nXIpWvSOwnsSGO00soBq6THu1Nl8HTq//bm33fQ9i1pBS0Ut56KdcTIfW0VT9hbwjtSP8rcXHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737333452; c=relaxed/simple;
	bh=wqGUUooyCW3yQlS8W6TABD+/DCXSfrDO93TqXGLiiJ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I10GeTFtIXMadUHeMW3z3i47tzaD5aQTDXnNZ/wbQatY7pi51lxu2nv4v9hykwW5iOPpwJ50P8bYSGxvAyYN/jkOcTNK8ew/j7CyNdwqdIK3o3lx/a0UkiTMDb3OkyZRqU32PqggcOqYGCyOp9yYaJ2tgLjBAh8vs+bdqmOsex8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=pP9eKBLa; arc=fail smtp.client-ip=210.130.202.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1122) id 50K0JGJH2938470; Mon, 20 Jan 2025 09:19:17 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1737332323;x=1738541923;bh=wqGUUooyCW3yQlS8W6TABD+/DCXSfrDO93TqXGL
	iiJ4=;b=pP9eKBLaf6Jkcnc95fjRPqpM3VLZf85YVVOpZKys93XQXIVdHU4xYFtBsgOO8Fm2XuOIr
	y1C9WcFN2M0R+XiPAEyu1zb2AVSb7jxtKxltlH7AZOfwFBsQocducRTQHBJ4TI6p2I6aVq7r6QRT2
	/un2wBe0Yc2jBpC7Cr5IlNwRxP5O/ZIDgUwYA/jxmOpagXBfuasyWkHfKv0DysArDmkvtIiP0E9DU
	37L6ePDv54PEtvUdGksxa//eEDGoiYd54UxgvbG1RZsMw1HX9KBfjA2icLYj+IWZE5S9oW+FWH5lN
	Lq8IlK7gxEXeOc+nTspuVB0+oIZobzUyBR9D49n27Q==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 50K0IgbT2697884; Mon, 20 Jan 2025 09:18:42 +0900
X-Iguazu-Qid: 2rWhSHZE3OjBF1lj1P
X-Iguazu-QSIG: v=2; s=0; t=1737332322; q=2rWhSHZE3OjBF1lj1P; m=n/hdmha+Yr67BKhQa0di//3OVoF8quzsAIE79s23RrA=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1122) id 50K0IdXo2037635
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:18:40 +0900
X-SA-MID: 35930408
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3pkVXmrLFRUhD+2uJmuOE3ODuVVw+wzCrmMjDJhPMfgyCIFySKvyHhGr2pvJDwNZwEoavInhGPrOwuHeRqSRaE97PT9WsLq6mR6MNtGE6QM+OqNipos/xucN7JV2JBIExtprMtRyU860tU+R/okA/JMc6oCR0br6IJ4J8a3R/NzoVMnCMD6E0MsBJbhpPbBxfJznGT4DiKSEAXMlhSEilSVCH334HWpAvG6u5WaUFDdu+GSyb4DrKcSdMO3NQofShs8sXgohVTDvUzHNSJOKy8a01S9qvvKsQWr4uCWUtdm5GjpFPJJJlynMvdREoXo8pxLxc3jxPkdcCIPt7VQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqGUUooyCW3yQlS8W6TABD+/DCXSfrDO93TqXGLiiJ4=;
 b=KqhwoVJ4xz9FBR7jJNxQGxeMHVI8dRKP21SIFtiQgzPuz5JcYPAUSo0Pb4hGQhPV0DJBERDsjieMHXRv1y6VLiPuGObtgLv5TliGfQvp+/WXtrlpPntMtU1w9FZf9SETq1PU/fC4R0iMJ2f1pness4yfZKKXX2mWvudaM7lCUpeYdCeNI8A0yoifkGtzwtsBz2z9nbjUdtpVlkphvH3nzr75+xev0ZZJr4TmXHEjYVLJ6cvLvGK+AZ3pmnUYmM3st0Uc7cXdLgYz6ZEGKot1lVqjairJEjxxxJDg+eaPIb7enNp9HcBAZKxLRBOQe4LovAGvs7g3EoeT7UVqUhFAbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <laurent.pinchart@ideasonboard.com>
CC: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <nobuhiro1.iwamatsu@toshiba.co.jp>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: RE: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Thread-Topic: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Thread-Index: AQHbPxt/idUf3Bq9z0S8YY+kie6O9bMDetYAgBumgZA=
Date: Mon, 20 Jan 2025 00:13:33 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TYWPR01MB99860601B32E2AF7EE435BA092E72@TYWPR01MB9986.jpnprd01.prod.outlook.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
 <20250102095600.GE554@pendragon.ideasonboard.com>
In-Reply-To: <20250102095600.GE554@pendragon.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB9986:EE_|OSOPR01MB12395:EE_
x-ms-office365-filtering-correlation-id: 4827d717-ba3e-4dfd-dfca-08dd38e746d3
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?S3RBRlZybnF6bGRuRGlTb2RjbGxyS2lyMHNVRGpiTmpNQVoycStFZDg3RklM?=
 =?utf-8?B?bllJSFdsNE01cTVzT3ZvbXJreHJ4NE1kZ0djVksrVG5rbURJTnJLcCtYOXNC?=
 =?utf-8?B?RFhVUE9ZZG9KNmpsbGc5STE1VUFmdGh0SzhubzNyRURXS1NJbnRZOWVwM3ZO?=
 =?utf-8?B?bFIwN3RxRTV6NXZPZldMSVhIL1VLNm9heHE1TXdjaklLRUhCdk9yamFZaEFz?=
 =?utf-8?B?UHVvU3FXUVJkRVRIU3J5QnIvMXRIOUFzek4zSkZRWjc0VVJidTVVdGNiQmdh?=
 =?utf-8?B?UW5xQ3ZYeWhrMTZSNTR6UG5iRVI0aGwwV2FGcDcvNDZOSHRRUE9kYmpUSnY0?=
 =?utf-8?B?KzQ3Uk4xYmY5T0oxV0FEVTIrcGlha2lMckZPWWVBeEJkRGtLVkVvQTNGVjJj?=
 =?utf-8?B?QU1uWkpvQXlKTzhHbEdXU2VxQ2NSSk5yOVRpbERUbS83TG1IV3Q3UXJQQVht?=
 =?utf-8?B?ZCs2OGZqYkg0SXZZYTNVVGU0amQyNkgvQ09WOWY1V05Ebm94dTF0bEhoUTgw?=
 =?utf-8?B?dDRZV3RxdnlhSTFYOHVnRnk1MlJjclBuUXh0emJpaXJaQ3lGTVNVbWhHNnkw?=
 =?utf-8?B?WWF0eGE1aHJLOHNScVptYTdrMVkzZEhjYStZeE5aNlRhdEkxT0ZlZWhCblZi?=
 =?utf-8?B?bXExbk9keGVRazRXVFo0UVQ1UlFpTGlpNjhZbFRDLzdMdng5MHZKdEZicUxu?=
 =?utf-8?B?N1FFZU5zOHpDYXVVYjZRRU53ZkttOFpIbVJJUlhLRGJpZUdTTkxsdVY1VnpK?=
 =?utf-8?B?UVZUUmw1c1lFMkRwZXJyOCtlRC9vSEhCb29pTW5WUmlrMFd6a1hqOXcxdmFo?=
 =?utf-8?B?L0xqZkdjZGN4cDRJMGlPSEhTa3pXYmFzL3EvQjJFMzJtdTVzQnlMc1o3Mk5Z?=
 =?utf-8?B?L2tHZ29sc0NTSUJqUG9Lc1VWRzVIM2gyUFZNSnBpdkdRZzZCcE5Cb3lUd3Vi?=
 =?utf-8?B?dmRmeFltVHdrclp5TE9lNzBCNlVNa254Ni82V3NTTDJ2MlM0bVN4eC81Uitu?=
 =?utf-8?B?emlIOEdwcng2U1NCMER3YkNMekhSQkJJQjlkZGY3YjBlL0hqOTBCSVFDSkRC?=
 =?utf-8?B?T2FZalF5ZGtCTHFGZW1SeHBLVzhMSWM2ZER6dWl0cXNybFFrV0djSWtVRk5Y?=
 =?utf-8?B?d1JvZUhkVDIreUJNemF4SEtZRy9icHpHTDZvcFhjMVk0WUoyZHRVVlBxeVlI?=
 =?utf-8?B?U2NwenI3N0wyTWcwUWtDTC8yWWlDak9MS2dPaFlwRzRwQkxUZFh0czUyUzF5?=
 =?utf-8?B?TEZvNGRzdHdGZVM0b2tMNktKMkFqMUV4Um00MDFpOHN2MG9qZGxaTTJ0RGtV?=
 =?utf-8?B?TXNHd0NGTHFOTE9PRVNPZ1k3K1dFSzF3bEZhQUIxVzREOU9vL3RFY0g4amF3?=
 =?utf-8?B?STg5MkV1THQ2TlhTazJhcDJIM1J6UVRPbTc4VDN3aWU1bzVLMVFkWTBmVlFs?=
 =?utf-8?B?dXVYRFhFMFZHcnRIdnN0U3ptUXg5TlpGUG8zOTNaSWxzVUR2UjkwZXVCcVNJ?=
 =?utf-8?B?Ujc1c0drMXZOVjlYaUdqK2tIV1hhb1pzSjBwb3RZL082cFJYSlpYWHFjRVhL?=
 =?utf-8?B?bW5DbjNvTEs0WUZCdStScjZ4Y2dxZ3pHV3NIS1pVVjcwR0tEUkZXSkFaV0Jz?=
 =?utf-8?B?YUM4S01vOWU2cGVBaElNVThmWS9ZOGd5Zmk2c1JIdzU0VlRvd3NZTWJublVF?=
 =?utf-8?B?czQ2bFA1UG12VEY3SnppWDY3cGlEVXI1U1cveWI4QVlyZkpWb0lIMkM0cUtt?=
 =?utf-8?B?cHNONzNUbXJ3K24ya0tXM1JKNzUwNHBJVnZkL2krT1RtUEk4VXVpK3Q5RkFY?=
 =?utf-8?B?aVBjd0JzdHBoM3Z6NEVCZ0lLUDhudGs4SkFIUTlCNU5kQWRaeElDeElaTWNR?=
 =?utf-8?Q?TdwVCnGXWUtwU?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB9986.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZXZpWjYybjRtTStQUlJWNms3Vko0dnIyMUVYRUZRNThJZEtQK3dLdmp2L3J1?=
 =?utf-8?B?ZllUbmFYL01scC9TNmk3U0UwSWFNc1ZpQVRVMDJma1JJZ0phMVIwVWZuSTk4?=
 =?utf-8?B?Y3JqRWVTWUFBdzQxelM3Zk5KNVp5OWV6NmkwM2drcGRpY29xa0lhdS83RUQr?=
 =?utf-8?B?RlNiNXk4RUpRZHNVdGdSUGNYb2hlbzR6ZTl5SjZTc2NkTTN6VVI2RVlNdnVF?=
 =?utf-8?B?UndRb0pwOE5XemgrcGxlV0NiUGNNUmx6bWg2cVk0TFpEVVhQZW1YMk9nSGcr?=
 =?utf-8?B?TFl4L0FoT3JQYmFESk4xeWRNM1N1N29uanRxbStJM1VwLzdIMks1aGlHdStQ?=
 =?utf-8?B?N0FJT2dDcmdETTRWNGtFNFM2WUFnZG04V3BzVjlBUlF5UDl4bDYzNW1OWFVl?=
 =?utf-8?B?MmNRN3N2c0JveXBHOHhpRDJLVzlvVVdkZXg0UGNFNDd1YnlXd0VNWWZLYUdW?=
 =?utf-8?B?VXhQdk9PNnZjR2FoNzh6OXFZdVZPVkZNZ0UraDNhUjFEMXpkandXRENCYlJp?=
 =?utf-8?B?dkhRWlB3RWFMUGIybHIzTStFVG5GSm0wdjZKZklTZUo3a09lRDY5eEJuQ3ll?=
 =?utf-8?B?TDhLSkhrYWFzT2tQc3p1WmRXMTdBbXRhQzFWZ0hqMCtmOHFncUNhMmRGaGJ1?=
 =?utf-8?B?TDgvREYxR0x0dTYvc0dxaGFKYUNlVmlwc1kxQWNFQUt6UzRYQmMzRWxVK0x1?=
 =?utf-8?B?aDE4QWttYWRDYUxiMURrVzJYcyt3MldjNi9aT29tTUNKT1MrTFkyT1ZkM1hN?=
 =?utf-8?B?RytaenBmdEY0cTdJTTBQa3ljMFpYZXU1dUJibzdQTnFQdVg0TjREa0ZPcENP?=
 =?utf-8?B?WVZSL1BWY0dVZGZRK2lwQWxlM2RTUkYvSnd5Z0VBM1dBM2dmQUY5SVVuSzNB?=
 =?utf-8?B?SlZUbzZNVXZ0aGp1NllzRDdLWVMxc1BXQzJPdHRuVEFRSTByOW1KZmhid0k1?=
 =?utf-8?B?OEE2OTY0RnMrcnJDU0M5R3JRWkJPak1GY3Rhci9DbmlmT3RQYmJnUW41YW1o?=
 =?utf-8?B?VFJlOExHb3cwVE9oUXVSUHlhN3VkeTF2am1RNGZoM1R2eUEyRnM1bjNaRmpj?=
 =?utf-8?B?TS95Q1luRk16NlRXamM1SE5makp6VGZqSEFwcnp6bFpRYnFYMVJNRWh0L1NH?=
 =?utf-8?B?UkM1aDgwZHJtam9TZXJ2d3VFbVBIblBhMTBiZWo2UWNoSEFlSlFUUHI3ZVBG?=
 =?utf-8?B?VDJ5UUtRQkFuNHdHMmIyUDk2L1k5S1paVWs4YW0yTUx5OWFWTEdFWk1kMS9X?=
 =?utf-8?B?RFVHdVB0cE8ya3lIQ2prTUJCSC9OYm0xUXlkTVJ1UDdTdTNFY3ZKWlVaTm9m?=
 =?utf-8?B?U3hqbWNvWENoM1Z1QXkxbi8wZDU0dFVrUXVwb3E4MUVmRjJZYXYvZW9lVlNq?=
 =?utf-8?B?UlZhQUFvd1I5bTJzL3E3LzBUd2xZTGJiSmRLTk5hNkRnelVSdDNCT0lSUGVQ?=
 =?utf-8?B?aXN4N1hrU2N4cDZ2MzhaK1AveEdTZUhsZ3lFNHp4TUdEbTBGbjVlQlNjSVVa?=
 =?utf-8?B?M3UyeU9GbzJKWnJhMjI2QkJBcDdDS0cvb2FrT3JCbWRUSWRQeTR5YitJQmF2?=
 =?utf-8?B?dDZsVFJKdjJZcWpJVGhjWnN0dU02azgrN1RwL1RUeWFISU5uL3NKV0NsT0hF?=
 =?utf-8?B?a0FvTGVmWG05bFN6SWdvaGZmWS9rOFZnaElzNjV2R25UblR6RE14NnltUjd0?=
 =?utf-8?B?RHN5dlBpbDJIUmJqN1JZZ0xyc1RRNm1ZQjl4SkdHN0lybURFZExMcWhMdkpx?=
 =?utf-8?B?eGtYZTlrVGhCOXdIUy82UmR4Zkh4eXdFU3lWclB0NmlVV2ZtVDhmZlJ0Rmxu?=
 =?utf-8?B?a2phTFhoUHhzM0FDRjFpSWx6dDJValJHeFNZdUk2MWFldk0vemp6VVJPdmZl?=
 =?utf-8?B?eFdBWTlFTHBvUXNrNmRQcWpxZzBHTW5QNmg4a0VNRzVnbHVZU0k3WnZvMjdO?=
 =?utf-8?B?QmhqOUlJV3ZLUGlyaEVjdGxpRWwzaHFzYlRkRmdIQXlwSTVJeFQrVEtsNCtB?=
 =?utf-8?B?blljQnAvb1RLeG9pK0NxVHVwK3R4NWlZalZXUVNIcmQ5ek8wWTlkWkp5aVNm?=
 =?utf-8?B?dHBmaVo0NVFoT3RWVFBjanZiWG5sVU9rMzFHVVNMVERXd2pSaTZ6UVY1MTVw?=
 =?utf-8?B?R1BGY3B6VkROSTBOc1hnRlRPZmpuMnNGc25qcWlCeEhUTDlBK1dqUVRvcTFD?=
 =?utf-8?B?WWc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB9986.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4827d717-ba3e-4dfd-dfca-08dd38e746d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 00:13:33.3344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kux+djm38VqDXN9XLsGrYoionvc0jUEQrZgzUzD2rWLTom0uDen5efYleeFU9u93TcNYwYPHbSdOL7fx0u2e9TYi+kbZzowgF+hixj2h0gE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12395

SGVsbG8gTGF1cmVudC4NCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyBjb21tZW50cy4NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51
YXJ5IDIsIDIwMjUgNjo1NiBQTQ0KPiBUbzogaXNoaWthd2EgeXVqaSjnn7Plt50g5oKg5Y+4IOKX
i++8su+8pO+8o+KWoe+8oe+8qe+8tO+8o+KXi++8pe+8oemWiykNCj4gPHl1amkyLmlzaGlrYXdh
QHRvc2hpYmEuY28uanA+DQo+IENjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2Vy
bmVsLm9yZz47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtl
cm5lbC5vcmc+OyBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+OyBI
YW5zDQo+IFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD47IGl3YW1hdHN1IG5vYnVo
aXJvKOWyqeadviDkv6HmtIsg4peL77yk77yp77y077yjDQo+IOKWoe+8pO+8qe+8tOKXi++8r++8
s++8tCkgPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpwPjsNCj4gbGludXgtbWVkaWFA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEyIDIvOF0gZHQtYmluZGluZ3M6IG1lZGlhOiBwbGF0
Zm9ybTogdmlzY29udGk6IEFkZA0KPiBUb3NoaWJhIFZpc2NvbnRpIFZpZGVvIElucHV0IEludGVy
ZmFjZQ0KPiANCj4gSGkgSXNoaWthd2Etc2FuLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0
Y2guDQo+IA0KPiBPbiBNb24sIE5vdiAyNSwgMjAyNCBhdCAwNjoyMTo0MFBNICswOTAwLCBZdWpp
IElzaGlrYXdhIHdyb3RlOg0KPiA+IEFkZHMgdGhlIERldmljZSBUcmVlIGJpbmRpbmcgZG9jdW1l
bnRhdGlvbiB0aGF0IGFsbG93cyB0byBkZXNjcmliZSB0aGUNCj4gPiBWaWRlbyBJbnB1dCBJbnRl
cmZhY2UgZm91bmQgaW4gVG9zaGliYSBWaXNjb250aSBTb0NzLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogWXVqaSBJc2hpa2F3YSA8eXVqaTIuaXNoaWthd2FAdG9zaGliYS5jby5qcD4NCj4gPiBS
ZXZpZXdlZC1ieTogTm9idWhpcm8gSXdhbWF0c3UgPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJh
LmNvLmpwPg0KPiA+IC0tLQ0KPiA+IENoYW5nZWxvZyB2MjoNCj4gPiAtIG5vIGNoYW5nZQ0KPiA+
DQo+ID4gQ2hhbmdlbG9nIHYzOg0KPiA+IC0gbm8gY2hhbmdlDQo+ID4NCj4gPiBDaGFuZ2Vsb2cg
djQ6DQo+ID4gLSBmaXggc3R5bGUgcHJvYmxlbXMgYXQgdGhlIHYzIHBhdGNoDQo+ID4gLSByZW1v
dmUgImluZGV4IiBtZW1iZXINCj4gPiAtIHVwZGF0ZSBleGFtcGxlDQo+ID4NCj4gPiBDaGFuZ2Vs
b2cgdjU6DQo+ID4gLSBubyBjaGFuZ2UNCj4gPg0KPiA+IENoYW5nZWxvZyB2NjoNCj4gPiAtIGFk
ZCByZWdpc3RlciBkZWZpbml0aW9uIG9mIEJVUy1JRiBhbmQgTVBVDQo+ID4NCj4gPiBDaGFuZ2Vs
b2cgdjc6DQo+ID4gLSByZW1vdmUgdHJhaWxpbmcgImJpbmRpbmdzIiBmcm9tIGNvbW1pdCBoZWFk
ZXIgbWVzc2FnZQ0KPiA+IC0gcmVtb3ZlIHRyYWlsaW5nICJEZXZpY2UgVHJlZSBCaW5kaW5ncyIg
ZnJvbSB0aXRsZQ0KPiA+IC0gZml4IHRleHQgd3JhcHBpbmcgb2YgZGVzY3JpcHRpb24NCj4gPiAt
IGNoYW5nZSBjb21wYXRpYmxlIHRvIHZpc2NvbnRpNS12aWlmDQo+ID4gLSBleHBsaWNpdGx5IGRl
ZmluZSBhbGxvd2VkIHByb3BlcnRpZXMgZm9yIHBvcnQ6OmVuZHBvaW50DQo+ID4NCj4gPiBDaGFu
Z2Vsb2cgdjg6DQo+ID4gLSBTdWdnZXN0aW9uIGZyb20gS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+
ICAgLSByZW5hbWUgYmluZGluZ3MgZGVzY3JpcHRpb24gZmlsZQ0KPiA+ICAgLSB1c2UgYmxvY2sg
c3R5bGUgYXJyYXkgaW5zdGVhZCBvZiBpbmxpbmUgc3R5bGUNCj4gPiAgIC0gcmVtb3ZlIGNsb2Nr
LWxhbmUgKGFzIGl0IGlzIGZpeGVkIGF0IHBvc2l0aW9uIDApDQo+ID4gICAtIHVwZGF0ZSBzYW1w
bGUgbm9kZSdzIG5hbWUNCj4gPiAgIC0gdXNlIGxvd2VyY2FzZSBoZXggZm9yIGxpdGVyYWxzDQo+
ID4gLSBTdWdnZXN0aW9uIGZyb20gTGF1cmVudCBQaW5jaGFydA0KPiA+ICAgLSB1cGRhdGUgZGVz
Y3JpcHRpb24gbWVzc2FnZSBwb3J0OjpkZXNjcmlwdGlvbg0KPiA+ICAgLSByZW1vdmUgcG9ydDo6
ZW5kcG9pbnQ6OmJ1cy10eXBlIGFzIGl0IGlzIGZpeGVkIHRvIDw0Pg0KPiA+ICAgLSByZW1vdmUg
cG9ydDo6ZW5kcG9pbnQ6OmNsb2NrLWxhbmVzIGZyb20gZXhhbXBsZQ0KPiA+ICAgLSBhZGQgcG9y
dDo6ZW5kcG9pbnQ6OmRhdGEtbGFuZXMgdG8gcmVxdWlyZWQgcGFyYW1ldGVycyBsaXN0DQo+ID4g
ICAtIGZpeCBzZXF1ZW5jZSBvZiBkYXRhLWxhbmVzOiA8MSAyIDMgND4gYmVjYXVzZSBjdXJyZW50
IGRyaXZlciBkb2VzIG5vdA0KPiBzdXBwb3J0IGRhdGEgcmVvcmRlcmluZw0KPiA+ICAgLSB1cGRh
dGUgcG9ydDo6ZW5kcG9pbnQ6OmRhdGEtbGFuZXM6OmRlc2NyaXB0aW9uDQo+ID4gICAtIHJlbW92
ZSByZWR1bmRhbnQgdHlwZSBkZWZpbml0aW9uIGZvciBwb3J0OjplbmRwb2ludDo6ZGF0YS1sYW5l
cw0KPiA+DQo+ID4gQ2hhbmdlbG9nIHY5Og0KPiA+IC0gcGxhY2UgInJlcXVpcmVkIiBhZnRlciAi
cHJvcGVydGllcyINCj4gPiAtIGRpY3Rpb25hcnkgb3JkZXJpbmcgb2YgcHJvcGVydGllcw0KPiA+
DQo+ID4gQ2hhbmdlbG9nIHYxMDoNCj4gPiAtIG5vIGNoYW5nZQ0KPiA+DQo+ID4gQ2hhbmdlbG9n
IHYxMToNCj4gPiAtIG5vIGNoYW5nZQ0KPiA+DQo+ID4gQ2hhbmdlbG9nIHYxMjoNCj4gPiAtIHJl
bW92ZSBwcm9wZXJ0eSAiY2xvY2stbm9uY29udGludW91cyIgYXMgVklJRiBzd2l0Y2hlcyBib3Ro
IG1vZGVzDQo+ID4gYXV0b21hdGljYWxseQ0KPiA+IC0gcmVtb3ZlIHByb3BlcnR5ICJsaW5rLWZy
ZXF1ZW5jaWVzIiBhcyBWSUlGIGRvZXMgbm90IHVzZSB0aGUNCj4gPiBpbmZvcm1hdGlvbg0KPiA+
IC0gcmVtb3ZlIHJlZ1syXSBhbmQgaW50ZXJydXB0c1szXSB3aGljaCBhcmUgdXNlZCBmb3IgQ1NJ
MlJYIGRyaXZlcg0KPiA+IC0gdXBkYXRlIGV4YW1wbGUgdG8gcmVmZXIgY3NpMnJ4IGZvciByZW1v
dGUtZW5kcG9pbnQNCj4gPg0KPiA+ICAuLi4vbWVkaWEvdG9zaGliYSx2aXNjb250aTUtdmlpZi55
YW1sICAgICAgICAgfCA5NQ0KPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA5NSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS90b3NoaWJhLHZpc2NvbnRpNS12aWlm
LnlhbWwNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS90b3NoaWJhLHZpc2NvbnRpNS12aWlmLnlhbWwNCj4gPiBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS90b3NoaWJhLHZpc2NvbnRpNS12aWlm
LnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
ZWYwNDUyYTQ3ZTk4DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS90b3NoaWJhLHZpc2NvbnRpNS12aWlmLnkNCj4gPiAr
KysgYW1sDQo+ID4gQEAgLTAsMCArMSw5NSBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0K
PiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL3Rvc2hpYmEsdmlz
Y29udGk1LXZpaWYueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogVG9zaGliYSBWaXNjb250
aTUgU29DIFZpZGVvIElucHV0IEludGVyZmFjZQ0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+
ID4gKyAgLSBOb2J1aGlybyBJd2FtYXRzdSA8bm9idWhpcm8xLml3YW1hdHN1QHRvc2hpYmEuY28u
anA+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfC0NCj4gPiArICBUb3NoaWJhIFZpc2NvbnRp
NSBTb0MgVmlkZW8gSW5wdXQgSW50ZXJmYWNlIChWSUlGKSByZWNlaXZlcw0KPiA+ICt2aWRlb3N0
cmVhbQ0KPiA+ICsgIGZyb20gTUlQSSBDU0ktMiByZWNlaXZlciBkZXZpY2UsIHByb2Nlc3NlcyB0
aGUgc3RyZWFtIHdpdGggaW1hZ2UNCj4gPiArc2lnbmFsDQo+ID4gKyAgcHJvY2Vzc29ycyAoTDFJ
U1AsIEwySVNQKSwgdGhlbiBzdG9yZXMgcGljdHVyZXMgdG8gbWFpbiBtZW1vcnkuDQo+ID4gKw0K
PiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBjb25zdDogdG9z
aGliYSx2aXNjb250aTUtdmlpZg0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBpdGVtczoN
Cj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogUmVnaXN0ZXJzIGZvciBjYXB0dXJlIGNvbnRyb2wN
Cj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogUmVnaXN0ZXJzIGZvciBidXMgaW50ZXJmYWNlIHVu
aXQgY29udHJvbA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBSZWdpc3RlcnMgZm9yIE1lbW9y
eSBQcm90ZWN0aW9uIFVuaXQNCj4gDQo+IEknbSBhIGJpdCBzdXJwcmlzZWQgYnkgdGhlIGxhY2sg
b2YgY2xvY2tzLg0KPiANCg0KVGhlIFZJSUYgSFcgcmVxdWlyZXMgY2xvY2sgaW5wdXQuIEhvd2V2
ZXIsIHNpbmNlIHRoZSBjbG9jayBjb250cm9sbGVyIGRyaXZlciBpcyBzdGlsbCBpbiBkZXZlbG9w
bWVudCBhbmQgbm8gY29ycmVzcG9uZGluZyBjbG9jayBzb3VyY2UgaXMgYXZhaWxhYmxlLA0KSSBk
aWQgbm90IGRlc2NyaWJlIHRoZSBWSUlGIGNsb2NrIGluIHRoZSBkZXZpY2UgdHJlZSBhbmQgdGhl
IGJpbmRpbmcuDQpJIHVuZGVyc3RhbmQgdGhhdCBhIGNsb2NrIHNob3VsZCBiZSBkZWZpbmVkIGlu
IHRoZSBiaW5kaW5nLg0KRm9yIHRoZSBuZXh0IHBhdGNoLCBJJ2xsIGFkZCBhIGNsb2NrIGRlZmlu
aXRpb24gdG8gdGhlIGJpbmRpbmcuDQoNCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiAr
ICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBTeW5jIEludGVycnVwdA0KPiA+
ICsgICAgICAtIGRlc2NyaXB0aW9uOiBTdGF0dXMgKEVycm9yKSBJbnRlcnJ1cHQNCj4gPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogTDFJU1AgSW50ZXJydXB0DQo+ID4gKw0KPiA+ICsgIHBvcnQ6DQo+
ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy8kZGVmcy9wb3J0LWJhc2UNCj4gPiAr
ICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBD
U0ktMiBpbnB1dCBwb3J0LCB3aXRoIGEgc2luZ2xlIGVuZHBvaW50IGNvbm5lY3RlZCB0byB0aGUN
Cj4gQ1NJLTIgdHJhbnNtaXR0ZXIuDQo+ID4gKw0KPiA+ICsgICAgcHJvcGVydGllczoNCj4gPiAr
ICAgICAgZW5kcG9pbnQ6DQo+ID4gKyAgICAgICAgJHJlZjogdmlkZW8taW50ZXJmYWNlcy55YW1s
Iw0KPiA+ICsgICAgICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiAr
ICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgICAgZGF0YS1sYW5lczoNCj4gPiArICAg
ICAgICAgICAgZGVzY3JpcHRpb246IFZJSUYgc3VwcG9ydHMgMSwgMiwgMyBvciA0IGRhdGEgbGFu
ZXMNCj4gPiArICAgICAgICAgICAgbWluSXRlbXM6IDENCj4gPiArICAgICAgICAgICAgaXRlbXM6
DQo+ID4gKyAgICAgICAgICAgICAgLSBjb25zdDogMQ0KPiA+ICsgICAgICAgICAgICAgIC0gY29u
c3Q6IDINCj4gPiArICAgICAgICAgICAgICAtIGNvbnN0OiAzDQo+ID4gKyAgICAgICAgICAgICAg
LSBjb25zdDogNA0KPiANCj4gTm93IHRoYXQgdGhlIENTSS0yIHJlY2VpdmVyIGlzIG1vZGVsZWQg
YXMgYSBzZXBhcmF0ZSBEVCBub2RlLCBJIGRvbid0IHRoaW5rDQo+IGRhdGEtbGFuZXMgaXMgYXBw
bGljYWJsZSBhbnltb3JlLiBUaGUgaW50ZXJmYWNlIGJldHdlZW4gdGhlIENTSS0yIHJlY2VpdmVy
DQo+IGFuZCB0aGUgVklJRiBpc24ndCBhIENTSS0yIGJ1cy4NCj4NCj4gSSB0aGluayB5b3UgY2Fu
IHNpbXBsaWZ5IHRoZSBiaW5kaW5ncyBieSBzd2l0Y2hpbmcgZnJvbSBwb3J0LWJhc2UgdG8gcG9y
dCwgYXMgeW91DQo+IGRvbid0IG5lZWQgdG8gc3BlY2lmeSBhZGRpdGlvbmFsIHByb3BlcnRpZXMg
Zm9yIHRoZQ0KPiBlbmRwb2ludDoNCj4gDQo+ICAgcG9ydDoNCj4gICAgICRyZWY6IC9zY2hlbWFz
L2dyYXBoLnlhbWwjLyRkZWZzL3BvcnQNCj4gICAgIGRlc2NyaXB0aW9uOg0KPiAgICAgICBDU0kt
MiBpbnB1dCBwb3J0LCB3aXRoIGEgc2luZ2xlIGVuZHBvaW50IGNvbm5lY3RlZCB0byB0aGUgQ1NJ
LTINCj4gICAgICAgdHJhbnNtaXR0ZXIuDQo+IA0KPiBQbGVhc2UgdGVzdCB0aGlzIHRob3VnaCAo
YnkgcnVubmluZyB0aGUgRFQgYmluZGluZ3MgY2hlY2tzKS4NCj4NCg0KSSdsbCByZW1vdmUgQ1NJ
LTIgc3BlY2lmaWMgZGVzY3JpcHRpb25zLg0KQWxzbyBJJ2xsIHVzZSBhIHJlZmVyZW5jZSB0byBw
b3J0Lg0KDQo+ID4gKw0KPiA+ICsgICAgICAgICAgcmVtb3RlLWVuZHBvaW50OiB0cnVlDQo+ID4g
Kw0KPiA+ICsgICAgICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAgICAgLSBkYXRhLWxhbmVzDQo+
ID4gKyAgICAgICAgICAtIHJlbW90ZS1lbmRwb2ludA0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+
ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAtIGludGVycnVwdHMNCj4g
PiArICAtIHBvcnQNCj4gPiArDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+
ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+ICsgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPg0KPiA+ICsNCj4gPiArICAg
IHNvYyB7DQo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAgICAg
I3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gKw0KPiA+ICsgICAgICAgIHZpZGVvQDFjMDAwMDAwIHsN
Cj4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0b3NoaWJhLHZpc2NvbnRpNS12aWlmIjsN
Cj4gPiArICAgICAgICAgICAgcmVnID0gPDAgMHgxYzAwMDAwMCAwIDB4NjAwMD4sDQo+ID4gKyAg
ICAgICAgICAgICAgICAgIDwwIDB4MWMwMGUwMDAgMCAweDEwMDA+LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICA8MCAweDI0MTdhMDAwIDAgMHgxMDAwPjsNCj4gPiArICAgICAgICAgICAgaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDY0IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgPEdJQ19TUEkgNjcgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3NiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsN
Cj4gPiArDQo+ID4gKyAgICAgICAgICAgIHBvcnQgew0KPiA+ICsgICAgICAgICAgICAgICAgI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDww
PjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICBjc2lfaW4wOiBlbmRwb2ludCB7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgZGF0YS1sYW5lcyA9IDwxIDI+Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmY3NpMnJ4X291dDA+Ow0KPiA+ICsgICAgICAg
ICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICB9Ow0KPiA+ICsg
ICAgfTsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQoNClJl
Z2FyZHMsDQpZdWppIElzaGlrYXdhDQo=


