Return-Path: <linux-media+bounces-33159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C72AC0E94
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43E381BA40FC
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBF028C86F;
	Thu, 22 May 2025 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="sfpQWAh1"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2049.outbound.protection.outlook.com [40.107.105.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6772623A57F;
	Thu, 22 May 2025 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925146; cv=fail; b=q45PBCeyl9dy4CL3RilykrNeLeuI0llaOCW7uKiC4L69PCO7Mj3fI1inHaQwnbVie3YW+RCFf43cvPFxd5U1EvxVY/tNsJs7NshGJxK8imh4U7N/mGWcJHlvV4M+zMKur6+TVTdoAP7Cj8Oypd16Gi1e3tV/RRMRASutCl+vX3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925146; c=relaxed/simple;
	bh=CzrygTruxnH0RB27jF9UFyYbk9h4gyVTCw+H33rM51g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VZIjHW8CSF6cizwCsZzCtGLMwHTT9QKkHv2WI36AYSjQ1aVsxZAqmWipJR2G81befEwGjcvff3ZNG7LJ9Jcqri/A4tjtaUVB5Na1WomoAn8tfPgxe1WI5RzTeImqXHW1U/VKVIwBoD5ltDU7kr75VZQ2IogwyOjRVf3nUCFrz4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=sfpQWAh1; arc=fail smtp.client-ip=40.107.105.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbMoKDVfSa8Yqf8kLwlfGZUzMBrfg4vlXYFUlQUVXopUoGuvWKeIec+RpYt01pzbPAzDQ+6YomUYdzuQ3SATei1pzAcmPNAcQ+OdejlmR56RvT7xMcCwV5fGXHQkgpXNHqSJe4DFgq9V/dDljwHGRcc+nS8HxSF8vm8GsQ99cvzY11T+9s2nHpk9CrG5HWGj0/JWm6QBrsSQlsRHFVxVaih2t4Zw5CtrXCqNOIoz4eqB6NJeOD5foTMdpAXDqOkGLByvoDGw8d3CfwAjYpEJsf3RZ/pst5aYWQ++trcgcJpcJcme/QC8XUD1WsxjJLI3ATnzZ5NxI9TEDGtNywABeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhwAdM3jTqS/ENz4oqKWCo3Pbt45IRROJKb2Hs5Rg8s=;
 b=pN3zEwm2k3AcO7ippkDcu2HMq2VPDMqz4tXVZFJL3kHWc3bqRd6UrtrEp8sLlek6octO1xXHtYtD36EVpXVcwgfb2+AnIXDy1BOZwJmoPtfFhviS9xXYtPo/GE/DtsSyuXAxxpga9hbKv4/C696+yW+4kJaR90ELEFXC1U/NMrWsHM0Td6GsEAiMk2tKkbUHqo9jc2jIJ6cxTvDDiGJQ/7AMXQLts4VACcbEtS3/LV2aRJRoO5M0LBVvqZm6F/Xf6A7jTbazX2TlTJbWSYeRgTBokAn1P3Or2f7Llqh7xyDVkW96653dYx65u2lCRIQdTG3us/alkpd+ORXoWrOGiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhwAdM3jTqS/ENz4oqKWCo3Pbt45IRROJKb2Hs5Rg8s=;
 b=sfpQWAh1kAHzRWiVUAXjkKfCstRt8JILmXHiK6F5GiJEIO79kCxfE5c+L4zACtTtd7W4pjFQduv4Yqhml2UUQYPAQj8Ao+nD4thIwN/Nq//RY4htRH9J4WI8tN47Y9jwa8akbVhFgXhmlegZ8uwTJd1MNDMpetv2VMmZsS+7nqGk4TfJMH1XLt4GEWVbhW3hfI2noCTfkmR5jWugBG2RNH2SEu+rQ23tMB9YcnWGoNSE9qNmKvKQixnYUqapGGGo5PLSeNnJOsn6Ke2Yh7ZRi11QPJw019I9tTpj+Y+pH/FA8Y/ur6ryzjZbZJErW4enDvBa3eMIQmscc7+JYI+gGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS8PR03MB8571.eurprd03.prod.outlook.com (2603:10a6:20b:548::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:45:41 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:45:41 +0000
Date: Thu, 22 May 2025 16:45:25 +0200
From: Mathis Foerst <mathis.foerst@mt.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v5 1/7] media: dt-bindings: mt9m114: Add slew-rate
 DT-binding
