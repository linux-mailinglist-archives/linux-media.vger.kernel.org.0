Return-Path: <linux-media+bounces-24578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCEAA08AFF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FC77188CC87
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4724209F46;
	Fri, 10 Jan 2025 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="RcJ7eaLB"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2131.outbound.protection.outlook.com [40.107.20.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DC71ADFE4;
	Fri, 10 Jan 2025 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500359; cv=fail; b=WfulQy35DkE9wOQZGjZK1nqJE1G+GxLnednuOSPHfV/aM6k6UKa+5HWQc2+gySb9TzdC3YwkRR6PX2M9a3YK9nWH4oFxde77bvKBwNkizrw4BgzGSt7D3qjBe5zDYBHW1ral9H3epM00JaIz8dsB5FOwrXKy8nIV/yIPL7dICpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500359; c=relaxed/simple;
	bh=EEXFkjidPpNZnaM465+SDXPfl9x2NHuz+2TF8RFQ5T4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YAMSI1B6KgBN+IEfzoPAtASxoEbJ+03vk61c8i8E1yUPtdlTbZzLXfPaU2pFKpsvyJB1i4jltsBkIJnZq3Nf/NyuuMbFLFSfJzB8qc9eLNSzAGWyxSwjTh9/62TtpvO0oB6HzMl90M7W8odlFlG3M+kkcYytbJaKwxJ7Ofzg87g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=RcJ7eaLB; arc=fail smtp.client-ip=40.107.20.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPbMep1NR220ybDf93D7HHVAYF22aRmQnISgAe8wuWGSsn6s/w1QLoga1gebTYQoqSy1D+zxwK9yw9jJlPxk9wAcgCQm+7xvGcS1r4+fnPMZWF0eTVRLObT3b6kUs5XeZ1xiBKw4T1ZTqwatuXkc1nnd2syvkWoZwqqHX6rpyETt05Fz9Lmxuzj57Tz3vtd+RcpVQXe0Y3wgey1cDkIiZjEMXwi8tesDqFuUyXMk3JKt0R/oafEFwFalHx8YB8N91SVH6hloXEvooopVcmidjLOiPL7Cx0//s3fA0dwA1+vARMXWwh5qF+2GwWIvkAH2SAXH1ecWUT+GmTzmRf/fBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFGw58zz3CLLFoh2EmDK14D+Zmdu1ESzOnJxw0VTDEk=;
 b=rKbdioVUeO6nDk1OxtlrMYssroQxnb63w3WFiu9LQgGj+3pEuhJHqKEZmRFvh3UIq92oHcS10KWRdR/AeLmf48sRgDIUvtfIH74mZrXPTBCXJ7oyyyttvfCmi7WGIqRZbleagonpEivZcLmBLW8y6Hncf4fGjwlWnOaPmLwWbIH33H+/cWmkm+UXowZuzqZBzffw94s/zyUuyJYAUiis84h6dst0MFuEa5/zcslIsP56+BMF+VzP4MGGh6dg44Oj4qgdEJbIinfhN2fBHq5RDyEBkPM3m5HN9OmxSFe9NDq1HV/sifUGr6S5P1NZmdDRdFngOBPOq6XjxQcveTr39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFGw58zz3CLLFoh2EmDK14D+Zmdu1ESzOnJxw0VTDEk=;
 b=RcJ7eaLB0unXVbxHHeD44q9HMvoYiHvsNy67Yu0W0aNT2yEBSOyKa1UOjnNffTIIjCEZ4TA+Yjx8oFtGrgMEpShmKFRvU7IVj+1Kv9+sAMFYEZvSIurf5HfHKwzbUhnxozoF3xzgzb+AAKYTgG1wt7CuqIDwhKheui68jvBDs2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAXPR08MB6574.eurprd08.prod.outlook.com (2603:10a6:102:12d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 09:12:33 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 09:12:33 +0000
Message-ID: <78fa589d-f9b6-41d8-bee5-766d0d1c3b17@wolfvision.net>
Date: Fri, 10 Jan 2025 10:12:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] media: rockchip: add a driver for the rockchip
 camera interface (cif)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
 <20241217-v6-8-topic-rk3568-vicap-v2-4-b1d488fcc0d3@wolfvision.net>
 <Z3-f1SrrRjMnB-1C@kekkonen.localdomain>
 <561bef3e-2511-4741-9175-5c15239f9b1f@wolfvision.net>
 <Z4ACALOeioLroqmw@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <Z4ACALOeioLroqmw@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0217.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::38) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAXPR08MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: ec572120-c8ba-48c8-c25e-08dd3156ead4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGx3NFBLbldVNUh4SmFNNFdmSHVOVWRjUm5DSmQvdGNzM0kwV0NRR0pzTXJt?=
 =?utf-8?B?emdJWEUvYUZpOURqZjlncnFZZG9Wc09rTDdqZVl4a2tueUtZcENQMUUyQity?=
 =?utf-8?B?Q1FHWit1dmkxKzlheG5rMlY5REw3ek9OQWJTSER3YUhkV05VWTFOcWhjUXpJ?=
 =?utf-8?B?b05QQzd4aE5IYWxSYTFVYlpPMFhQNEo1VU9pNDZta2J3M1JFMndMTXdBRXl2?=
 =?utf-8?B?Zk9IVENnTUh6bkM1YjUxbjh6b2U1dUYwL0w0elk0WUR5Q3lBN2kxdjVQWlZ4?=
 =?utf-8?B?NmROVGJzZjJEVUFkcHYzelM3RUQ4akRxczJzd2hVd0xQOEl0a29JcXN3V1dl?=
 =?utf-8?B?RVNPNzlVS2tHaXY5WUtvUzNCT1BFSDljZnN0Y1VLLzNiQUVrNERHWTBDejVy?=
 =?utf-8?B?aTNvd1JOSGVIY1kzUGNwVUd3K296OXhLbzdSRXhWQkpReCt0eHNHZ2Z0VHJs?=
 =?utf-8?B?cmxMQUk2SDY1OXY5aDJUNHZ2a1hMb2kxZ1kzdk5WaFdBQ1FXUWU5OVYzRVlj?=
 =?utf-8?B?SHl1N29qQk1RVG9jdUVTY21nZkVod2wrdHN6Z0d4WEl0NlZpNFZTYUxNRnIy?=
 =?utf-8?B?dmRQZTJPbTMwWlY3TFMxRFBrZzNRc29leDFQdU5xUncvUVRyaEJBTmY4aE81?=
 =?utf-8?B?d1hBeE56bWZqZUlZbTlMNmNOOTFjRTZNSWxBbStkalhpM1ptdWpDSmdoYmRM?=
 =?utf-8?B?WGJuR3ZRcXdQWUdHdXNGMDRlZi9mcUt6dWdlMnJUN2NwUTlZa3FvQUI3clly?=
 =?utf-8?B?My9qcXdDTCtkcXl0NFFPeUY2REl2NkVSOWJtdUdyYXBscEZBdEpVYjlQeVRm?=
 =?utf-8?B?VmV3MWhzOXNRVXhjbmhSSmpEN3Rha1dUdFhpR0xQbWNxbFFPSExkR096cjla?=
 =?utf-8?B?VVhqZzU3NlljREtabXk3U2Nac2FQQXg1dE45TTVLSnhIWFRIUDFSM0JaTmZH?=
 =?utf-8?B?ZjEyTDloUVFYM2FHRmtRZCtaa2ppYnRKaHlxb3ppVjhyQXZxRGM2eXhtTEky?=
 =?utf-8?B?TUFqY1Izcm4xMGprSStKQno4UXBWc2ppcmtyUHMvVDcrNmNHNU9ieXIzY2ZY?=
 =?utf-8?B?ZWt3UnFxallWMjVnSURHM21jaXpHRExKTk1xcVVCZnRxWWlXbmQ0RVQraTVG?=
 =?utf-8?B?eHBwRHNzYys1ZkszekU3SG5kSE02NkJ6YWpvcXZ0dHFBYnRZZU00bnZYaXZj?=
 =?utf-8?B?RHVWM1FkNmRsUnhoUk5zcjV4a3RVOUgyZWZqZmZRRm1YUW1QVFJyanV3RXVK?=
 =?utf-8?B?SlZ0UGY5Q3R4R2dZOVRxL1Q3K0RkYi9aQXpFSTZsNjVSeFl2NmZNYjQ2c0ls?=
 =?utf-8?B?a1dSaHcrNDlCaFAvMWhhbndEa3pRMXdJaEVSSGVoc2xBMk0xUWNQTDM3ZmZs?=
 =?utf-8?B?MTlwZnF3N3FMbklxYTJZWS9FUjVsQmxMZGpDNjM4bXIyMTExRk1KM2VMcS9R?=
 =?utf-8?B?V0VwazVCRDNWUXN1UUliL2s2MytaREtUdkJOVjYvTlNzWVdnUGRLUGVscUhq?=
 =?utf-8?B?aUxvRzZMSjlFNFBxM0N2RmNTZXNKVnBMTDVwbVVFYVlCYkdSNnZaOWhQRnJ4?=
 =?utf-8?B?TG5XVWUwRDFBT0Era1RQckRjZDYwVklhaFRuSVNCRXlwU2RLYm9YRTlzUzhr?=
 =?utf-8?B?TExvRkJmMEhuM3VJUk9GdHQ1STBwRjk5TmFVOXJQdHRjZWltSDhnMk1ic212?=
 =?utf-8?B?d2xLYkpWZGVITG4ycUNHd3pvVDBUNEF2cFlHdVJwc1E5KzV4QStCZ0lIemJ2?=
 =?utf-8?B?UnBuMGtFai9SSFkxR3BuT1BjNHo4ZTJFeGVqa2JFZ2JpMmhjTFo5a0taZi82?=
 =?utf-8?B?R1FlNzEySXpsVGs2dGhlb0JiWGpMTk5hbW1XT1pzQUJvVnFiZnBtWStDRG5J?=
 =?utf-8?Q?hay+SdSykBc7P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUNnTFhGVGcvUDlPclo3WXlsV3FMbDVwZ1FtYTN6UFpBbEZoa0RiUG5wMG5R?=
 =?utf-8?B?VUp5NHNnOWRtN3N3MWtJeHhLdEpHSkVBUU1Ma251emhRK0Rvblc3a21BOEhE?=
 =?utf-8?B?YXl2a2NFb2F1c0x2YlAyT1BGMVJtUExFR1VreXdlTjlxUXM1RllJMHM4M1NV?=
 =?utf-8?B?UXFKVm1JZXd5cVl0QXczZngxZ1JSdjJ0dDEvZ2ZFUVJXampiUk12aWNRaDFy?=
 =?utf-8?B?NTgzbGtYMlR5Yk5sTFpkYXcvZW5TZHdWWlFiN0JLVW9KQ0hlQXloRHF3OEtN?=
 =?utf-8?B?N1N3QUVWemtOV0NhK1F0ZDNUdFdNN2l4WFpjZmJ2cEZUd01Xb3VsVGJTc05n?=
 =?utf-8?B?cmNpZkd2aG14VTlRMWQyTHJReC9vNXcycExEWFBXeDVpUWVyaDFNOU1oalBZ?=
 =?utf-8?B?RThRL1hndFJpYlAxMXI2azZlSnNISmo3dkRvUzJYaTFCc1pBS2dKWlhEU1hj?=
 =?utf-8?B?YkFqUGdpOHc4d3FBWFVVNkVXeXFBVlhNMTZCYUlqbU9KYXV6Q09Hb2hzNzJ3?=
 =?utf-8?B?b05rL1BjbVhROFdmcGs2RUhVSjVVd01hSDEzNFdPQ1BaOE1VT0lCMnB2MUJR?=
 =?utf-8?B?Qm9pVmZSeWx6K2lVQ3U3ZFptUm9YWCtxQjMvS0NoTW53aU1RWVpaaVlCeHJl?=
 =?utf-8?B?Y1FrY3F5UnBlTlZJZWk3TmxyRzFWcU9CbnZKYUJ0bk5DS2huSXAxOC9mZ3k5?=
 =?utf-8?B?YU95M1d1QytBZXJQZk5hOGRmdHBMOGwxUy9kWVhDTzRkeFMyZlZRZkV0a0VM?=
 =?utf-8?B?d0YvclcrcXFDQWdjVmxKRUZ1WkR6RGF2b1lGdlRTZHllOG1pRHY4MXFucjlZ?=
 =?utf-8?B?SkN4YnRDV25sSk9yKzYvcFZRRzNKMTRvYmQ4KzMvSUxBaXh6VlFoa2FqSVRu?=
 =?utf-8?B?ZlpCbUlpUjhzTVJWS3p6K0pFUXoreXVCNmRFZXVPNE5waDJkVzNiWXhkRFo2?=
 =?utf-8?B?UzRZWWJUNytrK29hRmkzYllzWXNZRFhOQUVsUkV0WXlIVENVV3IrOS9qWmtq?=
 =?utf-8?B?SVRZalNqTHVQdXFOaXkzbDRzOFNIemg2MDU2V0hCUGdUM2tBVUtuRmdnQXcy?=
 =?utf-8?B?STl2SkJoYm9jQ3RQaGJveDh5RmM0SVNBV2E5SVo3ZEJiRHlndHNwaTI5Ymdl?=
 =?utf-8?B?QjNBRXl1RHo4WU9VRDBnd1hEeFJxNzBUM3pPdWdBNURKSWJSdTNtM0VsbTY2?=
 =?utf-8?B?VkYxdkdNZjQrRGxWY2pRT1MxQ3BqT0ZJVEhyYUx1WjZqcnVJSWZjNTNwWkcx?=
 =?utf-8?B?MDYwaXpKOUpFOVI4Q0owZkJESHhIOU50SkJiMHR6ZEx4TUxPTnE0TFZYd0JJ?=
 =?utf-8?B?aHlBMy9ma3VER0dwYTQ3STF0bHhkMFVwQkc4TFVGT0Z5cU0veFdCNXVqeDE3?=
 =?utf-8?B?eDdoTG5PN2p0blZhdE9NUjgwQ3lKRmcxT1o1WnlJWnA5WkN3YW1pcXlZU2Za?=
 =?utf-8?B?eVNXT0tua3JJZW80NStFYUlZRVhKUk5BZlFnSWRhRElXNG01aDJRWVNneURT?=
 =?utf-8?B?WHdrQldRTFpmUDhYRWZDWnk0eTRhRFRiWmp0V1JOVmZNeXNOamI2TVNoc3Zo?=
 =?utf-8?B?YVFWWVJCOEJOWVk5TmxHKzErZ01PcDRGVG5QVnZMR0M1RFZoc2EyM3Y1RkZo?=
 =?utf-8?B?Z0JEQ3Z3OVd4RGx6bHcwbnh0dW9nb096WHpRNWlSbUdZeC9ERTdUa2RiNVBJ?=
 =?utf-8?B?ZW56MktDejMza2J1VktJbTVTWVF1T1luVlRHUElyTWlUWTY5aldVR0dyRFdM?=
 =?utf-8?B?L0p1N1M0RnJxLy9hWVNlNXV2NSs2MDZLUUVFZ08rU0M1bzhTUEY3NXRVSmpH?=
 =?utf-8?B?eTZsSlltWEZhanFZa1d3MXRoaCtSS1NVdDl1QlJsUzgyUnlyZzZiNkM5YUlZ?=
 =?utf-8?B?ckxTZ3FKK0xBSVlFaTNZMEl2Yk1ZK1lDc282REM0TmdRY1RtVSsrV2YvbzRZ?=
 =?utf-8?B?NFUrSnlyVHMyZXdob3BJemNpeHpFZEFjbjB3TFNSdnkyZVlZaFdsaWpJdWQv?=
 =?utf-8?B?WDg3elRNd3BwaGV5MlB5YTFLUEROR1BEQ3B0c3AzVkhuelhMWXhCQWFjQXI5?=
 =?utf-8?B?RXhlS3l4N2M1V1Jqd2FvQmZWc1RNdDlSbXZVdGlyTkhnbWFSOWNkWllaU1lQ?=
 =?utf-8?B?b08xN3h4Z0FNcmJpTVh6QTBzN045Mk5FSXpCTEtveHREYTBZTENnTXlKaTNm?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ec572120-c8ba-48c8-c25e-08dd3156ead4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 09:12:33.4244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T85+ySnthiEKywOuN3CLQlmrPCJmx2sKwzNoY5FnaBpSqmbv5iqMt7UxCMn8Nyt4Bv01kf5+pVXug82r2HlC/ex4Aq2oIfXouto7yVhlQLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6574

