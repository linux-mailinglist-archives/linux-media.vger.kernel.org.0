Return-Path: <linux-media+bounces-25503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13559A244C1
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67CAA164967
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1E91F4E4C;
	Fri, 31 Jan 2025 21:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dAZcDSYm"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013025.outbound.protection.outlook.com [40.107.159.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419B21F5406;
	Fri, 31 Jan 2025 21:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359274; cv=fail; b=dei5Wmh7E3EGH+4D3ubjDIXeCz2SFNtEf3mDjPqQcAEdaRa4MYKWYU5Gk0kKGlcN7nX6SJ35OT9p2xePHtVwB0AhXDmyioe5XkBMFTJ6u2kxpzunEV1c69N4uzZO6aIjsoM1szGQiiCsgG/H9TFRhJi1U/yEmI64F+kzT7tahH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359274; c=relaxed/simple;
	bh=sf0bHrBQSWPQzkKdYLRb2ZK/LLSyYvMzMAD2iXxbi9E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Mqy70ZRdo2Rpcdc5RY2kiSJuN4elhtQZZQPuMZjy38R+839awG5oyu7a64XnhawWgEbc3fZnCgfXo2fh2dRWeXTFVd0KX4hIcGqIPmJ5ONaUu22CjE0RwAM1zqT8VFXqd5V948TSkmC4KhgUmscV7J2FCjM7nfGnhrHxK3Kp0Js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dAZcDSYm; arc=fail smtp.client-ip=40.107.159.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/gQwns2Idkd6rSJXkSLFqkSGeT4hi27Eo0djSX+fibJ4DUXWwIIJ/ZAJ/7sjzDkEB53ISiHexMVcnUhQSNy83PKScpL/uBAIuVfaFgkP3RWhFTuxLgZ8s23Sgd9wn+kErhfKzoWPam5KtbsOOsRW8H4gqpU+tzM2rMf60WiAj0E2sRjruqwuHXrK3XUZuMUSfBWV6GMNz7KzQ1dw1/+WaAUPCztUqJW2lBR6xi7U32WRlRkibBqe0DuC3MOdxYEWpgl97m+7iIVSl0eSYcvqVL1+1j+ScmRTCSTFcNJcuxojjhIIG8hoUiHYPfRp+TtJenWrQg5BW+Zw3elHMv0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeNODSpC8UXf68tNpYXn5m+o4IdQb+bs5eGymmWYVJQ=;
 b=heazZvp671XPDXAVTlXt4B03uG2hSStux5/0R69DU9RDJu01iFZxTazs3o8mHYfmAlivMswKxPficoyN7cPvROnMHV+Gm2PEnP3ZCxBiVZ3SiiApb+ftUWHG7wbWE7bBILE0/QkXDIQJaWDpQD9ktAp0F76228Xn3OO7fvqhfXxubuFWMXweCeyc8jDHypoQsxw3I1GmnH4n5BdO/7a0o77xPLSBDPiYg46EtS4Y5WCXQz3KuLyIYQLJ1RHgORoLUdZ3vqQfBY9d5hHNSGNJNYjOdLnlWkhpabmW51mOSiPmidYSQ4hf0qmveGd73AiExgYoSMTQywTkbo8wcmCWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeNODSpC8UXf68tNpYXn5m+o4IdQb+bs5eGymmWYVJQ=;
 b=dAZcDSYmq/PplIMCTTcLLCWV/N46z+Chs7tPOdx+mLg6YmgBhgcLjqPW4MoBVD3c0Z3eQRwfXSM+Ss4CoKbl52rOkourL/aSc6Lcbaue/0TkkBv7JX/tsCcmmFF12Sqy3tMx9bLcD6+BgDoUoK68BBnpmq92+S2AtpgzrmzBODGtd0tkGun4PRpEWAmds9fgfSgD2RLk6WlD25ftZdQRnfmO3MWCOR5+QNwBzMdv8AtWq377wp3gO0xPOSE5VYC0c8B8jvLnFuxCC5wfIe6AZozd4LVWo7Qh8y6OHxYdUkNImZgpofaCnKNfXy1UPmoEFkewSPKbjXwPQEYTMp4azg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:29 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:50 -0500
