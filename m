Return-Path: <linux-media+bounces-45478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87990C05694
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 262114EED16
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B0D30DD0B;
	Fri, 24 Oct 2025 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ko1kB0Vq"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F69230DD10;
	Fri, 24 Oct 2025 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761299209; cv=fail; b=QVQSjKZ7jvfD3Yfy+galuVCRgMRNlkdfN+sY3O529C32QWYYG3loHUnvgOEtundcrHs0l+S1V8kaVMu9pjfz5HKRapixbIfYsIFgBFyVpi9bUiqQIYDT7WepWiRTa9vO1LhpuGJtTgnXNm62DfxqGnzhZfjpFNG1ib6JFRi/Et0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761299209; c=relaxed/simple;
	bh=mr1DrCYj3d0Is8+sH+09kAvZ6bXBhJYh4QnAEa78AZo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ICo+tnxUdgc2dywTJI50ck/D5LA+mVYMM3vJ4rc1nH5oXaBmRfUcXHiQc99K5d8BrMo8PCnwSElfHYo55GwPVoU6EnVtFVyKZ8p32UDf3Yi6qIDu9h0pyXikd2y7lUP9hYjn9G/DjtPjndWneHqMCEeH63QrnX7qH7lf4eCLNHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ko1kB0Vq; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avLCV78WGi3iTcrb4rXGkrPoRB8dn40R37YM/2bhJQ1ARRZ4A6PzKQtO4BkAgua/ZM9gGzU2WxKMUbfFAPYXr19g0RpmbAprPOMMPlQFjGCV4KWPF4HJJl2qWDWHakstdFOavggNstuo0fi0kavbk1b5sOmzBUX5e+XDiIP5ez/AJ3pBwFnYn2vILsg2na2+2AOnvbIBFRS70AVLr2gD0tYOvQ+aUvNg6YoLg5O+4QbNUVbpX8Sy1hz3JsjIYsK1nV+iOLUp3zPW7aK0LsLbQxCe1iqwL9sieHw450jfmooZOnpjlUiU9mJeag/x9go5D4pT5C5zjQuuzK/eo5+S/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzd7X3ODCOLk/srGGPVp1+cOdr5KAbirtgmmf/zfCv4=;
 b=ssbXCN0R2E4/a1yLdQP+7cFYml8Xa9JsrBXs70SYUSsmfM728XXIlDrjR5Ht/9Emlnp3N4ZUtregy/CD88gxmwE61NoFxMtJ9zVUKlB+HgFm4hYrp0r7QQCfLqM54M3MCqWwNSJunasBsNKM7bysRBAZ+RBfOQQOn3f3eM1wts3tzwznKkVr/fuxsYZ7ooU/BuezPmNJW0JUm7jWNhFs1M3cB70h5Quxbf5PSdJBKtAV36kl6PhicRfxtwjtRDuvk3sxH3AGcbuCnqgsemZRfjSWtipQObDwlgNtHGZpuAGX8fTSyT8TiVkZC6DgzmHppscg3zgvlZSJ3j2ag0hpjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzd7X3ODCOLk/srGGPVp1+cOdr5KAbirtgmmf/zfCv4=;
 b=ko1kB0VqoWhQ3UruNkRR/iObGfn2lHqGqjwc9E8ssGqNQnCCQcZZYN49tfXajg7ADgDBM3Ds87uP4Q1Q+Bub6rR2G5Pj8oE1GIrIbcu69xQeydfCF0PpPWzq6Z4LuldIEekuFP4i0T1WnE37Cg+2F4tKqf/Sq0M9JvEB0/zMNv+wS8exS6dJD2EMfZhZpYRnGI3LBsK9dznBILkp+umd569KU56AoyiOX5OWYGUJK+rpGAUpv9jPcJ9XJXc8CP+SJSJwKCUcrxFpaOPWczRYCoZAjb2M9ilzFthFWCU9qBNk1MaJ1qGTxGUP0zNZcxVg75omJ8FLW00KQhIFjQVd4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by DU4PR04MB11361.eurprd04.prod.outlook.com (2603:10a6:10:5cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:46:44 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 09:46:43 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Oct 2025 17:46:52 +0800
Subject: [PATCH 1/3] media: dt-bindings: nxp,imx8-isi: Add i.MX95 ISI
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-isi_imx95-v1-1-3ad1af7c3d61@nxp.com>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
In-Reply-To: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761299238; l=1826;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=+7eCeHgxYkt7qEo+dVC8wb8PLy3Buf+/R1rsiKFRH9Q=;
 b=GbwcO9u4CmIpiADpw/CtPbRWX4a3vG7q6SrLfJKlvHwJ52BmP8EDm92qx+508KKSmCnf5/hDT
 NaI+EKBrdc6DT5m7k9mcEuCSN+eG3CWUlqBzvN6giDY+HsG+pHrvYjx
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To PAXPR04MB9089.eurprd04.prod.outlook.com
 (2603:10a6:102:225::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9089:EE_|DU4PR04MB11361:EE_
X-MS-Office365-Filtering-Correlation-Id: 66983fde-0018-4a3b-2a40-08de12e23d4e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|366016|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VWVMejQzeWlacmFUS2RuTEpSWFhLUW1HS2IrSnlOMEswZHlBcHRWQlpwb3NB?=
 =?utf-8?B?cStseUpmOTF5cUZObFlmWFRWNlhBdEUyVHRGMkxuQk90ZjRXY3diT0YwQWlX?=
 =?utf-8?B?dUs2UDhnUnh4eHdrYUlYSHA4c0tFS1dpTXBTcUpyeWR2OGJ3ZG1XbkVXQXdX?=
 =?utf-8?B?bnExZ1l2T29PRWpEYlRjYUpyTUNUWW1kUlJBYXV1NmloUVJzdzBjcEtJNjZ2?=
 =?utf-8?B?dnpKT3VJQmdRRnRJWTl6aCtYZHVWS0w3ak1yU3NFUmpOTXFrTTdFd1JtNmRr?=
 =?utf-8?B?Sjg5Mkd0QlpWSXM4MkY2elBQSWFwLzU3Q0ZEZEhzZi9IckxaZFNQR3BZWi8v?=
 =?utf-8?B?Uy96RnNMdXNJMzc4SWgyaE9TUHZ4VHFkMEtBRS9VQzRFMGtZdG5FYWVDd285?=
 =?utf-8?B?QVc0Ny9UNERrN1IzalhtT1JWNDNIQmRmN3dYVVBtcjVQNnlXdUhUSmFsQkhw?=
 =?utf-8?B?NjVReS8xOTdxdnBicDZiRnMwNUFpRjMyVDQzVVRybkNVSFVwTDE4MjR4Ujkx?=
 =?utf-8?B?MjJWQ3hhSklOM2FPMU91Tm43ZVBYdGxQMEVaREtFblVYOXBFWHVxUCt3ZUZF?=
 =?utf-8?B?TTN0MUdlKzF4RnVqQU1mSlRaYWdRMnBKT2grT0dzK01odW5pOG9seTFJbURU?=
 =?utf-8?B?S3BwaWF2emJiL29QNHRHT2pla01mS2c1bkdiZ0FwRFRPSktJdlhmVkZ1YTNG?=
 =?utf-8?B?cUtKUTU4alJvaGYzbjBrRGNRK1MxbG1ZT2FQV2tYQmNiNFY3NDdweEdrZkZT?=
 =?utf-8?B?eUhRa0hqT1BzY09rNGNuVStOWlFrV0xYaHQ2Y1dYbU03TVNvSTNmeHRlSXJ5?=
 =?utf-8?B?eTViODl2Q2VKRHpwUEVKbVVYKzh1ZlpWNkVMazY4cDVXV25JR1NyaUw2UW56?=
 =?utf-8?B?MThTZmJXTVMzSGxCL1RkNEZXOVhFYmFLQUlZS2JRZkJTYXBuWXAzY1AwNG5h?=
 =?utf-8?B?TkwzR1hHaUtwTVI5M2tOZU02K2lNL1k3QVEwS0ZXTTJqNkFTQit3VVVqdmlF?=
 =?utf-8?B?NXFvYlgvR3FRQVJacHR0dGRiWlhmajJIVjVVc0VnRDZKWUFnaXM4dFZYUXRW?=
 =?utf-8?B?TDhib2JmazlTTkVBRlhOYTE4NjFaR2M0cGE4Wit2dXFkQnlhUCtnRXFHdFMy?=
 =?utf-8?B?QWIxTlhGZjMrQU4wOTlkNkNVbFhVNnBLeWZlSTVkYU5wdTFzY0hFVEFwSDRE?=
 =?utf-8?B?RTJ2QmdYVXEvV1FOR1lsNEtWQ01oRGl4dFlOWi95OElpbzAxN2EycGdiY24v?=
 =?utf-8?B?bmZheEs3RnhoQVhiZ0FjK0RsSktRbDJYSlg4YjZheE9rOVNFTWVicG8wZURi?=
 =?utf-8?B?NHhOdjl5YTZPejhHcUpQUklQK0NLSDNObUNCa0MxaTBtc0hOUnlHR21nZFJ0?=
 =?utf-8?B?M2M1SUluQlJnWEdtbXZ2eEUrWlFkOWhkck9kd2RSK2NsM3R6SGNMK0xTQVhK?=
 =?utf-8?B?K3JJYjlKRFcwMm9wYm5ONXNLVC8rOVBGYXhxejdSUkNhaE5QNEw5SitnRS9n?=
 =?utf-8?B?TGoyZGlCdUs1NDFhbWZLWDExSmMzamNLTlJaK3FEcWgwQURWKzU1b2EzaVZp?=
 =?utf-8?B?dmh1bTRCVDNsdWloang4cVdpdDkrY0NuTjFTcU5FWWFiSGNVNXExQU9tK3hF?=
 =?utf-8?B?MnNGeUZyWnRlVEI2Vmw5UGhHbVVnVUJCUHJVUDFiN2lJZ0FQanVqOUtIQ215?=
 =?utf-8?B?NmRQSjBWeTB6blROLzJOU0tndFRNb2hydzY0NjVQbXBTMmxNK2pMV3gwK1pB?=
 =?utf-8?B?S2xJekREMk5NYy9CN21paGh5MnZxWVUyeklqSzc5a1JGYTQvNFN6ME1wYVlV?=
 =?utf-8?B?a2tWb0tHeWZMcVJ6eHZzV3ZLWFhiaDZnT3FBNzZRT1RMNGRSdXo3WmkzazZh?=
 =?utf-8?B?aHpQaVJ4aUVQR0w2RHFwMGJPMzZQTFdKOGl5RStXSDVxMi9CVStscW9zWC9m?=
 =?utf-8?B?M24zNWhUWGdCaWRmakM5eWQzUUFXTkhhN29HZ1JXUWZMYmEzcVpUVjUxS1li?=
 =?utf-8?B?dGsvemNlUThQbTFIU3FxMXBheWRpdnoyZjQvYndYQTh2M3ZnNlgwN3VjM1hz?=
 =?utf-8?B?TTdnRFVmUko0ODl4V3l0QmJDNUppWTRya21hdz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dGxRV3NnVXVSUkNzMVJjRnBzYXJveFYySHg4WXpZbUdBdEU2ZXdOVFhJeDJp?=
 =?utf-8?B?UEN3RmpKTW1kZ1JFTzZ2R2JPQUNrWDFoT0Rjck5oZmJvaEV3ZEFia0hEaThS?=
 =?utf-8?B?UHBRaWU4Z1pFenFxWWJQbFJhd0hRWHdvc0xuczBPbmttaXlKOFVmK2luRElE?=
 =?utf-8?B?Vm02NU9Jcjh6d0F2bHJreVNURFlDZzhNc1F3WmN0cXpCencvY2pGQUVzeGZm?=
 =?utf-8?B?WXpIckFNNmlYZ3Y5VGlUTU1NV1JWY1YvTVkwWUJPYmFUekM1Q1NwZENhdDhv?=
 =?utf-8?B?a3ROcHBMSi9ZVlZ5UC9PTmQyWUxsd3orY0hvNDcxR1RVaVpTNnAvV0o4WjlZ?=
 =?utf-8?B?Smlsd0ZTZnZZbUpHOEJwc3ZmZk83Z2ZuRmx5Ni9iS2xrYWZIZWJ6cE1qU2pW?=
 =?utf-8?B?R2xscDBSaGFZQTRHN3pHV2RDd0s5S1ptdFRCbXltTCtNcnhvRU5qSFJOeE84?=
 =?utf-8?B?MngrYnF5cnBBQ3czclFuT05NNWl6Vk9Cajc5UHlPNlNYMko1aFNZaTFvZzlF?=
 =?utf-8?B?ZkNMT0R0Y1ZaUHpKdFJvaVprT1ZUa0Zwc01Cay9CRnZZY0ZXUUlvVHdlYVVT?=
 =?utf-8?B?R1NaVVlNUjZ0NWdpbndpdEU0ZXRNWEhuZHVEOWVYUlNTV2lmWE1hWS9Id013?=
 =?utf-8?B?TEZUeVhSSFdIbjdHWTNXbkdIbCtNSHhmcklsc05sY3dJZnUvbHo1V2lta3JW?=
 =?utf-8?B?ZHJLdjB2RmQ2Z0I0MWRaRWQwNDRvTTRBdE1oK3ZLdnZ4dHZsU0R0NzBCaWhG?=
 =?utf-8?B?QTk2cnd1YkhkZkVvR3RGZkxieTVUVUlnRWg1TWhKbFlUMHhvbkFGMURrRGlL?=
 =?utf-8?B?MnJ0bml6VVlHYzlrTFZzS21mNnFKNnBFWEdwS3lVaUptUUFId1Y5cU94NzQw?=
 =?utf-8?B?UFNMYzFoSVpyaCtNL2J3UU9UNGlLQXpvWWcrVlJzNkRhenpZTVd5RWU5aEJz?=
 =?utf-8?B?Y0dHR0VIb3d6NG9aTXJQQzVsem5ySzdsMGZGbDhBOVVpZjA5L3dUMW8zTHM2?=
 =?utf-8?B?bTZzWjdVQTlGN05XN01jNDNSMTc2VjBDcXEyYnF0MVFNQnErZUE0YkJ6N2lx?=
 =?utf-8?B?TlBFbnNwdjhSWUpKWVg2d0JSTUFwS1kyR0FtUWdNSmZPZzdieHNvdnZkQ2pD?=
 =?utf-8?B?Zkt2OTVRN012eVJTRlo2dmE4M3lRTGJ2eXErLzJic3JvalZTenVEKzkwcXpC?=
 =?utf-8?B?NjUzRWhJT2dSbkxlbFNJeVRUZHNRc3k3T3lsK2c3QUlaaDVlaldhMXhGTUZz?=
 =?utf-8?B?SEM2dm9FZUEwWTg5Rm5rUXpnZFZNQm5kVzhoMXRnR2dEckVmVUI2TUJ2Y3FB?=
 =?utf-8?B?Vi9FSC9CbTdBcW1XZUtGRXFmN2pyZ2taYkl2dzI5Z2QxNzNzRlJFLzV4a0NW?=
 =?utf-8?B?S0FqOWZ2OTEzNlhTVUYrUDlTY25PWkVrRlp4aENSTlMyUURrS0x3eDRXSVYx?=
 =?utf-8?B?cEM2L1FzVFdJYUhBOVFyTGFkMUltbWZZcWVidm13M1B6NFhHaENqOUlIenR4?=
 =?utf-8?B?NC9ZYWZFYWloTW9yYlJyRmZvQWs3dmZEcE9BNXRHaG03eU1oQ0NxZGJYZC9R?=
 =?utf-8?B?anZJMGMxQlJ0U1hpbkR4TCtKd2RwV1pnVDFtTDZMbzlzS1V1cU14Wlk1eDNB?=
 =?utf-8?B?MnNpdHBocGlGY3ljcEJtcXNtTWFOdU5mZm5ZWjI2UFlCUnFYcTFybDRZWVkz?=
 =?utf-8?B?MkZoOEhTUmFZdHpRSEtCVWVSUmgxNUYxVkVNWWR2Z05zVHd0aU5STFpaQzV2?=
 =?utf-8?B?VEF4bW5oMEJZQjFkRnQrUThYMFNsbWx5UFJMbWFkZnhpWjJkd0Q3cXBqa0dT?=
 =?utf-8?B?WFZSblpVTkwxVG9XNmptV0s2VG5iUjUrbjNwNy9WVzUwWEdZcXdSTHdScFpo?=
 =?utf-8?B?WWR1Y0dsTy9vck41aVg2WWtOUVJpWDJxUEZrbCthZ2NVUGdBNitDdkp0bzg2?=
 =?utf-8?B?OFBac1RWYmhueTI3M3lCUzhhWmZ4akdKN0dZS2JKcHdIWGc4NnRGVDlBSU1I?=
 =?utf-8?B?ZEJDelhtUFdVMWpiV2RGbnFYTFRDb0dnZklXYnZZQ0lVTkdKMW5ob2k1WE5F?=
 =?utf-8?B?djR5K21VM1ZmUnZGdkdKZzJIaVNKVVZkMjkzc2xQQlpueWxRb0dsNW1jZkFo?=
 =?utf-8?Q?oQlDmuIaD9kosKz4JhTgsuje8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66983fde-0018-4a3b-2a40-08de12e23d4e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:46:43.5309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlnH4GRytu+66CNaB/ESnjFsEMlroVmRM171KuHcHTvxKUMLYW+avn7jRsxSnbTX5KAU+rB3U5s1qdKs8PDlag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11361

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The ISI module on i.MX95 supports up to eight channels and four link
sources to obtain the image data for processing in its pipelines. It
can process up to eight image sources at the same time.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index f43b91984f0152fbbcf80db3b3bbad7e8ad6c11e..eaab98ecf343a2cd3620f7469c016c3955d37406 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -23,6 +23,7 @@ properties:
       - fsl,imx8mp-isi
       - fsl,imx8ulp-isi
       - fsl,imx93-isi
+      - fsl,imx95-isi
 
   reg:
     maxItems: 1
@@ -49,7 +50,7 @@ properties:
   interrupts:
     description: Processing pipeline interrupts, one per pipeline
     minItems: 1
-    maxItems: 2
+    maxItems: 8
 
   power-domains:
     maxItems: 1
@@ -109,6 +110,29 @@ allOf:
             - port@0
             - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-isi
+    then:
+      properties:
+        interrupts:
+          maxItems: 8
+        ports:
+          properties:
+            port@0:
+              description: Pixel Link Slave 0
+            port@1:
+              description: Pixel Link Slave 1
+            port@2:
+              description: MIPI CSI-2 RX 0
+            port@3:
+              description: MIPI CSI-2 RX 1
+          required:
+            - port@2
+            - port@3
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


