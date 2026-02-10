Return-Path: <linux-media+bounces-52533-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMsrLs5ni2kiUQAAu9opvQ
	(envelope-from <linux-media+bounces-52533-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:15:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 514C711DBE6
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF03130970E8
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 17:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CACA38A9BF;
	Tue, 10 Feb 2026 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jbe139tP"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F438A705;
	Tue, 10 Feb 2026 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743574; cv=fail; b=iGxsHv+gRlBStFvbVYeVzQU8D+BpcqL05Gb2MP14cvOAplEZfda3gvmDkg/dZMx04bo6aflQ+QfciADab76ThcbW6YvnBZrmtC0KuC97OHfwwP6y92JySP/WwgR28lfTjGz4ylXHw9pDrKSPDkAYfxMTABh4lTnpGmyBq0aMGAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743574; c=relaxed/simple;
	bh=cwauPeJGSFHbyKR4A6yz+p0PopZYNFY/4Jq59rtaP8I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MPIhhXoiy1zGIl0UtWcpfVTB6OOAmWOpG7x+MRp89hjv7bcanZDceAaZdR61DQT95bcymULYDkGr0v2puMD20qHgQNxwgACvrUe74ZikZBmlIANu2QF/v+xn6d2u8+L3CD7F9bQVbT4e7QApq+5pe2z5qEeILOT/wjA1OTvdmlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jbe139tP; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPy3A1CGqZ4aStQpJ4iPVonodFvJJFxI2IUHiPF3bLbIVdkO22UvtXUns+zgJlmzxNHX9oDZIlGtH60J1LjYXTEqO7bt2jp1V09Cv1lpo6Xx2Oa/c7lBcY76rFAEVqTltBxJoro0IlmUfW2zbSFsggMB3IXm6lG9pBTU28hl5C5p5tALtKwQNeXLIRS53o2Hf0HSM4wXcQ7bJgxXMPDkF8AEO74rrV0jpc6/hRYihuCbWF96OhaNCHNpT0VwBYGP/UGJcWNFFplWLrTtVI/qOY8A32AvDl8ZvrdiiPabjrT3xjwJmJ3zCLoEkeswHRUc6O39wh5+Fzop1Y1jWKly3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12oaWvjtRVLxd1cj8dRdn0msT79+MJCd7iwgLySRsuA=;
 b=K4qzCrEBnRvxRA+sW69f8VBLwlsTVT99nYxg2dZEyeBGARISFRNv+pI44EFdFwGIBsu7lNd8psVId494X9kB8cKpZdZpibAPi4scJLy6sdpP+AS/mGe0QzBsP3kYDsBsJ/bUbMwtkVqpr8LVTnLc+7X7e6i350DxhXNNfeTbnfb2NMZSB5ui9/5AuD60BTwtxq2r3xviXvyHPqm2m+7SIEigecnJGcK5biKj6h1xro/F4CAegUZFyAXZO+woApH4RUnPSx2Ny0UxYHhv/k7XuMA1gATz7uXOeQGd44X+qN2LwBWk7YXIvVRIrhwlE80kNn0BoCDyCRmJzEJHy324JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12oaWvjtRVLxd1cj8dRdn0msT79+MJCd7iwgLySRsuA=;
 b=Jbe139tP61/aYoW/gJzo21Zfofj84mBY94bje8RG3srSHKF1U3ym2Q4YRJ/BWuKhvHz3IXN0XBbPedS9NysKMxJ4SwOSPtE7LktePA3Ek/OxE5nn6vh1o1UjKtWf0742MgFV1tGxz0g0peDls+a5+sAZahMwKslpHpmryBm6f24xWUNiCqVH2IvDShLlCMcGkptYsz48FzgwFrdv//0xnss1qu3uyzBHOzrmTg6kHfmY/OwL4nc3yLNZS7Xjffb852HvS0yfVc3ukxOcKLK7YX3un/C2iGuBe6T+Ht5j6j8OdGcVdxRLqMn0bYIBUh+NmVdNEMrZ4WXJUQ7/bZ9bTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:11:45 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 17:11:45 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Feb 2026 12:11:12 -0500
Subject: [PATCH 5/6] media: dt-bindings: add NXP i.MX93 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-imx93-dw-csi2-v1-5-69667bb86bfa@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770743486; l=2423;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=cwauPeJGSFHbyKR4A6yz+p0PopZYNFY/4Jq59rtaP8I=;
 b=2r1ja1cRIq/+JQKTdOYW9MAPdWXI5G/texFAQGuYG5Xy+kWAPB5Bl04NajrJPb9q1D/Vf0Idu
 +8pXZ2rUqONCrdUs2eB0fd6PL2e29K+CJAYsYqDqx8d6jTgrawg7hk6
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
X-MS-Office365-Filtering-Correlation-Id: 60a7abf8-06e7-4621-56e7-08de68c777fe
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eWxVWXRUdFRGTzVqVGlzandDV1VTdHRkYXZrcGw5a0VwekRUdmF2NUp1aCto?=
 =?utf-8?B?ZjUxbm5kUk5tUzhHTkQ3RjdzdGMzV0RCZTdrRU1SSlRnOWZwcFJ5SVZhU3FX?=
 =?utf-8?B?TGltNWpKL1I4Y0twNVBPa3Y4MXozYkxGSW5KUFBTbmNxZHBDL0NmQjI1cnRX?=
 =?utf-8?B?UDgrdk54N01FQkpKT05ONVZid3lLSjBoZ2ZUSlFFV2Y4MGhoQ0dET091RmZK?=
 =?utf-8?B?UTFkTzh2a3hEKytSM2h4NG5kbmRsTDB5dDhsRnZFZFM0MnRGQythZHNuazBZ?=
 =?utf-8?B?YXI1ZWhUcUFXaGFmY3lGVFBvMWV0Wm8zeElDSUxhLzJjdkk1eEQzZ3Z2Tk05?=
 =?utf-8?B?Qk12VDBzR0xUcm1FSndrczl1VUVOVWRQMHhMOWgvZ0dsZVRxdy9pRWFxdkpE?=
 =?utf-8?B?ZUdUUVVYTXR3WFhvZTZTTDNRTmtWak1oaCtpT3hveHNEWU9KcmJXaHVIN2ox?=
 =?utf-8?B?TzlqaCtJQ1ZMY0FXWjFBYStoelgzOTB1RHBEa3NnWnhxWm1xdjVQcDVXdDl5?=
 =?utf-8?B?S293YnlYbGxHakRVWVRHZmtxaHorYkplbFJJTERsM2dsb2NockZnVjF3cEVB?=
 =?utf-8?B?UXNYbHJnQTQrQkNZTXpLTlBDYWZxeitZWm9OT0d0TFNDZzl5bERwTzJrcHdO?=
 =?utf-8?B?eER2VGp1KzhyL1RsenUybDRaVE1aaFVLcXJTaTQyODVhQ1dsK1ZFYWh4K3hw?=
 =?utf-8?B?d1IyWTRpbWVrM2FPME05L0tDN0g4V2g2RWxiMCs5RjNRRlQzcXdZMmdDUllz?=
 =?utf-8?B?a3d4OVpLWlluc28wWDJHZzFqVldXYXRSYVltbDJwaXZQditMSGtZYzN3WllO?=
 =?utf-8?B?YUR6NE94T3UzNGpvSElEd25xVFFaTVphSlpFd1Q0WGJWcjdHaGl5S2kwQmFI?=
 =?utf-8?B?ZlAwOFZud0EwUG12RGI4eGozOGhiS011Wkdmb2lzZmRxN0N0RXBNMXNELzls?=
 =?utf-8?B?M2hIenZzakY4ZkJITjlKVnh6akRkaFpKb3E2UzB6YTBtY3JxZCtUZmN4bUFk?=
 =?utf-8?B?OWdHU1VnaW5laENrMGZPbFlCajlMS0Z2MzBGUERnNkwyUFBiNFhSV1hGcno0?=
 =?utf-8?B?YU5WdER4eEN3K2NteE44L05qOGlEN0dPcnY4cE1wbzVVNStaMWtCakhpQTlU?=
 =?utf-8?B?T0VsM05XS29iM2tWcWtPeDFXeWczL2s3ZmpsaGRWbEdYekVHWGxGeGhiRVFF?=
 =?utf-8?B?NUpnNHIvR3k3aDJNVld3bjR6RjBrV3ZWampvdUU3dG9rUE1DbEtVZ0JRS1Q5?=
 =?utf-8?B?OVRqQTZGTUl5emQzK2NTdFFnU2VQZ1R2RzNKQm9uemtyOGlqVWVUc2M5dGhF?=
 =?utf-8?B?eVpWV01mQ2hGV2NROHN5dzFmQUJzVUI4YytydkhLdm9YYXhyM1RYNUtLeTRG?=
 =?utf-8?B?YmRJWEo5bFFERFNMWHllbGwzMlc3Rk1mS3FoRzF2NlBHQmRHMUZvaThncEpY?=
 =?utf-8?B?SCsxT0JqQ2VBSVpqVXIrRnFyR1BLYWNJUVZYb3J5TFhWUjNaNGVQK1p1c3I2?=
 =?utf-8?B?K1lwRnVibG9iNGJleG1JRjJJUml3UGZXR0tSMTRBVFowM0phTzZtS2UzcUxG?=
 =?utf-8?B?UXZYUFdHUlZmeFdWNENoWGQ3Sm1JSEdrcnh1eFByWnVwQzJkRjdyRzVuS09a?=
 =?utf-8?B?YzNrQ3Z3ZXZibFdxZ2IrZ1hneHcvekhNNDVHMC9rSE1LcForR2ZmMGwycFBM?=
 =?utf-8?B?aHRjd09FZnBKbVZ2bGx4Rk5EblhuQUVsNG42TmV1RWVOR3RNNnBBS0hOWUYy?=
 =?utf-8?B?cGc2dUwxZjNldDZKZzBONTFMUWdIRmdVV1JpRit5SE5ickg5bnBLbG9HMDZP?=
 =?utf-8?B?RTVsZmoyZ3c2ZCs3OGwyTU1RVkg1c3h4WE1MelllQ0s0TFllN05KeXRQMU9T?=
 =?utf-8?B?UTRqQU0rTE4wVDQ0bVQ2enZOa1RGTFh0Y0drdTZTdXBYN3ZGRU9FajBjbHRQ?=
 =?utf-8?B?dWxuSld6SEZkWFpVNmJpM0syWERkUUhsWmZibFdTdTYwNzRPdWlMTzZRL3Rm?=
 =?utf-8?B?dFkveXFEQXQ1SDNtbnlTTXB3Q09JT29GcXQvRHUrMGQ2VVZMcFdZY2hNYi9s?=
 =?utf-8?B?N3l0SDl5OVRwL0FSZ0prbHFQOEVkRFQ5OW9SSERNTDJIZmVBQVlVKy9rY0FG?=
 =?utf-8?B?Y29IVnh2Q3c1N042UEJ3ZjdDZ3NtM25rWU5EZGxHVm5PU1dTV0FvbVV1eWVn?=
 =?utf-8?Q?+5rEBTkXNlLQ/JYxLFQwIPo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QUlIbTRrelZFK0paUXZyQnZHdEJWblZJbTJoZmNSZnpjby9QZFFwMkVRY3FD?=
 =?utf-8?B?NHJHUTFGM3A1YkVDb1RqZ25SODZXWk91LzlLenp0YTU0NDRnSEdIZ0ZZZU5m?=
 =?utf-8?B?OGhhcit2Si82YWhzazlkMGRGcDU0R3JabVhhQ1RBd0lma0ZDbnJ0V0ZVN05W?=
 =?utf-8?B?KzZaZlNsTHpRbHovV1ZSeFEzOHhIekQ1eVlTVzRNY2tmSGhqSE1zVm9qRXA5?=
 =?utf-8?B?bzlYa0tYZW9vblZTYnc2azJiMitaYW81OEdGaWhjelYwVGh3L0pwZldLWmRL?=
 =?utf-8?B?dTQ1ZVd1MWE2Ni9FMURqVEljRlU0S0xDNi84L0Z1ZDNEMzIrT3h6OE8zaVFr?=
 =?utf-8?B?QXhVL082TDY4aE5xTmNDVTI1QWVmTWJDVUhvNGk2VlRwNkJibjI5UlFlUjBD?=
 =?utf-8?B?amlTVkF0UGloWEM3eDFQV3hXSm1IMVFUU3VMUUluYmVjWXo2Mjg2L044dXNr?=
 =?utf-8?B?eXAyV1NleitUa0ZlY2tkYXhOK2hDZ2t4OVgxNDFzTEhieWl3aXIvSHZnay9X?=
 =?utf-8?B?M00rOSsyc3lEMXVZNG51Y1RjaHRHeFlUUHNIMkFtR1lRRFNyR3doOGZzLzVU?=
 =?utf-8?B?ZnFyZkJuZFNFdFJ5MTh6ejlGUk85bG93QjhoQ2I1a1VDQmpwWlY2WXVoUjMr?=
 =?utf-8?B?REUxaTlMbFhwMWlUcGlRRWtEVDFXRnJvdytzTStQbGp5dEtiT3V4emhRc3la?=
 =?utf-8?B?cE5tZm1tODBJTXFPelRKbHF4eUZmT2dIRnZkdFJQbGZ3aEpzTTJXTXpwVVZl?=
 =?utf-8?B?UHhnNW1NTSt0dFhwRkQ2UDFYYkpNL21Pb3l0QWVEVWhCUjNOaXpMNWhLcCtM?=
 =?utf-8?B?T1Q5RncwR3pGaVNPbkt0QWhETHdKZ1RydlBoeDd6SjRFaW5QNk5Oc0Q4SWVD?=
 =?utf-8?B?Z0VLQXAxTE1zWUhLaHNINFNSQUJ3Z1BueS9XMGRwOXlDWUY1Z0E0NEZFem02?=
 =?utf-8?B?em1kWnFDYzVkaHZtUWpDbzJGV3dNTitJWWpQZi9oSGhKRURvK0pNZFRVNUtV?=
 =?utf-8?B?TnBrWVZ3blVFYzRqVTh4UVdPeGJUcWZKMGhJUmlSUWU0YU9CUlVCSGlKS3Ja?=
 =?utf-8?B?SU1OVXNFYmZkdENOKzEwK3VkV04wQ2J6Qnlnc29jVUJKNmQ1czVOaWhZMlJ6?=
 =?utf-8?B?bGMzdFI0V05rcEFYTHJaeVZ4VThxbkRmKzFqM2dvMU00YlBobkxqL2R1STh3?=
 =?utf-8?B?NlczQ0QvdjMrOENJWklzVzNBMUozR29HbktqaG0wYUdpdDFXZlQ1bzhrQ3VK?=
 =?utf-8?B?dHM2NHUvT21yMnA0TmpEVkdMV2NUWGV3NVYrUThrOGJONlBkRjJKczQrWFFk?=
 =?utf-8?B?OTNzM0FDZVA1R1RFT3ZCZDF0NW4vM0lsMnZheEdyUmp0d3Y2UEdQYlhLUW9q?=
 =?utf-8?B?cllHUGhEeHU1U3BhQ3hTbWJmaU1RbG8yOWZsWEdlRnY1VCtkMWpXT1hiWUlJ?=
 =?utf-8?B?VzFGTXN1WXZYYUdYZnY0dTI0VnpTa3poVHJtbkp3Wm1YYnhSYUVtQzhKZDdB?=
 =?utf-8?B?Y3NyR2xWd2Jtbk5HdTd1SEtyMUtpMElQcnNkMzlucFlZeXZQTWZuNXpmMlJv?=
 =?utf-8?B?akhXVC81SEorZVFpZWpqYjJoMFpjY3B0MFkrUHZKOWtSMGppR2NEenY4UHV0?=
 =?utf-8?B?VkhGQm5nYVZvNmhvaU9YK01Mcm9ieGJEUWxOUW9ET2dHendkZlJmVDMyM0cv?=
 =?utf-8?B?cTROM1dKT0JRSVNneFZGb0lQNUVNN3ZpQVVqMzlGRXZRTlpuenhkNnM3bjN0?=
 =?utf-8?B?RDRFOGZVWVlXazBlSTFBbjgxbGxwUXdhNVh0ZU9FeVZydVZtOVpXZ0RHNHZC?=
 =?utf-8?B?U3lIeE5JekVhUUZYbklNandCNThMVUxzODNXa3RUeml3R0laSVkxZUtXaTkv?=
 =?utf-8?B?bHJZYW9LREh0eVpmeVRVQWhVNDlmOXFEczlqeHRBbVpLem9kWm5CT3Zhano3?=
 =?utf-8?B?S1M0WkdTNVFFZWE0cFJ4TjFTNWdIZ1B6TkU4emoxcTdrZlpCMExGamszOEZO?=
 =?utf-8?B?dUU3MXE5YndKaVJYOG5XaVcyQjA5MEpSdjYrRjhQb1lTVlNIS2FsRU5ScjNU?=
 =?utf-8?B?SzdIbGc5WVV0d2t5UEFEdjh1THVRZVdoTXBqQ0RDWk8zNUxGTU1SL2pVY1R2?=
 =?utf-8?B?VDdsV2h2T1RxN3FXVkVNTTBuZzVOL3lZVmt6Q0hKTTM3WlRxRjR0RVhYVXd1?=
 =?utf-8?B?eXd2TjQxbWFRSE9TWTlXeDI5WmpVQlVtR1ZWQ2p6S2FrQlh6dmV5MjBabDdn?=
 =?utf-8?B?b2p4eGFSVjd0bHhkbnlDOSs0QTQ3eHhnMTVqSzAvbTJ2QnVjZ3kwYTNlS21U?=
 =?utf-8?Q?Fgv3DXWZg1zNlUYxzK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a7abf8-06e7-4621-56e7-08de68c777fe
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:11:45.7360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tGIrriOjp7c0dZ1DjF4UJ5Z72XfZ4r8KdiI1wbDZ4O6Z2qhtqrzVM2Csn5etHkT6p1y528aXzlMyIMbp1mZUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52533-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 514C711DBE6
X-Rspamd-Action: no action

The i.MX93 uses the DW CSI-2 RX controller, which is similar to the
Rockchip RK3568 implementation.

The i.MX93 variant provides one IRQ, two clocks, and no resets. Add the
"fsl,imx93-mipi-csi2" compatible string and keep the same constraints for
rk3568.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 47 +++++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 2c2bd87582eb8bfdd13720edd62a5f00dda958ba..4ac4a3b6f406408b9524c795e6cdeb117d3353da 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - fsl,imx93-mipi-csi2
       - rockchip,rk3568-mipi-csi2
 
   reg:
@@ -26,14 +27,23 @@ properties:
     items:
       - description: Interrupt that signals changes in CSI2HOST_ERR1.
       - description: Interrupt that signals changes in CSI2HOST_ERR2.
+    minItems: 1
 
   interrupt-names:
     items:
       - const: err1
       - const: err2
+    minItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: per
+      - const: pixel
+    minItems: 1
 
   phys:
     maxItems: 1
@@ -88,10 +98,43 @@ required:
   - phys
   - ports
   - power-domains
-  - resets
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-mipi-csi2
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+        interrupt-names:
+          minItems: 2
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+      required:
+        - resets
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx93-mipi-csi2
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names: false
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/rk3568-cru.h>

-- 
2.43.0