Subject: [PATCH 05/14] media: dt-bindings: nxp,imx8-isi: Add i.MX8Q ISI
 compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-5-319402ab606a@nxp.com>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
In-Reply-To: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
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
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=4464;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=olwoNKUv2Iz/uV0wReMpTGr1fl4Jzhdfj9hZL2fu/9o=;
 b=MeCK4FEhYjVRft8ZJ4xJW+rv3Z5+mhwjSUs7EdxqW8LDSf1iGh1MDfgZd6ey3i1fho35C71t0
 0eJa6RiNYIcAHu197hSOrOd2dYhoCjMgPrVOev4NijP1jDpcNzhNWI5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ccbdde-b1e9-45d7-93c3-08dd423f0b29
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QTU1cHVUYlZnS2ZxaHM1dEhrenIzbTQwOEFlNG5kVk9XelpVbW9lYkNHS3Uw?=
 =?utf-8?B?aEF3RnRPZi9yNGh2bXJJZUx4RmszZ2o4SWNoQnNjNUFKM3RzT0gxT0ZhWXJX?=
 =?utf-8?B?d0ZaR2xPUjZUN0F3RkM4UENrR3ZzTVYrYVBYYm80NTAzeXVvaUdOTjBGQmh3?=
 =?utf-8?B?bk45dlVpc0djMkpQME1Seld5M3VPSGs1OE84U0RNaVJPc2hCaDl0amRzN3g0?=
 =?utf-8?B?aGZLNjhrd0l1Y2FucWIyUHhFV2xJYjVhYzVJV0FaamZlclNsdk1uSlprb3lU?=
 =?utf-8?B?aE5jL3Q1V0l4L1cyWlIrdTB2R25CVllYZ3hyd2pOakUvTUxwRlZSME1odGY2?=
 =?utf-8?B?TFY4R1FsREIrQlpoN1g4SjRFejIyTVFoTXpQdGZLK1VrdVJhZFQ5bUdEazVI?=
 =?utf-8?B?TFFhNnBDU2hjU2d6M1dZYU5UaHYwa085NS8yM2l3YVJKamM0ZisrRzU1QVNh?=
 =?utf-8?B?R1pUNFZTK3BGWVRMeHhUcE80WXdZc1A1SmFtMkxMamNCM0NWZWNmTStYNVlY?=
 =?utf-8?B?UjYyUGI3VTNvakUxTDYvSTgvS1FKV2JCQjF4MVVtYm1VYWxreEVUVDlHWUJK?=
 =?utf-8?B?YklwRVVhc1IrMXNRZzZSbWtRcXQ5bDZSbC83Tm5OWWxZZk4rWnZ1Z1VuSVJE?=
 =?utf-8?B?ZFRxZEpSRmpWYWlDSnJBQ01JYlo1K1A1TGZ0YnNmVDEwTWZnZ2RGL1I5V2Ro?=
 =?utf-8?B?ZkwyNDBOblFmNDZPOFovRGRzTEV2bVBibDJScEF2Yi9sU0xmemU3ejRyK3pX?=
 =?utf-8?B?VGhhNHpHTzUxcVVDVE5qUXNkcURFNlVBL2lGbUdjOWJYOXFvSmRXUzc4NDlr?=
 =?utf-8?B?VlRqcitaUTcrNndFQmhNSmxIZDRwbm1BRGRBNHcvcEhuaXBvbnZCRnBzb0pV?=
 =?utf-8?B?SCtkS1pLZllRekNuOFpoYTFFY1ZGSWdVaEM0dUVtY3pOd1hwclk1OEdXdzdp?=
 =?utf-8?B?SHpZQnEyQmRvL1JySUZzb3VOSWFaRkRSWUpuMUNCKzJWMXpjRmxqV2o5MnNT?=
 =?utf-8?B?bmthNElDVmdOa3o5a3YvSndmeXI0WFh6NHlnOVJveERyanVQeDQ3MXF1UmpJ?=
 =?utf-8?B?b2JiREd5cUZlNXpCSkdLYWVMR3NDZVFjSGZSclVhRWs2NmlsM0dKRmxBd1Bz?=
 =?utf-8?B?bXl2NjlaeHkyTnc5RDhjSjhDNkxmM2JZQU03Ri82MVlPMVJnUDdtelNnUkNL?=
 =?utf-8?B?THQ4K2VaUnpRdUl1NGxWYnI4SnVSdUlFb0d6THd0YVlDM3VRSDQyajErMXB2?=
 =?utf-8?B?ek11TW1KcE5KWGpPYWFTQy90Z3FHRTZKdkswTFBMSHordmRMeWxEVzF4MkJK?=
 =?utf-8?B?OFQwbUQ2cXBhVkxOdXdzSmJJMW8xZjd3V0ZTWEtIUTBTY1dacS8ycmlBNWU2?=
 =?utf-8?B?ZWxTMjNoQVhUWEV3RUIyQjI4S1FyR3g2djlmK0tjRnZjVGF2SGNOdDJ3am5a?=
 =?utf-8?B?M3AwSDNza0l2N2FKRkgrM1JXSmgzQ25aVDZHcU5kZkJDRFB0MEVvTUx4NjZv?=
 =?utf-8?B?NzJDcWlIOGtzSVF5V3pKQ2tmV0gza3ZXeXVIQThYK0F6b2FmemhGK0daVXEy?=
 =?utf-8?B?R29oODAzdUltRHBrSml6Y1hZYm1IcE93MUFhR2FvVlF0Q0hsZnh2YUpLOXZU?=
 =?utf-8?B?aE5aRGVTN0JlZlFRRlg5MVZ0K0ZBbW9xa1N6VFQ5Qm4yRWpraGdabUkvd0ha?=
 =?utf-8?B?ZnRUQ3pjWDZHL1pUdkh1Z0dJL2l3ZmZxOEMwR1Z5TndMNFA1YW9IeFRpYnRE?=
 =?utf-8?B?ZnJjb1ZOa29NR1U3Ykt2bFJYU3lJZW5VNzNLenV6aWo5SklNamJhcDRLMHVE?=
 =?utf-8?B?VTgzZkZqU0VpVFNXcVlIV1VlN3Q2a1hCN3dVQmZrRWIrNENsOTd2VEpQc2Vq?=
 =?utf-8?B?MExucVAwNjFra1d0YVpsMEhrQWo0N3gva0NlV0Vyb1J4WkJhcUlQWXJ3TG5x?=
 =?utf-8?B?L3pHTC9XdUV3SitoK3l2ZnlVQldMaVZscVJnMFlVaWFGN2h6TGxUSi9TYnRh?=
 =?utf-8?B?NWc1cWxRbUJBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RDR0N1F3bW1wbjRLTVpDTFJWNTg1cUFmbzg2d2tmWWppK2RXYURpdGlRWWV6?=
 =?utf-8?B?Sm9pc0szZEMxWWdTL25DZ0xtRUVYaG4xUEdOSDNxZXRlclNuT1ZRelNLNVcz?=
 =?utf-8?B?aUl0NjdVVFd6NkdKSFZGWGdKV2w5UXhoNUxwSmI3eVBub1FETEZtU1kwNFYz?=
 =?utf-8?B?VnhuT1NUQ3Bwc0lhc1ZlcUhHQ29TMi94QzdsaHNTMCthbTBqUGRINDdlMmEr?=
 =?utf-8?B?Q2FKc3B2Tlh4QlZTUndtaEZhb3lWSnBEeDQ0OEJyTWZPSFJPVEdXN3V2T2gv?=
 =?utf-8?B?NlJNVUVxTit3bG9yN1dWbzA1U2I2RUVseEZRMTkwWG9wNzRVMGFYTk0vOEI5?=
 =?utf-8?B?Wm5PcWF0UFYyZmtaNzRDSUFqWno1aHJCUnF1VS8venJGeERpY2xvWndBREZu?=
 =?utf-8?B?MVdyY1gvczRMZWF6NmNmN1UvOHR4K0ttb0lrNE9abkVJRUdCaExvWkFCY0hn?=
 =?utf-8?B?UFdiTDFnUnJ0NlhZaHJoS0tXUGlMeTJTTzBsZHdJQkliNWF2RXZndWVQNVdr?=
 =?utf-8?B?V1ZzZWFwelFjUlpJK2dkVFU5MnE0dWJFaTZmNlcrUERBcWkycVFCWHl2bjhD?=
 =?utf-8?B?Vzh1WTEwRHBacVdhL0R5ck9oUUxLb3huRHArbC9uT3JRSW9iVTdoYTdVZm9K?=
 =?utf-8?B?Rml0TUJqT3FFVjZYVVhVNW1aVmw3WGhHT0E5YU1vS0RNTW9tclhiUy9hVGFo?=
 =?utf-8?B?RjNreWFLdTFUaUk0UG1kYU5sMTBkclNGSW5vakZ2b1ArUXU4eWdEOWlFN2J4?=
 =?utf-8?B?endRS0M3VlE0QWJQanBNclFLSGthcFBMWVZPUU9PR2FDV0lJRk92Qjd4MDVj?=
 =?utf-8?B?aXdBZnNwaVVWY29VK3pkSkdnNDdzTGZMNTlocGJiUEwxOS9kbGpkYzl2ZVVv?=
 =?utf-8?B?SjFIR2VlWllETlFMeldZa05RVnoyMzdvKzhIRndNMGRhUCtIM2htMUpRaEEw?=
 =?utf-8?B?WmFGd3ZCblVHeVUvYXlaM0h0NEthemJ0c1o1ZEIvd2hhWFRmSHVNUG53cWlp?=
 =?utf-8?B?YlBBSTNoS3p4WVg3UmNEYUswYllnRlhiajZoZGE4c2hlLyszTUNOTmZ5elFz?=
 =?utf-8?B?NG9GWDNXVFYxL2NtQ1cvNXcvSU1vVEFrNFcxWUd6VmdGdVRvMUloQ3NBaE55?=
 =?utf-8?B?bk12Y1NabklZZzdlSmpTUkh4UG9aSGdsZzhFUk54bmdDaFBUcDVBU3EvQkI0?=
 =?utf-8?B?MVdJbTFHMEk5aUpXUWdKM3dxWmdQVGpFbVlLTDlPSjhZRnBHckNpSklNL0lV?=
 =?utf-8?B?bGV2THpVb2dJdC8zcTF4ZHUwVEdPVHVlZHA2cEFYZklwMU5kQUI2ajdYSTdI?=
 =?utf-8?B?VWdDdFpGaXBRaC94OEFkNFRPTXYySEFTQjZBMStidTE2QWxPaVI3QVVERmFj?=
 =?utf-8?B?NFVuc3B0czVQaGc3M2lkOXZNbzVPQVBDZ09sek0zMlNweUhDcTlWdWZOc3lY?=
 =?utf-8?B?MGFSblM4YjU3N1N2aGlvUVpseFZLNDdEM2lTN1Awa2VReWhkMC9CSXNvSEZ0?=
 =?utf-8?B?emIrU1FNUGtKNGNHOGZIeW11dHJlVVBqaUZZamRENzJMTkhLSVNiTlJTL0Fm?=
 =?utf-8?B?S21yZHI3UHRKd1doUVpkb2N2emtOdWlSZ0tYN1MveitCSndhWFRvaks3WXN3?=
 =?utf-8?B?NlpmR0lMSkRadFZJMlM3NzNaUWF6YVZ3b3FPdE13UXZDWXVHdFNvSTBra21Q?=
 =?utf-8?B?N2xTTnhUTEJDRjBBeWFSRWtIY3lRb1FlaW1LNUk4TU9QSkMySElmWFl2Z0lj?=
 =?utf-8?B?UHFHcWRTZEFuL2dBQ28wWUpjNUFFZHZSOU1IdFdJWnRTbHRqd1FYYjhGMG9t?=
 =?utf-8?B?K1lmR3FGVXd4RWRmYWVUN1daM0xsTmE5bzloMTdwM0dPd2lGalk5bnhOelk4?=
 =?utf-8?B?T1NVNHRxY2ZCd0VIZytYSUpGVTBQRy9zQ2JTNFkzbHErQWNVT3g1c0lHcGs3?=
 =?utf-8?B?VUxaWEZyTWEyenVUVUgydjhLYnIxZmpiRlcvb3o2bmhTT3p3dUYxZDV2Vy9k?=
 =?utf-8?B?UkNuRGI3WUpUVjNDeTZkdTczeXZ1cnIvTDVNeEEzS0ZUUHk1MzJUSmR1MHM0?=
 =?utf-8?B?ZWJVNGpFang4d2gxMmowRzJWWUdUT211YUQ3cVlVSG51M2tuVFhiTis4dFNX?=
 =?utf-8?Q?/QZQg2gkG55kdjFEMqC61PyYD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ccbdde-b1e9-45d7-93c3-08dd423f0b29
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:29.5225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StH17j7L47Dk73v1rjUfYE2ufU21wxJxb7tiSPevyuCvosJNQOmXERdmwqDwZRcOvkRUsTXuzkbjPlfm4qsUyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

