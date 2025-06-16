Return-Path: <linux-media+bounces-34906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEB2ADB0B7
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AA517A8E12
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 12:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D5B292B3F;
	Mon, 16 Jun 2025 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="Z4wJojMc"
X-Original-To: linux-media@vger.kernel.org
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazon11021078.outbound.protection.outlook.com [40.107.160.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B2226D4D5;
	Mon, 16 Jun 2025 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.160.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078603; cv=fail; b=lLCZGULTrnaChlqmRY0me/D4//0ndiKZvx2nz0+dOfzRu0ejpRNv0p3g0UJuNoCbSMLqg+tfp15eSdpM2/+vniG1hOECF+lGBRJShBnQdj+BPSTk+1nXdb7Nz8RTGU3qAW9EmYgf3R3J/xagc1UU3iAUBpbhyPJLoMY9E9siIDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078603; c=relaxed/simple;
	bh=OtxyUGi5yS6MM2VfoLyvFpFCj1Yq0PjC1aXtrW+j0Bs=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YwC72C++yDaM4xQz4cF26AoL95ty6zlE3KQ/Ot3fAgcnaHXwe9aM0SbpVNTlJAlVm1aRYgjgAoLbAn2AGDziFl6qfOtk9fiJjbZaG6rGpFeBR1klCqQ7xXvgCf3Nw6PttpqOJcDXYO5tmQk2OxHKUKtpjpO/rpWZVZkKiuSWWTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=Z4wJojMc; arc=fail smtp.client-ip=40.107.160.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULrCEkIqD8HakArSx0ykpl1bBfbhuBmf4abycb77PuqGDOjUk8MAbU06kRxIA5Jdd4j8QNRNJUa3xWWkRnBRrfrq25e6OwPrMdvJbOpUuA8nrcUwVwkuazh4bv+Sr0Labebb6ttBduPxfzB7CkzVYCozDbSm62KPyIwmh/VZBBwX3B256EAuJ2j7IZfFaD2bngQkqs4OLoYlHFYL7MsJzGPB31sHvF1S1loPusZojA9BXEDQOO13/nx2D33RkGPRAz4fmPuH7nUjXmMH80BBhRxXLm5AZdLupwylntKFPq9H+bk2nH7lhWBPF3PEF2n8RBDRt2KHboDcu9ePsiSj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLdPB3DnLAdHvvLXnmM/UD9FKYMWBAsf7A4HSsOstJk=;
 b=CckVSx+FXGCzCjRYAkQNy4SR/plBr88p0FOWQCwXbdzi6vwPJItFqedFgGO/Me7M6fMCek+OYB6mBdvvn857RK1jGPLS1Ce5+rN8jqN1gv5frUNAzClRhw/Kb868mfkS6foGBTODVVsUilt0ELRYTPovcUwXO8DwJ9SJonyjs7H0rnStM0/RYzavphYTZXj1XgkE+8a7u6UQg8WfxlR+PsIPW0ZVw44hCspC8aWeK6KtAGK4Swp9QDIrd4uRTMV8yhog2FglbP+nW1JbUg/cSmy8jL0vDWaEuOiI8CDDF6Im7GNkGwm2Q3QZiA5oEtG91pZLEf0IL87mEw9/2RnYRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLdPB3DnLAdHvvLXnmM/UD9FKYMWBAsf7A4HSsOstJk=;
 b=Z4wJojMcLOi0lfK7iAVN++zXHVCIPEc7sQXRQnUQO6jgC09kyKICp28+ap/IAVhqsxDYN5PiET1XxBHDoifCs5OBtYW9YpkWQqNrkWaF0sCBgZ1nU1z+OxEnQlVnSt2WhiEKdM8TIWIsXYyedyGqQriHBw1tFqEvai9jq3cOtalYAly9X/1HAzaJRPb/gUkG//HywINQ9c3EbyMwbARG31B3YT829bZjtrKyWlafo+VgWmmfOjZ0awFX6c9pWndZjv8xzQTVabEF1igxrgQ90Y9rbxjnyzswDj+AbcK1jY2OS38oYvc2wu02+OoD5Syq+cVWMB7bPC3aowIBWhDl3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MRZP264MB2890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 12:56:33 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 12:56:33 +0000
Date: Mon, 16 Jun 2025 12:56:31 +0000
From: Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <dj4jzoi6v6ci57b7gsverqfajzq662uslxunpwhrcixkv3e5uk@t2fxl4m4hzlf>
References: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
 <20250605-allegro_dvt_al300_dec_driver-v2-4-1ef4839f5f06@allegrodvt.com>
 <aErWeK9qQSrCcNnp@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <aErWeK9qQSrCcNnp@pengutronix.de>
X-ClientProxiedBy: PR0P264CA0286.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::34) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MRZP264MB2890:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d11d67d-1a0c-4fbb-0a54-08ddacd5385a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YURGbUxjb2RqSXlsNk9rOTg4TytKNnlRWFZxYnBzaS95Z2tHTFo1dEdzRHNw?=
 =?utf-8?B?aEthS29IS01mV25lYzFiYnhvbys0SEZLRWxUdDI1TE9aL0lGdEZzank0RDdv?=
 =?utf-8?B?cXV4V2orWk9TWDRtbFhyR0JsWU0yd09rdjlBRWxXa0h4b0wwSXRWQ2hwclp0?=
 =?utf-8?B?NDRUMnhKYmlyM1JKbUNOa2R5enN2SGNJMEhMOGhjUXB5ZFdTQ2NZOExjVTA2?=
 =?utf-8?B?YlhUajNhNU8vaXpXU2cwVnV2ZU1RSGIrbTZKVnN6SzU2enl5YU9CSk1FSHZh?=
 =?utf-8?B?azMrZmRNc1pyVjEvUE12MUF6cXRiNUloR1ZjaFY5N0VrOUx2aHlZbzR2OVJW?=
 =?utf-8?B?UG00TXE0QXV0Y2hWUDRZTjhlYmJudWdMTTcvTHNDYmxpVDVaYzlyU0dOandt?=
 =?utf-8?B?QnFmMEV2ZGlHU0VCOFVRSzQwZGhlZm1PWW8zVHFQMUl6eWJqdlhmQXAyOEM0?=
 =?utf-8?B?V2J0TkdvTGhjcG1XMlpyNVAwNG80TFVDaXRBTzl1KzJOVVBlUDkySXYzbFpt?=
 =?utf-8?B?OGgwRVhPbzgyT3ZrVTFXWmVVemxyMXFrL25IektTYTNuNVdEbHdtNDBkTUpr?=
 =?utf-8?B?SE81M2xId09uM0dyS3hSZ2orWmFHY3RpUDlQMG96NnVMZEE4SVRTaXFyR281?=
 =?utf-8?B?aUdkcVM5WUtkR3dzWUdMSVRTbW9pR0s2VERuTXhXZ1cxSkFOR1FMYVB1NHVV?=
 =?utf-8?B?NVVqZUVDYWZ0QitrMW5xYVdOOWMxeEJVSFNQeEtyQlB0SjM2SG9VVW5NTDRG?=
 =?utf-8?B?ZUVLd3JmZVJydndrR0tibDJ0cFlUSHBHSWJXRHVjN3MwNDdTUE4xQWNpcUxZ?=
 =?utf-8?B?azZkL01lMUswdFBzdlRuRHBuS3Jta2FEZHcyYXU3bG1sMTFWU0kwUit2aTcy?=
 =?utf-8?B?Y1ZaMXZ2SVJMbWZTdmplTW9ONW5HQXFEMFZ6cFNMMWdZUFpFK0xmWk1SQk5p?=
 =?utf-8?B?WTAxZ3hzK2lpNEFWdE96UmNnYXlFU2NHZU1CVEFXR3ZuOU9zdFBpd1h3VlFU?=
 =?utf-8?B?aU9FWE0wMXJ0azhzVU5yb3dZY1ovc0xFeG5HbDFlMm02OWMxa1Y1bTdNZGVS?=
 =?utf-8?B?ZmVsRXFsZk5Eb2s2a1JSVEZFOUk0THYwcjRDditROUtTYTJlZExMWW9UMFRF?=
 =?utf-8?B?OU51V2hyeEdxbHVyNmxJTVFjay9rV2FQOTNRN1BoYk5NWUtabElHRDBhQkhl?=
 =?utf-8?B?TjF2SzRVczkrV2hkclR5WVhLOXMwYkZXdnI4MnlodlB5Ym5IcmlCT2tGWXNm?=
 =?utf-8?B?dFV6OUZ5MFpkY01BN1BhU1pNNUdTSVY2OTQvRXY3RzFxbG1pazM3UnJINysy?=
 =?utf-8?B?OEFpYkJ5VTlwUCtBV21YTVBIMDhiblFrdVpMdnlnS3JJZFB1aWNycmt0RTJr?=
 =?utf-8?B?MkQxYnI4SjVrR1lVUHpkclJlV25DOUpWSTlGN1MzTzJTUWt2UWE0QnVTR1BU?=
 =?utf-8?B?N0JJQzdIQnVkSFFLT1ZmOTFuWWFJQWJmVGhjYVRuWVY3YXN6V1dFc2x1TGtZ?=
 =?utf-8?B?SDEyVGNJVHZydVdrYUhycUsraDBxUm5vZG14eFp0UGJLcWZDaG5malFOYU8r?=
 =?utf-8?B?TVI0dW50ak1UdzlWL0JieDhocWgrMDc2RFpPcWdPdlRQaWptUjNMc1hMYmdr?=
 =?utf-8?B?RWtUeUlvbHZMT0VUdGlRZTVRS0FpUmZlWnhPQlJJUjk3aC9EVDNmS0p2NGFC?=
 =?utf-8?B?ZVlkRW1Hamd3SG4rQWZyaHJPRmZmdnQ4TjR4aEtlN0JZbGFra1MrT2pqalZ1?=
 =?utf-8?B?MDBSVGNRdXEvWE13YWhFVk10c29CNktITGIxMWRpQ1RCTGU1VFdzL1ZzRm1a?=
 =?utf-8?B?WHhBQjB1RmxkL3VBSUtEQXF0VEZSWWZyK1BDRnBGUWQ1bzBjMWNZVkNGb2ps?=
 =?utf-8?B?TlhoYUUvVWU0MUorc3drZm84KytraExUUk9hTFlrd2pEWTc5NmxjT291YmVl?=
 =?utf-8?B?TnFLbXB6YkZkdkdMYVZEclUvWFRDVlNLVnJPSW5pUG5DZDJ1M3FjTGMyNWFF?=
 =?utf-8?B?MEZ1c0txdDRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUNKMGl3Z1VTODFjaEJNMFpsWGZrQkZCRFJ3anVzZUVxMWpRUmpMUnVXbDhT?=
 =?utf-8?B?V1FJV3JXVVhYVWd2alBZTU5OanV2eUxHUzdCSkE3dUVDVFl4VjEyQVNDYjRX?=
 =?utf-8?B?Z1R0RlpKYmhUSmdPNlhsNzA4bzJZemQwbTBQdEpDYjRxSnFvMkQ3a0MwVUNP?=
 =?utf-8?B?ZitGRkFwLzRNNmphOGFQSUlnU3NJWGJXbnpDZ21SRjJIMjFvS2ZackZVUDQv?=
 =?utf-8?B?ZkhzTGxGazE0MVRYT2gxbEJSTVJEcXpXUDR4dWdFRVAwcmFkQWFTcHJVbUdz?=
 =?utf-8?B?ajUrYXpYd3ZIcVJIcTJ2Z1pWaSt0czFERiszRVhNQ0dBeWtqZEh0WFhac2M0?=
 =?utf-8?B?QUhScmRNTXlKamx1UlhuRkNhd3pweUVmSnRVc09CUjFLem1jQXBYRzA4Y1da?=
 =?utf-8?B?MmNKejR1djBoNXVKSmZUYWk5eCtiakEwUzZOMGlpL1Jsa2FGa213TVJlT01z?=
 =?utf-8?B?bUMyOHZKcGlWcXlvcEVhenNndmV4a0g1dzBzT0R2UE5LcFBRSjVmZWtxZzFn?=
 =?utf-8?B?UnNiL1Iyb2NOQS9oUXM4aTRoNDJCYksza1Z1YWZQNTNxK1FwSTlQK2tHak1H?=
 =?utf-8?B?OHE5c2NCZGtpblpFKzI4UURBYjZDTWZ4MFJkZ2RCTmJlWjRHSjF2N2IvVXVJ?=
 =?utf-8?B?cUhyanNueFljWjdOZ0dsN25Sd09XaE54MVdiN1FUOWU5VFBZYUZCeUQzQm51?=
 =?utf-8?B?NkhzMUdhcE9VWGYvNmtyTXdhZEVod3oweFVZM0FlaXBlVzF0WGV5amRuTmRj?=
 =?utf-8?B?K0RxdEhhR1NybFY0THpEZFNBTEUvalhXdEZzdWdwZlFQcHk4akt3ditMcVp2?=
 =?utf-8?B?Z0RLazZldkExTHQrbFpRR2drSVhXR1UrMHFtcGZncmdUekhVeWN3c1JueHpi?=
 =?utf-8?B?VUZNaCtmWURLRjNIK1lLbzBPbXpJWDBWZjc4MVJOMU9KemtJSGVrdWJReFZ6?=
 =?utf-8?B?MGFIRXBVcUxMQUR0c0dmQXdBSHpONDMyNExMQVRMK2tBcmtJNVpUbytUN0Va?=
 =?utf-8?B?NGlNMytxdGcreFlYeXBVY3ZCTkE3VzZhV1FWSkdFaThHamFiSUtKRHBPVjdH?=
 =?utf-8?B?dk9INFN0Ull6ZmNCVDlUMUw4Tk5KREMwTzVDTk1vbkl3Qkt2V1l4dm9aYWZ4?=
 =?utf-8?B?dHNuL2dYSVdTaG1JVGhZMTJEVVcvNFZORzdSSzFLWWJ3cHY1aUtOQzNqRlNn?=
 =?utf-8?B?Yml5cm9oSGU3Yzc3VCt1akdTSTVDS0NMQ0EyRUlveFEvdncvWndpZ1R5dXk1?=
 =?utf-8?B?cGMxc1grSWlBSmxrdmhHUTZ6MlFzSWRNVHJUVkRxQnhGakoxMHZURGd6K0hh?=
 =?utf-8?B?cjIzRWdxRUczYzh6UW0zc1ltaWlQSGpaMzB2V1dhMERZMGV3UmEyQWVkc1kz?=
 =?utf-8?B?eXcxK0s4a3NRblh6UGZxaDhPaW04TFBXc2ZMdDQ4MXovc09QU28yeHN6TENF?=
 =?utf-8?B?blhxUTlNOTdnUjh0cHJGU1c1YjFkZThDTnNUZE0rbDloMUNBUEhybUszb3g5?=
 =?utf-8?B?SG1rTEQ0T2VMeGdYZHhnT09OcFFvbHdueGlybDIyZjBKaDVneVh6ZkdyVWxk?=
 =?utf-8?B?SFk2WlRYZlZYQmNwOUdMbU5GbnJNbUY5YlhDeS9QVXMydW9ZRXZsbDhISGd5?=
 =?utf-8?B?bVdHc1hVNmFUWW1nYjZFeExFcnhiNno0K2JjeUZTeGh6VCtsTHFWeUxTNTRx?=
 =?utf-8?B?UVQwWDc4RTFnRXNEZFdVZTAxYTZabTREQ3FnSkVzOXVUOTgyK2VVNWM4cFV1?=
 =?utf-8?B?QXZNYWdPUHYvNjBZd0dQb3pqRjQvMmtlOURzSTVUbHQxNEVaL1M3Z0xRVjJO?=
 =?utf-8?B?VFZSY09SbFlWYy9PaGM5M0VYYUlZMmdTRWFFd1hNODA0b0NFZDNDL2RvN2pE?=
 =?utf-8?B?L3pURVNrS3J6WUlONXJLQlVMS21uTWF3VlpzZ3lic1R5WVRkdUZrZ1RLRGJN?=
 =?utf-8?B?OUl5a014c2FHRmM2b0g5MkZsdWdCb2lJeWF1S3BPR0NKVjIvMndGYzRGU0dJ?=
 =?utf-8?B?Zlpoa0lsTjlmL0NUMldNc0UwYzBaRS9UTmpFYkY2SHBMbEJnVFQ2WFA3YUJP?=
 =?utf-8?B?cXY4aVF6a3VMVTN3TEdZenBjN3liV0NQMEpCYzZJTmphMlJhR1cwU3h0cXZ0?=
 =?utf-8?B?VktFNEZvbm82UUJ4WjJTWHJJclhtREVvQ01HZVpIRTI3dkgyUEFJZUVZYkFw?=
 =?utf-8?B?VXlrdnR1cStiYTBiWHFOeGYyYXNVS3NUV2J2bW1aVGJkdjAxY1FMMU12RTBV?=
 =?utf-8?B?T3YrTDR6MjV4SndZa0pYZ0Z1MmNRPT0=?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d11d67d-1a0c-4fbb-0a54-08ddacd5385a
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:56:33.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q35e5mCzebhXFGG3BXwVqLnTtmAmZp/j77Acy+TuPwwMbacXv21jl529TCslrxlfPYlgw9HzV23xg4JbFldnemSvlrYbmCzwQi8QaUQM3Vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2890

