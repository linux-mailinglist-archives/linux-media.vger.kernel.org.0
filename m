Return-Path: <linux-media+bounces-52530-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eON/H5Bni2kiUQAAu9opvQ
	(envelope-from <linux-media+bounces-52530-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:14:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1659211DB94
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDF7B307E448
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 17:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895E038A299;
	Tue, 10 Feb 2026 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h7d+0x3M"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAE938756A;
	Tue, 10 Feb 2026 17:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743571; cv=fail; b=W5cvXDOX89N8yvsDDJn6ATG1l6g6MP2nKZonM86bKWWR+esL3reZsFnqREhxh0c1akbCiKsleUGiguGmaYTl2WjEwHZ/K5Ezd8JgUS/Y8Nw12juvOwlg2vSyvKbAQIy6H4Xhd8iHTnXxCn7THJsLNwJixQOcybBXrT9BgM/gBQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743571; c=relaxed/simple;
	bh=RQdnms3xoqE+lfhJz9gzDorFXPqc7WRFWSKdEvh3AJg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=e8zVFY3JgoxqhCxkFVBC/XASHQdjT6JX8R539e4GiqEawe8fVrKDY0iT+nf3IUxx4o7SVi/mkZujKtpLstADUsbKPTmrGQRttVlVZ/CE964ljIbPm8SXPRt8BJZxfoDs1oTY8/KupM6GxUIYK1wlTa6UAvalfiFdAjGkMk7ABA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h7d+0x3M; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Okaugfh4Xyjsxf/DuuB9xdzZll2bL4MekeSamhXBmmGUA4rPtFjBD3VgPrFAJRuYaf+9SHPaTUG63r3N3/yLWPDZD4qh50nhuZEAHFZJZa4jXNBiJ8EYdzcJdxYDfDG7xCY7AOatimnfXwYLshSPMA/49YD3xKmXHOlWHR97xvAXJgSh0tLEhi01je/pDG+fTuIBJi1Nbf9xIyvDSXp8MHjk2v2MmWx4599f2+9rEysj9cs+MD0wOEWB039yKSYhVLa5Q0JPceKDopo8cj90KFJs/7WiRNvueV6FrhBv/IxkyyTVGqE+eSarg0fQeZiH5jzZtgQSscl6b2WbqUrNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S53E4Y25KSZ8R72N6Qpfy7GbJqHd/uZRP3YoL9LsDV4=;
 b=a3jm50wb3c/5DfpuYhCwuu9+63OqmtxMNUbY3fPaM0tDURP/8uri1ROYhUYsA5HIQQRbSSJ8Wld+oZyO6cHIHiFl6Tq3gA1BsnWg8Ogo7t1+LBJAsbl4C71bK2whUEr72Z0TpNG2US7Xz4QO9asQEd+tR1qjN4WI9tVjaIlaqNpm+XM3qCIGG8LELcdkdrD4vm8kNj8uEERReYiwnOAx6hgal38WqENHhoqeJmms8dcK3zv6Gm98nMBgAZO6I8Qc/ukyb70HcpahMth+rPiINIS94r6jPPosi/QSAhIDQjWlwK7iSCedKy8kY/rG+J5hUzwzLLNf5Qhfp+teOBq3Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S53E4Y25KSZ8R72N6Qpfy7GbJqHd/uZRP3YoL9LsDV4=;
 b=h7d+0x3MNEU44xcCs/2npIbbPK7H7QZLJMZwGYGEdJyhTpm0otISaHSJsDCqwhn+msNzVS2DTYp0mrtRW2nBtG/t/ZBPvHqDTBMS/GH+fkvBJ2lFtbqxkFaJdgwxYXH8Ki9E0vBodZ+oKfGNCV4bVVP1C4gjVDr1mREwAycNGGB75EZwl7wlQ2Kk14+gc2b4iTk/3J39Qs2uyzzpL/mutoq79I5w/iWN5ADt3rkG4bOVTXW+OOJXS9T2b27LuhWO42zqggfnS3KnzsUwSPGzg1ZR8JXbjrCnlQ/tH7HoCeWROPVVFwaRI91zbbFzOxPMEqRIOI9NvpBYCPLaETJonw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:11:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 17:11:43 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Feb 2026 12:11:11 -0500
Subject: [PATCH 4/6] media: synopsys: use struct dw_mipi_csi2rx_regs to
 describe register offsets
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-imx93-dw-csi2-v1-4-69667bb86bfa@nxp.com>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770743486; l=5509;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=RQdnms3xoqE+lfhJz9gzDorFXPqc7WRFWSKdEvh3AJg=;
 b=iCg0c+gVFGUFf3SZcp76uyW3q3eXmLvDp5grAdWqfooVPHczNCdaHX0i6hn35k4Y1ekhFtH7Z
 tvQhi34+chsBfjQsrKDNeGyLC/OJvhgbx8KlL00OkX6gkx6tkvrPQnN
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:806:d1::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: d83bc2e7-4a8f-4a3e-7052-08de68c77628
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cm9aa3c3MDJmVmM5aUdoc3BROGh5M3BTVC9jTk5MaUJVVmFBSXYzNGhJVjlT?=
 =?utf-8?B?aThCcGFSNFlZeHJKNUJqKzJic29hR3pQRE5YandyYWFlUFlvU3JZdDBZNElP?=
 =?utf-8?B?UkhiZGZSZVpETGJTT3g0Zm9iYWVlSnpLdnR1RjdBYWRxUFNxQnpVZTJxQ3N0?=
 =?utf-8?B?TjJ5cUhLK0NIQ2U1ZVA4M0o0Qk5UV094bUk4b2NtQjJaMHRvU09WUE1XQ1Jl?=
 =?utf-8?B?MHpITUhvbytPMUNxc2gxTWVrUkNxRy9oTktXUGJ4WEl2WmhKNmZrdFhla0Q1?=
 =?utf-8?B?NVBOdlUrU2E1WTR5WFVYcS9vcXR0ajRCZnVia1dWK2JWcStReVgvN1ZaUzND?=
 =?utf-8?B?aSt3SnJ0R096ZmUzYWkyczFNM1ZRSUJ0dlFhN1lyOW1hZzBObFZrK0d6KzR0?=
 =?utf-8?B?TXNZQmRCdmdMRHc0aXVva3IwQ200V1VBU3hDZi93dnVJL1NURC93RWRITmVN?=
 =?utf-8?B?bitKVVlxOWpVMzAvL0NJSVB3M0lCbFowWU03eU1mL3ROOUllQm9Od2xSV0Uw?=
 =?utf-8?B?N21iSGhwUEdCOEZEQm5xbG93Y05JUmRYWlNmMFdTY3IzM3JwTVMza2ZlRGZi?=
 =?utf-8?B?M3VvY1I4RE1ETXA3RVpKZStyTm4raVIvd2JZOE9lRU9OTmJnOHg1cjVESVZ6?=
 =?utf-8?B?TG1FejJneEpoS2U5SzEwblRtcVJDNmJzVzIzbkt6VU93QWFWcXFOR3NFRDlw?=
 =?utf-8?B?cGd2TVhBaEVlbFNnb21TMWI2TDA2M2dhNmx0c2tEaG0rNC9NaFhsYm9lWnRV?=
 =?utf-8?B?d0JJMkJQbUpzR2tkdkxIYVpDTkJmc3lTZEdXYkdDOVUzNGZkZjJqSnhjbmJM?=
 =?utf-8?B?ZWc0bUpOSTgrUWtLdEhWVi8yVW5TYUlld0QrOFJmNlZLOENaUmZxYVhpSUdC?=
 =?utf-8?B?cHFNWXlpZEpYQmZQTjNDV3dVWjJOaWhUK1QxMUVJY2VCMVZHc29zaUVZanhB?=
 =?utf-8?B?MjZDOFA1MjdCNzNWMVZtY1piTzNUajAzQjRja043NXptZ0RBMVJ3Q01KNnY5?=
 =?utf-8?B?T1o0cC9LRkNUc0MzZ1NkNVlnWlpkQW9Gdkd4dCs3UTA1Mk01T0MrRDQ5R3lp?=
 =?utf-8?B?VUNsNzZWQ2JVS2pnNlZwV0daeEZ2VXNuNDJjN3I2aEU5cTF5VzRmMFRBZWlX?=
 =?utf-8?B?VldTbWRjeGZSdGhyakczWDJmTEd0dlJ1TGJpMGNVTWN0RVhCM2FHUS9zenJ1?=
 =?utf-8?B?WEtpWjdkUkhBazdxcUNOQXlMVmlGSWFpOWl5M3c3VGc2MnFmWlBRL0NNZSsr?=
 =?utf-8?B?WnFjanU4SDhqZU1JYm0zemRaSkRoeGhuc1A4eVBQS0Vya3ZmT0UyL3BVNFB4?=
 =?utf-8?B?NHhkK1VLREliTUtwK1ZWcjJhclZxWlcvNk9EN2pVaEp4YUhTRjlONnZjSDc4?=
 =?utf-8?B?TFpuejNTZFJ1UUpmcUV1VTlVSnVIOUlRNnozSkU3K3NNUVQyb3ZpUExWcDVN?=
 =?utf-8?B?M2pMbVByRG5QaUl0YmVIT0VGNGx3SWdoR0o4T2E1SlRNekhkMU4rblRoejZy?=
 =?utf-8?B?U1czcDhjV0h1cGhiRk1sY2pRc29JU2d4SlBsOWpzZlpSR3duRXRROFRXS0lU?=
 =?utf-8?B?M28rSGMrSW0vUUxxVHJlSkZ4QVlRdW0rMC9HNGFld3RBUUtJcXFZV0xXdjVT?=
 =?utf-8?B?Tk9XWGlvTUY2dHg1NUJOTzBmMmRxWk5zRFdIMittM0V2aWJqVDYyWldVQ1Vj?=
 =?utf-8?B?TzQ4dE1wOEFQSnlJZUZxRDdwYStRTkJ0Skh3VzVvd2F2MFh0S1BpUlR6cVFn?=
 =?utf-8?B?L3BOeTEyNUN2QkV6SU1pdjhTbDNqdGlEY0NjdDVOSk9ZSHRPdTJrZDFwYm50?=
 =?utf-8?B?ZmtuNGRtK0tpNnEya3RDSDZZV01Nd05xM2JzemQ1b1pPN2dQdWFpeDZPL0Zm?=
 =?utf-8?B?d2N1L0V3QnBvWCtGUVhDWmlCM2xlRW5HbGlqTkRZOGlqSmxRN3ZjSVl0NVIv?=
 =?utf-8?B?Ny82UWVCdVNLTE1scXBZN25waXVKM1BCQWhJYVRYdU12bmJJTGk1WjlVdkRL?=
 =?utf-8?B?aDFsS0JGOHp5NnUvRVdpMkE5R3poNWdMWkpaL3VIZUhFQk92eDUxWi9hc3Z6?=
 =?utf-8?B?a0t6SmhwVjFiMjA0VHZvSndlSDZEKzdDbGNqcVRWUVQyU0llTis0Z3VzbVcx?=
 =?utf-8?B?WmF0bzU4M3J2N0QvdG44cVJOWTNyWU9VQkxFMG1xbkE4ZGFadDNNSUJ4VThj?=
 =?utf-8?Q?MJ3enxNpKX2GJWFSX2yQHPc=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dUk2NGR3N09WcmFrLyszU3lYeXEzR0ROM3VmOC9TbVhkb21UMU5tTDNiTGJ1?=
 =?utf-8?B?a3p1NGhSeXZsQ3o2ZWVSZUI1aG5xV2VYdUlsekxHbU1qK05NSlFvemRzWVN0?=
 =?utf-8?B?UUd3aTl4U05jSE9KYjdlU3duN3ZscEFLV1ltYjhMbGNvVHViR0R4SkhFK1pB?=
 =?utf-8?B?YmYrbmhDVXVBeWhNNXVGMjZ2NGczb2xCRm1RMmJPNEE4TDdTZUFPMExNcFdp?=
 =?utf-8?B?MDdTMTdXUGRITm9TaUkweS9PN2NXaGdPK2s4R3JRaVdNcXh2Y0lZZ0JxV1h1?=
 =?utf-8?B?bU1DMnc0SjFhd3g0TDdTQmlxN3Jsa2V2c21yeEswblphTUUydFE3dzU2QnNh?=
 =?utf-8?B?enlkTTUzbkxlUlZ5NjJTdXY2Y25kZG1FdkIwclpLTU1KR2FIV3VwckpjYTBC?=
 =?utf-8?B?NjZOWFpFSjZoSk5kWXlzT2Jja0pUOG9yNGJKTVROU1BoOHQzb2tseXNKT2NS?=
 =?utf-8?B?RGNYTEFDc09RVjZyRVU1d3BJaGIwZFhPeTczNWV0QzhpNjdlYU85Y0pMa3hD?=
 =?utf-8?B?V1JGK0p3Q0N0RGdVdDRPRUIzeUlSOEtDVTdOTHhlSkJ5S0RreGlTamptU3FK?=
 =?utf-8?B?UVMvbzJBR1NJSU5NYUtPYWNYMmMrenMrMHBUSjBPdDFXMUlabXY0a3NPWnBF?=
 =?utf-8?B?ZmpKYW05cjhDenk0RjI2M1RXQzZYU1MyK2xML3p5SGpWSlJ6Nko4ejFxVmxC?=
 =?utf-8?B?NWxXaC92Ymw5VC9GTXZVV1Z2WDM0VUxUOWd6ZmhxUnN6RGJMZU53cXhuY205?=
 =?utf-8?B?TDlFRG90dVY5MU8zdkJzV01XNVhTWmFKTG1BVC9SUmpKbnFlM0JEdS8wRmZD?=
 =?utf-8?B?SEo4UUg1VUV1blhIKzliRWdYTnd0alpFbDdxbkUvSFY0QUh0TjVjelhoV084?=
 =?utf-8?B?MXJuWW9VTG9ucTJCU250SFBwTkFRWGZnckJrZVo5S0NjN2c3RHJ5YXZUZkJ6?=
 =?utf-8?B?RTRVRHZJN0VDMnV4UFdLemlZZFRWak9SMmVmOVZaUWtkcnZ5QlBHeHgvN3ZC?=
 =?utf-8?B?anBGaUZCelRZeHlxaVVGa1h3bXFVYUtFR2cxZFh1RUUzQStaZ3FKaVA4Z3FS?=
 =?utf-8?B?L1k0K01TanF2QzB5dThyZVpDbTRHSkpmMFcrOTFuKzI2dk1ZR2djcDNvT0pt?=
 =?utf-8?B?R0hqN1dwdU9YOHZsOWFGUFgzZ2pVcVo3K3dBVExsenlpNW9wM1hlaUZjaGxC?=
 =?utf-8?B?OXpUU2k1QTJxcERvRW45NkRLRVA0R2dFVmFtbUpUYjFUM0thTmpIanVjNWdl?=
 =?utf-8?B?UVdVZm1jclhZSmUyZEllc21TYkplbnFEVmNlREsxVkd4Zmk1eTRhQzNXZmhG?=
 =?utf-8?B?Tk1iYlBQZnI3MHNJREJ6NDQ1bENQckZDNSswTjFSZUhFUjNCaUpuRVFBSXlU?=
 =?utf-8?B?R3RGMDhDWmNYYTZPZlV3YVFVR2owbjh6cDU2SHR2NVFjU3BJaWZFaHlHazNE?=
 =?utf-8?B?Z3JDZmRpclAwMW1vOUxyS1JLQlpQZEVOYnJpSjRHaU02aVdqTXhCdFNqSTIz?=
 =?utf-8?B?VUR6SkhtSE5PanFTZ0ora3FncnoweVl3Y3hNVy9CZ3BSc2o0a09JbXgzZmdZ?=
 =?utf-8?B?S3dFM0tpRU93blRFWUFQblRKMUtYWTREZFFPbUJObVI4Zlh1YVRablNkekpO?=
 =?utf-8?B?Yk1ZT2FLUk1LUGMwRzFsTXR0QjNZWGUzZnhYdmNhRC82OWp1U1JWNVFRNDN3?=
 =?utf-8?B?MEVEUTlzRWVERWVnamUxOVI2TlJGeWhjVTB2Q1N4RkcycnJ0cGZoRHRmVnBK?=
 =?utf-8?B?cFBLU2JqMmd4R28zV1cxU2dpakVTVnFxQ2JUUFdldnpGNWI4aWVLN0Ixc0Fh?=
 =?utf-8?B?OWFxWkJiQTFXQ0p3akxZdS8xaFdqWFNsL3FPcmhrcjRoY0tlMUhET3NyUU45?=
 =?utf-8?B?Y2pBL3BleVIrZUlWMitXeHVOcTFOQVZnYjVLbnhrdGxJOHg1bWRFM1p5dU9k?=
 =?utf-8?B?SHNJS0hKbDljM1lXL3lzSFFMNzRRdnNjK0tSM3lXcEdWOWxpNGVudVpuWFpx?=
 =?utf-8?B?TXpOZCs1WTVHUmpGdm9NTTNpenVYdlFVcmUwcTdSWmRvNUFGbHY2M21xTHBy?=
 =?utf-8?B?bnZPSHVGUkpRSVRucXBsSEQ0VytoblR3eUZ0bmtiSDRTNnRYY0d0aTZWaEFR?=
 =?utf-8?B?bUF2RzNaTllqUnJDcGt1RlFHOFNFNzV1VlBZWXl4c3NpNlA5Q204ZURFWEc0?=
 =?utf-8?B?R2hPck9nTGNoN2pvQTdUUTNuUENCZzcxbEhvUWg3eGgrbGlGNWlxcjBNS1ZS?=
 =?utf-8?B?NmNGWGE1R0dnRGI2NENQLzMzZWF5N25DWnpWNUpOeVZmSEtXeFI3VzY2TDdD?=
 =?utf-8?Q?I+JHubYz9MlCmXOq5V?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83bc2e7-4a8f-4a3e-7052-08de68c77628
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:11:42.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZbgE3hQ8DieC15IMAbdQz1obgyF7ylBHbDIG9iHHoKO0FXGKuB7S4bMNufyGn1VmQXAq92HPWZ5fT29iZckyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52530-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1659211DB94
X-Rspamd-Action: no action

Use struct dw_mipi_csi2rx_regs to describe register offsets and support
new IP versions with differing register layouts.

Add rk3568_regs, matching the previous macro definitions, and pass it as
driver data retrieved during probe.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 96 +++++++++++++++++-------
 1 file changed, 69 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 4ad4e3b23448affeeaa932a706653818ba4019ba..6a2966c9e3a2eac661fa1f8610c9f021d6e26cf8 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -24,14 +24,39 @@
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
-#define DW_MIPI_CSI2RX_N_LANES		0x04
-#define DW_MIPI_CSI2RX_RESETN		0x10
-#define DW_MIPI_CSI2RX_PHY_STATE	0x14
-#define DW_MIPI_CSI2RX_ERR1		0x20
-#define DW_MIPI_CSI2RX_ERR2		0x24
-#define DW_MIPI_CSI2RX_MSK1		0x28
-#define DW_MIPI_CSI2RX_MSK2		0x2c
-#define DW_MIPI_CSI2RX_CONTROL		0x40
+struct dw_mipi_csi2rx_regs {
+	u32 n_lanes;
+	u32 resetn;
+	u32 phy_state;
+	u32 err1;
+	u32 err2;
+	u32 msk1;
+	u32 msk2;
+	u32 control;
+};
+
+struct dw_mipi_csi2rx_drvdata {
+	const struct dw_mipi_csi2rx_regs *regs;
+};
+
+/* Help check wrong access unexisted register at difference IP version */
+#define DW_REG_EXIST	BIT(31)
+#define DW_REG(x)	(DW_REG_EXIST | (x))
+
+static const struct dw_mipi_csi2rx_regs rk3568_regs = {
+	.n_lanes = DW_REG(0x4),
+	.resetn = DW_REG(0x10),
+	.phy_state = DW_REG(0x14),
+	.err1 = DW_REG(0x20),
+	.err2 = DW_REG(0x24),
+	.msk1 = DW_REG(0x28),
+	.msk2 = DW_REG(0x2c),
+	.control = DW_REG(0x40),
+};
+
+static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
+	.regs = &rk3568_regs,
+};
 
 #define SW_CPHY_EN(x)		((x) << 0)
 #define SW_DSI_EN(x)		((x) << 4)
