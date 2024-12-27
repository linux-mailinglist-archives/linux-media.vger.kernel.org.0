Return-Path: <linux-media+bounces-24125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D079FD185
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 08:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C347C163DBA
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 07:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2AC14AD29;
	Fri, 27 Dec 2024 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="GkrIQuHe"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2122.outbound.protection.outlook.com [40.107.255.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B644149C6A;
	Fri, 27 Dec 2024 07:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735285338; cv=fail; b=WA5vszVg6LUlrABN5I/yqEKh3R7ssTVW5tEtCMkprUzQ0tzYGZHtY2N6h9lvkPVg24r5bGml6GkCCaTxF2SRfCiLWtQTNQyYhpfx2NKdJVooSCpQnyZlDL+CWY08X9yGI0jd/U1/jbyCzYxgopLXGIiEnMwfFcFTRw4bOSmTwGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735285338; c=relaxed/simple;
	bh=kXjDU6rp5rw9KnRUibsM+r0NTZqqE4TMfmWMBQLbajs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YWr9Kr9NYM3dhCsgVpli9za3QefcDBz9fhONYNcbfR9p0GNrDHz8EaD5cClnKcvC/iMXRCO/rKmb48HeZkgDWKP9eLJPEvHCFcWGlF4YKoJocF35CjSxe+b6r2Bx9oF0IRf1x8O/4jXWmBUqhOOODYhCIrJAfDJTV90AFJ7h3bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=GkrIQuHe; arc=fail smtp.client-ip=40.107.255.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpRBnusCAjuKXKFp8kS/00F2HaVIey4B0GHbTsG8E7JoRgjTP9DgHOR2GFPCyogc9LnOVdJMRW2KH+Zfz5+ugUAY9H04E+U/mZ70Rrieg5YI0aM3AmHysuUkQ+z0L+uXrC2tvi5Nt8NEGeI6HbTjtl8BGTvmxs91FWy01BjU0E3RNnXfaEkuUrlH21QFwSbhD6MXTZR4xZWCstuxHIMo5tJ4TLpeUVZRxAxQfEP5wPLHgt3/hs+skaG2z1+MaBCJW9cPAr0GBpPBZnhGRNCJTGxvd9H+Io+/BJohYsHlls2/BcUr6iFXvkk8Gh7s3Z9KGkCFamDgQ7JnXO8DHswxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yL+hxMJ0Gc6x0yPXV15k31K3eNhRNI9UpZHjN2SZeqE=;
 b=EZzT2IePAQf7MwR3CL/cBQCPREoX6ISHXhQBG8pdLCeN2t1G17PDUOdQeUEeBX56kkZeaoAv9bgkbsuIoZeekrgjofI8VSw/zZojSI7B2xCQi5/zhi/SgItolKXY+BCI5VcBBaNONCQUn6IexFR0UYdWZMmnJncaQwiyvZ1Er29nSXz4l3EG0+q/ffDRLHxzAoCNvQEhHB5aLoYzZQSs+oe3FiCMOb4PNsOwwkh39qP1KsHzYUzvX/cD+4nU+Ka+ocqqZda9IxT1ty472jOjYNxdLeRk9MBwsH/x25T5pUUkx+hC6yfGVr+pVf7ZNcUlrejhXOfC8/9l7BXON4L7Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yL+hxMJ0Gc6x0yPXV15k31K3eNhRNI9UpZHjN2SZeqE=;
 b=GkrIQuHeaM9TtMwOphNXahrYWJlB1JyHz+XkCEiZ/tFtf55KpcSBP/+hDvoFW5HQGFMj55RPBPB6G4oresomo49EFl70tJpvlLlDQZX1KbhaHXhHmeC7PU+plT0/FflbZiH6uyNRJ72J24BB2HHFoCKQgkctDhuea4PmkPGry3ouIqODZIGqBNYU9EBJ14ACAN+/L9SRbeO8A7wHNQHwxi73Wzx4V/Vxat5oZ2Uhwr+PPfEeucX3owIYVHSYsWsqXSSQGkilpltnrKVRTAlLSgNo/XIf9b12+9NcEQkA0ucGUGkHuOk/5hHcpsq5XdmLAY4LV5a45JsEpm2Hn0nD+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB6954.apcprd03.prod.outlook.com (2603:1096:400:285::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Fri, 27 Dec
 2024 07:42:14 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%6]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 07:42:14 +0000
Message-ID: <8fd14447-735d-4dbd-9296-363a5f8157cd@amlogic.com>
Date: Fri, 27 Dec 2024 15:42:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] dt-bindings: media: Add amlogic,c3-isp.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
 jacopo.mondi@ideasonboard.com
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
 <20241227-c3isp-v5-5-c7124e762ff6@amlogic.com>
 <0815e122-1f77-4f87-bc9d-386cc423c171@kernel.org>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <0815e122-1f77-4f87-bc9d-386cc423c171@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:820:f::15) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f7622e-7147-49a7-daa7-08dd2649fb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWQxcUx6K0NyMFhpUlF3T2JvRGNxOXhpRzVWN2dqN1J1WWYrMTlFSUdYUktJ?=
 =?utf-8?B?SUJkQ0pUeWhBbzdpY29KSExQSDBEdnlaSm9TNjl6R2dIZHYyMFNCaHgxMFZJ?=
 =?utf-8?B?bCtVdFQ3c3E3R0ZzS3V2M1U2MHlDYmZHVmF4dXhrSk9jWmxvSWxiUHlRK0N5?=
 =?utf-8?B?RElReHdZYkJHMHRnNFhNSjdSVTVTTVprUUxBc0Z1S0NIWnhEaW5SYzV0VFEx?=
 =?utf-8?B?clJRQWhhVitZR3NXUnVHV05PUTliOTBKWjBrbWZsSU1iN0t2emQ1WW9Qem1y?=
 =?utf-8?B?djBIQjFjVXROcS9HeU5YNi8ySGhSdXlkd3dyWm5SN0E3V3lvRWtKKyt6S2pw?=
 =?utf-8?B?UDZmY3dscjJOeVlTNEduQUpzY01saXFheE9PeWUxelMxMUh1VHRrS3p5OFNa?=
 =?utf-8?B?M3JPaGY4cVNjVEd5WGdMcEFKc29zL09oemJaN0huVnVLRGVBaVZITVQzcE5E?=
 =?utf-8?B?T0tpY29hSk42bVowaE94TnNaVFRxOTBBRXBINURvMXY5TjB1ZUVibVVpQXdi?=
 =?utf-8?B?bng3am9Mcy94dU5YZTJsSmovWUN4TWNYOU5Gd2krVkk2N1BRSkNpM2pSWGxl?=
 =?utf-8?B?RHNWZWdHeXZpdFB4bnhYWEZ1NDF0bm9KcjdMY0pib0Yxcm4xaFdzMnA5S1JB?=
 =?utf-8?B?ZWVSR2RBZWRGUzhNRUJ5MDBvY0JLK1pYY1BiN2RRanRJdnhQU0ZENDFUTlpK?=
 =?utf-8?B?VFpMN0lWd1RiWUc2UVl2N0FIS01RQS8vejRUVjg4cjFINmI5RFh5SHZ4d2E0?=
 =?utf-8?B?eGZENjcwRDN1ZitPOWd1cS9jNzFCcDNGTHBqVG1nVDA2OUsyM2hBRFNNSENY?=
 =?utf-8?B?YkJQOFIyZzJNVWw3cGMxVjlzZUd4cW5UanNPVWpZT1VqTUdlZm5LNjBtTExC?=
 =?utf-8?B?SVRRS2Z6QjVaLy92bFVqeVc3K0YyQ05xWUlqbzU3b0ovTURwNFZZaFBoVlZE?=
 =?utf-8?B?VFJXL082aVpBZW9xaEpBSiszZTB3MGhKNjRyeVZ0YzdiZFlFTEs3VzUvREtX?=
 =?utf-8?B?eFNEUjNjKzlaSm5PZHJiQkZZaFp0NXRYV0ZQL1E2NTlMVmh1b0ZNNmZSZkh3?=
 =?utf-8?B?UTUwSmI2MEN0OHV1ckNOVWlhdnZDYWFic25PNnpqeG5iV3N1T2tMR0tmclJt?=
 =?utf-8?B?TzVSQzNVTkpndUwvL3RkTStRT3NpU3dremUvMXR4Q3B3a3RWTzVJQjZ4akRn?=
 =?utf-8?B?SnlEcE5ZMVlrYVhFNitjRFJSVThlRm40VVIrV2liTXBLalpuYUhRY29ueGN6?=
 =?utf-8?B?RjQ3d3VySXRqbFhwVzV1M1BCYjJ4eEZBWWE3WktrZ2RxN1I2L0NTV3A0NjlB?=
 =?utf-8?B?ODBwdkljWVNiam90bE53MUo3QjdITmdrdVhpelRNR01iUHVkSU50SFR6MkVi?=
 =?utf-8?B?OXpiUjE5UGtiSXB0cC9RMUZvSS95N1IwMlYxWWM2c0hOajJ0WVVTLzcydjFs?=
 =?utf-8?B?dDF5SzFUdlgyU0FsNjUrWWVZWkxEc1RYMUkrN2x3bjFTdFlQS3dLMWFCRk5N?=
 =?utf-8?B?OXVhSlc4TjM1byt1UUFyVEFPTHFQYmV6NEhPNno3aG5UUEMwcXVUbmYrNVYy?=
 =?utf-8?B?SXNFeFBaOFZpS092dGNnK3pBeFM4SVZ5WVBOUVJ5Sy9KSkZ2RFA5aE1PR2FF?=
 =?utf-8?B?UERwOVdzZWxXRGN5SzJ5OFl1SW8ySndwa1N6RTc5bm1oZlVhOUVUQWJLbSsv?=
 =?utf-8?B?ZG1zNWp0MGVueWRoeDJTVm5mM1dRQTl5TkJXUERMNTJLbkxrNURnZmVDdTY4?=
 =?utf-8?B?M1ZDV09EOHBDSmh2TE4xVmNPWWovYjZ0VWVZcWxaWmxISjlDVVhEb3R0ajNr?=
 =?utf-8?B?TjVzYkhBWjk5T2RXWHU3c1ZlU1VFMG1zNC95TWRCQkRyci8rR0UveWdRVEtL?=
 =?utf-8?Q?0SSK/rgmlWHyR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmxOTzF1aE1IK0JxYksyZXBEWDZxOS9sNmJHdzNLMHpoditrZGtkU0VrMjVx?=
 =?utf-8?B?THpEUk5mQ3ZyYWRPVUxQaHY5d2tYcjdYRHRpaGtWWTBrSFAraU84bzg3ZlZt?=
 =?utf-8?B?UzhMa2NuV1JSVjRTZitzQTFQZ2hnRHpHeWEwdjZ5dWZrem5tdkdjYVJvbmF1?=
 =?utf-8?B?dVNhcVhNRDRJdjZmbUZyNTE1RzhoZ2MwbGIrUkxuNi9BWVdjQ3JmVXE4azZ1?=
 =?utf-8?B?QnFDSnhQdVJNU1NpZ1FEM2JSa2tFeFBXWlp3MXRjTXNmaU9KTEd1OEpOQ1BF?=
 =?utf-8?B?Wkd5clRKT2Vnalo2amtvL3RvM0JGUlZBMTNKRm80NVJVQzQrb2RzSkhrT0lD?=
 =?utf-8?B?bTkxenF4T3l6bThCSi9TV1VaNDBMSndpT282YldEZkl2SkIvVFZRWGZwQUtB?=
 =?utf-8?B?TEdndlVSbHRPbllaNk9oQW45ZjhSQlJHOTljVTVHdFJZTks2SE1VR3c3aHJC?=
 =?utf-8?B?RUJJcjhML0crSlBJREtxTE1RRU9zTmRKZDg5V254RU4vck9zMWRLU0VYZncr?=
 =?utf-8?B?VFRscStUOFBCRFBOODh5cjZNbGZubkRvM0VMRE1DVG82UlUvU2pLWUJaYndF?=
 =?utf-8?B?OEdxM0xGZHBQbnByZVh1SEs0aDBzYmdudXdrc3JqOENrSjVCN0VBRGFWaFlQ?=
 =?utf-8?B?YmZKTTJFSy9PSDFyZnk5ZlF0TDRXYWpwOVM1aE5QQk5MaE0rNXFDYXpTK2M5?=
 =?utf-8?B?cnN1YWRlSU03aTk3QzdJNXN4NDR5bXNjclg3dEQrNGp0VDcxRUlZMHRjWkg0?=
 =?utf-8?B?UDZ0a01mYXFNaFRYSWtOMXpqK2QvNDJWYXZaVFZIbGNMcmRSWTQwaGF4bmwz?=
 =?utf-8?B?RjlJMHhoMXJjdnJhTmNsUTcxMmY5UlhPWU1NWEgzck84a05HaXBmbkRsWno3?=
 =?utf-8?B?VjN0T3hxWmdUY1lOejNzWnl4T2FXRTRESm5iai82YWNRRmlSMVJITHN4QjBu?=
 =?utf-8?B?VERIaVpxekZRdGtLM3VMMVgxdHkzUzBlL2hKQnFDQkd1YTRQeFdOMTFqb0p2?=
 =?utf-8?B?V1FHb2pzaUU3ZllXVjdtSlBIaW5hMDVOVm5hbXNEc0NRcTFpd3RIWDhNQjRv?=
 =?utf-8?B?R2hubWZMVFUzNTAxVlNKaDNYTWFxTEczazdEWi91RmJ5ZGFneWhyVG5SWmtZ?=
 =?utf-8?B?RzNIdVZONXBiaGhueWNJMENwTVkzd2VEcUsrUkhwKzVqQ2ttUCtPN3hic01i?=
 =?utf-8?B?czJkK09zaDR2aUFKa0Zmc3J0T1BwK2o5d3BaQlViREZwWnV2MmthekdQRmw0?=
 =?utf-8?B?S2VqNU8vMWpkVEJXRTZLV0NLaENneTBEdGxraHZuWmt3R21Wcm5MYVowZ2di?=
 =?utf-8?B?S3ZBSVN2Z3B6bWVBSlc4c2c0TktmRlhDWEIzS0VmdXJ3NnFMTDhLdTU5b3or?=
 =?utf-8?B?ZlFPUERxRVhTODQ4aXl1UXo2NmFjemNYcTdUUjZ2RUJxcmU2MUJzSG9yNkdN?=
 =?utf-8?B?SEZtMGN6UjNZUlcreWYweHM2S1gvT1hXcGJBRHg0TmRNbWltc0k0N3FDZ29o?=
 =?utf-8?B?NnYzeXFhLzVkREJjdGE3M1ptR1FnQWtWVmMweFBsRmxNaFFJRE1TaUxPUEdn?=
 =?utf-8?B?OFlmWTZKakdSOGo5a1JSZC8xVzRFS2Q4QnFheTFSNExwUktLcDBMSlFzaWRW?=
 =?utf-8?B?RWdrL0VnUzlhS3RyUW9peFVoYktzK25yMVhLMGVYU3BodlFkVnZodGJtZGEy?=
 =?utf-8?B?SDFnZjIxNE54UXJCRm1RbXRmM3IxTzNSeTF2dmlSVnUvRTlZOUw3bFFWeDdX?=
 =?utf-8?B?S0tocnlXQkZQdTFGK2hKRHZVMGsyK0VwMXREWmJncFhBUjV2cTJRRzJScTdl?=
 =?utf-8?B?TmErUlBDSTR5M1drTy9NcUZUR2dEUTFYTVFsVlI3aElNS3kwY29IckZtTElZ?=
 =?utf-8?B?eEJ1V0pOWlJBUWpmc3JZckxJWjJ4Tm5iWGFOSmczcTZGckoxZm41ZjRrbXha?=
 =?utf-8?B?WlNhb0lrd0d3dXlKRHhtL0txSCt6dXNYTlBsVko1QkcybHpPVEZ2SVFYTHZN?=
 =?utf-8?B?TS9BQzQ2SGNPQzM0dld6U2JqRjNrMlE0dUhaN2FUNXR1YU5ManI4cmFyVnJV?=
 =?utf-8?B?c1o1cmlXSGNTaEJnR0phY0VvQzBBVWRBNjQwalN3NzVpRkdrR3pybFdFNlBr?=
 =?utf-8?Q?UvJnx1fWPohwtcCrvpked0H4/?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f7622e-7147-49a7-daa7-08dd2649fb43
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 07:42:14.8114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6O4Uy+lWno/rm3b9GRC2Xfg9DbGU47MDfc8zcG+MGVzkLyuiJkt3rg/z2H7k935w4dLq4yTMmS2yxTqpE7j1fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6954

Hi Krzysztof

Thanks for your reply

On 2024/12/27 15:22, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 27/12/2024 08:09, Keke Li via B4 Relay wrote:
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vapb
>> +      - const: isp0
>> +
>> +  assigned-clocks: true
>> +
>> +  assigned-clock-rates: true
> No, drop these. Request re-review if you add new properties.


OK, will request re-review

Thanks

>
> Best regards,
> Krzysztof