Message-ID: <aC84hQjiSQUNOuC/@mt.com>
References: <20250522140613.104963-1-mathis.foerst@mt.com>
 <20250522140613.104963-2-mathis.foerst@mt.com>
 <b8058efa-ce38-4615-9e43-43d1fd114b39@kernel.org>
 <8716115d-60fa-4057-82af-c4ab2efc3952@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8716115d-60fa-4057-82af-c4ab2efc3952@kernel.org>
X-ClientProxiedBy: ZR0P278CA0005.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::15) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS8PR03MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c186cc-45a0-4d65-d586-08dd993f5314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kQliRYgoZTIsAGsowPWPxPH6Jaj/DF37/LR6OwknI8wanOamOMNzB6Rz88zr?=
 =?us-ascii?Q?FV/dFrKLwUS0y7Nw4EKFPsI0Qr8acPFn5VCwPYtQ/DGiYIEmFPPy5FDtOggz?=
 =?us-ascii?Q?2VoEYN5XCU8XuIlrIzbWosrzWGn8acEuBqpiW+RVSKr5rcxyai1GILhebmY/?=
 =?us-ascii?Q?eED4jxfFyiPpwaAXF9AXOzOv1WEq55kuYfw69s4d2P2sbTNzNkE+YGlys+Ns?=
 =?us-ascii?Q?rY5Uta+sM8rLaIuXr8tksMA0kYSTqLBbvgfIYJVXm4mlDtmYcjIfMYBq+j44?=
 =?us-ascii?Q?P4b3eAsI0cym0nkxhTBSz25KIj/2rJvYIjAg7tEoPmu+1zLmyVR5Vh5V6hrI?=
 =?us-ascii?Q?y2tcCbyE6sKyJwDc+j93pA2EyR5AZjyeczCLA6EHVSOasYrZEPszypapS+08?=
 =?us-ascii?Q?pCwVV2B2RdAON/Gs+2+vIk9aaaRqGMnudfkjmJpvvr3ok5xegSgyPj7MDyqB?=
 =?us-ascii?Q?9dDFHppLLlbkpANk+iVtu52Xa7zE0EKBAfO2o7O4r8SCOtjzsTW1IjgnOLo0?=
 =?us-ascii?Q?BVUdw+D9AdE8+1iMwcGwHIVioIPbyLErDcQMa3ANVudHrgZ5cs9p8FbjaxSt?=
 =?us-ascii?Q?P9ZZCNM5mny+QOSkbvYTyb+juQB6pjhC1XZZRcJdq9tEPFgO6LSBwnTS0rvP?=
 =?us-ascii?Q?xnxDVp9tIE6qluyJCRVd09SwAeYFESzDKACBfQUS6jRNIVXXvF968Cmwc94Y?=
 =?us-ascii?Q?78IymjXmrfytUCXLWm2N4JwjkgMfcKOOdYhB/3wc81ccRjgl3cm/X7Ovaua4?=
 =?us-ascii?Q?MtXCjFHoszUD1yys2RVSBAcvy8Gg0vaUlMG0t1FxCbCOMNmgY9e5qsnW51qC?=
 =?us-ascii?Q?LFm856nhMeI+DYw6o3zDG+YLJFmiLwMIPrdO3ZTNsdDJI/UM8uKyp3VpYo27?=
 =?us-ascii?Q?u41Uuvj6VVrbxwpJSir8tD8zIeEiaTx4XajgXJqCDnGF9H+VbMZNP19IIkwm?=
 =?us-ascii?Q?Ga65/VmBl63n+3YWX5EBn0rfzwKf/1q8A1uUDf6aAN8QuFdpb6WLewuzD5NJ?=
 =?us-ascii?Q?9kLGvf0dmYtM4zKHOeZZk9ErD4E1YaxeU6nYEUNML5BMl3LydWn8S7YeuvbT?=
 =?us-ascii?Q?/DZL06FakOVqX3aaWjKo6u8TXLd256fBnXL/HnMzFLPFKaUp5nfHiuAemfO1?=
 =?us-ascii?Q?RXlPHwhK1CMnIPNmesrkW448XP+fPKX7bNqJ6af3PpLeteZ7NQ5uyXRjMyNo?=
 =?us-ascii?Q?DQyjZkYGQjGv5xSFSkUMWf/UnXyfPGWlhOfLtDyrmvbmvA5t2uxcO8+82pYd?=
 =?us-ascii?Q?kfQjMaQIwLGqisTaQ6beJW4+d743LWcBxIlZ4BmqbPkLk+1ORobErf2h2Qva?=
 =?us-ascii?Q?l0V3JvQ/63zoLdRY9unpq7XMb3w6TijQr7sjVxfrc4Y0MwltbWS170r7UvDV?=
 =?us-ascii?Q?38PMUo0MSZLIpjHEagiS6YOnlkQLa4aJwZjZ1N0A2T6yIWpca19TBEDiF73l?=
 =?us-ascii?Q?xvbtN129HKuve/kGUPHBjsY3FZXtFLg9jIIAwQ6ar6EKdgQYzWUw1w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RadvLlbcuiXvoOi3Ykxcin7LXd7+/0d/xFgAHUWNL5L0jh6ZI6RQdRf3CfCv?=
 =?us-ascii?Q?ylwjnI+x+23hiYD4gix8QYMdmj3jhv/9AMjl5J1FMS9LMHj//bdaBZ6v5+0a?=
 =?us-ascii?Q?uVTr0P5GnUOVuooslb+3z5Ir+LgUwPek9hyCIX1bqcucKVTa2e3S2qZ+MM9m?=
 =?us-ascii?Q?b+5qP+doEUDlFBEPGCR/1rey3Wd2Oia0VcNs5JBBfFFQfnA3m4O0OZJAAK8/?=
 =?us-ascii?Q?zBRUN67hc9GUmfvJPmSQAQ7U0tC7UUwzSo793B172FjZabZKarHbokQsFZVE?=
 =?us-ascii?Q?HPJK+wLWMP+XGCviis4fLEGZjR0ty2dMoqd/v8zc65XbX7+ecGxYp2e+k3se?=
 =?us-ascii?Q?08duJa02JjxEzLaW62dEovH+5lfQdGfYgX6nVBkEiLdQQlAZPRO2Vn0ttOGc?=
 =?us-ascii?Q?DY/+I3ZgXfWiPSAt3C8wAEKDfPeJtGACazIsRZXlNNKHDeIVB525/Lqb09oa?=
 =?us-ascii?Q?mT0G2vovfjdr6gxTOxFhfNGgljlUZVwJrI05Rj6VM7hnXxDDliUDbtRbLR7R?=
 =?us-ascii?Q?2XX0i4dPPFwOcYJ4ZcO6HyeMRHbBbIC0XZdi+FtCL93wxj85VQFRBtFqUlhS?=
 =?us-ascii?Q?IXWAQNB8tspziCcHo3nTwAcuY9ApSgVjahD9/u9kSEgjMXq6QTig7uUuZV9T?=
 =?us-ascii?Q?C9KQvWbWD0BT1hhfPnDL4vndOb6fpht51h48FRn5hy0X9a0I26hy1snsw+3o?=
 =?us-ascii?Q?iBzm3A2iY4NpCxCmHzUFRJ6ihqYPmeOCEZFsHwqaP8sCT2D7SKr7bGKTzGsx?=
 =?us-ascii?Q?/VD0OKDRAU9Vyacie5ALO9iUQSNxUqAVPs50HosvnCoR3/g2GXHhMAY2Ldv7?=
 =?us-ascii?Q?/kfXJXJQyzJ1ISypsw7JloEqBiECQnfUkYVFaNxzuPrcxHzyalX1KwN43Vz5?=
 =?us-ascii?Q?RG/mnrkWzcyGrjJLFzm3wBU9FfJw175d0oUWrAFFnDRcbjKCEJwOS1aM/YzF?=
 =?us-ascii?Q?5Xu0qo8S4Vb1QoIUZxftFJH9JLGS9qJ6BVAn7c4Y8V0SXe2XvGehFnw2wN6F?=
 =?us-ascii?Q?AJO5ga57pqzkap0dAo22dHNqdX+Uw7S7qtttg5rNF7j8X8I2gn5QLbO2YjGs?=
 =?us-ascii?Q?MXTOpj6kkoVMq1IUPWB65WVu25BFeiMS2L25hZr91SiltSqF1OSSUSb+CFMT?=
 =?us-ascii?Q?rdHTWM9cCFjfsNdmTnwdS5msHP0HehzWCp76/BxbgdVSTPQ2aQvA7rSEydtB?=
 =?us-ascii?Q?M14JR2fcVcN4E4EbPRUu7RxXmCfGFhX75jOWGr3ldE/qoCkBaxGxnheFqO18?=
 =?us-ascii?Q?fhwLhjAXGCjC/j5is4VvP3CZJfNKxHArEhyye2gNQl/NUImWnMUPVN/llU7B?=
 =?us-ascii?Q?+Vhc90e92oghi93v9+Yiq0OlYxGa9Lzdql6jXPH16jNO1pCL3AiZEt/0oUda?=
 =?us-ascii?Q?0xv7Zuv7G0PoPUY26fIUlYmeJM8TB2BX6+iTml3bNGp/yRw/D+eUYd13aPaC?=
 =?us-ascii?Q?dqdMPryPfHNcOBoT5Gk13vO0ar7SdLmkcdmnoAIwAgTFiilXvVv6ONBu2XKh?=
 =?us-ascii?Q?4mDifk4/LftPWK5FRSmT0y7Q/3+BULELzREjGIr3p1KXO6o+A0UDopSHIUBO?=
 =?us-ascii?Q?+iNYBjMelO75osbAtGivCH+sdg3a1AGpcWaDcDy5?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c186cc-45a0-4d65-d586-08dd993f5314
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:45:41.3930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fvGKk8Vu6iO/TSTACRJoU92oTwHTcSO571ArOmubmvIg1+giPlVMij04lfaXYxcX1Y9B4EUq420vwo3nJNzUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8571

