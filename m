Return-Path: <linux-media+bounces-51864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFbpDrTFfGm+OgIAu9opvQ
	(envelope-from <linux-media+bounces-51864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 15:52:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7678DBBC76
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 15:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83C1B301051B
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851AB324B1F;
	Fri, 30 Jan 2026 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FexnwjJ0"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCFF320A14;
	Fri, 30 Jan 2026 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769784747; cv=fail; b=CJJfbPqkgvQhBy0yjCQ1BxtHj9yyofVOd5ysshQvdiNTsFD9Bu2AiBeHZwKiAryShcJkRHHv+GfZ5+7fyPSd9Nk/8CRDZno81OBVMqbNTWhxJ8JwQj+gl39qQ4cAF2/bOU2et1C9SVjFS4YsCFX1tUvAwhTaajXfaysNRg0l3kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769784747; c=relaxed/simple;
	bh=WIVZ+4Jx3EjDWkvAnQfmEW7JWaX1NAE3yF9JwCOhYME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sLwPIWYTJyOrvva09u1oLMEZzivSY8IvqxEdITx7fL0kPXuAcDAUJrCN0CIlFGiU7QzpVsteEhX/vQwzauDqVcZYFYpuZkQsRld2/PSoyrB0FziKWN8NzaBe40Sx7J/ReJilqRNNaNLzZBlz1VDDiSX0QITKj420mdeokUImlrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FexnwjJ0; arc=fail smtp.client-ip=52.101.70.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TB5S47XwN++1OxgaXKRLmNdIwGQJ7isIMHyAXfWDtm0EZJr5E1U6WfAZlLAxS/gnKYIrZCme236xzCWWM8qATSnd9digM4YQ4k+vJEW90uaceN2YMj/I43J3JW/OXDapc3jAArmAkluMjvQq7sObitbq5tpzlerxQVypkjYf9yOL/dbke2VhgjU7hvVoWLYcr8ztz0+bh5NxFrpKwhjgWx2PnUfeZhp/sknGVduMjts9L62eLHSxbCGiXAMuoCPsH2Ht+CaQvgneAgblWpbHayE70avOHttxKxRfinQLKZph4NLlhxVhQlaoumiASZmljAGEZ0SXzCPtyNKxHxa/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdQTzSQk7dl6enUrAIrrKuZlJtYg+4K/+Y/fJCrb1Yo=;
 b=WzE/tpAMIAdjUzZXueY74vOGG7ST11QOCSCdDxaDUr10jnxQjUl4a71JjVhDzPus1e9RSeOeP/vKbEpL1SlRFzSga+CTniidyBUmlnr4keq75A4H/KSmDaMwAY8CppcjYXGkzGkXrOFsHzvYM7MQZ8vh3ly1DNmMSIRe79Dy6Ygb+qIY592VRdmqlNL4DNq3KsF9U7MhU3QrI2TYbq77cEbumfuIBSblaH5rne7yOYvE1W43dB//p9CxFg9CmkZpDaPo66mlbb7StNpmtNffiH2WEcyaaWs39VplELYnDrDYPfZRGMbYXkxXQ4yOS3MFGI+idoNDW98c6y7KCnmekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdQTzSQk7dl6enUrAIrrKuZlJtYg+4K/+Y/fJCrb1Yo=;
 b=FexnwjJ0+K/Y9+Vdl1CI4Oav9/qA2fnunVmuaYp2zS3He4ww9Sicunc7+NtOergMUlEaokaspd4VgfLa6P6mrjJCcHOxTvMAlTkjMeTGeiV42NPIYlqJ5W/C86zLNau/OPteHHBII9IIdDsy8QPuqBwMxXKB5hAJhaExU7lhxkiGOyuYJFeTjxebPspUxLzg+uGCPjR/Glo/6EYZitcNNUb1sSrv5tt937dH3kODM5J2sSDC0psSo+4rJTXdjQIBX+XmKe9U4XU9YaIP110NAqRYg3YVfpdSIbfxCIxeJUOYyskfOABhKdmkhmTVT38rr8pxA67AxXEMpJo57qQCtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7880.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.9; Fri, 30 Jan
 2026 14:52:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:52:23 +0000
Date: Fri, 30 Jan 2026 09:52:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] media: imx-jpeg: Add support for encoder v1
 descriptor configuration
