Return-Path: <linux-media+bounces-52043-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPILIRTJgGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52043-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:56:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B18CE7E1
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D27D300DF41
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 15:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFE926CE33;
	Mon,  2 Feb 2026 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cFoBABlq"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09BA1EF091;
	Mon,  2 Feb 2026 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047759; cv=fail; b=aod5gASa3lbRQFGpKUTDVcKDNesZDJGGhv1U3k7Frwxwpi4XA24U40Ro4NangY6bTGvcxaVdc/xQQu54o6qRtN7dTXSPEdoITxIHhg5JFzcnVjVygLnhm7StqIK8e7Wyz6v5f5608gOrMKov9LETQUsVzQPr5W5T/UfreRCCprg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047759; c=relaxed/simple;
	bh=C90RXZ0cVBx1oYezUBdy+3P+N9zY8pPB+y94grlmQ14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=frkwq5dm+P7mQ/XXViGkdtyhD5WUdArTRtxn0hxLeGXJLRBvFtVgngCaE04JBtmJr9vKmZFwsUuKPsstTdMSA0G/qqD4rAcRRwMsCXQgFrf+0AJWty0tNsFGsmJc1Cd7ba5tjU/ugAUbT8wIp0CcwimXqcIqR776HPwZGFF5KGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cFoBABlq; arc=fail smtp.client-ip=40.107.130.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdeDKZuDrLXeL9JvNuxmn1F2JZAyi96il4VyoVk5E1A6D6wcdeCwjIKlX6wNL0Xr0OpfJAf4AeMcLfXVLbalewAXrjykePWIY5I6ued5bYtiD6fLOayLkRkV1N8NrwngOf7OKqVCSH94IIAeeEXhIDgMcXFl0PZWLzcl3vDVg4W2U4maoID4ddiTAIpBoSreLirMp3tbPrg60Ra7ijwP9a+IMkZ13v92Qdan1r473sqpVpp35fpr2tOn+47LvCX4m8axtxfe0tI/0gbOxljb5oRj0rrlhq1gT7XzjOGYe8w2+MwWPB0GKx6PkKPihMmR3IcVQrs2PJxRy/X8y82pFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdBE48o/ZSbgzboT5zn2KtP8XKJcrPXc2jmspz+5+yo=;
 b=qM6cH3Ofav1/iraIlwG7AQ3N/ZFki8HLlsj0wZ54vq0BBUW1jAB1K9L5fCzpPbSRJ0bPM7GwtI5hN25x0YwT//FZOXlXR0nb/yIGy+V8LxOOD67vLYcNrBTcrAeG0TtRh0KymI2Bi/VeBewnO2SrQIsxBy1SA0KgBEhWtQoxqFnxURq6JdGRi5EMglrw6LJvy2nvOoJzuiDgcOcK47jYWCUwIq32qfqVDhPSUzCHUgMPJ4LWmUVSdFd0ZV5QgDcA+e54pXXs0mIBh7WtD3FBJ6yiF8r5q9Puwqyr3Wb5dmakngboYc1syHjqcpssQ036KGLex8cEVb0CqLfVxlcXoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdBE48o/ZSbgzboT5zn2KtP8XKJcrPXc2jmspz+5+yo=;
 b=cFoBABlqaUlXY80kbMormT6gfsevXPHRjX8rXYY4Id0z7TRBL66tD0jSwUJDW+yvXbYu6qm7Wz8wyXnisWSf/xWpUpdr8nwAa9SKznkpcHUFShDwA5MXU0Hky9j7YrFYMHhq2ZHh+CrQ4oqCRrjkKnzosvN2L2wz+97czl5cF/SZQAIzZOLfOD3vsIVDhU4HI48jDZsbrd3RMSksE7C+E3auksZR3Fu5OOPvMxHOTR7Qgt6y4/CK2Th5eGKmgBeHV/per9vG6/qbTNkLEshV/zYeBzBGJaCIoBlSwuAMx+jWu/5Y8B9LI8Cy4YOkl1COIkYd31LaTxRLASc6dVGYUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10318.eurprd04.prod.outlook.com (2603:10a6:800:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:55:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:55:54 +0000
Date: Mon, 2 Feb 2026 10:55:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] media: mxc-jpeg: Add support for encoder v1
 descriptor configuration
