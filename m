Return-Path: <linux-media+bounces-27976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A434A5A2FB
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 19:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26A08172B6F
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 18:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB74237163;
	Mon, 10 Mar 2025 18:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="aPImrLpS"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2115.outbound.protection.outlook.com [40.107.237.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C60D235C17;
	Mon, 10 Mar 2025 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741631575; cv=fail; b=HDlKNJSNwRhQKqTwfd/OBLiQ7lrvga5k0JI0N4/voBJ6vapGIju7qg7jHGDbolYE8BrknL6M2PSx5VYytJNg7BJFflbULv4CQP/bP5/UG/267cW2TyAzMfYZ/wpzvP28guJvDCCyrAyjWWt/gWb1xshz608eP2WdGY3YGNRe1Hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741631575; c=relaxed/simple;
	bh=kAYGOzEGQx2OvKgjIChEuRkCI0P2yuNRdyG6zjTShZ0=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=EGp38Yh0ZJfji8rPJm4XO6Iy2cxc7v+8Rv2JDpnfIaPwKDrg19czk1yb8xbabM9GVDeBrpsjMCmZ7SXemj+AIoA5SbhCA34UyIr7N7ODu0QZC8fC5TKolu7fSAuIhUKEodVQRF5xFjwrJK5pYvtumh7TM38jbtfjd51/bGYiw5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=aPImrLpS; arc=fail smtp.client-ip=40.107.237.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbD9OU3yspyTNMZtBa8TabU8CeV/M+YpXDTBvwlMeJQAMeD81GM+4ZcMUxP0mvlPF0ePxauvLKgik0QQq+P05Yi9pf2wgTARVW6BFwvnqOwNpJkOsMF8vvHw6h9BvotzbTpYND2IvZ1+Kf+6VtF34RBeQuBTdEgOzrLQvejxjUhQn6fQlpB9f5IiKQDAjUYaQObtS4D/Xt7mxPnnbCHmn91F1lNRVjadUMhvxCU/cH5Jz4W0TbWqfJEhX8h/2FM0Ba4as0CjOsjo7tUmrcFgakZn5pvkjuNv6BcYLExMsxF4xUu2rx6bvuOsnRWkOsniOF32ORyA6/UGoCyKdf1+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAYGOzEGQx2OvKgjIChEuRkCI0P2yuNRdyG6zjTShZ0=;
 b=E5lUB136Y6/pdREn40hWbMtLC0iYE79BQv/ktfvTv6Mfry5OWEBbFTmfVLPy8HZkeg8hQv/8WrUKb/+e84udp7gZqu88ITnNx/aQeKZR1pexP0igvt2YFEa0Dc9E5xzek3iP0+e/tdDCd4BIJgqZ5G5ifTmswpddhWs3qVE38MVInnt8NuX8BFzQGZkS60rVqO+4wpNdrAPSpE3fvzPeaq9fdOsD5ARe2XoZ81Hn0yL3WX9MKO1aAC79T+F8zL0K5BVV1rnjvF13+E2F3Yz3BLP0NdMuk7eKIn3W717Oa3uyqknPmh2FbRksCDIVuM7zKvRGf2EynRdYLGNd2K0s4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAYGOzEGQx2OvKgjIChEuRkCI0P2yuNRdyG6zjTShZ0=;
 b=aPImrLpSEdbuQwaPItZlt5prcDFwLBudpy8W3dLQ5Id39GwVbU1lSRRVyAlNWBLD0TuObFDwWGyTLLMuUMmjvptc0JtfRcijPzgcLfewWQl6ZZxKfb4xGRwaCmmWPGxO8kDaTd3gf7jjVjzSiCtrgc3wC/nWH1KHaMRnH3Ukyso=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from CH0PR14MB7306.namprd14.prod.outlook.com (2603:10b6:610:186::18)
 by SA1PR14MB5425.namprd14.prod.outlook.com (2603:10b6:806:239::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 18:32:50 +0000
Received: from CH0PR14MB7306.namprd14.prod.outlook.com
 ([fe80::8bfa:1131:30b1:9295]) by CH0PR14MB7306.namprd14.prod.outlook.com
 ([fe80::8bfa:1131:30b1:9295%6]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 18:32:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Mar 2025 14:32:47 -0400
Message-Id: <D8CSV4M7YSV8.3QV5EGNMV1LKF@d3embedded.com>
To: "Vaishnav Achath" <vaishnav.a@ti.com>, <devicetree@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Cc: =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Abel Vesa" <abel.vesa@linaro.org>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Ard Biesheuvel"
 <ardb@kernel.org>, "Benjamin Mugnier" <benjamin.mugnier@foss.st.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Bjorn Andersson"
 <quic_bjorande@quicinc.com>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Elinor Montmasson"
 <elinor.montmasson@savoirfairelinux.com>, "Fabio Estevam"
 <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Javier Carrasco"
 <javier.carrasco@wolfvision.net>, "Jianzhong Xu" <xuj@ti.com>, "Julien
 Massot" <julien.massot@collabora.com>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>, "Kory Maincent"
 <kory.maincent@bootlin.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mikhail Rudenko" <mike.rudenko@gmail.com>, "Nishanth
 Menon" <nm@ti.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob
 Herring" <robh@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Stuart Burtner" <sburtner@d3embedded.com>, "Tero Kristo"
 <kristo@kernel.org>, "Thakkar Devarsh" <devarsht@ti.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Umang Jain"
 <umang.jain@ideasonboard.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Will Deacon" <will@kernel.org>, "Zhi Mao" <zhi.mao@mediatek.com>
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62a7-sk: Add overlay for
 fusion 2 board
From: "Sebastian LaVine" <slavine@d3embedded.com>
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-4-slavine@d3embedded.com>
 <bbf4f6db-cac1-4558-b345-8b4d6b36a8fa@ti.com>
In-Reply-To: <bbf4f6db-cac1-4558-b345-8b4d6b36a8fa@ti.com>
X-ClientProxiedBy: BL0PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:91::19) To CH0PR14MB7306.namprd14.prod.outlook.com
 (2603:10b6:610:186::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR14MB7306:EE_|SA1PR14MB5425:EE_
X-MS-Office365-Filtering-Correlation-Id: 181a21c0-2b2c-4051-ab8a-08dd6001f680
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cVRNdk8vUzJNbDFXTE9GakhrYWl4SmlRNlFSMktrRnZ0eGRSQVYramcyb29U?=
 =?utf-8?B?ak5PUUdmcDY5cTFWVk55MXd4N254cXZBZklNaTZnNG9UYm5aYnJMYXI1MEth?=
 =?utf-8?B?RjEyUG9Hc20wVzdpUmNSbjUwZm9VdU81MGVDOUxyRWgzRGFxOWtrT0U0QUw5?=
 =?utf-8?B?bTM4VHJ2SElSNXNHNmJYWmZhTjVETXkzWFhTM2FGZEdGN3gweHdjbEJGVnZ4?=
 =?utf-8?B?dWZDN0JqTGhpMXozb1d2dEowSEc5Q3I4emczM2VXclltR0F3SzQxSkVwWE5s?=
 =?utf-8?B?MEZJdkMyUjNRODJjUGQxaXE1WnovZVlZSGFSc3FUY1EvSE45dXZudkxzUGRW?=
 =?utf-8?B?a08rWHdNcWxtT2J2VWd4M0ZwMU5rR0FLUXlHTEQxcFNzYjVlOXBCUGRTZzA5?=
 =?utf-8?B?ZG1lVGFIbXJiWTV2UGdndEFMdGFDRFRkL1drU2duTENRbUxaaTdKYkEzRStB?=
 =?utf-8?B?MnVLZ2ZQdmVKWGx6ME1GKzlIL0NDRHZXYzI3N2JYWDBPdlB0SWQ1M1hlTWhT?=
 =?utf-8?B?dDBYRWN1dndNSXd0dWxnZ1JoZzdZdExaa2N5NTFKQXZCVWJkN3d5UVdrSll5?=
 =?utf-8?B?UWdDTXVxQ3l3NGI1czZCY1hoeWRyRXp0TTlBL3g0anhDeEdGTU51NG9SeEdG?=
 =?utf-8?B?QkZOam00SXQyYXJudXBCNUxuRlpmY3ljMzJJMnRuT3JlMzZtOW1rMktZSGxC?=
 =?utf-8?B?Z0NuV3lpeW5qcFh6L0EvcjdEMUFLMWtmSmxFbUdKd1FnZXhRU3RGdXcxZzJr?=
 =?utf-8?B?UUxwdm55UU5Samw5am1Xd0gzempNanpHWHZMeGY2ZWdkS2h3UnpqZ01RMzlN?=
 =?utf-8?B?M2pkcEMzckUxTEo5SU5IVWhWZzhrTXY0Y0pJa2F1amF6VHlBRFZVUm5yR2dU?=
 =?utf-8?B?b3B6VDR5ZW9XSHhhVFdXbGpOdXdxamtuTjdsM1c4L1NaK0lCbDdqWUVIZHUw?=
 =?utf-8?B?NXl6VjNGWVpHL3RkWVpZeUNlZnRwaTN2OVhBQVZqdis0OFc0YkJiRG5BdGxh?=
 =?utf-8?B?ekxNVGttUTZId04wZEl5T3FHdFAyWTh0TXlUSHkrakVoU2RudVdXY0tPbW5L?=
 =?utf-8?B?SU5hQjdQZnZUT2QrelN6QjNORHo2TjRvekZnUXc0SGp3a0tZcjdYSVBka3pV?=
 =?utf-8?B?cUlLOHo0QUdKa3VwcFNvWTRHRitBejVPdXUrSE5nNzJ0K1lTSHJSRGd2Uldr?=
 =?utf-8?B?bWtVcHl0YXcyR1BEa3R0bjdxYUpaWEFVcFhXRkc4M1d6UVAvS1JrdDVBdVVB?=
 =?utf-8?B?b1g5YnZkM21uQTc5b2tDS25MSVVMV09tdEg0SmxDZGJ4Y29mTkVpb2pYNUJG?=
 =?utf-8?B?OEowbEVoYXA0Q2Q1cGxEZ2E3YS94OXR3OGpFK3VGZUJCczdTRERGS2YxS2py?=
 =?utf-8?B?YXlldVhRZkpYc3o2TS8wdjBUZEwraGZCWXpTeVk3ZURQM1R5eDcvdFpFbmpa?=
 =?utf-8?B?V2dINzIxWDhHRkdPdWJ4RFVWd3NQZTJMNW1ydXh5b0ZFbEtZK0Fhc25wRFdN?=
 =?utf-8?B?cEV5cnUzZzd3dC9QTGlJS0hjbDU3M3FIZVAzN3JmRGtmclhKQkMxM01JZGNN?=
 =?utf-8?B?V1BDNEpGOFpJVXNVRE5EQm5XckF2RUl3ZzhyWDRzeGZJRTlqSGovMkJkbnk3?=
 =?utf-8?B?TWlHOE5PNE1tQnMybnFDZS9ncmUxQUhjYmt6OVp6YVFnem1JZDNtU1pNVmps?=
 =?utf-8?B?a1hJTEZSRUFRSHhXZHkyMjVFQWp5SEk3cVZyUXowYTIyR2lOVTQyYlpVR0hW?=
 =?utf-8?B?TkZoaTFCbDNPNzM5eXhlKzZLYW15SUJuZlk2elJBQlFSc3NVMWZ5NzJ0T3FT?=
 =?utf-8?B?OWtFR3pwdGFXRFFFWjlhbit2dERHQWhMZzZhQW53ZS9FNm56a1o1TTdiV2k3?=
 =?utf-8?Q?rt4J3rL5aCrMu?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR14MB7306.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cnFVelpBMTFwKzQyTHdrS3hjV2N3aTlkYnFSUHhXTHhsSWNzYjAyTVlqUXVk?=
 =?utf-8?B?Vkl5U3BOSmt4N3FnU05OMmY2TGhYb0s2Y2FRL0llYUhBeVErd3IvZ21NbUEw?=
 =?utf-8?B?dlhXZGQ0QldyNlVFZ3JhbWJ4U0hSQUdHZ3NkWTFvYmw0c3k2bGdCaU9qeEEr?=
 =?utf-8?B?MUp5U1VYeWh3UXVTTUZHUXBRSGg2WlBwSnhYS0l5TjVqSUx4b0NodzZsR3lO?=
 =?utf-8?B?eG1oVXk2ZXVQcVdWVS9maGxZZFU5ZGk2eHIzZmV3eVRuc1oxNHE0Y1k5cy9l?=
 =?utf-8?B?K2FTTzRBUXI2SXB0YlRHVGNXM3JmZC8vV2ptdlE2clpjaGhoYk1RNFVMbjBk?=
 =?utf-8?B?N3VJdFJ2ZUdWWVdWYU1LVHdwZnh5dFJuZFhLV0ZnY0FpMkJzQVNLQzBHSzly?=
 =?utf-8?B?d014WkdLUHpBMktUSjFLaG8xYkFNMDNyWGZzWkVNc2xEUVd6QTd6dEdjd2hJ?=
 =?utf-8?B?Y3NCUThBakNJOCt0WXhUQmlKWUdjTGRjTGJSajVMRHl3aXBXcytyV0lzemtH?=
 =?utf-8?B?clpERDNIWmlLZTV1MkFTY2FRbzhjWWtiT3M3OEtjbEVYYmxZRDF4ZFNxOFpz?=
 =?utf-8?B?cHZRZVlXL3VrU3p0OVhJaUd1dnNNZFlBRVBHaG1MSUllOWlkdDVndGRQVTlG?=
 =?utf-8?B?ZzNPVXJyazJKeG5MOFErNzl5NHlVQlY3VVN2L053QitONDRBN0JTdlRVNEtS?=
 =?utf-8?B?OFJ2SWZSYTNLTVowRVYwZ2JmYXdGN0o2QVNDWnFVZTdBeTVwWVpqY3lVWDB4?=
 =?utf-8?B?UUZzdXVINlVGUWU4algwaU93UzJYQll5S3V6cmJmY24rRXQ4a1VGeWpiSmFu?=
 =?utf-8?B?SG9GVjhCM2dEUnhMaGx5UFRYemxjeXA0UXpQRlNWb1FhWGw3UE9iSUpYU1kv?=
 =?utf-8?B?dkI0WDdnQlFZUXNpejRTalRWNTRSN0JiQmIyVjdxVjJ0czJPV0YxMjI4cE5K?=
 =?utf-8?B?cEpyem1nWUtSaVZlZGVDcjBOSVp1emhtUU5hSkNQWWQyVmZnZEFHYkxZdmVv?=
 =?utf-8?B?WUxuSkI1YnVmWkVKdVlQQWV3S092WjVMVW5YdGlEazJxbUpLaXUrazZwbGdQ?=
 =?utf-8?B?eG1XUE5Qcmh2YURQMTdma0w2WVhPaXdFUDZhZlN5UzdIQU5LbUZlM2tXNXRx?=
 =?utf-8?B?OVFHRW5ab1pPOWpHMVdBUjZ2b2ZKaGNRTUNLdXlQUTN0YU81d0JBM2liazBU?=
 =?utf-8?B?dHlqVlFZRzhHWVQxUk5QQmJBbm5oQ2hEdXgyY1oyeXhpUklIUlVIdE1iSjJV?=
 =?utf-8?B?NlRNbXVRNVJldHJwdjdUVUtuUHUydGo1QlJucTBmcDNSSmRQUnNxanpsdm5Z?=
 =?utf-8?B?ampEbnBqTi9lVHVqQWx2elE1TWJqNGd6aUxGdzhTYW1TSjFwNi9MaTUvTWI0?=
 =?utf-8?B?VzQ1YVVXZXNVeEhwaUtCMmRCU2pKL2c0VUVNVlZXV2dTUVJmK0o1U1NEakNS?=
 =?utf-8?B?ZktZOW11U2NvV3lha1M4RlVlcUg3NEhkeFR1ckp0TTlCSUFSdTVsWUpyRGt2?=
 =?utf-8?B?bmtkTjhzU1NsWUlNWjdpZStsdU54WU9wMWx2TXBCdzFEeG5CM0YwRnArUW9k?=
 =?utf-8?B?ZFl1bytpZldJMG1tQnJzUU0vVG9ROGVJRVVPcmZHVk52S09yaTBVKzMzUDJ4?=
 =?utf-8?B?ZzlUdEdPcE9tS1hNeTBnME9DZUtoY0ZvbW83Qkw0MFFvOXdRQ25lWHlIWllQ?=
 =?utf-8?B?Zm1xSVNKV2pSNTZJN21NZ2pxM3N1T1V2bWVxamFYeE82SDFLWFczOXNEQ0lo?=
 =?utf-8?B?UzBaTE93N2dsV2YraStqWXhuNWZrVWcvNjhWbEpzck5OSHljL2lZeDFDUFdy?=
 =?utf-8?B?bGtCOUlUVHd5dmNhUVdXSXd6U3Mwb0hUL2x1WHoza2ZWU3RmNU56S2xUYmRv?=
 =?utf-8?B?cFc5L2RqTUlDQlB5a2dnVHZPdUY3bVRvQnQ4ZDdjbTFweVRmZjA4V2lNVjNO?=
 =?utf-8?B?U09wUWhOYVFXUERRN095S3ZWcW9DUFlENC8zZFU2Y3BzWHJoZTR3aEsrVmta?=
 =?utf-8?B?WFB4a0FVWmFIbnpjUzRTSlFoQ3VrZXdncmdwUGM3VjczOEtHb1crbHBxSkxE?=
 =?utf-8?B?ZjB1VC9CMVlzdWlKZFo2K0NrNFo2RHk1S1ArZ1IzQTRCMnd0aGNueEtveW9w?=
 =?utf-8?B?VG1JaGlRWnh5OUd4dVFUcU1oaVVKVDlFQU9MMml6MXg0U2F4VURxQzY3eVVJ?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181a21c0-2b2c-4051-ab8a-08dd6001f680
X-MS-Exchange-CrossTenant-AuthSource: CH0PR14MB7306.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:32:50.4921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXKeeKnXJhuRXOxH8rB10jMOiN7FTMgd35sU+bPGZ+DdOi+uB770Y7MXTVIMOalyyFj2ncwgzLDKEaNKC0CokA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR14MB5425

On Tue Feb 18, 2025 at 2:07 PM EST, Vaishnav Achath wrote:
> Hi Sebastian,
>
> On 13/02/25 01:26, Sebastian LaVine wrote:
>> Adds an overlay for the Fusion 2 (FPD-Link IV) board on SK-AM62A.
>>
>
> Were you able to test and get this working without additional patches on
> linux-next?
>
> The multi-steam support for J721E-CSI2RX and CDNS-CSI2RX drivers are
> still WIP [1] and as per my understanding you will need those to get
> this overlay functional.
>
> 1 -
> https://lore.kernel.org/all/20240627-multistream-v2-0-6ae96c54c1c3@ti.com=
/

Thanks for this -- I'll hold off on the overlays for the next series
revision.

--

Sebastian

Please be aware that this email includes email addresses outside of the org=
anization.

