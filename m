Return-Path: <linux-media+bounces-44658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDD2BE166B
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 06:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3565A4E5102
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7B62045B5;
	Thu, 16 Oct 2025 04:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="inrtSpFR"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020121.outbound.protection.outlook.com [52.101.156.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9A41C01;
	Thu, 16 Oct 2025 04:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760587313; cv=fail; b=IqjBargHSDU3ETaOUedS4mqRFkszNLyu2n1LPTXYQMEwEvbQNfnJt+DJmWRjh228r8Ru4FAlif2f6cwsJ2nr4zqP0Gg9PV8YF7cHBPVlEiduEK1pQ39/WJx3gEW+K6P0VXT/m8twKKEfw6la5OKQ40tFxOvGH6v4XYSucg2wDMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760587313; c=relaxed/simple;
	bh=iSeOIrP2FK7Oiasia+BL3nXJYSVoB7ibdNQWNOb7nw8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=krzo9b2IS1xIYyc0jtRbbYmyXl/n+5NuRIH6NMYfNbT3SIHQr64LDx34lv7KAjoc2yKpckuvKFfyiEZxFGPsPxGOz0pyJ0H4MjVaoxBCbxxCDsRgunmN7GdFN++iiKHa5+LuAWalVkSHIwUJUDgLDpzP3j42Z2XmfBoT2LOcW2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=inrtSpFR; arc=fail smtp.client-ip=52.101.156.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sss5EnTJpVMRP22Lq87ak+9ikIEvp7UeF1BS/kl6MxOb4L1KNy71Q4r5MpaPrKcaXZiw6bBbElATi1wdLiEs+TtmKvKcsVUrZyhDr4i8vjEhY5HBVJ44AuDF0Gxk0H2SdRImIPxf+BtKJ1HrxpYrIgugc6p+RhHbr5O9YdOH2m0m0BOsRWwGuHq0gqWA99Siz1bKZ+05O2t9vZQQVevglgF3tqF2ZtPS52eeND7jNyOB1GpzRGZwY16n1QdqNWm1zmVR5SXECe49t1kPB8jeKd+OLhkmY7C32cB9AOL2vLkDiUvOsxGVuzuRkAu4ChJFHhtsHA0U4en7//1z7f43rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSeOIrP2FK7Oiasia+BL3nXJYSVoB7ibdNQWNOb7nw8=;
 b=J0MMavYNnlgE2b33RQqMrj1EC8+IZF67DK2yWv6qsDBBo8lle1wdIleqXwFA+72jUsInP5g2a3TR/SSWZknkEN44/hnCYXEpMXeJKMWOvvtgSaq8pvzFIHrSktOT/tmvPyQ1JdE9sX9LyHfApMKUh8m0qtMHh7WhundvCyAeEHDZ/ezqysWUkC/17/1J412lnlauV/REwxaHHHUx/0+1OZzitAnG8RdHUMZ4Wdin9NmoAImVnnrZjbmH54L0xRNRyNvFeUg+Z3kCEbEEWD3PmcrvB5VAfA2AuUccuCMh33K6rL2A9AeYAB2rj60ChXJUzIZRv46mKyoTt+FZ9S4lTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSeOIrP2FK7Oiasia+BL3nXJYSVoB7ibdNQWNOb7nw8=;
 b=inrtSpFROsSp8dctpmCcUsSvUkpJKU1LNqKKtKzvEU6YizCE4p3ydGDXW89kKNvy9dFsCgOmrH89JQOIpkazwGtTbCRUzayNRtJ8DRhJObhp39oEENXzQysC97PqnCwNlAtT5nofTCErDpUy3kBKT1wYFSLENRewsAr3pSko9gs=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB2098.KORP216.PROD.OUTLOOK.COM (2603:1096:301:12c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Thu, 16 Oct 2025 04:01:46 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 04:01:46 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Marek Vasut <marek.vasut@mailbox.org>, Ming Qian <ming.qian@nxp.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx
	<linux-imx@nxp.com>, jackson.lee <jackson.lee@chipsnmedia.com>, lafley.kim
	<lafley.kim@chipsnmedia.com>
Subject: RE: [EXT] Re: [PATCH v2 0/8] Add support for Wave6 video codec driver
Thread-Topic: [EXT] Re: [PATCH v2 0/8] Add support for Wave6 video codec
 driver
Thread-Index:
 AQHbs2lXPGc8hKKJ8U+R1oPOXrRnSrSC0cWAgAEGDICAACOsgIAABgoAgACe0oCAOTQqgIAF4/rggABcWwCAASUdwA==
Date: Thu, 16 Oct 2025 04:01:46 +0000
Message-ID:
 <SL2P216MB1246CB5B9EA0A6A63236FE19FBE9A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <f03d0ae0-d28b-4b06-8f63-9d06f15c0522@mailbox.org>
 <fcfa00b5ae102d76b02ce1667d27822e6d2c3c81.camel@ndufresne.ca>
 <472aac3c-9d3e-4892-8d6c-665fa6793464@mailbox.org>
 <59e87d8e346bb16b225382b9a4500e1b16bbf776.camel@ndufresne.ca>
 <PAXPR04MB825499BA447B4000AB8329A6E703A@PAXPR04MB8254.eurprd04.prod.outlook.com>
 <2c431e9a-9e2f-4583-bf03-142b56439a47@mailbox.org>
 <SL2P216MB12469FADA7A4A6872D1C5D05FBE8A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <efa2f3e6-fa36-48a3-a85a-68c7c1335ba5@mailbox.org>
In-Reply-To: <efa2f3e6-fa36-48a3-a85a-68c7c1335ba5@mailbox.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|PU4P216MB2098:EE_
x-ms-office365-filtering-correlation-id: 5798b3ab-0c1f-41c1-76bd-08de0c68b97c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z2ZzZVhzL1hyZHlkSDRsNG1IUjRMdXRRSkJRRklPajVIZE9rbG5GMUhISnVC?=
 =?utf-8?B?UE56VGExdkNiNjhSeTRnRTlqYStXdDk3a1NLN0ZleG1UNEt2bW1mbEtRTkxH?=
 =?utf-8?B?MStvTUs5R2lVcTYxbmpaeVZBYko3VWlKdm9xd1RhdUIvUTFhL0JLaSt3VlNU?=
 =?utf-8?B?aEdjS2ZQSjVNN2tZd3hIZDEwd2pqRU1CQi9hUXBkWFhiSmEzbTE4eGlWSkw2?=
 =?utf-8?B?T2pTOEtBcnFXem5lSUVWY2dlQ1RKU1Z3YWZqWGdCSHhjNzViWHBTYjlYaUlV?=
 =?utf-8?B?K2lyODNqM0VBYnY1TWNBSmpFNUR3Tkp0Y1BxS1VUWXlHSWpMbm5vVEk2cksx?=
 =?utf-8?B?QWhXS0YyNk9HVENqZXQ3NGdNN2RvaHNQck9vaVlmS0kraCtCeTFzUmNpNDQ1?=
 =?utf-8?B?N3dPeW9Xcm9lK3N1Q2hQalFHYUU0YndZbGQ0QStrS2VTMXY5cGV1V2RYb0k4?=
 =?utf-8?B?akJrMUFGbnBwZTVQYjg3WlFFc2h1Y0xUejg3MjJiZ0dRZjRFS3FWdDhCRC9o?=
 =?utf-8?B?cjREbnZIRHltS0R5TVVDYXB5RTBvc3Rna083YlNNRnJLT1pJUGtoREdqSlpF?=
 =?utf-8?B?V0dEZHhEN084R252M0hPVkpEc3NrSTkxTUlkc2NIcEhaeFlzZVllU2VINXdQ?=
 =?utf-8?B?Yzhyek5Jc3Qzc3p6RE00TWNldmJiMHAxdFVQSTdMYWpvQ29id1VLdHFEaUlK?=
 =?utf-8?B?eXVnajlOY0dTQzB6QnpRcTN1alJXdVhGa2xjVTVsRC9DcEtJbVNmRllhT0NT?=
 =?utf-8?B?b1FPbllvVS9HVGtGRjBMVWZoNnlyK3RvUjNSV1ZjWFBpMmR3ei8vb2Vnd0pY?=
 =?utf-8?B?Ymk2dkpnVlp4djIzd1dyaDNBVFp5dlhweTRsVkc4ditpbk1xOFFxOWFLUS83?=
 =?utf-8?B?c3hzbEdON3E1QUFhTitnaXI0N0lwRUNuYmxJRTFzWlNZTGpLZ3NnN2xDT3Ru?=
 =?utf-8?B?SXBMaURYUnVOQldxcDM1Vk1hVlo0ZzFLcnFEdnp5Q0lwZHFlMUhNU2xyV0RH?=
 =?utf-8?B?aUVIVVRNakNBZWRNSkliMHliWWZhZkZwblFrd0ViOUlIdGdZWGlYZ1ZsOXhy?=
 =?utf-8?B?Q0hNdWFqMnZjNmlKZWNaejVxZmlycnBWYzFHc3U5UEMwMEFYdDNlbVZjSDdh?=
 =?utf-8?B?SkpvSHhrM3lBWHZXQ2lGZDRyVGxPYVRwQkJtM0lkeEh5RUtuaGpRYWJUeHpt?=
 =?utf-8?B?S1A2Zk0rNTlsSHg0RTVRRGc3K3FrYlN5L05UT2xkQlppSERpa3NnYVJMY0Rz?=
 =?utf-8?B?cUxia2FIelM0ZkNSVVNyZWJaZXBzMXh2YlRIbmVVdnN2OGNjSy9WQmZYeExI?=
 =?utf-8?B?Q3QyZ3pmQkZUamd4K1BkZ2w1TWp0U1pqeUhEU2xlRWY2RXFYemxjRTRBQm9K?=
 =?utf-8?B?RnN4eEh1czlWNG1lWmRtbXpBMFc4cnh4YldTcHZSWmZKZ2gyL2M5YWY5NTFm?=
 =?utf-8?B?RzYyZmsra2Q3eXdpeFRrL2tWVGN2TzhqNUVlUmFWVllVUUJQaUhabEEwZXZR?=
 =?utf-8?B?cEE5L01RSWo3c2h3c0dHQmV4YW8wMGNWQkdvQys2STk5VXpzVWowVTROWXdB?=
 =?utf-8?B?WGVpTGcrWnZ4NjlkRXk5QWU2VTM3UStFazdFVjF6MmFJZXlNeERFeXh1ZDdZ?=
 =?utf-8?B?VEMzbVhzRy9WcVB6cEdYUDlraktPNGZtWElTM2FMaUdnZm1CWVJqWXpNT3BI?=
 =?utf-8?B?cVpoZ1RLenRvdGhtQVljczhybjF4MUNwYlRuTitxSGZUUlRTdUl4RU9jamFT?=
 =?utf-8?B?cW1BUXpyVWRIdGRXMjBaNU45QjYyVW1XVk1KY2pBenJxb3ZaVTk3amR5cmFy?=
 =?utf-8?B?R2J3cXhOclZIczFpQ0w2V01mZlA5UkRXY3V1bW15NTkxcGl3NXpJUTZLbTVG?=
 =?utf-8?B?bmswVEVKVTZYV1NXVW1XZGdEOEJYWUt2S21mSHIvM2tFM1pXSm9Kb2h0YUpR?=
 =?utf-8?B?UnFCVFRMcGFyKzVmY3l0TFlXZ29aVEtmMk1vU2ZTTFBpejA3N1UzY2MxNkE1?=
 =?utf-8?B?eHJncWNtSGRWaGVPTnYydklEVS82bk5PZkdDblJESzZPNDBXcGM0cTFRVTR3?=
 =?utf-8?Q?47zH6N?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3FLZXJhZWFvK2Fta29Sc2czNmJQTERUdlFXalVtSTVsR2l0aXJiaEVXWE9o?=
 =?utf-8?B?OENTdHMxWVhEaTFDbjNxeHZGQmo5cGs0bmdhVC8rSDZCNDVUMmpHNEo0UzZE?=
 =?utf-8?B?UGd3ejRTbFFlZnFHNS9YSVo5MnM1TlFwYmNYL2ZXU3FJa1lPcFFIcldFYVhL?=
 =?utf-8?B?c1Vnd0JLNjdJSkNpTmlFQUNxMnhTRVB3UElNQ1JBbnJ4YS9sVytXMHM3eDBz?=
 =?utf-8?B?aDhMNlp6QWJmQ2liTmduMk1zOHNKRHVtTzhiTE5DVi83eHZ5S0w1L1JGd0RN?=
 =?utf-8?B?RUhoVVQ1MWMyMThtMXR2MUk2c1g3b2l4UGEzMVAyK3dLNG9WNTA3cUIvZGRP?=
 =?utf-8?B?ZnJCUWJSREVwc3hiOGNNS1pvdWp6dkhBZjJLVnJXQWpUUXRFSGtyYVJycnN2?=
 =?utf-8?B?dkIrOVJrUzh0WVRwRGFweFFOL0ZzV3lEVnpScHUraEJnbXdNRkFneDN6QXQ4?=
 =?utf-8?B?TFJQeWREcEpiNFREUVp1dHZzVTJsZVBvN3IvaHVmTGVTaW5uajFVVVNFU2tF?=
 =?utf-8?B?aUwxSkpVR3dTNU55VUpUS2t2dWUrUFp1Z2pSRUJtaTY5K0x5TWswbEhtanFN?=
 =?utf-8?B?L1Y1OXNER0hmZEp6dkc2MWM2NjkrRXRmemhvUFZYTStsTnNhd1ZDN2gySU9M?=
 =?utf-8?B?VUlUQSs3RlZYQWJ0NGlQdVpVR3QyUWtXVFFVdXcreVJ4U2FiaEoxUTJFNldV?=
 =?utf-8?B?Q1ZUbytqS29ic0d2MjcrRnQwbVJpekJGeVVsL3YyTWwrK09qcFRVYis2SlI3?=
 =?utf-8?B?VTBmSFM4UGI2S2xaV3pWMG1RUHYvZ29LWGUrV1FrbWhMQkpKbUNabU5Cam5M?=
 =?utf-8?B?YURQendxbEVhbGtWYjhJNy9JVnJYRnRrOFJpeFZhemVPRkpoeDc1ZWIzMGtz?=
 =?utf-8?B?YmxjMGYvcXM1Z0J6ZkJjaG52Z0FFenlObmptSzd6N3diWTFXVFZPUmZ4czZl?=
 =?utf-8?B?Z0gybUpubzh1UmU1cURIUXMrOGluNFdhMmx0OSt5eC9IUlFlOXF4ck1IbFlt?=
 =?utf-8?B?VjlQVEJ6RktrQUZVMXMwSHh0REtEU3I4YTVaVWNOd01mVTRKUjkzVGpta0pu?=
 =?utf-8?B?QTB3TUwwTnprYXE5c1lKZHBVKzRIVGJSTk9BbStmRnZTdTd0akJ1Yjk5bis0?=
 =?utf-8?B?NnluWVJES09mbC9zSTRYd1FiaWZub3IyZTNEWFl2U2JEY244OHNJVkJsUVE1?=
 =?utf-8?B?RCtpditGVlJNMlptRk1DWEZ4dzFJKzE1NldQQTNncGFlK2tFZGIwWktkSVZG?=
 =?utf-8?B?VGpMMGh3b1l3bW1zUUoySXNxK3BPMS9BVlpnRlB0WitvSXk0RE9jeGcxbWpG?=
 =?utf-8?B?SGRQc2ZodjhJeFMyTlpMWi8vcHhDTm5CZGVyeEtZYW1nY2VGVU5FSWptZFpT?=
 =?utf-8?B?Q1I1WlNnL2ltb2FOeUMvWm12ZjZYYmtFallTQW52cXpUKzdHcXB6LzhJdG5F?=
 =?utf-8?B?eWJJcms1K0VteW5HejRncUFHdzNpbGp5QllUMVJMRWlPNDlmTnlOUlV6M0Uw?=
 =?utf-8?B?MktNTzMxK2o4TFBacmNaK2lYMC9HVzkwa2x5ZFg1YXpza1BoaHFpVVdjc2Fa?=
 =?utf-8?B?QTVDQkVZM3JQVXRRbUxNbjhwaFh3WEk1cWlMczRnMkQxYWNUZElvRDRwTFJ2?=
 =?utf-8?B?SDcrUHMvUnAyRDNDYnloMm1CSVdPUTBFU0VhbG1FNXJVU0oxS2FiMStzS3dp?=
 =?utf-8?B?SGh2aGUreDMxLzMweXVJL24zbmlMWDlvbk1VMDhoWHcwMHV1cis1ZVBqclZw?=
 =?utf-8?B?ZlQyVC94a0FwcjE4c3dlU1pscVVjWTJaTzlTYlJkcW1DQm1BWldwU2l1K0xU?=
 =?utf-8?B?TmFGUVd0ZUFsNld4ME9QM29hQ2FWR0lzamwrODlqZFZoUWlEdklxRUgvRG1i?=
 =?utf-8?B?Zm0yRDFVVFBhU1V0dWE1NWQ1Z25pcFpna2cwYkpzbmhFWWdQUDZYTUVnbXc0?=
 =?utf-8?B?K0dZWkVmWGtNZFdCODdMWm8vWk9EUTJpdzJaNGhMaEY4SkFobll4SFpKbTJy?=
 =?utf-8?B?RjQxcWZjTlZ3cVJ6bGg4RXJ3V1FaVWxsR2Y5NGkybnpETDJRbmkwV2luNzlZ?=
 =?utf-8?B?UVpLNEdkYUNrMWtCYld4WlZaSnMrNlI4UXc0YTZmQ05lbk85aFR2NHpwMFdl?=
 =?utf-8?Q?XVgavW12EB8yRW3Hw7U45W7hI?=
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
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5798b3ab-0c1f-41c1-76bd-08de0c68b97c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 04:01:46.1118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /EbwoyVQyroZTfjoP/y29d3wv42hGA80KM5P476bagEuqYsBgRSrGyHFvY9oNi9iwWdsvU9gdgg7BJ2f4Mr6+xPOg0ZNJehxZ+KCUgKFLek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2098

SGksIE1hcmVrLg0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBNYXJlayBW
YXN1dCA8bWFyZWsudmFzdXRAbWFpbGJveC5vcmc+DQo+U2VudDogV2VkbmVzZGF5LCBPY3RvYmVy
IDE1LCAyMDI1IDc6MjQgUE0NCj5UbzogTmFzIENodW5nIDxuYXMuY2h1bmdAY2hpcHNubWVkaWEu
Y29tPjsgTWluZyBRaWFuIDxtaW5nLnFpYW5AbnhwLmNvbT47DQo+Tmljb2xhcyBEdWZyZXNuZSA8
bmljb2xhc0BuZHVmcmVzbmUuY2E+OyBtY2hlaGFiQGtlcm5lbC5vcmc7DQo+aHZlcmt1aWxAeHM0
YWxsLm5sOyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsNCj5jb25vcitkdEBr
ZXJuZWwub3JnDQo+Q2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPmtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4
LWlteCA8bGludXgtaW14QG54cC5jb20+OyBqYWNrc29uLmxlZQ0KPjxqYWNrc29uLmxlZUBjaGlw
c25tZWRpYS5jb20+OyBsYWZsZXkua2ltIDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT4NCj5T
dWJqZWN0OiBSZTogW0VYVF0gUmU6IFtQQVRDSCB2MiAwLzhdIEFkZCBzdXBwb3J0IGZvciBXYXZl
NiB2aWRlbyBjb2RlYw0KPmRyaXZlcg0KPg0KPk9uIDEwLzE1LzI1IDc6MTEgQU0sIE5hcyBDaHVu
ZyB3cm90ZToNCj4NCj5IZWxsbyBOYXMsDQo+DQo+Pj4+IFdvdWxkIHlvdSBwbGVhc2Ugc2hhcmUg
dGhlIHN0cmVhbSB0byBtZT8gSSB3YW50IHRvIHRlc3QgdGhpcw0KPnJlc29sdXRpb24tDQo+Pj4g
Y2hhbmdlIGNhc2UgdG9vLg0KPj4+IEhvdyBjYW4gd2UgcHJvY2VlZCB3aXRoIHRoZSB3YXZlNiBk
cml2ZXIgdXBzdHJlYW1pbmcgPw0KPj4NCj4+IFBhdGNoIHYzIHdhcyBwb3N0ZWQgYmVmb3JlIHlv
dSByZXBsaWVkIHRvIHYyLiBJIHBsYW4gdG8gcG9zdCB2NA0KPj4gc2hvcnRseSBhbmQgd2lsbCBp
bmNsdWRlIHlvdXIgVGVzdGVkLWJ5IHRhZy4NCj4NCj5DYW4geW91IHBsZWFzZSBwdXQgbWUgb24g
Q0Mgd2l0aCB0aGlzIGVtYWlsIGFkZHJlc3MgPw0KDQpTdXJlLCBJ4oCZbGwgYWRkIHlvdSB0byBD
QyBvbiBmdXR1cmUgcmV2aXNpb25zLg0KDQpUaGFua3MuDQpOYXMuDQoNCj4NCj5UaGFuayB5b3Ug
IQ0KPg0KPi0tDQo+QmVzdCByZWdhcmRzLA0KPk1hcmVrIFZhc3V0DQo=

