Return-Path: <linux-media+bounces-59570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFc9Kef662k1TgAAu9opvQ
	(envelope-from <linux-media+bounces-59570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:21:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE8F464039
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5830300BB95
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 23:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63D9381B05;
	Fri, 24 Apr 2026 23:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="TuQr3ghv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723F6363090;
	Fri, 24 Apr 2026 23:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777072864; cv=fail; b=SM13bxIqzJskOV+l99g9I1uK3O8ZeR75ars1Sn/+yzj83d1MEqQWoXsNUSkjmPdAFGmrJM77Fdi/OBSRluTZLkdrw2N81rLAPHkvMR7YhBjHDIouhM8qiziIdG/qo11Gln2M0znigwVqzk8otSmf0vUXJ2E9juuXfW0eRjY0LJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777072864; c=relaxed/simple;
	bh=2F9m0asjJEZab5XSIZ67/HJqzTsbItzVZJMsL5VXx4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MgfuMq6nQHDPca9hCMDFYltztSVj3gSWPzl9pDtMGfVLJEudjO/SMvmktJM8PXTeqBStebc6A0ej0cig3ImWHvnQHKEc1phpw/SJvbtbBER2Yghl+kzyYZERrgpQ25JcXaQu5zUAvrKBTWwF64L8LY8kfmS0nr2XpqBRr4KrnHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=TuQr3ghv; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OCSR6g2707038;
	Fri, 24 Apr 2026 23:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PMfBcC5siAGBBl001RcLFEL1F7xVG14QfIs7lsrUmJI=; b=
	TuQr3ghvQDocfeFfCjALHIpbs1t28XSKdjRJAQE3Atxxn+rzsC/6HcItc/NWvmmE
	BJmQq69IzwZjEGPfuSy86zn6nL+NEjw/C5gdHonBHaEcdOeMZ8qBR0Nt9J03Gjbs
	cRKoXrY2lnwM/OcZcAJQ8ZwLdni7KNX0VwUO2UrWCGSIiB0KgXwG6Ewlvdhv2QM2
	9thuEmgsn18JkgC2MWa5uHABPdMycJKrdjPK+STgm+4BI/lcdwunMp48wXz4eTRM
	TrYn1lb7dT6zENrkxkalvO+2SC4sf9xfsesjvZe5g1McP+dDM1m8P8LSEvnaU6qj
	LLk377ZfBgtOHU5WO7hLOg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8u8an4y-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 23:20:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXdtcCE1oaqmfjPFPl6cL2K36QIBG3I/5uk729w0iw94RoYuO0vAOjVz6B3O2y22ShFGrsR5yjv4DoIeWSJeS6JVwFqetS5MJF9Ah2OPyKYme+hzirgbi66AJ4I0Ep4Q8Nc1nRKoboCQGOie5C5TqOvGa0n21pRhvi6vmZVT+3rdT5xg8c9OnEcWE3/CkkQENjbFTKG1zFAD6OHR0P2ZKlDCQkR5XYo6nZXiemjh8jj3ZHybCS4R1h5K8PE/JISzlL0o2QI6FLMDmyFICVZosgZKUwDvDwUePbLDv9SXFMg5jXkyX3tamv6l9miz95l23DoW1KIoHz7EsR2KqyRKVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMfBcC5siAGBBl001RcLFEL1F7xVG14QfIs7lsrUmJI=;
 b=Ui44M2ljC3DnByosqAabEdmr9fvggPTSQypL1o+L+VlpDfv0bK4G27hDZ1Q3qfx3mn53BBcJsqVfUEugf3VRu0QrhY0YV1FC2lfaIjmPvg3AnMD35suE4eRnVTmf5V8hWRnYgjROR5izHYeQ5oKKqerpXdbBy5yhyS5i4QXiTzTnUQ3AQ5IvY7F1YfvlbwIW5xL4gVo1CZ8i7dVYdmuxUMkQxnggCub0DNId/x68OjCmDI+1P+pkiLBFU8yE2pHjcsITmRq/SdQtaVpOPvtpfwTd/ZfUIAtoguxMhXDVhMEUqLJ/eb6GegMEe6FQqAGfI2w6k+9bxoZbm6vBEVX5Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH8PR11MB8061.namprd11.prod.outlook.com
 (2603:10b6:510:250::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 23:20:12 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::b919:1e6b:48a6:f655]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::b919:1e6b:48a6:f655%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 23:20:12 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH 3/3] media: imx8-isi: fix resource leaks in probe error paths and remove