On 12.06.2025 15:30, Michael Tretter wrote:
Hi Michael,

Thank you for your review.
>Hi Yassine,
>
>Thanks for the patch.
>
>The overall architecture looks a lot like the video encoder for the
>ZynqMP, but with some significant differences in the details. I didn't
>manage to look more closely at the driver, yet, but I have a few high
>level questions.
>
There are a many difference between the ZynqMP, and the al300 drivers,
espicially on the mcu control. ( the al300 mcu is a 64bit ).

>On Thu, 05 Jun 2025 12:26:59 +0000, Yassine Ouaissa via B4 Relay wrote:
>> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>>
>> This commit introduces a new allegro-dvt V4L2 stateful decoder driverfor
>> the Gen 3 IP with support for:
>> - AVC (H.264), HEVC (H.265), and JPEG decoding
>> - Output formats: NV12, NV16, I420, and P010 for capture
>>
>> v2:
>> - Replace the mutex_(lock/unlock) with the guard(mutex), that manage
>>   mutexes more efficiently.
>> - Set DMA_BIT_MASK to 39, and drop the paddr check when allocating
>>   dma_memory.
>> - Use dma_coerce_mask_and_coherent to set the DMA_MASK.
>> - Use static initializer for some structs.
>> - use #ifdef instead of #if defined
>> - Optimize some function.
>> - Use the declaration in the loop.
>> - Use codec for al_codec_dev instead of dev, to not get confused with
>>   the device struct.
>> - Remove the codec member of the al_codec_dev, use the fmt->pixelformat
>>   when request creating decoder instance.
>>
>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> ---
>>  drivers/media/platform/allegro-dvt/Kconfig         |    1 +
>>  drivers/media/platform/allegro-dvt/Makefile        |    1 +
>>  drivers/media/platform/allegro-dvt/al300/Kconfig   |   23 +
>>  drivers/media/platform/allegro-dvt/al300/Makefile  |    6 +
>>  .../platform/allegro-dvt/al300/al_codec_common.c   |  733 ++++++++++
>>  .../platform/allegro-dvt/al300/al_codec_common.h   |  248 ++++
>>  .../platform/allegro-dvt/al300/al_codec_util.c     |  174 +++
>>  .../platform/allegro-dvt/al300/al_codec_util.h     |  186 +++
>>  .../media/platform/allegro-dvt/al300/al_vdec_drv.c | 1518 ++++++++++++++++++++
>>  .../media/platform/allegro-dvt/al300/al_vdec_drv.h |   93 ++
>>  10 files changed, 2983 insertions(+)
>>
>[...]
>> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_common.c b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..716d0004482702537ea89ec4abecd6af26654b32
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
>[...]
>> +static void handle_alloc_memory_req(struct al_codec_dev *codec,
>> +				    struct msg_itf_header *hdr)
>> +{
>> +	struct device *dev = &codec->pdev->dev;
>> +	struct msg_itf_alloc_mem_req req;
>> +	struct msg_itf_alloc_mem_reply_full reply = {
>> +		.reply.phyAddr = 0,
>> +		.hdr.type = MSG_ITF_TYPE_ALLOC_MEM_REPLY,
>> +		.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl,
>> +		.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl,
>> +		.hdr.payload_len = sizeof(struct msg_itf_alloc_mem_reply),
>> +	};
>> +	struct codec_dma_buf *buf;
>> +	int ret;
>> +
>> +	ret = al_common_get_data(codec, (char *)&req, hdr->payload_len);
>> +	if (ret) {
>> +		al_codec_err(codec, "Unable to get cma req %d", ret);
>> +		return;
>> +	}
>> +
>> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
>> +	if (!buf)
>> +		goto send_reply;
>> +
>> +	buf->size = req.uSize;
>> +	buf->vaddr =
>> +		dma_alloc_coherent(dev, buf->size, &buf->paddr, GFP_KERNEL);
>> +	if (!buf->vaddr) {
>> +		dev_warn(dev, "Failed to allocate DMA buffer\n");
>> +		goto send_reply;
>> +	}
>> +
>> +	reply.reply.phyAddr = (u64)buf->paddr;
>> +	al_common_dma_buf_insert(codec, buf);
>
>The buffers allocated by the firmware are tracked by device. Thus, there
>is only one list for all buffers used by the firmware.
>
>I guess that the buffers are be allocated per context. If that's the
>case, maybe tracking them per context in the driver would be a better
>option.
>
The mcu can ask for buffers at the startup, and also it can reuse some
buffers, with different contexts.

>> +
>> +send_reply:
>> +	ret = al_common_send(codec, &reply.hdr);
>> +	if (ret) {
>> +		al_codec_err(codec, "Unable to reply to cma alloc");
>> +		al_common_dma_buf_remove(codec, buf);
>> +	}
>> +}
>> +
>> +static void handle_free_memory_req(struct al_codec_dev *codec,
>> +				   struct msg_itf_header *hdr)
>> +{
>> +	struct msg_itf_free_mem_req req;
>> +	struct msg_itf_free_mem_reply_full reply = {
>> +		.hdr.type = MSG_ITF_TYPE_FREE_MEM_REPLY,
>> +		.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl,
>> +		.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl,
>> +		.hdr.payload_len = sizeof(struct msg_itf_free_mem_reply),
>> +		.reply.ret = -1,
>> +	};
>> +	struct codec_dma_buf *buf;
>> +	int ret;
>> +
>> +	ret = al_common_get_data(codec, (char *)&req, hdr->payload_len);
>> +	if (ret) {
>> +		al_codec_err(codec, "Unable to put cma req");
>> +		return;
>> +	}
>> +
>> +	buf = al_common_dma_buf_lookup(codec, req.phyAddr);
>> +	if (!buf) {
>> +		al_codec_err(codec, "Unable to get dma handle for %p",
>> +			     (void *)(long)req.phyAddr);
>> +		reply.reply.ret = -EINVAL;
>> +		goto send_reply;
>> +	}
>> +
>> +	al_codec_dbg(codec, "Free memory %p, size %d",
>> +		     (void *)(long)req.phyAddr, buf->size);
>> +
>> +	al_common_dma_buf_remove(codec, buf);
>> +	reply.reply.ret = 0;
>> +
>> +send_reply:
>> +	ret = al_common_send(codec, &reply.hdr);
>> +	if (ret)
>> +		al_codec_err(codec, "Unable to reply to cma free");
>> +}
>> +
>> +static void handle_mcu_console_print(struct al_codec_dev *codec,
>> +				     struct msg_itf_header *hdr)
>> +{
>> +#ifdef DEBUG
>
>What's the reason for making this a compile time option? Maybe a
>module parameter to enable MCU logging at runtime would be more
>friendly for debugging.
>

This will change to add debugfs. thanks
>> +	struct msg_itf_write_req *req;
>> +	int ret;
>> +
>> +	/* one more byte to be sure to have a zero terminated string */
>> +	req = kzalloc(hdr->payload_len + 1, GFP_KERNEL);
>> +	if (!req) {
>> +		al_common_skip_data(codec, hdr->payload_len);
>> +		al_codec_err(codec, "Unable to alloc memory");
>> +		return;
>> +	}
>> +
>> +	ret = al_codec_msg_get_data(&codec->mb_m2h, (char *)req,
>> +				    hdr->payload_len);
>> +	if (ret) {
>> +		al_codec_err(codec, "Unable to get request");
>> +		kfree(req);
>> +		return;
>> +	}
>> +
>> +	/* Print the mcu logs */
>> +	dev_dbg(&codec->pdev->dev, "[ALG_MCU] %s(),%d: %s\n", __func__,
>> +		__LINE__, (char *)(req + 1));
>> +	kfree(req);
>> +#else
>> +	al_common_skip_data(codec, hdr->payload_len);
>> +#endif
>> +}
>> +
>[...]
>> +static int al_common_load_firmware_start(struct al_codec_dev *codec,
>> +					 const char *name)
>> +{
>> +	struct device *dev = &codec->pdev->dev;
>> +	dma_addr_t phys;
>> +	size_t size;
>> +	void *virt;
>> +	int err;
>> +
>> +	if (codec->firmware.virt)
>> +		return 0;
>> +
>> +	err = al_common_read_firmware(codec, name);
>> +	if (err)
>> +		return err;
>> +
>> +	size = codec->firmware.size;
>> +
>> +	virt = dma_alloc_coherent(dev, size, &phys, GFP_KERNEL);
>> +	err = dma_mapping_error(dev, phys);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	codec->firmware.virt = virt;
>> +	codec->firmware.phys = phys;
>> +
>> +	al_common_copy_firmware_image(codec);
>> +	err = al_common_parse_firmware_image(codec);
>> +	if (err) {
>> +		al_codec_err(codec, "failed to parse firmware image");
>> +		goto cleanup;
>> +	}
>> +
>> +	err = al_common_setup_hw_regs(codec);
>> +	if (err) {
>> +		al_codec_err(codec, "Unable to setup hw registers");
>> +		goto cleanup;
>> +	}
>> +
>> +	al_codec_mb_init(&codec->mb_h2m, virt + codec->firmware.mb_h2m.offset,
>> +			 codec->firmware.mb_h2m.size, MB_IFT_MAGIC_H2M);
>> +
>> +	al_codec_mb_init(&codec->mb_m2h, virt + codec->firmware.mb_m2h.offset,
>> +			 codec->firmware.mb_m2h.size, MB_IFT_MAGIC_M2H);
>> +
>> +	err = al_common_start_fw(codec);
>> +	if (err) {
>> +		al_codec_err(codec, "fw start has failed");
>> +		goto cleanup;
>> +	}
>
>If I understand correctly, the difference to the ZynqMP firmware is that
>the firmware can be configured for different addresses. Thus, the
>firmware and mailbox addresses on ZynqMP are determined by the bitstream
>synthesis, which this driver is free to allocate memory for the firmware
>and mailboxes wherever it wants. Correct?
>

There are some similarities between mailbox of the mcus ( zynqMP and
al300 ), but i'm actually working on the remoteproc and rpmsg for the mcu
control and IPC and messaging between host and the mcu.

the feature should be enabled with the encoder patches.
this should make the v4l2 easy with less files.
>> +
>> +	al_codec_dbg(codec, "mcu has boot successfully !");
>> +	codec->fw_ready_cb(codec->cb_arg);
>> +
>> +	release_firmware(codec->firmware.firmware);
>> +	codec->firmware.firmware = NULL;
>> +
>> +	return 0;
>> +
>> +cleanup:
>> +	dma_free_coherent(dev, size, virt, phys);
>> +
>> +	return err;
>> +}
>> +
>> +static u64 al_common_get_periph_addr(struct al_codec_dev *codec)
>> +{
>> +	struct resource *res;
>> +
>> +	res = platform_get_resource_byname(codec->pdev, IORESOURCE_MEM, "apb");
>> +	if (!res) {
>> +		al_codec_err(codec, "Unable to find APB start address");
>> +		return 0;
>> +	}
>> +
>> +	if (res->start & AL_CODEC_APB_MASK) {
>> +		al_codec_err(codec, "APB start address is invalid");
>> +		return 0;
>> +	}
>> +
>> +	return res->start;
>> +}
>> +
>> +int al_common_probe(struct al_codec_dev *codec, const char *name)
>> +{
>> +	struct platform_device *pdev = codec->pdev;
>> +	int irq;
>> +	int ret;
>> +
>> +	mutex_init(&codec->buf_lock);
>> +	INIT_LIST_HEAD(&codec->alloc_buffers);
>> +	init_completion(&codec->completion);
>> +
>> +	/* setup dma memory */
>> +	ret = al_common_setup_dma(codec);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Hw registers */
>> +	codec->regs_info =
>> +		platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
>> +	if (!codec->regs_info) {
>> +		al_codec_err(codec, "regs resource missing from device tree");
>> +		return -EINVAL;
>> +	}
>> +
>> +	codec->regs = devm_ioremap_resource(&pdev->dev, codec->regs_info);
>> +	if (!codec->regs) {
>> +		al_codec_err(codec, "failed to map registers");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	codec->apb = al_common_get_periph_addr(codec);
>> +	if (!codec->apb)
>> +		return -EINVAL;
>> +
>> +	/* The MCU has already default clock value */
>> +	codec->clk = devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(codec->clk)) {
>> +		al_codec_err(codec, "failed to get MCU core clock");
>> +		return PTR_ERR(codec->clk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(codec->clk);
>> +	if (ret) {
>> +		al_codec_err(codec, "Cannot enable MCU clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0) {
>> +		al_codec_err(codec, "Failed to get IRQ");
>> +		ret = -EINVAL;
>> +		goto disable_clk;
>> +	}
>> +
>> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
>> +					al_common_hardirq_handler,
>> +					al_common_irq_handler, IRQF_SHARED,
>> +					dev_name(&pdev->dev), codec);
>> +	if (ret) {
>> +		al_codec_err(codec, "Unable to register irq handler");
>> +		goto disable_clk;
>> +	}
>> +
>> +	/* ok so request the fw */
>> +	ret = al_common_load_firmware_start(codec, name);
>> +	if (ret) {
>> +		al_codec_err(codec, "failed to load firmware : %s", name);
>> +		goto disable_clk;
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_clk:
>> +	clk_disable_unprepare(codec->clk);
>> +
>> +	return ret;
>> +}
>> +
>[...]
>> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_util.h b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5f893db4a1a3f2b9e6e9109b81a956bcaa71851c
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
>> @@ -0,0 +1,186 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (c) 2025 Allegro DVT.
>> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
>> + */
>> +
>> +#ifndef __AL_CODEC_UTIL__
>> +#define __AL_CODEC_UTIL__
>> +
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +#include <linux/v4l2-common.h>
>> +
>> +#include <media/v4l2-mem2mem.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#define MB_IFT_MAGIC_H2M 0xabcd1230
>> +#define MB_IFT_MAGIC_M2H 0xabcd1231
>> +#define MB_IFT_VERSION 0x00010000
>> +
>> +#define MAJOR_SHIFT 20
>> +#define MAJOR_MASK 0xfff
>> +#define MINOR_SHIFT 8
>> +#define MINOR_MASK 0xfff
>> +#define PATCH_SHIFT 0
>> +#define PATCH_MASK 0xff
>> +
>> +/*
>> + * AL_BOOT_VERSION() - Version format 32-bit, 12 bits for the major,
>> + * the same for minor, 8bits for the patch
>> + */
>> +#define AL_BOOT_VERSION(major, minor, patch) \
>> +	((((major) & MAJOR_MASK) << MAJOR_SHIFT) | \
>> +	 (((minor) & MINOR_MASK) << MINOR_SHIFT) | \
>> +	 (((patch) & PATCH_MASK) << PATCH_SHIFT))
>> +
>> +#define al_phys_to_virt(x) ((void *)(uintptr_t)x)
>> +#define al_virt_to_phys(x) ((phys_addr_t)(uintptr_t)x)
>> +
>> +#define DECLARE_FULL_REQ(s)    \
>> +	struct s##_full {            \
>> +		struct msg_itf_header hdr; \
>> +		struct s req;              \
>> +	} __packed
>> +
>> +#define DECLARE_FULL_REPLY(s)  \
>> +	struct s##_full {            \
>> +		struct msg_itf_header hdr; \
>> +		struct s reply;            \
>> +	} __packed
>> +
>> +#define DECLARE_FULL_EVENT(s)  \
>> +	struct s##_full {            \
>> +		struct msg_itf_header hdr; \
>> +		struct s event;            \
>> +	} __packed
>> +
>> +struct al_mb_itf {
>> +	u32 magic;
>> +	u32 version;
>> +	u32 head;
>> +	u32 tail;
>> +} __packed;
>> +
>> +struct al_codec_mb {
>> +	struct al_mb_itf *hdr;
>> +	struct mutex lock;
>> +	char *data;
>> +	int size;
>> +};
>
>On a first glance, this looks a lot like the allegro_mbox in the ZynqMP
>encoder driver. Even though the message format is different, would it be
>possible to generalize the general mailbox handling and use it for both
>drivers?
>
>Michael
>
>> +
>> +struct al_codec_cmd {
>> +	struct kref refcount;
>> +	struct list_head list;
>> +	struct completion done;
>> +	int reply_size;
>> +	void *reply;
>> +};
>> +
>> +#define al_codec_err(codec, fmt, args...)                               \
>> +	dev_err(&(codec)->pdev->dev, "[ALG_CODEC][ERROR] %s():%d: " fmt "\n", \
>> +		__func__, __LINE__, ##args)
>> +
>> +#define al_v4l2_err(codec, fmt, args...)                               \
>> +	dev_err(&(codec)->pdev->dev, "[ALG_V4L2][ERROR] %s():%d: " fmt "\n", \
>> +		__func__, __LINE__, ##args)
>> +
>> +#if defined(DEBUG)
>> +
>> +extern int debug;
>> +
>> +/* V4L2 logs */
>> +#define al_v4l2_dbg(codec, level, fmt, args...)   \
>> +	do {                                            \
>> +		if (debug >= level)                           \
>> +			dev_dbg(&(codec)->pdev->dev,                \
>> +				"[ALG_V4L2] level=%d %s(),%d: " fmt "\n", \
>> +				level, __func__, __LINE__, ##args);       \
>> +	} while (0)
>> +
>> +/* Codec logs */
>> +#define al_codec_dbg(codec, fmt, args...)           \
>> +	do {                                              \
>> +		if (debug)                                      \
>> +			dev_dbg(&(codec)->pdev->dev,                  \
>> +				"[ALG_CODEC] %s(),%d: " fmt "\n", __func__, \
>> +				__LINE__, ##args);                          \
>> +	} while (0)
>> +
>> +#else
>> +
>> +#define al_v4l2_dbg(codec, level, fmt, args...)             \
>> +	do {                                                      \
>> +		(void)level;                                            \
>> +		dev_dbg(&(codec)->pdev->dev, "[ALG_V4L2]: " fmt "\n",   \
>> +			##args);                                              \
>> +	} while (0)
>> +
>> +#define al_codec_dbg(codec, fmt, args...)                         \
>> +	dev_dbg(&(codec)->pdev->dev, "[ALG_CODEC]: " fmt "\n", ##args)
>> +
>> +#endif
>> +
>> +#define MSG_ITF_TYPE_LIMIT BIT(10)
>> +
>> +/* Message types host <-> mcu */
>> +enum {
>> +	MSG_ITF_TYPE_MCU_ALIVE = 0,
>> +	MSG_ITF_TYPE_WRITE_REQ = 2,
>> +	MSG_ITF_TYPE_FIRST_REQ = 1024,
>> +	MSG_ITF_TYPE_NEXT_REQ,
>> +	MSG_ITF_TYPE_FIRST_REPLY = 2048,
>> +	MSG_ITF_TYPE_NEXT_REPLY,
>> +	MSG_ITF_TYPE_ALLOC_MEM_REQ = 3072,
>> +	MSG_ITF_TYPE_FREE_MEM_REQ,
>> +	MSG_ITF_TYPE_ALLOC_MEM_REPLY = 4096,
>> +	MSG_ITF_TYPE_FREE_MEM_REPLY,
>> +	MSG_ITF_TYPE_FIRST_EVT = 5120,
>> +	MSG_ITF_TYPE_NEXT_EVT = MSG_ITF_TYPE_FIRST_EVT
>> +};
>> +
>> +struct msg_itf_header {
>> +	u64 drv_ctx_hdl;
>> +	u64 drv_cmd_hdl;
>> +	u16 type;
>> +	u16 payload_len;
>> +	u16 padding[2];
>> +} __packed;
>> +
>> +void al_codec_mb_init(struct al_codec_mb *mb, char *addr, int size, u32 magic);
>> +int al_codec_msg_get_header(struct al_codec_mb *mb, struct msg_itf_header *hdr);
>> +int al_codec_msg_get_data(struct al_codec_mb *mb, char *data, int len);
>> +int al_codec_msg_send(struct al_codec_mb *mb, struct msg_itf_header *hdr,
>> +		      void (*trigger)(void *), void *trigger_arg);
>> +
>> +static inline bool is_type_reply(uint16_t type)
>> +{
>> +	return type >= MSG_ITF_TYPE_FIRST_REPLY &&
>> +	       type < MSG_ITF_TYPE_FIRST_REPLY + MSG_ITF_TYPE_LIMIT;
>> +}
>> +
>> +static inline bool is_type_event(uint16_t type)
>> +{
>> +	return type >= MSG_ITF_TYPE_FIRST_EVT &&
>> +	       type < MSG_ITF_TYPE_FIRST_EVT + MSG_ITF_TYPE_LIMIT;
>> +}
>> +
>> +void al_codec_cmd_put(struct al_codec_cmd *cmd);
>> +
>> +struct al_codec_cmd *al_codec_cmd_create(int reply_size);
>> +
>> +static inline struct al_codec_cmd *al_codec_cmd_get(struct list_head *cmd_list,
>> +						    uint64_t hdl)
>> +{
>> +	struct al_codec_cmd *cmd = NULL;
>> +
>> +	list_for_each_entry(cmd, cmd_list, list) {
>> +		if (likely(cmd == al_phys_to_virt(hdl))) {
>> +			kref_get(&cmd->refcount);
>> +			break;
>> +		}
>> +	}
>> +	return list_entry_is_head(cmd, cmd_list, list) ? NULL : cmd;
>> +}
>> +
>> +#endif /* __AL_CODEC_UTIL__ */

