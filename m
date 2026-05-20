Return-Path: <linux-media+bounces-62244-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEgPJ++cDWoS0AUAu9opvQ
	(envelope-from <linux-media+bounces-62244-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:37:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0244658CAF8
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CEC4325ABF2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C263DDDAE;
	Wed, 20 May 2026 11:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Sbwc6DT8"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013020.outbound.protection.outlook.com [40.93.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FF73D47DE;
	Wed, 20 May 2026 11:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276098; cv=fail; b=tXTiozKi11NFomia+IxWd001dMzgdAgnLc3TUSd8iyFu+s9wsrRajaqtbcSXM7weZMaE6QGY1/b0kY2ZRC0xwGRhVQoACXJtjkf4ybmtd3cxqsiUEQs9WzMLzdMu36B4VG5K1XXUWFWTezqL99JosiQGXzosDU/moT1fmivQWsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276098; c=relaxed/simple;
	bh=LB2aCjuyJ6bmu7098Tgt07LtmJFI/YppGYhw61urrvI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l3OCw2Ed5OVSjIQ9mAzVE3/vzQKYiS4eoclYR429AVZUo+ME2zyNOeptDvnd65lYCkA4kKFcx7QtFvw0byHNCm2phrKKa1gSAyWqvrYFmzbq0XzdMZfX6KsOTt5A2DCrD7YbLqabJybQZv77Y6FYd84OO6y7DNXd+F7LMeryeMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Sbwc6DT8; arc=fail smtp.client-ip=40.93.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAECtCPEfMJ0Xh8bjb/i883oJUbcI+RnDO83wbgy49VJ/xuMA1/o31CPzlRD1jiV12ZQeBxBIC1JgW/155svdZx5fjagrnVDDgWFsI5imTzutNjOtI2ZPcX6mpaCy2jifxTp/uhtUwZ/sPX4ViByHd7TZrBaQ27SlakpYsqF3CDvsnjDM0A7yQckakyvD8GhJ5+WIEnexQY4daivTge+qVXpn3oQixSUXxadO3Tl95IAeOTJMJ8BktX4h93MeZ3yptDuYLoWZ+RyzBqTBinFbjTeXNLb4T70FlDFBLcogGQiyfGD9cEmeXy0FU3a4roTnNtQE9ME/R/kpqlgV61Ptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMkdtj4/VjJmQfSS8pJtUJDtx2BMYRJ3Q2W42DaSjrQ=;
 b=Sgk1SEYqxO03S7ASdpeODXuXMY7Z9cUaD3ec/X3YoEe0m2sPg2WOyW+WRb6LAPRWvUauXcnReQ+0kPAKZSx4MLruALwa/saCX0+DQgJEP+s6kc6x2XHCNgf21EFSapdnK6hSINgr3Fh7DK3lPrNDYXiR2ngRzcUbtqliE15bZD8lPHV+uWAGRvU6NxHpYxCmUCkwwYMxun5cWaulGGMpa4/llLvfkJftY/nwHbdMj8f0rWV6qtQI2/TiVSYrzuFuc/fc8dn3zF0dFdGNJvY1GAeHxWEhuilzGP6Cjf0EThNYZcbR9HknUygHniIiBddDUEOUgQh+K1SQHEHxPs4BuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMkdtj4/VjJmQfSS8pJtUJDtx2BMYRJ3Q2W42DaSjrQ=;
 b=Sbwc6DT8Brvq2BYgj2TZo4GuVbC9N7wFtywYNl9pSnDG6oYODElZKShMCSpWnSW8S/g3po7IRx5PTqh1SnUF4Pfwo55cosmq3df+YRspw9Qn+CZxHUi2jxmf5Twx6noLCLNYdS/p+2o1NEuA6NSA+77cko2qgGOEQu4fTJsLTvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:21:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Wed, 20 May 2026
 11:21:33 +0000
Message-ID: <1e94106a-f72e-447e-9885-2d2cc8f8e722@amd.com>
Date: Wed, 20 May 2026 13:21:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@kde.org>
Cc: Julian Orth <ju.orth@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
 <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
 <CAHijbEWqc2+kSkk3i_LxB2PQ6XwUetw1UkdUdXJfdv3zgKd1kA@mail.gmail.com>
 <38551bfe-75e1-4978-b57d-adc43cebc85e@amd.com>
 <CAHijbEWHp960qvZFoK7+9ppHAqkAR7=UQhtMUccqWzGd_pFPQA@mail.gmail.com>
 <5ee6d5af-ac48-41d7-a19f-e08a3c5b7d19@amd.com>
 <CAFZQkGwmeipZnvmBkcE7KhvUSMkSE=fzLBZtiMyhv3mM04Vudg@mail.gmail.com>
 <dff60378-4e47-4753-8878-feec6e1c2690@amd.com>
 <385a4d4f-fe22-41a7-8d4b-4dc6bc9930d3@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <385a4d4f-fe22-41a7-8d4b-4dc6bc9930d3@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::26) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: d440df65-d31e-4e0b-0dd3-08deb661f296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|4143699003|22082099003|18002099003|56012099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	ze466dad6Kfj9aK4hCsQjF2BIYDSqOtT7KzTRCYSJ6YtayLNJ2oHVjkljesBAKbGmhc2wcHBPO3QXbhrx3oEHgoddE8fhdhta6XpP4pKdan7YQUVAXPFvm4kzVkW0LClY7sKVcxN5sBAbaYdMdGxrruVi/ayTd1Jg2tHCrgECxtY/iVzVI1h7PDiTBz+rn0CMEqAFh8Zclrgg46aFWbYgQzIllBjgZh162ikncWEpskluykEyu6whLp/RaFY6YS61jMyrFBUN4ZufuPKg0hN6iT9nAzziharP14n62K5QE8HIsxYociOgoscKIX/Su5Wb83J0P5qCUmag4VMD5WpyrUI32Sw2bjJZR6mBjdkomPb6Z6nLT4Xu/iIpzS7YVkr/BrOqthj04A0nn8334CRljhzstFehEPn8c1j8dyCzaTzZ6Rg23mZmDaSWJAiq62FYeoIHGHn8/7sr/erQSpGQGb+kLZRQrTnPjEJaqCMWV0KsfBOHf6YhIuSOnzzhGY1dJGBzxhiuIL0MrCFvRptFb4g/Z/YQFdfV3eIlA5O+FUMPw58hpUqUok3rnHh4jiVCHHUNmgr4JwytbZoUusLE01jyCKN9xOIz6VUvIQPaJPhMECXrjMzStJ5P9i106RtH2hpss4bLxmdxuigftD6ouBxqiqwSDOu4osqu+Kz3y7Pn8LRaoW4wiV+Zuzbq60U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(4143699003)(22082099003)(18002099003)(56012099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2tDOFBTZDJaV3ptbXIxT2JiS3BSM0s0QnFPRlg0a1JpQVJGbFo4YWNhUTRS?=
 =?utf-8?B?SDI0bUJaZmZZb0FWcnB4b3hXaDkwTWpka3NMVW1jNzhXVDdBY01HWEtPa3Zs?=
 =?utf-8?B?Zkh4aHpKMXZvUzRna1AxMW1xOThRVjJidUdvOGdwODNuZnVyODkya2dMR2pX?=
 =?utf-8?B?b0JucWllbm9GbGFyT2RGT0lPNUZQV0dTUHI0d1JCT2FMV2x4OE5Raks4TlUv?=
 =?utf-8?B?NkJlWUZ0bnZnSVF5RGdZd2g2MnlNTFhoWnZhSlRLTjN3VVRQKzBrL3ZOTUU5?=
 =?utf-8?B?OFgwRjFkcVdzaWpiTGFDY1lVQ0ExMWlsVmxJYitab3VEYzk5TlBlM0tlRCtU?=
 =?utf-8?B?T24rcXlEcllaU0lKY1ptSncxVjFiZ1hQVWZTNjh6dFZNN1VsOFphTmxPcFpD?=
 =?utf-8?B?VGJKOXFFZkZiU25aT0VFZGRGZUNlSVZpeUpSLzljY3l3eG8xSElIbTIxN0FG?=
 =?utf-8?B?TWJRNmxiMkV5REJ2QnJmNmxpMzFWa3ZDai9mVHRWbjd3NmpvemMxR1dsSnp3?=
 =?utf-8?B?NURNK0R2UUdmclVFTHIybU40aTFDZ21RTTJGakhicGhHOEgxc0pZZnZXZ0lY?=
 =?utf-8?B?UDJSRGFLblBpYzEvLzdIZUVzTUFLWEJTazdPMm90NE9jaHFjakMxd1M2dHJh?=
 =?utf-8?B?OGpCUTMyKzQxQnYvODAxRzZjWURKNEpHNGNkRk9kQ2pPZ0svL0E0bTBEZ0gw?=
 =?utf-8?B?ZVhEQWFGNjRuZG9RNWNJc3RNeGtXdCtNaUxORW9XNy9ZcFJYRGpIenVDZXV2?=
 =?utf-8?B?dXVKMWl6NW55M285SGJUYnNXL2ttV0kwYWs4cGRtUC9FMHl2WmMzeFFSbURD?=
 =?utf-8?B?Y0RaVko4V1ZkdEZ4ODV5MGpDUGMzWENIVzA5WS9kWHUrZE9xR2dya2hMMXVr?=
 =?utf-8?B?cGJuNFhCdFFHNDB6WUZEdHdOaG9mUlNXV2lpUnA4bnBSYWp4TWMxZHhjZStX?=
 =?utf-8?B?YkRTZlRZbkxmRzg2djR3cVNuY3h3U0h0N0hwWngzT0lYai9YRC9sL2dsODNt?=
 =?utf-8?B?OFRscGhkeGhZVDdGbDNMSHYxcHlHRE5UdG5WK2Q1M1ZWeFA0eUtNTDMvd0RJ?=
 =?utf-8?B?TlloYk1XblhaT0t2N0daL2pJZXMzVThuMXIwV3laVEhSUXBqWFZ0YnRRdTB4?=
 =?utf-8?B?QjF3WHMzd1dtbmNnQXAwcVIwc21oc1JzNnZNSGp6VTZ6VDN4V1FIZ2hTUDZ0?=
 =?utf-8?B?eWM3QTFLNE03S0FUYWxkRUVudGRyUGlqK3hudHU1TDdUdlpnVDg0NlRTRlBC?=
 =?utf-8?B?cHFEalhFdUhoY252aGQ3aEFJZnFRNWJ2VmxiOHBJczVmeS9yMDhpdUQyYVJs?=
 =?utf-8?B?SkFCSmU1akJtZ3luZ24xSVB2bkZEeWhCaHppeGl2V0N2Sm5oNGNNb2FlZi8r?=
 =?utf-8?B?QnRuY2pVZnN0ZXdKVWliUm5YSTVqZ2dVWWtadndrdEQ0WUxoMWttN29aYW9X?=
 =?utf-8?B?dDRncXkzV3d1WVdndmVNc0VyWEZFWGxBL0h4bGIzZDUwYUhYbHNJNVlPWFA5?=
 =?utf-8?B?MkZvYkF1Z0tDOW5tM1VqbTU0QUJpOStZVVhtVDlqdGMySlBZWENjdk9xK1Y3?=
 =?utf-8?B?VVBOUGZWS1FwMjRQMlh3QjRVQmUzNkFKVHU0VW9ER3BTS0k4YzByQzhBdkM2?=
 =?utf-8?B?SkhOTmJ0VzU1V0lMQVBrMDVYNW5paEwvcmcvRDA2VXNUYVlhYnlxZDdkYlY5?=
 =?utf-8?B?a09qV0lRalVuaEF2d05lS1FWam04R3VZSXh5TGVEa2MxN3dENGlSSlZxSW52?=
 =?utf-8?B?SlVUSkk1S1J5MktBaERtbG5KMTNKci91eUY4eS9tbmZFNnJxamRpbnBkQWd0?=
 =?utf-8?B?NDFnVytDSUQ0RW8rZk1KNlJFa0NQVnozbnlhU2ZMeXN4Tmg2MHV3Vjhhdm5K?=
 =?utf-8?B?cGFBUWVhMkdySExVbUtibTYvRHQzdU9MeWkxbDJaTGRtbUZwR2VBZTVFUmor?=
 =?utf-8?B?Zm5nVWlkbjh0bmhnOU1zYmV5SFRiSURYWmVhSkQ2N0pNUDE2M1FNbG12MUdw?=
 =?utf-8?B?c3RkWGdNcVF2a2lUSXBadVppbGc3WGhWRnF0RDZhK2NPRnlDclZTc0dHbEZF?=
 =?utf-8?B?M05rWHB0SXBQYzBTOHBFQWUvTlA3Y2ZxNk5GM1IxU2xHaTlDTHg1Q3dUc0di?=
 =?utf-8?B?K1dwUHU4KzZ0Q2xLUkY2U0E2VEtkdXdFbFovd0huYnFlMkw4U0o5L2w2Q0RG?=
 =?utf-8?B?cFA1MnZzTDFsN0p0WUkvZlFUMmRMbW5ra0o1NUFjZXVnSkJHb0o3eE5DOHVP?=
 =?utf-8?B?bkFQeEozMWFQd3A5VFJKZzN4K2NtUldKOERDaG9JaGlkNlZjeGxRYzRBREZ6?=
 =?utf-8?Q?HuXbKv1W/n9G16YLQJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d440df65-d31e-4e0b-0dd3-08deb661f296
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:21:33.2919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lN47Jq8rGKFwoiS7EC2Y2yikhmGzK/Dhfb0305PJjzdhER7rAm8IQGsgmbqVk5QX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62244-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0244658CAF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 10:13, Michel Dänzer wrote:
> On 5/19/26 18:00, Christian König wrote:
>> On 5/19/26 17:31, Xaver Hugl wrote:
>>> Am Di., 19. Mai 2026 um 15:29 Uhr schrieb Christian König
>>> <christian.koenig@amd.com>:
>>>>> 1. This series makes the ability to manipulate syncobjs available
>>>>> independently of attached hardware.
>>>>> 2. It makes it available under a consistent path /dev/syncobj.
>>>>
>>>> Exactly that is a big no-go. This has to be under /dev/dri.
>>> FWIW udmabuf is also under /dev directly, but I don't think any
>>> compositor developer would complain about a different path.
>>> What are the rules for that? Could this simply be put in /dev/dri/syncobj?
>>
>> The syncobj are actually the DRM specific way of doing things. The general kernel wide way is to use sync files (see drivers/dma-buf/sync_file.c).
>>
>> But there has already been tons of problems with those sync files. E.g. they doesn't support your use case at all since they don't have wait before submit behavior.
>>
>> So there are already ways to do this, but the Linux kernel so far told everybody that this is forbidden. The DRM syncobj wait before signal functionality is much better, but then basically the second try to do this.
> 
> I'm not quite sure what you're getting at here, just to be clear though:
> 
> While the syncobj Wayland protocol extension supports wait-before-submit behaviour at the Wayland protocol level, it doesn't need or cause wait-before-submit behaviour for DMA fences in the kernel. The usual rules apply to fences attached to syncobj timeline points. The wait-before-submit behaviour at the Wayland protocol level comes from allowing submit before a fence is attached to the acquire timeline point.

Yeah I know. I'm one of the people who came up with the idea of doing wait before signal this way in the drm_syncobj.

What I wanted to say is that a lot of people used the dma_fence to implement wait before signal before and got a bloody nose from that.

> (It took me a while to realize this distinction, before which I mistakenly thought the kernel's DMA fence rules would prohibit wait-before-submit behaviour at the Wayland protocol level as well)

This is what surprised me.

The drm_syncobj implementation solved the wait before signal for the kernel, but my last feedback was that we basically just moved the issue to userspace and Wayland compositors would have quite some overhead to implement it correctly.

That compositors now use eventfd to simplify that was news to me but makes totally sense in hindsight.

But anyway, we need to somehow simplify the drm_syncobj -> eventfd usage in the compositor. That requirement is perfectly justified and avoiding importing the drm_syncobj fd into any DRM driver should actually be really easy to implement.

Regards,
Christian.