Message-ID: <aYDJAeJZ4f7u+yks@lizhi-Precision-Tower-5810>
References: <20260202095843.1030-1-ming.qian@oss.nxp.com>
 <20260202095843.1030-4-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202095843.1030-4-ming.qian@oss.nxp.com>
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10318:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acb9052-f879-41f1-2f7d-08de62738bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B3PhrIrjBhBE2n4F0nQoSb3s4q+fRU5I+jfrOWM2fTy6CrSQOzoUugH7kVvD?=
 =?us-ascii?Q?JaOeAjSxEiV41q5Xsa/0A4IttI223igWQaAkRt83CfyiXzon/1T5khdXnM7y?=
 =?us-ascii?Q?Y+Ewfa42rUavzcEqMHM/IbjFzqi9Z0V9mddFULEW5i1/+hWoDmGrSErkv4xC?=
 =?us-ascii?Q?oFMMI59liA27VakQnUWN0PgQQBVLXGPbI935eWBmVvduTBuG5Hou2+PgqN64?=
 =?us-ascii?Q?e0KpGKJXVEqchE+JhTn8IKBYps5jFNxkP5HSXHSyWEF7z5MoZyCmZ/UIiOg6?=
 =?us-ascii?Q?CGTKtuRMQkmLmcbLSQcTY301DqyMeM4RtvfPWvctMBMfQ9UI4o7QBHrbmnSb?=
 =?us-ascii?Q?v5qMstIBHDSkS3dcxDl+cUe2503wJ25sgB8Cg1k9LVSHsmyDrW9dH/mdZ3Tb?=
 =?us-ascii?Q?wfXWdYTRQ2r8vMCfmk+jhiETRqUMNHaGUmnLuzS3tcd76Y7MZz1AZw3qSTxr?=
 =?us-ascii?Q?pdzfbikaoC3OVbjh2RZpV5pAm4j6nDyYxJfOlv71ObbTXDXD65YjTnYVhAbk?=
 =?us-ascii?Q?78P9J+GmR+/6yIlV4LQiVMxcEFzz77BxWOCY/a+1tx2A1k/VJXFYh4lkeQ+O?=
 =?us-ascii?Q?UpwriCTYP664OxXdtbgiiS9SeraPe7bRBkEkiSezTN4BSLlz3Zv3De+KjYoj?=
 =?us-ascii?Q?sGUDPQAuAvFV7DCSPFdxWHvg8MyruXIOX+hG1rcdtOl+QMBgx7XAXCUFuvbY?=
 =?us-ascii?Q?iffBQBc1dZHGBM1JOen/IQUi75kKJVitWqxPDCAQQowtVw5/R0XjMYFM53ND?=
 =?us-ascii?Q?nUILfyjfXGhiZUDoK6FKxS43Wlm7adOSTD/12OQQZpyq4q4EFPxWFRVD8IiO?=
 =?us-ascii?Q?JQxzrX8r/+/1THqgopQWNygOQvmGu6dRkfMBKdlchgthdjVEi622WQpDklhf?=
 =?us-ascii?Q?u+jBbiIDOA0MKiG8qF/RyFfN9JKGZX4gEKu8RLxmUxlGJu+Dedy0yesaPvwe?=
 =?us-ascii?Q?H4iqOITjXRNiD5cc8b5wXzsPlXudbChVEqAZp3NZa4J6fm+0BHxYaQi/VrnJ?=
 =?us-ascii?Q?rmks/0f/yPfpRTQvPoFM8diTIcqZaEftTSgg1ssakZ6KZrTTIKsi5pU340Xy?=
 =?us-ascii?Q?1AsG6j+8i607w6PobFzkUVn1L8c+NISJfR0q7PnkiJZdUOMZScKY72LJeagl?=
 =?us-ascii?Q?gTK9EefU3hjsXbBC5Zimn2lgC4jXRv5CezDgqaQvue9/5J80VzTjkP9zBmCA?=
 =?us-ascii?Q?rYD8dz6DkuRwnGQy4OVVM0SkDI/BvhiWt6OPuiN/6dth38qk9swBa7TMCJX5?=
 =?us-ascii?Q?1NR1v4163DZJcZb575A/yCbNbc+ndywzrTZwV913k6RFQjnSCDx4d9NYEMzd?=
 =?us-ascii?Q?eZ3jhEfI75ywATkglbMUdSljcrVD/aG226iWjiMdgXkEimvt3KECYHbhGVF7?=
 =?us-ascii?Q?qbNv/d1wGx+OxXygoBu0WPrbzUajtKE9d+5bultaFYVR94Vvt8tfTNv7+wFq?=
 =?us-ascii?Q?+ZANgB70oc4tQ7wN9/GgxYKBKpti7dE6tyO7iV5uOWhBJ1gAZJR6v0+k31ml?=
 =?us-ascii?Q?9bXGT/CIFnpEBdESyW3DpQrWPIvb8hevEzGhDWgSXTncWkq4Mu9yLvORA59o?=
 =?us-ascii?Q?P5GSCyuKc7HFgAQ0R7n0h72zyMUJPfPGZNS3ITl9SxRsr3NEQO7zMIImZBzS?=
 =?us-ascii?Q?2iKJ4Mrfg2HeHP+U+Cax3a8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gJQyJ5Nhous2EHbfkhfVJVx/rm4SMcyHtAktgw9KjqouWUENwgmAT/Lcy2y1?=
 =?us-ascii?Q?SLHETv7IJDwm2zEPjAAp9LWnn2l5cT9ZgpSFbUFgm6PcbuN4uWzWdrhvU4mW?=
 =?us-ascii?Q?X/nUiz6wg6WLuYFBNwRO06ja9D6oz0rSO7yOtLzo1jQPECkVVqUaFerewdkn?=
 =?us-ascii?Q?/fU1WtA2hqhiwUAN1jU0Tiv91qJ8RLg94tD3VsG/uCAJKWzq74YoG2vpiOJu?=
 =?us-ascii?Q?Ilfm7sq9e6NYO//wz9NX0ZgWrS6nGJTyVjgau1W3cnNYkWmjQfK/2SWC14NP?=
 =?us-ascii?Q?BPn2oJe86Gd9AryWOVOnxIwJYJLlgtgk4sysp+XQ83/3YGBkvi7u3hr0vA1S?=
 =?us-ascii?Q?B3PaEQ7EpMEmkOw28V134MKH6I43nwE64IhE4+eb9hvPjOHjgCFa5dJWUacP?=
 =?us-ascii?Q?6cmtHbtNl6M3MtYB0RzmL7y0pT4FJNsIoGGf6TRQSD0JAh0wsfCcVfALOqYn?=
 =?us-ascii?Q?o8PtrU4e/V/l8D6sEEhpwPuSINVslF6yPWNAwt+QeJ7NsEatANAF0nJEBMzX?=
 =?us-ascii?Q?0KcImOKLYFM16LA+1CeBHA4E0cg6n1Pojc5QHpF//LV7x4hbfSwHW8zIj/tH?=
 =?us-ascii?Q?Wgmnz8tN490GRvw1naoArf/mZZZ1o0XxloC/w8Iy09MAog3dkLqRgMMCX2k4?=
 =?us-ascii?Q?IqF9v5Dunh/sEGzJuqU8bbOu67q7jWNDN8A4r0evqQZGNYkkddezhnl9NYlf?=
 =?us-ascii?Q?FzUQo5gYbwPZ06P/IqpEmov1jmwlRxL6ZW+soE7n5iQ+QssRTmF6snXdridM?=
 =?us-ascii?Q?iRxNq8eUuJ3H873QHz3KlwsNerNp8Ief7YDzcNwCV2f8LJZ5ByusACjnBAIB?=
 =?us-ascii?Q?2CVe5voV2fPaYvA7GX2Uuzp3gOFWyn27S89w/Rzc+jTBSpHPp5TE01ZYr9Fw?=
 =?us-ascii?Q?UZAm8GlNRSd4XXW2tmorR8U1ZPJFy3GL/NO9J6bya1N65jBhGTjnPW6SKT2w?=
 =?us-ascii?Q?58EcfP1+yqsYozrqpivH9lo9gk6Ml9xLM/ByAIz/zp1NA4zKJ1KzwD7sywNx?=
 =?us-ascii?Q?EJQZmbXheF8TP9WtIGJioPNOcsJAognfv6Ws5FFr6X1VxoNve1K8I5Px3Fac?=
 =?us-ascii?Q?6GiOZ/2IAbi33fQDzNxSdcbMve1gZDH5TndeIGFa/mUvCnv6yk9z5hJveCQr?=
 =?us-ascii?Q?8j6C+W6vBxeriG6vRZb9X8KuUTcHvhBsap/LwTRXQ6jJ2M8nad97YpJ/4onv?=
 =?us-ascii?Q?UJbfE/WzXr1pxn/kAH+xNES7kHN+GbIWYCo0pGVuMuM6haaPmlISn3YDDfV2?=
 =?us-ascii?Q?8RcKSgJ2jWaFMve75ruwb9BUVvuhsEULPJes4s7eJU4nT3vdRsX3m6Ng1Scx?=
 =?us-ascii?Q?2yIrmWidioNUwVCzDucR7jYkjm6juzUb5sNccvFQEfx7ovp3lVZt4g4ORJ7w?=
 =?us-ascii?Q?OuFquoQSc79ZaBNxJvwbhtz9NYcs3yINw0EuYVKG2Kl0K4cQgphF9Ihf1fUL?=
 =?us-ascii?Q?RHfmykAUiuzAmEwLHUFX+Y67eT5/1ghKv9aLKMBfAwFgjqBEZB5MwvoH/LX5?=
 =?us-ascii?Q?zWGkwaB3U6jnd76plf1j+RAukxqpWKgqQWzv44icElpUTDSyZ00N24P6NNWN?=
 =?us-ascii?Q?TshujqolTEzaZj0BqfuHUEj2PKYvNNjIQJuoeMXng9hjhW92MYlFadb30bDH?=
 =?us-ascii?Q?V365L1rkYQbRkBtWIsf7PgQBOniMG+8KqH9V4+rmLwE4Mhe3/5QVqU/cge7Y?=
 =?us-ascii?Q?yaN3dGvivPmObp/jMrOcELPc4rhiHpbe4v3jnGrGMIUD5MA6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acb9052-f879-41f1-2f7d-08de62738bc9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:55:54.0895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgnwnELFxsHmnB9LcO4f1OdN8hCMALGoDyFI3ykaid6tRwr7I3/XEWGqxxSY8WPgLzuo6SqFL8uMvGhPOclG5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10318
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-52043-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 37B18CE7E1
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:58:36PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Support the upgraded JPEG encoder v1 found on i.MX952 SoC.
>
> Detect the encoder hardware version via the version register.
>
> The v1 encoder uses an expanded descriptor format that allows all
> encoding parameters, including JPEG quality, to be configured directly
> in the descriptor.
>
> This removes the manual register-based configuration step required by v0
> and reduces the interrupt count from two to one per frame.
>
> V0 encoding flow:
>   1. Write quality to registers -> trigger config interrupt
>   2. Start encoding -> trigger completion interrupt
>
> V1 encoding flow:
>   1. Configure descriptor with all parameters including quality
>   2. Start encoding -> trigger completion interrupt
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 45 ++++++++++++++++++-
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    | 11 +++++
>  3 files changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> index adb93e977be9..0d78443cb270 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> @@ -73,6 +73,7 @@
>  #define GLB_CTRL_DEC_GO					(0x1 << 2)
>  #define GLB_CTRL_L_ENDIAN(le)				((le) << 3)
>  #define GLB_CTRL_SLOT_EN(slot)				(0x1 << ((slot) + 4))
> +#define GLB_CTRL_CUR_VERSION(r)				FIELD_GET(GENMASK_U32(19, 16), r)
>
>  /* COM_STAUS fields */
>  #define COM_STATUS_DEC_ONGOING(r)		(((r) & (1 << 31)) >> 31)
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index ede422364f9b..71f4a1d292ac 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1417,11 +1417,32 @@ static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
>  	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
>  }
>
> +static void mxc_jpeg_enc_configure_desc(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	struct mxc_jpeg_desc *desc = jpeg->slot_data.desc;
> +	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data.cfg_desc;
> +
> +	ctx->enc_state = MXC_JPEG_ENCODING;
> +	cfg_desc->mode = (ctx->extseq) ? 0xb0 : 0xa0;
> +	cfg_desc->cfg_mode = 0x3ff;
> +
> +	desc->mode = (ctx->extseq) ? 0x150 : 0x140;
> +	desc->cfg_mode = 0x3ff;
> +	desc->quality = ctx->jpeg_quality;
> +	desc->lumth = 0xffff;
> +	desc->chrth = 0xffff;
> +}
> +
>  static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
>  	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
>  	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
>  };
>
> +static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v1 = {
> +	.setup_desc = mxc_jpeg_enc_configure_desc
> +};
> +
>  static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
>  {
>  	int i;
> @@ -2874,6 +2895,14 @@ static int mxc_jpeg_attach_pm_domains(struct mxc_jpeg_dev *jpeg)
>  	return ret;
>  }
>
> +static int mxc_jpeg_get_version(void __iomem *reg)
> +{
> +	u32 regval;
> +
> +	regval = readl(reg + GLB_CTRL);
> +	return GLB_CTRL_CUR_VERSION(regval);
> +}
> +
>  static int mxc_jpeg_probe(struct platform_device *pdev)
>  {
>  	struct mxc_jpeg_dev *jpeg;
> @@ -3008,11 +3037,23 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, jpeg);
>  	pm_runtime_enable(dev);

