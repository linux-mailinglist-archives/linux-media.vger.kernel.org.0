Return-Path: <linux-media+bounces-25691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8046A2972E
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90E6418868FE
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7331FC7DA;
	Wed,  5 Feb 2025 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ex4hgvlT"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013011.outbound.protection.outlook.com [52.101.67.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08331DE2C1;
	Wed,  5 Feb 2025 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775966; cv=fail; b=Ke5YmleRDZ+RUIusJyytpNJ4+kupRDOcD48aa8gKsKaep0FjEg/QOOlQ02yVs8ofizyr9UTUS/FV09Duglw2AwJUdJH71oxRGiHu7NittQ0y+ZuGck8TEG9uH69kLWwBMXK6t6/D29s6LWpAj9OCD6UQ0BmTsHTRI2wB4C/k5aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775966; c=relaxed/simple;
	bh=p2mFK3rrixbWLfK3RyvAeDvNWCApDYWNWpzWTZaQMws=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bGrFrAWr8/N8+QyHTVhwXKPpKZRHY4vdSRpJNGjiHSpSoZ7ixbvXaSJIGwqgetJ+dsozHrH6krUGl51EZQ8RAeXwYjNA9KHku3mWBoWqHSnnSXg7PtRxRZdyrGgXopnnBpRooehsq14c1Ckj6cKmAJvz+GwdkCm+oU7IxH6+EK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ex4hgvlT; arc=fail smtp.client-ip=52.101.67.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsD0WsDXgrs8vKZDpJa/muaJIxUGl90yZW+ZSRFrwD01JpSONLvaSOQVdkvG7AkE7rW1X1sRzM+m6hNzcfSvY105yCEFBD/w/baopicUV8YD30tOED0gRzfM1m5qTtzTtHTvMfSh6747yOQljDpQaM1n7hnm+6LMymBXcMBEDKpSSTVMtP3e1T0G/caO4pbysXsC67GPq7d0yZ36eBlqIl2ZHAA/MQ2tyrcoQR/MEckPoLvUXOqLQnXrnNvzZ69EyHKatFR3CDb6VNW0/BFgKRY/hNwUUxsXBhOYNfm6N4WmsPUI7GxWwt07GSlJGHfIZrctv5KuuBM1sdb6KHYtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ErRgKANYyiRlaJIFLLX1u/qyCJ8Vujgs/MgTgB19Uo=;
 b=Y3nRfA5uTRN9oKFiG6xpFu1qbUZAXxMBvuHUy3zUebelw7YHw6mBTtpR0xq6AyrkNde87itWWI0LmqAgVB4za+ZN+PM+tmlqPP3bHSXZuxPI9tN9lcFy0SoF6HGsa5v9EYswrRhnWmFP4NFRHDLstbE3w04StkHYiqmc2g7BU9yFQq1xNcs9nIW8hGerbWKsvfvQ6bOvhRl5NFSm0+FXbxfmsnQl0iZ7oEJ2vq7JU3YSPL2g0VG8ofVcqMFpcoyzqmdxjd+ef2vf+E8Oe7X7vnpd05dNtJW3Sn8gjnpIfYX3zEtimfSofDgifNF01ZeaV/5+Ad+VxyRZ9lDPvM+uLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ErRgKANYyiRlaJIFLLX1u/qyCJ8Vujgs/MgTgB19Uo=;
 b=ex4hgvlTex3CYUIplAdlym58z/D9Pi1JNxbUoTGRoKrqGyIJbKPSffaDsMEghrTnF1Tj5dn7Y5r18m+5B1FKWk4g+gaFPz0jDvQNrBoArnRA0uvk5FFBSdSN2oWdzycJqS0FHmPFBMSQLyUCr6ToCK4M84b6ZSXAdLajO7fZ80RkhPlE84xBUuMon5siPmHPJFK6FtHtjYvS3CJGME1aGjmkdaAtuXIdiVqy1mfqM/e5cETS5Xe6TvkY/lxEC3QYODSk64+ZW5Sbd8p883JjcTy3p4LYccjMvTBKZOw3g9CdIH1Wfp1InCh3dR/wBzint7HxdVosARU28qOv7b/bhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 17:19:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:19:21 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:15 -0500