@@ -74,8 +99,35 @@ struct dw_mipi_csi2rx_device {
 
 	enum v4l2_mbus_type bus_type;
 	u32 lanes_num;
+
+	const struct dw_mipi_csi2rx_drvdata *drvdata;
 };
 
+static int
+dw_mipi_csi2rx_reg_err(struct dw_mipi_csi2rx_device *csi2, const char *name)
+{
+	dev_err_once(csi2->dev, "access to non-existent register: %s\n", name);
+	return 0;
+}
+
+#define __dw_reg_exist(offset) ((offset) & DW_REG_EXIST)
+
+#define dw_reg_exist(csi2, __name) __dw_reg_exist((csi2)->drvdata->regs->__name)
+
+#define dw_mipi_csi2rx_write(csi2, __name, value)		\
+({	auto __csi2 = csi2;					\
+	u32 offset = __csi2->drvdata->regs->__name;		\
+	__dw_reg_exist(offset) ?					\
+		writel(value, __csi2->base_addr + (offset & ~DW_REG_EXIST)) : \
+		dw_mipi_csi2rx_reg_err(__csi2, #__name); })
+
+#define dw_mipi_csi2rx_read(csi2, __name)			\
+({	auto __csi2 = csi2;					\
+	u32 offset = __csi2->drvdata->regs->__name;		\
+	__dw_reg_exist(offset) ?					\
+		readl(__csi2->base_addr + (offset & ~DW_REG_EXIST)) : \
+		dw_mipi_csi2rx_reg_err(__csi2, #__name); })
+
 static const struct v4l2_mbus_framefmt default_format = {
 	.width = 3840,
 	.height = 2160,
@@ -188,18 +240,6 @@ static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
 	return container_of(sd, struct dw_mipi_csi2rx_device, sd);
 }
 
-static inline void dw_mipi_csi2rx_write(struct dw_mipi_csi2rx_device *csi2,
-					unsigned int addr, u32 val)
-{
-	writel(val, csi2->base_addr + addr);
-}
-
-static inline u32 dw_mipi_csi2rx_read(struct dw_mipi_csi2rx_device *csi2,
-				      unsigned int addr)
-{
-	return readl(csi2->base_addr + addr);
-}
-
 static const struct dw_mipi_csi2rx_format *
 dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_device *csi2, u32 mbus_code)
 {
@@ -265,9 +305,9 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
 		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
 
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_N_LANES, lanes - 1);
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 1);
+	dw_mipi_csi2rx_write(csi2, n_lanes, lanes - 1);
+	dw_mipi_csi2rx_write(csi2, control, control);
+	dw_mipi_csi2rx_write(csi2, resetn, 1);
 
 	return phy_power_on(csi2->phy);
 }
@@ -276,9 +316,9 @@ static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
 {
 	phy_power_off(csi2->phy);
 
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
-	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
+	dw_mipi_csi2rx_write(csi2, resetn, 0);
+	dw_mipi_csi2rx_write(csi2, msk1, ~0);
+	dw_mipi_csi2rx_write(csi2, msk2, ~0);
 }
 
 static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
@@ -632,7 +672,7 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
 
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
 	{
-		.compatible = "rockchip,rk3568-mipi-csi2",
+		.compatible = "rockchip,rk3568-mipi-csi2", .data = &rk3568_drvdata,
 	},
 	{}
 };
@@ -654,6 +694,8 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 	if (IS_ERR(csi2->base_addr))
 		return PTR_ERR(csi2->base_addr);
 
+	csi2->drvdata = device_get_match_data(dev);
+
 	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
 	if (ret < 0)
 		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");

-- 
2.43.0