Date: Sat, 25 Apr 2026 07:19:26 +0800
Message-ID: <20260424231926.406079-4-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424231926.406079-1-xiaolei.wang@windriver.com>
References: <20260424231926.406079-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c69fa34-a7ff-4675-346e-08dea258083d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|56012099003|38350700014|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	wap7ItTwBjiUyJT9CioQZiTBth+bwVaO+B7WpHLOU21qKov6T3blpAbZBUQFvFOX+6yJGI4Wrln3tw4Y1FTJ1OXj1PyffCuugqlPc9HloYpGGgjjRaTMTelqUi4xa6N4MQ6UZ+yZyMGPymwna2TSsKUjdwO4Rr61Wwz4wA7Qs+pz9ffi+THiIeGHk9Zu2YivHrMBjjhv3iz60waNT0ZPQCUQBK2Abb+GIYiGdukYgbhomgxRvNUAjkA2BGkjiY0DO3Gjmc+VJr7VrBnjzTvPM9CZuxF1M01wPWzT33/fOa8H3v5wywIvlyhg6mxtvlUti9Glu/8Bwo/f81D94ymqkRgPrCDhNtx5KorGxyCyVebz3VlBTUCoPL6apwth7u9Cb/9B0p3ex7z1mUidcri7tiE1kaSk3NpHukLYq4EZMo7dICyXxbtYVnTt1s6nvXmBgEMhNB/AGJUtOuiSDVLR6smZQeJzjj0SLe2H+z6aAJpjU6vRKAucBLl53L3wCosy2DLI4+r06PzpCEIrzk2CnBs93SFRgbGwfUQwG6UvnhrJvS9RjwepaY0AuF+J3+4HD5jJioOI5NszvyZLUfgoHcKvma23JLVG+0TGwZSR6lIqxTRRxBhkEcd/RKGunpskdMF4sNV/Z5bo/8igHRdm+ICLYUOzWAReO+M9kaDO3thOYuLxK0ACxPpVhQUFjiwNEcJENk/Xunab8y5a9RdJp4MorqVAc81OR+/RlcIbsNr5LutRyNJbwmUdn2Q+9Bxly3+xL+VQ0n4H/cQbFm5zScpcSm48zCRQ2UeQWbtm/3F4vosmaT9BhJYnlcjHJD/1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(56012099003)(38350700014)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2VIWm0wZ1VGU0hZMVpJb29aNkFNT1IrMFZzU2VjbDJjdWtIblBJTE40M3A2?=
 =?utf-8?B?YWFvVlZRUWo0S2c5SzRibzRvMDg1QnhyaWFRbTVoWC9tL1JCbk1xZWZTK0pl?=
 =?utf-8?B?b3VnbnlUdjhaenRCbjN5enVkK1djNzVwMzhUNWViSVhWVFRIVDJHNE9uQWR3?=
 =?utf-8?B?UGN2MStaK3Y3TGRNWVB4UHJMdXZ0enNPUWNHNlVPVnZ5MjM1T01FRnYvOXps?=
 =?utf-8?B?OVpVYmhqamowM3dPVGZZZEo2NTZRRHQzcTlkSHBINlNobmMxdE5hNm1RSDlS?=
 =?utf-8?B?eVAwc1FkdU5DZzg4K05hQ0ZDNXBtR3RkWGlkemJNcDFHcm9LaTcxR1F5NmVr?=
 =?utf-8?B?Rnk2b2RuTHdaOElFY0ZpZkhTZzNtNXhpb05YdWJBTkxQam9kdkF3MUhSN3ZC?=
 =?utf-8?B?MWlzVGt3aEVsSXR2RHN3SllDa0ozZjNwRVkyeHRMakRjUk1YS1J1UGxtUThZ?=
 =?utf-8?B?Z3Izbko1RFNBdjZSS0REV0tTODBoandONUNHR2VSUy9TQUJLdksycFpLUE0x?=
 =?utf-8?B?czNaaHF0ajg5WE4wTnE0a2xaaXJmQWJ6VE03WW9oeWVPMWxjL0s3MjJka2xH?=
 =?utf-8?B?TTh6Snh4M1cwcEdSMkxReTZoKzNwWUdHUHRrY3BQTThjay9MNzdkT0JGSDZV?=
 =?utf-8?B?T2lHOWk2U0NZSk5nV0hxT0pYR3VzVEhkWTBFQUJnTFRrbm9SenkzMldzTWw4?=
 =?utf-8?B?WGJadmVOQ2trRVFFL0VXVTlKRGVzZWQ3aE5YNGNWaldaWnkyTHlIYjJLUHFl?=
 =?utf-8?B?cGVEQWlDWDA3bVZ5YmJvZmorcUNYQllFeUdvbzZnbWRHV3dsSURWRXBQeVhw?=
 =?utf-8?B?S0RkRkNicTB2aGQ0WU5hMXZpRGdVMzJPUUx3WkFmVWo0TmMyMzZvaE1CanZ2?=
 =?utf-8?B?cEd1ZE9jb240d21pYnNzWGh0cy80WFNlTmFpMlUydnVkK3FoanhYRlEwUzB4?=
 =?utf-8?B?ZTlFSlgxZktIQ05wM1pCZU83U1RFcWw2azBEN1U3aXdST3l6elpoZ3dQUEtI?=
 =?utf-8?B?RHJTdStQUzVsQjdpN29xT0R5eHd4RW5nbGxtNE90SHZkNnpkRHVXdEtGcXlx?=
 =?utf-8?B?UEVWSW9tMEVLZHFibG51ZUJSbnhyaXJxV0hYS3RyQzEzbzlQK1NwbENhK2tY?=
 =?utf-8?B?ZmozZGtRSkJSa1FxMTBNZjZpekgxY3ppL3EzV1pvdnBUK0ZkYXNVNGdoRVdy?=
 =?utf-8?B?bml5ajRCWGxUSHNwNTFubUNwVDUzOGRwQnZESzdxRURwTXpnUzIvSUQvSTFN?=
 =?utf-8?B?R0JncUQyc1orRnVmekpXRklFT1ptRGdPb3VVWnNLN3FxTVM3WkRsOThyelo1?=
 =?utf-8?B?YjhoQ1IzVEhuRzlBTEdYc01tYy9nc3pEWDlPdzhCVGxLL3NpTlMxQlQyNU9V?=
 =?utf-8?B?M3BuRmEwRUJ4TDBocGFrM1hxS2ZuNjVqSjIvbG9UR0lPSktvZ3Z5K0czT05P?=
 =?utf-8?B?RDhzSXMzL0w0RE1iSUptM2RXZ3JhSEpwZll1UDZpckd2VTV4Z0JySnYvSXd1?=
 =?utf-8?B?MUJLKy9McTRJUFF0VHc5WW8yY1crV08vRkxxc2VUMmhpdkRIZlpXcXNHbHhQ?=
 =?utf-8?B?dC82OTBmYlBkYWJBUGVBZm1MQzh2eEpsSk9Yd1VveGU1ZENZY0tEZ2NFS1RK?=
 =?utf-8?B?VE9mSDhMQ2ZDQmVwNzRaeEZxUnRJUk1ibkV2UU1oQjFjRlhobDJqbE5tYlNU?=
 =?utf-8?B?Sm1tbnQxUXZXbWxJQm5DZzRzbHJIZUJTdzZjREJwcEp0dmRvUWoyRG9pbEpN?=
 =?utf-8?B?U25Od0IwSUFtNEZTUmNyaTA3WGJBdDIvV2gzbTM1cloyOUZqNVVoY2hFZzhs?=
 =?utf-8?B?K0t3VWRyNkJMOXI4WVcrMW5iR3Jsc05aMGVMNUkrTlRNOW1mSlRwTk1ydE4z?=
 =?utf-8?B?aHJ2OEl4MWpielgvWVJtQmJwZjI1dElMMGl3Q2NqNnRNeGRiM1J2M2FNaHB4?=
 =?utf-8?B?RUhCRUFlNFVsZDU3OEhXVVNoNndzajhqQXlhVjArM1dXVncwRmpteG0yYnRy?=
 =?utf-8?B?b2hSbGZJQm0yUVEyek42VkhvTElvVFMxZGc4dmpJUGdBK25YbFJSRS9OOVR3?=
 =?utf-8?B?ZmtCRTg4THp5V3dEbGxjRkhSRjR4SlFtZ1NTS3ZkOU9qbWtKOUxRWXg2SDRa?=
 =?utf-8?B?S0xxcC9jL3NTWkxvR2Rma3hhYVYrLysva3hNK05iQTZUeU4xcmdZSE51aGI4?=
 =?utf-8?B?VE5KNEdJUmZTVnJyamlKMFNZL3NlTFpEaHpXYis1TjRCN1hCYnRVdm01bjBJ?=
 =?utf-8?B?MS9tZURXajN5b2g4SDJ2N0loN0ZWa0lxSk1DZ1pjZHJzSFpHZTAvazJ4Mnds?=
 =?utf-8?B?a3hwWVlqK29QSXFnaDNqSjFxTnBVQXV3S29zV0R6Lzg1OThjWWtCaHJBUU1N?=
 =?utf-8?Q?WDbGutOamM4fSfuc=3D?=
