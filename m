Return-Path: <linux-media+bounces-25962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A15A2FB3B
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 230093A6778
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F2326460B;
	Mon, 10 Feb 2025 21:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nJ8xWcfH"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ABF24CECC;
	Mon, 10 Feb 2025 21:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221219; cv=fail; b=EKXEi8YaKIzwIr8k/rge2i23rYTP2TMuh9Hxp60a6uUxUGXUZC7gZJhuGCrdkQ1oQuN5XsWxbVMXuE0cLlSAhxewVvn2I3QOAeiw+g8SpghxVTltg7BhScg+cKQsy7OwmelbGEc/D4UQyouEC5BZPcW/VreB6hlEIbops5wtfuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221219; c=relaxed/simple;
	bh=vIMlyRKmxJeu/XKiX4AQ1lNOz3ZiPDdCObqahDaaRf4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HWr2VYkCyJ3GoTumAm+PYb14KVSk8MIbPJpApyknPEE/fThVEYQiItDnnbQHZdpbOy2tEtcT3WeS6dpLj9Wo/iM0UA2ZEugUnwKMTfJ6vhlwx0Jdl1CMBXsbtyCjdIQflkNpR8F4e8zrqJOWV19Z+E+idsiaTvmVz7RqYbEpMJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nJ8xWcfH; arc=fail smtp.client-ip=40.107.21.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxm3KNOyNMxgmKhgkTdKnqampGiYSQ6+M5KOPfIgBwRwUZ96CGqBumYM15K6fGLVX1tG0GiYyJI4O2nXP0JpHVi6p/tQQ1TgAftOY+IwmuPQ1eI5lsquCEslPfrJUloA8O4ymMBcSMMRFM7Pkko6bjcUtMz3ECl8LuuaQRetsVC9rp8T7tIZU5cYdY7dvxkWpXOw+8ET113a+RO5/0gZsI/qhiLI26xpq+wBAkwkc7CiAkNu+quKgCPUWMl759mO4OSitbJ4SkJv+hwZtPncrigwW3hSedzv4NY3QuGTPjXQ0aKPGIsz4PuwhYC46gYjrAWrz+pBez9IreIG1my4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYbTHaNworacz11O8H5ZEnQfZzAMThj9MSI+5Tcc1KY=;
 b=AvSo5mExqT90UhxS0/9cU9YwWsxO7+7fBM0M7L/yA4orRkXPjTsJJ73d+/kjfoNJDJijPKGqok0M/EuTcLEdbVWOHs0Ev5CaYRrC55/aofItkTo0C4kLkp5nDr1hwQ2o27lbgsqQ8hngwcsTUsRigpJEA5HQV/mkDs9B8QqGW18qucFb2kE2nOX0yfmw04ZgiqT/7uwngbvd22eSIDpYC9eb1F0fcrtbG0NHcRTAHy5atwnOJtW/BvZNgel00H4KJya81fSNo5VQ3Z5AkiT/CpBx0/mIg4ha2oGXo1ZoN03M52ITXquPtmlhhTIO/DYXM5OHhRviZqz6aWLifFlzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYbTHaNworacz11O8H5ZEnQfZzAMThj9MSI+5Tcc1KY=;
 b=nJ8xWcfHi7GZ/TbKnXPefhmx32u3vUvCvyxUl9UGtHfQH79Fs3Yp6SPSKpqjvwZS1MLhNIh3DJsQgycisedlhPNAifVCIlhF79IXYvpc+SP/KBzOqMSUffHH0ilherAPuEWQlMUYOjJASxAsVldiDyVcqLqljswvEkI2riTSPDniXSanx8ezl2qVtA6eVjq7yJQkFIRJmA7512Wq+gvqLwtdvzl3my6Fc16tw5M/W6/k3eueOxKvb7l7mTtBcb/58PuiQHBtgAGTUJuYnItMLC4rFJWVZh+bFrIlJeOb9qI1agEa5Hc5UlZKObKV1WzA0jLbtoH8eSqkFZWO3QSKfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 21:00:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:13 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:24 -0500