Subject: [PATCH v2 06/14] media: nxp: imx8-isi: Allow num_sources to be
 greater than num_sink
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-6-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=2071;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=p2mFK3rrixbWLfK3RyvAeDvNWCApDYWNWpzWTZaQMws=;
 b=a0UrJZvq+LO/6Qo++NcBeQwHkIqG9xprulQLKxkTTYfEn5lEjWMVEezRh+wNfrMWqvpnLt1js
 Z1r4RTWQFByCq6aW9VoBH4t2TScOo4QuG9baxU4RDTVmYk4tyqexRNo
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e44bc53-2644-4644-6fe8-08dd46093b04
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cVpVSzZEQlBNMXpxaXA0dDZPMGxEdUxnc3FmKzVWYnRrTVhDdzF6L1EySzJB?=
 =?utf-8?B?WFhOcFFDc0xsd0U4Y1pBSzlDbTQxbHdqUCtDZ1lTSk1DQkt2ZDM2Y1BmR3NF?=
 =?utf-8?B?ekdTYU40c2g3VXo1eVZUdlk3OVR2TnVoOGdKbjlYQVB4TTNmaGt4aW1weU5l?=
 =?utf-8?B?YzlseFlUaVhOR3hFT2NuN1pIQ1BrbnphbTVWeUJpbGpZRjJRMFVUUlZkZ251?=
 =?utf-8?B?dlpOV2tzZFgzUDhNMWFYbUtLTVh2MXlwTWVSaExlQW52ODA5b094bXNzMC9J?=
 =?utf-8?B?MUYrNlAzNjl3dVNwa0ZEL2NmV1JrWkU2Q0tkUEE0SGRKaHk5b2FOdnExZTNR?=
 =?utf-8?B?ZlJLOTN1VXdYS0I4eGRTUnNkOE9GWEtaak81VHhyOTZLT2h5UVRBeU5JdThl?=
 =?utf-8?B?Nm9pVm1IdmpqMHljM29JOUYyWS9xd2lqamJ3VmphWlk3Z0t6VUxyS3I1Rkxq?=
 =?utf-8?B?T1lJbHNMcVlYcmcrVC8wRnlNd0sxQXhWQ0Ztd0UrMi82bXZVcElrWDhQUjky?=
 =?utf-8?B?aTFaeGs0NkZ5QzFQTUpUM1p1L3RCTFRoQldsZUM5b21xUXJWZWlzd3NHNzJk?=
 =?utf-8?B?S1lYcEw2Rmtvb2drRjlnNzBxMTlLenhFZlQ4TzQ3NlVZa3o2NmhNVytjVGVo?=
 =?utf-8?B?NW9vSk1hS1hjdkkveVJaVzNsaENRWS9ZRmpRVTN2QW9BSml4OCsvbzM0YzJi?=
 =?utf-8?B?YUI5ODFFWldOMUJxa2lQWDRFRWxmRGFXL0d2Sy9PT1lsZnRQOEh4R2ptZUI5?=
 =?utf-8?B?bG9obURqYjM0Z0UzVC9GbHFjSEZZaStPc1BuSDVoREpsS0M3ZXNDZHNMbmxs?=
 =?utf-8?B?NlBtenpzeGVUOVFndjczakMweXI2NVRQT2R4aG1KY3U1cnRGL2JZRWxiV0Zi?=
 =?utf-8?B?N0czWmhkZ0U3dXJsekZOYW1tRDhXMVpsSGJubE5LaVBpUVMyR0ZIKzY0b1F6?=
 =?utf-8?B?WG9jNlZFNDB5N2dORTlhVkYydnFGWWtTOFhjQ2JBbit2Ri9NR3QwL1FFQ2dO?=
 =?utf-8?B?NXFMWUdhUnRqMVlBWUh1MG1iOUtSQmpaMEdhak1SZ0xoM1B5Q3dsVDZxR3JW?=
 =?utf-8?B?YmZmNmlLdTkrVGxlUDFLTlhpK1RpNHQ2TGNKSy80c296SStDTGlmdDFCeTdU?=
 =?utf-8?B?RTl6RjZQdXNDdXdnNEZra2hQODNoNWdmbWdFQi9pWGVKS3ZjYlRVcUhOb0FE?=
 =?utf-8?B?Z2E0ZW1JNVAxK3VjOUVvZVdQaDhqM0NhODhZRFJrVEc0NGx1VllrblNteklz?=
 =?utf-8?B?Tlc1NmxGZk52N1JpZmNqRXU1T1I3Q2k5Qkg4dHIwczZFZHgvcmJpTWxDcE0w?=
 =?utf-8?B?NjkrRlJZdVQzTHY0RUJubUNIZ3FFUkV1SlFrWk5tdCs0UDNCVFd2RTlBNkhi?=
 =?utf-8?B?YUwyWG9BQUhWTk04VFFMZTFmVFRDVnd3TzFqaVAyMVQwVUJlYXM2cVBwUE84?=
 =?utf-8?B?S01ySTFYSkRVeTVKMDN0NEhGNXR5Ui9LUDlLUlRjUEYxNm5kVVdZS1BNMWtX?=
 =?utf-8?B?cjFPVk5EYkVId3ZNaGxWTjNPM1RPOGVxN0JRNzFYTUU2M2k5TS8wY2lqSVVz?=
 =?utf-8?B?MU5UbmUwR3FlaWlSdDNvajJkMWRWa2RCWDFHeG12NFNjUU94MTdaYWV2N3o3?=
 =?utf-8?B?eitXcGpNS0FqMDRhVWlHQjJYRHBsS1c3SjdXa0grUEgralJ4RHBsMS9kYnkx?=
 =?utf-8?B?Z091WWt4bVRjZW1tbU1zRGwzeGFwY0FZQkI2VmVGMDN3UHZlSVRiUkIzblR4?=
 =?utf-8?B?NEhkdkV1TFk3emw3dnNHQUxNbEVjZnF2Z0FZa1h0TXNiYUlxZlZ3QnlXUmZk?=
 =?utf-8?B?MWUwNUxjOWJpYVRQUHdYZEpLckFhcVoyd1pmWVlrNW8vYVdLWTNkWkRrUWV5?=
 =?utf-8?B?akNEY1FpQW4ydW14N2wyUnJ5M0pVOVRMdUxKV2hqVEppWklMWTByM1hJbkV2?=
 =?utf-8?B?VUJBVGlGckVMYWRLNndrSVZxMzRyWE9yNXZOUVVDWkcyekJEaE5SWDBtM29M?=
 =?utf-8?B?SUkxUUp1TmdnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cklSVDNwbnJJNXk4UWZ0eHRvZU9ncWFIbU95RlBjM0lsNWQyVE1SbGw2bks3?=
 =?utf-8?B?RHRCTW1TVzZFVVZ0Q0lhTkQ3c0NKR3NtZjUzcjl4MFhHd01aM1I1UFF3YmRI?=
 =?utf-8?B?dmNkTmJ5Tkg3bVhzMnl0UWtveVBEQTZFRUFoczhxQ1Y2Ry82TUdlUmt3aGYw?=
 =?utf-8?B?NHVTNU1Id1MvTnFVZUtILzJnc3l3bVlXNXpKTG84MGRvRytva0UwbDByR3pV?=
 =?utf-8?B?UEZycFo4OXZtRldjSFRBMWJEUFh3a3E5WTg3ZU5JeW5oYUlSRkp2UURnRGxu?=
 =?utf-8?B?SVBFWEdkTEVvdzJ4NVhXSjZkdWpNbHF3TzAwc0tFRXQveDI4YS9RYzByNmEy?=
 =?utf-8?B?cGJnQnY4Z01PcURCcUhSRG5IQW1jNlZ1WkhlYkxHeWU3K051Z0xCRnQ2b25H?=
 =?utf-8?B?VURTYVhCYk9PVUVucU1maWxoci9hMlhNQ2hZSnJuYnhSVmJuMDZKVjZoS3Rj?=
 =?utf-8?B?U1lmdnBSYjNPVE1nbUx1anNrSnZPa0w0WkRteFlHamhpU0o3V09nTzBaUmJv?=
 =?utf-8?B?VkF5NVY2MmlUS3lHVzQzbFR6dnVuZU0wY3E3OUFRek4rRkNXK3JpQWNpdXZT?=
 =?utf-8?B?b1lRZDc1YnpTNVhyRlFGd25hT0k3bGkzSFl4R29lVzAzV1J6Tm5LWHlSUkZV?=
 =?utf-8?B?dlp5eUxLTDdmSkEySUNNc3A5dm5zV01RVEttWlQzVGFsLy9uV1ZiT1l0ZElu?=
 =?utf-8?B?c2s2UTJ4R0RBN0liUytReEVhQ1phK2p4NHVzd1hNeTZabmNmTldBWkltWDBn?=
 =?utf-8?B?MlRUL2R6WkF0TDlaTU5yYkdETHlBd2dXc2tFcnRqbCtFQWc2VkppY2ZlMU5U?=
 =?utf-8?B?bXBEWWUrN0tmekMzd0JNMG1DS1FNb1pnR0RtRHZBWjc4VllYRWFFcDM1TzZH?=
 =?utf-8?B?RTVjWFgzNzRoQnFQWDA3NjNvWXIyN2o0U2I2RXQrTzU4TzFNOG40c3BUblEx?=
 =?utf-8?B?aUpBenYzN2NPTG5CZGhzeGJSdVM0akE1d0YvcDhjcnRMejZBR0p4b0lVNSs3?=
 =?utf-8?B?YVc1c25HSlpkeVVJekVKK0NDZUVtREJUa1R5dnpQeXIzc0Vkd09MWGF4b21t?=
 =?utf-8?B?aEtGekIrTExzZUsxc3Q1RWVGMEFnQTM3TEJtM1BsM3RWc1R2T1ZCOHpZalhk?=
 =?utf-8?B?K1JHWjJzcmFjVUxnWk9TN2hDcDhLYWl5UUdoS09udzBJNTQ3N3pNM1V1cnlN?=
 =?utf-8?B?V01NVVdwRDBNL0w1a3hvQ3MxNDRYa0ZBbXVSQ0NuQTY4QUEwemZaeW90YXdt?=
 =?utf-8?B?RzBIY1AzRmhmZFBhNWhmUVJzaFpJY3NRdVBHU2VoTHk2b1JRQ2M5amdPTjRN?=
 =?utf-8?B?TW9ZQUhIS1VuTnV5dExFZFVFTXd5OEJSZTZNd2l1eFpBQkdxNWxKWGNSOFo2?=
 =?utf-8?B?ZjBEQ1U2NkZ1c2UveFRiNHRZUXF6ZFkxTXJDME1ySVZpWWE1dVhjeis5ZGxC?=
 =?utf-8?B?TnVQYXZVc2RqTHB6RGRQMURFaHk3WEVabmRGb0dBeXNTVEZ2ZWVzZG9kQnlV?=
 =?utf-8?B?UWFrNW5nSHRDWkJUbWY5Z0tiazVETHFNT3JRZlgrUVFRSjF4bXhGZmFTQzlJ?=
 =?utf-8?B?QXNkWGJwcVNrb0RBSm5abi80U0xJQ1doOEtJREd5TitnemtKM3hUajhOZEpU?=
 =?utf-8?B?VWZyUTdyY080bTUrQ1ZsaW1yQWMxSUdBZGE5M21NMXBJUUVuZlp6ZUZ2Yzgz?=
 =?utf-8?B?V0sxaFV1Ly9SMVI1MGdkN2Q2azAzRTBBZnZacVVPK1R0eEl0WitWbDlESFFH?=
 =?utf-8?B?VDJwK0c1QVZuSzNwOGxjazRidm1lSkFYT2E3V1hid2NJdmtvZktLc284THk2?=
 =?utf-8?B?SUk0NDBabFVPRWc3NklXMGxaMDBzRFUyOVNDSCtkNTVhY3BHLzEzZFBwWHFm?=
 =?utf-8?B?QitQd29FWkdyby9BMUE5TnpycFQvZTJHN1NqTjBWL3I4a285ekUvS3VORDRm?=
 =?utf-8?B?SUdJcFBTaWJnOUkrTkVHbHFvdGhIblhUa1ZSbnNYakpkT3JuRHVlZ2ZvM1hp?=
 =?utf-8?B?RTU5K0pEa0FnZTNwd0NjMVZtQ0NZZzFEOU80UzdNZE9GVndXYWdic1AzMzMy?=
 =?utf-8?B?WmFWdjgrK1ZpcjlOMWJ6V2NhTWJ1SWNQdGQwVldwMTRBejB1cC9rQlF4TTU0?=
 =?utf-8?Q?ELRtZfvRT7hXDm+vicW7ITF4Z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e44bc53-2644-4644-6fe8-08dd46093b04
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:19:21.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdPwowYwxIrai2JwbrFbtE7Pck2b+/eAIloonwKtK+hOkdkBvHXwb0myUEPYNV678YT1Qw4pWMWPjwg9YvUm8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

