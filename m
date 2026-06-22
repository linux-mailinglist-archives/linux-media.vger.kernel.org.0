Return-Path: <linux-media+bounces-65361-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CEfsEDwcOWoAnAcAu9opvQ
	(envelope-from <linux-media+bounces-65361-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 13:27:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C67C6AF0E1
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 13:27:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=selector1 header.b=QJZrCemH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65361-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65361-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AE774300C7C0
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1AF39E17E;
	Mon, 22 Jun 2026 11:27:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066CA39934C;
	Mon, 22 Jun 2026 11:27:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127664; cv=fail; b=sFqU5ThBqH7XO2mi5daF3rcr1w4w3xuzbudX1txIRG/JrqmkQWK8/KUZuz06hHzBR8KhUWCSnwPQdLtiFKLIn9VHSHVACkSrPA/3NE6dHLEvvRciUsfWibNxHYyeiLEdioo07/UygRJk5RsCTIBC2Mi/PmGd50VvJo95b4extOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127664; c=relaxed/simple;
	bh=THiHkM0raAWmQc92Fb25VbC+GRjgxQ/Y9x4b+4VH7rY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QI/edh+u1TJ0p2MtJ8Oa0rd4035IQZixP/kjBx82e2N8NFRKhsbakys+Z6eS3ICV52s2BrTRvuj/vo6NyW/X4GEE2/PcquOhavFFPAA17s8lgyXoUEpueMul5swbT2Il8RODem9WqBr3h3G9ddHnnSR3ynR6+TdWbZPFs/leoZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=QJZrCemH; arc=fail smtp.client-ip=52.101.48.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cP3dINftBBPZZc/5sKwdFLs9u73/M0QQ2dXrbBRPgVnBZMkJC00v1vXsud/MXoqrey2GnWx3wKVCnCDnUZTt3p/tmc/blSWrH+Kc0/cqn20uU56zFQVTQFIFp2Lgd/nrzqvO6W4xYqjeaoICRqEQKltuH8gkAGob89c0nqLcB3IjH9Kq6IqbwDmLdW8A30ksI8yKpDF+/RAKRtCtDce6OZxYKme6EFTIo9RC9loSThsok4RLzxHgceNJXa+EQf47bTmF8pGB/m8OY9nDiDYr+din2oXmH3Kd1iTZmqFmYan6oRBoDX17aUHfdoPeAWKHUaAhN95EtdatGMv4P3tz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THiHkM0raAWmQc92Fb25VbC+GRjgxQ/Y9x4b+4VH7rY=;
 b=l0Z16O4M6tiMxANhMcb14wtLaCfqbL6LyOJgSim/qRjhza8tp8TQcAjbFrqnwCN6FsJNMCzlUT914FrxSfNpna1t9oFR6bEObZNsMNOY0HDtgvbOgXcuINrEVn6hoY4E2GA9yhWQjjWae2E8TAq0hI0ftXzdXm2EMWhJSedqxqhO0FUVCpgj/vCeBzAvGoYTGa0GtXKtS4SkGk1sn+GSMQxEGmcSdWwu06PuNSeFbpsLXjFOfh03nQYfeUJ7+d7qYTrT8wg7bLN4nHrBTlE2W4G6nxRC3FcHgmKj1lAOj5RYLJyZSWhxHtrWZlf3fTzWKDQOB5xOqHSWgUd4gqAWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THiHkM0raAWmQc92Fb25VbC+GRjgxQ/Y9x4b+4VH7rY=;
 b=QJZrCemH04iZ+G4L5NiEYFM6WwO6XHlL/K2fHqQL+FQOpMIB5YpNKiK86C42HDu7wYs++93sEoZWxMC3DrYPJ8P3yUaU/5lYr4gC4tO7xTTXa6Tb8Y97ZvekHgPBV5PqjzN0ZyRysVNL22VhLL403TIGZtaleYeWI4QMgtr82+lNDR2Cc6YJlElUU+GrrWz7mEMSns8e54O5NV5LX5ibSEGMsVveTcQFAvk84sawEj7oQfjcy8jUq+gclRR0nDfIN1IAHZxKl32TsrWvSKBYd/rwSEUcWS7pBnijOfzDB805Xmdqd1F04tNVtQvYoeVUSRwVyfwf3n0Ms0jccxlkDQ==
Received: from SJ0PR11MB4910.namprd11.prod.outlook.com (2603:10b6:a03:2d7::7)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 11:27:40 +0000
Received: from SJ0PR11MB4910.namprd11.prod.outlook.com
 ([fe80::7af:4219:9135:f1a5]) by SJ0PR11MB4910.namprd11.prod.outlook.com
 ([fe80::7af:4219:9135:f1a5%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 11:27:39 +0000
From: <Balakrishnan.S@microchip.com>
To: <ehristev@kernel.org>, <mchehab@kernel.org>
CC: <hverkuil@kernel.org>, <sakari.ailus@linux.intel.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH 04/10] media: microchip-isc: disable histogram and flush
 AWB work on stop
Thread-Topic: [PATCH 04/10] media: microchip-isc: disable histogram and flush
 AWB work on stop
Thread-Index: AQHc/YZ0ppX3HgVmVE+fZfn/zzxZgbZIkd0AgAHnWYA=
Date: Mon, 22 Jun 2026 11:27:39 +0000
Message-ID: <9f769285-e328-4f98-8f1e-9112d1ef7be0@microchip.com>
References:
 <20260616-balki-isc-prefix-fixes-v1-v1-0-b23677fc5ab6@microchip.com>
 <20260616-balki-isc-prefix-fixes-v1-v1-4-b23677fc5ab6@microchip.com>
 <dad6ba27-5fd1-4a52-ae0b-6e0db3a9d1eb@kernel.org>
In-Reply-To: <dad6ba27-5fd1-4a52-ae0b-6e0db3a9d1eb@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB4910:EE_|DS0PR11MB7652:EE_
x-ms-office365-filtering-correlation-id: 1aeabf7d-364b-48e8-8995-08ded05144c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 i/+90Rje0jfgtCUoZbLJN1B4BE3YWHIoVB8tk1vvIrMMEp5wjmqci1cl3u5ioMkxoNJpIZrkBtepatnhXsMHrtutbpfSBCzLKHULIJ9j7h+uOOWmNoeHAisPopAbRgxNjSBZmi4uuVtTTLJ6UK8yWAHEsEjMs8q4fevIxwwny+H4Ki7k7y66yC3Fm6/OVsIRipqiXSYqpzK9N+MyL8zLg4FkovPsLXHZh04O+bSFgQ+fbOMFYGWOaYo+0oBhxfRzDqYCUTCUxspm79vcjgV9jnvSvHd24Z4aCM3ljaEV2Oi/Htflak4C4AdwWSfOIIgGz82D8WMqsOhBneJp/kT/y3ggAjH1ZE4/PrTdkPtJZM5TJJtD08VMEQ8UiqlryTI+A9g99qV6oJwoaQE6tjifMyRxxw7V75bgJvTAnONWZsBMrD/jww8kejaaZOQDF4TIm7kf0amkIEXK13dT5CaSu8pQIY3Zf09Tu9oKmcarp6MiXySGARdu51mi73Ef+nSbd7ePUfhL08545um+JIZ96q5uf7BGzwbHcTD9xyKan5QwGM0vjI1VHUsPmK6DZGl6vmviZbb0cDK4NF8DSZQoyMltnS2HXxAuR50s1V683TUyid/oNOAf3qgOzv87ytljrWfskYYtj7wmXOLDJp4nJq957/pxPQQLud9onx5H4ut93Wiw/vdhjREjNNIYZUhodgu3yr98t61k3dwx/N2086jQPTe/TwVuEVbay7llFVQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4910.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2dCYy96TDRLUHlVcGFhSVFIUGZrMzlpRyszN3o3anc1RWs5ZXZxaGRrbFRz?=
 =?utf-8?B?NUM0WmVFTFlBSTZRUEVORXdiZU0yNDlYaXRvQTQ0MEJLaTdveVRaZWR4S2JH?=
 =?utf-8?B?SGgrbGg0V2NKclEvd2VwVlloeHBsSGJXTHp3bUVDbWliY2d2Q3lKWUNQMXhC?=
 =?utf-8?B?Q1owWjNEOUlPTkFmZnZYb1ZqalAzaElsVzFtejJHT3BXRWdNcW9yd2JtTVMx?=
 =?utf-8?B?akVhTUYvV1NqcXFFTjZlUExrdWxBZmtOUTRxSUo5WWJldkg5T3JKYjFMU0Yz?=
 =?utf-8?B?MXRRa0hLZDd1UGQ3dzNyM0N1L0xRTUFvRXE4TjNNS084Y1ZBeGd1YisraWY2?=
 =?utf-8?B?VG13WDB3c3VKNi9jcTYwR21JQWRYSExFTGp6M2ZOZGpUcXZGUXBzSmNTRXFj?=
 =?utf-8?B?ZWFQUHBzM2ZQYTlkaUYxYm1qK3oxOE81Rlc2dXlONU8rTVdOUjVlU3Fja0o1?=
 =?utf-8?B?Sm13c1lPODRrQWpUUTVZSlhkRy9xZFA0bUw1RGFzN2pYckxWZE5MbFFVYm1k?=
 =?utf-8?B?MUVaK0VVUWFPd0FWZjV5aUlucG1SK2w3MjNrWTBVR2ZMcFdlUHpCZ0VCdjhM?=
 =?utf-8?B?ZU5UeThGbGZZMSt4SE9uY1RwWWpJTXRxMHpsY2ZhbzI0dWRGTWdqRWtlTjlE?=
 =?utf-8?B?Zlc1amp4aUhLSHhYTlRGTkhwSHlGL3RQaVBwdTdFbXJLdm9TWFJFMSsvS1ND?=
 =?utf-8?B?cTQ3azh3bUVEdy95RDZjR1ZCeDRsRDAyK1JjeXZwT1EvSFk1WXRhZFZRVTIy?=
 =?utf-8?B?RjFTZU1qcUE2dTZKY3phTkFBem5DNkhadThqdTR4cUpSNXlzYlhNWmlDZkc1?=
 =?utf-8?B?VVNqeG85N0JLc0RuKzdzL1ZtOVJ2M1pkZFBNcjk2Y1pvSERxdXZhRzRqL0pW?=
 =?utf-8?B?azNDNkh1VU82V1pGMG9qbS90aGFXWVM4MFU5aDlpSU4yWWcxQTFNVjN5YmtZ?=
 =?utf-8?B?Y0dtcGx6TmNuNHFxdEJ5RXhzU2pvUC9lK1NQMjNiVmpnSHN6QytDWmxxSGly?=
 =?utf-8?B?Y25wNXlhMHhVMjR2SnJOMXRSd1IzSXBWVTlBOXdDTUpLVFBId2hDczgvZk84?=
 =?utf-8?B?ZjBDVTVTaDVmVUx5NkIwcVZGQklwVlN6enRnK1U0clUrdFppSDlMSVQ1ekFT?=
 =?utf-8?B?RTFoQzB2TzU4NHl5aWQvUm9ZTVNHQXJoaGxLMk5Sd0V5VmdhTkJhMTFRdGdT?=
 =?utf-8?B?NVM3WlY3Q0owdHJFclVYV3BaNStYSWV4SVgrYnlRRGpTbTI4RDBldjcxWEdH?=
 =?utf-8?B?aVF0TXJ1OURaeFpKR2piRDNoYVVOMGNPVm90VW1VNlVHMEkzOEZDT2FBejZy?=
 =?utf-8?B?Skk1WGVHalo3dVExL1ZCdmsyeWJYMHMrWlJ1K0R1dmxVejFReTRJTjVtZVlN?=
 =?utf-8?B?Q2cyc01BYUlkelRsbkQzdXhjZ1ZGM2lSL0d6SUpMU1RUTmNIODdJRWRCS0E0?=
 =?utf-8?B?YWtGbXFJdXFKaS9PanNtSHRWeVlMekJUQjlBcTMvYnVMUEU4V3hESmMvNFpv?=
 =?utf-8?B?MW41d0xPN2hxQ0x4cVhpMkhSdTRmQVFMZXdtUFRpdUF0ZDd1dHplMVdWTWhn?=
 =?utf-8?B?UE1EQ0hKdGp5d1JwS3ZZMDVQd002V2RvNHo3N3Q2T2VqY0dRdW9JOUxpeWF4?=
 =?utf-8?B?c2NNV0xjZFJlK0J0UmFxTkY5WUtOZjVTNkltanpqR0lvak5uZ3B4RENxcGtl?=
 =?utf-8?B?Zi9UMFV0OE9SQkxWV0RkdmpiOWk2MTU4Y0NDaW5Rd2ordHA3Sk1oc0tvTVhO?=
 =?utf-8?B?RlVLOHplR3pjemZwSGkvYlJTTDUzZVJsRGgvZ3RIZGFyV0locUdXbGM2QkFn?=
 =?utf-8?B?UU9SZ2pONTczelh1dTRmN3J6MDBHbnk3M0Y1QzF6NDdlcDkyQ0ZrQ1ZwOE01?=
 =?utf-8?B?MGoyTWFhNktLdktGeVM2OHhCMDBwUnZrRml3dDVDODdjbVhqZGF2K0hPZ1Zt?=
 =?utf-8?B?S2tkc09kQXcrVGVHM1AveTBPaUJKcXhXa001anZWdGJLVHRlVDdOYWxVOVpl?=
 =?utf-8?B?QzU1cWM5Z3k1Z0ZrQlNMUUxKM1V4SnF2N1FvbWFsVENXVWFPSGliVTRuNWRR?=
 =?utf-8?B?YU1mNTF5ZDRrUFdGanRjR2tjNC9KZi9tNWx4TUNqRFhnQnF5dER6Q2VvTEQ4?=
 =?utf-8?B?OXQ2UHVhbDBWbWpQek04MDJWc2piMFRrd1dKVG5xRzRHNnhTalJQdmk1b0ZK?=
 =?utf-8?B?L1VySHBLRzlJUzU5VTlVek93bG45SGpPMC8wY2NxVW5qL21xRDUyd3dsTTI5?=
 =?utf-8?B?Rm5DT1hma3JNcmJITlpMS3VPTEw5cHJTQzd6ank1dU93S2k4dC9NMGNkRU5s?=
 =?utf-8?B?YWJCT1FPOXBnZWJDNm9HZnlMNU5SbEdHYlgxejM0KzVJQWxXTmV1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2042E219FF77E74C8B7EA48143A21D25@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aeabf7d-364b-48e8-8995-08ded05144c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 11:27:39.7904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WG4IXo+OEjZq/hjxBUqAkbiIAXPMFSNafHUwFlJB72NWuJEh7ba7kL/AcE3CnlgdsdZKRg4XGUOu/AV9lu2xt79y9vjVRp9fQ02pPu/K9lY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65361-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Balakrishnan.S@microchip.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Balakrishnan.S@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:dkim,microchip.com:email,microchip.com:mid,microchip.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C67C6AF0E1

SGkgRXVnZW4sDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIG9uIHRoaXMuDQoNCk9uIDIxLzA2
LzI2IDExOjUzIGFtLCBFdWdlbiBIcmlzdGV2IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBj
b250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDYvMTYvMjYgMTQ6NTAsIEJhbGFrcmlzaG5hbiBTYW1i
YXRoIHdyb3RlOg0KPj4gaXNjX3N0b3Bfc3RyZWFtaW5nKCkgbWFza2VkIHRoZSBETUEgZG9uZSBp
bnRlcnJ1cHQgYnV0IGxlZnQgdGhlDQo+PiBoaXN0b2dyYW0gZW5hYmxlZCwgc28gYSBISVNET05F
IHRoYXQgZmlyZWQganVzdCBiZWZvcmUgdGhlIHN0b3AgY291bGQNCj4+IHN0aWxsIHF1ZXVlIGlz
Y19hd2Jfd29yaygpIGFmdGVyIHBtX3J1bnRpbWVfcHV0X3N5bmMoKSBnYXRlZCB0aGUgY2xvY2tz
Lg0KPj4gaXNjX2F3Yl93b3JrKCkgcmVhZHMgdGhlIGhpc3RvZ3JhbSByZWdpc3RlcnMgaW4gaXNj
X2hpc3RfY291bnQoKSBiZWZvcmUNCj4+IHRha2luZyBpdHMgb3duIFBNIHJlZmVyZW5jZSwgc28g
dGhlIGFjY2VzcyBmYXVsdHMgb24gdGhlIHN1c3BlbmRlZA0KPj4gZGV2aWNlLg0KPj4NCj4+IERp
c2FibGUgdGhlIGhpc3RvZ3JhbSBhbmQgZmx1c2ggdGhlIHdvcmsgYmVmb3JlIGRyb3BwaW5nIHRo
ZSBQTQ0KPj4gcmVmZXJlbmNlLCBtaXJyb3JpbmcgdGhlIHN0YXJ0X3N0cmVhbWluZyBlcnJvciBw
YXRoLg0KPj4NCj4gDQo+IEluIGhlcmUgeW91IHJlZmVyZW5jZSBzb21lIGVycm9yIHBhdGggdGhh
dCB5b3UgbWlycm9yLCBidXQgeW91IGFkZCBpdCBpbg0KPiB0aGUgbmV4dCBjb21taXQgaW4gd2hp
Y2ggeW91IHNheSB5b3UgbWlycm9yIHRoaXMgZXhhY3QgY29tbWl0IDovDQo+IENpcmN1bGFyIG1p
cnJvcmluZyBvZiBwYXRocyB3aGljaCBpbml0aWFsbHkgZGlkIG5vdCBleGlzdC4NCj4gSSB3b3Vs
ZCBzcXVhc2ggdGhpcyBjb21taXQgd2l0aCB0aGUgbmV4dCBvbmUgYW5kIHNob3cgdGhlIGZhY3Rz
IGFzIHRoZXkNCj4gYXJlIDogc3RvcCBoaXN0b2dyYW0gYW5kIHdvcmsgcXVldWUgaW4gZGlmZmVy
ZW50IHN0b3AvZXJyb3Igc2NlbmFyaW9zLA0KPiBubyBtb3JlIG1pcnJvcmluZy4NCg0KQWdyZWVk
LCBpbmRlZWQgaXRzIGNpcmN1bGFyLg0KV2lsbCBzcXVhc2ggYm90aCBjb21taXRzIGFuZCByZXdv
cmQgc28gZWFjaCBwYXRoIHN0YW5kcyBvbiBpdHMgb3duLg0KDQo+IA0KPiBFdWdlbg0KPiANCj4+
IEZpeGVzOiA5MWI0ZTQ4N2IwYzYgKCJtZWRpYTogbWljcm9jaGlwOiBhZGQgSVNDIGRyaXZlciBh
cyBNaWNyb2NoaXAgSVNDIikNCj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBCYWxha3Jpc2huYW4gU2FtYmF0aCA8YmFsYWtyaXNobmFuLnNAbWljcm9jaGlw
LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21pY3JvY2hpcC9taWNy
b2NoaXAtaXNjLWJhc2UuYyB8IDQgKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWljcm9j
aGlwL21pY3JvY2hpcC1pc2MtYmFzZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9taWNyb2No
aXAvbWljcm9jaGlwLWlzYy1iYXNlLmMNCj4+IGluZGV4IDMyNDVkZDdjYjk4MC4uOGYyNTVhNGM0
ZTdhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9taWNyb2NoaXAvbWlj
cm9jaGlwLWlzYy1iYXNlLmMNCj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWljcm9j
aGlwL21pY3JvY2hpcC1pc2MtYmFzZS5jDQo+PiBAQCAtNDI1LDkgKzQyNSwxMyBAQCBzdGF0aWMg
dm9pZCBpc2Nfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqdnEpDQo+PiAgICAgICAg
LyogRGlzYWJsZSBETUEgaW50ZXJydXB0ICovDQo+PiAgICAgICAgcmVnbWFwX3dyaXRlKGlzYy0+
cmVnbWFwLCBJU0NfSU5URElTLCBJU0NfSU5UX0RET05FKTsNCj4+DQo+PiArICAgICBpc2Nfc2V0
X2hpc3RvZ3JhbShpc2MsIGZhbHNlKTsNCj4+ICsNCj4+ICAgICAgICAvKiBsZXQgYSBydW5uaW5n
IElSUSBoYW5kbGVyIGZpbmlzaCBiZWZvcmUgdGhlIGNsb2NrIGlzIGRpc2FibGVkICovDQo+PiAg
ICAgICAgc3luY2hyb25pemVfaXJxKGlzYy0+aXJxKTsNCj4+DQo+PiArICAgICBjYW5jZWxfd29y
a19zeW5jKCZpc2MtPmF3Yl93b3JrKTsNCj4+ICsNCj4+ICAgICAgICBwbV9ydW50aW1lX3B1dF9z
eW5jKGlzYy0+ZGV2KTsNCj4+DQo+PiAgICAgICAgLyogRGlzYWJsZSBzdHJlYW0gb24gdGhlIHN1
YiBkZXZpY2UgKi8NCj4+DQo+IA0KDQo=

