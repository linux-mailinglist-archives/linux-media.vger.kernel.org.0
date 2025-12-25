Return-Path: <linux-media+bounces-49525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F089CDD6F4
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 08:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D1A43021E61
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 07:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012002F5A08;
	Thu, 25 Dec 2025 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Gcx1Jqht";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rWAeQrH3"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE9D2F546D;
	Thu, 25 Dec 2025 07:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766647838; cv=fail; b=QtD1lCw380I8Ip97Jm6P8u9KFPqCeCebUNlSqYXm3Z5euy0sLn/RckJGiN8H2NEE7echkK1Vow+E/ymP1F0ZACOyPiE93w7LbbwGsCsfYNuWU3QkZ8EH5eUeYHarMQDUsckbpnb5FY5JyjrclMTVM0yqHaiYD1tHxnnY7bSxGJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766647838; c=relaxed/simple;
	bh=3+MUQxZoBh2NFua4vgFkkMQETCiqcoPTBsZ4efqunp8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hY5yUfV7tqB54d/9H6KQ2qfiYSsknWVClt1mYsfiN3LwQa198KvkFxyOuQ7gIkUlNrPZyw/OARXTCOd4SzsqEWugQcgXTp7wrNLCTpBp8OGRYnqq0OSvKPr+dwwvC7MAgKT8JxPp5nvH9hevGWjKn1EWu1fHm09lGsRMEQfLc0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Gcx1Jqht; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=rWAeQrH3; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 961132d0e16311f0b33aeb1e7f16c2b6-20251225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3+MUQxZoBh2NFua4vgFkkMQETCiqcoPTBsZ4efqunp8=;
	b=Gcx1JqhtmL2PUR2FEBH4F9Y6niBOP5mWR97hzaOEEnugm31nk3BKqqj7b0gb2fGUOhao6H3fNBZRHc3JdUioHQAkBF/EQgKx8pOD5V28fcDlzzFOYZa2vY4b1+Jov9TvW3HoqxVrUFwVkdDTu4jJpv0eYegnlkgNMLtk6cn/Io0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:40cb24f6-57ec-4357-ac62-92b777e28761,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:a4712603-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 961132d0e16311f0b33aeb1e7f16c2b6-20251225
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 187817014; Thu, 25 Dec 2025 15:30:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 25 Dec 2025 15:30:27 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 25 Dec 2025 15:30:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMD0Rv4xc6onZvBwivyDkHtc+hcrvylXZLkcDeD7Xu/iMP8sUZlv7lyoTUINrrISZJsnmP9qRIhzlzJfNTL/EMsi0Uebr54s7k8yd381uSpa+hVYV0CQYVGlM8j+ZDUgGm2yFfA8VloyiSdxJq10PDd3QyhrBSb4kAGs3E/y7UYFo+bTlQ0IBVbSoaIJsgVGgtafT274KG/21+pop4kZvgp4WicQNTZxf5xYhJm6WSPHPJorG6VH7+rs9Oll9kmRhTs3AASwuG31gPAS5rGfCSiieGCrc3Njrly/amoERop1fa2Osk+lorynWG45tjM3J6/UYWq5U2jgDnompKiLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+MUQxZoBh2NFua4vgFkkMQETCiqcoPTBsZ4efqunp8=;
 b=R1E2bKCkNQNqabTPZ+fYnqnOvHRJpmwRSYVRp63ZgGvVe2JqNmcqxpEW3GMBkmVeuBC4OP2hxNsV57D05O2TWXuuSGv5VPEWcI3aszjZD95k+vZUsclh5rmw2FBqjBhI6F3+0JacS5Xyq6Yg18EDE6CxBV5VHOUSd3SIlqWEVi3bDhVKRgRYeNYPOELjVq8js/+wQMvDA54pSpaV4egh8BjJU01PFdDFb4OG1+XvuhTxcgEnqa+bEX8p2v2z6e2f8CKKqPMH8OyLKgbKqU09g/DSfdbanm0PKSGJxaAbRqyjjDt32Pvu6SrzrA4kl6GYkii2z/PITDgKUxpIhRZH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+MUQxZoBh2NFua4vgFkkMQETCiqcoPTBsZ4efqunp8=;
 b=rWAeQrH3iSRwDnDWGh6z2e+HvfbZCJIaIFv0qxW+jc59ZsKW0hzU/s7EH0Ek/YH3SNOPoaxnM5EncrUeOiOnqfSK8iO2dmSGkNUTzo000ZoOktzA4XY4nqMe9/wUxDjN6L5BK0yu/FFENkMqEMXfpmZyrDAP3O1BsXMjKfLJ2OI=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB6721.apcprd03.prod.outlook.com (2603:1096:101:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 07:30:23 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9434.009; Thu, 25 Dec 2025
 07:30:23 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>, "andrzejtp2010@gmail.com"
	<andrzejtp2010@gmail.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, =?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?=
	<Yilong.Zhou@mediatek.com>
Subject: Re: [PATCH v6 06/10] media: mediatek: vcodec: Add 4K prob size
 supporting for VP9 decoder
Thread-Topic: [PATCH v6 06/10] media: mediatek: vcodec: Add 4K prob size
 supporting for VP9 decoder
Thread-Index: AQHcY18PRxrvUS/R9EGiUuq4X/VdNbUc85KAgBUmVwA=
Date: Thu, 25 Dec 2025 07:30:23 +0000
Message-ID: <61ce327121b89ebbf271c72d674f8fb4d164dded.camel@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
	 <20251202074038.3173-7-kyrie.wu@mediatek.com>
	 <898905035315552215b13402d29e2eeb1350c74c.camel@collabora.com>
In-Reply-To: <898905035315552215b13402d29e2eeb1350c74c.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB6721:EE_
x-ms-office365-filtering-correlation-id: b4df2785-4b17-4987-4b0a-08de4387775d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZGZZTXgxeWpjMktwYXpjbVJrRVFrQnBMSVV1TzNCb2VHYXZDd0tYZmtENllS?=
 =?utf-8?B?d05ZR2IyNkdnMjhvL3NQMWxrVHM0Z01SeVlLcFBLR0F2eDlQb0Fmb0dMMTUz?=
 =?utf-8?B?VC9pUDIzZzIvN2FlOFAzTk8yOEZzamZoVU9jbyttYityTFBxQktsWWtNbmRt?=
 =?utf-8?B?UFVuZnpqZVhocTNrQkNSVVVTOFlWckNuWVZzNlp5UklLaldxWjNlTUs3bkU0?=
 =?utf-8?B?TXlyUk1pWlM3eHhVRnJQdnJqRlZZRUFid3NUeHBUN0NvdHV3Nk5jYWU3bm5O?=
 =?utf-8?B?L1dWT1dqbkNxaWpGRzkwbmpFbElXN1lRb0MyRDJpdW00KzIwT2JnY0V0RHFV?=
 =?utf-8?B?UjhBak9MMWRtTEVZS3YvVzBGOXRYdm40aEVLSjVmNVlhaUVRSnZaTHVMQjhR?=
 =?utf-8?B?OWJmTW5XUVR6Mkd0QjhsejZQSVc4dkFTN0pMejZwZ0F5MjNJNGdxYU1wYU00?=
 =?utf-8?B?bUdQQzRBNzVOWlVqcEQ0UHZmNXQ3VHhGaXdNTk5Yc3p0UVpubjBGNXdROWtk?=
 =?utf-8?B?S2ZlaXlNZHlNRm9KclpIK0p2UzVPUjJpYmpZUThoaHE0U21wZitiSmUycXVY?=
 =?utf-8?B?MVUzbWxlWEJVeFo2RStPdHFKd2N3d081Qi9JaHhydVc1N1NHMHJ6bjR4U0Fu?=
 =?utf-8?B?a3lKQ21qaTVNYlRFendQTHRnTmdwc1YxL0hBdjVKK2ZveG9HQmx3ai9GWWF1?=
 =?utf-8?B?UitoaTZsb1FaVEJYOFRVUGZlZmkxRVc3YlNCSUZqdDFRcURKc1hqVllFc1Z0?=
 =?utf-8?B?WFZKdWdXYjMxSHdpeENZMGpWb2JNQXg0REZjeGZlQU9kZ29Qc2ZQY0xPZWFE?=
 =?utf-8?B?TnZBa3dFNHNyWkc5THA1TG9kMktldFd1bXM3d2RPSzZHSGlZMzd4QXNmVmcz?=
 =?utf-8?B?T28vMFduemo1WjVacGN3bG5ibXRmTmZ2bmtGQjJkRkFyY21RWkZsU3p3VFND?=
 =?utf-8?B?MWd6SDdKRm9jNU1ScFdEaWZ3L2t1c0F6TGZVY0UxRGFaV1BRSkgyYm1DeCti?=
 =?utf-8?B?OWM5SFlHZ1hLd2ZzdGRwN0p6Y0x1UUlxWlVYYVVxQTdKWHJGSCtXNUVSZGQ5?=
 =?utf-8?B?VVFvTmJZL28wWjliOExSZWE3Q01kWWpMaXhkaFhWYW1WMVFrWTFwZXEzM2lr?=
 =?utf-8?B?MkNJS3R5SHUyUXhDL3p2RW0zY2tkdmd4RVFueDdNYWtNWDBlSmpSS2huS2Ev?=
 =?utf-8?B?TXQxY05jb1k2eFFmdDRSMFhZVUFUYkhvRmRlNWZ3cEQ3MXRDek9pSG8zRFVo?=
 =?utf-8?B?QXZwN282SUNSSU9Qbml0WG0yaUtjcGZ6ZFZGRkgrc0VNT2xNU3FRek10cFd6?=
 =?utf-8?B?SU5nM3RXU1lHdjBlaENWMFFaTHpBSS84Q1Vscm9WdTRoRWtGWmdvNHFZWk9i?=
 =?utf-8?B?aDNZRWxBRkNXaGRyQ1ZoZURGTy9STU5mYUl3WkRZWG5TN1FTQlc2TnJubysr?=
 =?utf-8?B?ekRnOXNKRUZhWG5SeUhIQklnY0ZDcTNPeXBBd01EcUxqM3lkUGxBQ0o0UW13?=
 =?utf-8?B?VUFQY2lhYjFMN2M2dWYySWIvZ05xNkJBeEZNN2FKMlZaMXVFSW9kR3EzY2h0?=
 =?utf-8?B?TGlLbDcwdUp4QllzU0pFNUhrRTBKbGtTSW1pc3FYS3I4Wmx5V2xjUUl1dGlX?=
 =?utf-8?B?NEg1bk55S0Y3MlhqSlNSUER1TWtoSkxKOFYyQ0ZRaVBVQ0w0bUJrc2R1Q3BC?=
 =?utf-8?B?OHUxQlArdXk3OGU4OTdmWHgyU240WVN4NTIyRUNqWTIxbXpYRW85YkNzWVh3?=
 =?utf-8?B?VUZsaHFUbWFIOFBNZk9oaVBJYS94bnV3SytibHVQVFFvY1FwUkdRRkI2VTU1?=
 =?utf-8?B?bWM0NzRDK2hLTHdWNFB4QmVzZGVjcFVlRC9SMlhqcjNzUVJQQzBDeFovYm5o?=
 =?utf-8?B?TTJkKzA2VktMWVFsUUFQN1J3d0NpZHRDbVlEa29aMlN2SlFiTU5nZlBLMHVm?=
 =?utf-8?B?OTZKbWRKT0NOL1FnV0xtdHZrYmthY1hiVzdzNmU1b1hvSnloTzJTdTlFcnB2?=
 =?utf-8?B?RElKZjM2WXA0bHV5UUxyUWN6ejEzK1JmcGx6TER3dlN0SFFXcGMrWXZUOGtv?=
 =?utf-8?B?RW5keXJaZjRNSkpMSFZTWUtWL05TVzJaemoyZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2VPK2dqUFZxTlF3dGpTd1ZFQ1k5aW15OGJ1ZjRoa1hTejBUbnhlWlpXbDM5?=
 =?utf-8?B?WnZYWG9VV241VFN0UkJ4RHVkU2hHYVo4VmNnWXAxNDM5THdSM0ZEUEx3Z2cz?=
 =?utf-8?B?N05lTTV3cStpYTYrZFlKR2RNNXBlTmxEN2VUcDBDREUrWHpvai8rM1ZkamRN?=
 =?utf-8?B?aFVhcUhhak45TjhIUitvUUV2NGdjUlJ0T3Y4OGoxbHVpUzF6V1RVUTc2Tnpm?=
 =?utf-8?B?b3hVYzRLZCsrQ1NHK3ByRXlMU054dXI5QmJwaFVtN0NGWVdpaDFNQjc5QTdY?=
 =?utf-8?B?UUw2d3BaMUtnVVI5OFVZMEIyYUFMbEVkbUVVczFSb2NNVGYraVZwRmRmMk9w?=
 =?utf-8?B?N2tZRVdpbU9SaUx6cmpzOFJwSmFoL2VmbDIzcjhhaW82aWVYaFpEbHV0M2xP?=
 =?utf-8?B?NEJsdmdNbnIwZm5kNW9XRnBtTzN0N0VZRGlxcklnQzZ3NytNOGhaMzMrZHAv?=
 =?utf-8?B?UlZOVUpNR3QzUUxoaHJBcWpWUDhlWVoxa2haWWZhUjg2b1lrUmtQa0pZM0Z0?=
 =?utf-8?B?eGVKSVBaYUg4L1daS2d4R2hxTjVPOE9tdHB6UUhPbEpCejBiR2pPSnpJeFRD?=
 =?utf-8?B?WHFObzRsRW1jdTFXNGdpQ0pBdG5jVlRlbGxZSzFUOEZFYU5ISFVITUFzQXRn?=
 =?utf-8?B?aGI1eE55U2ZwS0xUMlRzMzRCQnVJSUJUcnVZWGtoNmJMbGx6NUlLdHhJSnl4?=
 =?utf-8?B?MFoyZWlQNWpvVVN1M085cDRIejczNzVIaGg3KzdhNzZ1dy9OMHFBTnNYQWJm?=
 =?utf-8?B?YjVBdnhsMHNtMGUxeUh0M1YrdEZRQkdVTHVMaERSNmd2dFhZRnVwaDBDUWFq?=
 =?utf-8?B?dmozMDUzd2VzUEpXSTlqQ0xUMHprQ3pyc2RUTmlGalByY1dtOWRGQXZ2MWdh?=
 =?utf-8?B?S0pqd21rMW5od1VPZjU2S28wMFB0eE5ISGFUQms2WlRCYmhoZmxSMWhKOGYx?=
 =?utf-8?B?TlE3SFhQdjlodEdZQlhRQmtjSFBiVXdCK2M3Qm52b240TWpYdW9oUGl5VEFS?=
 =?utf-8?B?NTFXWDRvQ0M5QkhlWnMzUnhWNVM5amJnTTJueFc1OUc5d0tmNG92Z2dlY09O?=
 =?utf-8?B?TUFYYm0za0VoRXN1a2xuZ3c2Nk5BQjYxUG1KZUtjalRnc2xLcitRSVhYTGZ6?=
 =?utf-8?B?R1MxUlJWSlBMak8wYXBDT0xxS1pvYzVubkZrQThzZ21KSTdhaHhicVBvc1Ey?=
 =?utf-8?B?aEFYKyt4VUhCQTZ5cXoydEhxRWVPN09ib3BlbG9wVDJRVCtRMmt2NnIyLzFs?=
 =?utf-8?B?WVZ0K2RvY0V3VGhPaTFQOUhnZXhMQlJMbEtLUkZBSkdUQ1NlR2FqOEFUYTM3?=
 =?utf-8?B?Y2QvOE1uUHYzZzA5TW0rU0h5ZTJKaFdqdkl2VktRWGhQeTJUY3pKalV2MUwz?=
 =?utf-8?B?M3poQUtOMUVBOTlueUtrYnBwWHAxeWpSb01FYm5Vd0tCWWJPSDBMeVY0azRH?=
 =?utf-8?B?TmVlTXRiWXJkb0o4UjlaemFGckpSb1ZzeXF3Wm1KS3lscHowa2daUktTNi9U?=
 =?utf-8?B?YVNKRWJVMkVwOTh6UFlIN211NTJRQW1FaXM4RHQzMDVyK3F5UUFSR0xBUGdY?=
 =?utf-8?B?VjgvbHRwQVpnVVREZ3A3U1E0L0VXSk5LSjhQSHFNVVE3N3hMWHZpUjhYR1FK?=
 =?utf-8?B?cDlDZmpSdEFPMlk2M3pNdi9vcHRlM3k2eDVRdjNuMEtlMzlkcVFLNkRXSnBk?=
 =?utf-8?B?Zk5IcVdpZm4vVFBoV3pra1ltWjNUZEVaUlVGMnlzNHoxZEp0Q2MyMSsyZEtO?=
 =?utf-8?B?YllQSjhNcUs4bEV6djR3YXh3cHFHMHMrQldONDZxQUZMN3J3SFYvaktYbW4z?=
 =?utf-8?B?NFNVVXdnbkFJcUJUb1NGUmJzajhjTHY3aDZxaFc3aFJhUGN5MWJCQk92S1JS?=
 =?utf-8?B?cWFTSkkvMHBlSElLdTNRUEgvQkVTeEFjV2xuUGt6WnZnWmp6Vk5PcWJLZDNC?=
 =?utf-8?B?dDVGanIvZENWU3NnMEhwQ2NjdlUxRVBrSmxNMHFCQm1YS3lqVVYrYUJFSTVS?=
 =?utf-8?B?SGJJdGxncE5XejA3bE00V2Y2NU0vdkZKcFpRNjFpMFlxMi80YkVFZVFoNW5M?=
 =?utf-8?B?Zk9BbGhOdXhZQkVLbHR5eXNwLzdDYkRMWlJKRnhhYnB5bEhVVjB2VzlVTWN2?=
 =?utf-8?B?QXZwbEJuQlJzMmRrMlJUVm1XcU9rMlJzYlpGUGxqa1Q4UldzMTBOYVo3aS8y?=
 =?utf-8?B?NUo2WVJNSFF0Z0t5MENUQWMrTVBDa1I0ZUhnTkFDeVRibnRSMSt2UkJSeUtv?=
 =?utf-8?B?WDY1SjVSR3A1K1VuOVNzZVdXV1l2aWJyeERyTTJlQXlOL1NmZUhwZjFMMkFQ?=
 =?utf-8?B?bG84SjczbmRsZy95bGRzL1hscEorZjBJOGNTcE1lN2xPZlVHOCtyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B7AE8D6C05F9748857F811D4C50A927@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4df2785-4b17-4987-4b0a-08de4387775d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 07:30:23.5420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iH/0aemPmZE0rDkb9WuL6fSCPgVkbhlpw+N4Nj0YLpC17AZquWr0PsTX6ZnJNirJkhsxKmD3ghd8Bnsuk6xWng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6721

T24gVGh1LCAyMDI1LTEyLTExIGF0IDE1OjMxIC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIG1hcmRpIDAyIGTDqWNlbWJyZSAyMDI1IMOgIDE1OjQwICswODAw
LCBLeXJpZSBXdSBhIMOpY3JpdCA6DQo+ID4gRnJvbTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlh
dGVrLmNvcnAtcGFydG5lci5nb29nbGUuY29tPg0KPiANCj4gSSBkb24ndCB0aGluayB5b3UgbWVh
bnQgdG8gY29tbWl0IHdpdGggeW91ciBHb29nbGUgcGFydG5lciBlbWFpbCA/DQo+IA0KPiA+IA0K
PiA+IGFkZCBjb25maWcgdG8gc3VwcG9ydCBwcm9iIHNpemUgYm90aCAzODQwIGFuZCAyNTYwLg0K
PiANCj4gUHJvYiBtZWFuIHByb2JhYmlsaXR5ID8gQ29tbWl0IG1lc3NhZ2UgaXMgdGhlIHBsYWNl
IHRvIHlvdSBmdWxsDQo+IHdvcmRzLiBDYW4geW91DQo+IGV4dGVuZCB3aHkgdGhlIGRpZmZlcmVu
Y2UsIGFuZCB1c2UgZGVmaW5lcyBpbnN0ZWFkIG9mIG1hZ2ljIG51bWJlcj8NCj4gDQo+ID4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvcnAtcGFydG5l
ci5nb29nbGUuY29tPg0KPiANCj4gT3IgZXZlbiBzaWduIGl0ID8NCj4gDQo+IE5pY29sYXMNCj4g
DQpEZWFyIE5pY29sYXMsDQoNClNvcnJ5IGZvciB0aGlzIG1pc3Rha2UsIEkgd2lsbCBmaXggaXQu
IFRoYW5rcy4NCg0KUmVnYXJkcywNCkt5cmllLg0KPiA+IC0tLQ0KPiA+ICAuLi4vcGxhdGZvcm0v
bWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2LmggIHwgMiArKw0KPiA+
ICAuLi4vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhdGVmdWwuYyAg
ICAgIHwgMSArDQo+ID4gIC4uLi9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2Rl
Y19zdGF0ZWxlc3MuYyAgICAgfCA3DQo+ID4gKysrKysrKw0KPiA+ICAuLi4vbWVkaWF0ZWsvdmNv
ZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfbGF0X2lmLmMgICAgIHwgNCArKy0NCj4gPiAt
DQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2Rydg0KPiA+IC5oDQo+ID4gYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVj
X2Rydg0KPiA+IC5oDQo+ID4gaW5kZXggYThiYWVhYjk4NDc3Li5lY2YwZDdhZDBkNTQgMTAwNjQ0
DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9k
ZWNvZGVyL210a192Y29kZWNfZGVjX2Rydg0KPiA+IC5oDQo+ID4gKysrDQo+ID4gYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2Ry
dg0KPiA+IC5oDQo+ID4gQEAgLTgwLDEwICs4MCwxMiBAQCBzdHJ1Y3QgdmRlY19waWNfaW5mbyB7
DQo+ID4gICAqIHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wYXJhbXMgLSBkZWNvZGVyIHN1cHBvcnRl
ZCBwYXJhbWV0ZXJzDQo+ID4gICAqIEBsZXZlbDogZGVjb2RlciBzdXBwb3J0ZWQgdmNvZGVjIGxl
dmVsDQo+ID4gICAqIEBwcm9maWxlOiBkZWNvZGVyIHN1cHBvcnRlZCB2Y29kZWMgcHJvZmlsZQ0K
PiA+ICsgKiBAcHJvYl9zaXplOiB2cDkgZGVjb2RlciBwcm9iIHNpemUNCj4gPiAgICovDQo+ID4g
IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wYXJhbXMgew0KPiA+ICAJczY0IGxldmVsOw0KPiA+ICAJ
czY0IHByb2ZpbGU7DQo+ID4gKwlzaXplX3QgcHJvYl9zaXplOw0KPiA+ICB9Ow0KPiA+ICANCj4g
PiAgLyoqDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19zdGENCj4gPiB0ZWZ1bC5jDQo+ID4g
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29k
ZWNfZGVjX3N0YQ0KPiA+IHRlZnVsLmMNCj4gPiBpbmRleCBhNDc5MDZiOWQ3MTcuLjk5YzI1MmUw
YTJlMSAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfc3RhDQo+ID4gdGVmdWwuYw0KPiA+ICsr
Kw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9t
dGtfdmNvZGVjX2RlY19zdGENCj4gPiB0ZWZ1bC5jDQo+ID4gQEAgLTYzMCw1ICs2MzAsNiBAQCBj
b25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGENCj4gPiBtdGtfdmRlY184MTczX3BkYXRh
ID0gew0KPiA+ICAJLnZwOV9wYXJhbXMgPSB7DQo+ID4gIAkJLmxldmVsID0gVjRMMl9NUEVHX1ZJ
REVPX1ZQOV9MRVZFTF80XzAsDQo+ID4gIAkJLnByb2ZpbGUgPSBWNEwyX01QRUdfVklERU9fVlA5
X1BST0ZJTEVfMSwNCj4gPiArCQkucHJvYl9zaXplID0gMjU2MCwNCj4gPiAgCX0sDQo+ID4gIH07
DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92
Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19zdGENCj4gPiB0ZWxlc3MuYw0KPiA+IGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2Rl
Y19zdGENCj4gPiB0ZWxlc3MuYw0KPiA+IGluZGV4IGRjM2U5YTJjY2MyYy4uZjE4YWFmZDA4Yzc2
IDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92
Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19zdGENCj4gPiB0ZWxlc3MuYw0KPiA+ICsrKw0K
PiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtf
dmNvZGVjX2RlY19zdGENCj4gPiB0ZWxlc3MuYw0KPiA+IEBAIC04NDEsNiArODQxLDcgQEAgY29u
c3Qgc3RydWN0IG10a192Y29kZWNfZGVjX3BkYXRhDQo+ID4gbXRrX3ZkZWNfODE4M19wZGF0YSA9
IHsNCj4gPiAgCS52cDlfcGFyYW1zID0gew0KPiA+ICAJCS5sZXZlbCA9IFY0TDJfTVBFR19WSURF
T19WUDlfTEVWRUxfNF8wLA0KPiA+ICAJCS5wcm9maWxlID0gVjRMMl9NUEVHX1ZJREVPX1ZQOV9Q
Uk9GSUxFXzEsDQo+ID4gKwkJLnByb2Jfc2l6ZSA9IDI1NjAsDQo+ID4gIAl9LA0KPiA+ICB9Ow0K
PiA+ICANCj4gPiBAQCAtODg5LDYgKzg5MCw3IEBAIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2Rl
Y19wZGF0YQ0KPiA+IG10a192ZGVjXzgxODhfcGRhdGEgPSB7DQo+ID4gIAkudnA5X3BhcmFtcyA9
IHsNCj4gPiAgCQkubGV2ZWwgPSBWNEwyX01QRUdfVklERU9fVlA5X0xFVkVMXzVfMSwNCj4gPiAg
CQkucHJvZmlsZSA9IFY0TDJfTVBFR19WSURFT19WUDlfUFJPRklMRV8yLA0KPiA+ICsJCS5wcm9i
X3NpemUgPSAyNTYwLA0KPiA+ICAJfSwNCj4gPiAgfTsNCj4gPiAgDQo+ID4gQEAgLTkxOSw2ICs5
MjEsNyBAQCBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGENCj4gPiBtdGtfdmRlY184
MTkyX3BkYXRhID0gew0KPiA+ICAJLnZwOV9wYXJhbXMgPSB7DQo+ID4gIAkJLmxldmVsID0gVjRM
Ml9NUEVHX1ZJREVPX1ZQOV9MRVZFTF81XzEsDQo+ID4gIAkJLnByb2ZpbGUgPSBWNEwyX01QRUdf
VklERU9fVlA5X1BST0ZJTEVfMSwNCj4gPiArCQkucHJvYl9zaXplID0gMjU2MCwNCj4gPiAgCX0s
DQo+ID4gIH07DQo+ID4gIA0KPiA+IEBAIC05NDksNiArOTUyLDcgQEAgY29uc3Qgc3RydWN0IG10
a192Y29kZWNfZGVjX3BkYXRhDQo+ID4gbXRrX3ZkZWNfODE5NV9wZGF0YSA9IHsNCj4gPiAgCS52
cDlfcGFyYW1zID0gew0KPiA+ICAJCS5sZXZlbCA9IFY0TDJfTVBFR19WSURFT19WUDlfTEVWRUxf
NV8yLA0KPiA+ICAJCS5wcm9maWxlID0gVjRMMl9NUEVHX1ZJREVPX1ZQOV9QUk9GSUxFXzIsDQo+
ID4gKwkJLnByb2Jfc2l6ZSA9IDI1NjAsDQo+ID4gIAl9LA0KPiA+ICB9Ow0KPiA+ICANCj4gPiBA
QCAtOTc5LDYgKzk4Myw3IEBAIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0YQ0KPiA+
IG10a192ZGVjXzgxOTZfcGRhdGEgPSB7DQo+ID4gIAkudnA5X3BhcmFtcyA9IHsNCj4gPiAgCQku
bGV2ZWwgPSBWNEwyX01QRUdfVklERU9fVlA5X0xFVkVMXzVfMiwNCj4gPiAgCQkucHJvZmlsZSA9
IFY0TDJfTVBFR19WSURFT19WUDlfUFJPRklMRV8yLA0KPiA+ICsJCS5wcm9iX3NpemUgPSAzODQw
LA0KPiA+ICAJfSwNCj4gPiAgfTsNCj4gPiAgDQo+ID4gQEAgLTEwMjYsNiArMTAzMSw3IEBAIGNv
bnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0YQ0KPiA+IG10a192ZGVjXzgxODZfcGRhdGEg
PQ0KPiA+IHsNCj4gPiAgCS52cDlfcGFyYW1zID0gew0KPiA+ICAJCS5sZXZlbCA9IFY0TDJfTVBF
R19WSURFT19WUDlfTEVWRUxfNF8xLA0KPiA+ICAJCS5wcm9maWxlID0gVjRMMl9NUEVHX1ZJREVP
X1ZQOV9QUk9GSUxFXzEsDQo+ID4gKwkJLnByb2Jfc2l6ZSA9IDI1NjAsDQo+ID4gIAl9LA0KPiA+
ICB9Ow0KPiA+ICANCj4gPiBAQCAtMTA1Niw1ICsxMDYyLDYgQEAgY29uc3Qgc3RydWN0IG10a192
Y29kZWNfZGVjX3BkYXRhDQo+ID4gbXRrX3ZkZWNfODE4OV9wZGF0YSA9DQo+ID4gew0KPiA+ICAJ
LnZwOV9wYXJhbXMgPSB7DQo+ID4gIAkJLmxldmVsID0gVjRMMl9NUEVHX1ZJREVPX1ZQOV9MRVZF
TF81XzIsDQo+ID4gIAkJLnByb2ZpbGUgPSBWNEwyX01QRUdfVklERU9fVlA5X1BST0ZJTEVfMiwN
Cj4gPiArCQkucHJvYl9zaXplID0gMzg0MCwNCj4gPiAgCX0sDQo+ID4gIH07DQo+ID4gZGlmZiAt
LWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rl
ci92ZGVjL3ZkZWNfdnA5X3JlcV8NCj4gPiBsYXRfaWYuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfdnA5X3JlcV8NCj4gPiBs
YXRfaWYuYw0KPiA+IGluZGV4IDk1MTNkZGRlN2M3Yy4uMzZhODdiNDU1ZDExIDEwMDY0NA0KPiA+
IC0tLQ0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rl
ci92ZGVjL3ZkZWNfdnA5X3JlcV8NCj4gPiBsYXRfaWYuYw0KPiA+ICsrKw0KPiA+IGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfdnA5X3Jl
cV8NCj4gPiBsYXRfaWYuYw0KPiA+IEBAIC0yMiw3ICsyMiw2IEBADQo+ID4gICNkZWZpbmUgVlA5
X1JFU0VUX0ZSQU1FX0NPTlRFWFRfQUxMIDMNCj4gPiAgDQo+ID4gICNkZWZpbmUgVlA5X1RJTEVf
QlVGX1NJWkUgNDA5Ng0KPiA+IC0jZGVmaW5lIFZQOV9QUk9CX0JVRl9TSVpFIDI1NjANCj4gPiAg
I2RlZmluZSBWUDlfQ09VTlRTX0JVRl9TSVpFIDE2Mzg0DQo+ID4gIA0KPiA+ICAjZGVmaW5lIEhE
Ul9GTEFHKHgpICghISgoaGRyKS0+ZmxhZ3MgJiBWNEwyX1ZQOV9GUkFNRV9GTEFHXyMjeCkpDQo+
ID4gQEAgLTU0Niw2ICs1NDUsNyBAQCBzdGF0aWMgaW50DQo+ID4gdmRlY192cDlfc2xpY2VfYWxs
b2Nfd29ya2luZ19idWZmZXIoc3RydWN0DQo+ID4gdmRlY192cDlfc2xpY2VfaW5zdGFuY2UgKmkN
Cj4gPiAgCQkJCQkgICAgICAgc3RydWN0DQo+ID4gdmRlY192cDlfc2xpY2VfdnNpDQo+ID4gKnZz
aSkNCj4gPiAgew0KPiA+ICAJc3RydWN0IG10a192Y29kZWNfZGVjX2N0eCAqY3R4ID0gaW5zdGFu
Y2UtPmN0eDsNCj4gPiArCXN0cnVjdCBtdGtfdmNvZGVjX2RlY19kZXYgKnBkZXYgPSBjdHgtPmRl
djsNCj4gPiAgCWVudW0gdmRlY192cDlfc2xpY2VfcmVzb2x1dGlvbl9sZXZlbCBsZXZlbDsNCj4g
PiAgCS8qIHN1cGVyIGJsb2NrcyAqLw0KPiA+ICAJdW5zaWduZWQgaW50IG1heF9zYl93Ow0KPiA+
IEBAIC02MTYsNyArNjE2LDcgQEAgc3RhdGljIGludA0KPiA+IHZkZWNfdnA5X3NsaWNlX2FsbG9j
X3dvcmtpbmdfYnVmZmVyKHN0cnVjdA0KPiA+IHZkZWNfdnA5X3NsaWNlX2luc3RhbmNlICppDQo+
ID4gIAl9DQo+ID4gIA0KPiA+ICAJaWYgKCFpbnN0YW5jZS0+cHJvYi52YSkgew0KPiA+IC0JCWlu
c3RhbmNlLT5wcm9iLnNpemUgPSBWUDlfUFJPQl9CVUZfU0laRTsNCj4gPiArCQlpbnN0YW5jZS0+
cHJvYi5zaXplID0gcGRldi0+dmRlY19wZGF0YS0NCj4gPiA+dnA5X3BhcmFtcy5wcm9iX3NpemU7
DQo+ID4gIAkJaWYgKG10a192Y29kZWNfbWVtX2FsbG9jKGN0eCwgJmluc3RhbmNlLT5wcm9iKSkN
Cj4gPiAgCQkJZ290byBlcnI7DQo+ID4gIAl9DQo=