From: Robert Chiras <robert.chiras@nxp.com>

Add compatible strings for i.MX8QM and i.MX8QXP platforms.

Increase the number of max interrupts and clock to 8. i.MX8QM have 8
channels and i.MX8QXP have 5 channels. Each channel requires one clock
source and interrupt.

Remove fsl,blk-ctrl from required list because i.MX8Q needn't it.

i.MX8QM use port@2 and port@3. i.MX8QXP use port@2 and port@6.

Keep the same restriction for the other platform.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Reviewed-by: Robby Cai <robby.cai@nxp.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 87 +++++++++++++++++++---
 1 file changed, 75 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index f43b91984f015..b713c8ba79e39 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -21,6 +21,8 @@ properties:
     enum:
       - fsl,imx8mn-isi
       - fsl,imx8mp-isi
+      - fsl,imx8qm-isi
+      - fsl,imx8qxp-isi
       - fsl,imx8ulp-isi
       - fsl,imx93-isi
 
@@ -28,17 +30,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: The AXI clock
-      - description: The APB clock
-      # TODO: Check if the per-channel ipg_proc_clk clocks need to be specified
-      # as well, in case some SoCs have the ability to control them separately.
-      # This may be the case of the i.MX8[DQ]X(P)
+    minItems: 1
+    maxItems: 8
 
   clock-names:
