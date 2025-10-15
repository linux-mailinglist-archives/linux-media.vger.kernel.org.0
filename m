Return-Path: <linux-media+bounces-44508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B61ECBDC93A
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 824754E4DA9
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 05:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171492FF16E;
	Wed, 15 Oct 2025 05:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="gGhqXQE7"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020088.outbound.protection.outlook.com [52.101.156.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A7C2BDC33;
	Wed, 15 Oct 2025 05:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760505119; cv=fail; b=m8sGwbB0Bp73Y6Md0HahpWfKTdKl48QJmqBbMipjmINf+2/g7KVBOZAOs0zlz2LK6Z1IpXZff9BonaqCTzEZvXMJ0nswq9PyuuSGOZb3+majucRYnuSNmJIuipl4NoSa9fG1s04V8kbvcMVFj/apzMMbnB2nn6+p9IgqBiSzl80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760505119; c=relaxed/simple;
	bh=192nuHY7vLj2qt6HrOhRayNqt4tQ7KbxLIh0yrWdfpk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YciqllRDgtFkIfdmocDxprbsqascRKbrauUzRoIc0U+qaSfyctz96TL6U6OhyZLJNLPtrP6LHzDke8kyPPoHpENfDKWsIQLV6CjCCn8O6ZzzT0dhS6WFJAV3YuoFUsuqQ+xBfWT2phKSuBoKPdg/R+hiJexhMA7//AoMysUx8q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=gGhqXQE7; arc=fail smtp.client-ip=52.101.156.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEeVe/zz0ptYFtBGIZjlEpJ4frwC6jSHorM6HjlTFLiPhDMTTy5kLNDRa1Uh6UIPE8QD8x+fzpjt1XUlPx0oVOat6mRbbSCFhPV6iSbA3f/9d2BySti3VtGqW6fnBX+LyvopdRhUBp6l8K3LlHARao0y+DemtRDSvcx4+f18iZQjeZUKf9G3oK/G8vUXER0Oc9SnJFq2gQcXFwWcs5eSWTEcfSclCtuzVfBiwR4PLcYqFpYI2nvbYages1jY23/ZxYwh5OybrmBwLfKux0RTnPMst+VgDDZiBgJyHo0HsiD6Q1lfz1wOhcz1gKukgvLMTMuwwAsikEc7ddgoGa6Y0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMPFFuX364hoG2iVPt86boq7DXB/pIsHGkQLUC3R2vg=;
 b=TNvFEhzDa1jwRmUw4MpwWaUV1KKQKBMl0uSMLIDp8BJQsnpwF5JMsRVKhioNaRP5vrQ8KlGRgG/+0gN8qEi6nilPZlcuMw5n5pgMoCLGz0prEEMhUVJGLvlYml4ZtmhI/tJU+27b4oL6iVgmpKGDmd1QIXB7iJwBoRp37x4GUo6GR5/FTSh+vfOpcoDz9IkWUslTv9jJX5twAHJ8bBpihRLDLDEwvHFV70LHzFdpM6ub8CX3vgwoSl330N+mlKrd1EI72rDTjQ9CTd7vhC6Y+KeRYRgiEjAujRM6UuS/197KX7Clnj2fRkIUDu/yAZlbKGx2l4hNtE23Ywishv48LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMPFFuX364hoG2iVPt86boq7DXB/pIsHGkQLUC3R2vg=;
 b=gGhqXQE7cZHNc5BwyO3oGCmjIDzxMdPje5m8raDWLV0uUPSMOegFRZftNXtes14ZNb+nSfR2XbO5kYSccMx8abb0VvxqDbYY/UdBsgj3M/Fv2eaThsjiNNRRYs1NpkyHOVkaTNxw9YHPADuKeLg0qnUHG2ExjIFZ3WM+QIPjVU8=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE1P216MB1911.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Wed, 15 Oct 2025 05:11:51 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 05:11:51 +0000
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
 AQHbs2lXPGc8hKKJ8U+R1oPOXrRnSrSC0cWAgAEGDICAACOsgIAABgoAgACe0oCAOTQqgIAF4/rg
Date: Wed, 15 Oct 2025 05:11:51 +0000
Message-ID:
 <SL2P216MB12469FADA7A4A6872D1C5D05FBE8A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <f03d0ae0-d28b-4b06-8f63-9d06f15c0522@mailbox.org>
 <fcfa00b5ae102d76b02ce1667d27822e6d2c3c81.camel@ndufresne.ca>
 <472aac3c-9d3e-4892-8d6c-665fa6793464@mailbox.org>
 <59e87d8e346bb16b225382b9a4500e1b16bbf776.camel@ndufresne.ca>
 <PAXPR04MB825499BA447B4000AB8329A6E703A@PAXPR04MB8254.eurprd04.prod.outlook.com>
 <2c431e9a-9e2f-4583-bf03-142b56439a47@mailbox.org>
In-Reply-To: <2c431e9a-9e2f-4583-bf03-142b56439a47@mailbox.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE1P216MB1911:EE_
x-ms-office365-filtering-correlation-id: 05620317-c8e0-42f7-7d31-08de0ba95971
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7lTG4Br8P027UJn45qZEXkiUMsIJrONx2BAxL0HKFnMfDnI7uJxZ2vig22?=
 =?iso-8859-1?Q?AkOT/BkogY3tUyYCGZ+FbxTvHHRmzRBYPE1Uw+wRsyrU3ntLeHT37c2VtN?=
 =?iso-8859-1?Q?Oasd114p05Ujl/kgNc4khYC1kCI8eriY2RKjYrpwB8Gdt5kb4FXMTCXi3J?=
 =?iso-8859-1?Q?y4CL33aK4jPn6PllazSJ6g81b3HcP/Y+g4TU6JZuKR/vOU2jWpGruLCbgZ?=
 =?iso-8859-1?Q?XMMW/qBKJqjGVFO26vGhI2lZLQeihZulxUrclJ4cmEMO1xwxMOIt9mUQzO?=
 =?iso-8859-1?Q?Yr/AorINbtcT0wJykUvEePzqVOSdQp7DR0nfwJTXtg1koGjvTSRgQ90Bld?=
 =?iso-8859-1?Q?br/bMt19cXVqkyGwH1sEQJCzw4NB3IqWlifH/ZpCqZmz2wJHJQ8GQrYeBy?=
 =?iso-8859-1?Q?Da08GjfNQlTTP44Cs+JTP+WBrBhvmvZ7p6ueLx1q5FDfOqSLkaylu5+hEl?=
 =?iso-8859-1?Q?HnEZaemXMcQM0IHqfumujTZPOp4ORIeY/OIvT0D42l16H/Jilst6zU8k8N?=
 =?iso-8859-1?Q?7WUar5vli7U/+ddC4hmHFRVDIi5gJB+984BAG+V+S3cHW9uphpiE7UftcG?=
 =?iso-8859-1?Q?e0WfdOpDPw7iha9DHhkhiFjUkqxhrgiBQBdd/N0id49XcHJJ/re+id8lnv?=
 =?iso-8859-1?Q?9Ng6fnKUTPXkY6Gp2+3qV7X/JVO3aOG7ci/HAmyWKQfVwB5ULS4oY2Js0A?=
 =?iso-8859-1?Q?sriGeRVHoXZIBKQNHPZZz2AlVI5YmsoslgpXUIxuYloKEf2grY5R6BqGNz?=
 =?iso-8859-1?Q?zeJTDeKuBpXSaFq8FOSbojopmnm79vCc4GHi9t3X3/vt5D/zmzQ9Ug5MsQ?=
 =?iso-8859-1?Q?91depeTWqwzrgpqt72mPAwh3X16mRvta9pDFM8rBVlbRjgTxLDURa6UkoI?=
 =?iso-8859-1?Q?KFBN6Z/We+BdTozABIDTpjWyVl439bwnN5OKStyRobk/hzYROSITNeAfZq?=
 =?iso-8859-1?Q?U7Tq5h+uQ2Ys9rSNOjdCRS0poIESNF9VKpcyGkYXhCj623cyH5BugXlpeo?=
 =?iso-8859-1?Q?etbR2FRryZJqUh+G59fpjkSIhyZy4lZUgm0AiFyQUjIS4xEb7yw9Jj2TXi?=
 =?iso-8859-1?Q?0bhW+vCjuG2nUZQr4wg3ZgxuQdOhPSW2EN/HGstIa8UzO+Y2Hzc16oqGmp?=
 =?iso-8859-1?Q?0cgUS9fGf0EJgN/dgNXIHzEwZEuLeNd/RZFWpO4ujUi1aKzLjDA1qmoC0v?=
 =?iso-8859-1?Q?M4YYX7oEmrx0y7G6tiC8O4JHTM/rI72ZEkXNGpv1RT6rm04Mj0GMuS+vJk?=
 =?iso-8859-1?Q?7hUxJAASEzBatuxvSQoS0j/k0s7yoOE+IlHEMqb0Jnx5R1J7SAqWAxwiDp?=
 =?iso-8859-1?Q?+2vuoTxj5liE/hh0G8vZKSksyhZLFtCSW3lsKFCwkokAh5kXveHMWCrA3u?=
 =?iso-8859-1?Q?715Arhqg+30izR/tqu7/V3RG4a4c1gJw7Tdx3+TAckzXSVnqCv5Qg0Hq7V?=
 =?iso-8859-1?Q?FusIk8nPCO8uVeseOG6k/F552IU/tHN9sykVDGb+8vwHbW/opQ42Z05uXc?=
 =?iso-8859-1?Q?ghZA9rqUTaTWKfmVVdv8hgqh4kS2VSFJzdLXSPxmGIhjnuZL6dTY0mQhR3?=
 =?iso-8859-1?Q?2wUX6UC4c0TZAPgAfIUI0Zv3o2Mk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?R0p06U9tZ1PlQ7Hux/fWOXINvxi4PPRjixAsgxBIu1wgmpsLbZYisPzWk9?=
 =?iso-8859-1?Q?+UeVXpM9ex5HPPWbUBXPNroOcXliCLMlX73BOXbfzRDeVo4d035aWz2On1?=
 =?iso-8859-1?Q?UgVIpZhOJ61bfvupuV8YfssobAxKLvPe9hXK/gH2Y2JCCp5roEe44X6aI6?=
 =?iso-8859-1?Q?Jcub8cn98lMbxwn3VJl2TtX/KbLXkNPUJNAvj9oEfAtd5F52/2ZpqOXutl?=
 =?iso-8859-1?Q?R9IB+fjdtDmmZi7w87Pf+4O+Y8OJX/NPo4HRZH/bUtqTsNszybosWIOOai?=
 =?iso-8859-1?Q?lGXDWhCeYf9vgY2k3+fv309fMORwe3+PrsUJjKMnhjaIcdUzFVTxo5hU3n?=
 =?iso-8859-1?Q?WjDQEtH44Z8/hXUcn3scEI7MhjoggV7WXkwFmkpF+JKGMqdK9QdNbPWY4f?=
 =?iso-8859-1?Q?e+KUhNWhtjxpXETMMVjNUaFMilGalYNbm24KJm9gmsCaWyKcij5T43HAvU?=
 =?iso-8859-1?Q?emXJ26NUF4FtBwq/J6rcWOANn6deMuXec09Ku3MENzhsrKg3TSYw2d6Ik7?=
 =?iso-8859-1?Q?oOvI4BAeWvHl6csQFNJIaEBs6SZizOCg5ljL6QExb1ZO1+24uoA4pTqbZu?=
 =?iso-8859-1?Q?6JBgZDqyaAz5jKUGEn2eJ6Vi/oNRu9zZETju6npSrsHHE/BgoE1SNE4upA?=
 =?iso-8859-1?Q?4p0a6d8RfuMSANG4nvD44yv8/ahRjtd0WZzQciV0EKBxGKUCyzgv18WtvF?=
 =?iso-8859-1?Q?lCIBKE4bl3IJI+dx2N84WvdHFkFwIui2LsPKdlNXciGtK0li+b06dB9OUs?=
 =?iso-8859-1?Q?H4m3ZO3fu+5u8vPRpsDGsMaeOvBy3kXWg9IeekXBSjBmdRlS3dDHwzS/yr?=
 =?iso-8859-1?Q?j90h30ZOEotqCj6gl54z8hPg2FEasR/IZBjA7ohNJ0E5I8+LIkUzBAZmm7?=
 =?iso-8859-1?Q?UW6OWMG2/f6EzAXD3uIfeNFhH7/EPnfCSLQBYEnI2T+GtuVLS6DsVmZFAt?=
 =?iso-8859-1?Q?uMea+9AVNixcwDvFvrNz1aaibI+s0ntoo5cZmpkYJ8Bs+SPjV0BlL3FC8p?=
 =?iso-8859-1?Q?k9rjNQLLpeE4Uhu8eygkFWXeUd74yJ41rKytrRgIztF7bdPhHfaoSUnm6d?=
 =?iso-8859-1?Q?ogprgeklQ9nnbld/WsY6T+Q1EkZWwWYER2DNkPiJ9JpT4cFWM4PQzAcQCC?=
 =?iso-8859-1?Q?TsLmhZwZx46QTKOHnWBz/iOo3u+ywQqCveqvbqMTKhQ1sFPAmjUT3BYtP9?=
 =?iso-8859-1?Q?p5L2be+Li2L2VCsAIcbphE6vtYylWVyS1dQCPIa1850NI4w6N2IXJbnckR?=
 =?iso-8859-1?Q?Y7bOApKT0JRontGQCSdx8jgumLT78v9c4WIDsPSa24lVBlZSsE7e/OiU8q?=
 =?iso-8859-1?Q?Gz524RekXnfpgtEx6IJH3cTlwhcOn0IJmHtG6CyStVYxvoQ1dkEARJHRJV?=
 =?iso-8859-1?Q?wzchEiQmeix9PUyKMDNIf8TK2jJduZFHyu0Sqzmfejrto1l8xC2RkWhUtZ?=
 =?iso-8859-1?Q?6XtE2HDYQTsbOrRwnLX3nf3nv5+/ydGrrcWzYfmXbIufSs95H513K4L5ij?=
 =?iso-8859-1?Q?GXi0DcYyaggd+k+TcCm/zFZVDT36YyA9xx6SioqRczd3a/FtlcTEc/JpTX?=
 =?iso-8859-1?Q?AlYQCTZQDr3Ui8FVfc7cw6qWMbYDO4DQoEQqVttTt0p9vEM+YFPn+p4Pgl?=
 =?iso-8859-1?Q?Yq5iFCM2f9wArrjg+EXk0fo5Jel6jY+HpQ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 05620317-c8e0-42f7-7d31-08de0ba95971
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 05:11:51.1122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uol+lZoIQlzkMTVfYib/RF32aXPllGq47TdTQ9vwd03r4Aqp4DfTzPJ7bcrY3NcILUtXjaOvcvMNm7Rk6Y+Ux7IFtexIw3/7kZStFEhWLi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1911

Hi, Marek.

Thanks for your interest and testing.

>-----Original Message-----
>From: Marek Vasut <marek.vasut@mailbox.org>
>Sent: Saturday, October 11, 2025 7:56 PM
>To: Ming Qian <ming.qian@nxp.com>; Nicolas Dufresne <nicolas@ndufresne.ca>=
;
>Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; sebastian.fricke@collabora.com; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [EXT] Re: [PATCH v2 0/8] Add support for Wave6 video codec
>driver
>
>On 9/5/25 3:22 AM, Ming Qian wrote:
>
>Hello everyone,
>
>>>>> Le mercredi 03 septembre 2025 =E0 23:47 +0200, Marek Vasut a =E9crit=
=A0:
>>>>>> On 4/22/25 11:31 AM, Nas Chung wrote:
>>>>>>> This patch series introduces support for the Chips&Media Wave6
>>>>>>> video codec IP, a completely different hardware architecture
>compared
>>> to Wave5.
>>>>>>>
>>>>>>> The wave6 driver is a M2M stateful encoder/decoder driver.
>>>>>>> It supports various video formats, including H.264 and H.265,
>>>>>>> for both encoding and decoding.
>>>>>>> While other versions of the Wave6 IP may support VP9 decoding
>>>>>>> and
>>>>>>> AV1 decoding and encoding those formats are not implemented or
>>>>>>> validated in this driver at this time.
>>>>>>>
>>>>>>> On NXP i.MX SoCs, the Wave6 IP functionality is split between two
>>> regions:
>>>>>>> VPU Control region, Manages shared resources such as firmware
>>> memory.
>>>>>>> VPU Core region, Provides encoding and decoding capabilities.
>>>>>>> The VPU core cannot operate independently without the VPU control
>>> region.
>>>>>>>
>>>>>>> This driver has been tested with GStreamer on:
>>>>>>> - NXP i.MX95 board
>>>>>>> - pre-silicon FPGA environment
>>>>>>>
>>>>>>> Test results for decoder fluster:
>>>>>>> - JVT-AVC_V1, Ran 77/135 tests successfully=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 in
>>>>>>> 35.519 secs
>>>>>>> - JVT-FR-EXT, Ran 25/69 tests successfully=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 in
>>>>>>> 17.725 secs
>>>>>>> - JCT-VC-HEVC_V1, Ran 132/147 tests successfully=A0=A0=A0=A0=A0=A0=
=A0=A0 in
>>>>>>> 81.549 secs
>>>>>>> - All failures are due to unsupported hardware features:
>>>>>>> -- 10bit, Resolutions higher than 4K, FMO, MBAFF
>>>>>>> -- Extended profile, Field encoding and High422 sreams.
>>>>>>>
>>>>>>> Test results for v4l2-compliance:
>>>>>>> v4l2-compliance 1.29.0-5359, 64 bits, 64-bit time_t
>>>>>>> v4l2-compliance SHA: 2a91a869eb8a 2025-04-12 11:35:53
>>>>>>>
>>>>>>> Compliance test for wave6-dec device /dev/video0:
>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fail:
>>>>>>> ../utils/v4l2-compliance/v4l2-test-controls.cpp(1180):
>>>>>>> !have_source_change || !have_eos
>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVEN=
T: FAIL Total
>>>>>>> for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1,
>>>>>>> Warnings: 0
>>>>>>>
>>>>>>> Compliance test for wave6-enc device /dev/video1:
>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fail:
>>>>>>> ../utils/v4l2-compliance/v4l2-test-controls.cpp(1169):
>>>>>>> node->codec_mask & STATEFUL_ENCODER
>>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVEN=
T: FAIL Total
>>>>>>> for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1,
>>>>>>> Warnings: 0
>>>>>>>
>>>>>>> Note: the failures are all related with the eos event.
>>>>>>
>>>>>> For what its worth, the whole series:
>>>>>>
>>>>>> Tested-by: Marek Vasut <marek.vasut@mailbox.org> # NXP i.MX95 rev.
>>>>>> A0
>>>>>
>>>>> Do you mind sharing what tests you have done ? Are you confirming
>>>>> the same fluster and compliance results, have you done more ? Since
>>>>> this is largely inspired on Wave5, I'd like to see people testing
>>>>> real-world playback, with seeks, dynamic resolution changes, data
>>>>> lost. On Wave5, latest performance patches leads to crash or hangs.
>>>> I did not use fluster this time, I used h264 decode of 1920x1080 60
>>>> FPS stream. The pipeline was very basic, something along the lines of:
>>>>
>>>> gst-launch-1.0 -v filesrc location=3D/test.mp4 ! qtdemux ! h264parse !
>>>> v4l2h264dec ! fpsdisplaysink text-overlay=3Dfalse video-sink=3Dwayland=
sink
>>>
>>> Thanks for the detail. Since you have a running setup, perhaps consider
>testing
>>> with the following, left/right keyboard arrow will let you jump around
>in the
>>> media.
>>>
>>>   gst-play-1.0 --audiosink=3Dfakeaudiosink --videosink=3Dwaylandsink
>/test.mp4
>>>
>>> That would at least cover seeking use cases. I provided Nas a stream
>that
>>> aggressively do resolution changes to reproduce a Wave5 crash, I would
>expect
>>> him to test and report against Wave6 too. If you'd like to have that
>sample, let
>>> me know, its not very big, and free, but I'd rather not do attachements
>over the
>>> mailing list.
>>
>> Would you please share the stream to me? I want to test this resolution-
>change case too.
>How can we proceed with the wave6 driver upstreaming ?

Patch v3 was posted before you replied to v2. I plan to post v4
shortly and will include your Tested-by tag.

Thanks.
Nas.

