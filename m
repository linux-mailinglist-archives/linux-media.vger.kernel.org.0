Return-Path: <linux-media+bounces-34700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F7FAD8137
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 04:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F9F11899172
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 02:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25F323D290;
	Fri, 13 Jun 2025 02:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u9az4Wfm"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B21433A8;
	Fri, 13 Jun 2025 02:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749782812; cv=fail; b=mIM26TlXT+3OdHybXTcqKh1+JqgugS8AJy9W0iZ9VtEA667Fuqw2lPP3MzztZh0YzLVwJjdvRYhDRq6ILVMQxFVS7GtJ7uHhrGvwGlmrxEPdumDb8hSJvJZTjcJb8YzVaZ26RgwqFVevA/wgjvZi7SjZ6AkWk0iSMNBNG/EpYJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749782812; c=relaxed/simple;
	bh=ow02Uj74fGMGwJyAD4jk/3P0va7zOrUvY0MruLMOjOQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m9KaVBIXsTfCLRQkTVwZgzHvSChITdt77EAhWJ48GkemUg6DlQRcnSdKwGpwJ7jOs3I4+d6KzzwQwWxMps9hM/e8BuGSlqO3bl01tfOzdvliaRca7/SucFxcvWIxhEo38gZArsbhqoUYrwgqwXGfQ2H/qT5fYfuFLCrA+EEHcVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u9az4Wfm; arc=fail smtp.client-ip=40.107.236.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhWkApZPUS3iOEsPWYUmBV/YydB757Fl0/UXyV251FY1m5sPqcUvcI69NXYQUCPOBcctZohinFr9+Kr0wuTkFv9evLUi8e7sMzmYWEtMp/qa2c7ocLBIE1PD0BFzX1wLHrLCGzDWkRfK8VaNCp/HPUyPxPfG5OcagwkSQjIZA9BszdgMUVb6qMF/V1t0RWLIWkXAgLY0QACpRNv/XIGbL0VdpZvJ9DJdqcU2qanSC+G/IivpW5WYfZyIWyffaDgTyny2vDG13nQsivdIkY7nN3DivjoyB8nxDzgeBol8WOrXyhOt1sDiavhyebq8lE3Zkwe7iEhb/4yiZ6IIF5Hd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lvh/nUdZc5a+DUxgZVRExHRld3QurKrZF8iTHvQYuvw=;
 b=UX5S3P2kJNBUQxf73mIiVhb6Yh4xqrvAfhR5MpS9/JwQjWcz9fhXhrM3Palf47yd35QyJu6lj6D/4rg3iOv5yNIa0SmKCv0nihmmUl1ValxIMVwTPUY7sDu6ipffw+yo9Y3HRiFWOJnlgVCVovUd5n5twmEjOhjQbNenztc6KAWj6gpBWwl8GpC6sd0VIxZy/iSLYYF+oSbYgyHWiuhAOOznMkkqfs4gl0HgEmu/K50RaRJRB+1qL2cHLurcX/cUefhASQ+5KjeH3aUa6Km0YtYhoAsmN/Hw3lt9eyvbWakBiaRq5bngQqE0teSXKZVOXpbBsPYX28jLwXuLoi/oTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lvh/nUdZc5a+DUxgZVRExHRld3QurKrZF8iTHvQYuvw=;
 b=u9az4WfmUr6mFEemTh3+4M5o3JPRwKZlEOBeIiTVa8j4y/FItrFI5/czWj/atryeKGhu/KYpXhPqNBhOuOnqe33+o16Y2h9z3SzTHBt4HmTteP6G0sKudZrh335WDtyxJn0ip8/QZeO04z+ykRiEA1L+3wb99jlrBu6aBdbkGto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Fri, 13 Jun
 2025 02:46:47 +0000
Received: from MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137]) by MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137%7]) with mapi id 15.20.8792.040; Fri, 13 Jun 2025
 02:46:47 +0000