-    items:
-      - const: axi
-      - const: apb
+    minItems: 1
+    maxItems: 8
 
   fsl,blk-ctrl:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -49,10 +46,11 @@ properties:
   interrupts:
     description: Processing pipeline interrupts, one per pipeline
     minItems: 1
-    maxItems: 2
+    maxItems: 8
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 8
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -66,7 +64,6 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - fsl,blk-ctrl
   - ports
 
 allOf:
@@ -79,9 +76,17 @@ allOf:
               - fsl,imx8ulp-isi
               - fsl,imx93-isi
     then:
+      required:
+        - fsl,blk-ctrl
       properties:
         interrupts:
           maxItems: 1
+        clocks:
+          maxItems: 2
+        clock-names:
+          items:
+            - const: axi
+            - const: apb
         ports:
           properties:
             port@0:
@@ -96,9 +101,17 @@ allOf:
           contains:
             const: fsl,imx8mp-isi
     then:
+      required:
+        - fsl,blk-ctrl
       properties:
         interrupts:
           maxItems: 2
+        clocks:
+          maxItems: 2
+        clock-names:
+          items:
+            - const: axi
+            - const: apb
         ports:
           properties:
             port@0:
@@ -109,6 +122,56 @@ allOf:
             - port@0
             - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-isi
+    then:
+      properties:
+        clocks:
+          minItems: 8
+        clock-names:
+          items:
+            pattern: "^per[0-7]"
+        interrupts:
+          minItems: 8
+        ports:
+          properties:
+            port@2:
+              description: MIPI CSI-2 RX 0
+            port@3:
+              description: MIPI CSI-2 RX 1
+          required:
+            - port@2
+            - port@3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-isi
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          items:
+            pattern: "^per[0,4-7]"
+        interrupts:
+          minItems: 5
+          maxItems: 5
+        ports:
+          properties:
+            port@2:
+              description: MIPI CSI-2 RX
+            port@3: false
+            port@6:
+              description: MIPI CSI-2 Parallel RX
+          required:
+            - port@2
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


