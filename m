Return-Path: <linux-media+bounces-27645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DF5A5044B
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 17:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B74D3ADC58
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 16:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2128250C06;
	Wed,  5 Mar 2025 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ddfmy8i6";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="oN+kKtB4"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7926250BF9;
	Wed,  5 Mar 2025 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741191174; cv=fail; b=HtA4oLYqkHS5Rf8NC2JVyYz3eno2ZHUdVv97BRMmXdmBVktqadJUB8e/tTYiJIPmdzTKIIrqQBZpsmyRJ1IBa7ImP4KG3bpDv2mW2QjTRpFZygjn0RVmGjylQJffKZfcFvEGMnf7LngtB6HsEHnJMrqwHgsTjsjAg1kUF24Ihnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741191174; c=relaxed/simple;
	bh=hg0T3rx+HW9AYBBekGOd01W9cEvUq8zCRinn2715ixc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OwejC6dbiR088e1y7kmpYxd50tNkk3wb+9Dg50y2Nj+oKzREAIFrkc0zovtR6oQcx850dfeUBVJwkZCFgwZRcFMy5YuJGpOYtWIdLgegJrBGnu3PqhD1O0eHARJSCsXoRDtBUIGzdgw66/eBkU9ndNdZnQ6TLRDW5xMY/HNPD9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Ddfmy8i6; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=oN+kKtB4; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: abe93658f9dc11ef8eb9c36241bbb6fb-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hg0T3rx+HW9AYBBekGOd01W9cEvUq8zCRinn2715ixc=;
	b=Ddfmy8i6nBMszeeJfgDHkM8sD6uUXuAG+P9n6lvE/tKc9iybRu3G4Minx9NeLmSVquba31Z8u45BNnObAJRqN7lQBaBC7Qo7In9RdITKmlzI1AQYV/5gp+I9irKtFvKyE7QpmabYP4B42FJ/VwOu99JVnoeRPcC6Gk3vHJMhr5E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b6bd0230-92f2-41fa-9775-54d738079b8e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:382f0fce-23b9-4c94-add0-e827a7999e28,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: abe93658f9dc11ef8eb9c36241bbb6fb-20250306
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1234408657; Thu, 06 Mar 2025 00:12:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Mar 2025 00:12:43 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Mar 2025 00:12:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BveLYxb1rmxt8/mSvMdmoxJ6DnDBLIbh/UFciVMRX2e1hitvqcu7izaGvsQe0zb3xl2bIxOKoVngjkVleXpxpDrGaA3fd4S9XA3qVs3v06tfrOAxNH4z6ryRPOAEHGDhRDhuaklqjRct+c00P2W/FDJlWDayqc7nHCWAZFmllXnZhlQIdqSpSM6UzCEw/aYFpcCU9DGon2w9tJc7iDE1521eNYb2rOWBdWHjrB0rNJf8E2WPRS3YcGko9m4SacTRIqgFjcy+Fxr1YBrvMH5vjMoCSy7jqzdEvVs+vxPtMHwi5iqsZfE5ZNcILNtyagcoi9F1iozZ4lQVEVrDHjRKlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hg0T3rx+HW9AYBBekGOd01W9cEvUq8zCRinn2715ixc=;
 b=sV4Y7v4Tb3T1IJ9GVVoFsa64foEzgQvdpY+VwaoAW3H0e4/CkBLinnwa19sb7n8jTLDvZjckB+WGDZXrgJWNe3Al2pELlvz0Y5in9l/s+3dmO9quw9iQhS8grzOY0Y461qlzCtsC46NWb5BM6AkS3sh7JGBd4Hh/Fm9W3OXImgbMNenezV+kSTvwV+lqr7sj371r6r2Yi97zbDpvhWCQSx60MtSpC6lSPL3EG2zeraBIltt7mPWsOtFkcHQr1sTeBZZvcMQjQiZNCD0ep27NX9i6XxlBTsAs94yqDA1ktH9T1xAfSLcwqXKsEZ9rVH2zMn8T3TNt8e4+zFIsBPAY0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hg0T3rx+HW9AYBBekGOd01W9cEvUq8zCRinn2715ixc=;
 b=oN+kKtB4vAkakEdzzU6XAhgJVIpD6SYCNFoPBiaprogRhEHl7zBWgKrsQNG7OZ0msNpNtf5bOsPqgAS2kKMSGbyvhKzb0Z77SbNVNIWe7gdneXCAmcPd/kYNbQ0ZuwQKeDTejr1FwhKZwGPYnDvwxjpgGEaWVpGOOmmCMOwZ6ZM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB7282.apcprd03.prod.outlook.com (2603:1096:400:21d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 16:12:39 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 16:12:39 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org"
	<treapking@chromium.org>
Subject: Re: [PATCH v4 6/8] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Topic: [PATCH v4 6/8] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Index: AQHbgchAmC8ygt6ujEmjaToxU9ar8rNiz7WAgAH/jgA=
Date: Wed, 5 Mar 2025 16:12:39 +0000
Message-ID: <ddcf01c82f92ee461875e1122b009b7fca691127.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
	 <20250218054405.2017918-7-jason-jh.lin@mediatek.com>
	 <c52b132b-fc08-4d1c-8276-1771f7457014@collabora.com>
In-Reply-To: <c52b132b-fc08-4d1c-8276-1771f7457014@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB7282:EE_
x-ms-office365-filtering-correlation-id: 0f687ae8-4cff-4ff6-c8d9-08dd5c008d2c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZjU2dlhSbVVwekdYeWR3WGllQ1lGMVptK1p3ZFI0MG9KRW9oTjVnVUhWa0FS?=
 =?utf-8?B?TzVucnVLVVlMRkRsamJzQ2FIZzFtNmR6d21PQk1PN1dPYkNmQlBOWFZOZlVa?=
 =?utf-8?B?RlR6TUhOWEVDQkVNNVh5cDhpeHNPQXZQZWQwOVBRaGR6bFpuQVREY2QyNXZ2?=
 =?utf-8?B?cVU0MEJyRnFrMUNyU2lQQUdLc1lpckY4NGdLZytLcXpscXZDR09NZitGUlNH?=
 =?utf-8?B?K09tRmtJcFZUYXFDY2pBVEZMWlBxTHFLMjNHbEJHaWFjU2FRTnBCNGZZSGht?=
 =?utf-8?B?OGdHS0lmaDM1VXNXTTcxdGd3Y2psVFE4akw1Um9RUkxSaVR6L3R5by8yUFBD?=
 =?utf-8?B?MWFyazdkQkZnOHo2WGllcm9Ra3Zxa2dHNWVOVUQ5bml0bDVSUXlpZ2FGZEht?=
 =?utf-8?B?eDFHd2IrTnJmb1dsSGRkenIxcUk2L3E1elNvb0lwMDltdXI5RXlGY1NxNzlh?=
 =?utf-8?B?b0FzKzFYTjJUUG14eG9Tb0wyd1F0aEc4MWxpMUxmUjg3ZmVMMFFwNlVpTHo5?=
 =?utf-8?B?aXpJUDdWdlQvRUtoNlFqMFpwZW5NYlBCN1Y0ajg3d2VYUkRCN2N0dy9KKzB3?=
 =?utf-8?B?NEtRdG1tOEY4MkdOQTFzeW4zTnNvUDlscGFTVkxNMXVoTGI2bHMrY1FoMjBx?=
 =?utf-8?B?OG40SFBVQkp2ZURCdnN0Ym02cCt2QU9zdHlPeU5mQW8vL1VEM04wdHpXVDQ3?=
 =?utf-8?B?WHlQTDN2blREdDZlcWFYQ3dSUEt6RjFDeGtKTGxNY2JGUjZ2NXUxaWRvcDg1?=
 =?utf-8?B?cXlvemN4SXRaWXY0U2ZSckViYmRzeGRKeG90MXF1OWMxVlliTkJ0eDZ1OXpS?=
 =?utf-8?B?ektIbkhrYm1aWThVbUJwYmlmREVRSENkbGZ1YTFxbk93NVhHOFVaZm9PRitX?=
 =?utf-8?B?aFdDa0p6dHN6bVNQTktQb241RzdUZU05VWhmSDhuREJVL0VSQ3BGaklQMkpG?=
 =?utf-8?B?U0pMckZmREdsTWxCYU5XYjY1bUlnaGhGN3Z4OEhPdm1TM2JQUkt3anVOSFJK?=
 =?utf-8?B?WndyYlkvVHZlV3JlVkZPbTVJcWQrQno4YkJ4T2F2WTgvVFJiK3FZSnErWlhz?=
 =?utf-8?B?Y0RERmZuckJ1SHY4cmtRdVVHQzJVQVpMcnU1cGowNG83Z1Izbkx1UVhhMHdS?=
 =?utf-8?B?WUlQa2dZWGl2OC9YZk5EZHJMcnlGNzdHMW00emxPZktCZStIMEtoY1hpL3Nu?=
 =?utf-8?B?SHl6ZFlYMUtzMHRLTkFGRVl3ODRwRXUyVVlreVVuRksxU0Q0T2NRVldMYVNn?=
 =?utf-8?B?QkpRREZpeXQvNUhjdWxUamJJbjQ3NldPYWZwaFlFMTlUQnBPRWtTUW9vM0xF?=
 =?utf-8?B?a2pudFdmN3hBL0RSL0g3alN0YlI2R0U1OUtycTFCQnM3dFJCVXcxUytXc1Q0?=
 =?utf-8?B?L2NjaE40RnhuNUtWZFRrOWtLdGFaQmhKRkZOb29DSW9OSDIvNDJCMStLa2pL?=
 =?utf-8?B?SWNyaU1FL2FEc2Z6dHZnZnY1NlNKOEE1MnJhUVFBMGdzYXZHUk14SVdyUUdw?=
 =?utf-8?B?a2htVzg1LzJuT2tyZllDUS8wYjJjT1dUVkk3cTJycTR1dGoxa0RqSHpYbSsv?=
 =?utf-8?B?R2RNbThkWU40YVl0SnoxUE5XR2ludG9sd0pvdkYyanBueWZNaElqY1I2eVZy?=
 =?utf-8?B?cHJ1YlBrM1BuZW16V3dsYmd5QjRJdXdkV1pNVCt5MkpNOHVUaWtrby9sMEF1?=
 =?utf-8?B?V1o1THFMTGhBamlPSXRmbXFIek1pekVheVZDeXIvdDd1SU8rdVd4QTRlUmR0?=
 =?utf-8?B?eWI5SWljcHY3TXF1UFpweGRhblRBZlU2ZmhpUE40YTlzRHNreStvaG40N3hk?=
 =?utf-8?B?Q2ZvQlNFelE1aXduWTdZWnpySWJRRDVtb1RQMCtDQ2VMUnd6SUlZMWhRSkVz?=
 =?utf-8?B?clVadDF1OUx1NW4rR3Fjd1NpMkNnUklGcVBVaU1zZ0dnTVNFRi8ra0xaU2hD?=
 =?utf-8?Q?uraorS1W967+nNKtxRfJp3rhkJdpzDo1?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0tlaXpVSXJZbGhyNmx3cEROM1pDWW01aTdaSERHdnZsazRlTDlzVVZDNXBC?=
 =?utf-8?B?NmdiTDgvSDZxaHIzZm5PUmx3Y0xRT2JlelVyN2FvZWl4MVdDWTY4cFVtdjBU?=
 =?utf-8?B?UDhHU2o2WFVIMFFVN1VMUGtRVmRrT25wQXhDVmt3WHJMQyttNVd6TmR3cTZp?=
 =?utf-8?B?Sm9zSzlPQlRqQVBTeVN2VnBGMDVCODVicy9sc3U4amtKdWtBWXBLdnZOTStZ?=
 =?utf-8?B?Qk9RSHJGVy81SVhGU0U3MmgrdjFjNkhIOTBxRkhHQ01UZHY4WmZZeTBNREN5?=
 =?utf-8?B?aUkzM0JicVZPMnlGWVB2Skp1QWlRY0RIQVNlb0c3ckw4T3IvR2w3S1FzeHNV?=
 =?utf-8?B?SnJic0NYVWhuZ2FweHpiTXlDdWhEWkFhU2ZGSGNJdDRzMlZSekpwN2swakNw?=
 =?utf-8?B?OHRHYVVHRnJEdWQrNTloMEl3Yi9wOVROdmFhdGxBMjNLMGRIL2puOHEwVDV5?=
 =?utf-8?B?MFpsUlNzbG5BNE82QStxTzFwY1l2Q1JkUG1oMjhPSlFIczdRbERTeXFGWGZW?=
 =?utf-8?B?M2VrbVhYOU5IYnZtMXI2cTUrakt5azMrYVM3NW0wVEJmVUdBbDh2b1NrcGg4?=
 =?utf-8?B?UXNiVTFhbzFaOEJzWnQ1Rno1SS91U1BlenBKUTlya1pXOUpiSlJaOTF0bk1S?=
 =?utf-8?B?L3NGd3ZnNFcrcE1uWHVVS1YwK1ZvVnJ5UHcrNjM0ci9zZ0dybEFCRmx0RmU1?=
 =?utf-8?B?dDNVOVBYTUJMUUJtT0ZnV3JIV1JZTXZUeVZnTTBwRjljVkgybktDcndTd25O?=
 =?utf-8?B?YkhIOU9WVy9uTzMrYlozV041M1IwTWZqd1hQNmJORjFoVVFnZ2RJTUJYamE0?=
 =?utf-8?B?SG4yT2xJWGpEUEh2V1VSV09tTEpzNzhPajBYN1ZLajFIVnRhVTBvRzkrSW1y?=
 =?utf-8?B?VTU2Q0ZrWXBZT0VvRWdsSjllZVczUnFJaC96a1B1cnhOeGtRVHZVTFhRTjkr?=
 =?utf-8?B?Vno1bHlIRURZTVFRTTgwejgySlNjQ3U5dE5XOUg3U1F0bVZKSWc2c2ZKaE04?=
 =?utf-8?B?N0RrT2U0Q1R2R1JmcGdOWFFZV3V4bEUzaXRNRTJJK0dNcVlJaWdTb0dxSUR5?=
 =?utf-8?B?UkcrNjRwaDJjR09BQWtnbGROaVFxM2wvTWpTOFhuLzVWVmFuSDhlakJlWlh6?=
 =?utf-8?B?ZTNIa3AraEc0RWZldmIvRzVOMit3dEFBMVdSd2dxOG9lWjBYS0tzbk1hQTFO?=
 =?utf-8?B?YjJtNnFRUEFJQ0t1QTZuVExlZTQwTCtNR0FrdzdLUDZMd0hyQktHOU1Id1dM?=
 =?utf-8?B?cjk5VWZ3UHNBYzFxdEtQdDRGdmQrbGpYbHhOZGNDalB0V0dNS1dLS3Z5aC83?=
 =?utf-8?B?MC9hTTdIMExvaWpsUmNocWJJd1Uzb3NxcER4ejJYaUlzT3FtaDZ6YWR6T1E1?=
 =?utf-8?B?L1ArcDAzTElKZEVGLzc0QjE0SDBGZE1HZGxlTW1zVEl5MjZiUFdPUGlwRG9x?=
 =?utf-8?B?ZDVucGNVVVBOcnRXSkZvWExJMm04VGhKR0VZL2g5MW9vSURKalBEZ2lxVHEx?=
 =?utf-8?B?cW1UOVN1UDA0NVd5MW1IQ0YvNG1pK2x3eU1kWHhtNzFoQklqMFg4NVJkWGgz?=
 =?utf-8?B?aUw4TjRLT0M5ZkNWZzE4eTdRbURQcjVuejVGNUdlSGJ5L1JmSjF0UTVJMlY1?=
 =?utf-8?B?b3k5OTRZa0VIZ2xrcFlmOXdvQkFRLzNMMHMyMXZqeFNPWk9kVEpzWGkvV1g1?=
 =?utf-8?B?NTFDWGNZYlpJdVpMbi9nWkN3Z2IvMEVhNjlRK1ZmMktrZHk3eXQ3dUF0UFVp?=
 =?utf-8?B?UFljV3E1cytLekVSZEFOWE51eEc4VFBiQ3JiTWZWQTUyMi91dVlQc2RoRXhG?=
 =?utf-8?B?endvS1R2TU9zcGROaEtiL09PejBHTGVmWnRndWEzTTUrQzUyd1kzeDg3NldZ?=
 =?utf-8?B?Q1NsOE1WcHUwZlJZb1pXR294MG1kYmd3SFM0d01TVUhzUlVrYldpbDZ4M2pu?=
 =?utf-8?B?b2RHSDU1dUJwM3Fkd0VTRmllUEQ5ZVRYWlVOcWhCbXFldmlUblVZOVdLOVR3?=
 =?utf-8?B?ZVJZeTlVekJkbGZGaEZOelJ5YjE3aTNLSVVyQU5KL2puaEZmTG8yRWg1cTda?=
 =?utf-8?B?VGdyODAzejZiODZKaUFzT2R6K1hRVnlYZ2FCY0xSVS83dVBFa0F3UnpEc1cr?=
 =?utf-8?B?YnhPZmhoMlFFM0o5TjVyb2taS3FhdHhOYjZaRUEvOG51VlpqSzNPRVM4ZGE3?=
 =?utf-8?B?Znc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E6AF4080D27AB4D918E0E4380509151@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f687ae8-4cff-4ff6-c8d9-08dd5c008d2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 16:12:39.4147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2F/jClZ8CsElujZtKhbX140nnr0IAdF16i5UOyQDfGRE+3clsGiS5gP8qNNK7WJwWCjFnMzTjOBhp76igFfml4NHJbfBbrmLr6DhEohMvlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB7282

T24gVHVlLCAyMDI1LTAzLTA0IGF0IDEwOjQxICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMTgvMDIvMjUgMDY6NDEsIEphc29u
LUpIIExpbiBoYSBzY3JpdHRvOg0KPiA+IFRvIHN1cHBvcnQgaGFyZHdhcmUgd2l0aG91dCBzdWJz
eXMgSURzIG9uIG5ldyBTb0NzLCBhZGQgYQ0KPiA+IHByb2dyYW1taW5nDQo+ID4gZmxvdyB0aGF0
IGNoZWNrcyB3aGV0aGVyIHRoZSBzdWJzeXMgSUQgaXMgdmFsaWQuIElmIHRoZSBzdWJzeXMgSUQN
Cj4gPiBpcw0KPiA+IGludmFsaWQsIHRoZSBmbG93IHdpbGwgY2FsbCAyIGFsdGVybmF0aXZlIENN
RFEgQVBJczoNCj4gPiBjbWRxX3BrdF9hc3NpZ24oKSBhbmQgY21kcV9wa3Rfd3JpdGVfc192YWx1
ZSgpIHRvIGFjaGlldmUgdGhlIHNhbWUNCj4gPiBmdW5jdGlvbmFsaXR5Lg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4g
PiAtLS0NCj4gPiDCoCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyB8IDE0ICsrKysr
KysrKysrLS0tDQo+ID4gwqAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmMgfCAxMSAr
KysrKysrKystLQ0KPiA+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLW1tc3lzLmMNCj4gPiBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQo+ID4g
aW5kZXggYmI0NjM5Y2EwYjhjLi5jZTk0OWI4NjNiMDUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstbW1zeXMuYw0KPiA+IEBAIC0xNjcsOSArMTY3LDE3IEBAIHN0YXRpYyB2b2lkIG10a19t
bXN5c191cGRhdGVfYml0cyhzdHJ1Y3QNCj4gPiBtdGtfbW1zeXMgKm1tc3lzLCB1MzIgb2Zmc2V0
LCB1MzIgbWFzaywNCj4gPiDCoMKgwqDCoMKgIHUzMiB0bXA7DQo+ID4gDQo+ID4gwqDCoMKgwqDC
oCBpZiAobW1zeXMtPmNtZHFfYmFzZS5zaXplICYmIGNtZHFfcGt0KSB7DQo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXQgPSBjbWRxX3BrdF93cml0ZV9tYXNrKGNtZHFfcGt0LCBtbXN5
cy0NCj4gPiA+Y21kcV9iYXNlLnN1YnN5cywNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtbXN5
cy0+Y21kcV9iYXNlLm9mZnNldCArDQo+ID4gb2Zmc2V0LCB2YWwsDQo+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbWFzayk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZmZzZXQgKz0g
bW1zeXMtPmNtZHFfYmFzZS5vZmZzZXQ7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAobW1zeXMtPmNtZHFfYmFzZS5zdWJzeXMgIT0gQ01EUV9TVUJTWVNfSU5WQUxJRCkgew0KPiAN
Cj4gWW91J3JlIHN0aWxsIGFueXdheSBwYXNzaW5nIHRoZSBzdWJzeXMgdG8gY21kcV9wa3Rfd3Jp
dGVfbWFzaygpLA0KPiByaWdodD8hDQo+IFdoeSBkb24ndCB5b3UganVzdCBoYW5kbGUgdGhpcyBp
biBjbWRxX3BrdF93cml0ZV9tYXNrKCkgdGhlbj8gOy0pDQo+IA0KPiBJIGNhbiBzZWUgdGhpcyBw
YXR0ZXJuIGJlaW5nIHJlcGVhdGVkIG92ZXIgYW5kIG92ZXIgaW4gYm90aA0KPiBkcm0vbWVkaWF0
ZWsgYW5kIE1EUDMNCj4gZHJpdmVycywgYW5kIGl0J3Mgbm90IG5lY2Vzc2FyeSB0byBkdXBsaWNh
dGUgdGhpcyBtYW55IHRpbWVzIHdoZW4geW91DQo+IGNhbiB3cml0ZSBpdA0KPiBqdXN0IG9uY2Uu
DQo+IA0KPiBXb3VsZCd2ZSBhbHNvIGJlZW4gZmFzdGVyIGZvciB5b3UgdG8gaW1wbGVtZW50Li4u
IDotRA0KPiANCg0KSSB0aGluayBkaWQgaXQgaW4gdGhlIHNlcmllcyBWMToNCmh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MTEyMTA0
MjYwMi4zMjczMC01LWphc29uLWpoLmxpbkBtZWRpYXRlay5jb20vDQoNCkJlY2F1c2UgaXQnbGwg
bmVlZCB0byBwYXNzaW5nIHRoZSBiYXNlX3BhIGFuZCB0aGF0IHdpbGwgbmVlZCB0byBjaGFuZ2UN
CnRoZSBpbnRlcmZhY2UgZm9yIG9yaWdpbmFsIEFQSXMuDQoNCkFuZCBDSyB0aGluayB0aGF0J3Mg
bm90IGEgbmVjZXNzYXJ5IHRvIGNoYW5nZSB0aGUgQVBJcy4gSXQgY2FuIGJlIGRvbmUNCmJ5IGNt
ZHFfcGt0X2Fzc2lnbigpICsgY21kcV9wa3Rfd3JpdGVfc19tYXNrX3ZhbHVlKCkgaW4gdGhlIGNs
aWVudA0KZHJpdmVycy4gVGhlbiB5b3UgY2FuIHNlZSB0aGlzIHBhdHRlcm4gaW4gZXZlcnl3aGVy
ZS4gOi0pDQoNClJlZ2FyZHMsDQpKYXNvbi1KSCBMaW4NCg0KPiBDaGVlcnMsDQo+IEFuZ2Vsbw0K

