Return-Path: <linux-media+bounces-24917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7986BA164DB
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 02:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC23518870B1
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 01:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0BDCA6B;
	Mon, 20 Jan 2025 01:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="Gf3N9f1o"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1122.securemx.jp [210.130.202.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6868928EB;
	Mon, 20 Jan 2025 01:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737336361; cv=fail; b=rtgDnHWnVS1/taDReUd/amHnx5ZHWGrQfr+D82SCmhkYtlo2NAnk2U6vS+fNDCiocVqBflqHzw20jKc/oHID4TZD31L7UdNoT7iw2BGuCEk2wzvV9oZoLZ6/L63FarMP6uZhSA1J8D897H7zDjOKhGcM7qAir37A7eN+6XvZOJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737336361; c=relaxed/simple;
	bh=G6LpKQ+CsnXK6o5Kg744tus1TgCK9xFlXDDx12iHG8Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R7lGZYcH+H3xZyKUw1LbOlmXjMfBxFg8PHOKUHV1YcVhR023hQ3tCaxP9WVRAHlRwWmccffJ162d2IsQ4pVMSi7p8A0I7dVW16n1B7Bo9C33oBIWtZZnRiEi+l1vk/hAJ/hSuJUzucBnhfOSxvnN/EKAhCcsGwo4iwahlAq57GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=Gf3N9f1o; arc=fail smtp.client-ip=210.130.202.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1122) id 50K0LOKg2938536; Mon, 20 Jan 2025 09:21:25 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1737332450;x=1738542050;bh=G6LpKQ+CsnXK6o5Kg744tus1TgCK9xFlXDDx12i
	HG8Q=;b=Gf3N9f1oebZJWpK6ZjMFZ2uj9EN9t6NEmz389JmiAnCDI1Flojwd7GFYe8ceQlj+Pg/2a
	haUq5/8oxT+6zh6kYLsFPuUZkdMuI7B+qiHNYwEXe9CLdOzqaznBkqmHaIOYGcVX3dxOMXgLzG7LL
	6tSBKn2T3JdmdimpEcI4ml/iRlhCiKWXCgcataHE7YsmKDM82opf1APvo9Ywj8JkXWs6trPGIfnqF
	6IOlfmqkJ79HefHFzjd6Cxwgk+09WtccEQp1K1a3UKfqjwZuRJq0bOxNl9W9kbgVNRiA8Z34SRC5p
	3UqtT2xcqA2qYhWelVqHMrTpIBQ5FmP+RBoxgMGZ8A==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 50K0Knur2956907; Mon, 20 Jan 2025 09:20:49 +0900
X-Iguazu-Qid: 2rWhMjEQHjgupbD8MF
X-Iguazu-QSIG: v=2; s=0; t=1737332449; q=2rWhMjEQHjgupbD8MF; m=Y1wenCFOas+cZ30usCWJM48SfmLMT9Fd2wbmW+fslyY=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1123) id 50K0KlKm1412564
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:20:47 +0900
X-SA-MID: 38087437
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIESpdCVuzfEdeN6k/8+n7cd/9Neul6o38+aeth0UcQ0FVhEc4MviJ8OAYljcixp6wtqEp6MjclOJVIHTXU1cPSfGFFHST0teuTzjt7hWglF/GyLf/Xl1l8hchHnmO+8aXKAR7fn+io/nDCGdHkrZvxwiviqi90aIHfFRp55/cuCzs68D+BJOAXgkvjy2SFQnMzA6am74tgfedmZ/sIEPZnhZWMWGocVQSMqQbBiUdKVYOOJX00sw30AnBBfq9KPelTevlT8ftZuPYkhSNAG+7LFSAnw0mtYFrw3IFUbyKCMmJIjpjAUF4P+7xBGDTsdn4QtSxzfUDV6eRMT5pPiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6LpKQ+CsnXK6o5Kg744tus1TgCK9xFlXDDx12iHG8Q=;
 b=g7dwk0Ix/BQO5qR31OgKyUu+rigdcFWZPwMkHr7wBgk3KZhYFrjqZ85YRvNDlbxE6OvLMjvY0DEJ0v2QzNOuwmoqLfwunJ5G5xynIPFprDlOAHmM+FBQLtl/I10JioqOvDDhZ6QnHIr75TyXBU2eZ85w0M7xFTldPkr/76YWGd9eWmSBWREvgd2wnHxHaR2sZ463aXkktctwzl8EcaEPLHeFlCdqRXRh3EHayc5KjEtGLoVv1AOHcsQQVM4xli0XxUx7gClSKBv/EcxWKHRpbOxlVY0qEBtWdG+Ik8P6l4bvOtSXrKD5BuHHVB2oaDQsnE5pjJI6Qt1LLyKmMr/CAQ==
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
Subject: RE: [PATCH v12 3/8] media: uapi: add visconti viif meta buffer format
Thread-Topic: [PATCH v12 3/8] media: uapi: add visconti viif meta buffer
 format
