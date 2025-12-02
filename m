Return-Path: <linux-media+bounces-48096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA4AC9CEF1
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 21:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E2F6834769E
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 20:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEA82EB87F;
	Tue,  2 Dec 2025 20:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JerGe+CO"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64377248F64;
	Tue,  2 Dec 2025 20:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764707792; cv=fail; b=BrGW46ph9t5IePpjAsBsNXzy5TLjLSqNKgD0CUphiGOWSgo4q35Q9G/XlRvkSihXOUfMpV+ZvCL+6GE+ef7xcgkMoX+C6GiLeFyAbtQFm6oD7KC0hUfOdzWtpQ8yCCLprBQU5ATXsNc8HrOIvg6S7gaCurI5v/91vBNUOxkwJ6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764707792; c=relaxed/simple;
	bh=4v80OQiIhH340JcjMGnioh98JRKqBB90Z8MYgiWmnaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=neiptf0ufhHsRFSZw8c4TUKG1r+nAYV4JsVFeMOLU9HC1RnIHlkwtkBjo5SCJzMpPhc93Vk5CzwIz+Tl06qBPNpn5Cy0f2y4TLzzGzJM4pCU4eXP9Nc7W3ibGuZfL5JdkuE8YHmrXkWEy7OVDlXuWJocdJEzLqGA/Jyawkmif8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JerGe+CO; arc=fail smtp.client-ip=52.101.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOxqLP0A1XbHKPAGPn7hRDRUOP6nOoHI+AhM5kwE3TefIBfnYe6hiONUPCDxKA2Q9Qh3G2EpDKl5l13gWgaopLtWsZiOGq1LuvLrQrjlMITdapQcplaBgtD92pGcSNW0LcXLDENxb2gumQUR3Y1z7qPM0Y3zJ8D5/O6OEf60WTG1YHOZBN/UTA1IxPCgdIah4BT520BqIbiL9Q8d6aqIXeSvYPYz95BRJGwZGmuMk8d/2FuE1wZVmN3WIIJesh11Ot2og3wY6jCtVN20xne5wTIArYQakrCVLrd4B0gNpRPSCaoTfqcKXoYladvU2yQgvWgblnicu3JmdDi5ZLlD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg99sUR/UAkOjRn2deInT4Ias+2t2tB08XcX+AE5TTw=;
 b=oMvWvuU4UKDP+T4XSAGzxvEChyFASBLHGEKgUpWu9O2IMsCmOev8T+aQgbVLyXnLgOcSsTqsgBEPDa0HjvjV1K5Z1e8hUvA/X9aoZyA2leg9Pl/o3YjZeNxPaRrK1zRygRbxJUxLYK7Bg7UF1KyCirnYHE8CYJrJdx+JBU9BBOlwJqBJTmljpC0DVA/JppTvLDIic+9AcC+eWmR//V5mIceqvng4D4TLd7l17rai3QQtsC5yrWc2emorVFYLKoM27w8GywJKYIubNbZ65hsAl/2JXRe/6vid+yxYuXW9J/h8Jx2ENkqhpKgPmACPgCaTkWDl39i1xd/7efB5SRoBXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg99sUR/UAkOjRn2deInT4Ias+2t2tB08XcX+AE5TTw=;
 b=JerGe+COe/V1+IxY/nWbG0M9j73cYlNWXepMLLRPcWyZel9LEzWOjaOCdWDYoJoNDd/s9QP5/5rKP4sSCileSEFa8fwrPOHvzhFwbSy0wdmsDmyqf6+86tzjC0bsnzj/+MXN7OVDrMG7oVmv7zxcvy28HFJQFgafYF66M8tbfUx5ob1jYZ6feYbnqKlS+Twi1nYBOxqufiWAjCBGyKoR0sWi4/xuYDt+1dod0kkFGey2I39EkwV8+it6WVewsYbwZTBn8UB0SiZsbDkkNqID6pjmD9S6dUw/OZuQEYjr/M/YRS5JJLuD0BfBa3k9Ne+fI8TG/MZSbgEEcqO3EYyLUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV1PR04MB10377.eurprd04.prod.outlook.com (2603:10a6:150:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 20:36:25 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 20:36:25 +0000
Date: Tue, 2 Dec 2025 15:36:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Robert Chiras <robert.chiras@nxp.com>,
	Zhipeng Wang <zhipeng.wang_1@nxp.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v4 0/5] media: imx8qxp: add parallel camera support
