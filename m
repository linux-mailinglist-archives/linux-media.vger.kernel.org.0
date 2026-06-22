Return-Path: <linux-media+bounces-65362-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C1HbB8EeOWqKnAcAu9opvQ
	(envelope-from <linux-media+bounces-65362-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 13:38:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7302F6AF27E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 13:38:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=selector1 header.b=4lQJ1LiY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65362-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65362-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EB8D304CEB9
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925412C0296;
	Mon, 22 Jun 2026 11:32:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0D929D27A;
	Mon, 22 Jun 2026 11:32:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127951; cv=fail; b=FsSApBV25YchnDW4MrbLkycLQu/2iN1Vwb3T0aBddTWmiVVHPazVXrdZEkjDJZwlUN1Byw4sJ6qlN2AGtnMTL6kfoxb8P///LsiFG01ht0su8N2Temeu6iRqiHGzjPC73+CFTeV+20ycrqvoDQUNhIOf35tDHjYkrKZ8IrnzSdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127951; c=relaxed/simple;
	bh=0g4GImH3Uuxx8bjJ8PRyA0oBVyecxem4Hphbha7qyFs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rZwPyhk2o/i38pcjkrQA5ds81AICaPp/O86+yV38Ay9rr55ZvV96c/sl3+P5YnQ036eLWDGU9LVXsKHdyh2hiX0tKwsfqz5NuFl4nzDiL3aWLzIvtYZfsstBVFSARkSj7yzJ4eAqQCdDLHGHzQbEKGm3kPBwAid9Jfto5ZBXj7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=4lQJ1LiY; arc=fail smtp.client-ip=52.101.46.62
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsueroMup+9G6/p0hcvimwRNjMwHnZa0BfbVwG5SITs0vGnR+HWFKZpu8ZOQEyUKAwqoiidCu0A0iAVqHlOlDPpACyOBgNfA5mBjIReI7u1fRfVEsWevAFMJ3x1BJv8WZyX6Im21R1NC7DUvYCg5OS/onwkeww5/PevNZE6/lEqPL+7u3XFdLm+50akN3ZaPKBfwZUHjt2eBxNjzueTAfWExKX7SAMEwSAtmmKqfGxo9KzJnPdzZEnfSlbJxIEMs0ahQQk4pK6Pu8oQlmPmllG4/wZhhai5ifCA9XvIywIW+GDf9wuP14n6925hBeIwKXuNDr3pi8K+ng5dBDLlRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0g4GImH3Uuxx8bjJ8PRyA0oBVyecxem4Hphbha7qyFs=;
 b=kaLRN6agtSVkY07+RHuUjlQo6Jb7mf1IU1YL3nR5AT5A5u4O8XX5PCJgfriRjCx7qAbLeNIwfFn5pFPtpIEgLAGRTrLZuk49OPIGdMteLWYmf0seVryI/Dkw5difcEHqHzSSTudhKtWCLb4If4CPBN3OD4sVbZk8rXb5WKbulfWHpCD29vMreA3tmNxux8BlLhKYwRyYNONlsiZKP7NXhbiJUjGzHpmlwJVG37OZHeFWPl+bPg0qbRhO8lF/1VMKJJ2i+ejnYbCeuvZkmCl+8xM70ePa1cx5doWzsgtQrFUKJpultOTdpxqJOn2HdjQHFxpyizU+11iCYuzQUEe2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0g4GImH3Uuxx8bjJ8PRyA0oBVyecxem4Hphbha7qyFs=;
 b=4lQJ1LiY7gwZfyajnbjArfoveIQ0xKYA+0RR7VVT5NRBSLW239oV85518iG8lQJmn/EHCg/CQF9k1TpgIemvTSWxscEt5aHiRrtp/RDzDc3YbFsychfF0lweKVcyQIfkPKTUvfMf+H4kXn+JQYGimJblMjRQ0YIOSNJPSsbg/Gj1XtqakIjefomeSCi6tBEhJ3gkUfYRu98eBn6G+0to19mFcRMHZZJlkRHXH0m35Ml5aN0gJDSmZtmdcn7Drdze0Ms4SKmWiw3Pb6glOS7U4oYoxwzz3F+aUXnF40Qj11T7WehSMcDn2PhS4hX3AdJE1yFm20cWXKZOaw3mrgESjg==
Received: from SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 11:32:27 +0000
Received: from SJ0PR11MB4910.namprd11.prod.outlook.com
 ([fe80::7af:4219:9135:f1a5]) by SJ0PR11MB4910.namprd11.prod.outlook.com
 ([fe80::7af:4219:9135:f1a5%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 11:32:26 +0000
From: <Balakrishnan.S@microchip.com>
To: <ehristev@kernel.org>, <mchehab@kernel.org>
CC: <hverkuil@kernel.org>, <sakari.ailus@linux.intel.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 07/10] media: microchip-isc: fix pfe_cfg0_bps comment
Thread-Topic: [PATCH 07/10] media: microchip-isc: fix pfe_cfg0_bps comment
Thread-Index: AQHc/YZ+AHwHFR4u1E2m0TgZgk3tO7ZIkxgAgAHndAA=
Date: Mon, 22 Jun 2026 11:32:26 +0000
Message-ID: <ab562e26-2cb7-45ee-96fd-53103ed9001f@microchip.com>
References:
 <20260616-balki-isc-prefix-fixes-v1-v1-0-b23677fc5ab6@microchip.com>
 <20260616-balki-isc-prefix-fixes-v1-v1-7-b23677fc5ab6@microchip.com>
 <6ffd489e-8f24-47b2-bbfb-ac464798883f@kernel.org>
In-Reply-To: <6ffd489e-8f24-47b2-bbfb-ac464798883f@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB4910:EE_|DS0PR11MB7652:EE_
x-ms-office365-filtering-correlation-id: ebfc719e-5622-4c01-9291-08ded051efec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 Sw1X0XEinSLkDpt0jGQsV6iX0GL0PYXjMfILFikgMAvmzDvmZXL7lzV1csjnPoSXSkv+aXoUMtAQuN7HsAN9mdpoefz1KqFY/6ypDeiMQF+JmrzpX3JvLbfTYC1sykjSrSd0e3xMQ64sidijAwMNyWJFtNSDfzfFmLTrDUMnYy/iW3kJxRVCf5IecwPEnFLjky8htq8GFFDW4O5HEQvjEyb5q2CWpOYoD630fKdXVjGG5hEMRcteKkFzilDHVAa5xVvvSND6BclqpslYY+PttBTUEjvJaY6nDgKmJL8fS+0gySK2yg7b7OBa1LGUHg8F0e0vaHEb6NP+vD2vEnYDCMbf0yZGV3qGQ/k0iSEn9W/mKbEp36Yh7S4JtQItSjm01PawDP/4PXXmqPSRwn3wJV3EVwbobEuOoZF5dHKkHrlXTF+9y7N9n86d4SZR98ExNr9YXLcNd5H1ygmFMiYjbcXrxKaVAZu5gbrKh6dTaQr3dFafp9a9y/Jrb/Gm7to+4hjR6eskpma1cpLIaYxBK/AAaf8sMnhPU0nFEbiZfGA6fvNpIRmqAjA1zGImHf2me0PcysT/7mXIhVxf3POuY6mDzAeL1gXmhGyeqxULFk6fTkSmszplR0dNNw8+S63kdj9mzxews8BomI0nXmzZAZwCwqV40/wAfgvLw+SuR9p08ycnZkJ/XUeOZ8ySvu62mXNqCOHAHRXtb3MJcnLq8kpmfbSPGmD+p04nGDQOUVo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4910.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHgySXo3bS9kN3JxbEFvMEVKOWY0aGdCZGcreGZuOVkrWHVYVlBVL1NUbHZ2?=
 =?utf-8?B?enhFU2U2VmRLR3NvcEhCN1NFNU8xaVhnQkFMZ3M3b2pxVTY5d21mcUZyQ0xL?=
 =?utf-8?B?L3JxZ0RMbVdqZ1FlYllhbHdXaHJ0MHdCZGFtUTZmRGUyQ0dwYkpvaU1yN2Vx?=
 =?utf-8?B?bUZCRHZGYitwTWMvREFBYTBSV0VpZFJGNzh5YnpaYXNNcDZTdTkrVmZBNDF0?=
 =?utf-8?B?RXlMRm16ZzlCdmxRTXdCblVYZVplMFhJWC9pK3BrblZPZ3JUMiswNklqQmRu?=
 =?utf-8?B?SHNka010MjBzTHVMejdzd0lLMThoYnMreEZBd0ZqTFVKZ2VOcVdXRjFJQjhk?=
 =?utf-8?B?bnVVWWRQTmYvT0VnZDFUSVE4QWdHYmJKQWQ1dHdXcWp5eWJKTlZZVzNOWW45?=
 =?utf-8?B?ejZEb2pzeVVOMDYxMVJjMjIwNVczODhHcFdIZEFXSEVzZTc3Uk9iTVlNNnJ4?=
 =?utf-8?B?azZEU3ZpZnlmM2U1T0pzOStsQjVSd3VtV3ZJMUlMS2NoeGRPVmhpaU9OTmV5?=
 =?utf-8?B?bTh0c2UxQjNkdjVxdmo4SGJwSzJoV0tQUnZJVktKMW9wa1lNb2Y1NzZDUFBV?=
 =?utf-8?B?MVhjaWFxYTY5bDVDcEdiNUdxbHlLYWUvUTRKam1YcEpXN1BKNWpIL3lNN0Ew?=
 =?utf-8?B?dktubmhCeDJvS1NaNzl4Z0Y3UHltQS8xQ3BDL21hNTY3SkpibUVDbVM3UkND?=
 =?utf-8?B?TmVXT09ObGtMaC9aem5qRjVmOFVxalBWSTRkK1F4ellJWCtjT3hzM3BCOXF6?=
 =?utf-8?B?aldkOHFrQ0d2aFlML1psMnZRcWRCMTBXZ20vb3VYN0pkSi93Wjc3V2REU2dO?=
 =?utf-8?B?N0UzY0I2eXY4R3lEb2JrSzZOd0NqTC9HTm85ak9lNVAybGJlcmNYQm9xNjFZ?=
 =?utf-8?B?REppRlExWlRZMkllRk1VQ3dlMDZ5T2FTc0JMa0M1RGU0TjNOSnZDYUVtWERi?=
 =?utf-8?B?Qms2WUhESkN2VnJ3SWtBMml6cSsxa2ZVdjNjcWdic3VZSW1RMTgyM2kreUFQ?=
 =?utf-8?B?aklZaytEK0RCMXhTNWFDNUZ3SXpDZTlJMnp4OHcrVFo0NyttMWRTeVdoYzFv?=
 =?utf-8?B?d24zR1p0bVU5VVNYbG5RODdCbHBUUE42NnlybTJPQzBsZWhjdGpqM0dxenhp?=
 =?utf-8?B?WEk1NUR1bjhDdi9rbHliMjN0TW5sOGhhOTBTcEFQc3QvZ0JGb3l1WWNPRlJ3?=
 =?utf-8?B?TEVVZXNxanVyL0lRcWhNVXJpbGxDR3Y0SHBsY3NSNG1JMzdJYmtGK1RjNFZu?=
 =?utf-8?B?dzViYmR1d2dtSk5CY054eW9QRnNoenJ2cVRCUFdqMFFDNnptbkZFbHdHUUJQ?=
 =?utf-8?B?UEY3TFFZUndKRHViL0o0R0VqSGd2TWpNZE1lSGZHSTdqcURWOUp3eU5pL3A1?=
 =?utf-8?B?TlJRcUJEQ0d5Y2VDbEQzQ0oxYUw3WWs4amNOTGRvanlnTmFwOUVIaW8zUmtS?=
 =?utf-8?B?UGtPN1VLQllMdUNCWWtJcVRONVR3bU9UYzZ2YWJZZ0FRVEtUcjdNZVN2ejkz?=
 =?utf-8?B?MjZsa1E5R3ROYnphREtabktqb1ZGTU05VTd0S2JRNFZNMkZqMm10QTdCbUF5?=
 =?utf-8?B?dEQwR290TEhFd0crbFo0QkNDQlJCZ2FBd29VTVJPcG1OK2oydEJFbVR1bnJM?=
 =?utf-8?B?anpBM3A1QmtWd0c4dEJGQkhCOGg4QVJhUno0ZWYwVW9CTFRsN0pCRWVjeXpx?=
 =?utf-8?B?ZXlVamF2aHZWVUFUc2lNU0FVZ21yYit6U05FMXRaSHprcEhxdFZPWUhuWGwr?=
 =?utf-8?B?K2EyTm1ncmkwTG9FaWxoQkRFYUI3SW1BQkhrQ0lqcU5zaEFCc2lyR3ZSckcv?=
 =?utf-8?B?MXdYeVhKd1lCSldJWnIyQjh2SWtxZGVSTmlvVWU0OUVlZ2pkTmdmaTFxaCsv?=
 =?utf-8?B?cW8ybVA2TVVCL2p6bkhDSXgwOGN4S2VZT2prVE1ZbDRpS3laWXRzdzZlTk1E?=
 =?utf-8?B?S0x2MVdCY3Vrd2FTNEtxR1ZNcDBGSnBNcHpxVkNuUExvUEV5SWgwRmkzckpk?=
 =?utf-8?B?SVNwb0VLOWRseDQzanVPY3k2Z0EzeGJkOE9DaUNRaW8zelRSYjFVZTEzcCtT?=
 =?utf-8?B?UTlSc1Jvc2M5K25IaDB3YlN1ZVVSc0lEeU5uMGhveVplNzFKWjZZNG43MWRh?=
 =?utf-8?B?NFpjK3ZmMlRWZFFTR3hoUEo3WE9rRm1hcTVYbmpjRll5cVc5UzBrVzNuUyti?=
 =?utf-8?B?SVQ4eHVSK0JKaHM4eVU3b3U5ZXYyNmowZ3JJdWpGb1BDem9ibVpUK0pUaFdI?=
 =?utf-8?B?TzdQZVlqZExkbkZUWFBScEtDSkZYelFNQm5zaE1NakZKZkhhcTQ1SWtpclB0?=
 =?utf-8?B?M0FsaTR1VHZWbUhZNWZuYVBsUldqK3MxZ2lQcHB6cGgyQjUreFR4dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38A3E585F52D10479D530660609DD828@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfc719e-5622-4c01-9291-08ded051efec
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 11:32:26.9350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iB4lRtAX+LqPLlnVXzoCYjb1ri5tBdsvIf5MdHblHZ+4WYc26MGBhz8dRgcaT8kfE7gNug8EOYuaOf7weIE5z1+S3tM4P+7MoBY1e3e8EdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65362-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Balakrishnan.S@microchip.com,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[Balakrishnan.S@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,microchip.com:dkim,microchip.com:email,microchip.com:mid,microchip.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7302F6AF27E

SGkgRXVnZW4sDQoNCk9uIDIxLzA2LzI2IDExOjU3IGFtLCBFdWdlbiBIcmlzdGV2IHdyb3RlOg0K
PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDYvMTYvMjYgMTQ6
NTEsIEJhbGFrcmlzaG5hbiBTYW1iYXRoIHdyb3RlOg0KPj4gVGhlIEBwZmVfY2ZnMF9icHMgY29t
bWVudCBjbGFpbWVkIHRoZSBmaWVsZCBob2xkcyB0aGUgIm51bWJlciBvZg0KPj4gaGFyZHdhcmUg
ZGF0YSBsaW5lcyBjb25uZWN0ZWQgdG8gdGhlIElTQyIuIEl0IGRvZXMgbm90LiBUaGUgZmllbGQN
Cj4+IHN0b3JlcyB0aGUgcHJlLXNoaWZ0ZWQgUEZFX0NGRzAgQlBTIHZhbHVlIChlLmcuIElTQ19Q
RkVfQ0ZHMF9CUFNfRUlHSFQsDQo+PiB3aGljaCBpcyAweDQgPDwgMjgpIGFuZCBpcyBPUmVkIHN0
cmFpZ2h0IGludG8gdGhlIFBGRV9DRkcwIHJlZ2lzdGVyDQo+PiB3b3JkIGluIG1pY3JvY2hpcC1p
c2MtYmFzZS5jLg0KPj4NCj4+IFRoZSBvbGQgd29yZGluZyBpbnZpdGVzIGEgcmVhZGVyIHRvIHRy
ZWF0IGl0IGFzIGEgc21hbGwgYml0LWRlcHRoDQo+PiBpbnRlZ2VyICg4LCAxMCwgMTIpIGFuZCBj
b21wYXJlIG9yIGRvIGFyaXRobWV0aWMgb24gaXQgZGlyZWN0bHksIHdoaWNoDQo+PiBzaWxlbnRs
eSBicmVha3Mgc2luY2UgdGhlIHZhbHVlIGlzIHNoaWZ0ZWQgaW50byBiaXRzIDMwOjI4LiBEb2N1
bWVudA0KPj4gd2hhdCB0aGUgZmllbGQgcmVhbGx5IGhvbGRzIGFuZCBob3cgdG8gcmVhZCB0aGUg
Yml0LWRlcHRoIGJhY2sgb3V0IHdpdGgNCj4+IEZJRUxEX0dFVChJU0NfUEZFX0NGRzBfQlBTX01B
U0ssIC4uLikuDQo+IA0KPiBJbiB0aGlzIGNvbW1pdCBtZXNzYWdlIEkgd291bGQgZm9jdXMgb24g
dGhlIGNvcnJlY3QgbWVhbmluZyBvZg0KPiBwZmVfY2ZnMF9icHMgYW5kIHN0b3AgaW5mZXJyaW5n
IHdoYXQgYSByZWFkZXIgKm1pZ2h0KiBoYXZlIHVuZGVyc3Rvb2QuDQo+IExldCdzIGp1c3QgZml4
IGl0IHRvIGJlIHJpZ2h0LCBleHBsYWluIHRoZSByaWdodCB3YXksIGFuZCBmb3JnZXQgdGhlDQo+
IHdyb25nIHdheS4NCg0KU3VyZS4gV2lsbCBmaXggdGhlIGNvbW1lbnQgdG8ganVzdCBzYXkgd2hh
dCB0aGUgZmllbGQgaG9sZHMuDQoNCj4gDQo+IEJ1dCBpdCBsb29rcyBsaWtlIHdlIGNvdWxkIGlt
cHJvdmUgdGhpcyB0byBob2xkIGFuIGFjdHVhbCBtZWFuaW5nZnVsDQo+IGRhdGEgaGVyZSwgaW5z
dGVhZCBvZiBhIHByZXNoaWZ0ZWQgdmFsdWUsIGFuZCByYXRoZXIgc2hpZnQgaXQgdG8gdGhlDQo+
IHJlZ2lzdGVyIHdoZW4gdGhlIGhhcmR3YXJlIG5lZWRzIGl0Lg0KDQpZZXMgdGhhdCBzZWVtcyBi
ZXR0ZXIuIFdpbGwgc3RvcmUgdGhlIGFjdHVhbCBicHMgdmFsdWUgYW5kIHNoaWZ0IGl0IGF0IA0K
dGhlIFBGRV9DRkcwIHdyaXRlIHdoZXJlIGl0cyBuZWVkZWQsIHdpbGwgdGhhdCB3b3JrID8NCg0K
SWYgc28gd2lsbCBmaXggYm90aCBpbiBuZXh0IHZlcnNpb24uDQoNClRoYW5rcywNCkJhbGFrcmlz
aG5hbg0KDQo+IA0KPiBFdWdlbg0KPiANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBCYWxha3Jpc2hu
YW4gU2FtYmF0aCA8YmFsYWtyaXNobmFuLnNAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICBk
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21pY3JvY2hpcC9taWNyb2NoaXAtaXNjLmggfCA2ICsrKysr
LQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWljcm9jaGlwL21pY3Jv
Y2hpcC1pc2MuaCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWljcm9jaGlwL21pY3JvY2hpcC1p
c2MuaA0KPj4gaW5kZXggZjVlMzIyYzJlMzZiLi5iMDg0NDU5ZjQ1ODMgMTAwNjQ0DQo+PiAtLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21pY3JvY2hpcC9taWNyb2NoaXAtaXNjLmgNCj4+ICsr
KyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWljcm9jaGlwL21pY3JvY2hpcC1pc2MuaA0KPj4g
QEAgLTYyLDcgKzYyLDExIEBAIHN0cnVjdCBpc2Nfc3ViZGV2X2VudGl0eSB7DQo+PiAgICAqIEBt
YnVzX2NvZGU6ICAgICAgICAgICAgICAgVjRMMiBtZWRpYSBidXMgZm9ybWF0IGNvZGUuDQo+PiAg
ICAqIEBjZmFfYmF5Y2ZnOiAgICAgICAgICAgICAgSWYgdGhpcyBmb3JtYXQgaXMgUkFXIEJBWUVS
LCBpbmRpY2F0ZSB0aGUgdHlwZSBvZiBiYXllci4NCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
dGhpcyBpcyBlaXRoZXIgQkdCRywgUkdSRywgZXRjLg0KPj4gLSAqIEBwZmVfY2ZnMF9icHM6ICAg
IE51bWJlciBvZiBoYXJkd2FyZSBkYXRhIGxpbmVzIGNvbm5lY3RlZCB0byB0aGUgSVNDDQo+PiAr
ICogQHBmZV9jZmcwX2JwczogICAgUHJlLXNoaWZ0ZWQgSVNDX1BGRV9DRkcwIEJQUyBmaWVsZCB2
YWx1ZSAoZS5nLg0KPj4gKyAgICAgICAgICAgICAgICAgICAgIElTQ19QRkVfQ0ZHMF9CUFNfRUlH
SFQpLCBub3QgYSBwbGFpbiBiaXQtZGVwdGggaW50ZWdlci4NCj4+ICsgICAgICAgICAgICAgICAg
ICAgICBPUiBpdCBkaXJlY3RseSBpbnRvIHRoZSBQRkVfQ0ZHMCByZWdpc3RlciB3b3JkLCBvciB1
c2UNCj4+ICsgICAgICAgICAgICAgICAgICAgICBGSUVMRF9HRVQoSVNDX1BGRV9DRkcwX0JQU19N
QVNLLCAuLi4pIHRvIG9idGFpbiB0aGUNCj4+ICsgICAgICAgICAgICAgICAgICAgICAzLWJpdCBC
UFMgZmllbGQgdmFsdWUuDQo+PiAgICAqIEByYXc6ICAgICAgICAgICAgIElmIHRoZSBmb3JtYXQg
aXMgcmF3IGJheWVyLg0KPj4gICAgKi8NCj4+DQo+Pg0KPiANCg0K