Subject: [PATCH v3 05/12] media: imx8-isi: Add support for i.MX8QM and
 i.MX8QXP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-5-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=3486;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=tmwbFMq6zx+PpjDTVqHcp+819vsGULI+igIg57auUIE=;
 b=M15/g8e8XnNWjYV4ctoRGTZ0SpWAYkgb+qAimnpKY6JxHCQg/6r1vx9fcRYkhJcwEZbAX1sJu
 3rZcCFqRzgPDewKKPTnfgClXe6y0EXImpDRCdF4ouSssWSBq8hc7sWR
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: d81ee7f7-9a3f-4880-9f90-08dd4a15e9bb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NjRqendMNjhrbkxzZjhlZ0plZ3AxL0JLbGkwUm10UXkzeE1vL1FLTDFpREFl?=
 =?utf-8?B?eFpZNnJleTkrdVRPTzhKQmhzMXM5QmxLZlFTVXEyOXBFK2R1Yk95TU1ZZzIx?=
 =?utf-8?B?Vit6cGhCMGI4WnBTUyswTTN3ZkphUjk0OEVUdEZaVFN6eGJxTTBneUpsb01Z?=
 =?utf-8?B?VHVUVzJFMkhxSkYzRmZyK1RlSDc4dzNiUzE0MGIvTE11OFNCWllhQkZhV3ZE?=
 =?utf-8?B?TVBTM3dGRnJFSmYwQ2Z6UEY0SDF3cEVLMG90Z0dZNVA2TU1QeEI5ZWl3bHAz?=
 =?utf-8?B?WmxYb3I3cG5uV2Yxai9LN0FXektOS1k4Ni8zR0VBZTlpbzlHYkdOWTNuS1F6?=
 =?utf-8?B?UUZGVGVWbkc5cHlTeUR2LzdxQkZMQzJlMWdPbFYvd0VINm91cS9rbTdtL2pE?=
 =?utf-8?B?Z0R4VGtxcmRmSm1ZTzdBaXVDZ05RN2JFNGc0UXhQNzRRNEdNL0gvZTBJUDFH?=
 =?utf-8?B?VjZ3U1czMnc4S2ZvQkpObFkwbXd6M01JS2NDa3NhNm5paFREZU5BYW5pdlgz?=
 =?utf-8?B?RXBhVHFKR1lNSmpDU2NIbFFwZmxCV2FTMUQ4TVZ6K1ovZVYrbEszbElrcUxN?=
 =?utf-8?B?WjFaWGErbnVGQWJoa1BuK2N1dU16bEtKV1VTNFMwaDFTWWdmcllUQmRJaXpI?=
 =?utf-8?B?V0dnZ2x0SisyYVpCVUx2Vy93cGVMMEw3SUVvVGQzUzZFbEk0Z1BTSU5RNG1D?=
 =?utf-8?B?UVJVaUhrTEhmaHpuYUErR0p5MXJDM1VUL01raDd1M012SlcwbkpVNGpZb2Vq?=
 =?utf-8?B?KzBOdGk1S1dqcGVtY3pzd1pjak8yVU5YN25VZmhxQ2F4TEhoYTVuQUJSRUVC?=
 =?utf-8?B?QXl2VTF3SFhyc2JqTk8veHJzdnZjcHNiYlhiVFEwaGx6ck1DWWVGUSthelBl?=
 =?utf-8?B?WGhEVWdFcnlOUXlvWmJrSzMzcUs3ajJ1TmJVU3ZyZFZBK3hQbzU1eHNZbklm?=
 =?utf-8?B?M3Bjd29PdHNRUWJ3cGJWL0lMdk0rVGh5Q3NNVjhlTU1GVGZDTUFqZUF1Rnla?=
 =?utf-8?B?M24raVVwRFl3TDZZN0ZBY3ZlQ2dyejB4ZWdoUnMycUJVSk5xZVhNMzRJMlFv?=
 =?utf-8?B?WUdQZDVabjJ3UWVCbmVwNWc3WjFSVlhHbUp4dHpzbXFqYy9mdjkyN1ZFYjMz?=
 =?utf-8?B?V09lWnl1U1orcm9kdjhJa1lJOTgrSE5PNWU1M0tldE9DVTFFQmgrY0E3T2VT?=
 =?utf-8?B?akFUUWlpWjZwWEIweFFDdm95OXdobm5od1Fzck56VDM1QXhDRDlHZ3orYkwr?=
 =?utf-8?B?ZzBqell1bzdDTlRpZUtXYkF3bG9odWNPLzE4R3MyOWZvZWQxL0R6dXUrUmQx?=
 =?utf-8?B?TUlUZ2NqVmpPS05pcEM5czhLYmpzMzVWUDl0S0IzUVp3bDNmRmZ4KzhwNGRD?=
 =?utf-8?B?YUNUY2dyd0N2WENoQVdQZjhWV1g3cnhHL0wwbHRSODN4aTVFbFhDWFdKd3R3?=
 =?utf-8?B?WEtkNVErSFdYZGtRdXlpeS9PWHFnY3JJTGw5TzM4M3B2a0hHazAzS3VIcHE2?=
 =?utf-8?B?bkdQalVua3BmMllWaVFhdFhFOVBXTEJ4NjhaY0FhajE1QzNYNTVhbk92bmZP?=
 =?utf-8?B?TWVOSng5MHhIOVNXb1NaUVVVd1VlNjZsNHJBall6ZmZVN3lQam1qclV1VHFV?=
 =?utf-8?B?S0hyYkl5U3dyYmlnZ053c3p1cjJPZkxvRmEwQWdScXNXbkxSK0luRUpnaHpy?=
 =?utf-8?B?ZHM0MEtpamt2R05KWG55K09xOXdUWUNRemhwRDhUS2F4S2RseFdEb1hXL3Uv?=
 =?utf-8?B?bDVKQUJlWTdQYXFQNG1JNU5sbXdaVzNHc29oNTNSeks2TWU4Y3RQYkN0Vnlt?=
 =?utf-8?B?aHNFdjhqRUJ6enl1aHovWUpJT0xWMHJ0c1dhYWx1MmdUZzBhSitadlh2bVhP?=
 =?utf-8?B?dVcxR0FleXN5dHkyZ3RpczU4ZmJIdWE0eWh6blBxRUdUeXZncnpPL0hKOEZI?=
 =?utf-8?B?VGowT2haS09OendMb1M1dHNmaks2WVhwM0t3YlU4dlB6SDNsZW1vSU9NVVpt?=
 =?utf-8?B?bk94TFRDVTh3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bU0wazFIN25lMmZCb1hvVURJZkJhQ01Ud1lKQVZNQ09SL290Q0haUjFYWUtl?=
 =?utf-8?B?Y0tVcjNFSEk2SmROOTUyL2Q1REIyUm5qQ3JjcHoxRHE3Z2ZwY0l5R3V2R2x1?=
 =?utf-8?B?cUg4amM0NklpUE1mcUVCZmJSWUZqb0xteC9EQUU2Uk9Jc3YrbXB3MUlKWVBE?=
 =?utf-8?B?RDNCdTJSU0QvUjNLdnVkQTk1aDViQi9TWXIyWFBsOXRoYm1jTkRSRDZSOVpv?=
 =?utf-8?B?bU9ZNThLQWVIa3psd2VaUS80SEpwd1pJODR3d1lBRzNiaWM4Nzd4dDlVTHF5?=
 =?utf-8?B?NW5kOUF3VUpKVitMeFU0YUtESjRTVWlYVUVDRjhsbGZVZFZ4OEJOSVJVYXBk?=
 =?utf-8?B?WUkzcExYZzhXUXc1YXhLd05XdkRFUC92dzVWM0MwVUpmbXhoRFgxZmhoY3Nl?=
 =?utf-8?B?ZktyZTA5NXNuMklyRllSYkpOa3IyUFlSaFkzL3R0YmFudmFvTk96NHptN2ZJ?=
 =?utf-8?B?b0k4dkIxM29zUDIzYm5SRW9UbnQwOEV0aXdmVVJ6TExrN05EL2ZaVHBWWTBZ?=
 =?utf-8?B?QTJKcHRKQURFSjgyd1kyVzA5bnBNT0J1SnRLRzBuTUdCT09MbDNKKy9MN3Rz?=
 =?utf-8?B?bTZzc0Zib3FpSW02MzMzaWVxekxyUDBUeFNSeHh3RVlLZ1V0ZnNhcGp2NFdn?=
 =?utf-8?B?NVptbkZMT2ZTV1cvRUNNUlp4K3VGMFBNS3NraU9lYnN0QUZ3WGlRMDVDRzQ0?=
 =?utf-8?B?dENXdnJWc2dHNlRrWWQxNEtjY1BLaHVXd2tqalErNmFzN25ZODBGU0JNTmdl?=
 =?utf-8?B?ZXR4QU04bXYwQmc5UUZUcHNmUTF4bitsMmkxaVVqYWY4RlcwLy80SjVLSmpN?=
 =?utf-8?B?eG0xcExHWEg1M3JMQlRtclIvL3o0ZU01MXprbUFJcWlhL3dKaVJOS2llVnBX?=
 =?utf-8?B?ZC9GT280Yk1KT3NoQzBlMnZ6SWJZa0dyOVMzMTZkWjN5eXpJWXVGYUg4aUpH?=
 =?utf-8?B?dnByd0ZGVE1LN242WUZ2bVhWSHJhVUdFZzgwaE52dzRjSDA1Q2pURGNuSllJ?=
 =?utf-8?B?UmZUa2hrdU5DdisyanNERHdPRnEzLzNhaFp5eTFJQ3lZRTljY0crM0x4ME1u?=
 =?utf-8?B?bC9iM1FhMjVJTjBvb3pmTHB0SEdJckJ5U2dtR1Z3SHdDS1FZYVRZNjR3NEhZ?=
 =?utf-8?B?cVZkem1zQktFcnB4c2dkSXpUZHBUcFlSZzdOa29qeW9ucVZOVXNXRjVDN2gx?=
 =?utf-8?B?cnVBV2phRlZWa25ucFJxeEsxd094U29vSXRFWUxMa3VTaHFpNGFnNU9QK3NC?=
 =?utf-8?B?eWN5dWljWHMwWjRpUGVTb1NkRStwSUc0QndMUjVCamJ4anRnWXV0MWZNSzdy?=
 =?utf-8?B?cTIyOXZSRElRYWorOTdUc2Nvc1lIdy9TV3U5dlNSOEg0dnFkaHorcjNYdk1P?=
 =?utf-8?B?eEJhdzlvamk1UU13TXFwYnV5Qy9maktxcS9FbGRLQU8xRFFhTEtsd0gxOXJa?=
 =?utf-8?B?WjdPOGJoWncyM3VXL3ZPU0hTQll4Ry9TY0xLVnlOczkrR21VcHQvbmlycnN6?=
 =?utf-8?B?Y1pjKzJzMXdiS2dsVy9jTUY2a2lMSGJLN1ptazJrR2FUaWYzK2RzT0s2eXRR?=
 =?utf-8?B?ZzYyczIrem93UXE5cXpvTkNmV3JBOW9uVXJQMWNRWGVXcnFYWEdqS092bDQy?=
 =?utf-8?B?enkvdkpVclZCd1MraE5CdFl3WkZaRWRySGZ2MThlK2t6eWFRNm12UVNJd0cz?=
 =?utf-8?B?Q2lVYnY0YlFpaTI4bWpqTTd5NVpxQWF3eGNFdTZQbWlkRUx2bHozUEJDZEo5?=
 =?utf-8?B?WnUxK3NoaFBiZ09DMVZMSlA2WDRLTWR2dVIyQmcrMXZ6K2RYcmFFU1lzYjRS?=
 =?utf-8?B?bnhQSzBOQVdNcWFtMFNZdkpqK012bDJXcjZRMXNOTms2YXp6ZVlYbXZXN3hX?=
 =?utf-8?B?VmhnNURuUis2R3Y2K3AzMUZVWWFKbk9QZDlYbGlSWHVoRFBDNWZjT3VEUGRW?=
 =?utf-8?B?RHc3aTZTVUdydHVZNlpvSEJRT2E0V0RsZVdLU0hrb1g1L3k3TzhDZG9JWThH?=
 =?utf-8?B?bkFNZkc2Qm9QQ0NZNTV4ZkxlWjk2QS9keDZQejBqNUJGcXVIblNtNHRwN203?=
 =?utf-8?B?STg5NlV5VkxTb0s2cFQ1d2ZwaEFDM2xRUTBKa0RjZFdFRitJeDFuVkhSWXJm?=
 =?utf-8?Q?T9rO48b5SMpxMqd72TnaKt0FW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81ee7f7-9a3f-4880-9f90-08dd4a15e9bb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:13.3641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vxs7xYrWviD2jag90osQc8NTxs5GlwdleQDBZrQpzrCfOwHa4cc7EwtIt88+ixqHUZ1wMbXoeEIgIuFDMncD2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

