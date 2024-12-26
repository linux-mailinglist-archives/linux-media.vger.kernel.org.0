Return-Path: <linux-media+bounces-24092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4E99FC926
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 07:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCC441883469
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 06:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4216F15E5CA;
	Thu, 26 Dec 2024 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ojcefN3j";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WCKlrYEy"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520C042A87;
	Thu, 26 Dec 2024 06:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735195833; cv=fail; b=ratVKCioYDE/w5XqTrRqDrAVMoKnfj5MPLEwnE1zQTbmcgEkusTKvFaw0RHmc4lTH9i8uaSJxMfW11vgadkoFO0C3j+/ZsiX5kSkLVgi5YsI7Ap/hymCL6IyzpcWk75KGO2R6mz/LnnAShbwUbXQRVLZrXuL5gLlChZCN1Zio98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735195833; c=relaxed/simple;
	bh=LX/e5SwGIAHer7RVic/YXLQUiFNJd+yw+mliYjoK0fc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i/LHeTa+Fl8YNLcACgoFEFf5Ep/V0Ez0KVorm4MvUd03exG94mvdN9YkgLwwJT7dAulD+GJGNoWGWgHLFJYcvmiKEcVFpsIY+NxEId2IROqqpN/c4VIIS8tQ3p+Ai8P9VRBW7r8ElNaTypA8DOGdFDMQtj6upPyN9vAua1I2qp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ojcefN3j; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=WCKlrYEy; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ae7ccf00c35511ef99858b75a2457dd9-20241226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LX/e5SwGIAHer7RVic/YXLQUiFNJd+yw+mliYjoK0fc=;
	b=ojcefN3jk18OV4S/YV+/GUYL30+gOCR8hThSB9AflXSrXXXlAmaMAZm7RcJuz5D5x1LZ1we4inCpNqzZf2BuneA9FfEljmNaBWX3k1ldTc9di8RjDgEnLmsO88i2WKgIB1doGIU+OB7X5XRuBaLzSB2CysGzG+JU1t7cel+K4+4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b91e2b08-18fd-46d5-9612-48ff801bc890,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:ca1eeb36-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ae7ccf00c35511ef99858b75a2457dd9-20241226
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1894255057; Thu, 26 Dec 2024 14:50:23 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Dec 2024 14:50:22 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Dec 2024 14:50:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvVEKOH9AUxidLueOk6U0Yxmr0FKRSvw5Ongm8jloLX/b5MldlJAwv/s+GRNTE6W8LY5AaU1TfH99ZG94NMWCZOZqgA2taayMn+UXjQ4CW66ba9ezgYORN7NCBESz5XxRf1xRV3Lw2Zoi4Aq0gDIfTkq13iHl2cVmnJHmEsSrQ/LxMmkM3mMRLyU9yizB2VZokIg/9mYw/XJvkLtmWlE9840cwa0rFq8maGEg1aoFA8PXAML43IFF6ZBFOmq6GVhwrTVxlnXlM5SK6314Kz5Rr9i81UtyTgkCNLMNJnTck22cBQvCWfSbLmmHrx3U+UD6OMy93TXWcBPDSogh84Jhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX/e5SwGIAHer7RVic/YXLQUiFNJd+yw+mliYjoK0fc=;
 b=xRLjZ0PJAuA0KItw3oj198I5jY5vogzNx7259+DYsxT+UEqNR22f+JBz/haOXSMFM3v0RCF9FyqHDfN4lhEG6YROo4+qqEyZ3J4tfLoDyYbHREiZhNQiuxyA/uze5kjgU8ByhVQqwXmsTiqEFiGeRiCLhzbJgDj/5Uw7zJfcJdsfF3kmGbZEHN3ODHcr43/4O7p2irvnyt1pk0qil+7kWIwEUtxDO6fC/zF8f4GqqFOrmybKg+KXI9BNLjQuAxvF8xNxSw3zYJww/27XYOFilP/0D9LHZNIHVzg0NVSfAQZt/EQb/WjBVirOkeE51q/+c7SfY/fuC1eIooBT2a769A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX/e5SwGIAHer7RVic/YXLQUiFNJd+yw+mliYjoK0fc=;
 b=WCKlrYEyuTuGq9X7IXMf2Y5XvUwsLBzsFVqhXVTTrcPFzEc2G437HsEACTtS31yID6hqf5HvCXrsD86ooieRLis5mnw7eHSS7MQi4bg+Ng20ki+Se/bA77hpq6XNgy8obvRSPqSLXNh1Qfi/3JVgDk2w4nhLtrerFPRb/gCHbZI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7328.apcprd03.prod.outlook.com (2603:1096:101:123::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Thu, 26 Dec
 2024 06:50:20 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Thu, 26 Dec 2024
 06:50:20 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?= <Bo.Kong@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Topic: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L4F4KA
Date: Thu, 26 Dec 2024 06:50:19 +0000
Message-ID: <846d4676b106cdd6380b965cbde83d02f73f38c8.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-4-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-4-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7328:EE_
x-ms-office365-filtering-correlation-id: 1459a912-da4e-4854-f83a-08dd25799064
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dGNUelBpd1hwR1dOYnpydkpTSEtFU28xdkFPQmFtNEw1eGE0aHJCcmlBVGtC?=
 =?utf-8?B?MXN0SUFXdmNYaGlvak5IeEQwNzNNRXk0NjRqVm9JdWZ2dUVUUHpMODBpRXk5?=
 =?utf-8?B?ZjRkTGFIVHVHRmlJQ2lKcHhkbGdlSExTS1M4RXR5V251Z3l6L01ocHowQkxn?=
 =?utf-8?B?RSt6M1F1RnFwTjErMTg4eFpXYjlxeVIrMDhwYWNSOW05dENFUiszRHdsSzdj?=
 =?utf-8?B?aWFidlh4UUZNYVdNdlNsK016bkowN0gyclpmb3Y4djkwVWFMVVhuc3ZGMHV6?=
 =?utf-8?B?NmdtQ05WcktlVDBvU3lEVlIzMVUzTGd4WVA4RUFOaHkyc0V0NGVrcGhybENu?=
 =?utf-8?B?VE9JclI0SGtGOGtvOGZOUVdYMXZqRFpXbVd2ek4rd1hPU0lLSEg0eGIvT25X?=
 =?utf-8?B?ZlY2TnlIdFBUMmtWRXVkTTdVM1RCc3JybkFQUWF3U2Q0QzkvUlgvYmtDb3dl?=
 =?utf-8?B?L2FNYTFsaCsrQkttWkxmcDRibk5sN1NjTVcxQ1BaeHNpOXJ2c0R5TjIrL2JN?=
 =?utf-8?B?Yyt6ZUo1bjluUmNmNnc1WVJ3a01xNHYyYlZ6MlU0bGNXZHdCQXh0bnJlaVdP?=
 =?utf-8?B?R01RQ0VKQmJzTmE4bjZ3UzRMalVGRmJiUW9qUmVGbGsxaVVOT3FVMDl1QVJI?=
 =?utf-8?B?Ykw5RmwrUk53WXJZOGRxVWUyNmUydWVoaXhyTnRmK3pGcmZPaWRIQlBDeWNy?=
 =?utf-8?B?SE5wNEswdnRhZkNKWGhEcERydXdtNDBYMVUrRUxYclk4c3hCYU44bjl5Tk5m?=
 =?utf-8?B?LzRKMi9CclNGdEUyVklycGJOUmpyMkpCendNOHJ4Y1M0Yzk3U2Y4L3JHVmNU?=
 =?utf-8?B?cUQ4NkV1MFoxeGk4b2Vic0RhY3lwVGQwUUVKOXluTmxJYkUvcm1USXJaU1Jh?=
 =?utf-8?B?NHQwNFVFLzN3b0Y2VTYwZFp6b0FrNzkyY2VqQUVnZDhMRzdWN2tXaXFjaEN3?=
 =?utf-8?B?SmhaQUZKSXZwLzFQQVlha0JucXNQK0VnMTRqQkp5cENsZC9TVFNoY0tkQVVF?=
 =?utf-8?B?bE1YR3FwdmZ2Wm5PSE50bzJOZ0J3ZktnQm5QM2hTVFV0V214WHV3ZXYyNjlC?=
 =?utf-8?B?ZGQwa3Z2TXgyTHBwWGEzL0VBTVVDYVBZOGJZdHQyaEFDTzVJNGFIV3RLdFV3?=
 =?utf-8?B?WkQvZGJnb01ZZEFjU3o4S0ZTNGwwejdUWThyTWNpTXhYTzhBTjVFRGVJVStP?=
 =?utf-8?B?SzRpK21vWUZQdk1hZGVhUGxkZHhEakhkQk16NjI4ZjFvZjhKbGxxbkErK3Bv?=
 =?utf-8?B?YkdwMDJHRjU1ZFllcUd3WXBPeE9wSjlNVWhIZElkeEhrbVcrOFp4MDZGTy8x?=
 =?utf-8?B?ZHVOem56OFE0V211dllWTG0yS0x2Nmlod3B3ZmVMWlQxQ0I4WFJHdklvOHNE?=
 =?utf-8?B?RGkyOWtWNE5OMStJb001dm1EZ2huMVJKb1JHRTV6dHNlTU40aWVXZThUYXRl?=
 =?utf-8?B?TjYvQWhab0RpZ1d0UngxZDl1aDFmNVZrNUFmSXFmcmxZZ2ZWbjE5TFN3amtY?=
 =?utf-8?B?aG14V0FHUmpGb25Nc0ZZYktIYkFkTk9OUm9XYTc2Y0VnOCtZeFA1RTRPckZI?=
 =?utf-8?B?eUM1UnY4TTByVXNLcjFucmNyRndML2toSDNVNnlSWEg0Ykpoc2pLZVptdUdm?=
 =?utf-8?B?WG1XVTQ4Y1VYWUllRmJzc3hWVXRCL3MvYVlHVTRGcjY1TFVMaTE3YVE5Tmpn?=
 =?utf-8?B?NVI1Z2xPU3RoTysvTG5xa1cwTXFMNHBWUldSRWFudjJSc0F2MTBnamdlZ3RI?=
 =?utf-8?B?VkhaS0VReUkwVWhHNERrdFduWHRzTEg3VVMxTzlYanVCSE5Yemp0MElBblZw?=
 =?utf-8?B?TFhxa1M0TEgzaFhVaFhWRXI2eFFVL3h3OE1aZ2pydVladkRiamhLWEpBWmJ4?=
 =?utf-8?B?Q0VUQnlFRkszNEFiNXBucnBkZHFJb1FYZmZFaXpTcDl6bmZIUnhBWXZrR1FS?=
 =?utf-8?Q?0QbOert6zUMEY219DsE4fDRC6OdduA/M?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RU9LV0RTN0VtZXZMSmx6amJJaWZOcVBoMlFVeVVKN01sMUptRGJOOWx4VjRR?=
 =?utf-8?B?QVhFOWgwSmFJOFRqTUdUNWVPUndqcXdJR1ZNbnRsRDFMSjU4cDE1RzBjck4r?=
 =?utf-8?B?NVZKdTNBUXpwbUdqYkJMMGRkRDFOa3l0Q0ErUHNiNWtYMG5FbEpxQWJXVDJQ?=
 =?utf-8?B?SmlVZEFUb3BJVWRmU1ovYXpSYXM1bUY5RDhPdGgzRDZkSzBXM3F0WHVMMy9C?=
 =?utf-8?B?UkNsNjlpcTREc3hqZkdRZ2dUZ2kvcG9pRzZQanROcUpiRWVXM2svNitoZ0pj?=
 =?utf-8?B?bk9XZ0dpaTlrazB5SloyWCtSYjlBc2Q0SldRbkx6bUNUTkQ3RWg1TUxDN1d4?=
 =?utf-8?B?TUxJZC91aFVMQ05kT29VaUJldW1iT0xoclNYSXYzMzdsSE5mRmhzNk1FVjNN?=
 =?utf-8?B?RmF4VWYxN1VtRmR4T3NUaU1aR0ZGMXpJWkpTYmFZK2lpRjI0TkhoYld6Q1dK?=
 =?utf-8?B?U2hhKzhYai9lT1kwckVwV3VpSHpLR2N1OFBCc1RpSVZNa09ZTGcxaTMxZ2JP?=
 =?utf-8?B?MGhxTjZ6MFllQkMySElSSE9xRlJNNzRLMXpkY3Ryb1FkQlpnQk10Mko1OW9H?=
 =?utf-8?B?cFNpYjR4cWtvcGNMMVNleEtBWkdZRUtPNGtBekkvazdrd3laUi9tM2RVMmxq?=
 =?utf-8?B?T01XKys3MHlJUEVsYVdaQVROUk53eENLUG5XcWd6a2NjMkhEaS9sbVZTVThr?=
 =?utf-8?B?SmZWZFZvYk9NdnUxY2JRK1VYaUJrZFB3QjUyTEliK0YxSXovYjdzTXY4VWl6?=
 =?utf-8?B?OCszZzJUM3FNSWZwMU1RNXI0MHJVVk1QbUE0RUErTUxScXZsY2o1Ym9XU3I4?=
 =?utf-8?B?NEdhMGRQRm9NVk9BS203U0RqSEp6MW9maDlyNFUwL28wcW02dlFCWk1pSzYz?=
 =?utf-8?B?QmlqV0wwWjMxcGp6QnNCcm9zTmd2a3BXbjY1aDVhSElScXBvUFRzbFZpdnMy?=
 =?utf-8?B?bW5uWms5akJJUTRiVkZ4dDZlWnZhV2gyMHdXUHc4RjNTb2NWcUEwSDUrZDFI?=
 =?utf-8?B?bnd1NVlYTU84RmRydXE1TjJzalhXaU1MdDIwam04UXV1amdxQlhncmVFYWZx?=
 =?utf-8?B?NmFOalFXWmpvYVBiOWVBdTRGTUJFZjZTSHlVR3BpYjJ3RE9KZXY0aTM1ci9w?=
 =?utf-8?B?TlQxcFhGUkc0eVUwdk9OTFBpVnhCZlN5c1N2KzBnZVpOTmZGNnovdzFuYTht?=
 =?utf-8?B?SjFzQ1RsQ3YzS3JKLzhudFlaNDdWRFlUQzV2TGh1VXBtbFlReGdxZkM4L1lG?=
 =?utf-8?B?YXhwUU1JTnpOLzhSc2pDZjhwaDcwbEFFWHNZLzB1SVRXOW8xcjZlQnhJbXJC?=
 =?utf-8?B?SmxnWE9FS3FzNzF4MHpwZ0xyUVdZRzlTOFpVaEtNRmpHQmM4Y0FwV3NIcDNL?=
 =?utf-8?B?d1AxQURlQk9CZHZURTVhR3hwRitueDJuaWFVSmdhak1NcEJ2eEZqc3JUZndp?=
 =?utf-8?B?OS9LVnE3bGdWYXBxb3VRMThHd2tZMGdKamlaR2hwcnduQVNRZjVDUUZFdnFX?=
 =?utf-8?B?dTU1MEZ1V3hnY0hZajhBSXNVc0QyaUZnMmZFOHlEUld1VTVMVnF5bTRmT3lr?=
 =?utf-8?B?WWV3czJJWjFDM3RzRVJhUzE0K1FTSm5uNzFuVHNOOFNhT1FXblExOGV3OWVJ?=
 =?utf-8?B?RDZCeHlUMXVwMHQ2MEkzMGxaVG5CUFhBeUdhNGhRNUpYRmVnN04ySzFMR29n?=
 =?utf-8?B?NnExT0xhN3IremJKUERJTW1yRk4zUnZSSHpCbFErdjdRQy9UQkJ6UVNPSytI?=
 =?utf-8?B?SlBZRW5BcG5sZ085c1Vkb0xBN3hzY2NaY1p0UUI2S0lUL3ZYcUZDTkxiNURN?=
 =?utf-8?B?V3ZFMHFpdVJVaVpZck9zMVM2T0ljdm53Zlk1Z3ozQUFOY09VVFB0eWJmUTdi?=
 =?utf-8?B?Q1ZpL0N5elNzQmVTR054STZJYkRuTU10M0xuRTZzT2dCTVhLbWpTY3dCckJ3?=
 =?utf-8?B?WGVFV202ZjFId2lxSjduRHdjWE9QMVNDa2dFL0VROXNXSWIyYWxsTUp3Q25Z?=
 =?utf-8?B?YXdpbDVodW8xQzZNUkUvb1crQjFUYmNlaFIwaDliNDJ0ODFyQ0JNWFlZRWpa?=
 =?utf-8?B?b2p2YXJhMTdjdTdGVXBlQUR5MlhwWGMrN004YmtVUVVpZWt6K1RqRW1yZ0hy?=
 =?utf-8?Q?+X/tofVnPX9gx+yVuSwINEeTu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA72F534CC350A4AAA1FD4762A88248F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1459a912-da4e-4854-f83a-08dd25799064
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 06:50:19.9738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oukQsR9nWx4pwNwsW43mo6hYPeT14H5KLJbSVc/+BjB7hFr9IgbE1NbK3RBbnvVMRtefpGmt8nznHMGlSLmhJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7328

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIFY0TDIgc3ViLWRl
dmljZSBkcml2ZXIgZm9yIE1UODE4OCBBSUUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25n
IDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IG10a19haWVfdmFyaWFudCBhaWVfMzFfZHJ2ZGF0YSA9IHsNCj4gKwkuaHdfdmVy
c2lvbiA9IDMxLA0KPiArCS5mbGRfZW5hYmxlID0gMSwNCj4gKwkueTJyX2NmZ19zaXplID0gMzQs
DQo+ICsJLnJzX2NmZ19zaXplID0gMzAsDQo+ICsJLmZkX2NmZ19zaXplID0gNTYsDQo+ICt9Ow0K
PiArDQoNClRoaXMgaXMgdGhlIGZpcnN0IHBhdGNoIHRvIGFkZCBBSUUgZHJpdmVyLg0KU28gaXQn
cyBub3QgbmVjZXNzYXJ5IHRvIGNyZWF0ZSBTb0MgZGF0YS4NClNvIGRyb3AgaHdfdmVyc2lvbiBh
bmQgZmxkX2VuYWJsZS4NCkRlZmluZSBzeW1ib2wgZm9yIG90aGVyczoNCg0KI2RlZmluZSBZMlJf
Q0ZHX1NJWkUgMzQNCiNkZWZpbmUgUlNfQ0ZHX1NJWkUgMzANCiNkZWZpbmUgRkRfQ0ZHX1NJWkUg
NTYNCg0KUmVnYXJkcywNCkNLDQoNCg0K