Allow num_sources (drvdata: num_channels) to be greater than num_sink
(drvdata: num_ports + 1).

ISI support stream multiplexing, such as differentiates multiple cameras
from a single 2-lane MIPI input, or duplicates input stream into multiple
outputs. So num_channels may be greater than num_ports at some platform.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- none
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd173..ba5b2d3617a23 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -188,11 +188,11 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
 	 * Create a 1:1 mapping between pixel link inputs and outputs to
 	 * pipelines by default.
 	 */
-	routes = kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL);
+	routes = kcalloc(xbar->num_sinks - 1, sizeof(*routes), GFP_KERNEL);
 	if (!routes)
 		return -ENOMEM;
 
-	for (i = 0; i < xbar->num_sources; ++i) {
+	for (i = 0; i < xbar->num_sinks - 1; ++i) {
 		struct v4l2_subdev_route *route = &routes[i];
 
 		route->sink_pad = i;
@@ -200,7 +200,7 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
 		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
 	}
 
-	routing.num_routes = xbar->num_sources;
+	routing.num_routes = xbar->num_sinks - 1;
 	routing.routes = routes;
 
 	ret = __mxc_isi_crossbar_set_routing(sd, state, &routing);
@@ -453,7 +453,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 	 * the memory input.
 	 */
 	xbar->num_sinks = isi->pdata->num_ports + 1;
-	xbar->num_sources = isi->pdata->num_ports;
+	xbar->num_sources = isi->pdata->num_channels;
 	num_pads = xbar->num_sinks + xbar->num_sources;
 
 	xbar->pads = kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL);

-- 
2.34.1