Thread-Index: AQHbPxt/HZ6C7eM6U0KjZgnPZghZ7LMDsSOAgBtxdWA=
Date: Mon, 20 Jan 2025 00:15:43 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TYWPR01MB9986F8A0AC34DCE0C1F35F2692E72@TYWPR01MB9986.jpnprd01.prod.outlook.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-4-yuji2.ishikawa@toshiba.co.jp>
 <20250102131021.GG554@pendragon.ideasonboard.com>
In-Reply-To: <20250102131021.GG554@pendragon.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB9986:EE_|OSOPR01MB12395:EE_
x-ms-office365-filtering-correlation-id: 2df3bf11-0f7d-4ed1-cd13-08dd38e794b4
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?a2pVNERIVzNVZWswTzdDTnliQ1czU2Fnd3hYRWZRa3o5T0F3UkpuOHBISDNo?=
 =?utf-8?B?L25Yb0VjQUdNTXQySkpjUGZxRHVGWWtpWlBXNlc3eDNCK2pQQ2Q0UnU5Rkt1?=
 =?utf-8?B?NWZNZVJIQzdyTXZLelhwaXNXNE1XRTRiRmdYTlp4RW5BSzdTeFNwU1M2TVky?=
 =?utf-8?B?bTlYS00vd1ZEMVBQM1Z1THA3bnB4bkdmUjZaNm84aENOa0dwY2hPK2MzOXNO?=
 =?utf-8?B?WFgwRmczNWx2azI5ZVRIYklzSmJLTVdsZmp4SHJuQlJNNWJDb2pqaUpPeFdH?=
 =?utf-8?B?WXprbkF2L2JDak1mUyt6OGZIcTdzRlphL1cxMHhTU2tVNUlDZG41K2RkMGtq?=
 =?utf-8?B?cWdMUVEzUkJ0bFJETDFjSGsybm5XQWF5R1Z0RUNsUFpRUzlLeEVTT0w2dVFG?=
 =?utf-8?B?dzl5TW5oUFlTdHViVHgwVUVWcVZpOUh6eG1aRS9uM2Z0QjJmanJnTkdpcHBo?=
 =?utf-8?B?bTg0cDZRNEl2UXZjQzJxdjl3aE1mak5JdWdGUlRxWml3SmRsblVoK3MzSmNm?=
 =?utf-8?B?ZDVpTzIzS2xLSjNlaVJ1NXhxU0F5WnBBYU9MTnhZZCsxcDhJRjc3RjJ4WC9E?=
 =?utf-8?B?S3JqbFJvUWRGUGhkYVJEeEdVWm5tMitJTHA1L1o4dkJSWjNsWnB6amZZNFZ2?=
 =?utf-8?B?d2dNWGFQSEZxc0RYb0N4R3N2bGQyYWk0Y1VlTFl0QVJseWxMdENrM0FacmFo?=
 =?utf-8?B?djBXaExsUUV1WSttMFA4dC82T2RGVXVZWVNtQkVreSsyMXJVOS96dTFlc1kr?=
 =?utf-8?B?YzRYcWNtYjJCV3h3NUpQekpkMjQ1RzBKWmN6SURYRzcxUXdUZlQzSVNISzIz?=
 =?utf-8?B?SDQrcFpXazFzenY5eW9Gbk54dG50N1d0YkR0Sy9PeHpCS1BrRkxDemRNL3BH?=
 =?utf-8?B?TkVBb1hyQ2RaTkFrRnBtSlVQV1g0T2RhKzlCSlhqaTU2YXBZb3VDV1Y4TnhU?=
 =?utf-8?B?Z2lFc2VwanBuRU9BeGhDbXdIWVF1eURDQmtUUFp5NWJPdk9RanU0NVVPbjdG?=
 =?utf-8?B?eUdNN1MzTlVGc0pPZm1EZkNOeVNSYkYybnNSdUNKVGtsWk85NmV2UWFMVnNM?=
 =?utf-8?B?akhWeEFxemRaYmNpcEZYeG5CcmJjVFlValkvS2xGQlo5Q2U2NFU1Wkdqa29S?=
 =?utf-8?B?bS9xc3I2KzVsU0xRTkNUU0lkK3RCNjhhTGJybUFsaHVDdy9VSWNtdFJ2dWtV?=
 =?utf-8?B?VGRSSlU4OHpRbUtETUFVb1pLcytRdHlWblY3dmptSWxieUJUUER6cmkvZHdO?=
 =?utf-8?B?QnNFMXhyTTFteVNnOWdFbmtWNUlvS0J1eS9ueVF1bU5Ic3creTZMeTczTDVl?=
 =?utf-8?B?b2NkRkxVNW1sMVozVXppVWlKbndpQUs5MDNpNXZ5NlRDTmtYbzBid3ZlMjRz?=
 =?utf-8?B?Zm9lRGpBS1NYYmxSK0wvdUZZNmpQOUdGekxmTDIvcVc2T2VCOUptYm1NTEs4?=
 =?utf-8?B?UFBiZVFYMlVOTUhpN3pJbjhBZWs0NVVrNDVxOFlpakdudnMzVlhwenRLVHlM?=
 =?utf-8?B?SjgrelV2YnVaK2Y1a0NKbGdWaG1BY0djVHZFUS9BaHFOekxGQ0JQQ1FERG1T?=
 =?utf-8?B?MDlVYk1aNndtTStmZURidHlKQ2NHOWc1SHMzVENNV2FyMTRKMFNhTUtmUGl6?=
 =?utf-8?B?TnJGejBnQWtOOXNLQVU4WHBuQ0FDYTlGeXJiQVB3Z3VBZytsTkVqUWo3OSs1?=
 =?utf-8?B?Z2tMREdGU1VMQVdpanpJUlJNUkZmQjdTVkFxVjIyT2gyZjJrbFFPVEZWclRS?=
 =?utf-8?B?Y0pFZTdiTk9EaHNYQzFyemNHcnIrNkNidnBxQjlYblZLTEo5Y0RoV1VIMW1E?=
 =?utf-8?B?VnVpcGtVUkNDb0dUdzZiLytmdXBYQ1BpOTBiem1RRGVWdlZKMlF2UUVFYUFF?=
 =?utf-8?B?S0ViV1FIdDQ3UXAvRXJXS042bEZzcHg4U084SG9heUFSZHM4dzJYd1RrR2RR?=
 =?utf-8?Q?dlbIOSVRqH9Sasea5wBVTcEJ4pjyIU7t?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB9986.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SlBKV0IzTHdqSEx4L3puZVUvWjA1MUZySXlDOHFDR1FIL2dHVElCTk4wVzk2?=
 =?utf-8?B?cVlud3EwUG5TNklsdnhGemNwU3BnQnk5Z056c01wNlVVNXJwVm1jcFBpZ3FT?=
 =?utf-8?B?RmRZdlRRY0pibVFpMG0xTzZFOTNFZUxpUXBRYTdvdGpJRm56UE5oaTA2QzNp?=
 =?utf-8?B?YU4zMUppOXZvUHlUSkprdnlWYy9aelNmVjNSbVBBUnhXMUZSOFladlJhYml5?=
 =?utf-8?B?RjNKL1htZFJ6V1pTNEIyYWxKZlhJdlczcFBxTWpzREp5OXZWRUVWaHlpK29W?=
 =?utf-8?B?MWRxTkgwckdBY2Y4bCt6b3VaZkNabVdNQ0pnemFod3poR3NOS3lPYnRjZjhP?=
 =?utf-8?B?SVFyUjBYVGpYd2pNNmx6NW1Tczd3SkFmSmI0aDlDN3BMU3Y4eHNiWUJjbHhP?=
 =?utf-8?B?ZCt3dmRVaE9VRjNPV25RWElJN0daQUdrU0tIcG9Sd29wWG11dllidUR2OWNv?=
 =?utf-8?B?NDVBV2lTUHdKZzBCNWhqL1h5a3UvRnRjYmhjOFBwUVlYTExhQ3dtODBENE4z?=
 =?utf-8?B?UUVSUTY0RStGUVZKY0pzcnB3QjUzVlpiTHI5UjcvQllIQjVWaFB2QWlXTDhq?=
 =?utf-8?B?YXBMZDlWQWdKWk1SWEEwVmR3bVIxeU5NQXdaNWxUUWF3aE54cUhNZURtM09V?=
 =?utf-8?B?MEJHNEo4eXFJK0JJaUVzU09lSGJpL0VHVW81SUMwcVMyczhyU3ZWbXlsZFYw?=
 =?utf-8?B?akQxZVNOS0lybWZTSnEzb0NCa1hnQ2h1ZWR6bnpETlNhQ01EZFROL3VaZ1Az?=
 =?utf-8?B?S1JHZ2ErSmtzWTdPdEM3eWZxSHBuSnNuSW1LMnl3Um1saHhnNU1WTkJTUGk2?=
 =?utf-8?B?SUUzQlFUSnVRdXdDd01PdHU1OHExc05RYkcrbHpkWitKSkpENm9BUFdKRGNj?=
 =?utf-8?B?S0lFMUppTHNBdTJ1SUlSbFZSeE9odnRKak5ZUWVFbHN4SXhBZFgvR3o3d2kv?=
 =?utf-8?B?TTFKbGUzY1RGMUhDTXRPbncxb0M4R1VhTDIvVG5TQzU1QTVwQWdHcGMzYll6?=
 =?utf-8?B?Qy9xUkxxQTA2MHJSaitQVTBtY3k0cE54YWxwNDF4UnlQY0pZTks1Z3dkeGx6?=
 =?utf-8?B?OUczL3lxMjZQWlNhSmZEQ2wxTlRBaVZJYUUvcVV3TCtad3luWm5veXBBd3FY?=
 =?utf-8?B?dmE3akpsdjZNNkhzMi8ybWpuT1NWbStWYXBUQThjSURkNkIzSk1oQ2tjckxT?=
 =?utf-8?B?aVlYT0NkWnRRQmJUbmU0OW9ETTA5YitXUFFnaEFTa0FDaGNkdlBkeENnZm13?=
 =?utf-8?B?U3RkaituZlYvaC82YUdaa2g2b0F5Q2JKUzdUK1ZzRXBiU2pZaHNIMHphSWpu?=
 =?utf-8?B?eWI1VXFoR2ZLY0FMOXRCcVRoTmw2Q3hFTDNWOCt6SUZERnVqSjdJQmN4Nmpk?=
 =?utf-8?B?aWNra2xRcm1uRUt2T3F2dEpCMkNuYTRidmJGaXRWUUcwd0tCS0NtR2s1WHQy?=
 =?utf-8?B?bWwxTG5XSFptejZKS2psYXNrMXk4OFRiN3pRN2E3aVcyL0VSVFpaNit6cU8w?=
 =?utf-8?B?QnA4dWJCeXhHT2hDUXZNZ3JPZVR6WWJYL0kvRVEraEc2VjZpVjdQUkFURUlh?=
 =?utf-8?B?bE1YQ2VMTjZEV1VBdCtlT09HL3lTWGQ2U200US9qMlM1anR1QVA2T2pHTzY2?=
 =?utf-8?B?ekNDTXNmSVNFSjdNc2hlaVFoS0FBRUo2blNnanoyaVpNRUpodFZzU0prVEhi?=
 =?utf-8?B?NU9TV0lJUkdVMVBXZGVkaUl3ZlkzTWtqdnk2dWo2RTZpZ3plcTFZb2llZG9v?=
 =?utf-8?B?b0Y0aDk5VDdib1E3aGRjNkxabnNTOVo3emlmK2FTamlxOFRkYkVsTDlaZTVN?=
 =?utf-8?B?UTVXMXBJZVFVQmQreU9QV1BPSlp6M1QwRnMzM245ckQvZHpjR3Z6WjJBRDBK?=
 =?utf-8?B?R1U3eVRVdEQ3eGxraHJDUmJFRjBpdGF3dDgveHpWU1ZnS2drWE5WMmd3SzFl?=
 =?utf-8?B?bkdvRmZlRkR4NFl5ZVp2NzlhRWdHT04xOEFiVmRiOTQzZlo5d1hoM0Z5U1Yw?=
 =?utf-8?B?Zmk1QXYxUEg3UitPa2FFeVhyM1RjeEt6cDREeWF2R1RCbUpXWkdCa3orMjMw?=
 =?utf-8?B?c0RvUWlNcVl2TkF0dm5hVHBLNU5SOW9vc1oxWW1SdGJnRGtBRnBhWWJrY2c4?=
 =?utf-8?B?enhOTVVRK3hJUkhOREtkVzdlOEhtdWRqeGZHcnNReUtWWmJYMUdBZ3RJekFF?=
 =?utf-8?B?Umc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df3bf11-0f7d-4ed1-cd13-08dd38e794b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 00:15:43.9672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rc5Ze25k2k1vMdSOMwEhncbp36aor/ewlOdbkzKdyrLRHu98nXrpZSIL2+4EEzJvPTt5H74YJSu6hQKeZBZSP5TjPRc9vDikLTcbFQCfBUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12395

