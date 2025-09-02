Return-Path: <linux-media+bounces-41494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB5BB3F235
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 04:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF02A7AF0EB
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 02:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649354414;
	Tue,  2 Sep 2025 02:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cStGkx2A"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CC72264BB;
	Tue,  2 Sep 2025 02:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756779724; cv=fail; b=ar3AR/oUt+8q81PibIdAwEQut+PuiMDwhUi8irOfaFcUlWg9Z/tYkGfFI3AsBIvb0lOXAOXwEV6NtUBgeGslRfttJxZzlGbSYbr7FbHbNTTrHoSGCTFF4OjzhmCoNY2fvgBUcm0I2GlX82suIlcYtMBUwXHBfy1dFDIUnbo1jC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756779724; c=relaxed/simple;
	bh=HMFwIItNwe6RFc8lY1RR56HwVYgjazAEz86qJ1G29+4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ra73Xo5IMMU4+gtCSW30tF4nYWLZ+udMNbYPVLhL+qR02QohywmvoqMNrCsC94ON4JX1RPkny1mrUBY1WHqOEXwzEQLV0vE3kFpfE2Jl+GrUnh5rnEPMmTbJIJ8tglwaQZUsgaDaUIhBVATeToAoqBf0ac63AnHofKicHwXHfcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cStGkx2A; arc=fail smtp.client-ip=52.101.69.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agH87qPHIQf58ETRZkmgMgEtFigYhyERA3VngBtp2TVcdRVlbV4zXz9dicXm9RFxsUMuSadSIcv+HbtPCyxbayDLBV9EgN1PELH9GrkKGLPbno/vE0ONRv6XI/ma7YD/DcExyqvMVKm5xDtyeZ9QlRfV3GERagr49A/Q0CVUOCM0MJHHRrUhBZu9sD7pzmR6M3+yn8SNLCCXKSAHKSMmqLQCAFxrW8yZBT/gcY0mmMkKJjlDnEquBX7SHiD9RrhuSyWf5upU3l8r0aeXdmBBUejr9oPrjikauvuhS91oi8PejHXAS2EwnGOe1E1X33x5CSLHHZZ0jnhH7XE0sExu6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMFwIItNwe6RFc8lY1RR56HwVYgjazAEz86qJ1G29+4=;
 b=sEkR/OH2lW1q4Fe1mTeyc3Aumfiz5cB5eAEAFI8FZbv9cuBdtYZggCzfW8FleCTDPtC/pDNCx/UwyM7MjlcgiBfwD6wD0TMnBXStF3v9r46VupUwNZOsIP3tgkr8JgqWR+Ha6Yw6RU4iNAQAm9VuIVHhGQeawR4opUfgq2xV474mpRd+hdF7Nize3v304G8asKm1z0k/X5C21BW2ZLeticqaLeAwuU79DnMCPeamsCWYmvzs+eW1rR0jO0546cYjTDgtI4CpPkXf3sZL3iSunlJKzTjFWV4xWWPZuTWya77NOLye2aE+XDLZiTeZcKequd7AvTmQmy+2r4kIbdlp8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMFwIItNwe6RFc8lY1RR56HwVYgjazAEz86qJ1G29+4=;
 b=cStGkx2AuE8qPUbC3kD3YZx3TjM+IBmb7GJ5wPKRWRdILJSPBdOUw2beP/wtl6FWWdNUKb1uoZlxcmPEBUkkVSkhizhbBWORuPR6/cw4nlefdcpF0zfbLrXtqNg7nbmNTX9MeN/wEdSUs7zDb5dhy6NfuynDJ0iBstOziKFsNcOZUq1lE1OCxgGdxi0WUHUsk27/VomQRX1XGH23mJPW9YEJCEQ7TK/mPZYTE7WOzWF+Z8+dcFR0ym+dXduZWEM7xGGPffgFo/66OGD1vEnUgpHP6eXbuUMu2gaBiZIvaig4BnA9yKASmVnuU2huDzG6yqC9qTWccdpxa9qvC7Tlxg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV1PR04MB10428.eurprd04.prod.outlook.com (2603:10a6:150:1d4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 02:21:59 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 02:21:58 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger
	<martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v5 3/4] media: imx8mq-mipi-csi2: Explicitly
 release reset