X-Exchange-RoutingPolicyChecked:
	Dwf2vSIDJNMKlBqi9etbbilGTji+FbOMQV/vdPwv1AM8oaKgMHcK5FaY7p9iGT5mR97V7e1ayGcDLjaMVpLSt1bcQOd3CRgT2XgCXquYpb1xnQSdaWs9NeaBSnwhGw3cLhD4eYEbqmWuOg+QTo6C9yiAh7ZuL/2x9Czmm5jmXiFDrXRRfm2rJj9CFxWa8BX6BFpII9fPbCcTHVOUHvgd6I4fwOU55kHHD5f2foXdyLxXGc3m8Gk7XyA7XdVRKGFDEI8Lvc2Qg1wgOg2FbzDNMETf8Ld/+/7cLAQxlXm5BmENNPlatc4BBCTIHhl5ZH8Lr8yo/wkWHQ0H+vseOvPHgA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c69fa34-a7ff-4675-346e-08dea258083d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 23:20:11.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FF6HYElXGXIlOwO8A/QLpBDz22hz7KRQAlrEaKg4r+psyFLczOc0vjx/4py5cmbzXEA6ks/KmxQ2dn+oR4prIOY9W5W/ApFAl0nvNwFD0Og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDIyNyBTYWx0ZWRfXwHCG59WykgNC
 2Qr1GjmSGzXzFuZFWvlPpGxL6APipxQyVe1Zj2SSERTz57NcsGWf7Q+4QnG+N9hxbwObCwuYxao
 q2J1KlT7k9LB+OHC3cUvsdHB049BWkG8koFOKCNsHiz6Pu3cPUVk6Uf6G5AHSzynfNQi8m+anfq
 0qHHj5ds4NDhZnmoPlN5tbBbagDRdxXuGQDePyjredc6w2cwA5heJmFT96Z9rffByg7iqJsUV3V
 c97M6AbY9gLvoSeF+aDk3J7qspz/gZM8cKpeGAsryD0VMcbrc97DnubHj4dG/tqUO3e/7vhCHQz
 qUvllwERweQd6f0D1VLD04oxeZCpdIl2tecHQL/P3+ighJTobNQi2nHQk9tin18rYQc1iDiXLc6
 1rOejkxdMcPiPY5IO7+JjT9l3uUgVZSDJeDg7Rh9s21orwYDXOYcBCoknib4i99GrOeoEjkLva3
 5VVxotuyxX7zxDctRIw==
