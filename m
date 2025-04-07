Return-Path: <linux-media+bounces-29441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792A8A7D1D9
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 03:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9783AB97F
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 01:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694EF212D63;
	Mon,  7 Apr 2025 01:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="iF+/8AgT"
X-Original-To: linux-media@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021140.outbound.protection.outlook.com [52.101.129.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E2579CF;
	Mon,  7 Apr 2025 01:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743991138; cv=fail; b=DFZptX9Z6bM3TImyQkf7FNxzGOZwulEHqUK1Fyeu2kvePyiNsmbrm7fdtUBbYzamFIYR1AP0i6nfR9ZmUtAWn7EHmNFAjvnA/HDUdFbz0NyxpYz0NmJWC+/oUNJ08h+nbUWHwwWwCmPQNNSR4JdZERpwFOy6kfDYL5o7/vhrLyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743991138; c=relaxed/simple;
	bh=ud36oyHwFueZuTnSA293e4gw2dUdf+Ye90L4spw0ti0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HVZv4hVELkrUjtqXq1Gs5wlXADigLE3ekNH1NdYpZCZsdIZtk4pZBI5WVtjDut6pdkCNyWylDIT1tsowOhWy7JkPolWaGDF5kiL9ORPyaEhafjIklSew8wyYlfr+9VwJssVpcGDrXk1Tv3iMuvY3VSNeCBrKJLpCusjIJYkwm/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=iF+/8AgT; arc=fail smtp.client-ip=52.101.129.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yESOrpNc7CofNebnoz8ulNEOocP3CmcEqSaESSn3e3rf2rmRB8TaJSGy0ajOFJeMGzo/kscN8P+hTRu44Ifc/2mfQygTbdiZY8zeCs3/UyOXqP8UOWBlaBQufMB+HncNkJD/IS8HiyOJiRwB0jK4Px04i+yXGFUB9RG32frwhn6mpdzcfjAFk1uJVreOB2hXU/8gyH7Q7N0qKNTjgAZNctwbwseNZBRnZ0BuDHsSj4bthcdalnb7cPkVUzzaz3c5Raf76FrkfPZgvCz1W0fpivVKClGvE3BQ/e1x+Ri5INl2lUkIWEoQhI0j7bXdWhvOW4a23j1hc10gr3MXfMnL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHci/Lxz0azmk1tANhwmBUwFe9ZTfsS9Ycabwrpbkzs=;
 b=w0EZXek2qUQMnmV1KkaUKCTIT/4XLMp+9JlBekfhnrTPu7koc0u3oeGWz7sBa5PwDTSIu29ppkqj0Oyc67EpbkhCzFutWdd59FyAouyxa8JYK94nBUEfRyRP+cBt0Koi2hwmu5pbwNdoHlrn2ML6ef4w3tUYtZc1TY0D4r6eGSxchtTmg7oQRsyz7au1x+ixyABVS5dEOWpmYMfvWoglOGfYtMBITU56Ga+5nZe/kS8AC5xq4ZcR9oN8CmRkMaYB0Ve1GEeGhxy8FuqsF8lEiIFETHbXt2nqBPwSXR+Kexjei805YydGifenrqUgJzWYi49u2UDBusc1P8VP/kfc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHci/Lxz0azmk1tANhwmBUwFe9ZTfsS9Ycabwrpbkzs=;
 b=iF+/8AgTpcrwP3UcjwaOLmEwqikG16x9+34qjFKhGUuxmXccXe1VU/1VbG+thNYRMndQtBtXrxKxn3fB2uS1ZlKtnMe4dAMDpF2JhdAsnJdL2AWH3n5wzOH+CDm434KegR89CZTfUgTvMIHGQ3HHpjIaoxzdC7ayNeJWFT2mm2vovQnvSw/LgzQ0RL49sldbk8R64T3DgHK7jVKedRWVZC57Z4JQbqLAIBgqCHSm8pyQ6zZU6cx2LDA3ICsH85J6yBNy0G62xV36sBnjqBcvE8fuYCcYpT3pyKCG3ild3eH2NUUtb83PMTPo7tr0T7lgqVu52rOIy3kirGqjLNNo9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by SEZPR03MB8677.apcprd03.prod.outlook.com (2603:1096:101:22a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Mon, 7 Apr
 2025 01:58:51 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%4]) with mapi id 15.20.8606.027; Mon, 7 Apr 2025
 01:58:51 +0000