Message-ID: <afdcbc3a-8f25-42e2-9875-14ee386db9bd@amd.com>
Date: Fri, 13 Jun 2025 10:46:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 9/9] MAINTAINERS: add entry for AMD isp 4 driver
To: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250608144916.222835-1-Bin.Du@amd.com>
 <20250608144916.222835-10-Bin.Du@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250608144916.222835-10-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To MW5PR12MB5683.namprd12.prod.outlook.com
 (2603:10b6:303:1a0::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5683:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: dc89d7a2-4e9c-4b31-7cdb-08ddaa248958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VldSUktKS1V1YmRrYjZyeFZXQmNTNnNpcHZkMlp5dTc1ZzkrRHp2L2JVQ2dR?=
 =?utf-8?B?cnlmL050aHg2U0dFUWMvb1UxNW9MVktjNDlJa0FtaDhYM3Flck15MXIzRjBY?=
 =?utf-8?B?aFJxSW9qb2RlY1NWdmI2bEJqdFNQYmdHU3hwRXBiMGQyM09UWWZZUmRKbUVL?=
 =?utf-8?B?OWdnVUxJN0NQNFcvRzl0dkM0ei9lekpPMU0zT0dwbzRoVWFVcDlJYmV0cEJ1?=
 =?utf-8?B?a0M0Y0JrbzhGMUlMY29Ka0hTNHBLTCsvWHFobmpuTXJWQmJCWFNWeG5SRTA1?=
 =?utf-8?B?eHZYbDEwWFlicUFRSk5DejVHamJ0SU9ZWHJJVHlrb1QyRytGTEFDbEZsL1RG?=
 =?utf-8?B?aXZBVzR2bkZCNEFWdWk1VzNodTFMcW5NMVVtUlo0bVVwU0lEV2h3UTFzNXFP?=
 =?utf-8?B?Tm5uNVkwUlArbW5aYmlkUGNjSXpLajhGM1hxQkdhd1k0dVdtaURaMnZaY0J3?=
 =?utf-8?B?WDl6bmpXL2h6d0E5Q0pvc1hnYWxBbjhhYTJlaDRJSklSRUwwZGJyRGRFcUgv?=
 =?utf-8?B?UDlUNE43Z0JYcG9zcVZiNUJFOHQ5eWZ0dlZuVHhsekI4UDFja0VOd01manhY?=
 =?utf-8?B?b3JDMlJVNzdNQmVQWDkyZmpiUk1SdTBiRU5CNUV6SGhLME80emtoM0RTcG5E?=
 =?utf-8?B?QlozVVcySnVtYzg3V2p2S2FZSHlDRC9EZG4wK0ZLWmNJNS9zaW1tSWRmNEZx?=
 =?utf-8?B?NDB6ZlU1K1RFYTh0ejlyTFM4UlVvb2c2bjRtdFdDbVhaZUhCK2RWRW00QzN4?=
 =?utf-8?B?anJ5V2UvdzRuTWxzSkp5SStmQUlLQ3lIVnA3TlV1R203Qjc2R2xNdENPWHV3?=
 =?utf-8?B?aU5mUXdUZzgrQ1pwWE8zeXRrMXlpOHFkeXlNb0sxbTNRUG9NRUQvSTBSeXNw?=
 =?utf-8?B?cms5WkxQRXI4Q0tSMUR2ZStOZndyenNUa3BjK0F6c1NZTmFkUzN2NDB3bHpi?=
 =?utf-8?B?SGhKVDQwVDNHWjhZRnRZQXE2amMzanhJRndxTHZacFFxZHJpZmFocHl3Z2Nr?=
 =?utf-8?B?UXIyeVR5Qko4TzNINkNMUWswQzI0ZTMwNm5RVE8yVHNQYXNyMUhEcjdXYWdG?=
 =?utf-8?B?b255TU9LbmNYaU5MTFlsbDNwVTBIendZWUROWlNrL0FnUWVweENVdHFxcUZB?=
 =?utf-8?B?UERMR1pLYUVCL0U5bGxIeERmSloyeGNxTTB0czhLNkpqWWVEZVFCR3ltYWNN?=
 =?utf-8?B?dXhGVlVjb1lKejgwZlBZbzhZZUFRWnBhNjN3czEwMFNvZUVpekU4UStWMXNw?=
 =?utf-8?B?ZU9WemRWSklTWVgyZTFEclZ4Ly93WUFpenhoRE9GNWM0dFd4VGs1SVFvb3d4?=
 =?utf-8?B?MGdKZG1WRm5tOU9uZDloQzhnZzd5bjZtdFhWbXF4YUtVOGhuVm5kNGlTV0pB?=
 =?utf-8?B?R0xIQ21OMjl5dHFiSytpd21jRTJSOUhBT05NMzA5NElmRnF5K2FGQ3ZrMFcv?=
 =?utf-8?B?cDU1UEJsemxYNHZ0MjA3Y25kWjNBVWJjRzdzK0h3YUU3MjhrdGFmU290eFBk?=
 =?utf-8?B?RDQwVGFwekxKQmhWbHFvMEZRMjB2SjM2SVhNK0xlUTNzTThPMkFqYk9KOE5s?=
 =?utf-8?B?enZEb0tGbzdQbzBnTlVhczJFVU52NkpMMWFJTHhTZDBkWWhhQ1QrRS93enBO?=
 =?utf-8?B?UnU1RzdNcHlDK1BXUjdtanFycGxtaks5WVEyMmJ6dkZxdlh1cDlTRzFyOFRB?=
 =?utf-8?B?SkJZaXlSRVFiVXRDU2NNVEVBTmlxSFExaHNtL2tjUXlkYVBqUUszQzB6eGNs?=
 =?utf-8?B?VTZRWHNjclZMUU5IU1FNblNmV0o1WmgwY1ljY1ZIUlRxczZyYkx6TVd4TDN5?=
 =?utf-8?B?d3hiT1h4bnBTc1VzM2xWWnZOemNEbnBYaCtoNzhaK0RYTUhnem1SQ0dFdDlC?=
 =?utf-8?B?YlZBQmFkbUEvVjRTTlI4VWx5aE8zL1NNV1o1K3lLOHF3LzBYOVRVcWx0UnB1?=
 =?utf-8?Q?JWS3ZmzPCv4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR12MB5683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlAwdk5ZRmZCd2t4T0lHWTJHWUZxNUd0M0lSYmJqc1plOVh2YURtT2kwcTJr?=
 =?utf-8?B?aU85SUsvOE1WVGtzZ08yMjRvK0dyR3B0R29sbTUxdi9INGdLZVl3Y0IzeHpO?=
 =?utf-8?B?YlRtZUhPNEw1LzdWMXRtVld6QUNZaUFDeWI5Nkw5VmdESXpXWmhWUTJ4MW03?=
 =?utf-8?B?eFppZ2drVlRvaEVrQWJEV0dqZzNDVWpQR21BS1Y3WXNsaUh0WVJ3ZHVRRjJW?=
 =?utf-8?B?Zlh6djNlNTVieEhQdmNvcjZ2K2kxcFBRQVFyVWNLNEs5V1VwU0JKcFZzenJy?=
 =?utf-8?B?SmVKS3ovenVmYjR1ZGtpUG41TDVXcG9NSWhCWk9GSWVkNFZ4eHorSlRyV3Bx?=
 =?utf-8?B?Q0RLalFRbTBBLzY4endtaExkTXVPdjZPbU9PVEk2RzgrTlJiYmx2MjJETWd0?=
 =?utf-8?B?cjZ0UFQ0YzQyMVp6RHpQeFhSQnpObjhMR1NjdUw1Q0JZWkIwVWE2MzMrL3Fx?=
 =?utf-8?B?VHRpZlF2TXdjVnpyWTZuM1V2Wi91emFQaXBxSUc1UGdqdm5zZkJzanR3d0xa?=
 =?utf-8?B?bDhxVUtwRXNsNEpIcXlzc2lOWWZaZGFMQXpISkhEdzJZb1BabHJZT1k4dm5S?=
 =?utf-8?B?bGlwcTY2TXV1UnA5d3laVDN2WU0wTEliTUdzQW1rQ0g0MldZYnZGUHdxRjMy?=
 =?utf-8?B?V1UzZU5XZG5pV1J4eUVLUDd0WElub2dlMXhYK0JaNXRzVmZJbWtjN01JSWg3?=
 =?utf-8?B?Qlp3cU53WW4xRmZoejRDZmMxOHczYkNMYlZ5eVROc2lZK0N5eEVVbjU5QU4y?=
 =?utf-8?B?VSthWGxseUlqSjNRSThVbDBSaTZLMVlQNlBJVW10Y2YrM1FQK0dkMkJwQi9Q?=
 =?utf-8?B?WUIzaWhLSkZzZ3M0Qmh0d2FlNFlRMUlsUm5nZUZrUXRLL1N5UFZFcnlIRjgx?=
 =?utf-8?B?K01EL3RXcGhKRUxQNDMvSmUvTGRKdzBmM01acnJKTXZuelFWOWI1SVB4UTFz?=
 =?utf-8?B?V3ROeTdoVlE5V3Y0UDAvQWVVVXVqSXBQTE9GT2NKZlMrU0w5QTNRMmxqMFVY?=
 =?utf-8?B?UDRFOXppeTJnVjdVNXV6NmxacHVrUmVYeFV2V09NeVp6c1lPc3JEd2hLWVVD?=
 =?utf-8?B?K2dTMW5NbytVTVFFUldpaGF3azVUUXI0NzFpa05HQldjZVFCazBNRzJNMHU5?=
 =?utf-8?B?QmY2amhiQnY4UDY2NmJDS0U5cFNhR1VRVW1LN01xWE1sQ1ZlSm1nUDdrSlo4?=
 =?utf-8?B?NEN6ZGZ3ZmFQQTJuSEpna2tleWhjS2NBd1Y2KzhnbVJ6M1N1TFhaaWwwQUkw?=
 =?utf-8?B?VEhSOGRrcGZHb0Y0VXBHRk93QXc5WWhkWE1VL3V3Nk10NmdBdTVaL3dIWUEv?=
 =?utf-8?B?Q2FmdWhXaXpoVEg0L1lBVUhTckdKVkh2M2MvcEFIZ1VDV0lSUFVXRExIOFZT?=
 =?utf-8?B?ZU0zQnhadnJPL3VSUHEveDNpcWlicHd3MHpuU3RybEVyMHgwMHdhcmFHK2RN?=
 =?utf-8?B?S0svSm1vaUNFYkFkNDl1cjdOd0lsaytNZjhRYThsRy9nNkdSREJQQmlGS0dO?=
 =?utf-8?B?NUV6YllELzNCQ01vUk5KNkE5SHJtbmNjVld5TVRYWnkxOFhoNmhxa1NNREo3?=
 =?utf-8?B?RUFoa3BSemt1T0hlMFhmd1JMU09tbVUwdWppSkZKV0V0c1FvMXIxQjhIYk9I?=
 =?utf-8?B?MVVSMlorWmlmSEV1dXNURTNOZW1EWjlvRGZ3Uk1GR0hHVGxjd2VFRzVCbENR?=
 =?utf-8?B?b1JacEJaUmp1b0ErN3ZqTVlyN1BvVVoyNnpIVk9WcjRyNnU2QWszSjZSaURZ?=
 =?utf-8?B?YXhZdUZpN0lFeThvQVhDQVJwdjVTRENDZjRrVnpKT3loUWg2LzUxMzRpdEJW?=
 =?utf-8?B?aGVVSFI3NnlmK2pQeDRBTW9qZ0R1VFlmTzhwSE8zSXR5MEM3ZDZCMHdkWllI?=
 =?utf-8?B?Uitudi9LdXNtUU1KcEJLMnpkU3hlTVVLTkNxaURaOHBHeGRRRW94dCt5ZFlu?=
 =?utf-8?B?UzVKUVRmU2tuRG9jdWNBU0d5ZzZQMXR2dFA1M3FCb3pIV1NCMVpFSTBETjNE?=
 =?utf-8?B?YmF0RHJNNEVFYThJNXlCOENldVk3YnpqQmdBK21VU2VQVThQdFgyQ2s5NFVq?=
 =?utf-8?B?ZzdvdEd5V2RzYWtOamJmbFlQSXJiMzc2dEZYSUJ6V1B0R1RycFl5UkVqN0c1?=
 =?utf-8?Q?8RmU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc89d7a2-4e9c-4b31-7cdb-08ddaa248958
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 02:46:47.3764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWBxUSA2h/PVT4RMMpqzda0UoUigzgGLxBCrsiaDJr8nHCC3Nlo2V6UToUMNJPC5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796

Change-Id should be removed and this MAINTAINER modification patch can 
be merged into patch 1/9
Will fix them in V2

On 6/8/2025 10:49 PM, Bin Du wrote:
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Change-Id: I715f1318f02e4a689fefc98fc983caca9c448ef2
> ---
>   MAINTAINERS | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10893c91b1c1..15070afb14b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1107,6 +1107,16 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>   F:	drivers/iommu/amd/
>   F:	include/linux/amd-iommu.h
>   
> +AMD ISP4 DRIVER
> +M:	Bin Du <bin.du@amd.com>
> +M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git
> +F:	drivers/media/platform/amd/Kconfig
> +F:	drivers/media/platform/amd/Makefile
> +F:	drivers/media/platform/amd/isp4/*
> +
>   AMD KFD
>   M:	Felix Kuehling <Felix.Kuehling@amd.com>
>   L:	amd-gfx@lists.freedesktop.org


