Return-Path: <linux-media+bounces-31765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B17AAA91B
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 03:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD06E5A49E4
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7382BD021;
	Mon,  5 May 2025 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ox.ac.uk header.i=@ox.ac.uk header.b="WNc5Hg1l";
	dkim=pass (2048-bit key) header.d=UniOxfordNexus.onmicrosoft.com header.i=@UniOxfordNexus.onmicrosoft.com header.b="nGahyr+F"
X-Original-To: linux-media@vger.kernel.org
Received: from relay19.mail.ox.ac.uk (relay19.mail.ox.ac.uk [129.67.1.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F1F355E28;
	Mon,  5 May 2025 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=129.67.1.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484892; cv=fail; b=CMETAu+U/z8wtErf+tg8vNLg36n9WP1t6cZA9KwF533wAawaXv/spe1IjA2VK/qLs8mFKxXhskctXy+9lOPjosYedgT2UPskU79OeklddYgJ0uCsnC6G2hI34gRi769rDxcK2+z1smMTMmBk2ZQsKZKk2aacuXSSCJ/P7iM7qNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484892; c=relaxed/simple;
	bh=h2UEkGCdR+GKj2NkfNkMAPrFLFPXTu1fTbCzJ4hRPVQ=;
	h=Message-ID:Date:From:Subject:To:CC:Content-Type:MIME-Version; b=TgPqa9+7ntUv+TpwRTXHYFO/x54s/+WQoqg5u/GucAeCUKGqfN/PQlJPSdZj6Rxw4VN8WfUKxaOi9vf9Gv7/awvu6nZXcUAK02P8ZWDeP6pJvNFCFgp4bCcrxqTSoSZsgRjw4JpxKlORk46hiU6TsYfBcrbaAtigHEC1L7h+K3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=magd.ox.ac.uk; spf=pass smtp.mailfrom=magd.ox.ac.uk; dkim=pass (2048-bit key) header.d=ox.ac.uk header.i=@ox.ac.uk header.b=WNc5Hg1l; dkim=pass (2048-bit key) header.d=UniOxfordNexus.onmicrosoft.com header.i=@UniOxfordNexus.onmicrosoft.com header.b=nGahyr+F; arc=fail smtp.client-ip=129.67.1.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=magd.ox.ac.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magd.ox.ac.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ox.ac.uk;
	 s=flood; h=MIME-Version:Content-Type:CC:To:Subject:From:Date:Message-ID:
	reply-to; bh=3OS0J5uQ2A7qkodxTeS1E3sPp4nlwxnVLDOeAWsC0mQ=; t=1746484889;
	x=1747348889; b=WNc5Hg1lCYKZJD6tL7m5vgBB80MtEOl0XbmfdTg+bxwlj+x4OIz46IwN8N0LI
	i2x6u2eAcPOuS5Nzn+XAhp6p3yMCiqW+33IO9HKwcp0vtzuTjnAU9wpg87axDRB8CBCBgK/ZjRqWN
	+hUywYnNj+S/aGxlcTj9MYh0QFAlcu8gUl9OMGP0quxiDKioBjppXSpHJm/BO5DC4SRJg3UWqtrl1
	0/7HmoEDz38eSUePrNjPhNS9rw6M5RCeTnvYBYfvXXxC6fWBREzMsNPG7UQQiSL/8zTNY/pntcXsi
	eeQ0DRU79jhFCoNtyT3c25zp0kGLvqaAlRDA2EfES8VQVI6VjA==;
Received: from ex04.nexus.ox.ac.uk ([163.1.154.244] helo=EX04.ad.oak.ox.ac.uk)
	by relay19.mail.ox.ac.uk with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <praveen.balakrishnan@magd.ox.ac.uk>)
	id 1uC4V0-0003MO-Av; Mon, 05 May 2025 23:41:22 +0100
Received: from EX06.ad.oak.ox.ac.uk (163.1.154.246) by EX04.ad.oak.ox.ac.uk
 (163.1.154.244) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 5 May
 2025 23:41:21 +0100
Received: from LO3P265CU004.outbound.protection.outlook.com (40.93.67.3) by
 EX06.ad.oak.ox.ac.uk (163.1.154.246) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Mon, 5 May 2025 23:41:21 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TiyBN4xT0Uvtw2z1YI/ImhY/WHVgi+zG84ml4uVfHjmI7Qq3ahqKC2vY2eqjjVJ+Dby6JWfWSdNUQU5xAhD8FpzeeZQ7zj7yWoOg3g+LX1xrU77ma9yc4slretEF3FcUaohz4qngcBIyQTc9r1ZkD9aG4hmRHUzqENG6TWFLqj9871fO6dLrhv3GwyxyTM1Iu1oRaguE0hTGPhiVDSM1UDHf1mpj7yRs0OFgCQEwCyYQdxrc4OQLGlxJ+uNDu81JZonAODQW1NiGES8OutqKU8nOi+8il9Zzc1D/WS/tMxUO8l9ZiKus5qADLk3sUCgBs0k/UWuinyTDO3FbzK92UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OS0J5uQ2A7qkodxTeS1E3sPp4nlwxnVLDOeAWsC0mQ=;
 b=pQUjQWCJ13DHgV0tYUuK0QM4Wg5dWiFqGkgX/lxxoSWNW1Ll8mViRkkYUAPsNG6uu3n3r6hgU672+1ZSKiHiWFctlU/vrDfDX1+aJlU8bn4H5JQTCZjAc4YVF7DtLDTYuZDsCHvcxXLsHeRSTBZyr7UBWfmZ08PQQf7gVLmLlFfvDRzGTj1OJb0CZfM68XtGfNqPcJif4n8bk04rr0kqJyyDsATaY6IO3IsvNA1wlVB0AL4PbkomQ0k+exTo/eV+8E079s1RGasI3Krt5QO9IqDBF89TlUP2PJqXm94gbN1LlwPuUizgFiZPdPE0bJ7gDEGsoXYI/BUYXWH9gkuK3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=magd.ox.ac.uk; dmarc=pass action=none
 header.from=magd.ox.ac.uk; dkim=pass header.d=magd.ox.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=UniOxfordNexus.onmicrosoft.com; s=selector2-UniOxfordNexus-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OS0J5uQ2A7qkodxTeS1E3sPp4nlwxnVLDOeAWsC0mQ=;
 b=nGahyr+FPVVzJofETxzQbwMWe3NpGmcwmLynAJJbymzCo17aQIlwgArTIsCiOO3smPoi8fYQlYw+LS0EzZauxQCIorFOrOU4NUWMUETNXmANulGeKDyKLE1g0RQ1MgCMd0pnAlEDcwhRgMHufMOwczm0fXO3rGUubMGtgmi1J/XmiH92NM6T/h5IouTe5CFwHfqxwWs3RPPZC686cmF5DYvulKEiHTPHCthu5zPWkm0HV30lyMpm5v/IrdbiIrmP6qgv0YwjAYBnotwDJ6WOtiXw2eVx+DScs0NJJKV2uEjfIYBQ+w8raTgcG+8/lLMGqpSv3g7/T2l9UasaCo7KKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=magd.ox.ac.uk;
Received: from LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:323::12)
 by LO2P265MB5014.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 22:40:44 +0000
