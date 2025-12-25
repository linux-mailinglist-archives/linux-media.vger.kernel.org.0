Return-Path: <linux-media+bounces-49517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BF9CDD5B3
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 07:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03D6630194EC
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 06:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F291C2D46A9;
	Thu, 25 Dec 2025 06:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SA02CsS4";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Mbktm1/X"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E901F2C0303;
	Thu, 25 Dec 2025 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766643165; cv=fail; b=G6E9M+2HF5zmOjLF1JHsFrwjNc7tR+6ux7yYiT8Hl7IKguorohEB3rRPmvY8+cwVLjEsg8TNdQqYSTKuOB9Fx5PtKmW725h2Se/ODQL2pWWCD3fO/SOgFp0q3DpI6pFXh7PgHRFWIcLTWIhxHAMqCnqxG8N7Fn3+uywPVDpqg3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766643165; c=relaxed/simple;
	bh=aymNd34aa+UnMxTZcrmxD9PmuO23euB2U6y/e01NpPI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fejjHCqVbVT80UHRPNQxk0t3rm5SxX5MmgarG0UlIh3h5SwPyxXBcf9AnSGhMLBNuwoU/emM1LjzVOSLaGd17k8MBSqn4KCuHuai8fz2yQnqFttUdhkbYeUE86sDgKLiJ6EVDipWfGdl8oRGZhidisI0VZ6RADyMho0H507WJL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=SA02CsS4; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Mbktm1/X; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b67b2996e15811f08a742f2735aaa5e5-20251225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=aymNd34aa+UnMxTZcrmxD9PmuO23euB2U6y/e01NpPI=;
	b=SA02CsS4VvH/QcAh7zrG1YhGuw4/ZIsunWdNcAQHa6/MVTJt8r/hV60djlAK88AYhl/psKLXvKqofJd1iGXI71RsdOyB9ily9gFPxOvMWHwTjUkzzP8FjdR8mPsojsQeBmy0c+KuW5BbMHoq7BJwqsMESifxtzrxiqfQIn/GaIQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:01ffaaeb-ff37-4057-a18f-f293b289cd19,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:212292aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b67b2996e15811f08a742f2735aaa5e5-20251225
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1439911198; Thu, 25 Dec 2025 14:12:38 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 25 Dec 2025 14:12:37 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 25 Dec 2025 14:12:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDSmzW7FzMqZCS14kdi16uzSGN5rIxRKMQLAHmbuRvybZIMV+KbyfVhyzfYOfrSGSu+oOfg2oRc0ryqkj8KePT2NyT05aAQcyIk1yWSgupPG9E7bvzBJpP15svz+dJs1DjZ7IHb7qIjkQXHkwjZxRTnEvBrJcEDjKAOvauZJUksOK6xk8J5qAT1D6ruqTMIxj/bp35F7kPYfeDzIC+JZMBMBvMhfK6XiQgA7ML6CSvITmuNG5gcHKtUeITz30EYleHm8IkCLA+SG0kXN7QwnI1GRB9CE7tQxM1pMeP4WG6nNU4qCcav52kV2IwXg1EcsW4Gp4SnGRvMlE1xLu+fXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aymNd34aa+UnMxTZcrmxD9PmuO23euB2U6y/e01NpPI=;
 b=aP/+HKOiXYksFZdulbaSeB94cZ/xBlK87BjPy4thmboSKhIwKZL178VdnjfzaG7iC81Zo+UQSs/CpSQl3qeb79yLeDtw2/7TManZCNeshb+KBCkjoLUEol7DiS686DzcSB3o/DP58IN/tibt+Xjd8RX80/jKfkpHy1x9LYb0AEuAJG6POfB/WIWgcgdcasgCp9M/AzUPnFDotvKXDePecozlAeAsk7S1A1LQtmWYBvDUphRZMZ7v57TBn9lGcsDto8ucyxOMRtE6AoVO6N+cP8ae9l4G/5ki4wOW1nCNFmF8zww1v9vhUjoxrRh8ZihO+GKNNkNt0fcwWF1tWRhqug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aymNd34aa+UnMxTZcrmxD9PmuO23euB2U6y/e01NpPI=;
 b=Mbktm1/XYnxKlggRhvf/48f3zEhvXJ05uRWDd2DbRbEYYhqi/FNtLOAp0FkD86nRQdz3m9GGwDI11SAfV8F8pV3TUa2NPTOCtbq6XUNb/h8geqbFBz1zwL8hvp744JXTpj2Cz17IU59SSI2nlw0gnTG7I7YJ1edxIDJhLg98XhM=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYZPR03MB7866.apcprd03.prod.outlook.com (2603:1096:400:454::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 06:12:33 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9434.009; Thu, 25 Dec 2025
 06:12:33 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v11 04/12] media: mediatek: jpeg: fix stop streaming flow
 for multi-core
Thread-Topic: [PATCH v11 04/12] media: mediatek: jpeg: fix stop streaming flow
 for multi-core
Thread-Index: AQHcY3Do6N7k/ot1zE25IDUNp30rjLUk3pGAgA0ldgA=
Date: Thu, 25 Dec 2025 06:12:33 +0000
Message-ID: <f658e838b75be59d0976e76b2f364420a326ce38.camel@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-5-kyrie.wu@mediatek.com>
	 <bf9d84ad6973d55f40bafdb9a70dc49178d4af10.camel@ndufresne.ca>