Hi Krzysztof,

On Thu, May 22, 2025 at 04:11:52PM +0200, Krzysztof Kozlowski wrote:
> On 22/05/2025 16:08, Krzysztof Kozlowski wrote:
> > On 22/05/2025 16:06, Mathis Foerst wrote:
> >> The MT9M114 supports the different slew rates (0 to 7) on the output pads.
> >> At the moment, this is hardcoded to 7 (the fastest rate).
> >> The user might want to change this values due to EMC requirements.
> >>
> >> Add the 'slew-rate' property to the MT9M114 DT-bindings for selecting
> >> the desired slew rate.
> >>
> >> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> >> ---
> > 
> > <form letter>
> > This is a friendly reminder during the review process.
> > 
> > It looks like you received a tag and forgot to add it.
> > 
> Crap, you actually received review almost three months ago at v2! Then
> on v3 Rob did job second time and me on v4 did third time.
> 
> How many times this has to be reviewed?

I'm very sorry to not include the "Reviewed-By"-tags in the updated versions
of my patch series. There is no more review required, I'm just not familiar 
with the process. 
Thank you for pointing to the relevant documentation.
I added the tags in the latest version.

Sorry again for wasting your time and thank you for your patience.

> 
> Best regards,
> Krzysztof

Best regards,
Mathis

