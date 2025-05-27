Return-Path: <linux-media+bounces-33423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC773AC4755
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 07:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8D323B83C6
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 05:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895021DB551;
	Tue, 27 May 2025 05:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="BfTH99id"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020125.outbound.protection.outlook.com [52.101.156.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF6B1FB3;
	Tue, 27 May 2025 05:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748322172; cv=fail; b=jm/OIUBWeV52ZYIWXRo+vWLJUAdTLUlH/qdOr+j0XB4VwU+wTUZY8fOXA7eDT7LbZiHN3gkEkQ20jrNm+Qu6QwENLueZu05ztU4+cz9wB8RxBwGbj7afKN5y9WtmlpzFNSnaZ4TKd2G7gIC3bOv3w5Hfduy5MCKCLhn4mJ9c7VM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748322172; c=relaxed/simple;
	bh=4MfYXYhRQNgJt7MzeHxZQAL7EbrE2uT1JR/DhTJqnvU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ssd5gPo7IFXIc3qYATkOswc47E5UGClBpBLApwgvqlqoibthBlA0cwEJL+N7Qakj1kUUAXIh4MzlD15xeQlnuFoXV19fVaNxpHgojayZPIxVhqP/QdIJ4h41EZt2prmMar2SrNiyDMTh/8HJLP3/Z5SsN8miCYfYKw/5pnrEyGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=BfTH99id; arc=fail smtp.client-ip=52.101.156.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afwWB+uTn2i9ULusaylIWZPiQGFiKXXD8RdGVWgMONdWZtMjtkPh6sMhoC5trHjPUdIXTYgftmvvzz93wSBf5kRmUjQX00lSvGjsbVXrVhSWCgg2Kt+SMUpyLAs22mjzvC6NpqqP+e59ZIFJxfO/M4lEzOTSj2DZ4WpHnm06cmqXdnoO5i5MXajr0uXjQXaSjlJPc8eNdWOzwqJVQin3eLXl1psit+3KoH1mM26M6i0DMIYOd6xAI5hwdAwgRN11vFBn62wOxpSwxeXA7r8FIYgx1WNfGSW9Vf52oLkxxcNirs9xXYYxsbHsrgLWIPGl3WEgnf1vZd9MSwTAQztpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MfYXYhRQNgJt7MzeHxZQAL7EbrE2uT1JR/DhTJqnvU=;
 b=IxW9X+e87jO0rEipoi72kmNwvgOUzuHaMstf/UKqQUbayYJzHAtxc6zSU8BOfVo5NhScL68IgEmvQLuhlA4D85QImjIpbmvhLDdSanUEnRu6W30k8EXVpP9aZlVlITGuzg5mzkjETlvjnaKIu11rtiB0eklnF7V2S1LCfDfZyG2gkPji11YBOSacCCIQOyQlMhtYtfMiOXB2jBHyZwFAv/59A46TR3VSOlBAoC81n0gezqv2gAqdzKWzxCqMSJxlOnwkuI4/Q7e8IXwE9TW6AzhYWFxjXKAGlOySbpo53TAZuR07R+nW6VlXiYHx7U3z7qCtabyRDACV17u3d0kZfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MfYXYhRQNgJt7MzeHxZQAL7EbrE2uT1JR/DhTJqnvU=;
 b=BfTH99idkIKbcn58YXihSb6LWOAGBf4fiIgesqLpPFbc1gW4cF8vzxMS/bBvBnedt8jn74vKGZeVuBZZ2N26OqAUeGSD+PushypJSnjR3z+VTS02S/nA0D4uKln01QceQR4NyMGtwnP/Ol/veeOthfSCB3OwLNYz4nsHRJrcJbs=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1981.KORP216.PROD.OUTLOOK.COM (2603:1096:101:fd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Tue, 27 May 2025 05:02:47 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 05:02:47 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v2 4/7] media: chips-media: wave5: Use spinlock whenever
 statue is changed
Thread-Topic: [PATCH v2 4/7] media: chips-media: wave5: Use spinlock whenever
 statue is changed
Thread-Index: AQHbyurOpGAb2Kugd0+SE8tOPGK7I7PgffEAgAV1GbA=
Date: Tue, 27 May 2025 05:02:46 +0000
Message-ID:
 <SE1P216MB130368B2DDB6A235D2603E04ED64A@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
	 <20250522072606.51-5-jackson.lee@chipsnmedia.com>
 <effe40f0d4caef43bf772d350a67d68833941cbb.camel@collabora.com>
In-Reply-To: <effe40f0d4caef43bf772d350a67d68833941cbb.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB1981:EE_
x-ms-office365-filtering-correlation-id: 454d8439-be36-4f23-8c4a-08dd9cdbb8e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K3ZGUjFyaVlpTmRtSmlTS3BJcmRwYmh5eGQzOHl2bXpYS0VqMkpmVW50QlZW?=
 =?utf-8?B?Q2hiVERDMXo3RnVlVXVwcUdabWhzZWtsVGtUMTUxZW96MlZYakp2QnpsRHpw?=
 =?utf-8?B?MHRuTTBsNU9zOXdPKy93R3N4Ulo2NVo5d2hrVS8zRDIraloxemVWdWZMYnZE?=
 =?utf-8?B?ZVFJSTM3ZnViOTlEeDlIeU13S1pxQ1JMdzNGM21jRFZudG02cEVpS1ZrbWJ6?=
 =?utf-8?B?ZHlOYmJ6cFVxYVdQZGNOWS9sU0V6clBQRVFkK1dtalNod0ZPVG1lN3FESzFv?=
 =?utf-8?B?N0dIYzdUUVJ0SHYyRy9uY2dTcTI0ZDFwOVc1NDFuTU9RRVMwbWxNc0MxZm5t?=
 =?utf-8?B?TUo2MnhCUWNXdTZQb2Q0M0ZKVWV1ZHdEc1BmaXRIc0pSLytDZHd2UHR5WE9L?=
 =?utf-8?B?bzRzWi8wZXhod0d0ejFFRUlzMEdoQ1pjZmowWmlSeHJQa3ZlKysvWWNFOVpi?=
 =?utf-8?B?MXBHcDduZnpSeXBiTkNkWndjeUQ5Qk5hWTJvOUc1amxLd3hQTXY2YUd0RHVs?=
 =?utf-8?B?S1VNYk01aVA4ZEdPaHdFOW1mYVhlejdIK3NjUGFHMkNrTjRXdHFCT2tDcTF1?=
 =?utf-8?B?ZnBVK0hVYWU1Rmxka0F3Ni9NY0VxOFJodElsS3dMSlRtalNJN1ptdTJZYnRU?=
 =?utf-8?B?akozaVJDd2xsaXBVNFBqbWZ1YUJFaFNvQjc3QjIvNEoraGxyRkFCRHltdnBy?=
 =?utf-8?B?NHpyTmdnQzFLQ1BRUERjMVUxMTJEZFVIWFlYYTNQWXY5VTBESnRMSHdRczdG?=
 =?utf-8?B?ODRGM09rcmcwbnBsektYNUZ3S1NSclRmaXJTM01sK0lwZkZFUEhYVkNXcXNu?=
 =?utf-8?B?czZSc2JYdXh3UlFRNXhIVzdiSGpUY0tFaVhMT1Nya3NzZEFFSElubFZUVnlN?=
 =?utf-8?B?K092UU9EYUJ4dU1sSDU3cFMzMEd1cmpUNW5GUUhCVURFMHhiRXcvL3BqSDJX?=
 =?utf-8?B?bm5uSDFaT0dka2d3ZmZIVHFicUF4VlBWc2Z3U3BJS1lhTk9hK1E5VGNwSWNK?=
 =?utf-8?B?aDZGQ3hjUmJPcHBld1BWZ2Q4ZVRkOHRHTVJRTjF3RWxoeHpVdmF5QUZ2bS9P?=
 =?utf-8?B?TTg3SXZKMGpJUDA4ZXJaQkEyZkFPdFh4eFlZRXZRbS94WTBYdGM2SjkvTVUz?=
 =?utf-8?B?TXZvaFFqQTg1WThvNzBpRjdNdmNsVTBNZEFLdVgwWm1Td1BvcUtvZFRhY2lM?=
 =?utf-8?B?VHJuZ0Nnc1hrSDhjend4Syt6UmlhcHRXczZINlllcGF6bk5EZHhOU2ppMGNE?=
 =?utf-8?B?QXY2WGJLUUQ4amVXUmhmZkc5cno1SzRqVm9RNHhlVnFyQWdwWnVNQU84UDhF?=
 =?utf-8?B?WTd4Rm5vY0xLZEt1YUdCdEQ1d0VzK0JiRUdwbldpYURsd2xDTWV6QVNqSWxj?=
 =?utf-8?B?M1pFc1p2K1hOamJ2d3RmS29WMEhHQnZpS3l4elB5d2dBcG02ZnBWRHZSMFBa?=
 =?utf-8?B?MUMyak9MZzV2cm83WHpraWxhZEYwc01TYWNSdW9mSG9ZVFpvY3BEeEk4L2sy?=
 =?utf-8?B?a3RLNDF1c3pNRXFQdzl2WW1IR1JDdFRpWHd3b0lzeGkvdVBDRitrSitvVU96?=
 =?utf-8?B?WktmNGs4anl1cUtCSEs1Q3JjZHlRS0xaZ21CdVc0ZUNpNC82WHUwYnZDKy94?=
 =?utf-8?B?SENaQ2lYUHpKWkRMQWlNNUxhQXA3WkFpTy9zc1hjZU9pSWRtcEFiMW5Fc1FQ?=
 =?utf-8?B?YlR3bElMalBhMWhlTUxjNHBEemhNMVYwV0JIbDgzUkFPWG9ZZkZ3MGtrVC9R?=
 =?utf-8?B?VnkxMFVaVGxrTDRTM2h5cnoreGZMSFlDWU9uU2xIN1J5S3ZYY1UvZjVyd2hy?=
 =?utf-8?B?UVNyMDRJWGNVSG5RUXhpVEhWQUFnY1lUQWRxdHF5RmtKaDVHNXVSZlZVN29y?=
 =?utf-8?B?bldyemE0N3JPamREUnpCWk9uT1lvNE9xYU91VHVKK3A2c1laVVhIanlpalpP?=
 =?utf-8?B?UUpJLzNOa1QvWmxISEh4a2k5ZmQ0Skcrem9xYWlPZmNUWE5WR1FDVGhuUXp2?=
 =?utf-8?Q?9j/Pk0D0T2nEJZKsOWZO6akScBtUmQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUwvaWhJTUJsYm8wYS9QcVlmMnFqQ0MvcFkyK0JENnl4SnljZEFDSWp6eHU4?=
 =?utf-8?B?M2h5bTN1TlpHYm9NUDgySkxSTERjUFBzOFVTckxiM0dESElwRGNUNUZuSzBF?=
 =?utf-8?B?WVh4aUtjNUgzVmtTOGxSaGFrTDhVak1SRzdzSEZzaS9oMjd4R2lMcTFlcXR3?=
 =?utf-8?B?VkcrcmFmWVJYK0g5OWVKTTNOR3NHSUZXNFRnaWlNVm9oaGlVUlZ6RzhyeGxL?=
 =?utf-8?B?SkFvMmhEMmVMVGwrZ3kvLzh2cmxNcWdQM09VY1FZUFB6eVJFQ3BYVEROTk1l?=
 =?utf-8?B?dThuSFRSTWQ2OFNSeExpMUxzb1RpYVdvemxwa0JqeUNjN2ZtTkRUWGlJSGJ4?=
 =?utf-8?B?VFBNL25PU21OaDcwNDdEbm9IQTIrOTdDenlEak9qR25SS0hNL2p1QWxzZzNa?=
 =?utf-8?B?WTFwMVU2YWZienFpMlJ4aDhmNytENC91RWsxUndKVFdKYkwxQlE4cUtXMUVk?=
 =?utf-8?B?N2lqaCt3K21rYkhzRUNpSGthdm82Yjl5cEdSQXlFc0pHZzk5Z0pEald1Qktz?=
 =?utf-8?B?YkI4RzErYmI4S3hGamR1UTZMNXAwbU1uclUxVmFwQUp3a1JhU2Uyei9OSGZh?=
 =?utf-8?B?TDlnSTZyRTVYbDYvaUR2M0pPTCtnTTc3OFNPRDFBaUVpWFVybGZlZGx2a0lv?=
 =?utf-8?B?QUhEaEJQS2F0dUNlRzVMempWQVZFekgxVjI4MFdtcXI0VVhtNEpweE9lSXZB?=
 =?utf-8?B?dGpMSlZ2VTZBdm5xaWFNRG92elJZVTZMWWpsWHp3bzBnLzVOMk1USkRjWmh2?=
 =?utf-8?B?eVV1Tm9NUzZGb1FtbkZjZC9nZngrYkQ1M2dCd1Jsd25FRU1vUHpHZEJ0NFRw?=
 =?utf-8?B?UTcyc3haMTVzNm9iMGpuNTNNU095ZStLS2Q1KzAvSUsrczRDOGRuYWFJaWMx?=
 =?utf-8?B?MnRnQWVFVFJkcmE3ZHZCbEppS1RtN05mOXJ6ZDZJbWZFMDk3UkNXVFdsZHZP?=
 =?utf-8?B?dzFKdmEyVEhiRXJVWENCS0Fuand1Z29YYnJ1a3h3T3pXcjdPRkhlam4ybjdF?=
 =?utf-8?B?NWRTeWF2Mm9KSlpTeUxZVkJSTDZzK3VodDQvUXB2VEc0Skk4QTg2VlduWEYy?=
 =?utf-8?B?TG9CT0Y5c0hoT3gwaDU5R2tFTGVhYk1ZbkpnbmtkZWZGT25DUXFjOUpiQmRL?=
 =?utf-8?B?a2FOM0FtaGo4ODJURC9ha0NQOHJSck5SdGRDVUZQdDQ4TVB6Mk1vZEZVWFlX?=
 =?utf-8?B?VHBFaG5sWEgybWlzc1EyN1h2L1BBM2dGOGhscTZQbDFKUWxxVGR6b2poVkph?=
 =?utf-8?B?ejhpTnpiTVUwZ2FvUDgvbEVZVGJWL0RySVVuczVCVXVRNWZURmNCNUdMQ1pV?=
 =?utf-8?B?NUlZSk9nWCtkSEN1OGFXcW1vYU56NlUrT2FjOHpMeHI0TnhCQmJFYm5oRkZX?=
 =?utf-8?B?dVRmdzViS0NrK21CQkVyZFFUQmEvREwxYmVSTUVTRElkU241T25yeVdTSGd6?=
 =?utf-8?B?YjgyRFRpTFNING40SFlZOHV6M3JPMU5ZK2tteEtuR1JnRDRDWm5KYWxZeW1n?=
 =?utf-8?B?SDNYeFk5MDhOekJBNnRhWmUweEJOdDc1VTZtcVlPWGhPWHdIcURrRElmcXdX?=
 =?utf-8?B?VUtNcnFKbEpyajh0KzFKSmIveE9SeXVIN1A0aGdqUzhKQ2dtUkUycG40OVkv?=
 =?utf-8?B?RjlJN2w5dlpFcENMd05QdUloQzdSRU5QMUo3Rk5CQlRZdGptUjZ3dlh2SElq?=
 =?utf-8?B?eXRzS0xBM2lGQmh5Ti96d2NaMnVmOWdERzZIMWhlWEh4b0RUMXlHU1RadjBJ?=
 =?utf-8?B?K0ovc2hYTFJrYmNydkFiemhzTGw4S29POGNTZFI4T1MyMEFPWHhqVElzMDRN?=
 =?utf-8?B?cGhsZ0JpSElRSTFZZXZSSlBER2p5UytXWWlHVUMxV1duTnJxbGhEOU1SWTRn?=
 =?utf-8?B?UjcvQ1EzVlBleEozT3g4Y1RZd3YzU0pYU2VSWjkzRDBtelNJN295REpFaUly?=
 =?utf-8?B?cFpicmtXY2MzUDJ1OVJyR29vWVJ0SHZQMy9xSjVobWRIWW5Gai9JTHdGYVlE?=
 =?utf-8?B?c1ZPekt2STRRT213SDNPSEFmWVloQVdEeDFsbERlOWxrZkNHY1pBMUVlZlFt?=
 =?utf-8?B?U3RJWVQ0a1VCZW93ZjRaMEkzZFRGeU90RFEza1JsSXowSnBNOFRvOWJOQ0Y4?=
 =?utf-8?B?dEpNSlpFOGpqeFhhbC9DSWEyQk5GOWRWbmhhVG5JLzQ3ZmtDd0l2bzlHSHg3?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 454d8439-be36-4f23-8c4a-08dd9cdbb8e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 05:02:47.0403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aVdZsB22WADGoKBMBygOKs4lPwTmT3XfgCuy8GPhsw3x7he4viLZKcruA8NofwUXOKD7w8lNTGY3osUzFX4V/f2/FCcEt2v2hrE03kilDn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1981

SGkgTmljb2xhcw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4NCj4gU2VudDogU2F0
dXJkYXksIE1heSAyNCwgMjAyNSAyOjQxIEFNDQo+IFRvOiBqYWNrc29uLmxlZSA8amFja3Nvbi5s
ZWVAY2hpcHNubWVkaWEuY29tPjsgbWNoZWhhYkBrZXJuZWwub3JnOw0KPiBodmVya3VpbC1jaXNj
b0B4czRhbGwubmw7IHNlYmFzdGlhbi5mcmlja2VAY29sbGFib3JhLmNvbTsNCj4gYm9iLmJlY2tl
dHRAY29sbGFib3JhLmNvbTsgZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29tDQo+IENjOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGxhZmxleS5raW0NCj4gPGxhZmxleS5raW1AY2hpcHNubWVkaWEuY29tPjsgYi1icm5pY2hAdGku
Y29tOyBodmVya3VpbEB4czRhbGwubmw7IE5hcw0KPiBDaHVuZyA8bmFzLmNodW5nQGNoaXBzbm1l
ZGlhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA0LzddIG1lZGlhOiBjaGlwcy1tZWRp
YTogd2F2ZTU6IFVzZSBzcGlubG9jaw0KPiB3aGVuZXZlciBzdGF0dWUgaXMgY2hhbmdlZA0KPiAN
Cj4gSGksDQo+IA0KPiBMZSBqZXVkaSAyMiBtYWkgMjAyNSDDoCAxNjoyNiArMDkwMCwgSmFja3Nv
bi5sZWUgYSDDqWNyaXTCoDoNCj4gPiBGcm9tOiBKYWNrc29uIExlZSA8amFja3Nvbi5sZWVAY2hp
cHNubWVkaWEuY29tPg0KPiA+DQo+ID4gVGhlIGRldmljZV9ydW4gYW5kIGZpbmlzaF9kZWNvZGUg
aXMgbm90IGFueSBtb3JlIHN5bmNocm9uaXplZCwgc28gbG9jaw0KPiA+IHdhcyBuZWVkZWQgaW4g
dGhlIGRldmljZV9ydW4gd2hlbmV2ZXIgc3RhdGUgd2FzIGNoYW5nZWQuDQo+IA0KPiBDYW4geW91
IHRyeSB0byBpbnRyb2R1Y2UgdGhlIGxvY2tpbmcgYWhlYWQgb2YgdGhlIHBhdGNoZXMsIG90aGVy
d2lzZSB0aGlzDQo+IGJyZWFrIGJpc2VjdGFiaWxpdHkgYXMgdGhlIGluLWJldHdlZW4gYmVjb21l
IHJhY3kuDQoNCg0KRG8geW91IHdhbnQgdG8gaW50cm9kdWNlIHRoaXMgcGF0Y2ggYWhlYWQgb2Yg
dGhlIHBlcmZvcm1hbmNlIHBhdGNoPw0KDQpUaGFua3MNCkphY2tzb24NCg0KPiANCj4gTmljb2xh
cw0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphY2tzb24gTGVlIDxqYWNrc29uLmxlZUBj
aGlwc25tZWRpYS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTmFzIENodW5nIDxuYXMuY2h1bmdA
Y2hpcHNubWVkaWEuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9j
aGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUtZGVjLmMgfCA4ICsrKysrKystDQo+ID4gwqAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12
cHUtZGVjLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtIG1lZGlhL3dhdmU1
L3dhdmU1LXZwdS1kZWMuYyBpbmRleA0KPiA+IDQyOTgxYzNiNDliYy4uNzE5YzU1MjdlYjdmIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUv
d2F2ZTUtdnB1LWRlYy5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1t
ZWRpYS93YXZlNS93YXZlNS12cHUtZGVjLmMNCj4gPiBAQCAtMTU3Nyw2ICsxNTc3LDcgQEAgc3Rh
dGljIHZvaWQgd2F2ZTVfdnB1X2RlY19kZXZpY2VfcnVuKHZvaWQgKnByaXYpDQo+ID4gwqAJc3Ry
dWN0IHF1ZXVlX3N0YXR1c19pbmZvIHFfc3RhdHVzOw0KPiA+IMKgCXUzMiBmYWlsX3JlcyA9IDA7
DQo+ID4gwqAJaW50IHJldCA9IDA7DQo+ID4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+DQo+
ID4gwqAJZGV2X2RiZyhpbnN0LT5kZXYtPmRldiwgIiVzOiBGaWxsIHRoZSByaW5nIGJ1ZmZlciB3
aXRoIG5ldw0KPiBiaXRzdHJlYW0gZGF0YSIsIF9fZnVuY19fKTsNCj4gPiDCoAlwbV9ydW50aW1l
X3Jlc3VtZV9hbmRfZ2V0KGluc3QtPmRldi0+ZGV2KTsNCj4gPiBAQCAtMTYxNyw3ICsxNjE4LDkg
QEAgc3RhdGljIHZvaWQgd2F2ZTVfdnB1X2RlY19kZXZpY2VfcnVuKHZvaWQgKnByaXYpDQo+ID4g
wqAJCQl9DQo+ID4gwqAJCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpbnN0LT5zdGF0ZV9zcGlu
bG9jaywgZmxhZ3MpOw0KPiA+IMKgCQl9IGVsc2Ugew0KPiA+ICsJCQlzcGluX2xvY2tfaXJxc2F2
ZSgmaW5zdC0+c3RhdGVfc3BpbmxvY2ssIGZsYWdzKTsNCj4gPiDCoAkJCXN3aXRjaF9zdGF0ZShp
bnN0LCBWUFVfSU5TVF9TVEFURV9JTklUX1NFUSk7DQo+ID4gKwkJCXNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmluc3QtPnN0YXRlX3NwaW5sb2NrLCBmbGFncyk7DQo+ID4gwqAJCX0NCj4gPg0KPiA+
IMKgCQlicmVhazsNCj4gPiBAQCAtMTYyOCw4ICsxNjMxLDkgQEAgc3RhdGljIHZvaWQgd2F2ZTVf
dnB1X2RlY19kZXZpY2VfcnVuKHZvaWQgKnByaXYpDQo+ID4gwqAJCSAqIHdlIGhhZCBhIGNoYW5j
ZSB0byBzd2l0Y2gsIHdoaWNoIGxlYWRzIHRvIGFuIGludmFsaWQgc3RhdGUNCj4gPiDCoAkJICog
Y2hhbmdlLg0KPiA+IMKgCQkgKi8NCj4gPiArCQlzcGluX2xvY2tfaXJxc2F2ZSgmaW5zdC0+c3Rh
dGVfc3BpbmxvY2ssIGZsYWdzKTsNCj4gPiDCoAkJc3dpdGNoX3N0YXRlKGluc3QsIFZQVV9JTlNU
X1NUQVRFX1BJQ19SVU4pOw0KPiA+IC0NCj4gPiArCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZp
bnN0LT5zdGF0ZV9zcGlubG9jaywgZmxhZ3MpOw0KPiA+IMKgCQkvKg0KPiA+IMKgCQkgKiBEdXJp
bmcgRFJDLCB0aGUgcGljdHVyZSBkZWNvZGluZyByZW1haW5zIHBlbmRpbmcsIHNvIGp1c3QNCj4g
bGVhdmUgdGhlIGpvYg0KPiA+IMKgCQkgKiBhY3RpdmUgdW50aWwgdGhpcyBkZWNvZGUgb3BlcmF0
aW9uIGNvbXBsZXRlcy4NCj4gPiBAQCAtMTY0Myw3ICsxNjQ3LDkgQEAgc3RhdGljIHZvaWQgd2F2
ZTVfdnB1X2RlY19kZXZpY2VfcnVuKHZvaWQgKnByaXYpDQo+ID4gwqAJCXJldCA9IHdhdmU1X3By
ZXBhcmVfZmIoaW5zdCk7DQo+ID4gwqAJCWlmIChyZXQpIHsNCj4gPiDCoAkJCWRldl93YXJuKGlu
c3QtPmRldi0+ZGV2LCAiRnJhbWVidWZmZXIgcHJlcGFyYXRpb24sDQo+IGZhaWw6ICVkXG4iLA0K
PiA+IHJldCk7DQo+ID4gKwkJCXNwaW5fbG9ja19pcnFzYXZlKCZpbnN0LT5zdGF0ZV9zcGlubG9j
aywgZmxhZ3MpOw0KPiA+IMKgCQkJc3dpdGNoX3N0YXRlKGluc3QsIFZQVV9JTlNUX1NUQVRFX1NU
T1ApOw0KPiA+ICsJCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZpbnN0LT5zdGF0ZV9zcGlubG9j
aywgZmxhZ3MpOw0KPiA+IMKgCQkJYnJlYWs7DQo+ID4gwqAJCX0NCj4gPg0K