Thread-Topic: [EXT] Re: [PATCH v5 3/4] media: imx8mq-mipi-csi2: Explicitly
 release reset
Thread-Index: AQHcGwlLwnoJRnJ6E0iWRD5ZpRb9nrR+dk8AgACxZbA=
Date: Tue, 2 Sep 2025 02:21:58 +0000
Message-ID:
 <AS8PR04MB9080AD8135277660ACE41FF0FA06A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com>
 <20250901-csi2_imx8ulp-v5-3-67964d1471f3@nxp.com>
 <20250901153632.GA13448@pendragon.ideasonboard.com>
In-Reply-To: <20250901153632.GA13448@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|GV1PR04MB10428:EE_
x-ms-office365-filtering-correlation-id: cebe1690-23f9-4930-aba3-08dde9c77ea9
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c0Z0WU5sRGhUc2hDdlp0RDBNN0ZZZkF6Z3hNeXpuR29mbWJBZ1d4UWNvcWhy?=
 =?utf-8?B?SGRyVE5SNW9oRW43bVd4TEUydGdIcHFLY0hzNEgwU1U2UmRlSktwM2h4TXFQ?=
 =?utf-8?B?WllyY0dMYnU4c2h6REM0S2p2ZlZlTzR1UFF0b3U2aFlrc09aanJ1a2RBMDZQ?=
 =?utf-8?B?bjVYV3FFTExLQUxLckl4bm5taytHNnN2c1pQOG1MeHVsRUpCM3VRYnpIMUUr?=
 =?utf-8?B?dkJvNjh6eGEzWG1SMnFZVUdSOWsxZ24xcDFxcmJhMm1HeGFYcDdQWVFNKytu?=
 =?utf-8?B?allNZ25oemhqZVorUHBlK1RHUlZuWTZXQit6YWJjODZJcGlETlFJbW12cE1u?=
 =?utf-8?B?Umt5Rmd5bXNTQktCQ0MrM0Q2L1VaakN4MWoyQnBLRzRjL1pYOXBiMm8xVytU?=
 =?utf-8?B?RzNIQzltSjBPUFNPOXNleDh2MTBFa1lTYkxJYzZQaUsvUXhhdS84c2xIQ3VG?=
 =?utf-8?B?bzBhTnlHVHB4bFY3cW9HUGRydzBTeTlmK2pQUkJPeEtnSlBOZEROWEU3VzJH?=
 =?utf-8?B?d2Z0SzUrd0c3MkFyQnBGQkZ0d3o0SnNySG5XZFUyV1ZCQk5DUlEwcUZQRWxu?=
 =?utf-8?B?b0V4Q3pTdms0MFFvVmI5OCszS2NZSUVVVk1mTDV4RHFISHRlWmNlazFlOU9K?=
 =?utf-8?B?RHY5dVBLN2k5T0o0bFVyZ09xbndFcFNVcUpBQnQ1ZDUzanNFWVhZeDF2WFND?=
 =?utf-8?B?anNCUUR6SitGcDFZeTNpUDJNaUt0eTQ5cnJHcTFhRzMyMUJleEZLbUowTEFz?=
 =?utf-8?B?WkRUZ2RBYzRrSkQvb3psOVJOaXREemtRcVVrNnB0TnIweWJ3c2cyNEJudVhO?=
 =?utf-8?B?VDhYVHQ0Z1JTKzM0eG1zWU1tSWlZRkY2NDYrWTRleW1FdHBFcEFOVXM0VmdB?=
 =?utf-8?B?bUpoZzduSDZ4b0h4VWJicDZNSHhGM2JuT2gxZ0dTSHhrSDFXU0xEQXFGZGht?=
 =?utf-8?B?aVpOb2g2NkhicXFiU0hDUzcvN1gvMEFYUDB4b0JEZGJCNUh2UThPaUdCaW52?=
 =?utf-8?B?cy9TSVpOaGtNZWhVdnVoQVJnQzRQQk9FYmNyclpjU3dVWEVQd1dML01oTEVE?=
 =?utf-8?B?SW1RaGtNRDhaV2dnQUJVRkF0cTJnU1FyTW1ESnZaKzN0U0I0dXYrV1krUzkw?=
 =?utf-8?B?WE9iTk55MXFnRHlOS3dRYTJ4ZVExUnRrZ3pTYUFRNWRQWGwwYnluQ0RRalNK?=
 =?utf-8?B?MlRUcFZMaHVVTFFhQjhVZGptZThuUkJWY1JEb1Fyd2EvdHNQVVE5R2lzcEw4?=
 =?utf-8?B?aWNTdjVHRGY3MGRaUnI3NEwzRmN6bXJSUlpWbGY1YlBSazlKTkcvcURBWHEr?=
 =?utf-8?B?NllERnN4dHQrVjVwcjJXWEg3emtpeHVkcUlrUHIwYkkrTFN3Ly92MG42blFW?=
 =?utf-8?B?eWlqUUlLMFdtUmRpRnVVbjdJbkc4WGUrdUU0VkNqYUlvWDJHOEQ4bnBFVFJx?=
 =?utf-8?B?cFFNTHBzQ3ZQOTV0bkJoN0MxbWhGOFRYczFWMGYzV0JqeVZ0aWtwOWJiaU9i?=
 =?utf-8?B?cTFXdFBaTUx6S0N1bFZ0dVNiNk5BWkdvNG5LaWtaQUwvNUI3MXR5TUNXL2E4?=
 =?utf-8?B?UUlFWTIveE4yRmlVd2hNeDVjNUJlRWVhc2ZyTWxlQVl0bGhFZnV3ek9UenZq?=
 =?utf-8?B?ZHl1YXF6VjZOeFNhOXFuS3MxTVRDSEkzNnRMbWhHcjRCejJoWWpUeTU0MnBv?=
 =?utf-8?B?eVJSZXpsRzY1dC9pd090cFY1dUI3bjk0N05RZk1sZkxhWEpBeFhEdC9Ea0N0?=
 =?utf-8?B?dnl6YmJmUGpaWm1GSDNmTURIRytWbkRnMGM4U1RPWE5wWXorRGpPMVV2bTZz?=
 =?utf-8?B?d2RuMkNkcEVJODZXUmtURklRUEdVbkxGK1hOUlhlSFZFamdISUhTeng2ZmtI?=
 =?utf-8?B?UnQ5d3dBeWRUVnBBdnZyREVpM2pSR1FvK2lJV3U4MUJ3TitNNG9VZndJNzVE?=
 =?utf-8?B?QkNzcVZWTSsweFo2dUJLeG1GYmU0R3N5QWZ2Q0kwbk5vRmNlTUZzb0pWZTlZ?=
 =?utf-8?B?MFlXcTlMaHpnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VFFFZjJsMmhxc1BJeU1vaWFrNXRnNEE3UlIzMEF4YVcxNStZNFJxUS9SbWNN?=
 =?utf-8?B?K0FpYjZVZ2dSRFgvekNaMSs2Wit1a1NsWjZic2I5dERqL1RNV1dGV0lJclRk?=
 =?utf-8?B?VHh3K1hadWI0TlVTQmxMZ1RKVlg1bCswVHJlR09MdFZhOC9JVTZVQjcxdXoy?=
 =?utf-8?B?UHBMa3BZUURhZG1oOWVjSThWdWZjeXdRYm5mZUU0elZKb1NheTd1OTRpZkYx?=
 =?utf-8?B?ZE5LcWF3TmFVTFpud0V6S3NuOUNMTGVoSFRhQldVYWc3dVdnZThmMDVYR2pK?=
 =?utf-8?B?ZUNwRWJVLzdBVEdwVW13ZGlzbUVMMWhsVE0vREZtQ01qQS9NUGw0Qm94R0xI?=
 =?utf-8?B?aE14eHQzL080dlBYZ0VPdXhRbk90bGVFc3ZxcHE4RTR6Q1puOVYzeHdnVnhR?=
 =?utf-8?B?UUhweGlEQ00vRGg5OWF5M2xVVDNqVjNZVGV5Z0VTWVlrc0IrMXl0eXZxRWE2?=
 =?utf-8?B?R0NYTVlwSkFSZTlZL2M3WWdicFRTbFBSakVBRjJSZVBaZnJ5eWxBRlY1aElF?=
 =?utf-8?B?MkVKYnh4R1BDNEJkVFRwTFhoeldueHlHS25NUXkzdm5MZEJMZE5SS2R2UGZC?=
 =?utf-8?B?alhGZjQwNWZvSm9kL0N6eWxUZzk5a29tdGhacGxWc3dYNTI5VS9wYnNCWHhG?=
 =?utf-8?B?TlJ3RkFkaFB3czI3ajFNcjlkMkQ2YjNCd3RVaHFTSUF5eGJtRzUvTktnTCtU?=
 =?utf-8?B?YWkrTEl6aUlkeURjOXJQN0J4S0M5MXZYWmtiOFdUOVpZS2h5TUNsellFbGNx?=
 =?utf-8?B?ZTVhSWZTSm5obTA0bzIxOXJobTJXc1diSnRxUlZZbDZUeTZqalMyYWhheWFr?=
 =?utf-8?B?aXd1WkNSVURqU2ZiREd5QnJyN1FKbVlDSzF6U1BHbGllYVQ4QytyRnJzOWdl?=
 =?utf-8?B?QXBYTHBrdVYzdVJaMVpTMUxnUWcyV3YwUzVlWDFIZHY5VjZWT0NweXdjaEpt?=
 =?utf-8?B?M0dJWFIvdGRRZlFRYXJtcGdtREEvcXdwamd5cUsrRmJSRERtTmg5QzRWbUdn?=
 =?utf-8?B?YUwrZlIvWkVFQnlaSG5MaGd0bFh6SEhWcHBWb2o2dE1aSC81VVpxeDRpVEZl?=
 =?utf-8?B?bkZyMk1jY09ZQnU5UHJ1QnM2M0JWN2RFYklzVkg3R1ZHVnV1WVVaZnhsWUl3?=
 =?utf-8?B?U0kyYWs3M0ZEWDJSc245eXhCSGVBQmNLcE5PQk5uUmJVZzdqVm4rREZoTDUz?=
 =?utf-8?B?WGFOQ1FhOUF0WEhXblVvS0FwakZ6VkR5SE94MUVCb085OGM1eG43MDBFT1R5?=
 =?utf-8?B?ay8xbmowUWVqUWRQVnRENnZ0bS9IekcwaGFVMEVkeXpqNUJPcEFVNFhtUXRR?=
 =?utf-8?B?RkF3dkxWN25WRU1NdnFMWDlpMmxzdEFjbFZVSHJNaGZneU1ETTFiTkkxZ1Rq?=
 =?utf-8?B?VEZJaUhTdmpZR09JSWhFMW5vVGdhcXRQYWpWMnUyalZXSVg0dDl5TzVhbElZ?=
 =?utf-8?B?eFpRaHZ0YmlSQi9NM01Rd0VtUzdReDRiQWxRb2xad0pMaCtCbkV1VlpTUmdt?=
 =?utf-8?B?bVc2RFVNRGtjck1MbHBtemxXL3lodm9tckR5eXA0MVdZcEZkUW81T2JhN1Vo?=
 =?utf-8?B?dHJ0bEtHSWwrWDF1aEE3QVRJTHhXYVc2Ky80bUp1NWJwWUQxNTdZb25nblk0?=
 =?utf-8?B?S0xtWkIwNzlqUWxUZmNZK1RIUE1jU0JUQk16V3A4bmtYMVlYZzhpLzlnb1Jq?=
 =?utf-8?B?eWd1NVVGK1lIeTZHOGJrdk1PSFJuMDZ5SWxFNzE5QVpvWTFnck5ybmVGNzYv?=
 =?utf-8?B?Y0EzWFFmNGFLZ0NMVzh3dXZzZWRpVWVLWHpCZGlEeWhEZHZzOU92ZWhQdmU1?=
 =?utf-8?B?MlhaR09MeUtNVlNHMmhJYmpMcUlWeXpwTktRVm5aRjhEUmdBZkpUSHlXWGVZ?=
 =?utf-8?B?NVlGR2NOYkh1WERmUTRqOVE1MnB4ZnM0bFYzbkpPVlpmOGJrL2FxTXVYTlBt?=
 =?utf-8?B?ZHY0WGpDSkg2WEI0amdxZ0VZYm0xYXJTYjNIS3hmZDlCVEUyWGdkaHk2VU1L?=
 =?utf-8?B?NWx6UzNjOE5JdmtqNGlnMHF2aUR6L2s4dUNZaENnTmNIRVdBYk9Ya29jUkN4?=
 =?utf-8?B?dlZKNkpyYVk4L1VNNnNXL3BYMjVKRlpodXNhOThabXJxUlpKZldOQUY4K2Nm?=
 =?utf-8?Q?Fw3G1gmtB8SnzWGgH2bwD8aJQ?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cebe1690-23f9-4930-aba3-08dde9c77ea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 02:21:58.9106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KyB0KgY5b5W3DwNdnNG/rUgL4H1i+lzDMSD/prQrLsGJrZex2SrKDzAT7yqFf7qudnwo9nl7jO7mMjxu2iKHAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10428

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDEsIDIwMjUgMTE6
MzcgUE0NCj4gVG86IEcuTi4gWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gQ2M6IFJ1aSBN
aWd1ZWwgU2lsdmEgPHJtZnJmc0BnbWFpbC5jb20+OyBNYXJ0aW4gS2VwcGxpbmdlcg0KPiA8bWFy
dGlua0Bwb3N0ZW8uZGU+OyBQdXJpc20gS2VybmVsIFRlYW0gPGtlcm5lbEBwdXJpLnNtPjsgTWF1
cm8NCj4gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPjsNCj4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwu
b3JnPjsgQ29ub3IgRG9vbGV5DQo+IDxjb25vcitkdEBrZXJuZWwub3JnPjsgU2hhd24gR3VvIDxz
aGF3bmd1b0BrZXJuZWwub3JnPjsgU2FzY2hhIEhhdWVyDQo+IDxzLmhhdWVyQHBlbmd1dHJvbml4
LmRlPjsgUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47
IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT47IFBoaWxpcHANCj4gWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+OyBGcmFuayBMaSA8ZnJhbmsubGlAbnhwLmNvbT47IGxpbnV4
LQ0KPiBtZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBp
bXhAbGlzdHMubGludXguZGV2OyBsaW51eC0NCj4gYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBb
UEFUQ0ggdjUgMy80XSBtZWRpYTogaW14OG1xLW1pcGktY3NpMjogRXhwbGljaXRseSByZWxlYXNl
DQo+IHJlc2V0DQo+IA0KPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQbGVh
c2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3INCj4gb3BlbmluZyBhdHRhY2htZW50
cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0IHRo
aXMNCj4gZW1haWwnIGJ1dHRvbg0KPiANCj4gDQo+IEhpIEd1b25pdSwNCj4gDQo+IFRoYW5rIHlv
dSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gTW9uLCBTZXAgMDEsIDIwMjUgYXQgMDI6MjU6MzFQ
TSArMDgwMCwgR3Vvbml1IFpob3Ugd3JvdGU6DQo+ID4gQ2FsbCByZXNldF9jb250cm9sX2RlYXNz
ZXJ0KCkgdG8gZXhwbGljaXRseSByZWxlYXNlIHJlc2V0IHRvIG1ha2Ugc3VyZQ0KPiA+IHJlc2V0
IGJpdHMgYXJlIGNsZWFyZWQgc2luY2UgcGxhdGZvcm0gbGlrZSBpLk1YOFVMUCBjYW4ndCBjbGVh
ciByZXNldA0KPiA+IGJpdHMgYXV0b21hdGljYWxseS4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBG
cmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9uaXUgWmhv
dSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9ueHAvaW14OG1xLW1pcGktY3NpMi5jIHwgOCArKy0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDhtcS1taXBpLWNzaTIuYw0KPiA+IGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OG1xLW1pcGktY3NpMi5jDQo+ID4gaW5kZXgN
Cj4gPg0KPiAyYmYxMTk4NDY5MGFmMmU2ODdhMzIxN2U0NjU2OTczMzNkOWQ5OTVkLi42YjgzYWE4
NWFmNDJlMWRhYzI1Y2YyOQ0KPiAwNTY4Ng0KPiA+IDM2ODBjMWY4OTQwMiAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4bXEtbWlwaS1jc2kyLmMNCj4gPiAr
KysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4bXEtbWlwaS1jc2kyLmMNCj4gPiBA
QCAtMzM3LDE4ICszMzcsMTQgQEAgc3RhdGljIGludCBpbXg4bXFfbWlwaV9jc2lfc3dfcmVzZXQo
c3RydWN0DQo+ID4gY3NpX3N0YXRlICpzdGF0ZSkgIHsNCj4gPiAgICAgICBpbnQgcmV0Ow0KPiA+
DQo+ID4gLSAgICAgLyoNCj4gPiAtICAgICAgKiB0aGVzZSBhcmUgbW9zdCBsaWtlbHkgc2VsZi1j
bGVhcmluZyByZXNldCBiaXRzLiB0byBtYWtlIGl0DQo+ID4gLSAgICAgICogbW9yZSBjbGVhciwg
dGhlIHJlc2V0LWlteDcgZHJpdmVyIHNob3VsZCBpbXBsZW1lbnQgdGhlDQo+ID4gLSAgICAgICog
LnJlc2V0KCkgb3BlcmF0aW9uLg0KPiANCj4gV2hhdCBoYXBwZW5lZCB0byB0aGlzIHBsYW4sIHdv
dWxkIGl0IGJlIGZlYXNpYmxlIHRvIGltcGxlbWVudCB0aGUNCg0KU2luY2UgcmVzZXQgaW4gVUxQ
IGlzbid0IHNlbGYtY2xlYXJpbmcsIHNvIG5lZWQgdG8gcmVsZWFzZSB0aGUgcmVzZXQgYmVmb3Jl
IHJldHVybi4NCkFuZCBJIHRoaW5rIGl0J3Mgbm8gc2lkZSBlZmZlY3QgdG8gY2FsbCByZXNldF9j
b250cm9sX2RlYXNzZXJ0KCkgaGVyZSBzaW5jZSBpdCBtYWtlcw0KbW9yZSBjbGVhciBhbmQgcmVh
ZGFibGUgYWJvdXQgc29mdHdhcmUgcmVzZXQgaW1wbGVtZW50YXRpb24uDQoNCj4gLnJlc2V0KCkg
b3BlcmF0aW9uIGluIHRoZSByZWxldmFudCBkcml2ZXJzIHRvIGJlIGFibGUgdG8gdXNlDQo+IHJl
c2V0X2NvbnRyb2xfcmVzZXQoKSBoZXJlID8NCg0KSW1wbGVtZW50IHRoZSAucmVzZXQoKSBvcGVy
YXRpb24gaW4gaW4gdGhlIHJlbGV2YW50IGRyaXZlcnMgc2hvdWxkIGhhdmUgc2FtZSBlZmZlY3QN
Cmxpa2UgaGVyZS4gSWYgeW91IGFncmVlLCBJIHByZWZlciB0byB1c2UgdGhlIHBhdGNoIGhlcmUg
c2luY2UgbGVzcyBjaGFuZ2VzIHVzdWFsbHkgbWVhbg0KbG93IHJpc2suDQoNCj4gDQo+ID4gLSAg
ICAgICovDQo+ID4gICAgICAgcmV0ID0gcmVzZXRfY29udHJvbF9hc3NlcnQoc3RhdGUtPnJzdCk7
DQo+ID4gICAgICAgaWYgKHJldCA8IDApIHsNCj4gPiAgICAgICAgICAgICAgIGRldl9lcnIoc3Rh
dGUtPmRldiwgIkZhaWxlZCB0byBhc3NlcnQgcmVzZXRzOiAlZFxuIiwgcmV0KTsNCj4gPiAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gICAgICAgfQ0KPiA+DQo+ID4gLSAgICAgcmV0dXJu
IDA7DQo+ID4gKyAgICAgLyogRXhwbGljaXRseSByZWxlYXNlIHJlc2V0IHRvIG1ha2Ugc3VyZSBy
ZXNldCBiaXRzIGFyZSBjbGVhcmVkLiAqLw0KPiA+ICsgICAgIHJldHVybiByZXNldF9jb250cm9s
X2RlYXNzZXJ0KHN0YXRlLT5yc3QpOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgaW14
OG1xX21pcGlfY3NpX3NldF9wYXJhbXMoc3RydWN0IGNzaV9zdGF0ZSAqc3RhdGUpDQo+IA0KPiAt
LQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

