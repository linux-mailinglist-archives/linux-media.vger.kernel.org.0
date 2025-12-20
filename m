Return-Path: <linux-media+bounces-49220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71519CD28EA
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 07:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3CDC303FA7F
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 06:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767B62D739B;
	Sat, 20 Dec 2025 06:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="LVGiswhW"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020098.outbound.protection.outlook.com [52.101.227.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E6F15ECCC;
	Sat, 20 Dec 2025 06:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766212675; cv=fail; b=fkq4VKAb5gEzn1QKb2m9SzdmTkyiXprx2z6lbpLdAEgtxhFzRnz/L7haXsAYZgMQ6rXR/ZbDOlLUcSdG/rhC7NYpzkbMKWxN7Byhg/QtZj+kQtZm9cqW2dwqcyxIRoNlgS6QxUoavqh4pOBvdI6T7SLQDxf9eq5K7OxanLR9elk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766212675; c=relaxed/simple;
	bh=HNuwv+W/t7EhJmaG0APGTqp3o1YjLs2dKG/YSnB0Dlo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o5+T80fz60IVR2oYJ5y34X+NLC4CRiYyEmrZ7KPemUVNB/Y++sOB9i0zPnhHBvLmYEFpEVjaYPdeB3zNxoFT8tS3+NZj2/SQDmHs9m4yb700kOrKiBqStEG8W7oyHPvzlPTxKhPOEtsJze2CxLqAywinqDxOYbzGxHWpqvYzzfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=LVGiswhW; arc=fail smtp.client-ip=52.101.227.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNXS4Vsaprt8gwMCH6lBslqUqju4lxb7nwLEqZHkdbs5YGmMXSFQ/TuoXSxzHB8VnprjIrWY9WHv4zm5ghlSsfAx7AMoCngx5CtKOt+Xpab4941YGd4AkoE4hbymILLuLomaUGpNF+Dc3zVKzhnhQxuOH0MK5ELP46HgJr3zc9Hy1yBoTSDmbSn7ANZkr6y7eG6wVhBuD9GpWD5TxIjYooHGVfaJscULABi+o56QyXe8p6SP1CCKOwpIfbrfCaduBZbkZT3+BXqxFV8j8QvqPtOtS4zhr45c7TmC7c9qMaJW5vJ2k5HuOwaYaa86m7OMFem/IcY1LxaU2EfNPPytJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNuwv+W/t7EhJmaG0APGTqp3o1YjLs2dKG/YSnB0Dlo=;
 b=fBQjXgLCAs6cckVR73ujMuUswuRPye+fUjzucNwW/0e/zdjQPU/wjxAO4os+p1B8DZSzncLbzfBqWHR6SGDKf6EBrb/H051OR6iyZQQwb7UUkMq+5MV/RsaL+1uNCXj5FUnbmei6qeWcvwGk4KkzpPexYvDBlB4Mhql//vHx0gT6p3gmuupu94tedvEvhb/rlgwkeCS+eniF9mlXhQX0QwNUHJvFHc3wlxoNfQrlhFlsIwIbsjTXlPav1+zpxL+dsc5VzlHhjBnRNZaXeRs9Ck+fxNhsT66Hj0qtSRmn1WT0Qa8mEKm6/8Q71yQbep3RC0NJpj4V6K6UQ4Vq8pymmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNuwv+W/t7EhJmaG0APGTqp3o1YjLs2dKG/YSnB0Dlo=;
 b=LVGiswhWSK36TZgKjfJYffoUWDoI0PXWIf9pLoSRIjBVM02DvAxMeG/GDIlOGWeUtNJAZFkZ094iYEqaFo/zdTaViPfFft/oghXjxvmi9NS6OShOE1FPiyohA4mRN5YW/taHRaLiCGsgPZZ7GZENvcV8XIGcQHc7RaBCG4ApqxpslGnGL0OUI76cjNh9VSCJucd9KmTa3LKNjo7oZor3Xr8FfZ1n1/F3zaIGPFSH0/nJ8zg9Wv3zdk7ABPGA7COj3FUqPYRJ2SBZmeLq9beq14cYVGgIgm4BzxGXahh/mOJIA5c9rQVfyiRQ4GOQQDKJPGDvKpsNwn7+kVE5Kp3NOA==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAUP287MB5155.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Sat, 20 Dec
 2025 06:37:50 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9434.009; Sat, 20 Dec 2025
 06:37:50 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Hans
 de Goede <hansg@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Svyatoslav Ryhel
	<clamor95@gmail.com>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Thread-Topic: [PATCH v6 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Thread-Index: AQHccMPhgo1J/BjusUO1jkzyKKVaGLUpChEAgAEKVFc=
Date: Sat, 20 Dec 2025 06:37:50 +0000
Message-ID:
 <PN0P287MB2019D9CDB7D2E29A933CDE529AB6A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
 <20251219084526.22841-2-himanshu.bhavani@siliconsignals.io>
 <970b20e1-a98d-43cf-980c-325dc514b997@kernel.org>
In-Reply-To: <970b20e1-a98d-43cf-980c-325dc514b997@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|MAUP287MB5155:EE_
x-ms-office365-filtering-correlation-id: 7582940b-f732-4d04-86ae-08de3f924bc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Jt2AThQjJLsShcYdesf7QHorJQouGwvuJWcoktnvrMoDe35e9/VEY7Y4AN?=
 =?iso-8859-1?Q?hbBe9hNBMFq0H19RlqMTUrPtz5NCLIu5HPQJMgXJhWmDpCe+YCl1AL9BUZ?=
 =?iso-8859-1?Q?q4ZSF49kuSjcbgOy/AvkEGiQ0IbvHrm8kYJhINIEHZNIYJn7DDuYSWRJJC?=
 =?iso-8859-1?Q?Bo5lezzVseDbd/t/G7UI041GAYciBFOpGjYKkbHhabLgJABcEGpNiSqQDv?=
 =?iso-8859-1?Q?K3Z5Q3Yc0e694AdRCkIBGgvZF95/0NqGo8h2ZaYvqowh1aXv4rCI7wRQW3?=
 =?iso-8859-1?Q?ip+4oVuP9fMrmL2hsGl/ly2X33+7NnySPLSFaHptzACdTMyqP+tamga6fp?=
 =?iso-8859-1?Q?rnJ5twJgXkKFhsnNaVSb+XC/zaKoPIeEdM4P50KDHXAPdDNx20J971vrl2?=
 =?iso-8859-1?Q?cfOS8vkV1qt7XmMLbl4dgkTMtQ2r7rLg6yUeNz3kx7mlYiiYVB7/P+clLw?=
 =?iso-8859-1?Q?ao3nQeHs1ZVYO5pGEuxmPdiz8MRrs2465BS1funtDMP8L6aTJ14NLJNuhe?=
 =?iso-8859-1?Q?ThjpcB00U6fMBN5LGIpWAWOFHfo6hp2PHMQNHaPvAboTe9dE1WYu3VR7sd?=
 =?iso-8859-1?Q?QN5LTWLJI02bivp3PvzOZVS/MCRYecuOVeceHKhwCoR7SPEZYDwNOrxElH?=
 =?iso-8859-1?Q?73OH00iCb5sQpTrhWPSRrgVHzU/lwAOASnQa6P0BNdIihl3T4ntye8ncNg?=
 =?iso-8859-1?Q?cu43mHtMH1fzD84yeu8WQKzvlnDZG44c+xOdd5nNeo8+Lj2Gz/qBqC98IT?=
 =?iso-8859-1?Q?ZB0rIK1kW3KcAUBlCcZCHK9qlkhnkqtnfodbPR6Kz8BrlTDf2pJCLesDEd?=
 =?iso-8859-1?Q?Pq/czuE09hfDOHwh7goqrQgeuYHxeogj76iO7HTTGiEa26e1jIDT3Lu8n3?=
 =?iso-8859-1?Q?Dw4cJF8peeJfuaxVKSMba9ZSjrVGfvZoORrNS/h/bpkndgwMzUVwH7O4bV?=
 =?iso-8859-1?Q?eMSAFP+FzO/PTke0mH31lE0kU2h2nfzK/TeAVNutih7OPeTCwH2cmaPd0O?=
 =?iso-8859-1?Q?fIZX6ivtnu3a+GfSFPfihEszcFXm4YWuZB0o8RpA1v4d3j1oqRmFaduEFS?=
 =?iso-8859-1?Q?GvzcsHWe7EJOucS0PPrnBBht4ZetSTra2KfeI5kuIc4QvZsq5iaInOc77z?=
 =?iso-8859-1?Q?RKlVmX2bxu98vHrHNyAz60WMLloVtv3j6LKs5S3s9luvTtlzQPEzP4wbg9?=
 =?iso-8859-1?Q?SHzjksZPCQjPJOFu7NDDwjj+E2ddzS6a8xjjfy0+RrJ1zNrXPlhL8ivMHf?=
 =?iso-8859-1?Q?1NqifP8bRhf9BQyuDQ7o9pliEX7SOCNMJQHBLwobaJtTx2s9OGCze00oXD?=
 =?iso-8859-1?Q?M3CpXiluBdIk9jWC0IwfomhiaSI5b9S8m4IVecFBFVgKIm3q+ECpAoCtih?=
 =?iso-8859-1?Q?skzxUXf+1X+2axY1NPcF6aX/QOfDszzfcv+nRshcqAg3eKJbK7eYs67xrt?=
 =?iso-8859-1?Q?MwK4cB4lntIOsD7TjijqdUAZdNzIhAzp7apzjkY1thrtzWVnNSu4vXo37B?=
 =?iso-8859-1?Q?vPRUG2BRwO6VPM5zIuo0eH2T7LQd4n5TtMYbu3Q40WbpMTCOlZMDsxWN6k?=
 =?iso-8859-1?Q?iFYx0un/70D+qu7MyoylUCl9gb0e?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?H8K8NwhR9iEI9h7a4DvJGUENT7C8rQCDY0GKHrM4Z+PIF4+q9tfv1NiQQt?=
 =?iso-8859-1?Q?Z9OEwoNIYhmZZ9g/pN8nwpthXWW3X6qz+dpWQvgp8PfU+TriyckLu1LWci?=
 =?iso-8859-1?Q?joGrBu7Cmw9qeDoLpPmOzP2udw3n7uVNFBPOTCbzTHez9FacJG4mzlQDaO?=
 =?iso-8859-1?Q?8xeyhrccMBP2dT7zmTSVyi+VUpsnMB9ZaCAGaDBVoRJwlIqMFHFWPxLs8M?=
 =?iso-8859-1?Q?WBydudmTDog41vPEKb8Ccuk+WDzomXMQ0Nttx/0G6QuknpADHtrfW0QY1c?=
 =?iso-8859-1?Q?WzJe94+7xDgS+vNP596ULAwVz98pPcUUT14OFhXZ2k1/NhoKNe8eLSzt84?=
 =?iso-8859-1?Q?s/cfH0B/ennp4TGQ6CD81eP9UYPAc6EGqWE5swYTSA/VhBqTdS1fnZ6xR8?=
 =?iso-8859-1?Q?QbdSD9lyMXw+w9cv87ymY7PemlV32zo9cW1LhGR20rkh4UuFrexWvakyG5?=
 =?iso-8859-1?Q?Oo/Ll2NypDxKVxqT0OeikyW3dXvsmIYENxoeguLKHrmyrgoBgqoxzq0RYf?=
 =?iso-8859-1?Q?TmkERBIPFn+qdGc+d55cDNfgZR4zYdj+LqSZ+QxvbIUtZs0INFVmL2xVJX?=
 =?iso-8859-1?Q?Qkr0fUqZeIFCUlPQWrvaC3IiyDk+VeBGrfOE+LxFSg+nZduw3pXrOi+wFb?=
 =?iso-8859-1?Q?roRM5gHqFqse2V+OesttxRzYauAGaAnoSBqihIoVzhy0PdeuZKW6sfMg7r?=
 =?iso-8859-1?Q?Dsgoi3KWmtlDOTg1t2WbkqBf7brRxMgUiZbDxII+uc2XoQBQryh44YJJhf?=
 =?iso-8859-1?Q?CYV3bkow63aKaHgvSosgFqtUrVoJSfLs7ivJCNOqp6nTEsKwZp6DoesSvL?=
 =?iso-8859-1?Q?tHbmTi4YcNj0x0466qjcpyGhLhO3XvbBiugp6KOzrCRetCCIoLeVBYrRgl?=
 =?iso-8859-1?Q?d0szSlfN2jXCKzkAJV7ipkBNuHBx1eNuKZw57tZN9AQiSDe13aUgbOuUMW?=
 =?iso-8859-1?Q?ejfW1SrqdPkKFlZKkfWngiskN6lN8yUhiWcNdbC1qs80RMCFhbxA2gMCze?=
 =?iso-8859-1?Q?h3EIkfToE27sffWREfm8X+ocdfHaTk5xgfX6sizpQxfOqb5Iyon70Ka3Aj?=
 =?iso-8859-1?Q?xxwYyu+8lBklq0KkSNCrRcyF8PUyTBIdkz5rPEEaJSlae+jssKB5ALIDnn?=
 =?iso-8859-1?Q?AmLUEjb/MkIFp54kRjnPL7hOq+SQvljY5P1szEOxrtVIytdxTJEcf+WIeu?=
 =?iso-8859-1?Q?xU0JMqFNy2LUzCl6Yi3Bdkv4ecT/ELrvswEc73uN5P+VUMk1Cwts17C+my?=
 =?iso-8859-1?Q?JD1PdAMOjNPZTMtISopq87pVnJo2i2Fj54phCWjv4Hj8YVkaY4XemJo5+/?=
 =?iso-8859-1?Q?z1Q0dkSvHpB9Dv/a5zH7En8TubejAzohaoby3XoInKYgqE/E0sC9B6ZXXh?=
 =?iso-8859-1?Q?BhVPQh60q08WbzpJrp75Po+ojGD/w5IrGfZWCqGoA9mo18UM8EPGesMydB?=
 =?iso-8859-1?Q?mlon1nXuzmaAasFRrfd8QCOSRt83RUpnul4vZOUC+ZfUjbBR1iYf87oHuk?=
 =?iso-8859-1?Q?Pukk/SyMgVz4mjEpEwoGZP/G4BW9CKFCFofqHb4WZNEEFSNtDgcvZXRC3r?=
 =?iso-8859-1?Q?8nyKoSZ6hd5BpYDEV0mYuwEKGabAR4v0f5huP0i0Rio4Zy2JzgQMP5oWhv?=
 =?iso-8859-1?Q?gQHGuQWlMVZxWl26CcITpB8UF4Kaq6CkDBndxjN9s66xkg4zJ8ggVgl56F?=
 =?iso-8859-1?Q?TDcVDL98Uw9/in+q2tQExEAVmv8ssjxd3nezqVMZlJAt3HfMRwh1IHHX6I?=
 =?iso-8859-1?Q?0uYvCNbpSia4tvGGOEvw07wCFwtpmqJfHHwUihI6OoYUdZyy0ZcnFM5hxD?=
 =?iso-8859-1?Q?foIgg5oQTKm+QW94LeVJ1Z/yv+4Ep+0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7582940b-f732-4d04-86ae-08de3f924bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2025 06:37:50.1432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8WwGr9DLS2bPQD521IRU+7WgO7EiyWtplN/ngoRtHOdBUqx8BvRJPanbPTs5q3IqHTyfeq2tSJCu9Aj8GEQFUOjQHzuFqjoHezSfjEvJ9xrduI3GINnUtujdf/sLYY1U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5155

Hi Krzysztof,=0A=
 =0A=
> On 19/12/2025 09:45, Himanshu Bhavani wrote:=0A=
> > From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
> >=0A=
> > Add bindings for Omnivision OS05B10 sensor.=0A=
> >=0A=
> > Add MAINTAINERS entry for Omnivision OS05B10 binding documentation=0A=
> >=0A=
> > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
> > Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> > Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>=0A=
> > ---=0A=
> =0A=
> =0A=
> Nothing improved and you did not bother to respond to my comment.=0A=
 =0A=
 =0A=
In v5, you pointed out that the driver and bindings were mismatched with =
=0A=
respect to the reset GPIO.=0A=
 =0A=
Based on that feedback, I corrected the driver by making the reset GPIO =0A=
optional. I also reviewed a previous patch series discussion, as suggested =
=0A=
here:=0A=
https://lore.kernel.org/linux-media/20250710210532.GE22436@pendragon.ideaso=
nboard.com/=0A=
 =0A=
In that thread, Laurent suggested that GPIOs should be made optional in the=
 =0A=
driver, which is what I followed in this version.=0A=
 =0A=
If I have still missed something or misunderstood the feedback, please let =
me=0A=
know and I will address it.=0A=
 =0A=
Best Regards,=0A=
Himanshu=

