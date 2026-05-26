Return-Path: <linux-media+bounces-62776-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKHmJ1NzFWpbVAcAu9opvQ
	(envelope-from <linux-media+bounces-62776-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:17:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0405D40B1
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5394830128C0
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06AB3DD515;
	Tue, 26 May 2026 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uedi+Mby"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179033D9038;
	Tue, 26 May 2026 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779790670; cv=fail; b=NlHsQFaaRSa60JYu6c21OJ7ugEtJZ6tnwgwSdAeK2pu6MQYM4Wz+1NfEL00jOWoaHq+KUpGmiQlgYav6BHciAP6oyrJot60zEHdJTbIjzMHnfLG1iOVtANSWH6Mc42TIY0pZGMfSSF6SAWzCkfpK1U4082722pUW6P1Mi3cxmVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779790670; c=relaxed/simple;
	bh=yIGSdRco2sksmfWEkg6zuxeY2Ky1aZRHx0tzX+TOp+E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FbN2+UOcae8Q5h0bSWVX/TNw/e9HQUGzGNFW4jDjCowf9Dwrcsg8rdxW0/YVdSW+bHowCP2jfNVy8cAjGNcvUDtTEb0fSJNt5DjNggYGpnowGfn8UbZK9uK/xPQkMKYeIWG4ZGPraefeWDXKYtPMDgfgl+JPl9zpnKjmYuZLR0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Uedi+Mby; arc=fail smtp.client-ip=52.101.53.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+M/AU9C6dkIRLL6zGo4EsEa2r6b6cf3fsRR3ScZu5JhKmJRy/YQoIxvYm7uAw8WbpnsHOWyxF7CDBjGuN0wUdokAgL5wJbxV+SdgsuOyOc7bAQu0xwXKbFPk0bWDXq+eJSROcaJ5P8Cco9le1RuT8tmXuMZ7Y2OvwrqyF8fxMtUzSOR/DYd37ql97BWqoGvNfikq8XDDkisiAFohBW1Sx5q71d3ysPAosu9A7dAe91EP5MOS6FVWaNUkxCNPhAd8hvkJxq88fjEKnekHjCKHoTlHGvxFNBhS1N8OltqTuttEJAalEJ/G0jUKyVCJIOJj897y1Uzomz+/0hGn0FZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nu/A+i3bC4bFOi5+pds3322Nzg9L3QD2Xmox3C7zxq4=;
 b=b951k6bakv9D3gUvy3U/cfISJNXufl+pJL4s5B8Vavq4849EFVIYUyNjBFVEofHVIfMLrm3ZN+gjbF7+o/Tzu1v/m9MvT66+0m8Vd6ARf/m1wusQawUPSzrWNevnsm60RjeI4JCgNvCgvkXkJUb3Xnx8FSpw7lDgtVh2BhFk0jj5tBKptl98soGP+wGe0VrMOEuAbEvs6yW451v3E8alPqrF7RrgoTSuI8oUWv18BQjLwo7k3TKurkeNP4jvbz3B3Cb38arpSpDJMfxNim1jlFua5DBVVTFTK4jcWYbw/wBeqla12Tq2KmX19eohfsa0XXRLHJ73mWm3l2Kyc6vOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nu/A+i3bC4bFOi5+pds3322Nzg9L3QD2Xmox3C7zxq4=;
 b=Uedi+MbyrNNE5hTpjFe+9KGGiwoz2x6YmOIW7V8+0yr0nWlN7NNeglDdBAjPVbSRdB+3dYE23Dz3OUJbiC7dawKVu6PfrNFKZ4A5CQkjA0CzSU+mCsSQSpKZK6KvuvSC47gfXPuwdg9AidwMfcUqAfIb/2i+C4Td5wBdIomR/0CWP5KSGiL/8g2p7I4CxK2neE3iUJNTA3O0cFN7IUWcStZgwrdcvd9EeyhXOVpZR+4oGVL+pY3d3/evP24giavTRn2SHzTejqvjX+Yc3ZIu6gConBp4YP0C48OkD9+bw+Q3uMtNJWRz7+XsQKoozID4qOBEpWhPdAbWNPnC/lb9gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 10:17:44 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 10:17:44 +0000
Message-ID: <5bb4e29e-10e8-43f0-9a62-a2d9ec8ecb32@nvidia.com>
Date: Tue, 26 May 2026 11:17:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] soc/tegra: pmc: Clean up legacy code
To: Thierry Reding <thierry.reding@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::18) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: decae07e-6e75-41c3-4d47-08debb1006d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|6133799003|921020|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Qfhf98gZZxalUTPmk6d6Xl9Efuszw4z9cvC/XANB7RY5CXfCFtyvpbaZ7O01vlOb9/TF1v5H2kNqdZeA5xo5Ym8h2xLUqvWpK+b2/kL0UsGmiHDMJyOb2Nz7m8Tk8plpgUkwZcQoQXnsY5fh9zeXz+Fo2VKy1j1DTlGuOwK64Ybce2aUGPyrzC0YMA7JpLjqOEVXWQtNAEOQhelBrkHdoa3Z74cDKGeUv8nRNh8UUPNF307t63kK3bsw6KoL5wmC9czrDPDrwsFVrShoSsVUDVvd4QVXHp89buguNq83P3Mp0x+fNYxCIPbUpZCNiuPJZ9yP5/PS2hZ/Gk7rxV1gMy4eIKDV7XJu8Uxuu7lv4Y1WkwaBl1fHqAoB7066HL1O/Vfr2+9zVpbDz/zmp3r5CyLv3AMpcwfl3xKzgxQT90Sgis85p9/3dIHzOvduYYcly7wyJpk8DJk9aMVmhbrYImHeDyXwU0n1N6QlsP2cSesTotCh3oRF7l+vttRgi2cepl70hKBX5314vtj21pgEymUS2X1eAwHxTHkbqunEYx5glhrqLbSipAjAGx0FOuWiMwye304H/G+ZaCVCXWjTFss5GAbUlUstdZCaX/MW1S42CU+lpPA6vkThObevAYbiS2UxfSbVJ+hqAQs7FjLt0Mdckk3UE8GvQMc/W1w3oyR0GxgB3XAEgTcTX24SMI3/toyNld6sdalh8gLSeVRxttBtPf6oTw8MZddHXJpPuic=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(921020)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWJ2VUI0TEFYaVgvT0ZRMUpsQUE0RHAybUpWVkY5MTZYbC96LzdCWUhVVzh0?=
 =?utf-8?B?dnU4RmFxNE1tc2pDNGxRWkhVSHY3L0E4L3Y4V2x0N09ZZWtKT0FiN1ZjMXJT?=
 =?utf-8?B?ZldUUXlNTFlSSENoQVdENlRaejMrSTZ3bHNETHJETmdJU2pmbW5pNG9ycVBB?=
 =?utf-8?B?cGZCWmpHQ1dXQWFiT3RGbklrU1E5MUN2bnBBamUyRER5b2ZIRm43bU9xWWx6?=
 =?utf-8?B?cUtVL1Z3NUpmRzVMYklMRnRrMDhNaU1ienlvYUVVa1BBUndBYW9PY2htVlk4?=
 =?utf-8?B?S1V3VE1pRUlMQU40WE9lZTlQTUNhZXM4bGhuengwMVBFc0xkWEthWUJmZWsy?=
 =?utf-8?B?MWhqd0t6bnpsTHFRZGRZazJyNng5UGdnOGZOT2FKcW5PQlVPNnpnamFidDhX?=
 =?utf-8?B?d3JIVllISEdZRS8zblUxempKNVRnR3QybFBra3JTV0NjTDRMQldkVG1RbTNk?=
 =?utf-8?B?QXkyczNVWHZaMUlubS9iajBRakVyeUwxSTIwQXVveUJzUXlIODY4Y1pmKzd3?=
 =?utf-8?B?MldCM0ZNMUVGOHE1RzQ4K1dBdFQxRUpLcFAzWDhpbGxzclB1aWg1THZpa2w5?=
 =?utf-8?B?bVE0S1JvNTQ5RkM1U3Nubi9uanRTYXRtb0FLRFErUjdCdmRlSGNhaTk3SVlM?=
 =?utf-8?B?VVpFd0g5aHRxNGg4NWthYjdkNEFjZzVhd3NscU1JMzYyMTRnU3UzNXZBRU5P?=
 =?utf-8?B?enMwSVU5RGpPbjl2elFpSnRPblNlNmxiQUZmbVpTZFRGTFhtQTJzV2NNbnZM?=
 =?utf-8?B?Skx0Qlhha2hna29VQUUrSVlyUy8xUmdLS2JuVTBrajdyY09LTlRpWHBvRDlF?=
 =?utf-8?B?QStsa05PZDRvWnl6S3hkVVlCMFlNOGNmRE0zaEVlUnRkZ2NQdWVQd1lvV1lx?=
 =?utf-8?B?TVlxU0NOZzRjbG9lTnU4TlJ5cUFXSEV0RkszZ1NqWjJEeXFmWVhMbmNHQ3VT?=
 =?utf-8?B?TlpFZENCY2ZGU0VsVkMwZEtldGFQL3A5R2NmeFhid3pqZmVuakg4b0lqdjdR?=
 =?utf-8?B?S3h0U0QzaUthckp6YXpvekF2RkJ3Z0w0TGdrU1RSejkvY3BLUVVJMjU5djBU?=
 =?utf-8?B?SDU2TEEvNndrZGh5OUNNVmlLY3lXZWtJVUdtUHZvTStVcFNGY1BlWmNkR0x5?=
 =?utf-8?B?U2tCVzlVcmF4Y2hUNE5CYnZEbmlHZlRHSUZRZ01SN3NMOTM5WUZtWlMwaDR2?=
 =?utf-8?B?U29ieE9MRE9Kc2FmLzFGVkdFZ044K1lvRVNvWWp4VDF3cUNJZ3JMUHB2ZDNC?=
 =?utf-8?B?eGw2d0tTRTlCNWw2a0dUZE1LN1BCaTRmVUpMNmFBZUJDS0ZNbmJGdlkrVFp2?=
 =?utf-8?B?cVFMZCtIVklYU3Z6aWcxZ1Z2NlJLMlViVDZSQUtKQnVGRENZZTdvbndrbG9a?=
 =?utf-8?B?UDlSV2d0cDc4cHkxb00yVnNxQXd1eUM3bWozU3lmSUVEa1RxMHBORTVMOUFx?=
 =?utf-8?B?N2VsVFhUeVNqak52Y0Z0YzlMN3FPYnZCcTM3S1ZqTjdYeDZEdEhPd2VwUThM?=
 =?utf-8?B?bDdIMitXaE1TUkczQkMxZVJ6SmthTm14d0NKUjFLWHlpTGpJTmFvaklCSEZW?=
 =?utf-8?B?UWgxT1VLS2Vid3hMTjVwVDdIWW1MandtWVJJZTMwbHdlM0dwMkFOcEZjQXFL?=
 =?utf-8?B?RWVEK3YzajhzSU9lL0dCams4bStNMURjdkNOMzNQT1NJY3czSGYycEppVXVE?=
 =?utf-8?B?R2l1WW1GaXBjUW5SZzQ4RVZhaFRTUFFnMExCbTFzWnI3SjNCK0JINml4WGRn?=
 =?utf-8?B?UjQvWU9wNnduRVZ2ODBVNk9lUjNyWTFSdFJTSWtRV21zSVFva0JzUjliMjdx?=
 =?utf-8?B?UjUrN29sY1llTHQwYzJKMFd2cnJZQVZ5amgzWlc3Ykk3K2NUQU1VZ245UldR?=
 =?utf-8?B?b3VCQ3MxVnUweWlpYVRjL2NkWXV4WmgxRTE0MWVhTzZ0N2FoZTBLOTZ4c2pD?=
 =?utf-8?B?THMyMFV0U3cxaXBtL3BnWmlnWmRVRFZoL29FamI4cXpVYXk2cFcxN3g4UkZ4?=
 =?utf-8?B?NUdZYmNoQS9UdHFmdloyZDVsekpIVktTUVZvMUtLanVrOS9rdGM0VzJ3QmRy?=
 =?utf-8?B?VSsxaXlYTlZ2WmdmKzZJRWRSTjRUWGVXSTR3N0ZFVXpScjhEMXA3QWlPcks5?=
 =?utf-8?B?dldUdmtpR2twY1ZjRUFHb1pUZFdNa1d2VElvbm5vNVZZd3R5bU5yZDRyZHVo?=
 =?utf-8?B?SWl0MG8zZmU5aVZSMnRlak1vejhLN1Y1R3U4MkZYWVNrUTZpc0NKb0kzQnFh?=
 =?utf-8?B?L1Jjenp6MFZyR0JiVjlQRU5zTGpuSTg5RkJKclV0dnloUUJ6L2ZRS1owUEVD?=
 =?utf-8?B?ZUpaaDhqMVpaMURYR3orLzZtd1V6NG82MTFVVHIvQ1g4Zy92N3RmZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: decae07e-6e75-41c3-4d47-08debb1006d6
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 10:17:44.3677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vs3K6A/sNK3Kwy6Vrc33JOor1//7/rOgP4xJXeBxYHKmYTiyIW1IjuiqscjjVWlefF2TAlPELAmjAr7g3OJ0EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-62776-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,nvidia.com,google.com,intel.com,linuxfoundation.org,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 1E0405D40B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 06/05/2026 14:41, Thierry Reding wrote:
> The Tegra PMC has accumulated a bit of cruft over the years. Most of the
> legacy code has since been replaced by standard APIs, but for certain 32
> bit platforms we cannot get rid of all remnants, unfortunately.
> 
> In addition, future SoC generations can have multiple instances of the
> PMC, making some of the old APIs unusable. Preliminary work was merged
> recently to allow passing a PMC instance to the custom PMC APIs to solve
> this problem.
> 
> This series of patches is a final cleanup pass that makes use of the new
> APIs in existing drivers. At the end of the series, only some old 32-bit
> support code will use the old APIs, so they can be made exclusive to the
> 32-bit ARM builds (which is about as good as it's going to get).
> 
> Note that the first 6 patches can be applied to subsystem trees
> independently since they only rely on patches that were merged into 7.0.
> Patch 8 depends on these patches being applied, so some coordination is
> needed. The simplest solution would probably be to merge them all
> through the Tegra tree, if everyone agrees. Otherwise, maintainers
> should feel free to apply patches to their subsystems and I'll monitor
> things and apply the last three patches once all others have landed.
> 
> Thanks,
> Thierry
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>


For the series ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic


