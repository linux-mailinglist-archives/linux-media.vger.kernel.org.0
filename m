Return-Path: <linux-media+bounces-12912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 955D3902ED5
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 05:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8EF5B20DB1
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 03:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD53916F8F5;
	Tue, 11 Jun 2024 03:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="QZHt+VRt"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2052.outbound.protection.outlook.com [40.107.6.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BEB3307B;
	Tue, 11 Jun 2024 03:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718074897; cv=fail; b=TTuD76bckx2fyHFHHvS9PVeggmKg2Xg3XkVB8qm5kRLQD96W6TGE3NWSC6Vf7wr+ESvcIOJeXIdMx4K/DdnUQG3NAVnE6VLPd2Xb+Oe65Mc0FY9Pz1u4aVb5Cy8oQPsJsYm+1gjHAGR1VhPaM1I29JzaPA/3y9Ll4HIoW1unp+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718074897; c=relaxed/simple;
	bh=ZFnDNqECzJe89Mp8TiH/zvfsEPMhNTxRN7k+YADqa5g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hEyFr8SuaPCeF1vdmcMODTcdKH6ZHQCS/c2CTM8ZdE5nFOBzGIFAPMVAdRzmsh2D8pDHrIWcsh/HXfO+Gk9NcEyFxnqGLVpqxCFuS6IbzrGyAE7WEjBedPICrkHUfBO9G2z56SjjqJ0tVpEuyxy3Uz2D3SHmC7wTkRwimiSgZ4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=QZHt+VRt; arc=fail smtp.client-ip=40.107.6.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nU/Cm5DxKyAmmc30ltOyGO/jwpsGF2IXf8Bl959xof2vpTMFywC0Xjx5crBzrftEXpVlIfEWsNWQp/12xHX72JPnx0r90KH3s3XZWX5YMWDcUz8ISXsEM+juO3rwMOpMOssV3ls/48qMfmvfgho37EzUEK+6bIkOiPd4ZFf+nBbBbV3/LogIVvlaJ8HlCTPVGSwMBJH8MdvO+ThADE7xe4fOipQn1InFg5NneuUfpPY3cPBRB1tf7Boe9LBRlKohhiZaFJ6stOfRC4cvTm0qMedW0fj2ZQKLkbbFtDIt1wo0JZmzPfkr/F0kR8TOUUc9H68pTW7bjcCi6nSrz8S9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFnDNqECzJe89Mp8TiH/zvfsEPMhNTxRN7k+YADqa5g=;
 b=HFyBZUMZrUekd7ugXb3cIzOXBnl3HghEi05IHvQnyV6WtBZNZomnXp5351qteTnDM4ZojC7mFL1uJgNxscrOgJwVRcOwQFH2Yqzds2/4/M+RLGGUkUERynCdJ23JWkojqS/U/k999aphjGTLWpBpgMiUc5k1iE2lj959VE4/UY1cYuYyJh5LqxTKT5NUgVSM4yMiCkAFQCY/5nE7QV8wg2LdNgQ/pdCHcGq0PcO+pjzBEjwmm6g/AqNftB9y4hzaO4+fppwuz19+JUIGQJoDZ4clYq9kgUWwRl7FAW5tDIbQk4BZkwQzlIh41LdXONmYUT7ntstupqNXfunb6l9ANg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFnDNqECzJe89Mp8TiH/zvfsEPMhNTxRN7k+YADqa5g=;
 b=QZHt+VRtDm4w91BWqaT+dkvuxeVJjVczeQ7zd2+O1HJpGtXYC65GqX0+yClk8pzYA5/pZCTqsq4uAjv1m+2pm7qyJSCUKwmNg33L1NbAVbpitmi5n6I3i4rbizGsyEP+OmhxIcZP7s/ugi7m+KiU9mCI6YWVROtXJRUoQT1MBcY=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by DBAPR04MB7269.eurprd04.prod.outlook.com (2603:10a6:10:1a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 03:01:32 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 03:01:31 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>, Alexander
 Stein <alexander.stein@ew.tq-group.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Paul Elder
	<paul.elder@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Thread-Topic: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Thread-Index: AQHauqqq7GSURcCnVkyyXCflECJukLHBwK3QgAAI4YCAABfU4A==
Date: Tue, 11 Jun 2024 03:01:31 +0000
Message-ID:
 <AM6PR04MB594198421BCC895B506C408A88C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
 <4879631.GXAFRqVoOG@steina-w>
 <20240325204924.GY18799@pendragon.ideasonboard.com>
 <2929432.e9J7NaK4W3@steina-w>
 <CAHCN7xLFjJUZQZwPbj5xyxnprwAV3TOvd_6A6sBwOPK+V6uQPA@mail.gmail.com>
 <AM6PR04MB59412D143AA8C20AFB479E8F88C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <6ba1db19-32d6-4d25-824d-731bea65b583@denx.de>
In-Reply-To: <6ba1db19-32d6-4d25-824d-731bea65b583@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|DBAPR04MB7269:EE_
x-ms-office365-filtering-correlation-id: d4762928-ae2f-4e93-eb52-08dc89c2cc06
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|7416005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?OU81ZUxCRFFjNkp0MGdLOXZjbkU0VDZYNytDZ0dtYlhPRHBZSnpGeTc1RmM1?=
 =?utf-8?B?UkhmdDZCZVdPYW0vRmk0Z1hBa3lRYVB5RFNycXRoa1ZlQ0JkWHJWYzZqMjNV?=
 =?utf-8?B?UnAvQ0lXeDJRa3pldUhnSGZWZ2hWUENySUJJZzEwZE8vQStEOGtXaWh0dFQ2?=
 =?utf-8?B?ejcxNjFyUGlIekNRNE83U0c4azVGU2tuRWN6U1lldFVuWVl6OCthMTdFSDVl?=
 =?utf-8?B?ZjV2UVc4WDhkZ2UxUG0vQUhMem15SnlieHdQUVN5Y1BHM3h3WXlKT0k0YTAr?=
 =?utf-8?B?eUN5Smo1eHhSVWRUR1EzZWMzZWxEbW1JcjdVaGtkZFFjMVEraDlPSnFISFAz?=
 =?utf-8?B?N3hwL01jY1ROMTlhbm15V1h4YkFrTWY2dEwrWTc1K2RFVTBuWUw4YjdvM2dj?=
 =?utf-8?B?Y0hRWXM1MElTQldZYlpERWZITkwzM1lnSkNkbndQQ1l0MlpKZVp2OHNFZFZ2?=
 =?utf-8?B?dDBubVlWdW1WbmowRDFtRm52L2w2MUI0ZHk1dWZuK25DdTZWWlRuYmVRZlNv?=
 =?utf-8?B?V0tCSEFHQlp4UlZoanZyQWQvaVNCK255Vzg2cDZwNlRWbE9JeFVjWG96RWZO?=
 =?utf-8?B?Ylp5TnA5OXJUSHk3K1p5SWx5QU9COEFQaHYwcUhSZW00MGl2YVFuNzI5NTJ5?=
 =?utf-8?B?MnhNLzFyVE11cCs5MFJpTE1SdVNrdE5ud2NFaGhtVEh3NXIrZlB1cm44VWpW?=
 =?utf-8?B?bXZpMWxXU29raDZxdzgvVE1wUXZFL29ZNklsZUtoMVJHdXRMTHRKR2hhbmxL?=
 =?utf-8?B?QWFSUFFEaEVLUGNFUXZUUGZ3VXNjdnFZMEhKNlBPbXU3cmpQMVJ2TytXdGdU?=
 =?utf-8?B?dW11a0FEQ0F5Um5ldXBDWElUTVVEaWZYT2tMZk9yQngrVm1ZeXJaTFVMVWF4?=
 =?utf-8?B?ZlhsQU5UaGc3V2lhUjhPdXFRTDBJT2Q1WG55R3RnNmpKVElaRUU1UGNHS2J0?=
 =?utf-8?B?d1NoM2wwb0p5WFJFaW8vYXhsYnJDSDNXVWlYQVlsTFdjNElpTkZlRW02bzEz?=
 =?utf-8?B?eTFBQ3ZXK09vOTRpVFIzNFZlSTd6Tnk2SUFyYWVLYWpuUEV5ZWk4MmFZNGZs?=
 =?utf-8?B?dGpVbG9iMkxoWXloQmh3dnNadGZEM1lZNFhld3RKSWFXeTRYdit1cVdlS2dT?=
 =?utf-8?B?UlhmLzFqUElUMzJYY0pPRGx3V1hhZ09ETW16VXBRU2RIajlDMDVScXVSTUQr?=
 =?utf-8?B?MGdURmFUaUMxY0YwdnNJQkJtVnR5bDczUWI2OE9xdTR1M2owRHNoV3BibzJU?=
 =?utf-8?B?WDV2c1cwbXd3U3dQNmpZQ05PaW9pbFZwREpIRjNFOWxaWGVVVGtaZGxXQnk1?=
 =?utf-8?B?d1Z4S3dFbVRLMzYxVk9xaHhrcGc5WGNkZUx4YUpZOG9vcGxPQ1IwbmR6L1JY?=
 =?utf-8?B?Y2VmYXVnY00vSGcwWlJja2EyaFlYTzBsemxlR01zWHNLYXZkSzg5YVphY1NL?=
 =?utf-8?B?b3BnNG0rZVFhTVFQc1RITHVpd0NCN0MyRDY5WkQ4Ti9STUhlM05BVWZmdWJ6?=
 =?utf-8?B?TldnZ0lLTnJCOFBFTGl0bHVtbGZPaGZMbVRva1h1Qmo4S0RsWkFJeG04a0lR?=
 =?utf-8?B?QkNtVmxGSjRjQ2JscnZ2WVVhQUVicXl5Q0FKaERpekpXbnI5K1dlTUVGaUdG?=
 =?utf-8?B?emZmNlY3WnRHT0Y4MjgrNHpTd3JRL2M5OFhYdy9Ick5zVkRqakFlNEhVODYw?=
 =?utf-8?B?MENiclBmdzJidkMwQnpGNUZTbnRQVW1CTHFsMXlqNnBvcGRQOU9pUHQxd2g0?=
 =?utf-8?B?M1hpZDdTdWNMeGs4dzFDWURXRi9wOFZNTFlGTkc5bEVRRHBlZFhzejlSNTdl?=
 =?utf-8?Q?Nf5ZAuf4Oord71VfU6WNL2reweOqfIX2TxkVQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N0xVY0ZzdG0rdWYxSWxrdlVQMmJGZ24vdDZlUmc0MFRPS3p2RGhNc3FqTUNO?=
 =?utf-8?B?TEhHQTltUk50TkdSMDVvekhFdTlIS1ovTmZnMzVadDhqU3dlZHF2U0g2RVU1?=
 =?utf-8?B?Znk2U1pLc1pCN2RKQVYxZ0xrRFd2UHhveUlPOG1SS2RYOFhhc24wcnQwUWpm?=
 =?utf-8?B?aVZmVmdoY2ptOEJ0WmxrVmExYWVmZDBQOHFnTVQvejRDeDBsSDc0eGhnWXZF?=
 =?utf-8?B?NGdRdk5DZmRNQWpCa1JURnIvZGpGenRXUklhVVB4V05LWHNKTUZFWEpwdkFU?=
 =?utf-8?B?Rms5amZDS0hWemZoUVBnZUI5YzVoUHUxOU91K3lDRzZubDI1ekZrbFl4VnJl?=
 =?utf-8?B?Z25iUSsrS1Y1OEZOaG9YcWY2enU0SGovTk5BSGVBNnJXa1h1VXVvSVhNdXV3?=
 =?utf-8?B?ZjJaVkh2eXFja1JMcHJHODlrYkhCVUpDdFhocXFjdUpsZWZ0MTdaMFhpUkpv?=
 =?utf-8?B?d3MzMUR6dkNjTElHbGtWYjh1Nlh1M1RKamhuNXZ0ejI1akdlMm92YlNNQk9x?=
 =?utf-8?B?TDBVMFluNUsybnQydVhub09DWC9yWlJGK3FDcTlzVHYvOVdDNzEzNHBzbDJP?=
 =?utf-8?B?R2kxaDhVZTQvTytQM3VRNUN4eVhabnBJd2dMM3p3eUpUZFlXSEVSZ1ZCanB1?=
 =?utf-8?B?UyszenRuUXlKQ3pEYnZtSER6clhONS96dFI0NTVLRDFTc3VSQ3NTQXArRnVl?=
 =?utf-8?B?YXNDWEg3WVR0Rk0rdzkwbW8rSEwzWTA5cktsc0s3N1pIUWoxSTNVc1V5Yk9o?=
 =?utf-8?B?UzlhRC9acFArZWdyaEp0TzFURm9ENEc2L2UvelhneTJHT25maG5udWp5RFVu?=
 =?utf-8?B?KzZ3TUpYZXYwRG1EU2lwT3dTZlRaUi9xYWxtYmdGN3BqM1JmZlVYSU5OdFpD?=
 =?utf-8?B?VWZ5QXNnUjFCVVhnMkF4WGdVNE5nRDJOSWp2ZXVFc1c1cTIyWk9NazkweVdN?=
 =?utf-8?B?TncyQWZCcGJUOGQzeUx2cE5EM0F0QjEyYTI2N0plSWx1SWo2QmJSK2dXRmtq?=
 =?utf-8?B?ck9FTkt5YTlRZE5NVjFFbkVFR1c1OXM1RmtjUm1tcTQ2SDNWeVphMjlNeVFp?=
 =?utf-8?B?N3ZBeGVMZUFCS2UzeG9nWE14N3F3VURDUURud2xKdU9MSkl5bkdhUWgyNXp3?=
 =?utf-8?B?ZFM5OFpuSDRScG1EV2lWREVEbVVveHJ0aUtlalJsam50NW5GTERKb0hZSkZS?=
 =?utf-8?B?STlGVzE3YlFNUk1pVEIrVndpaG5UUkxvTVpyaUFwTmZPZ2ZoYWJZY3p0eHBV?=
 =?utf-8?B?QU9oZElUUVJEdTZTOEh6RVNpNlc2WDhrYjV1YmIxaVNVVzVoVFRCRDZySkJF?=
 =?utf-8?B?TndJdnpDSDB2N055WkorVWtYMjdiQ3M3SUdEaWpsWldkZHNxQVNRWFQ4SHUz?=
 =?utf-8?B?cHpqOXJqaFZralZtS2pNcWJlbzFjd3FCL25KNTlCcHZFN2YyaXNaYldaTGRW?=
 =?utf-8?B?KzBIN3A4K1d3RlNlTyt3ejNjdm9rWXRqMmxvaXBramQxeXUyakhpTWU3QmRV?=
 =?utf-8?B?TCttajREWlJ2KzJUZDVNOGN0bFhEdDA0OVlYNzYrM1ZXelZPQ2cwcnpqNnli?=
 =?utf-8?B?dDFsL0luZnhHUlJGbElnUFc3QXRPQkp2K3F2VzRRSzVrR2EwL0VsSEJyY2pm?=
 =?utf-8?B?clpSR1NJYWIzM3R0QXNKUk1oNlV4eFJzeGQ0WTFYeUZrQS80c3k2UmpPU1FR?=
 =?utf-8?B?N2xUTHNDQW5pQU9QOTZyc1E1VlRyT0wxY3F3MnZ4a001VWVVWXVaUnNJczlT?=
 =?utf-8?B?c0NMaFhnL0hGZVhySjdvNmhlVlRXUnNlMXVQMDM2UE1SZEtqNDVDM1JDNWNw?=
 =?utf-8?B?cUJMRDlnN2t5b0NvQ2Z1Y2c5STZYeUI2YURrTUlKYlIzK1k4VWtWSHcyRnow?=
 =?utf-8?B?V2FJZHdFL0Q2YjJSTUhCMDdJeXNmL3dKVnRvK0Z4WkhQa1dhWkZYTmlIU3Zq?=
 =?utf-8?B?TUM1S29SdktCdzlTbXZJWGhWL0NJMjAvSHErSlorQjJXMFZPY1J2NU9qYzRq?=
 =?utf-8?B?NXJuR3JQUUF2dXZTREo0Z0NWNkNRYjB4aUk1TGZPenRkWURFeDNjdG1NTnFr?=
 =?utf-8?B?WnpLVUgxTnB6aUFjSXV1WVpEdVRXM2U4bCtUTkpxb0tWeG9od29ValhVYlJW?=
 =?utf-8?Q?lW4U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4762928-ae2f-4e93-eb52-08dc89c2cc06
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 03:01:31.8920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WPr9g8AcvUta7/jKPLpyPaR8n2kcbMI5rYdRrPvzJNLgCx02SbUxuA5+75H16lwZWW2K7w1zkqZ2RltBaEqGZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7269

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBhcm02NDogZHRzOiBpbXg4bXA6IEFkZCBEVCBub2Rl
cyBmb3IgdGhlIHR3byBJU1BzDQo+IA0KPiBPbiA2LzExLzI0IDM6MDQgQU0sIFBlbmcgRmFuIHdy
b3RlOg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBhcm02NDogZHRzOiBpbXg4bXA6IEFk
ZCBEVCBub2RlcyBmb3IgdGhlIHR3bw0KPiA+PiBJU1BzDQo+ID4+Pj4NCj4gPj4+Pj4gU29tZXRo
aW5nIGxpa2UNCj4gPj4+Pj4gLS0tODwtLS0NCj4gPj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OG1wLmR0c2kNCj4gPj4+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OG1wLmR0c2kNCj4gPj4+Pj4gQEAgLTE4MzcsMTEgKzE4MzcsMTMg
QEAgbWVkaWFfYmxrX2N0cmw6IGJsay1jdHJsQDMyZWMwMDAwIHsNCj4gPj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjbGsgSU1YOE1QX0NM
S19NRURJQV9BUEI+LA0KPiA+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8JmNsayBJTVg4TVBfQ0xLX01FRElBX0RJU1AxX1BJWD4sDQo+ID4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwm
Y2xrDQo+ID4+Pj4+IElNWDhNUF9DTEtfTUVESUFfRElTUDJfUElYPiwNCj4gPj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNsaw0KPiA+Pj4+
PiArIElNWDhNUF9DTEtfTUVESUFfSVNQPiwNCj4gPj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjbGsgSU1YOE1QX1ZJREVPX1BMTDE+Ow0K
PiA+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhc3NpZ25lZC1jbG9jay1w
YXJlbnRzID0gPCZjbGsNCj4gPj4gSU1YOE1QX1NZU19QTEwyXzEwMDBNPiwNCj4gPj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwm
Y2xrIElNWDhNUF9TWVNfUExMMV84MDBNPiwNCj4gPj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY2xrIElNWDhNUF9WSURFT19Q
TEwxX09VVD4sDQo+ID4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDwmY2xrIElNWDhNUF9WSURFT19QTEwxX09VVD47DQo+ID4+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDwmY2xrIElNWDhNUF9WSURFT19QTEwxX09VVD4sDQo+ID4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY2xrDQo+ID4+Pj4+ICsg
SU1YOE1QX1NZU19QTEwyXzUwME0+Ow0KPiA+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDw1MDAwMDAwMDA+LCA8MjAwMDAwMDAwPiwN
Cj4gPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8MD4sIDwwPiwNCj4gPj4+Pj4gPDEwMzk1MDAwMDA+Ow0KPiA+Pj4+DQo+ID4+DQo+
ID4+IEFjY29yZGluZyB0byB0aGUgaS5NWDhNUCBEYXRhIHNoZWV0LCB0aGUgbm9taW5hbCBzcGVl
ZCBmb3INCj4gPj4gTUVESUFfSVNQX0NMT0NMX1JPT1QgaXMgNDAwTUhaIHdpdGggNTAwTUh6IGJl
aW5nIGFsbG93ZWQgaW4NCj4gb3ZlcmRyaXZlDQo+ID4+IG1vZGUuDQo+ID4+DQo+ID4+IEkgdGhp
bmsgdGhpcyBjbG9jayByYXRlIHNob3VsZCBkcm9wIHRvICB0aGUgbm9taW5hbCB2YWx1ZSBvZiA0
MDBNSHoNCj4gPj4gYW5kIHRob3NlIGJvYXJkcyB3aG8gc3VwcG9ydCBvdmVyZHJpdmUgY2FuIGlu
Y3JlYXNlIGl0IHRvIDUwME1IeiB0bw0KPiA+PiBhdm9pZCBzdGlhYmlsaXR5IGlzc3VlcyBhbmQv
b3IgcnVubmluZyBvdXQgb2Ygc3BlYy4gIEkgY3JlYXRlZCBhbg0KPiA+PiBpbXg4bW0gYW5kIGlt
eDhtbi0gb3ZlcmRyaXZlLmR0c2kgZmlsZS4gIElmIHRoZXJlIGlzIGludGVyZXN0LCBJIGNhbiBk
byB0aGUNCj4gc2FtZSBmb3IgdGhlIDhNUCBhcyB3ZWxsLg0KPiA+Pg0KPiA+PiBJIGhhdmVuJ3Qg
Z29uZSB0aHJvdWdoIGFsbCB0aGUgY2xvY2tzIHRvIGRldGVybWluZSBpZi93aGF0IGNsb2NrcyBh
cmUNCj4gPj4gYmVpbmcgb3ZlcmRyaXZlbi4NCj4gPg0KPiA+IFNob3VsZG4ndCB0aGUgYm9vdGxv
YWRlciB0YWtlIHRoZSB3b3JrIHRvIHJ1bnRpbWUgdXBkYXRlIHRoZSBmcmVxPw0KPiA+IFdoeSBu
ZWVkIGludHJvZHVjZSBhbiBleHRyYSBvdmVyZHJpdmUuZHRzaT8NCj4gDQo+IFNob3VsZG4ndCB0
aGUgb3ZlcmRyaXZlL25vbi1vdmVyZHJpdmUgZGVjaXNpb24gYmUgZG9uZSBpbiBib2FyZCBEVCBp
bnN0ZWFkID8NCg0KSXQgaXMgYm9vdGxvYWRlciBjb25maWd1cmUgdm9sdGFnZSB0byBub21pbmFs
LCB0aGVuIGJvb3Rsb2FkZXIgc2hvdWxkIHVzZQ0Kbm9taW5hbCBkZXZpY2UgdHJlZSBvciBydW50
aW1lIHVwZGF0ZSBkdGIuDQpJZiBib290bG9hZGVyIGNvbmZpZ3VyZSB2b2x0YWdlIHRvIG92ZXIt
ZHJpdmUsIGJvb3Rsb2FkZXIgY291bGQgdXNlDQpub21pbmFsIG9yIG92ZXItZHJpdmUgZHRiDQoN
CklmIGludHJvZHVjZSB4LmR0c2kgYW5kIHgtb3ZlcmRyaXZlLmR0c2ksIGhvdyB0byBsZXQgYm9h
cmQgY2hvb3NlIHdoaWNoIGR0c2kNCnRvIGluY2x1ZGU/DQoNClJlZ2FyZHMsDQpQZW5nLg0K