From: Robert Chiras <robert.chiras@nxp.com>

Add compatibles and platform data for i.MX8QM and i.MX8QXP platforms.
There are 8 ISI channels on i.MX8QM while there are only 5 channels on
i.MX8QXP.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v2 to v3
- none

change from v1 to v2
- remove intenal review tags
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 47 ++++++++++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
 2 files changed, 49 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 1e79b1211b603..a3237d76f7aa5 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -274,6 +274,25 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
 	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
 };
 
+static const struct clk_bulk_data mxc_imx8qm_clks[] = {
+	{ .id = "per0" },
+	{ .id = "per1" },
+	{ .id = "per2" },
+	{ .id = "per3" },
+	{ .id = "per4" },
+	{ .id = "per5" },
+	{ .id = "per6" },
+	{ .id = "per7" },
+};
+
+static const struct clk_bulk_data mxc_imx8qxp_clks[] = {
+	{ .id = "per0" },
+	{ .id = "per4" },
+	{ .id = "per5" },
+	{ .id = "per6" },
+	{ .id = "per7" },
+};
+
 static const struct clk_bulk_data mxc_imx8mn_clks[] = {
 	{ .id = "axi" },
 	{ .id = "apb" },
@@ -334,6 +353,32 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx8qm_data = {
+	.model			= MXC_ISI_IMX8QM,
+	.num_ports		= 5,
+	.num_channels		= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v1,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8qm_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8qm_clks),
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
+static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
+	.model			= MXC_ISI_IMX8QXP,
+	.num_ports		= 5,
+	.num_channels		= 5,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v1,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8qxp_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8qxp_clks),
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -541,6 +586,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
+	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
 	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 9c7fe9e5f941f..496cad3f9423d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -158,6 +158,8 @@ struct mxc_gasket_ops {
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX8QM,
+	MXC_ISI_IMX8QXP,
 	MXC_ISI_IMX8ULP,
 	MXC_ISI_IMX93,
 };

-- 
2.34.1


