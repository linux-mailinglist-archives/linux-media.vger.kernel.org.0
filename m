Return-Path: <linux-media+bounces-40675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFA1B305EB
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30495AE245B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F67362987;
	Thu, 21 Aug 2025 20:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D3m+NyfW"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013069.outbound.protection.outlook.com [52.101.83.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F98262FCD;
	Thu, 21 Aug 2025 20:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807487; cv=fail; b=AWzG00YLAVTSmGpApRdNLGerRHsad42m8eotdA1fRK7K6Gg9o0LIsZA6CrU2hh5Ob+OWg7tj020NOoOlmd05NAkfTZuP25VpHQUhBggiBIwXNhwSVtf8gaNSX0lAqp9wMA/eCXy+/A77ylgqQMxE69J83rdNRifPi/k8HdYU9Fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807487; c=relaxed/simple;
	bh=2vIy5GI9hRffZcYVtcT+Hxhcu2BEcjfjbHQJMMuqq+c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DCVTFEgBlUkDeNw0cRXFr43DoOoIYNNWxQXuTq5p7V+wgP67Q3kGcKjgrpwomG3Gy9wL+h4IEFHB7soGqM2+PhXtaz5FNsc88L7dF2uRzZ/E46BHw1gDktevrx1mZo81W6haGEcC+Pp4palSxgObIDDwS0p/1OMcajUS50UVBFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D3m+NyfW; arc=fail smtp.client-ip=52.101.83.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdajUEO/b7moGcqinOkItKI6jR9pI0ycSVzqFfXBVDyC0Yjk91io7q39jYIewjGejzxEnJhUCUVIe32SkyD6Gj6YUPlvhb52n1Upfm9EoDaOBoh1Sj7/VcJxa/mHhvjB9eJlPCIxsyBKRndmYmRyEAUJfXTGVtbQ9Yfug037cHGgTuV/tIwIqwf3f8rmHY6qfSxCv3dl6969wRXfjCtHy/bXxDFWbL0MJyro3kAilvVmVijbmQN66x0uE4Dv/BJBnjL0ugOSkraseonbYCEvO/8eaxCDpI/tgQDoMJDCIYdT9ML/YRJys7PnIb1KwPDUQ6CFrWnmYh3k7IXqlOUc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnc5YTevDrbM95cf7VVkH2mnOjJBdKjMQ86+i9lZioo=;
 b=ezaQCNGsw3KcFYBfOnsMTE1dDdEA5y/MJ7yqlhxb4YgTylF7yGt0xL0UIVCiiZcxqiUZZLgaamN+Nl//Rk6Xa8sQgKVhCKZQYy27+mVs9Mv6udIhFyWbX174+M+y+nZ0kk0+B2nKbbBPzbjDNddieoygI+mQNwzp080FoxqWbtPUEd1NC1KmnvOKZYGd26a6b8YAU3LXe/fMxAAmJEBeVHuMP9fEB/Ic2bFIIh8M7adV9x43Y5XHt9ea5s08gZ8ygC4cW9wRo1f56LC0e9v/SCICUHHF49j+qgPVl2WCEH+ACLjJ8eXT4Pb7xMslfwx9rE1eGVpdmClByftZBJM03g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnc5YTevDrbM95cf7VVkH2mnOjJBdKjMQ86+i9lZioo=;
 b=D3m+NyfWDaV/vNCd9H3Oes/39mG2fIuktuurQPr9GeH4roezWOb6xBMal2nYnO7kocGKzJ3cmH54yfjFPWARmll5R4lZFBo8yulheok/bJi5TDxpk4ctp+KO4pmdH9k6sHy6QvbCtfI6lUxstWegmAMmzIrCGKm+v3XyONx2XXqMaFnr+bSYZhb+7GxkFZtBUjMs8qtren9xdi0TOMZKqmi8IoXXTSJzDbSCjMtcJNvwtpwl8CRu9aPWukOkD7aWIqBtWH37otbliPDAhiNTK0l6jjhzOTxUNBqgedARG6ecy7xBrBZa7Opj5rusGjPHQ0d7dTr6dCt5u5MrrLf/EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:18:01 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:18:01 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:53 -0400