Hi Sakari,

On 1/9/25 18:06, Sakari Ailus wrote:
> Hi Michael,
> 
> On Thu, Jan 09, 2025 at 02:05:54PM +0100, Michael Riesch wrote:
>> Hi Sakari,
>>
>> Thanks a lot for your review!
> 
> You're welcome!
> 
>>
>> On 1/9/25 11:07, Sakari Ailus wrote:
>>> Hi Michael,
>>>
>>> Thanks for the update.
>>>
>>> On Tue, Dec 17, 2024 at 04:55:16PM +0100, Michael Riesch wrote:
> ...
>>>> +static int cif_subdev_notifier_register(struct cif_device *cif_dev, int index)
>>>
>>> This function name is misleading. It does not register a notifier, it
>>> prepares one though.
>>
>> cif_subdev_notifier_add(..) ?
> 
> Sounds good.
> 
>>>> +{
>>>> +	struct v4l2_async_notifier *ntf = &cif_dev->notifier;
>>>> +	struct v4l2_fwnode_endpoint *vep;
>>>> +	struct cif_remote *remote;
>>>> +	struct device *dev = cif_dev->dev;
>>>> +	struct fwnode_handle *ep;
>>>> +	int ret;
>>>> +
>>>> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), index, 0,
>>>> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
>>>> +	if (!ep)
>>>> +		return -ENODEV;
>>>> +
>>>> +	if (index == 0) {
>>>
>>> index seems to be always 0.
>>
>> Right now, yes. The soon-to-be-added MIPI paths shall bring different
>> indices into play.
> 
> Ack.
> 
>>
>>>
>>>> +		vep = &cif_dev->dvp.vep;
>>>> +
>>>> +		vep->bus_type = V4L2_MBUS_UNKNOWN;
>>>> +		ret = v4l2_fwnode_endpoint_parse(ep, vep);
>>>> +		if (ret)
>>>> +			goto complete;
>>>> +
>>>> +		if (vep->bus_type != V4L2_MBUS_BT656 &&
>>>> +		    vep->bus_type != V4L2_MBUS_PARALLEL) {
>>>> +			v4l2_err(&cif_dev->v4l2_dev, "unsupported bus type\n");
>>>> +			goto complete;
>>>> +		}
>>>> +
>>>> +		remote = v4l2_async_nf_add_fwnode_remote(ntf, ep,
>>>> +							 struct cif_remote);
>>>> +		if (IS_ERR(remote)) {
>>>> +			ret = PTR_ERR(remote);
>>>> +			goto complete;
>>>> +		}
>>>> +
>>>> +		cif_dev->dvp.stream.remote = remote;
>>>> +		remote->stream = &cif_dev->dvp.stream;
>>>> +	} else {
>>>> +		ret = -ENODEV;
>>>> +		goto complete;
>>>> +	}
>>>> +
>>>> +complete:
>>>> +	fwnode_handle_put(ep);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void cif_subdev_notifier_unregister(struct cif_device *cif_dev,
>>>> +					   int index)
>>>
>>> This seems to be redundant.
>>
>> Ack.
>>
>>>
>>>> +{
>>>> +}
>>>> +
>>>> +static int cif_entities_register(struct cif_device *cif_dev)
>>>
>>> This function appears to be misnamed.
>>
>> Hm. The function registers the different entities of this hardware, such
>> as the DVP. However, I am not emotionally attached to this name and any
>> suggestions are welcome :-)
> 
> Ok, fair enough: one of the things it does is to register the video device
> but it does a whole lot of other stuff unrelated to it. How about just
> cif_register()?