In-Reply-To: <bf9d84ad6973d55f40bafdb9a70dc49178d4af10.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYZPR03MB7866:EE_
x-ms-office365-filtering-correlation-id: 441ed4f5-a0b1-42c9-a76f-08de437c97c9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?d0dYWStrOVY4RHBwK3dDeW92c0E2cGEvT1ZsMHptcXErSy9UQ0FwQWhmT09t?=
 =?utf-8?B?M2ZZS1RrTUxGdGsyREc5REhXdGRqTGh2clZISUdkeGtINlY2NEE5aytwNzNL?=
 =?utf-8?B?Y056d3VkbVpyY3ZvQ1RvQ3pRekh0VWdYNkVkZnd4dy9EZ0lCV1NLSEJlZUw1?=
 =?utf-8?B?U0pCTTQ2RzBSN0VEcENYQ0o2L3VENEFqVkdWWWQvTnRvaFVnWkxUY2pBVUhk?=
 =?utf-8?B?Y29TMDVzTXZhbmM0U3hKU3ZPeHB2ZkVoSlZHeEVGMjUwWVJLWjY0THJVbTla?=
 =?utf-8?B?c0pHTWdyR1VwNXBEZjRqcmRtbjd3dDYyOHlnNGJnY3hrNjRqM1BScG8zWlBk?=
 =?utf-8?B?ODg3MStUUWEzWHVsS0lKdVNBNnYxakYrUkljd0E1MDgwTDNpUlBiZHZRUHY2?=
 =?utf-8?B?dk1KOWpOTGs5alFFTm9wbkpYWVVCZ2ZydjJrNGtHQzZMN0tFUkJlYlJoUGt0?=
 =?utf-8?B?RFFHaFdsbGVWaFplWU83N1I4RVZoMVVJclVodEJVb0sxWnlEMkR6QkFvZU1i?=
 =?utf-8?B?L3k3Tit1N1ViWklEQktBcWFydEk2UXhrRXd4TjhEMEZ2UWdJbitmS3BKeUlh?=
 =?utf-8?B?SWtZRTAydlhGWGQvSktuWjFHeENFcFJ5KzBJU1ZZODVnTXdmdWh0OFdOSnVU?=
 =?utf-8?B?YUhobzQzYmNXMFh3bE9NbW5FMFNKUXVNbVFXQ3lKQ0hrQm42emZISnJGVTc2?=
 =?utf-8?B?MXVHM1RkSDhxUjd1L29yV3BsMzFjSnlGNUcwTnlpSDg1RGNmOEVXUGRsVEty?=
 =?utf-8?B?TzBMSDRTM2FSNk94SGRXSW91K1lqVWdyVGR6RVJjUldmSUhIWG0xV21KbWVo?=
 =?utf-8?B?T2J0TFZYRjdpa2w5L3BES2hRaE1wUHljeDNLd0lEb3FNcU8vUStWcUZud051?=
 =?utf-8?B?RTU4Z2ZTQ1dUblZkNGNkOTFhT3AyWno0RHJGS3p2Zjd2Y2FoSUI1QXNycDRE?=
 =?utf-8?B?VkVPMnp6SE9LMUwxbzNMdm1FTkYrSitQZWZ3RmhjTjFrVmZUODBHRHRXUWEv?=
 =?utf-8?B?K2lub3JDYld3UjZHTmZOT3hCME45Ti9BVkpqMG1Pb2VFanhzbDNmZTBjbjEy?=
 =?utf-8?B?VGpmSWQyUVphMTFGZHdWOWFxRmZieWZtZWREMWdrQjFQV0g2cTBTZ1I3OVFz?=
 =?utf-8?B?Sk1hS2wyZktMZkxYcTFRL1ZTUGhjUXlKM1AxVjNmd0xFUDBxV3FvazJ5K2pG?=
 =?utf-8?B?TXlmUzZHdFdndm1SNjA2ZWtNM0JtVkk3aWF5bWFFU3JrbE1oUWZicEdyWXYv?=
 =?utf-8?B?SCtSenNMQnBxYTZSM20rZm0rdTVmcmc3dFJjTWRHM0lldUV6Ulp5Yk02VE1s?=
 =?utf-8?B?OTF4Z0VCSlBCRzUxdnNqREpZa3ZuNUNucHAyYWRHQS9NNFM3bEhPLzRicjk5?=
 =?utf-8?B?dmk1MTJOYVhDN2xkZTl5OFN0UVdYVDE5c1hGd0h1SmhUZVpiQ3ZNUG5oTHli?=
 =?utf-8?B?N1IybnE0M1AxT2JCb2ZtdUJjeFZ4ci9JZGFtOVp5K2lwQjhGL2owYU16RERJ?=
 =?utf-8?B?SVJkazVBN3Bic0R3c1lHZk9WeE1XSGQyaHF2N2d6NE5nY2Z3RUlxdDI1OFNp?=
 =?utf-8?B?REFvQ1IxSEgvNHp3Q0lEMVp5RitEZEpvRUVHMGgyTmJJSkJUUDlOSFB5OThD?=
 =?utf-8?B?bEhwcm9lenl4SmxwVDJlU3pscFVEMG9ocmV6eHIvV0NpOGI5MDhuSDIzbzhK?=
 =?utf-8?B?ZjM5R3FremZESU03QmxuaDJZbTYyZnhpR0lBWGFLZkNiQXdXQUpjMUc4Slc1?=
 =?utf-8?B?R0JJMlAwQ3owU2c4QkFWNHNoMzk5Z0MzTzJ0Z3BGQnI3TllnenBrQ2dKb3ZY?=
 =?utf-8?B?clh3WjJ0dDU3WHRHb1FBdCtOMnRXMk1YMlBEdUdRWWVmSEdJT1hxZExXSVBZ?=
 =?utf-8?B?NmdQdlUxZnhMT0FrS05YRnp5NEZlaGsxTzJzUVRuWkFqU3M1a01KbXoyaldn?=
 =?utf-8?B?eWhQZFJsQXhJWGxLbnVzemZJRjVGZXZBeUtRWHJ2RWgzK3FOU0VnWVJ0SnRv?=
 =?utf-8?B?WnYwRW5RL2lvTGJQblp4Vkl1c0hmeXVzcEsxTnFhRTVQRDUrdERva2trdmQv?=
 =?utf-8?B?R1oyaGhaV2pmYmJya2I0ZGNYMUF4Unl5d0RiQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzlWdjB6YXFvSTNsMXZuZC9nbkd2cmR6ZzlGRGtTZGlhcDdSVHhadkF5VThM?=
 =?utf-8?B?QXdKbHpVN3pwOE1pOHJRRm12M2Y2bVJCUlo0ZVlsYTlzYjZNVnF0Qkptekk2?=
 =?utf-8?B?ZEVva3c5SDB0YXNIYm1vTlZZelJSZnEyWGFCQUxVd0NyRTNrRG1SdjhNSTJa?=
 =?utf-8?B?VDhTaFhLeEtiS1RYY25FbzVrVWZOQ1lUSnVveEZ0OHIyWjBIMHM5b09LRy83?=
 =?utf-8?B?TEZTM3BRT0c4NWpkdUh3SEQxb1RwRklnQ1BCeUpRNjF0YVhBbUY2c2xNL0VG?=
 =?utf-8?B?dnU0VFhqY1k5YUFvaTJDb0daR1pSSlBqTjNHa2dndnF5Z3dvYzl5TVV0R2ZD?=
 =?utf-8?B?am9XM1U2Q2xiUHZldnFoME14bTQ3eW5ydE5iWjBuNEVPcUd0c0lXKy8reGhv?=
 =?utf-8?B?YVRCY2FFM2FwS2I2eHNXamYwRnNLeUZTWnY2SzZwaTlNdGxxTTBHZ3IvTVpH?=
 =?utf-8?B?S2NwaVM2YlpCLzVZZFJpQ1lhZlFNZlhlM2J6WVVQU1MrZVh2RHBqazFsNzBW?=
 =?utf-8?B?dFp6S1JkaGRlSytVMnkzcHJwYlJVRURUWFhXZUFhNitZL3FtbWZ5N3VCTFU5?=
 =?utf-8?B?dXpNUzZ1Rk52WFoxTDNLNGV3Y09yRFNDZWJXZ0JWdExMNW56WEtzeHM5RGE5?=
 =?utf-8?B?SE5va2laSFFuZTY2K3oxQ3J6ZXgrTWdWeC82a1dCYldRSzM0eEx1V3N6UFdX?=
 =?utf-8?B?YUNDZnp5cEQxUXFHN3lOOHpzMW9xN2NWbDNYMDFmL3ZEYWtmMzZPZXVyckU5?=
 =?utf-8?B?OSttTnlRaGUxMjFMUk1neG44Y1ZPUzZHbzJHY2d5QmliSVlLMTBTdy9leHNw?=
 =?utf-8?B?Q3M0QUkvM1l5ME5nTGZhSXMvcTRQamxPbDg4TTVxWDRZZGJsdkZ3cU9NV3ox?=
 =?utf-8?B?K2cwbVptZ1Jta01DaDNJS0dxRStvOFNqNUtITUNkYVVoVitrN2htT1lKNk13?=
 =?utf-8?B?enYrUGd0cVZ5SS9IdDZmbmYwbkxkc2xVQ0VqUnpOVFpYY005anE1ejRwQ0p5?=
 =?utf-8?B?czdUaTFiUzVjK05uS0ZEc2lPSWVYUDBNWkpEaWFUbW43OG1wUlRHTHpvWHR0?=
 =?utf-8?B?RVRUUklrbjBabVU4VzNJWVN5M3lVQ2wvQldEWG1mVkJvYkFwWUdXa3liVmQr?=
 =?utf-8?B?bGNrY3IyWk95ZFIxZjl1VGYyT1c1M2RrU2xmVUFZUVVBcXpnaGtCUmx4Zks3?=
 =?utf-8?B?MFF6YnNDQmxWVmJTM2ZWRjIybkdUYkhHOXRMVkRkNGM4dWFTb3JvMnl0cHp2?=
 =?utf-8?B?QmtycVF5UlM1MGVxZXIrUEk1Q1F0S1V6K0ZVeDRYc0NuajhwNW9pM3Y1U0tB?=
 =?utf-8?B?b1FJc0Vrei9oWUkraWtld21PUHIvdnlKQXV4VHBHcTlDeWh1bWZWQnRtaVhY?=
 =?utf-8?B?NldyNGgxMDJWL1VFU1J2K2FjcnlNbnZJdzV3T3gyeGZrby9RRW9XbWN5eldx?=
 =?utf-8?B?TVVGR0ttZ05PZHNSejdVcTV6UjFjYzJrNVpqYUphajZUWlhNelc3TlN3NVRx?=
 =?utf-8?B?ZUkvNS9Na1pYMUVVVGZTTWlBWENTeUR4eXdycU03UVhWWXowTjZJVm9DdjJH?=
 =?utf-8?B?cG5OOFNOaGNzc2YyS05YaUQ3UkdQMER1V2h3ZVdFVE9OOGxFNEFNZFhabkhu?=
 =?utf-8?B?Q0MzSTFpZXFBQW9JS0JITFJ5ckhRTGlWVzZXWUhHYkVhOVYxOFVBWVRQSXJ1?=
 =?utf-8?B?RktTYzNUdmUzWFNtZzNJaE1OOU9NZFJFMW92T3pMT1VzUGFyekV6bHpzNHF3?=
 =?utf-8?B?VG1sa0swSHBISSs0SGhXTGUzWHJ5Njg0cXZ5L204VFJaUjFXQXFYQU5CWjN3?=
 =?utf-8?B?MnhNZTJ3SSs1WDFmc1J6bFYxNmxPb1ZGQ3hmNlZwa0dLQWtTZlZnYTk5YWds?=
 =?utf-8?B?eE5qa2FjVTNaTXpSdUFRR3FpcWdWNHZxODVZNW9rdEdiY1JSUEEweWkzVndO?=
 =?utf-8?B?MHRldFNCaDhzSDJQZ3VEc3p4MDRMVGhVSlVQUWNwMk14NkdyWGMrWGtDWVNx?=
 =?utf-8?B?L056ZTZEajVLRzBXa3U3ZjBFd1NIS0Q2Q0tDYS9GekJnZEZKV0RMNkFVbWFz?=
 =?utf-8?B?SDNZYmpmMDhYOW9CazRsQ1NPVEp1UExJNUdRZ29tSEh3UzdRZFVtT3doS2VC?=
 =?utf-8?B?WGUxR1pqZFdrRGhmL25DMDJRQUhucUpnU211YUpqU0VBZVVJZmw5a0c1UFlS?=
 =?utf-8?B?TEgwRkJ4QTNGYzYxd0IxQUdPZ3VaTEhyaE1IS1dnbjFsWTVlaE1rSVJIUExT?=
 =?utf-8?B?Q1VYTzdDK3UybGpNcTdSVEtQZk1PRDV5Q05sdDNjK043S1FtYmdYcEFmMGRT?=
 =?utf-8?B?akhSOXFHY2pzVGZ4eGlldTlFQXJzUUliUHo3T1MzdGZtZU5IVEZIUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C65D874AE1CD0D4DB8B8FD6E0F95CE84@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441ed4f5-a0b1-42c9-a76f-08de437c97c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 06:12:33.4379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0ye84uVDWy07htt9Zgw8ykfGOQlfnF6M0I/2AhLXWYole4eQ1AlXYLg+TlvLdPv6+CcXkPqsc8d+r3VLxi1+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7866

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE2OjI3IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBMZSBtYXJkaSAwMiBkw6ljZW1icmUgMjAyNSDDoCAxNzo0NyArMDgwMCwgS3lyaWUgV3Ug
YSDDqWNyaXQgOg0KPiA+IEZvciBqcGVnIG11bHRpLWNvcmUgYXJjaGl0ZWN0dXJlLCBpZiBhbGwg
aGFyZHdhcmUgcnVuIGF0IHRoZQ0KPiA+IHNhbWUgdGltZSwgc29tZSBpbnB1dCBhbmQgb3V0cHV0
IGJ1ZmZlcnMgYXJlIG9jY3VwaWVkLg0KPiA+IElmIG9uZSBoYXJkd2FyZSBpcyBjb21wbGV0ZWQg
Zmlyc3RseSwgd2hpbGUgb3RoZXIgaGFyZHdhcmVzIGFyZQ0KPiANCj4gaXMgY29tcGVsdGVkIC0+
IGNvbXBsZXRlcw0KPiBoYXJ3YXJlcyAtPiBjb3JlLCBtYXRjaGVzIG10a19qcGVnX2NvcmUuYyBm
aWxlIG5hbWUNCj4gDQo+ID4gc3RpbGwgcnVubmluZy4gVGhlIGRlY29kaW5nIGNvbXBsZXRpb24g
c2lnbmFsIGNhbGxzDQo+IA0KPiBkZWNvZGluZyAtPiBkZWNvZGUuDQo+IA0KPiA+IG10a19qcGVn
X2RlY19zdG9wX3N0cmVhbWluZywgYW5kIHRoZSBmdW5jdGlvbiBvZiB2NGwyX20ybV9idWZfZG9u
ZQ0KPiA+IGlzIGNhbGxlZCBpbiBtdGtfanBlZ19kZWNfc3RvcF9zdHJlYW1pbmcgdG8gY29tcGxl
dGUgYWxsDQo+ID4gaW5wdXQvb3V0cHV0IGJ1ZmZlcnMuIEhvd2V2ZXIsIHNvbWUgYnVmZmVycyBh
cmUgb2NjdXBpZWQgYnkgb3RoZXINCj4gPiBoYXJkd2FyZXMsIHJlc3VsdGluZyBpbiBlcnJvcnMu
IEl0IG5lZWRzIHRvIGFkZCBhIGNvdW50ZXIgdG8NCj4gPiBjYWxjdWxhdGUgdGhlIHVzZWQgZGVj
b2RpbmcgYnVmZmVyIGNvdW50cywgaXQgd2lsbCBpbmNyZWFzZSAxIHdoZW4NCj4gPiB0aGUgYnVm
ZmVyIHNldCB0byBoYXJkd2FyZSBhbmQgZGVjcmVhc2UgdG8gMCB1bnRpbCB0aGUgYWxsIGJ1ZmZl
cnMNCj4gPiBkZWNvZGVkIGFuZCB0aGUgZnVuY3Rpb24gY291bGQgY29udGludWUgdG8gYmUgZXhl
Y3V0ZWQuDQo+IA0KPiBNb3JlIHRoaW5ncyB0byBmaXgsIGFsc28gc2FtZSBmb3Igb3RoZXIgb2Yg
eW91ciBjb21taXRzLCBwbGVhc2UNCj4gcmVmbG93IGJldHdlZW4NCj4gNzAgYW5kIDc1IGFzIHN1
Z2dlc3RlZCBpbiB0aGUgZ3VpZGUuIEl0IHNob3VsZCBsb29rIGV2ZW4uDQoNClRoYW5rcyBhIGxv
dC4gSSB3aWxsIHJlZmluZSB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+IA0KPiA+IA0KPiA+IEZpeGVz
OiAwZmE0OWRmNDIyMmYgKCJtZWRpYTogbXRrLWpwZWdkZWM6IHN1cHBvcnQganBlZ2RlYyBtdWx0
aS0NCj4gPiBoYXJkd2FyZSIpDQo+ID4gRml4ZXM6IGRlZGMyMTUwMDMzNCAoIm1lZGlhOiBtdGst
anBlZ2RlYzogYWRkIGpwZWcgZGVjb2RlIHdvcmtlcg0KPiA+IGludGVyZmFjZSIpDQo+ID4gRml4
ZXM6IDkzNGU4YmNjYWM5NSAoIm10ay1qcGVnZW5jOiBzdXBwb3J0IGpwZWdlbmMgbXVsdGktaGFy
ZHdhcmUiKQ0KPiA+IEZpeGVzOiA1ZmIxYzIzNjFlNTYgKCJtdGstanBlZ2VuYzogYWRkIGpwZWcg
ZW5jb2RlIHdvcmtlcg0KPiA+IGludGVyZmFjZSIpDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
S3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL21lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jIHwgMTYNCj4gPiArKysrKysr
KysrKysrKysrDQo+ID4gIC4uLi9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2NvcmUuaCB8ICAyICsrDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2RlY19ody5jICAgICB8ICA5ICsrKysrKysrKw0KPiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsv
anBlZy9tdGtfanBlZ19lbmNfaHcuYyAgICAgfCAgOSArKysrKysrKysNCj4gPiAgNCBmaWxlcyBj
aGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBpbmRl
eCBiZDBhZmM5M2Q0OTEuLjU5ZmQ3OWM4OWY4OCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuYw0KPiA+IEBA
IC04NTcsOCArODU3LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyDQo+ID4gKm10
a19qcGVnX2J1Zl9yZW1vdmUoc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LA0KPiA+ICBzdGF0aWMg
dm9pZCBtdGtfanBlZ19lbmNfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqcSkNCj4g
PiAgew0KPiA+ICAJc3RydWN0IG10a19qcGVnX2N0eCAqY3R4ID0gdmIyX2dldF9kcnZfcHJpdihx
KTsNCj4gPiArCXN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcgPSBjdHgtPmpwZWc7DQo+ID4gIAlz
dHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICp2YjsNCj4gPiAgDQo+ID4gKwlpZiAoanBlZy0+dmFyaWFu
dC0+bXVsdGlfY29yZSkNCj4gPiArCQl3YWl0X2V2ZW50KGpwZWctPmh3X3dxLCAoYXRvbWljX3Jl
YWQoJmN0eC0NCj4gPiA+YnVmX2xpc3RfY250KSA9PSAwKSk7DQo+ID4gKw0KPiANCj4gQ2FuJ3Qg
aXQgc2ltcGx5IGJlIHNvbHZlZCB3aXRoIHZiMl93YWl0X2Zvcl9hbGxfYnVmZmVycygpID8NCj4g
DQo+IE5pY29sYXMNCg0KRGVhciBOaWNvbGFzLA0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlv
bi4gSSB0aGluayBpdCBiZXR0ZXIgdGhhbiBtaW5lLg0KSSB3aWxsIGNoYW5nZSB0byB1c2UgaXQu
DQoNClJlZ2FyZHMsDQpLeXJpZS4NCj4gDQo+ID4gIAl3aGlsZSAoKHZiID0gbXRrX2pwZWdfYnVm
X3JlbW92ZShjdHgsIHEtPnR5cGUpKSkNCj4gPiAgCQl2NGwyX20ybV9idWZfZG9uZSh2YiwgVkIy
X0JVRl9TVEFURV9FUlJPUik7DQo+ID4gIH0NCj4gPiBAQCAtODY2LDYgKzg3MCw3IEBAIHN0YXRp
YyB2b2lkIG10a19qcGVnX2VuY19zdG9wX3N0cmVhbWluZyhzdHJ1Y3QNCj4gPiB2YjJfcXVldWUg
KnEpDQo+ID4gIHN0YXRpYyB2b2lkIG10a19qcGVnX2RlY19zdG9wX3N0cmVhbWluZyhzdHJ1Y3Qg
dmIyX3F1ZXVlICpxKQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHggPSB2
YjJfZ2V0X2Rydl9wcml2KHEpOw0KPiA+ICsJc3RydWN0IG10a19qcGVnX2RldiAqanBlZyA9IGN0
eC0+anBlZzsNCj4gPiAgCXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgKnZiOw0KPiA+ICANCj4gPiAg
CS8qDQo+ID4gQEAgLTg3Myw2ICs4NzgsOSBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ19kZWNfc3Rv
cF9zdHJlYW1pbmcoc3RydWN0DQo+ID4gdmIyX3F1ZXVlICpxKQ0KPiA+ICAJICogQmVmb3JlIFNU
UkVBTU9GRiwgd2Ugc3RpbGwgaGF2ZSB0byByZXR1cm4gdGhlIG9sZCByZXNvbHV0aW9uDQo+ID4g
YW5kDQo+ID4gIAkgKiBzdWJzYW1wbGluZy4gVXBkYXRlIGNhcHR1cmUgcXVldWUgd2hlbiB0aGUg
c3RyZWFtIGlzIG9mZi4NCj4gPiAgCSAqLw0KPiA+ICsJaWYgKGpwZWctPnZhcmlhbnQtPm11bHRp
X2NvcmUpDQo+ID4gKwkJd2FpdF9ldmVudChqcGVnLT5od193cSwgKGF0b21pY19yZWFkKCZjdHgt
DQo+ID4gPmJ1Zl9saXN0X2NudCkgPT0gMCkpOw0KPiA+ICsNCj4gPiAgCWlmIChjdHgtPnN0YXRl
ID09IE1US19KUEVHX1NPVVJDRV9DSEFOR0UgJiYNCj4gPiAgCSAgICBWNEwyX1RZUEVfSVNfQ0FQ
VFVSRShxLT50eXBlKSkgew0KPiA+ICAJCXN0cnVjdCBtdGtfanBlZ19zcmNfYnVmICpzcmNfYnVm
Ow0KPiA+IEBAIC0xMTgxLDYgKzExODksNyBAQCBzdGF0aWMgaW50IG10a19qcGVnX29wZW4oc3Ry
dWN0IGZpbGUgKmZpbGUpDQo+ID4gIAlzcGluX2xvY2tfaW5pdCgmY3R4LT5kb25lX3F1ZXVlX2xv
Y2spOw0KPiA+ICAJdjRsMl9maF9pbml0KCZjdHgtPmZoLCB2ZmQpOw0KPiA+ICAJdjRsMl9maF9h
ZGQoJmN0eC0+ZmgsIGZpbGUpOw0KPiA+ICsJYXRvbWljX3NldCgmY3R4LT5idWZfbGlzdF9jbnQs
IDApOw0KPiA+ICANCj4gPiAgCWN0eC0+anBlZyA9IGpwZWc7DQo+ID4gIAljdHgtPmZoLm0ybV9j
dHggPSB2NGwyX20ybV9jdHhfaW5pdChqcGVnLT5tMm1fZGV2LCBjdHgsDQo+ID4gQEAgLTE1NjMs
NiArMTU3MiwxMSBAQCBzdGF0aWMgaW50IG10a19qcGVnZGVjX3NldF9od19wYXJhbShzdHJ1Y3QN
Cj4gPiBtdGtfanBlZ19jdHggKmN0eCwNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4gIA0K
PiA+ICtzdGF0aWMgdm9pZCBqcGVnX2J1Zl9xdWV1ZV9pbmMoc3RydWN0IG10a19qcGVnX2N0eCAq
Y3R4KQ0KPiA+ICt7DQo+ID4gKwlhdG9taWNfaW5jKCZjdHgtPmJ1Zl9saXN0X2NudCk7DQo+ID4g
K30NCj4gPiArDQo+ID4gIHN0YXRpYyBpcnFyZXR1cm5fdCBtdGtfanBlZ19lbmNfZG9uZShzdHJ1
Y3QgbXRrX2pwZWdfZGV2ICpqcGVnKQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3QgbXRrX2pwZWdfY3R4
ICpjdHg7DQo+ID4gQEAgLTE2NzEsNiArMTY4NSw3IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnZW5j
X3dvcmtlcihzdHJ1Y3QNCj4gPiB3b3JrX3N0cnVjdCAqd29yaykNCj4gPiAgCQkJICAgICAmc3Jj
X2J1Zi0+dmIyX2J1Zik7DQo+ID4gIAltdGtfanBlZ19zZXRfZW5jX3BhcmFtcyhjdHgsIGNvbXBf
anBlZ1tod19pZF0tPnJlZ19iYXNlKTsNCj4gPiAgCW10a19qcGVnX2VuY19zdGFydChjb21wX2pw
ZWdbaHdfaWRdLT5yZWdfYmFzZSk7DQo+ID4gKwlqcGVnX2J1Zl9xdWV1ZV9pbmMoY3R4KTsNCj4g
PiAgCXY0bDJfbTJtX2pvYl9maW5pc2goanBlZy0+bTJtX2RldiwgY3R4LT5maC5tMm1fY3R4KTsN
Cj4gPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNvbXBfanBlZ1tod19pZF0tPmh3X2xvY2ss
IGZsYWdzKTsNCj4gPiAgDQo+ID4gQEAgLTE3ODYsNiArMTgwMSw3IEBAIHN0YXRpYyB2b2lkIG10
a19qcGVnZGVjX3dvcmtlcihzdHJ1Y3QNCj4gPiB3b3JrX3N0cnVjdCAqd29yaykNCj4gPiAgCQkJ
CSZicywNCj4gPiAgCQkJCSZmYik7DQo+ID4gIAltdGtfanBlZ19kZWNfc3RhcnQoY29tcF9qcGVn
W2h3X2lkXS0+cmVnX2Jhc2UpOw0KPiA+ICsJanBlZ19idWZfcXVldWVfaW5jKGN0eCk7DQo+ID4g
IAl2NGwyX20ybV9qb2JfZmluaXNoKGpwZWctPm0ybV9kZXYsIGN0eC0+ZmgubTJtX2N0eCk7DQo+
ID4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjb21wX2pwZWdbaHdfaWRdLT5od19sb2NrLCBm
bGFncyk7DQo+ID4gIA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5oDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5oDQo+ID4gaW5kZXggMTQ4ZmQ0MTc1OWI3Li4z
M2Y3ZmJjNGNhNWUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay9qcGVnL210a19qcGVnX2NvcmUuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmgNCj4gPiBAQCAtMjg4LDYgKzI4OCw3IEBA
IHN0cnVjdCBtdGtfanBlZ19xX2RhdGEgew0KPiA+ICAgKiBAZHN0X2RvbmVfcXVldWU6CQllbmNv
ZGVkIGZyYW1lIGJ1ZmZlciBxdWV1ZQ0KPiA+ICAgKiBAZG9uZV9xdWV1ZV9sb2NrOgkJZW5jb2Rl
ZCBmcmFtZSBvcGVyYXRpb24NCj4gPiBzcGlubG9jaw0KPiA+ICAgKiBAbGFzdF9kb25lX2ZyYW1l
X251bToJdGhlIGxhc3QgZW5jb2RlZCBmcmFtZSBudW1iZXINCj4gPiArICogQGJ1Zl9saXN0X2Nu
dDoJCXRoZSBmcmFtZSBidWZmZXIgY291bnQgb3duIGJ5IGpwZWcNCj4gPiBkcml2ZXINCj4gPiAg
ICovDQo+ID4gIHN0cnVjdCBtdGtfanBlZ19jdHggew0KPiA+ICAJc3RydWN0IG10a19qcGVnX2Rl
dgkJKmpwZWc7DQo+ID4gQEAgLTMwNiw2ICszMDcsNyBAQCBzdHJ1Y3QgbXRrX2pwZWdfY3R4IHsN
Cj4gPiAgCS8qIHNwaW5sb2NrIHByb3RlY3RpbmcgdGhlIGVuY29kZSBkb25lIGJ1ZmZlciAqLw0K
PiA+ICAJc3BpbmxvY2tfdCBkb25lX3F1ZXVlX2xvY2s7DQo+ID4gIAl1MzIgbGFzdF9kb25lX2Zy
YW1lX251bTsNCj4gPiArCWF0b21pY190IGJ1Zl9saXN0X2NudDsNCj4gPiAgfTsNCj4gPiAgDQo+
ID4gICNlbmRpZiAvKiBfTVRLX0pQRUdfQ09SRV9IICovDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+IGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2RlY19ody5jDQo+
ID4gaW5kZXggYTFlNTQ3MTVjYjdlLi44NGQxMmVlYTM1ZjcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2RlY19ody5jDQo+ID4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2RlY19o
dy5jDQo+ID4gQEAgLTUxOSw2ICs1MTksMTEgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdkZWNfcHV0
X2J1ZihzdHJ1Y3QNCj4gPiBtdGtfanBlZ2RlY19jb21wX2RldiAqanBlZykNCj4gPiAgCXNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJmN0eC0+ZG9uZV9xdWV1ZV9sb2NrLCBmbGFncyk7DQo+ID4gIH0N
Cj4gPiAgDQo+ID4gK3N0YXRpYyB2b2lkIGpwZWdfYnVmX3F1ZXVlX2RlYyhzdHJ1Y3QgbXRrX2pw
ZWdfY3R4ICpjdHgpDQo+ID4gK3sNCj4gPiArCWF0b21pY19kZWMoJmN0eC0+YnVmX2xpc3RfY250
KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHZvaWQgbXRrX2pwZWdkZWNfdGltZW91dF93
b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gPiAgew0KPiA+ICAJZW51bSB2YjJfYnVm
ZmVyX3N0YXRlIGJ1Zl9zdGF0ZSA9IFZCMl9CVUZfU1RBVEVfRVJST1I7DQo+ID4gQEAgLTUyNyw5
ICs1MzIsMTEgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdkZWNfdGltZW91dF93b3JrKHN0cnVjdA0K
PiA+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+ICAJCQkgICAgIGpvYl90aW1lb3V0X3dvcmsud29y
ayk7DQo+ID4gIAlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICptYXN0ZXJfanBlZyA9IGNqcGVnLT5tYXN0
ZXJfZGV2Ow0KPiA+ICAJc3RydWN0IHZiMl92NGwyX2J1ZmZlciAqc3JjX2J1ZiwgKmRzdF9idWY7
DQo+ID4gKwlzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHg7DQo+ID4gIA0KPiA+ICAJc3JjX2J1ZiA9
IGNqcGVnLT5od19wYXJhbS5zcmNfYnVmZmVyOw0KPiA+ICAJZHN0X2J1ZiA9IGNqcGVnLT5od19w
YXJhbS5kc3RfYnVmZmVyOw0KPiA+ICsJY3R4ID0gY2pwZWctPmh3X3BhcmFtLmN1cnJfY3R4Ow0K
PiA+ICAJdjRsMl9tMm1fYnVmX2NvcHlfbWV0YWRhdGEoc3JjX2J1ZiwgZHN0X2J1ZiwgdHJ1ZSk7
DQo+ID4gIA0KPiA+ICAJbXRrX2pwZWdfZGVjX3Jlc2V0KGNqcGVnLT5yZWdfYmFzZSk7DQo+ID4g
QEAgLTU0MCw2ICs1NDcsNyBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ2RlY190aW1lb3V0X3dvcmso
c3RydWN0DQo+ID4gd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gIAl3YWtlX3VwKCZtYXN0ZXJfanBl
Zy0+aHdfd3EpOw0KPiA+ICAJdjRsMl9tMm1fYnVmX2RvbmUoc3JjX2J1ZiwgYnVmX3N0YXRlKTsN
Cj4gPiAgCW10a19qcGVnZGVjX3B1dF9idWYoY2pwZWcpOw0KPiA+ICsJanBlZ19idWZfcXVldWVf
ZGVjKGN0eCk7DQo+ID4gIH0NCj4gPiAgDQo+ID4gIHN0YXRpYyBpcnFyZXR1cm5fdCBtdGtfanBl
Z2RlY19od19pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpwcml2KQ0KPiA+IEBAIC01ODAsNiAr
NTg4LDcgQEAgc3RhdGljIGlycXJldHVybl90DQo+ID4gbXRrX2pwZWdkZWNfaHdfaXJxX2hhbmRs
ZXIoaW50IGlycSwgdm9pZCAqcHJpdikNCj4gPiAgCWJ1Zl9zdGF0ZSA9IFZCMl9CVUZfU1RBVEVf
RE9ORTsNCj4gPiAgCXY0bDJfbTJtX2J1Zl9kb25lKHNyY19idWYsIGJ1Zl9zdGF0ZSk7DQo+ID4g
IAltdGtfanBlZ2RlY19wdXRfYnVmKGpwZWcpOw0KPiA+ICsJanBlZ19idWZfcXVldWVfZGVjKGN0
eCk7DQo+ID4gIAlwbV9ydW50aW1lX3B1dChjdHgtPmpwZWctPmRldik7DQo+ID4gIAljbGtfZGlz
YWJsZV91bnByZXBhcmUoanBlZy0+amRlY19jbGsuY2xrcy0+Y2xrKTsNCj4gPiAgDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19l
bmNfaHcuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19q
cGVnX2VuY19ody5jDQo+ID4gaW5kZXggMjhkMDU5MDljOTZmLi4xODYyNDQ0ZjM1ZjUgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2VuY19ody5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVn
L210a19qcGVnX2VuY19ody5jDQo+ID4gQEAgLTI0OCw2ICsyNDgsMTEgQEAgc3RhdGljIHZvaWQg
bXRrX2pwZWdlbmNfcHV0X2J1ZihzdHJ1Y3QNCj4gPiBtdGtfanBlZ2VuY19jb21wX2RldiAqanBl
ZykNCj4gPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmN0eC0+ZG9uZV9xdWV1ZV9sb2NrLCBm
bGFncyk7DQo+ID4gIH0NCj4gPiAgDQo+ID4gK3N0YXRpYyB2b2lkIGpwZWdfYnVmX3F1ZXVlX2Vu
YyhzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHgpDQo+ID4gK3sNCj4gPiArCWF0b21pY19kZWMoJmN0
eC0+YnVmX2xpc3RfY250KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHZvaWQgbXRrX2pw
ZWdlbmNfdGltZW91dF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4gPiAgew0KPiA+
ICAJc3RydWN0IGRlbGF5ZWRfd29yayAqZGx5X3dvcmsgPSB0b19kZWxheWVkX3dvcmsod29yayk7
DQo+ID4gQEAgLTI1OCw5ICsyNjMsMTEgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdlbmNfdGltZW91
dF93b3JrKHN0cnVjdA0KPiA+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+ICAJc3RydWN0IG10a19q
cGVnX2RldiAqbWFzdGVyX2pwZWcgPSBjanBlZy0+bWFzdGVyX2RldjsNCj4gPiAgCWVudW0gdmIy
X2J1ZmZlcl9zdGF0ZSBidWZfc3RhdGUgPSBWQjJfQlVGX1NUQVRFX0VSUk9SOw0KPiA+ICAJc3Ry
dWN0IHZiMl92NGwyX2J1ZmZlciAqc3JjX2J1ZiwgKmRzdF9idWY7DQo+ID4gKwlzdHJ1Y3QgbXRr
X2pwZWdfY3R4ICpjdHg7DQo+ID4gIA0KPiA+ICAJc3JjX2J1ZiA9IGNqcGVnLT5od19wYXJhbS5z
cmNfYnVmZmVyOw0KPiA+ICAJZHN0X2J1ZiA9IGNqcGVnLT5od19wYXJhbS5kc3RfYnVmZmVyOw0K
PiA+ICsJY3R4ID0gY2pwZWctPmh3X3BhcmFtLmN1cnJfY3R4Ow0KPiA+ICAJdjRsMl9tMm1fYnVm
X2NvcHlfbWV0YWRhdGEoc3JjX2J1ZiwgZHN0X2J1ZiwgdHJ1ZSk7DQo+ID4gIA0KPiA+ICAJbXRr
X2pwZWdfZW5jX3Jlc2V0KGNqcGVnLT5yZWdfYmFzZSk7DQo+ID4gQEAgLTI3MSw2ICsyNzgsNyBA
QCBzdGF0aWMgdm9pZCBtdGtfanBlZ2VuY190aW1lb3V0X3dvcmsoc3RydWN0DQo+ID4gd29ya19z
dHJ1Y3QgKndvcmspDQo+ID4gIAl3YWtlX3VwKCZtYXN0ZXJfanBlZy0+aHdfd3EpOw0KPiA+ICAJ
djRsMl9tMm1fYnVmX2RvbmUoc3JjX2J1ZiwgYnVmX3N0YXRlKTsNCj4gPiAgCW10a19qcGVnZW5j
X3B1dF9idWYoY2pwZWcpOw0KPiA+ICsJanBlZ19idWZfcXVldWVfZW5jKGN0eCk7DQo+ID4gIH0N
Cj4gPiAgDQo+ID4gIHN0YXRpYyBpcnFyZXR1cm5fdCBtdGtfanBlZ2VuY19od19pcnFfaGFuZGxl
cihpbnQgaXJxLCB2b2lkICpwcml2KQ0KPiA+IEBAIC0zMDQsNiArMzEyLDcgQEAgc3RhdGljIGly
cXJldHVybl90DQo+ID4gbXRrX2pwZWdlbmNfaHdfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAq
cHJpdikNCj4gPiAgCWJ1Zl9zdGF0ZSA9IFZCMl9CVUZfU1RBVEVfRE9ORTsNCj4gPiAgCXY0bDJf
bTJtX2J1Zl9kb25lKHNyY19idWYsIGJ1Zl9zdGF0ZSk7DQo+ID4gIAltdGtfanBlZ2VuY19wdXRf
YnVmKGpwZWcpOw0KPiA+ICsJanBlZ19idWZfcXVldWVfZW5jKGN0eCk7DQo+ID4gIAlwbV9ydW50
aW1lX3B1dChjdHgtPmpwZWctPmRldik7DQo+ID4gIAljbGtfZGlzYWJsZV91bnByZXBhcmUoanBl
Zy0+dmVuY19jbGsuY2xrcy0+Y2xrKTsNCj4gPiAgDQo+IA0KPiAJQ291bGQgbm90IHBhcnNlIFMv
TUlNRSBtZXNzYWdlOiBzZWN1cml0eSBsaWJyYXJ5OiBpbXByb3Blcmx5DQo+IGZvcm1hdHRlZCBE
RVItZW5jb2RlZCBtZXNzYWdlLiAoLTgxODMpIC0gRGVjb2RlciBmYWlsZWQNCg==