Message-ID: <8b65035f-6827-4ff5-b702-31a0efdcbeb3@amlogic.com>
Date: Mon, 7 Apr 2025 09:58:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] Amlogic C3 ISP support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
References: <20250311-c3isp-v7-0-c3551bed9005@amlogic.com>
 <174361329012.494853.7010939852362232231@ping.linuxembedded.co.uk>
 <ae77936c-e9a7-432f-89a0-b4b7574690ea@amlogic.com>
 <2e2c30f9-a9f5-475f-8acb-b84c2776ba5f@linaro.org>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <2e2c30f9-a9f5-475f-8acb-b84c2776ba5f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0207.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::8) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|SEZPR03MB8677:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e4a2ce-550b-43af-e12a-08dd7577be68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWdTTnBhdVhmd1UraEs2OS9BNHhWL2VHekpudTNya01RWDF5STFlSEtJMG1r?=
 =?utf-8?B?M0E3ZU96WFdrRHA5MDRvWlpQWlB2REdOT0RtbkZaRnJEcWFpNjlNS3B0VTZY?=
 =?utf-8?B?L2t4Y09TNVY3d2E1MzhIWDlXcnk4dFZveEhqQndQNnRyVlNNaTVEd0UyNEhP?=
 =?utf-8?B?UFRIeXZMcmt5LzIyMGNzQk1OenA0bkRrOGxYb2RzVUtWcjY0amRSM0FvRytJ?=
 =?utf-8?B?cG9yeVhmOFJsTDJBUll6YzlQQWk4NlY4ZmhvS3VGZ01FTGVuTVBDQVZOYTFm?=
 =?utf-8?B?M3ZMOXFPOVJnMTZqZ0tvQ0ZWelRUeXg0aDlTZjdwZFU5TGxsMm1rejlwZmhT?=
 =?utf-8?B?UVRNSzZYcEo4blhRY1ZqM1l3WnRjZGw5ZVlwRG9lMUx2YmpZMG9CMFBWL0tG?=
 =?utf-8?B?Nk1kKzlncVh6RFNsL09wdHFKWDJsTDhEeWZXcjYxK1NJQlRxVXFnRG9rNk9y?=
 =?utf-8?B?ZjAvdFV4L1NmQVlvYVZma29KaFJTbHFZNUQ0dkRRRlZpdDlmZXZBTHFnM1VP?=
 =?utf-8?B?ZThkYW92bmtYWEdTOVV1RmYvdDY1aUE0RlBhcURCSzhUY2ptZnRpSzRHd21l?=
 =?utf-8?B?MTZaclR4QzhyZWVFOWJVelREaE0wSld3UmFGTHVkelNNZDhhOVhhcElwd1ZZ?=
 =?utf-8?B?UFcyRDFoYVJtSkhhT0wzR0pFa0htZUdJR0VJQ1l6ZnFIb0hYWDN6cVY1dzNp?=
 =?utf-8?B?dlQwbDNvVUVURlpXa1h3RkQ4NGdFTjcrSlZlTWxSK0kwZnYyZS81Wkl1SWdx?=
 =?utf-8?B?cDQwRU5ucmZSb0pvekdyQ3hLL2M2dmIxazA1aStyMDFCQ1B3WFFjSXZDZW9T?=
 =?utf-8?B?S0RsdnZyK0RUaWtGS2sxN2lmenEvYndoRUxza1NnYTdLaXFrc0NDdE9SbGlS?=
 =?utf-8?B?M0N1WC82LzFGeXZvQUpCRldLMGJ4WFMwdGI2N0xTNWRJWmxMaEh4eHgxQXQv?=
 =?utf-8?B?eEZJcnI2YVgyVVBpOEF1ZkY3Y1J0NEo0MktsTmFJZFRuNmczTXVUdDRsdzhY?=
 =?utf-8?B?Z3BJdkl6OW9ra29heHkxRWNPMGM0dTllQzlCTzU0UnJ3Qld1bE9lVUxMd09o?=
 =?utf-8?B?eFptOEtFRkN3QTlIOXpVSCtVKzA4b0I2U2JRN2pKSWxLNEliQVBJMzVZeFBv?=
 =?utf-8?B?ejIzRFRtOWxUK0s4bUdWYVpqQkxKU0RBWlo3V1RLZlNGMFFsY0tYNzQxQzFv?=
 =?utf-8?B?WDhkYmpsZHArKytIVXhDMjFHcC9WcGpIT29RSTlyWElyeGRiYXNVVGJrWVJ1?=
 =?utf-8?B?TXVVdmdzaXNoWUUyWDRtbm5KS2FTcmVhK1VpSGVoNXdqU0RXNTVxSFZIUG5u?=
 =?utf-8?B?UUVVbVQ5WUVOVHJuMjUvdmZ1L2tZV0FDaC9ybjRIRnl2UnRFaU1Xb203ZlRO?=
 =?utf-8?B?cUJnT1I1TXdBYjlHVXJXZEphK3lLMWJBRGRPQmNjVm5VTUN6c1lqeUxuQ2ZG?=
 =?utf-8?B?OVBGbmhQMHk1dUhFWStuMEZVOEZnYWNmNEN1T1c5QnBreUFyUDlrZVFYYW1T?=
 =?utf-8?B?d1RvRm9udTlyKzNEMUxUb1E1VHl1TUEvbnBsK0toSmhCRGxhaFN4b1pyQXhO?=
 =?utf-8?B?NnBlN3dCWDZzMERoOFBDdjI2UHU5clU3dVdmaDR3aFBmaGl2Q0pxYm91cXNS?=
 =?utf-8?B?S21SZHpYWm4wcE5WUUpUa0M1b1ptVDkwcTVTTmhMdHB4ZVljRzVwV3A4cEJE?=
 =?utf-8?B?VU53MEV5VjVmRFYxYUt0S2l2cCs2TXRjL1YzRzZUSVZBS1Nuc1V1dndYQzFP?=
 =?utf-8?B?UEVtd0dFTGplbDBTU2RLZy83WUJ0NXdtWHpnNTdtM0lPTEZyeWQ1T0w3Qy93?=
 =?utf-8?Q?P6xYA0hre69+sRHmNMK4+EpXufBbLPPY1s0o8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0pyQ2Q3Q3B6aDZPUko5R3FycDFQWGhCaktJQVFEN1N3MEJRdTdlT2lvUVZr?=
 =?utf-8?B?YVRFMXIrNkZndWFFeFBEb1N6ZGREMWZPajZCSlB3OUlzUzNLMlZlVVBvYnVn?=
 =?utf-8?B?M3JxbjlWZ1M3VnJlNFNOVUpNQjJiaEhZSnUvVzdFUW1RbTVSQ0N5YjFQWWlV?=
 =?utf-8?B?WnM3OUlEQ0lPdWRlQ0xWbDREeEJhTHZnNkdYWnNvOU1Id1c0cFhpaGhIZ0ox?=
 =?utf-8?B?amIrd0I1ZFZuMXdPUUlkZ3FEOWdiWFdTdks1NVdDaHI5QjBIRE1yUnlOZmto?=
 =?utf-8?B?bkdSTXdPdjErVU12VDdLQXN2SWU0bFNjbEs0TG5VZnlpc2duTm5YMkFMSVpn?=
 =?utf-8?B?bUJEeTVKMTNIUW1GTkVQdE14Y1ZXeXhRb0cwSzhFcjVHNVBiSllMbDZjbUpE?=
 =?utf-8?B?VzlRejA0akZuUHQ4YUJEbkJ5blh2Y3BRemJGWVJCYjdnaGdNL2xmZWs0ZFFX?=
 =?utf-8?B?YTh5eTlGaEhqbTZsNUJ4QTl2MERtcDlZTHJkZG9nNzFNMnZZNEgxa1M3TDgv?=
 =?utf-8?B?MGYvSDR2RlJ1OFAwS2JEZXZVYnJZVWZPWVQ0czFXaGpqSnJvbTJ6MS9RbjJO?=
 =?utf-8?B?VFBRT3BoR0t6Q21jcWJWQzB4dEgzS01EN0RXQ291d0thTmFReGNsOFp6d2dt?=
 =?utf-8?B?M01BQjlHL2VtWVJUbytodWZYQlZhZlRFT0E1TnRROXg5MnRjU1k5YlBXZGpV?=
 =?utf-8?B?b3JCRU5uSFQ5bjlNN2IydjlqdVNWWkNDZ0RVbmhaeFg4MlB6YlBkampqMm1T?=
 =?utf-8?B?R3JhODJaaXBtQ0pibVBHdDVXeUFKcG1id0hWRHJEb2VzRk5SbzVid2pqR3lh?=
 =?utf-8?B?K1dwYlV6bVdFWnBjNHpiemFxNGhaYUxuSWhjT2NNSWk2Q2dkUlFFZFNOQVNr?=
 =?utf-8?B?bEgwRFRJOWxibVRJcEZXeUVNc1RuSFM0Nmpsc2VzOG5WdkRwMTJrNE56bys0?=
 =?utf-8?B?czFKUUhoS1BuZmo4UkFZM2M2blJuWENxaGxVVGtjOTQ1MUt0T3pjRDUxSlRm?=
 =?utf-8?B?QXcxaHg3OGJUUVdIbHdIZkErYkFBbWllZlRpK2N1S2RXQnlwMEVCa3VoQkpM?=
 =?utf-8?B?TkpEdm1mSE9sS0U2MG9Bc3RFZUp3RC9WWlpqVjNkajd1K2hMUHQvNmhROUVa?=
 =?utf-8?B?Rlg3WEdDYXNwUDhNVDl4TDgvbE12SzRkSm9ZWFVnMVN5T2kzaEVwcjRCdEkv?=
 =?utf-8?B?N2h1OHExSE5HTUtxTXRKM2xBa1V3dStPOFVoQ1J3TExxeTFyY2xReDdpQldS?=
 =?utf-8?B?Q1lvU1NuSWgyQmtzNlRUaUhWMGFyNWdJdEh3TUcrM0IxQS9zd1JPcTZDZ1Nr?=
 =?utf-8?B?SHlJZDB0WEw5OGhFQnRWS3lEdHR1L3dHeE9KNms2OThIR2piOHdFOElOU2cy?=
 =?utf-8?B?aDJmTWN5S0hNM0E3a01zdGg1ZEVNeFRPdzJNZzdHQm8vQTRvTjdrUGZWMGlI?=
 =?utf-8?B?NWprT25XbFVMRFp6SHRZT3E1VHpSYWtiSFlXV29FS3gzVUtodW1uZGNVS0Zn?=
 =?utf-8?B?NWZOYnhMNi85T0o4RzJtV1ptbU1iOWEveVBKVDNFQ2ROTVJPekNuQmNOdE85?=
 =?utf-8?B?UVlyMmY5eXZOWGFYbjFrbTJDcjYzMEplL0FITFQ4Z1pRNjlUeUp6OG9FMmlS?=
 =?utf-8?B?WUFodXQrZmNmeXd0dDZHS0t4WXNhQXBsRDRJQTN6M0h6UWs2UzJkRlR1L0l2?=
 =?utf-8?B?eXZhVHJBV3h0SDhGS1hTNlJGQkdRQzlmVm1iYm9Fb0hEem5acUpEVElzU2Zu?=
 =?utf-8?B?WnUzTElWYXErYndFV0VsZUlzYUJYMU1iVHAxUlY2bEI1NEVMMGplTmFJalFR?=
 =?utf-8?B?S090OWpocGNPZlUxUDdKMnMvc0Q0UEFRZmJKdjIwVU1pWEdDc1gyRUo0NkN5?=
 =?utf-8?B?aGh6eUMrRTlTYTNxK0pRV1pFL0VrWVBqUWo1SVFacFM1YjhnRHNRWUYvYmVU?=
 =?utf-8?B?S1JXaWxSQWpCVGt6SzJoelhyVTdxOHpVOXVSOGwrNndKR3FRQVhYWUNUZ0hu?=
 =?utf-8?B?OEFmUkNXMnV1ak9KeDNtSDJobDNGZHpDbWF2aUFsWmRNRE9zNmNHZTNNclFi?=
 =?utf-8?B?cFYyQ3NOTGFhNHRJaTY4U0o1K0VkT0dqRGpUVDVDcmRvMjhnaWZIVWF5Z254?=
 =?utf-8?Q?wloeh+rEktk9AK002d5nuEt8J?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e4a2ce-550b-43af-e12a-08dd7577be68
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 01:58:51.4075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPrAQhp0GaR2Ljx/uw8TlpgooDgf+lQW/uNxLo3sUHedMEw851X9rOpIkGOWi75jSf0sBjMzY/l2ipN0oeeyMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8677