Message-ID: <aS9NvkAWTa42j7KW@lizhi-Precision-Tower-5810>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
 <20250805010822.GC24627@pendragon.ideasonboard.com>
 <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
 <20250902123920.GM13448@pendragon.ideasonboard.com>
 <aLhJDXnz9HPGrWcp@lizhi-Precision-Tower-5810>
 <aQuDSROHLGHIhtlh@lizhi-Precision-Tower-5810>
 <20251105171928.GB6046@pendragon.ideasonboard.com>
 <aQul/VGG8e3MJxhx@lizhi-Precision-Tower-5810>
 <DE1JMG95RZME.2YSV10RI9AME4@gmail.com>
 <aQzFiEOQvtZjHIsr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQzFiEOQvtZjHIsr@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PH8PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:510:23c::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV1PR04MB10377:EE_
X-MS-Office365-Filtering-Correlation-Id: 3580a6ec-da83-4882-7a16-08de31e2763a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?lODIL4hMHFHjhQzg9rDNbbywScf4fCQ3ZTPKm9bBqPV2JBb3mxRVVp6vDHVq?=
 =?us-ascii?Q?gRazkWjtPUtfe/D+VXiPWBok8zfxtFggxmwX1AIrq0qnlwvIAE8G4elShklK?=
 =?us-ascii?Q?qroAcWWXE5eA0ti5blb8mRMh0pNAMTwDyDh5wiUpeypfoa8Gb9KFTK0gmbCj?=
 =?us-ascii?Q?+zZ0OgsJPE/PewVjBMb9lpyffbmOnvlAfCVEx4oeNu6x0E9QlYpCqYoHgWcp?=
 =?us-ascii?Q?TdJpLta/NcSuAVyRwDloY8iCMkwf9UNugAz03v8XFN9Jl6vldCatFpyN5Z5O?=
 =?us-ascii?Q?EwSlqQWvyMGRxfbC4rjjs9u8PDC2W2Iys5TRznlN4yOb4wlGt1gLQsgKq/YY?=
 =?us-ascii?Q?1JTX/nZlqOsgRTGm0uJOZvX4Fdszv8CCvW3xGWpmQz0jlluJzJLQ+EYjbSLz?=
 =?us-ascii?Q?W30K5phxbRY2qNuTuqlRUF+T+LHGEJAecRVIjFR1kx14v5q+RvsyA4ZQFzRi?=
 =?us-ascii?Q?jiUINIJAiZvKoOoxB6cgHR+jar/Be2UsM/MYAGy9azyFOF1weBu92JYiD9+K?=
 =?us-ascii?Q?KEBfo0xUPLzBXPOnGfmjn6vXT4cQJhZRo5HBmEeaTh76Oxn5KYZuWzSiNnNq?=
 =?us-ascii?Q?NGEv7YLRWx+ntUdnQOC8guw0NuSxwuag59+N365yLSxCH1rOKyk4MOyRI1B7?=
 =?us-ascii?Q?qIlrsf2IjYehhBJ75Iml9E8hbmErPYtm8yx69CmnYBCV3sJLQxHE5zVfvt1F?=
 =?us-ascii?Q?7dhHY1gEt24aGAKR6/0fVQzsxI2oEBwddzzE0F1MiBDVlfmjgWOC4FuEvzty?=
 =?us-ascii?Q?Nim2mHUFVvm1HnOr5p3PZdfkqueayz+rlUtIIa5LvTDoZjqUMW1NvzBrG9If?=
 =?us-ascii?Q?qTIDRkj/BNr5U0acouTwjtT8yTl1KsgpbbJsjFonag49bycLZ3de0ki3en0R?=
 =?us-ascii?Q?rs0YD7U7RATZr7GroQ/rnCOBw28sOOU2uuX/G63nFBP9UhmL8jhfZodAEN2W?=
 =?us-ascii?Q?wqmK6upy7SX/IHzr5xKSyWHc1o2FcoU+dCDKAxL7KzlxINjsWWO3QM5gH555?=
 =?us-ascii?Q?DQ8ZfXC3o2OpbcIS2z5J4VozpaTO2hT6F5ceZUoyJirKEa6OZA6nTHeig2Ot?=
 =?us-ascii?Q?9h6t1OudWbm6eBb48cc5y7j4fQUE0zQsYkFjGMTCBukeSn51cQSHzacNbJDw?=
 =?us-ascii?Q?7Z4aQ9JwOA0onBHNFOmVjKRe6m+1EuTLrkq0McorW/LcEVSFXmDtJEcDvRlY?=
 =?us-ascii?Q?NSDYuM/+NgBS8mZTJOyz7ppn0yvS7KaYtrbpS8ZzvYlZ6/CbOQUE2e/XHigF?=
 =?us-ascii?Q?B637ZOEGvaIOTEhFldU0ncr6ckoE9W+yMkGGnKON17zO40c7Qys5r/fkF8aG?=
 =?us-ascii?Q?bjXkzvy8ehTYrY89garHFD81YlK+m/e4byfV7alVUWGMzc/Y03BZ9AIwwK4L?=
 =?us-ascii?Q?W1D3fcLYvvqlAIBiRMJ7WbZl3xw1st2UI0Y/mwgD+1crYasLGslTQPB2pEkw?=
 =?us-ascii?Q?EaDSupTTeWnmSLT8OUGg5w6xFq98i12+mvsvDM/3H9XoSYHWNtf84xXQVVPQ?=
 =?us-ascii?Q?oMBHNJyl34fNKFuo4pb2m0yhxvNjQyI0WsT/MBSgSZdJqBHBEX3fyf+mXw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?q/JSDGZV6NxwBGdV9dwjXuYuPV5Zo4Jex8iGkY7Sk7E2NAPoNQOfE3MGI5Ru?=
 =?us-ascii?Q?Mod7awOpAkWZvwn6eQG5d8wJKQ9OziMx4XY90dCbrjkWhNibIsM52VYma6Xs?=
 =?us-ascii?Q?jJD+FCN2OoQni4DnMG/Y83EJD2NQjrCWAgwPVsO+trZqi9ub7obhKob3Ys2O?=
 =?us-ascii?Q?o2xy/qs/NsDlGKWOjPsVfUKggJb1hh6JakTM2iZs7WzzD25IMctc/4vgLats?=
 =?us-ascii?Q?za6S6pLRvUIbPb3gIjJ/eDA4kvfHBJtwbHGPJmgIGsY86pi6iDUr+r/c31WD?=
 =?us-ascii?Q?vnIiI36EEmz5HZQHmZE2uRAOEE6o/EzsNBRzKPmhiblrlfh9kn87svB/KXtv?=
 =?us-ascii?Q?CtANvRRY1h9jmcWDZj31ICUBptZkmxFj7F4XRgxIxjaa781dNZmpUPbbvfTY?=
 =?us-ascii?Q?S5p0GkgzIlbz2MyOhHCzXJC320Tzh1Upl9E+HAVXWvQHWJYECUy4NkJ8TVE4?=
 =?us-ascii?Q?IZFOQkwtNRUYEIr2AU9FsiiS/HUC4Cq21smCN/1lG+9HWuP6Hf7Q4HeOcVzn?=
 =?us-ascii?Q?3FxY0yfGMRI6ZxyfV8eBCFdwvWoQR4bwqHZ8tTMV0XLM3UYttwrhxOaznCXH?=
 =?us-ascii?Q?lIOrjvIsg3S8y4sTLfbIDSrTCAKYe/l1ZKmD5vQx4Kra/BZ7BKAs4D3HoqBR?=
 =?us-ascii?Q?/1etqB3wemgi7jdD1j20O6KP+M+vGw9wdmo1mzMl9ehZQMLSEMHr71ulz3aF?=
 =?us-ascii?Q?hL8fFi2A2uHductrN/uD0fYRpNqXwLVcOEIdSYbPdtpURHRMm9QOlTz/8W3m?=
 =?us-ascii?Q?qkcOeJvFEwb+jTYmkTI6+VWFrIeF+/3Ow7JbBJvTKA89rH48ECoA3aTq+wIa?=
 =?us-ascii?Q?rm5x8jd+TOGDL1h31e8gHufV4sHjOWmW+BYUzqVxcEfLa1/gvcEls+zuBb1x?=
 =?us-ascii?Q?OI/oPcSoFhJMZlQ4u3mq3hRyElseZn3t8/TDw7qcpOfGDBeauoJIPJCuN/ZV?=
 =?us-ascii?Q?vMoVvHYhtEnqkrl1DKcomJcBSSr7ofLN0jGrmR+SMRr8HIHHrSm5ThxDi9dP?=
 =?us-ascii?Q?fZaW8feSyzOnXifXFcH0iiJTSulekGoz2XJv9c8gtBV5RpaLO3YZB5bCzNLU?=
 =?us-ascii?Q?H+KPd+fl2RefxsrNg/zWkVwQ76LWPnuM3Pw2A1RheWiJCaQ8C+q9YQn0HEY3?=
 =?us-ascii?Q?XTixpNimTAjHAKYjeVALVLzlg/SxNwozmv9gSBo+q4l2DZT+bUkTRH6tzR9s?=
 =?us-ascii?Q?dsDzSEPx3rZSQbNfKkHsYLb11MaJV/9BrkYr2KZkMnwiuwITTE3cT1zEzePf?=
 =?us-ascii?Q?g+joGzBHv05TLqBhRQvozwUQhnS1alWxg+pkduiO2qYIlR8nuAJCsyo9UxMw?=
 =?us-ascii?Q?186kiWyzu0GmXFOFFiE9YUtETMk5DkIHvemHuxxn8s9lDudQVpvwSenMpy0r?=
 =?us-ascii?Q?0nQFF9+V7AVN1NQYykj0NkTn+YR6FtneZFG4lAM6SzRSFMI990ZHXp1E888j?=
 =?us-ascii?Q?oUz3fk178O2eQ45F1RFdAGpXpY52UNNhhXCSIEZy8+OtZhYT5NpFqqgZMhYd?=
 =?us-ascii?Q?wnrChAZUymN+nJfbRq0HkJPonYbSkjrta32XxQjBPYb0IhjhxgUAqHSwvbLa?=
 =?us-ascii?Q?kHFJBwhLcUnHV1bgjkQSya82sucYpbku/cyeswYA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3580a6ec-da83-4882-7a16-08de31e2763a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 20:36:25.0606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnwCo77ZWLuEbeUXnyxRc1BjxBc9T0CLkP4CgKbnq6/kcSl3Ep252hctHL7h8e2VCF8aumYH+9cCPIkSvn4C+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10377

