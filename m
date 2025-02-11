Return-Path: <linux-media+bounces-25977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA8A3033B
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 07:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67E673A425F
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 06:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA0C1E633C;
	Tue, 11 Feb 2025 06:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LVwWRDzg"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A7E2C9A;
	Tue, 11 Feb 2025 06:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254042; cv=fail; b=m7A3rS2OzV6MLZ/q8C+zsEeWcKVqd2yoDMb+rSs56+jNSGa0WvkViRDvLOD516s1XJ3cemUUAm4WVFiIcEoIFiC0ucM4MnJnUhgAdctLPebhuggFA1AVnZDoRIi/h37XJBZLXlxcpRakA4mvmIMAOrozrVx2NAyVPNH+LRZ0jGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254042; c=relaxed/simple;
	bh=TaBvYa54lu/LnGNupbLiyL1E2k4Mv3TYww/wz9bVz6s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jKeqOo0JFaE+cZOIQSczsn3zVs6tjlcOzwUm0P5w+UPgLDB30ffj5zB07WKYLTVgq5S/4u0ydV4O14/vY23toqZ+QCFG7ODxxzLkj+7MeExdMcqdNxfmJ6jJNTYKADV3uExATQlEufjHzV3iREG2IHSYW6nDJbtA8KyoZG5W+ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LVwWRDzg; arc=fail smtp.client-ip=52.101.66.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROavZZSumfChULrHX8APZuU/EyOB/kVYWTpgntAOcm+bt6vAhWzYuMtLQd/KU0RIANH28/t38GrVjc1Y2CTzGb5MqrPJEDZB9sfvmcbmgF1ZLUbJ4DpkvSBR/VwFpAwg9qzmyG2xZu6q6LqMZ+4kZNLwVqObf4JmB4SGLBPZUmUGkYYqkeVAvSWWBeWnfbpBIKYO1un/NjlFPUtRPP5AegH4k3LstxvbI99Rf28yp7D5To1z3/7VOezFOPa5ei0ZThqmvVNqeoqOkh54Z1J83ZVY3NxIt9zz7spFjr99s57BJJPG6nlBlmIFIvbBOX34PTJbOrO5ziIYXS0gFVyiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2xT95YRdVSeCNeVKtO5ayI6CX4U1B9FGkTneXvNRXY=;
 b=EsNCFMfZr/uxO4XhI55AxOcbLFtcdA7VPz9o5jlsO/Y+RmGJGb6WOadtKKz+d+e/qu54lP4M8jA8PxYNJtWWRqARtfwABAudxfjJh0QN0sSs9DoqNW30tyX0hmJ5fSDmeeSw1XeiTrRs6fSEtpi0ZSj1Js1Xq98rh0qZD+CJRdX7cYAwROqL1jrSfRJ11Kth5LXfzzVvqjIzmYiZnbSRjZgn2fs08HjJIh5gBYL7iphM7ZGHKkvCfFdtFfEM0bIqzth4pGmf4mzsuNGZ+fH10R7xlXd81B4ofoKexajGyZBIUhfWSwZG0Ydf+JyH0Pqk3uk0M/8ayZUknunWQ0hqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2xT95YRdVSeCNeVKtO5ayI6CX4U1B9FGkTneXvNRXY=;
 b=LVwWRDzg+anir33ZyHcQgLQJSVZH+Y5RPduufNr7eXfdJnyETYVS4hH3e7RDIV1ArekEAC/1kEP8ytspEPuXAuLT0Qf2BKXZkm9czb7QoeZFI5OCS5H8/Wgwc6HTuF+3+TzZjJ+OMVJMgMVo2Si+zXy26CEgqiIZ03/Y2/3OKaCL88fZWny1E+mTuxIGak4rFaQ6V82UuQ7dnilOefsQStjzlyLMPIB6JMy4iZgv3UQMCpymnLM4SlF33864k+UsYHue/ezTS9YNaduegVCcakx+YFXI6p26rMTZnvm2ANp8u1BBDV/PL45NYDuswYmv58aHSSr0DkU0zJ1xWqF70w==
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10904.eurprd04.prod.outlook.com (2603:10a6:800:269::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 06:07:16 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 06:07:16 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx
	<linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "jackson.lee@chipsnmedia.com"
	<jackson.lee@chipsnmedia.com>, "lafley.kim@chipsnmedia.com"
	<lafley.kim@chipsnmedia.com>
Subject: RE: [EXT] [PATCH 0/8] Add support for Wave6 video codec driver
Thread-Topic: [EXT] [PATCH 0/8] Add support for Wave6 video codec driver
Thread-Index: AQHbe5tKHQXUB6TtpUOmBraablejdLNBni6A
Date: Tue, 11 Feb 2025 06:07:16 +0000
Message-ID:
 <PAXPR04MB82549B7FCA3016B4BDCB478AE7FD2@PAXPR04MB8254.eurprd04.prod.outlook.com>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
In-Reply-To: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8254:EE_|VI0PR04MB10904:EE_
x-ms-office365-filtering-correlation-id: f7bfe316-cd5a-4df3-1879-08dd4a625602
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KJOQIn4zA+jwD/gBNxpVoJ67cr5U4IR8/2xA+gpb2VvmOKAVDKOKEN08JYbO?=
 =?us-ascii?Q?RgMOV6Waf9gILXZk5ffPMXul4C5FD+DttbkeLLbOXSdv5uW3GGwUOfNww645?=
 =?us-ascii?Q?qezPzDTx30uZiKsfxehFiqN6rPoYBL9tyvhmv9cCitW2rUw+rFtqpvjG849+?=
 =?us-ascii?Q?SxVEZPsQCIqtDZjbMsj1MGNd2LLtMxtLsXJJUgctd7bDMxYc4kWyo3gGwiQv?=
 =?us-ascii?Q?Byo5NtEPbjrvdi54oZ86D3voSvOiK7jlPKfWrHfR3woxmV6c2Peuk/36dAAM?=
 =?us-ascii?Q?QFBY7xCPhjF65K9/e5lIbCCDnjce3Ke9Qnv6HHiUiAE1UFJ/JahUJ5eKrHfN?=
 =?us-ascii?Q?nYLSczpY7QEorpC0/NkF5jaA2bxdutlKPq2xniBZycvSj95mn/eZq9m+YEVd?=
 =?us-ascii?Q?GwfMWmmaeGal+FsX0/qeCI64zc7w2w/8CNMYfyU5uxMXCD/376yULk2VCswb?=
 =?us-ascii?Q?M21jCM5IlRct/c3xh9zScU3b60yN6eypOOxiyCPNPjCcXRquYk4ItMDfNRuJ?=
 =?us-ascii?Q?d9Wts+j8UsgtJSI2+Vb0tb99PuS2HcRtSHcjoW5t1rI2O+vZ+/5soOTHWcMq?=
 =?us-ascii?Q?LS3bHX2FyzJ5+c8eGkUQFkjDV5oh0DJPcf/VLvDpFO5zmS2qlvnrbPBV5k88?=
 =?us-ascii?Q?cBniyzlOZRupf3pBzcvuR0GJgfqDfeTsvgY0TcdIgeXlT8bIl5fzXRLK/38H?=
 =?us-ascii?Q?mS/8Lp8bh7zVjIoCqNB3FWuc+k6SfwEHrNZTzJntEg21yVtPXBru3suBRwFR?=
 =?us-ascii?Q?n2T82XR/KdYCdImwH7RMnGV0UuhWb7EbIgQTEDX9gSTmxg/YvY3E4NcQ8lRh?=
 =?us-ascii?Q?Rfs4rK5dR5u7xpYXqurOH4ZVhqEdhu2MUIg+YXlQ7Q71VDE6qJzK0BMIjFBN?=
 =?us-ascii?Q?ek+fbNiO05PhWomEk0SaJFsx2KIfUPKNDC5//m83wjAAYvIvg9liG/Oa1g7H?=
 =?us-ascii?Q?94Qs8LcOFTZ144KsS6NlRliZJumKKyClyl6OVVZxw7vh4EJ8Lh1AhGdMMPDd?=
 =?us-ascii?Q?QZupSHUcoR/nZHriRmlmjkUMbNBXYayD+xwCCT1u7/QPZUklq2wiuv+93KJ4?=
 =?us-ascii?Q?NKplKTtI5cK0EE8N7vqAJEYJDNVPA+JYxLaXlLCKB2LVAOWF3PfyIBxOTOzv?=
 =?us-ascii?Q?fjyBPGu6V8HcKHMZq8s2iScaSoxrKmB7ioy6A6H/A/EqW8lf1KwqrZFx3fF2?=
 =?us-ascii?Q?7ODM8bZ6Jz/SDpoKx/E43d+luwnKXKgIn/Mvu6GKXlWoJQweOtdvOtYP4a2u?=
 =?us-ascii?Q?QGazWqNGZUnVicxG/5bK/fhSZAvV1LuAfULECi39igXQG6gl9QAr+tQNTug+?=
 =?us-ascii?Q?GbzpPiEllyGOT9eCUO7Fz+/SrCQZTpZxt/rWPXj8nTCjOh+i6HGrRDXaCgoi?=
 =?us-ascii?Q?rQA3pqFigf0e4eR7LLWQKKiKkyASS6l1rU8lEW8f/XmPjqTCnjEDeukuJhbv?=
 =?us-ascii?Q?dEguMN8wz1WqE7IwZIpi7oA0bBDmmN/X?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mc5Op/pc5wPWgCtlmhTvOJHgIqkG3m0QWV1kVFJPIK922VngRWzmLDCUDPvK?=
 =?us-ascii?Q?EUO82TmqzujVyy7p3OdGfv5n+M8/kgUfxrVp8D597nOd0t2w+t2DX7x/jRgV?=
 =?us-ascii?Q?cqojb7nSp30dM/3XHUAa75Qp5qpn9IMEDD9Fo6FoEZOEPuhC5JH8SzeNg1q2?=
 =?us-ascii?Q?V18OkW6ymT5kvpiT65n8/GzmHWuIEUqGGsFVY+FDQIOpIoYK3vxJeSdVCxYd?=
 =?us-ascii?Q?UgFl4z88yYQcA9lJgr0xIxW7/VuLUjLsUfH+7kPVCpXESQMX/12VK+uR33iS?=
 =?us-ascii?Q?hE1Dzzzp3mlMnPxdcYSQ/fxswtMcq5TIPR0pu96IuGHv/d7BQTmPrvCd4Pey?=
 =?us-ascii?Q?SyM5LKGcZrfAFNtTQOd++mPktcfu3CQ3gZkhdw7cV8z4YYW//oqzDMizaQ5k?=
 =?us-ascii?Q?4cD5WoNcKW2WIGjmmdhMaRx4Mex/x8+mNxA+WDNwtEsKAXVV3sn95zIkOVFO?=
 =?us-ascii?Q?X+vR+HdNUslc0+Nz0wUhbV2dcx+Pubgj1RTMzRK+cIsd5Uej/t1b3M1mor9S?=
 =?us-ascii?Q?kXs2pwS9jk3MEUbQyVCN5AZC6rauYiPDZI4gJh90SSG2HbbhzK78tGACvoO/?=
 =?us-ascii?Q?bq0VXsNf1urWF8d8rgGmoyyMX2Gket3Mb1NK+znRz/sOUeKNa/fOer7iiWhu?=
 =?us-ascii?Q?a3zKGhndJ8ZRii7SKYGfiNgVaHhJb2ESEdU6jvdAMrs/xIAO4kjLn7wGDxr1?=
 =?us-ascii?Q?Gru1VxBsOp+9sEXiZSzyylBN5P5VqLN2Er8rioXWx4MvP35lLiyX4frwdsM7?=
 =?us-ascii?Q?V8Cxv1psET+QvpgdIUyQ9zsn+1tIezUn+ODNY+lW6SRBummuPrZSXjYXHW+l?=
 =?us-ascii?Q?Voyhz4rwnq3BTuXBG+QDpCq7LiNI8AQpbB75otmuiGajIaVKxmQUdFxJlYHK?=
 =?us-ascii?Q?LYkf5oJCK7Qzz3dbKhgY2dv+X1g2SxG/k0jMZla0sV8o+vjXgN3fXmiE6q6J?=
 =?us-ascii?Q?J1diIN0S/fUhNgdRaZVoYRtiUtV8z03oBShNoSX1EbgyZvh8xOUnj0d1974F?=
 =?us-ascii?Q?IMrvZtFgT7g7xwGkVbVIsegMXg2O1YtZy5T7iB8yKXH94G9k+hWOGJ7Cs4fL?=
 =?us-ascii?Q?BWRu0+Tq5mgqv7C9O3b9pTkIc528f77rKaKs+cAiDhYwnuPxBv8Tvu7PotKP?=
 =?us-ascii?Q?/dVn1VCqeUM3uU5lSmf9bIRCvsXOhmoaOzdSxBE72lJnNlQXYPJOXMLMxI7x?=
 =?us-ascii?Q?f2Rs78iQVlLQXcz28eBuZMtAGU4i74vRaWtNM9onzPJN1vRzB57BfdhbNKGw?=
 =?us-ascii?Q?dr+yOZweljM+ZWx58t2h1m39TN0YVcr/d2hD/OCSvnW+MZntWJnvwU3r1ZPy?=
 =?us-ascii?Q?joe28Fc8zTQ6CWgPrb9DNFMULq13HlqmHcPKNhBjG8vb/FkethQHyR0MstCR?=
 =?us-ascii?Q?vabymUHwD3423kju0dVDlv5L+Ah1Jqnqol3lZurT2x4fFrS0BcQtz1Os395k?=
 =?us-ascii?Q?l59INfu3rF16Z54TR6ps2e2PC9UwiXQz6I9J/1uR92ygQlZQN5S4q4XAsxaL?=
 =?us-ascii?Q?+JnteGB01+wLU5qQFBj/pyj/85ouieGHPu4Xl6wwIsvCUUOIlKl2YFcPQ+xs?=
 =?us-ascii?Q?iYRPq6wlVEB4l7QuO6Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bfe316-cd5a-4df3-1879-08dd4a625602
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 06:07:16.6243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqNYCGTmJLUnnZQgykbYCjbsvkUfcuDCGD7nn4OH65fi1lsaXHw45glajZ5+f26To2XJnulkiULe8eGvGlD3Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10904

Tested on i.MX95, the sanity test pass of encoder and decoder.
Only a v4l2-compliance issue about the  deprecated behavior EOS event, othe=
r than that.

Tested-by: Ming Qian <ming.qian@oss.nxp.com>



>-----Original Message-----
>From: Nas Chung <nas.chung@chipsnmedia.com>
>Sent: Monday, February 10, 2025 5:07 PM
>To: mchehab@kernel.org; hverkuil@xs4all.nl; sebastian.fricke@collabora.com=
;
>robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; linux-arm-
>kernel@lists.infradead.org; jackson.lee@chipsnmedia.com;
>lafley.kim@chipsnmedia.com; Nas Chung <nas.chung@chipsnmedia.com>
>Subject: [EXT] [PATCH 0/8] Add support for Wave6 video codec driver
>
>Caution: This is an external email. Please take care when clicking links o=
r
>opening attachments. When in doubt, report the message using the 'Report
>this email' button
>
>
>This patch series introduces support for the Chips&Media Wave6 video codec
>IP, a completely different hardware architecture compared to Wave5.
>
>The wave6 driver is a M2M stateful encoder/decoder driver.
>It supports various video formats, including H.264 and H.265, for both
>encoding and decoding.
>
>On NXP i.MX SoCs, the Wave6 IP functionality is split between two devices:
>VPU Control Device, Manages shared resources such as firmware access and
>power domains.
>VPU Device, Provides encoding and decoding capabilities.
>The VPU device cannot operate independently without the VPU control device=
.
>
>This driver has been tested with GStreamer on:
>- NXP i.MX95 board
>- pre-silicon FPGA environment
>
>Test results for decoder fluster:
>- JVT-AVC_V1, Ran 77/135 tests successfully              in 35.929 secs
>- JVT-FR-EXT, Ran 25/69 tests successfully               in 17.717 secs
>- JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 81.568 secs
>- All failures are due to unsupported hardware features:
>-- 10bit, Resolutions higher than 4K, FMO, MBAFF
>-- Extended profile, Field encoding and High422 sreams.
>
>Test results for v4l2-compliance:
>v4l2-compliance 1.29.0-5326, 64 bits, 64-bit time_t v4l2-compliance SHA:
>77f5df419204 2025-02-07 08:59:59
>
>Compliance test for wave6-dec device /dev/video0:
>
>Driver Info:
>        Driver name      : wave6-dec
>        Card type        : wave6-dec
>        Bus info         : platform:wave6-dec
>        Driver version   : 6.9.2
>        Capabilities     : 0x84204000
>                Video Memory-to-Memory Multiplanar
>                Streaming
>                Extended Pix Format
>                Device Capabilities
>        Device Caps      : 0x04204000
>                Video Memory-to-Memory Multiplanar
>                Streaming
>                Extended Pix Format
>        Detected Stateful Decoder
>
>Required ioctls:
>        test VIDIOC_QUERYCAP: OK
>        test invalid ioctls: OK
>
>Allow for multiple opens:
>        test second /dev/video0 open: OK
>        test VIDIOC_QUERYCAP: OK
>        test VIDIOC_G/S_PRIORITY: OK
>        test for unlimited opens: OK
>
>Debug ioctls:
>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>
>Input ioctls:
>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>
>Output ioctls:
>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>
>Input/Output configuration ioctls:
>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>        test VIDIOC_G/S_EDID: OK (Not Supported)
>
>Control ioctls:
>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>        test VIDIOC_QUERYCTRL: OK
>        test VIDIOC_G/S_CTRL: OK
>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>                fail: ../utils/v4l2-compliance/v4l2-test-
>controls.cpp(1180): !have_source_change || !have_eos
>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>        Standard Controls: 7 Private Controls: 1
>
>Format ioctls:
>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>        test VIDIOC_G/S_PARM: OK (Not Supported)
>        test VIDIOC_G_FBUF: OK (Not Supported)
>        test VIDIOC_G_FMT: OK
>        test VIDIOC_TRY_FMT: OK
>        test VIDIOC_S_FMT: OK
>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>        test Cropping: OK
>        test Composing: OK
>        test Scaling: OK (Not Supported)
>
>Codec ioctls:
>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>        test VIDIOC_(TRY_)DECODER_CMD: OK
>
>Buffer ioctls:
>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>        test CREATE_BUFS maximum buffers: OK
>        test VIDIOC_REMOVE_BUFS: OK
>        test VIDIOC_EXPBUF: OK
>        test Requests: OK (Not Supported)
>        test blocking wait: OK
>
>Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warn=
ings:
>0
>
>v4l2-compliance 1.29.0-5326, 64 bits, 64-bit time_t v4l2-compliance SHA:
>77f5df419204 2025-02-07 08:59:59
>
>Compliance test for wave6-enc device /dev/video1:
>
>Driver Info:
>        Driver name      : wave6-enc
>        Card type        : wave6-enc
>        Bus info         : platform:wave6-enc
>        Driver version   : 6.9.2
>        Capabilities     : 0x84204000
>                Video Memory-to-Memory Multiplanar
>                Streaming
>                Extended Pix Format
>                Device Capabilities
>        Device Caps      : 0x04204000
>                Video Memory-to-Memory Multiplanar
>                Streaming
>                Extended Pix Format
>        Detected Stateful Encoder
>
>Required ioctls:
>        test VIDIOC_QUERYCAP: OK
>        test invalid ioctls: OK
>
>Allow for multiple opens:
>        test second /dev/video1 open: OK
>        test VIDIOC_QUERYCAP: OK
>        test VIDIOC_G/S_PRIORITY: OK
>        test for unlimited opens: OK
>
>Debug ioctls:
>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>
>Input ioctls:
>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>
>Output ioctls:
>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>
>Input/Output configuration ioctls:
>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>        test VIDIOC_G/S_EDID: OK (Not Supported)
>
>Control ioctls:
>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>        test VIDIOC_QUERYCTRL: OK
>        test VIDIOC_G/S_CTRL: OK
>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>                fail: ../utils/v4l2-compliance/v4l2-test-controls.cpp(1169=
): node-
>>codec_mask & STATEFUL_ENCODER
>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>        Standard Controls: 53 Private Controls: 0
>
>Format ioctls:
>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>        test VIDIOC_G/S_PARM: OK
>        test VIDIOC_G_FBUF: OK (Not Supported)
>        test VIDIOC_G_FMT: OK
>        test VIDIOC_TRY_FMT: OK
>        test VIDIOC_S_FMT: OK
>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>        test Cropping: OK
>        test Composing: OK (Not Supported)
>        test Scaling: OK (Not Supported)
>
>Codec ioctls:
>        test VIDIOC_(TRY_)ENCODER_CMD: OK
>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
>Buffer ioctls:
>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>        test CREATE_BUFS maximum buffers: OK
>        test VIDIOC_REMOVE_BUFS: OK
>        test VIDIOC_EXPBUF: OK
>        test Requests: OK (Not Supported)
>        test blocking wait: OK
>
>Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warn=
ings:
>0
>
>Nas Chung (8):
>  media: platform: chips-media: wave5: Rename Kconfig parameter
>  media: v4l2-common: Add YUV24 format info
>  dt-bindings: media: nxp: Add Wave6 video codec device
>  media: chips-media: wave6: Add Wave6 codec driver
>  media: chips-media: wave6: Add v4l2 m2m driver
>  media: chips-media: wave6: Add Wave6 vpu interface
>  media: chips-media: wave6: Add Wave6 control driver
>  media: chips-media: wave6: Improve debugging capabilities
>
> .../bindings/media/nxp,wave633c.yaml          |  202 ++
> MAINTAINERS                                   |    8 +
> arch/arm64/configs/defconfig                  |    2 +-
> drivers/media/platform/chips-media/Kconfig    |    1 +
> drivers/media/platform/chips-media/Makefile   |    1 +
> .../media/platform/chips-media/wave5/Kconfig  |    6 +-
> .../media/platform/chips-media/wave5/Makefile |    2 +-
> .../media/platform/chips-media/wave6/Kconfig  |   26 +
> .../media/platform/chips-media/wave6/Makefile |   17 +
> .../platform/chips-media/wave6/wave6-hw.c     | 3113 +++++++++++++++++
> .../platform/chips-media/wave6/wave6-hw.h     |   69 +
> .../chips-media/wave6/wave6-regdefine.h       |  675 ++++
> .../platform/chips-media/wave6/wave6-trace.h  |  336 ++
> .../platform/chips-media/wave6/wave6-vdi.c    |   52 +
> .../platform/chips-media/wave6/wave6-vdi.h    |   59 +
> .../chips-media/wave6/wave6-vpu-ctrl.c        | 1020 ++++++
> .../chips-media/wave6/wave6-vpu-ctrl.h        |   38 +
> .../chips-media/wave6/wave6-vpu-dbg.c         |  230 ++
> .../chips-media/wave6/wave6-vpu-dbg.h         |   22 +
> .../chips-media/wave6/wave6-vpu-dec.c         | 1883 ++++++++++
> .../chips-media/wave6/wave6-vpu-enc.c         | 2698 ++++++++++++++
> .../chips-media/wave6/wave6-vpu-v4l2.c        |  381 ++
> .../platform/chips-media/wave6/wave6-vpu.c    |  487 +++
> .../platform/chips-media/wave6/wave6-vpu.h    |  106 +
> .../platform/chips-media/wave6/wave6-vpuapi.c | 1001
>++++++  .../platform/chips-media/wave6/wave6-vpuapi.h |  993 ++++++
> .../chips-media/wave6/wave6-vpuconfig.h       |   80 +
> .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
> drivers/media/v4l2-core/v4l2-common.c         |    1 +
> 29 files changed, 13766 insertions(+), 5 deletions(-)  create mode 100644
>Documentation/devicetree/bindings/media/nxp,wave633c.yaml
> create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
> create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>regdefine.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>trace.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>ctrl.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>ctrl.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>dbg.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>dbg.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>dec.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>enc.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-
>v4l2.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuapi.c
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuapi.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuconfig.h
> create mode 100644 drivers/media/platform/chips-media/wave6/wave6-
>vpuerror.h
>
>--
>2.31.1
>