X-Proofpoint-GUID: 5x_wrJD43ZqwpPz5sIcb-kHBE5edInwW
X-Authority-Analysis: v=2.4 cv=WLNPmHsR c=1 sm=1 tr=0 ts=69ebfaae cx=c_pps
 a=xOYz1KraVtwoi73AohHYLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=78pQybC1poxpKYY0_T8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5x_wrJD43ZqwpPz5sIcb-kHBE5edInwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240227
X-Rspamd-Queue-Id: 8EE8F464039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59570-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,windriver.com:email,windriver.com:dkim,windriver.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
frees it on any probe failure path or in mxc_isi_remove(), leaking
the allocation on every failed probe and every normal unbind.

Additionally, when mxc_isi_pipe_init() fails partway through the
channel loop or when mxc_isi_v4l2_init() fails, the already
initialized pipes are not cleaned up — their media entities and
mutexes are leaked.

Fix the pipes memory leak by switching from kzalloc_objs() to
devm_kcalloc(), which ties the allocation lifetime to the device
and eliminates the need for explicit kfree() in all error paths
and in mxc_isi_remove().

Fix the pipe init leak by cleaning up already-initialized pipes
in the err_xbar error path.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 2d639b789910..8533a979d60a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -485,7 +485,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
 
 	isi->pdata = of_device_get_match_data(dev);
 
-	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
+	isi->pipes = devm_kcalloc(dev, isi->pdata->num_channels,
+				  sizeof(*isi->pipes), GFP_KERNEL);
 	if (!isi->pipes)
 		return -ENOMEM;
 
@@ -538,6 +539,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	return 0;
 
 err_xbar:
+	while (i--)
+		mxc_isi_pipe_cleanup(&isi->pipes[i]);
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
 
 	return ret;
-- 
2.43.0