Subject: [PATCH v3 18/31] media: synopsys: csi2: Remove deprecated s_stream
 and use v4l2_subdev_pad_ops
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-18-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=2902;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=2vIy5GI9hRffZcYVtcT+Hxhcu2BEcjfjbHQJMMuqq+c=;
 b=xtm2pE2lC9y6rl4SbKmMGupN1bXh2+KfeL46g1hR9oH7AYn7xl3zTzJDy8Ljycgkovrrl9gpm
 KAg+SChIyyjDWIhZZeN8E25E+QRB15Ncq1hkJLoaEvjLbU0mQIJqZ2c
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 750783da-9108-4bdc-2099-08dde0efd422
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dEpKYjNjKzFoSUhoVW5CV0RwM2h0MldXTEpCdXYvb0wrLzkwOWErQ1pUUllM?=
 =?utf-8?B?a3g3bGRkWndzdlhJOVRFQlozZHBSY291Q0EvTnRCSjI3dVdKZ1M4TlQ5MUJ4?=
 =?utf-8?B?TnV4U2dBME1JeHk3eEpmMG0vTXlqbTlNZDdqWjdQdG1QUlUxK1BsYVVlM2d5?=
 =?utf-8?B?cE5mNWxhUHVvc3h6MVlzcWIyMG8rK1FKRGErT3N4dUdrM3FMUjFlK04rc3Z3?=
 =?utf-8?B?bFFTSDhJTW9INXdyMWY1Rkd3UVA2bHZHc3Z2Q1V4aFduV0ZLQmh1blNBeGo3?=
 =?utf-8?B?ekpoWFg3cmU4cWc2NXI2MHIyckt0azJHY3hDMGRqbmd1OFJFaFA0U0JWWnp2?=
 =?utf-8?B?QWxzcExqbk8wbHlPekdBeGw5SW9ieDZ1ZEI3U1dya2RUYjdnRGR5b0NSZWpY?=
 =?utf-8?B?MmZqYTEvT1NjVkhaNUhoVTRWNXovVTh6aDE1cnpXR29XL1d2SE5XUjRselpW?=
 =?utf-8?B?Y2FWMVJZUWFLcS9yZk8zbUNSK0dSZVBqQ1B1Qm1lRm5lN2czalpZSjV4VzNM?=
 =?utf-8?B?OHdEdUZpbXU1aW04K2Uzd3pYOURrV2lHL0VwNDNPa2JlN1QxUEdOUGpxam0v?=
 =?utf-8?B?SHhTMjM4VEkzTGU1MlRwZ1A5a1c3MW0wWUtoYU04UFZuZUxQSklnL3JKaDRB?=
 =?utf-8?B?MDZlNGRVbkh4TG5lN3dWRW9hdjAzdmI5clV6NDk5SnM1V2thVGwrL25GQ3FB?=
 =?utf-8?B?bDloWm9BNkhlZkx2elZydEtLYzdia2h0eVhESmtCL0U1VW9MM0hQaTRTTjlN?=
 =?utf-8?B?VSszMjhsZlo5dGpsZUN1b3lHT2lvMXlScmR1UGJRdzl0b0xFUVV2bVZuRkFt?=
 =?utf-8?B?NWQxdnd4SkFaN2l3bEVydXNVM1JBR25ySVczMkdEUVdrT1BIaXg1dkd5NDlC?=
 =?utf-8?B?QjFzUUtBRkIrdGN0YVRneU85blNkczAvMng4NmxYQWVuMTU5V3owMGdwTXFU?=
 =?utf-8?B?ZHQ5SGs5a2F4cnRtY0JmTXVVYnV3c0pCL1FNVGwremZJNWxCbnlLVU44SjVx?=
 =?utf-8?B?dnJ5TnJkUzVYR2dWTlh5a3NQS3g5Z3R6VWhkM3cwZ24weitFWXJUNFUxcVZY?=
 =?utf-8?B?bUJDbXFrMytNcmErblVvdWgwaEJLU1ZvUm80c09ZM0xMVzU0djc5V3NISXhW?=
 =?utf-8?B?S3M5UEFxTjR1U0xTTnFYdVl0eWZuWEEvVTJWMkp1cDF3RmFyRHhSUVRuZWQv?=
 =?utf-8?B?OGgxYVpQK2dJMi8vVkh5WTRxZ1dvdWJBVWYvOEZKelE5RGVkbnhjK1NHS0xj?=
 =?utf-8?B?Vi9oNHNvWGpJaFdMeEh2dlkzVjB6QzlnTzlqemFqVEhnWlNDcmxJL1QrNVRn?=
 =?utf-8?B?bVo1TGJMSEFZZFh5UUdsUWpacE45cC91N0krdnhqYmNkMElqeXVlYU9iZThj?=
 =?utf-8?B?ampaVEg0NmJFRC8yd1h2enorR0tHQjdNSW5pdGozeDd1MGZiMVFyemJadEp0?=
 =?utf-8?B?UTBIOHZrNlcxSWFrZFNjU3dFTS9EWU9tMzRMYUJrdEoyNUtUeGI0ZGRnRUgr?=
 =?utf-8?B?ZnBwZWtYNTVwdldPMnpZVTB1czFramFhVW4xNHVWMHRuaHZSeTFQeUI0enFv?=
 =?utf-8?B?TzNkZ0tkQmNpbkpZWVpDQWx2UnlKRDVOL2o0MDdiajJuRXVtOGEzRnlad1Rj?=
 =?utf-8?B?d2NWS2wrRWh6ckN0TVVkVG5oMy9obmJFcnVhRm1FSWsxTHkyWFc3eCtkcnc1?=
 =?utf-8?B?dE5rSTNzT1pMQ2ZiMGxNUzlPZ1g0OGlYZWR2RjlUUjJGT3daWVZTVGNpSHlP?=
 =?utf-8?B?MzhHN1JXVE9xS1Z4ODBCblhyeFBRaFpEalRjZEF1clJhRzVOUVJXTHR1SUpr?=
 =?utf-8?B?WEdPRG1SVGd5RjQ2cFJuRlZ0d1hBSTllZnZvVkUzYkhBdEZPNCswaUZDOTdY?=
 =?utf-8?B?NEZHa2RqTmlrKzFpZEhXUW1tdVlaMElTZ1A5ZktZTWpWR3VZSmg3cDV2NWVL?=
 =?utf-8?B?WG1teFhTa25oekc3TzJtWjhUYWFpSUNvUWJGTU05UHJ2VXFraEFzbnJ4aGd2?=
 =?utf-8?Q?HXpiCCogpAM5Pj+HHyQUf+3gvUGEkY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MEN2VS9uQW4ybU9PYkV4T0ZaZXJuaGhkUVV1UnpoM0hzR3hvaC9oQjhteEFn?=
 =?utf-8?B?RTFFTlJPc0g5MWMzWWYrbGFCSjJ5ZmxnU25xdzgycEViVzA4ZkR3MlVvd2RQ?=
 =?utf-8?B?VGhWL3FTTkN5Q2NtcHl6WW1QaG1ubktIcGpsT2pHb1BWWlE4N1lWcXlXL0F5?=
 =?utf-8?B?MitMak5nUUFwb2tQdjliMFl0SEt0SE84ZDRXMU9wRjcwKy9XeDdtajBNcVhT?=
 =?utf-8?B?SVJEMmRyeEVvNnJLdllLWkFwT1VVNW0wamI1RzdwTEs3dzJnMlZWdVhTKzl1?=
 =?utf-8?B?SVk5MGNSenNQcWZHOTBBYUJnT2lOb0d5b0dmQk9BdlRCOFFDdHQ3VTFJZWZw?=
 =?utf-8?B?YmVKMGRzSDROQzJ3Zzk0RFZKRlNsQXBBMExyVWl2eUVTY1FwUmpNemEvVkgy?=
 =?utf-8?B?TVlFNjRFeDZjekRValNSRUZMY2ZjWVpsaVB1c2RycTNPYlhacG1ZaStyaCtF?=
 =?utf-8?B?Y1dnZXozV2tEOWNxaU1aaUU0Z211TEdOWExPNzgzZnR0cFZKdzNtUGJvdG5C?=
 =?utf-8?B?dTFDSWNvWVNHMzZVUVZMdjQ3VXZyWWI4T3BEOUlUTzlQMTF6ZERQakJ1MHZS?=
 =?utf-8?B?d2J1ZU1WbVVadUVsVUxmakh2NzBXckFTdzNZZ3BOd0RQb3JQalBFNXBmREJU?=
 =?utf-8?B?SzFvbGRMYVAyQU94UTlwYlhxaGJsVXdKenRFTmEzWXBQWEw1bUpmRFcvOE1s?=
 =?utf-8?B?TkszaEFOVm93eDhOK1VwYWdSZzRYZi9WaitDRUQxMmdLbk5SV0hCMGQ4T1BK?=
 =?utf-8?B?dm1KSEdIbmx5NEV4ZTdqSjcwTDNDQTYxTUk1NDRqNFM0TExRZFgrOGFmbkY5?=
 =?utf-8?B?bGpMMGt2UFpJaEsrUFBpZHhmdTM1Nkxwc01FcFhqMHRrYjdtcFVkb3VaWlRT?=
 =?utf-8?B?cUl6ODh0REY4YS9qeTdhYXUzNW9lQit0UnBzY3grVkdWZ2JySVZ3L0oweUVK?=
 =?utf-8?B?NytPLzBndmxna0JGSkdqUkRSeU9NTStaRGUzVUVmQmowV0tTNENxMytkTVQ0?=
 =?utf-8?B?VFRRZHBUTWlLMmtoRWVqR0VhV2ltcFk5cHpKNHJKeTNVUGpac0I3ZDl1cWFQ?=
 =?utf-8?B?RVI2cXRyT0xKTjRDWEF2eGNZeTBkeFF4bGJXa29JbWN5VjYyYjVKbDZMSkZx?=
 =?utf-8?B?TGE0TDcyYnM3Uk1MaUN5SDNxQmoxeGoyN3JFQWRMQTdjY0s2ME5oSGFBMDZq?=
 =?utf-8?B?aFNVSXFVcDJMTVQreVJ5djhTVExFc2FtZjVhd0NjTVd2Und3bEdLcllHODJ3?=
 =?utf-8?B?T2puMDZPYkFFb01jRlVrMTFxaDFobUpUREoxYmgvcFJwR2l4TS93N1Z0NnRN?=
 =?utf-8?B?RWtPSTZlM3c5anp4WGVicW03aThPS2NGeklLZXZCbjFOSE0wYUwvaVpGMVVU?=
 =?utf-8?B?NTlxRElvUUNvSHlzczVIYXU0c1BaZzcwZzRzZnFZT0pGMy8wd29ER1RtdUJr?=
 =?utf-8?B?WSsyRXdTN0wrb2QzUFNaQUl6TkM3UmNRNlpDSHBlRWowcVUyYkZWbGJHTVlM?=
 =?utf-8?B?SE9pNjRMRnRpMEFMaDVSdEFwL1g3WjMwWVZTSFFEUWpUNi9OSnlxRFpLWSt3?=
 =?utf-8?B?M3BFeGg5ZVJ5VW9rVGRVbVhYdWIxU2k0RFlUSWg3c1FUNlRCWkNqbU5tYlRC?=
 =?utf-8?B?SUs1U2Q0MGdkbEo3M1NyWGlGemJ6WXprSm9KRDY0ZEIwWFFYbmN2UW0xa1lD?=
 =?utf-8?B?V2JrRmZOOXcvV3E1c2lwRTk2dm56Q0Q0MFkwcUZSNGdPbzVVSHJadktIc1E4?=
 =?utf-8?B?L1dSVzlWZ2hva0dqd1dEUDR3enRZbVoxblBLU21KYWdKbnZsQ05XVjJEekZ2?=
 =?utf-8?B?cGVTZERSSXc1OEtwdGd2YjdUbXFZTTZXNVgzaFQzT2lWRGpHbmp1bWVlRERC?=
 =?utf-8?B?MVBWZGMzWGhzMXA3R1pYVDJHbmo1OTN2NTRhLzk2Nk1qTFZ5bUVjcmE2MkFJ?=
 =?utf-8?B?U2RNY3lSd29UeFJJM3BZNVp4TDZiWUhtZnBudktOUFhUMkVtaHo4VzNCc2dR?=
 =?utf-8?B?NTI1RlRuYmk4S2VGeWN1RzgxSWcyRld0NzNXTUhqOFFsTUpMVm41M1F5L1Ar?=
 =?utf-8?B?TmVEbjNhbkNJNGFXSEh2MkFtOVBPaE14cWdjL1I1bFdJMllTcy8rM05rMCtr?=
 =?utf-8?Q?TIcA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750783da-9108-4bdc-2099-08dde0efd422
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:18:01.8738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mWXyqdUyc2x/oSWmvM215UdggrxrLwr5+ipi/8r7lNNl0O1Pjy88+pq3gL3n8DL/gfGIpuUNZvIyeEI5ezMVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Use new v4l2_subdev_pad_ops.enable_streams(disalbe_stream) replace
deprecated s_stream interface.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 52 +++++++++++++++++------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 22e0021fab17f3c8e9a6c41c2f2109f5112dd6e5..922b59670383db7c920625f8a149009fa4dc5f22 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -342,7 +342,9 @@ static void csi2_stop(struct dw_mipi_csi2_dev *csi2)
  * V4L2 subdev operations.
  */
 