Received: from LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
 ([fe80::639f:86e3:3b7c:f6dd]) by LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
 ([fe80::639f:86e3:3b7c:f6dd%5]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 22:40:44 +0000
Message-ID: <451ddef3-c993-4b5c-baf6-2c97065a8e7c@magd.ox.ac.uk>
Date: Mon, 5 May 2025 23:40:43 +0100
User-Agent: Mozilla Thunderbird
From: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>
Subject: [PATCH] media: dvb-usb: az6027: fix return value of az6027_i2c_xfer()
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<christophe.jaillet@wanadoo.fr>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
	<syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0240.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::11) To LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:323::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO6P265MB6985:EE_|LO2P265MB5014:EE_
X-MS-Office365-Filtering-Correlation-Id: a1acdefc-3bad-472d-b46f-08dd8c25df28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|41320700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm9iMzQ3ZHZ5OVlDS1MrdHhETXFEUFpQWjFCcWhHMzJOTnJCb3RCRmZsb2xD?=
 =?utf-8?B?V2d4dlZJTkNUMWlQRis3UWZRcTFDakVnVE9jSHFlb0c2TERMNU8zWjdXOHZD?=
 =?utf-8?B?emc2dmFJQzJFdzV1eDlKY080cDAvaXhVcU90U1JtNHFMRWU3ZmZZWjA4M3or?=
 =?utf-8?B?ajcvOGpHNDgreTQrQk1QTm1qWHhmQjE1cFZrTVJielZLd1NIV0YrdlFNTzR1?=
 =?utf-8?B?b01TV292RVZJUE5jellMMnRwUytQbUV1YTZYeW9reVJuUDJOTEIwcm9EZGxX?=
 =?utf-8?B?bW9UYkszZHEzRzVpWFJLSzMxdHBabHIwUE13OXlPWW93d2VsMzlwMDFtN2lH?=
 =?utf-8?B?cHpoRS9TcVc4emN3Tkd0ci81Und3dkV4RWthL09wUk5uRm5xY2FZUGhPYVlw?=
 =?utf-8?B?TmtvT252amNna2Z1Rk1EVVphVnc4OURnemNjQ09veGlraERwcHVOd0k4dWth?=
 =?utf-8?B?TytFNmUzdE9VR1lZTzloYVgycUlzT1A1cFZzcUlFOHpLOUI1MElzcjlKRUJj?=
 =?utf-8?B?NFlqNVR4S3RwVkpuZlpPdkpjUkhhK2x4OGVMUEFySi9WTzY5M3NOelJLMVhI?=
 =?utf-8?B?c09QTFM3eEhqeEZvdVM2UE9HSFZESlFGQzVGR25aYjF5KzZyVktpN3BWL0NK?=
 =?utf-8?B?Q3NCSjA0UXAyalU1ZGwwdnc1Ym5RVmNzQ3p6VHVPQm1iT01uYmlOREQ1VXVn?=
 =?utf-8?B?Q01JRkRhdElDOFlZT1l1T3N5cHhYYUxiUWNtcGhrQ2tpdWtmTFNqLzJyNzFl?=
 =?utf-8?B?d3R0b0FkZVp6RTZWRXUxVGtXOU5KajEvSTdCMGJ4ZWh0NmNqSkJINU5XWjJz?=
 =?utf-8?B?d1YrcmJ5b2ZiU0EzKythbmh5MEZKMDdsZUMwb0tTOXl0c0IrQ0kyN2p5eHFN?=
 =?utf-8?B?bXViM1NZTG02a2dPRkhBcTV1UzBNajVvdU9tRjRhSFBCNE1mUEg4QU1jMnNj?=
 =?utf-8?B?RW9scUNsYmxvcUs3OGVOYXl2em9YbnA3YU9qL0F3SXBGcHdab0xLSDNFUGZP?=
 =?utf-8?B?TGY3ZXh1UFozcnIxaVFHMjFxeHp1NnY3MUVLNFNEV3VtR29uNDVBVWl3QWNm?=
 =?utf-8?B?UWJkVTFQR1F4aTZ4cGh2L2o3QTg3bUVWd0J3SkR3c2huREs0SngrVXA2OGdt?=
 =?utf-8?B?cnNTU1lRWTZwZ1JmaHA0RU1pNnVBcWNEWTdBVUpVYWw2RUszTlhpUU1NNlNX?=
 =?utf-8?B?akwxaFhQRkNCNUFZQVFJMDU3dlFzNXZpRENncXU4QUk3aWM0NVFjUEV6SnJM?=
 =?utf-8?B?YWVyRkhUdVFsUHUzbnBnNkRVczMyUVN5cklUQU5laHdINlVRamtIT2hJbkpD?=
 =?utf-8?B?akJHM0NzL0c0dW9oL3kyQmlmVVZBWnNuWHRPK29vbnZHY0V3b3JHdHpBcXZY?=
 =?utf-8?B?SHgvdnV5MlZOVFhkdjhKZWdyN3JlUzFHbU8wcXo3bmhCREF1c1M1d3JGK0tx?=
 =?utf-8?B?Snd0anlldlUxY1BlSysvamZzMFZ0RDR1YW5qTW95REpyTXlVL2NuV0pZU0Fz?=
 =?utf-8?B?ZFRWREk5NFFwZkpweXdycWVqaDd5cVVGZDVrUDBKTzJHbVlhVFVzVFZENytB?=
 =?utf-8?B?dURSMVMwVEhSVXdwOEt2eFhUbHB1L09XdXNxT2pzQXFpYndDV082cDJHYzN0?=
 =?utf-8?B?ekpIS2VqLyt0VWg2aWY1aWRRRXlHaTV4MGZ4UWVDYzh1Sk5BQkJxZGhVWi92?=
 =?utf-8?B?VnBiWHBqb1h2aWhNUElCVTlDb1NMQmtsWnV6cUZyYXVoc1lta2gzUGg4RENP?=
 =?utf-8?B?MDFXaUs2a3h4MGhGcEVvQnNMdy9jWXhoaHc2bE42d3lTMklmS0tiMGdZeXJj?=
 =?utf-8?Q?RWzJEjVFoWCXKlJ6kSVUJYmAJTiTeTCBL7SeU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enFVaUpLNDRTTTZVa21iVGEvZzRqMHhWdUE1QmlEMThNdUY1WFNLQitUTWhS?=
 =?utf-8?B?TzJTaFZKdFpOQisyUXZmdnBxeG8xb2pQdlRPRWJLM0pIQjhPWDdHYjNJOVhi?=
 =?utf-8?B?OFcvNWJ6dEZ3WVMwK1NWODJBYUVjdFN4bVJZeEsvTHBCeGp4ZEZhUmdoVFdj?=
 =?utf-8?B?UjdCQmdPdlN6Mi9iR2w1a2VleElHbnFpTXA2TmxHSzJKL2lzUEFZVTZQeVZG?=
 =?utf-8?B?ZGZmNHozaStFRVNRR2lLS1dXSWtvMVp2MzFHaTlzc0JkSmZ1RlRybWJ0Rlcr?=
 =?utf-8?B?cHdtSFFFbXVUV1hoK2crcFhmVm5KQXJzQlQrejFWK3NMSldmWjhSWmFDV3li?=
 =?utf-8?B?TDZOK0g2b3J6bGozakczSG1pbmw5ZlMraFBsanJ4cWg0UzV3WTd5RTZpd2dL?=
 =?utf-8?B?Q2tUVlFURjVOR3V3OUJqcFN0aC8wdjdTclhxb2JYalRTWHUzd3NBQ0ZId0kx?=
 =?utf-8?B?Q2NWMDlCZ2piblIwbjZOMGV4VVNFeW1kbldYcGpEa2RXR2ZmTUFra096VjMy?=
 =?utf-8?B?REpLQWhnUitEbWNpZzRnTDRNQnNoMjl4ZXBCM1crdCthUCtXSmEvcGs3RWtJ?=
 =?utf-8?B?VENzV3M2dlpYd3hmU25pV01qWHhXQTlXa0tGb0RQcGgvc3FYSDJqT0Q3bEJk?=
 =?utf-8?B?bmZDTDh2bENTT1diWmIwVm5EbTRYb1VwM3RVbkovYXZKRXJqSndCVkRzYVIz?=
 =?utf-8?B?TDlReXJ1bUMveWxLRjJ6Zzh1SFI1M2lSK2J4UEZ5cndMdkNDbEdaQmFjcCs3?=
 =?utf-8?B?YTZxTGFaemhQZktQUVlHdlNxK1FhOFNGK2YrcVpuYVpsZzlVZmhtcHRITGpY?=
 =?utf-8?B?SDRoRzNoaEY5NTlwY1lTWk40T0drK0lpSkk4bzFjOGwwSUNra1hoU1N1Z3hQ?=
 =?utf-8?B?Sk9LTUlTNWRGVnZONzhEWkp2Tmt6c21rTVRHMkhMUnZ6L1dHM001MUxPSUFw?=
 =?utf-8?B?ek5wMHFqVXFiNkxzMmJVdDZLaThXdlIxQWJsWldQcFhXczJlZVpjN3g3VzEr?=
 =?utf-8?B?NXNUaXl6VUNuZUVIblUvcWhYUFlRemNPSytKNkQrWXZqU2t5Ym00TlhHU2l4?=
 =?utf-8?B?dnNCMHdsVjlJUHR2OVNHQ0x4bkxZaHpsdk8wazU2NEJwaWxFNWpzZHBwWWVE?=
 =?utf-8?B?ZEl6S2VRS3pIa0NIRkpSZ241MmErUGJGallEVWc0Q1lXeExSOGMrbWVQdG13?=
 =?utf-8?B?eXlKZlpQS3ltekFkTzdtdjhiLzQvV3p2VWs3d3ROY3JwYm9nT2lVSVJMemUw?=
 =?utf-8?B?Tzg2T2o1TFlISGdSTUpodEpyZXp4MHBKTU1idUF0WVk4QTQ5blcxeHJFV0Y4?=
 =?utf-8?B?d2xLam5hODZ1bCtXRjFwNG1LY3ZPK25jSFpvUk43TGdzMnlmcWR1S2diOWZp?=
 =?utf-8?B?ekRTdXFvZHIxMXYreGhhdWZvdUpUUjZvcDRrMFQvc3lYZVRXUVV2WEZHV2dV?=
 =?utf-8?B?VUIrcENiNFJ0NGpFUDJrYXRrUHhnZTRSdzIrREVSdTdGQ0pSR01ONCt0clJX?=
 =?utf-8?B?ekt6REtVU3N6YlVPVytKcVZ0SzJDTXNvT0EzREt6dmIrbUxNNUtZOTI2QTFh?=
 =?utf-8?B?Q1BNTy8rMmJnRC9pWHVyWThCdUt6dElPSkI3a25mTzBXcFhWTStVWTRSUm9o?=
 =?utf-8?B?eVNzVms1RmRIcGw0TytoaVdVaXBmUEFma3pFNzh4WGFDaFhsc2RjUmpCTDZI?=
 =?utf-8?B?SE1uckJGamdDRUtUODNZenFGSTVvK1BaSEszU010VWNVMkRlaXlya1F3eENx?=
 =?utf-8?B?YTM2djR3dXZ4OHo4WW1vSitQVzFmUmdsVkd3dHdjUmxKVklnUW9reHJNZVRa?=
 =?utf-8?B?eHVPNkQ0WDhYQVMzNEdZbHgzTHhPaTNZVkFNbUNINEplYlJGTkVkQWIzcmE5?=
 =?utf-8?B?OTl1ZXVyU1FGcDBxeGZGa3NMMG9FY1Y0aXFFdTdzV2JqK3dVQmh5R3ZsRS9N?=
 =?utf-8?B?Z2NxRXhiQitUQmprRG9ENTZLOFJCTDByZzI0VGhHdVpVajNmYUpXV28xWkF1?=
 =?utf-8?B?Y1lsZWkvRFJOUG9qNlJORVB4aG82dHFEZmRYZlgzekRJUFBKbWpSeWk3RDRk?=
 =?utf-8?B?MzN1TGNhWCtmNmZXNlg3c3ZFK3R0aG83NW1ZN3pYblUySEhlbzAza2kwWm5x?=
 =?utf-8?Q?DwN+bIeI0HE/I4MbnfibGoLzx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1acdefc-3bad-472d-b46f-08dd8c25df28
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 22:40:44.2828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: cc95de1b-97f5-4f93-b4ba-fe68b852cf91
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwIC0Kk9CNrpMA6Fn65w+5lwhTVeBMTtcFklJXSquT+QGEFTSmx1auo1hlmceyc7f2dRbO1Hq8l4mikb1ToKtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5014
X-OriginatorOrg: magd.ox.ac.uk
X-NTG-DKIM-verify: pass 

syzbot found an infoleak bug triggered by the az6027 driver [1].

In az6027_i2c_xfer, the return value counts the number of messages
passed to it, when it should count actually executed messages. As a
result, i2cdev_ioctl_smbus can copy an unwritten buffer to the user.

Introduce a separate return value counter that only counts executed
messages.

[1] https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb

Closes: https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb
Tested-by: syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com
Reported-by: syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com
Signed-off-by: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>
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


