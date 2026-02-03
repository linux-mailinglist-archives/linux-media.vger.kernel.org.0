Return-Path: <linux-media+bounces-52118-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJeaA3YpgmnFPwMAu9opvQ
	(envelope-from <linux-media+bounces-52118-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 17:59:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2680FDC68D
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 17:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DE8F3024E9F
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 16:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB9D3B8D5F;
	Tue,  3 Feb 2026 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S9KSlzU6"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4E131AF24;
	Tue,  3 Feb 2026 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137777; cv=fail; b=TRt8djR90N2v4wZefLgfS5rxi4Tl+rijJd9EfZeFjVNd96G0g2qNSi/k/wXtJQ9gQY3wfGj7kI0/iFc62WpmtGU4f64vg0ba7K9S+ds7RF3YgwUFaaPBp9iTMNNFrh+ZJW2ZvXJLrF1kyOffbVx8/rxtnAYqQlujhU0DOSFfjXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137777; c=relaxed/simple;
	bh=QI5p28cDGtqwxsWxKcy7O61b5OfJAawFZ6SXtdWVaJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NRBGD8GqSnNQayKKnsTzyQCAbQB57OMft/rrQ18z05qzfHL1ksRivH7LTt8w4HzqdjSDhFXztfyfwK/mhgejwAxHCmHA2EqoJ9xAjvUsBIsrVEChS3+xBbrdF3ndYFSo4cYis95TeLxsOGUwmedHue89Dzsqy3P9HR+6QA+Mu74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S9KSlzU6; arc=fail smtp.client-ip=52.101.65.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mr6pFasRSx6QEp45pRyXreFkucqYhul4MBWzB7wr/5j727iBEkwy4nVOEAzXwDXlbZaZtdbHqxwzTDqE3ZgmBd2Dh6eka4K516i19hJCJqlCQnjinJfST810waLIC8PIAUWj7cx5UuThJBw7oc+awOE1hNuV124Wf+W7agDSD4pcXVAIGkSUXZOitJqTvjOIDC4o9wKUwgIUoJTFF35T9vHna062mvVSlV4QHD0/rVczAJHiF6iF66oWgMxuIk0avvS7742fOIfzmy2mOHFs6bLhnNMwb0agQVyOe0POkBc2keAna3nmBtVs3ZcPHUPz4/rUutKsx0XWjIBCYCrqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GnSRtXZnO7ku2NkJVrEqQUCB5SmdMxQ838QBdQ6pRk=;
 b=Rhq5sDsq7OCdWMGLDdonZAAM705meDhEIpbij950ALezwAO4MMRRYds1fmyKZkoc9nxkUrutWinKxvym+CRmlkXrGOeRLzWbwfGe4PGoR81hdVn6aKaBUowN40MM70PtFY9mLW1Fj0wZofIajHoObaFd6E7YJMT8NSa0s4vP5i3QiJdnppc/E/2mRJS/4I/pJv2w0zl7G35XVwmtK2yyz8ObOcQEMzR5rD4gacQjCa7paJlIBqUzDn+ZraeTm5UXEgmv0CQy8q0dXxDxQZOkf59HEhGmoyBGHtx833KByxHNA5skM9rh0ndJw15YHUOvjShoW2kVxM2zz96rzzbYgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GnSRtXZnO7ku2NkJVrEqQUCB5SmdMxQ838QBdQ6pRk=;
 b=S9KSlzU6dn6n/hwWQBWkPNIcdUJ0QXS3dPoTYJYQ7+67K9GkOZcV7su/9WINrpEmMZVjvwHEmGEOH8137vZRQ52STb75TbN5pwn5zN55h6xTtcpIimzufdI7wi0FlZChbohGt8IqvLlz3JR1Afgh0ww4a7uYGoyMBeBNMI8YNhRE09CzUk7FAeZiX1SZ70fyipVqSGbYSMKFlKn7cJ9hRps+7AT7h8YaBtm/UPkOWlYWHNCVADQ6WkrQ9urWPtSuc7GYEB42kgfYet8OqnoHDhb2iA2QaMlH4owIDKu2HqnxS4wE0fZ0kY+wa1b9TSRB/JX0ykJ2bmRER3nb8P5oKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AM8PR04MB8019.eurprd04.prod.outlook.com (2603:10a6:20b:24b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 16:56:12 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:56:12 +0000
Date: Tue, 3 Feb 2026 11:56:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/4] media: imx-jpeg: Use devm_pm_runtime_enable()
 helper
Message-ID: <aYIopWM4U9YQB2SF@lizhi-Precision-Tower-5810>
References: <20260203082349.1082-1-ming.qian@oss.nxp.com>
 <20260203082349.1082-3-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203082349.1082-3-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH8PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:510:23c::22) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AM8PR04MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c9f4b1-d269-4aa1-455e-08de634522eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lQj9fIbCNKCfpMbBGhiU/17G3ArgyD25lu5xqHmRjX0/Wx5i3Z6CmwU3BVXB?=
 =?us-ascii?Q?kK0zYI0dTNINTOUcub54XI/qPgPNzff3Zxk0jiW7B4mg0qg4+uph7M7I+XMN?=
 =?us-ascii?Q?rtYICpIP1TugvW9iXjBUkKrzsk7Ak0Xto056K2VqRBzp4BnmSaAwTHg6QDXl?=
 =?us-ascii?Q?33BA/8KFDBehl10TUhD95Z2cHbagSn+vH5/V5ABIo9BB+M3caSu8+/a5BM1y?=
 =?us-ascii?Q?e6fOgAc/h6zuN0Lj2Jg62ZzF77EfNSlR7tSgIzZe2dQ0ccFMxyGm3G5n/dj7?=
 =?us-ascii?Q?8a8mOIityHtdhfTq6pX5zwZt2vKeC65yZDSuqcKFrPjroxbEnL1dwQfjKMTo?=
 =?us-ascii?Q?ROjL3abU5PoVCIoX1wHN8N060s2u2/mWd3d0Ko/TD+7XFxEoE4RlXvvr+0UG?=
 =?us-ascii?Q?VAuCaAmNDQWs6F33Exk17bxb7gLA3Ur6C2POEmbu9R5pitSUfuMd/gkFX3FT?=
 =?us-ascii?Q?FvA4HSZa/0lPHZMOOLxLC0hhME4N58BAWKDmOfE408l4njHyHlA54wL3mwLx?=
 =?us-ascii?Q?CbBhJ8P8WmF+IK8wOrR6IrXpxlICirgppeVD2DvCe237v30DC4c4Xc82ymn4?=
 =?us-ascii?Q?Fu7v370Bnxdq4jl7Fbkeup6PqGanSb/bFg9CKLFTWDloBZxxE6JSWs28iX8k?=
 =?us-ascii?Q?AMFTiqh93ICrfLis+wClmCBIGLrjPvHNlUVKMhb53GmoKMOMO1ywxmMcP5ko?=
 =?us-ascii?Q?6F/bBZouGKzVlKJhFIjdQV8HUdhrbBrp/ky/ye34xQjr/acGGdGKb/Hx1P3t?=
 =?us-ascii?Q?4rEimR/4Fkp6KQ+sD7qsXrv3AsXnMdrn4Sf3n+RoCSTrhgELTsDyBEfmxri4?=
 =?us-ascii?Q?4Eh1L9K2SNh2ggZqdybUdHhgQ9mYc2IX8ckPWnyX0i5lvEvk99Pe9wiuiolc?=
 =?us-ascii?Q?3b1zLYiVjpNu7S2SO8Z65WckHGE2uvzFkjA9wErpgxDtqKZC4tWVlRBtY1Ep?=
 =?us-ascii?Q?3qV0oRASrWy6ERxntDOZw0RbKXX9LdLhe89uH6FS8YzE0G8uY+LBe2PcosFE?=
 =?us-ascii?Q?t8Q0vNUpNTL0Pq0jR8k1+woo+qeqP3ZOnkBILdZkrYl9C9BPztbHcBCGpM3i?=
 =?us-ascii?Q?t31fKdqsBiaoYvDQL4/AEyMkWG+Ul/5+CNgZwTZd1JH3QmzpY3uME8nWS0Cv?=
 =?us-ascii?Q?ShmbMNjE6EL7kZzUoZ/Y+g7x5OpWWFvB9uLL4lVM+FMBYYi8YErDrijYkrq1?=
 =?us-ascii?Q?xSJxfcoe1c+jz1gzHoA+s3GIIoJkBPJupxbzkIct9fl+sKcb1TGmPo7ppXiV?=
 =?us-ascii?Q?TJXTW2Ewo15q2aG6vMO5YzQQvFLvVfEBviExrPKNU+n2oMZ1n8SWgMaRxSy6?=
 =?us-ascii?Q?quyb4eXs+80T8xBtck0CszAPmtBqbjz+RCPlOPOF9LCqQnuHvZC81PIKPOfo?=
 =?us-ascii?Q?TQd237wMibFbsgB9K8s9YDTKZPO6tb6ftMdcM7/7ubsgt8KwxclPYc3v/uAj?=
 =?us-ascii?Q?cbX700QCS3J4wBdqXHaF3HxkuEuhXqlJ3OXu4HrIMHj58on0DQLwpq6kRvBn?=
 =?us-ascii?Q?l1YvSGM7brkgPj1XXxL+K9LPyecbgd7LtdTBrG+U/d2LQ42rAHW/zGYmN4ER?=
 =?us-ascii?Q?jykk/BUP7J8fkPAuBF50Og7CnDSU4XwYMX730mha8WW85g5ktv+ZZLKzRETh?=
 =?us-ascii?Q?0nlOtW7h480d1KKWwhOKOnQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k/lCTAHmrpdTCVzZLiGHrnO84wBnXtVZmbavTNMjgQCKHH/eUMAE2J8eDXXD?=
 =?us-ascii?Q?SVHS90g8TRTEQuj5LbM++UxbM7W+EVDjdLTF8e8JAuIA1vT3OY0fh85vdAUm?=
 =?us-ascii?Q?jUv2iTOXcSfS/rC+MY3iRp/XiJmB4noIzjGASZDchqFK3CnlC2LkKHrWq+9f?=
 =?us-ascii?Q?AfTeHZssaNGR3/+hh1vOBLO8Bu9J1oFptLxKzwqkNMrn0T8HrmKJZ3KIy/P4?=
 =?us-ascii?Q?njeCJs9Uee1zS6m2tA7G9LAT8uAYIVWwtRc6rdXG+tqjWmXWfYE+DDCTFN2J?=
 =?us-ascii?Q?nW1T3ORH71w3KQ2YOz2UoP/TIy7+rwIpY9CK1NwKp9S4GGMCWRxZB8prvRG0?=
 =?us-ascii?Q?PlvTFob//n3+Uq42Uys1CbyRo0v7TFAYOyqGsAFGuPy4ehV/n/EDTwZFL7/b?=
 =?us-ascii?Q?mBOoEbpkXvDszc2qjxt55eZ5w3pxm3Q7OOvyOqV9SWcxtzI/RBf1+9xsZVrO?=
 =?us-ascii?Q?XD7+yss7rtg6BTnaCxZ/P51gWmMSCzUKzL4TfNUygx5rAT5kUJhY3Erzp8z2?=
 =?us-ascii?Q?aS9sLbG/s/QaUmmciVBvnVRyoNH8nBXUNfmpV49iVR7m0uY9eOc0XP8VxI9R?=
 =?us-ascii?Q?FlJu7JNOSWCPFfSRQetIBiM2bDsWf2owdkoino1FcQASY/brgukcGtsvDSVa?=
 =?us-ascii?Q?tmc0WFdIGoPavPOvsdY782/bQ5/d6y92SqIW/4LNdx3GvCkRo0zWeIdcWQuo?=
 =?us-ascii?Q?3tnPvNVMSLNGp0MGoSm7SZyk40LpRyRxwCsz2pI/TGTMczzQxHCPnIkeq2DG?=
 =?us-ascii?Q?fiwFHhJbJYpojl/AcZ3AM9Zw54lW9jojmMh5NjIgFc9IwAfqj+aeFOEZzLPn?=
 =?us-ascii?Q?fww2cM3F5+ZqIQdiG8Vv4SPwDsSlYLXjwQeVlmEo3nUcDMSk1+XcSxHwMtL4?=
 =?us-ascii?Q?Led23V6yCa7Xj/xSDCGJpD2adXY5hKM3/X7wtFxUWldkRm3Oo1ag0Yu9JfH6?=
 =?us-ascii?Q?P5NE9dYgNq1QNkc4B5PltgJTDjo3ei1jef7LhCGHSk4w3ROypJqeHqXQT8KX?=
 =?us-ascii?Q?GCRBbUDRjf3mr62ql5eM2ovGi20tKUgX7Nq6ldKzdpiHFKeZmBJ0U1BwVz3L?=
 =?us-ascii?Q?d/JZwmD7xW0khBqq5CXq/1Ol9teRa5TTINchsm/RJs4Gqay3Bi1VEiJpdHJm?=
 =?us-ascii?Q?8AFFuw8AS5wE5+dacv9QQypX8y7ml03HJWVrKTI+QZAm+E4H2JPcriDOtX6O?=
 =?us-ascii?Q?SlFUYV1ppzb48M3LSesj0xWjwoKm9hoe72vXdgRD7ojNdHC9bC0OipZd4I5y?=
 =?us-ascii?Q?NNJ9YC0vAp1l9j8aUjGa1FUt+OK7hNXhhpX5kGP4wsAD4LolwQAxMhsUD5E8?=
 =?us-ascii?Q?JyKNKghb3cC9P/c70zg+dR7PBIfA2mQRJhgkomt+GKU+Ag8BieT3NzG+rzdN?=
 =?us-ascii?Q?5MQTxX5q/bWRrc7Z93V0YlYKAKJrSVwAg/DJr9HvtUf0JW4gP3L7Vsue/M3E?=
 =?us-ascii?Q?+nGG3w2P4MluEV68v+Uw3viyZEI/bTP8xzJ8BehEE3cP+yFmoSHXykfcmp+x?=
 =?us-ascii?Q?Bww2GMKnSozbP0rXvc57OnjJCjCRODmKtt6NH8ZBNoL/PPqY+t95LlrU79Wy?=
 =?us-ascii?Q?D0p51DiXmOJ7CBqMqu8VCbbokd0FRJOCYqvnkUqJOeLrLxdZYxTZx73fCKLg?=
 =?us-ascii?Q?sQh42wKyGym2ClK8sNjU2GVQ+eMx4Los3HHt67IYt9vBKqPZTmT3XwI3hlFs?=
 =?us-ascii?Q?2QCEhhvJ0UmJmpQax3frr6iX1G1RMcTF104GUA+koT63/Iiq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c9f4b1-d269-4aa1-455e-08de634522eb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:56:12.6722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6r2YzlBnWK2887y6h3hKgUZvHDWoJm7L44SihFp0EJ9rXmvUnCvYbus66Quz2OHEZDPORLScSUxiJ75fpjltzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8019
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52118-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16]
X-Rspamd-Queue-Id: 2680FDC68D
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 04:23:39PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Use devm_pm_runtime_enable() to simplify probe and exit paths.
>
> No functional change.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 39022c1bf36d..877e6c4f7406 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -2971,12 +2971,22 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>  			  jpeg->dec_vdev->minor);
>
>  	platform_set_drvdata(pdev, jpeg);
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable runtime PM: %d\n", ret);
> +		goto err_pm;
> +	}
>
>  	return 0;
>
> +err_pm:
> +	video_unregister_device(jpeg->dec_vdev);
> +	/* set NULL to prevent double-free */
> +	jpeg->dec_vdev = NULL;

code have not simplied, you add addtional goto label. You can use
devm_add_action_or_reset().

Frank

>  err_vdev_register:
> -	video_device_release(jpeg->dec_vdev);
> +	/* Only release if allocation succeeded but registration failed */
> +	if (jpeg->dec_vdev)
> +		video_device_release(jpeg->dec_vdev);
>
>  err_vdev_alloc:
>  	v4l2_m2m_release(jpeg->m2m_dev);
> @@ -3047,7 +3057,6 @@ static void mxc_jpeg_remove(struct platform_device *pdev)
>
>  	mxc_jpeg_free_slot_data(jpeg);
>
> -	pm_runtime_disable(&pdev->dev);
>  	video_unregister_device(jpeg->dec_vdev);
>  	v4l2_m2m_release(jpeg->m2m_dev);
>  	v4l2_device_unregister(&jpeg->v4l2_dev);
> --
> 2.52.0
>