Hi Krzysztof

Thanks for your reply.

On 2025/4/3 14:01, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 03/04/2025 03:58, Keke Li wrote:
>> Hi Kieran
>>
>> Thanks for your reply.
>>
>> On 2025/4/3 01:01, Kieran Bingham wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> Hi all,
>>>
>>> Quoting Keke Li via B4 Relay (2025-03-11 09:11:10)
>>>> The Amlogic C3 platform integrates an ISP capable of supporting
>>>> multi-camera, multi-exposure high dynamic range (HDR) imaging with up to
>>>> 14-bit raw RGB Bayer data.
>>>>
>>>> Capturing images on the C3 involves operating the CSI2 receiver and PHY,
>>>> an adapter layer that integrates the inline processing from the PHY to
>>>> the ISP, and the ISP driver itself.
>>>>
>>>> This implementation consists of several distinct module drivers and
>>>> is expected to support different platforms in the future.
>>>>
>>> There is a corresponding series for libcamera based on this kernel
>>> support.
>>>
>>> I chased to see what's needed to get this ISP driver merged, and saw
>>> that the CI couldn't apply the patches. Does this need to be resent on a
>>> specific base to support the CI?
>>>
>>> (https://patchwork.linuxtv.org/project/linux-media/list/?series=14706)
>>>
>>> https://patchwork.linuxtv.org/project/linux-media/patch/20250311-c3isp-v7-10-c3551bed9005@amlogic.com/
>>> shows the CI failure : "Failed to cherry-pick patch series "
>> This patch series is based on "linux-next specific files for 20250307".
>> I am preparing the next version.
> Please kindly trim the replies from unnecessary context. It makes it
> much easier to find new content.
>
> Why quoting entire 10k lines message below?


Sorry,  I didn't notice this issue, next time I will trim out 
unnecessary information.

>
> Best regards,
> Krzysztof