-static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
+static int dw_csi2_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	int i, ret = 0;
@@ -359,28 +361,39 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 	if (i >= csi2->num_sink_pads)
 		return -EPIPE;
 
-	/*
-	 * enable/disable streaming only if stream_count is
-	 * going from 0 to 1 / 1 to 0.
-	 */
-	if (csi2->stream_count != !enable)
-		goto update_count;
+	if (csi2->stream_count)
+		return 0;
 
-	dev_dbg(csi2->dev, "stream %s\n", enable ? "ON" : "OFF");
-	if (enable)
-		ret = csi2_start(csi2);
-	else
-		csi2_stop(csi2);
+	ret = csi2_start(csi2);
 	if (ret)
 		return ret;
 
-update_count:
-	csi2->stream_count += enable ? 1 : -1;
-	if (csi2->stream_count < 0)
-		csi2->stream_count = 0;
+	csi2->stream_count++;
+
 	return ret;
 }
 
+static int dw_csi2_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
+
+	guard(mutex)(&csi2->lock);
+
+	if (!csi2->stream_count) {
+		dev_err(csi2->dev, "Error: csi2 enable count already be 0\n");
+		return 0;
+	}
+
+	csi2->stream_count--;
+
+	if (!csi2->stream_count)
+		csi2_stop(csi2);
+
+	return 0;
+}
+
 static int csi2_link_setup(struct media_entity *entity,
 			   const struct media_pad *local,
 			   const struct media_pad *remote, u32 flags)
@@ -507,18 +520,15 @@ static const struct media_entity_operations csi2_entity_ops = {
 	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 };
 
-static const struct v4l2_subdev_video_ops csi2_video_ops = {
-	.s_stream = csi2_s_stream,
-};
-
 static const struct v4l2_subdev_pad_ops csi2_pad_ops = {
 	.get_fmt = csi2_get_fmt,
 	.set_fmt = csi2_set_fmt,
+	.enable_streams = dw_csi2_enable_streams,
+	.disable_streams = dw_csi2_disable_streams,
 };
 
 static const struct v4l2_subdev_ops csi2_subdev_ops = {
 	.core = &csi2_core_ops,
-	.video = &csi2_video_ops,
 	.pad = &csi2_pad_ops,
 };
 

-- 
2.34.1