Not related this patch. If have time, you change pm_runtime_enable() to
devm_pm_runtime_enable().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> -	if (mode == MXC_JPEG_ENCODE)
> -		jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
> +	if (mode == MXC_JPEG_ENCODE) {
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret < 0)
> +			goto err_check_version;
> +
> +		if (mxc_jpeg_get_version(jpeg->base_reg) == 0)
> +			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
> +		else
> +			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v1;
> +
> +		pm_runtime_put_sync(dev);
> +	}
>
>  	return 0;
>
> +err_check_version:
> +	pm_runtime_disable(&pdev->dev);
>  err_vdev_register:
>  	video_device_release(jpeg->dec_vdev);
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> index cdfefb68346a..c00c13549746 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> @@ -81,6 +81,17 @@ struct mxc_jpeg_desc {
>  	u32 stm_bufsize;
>  	u32 imgsize;
>  	u32 stm_ctrl;
> +	/* below parameters are valid for v1 */
> +	u32 mode;
> +	u32 cfg_mode;
> +	u32 quality;
> +	u32 rc_regs_sel;
> +	u32 lumth;
> +	u32 chrth;
> +	u32 nomfrsize_lo;
> +	u32 nomfrsize_hi;
> +	u32 ofbsize_lo;
> +	u32 ofbsize_hi;
>  } __packed;
>
>  struct mxc_jpeg_q_data {
> --
> 2.52.0
>

