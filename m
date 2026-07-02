Return-Path: <linux-media+bounces-66371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ARQHfFsRmqUUQsAu9opvQ
	(envelope-from <linux-media+bounces-66371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:51:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C0F6F88B3
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:51:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=garyguo.net header.s=selector1 header.b=GsDJ0hul;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66371-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66371-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=garyguo.net;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BE4A30293EE
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 13:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCE24ADD9B;
	Thu,  2 Jul 2026 13:48:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020075.outbound.protection.outlook.com [52.101.195.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DA0264A9D;
	Thu,  2 Jul 2026 13:48:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000109; cv=fail; b=WpuL0y2olrdmaXRClSrGB6GghiBRjaRCmx3AEzytZC1z0VGoxn291YCGP+yqJhUEAxj8V79urR2V5VK/pKeO6HkWML67iz/0G8n4P313DsODgP8XOw4yOm/DRkUrCCr0C1uPTLgAo5yY3CgQg6d/lMhfDyY9tR/hISyt0xK9/gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000109; c=relaxed/simple;
	bh=hUZvOYQTJuHsVbrYMZBsRo4N0kJ2fLa4xxb0pz8Atow=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Icmq9Qb7+XYUD+YGVY4XL5lroymTjI18fLpsINedY7XnLKH5+phF4m9/xwVGCoAXTssE6sLuQF13XrioQlcLUTITFLLb5w2wiNMxr3X9KGqT5is39gRxYfpAmTYno5rvUClWax+WfeftOLgTLyHXlJfVDwLXiqmzGpV6EpTk8n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GsDJ0hul; arc=fail smtp.client-ip=52.101.195.75
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpZ+KR3V66RGMPM9fYsHNkxYrVf5mtCl/hOfolJEkPiSlQ/636iSaiTg8dC4zdvPzXNBjPh2ZdfSPDRE88nA2srp9lg8dCVKvk7FcBsHKTawmAGg1kFZy+uieLzwQb6IcALslN/FoDl0iM2Na+G1TrDUsLjeagGJJCPfoal6KHhQGo266v0KJJxiJLoiYXyD9+1F1+1sDGKreQy93uW3wgKpgjbDN4sooe3Nc3NGJgiUeNzI22kiystFcljD2TxsuceRBEsRPXu+1F93B72OPW0Gx3bhtGdKQIjGC/KWda9WhE0DKM+kVTz8UVnr5HhA90I6qxVY7QFEls+T0wwx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WFmK/PUwr7tOYtt8EE+QFkxm0zMzsrNNwnQrAO2Mh4=;
 b=Wi8x3WDVpVUlGipS3/Fz/RRUxZ5LjHCO2stO+UwFhaNYH1mtTeOZt39o1ubJUqqhlyJX9p3eZ7AOBvG1jLKWA0HJen3fWUjpxckRwniD7DQ1cNQYNizxkzceMee0XrZUS4IS1kT8drf0cy71xmc+RkcjUAKATWItXxV7DSgr/72glzhJLPHKed0nN/u2JU9TYRMKg4uc8i91+MMfXO5e++RsQ2X0nqpMAryYyPghuWaVGVJ03uQWrzYIrqxrBN/5oz4xePrlxtrxOvjuwuRYX5MSdvbei8AVo2rR1YhalMiDnbzSgiE1ufPFxyYHSOQ1fdTnaESD+WadM//V3wUQhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WFmK/PUwr7tOYtt8EE+QFkxm0zMzsrNNwnQrAO2Mh4=;
 b=GsDJ0hulK0q5qtehrRzE3r5y51KERyESCp0CyxxL9BDsDrrPAF9J3kuMHajCJIxfbNritNkNmgVpIDVWGM8ftTiyM8NhWo7sgh656c+FmWPVW8Q3Jt7HxyhIgSrDemUpRQJOVlBLubCdkIFSiTVGEoX+n+asXm9lxuO7C0ShcdI=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOCP265MB8693.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 13:48:25 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 13:48:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 14:48:24 +0100
Message-Id: <DJO4SC0M6BCM.B7RP36WUWCM9@garyguo.net>
Cc: "Dave Ertman" <david.m.ertman@intel.com>, "Ira Weiny"
 <iweiny@kernel.org>, "Leon Romanovsky" <leon@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Igor Korotin"
 <igor.korotin@linux.dev>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH] rust: device_id: rename IdTable::as_ptr to
 as_raw_id_table()
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260702-idtable-rename-asptr-v1-1-e0927273c71a@google.com>
In-Reply-To: <20260702-idtable-rename-asptr-v1-1-e0927273c71a@google.com>
X-ClientProxiedBy: LO4P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOCP265MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: f741e582-a89c-48a1-b08e-08ded8409669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|7416014|1800799024|366016|6133799003|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vRlL7tNz8TlR9mgPhUj8zOu7zSmPgzueAASaQpLRq1CuLobdWZKVaCZz9vd7Olh5+LZQI1Xga/tM+W3AG1d8ehEGBAIfmDa7ADvAQUWxj5dhTaTj+Gapg0qsZy2V7EXv7Zra8vRG94+cG3tUtxlmsbWc2f3fPakR0aXRyfW0XbG0jgAw9nKflqOY0rX5zYBWqjG7hu4S2AKlQ0V3jhJyw+Jx0jtqmJKIA/W1ErYT/oT9K+7a7T4afa6HFSCfCdpsWT/Ecm2F2EFCu64LbUFakPbH93Y++xdTYiwKWiJ55vlPFAWSgYtHMvFb4xXdvd5Eit03IY+gzR2+wMb3KyuMwkbulkzoo+v4V5BUPI11i6svdPJ70AKiWwglR1+HvF3TGPl/Pn9OcbAPdDNf66NsRSxpf/8zfAjUMdXQ4sEwZHOtb6TBfgQR0ks9eesQRiwK4hHqSSOLdib68AuoVOaX4m+eDrdTCCyV5GdbkSReeib4wXwAhBOHQV7zBiljcaaVTMPmxtcQfC72uVD5ap5BGWoi1WgDdJ1HOprDoB9VXHmGOulwUYhWEt27P7W1ffQf+Lf29gyaB4rNbbYf0aM1UqCZyp/khqOKgXdYiJvqHH/Mg4A/qB4SX7agYJ1sXvvV1eNLfKvtbyjZ4uOoKYljS+C96KycbmmE4x8GiqJy7Ao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk1RSG5JVlpnYWcwNlhCcXNkNVBJbE9LWTJqbnVKYTdJQ2RFWlBJcHljSlFp?=
 =?utf-8?B?KzE0VVJDL2FiVlVmNTMvVXBTTDduQURHWitIUzRzS1JvallwMDdsTWFqUzVL?=
 =?utf-8?B?aGJnbXdQaFNMQ3Fkd0x4Sk9xci9KUktnM3BoK3Y0L3BRakE5QzRLblVrRWh1?=
 =?utf-8?B?YUJxVEozVjlaek9DdGk0RHRPRkpwa09yalJySTEvUVN0dDRON3Q4OXRla0Fs?=
 =?utf-8?B?UzN2ZE83SE9iSFJKL1AvUjkzM0U2WXVGdU9nQTY4WGg5ekFHU0IzV3kxSjd2?=
 =?utf-8?B?YXNmSlpvS053YU81TlB0SXhyYm43Z3RpWTM4RHptNldROGYrKzA5Z0x4KzY2?=
 =?utf-8?B?YWRQb1p2VHAwQjQ2NGp6YXVERmhyMTFDKzVDZXhWOGRLaFp4b0ZVNWJSbjJa?=
 =?utf-8?B?VTVnZjNzc20xTFk3RjR2bjZXZHZsSFVMS3FsWTNrcmxFNXdKcUlXVzlXOVdo?=
 =?utf-8?B?Zy9pUjg4bzhpckduL1pHa2pObHYrWStnd1lRcjdKTFB5UTErdXAxL2lIdkVk?=
 =?utf-8?B?dUN1cVpyd05mb0hZTjhWdUVLSEN0dG5NV0pxKzlKSW5XMHFFaUtnaitZN2R0?=
 =?utf-8?B?TWZib211eGhvYzgzZXpjcUVFUFVRMDJ6MFFYdmZTeWdZMU5SeHlVMlNOdWF3?=
 =?utf-8?B?Q1Q2Y293blh3aHRoK2xqaFpuTWNIM1ZDT0JtV3dKNnE0Z0sxTkpQUFpNcmQ1?=
 =?utf-8?B?ZlF6d2QxakZhWXdNM2NCY1ZMSWMzSVQ1WTVpYnIvTjloTmJOWU1mcWxWZHMy?=
 =?utf-8?B?MmludVkySnU0VHVDTXZMa3BuWEZTMDhsd1c1UGhsRy9JTlFkMUVxU2d6TkVJ?=
 =?utf-8?B?eEJwYklSK0crdVM4QjNyVS8xbFFOSmhZSXpwU3ZBOWNwL1k3NkVxZG1CL1Er?=
 =?utf-8?B?anBScEQwZnc4U2NMeU5NVXFNTjQvQ0xUSW11U21BR0t5SURsdWIrakNGRjVV?=
 =?utf-8?B?TTZuQVVRNU1VSTRKSVZaMmtUQTVzZVBFTk5VNktwKzhLOUs4TFRLalNkdzlE?=
 =?utf-8?B?MFNmb0g4dUJOVlhqVnVuNytheWtvZGlsUFJLdCtKYmNFZjdkdmpWYkF4QkdX?=
 =?utf-8?B?V2o5VUFQODdERTE2ZWlRQkpaNXl4TjFsdGxKN0RkbGZnTFpxbHdqd3Y0QnYv?=
 =?utf-8?B?U1BDVENmR0JIZU9Ob1VMbW85SzR6VlJORzRYazA0ZWNRNy92ZjcvR2t3dTIr?=
 =?utf-8?B?amU2K2JRUEprRWtJeW14MWFubjZnWEJyUnpJQ2IzT2IxYSs0bXU2T1pZUjlZ?=
 =?utf-8?B?Y09JOUNSUFZpOEZNT2t6NDl3M1h4TFMwU0VybmtQRkRZeC9sOUpTU291K1ZF?=
 =?utf-8?B?YnN6S3lFTUpiQVdVUWUvNW5WbXoyQzJCT2NnUCtqellXSTd1T2dJa3NlR3Bs?=
 =?utf-8?B?YnJ4dmJQKzZTQW5HbkFFYVRncEFMZEczQlh3K1doSG9ka2g2NXFBRnhPNUU0?=
 =?utf-8?B?UjZLZE9sZGFNWkVHbnMrazZJOHBNQTJiWVNxbUdwK2ZJeENEYTNLNWYzOTRJ?=
 =?utf-8?B?QmRtV3lrWTQwUjdURmsrcGFENTkwQ3ZGa0h4VXJ2ZVlKQXJ2b0N3LzBjOXl6?=
 =?utf-8?B?S0N4dFpzL2Y4b2FYemYzZjBWUlFBTGRFSnEzTEZFTmtkelVGM0YvcXUwSGhU?=
 =?utf-8?B?Sm9xZ041ZjFicjRQVDU2dm9Lb0NIcHc3L20rblIxUzdaSzRxOUY1U3hRRzMv?=
 =?utf-8?B?M1NrNHJNOXlCZTlUeXhrZ3FMYjFkOGdVc2d3RG15K3hXZzhCWW9NNWhFdjJp?=
 =?utf-8?B?bTZ4cmt1a2tnTEw0dHN3TlZVb01MQTd3NGdGdVMxcldVc08yQmZSVVZ4ZTA0?=
 =?utf-8?B?OEt5WEpLSjgrcEUzNzRLQU5vR1RpYmhWYnJhQ3E1U3dVazczSW9sMWl2RUI4?=
 =?utf-8?B?TDdpWWtQTG1yNjZTZXpQeXRTVXBHU2NocnZhcW5oQkl4VnNkcVhnZGhKQW5q?=
 =?utf-8?B?WnRHWEttWmRvaDRyYnNFMzB5OFZ5ZDJDUk5yeHlYK2RWa3pOcDJxbHFRak5s?=
 =?utf-8?B?RWdWMEI4SGpUUHVueGpKYU1CY2JWOEJQTWhpVFRyemRFeU5xTitMbTlVWFcy?=
 =?utf-8?B?ajY5SWcwL2cyK3NydzYyVE45V2xqbUQ0OVlIM1pnNGRmRThZdWdlQlB6QmVY?=
 =?utf-8?B?dGlTaVJLTUZyVWMrc0hscE92MFVydVFNd2l4SWlxUTdnQ3pnQnFoUXcwSHd2?=
 =?utf-8?B?ZkpLOFVwdmRpbGhBZWZheUxJTkl6ZWJobVZGOHl6WmVBNWdwZHNMSVYwTllH?=
 =?utf-8?B?L1BscWNvMmk0Zis4b21ITGNkTm9lTGZCZmhCT096TFE5UG5rMjNkTit6S0dk?=
 =?utf-8?B?c0NLV1FPVjJONnRKL1BoeEJQNWcwbm1sNVJDc0xZTUtaNlFVWUVFUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f741e582-a89c-48a1-b08e-08ded8409669
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 13:48:24.7653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJE8S8gfvGSP5K65JyKyvqoG4cRMsqzEyWDBPsKTzdOKlvcb0dBK682xtQX7JhcDj3dQmTBO0A7dJKyHsawJTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOCP265MB8693
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66371-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david.m.ertman@intel.com,m:iweiny@kernel.org,m:leon@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:igor.korotin@linux.dev,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:aliceryhl@google.com,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,garyguo.net,protonmail.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,linux.dev,google.com,linaro.org,amd.com,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,garyguo.net:dkim,garyguo.net:mid,garyguo.net:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1C0F6F88B3

On Thu Jul 2, 2026 at 1:30 PM BST, Alice Ryhl wrote:
> The current name of `as_ptr` is very generic, and if you attempt to
> invoke `foo.as_ptr()` on a type for which this method is missing, then
> an error along these lines will be printed:
>
> 	error[E0599]: no method named `as_ptr` found for reference `&DmaBuf` in =
the current scope
> 	   --> linux/rust/kernel/dma_buf/buf.rs:54:38
> 	    |
> 	 54 |         ptr::eq(self.as_ptr(), other.as_ptr())
> 	    |                                      ^^^^^^ method not found in `&=
DmaBuf`
> 	    |
> 	    =3D help: items from traits can only be used if the trait is impleme=
nted and in scope
> 	note: `device_id::IdTable` defines an item `as_ptr`, perhaps you need to=
 implement it
> 	   --> linux/rust/kernel/device_id.rs:165:1
> 	    |
> 	165 | pub trait IdTable<T: RawDeviceId, U> {
> 	    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Suggesting the IdTable trait when an as_ptr() method is missing is not
> useful. Renaming it to `as_raw_id_table` makes the method name unique to
> this trait and avoids these bad suggestions.

I think the name is fine. Functions of this sort is named `as_ptr()` and I =
don't
see why it should differ just because it's on traits.

I'd rather say this is a Rust deficiency. Perhaps there needs to be a
improvement of `#[diagnostic::do_not_recommend]` so it can be sticked to me=
thods
or traits as well.

Best,
Gary

>
> Assisted-by: Antigravity:Gemini
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/auxiliary.rs | 2 +-
>  rust/kernel/device_id.rs | 4 ++--
>  rust/kernel/driver.rs    | 8 +++++---
>  rust/kernel/i2c.rs       | 8 ++++----
>  rust/kernel/pci.rs       | 2 +-
>  rust/kernel/platform.rs  | 4 ++--
>  rust/kernel/usb.rs       | 2 +-
>  7 files changed, 16 insertions(+), 14 deletions(-)