Sounds good!

> 
>>
>>>
>>>> +{
>>>> +	struct v4l2_async_notifier *ntf = &cif_dev->notifier;
>>>> +	struct device *dev = cif_dev->dev;
>>>> +	int ret;
>>>> +
>>>> +	v4l2_async_nf_init(ntf, &cif_dev->v4l2_dev);
>>>> +	ntf->ops = &cif_subdev_notifier_ops;
>>>> +
>>>> +	if (cif_dev->match_data->dvp) {
>>>> +		ret = cif_subdev_notifier_register(cif_dev, 0);
>>>> +		if (ret) {
>>>> +			dev_err(dev,
>>>> +				"failed to register notifier for dvp: %d\n",
>>>> +				ret);
>>>> +			goto err;
>>>> +		}
>>>> +
>>>> +		ret = cif_dvp_register(cif_dev);
>>>> +		if (ret) {
>>>> +			dev_err(dev, "failed to register dvp: %d\n", ret);
>>>> +			goto err_dvp_notifier_unregister;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	ret = v4l2_async_nf_register(ntf);
>>>> +	if (ret)
>>>> +		goto err_notifier_cleanup;
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_notifier_cleanup:
>>>> +	if (cif_dev->match_data->dvp)
>>>> +		cif_dvp_unregister(cif_dev);
>>>> +err_dvp_notifier_unregister:
>>>> +	if (cif_dev->match_data->dvp)
>>>> +		cif_subdev_notifier_unregister(cif_dev, 0);
>>>> +	v4l2_async_nf_cleanup(ntf);
>>>> +err:
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void cif_entities_unregister(struct cif_device *cif_dev)
> 
> And similarly here.

Ack.

> 
>>>> +{
>>>> +	v4l2_async_nf_unregister(&cif_dev->notifier);
>>>> +	v4l2_async_nf_cleanup(&cif_dev->notifier);
>>>> +
>>>> +	if (cif_dev->match_data->dvp) {
>>>> +		cif_subdev_notifier_unregister(cif_dev, 0);
>>>> +		cif_dvp_unregister(cif_dev);
>>>> +	}
>>>> +}
>>>> +
>>>> +static irqreturn_t cif_isr(int irq, void *ctx)
>>>> +{
>>>> +	irqreturn_t ret = IRQ_NONE;
>>>> +
>>>> +	if (cif_dvp_isr(irq, ctx) == IRQ_HANDLED)
>>>> +		ret = IRQ_HANDLED;
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int cif_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct device *dev = &pdev->dev;
>>>> +	struct cif_device *cif_dev;
>>>> +	u32 cif_clk_delaynum = 0;
>>>> +	int ret, irq, i;
>>>> +
>>>> +	cif_dev = devm_kzalloc(dev, sizeof(*cif_dev), GFP_KERNEL);
>>>> +	if (!cif_dev)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	cif_dev->match_data = of_device_get_match_data(dev);
>>>> +	if (!cif_dev->match_data)
>>>> +		return -ENODEV;
>>>> +
>>>> +	dev_set_drvdata(dev, cif_dev);
>>>> +	cif_dev->dev = dev;
>>>> +
>>>> +	cif_dev->base_addr = devm_platform_ioremap_resource(pdev, 0);
>>>> +	if (IS_ERR(cif_dev->base_addr))
>>>> +		return PTR_ERR(cif_dev->base_addr);
>>>> +
>>>> +	irq = platform_get_irq(pdev, 0);
>>>> +	if (irq < 0)
>>>> +		return irq;
>>>> +
>>>> +	ret = devm_request_irq(dev, irq, cif_isr, IRQF_SHARED,
>>>> +			       dev_driver_string(dev), dev);
>>>> +	if (ret)
>>>> +		return dev_err_probe(dev, ret, "failed to request irq\n");
>>>> +	cif_dev->irq = irq;
>>>
>>> Where do you need the irq field?
>>
>> Hm. Seems to be a leftover. Should we check irq == cif_dev->irq in the
>> ISR or is this unnecessary?
> 
> You've got the device context already, I don't think you need to check the
> irq.

Ack.

> 
>>>> +	cif_dev->media_dev.dev = dev;
>>>> +	strscpy(cif_dev->media_dev.model, CIF_DRIVER_NAME,
>>>> +		sizeof(cif_dev->media_dev.model));
>>>> +	media_device_init(&cif_dev->media_dev);
>>>> +
>>>> +	cif_dev->v4l2_dev.mdev = &cif_dev->media_dev;
>>>> +	cif_dev->v4l2_dev.notify = cif_notify;
>>>> +	strscpy(cif_dev->v4l2_dev.name, CIF_DRIVER_NAME,
>>>> +		sizeof(cif_dev->v4l2_dev.name));
>>>
>>> Do you need to set the name? v4l2_device_register() assigns a default one.
>>
>> I guess we can use the default, then.
>>
>> We do need to set the model of the media device, though, right?
> 
> Correct.
> 
>>>> +static int cif_stream_start_streaming(struct vb2_queue *queue,
>>>> +				      unsigned int count)
>>>> +{
>>>> +	struct cif_stream *stream = queue->drv_priv;
>>>> +	struct cif_device *cif_dev = stream->cif_dev;
>>>> +	struct v4l2_subdev *sd = stream->remote->sd;
>>>> +	int ret;
>>>> +
>>>> +	stream->frame_idx = 0;
>>>> +	stream->frame_phase = 0;
>>>> +
>>>> +	ret = video_device_pipeline_start(&stream->vdev, &stream->pipeline);
>>>> +	if (ret) {
>>>> +		dev_err(cif_dev->dev, "failed to start pipeline %d\n", ret);
>>>> +		goto err_out;
>>>> +	}
>>>> +
>>>> +	ret = pm_runtime_resume_and_get(cif_dev->dev);
>>>> +	if (ret < 0) {
>>>> +		dev_err(cif_dev->dev, "failed to get runtime pm, %d\n", ret);
>>>> +		goto err_pipeline_stop;
>>>> +	}
>>>> +
>>>> +	ret = cif_stream_init_buffers(stream);
>>>> +	if (ret)
>>>> +		goto err_runtime_put;
>>>> +
>>>> +	if (stream->start_streaming) {
>>>> +		ret = stream->start_streaming(stream);
>>>> +		if (ret < 0)
>>>> +			goto err_runtime_put;
>>>> +	}
>>>> +
>>>> +	ret = v4l2_subdev_call(sd, video, s_stream, 1);
>>>
>>> Could you use v4l2_subdev_enable_streams() instead for this?
>>>
>>> See e.g. drivers/media/pci/intel/ipu6 for an example.
>>
>> This should be pretty much a 1:1 replacement I guess? But with support
>> for streams?
> 
> Yes, and I'd prefer to get rid of the s_stream() op altogether. That may
> take a long time though.

Ack.

> 
>>>> +static int cif_stream_enum_framesizes(struct file *file, void *fh,
>>>> +				      struct v4l2_frmsizeenum *fsize)
>>>> +{
>>>> +	struct cif_stream *stream = video_drvdata(file);
>>>> +	struct v4l2_subdev_frame_size_enum fse = {
>>>> +		.index = fsize->index,
>>>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>>>> +	};
>>>> +	struct v4l2_subdev *sd = stream->remote->sd;
>>>> +	const struct cif_output_fmt *fmt;
>>>> +	int ret;
>>>> +
>>>> +	fmt = cif_stream_find_output_fmt(stream, fsize->pixel_format);
>>>> +	if (!fmt)
>>>> +		return -EINVAL;
>>>> +
>>>> +	fse.code = fmt->mbus_code;
>>>> +
>>>> +	ret = v4l2_subdev_call(sd, pad, enum_frame_size, NULL, &fse);
>>>
>>> You shouldn't get this information from the sensor driver but just convey
>>> what this device supports.
>>
>> OK, but what does this device support? In principle, there is a
>> continuous range of frame sizes up to a certain maximum size. But in
>> practice, it depends on the subdevice as there is no scaler in the DVP
>> path. Thus, every frame size but the one that the subdevice delivers
>> will result in a broken stream?
> 
> Could you use CIF_MAX_WIDTH and CIF_MAX_HEIGHT?
> 
>>
>> If this does not return the only possible frame size, is this callback
>> useful at all?
> 
> In order not to configure an output size for the sensor that can't be
> received by this block?

Right... Forgot about this case. This means user space needs to
determine the possible frame sizes of each V4L2 device and subdevice in
the pipeline and find a size that matches, right?

> 
>>>> diff --git a/drivers/media/platform/rockchip/cif/cif-stream.h b/drivers/media/platform/rockchip/cif/cif-stream.h
>>>> new file mode 100644
>>>> index 000000000000..5bfa260eda83
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/rockchip/cif/cif-stream.h
>>>> @@ -0,0 +1,24 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * Rockchip Camera Interface (CIF) Driver
>>>> + *
>>>> + * Copyright (C) 2024 Michael Riesch <michael.riesch@wolfvision.net>
>>>> + */
>>>> +
>>>> +#ifndef _CIF_STREAM_H
>>>> +#define _CIF_STREAM_H
>>>> +
>>>> +#include "cif-common.h"
>>>> +
>>>> +struct cif_stream_config {
>>>> +	const char *name;
>>>> +};
>>>> +
>>>> +void cif_stream_pingpong(struct cif_stream *stream);
>>>> +
>>>> +int cif_stream_register(struct cif_device *cif_dev, struct cif_stream *stream,
>>>> +			const struct cif_stream_config *config);
>>>> +
>>>> +void cif_stream_unregister(struct cif_stream *stream);
>>>
>>> There are other CIFs out there. I think it'd be good to use either some
>>> Rockchip specific prefix (rk maybe?) or a namespace.
>>
>> Are there? In drivers/media or in general?
> 
> I may recall something that may be after all related to this.
> 
> Either way, "cif" is a non-specific short string and it's entirely
> conceivable it'll easily conflict with something else.

Fair enough.

> 
>>
>> And would that apply to all the method and struct names in this driver
>> or to the driver as well (location, file names)?
>>
>> The name has been discussed several times during the 13 iterations of
>> the PX30 VIP series and I believe it changed from (cif//rkcif_) in
>> downstream -> (vip//vip_) in Maximes work -> (cif/cif-/cif_) in Mehdis
>> work, where the tuple is (driver directory/filename prefix/function and
>> structs prefix).
>>
>> Hence I am a bit reluctant to change the naming convention yet again.
>> That said, I'll be prepared to change it JUST ONE MORE TIME to any tuple
>> you suggest -- but this really should be the end of the name bikeshedding.
> 
> I don't care about the internal naming but the global symbols. Using a
> namespace is another option.
> 

I would suggest the tuple (rkcif/rkcif-/rkcif_) then. This is in
alignment with the Rockchip ISP driver (rkisp1/rkisp1-/rkisp1_).
Unfortunately, the Rockchip RGA differs here (but with the tuple
(rga/rga-/rga_) it uses the same prefix for everything at least).

There seems to be even less alignment when looking at other
drivers/media/platform/ drivers, therefore I can only try to maximize
the alignment within drivers/media/platform/rockchip/.

What do you think?

Regards,
Michael

