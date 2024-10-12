Return-Path: <linux-media+bounces-19481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA499B057
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 05:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62F651C21D49
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 03:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E729E84DF8;
	Sat, 12 Oct 2024 03:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="acofi24m"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2070.outbound.protection.outlook.com [40.107.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70621224D7;
	Sat, 12 Oct 2024 03:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728702584; cv=fail; b=YOLeDEH7OFCXZwdUHzjTkxxLr8e3YZTcr1X6DuzYUBgo5Capm+sWOIQ2rcl0toQQqYsmYakSg/nfoFZkKaA4wIoIjhb8YwDG64XCXo07zt/kV1fYPFrw+Hiav2w35bdKG9Az7bKT8J7gjJ6gcquGqrMhEAFLpQoi3ZRzm2rzhWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728702584; c=relaxed/simple;
	bh=CsalL0/ocWEhxb3Xq9jykkjfH8leyu3pOtZnGch54Xk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uQI+v1bA5FapphJdTbxJOVI24933tCTAebCl8+XkSU2KHGV0JjIHn6melJZwC6ntN+sEUOTdbKr9TdhZwG9dgGsWjp99acVJ3GlDvJU0lKZQDD3vV6AQD+hDRmjW0a/tnDpvs6/PhOyY/cXlquwMeNoLDV7KfTu4LYQS/S4FeGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=acofi24m; arc=fail smtp.client-ip=40.107.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TddgK/uDCLh4xkBKWBYpk/+ZRmn8hk4AS0erOKItse/ej645SHF1M3SDyfbccN9N5J2va5LOIkirp/0ysrsUs8bUx3BZ0ypO+9BXiDknC1RXDc1nvlIFc6d72tk9d7kVrOnEr0KjsBIUs++YztlFToAZI0Xekx76PaSnJtwajLXturf3GEr+l+IumqkAjonzPSlxTHPZIohYq+e9esLrpud+zMd0coq3GpKp2NgUL80Dueg+G4p+25ja7ct3LrciC9/rzZJf4GbE8gIqoEsp4ibSFTj/ncYfHC+aPaqjUgwEperGdqv2Wm/9Hh9WfVmwtVLpOSmSf5ra1vLtyXLskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsalL0/ocWEhxb3Xq9jykkjfH8leyu3pOtZnGch54Xk=;
 b=JrhDdrpmborTETkLNxsizPTAD7/ZTnPIJIqC2jVO+Lcww2/CTKsl84CDPKSmBLcAoznVTmZmxv+hB3tT0ci1kkkDlp8ldwtFJUGvhDJQMI5AMcHukscviNU6xXIy8AKMSxY2v6h9wQBUmW8ez50l186677H/pCvac9SedzqufG/Fk3SdjyYoYM1C4D7nPr6Ozi9cdP2Fpt8ctIGywig1WKMb4PPRAWjWYJ+fVpVvV22tWbL2QU/RxrDO8qZYRbeNaOkuojgiGqYlollGldZyaSVl+RbVqGxwhE4Jfj1s+XBtytnAgTGv21s02DK2wC9zljssqljGO/hsdLtRZKOSVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsalL0/ocWEhxb3Xq9jykkjfH8leyu3pOtZnGch54Xk=;
 b=acofi24mDRoa+1nyKtkSsF3HLKiRrwcQeeWIuqb3Yyp+VvkGb2jRTrOerAtZ3aq8AJWkR29FEAnrWJSFpy5Xp9Nx7ZTaxqZdEPe72yv1i+pxyxs5ELs+rvhsqKdwcaB6T388ds3Ow5Js+efhhXqFEAC11hqPp+9e+V86fti9WmLsCkAg2LCNHaEKF0j+o0eriDga0XhyaGRcsWB8L+GNHEyRUq2N0SUzP0GAvWyxYGMPfRWitmlK49bJIuXVGxtUuTf/A0DzUJF9ZLiGuYTg6ASv1i+sgSKpUIf5ddBE6gTvVvpqmKQAyRZikBsnEjM/aukH5yOlDJYbUHkPrmPx1w==
Received: from KL1PR0601MB4452.apcprd06.prod.outlook.com (2603:1096:820:7d::8)
 by TY0PR06MB5307.apcprd06.prod.outlook.com (2603:1096:400:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17; Sat, 12 Oct
 2024 03:09:36 +0000
Received: from KL1PR0601MB4452.apcprd06.prod.outlook.com
 ([fe80::212a:57de:588d:c035]) by KL1PR0601MB4452.apcprd06.prod.outlook.com
 ([fe80::212a:57de:588d:c035%6]) with mapi id 15.20.8069.001; Sat, 12 Oct 2024
 03:09:36 +0000
From: =?utf-8?B?6YeR6LaFLei9r+S7tumhueebrumDqA==?= <jinchao@vivo.com>
To: Sean Young <sean@mess.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, =?utf-8?B?6buE55CG6bmP?=
	<huanglipeng@vivo.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?UmU6IOWbnuWkjTogW1BBVENIIHYxXSBtZWRpYTogcmMtY29yZTogTW9kaWZ5?=
 =?utf-8?B?IHRoZSB0aW1lb3V0IHdhaXRpbmcgdGltZSBmb3IgdGhlIGluZnJhcmVkIHJl?=
 =?utf-8?Q?mote_control.?=
Thread-Topic:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjFdIG1lZGlhOiByYy1jb3JlOiBNb2RpZnkgdGhl?=
 =?utf-8?B?IHRpbWVvdXQgd2FpdGluZyB0aW1lIGZvciB0aGUgaW5mcmFyZWQgcmVtb3Rl?=
 =?utf-8?Q?_control.?=
Thread-Index: AQHbEMwunk2Y8hYtD0CQyIaElKqicLJz9qmAgAguhZ+AAa7DOIAD3+KAgADS6YA=
Date: Sat, 12 Oct 2024 03:09:36 +0000
Message-ID: <1a2149bb-9ac5-4cb0-9361-c292b66c214b@vivo.com>
References: <20240927105808.9284-1-shenlichuan@vivo.com>
 <Zv2xGbdhm8kXgDFe@gofer.mess.org>
 <TYZPR06MB6895415657AFF1C1723F9020DF7E2@TYZPR06MB6895.apcprd06.prod.outlook.com>
 <KL1PR0601MB445295795E1DBE993238FB17DB7F2@KL1PR0601MB4452.apcprd06.prod.outlook.com>
 <Zwk3g-B6dJWgqE41@gofer.mess.org>
In-Reply-To: <Zwk3g-B6dJWgqE41@gofer.mess.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB4452:EE_|TY0PR06MB5307:EE_
x-ms-office365-filtering-correlation-id: 617446b9-06a1-4a27-d976-08dcea6b4d69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cDVXNm9ScktwV3VLUUdYZ0k5d0VKWm9wOHJsV1J3dUVzazBxMzBSOUVkWkRM?=
 =?utf-8?B?UEJlYUxCenBpSWNJODd1R2R6L3J5VlYzQmFKRlN0cW9mVVRjWUJodDV6QjAx?=
 =?utf-8?B?a0h5OUFzWXB2UDYwL1dNbE5nL05CUFROMVUxeVAyT1FBejZ3dXRNQSswdHJn?=
 =?utf-8?B?OVVSS3ZHdXRLZUp6MTdKM3hRMHducFExemJVbDBqL0JGUnBDaFNoZmdJTWZJ?=
 =?utf-8?B?a29ndkVpSmpQK20rV2gvdHRxSytXNkhBMVpYWk83Vk1OakRqL29QUmliZVE0?=
 =?utf-8?B?U01samdxdklQQU53SlBaY202VUJlR25Sb1JTTWQzekZPa09wNUs2ZTA2dkRw?=
 =?utf-8?B?MkhsZVRqdGxlUDhmRXp0V1RRS1lsU01sak9YTEJmQUNBTk9yQ0lNRWxqMm0v?=
 =?utf-8?B?c0dQOFRkNzhOc25lS3ZmRlY2VGkrRjR3NUVkaU95V3gwMTJPd2YxUWpJWTJB?=
 =?utf-8?B?MTNsclNNdktoWUtFU3JPUHZxMXgrNW10NW5hK3g5aUFJMUs3SFhuZTRyTVc1?=
 =?utf-8?B?L1FRT1Y5T1ExdFFrSWFlLzNKbWo4MGsvVGkvL29QS3k2THBhS0hDTHRFVEFh?=
 =?utf-8?B?cFhyMjZvYzh5M0J4ckgvTmhQS2VxbzJsTFQweE9ZNzJ5eVh2OEtMVmR6MU1B?=
 =?utf-8?B?dnBZaXRtRFdOM2l6ZmFIako1VkFkT1BVV01ueFp5YnZGaVE2SHhsQTc2T2Nw?=
 =?utf-8?B?RyswVXVtT21yN2dPbEZUTDhLWUI4aC9LK3pPak5URFZSY2pZckpnS2hqS1JG?=
 =?utf-8?B?eWExemthS3QyenJyWGhQWDJNK1JMN2g2cVlTOGNaMFhaQ1dQZ1REeVdwQmR2?=
 =?utf-8?B?d1hCWlBhMzhJc0IydDlzdWN2aWgvVUtSRzZFeFBPOG1aMTZ0S1VET2pzY3hK?=
 =?utf-8?B?ZGtiWkxCcjViZTZLaEd6NFpRU1M0aEVGUDEybnIwV21PYTh6d29XSGJsVHRL?=
 =?utf-8?B?amN4TDhnOUYwWldPc0o3YVJ6RnZWa0dVMms3Q05GY3RvQzZ3MkJESnJyNG1J?=
 =?utf-8?B?U3I4dlFBMmEvWHdlRmxlMFB6UUg0OW1TeEhleGd1aHNYeFRFdDgvS21oYW5G?=
 =?utf-8?B?SjhwOS9YTmc3UW9sQTNRUnJTbXlud2E3NGF1RlJaRXF2S0xPRzN4Nmhkdklv?=
 =?utf-8?B?YmFvYnpTb2VSNkV2M1VMdU9ld0lNTTJ3UXNMQThaNGNyS0djVDJnbmZERWo0?=
 =?utf-8?B?ZDQ1YnlreUI3VHJkZmVXZm56VWxERk9rb0VDTDNDWFJkSjVzbHFzOU5BM3lD?=
 =?utf-8?B?UHByTTZQaGZHRU9RR29KclNzWGQxY2RaYlhUUUNEY3JWNFovbmNyeUxjMFVX?=
 =?utf-8?B?QkNhUWdyakF4djkrUFYwa2NML2lnWUZoNWthQnBEbnpPK3dUSThhYkZWa3U4?=
 =?utf-8?B?Qko0Sm4rVmxjTGRnRHlSZWE3VzB2eUdnMUZEZ05EbDVxTzgvSVptNGhXSG0x?=
 =?utf-8?B?Zm84VGJuTWtGaS85eXp5aWVzbW00UFduOEtia3RhWnhBZkxsTFdiVDhyN00v?=
 =?utf-8?B?WUxtVGJIdHp2dklSWlVRbG8xYVF3ZjA4Wko1aHgzTnJwNHdEZCtTZFZvYUds?=
 =?utf-8?B?SFdETmptcEFDT3JLQVREYkwwQTdpOHIxdU54c0ZGZHB3RkZnMTZKYnk4SzVW?=
 =?utf-8?B?RTBtWUFIeXd4L3d1S25sRWoyWGFjZHdKNEIwZTZ1aGh5WGNiencwYTlrYkFu?=
 =?utf-8?B?alBObmxNWUtGaE1FSFVxbm50WG9BeGYvb3VDR1V5RWd6bVpxMFkxd0J3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4452.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkVBSVhkQ0MweFZKNHc2U01tRUdvLzViaFk4bGphWmNrdmlOcXErbEtNeUwr?=
 =?utf-8?B?eWs5MXpIUEZ4M1MwSzRJQUZhTVF5eUphWm9aZ2xQQ2Vrd2JjSm1aZ3dtTUZ3?=
 =?utf-8?B?UzNXbXNuQTBIY3UrQnhiWGhZQkV6a1g5WXJNekNsdWhYdThDMC91TVNlbEVQ?=
 =?utf-8?B?d1Y5OHVDcWJ2WUMxMzE3d3ZoWkdIQ3NSZTlOSG82Z0g1alVZTnVMUEhnRHp1?=
 =?utf-8?B?eGJGTmxVTHVjeGZ1RVd6c3Rrc0VYREVwM01ZcW11Rm5rTGovUmVhZC9UdWZH?=
 =?utf-8?B?Sy96Um1uUWZPQkNsbk5TQVB3WXhvdGZWUng2VThIaEV5K3VaQU00SGdjeGw5?=
 =?utf-8?B?T0dUZkUzcHRNTGZtOEV3SThjS3dFVUV3VnllVnJHRnQwaE5iMEdFeXQ0L0h2?=
 =?utf-8?B?NVJxUERMb0daY1VqdDNFK2tENVJWQTJQVzgrYUNuYUJkeWt6eENuS3ZOWlEr?=
 =?utf-8?B?RFpXWHV4SHI2Uk5nb1VuMC92UU9xdlJ3SkFEZFdBWnVRakFsbEJhOW9RMHBS?=
 =?utf-8?B?dmRFRDFzWWhNQ3p4cXErZzR5T0RWc09vN0IyaHppc2NQZU45YzN2Z0J3OEdn?=
 =?utf-8?B?ZEdjT25MWDUxMFhpRDB0dlFaN3RtL0J5MGYvMXMvMU80SDNORmhYb3daT2Vh?=
 =?utf-8?B?S09hRm0zLzRjSjA4MXpBSTBydHFjMWtCbjZjWmk2QVlvajFBZm80WTh2ZTg2?=
 =?utf-8?B?VFJDSy8wQTlCZHM0alJzSXZBVjNTK1BMbmx0ajdzNlplaVNPUHNIUmJkbXRO?=
 =?utf-8?B?QXRhUXI2N3BzSzgzeXorYldUMGVhTGNjS3Vld2FDMFk2Z1NpUnpXUXZoaXlO?=
 =?utf-8?B?Z3g4L1ljeW1hLy9lY0MwQ0RmQnd5VmVJRHRnVVdoNUtKNC9rZjZjZnRhSlpX?=
 =?utf-8?B?WWZHMTlMeFl6aVAyd2psVk02cFRHYzRqM0NTN3J4OFlPRVFhVGNiNGoyL3JG?=
 =?utf-8?B?WEpWdVd2dUVGV2R5UG1vQzJjdmUwKzFiMERXbUpIUjEreTRQNVRaaWppRUtu?=
 =?utf-8?B?UjVOdjcrTjkzQ3I0cXE0ZjFiSkdidlpOekM4Q1VPVGJYQmZISHovbUlUZGkr?=
 =?utf-8?B?WWpqSm9pU0RDRytkazF5ZEZoS0VONTBqSFg4Q0xCU0lScmlFeThMbk0yYUhr?=
 =?utf-8?B?citudFJEclVDS3dndDRsNDVHMUtHaldOcld3azFnNmJIVjZZeTNDdER2Y3Uv?=
 =?utf-8?B?a2RhaUFsZHgvL1JmRWt2SDZpV0RNc2lmNElJRmtkbzlLQ0laRllSeHB2eits?=
 =?utf-8?B?M3pOV1NvRk84Y0MzY3dCODNUUUR3QlFOckdMVktQSEJ0aVkzUTg5d2lzMU43?=
 =?utf-8?B?bHZKalZrS3orRUVncmtveGtmZFFMVVZPL1lML2pYSWxreUJZeVlIeEZhWDRU?=
 =?utf-8?B?OW85WGVwV2VIZTBrdW4wTXJ6T3RWbjF0QmlVT0IyZmFydXRnczZPUCt5M1FS?=
 =?utf-8?B?Y1Q0TUtpTjZoSnJoK3hoM1dpa2g5QTJUOEVXbC9YVjlrMHllUmV1OFhXcXU4?=
 =?utf-8?B?dFpGbkNSZHB3MGZUMlQrTHh3OFVrblExdkZ6Rmo0SUZXeEozWUUvcUV4MFpP?=
 =?utf-8?B?S0VURkZQZDl6ZWU0WEFjVVAyWkk2OEc1N3ZuQnBPblZ6Tm1wd1JqRW5FYURq?=
 =?utf-8?B?MjVFcHhtajBYVENjbDFOM2dkd080SlloM0dmREJYdEpLU2tReW83L05RNnhv?=
 =?utf-8?B?bE9oeTVURGdPT3ZwSnNwa29HU3BWdTFhZGtmdmU1RnJrWEtENmgvQmRMRHFZ?=
 =?utf-8?B?TndwU3VFM3BBOHVjQkNmUXZTdE5aUUp2Vmc2RmZ2RTJnNm9PWmxuS0pKYnUw?=
 =?utf-8?B?UDQ0ampLdWJmUjllSlhYclRSb0d2YW1wVE1waG54ajU0YWttT3hWSlMzMGFO?=
 =?utf-8?B?endRelR0SnJWRFdNOE93SnlYZlBiZnVQOUxralAzTUVoMnNxUVJaMFJMM0NW?=
 =?utf-8?B?cVl1UTdRRkk2SnJWMXNrSXRHYW1VMjlCVFFHdUVXSlFabDNuVmF5YkNjbis5?=
 =?utf-8?B?TVU4ZUU0aWdYNVN3MGFQcU9wdmZLUzBOOXRKTjRtOWF2T2ZHVTVqWExHZzI3?=
 =?utf-8?B?VWRHK1NNZkJDeDNQN0JVejlDTDBvaXF1YXFaZVp3VXNxakwyU3NtQnJMb1l0?=
 =?utf-8?Q?sQ0Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F36F8DBA13F094FAE4ED01527381079@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4452.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 617446b9-06a1-4a27-d976-08dcea6b4d69
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2024 03:09:36.0813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9gokeL71MYfIjlK5nynW6O97+23Bokc3Cim7AMKNotXYSrHL6oiZhM5STGZwRx8eGhDdH2qGpCccFV2/6C96CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5307

SGkNCg0K5ZyoIDIwMjQvMTAvMTEgMjI6MzQsIFNlYW4gWW91bmcg5YaZ6YGTOg0KPiBPbiBXZWQs
IE9jdCAwOSwgMjAyNCBhdCAwNzowMzo1N0FNICswMDAwLCDph5HotoUt6L2v5Lu26aG555uu6YOo
IHdyb3RlOg0KPj4gTk9STUFMOiBUaGUga3Vrb25nIGFwayBjb250cm9sIHJlbW90ZSBjb250cm9s
IHNlbmRzIGNvZGVzIGZvciBvdGhlciBidXR0b25zDQo+PiAxMC0wOSAxMToyMDoxOC4yMTkgIDEw
MjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiBwYXR0ZXJuWzBdOiA0NTAwLCA0NTAwLCA1NjAsIDU2
MCwgNTYwLCAxNjgwLCA1NjAsIDE2ODANCj4+IDEwLTA5IDExOjIwOjE4LjIxOSAgMTAyMyAgMTAy
MyBEIENvbnN1bWVySXJIYWw6IHBhdHRlcm5bOF06IDU2MCwgMTY4MCwgNTYwLCA1NjAsIDU2MCwg
NTYwLCA1NjAsIDU2MA0KPj4gMTAtMDkgMTE6MjA6MTguMjE5ICAxMDIzICAxMDIzIEQgQ29uc3Vt
ZXJJckhhbDogcGF0dGVyblsxNl06IDU2MCwgNTYwLCA1NjAsIDU2MCwgNTYwLCAxNjgwLCA1NjAs
IDE2ODANCj4+IDEwLTA5IDExOjIwOjE4LjIxOSAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6
IHBhdHRlcm5bMjRdOiA1NjAsIDE2ODAsIDU2MCwgNTYwLCA1NjAsIDU2MCwgNTYwLCA1NjANCj4+
IDEwLTA5IDExOjIwOjE4LjIxOSAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6IHBhdHRlcm5b
MzJdOiA1NjAsIDU2MCwgNTYwLCAxNjgwLCA1NjAsIDU2MCwgNTYwLCAxNjgwDQo+PiAxMC0wOSAx
MToyMDoxOC4yMTkgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiBwYXR0ZXJuWzQwXTogNTYw
LCAxNjgwLCA1NjAsIDU2MCwgNTYwLCA1NjAsIDU2MCwgNTYwDQo+PiAxMC0wOSAxMToyMDoxOC4y
MTkgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiBwYXR0ZXJuWzQ4XTogNTYwLCA1NjAsIDU2
MCwgNTYwLCA1NjAsIDE2ODAsIDU2MCwgNTYwDQo+PiAxMC0wOSAxMToyMDoxOC4yMTkgIDEwMjMg
IDEwMjMgRCBDb25zdW1lcklySGFsOiBwYXR0ZXJuWzU2XTogNTYwLCA1NjAsIDU2MCwgMTY4MCwg
NTYwLCAxNjgwLCA1NjAsIDE2ODANCj4+IDEwLTA5IDExOjIwOjE4LjIxOSAgMTAyMyAgMTAyMyBE
IENvbnN1bWVySXJIYWw6IHBhdHRlcm5bNjRdOiA1NjAsIDE2ODAsIDU2MCwgNDY5MjAsIDQ1MDAs
IDQ1MDAsIDU2MCwgMTY4MA0KPj4gMTAtMDkgMTE6MjA6MTguMjE5ICAxMDIzICAxMDIzIEQgQ29u
c3VtZXJJckhhbDogMHg1NjAsDQo+PiAxMC0wOSAxMToyMDoxOC4yMTkgIDEwMjMgIDEwMjMgRCBD
b25zdW1lcklySGFsOiAweDk2MjAwLA0KPiBJZiBJIHN1bSBhbGwgdGhlc2UgbGVuZ3RocywgSSBn
ZXQgMjE2MDAwIG1pY3Jvc2Vjb25kcy4gVGhhdCdzIHdlbGwgY2xlYXINCj4gb2YgSVJfTUFYX0RV
UkFUSU9OICg1MDBtcykuDQo+DQo+IE5vdGUgdGhhdCB0aGUgbGFzdCB0d28gdmFsdWVzIDB4NTYw
IGFuZCAweDk2MjAwIGxvb2sgcmVhbGx5IHdlaXJkLCB0aGV5IGFyZQ0KPiBub3QgaGV4IHZhbHVl
cyBhcmUgYWxsLCBhbmQgdGhlcmUgaXMgbm8gInBhdHRlcm5bLi4uXTogIiBwcmVmaXguDQpUaGlz
IGlzIHRvIGl0ZXJhdGUgdGhyb3VnaCB0aGUgcmVtYWluaW5nIHBhcnRzIHRoYXQgYXJlIGxlc3Mg
dGhhbiBlaWdodA0KZGlnaXRzIGFuZCBwcmludCB0aGVtIG91dC4NCg0KMTAtMDkgMTE6MjA6MTgu
MjE5ICAxMDIzICAxMDIzIEQgQ29uc3VtZXJJckhhbDogMHg1NjAsDQoxMC0wOSAxMToyMDoxOC4y
MTkgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiAweDk2MjAwLA0KDQo+PiAxMC0wOSAxMToy
MDoxOC4yMTkgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOg0KPj4gMTAtMDkgMTE6MjA6MTgu
MjIwICAxMDIzICAxMDIzIEQgQ29uc3VtZXJJckhhbDogSVJUWDogU2VuZCB0byBkcml2ZXINCj4+
IDEwLTA5IDExOjIwOjE4LjQ2OSAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6IERvbmUsIFR1
cm4gT0ZGIElSVFgNCj4+DQo+PiBTUEVDSUFMIDpTZW5kaW5nIHRoZSBwb3dlciBidXR0b24gb24g
dGhlIHJlbW90ZSBjb250cm9sIG9mIHRoZSBrdWtvbmcgYXBwIG1heSByZXN1bHQgaW4gYWRkaXRp
b25hbCBsaW5lcyBvZiBjb2RpbmcsIGxlYWRpbmcgdG8gdHJhbnNtaXNzaW9uIGZhaWx1cmUgKDcy
LTg4IGV4dHJhKQ0KPj4gMTAtMDkgMTE6MTk6NTMuOTczICAxMDIzICAxMDIzIEQgQ29uc3VtZXJJ
ckhhbDogcGF0dGVyblswXTogNDUwMCwgNDUwMCwgNTYwLCA1NjAsIDU2MCwgMTY4MCwgNTYwLCAx
NjgwDQo+PiAxMC0wOSAxMToxOTo1My45NzMgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiBw
YXR0ZXJuWzhdOiA1NjAsIDE2ODAsIDU2MCwgNTYwLCA1NjAsIDU2MCwgNTYwLCA1NjANCj4+IDEw
LTA5IDExOjE5OjUzLjk3MyAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6IHBhdHRlcm5bMTZd
OiA1NjAsIDU2MCwgNTYwLCA1NjAsIDU2MCwgMTY4MCwgNTYwLCAxNjgwDQo+PiAxMC0wOSAxMTox
OTo1My45NzMgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiBwYXR0ZXJuWzI0XTogNTYwLCAx
NjgwLCA1NjAsIDU2MCwgNTYwLCA1NjAsIDU2MCwgNTYwDQo+PiAxMC0wOSAxMToxOTo1My45NzMg
IDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiBwYXR0ZXJuWzMyXTogNTYwLCA1NjAsIDU2MCwg
NTYwLCA1NjAsIDU2MCwgNTYwLCAxNjgwDQo+PiAxMC0wOSAxMToxOTo1My45NzMgIDEwMjMgIDEw
MjMgRCBDb25zdW1lcklySGFsOiBwYXR0ZXJuWzQwXTogNTYwLCAxNjgwLCA1NjAsIDU2MCwgNTYw
LCA1NjAsIDU2MCwgNTYwDQo+PiAxMC0wOSAxMToxOTo1My45NzMgIDEwMjMgIDEwMjMgRCBDb25z
dW1lcklySGFsOiBwYXR0ZXJuWzQ4XTogNTYwLCA1NjAsIDU2MCwgMTY4MCwgNTYwLCAxNjgwLCA1
NjAsIDU2MA0KPj4gMTAtMDkgMTE6MTk6NTMuOTczICAxMDIzICAxMDIzIEQgQ29uc3VtZXJJckhh
bDogcGF0dGVybls1Nl06IDU2MCwgNTYwLCA1NjAsIDE2ODAsIDU2MCwgMTY4MCwgNTYwLCAxNjgw
DQo+PiAxMC0wOSAxMToxOTo1My45NzMgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiBwYXR0
ZXJuWzY0XTogNTYwLCAxNjgwLCA1NjAsIDQ2OTIwLCA0NTAwLCA0NTAwLCA1NjAsIDE2ODANCj4+
IDEwLTA5IDExOjE5OjUzLjk3MyAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6IHBhdHRlcm5b
NzJdOiA1NjAsIDk2MjAwLCA0NTAwLCA0NTAwLCA1NjAsIDE2ODAsIDU2MCwgOTYyMDANCj4+IDEw
LTA5IDExOjE5OjUzLjk3MyAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6IHBhdHRlcm5bODBd
OiA0NTAwLCA0NTAwLCA1NjAsIDE2ODAsIDU2MCwgOTYyMDAsIDQ1MDAsIDQ1MDANCj4+IDEwLTA5
IDExOjE5OjUzLjk3MyAgMTAyMyAgMTAyMyBEIENvbnN1bWVySXJIYWw6IHBhdHRlcm5bODhdOiA1
NjAsIDE2ODAsIDU2MCwgOTYyMDAsIDQ1MDAsIDQ1MDAsIDU2MCwgMTY4MA0KPj4gMTAtMDkgMTE6
MTk6NTMuOTczICAxMDIzICAxMDIzIEQgQ29uc3VtZXJJckhhbDogMHg1NjAsDQo+PiAxMC0wOSAx
MToxOTo1My45NzMgIDEwMjMgIDEwMjMgRCBDb25zdW1lcklySGFsOiAweDk2MjAwLA0KPiBJZiBJ
IHN1bSBhbGwgdGhlc2UgbGVuZ3RocyBJIGdldCA2NDgwMDAgbWljcm9zZWNvbmRzLCBzbyBxdWl0
IGEgYml0IG1vcmUNCj4gdGhhbiBJUl9NQVhfRFVSQVRJT04sIHdoaWNoIGlzIHdoeSB0aGUgc2Vu
ZCBmYWlscy4gQWdhaW4gdGhlIGxhc3QgdHdvIHZhbHVlcw0KPiBhcmUgcHJpbnRlZCBsaWtlIGdh
cmJhZ2UuDQo+DQo+IFRoZSBzaWduYWwgbG9va3MgbGlrZSBORUN4MTogaHR0cDovL2hpZmktcmVt
b3RlLmNvbS93aWtpL2luZGV4LnBocC9ORUN4MQ0KPg0KPiBTbyB0aGVyZSBpcyB0aGUgbWFpbiBz
aWduYWwsIGZvbGxvdyBieSBhIGJ1bmNoIG9mIHJlcGVhdHMuIEVhY2ggcmVwZWF0DQo+IGxvb2tz
IGxpa2UgKzQ1MDAgLTQ1MDAgKzU2MCAtMTY4MCArNTYwIC05NjIwMDsgdGhlIC05NjIwMCBpcyB0
aGUgdHJhaWxpbmcNCj4gZ2FwLiBUbyBhdm9pZCBnb2luZyBvdmVyIElSX01BWF9EVVJBVElPTiwg
ZG9uJ3QgaW5jbHVkZSB0aGUgLTk2MjAwIGdhcA0KPiBidXQgcmVwbGFjZWQgd2l0aCBhIHVzbGVl
cCg5NjIwMCksIGkuZS4gaW4gcHN1ZWRvIGNvZGU6DQo+DQo+ICAgICAgICAgIGludCBpLCBmZCA9
IG9wZW4oIi9kZXYvbGlyYzAiLCBPX1JEV1IpOw0KPiAgICAgICAgICB3cml0ZShmZCwgWzQ1MDAg
NDUwMCA1NjAgNTYwIDU2MCAxNjgwIDU2MCAxNjgwIDU2MCAxNjgwIDU2MCA1NjAgNTYwIDU2MCA1
NjAgNTYwIDU2MCA1NjAgNTYwIDU2MCA1NjAgMTY4MCA1NjAgMTY4MCA1NjAgMTY4MCA1NjAgNTYw
IDU2MCA1NjAgNTYwIDU2MCA1NjAgNTYwIDU2MCA1NjAgNTYwIDU2MCA1NjAgMTY4MCA1NjAgMTY4
MCA1NjAgNTYwIDU2MCA1NjAgNTYwIDU2MCA1NjAgNTYwIDU2MCAxNjgwIDU2MCAxNjgwIDU2MCA1
NjAgNTYwIDU2MCA1NjAgMTY4MCA1NjAgMTY4MCA1NjAgMTY4MCA1NjAgMTY4MCA1NjBdKTsNCj4g
ICAgICAgICAgdXNsZWVwKDQ2OTIwKTsNCj4gICAgICAgICAgZm9yIChpPTA7IGk8NDsgaSsrKSB7
DQo+ICAgICAgICAgICAgICAgICAgd3JpdGUoZmQsIFs0NTAwIDQ1MDAgNTYwIDE2ODAgNTYwXSk7
DQo+ICAgICAgICAgICAgICAgICAgdXNsZWVwKDk2MjAwKTsNCj4gICAgICAgICAgfQ0KDQpUaGFu
ayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbi4gVGhlIGluZnJhcmVkIGNvZGUgaGVyZSBpcyB0aGUg
cG93ZXIga2V5DQpjb2RlIHNlbnQgdGhyb3VnaCB0aGUgS3Vrb25nIHJlbW90ZSBjb250cm9sLCBh
bmQgdGhlcmUgbWF5IGJlIG90aGVyDQppbmZyYXJlZCBjb2RlcyB0aGF0IGV4Y2VlZCBJUi1NQVhf
RFVSQVRJT04uIEluIG9yZGVyIHRvIGVuc3VyZSB0aGUNCnVuaXZlcnNhbGl0eSBvZiB0aGUgY29k
ZSBhbmQgYWRhcHQgdG8gZGlmZmVyZW50IHNpdHVhdGlvbnMsIGl0IHdvdWxkIGJlDQpiZXR0ZXIg
dG8gZGlyZWN0bHkgbW9kaWZ5IElSLU1BWF9EVVJBVElPTi4NCg0KDQo+DQo+IE5vdGUgdGhhdCB0
aGlzIHdoYXQgdGhlIGxpcmMgZGFlbW9uIGFsc28gZG9lcyBmb3IgdHJhbnNtaXRzOyBpdCdzIGEg
d2VsbA0KPiBlc3RhYmxpc2hlZCB3YXkgb2Ygc2VuZGluZy4gVGhlIHdyaXRlKCkgdG8gYSBsaXJj
IGNoYXJkZXYgd29uJ3QgcmV0dXJuIHVudGlsDQo+IHRoZSB0cmFuc21pdCBoYXMgYmVlbiBzdWNj
ZXNzZnVsLiBJdCBtaWdodCBiZSBpbnRlcnJ1cHR0ZWQgYnkgYSBzaWduYWwsIHNvDQo+IHlvdSBz
aG91bGQgZGlzYWJsZSBzaWduYWxzIGR1cmluZyB3cml0ZSAoSSBkb24ndCB0aGluayBsaXJjIGRh
ZW1vbiBib3RoZXJzDQo+IHRob3VnaCkuDQo+DQo+DQo+IEhvcGUgdGhpcyBoZWxwcw0KPg0KPiBT
ZWFuDQoNCg0KVGhhbmsgeW91IGZvciBwcm92aWRpbmcgc3VnZ2VzdGlvbnMuIExvb2tpbmcgZm9y
d2FyZCB0byB5b3VyIHJlcGx5DQoNCkNoYW8NCg0K