Message-ID: <aXzFnXmvZIcqWxZ4@lizhi-Precision-Tower-5810>
References: <20260130062236.2109-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130062236.2109-1-ming.qian@oss.nxp.com>
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 73eee756-0804-4f1f-ea30-08de600f2cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iMeaRm+YBHx2wyqVfLWIvcCvLHumaRwdXg7Hyw7pOh+1fIHBpNqZMu3p5MJo?=
 =?us-ascii?Q?Ww4kAKEiP8tXTrm3K0CRdiuaaYZq2q9Ki8prMpHe0S0k099php8DF/262uyg?=
 =?us-ascii?Q?3uO/eH9sZAV1AYv2gDZtwajVm5Oms+SPUuEPNTtie1Fqaj4lt47ymqN23Wv2?=
 =?us-ascii?Q?YGmOCO73l8eS9GZfsunoWvI5yWMiOMVD4DfshgvnPmhq6x07hyKCpvYbjA/c?=
 =?us-ascii?Q?HQbbs8YZ+nIQY7nvHsVjmAq5nHtKB2tGP5lEDQsfp0dffxe5BJSRp7RgtRJt?=
 =?us-ascii?Q?RQAC/40d+HTqIHWEJ2Ndnf6kA91WvZEX19v8NNr4jD1jEjV5K5+46Xt4Q+2a?=
 =?us-ascii?Q?IIc79JOdblFmXTZVvKl6CiEzhk5htC6k44X5FM/X+c3uowcNIbS0uEfiOh1I?=
 =?us-ascii?Q?mimw1cBySB7kShha+cso4YmunhErEa89iVu+0Ot0FGsA4CAnTX55Re3QO1q8?=
 =?us-ascii?Q?FvqfggxqvIU6ByR6ienPdYoV2DGtL8RMhWNa5vRZSi15yOSWCZlc7HuIZ+RG?=
 =?us-ascii?Q?P91fhEeWS/fdJR1ToBC5Bif+njzdURiPBuzn0qsXz22ZbEs2mS6qTR7SKMhD?=
 =?us-ascii?Q?Jy7p5/OO5EyUzaNbexk5m5rrrwEPSXEO5IJShH19BEQSiir4tTGdQnEVe/Bm?=
 =?us-ascii?Q?kmijrcn/dQ8YQsC4by8Bh885rk7UH8xTWTab1xwoyVWa948lnHAFcbUX9AbD?=
 =?us-ascii?Q?piQH8q8YVuE23RwguqBQMhdP3DPaPNMYpNhHh0Lgpcs6ABth5oCVn3A0sosa?=
 =?us-ascii?Q?VFeMKLNPGUID/2vYRL8I7tt0Bk4ei5DUn9QTTUDj5g901mvVpYrkF/2gcZJC?=
 =?us-ascii?Q?IGd2cM6Iw+vycTJEk7II5jdmCDd1hdsBRgeJRvteoHpSSQroT+N21MRK0nPC?=
 =?us-ascii?Q?YfCL6kIZaFc0mk7mqHgauaiOYpaUHcHw8ClRCotqIruC9uHVbGGf1l63G22z?=
 =?us-ascii?Q?WT+hSz8ARdlovEHQZVKyFMrTCfxIk5cXYIU7SJ5DjM6dxx3jfZXoT8gQD73w?=
 =?us-ascii?Q?6HWTcDzVafshxSCTerAldp9St7aPGCssj2MxNX80Ck5UCOEpjPDBHymRBXsX?=
 =?us-ascii?Q?CJg9W0kgylBQngASSIoJXkvwjyOR6zLEl4tOeRMAdSEqN3FyZ766jQ8KimEA?=
 =?us-ascii?Q?rgBYdzCEw0zkGxhiKHWguPBdXpckv2mi3SS9CxV+0OIYRX5c1x6azKUKDLDM?=
 =?us-ascii?Q?SISCeQ3XiDZqxGVlUwsg8c8NuLIliQ1mxMbEMt0LS4YvhQuu/68QKIoG0ngV?=
 =?us-ascii?Q?/Kfbm7avwMEp9GiICcmhSTUaowgemnqCuiceKkl9RYS4dr0V6e5/We4MJFmK?=
 =?us-ascii?Q?yPnGvYcoOg6wxdR1C5dfOcKIOp/+X9uDd8IsTZVgq9biJ2H+kAK92ijGajij?=
 =?us-ascii?Q?TM4gNnnWLzSfkqqyEz6Z6lSBH43laKY/Gvrvn3qyKx302kM8RL/qxwbM+GOJ?=
 =?us-ascii?Q?jplORqn+kr0Qcc9FObxW/Jm8sf2EIPWUUBbo+/EGvYtq5/1tPrWV3Xu9tODp?=
 =?us-ascii?Q?3GsByn0JDhv8SP9pqMRyt9hPTFV4Uem6C2Mw947GABXiC0rFBq4HYhz6W+ns?=
 =?us-ascii?Q?o8nhHtJZrvu6Z5Bw4s9+604+1919GKY/feBjszFdzygucmQPEV+Wv7gnECqY?=
 =?us-ascii?Q?SJp7YBVKsrMffJ+DdP062SA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OCf8PNZcjxauk23GpJF3wPkzwtFSCeTDBFpz3XlgKjLhy0uHAzdDHib3Gcg1?=
 =?us-ascii?Q?vbVT+NtoNZh2loYvsfA7agtGTl9M2zdo8PygyxKDJQZmvQG7E2e4t7XEY7ue?=
 =?us-ascii?Q?CjL4hVi6Xy1zmrtDGud4T/DLWJDRXiEK5bWW7EWo7lI6bFqvsBd3e5nERTXX?=
 =?us-ascii?Q?beB5HMT0/XYXsOuXAw0MZHw0Gw0D7WOeSF8/3kC2imC3RJqucpU2qo2FVDlQ?=
 =?us-ascii?Q?l3kEp0rJWQRG7Xv+qBOgZuyNy8fM13AjI+Irxl11PpArqYejXiPCaUeXE5lf?=
 =?us-ascii?Q?hsujvsDkYt1ChHNqLal7xVbhNsE2ZKzSLCyCDCktSWd9Qzuzi3DdhldLX0bR?=
 =?us-ascii?Q?/LtNkJBbaqDXrvLdOViGQl1KOGjEj8wpHn7EwTgnkxG10Pelz0prW9GTlrvP?=
 =?us-ascii?Q?a/BhYANPAIb3+CG+I0N+XoWNmsh/6LqKCIiNQl4d6k3tPIVOCsEx7kG6T6Ux?=
 =?us-ascii?Q?AWBuL/vHW1078nGpWtVItzMNaq0to8hABgbGB5K6qjth2g8aZFCSDaCMnlyP?=
 =?us-ascii?Q?iAhu5kx37v/a1wMM4atzopLTNER8dztuKPqk2BFT3nflQq665+me/9zaqmMB?=
 =?us-ascii?Q?yWMYAEerYu+D2i1tZMSsWQ3zQ208daNV8VQLQ7McG/khu6Qoi4vJ3L+8+nNH?=
 =?us-ascii?Q?C8R614L/6Lo1wh3Sf1uQgKdwNUgO9cXuiZFRiEfhhKreWDpYxuLBa2pKPjpU?=
 =?us-ascii?Q?iEZH+kUbs8EzwrzYGt/nZSDzBzP3Up+hvKkPh0gKUAEHNhrCgmrzvlPLWmcH?=
 =?us-ascii?Q?MVLXmdkxWrXGZonh2yFvW7yM2DjqTEELlZTPgf9N5g+7UQ1Ym8mqdCE2tUay?=
 =?us-ascii?Q?RqsNwjT9kBPjHn1h2Z6YPWIal6hdp8IU5Wj8lIuNRQLaQINIfQtTYGbgo3Z9?=
 =?us-ascii?Q?7y2wHyVMCA6/EvN47cRw3ZgrDSbEAG2gI7qeqhs094QZcH0g3lZtUUhLF0a3?=
 =?us-ascii?Q?6++D8PF/rVrcYjrfe/iFHvUfYbJ0xaN5W62ip1rSldGIGPfLEwEgksadotoj?=
 =?us-ascii?Q?t3iS4z3HXb1N6XoiaCkF1kSY3JgTbXF0OI5GYVTq2HS4I6Lyb+A8ssJpHWyy?=
 =?us-ascii?Q?sjV+3ses8BDYQd3MybxZREV0YvTG5KRFqlNcTqrZ3ZHAII7pTWUBRDgn8zxt?=
 =?us-ascii?Q?7RVvEPqQL+i1trljexpQb4KXcfGHTPfoJuE5frb2YL/EpN4aLuoENG6OXYer?=
 =?us-ascii?Q?FmiDFC9OiaVFvNhe0IFs1gRMuTo7ks0io6Sj8l6PCNFRTKwpWvuU+hm+gU8W?=
 =?us-ascii?Q?XoXGcF4sSN9TLuKo157Sy0gnAC0gbrqAuixsbK7D4KMswoXzxMqIhZ3RhLnH?=
 =?us-ascii?Q?yvfpUxvB5DjlDwEZ8AjMPSQRaCC9W4dLpdVPw0hJc3FMjhaJ2DIqqz8isNzn?=
 =?us-ascii?Q?we275oyY9zOV7b4340uOnfU4gCJ59lLDu2Mw2Jf2XMRJaCf2ANG1xl9b0W0J?=
 =?us-ascii?Q?fff3k7993kkcLfsuPQb7HP3QHLxuqhQMkbuLJo8aVxbsbwIOrLUMTBZdYWfZ?=
 =?us-ascii?Q?SOoRsaC+GkLMQ577T7HBdaL107MNOzJeNig7p7Lrw+NtZfT/qpmLgCNEKvPX?=
 =?us-ascii?Q?DiavPIMastXVEmbO8/VqxbTehIq+wwHZQZTi/dJ0zwn8DjaVISEY5M7iTjbh?=
 =?us-ascii?Q?MIjxhseVQZY8nNn++8kznzCaKGlHai47OxCDb4b370JmjJ/KOlisWkvC4h1p?=
 =?us-ascii?Q?aQkXUd7K32uMALGKrgPJvfFpXXc8iThTEetpUej5XnOVbQHs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73eee756-0804-4f1f-ea30-08de600f2cd6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:52:23.2303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDVkQM9EXJ/5NrbcdtQ3v4fQ889VRDsx19YqagOdM2xohg+lczk+FEPMlFhDoIq+910yur+t7tUZa/x5sHStZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7880
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-51864-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7678DBBC76
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 02:22:33PM +0800, ming.qian@oss.nxp.com wrote:
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
>
> ---
> v2
> - Improve commit message
> - Use GENMASK_U32
> - make mxc_jpeg_get_version() static
> - Check version in probe()
> - Remove noise that update copyright years
> ---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |   1 +
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 104 +++++++++++++++---
>  .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  22 ++++
>  3 files changed, 113 insertions(+), 14 deletions(-)
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
> index b558700d1d96..71f4a1d292ac 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -64,6 +64,12 @@
>  #include "mxc-jpeg-hw.h"
>  #include "mxc-jpeg.h"
>
> +#define call_void_jpeg_enc_ops(jpeg, op, args...)			\
> +	do {								\
> +		if ((jpeg)->enc_cfg_ops && (jpeg)->enc_cfg_ops->op)	\
> +			(jpeg)->enc_cfg_ops->op(args);			\
> +	} while (0)
> +
>  static const struct mxc_jpeg_fmt mxc_formats[] = {
>  	{
>  		.name		= "JPEG",
> @@ -1030,11 +1036,7 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
>
>  	if (jpeg->mode == MXC_JPEG_ENCODE &&
>  	    ctx->enc_state == MXC_JPEG_ENC_CONF) {
> -		q_data = mxc_jpeg_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> -		ctx->enc_state = MXC_JPEG_ENCODING;
> -		dev_dbg(dev, "Encoder config finished. Start encoding...\n");
> -		mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
> -		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
> +		call_void_jpeg_enc_ops(jpeg, exit_config_mode, ctx);
>  		goto job_unlock;
>  	}
>  	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
> @@ -1272,6 +1274,7 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
>
>  	jpeg_src_buf = vb2_to_mxc_buf(src_buf);
>
> +	ctx->extseq = mxc_jpeg_is_extended_sequential(jpeg_src_buf->fmt);
>  	/* setup the decoding descriptor */
>  	desc->next_descpt_ptr = 0; /* end of chain */
>  	q_data_cap = mxc_jpeg_get_q_data(ctx, cap_type);
> @@ -1335,9 +1338,15 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	struct mxc_jpeg_q_data *q_data;
>  	enum mxc_jpeg_image_format img_fmt;
>  	int w, h;
> +	bool extseq;
>
>  	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
> +	extseq = mxc_jpeg_is_extended_sequential(q_data->fmt);
> +
> +	ctx->extseq = extseq;
>
> +	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
> +	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
>  	jpeg->slot_data.cfg_stream_size =
>  			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
>  						  q_data->fmt->fourcc,
> @@ -1348,11 +1357,6 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
>
>  	cfg_desc->buf_base0 = jpeg->slot_data.cfg_stream_handle;
> -	cfg_desc->buf_base1 = 0;
> -	cfg_desc->line_pitch = 0;
> -	cfg_desc->stm_bufbase = 0; /* no output expected */
> -	cfg_desc->stm_bufsize = 0x0;
> -	cfg_desc->imgsize = 0;

this change and memset belong code cleanup, it'd better use seperate patch.

>  	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
>  	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
>
> @@ -1372,11 +1376,14 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	desc->stm_ctrl = STM_CTRL_CONFIG_MOD(0) |
>  			 STM_CTRL_IMAGE_FORMAT(img_fmt);
>  	desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
> -	if (mxc_jpeg_is_extended_sequential(q_data->fmt))
> +	if (extseq)
>  		desc->stm_ctrl |= STM_CTRL_PIXEL_PRECISION;
>  	else
>  		desc->stm_ctrl &= ~STM_CTRL_PIXEL_PRECISION;
>  	mxc_jpeg_addrs(desc, src_buf, dst_buf, 0);
> +
> +	call_void_jpeg_enc_ops(jpeg, setup_desc, ctx);
> +
>  	dev_dbg(jpeg->dev, "cfg_desc:\n");
>  	print_descriptor_info(jpeg->dev, cfg_desc);
>  	dev_dbg(jpeg->dev, "enc desc:\n");
> @@ -1388,6 +1395,54 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	mxc_jpeg_set_desc(cfg_desc_handle, reg, slot);
>  }
>
> +static void mxc_jpeg_enc_start_config_manually(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	void __iomem *reg = jpeg->base_reg;
> +	struct device *dev = jpeg->dev;
> +
> +	ctx->enc_state = MXC_JPEG_ENC_CONF;
> +	mxc_jpeg_enc_mode_conf(dev, reg, ctx->extseq);
> +}
> +
> +static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
> +{
> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> +	void __iomem *reg = jpeg->base_reg;
> +	struct device *dev = jpeg->dev;
> +
> +	ctx->enc_state = MXC_JPEG_ENCODING;
> +	dev_dbg(dev, "Encoder config finished. Start encoding...\n");
> +	mxc_jpeg_enc_set_quality(dev, reg, ctx->jpeg_quality);
> +	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
> +}

If I do this, I prefer mxc_jpeg_enc_start_config_manually() and
mxc_jpeg_enc_finish_config_manually() as patch, just do code re-org.

Then base that, add mxc_jpeg_enc_configure_desc() will straight forward.

Some maintainer accept this if change is not bigger.  The squash patches
is trivials by maintainers.

Frank
> +
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
> +static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
> +	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
> +	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
> +};
> +
> +static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v1 = {
> +	.setup_desc = mxc_jpeg_enc_configure_desc
> +};
> +
>  static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
>  {
>  	int i;
> @@ -1593,12 +1648,10 @@ static void mxc_jpeg_device_run(void *priv)
>
>  	if (jpeg->mode == MXC_JPEG_ENCODE) {
>  		dev_dbg(dev, "Encoding on slot %d\n", ctx->slot);
> -		ctx->enc_state = MXC_JPEG_ENC_CONF;
>  		mxc_jpeg_config_enc_desc(&dst_buf->vb2_buf, ctx,
>  					 &src_buf->vb2_buf, &dst_buf->vb2_buf);
>  		/* start config phase */
> -		mxc_jpeg_enc_mode_conf(dev, reg,
> -				       mxc_jpeg_is_extended_sequential(q_data_out->fmt));
> +		call_void_jpeg_enc_ops(jpeg, enter_config_mode, ctx);
>  	} else {
>  		dev_dbg(dev, "Decoding on slot %d\n", ctx->slot);
>  		print_mxc_buf(jpeg, &src_buf->vb2_buf, 0);
> @@ -2842,6 +2895,14 @@ static int mxc_jpeg_attach_pm_domains(struct mxc_jpeg_dev *jpeg)
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
> @@ -2976,8 +3037,23 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, jpeg);
>  	pm_runtime_enable(dev);
>
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
> +
>  	return 0;
>
> +err_check_version:
> +	pm_runtime_disable(&pdev->dev);
>  err_vdev_register:
>  	video_device_release(jpeg->dec_vdev);
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> index 9c5b4f053ded..c00c13549746 100644
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
> @@ -105,6 +116,7 @@ struct mxc_jpeg_ctx {
>  	unsigned int			source_change;
>  	bool				need_initial_source_change_evt;
>  	bool				header_parsed;
> +	bool				extseq;
>  	struct v4l2_ctrl_handler	ctrl_handler;
>  	u8				jpeg_quality;
>  	struct delayed_work		task_timer;
> @@ -125,6 +137,15 @@ struct mxc_jpeg_slot_data {
>  	dma_addr_t cfg_dec_daddr;
>  };
>
> +struct mxc_jpeg_enc_ops {
> +	/* Manual configuration (v0 hardware) - two-phase process */
> +	void (*enter_config_mode)(struct mxc_jpeg_ctx *ctx);
> +	void (*exit_config_mode)(struct mxc_jpeg_ctx *ctx);
> +
> +	/* Descriptor-based configuration (v1 hardware) - single-phase */
> +	void (*setup_desc)(struct mxc_jpeg_ctx *ctx);
> +};
> +
>  struct mxc_jpeg_dev {
>  	spinlock_t			hw_lock; /* hardware access lock */
>  	unsigned int			mode;
> @@ -142,6 +163,7 @@ struct mxc_jpeg_dev {
>  	struct device			**pd_dev;
>  	struct device_link		**pd_link;
>  	struct gen_pool			*sram_pool;
> +	const struct mxc_jpeg_enc_ops	*enc_cfg_ops;
>  };
>
>  /**
>
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> prerequisite-patch-id: 0000000000000000000000000000000000000000
> --
> 2.52.0
>