On Thu, Nov 06, 2025 at 10:58:00AM -0500, Frank Li wrote:
> On Thu, Nov 06, 2025 at 10:34:48AM +0000, Rui Miguel Silva wrote:
> > On Wed Nov 5, 2025 at 7:31 PM WET, Frank Li wrote:
> >
> > > On Wed, Nov 05, 2025 at 07:19:28PM +0200, Laurent Pinchart wrote:
> > >> Hi Frank,
> > >>
> > >> On Wed, Nov 05, 2025 at 12:03:05PM -0500, Frank Li wrote:
> > >> > On Wed, Sep 03, 2025 at 09:56:29AM -0400, Frank Li wrote:
> > >> > > On Tue, Sep 02, 2025 at 02:39:20PM +0200, Laurent Pinchart wrote:
> > >> > > > On Tue, Sep 02, 2025 at 08:01:40AM -0400, Frank Li wrote:
> > >> > > > > On Tue, Aug 05, 2025 at 04:08:22AM +0300, Laurent Pinchart wrote:
> > >> > > > > > Hi Frank,
> > >> > > > > >
> > >> > > > > > Thank you for the patches.
> > >> > > > > >
> > >> > > > > > I've quite busy these days, and I don't believe I will have time to
> > >> > > > > > review this series before coming back from OSS Europe at the beginning
> > >> > > > > > of September. Let's see if anyone on CC could volunteer.
> > >> > > > >
> > >> > > > > Laurent Pincha
> > >> > > > > 	I hope you have good time at OSS.
> > >> > > > >
> > >> > > > > 	Do you have chance to review this patch?
> > >> > > >
> > >> > > > I'm going through my mail backlog, which is really big at the moment.
> > >> > >
> > >> > > Understand.
> > >> > >
> > >> > > > I'd like someone else to volunteer to review this series. It won't scale
> > >> > > > if I have to review all NXP media patches in my spare time :-/
> > >> > >
> > >> > > Yes, but none volunteer review this in passed months. Expecially key
> > >> > > reviewer. I am reviewing i3c patches. but Not familiar v4l system yet. It
> > >> > > need scalable solution. I can help filter some common and simple problem
> > >> > > from beginning.
> > >> >
> > >> > Laurent Pinchart:
> > >> >
> > >> > 	Do you have chance to check this serise? this one should be related simple.
> > >> > 	This one sent at 7/29. Still not any volunteer to review it.
> > >>
> > >> I'm afraid I won't have time to review this for the time being. My spare
> > >> time is already exhausted by all the other drivers I maintain upstream.
> > >>
> > >> > 	How do we move forward?
> > >>
> > >> I think this is a question for the subsystem maintainers. Hans, Mauro ?
> > >
> > > Mauro Carvalho Chehab and Hans Verkuil:
> > >
> > > 	Laurent provided great help about review and land i.MX related
> > > patches in past, who are quite famillar with i.MX chips. But he is quite
> > > busy. So the whole reviews cycles takes quite long time and offten cross
> > > some merge windows.
> > >
> > > 	In pull requests for 6.19:
> > > https://lore.kernel.org/all/4989c563-47f4-478c-80c4-41f7e98597e4@kernel.org/
> > > only 10 patches, and 4 patches is trivial clean up.
> > >
> > > 	In reviewing patch queue, there are
> > > 	1: media: nxp: imx8-isi: Add ISI support for i.MX95
> > > 	   https://lore.kernel.org/imx/20251105-isi_imx95-v3-0-3987533cca1c@nxp.com/T/#t
> > > 	   This one already review, but I am not sure if it capture 6.19 cycle because
> > > PULL-request already sent.
> > >
> > > 	2: Add MIPI CSI-2 support for i.MX8ULP
> > > 	   https://lore.kernel.org/imx/20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com/
> > >
> > > 	3: media: add imx93 mipi/controller csi support
> > > 	   https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/
> > > 	   This one is quite big, but first 10 patches is simple trivial cleanup patches.
> > > 	   I post at 8/27, but get first feedback around 10/27, I am not
> > > 	   sure if missing somethings.
> > >
> > > 	4: This series, laurent already said no time review it.
> > >
> > > 	5: ap1302 sensor patches
> > >            https://lore.kernel.org/imx/20250811-ap1302-v4-0-80cc41b91662@nxp.com/
> > >            binding already ACK, most maintainer want to pick binding with
> > > 	   driver together, but not an feedback since 8/11.
> > >
> > > 	I jump into and help do some review.
> > >
> > > 	The questions is how to move forward pending patches, like [3], [4],
> > > [5]. How to keep good community channel to avoid long time pending?
> >
> > Sorry, but like Laurent I am really without spare cycles to go over the
> > patch series that have arrived in media (also I do not have any hw anymore).
> > So, Frank or maybe Laurent knows someone that would like to be add also as
> > maintainer of this drivers for me would be great, that would also help to
> > avoid such bottlenecks.
>
> If there are not other candidate, I can help maintain it although I am more
> familar with dt binding, i3c and dmaengine. I can start from simple patches
> and we have test team to help cover testing on the real hardware.

Rui:
	Any update? How to move forward? It was already passed more than 3
month!

Frank

>
> Frank
> >
> > Thanks in advance,
> > Cheers,
> >     Rui
> > >
> > > Best regards
> > > Frank Li