SGVsbG8gTGF1cmVudC4NCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyBjb21tZW50cy4NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51
YXJ5IDIsIDIwMjUgMTA6MTAgUE0NCj4gVG86IGlzaGlrYXdhIHl1amko55+z5bedIOaCoOWPuCDi
l4vvvLLvvKTvvKPilqHvvKHvvKnvvLTvvKPil4vvvKXvvKHplospDQo+IDx5dWppMi5pc2hpa2F3
YUB0b3NoaWJhLmNvLmpwPg0KPiBDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtl
cm5lbC5vcmc+OyBSb2IgSGVycmluZw0KPiA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5DQo+IDxjb25vcitkdEBr
ZXJuZWwub3JnPjsgU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPjsg
SGFucw0KPiBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+OyBpd2FtYXRzdSBub2J1
aGlybyjlsqnmnb4g5L+h5rSLIOKXi++8pO+8qe+8tO+8ow0KPiDilqHvvKTvvKnvvLTil4vvvK/v
vLPvvLQpIDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGliYS5jby5qcD47DQo+IGxpbnV4LW1lZGlh
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMiAzLzhdIG1lZGlhOiB1YXBpOiBhZGQgdmlzY29u
dGkgdmlpZiBtZXRhIGJ1ZmZlciBmb3JtYXQNCj4gDQo+IEhpIElzaGlrYXdhLXNhbiwNCj4gDQo+
IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gDQo+IE9uIE1vbiwgTm92IDI1LCAyMDI0
IGF0IDA2OjIxOjQxUE0gKzA5MDAsIFl1amkgSXNoaWthd2Egd3JvdGU6DQo+ID4gQWRkcyB0aGUg
VG9zaGliYSBWaXNjb250aSBWSUlGIHNwZWNpZmljIG1ldGFkYXRhIGZvcm1hdA0KPiANCj4gcy9B
ZGRzL0FkZC8NCj4gcy9mb3JtYXQvZm9ybWF0cy4vDQo+IA0KDQpJJ2xsIGZpeCB0aGUgY29tbWl0
IG1lc3NhZ2UuDQoNCj4gPg0KPiA+IC0gVjRMMl9NRVRBX0ZNVF9WSVNDT05USV9WSUlGX1BBUkFN
UyBmb3IgSVNQIHBhcmFtZXRlcnMNCj4gPiAtIFY0TDJfTUVUQV9GTVRfVklTQ09OVElfVklJRl9T
VEFUUyBmb3IgSVNQIHN0YXRpc3RpY3MNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1amkgSXNo
aWthd2EgPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanA+DQo+IA0KPiBBc3N1bWluZyB0aGUg
ZG9jdW1lbnRhdGlvbiBvZiB0aGUgZm9ybWF0cyBpbiBzdWJzZXF1ZW50IHBhdGNoZXMgaXMgZmlu
ZSwNCj4gDQo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IA0KPiA+IC0tLQ0KPiA+IENoYW5nZWxvZyB2MTA6DQo+ID4g
LSBhZGQgZW50cnkgZm9yIFY0TDJfTUVUQV9GTVRfVklTQ09OVElfVklJRl9QQVJBTVMNCj4gPiAt
IGFkZCBlbnRyeSBmb3IgVjRMMl9NRVRBX0ZNVF9WSVNDT05USV9WSUlGX1NUQVRTDQo+ID4NCj4g
PiBDaGFuZ2Vsb2cgdjExOg0KPiA+IC0gbm8gY2hhbmdlDQo+ID4NCj4gPiBDaGFuZ2Vsb2cgdjEy
Og0KPiA+IC0gYWRkIGRlc2NyaXB0aW9uIGZvciBtZXRhIGZvcm1hdHMgYXQgdjRsMi1pb2N0bC5j
DQo+ID4NCj4gPiAgZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jIHwgMiArKw0K
PiA+ICBpbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggICAgICAgfCA0ICsrKysNCj4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWlvY3RsLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEv
djRsMi1jb3JlL3Y0bDItaW9jdGwuYw0KPiA+IGluZGV4IDAzMDRkYWE4NDcxZC4uZjdmYWNiNjNi
OGVhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYw0KPiA+IEBA
IC0xNDcwLDYgKzE0NzAsOCBAQCBzdGF0aWMgdm9pZCB2NGxfZmlsbF9mbXRkZXNjKHN0cnVjdCB2
NGwyX2ZtdGRlc2MNCj4gKmZtdCkNCj4gPiAgCWNhc2UgVjRMMl9NRVRBX0ZNVF9SUElfQkVfQ0ZH
OglkZXNjciA9ICJSUGkgUGlTUCBCRSBDb25maWcNCj4gZm9ybWF0IjsgYnJlYWs7DQo+ID4gIAlj
YXNlIFY0TDJfTUVUQV9GTVRfUlBJX0ZFX0NGRzogIGRlc2NyID0gIlJQaSBQaVNQIEZFIENvbmZp
Zw0KPiBmb3JtYXQiOyBicmVhazsNCj4gPiAgCWNhc2UgVjRMMl9NRVRBX0ZNVF9SUElfRkVfU1RB
VFM6IGRlc2NyID0gIlJQaSBQaVNQIEZFDQo+IFN0YXRpc3RpY3MNCj4gPiBmb3JtYXQiOyBicmVh
azsNCj4gPiArCWNhc2UgVjRMMl9NRVRBX0ZNVF9WSVNDT05USV9WSUlGX1BBUkFNUzogZGVzY3Ig
PSAiVmlzY29udGkNCj4gSVNQIFBhcmFtZXRlcnMiOyBicmVhazsNCj4gPiArCWNhc2UgVjRMMl9N
RVRBX0ZNVF9WSVNDT05USV9WSUlGX1NUQVRTOiBkZXNjciA9ICJWaXNjb250aSBJU1ANCj4gPiAr
U3RhdGlzdGljcyI7IGJyZWFrOw0KDQpUaGUgbWVkaWEtY2kgaGFzIHJlcG9ydGVkIHRoZSBmb2xs
b3dpbmcgZXJyb3JzLg0KSXMgaXQgYWxsIHJpZ2h0IHRvIGxlYXZlIHRoZXNlIGVycm9ycyB1bmZp
eGVkIGFuZCBrZWVwIHRoZSBsaW5lcyB3aXRoIHRoZSBzYW1lIHN0eWxlIGFzIG90aGVyIGVudHJp
ZXM/DQoNCiMgVGVzdCBjaGVja3BhdGNoOi4vMDAwMy1tZWRpYS11YXBpLWFkZC12aXNjb250aS12
aWlmLW1ldGEtYnVmZmVyLWZvcm1hdC5wYXRjaA0KRVJST1I6IHRyYWlsaW5nIHN0YXRlbWVudHMg
c2hvdWxkIGJlIG9uIG5leHQgbGluZQ0KIzI2OiBGSUxFOiBkcml2ZXJzL21lZGlhL3Y0bDItY29y
ZS92NGwyLWlvY3RsLmM6MTQ3MzoNCitjYXNlIFY0TDJfTUVUQV9GTVRfVklTQ09OVElfVklJRl9Q
QVJBTVM6IGRlc2NyID0gIlZpc2NvbnRpIElTUCANCitQYXJhbWV0ZXJzIjsgYnJlYWs7DQoNCkVS
Uk9SOiB0cmFpbGluZyBzdGF0ZW1lbnRzIHNob3VsZCBiZSBvbiBuZXh0IGxpbmUNCiMyNzogRklM
RTogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jOjE0NzQ6DQorY2FzZSBWNEwy
X01FVEFfRk1UX1ZJU0NPTlRJX1ZJSUZfU1RBVFM6IGRlc2NyID0gIlZpc2NvbnRpIElTUCANCitT
dGF0aXN0aWNzIjsgYnJlYWs7DQoNCnRvdGFsOiAyIGVycm9ycywgMCB3YXJuaW5ncywgMCBjaGVj
a3MsIDE4IGxpbmVzIGNoZWNrZWQNCg0KPiA+ICAJY2FzZSBWNEwyX01FVEFfRk1UX0dFTkVSSUNf
ODoJZGVzY3IgPSAiOC1iaXQgR2VuZXJpYw0KPiBNZXRhZGF0YSI7IGJyZWFrOw0KPiA+ICAJY2Fz
ZSBWNEwyX01FVEFfRk1UX0dFTkVSSUNfQ1NJMl8xMDoJZGVzY3IgPSAiOC1iaXQNCj4gR2VuZXJp
YyBNZXRhLCAxMGIgQ1NJLTIiOyBicmVhazsNCj4gPiAgCWNhc2UgVjRMMl9NRVRBX0ZNVF9HRU5F
UklDX0NTSTJfMTI6CWRlc2NyID0gIjgtYml0DQo+IEdlbmVyaWMgTWV0YSwgMTJiIENTSS0yIjsg
YnJlYWs7DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaA0K
PiA+IGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oIGluZGV4IGE1NDE4NzU5ZTJiYS4u
OWUxZjY2ZmRmMDM4DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3Zp
ZGVvZGV2Mi5oDQo+ID4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oDQo+ID4g
QEAgLTg2Myw2ICs4NjMsMTAgQEAgc3RydWN0IHY0bDJfcGl4X2Zvcm1hdCB7DQo+ID4gICNkZWZp
bmUgVjRMMl9NRVRBX0ZNVF9SUElfRkVfQ0ZHCXY0bDJfZm91cmNjKCdSJywgJ1AnLCAnRicsICdD
JykgLyoNCj4gUGlTUCBGRSBjb25maWd1cmF0aW9uICovDQo+ID4gICNkZWZpbmUgVjRMMl9NRVRB
X0ZNVF9SUElfRkVfU1RBVFMJdjRsMl9mb3VyY2MoJ1InLCAnUCcsICdGJywgJ1MnKSAvKg0KPiBQ
aVNQIEZFIHN0YXRzICovDQo+ID4NCj4gPiArLyogVmVuZG9yIHNwZWNpZmljIC0gdXNlZCBmb3Ig
VmlzY29udGkgVklJRiBzdWItc3lzdGVtICovDQo+ID4gKyNkZWZpbmUgVjRMMl9NRVRBX0ZNVF9W
SVNDT05USV9WSUlGX1BBUkFNUwl2NGwyX2ZvdXJjYygnVicsICdJJywgJ0YnLA0KPiAnUCcpIC8q
IElTUCBQYXJhbXMgKi8NCj4gPiArI2RlZmluZSBWNEwyX01FVEFfRk1UX1ZJU0NPTlRJX1ZJSUZf
U1RBVFMJdjRsMl9mb3VyY2MoJ1YnLCAnSScsICdGJywNCj4gJ1MnKSAvKiBJU1AgU3RhdHMgKi8N
Cj4gPiArDQo+ID4gICNpZmRlZiBfX0tFUk5FTF9fDQo+ID4gIC8qDQo+ID4gICAqIExpbmUtYmFz
ZWQgbWV0YWRhdGEgZm9ybWF0cy4gUmVtZW1iZXIgdG8gdXBkYXRlIHY0bF9maWxsX2ZtdGRlc2Mo
KQ0KPiA+IHdoZW4NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0
DQo=


