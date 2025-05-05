Return-Path: <linux-media+bounces-31742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2AAAA9EB4
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 00:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B100D1A81262
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 22:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2D82750EC;
	Mon,  5 May 2025 22:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ox.ac.uk header.i=@ox.ac.uk header.b="KBpti5uC";
	dkim=pass (2048-bit key) header.d=UniOxfordNexus.onmicrosoft.com header.i=@UniOxfordNexus.onmicrosoft.com header.b="OLGCpHpX"
X-Original-To: linux-media@vger.kernel.org
Received: from fallback4.mail.ox.ac.uk (fallback4.mail.ox.ac.uk [129.67.1.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B714A13AF2;
	Mon,  5 May 2025 22:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=129.67.1.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746482600; cv=fail; b=eA1x2A5Z/x+uGLtpFNgb9Z5CHd0kze3MkTiVI/oNAVk4MTnhxYGxhOoIg8koAYoKm486WestCNNgl963Fe6sNo7zEgrYI13OEPEWlWNhj92KtyK5OAoHfxV+7rWPK1if94BwajJfOuKWfmQ9+AbKeliXHI85pKBcyroEJqRIeow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746482600; c=relaxed/simple;
	bh=h2UEkGCdR+GKj2NkfNkMAPrFLFPXTu1fTbCzJ4hRPVQ=;
	h=Message-ID:Date:From:Subject:To:CC:Content-Type:MIME-Version; b=X9IhK2lAUAE7c+9Zn/kGEfNcrlR8RDp+WsdOwWRsmw7vzjnIpvRvUFZ3ZYWdX2t6SsW6wB+5NmliPpzjKfrwzsaSaaDmhlrT6TEzVt1HlYP87T27qKYqbbV+qd3HLOTPLSVjluyN0z1wOjx3SbQ9Jt/jwpLSzvqlS0cU3mJoBFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=magd.ox.ac.uk; spf=pass smtp.mailfrom=magd.ox.ac.uk; dkim=pass (2048-bit key) header.d=ox.ac.uk header.i=@ox.ac.uk header.b=KBpti5uC; dkim=pass (2048-bit key) header.d=UniOxfordNexus.onmicrosoft.com header.i=@UniOxfordNexus.onmicrosoft.com header.b=OLGCpHpX; arc=fail smtp.client-ip=129.67.1.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=magd.ox.ac.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magd.ox.ac.uk
Received: from relay19.mail.ox.ac.uk ([129.67.1.170])
	by fallback4.mail.ox.ac.uk with esmtp (Exim 4.92)
	(envelope-from <praveen.balakrishnan@magd.ox.ac.uk>)
	id 1uC3FF-0000YA-Hz; Mon, 05 May 2025 22:21:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ox.ac.uk;
	 s=flood; h=MIME-Version:Content-Type:CC:To:Subject:From:Date:Message-ID:
	reply-to; bh=3OS0J5uQ2A7qkodxTeS1E3sPp4nlwxnVLDOeAWsC0mQ=; t=1746480061;
	x=1747344061; b=KBpti5uCoeX6B/aboyRmcSDl5jwiVXmF5aXobAorJZYmXmWzXKaT6apaBDTFW
	kVF53bWFwQvIROsVq4EQkH52gAd53x9gkXpZMYs4WLe9zxNVQ1aVWaxyVMKHl+3XV5cEDE6uImVDg
	YqY4/KCcgF1u/JqMSzN0Awm3TJqGrimBkcLdzpfpgLojPGR/hi1ojzTu9+hpMNBshnfiyfEWRClJD
	ggKyRGx5ilirc3vP7eRBRPZmrBFk1X9xHbxJOc2u1j9BlHEk7GzvQb+9NyrFhYGGzUagvRD5weg21
	F45x3H93l57dg8XWT2DVghxkE82/IvErvK36aOXxD7KA7zpj6A==;
Received: from ex05.nexus.ox.ac.uk ([163.1.154.245] helo=EX05.ad.oak.ox.ac.uk)
	by relay19.mail.ox.ac.uk with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <praveen.balakrishnan@magd.ox.ac.uk>)
	id 1uC3Ey-0001cd-CU; Mon, 05 May 2025 22:20:44 +0100
Received: from EX04.ad.oak.ox.ac.uk (163.1.154.244) by EX05.ad.oak.ox.ac.uk
 (163.1.154.245) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 5 May
 2025 22:20:44 +0100
Received: from LO3P265CU004.outbound.protection.outlook.com (40.93.67.4) by
 EX04.ad.oak.ox.ac.uk (163.1.154.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37 via Frontend Transport; Mon, 5 May 2025 22:20:44 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDZqNnVRcgxI2ac+8beIXJ3w8cYCTxiArJkJPpnCNU6nG9mcJZ6SVZWdLKwHyeaz2dBdhI91bmYSc+xWVnRe5FktpRcRv8x/23ICNKEfVg5tDSiniWxR/0qbIHsnwseHF3hHNgScMN+Rc4GhCPImKbD28+OJKkEfYiU6x1/psxyCu74yzExaUcE/YpKohDDFmmTz2jBFjNbm+yxLQ6rqKUl1vofcju3HBn+HGU+a12bIE39pZSSbGwNtsvetvRVumKNQYUtNMjW+QIZVi13a17EzZ4emU7GyRhcJzuIYWChUFCSNzkUs5jhszg8yZFsWLptrykpDxgPwDqNt0LmCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OS0J5uQ2A7qkodxTeS1E3sPp4nlwxnVLDOeAWsC0mQ=;
 b=dhFShV0CsGyc7jG9DxUSTL645r6pUj67ZrlAmz72gum3bb+spsbi7beW3rTrY1DYCZ9J/LmxsbrLLidhhJnuwcvE3DJW+YcJIrj+Xn//noqmOcj6d3cR0nHf+fxPL3k91EoYv6RvvWD5lXcY0T872piY7RNLAYrwkXNxTYClVxskKPYEYURq1kWF8RPBTpnzOtbu4nef9REgQA4/Cy3+7uThiUnILDst1naWqsn/eHLn+ZX44ymR/VzmTJps44m98BY95AgdXrfckn3usJnfUjYPhsecvY8376Q8Ak/6ePDeDohMRC4Qf4XvXvEL0OwMj/KmA3orHgg8mjYdELF5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=magd.ox.ac.uk; dmarc=pass action=none
 header.from=magd.ox.ac.uk; dkim=pass header.d=magd.ox.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=UniOxfordNexus.onmicrosoft.com; s=selector2-UniOxfordNexus-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OS0J5uQ2A7qkodxTeS1E3sPp4nlwxnVLDOeAWsC0mQ=;
 b=OLGCpHpXQG9phL2MrfF+6lBQrkuPiXo2x+DEWiE8WbCC9TrwaLtz97Ppsrg3FggHqfXrbI2fFMK3qjALEIzXlYl0pOkhBbOJoKWj7UAV+rGtoB7RmdOgLJn78SiEWRHmbJkvzzL5D+714+YMMGCI1Cln+0c+rx7XGUsdI1ak6w1vQyfzQRnJebpD6l3E/PDC9c8h/f5qaUlptORBCd8AvrjDIuETkA4AES5BAtYuNH6mIFGd8ZS5eORsiESjmEzA0YtJNHVl5sOPo/vCYOoS4aaVf6SHSOfAANHR0/BNNhEXroTqlsmYTXVqBmLAuj3J0n9ZnhYrV12ysSUgP7xAfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=magd.ox.ac.uk;
Received: from LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:323::12)
 by CWLP265MB2164.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:63::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 21:20:42 +0000
Received: from LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
 ([fe80::639f:86e3:3b7c:f6dd]) by LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
 ([fe80::639f:86e3:3b7c:f6dd%5]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 21:20:42 +0000
Message-ID: <f4dd058f-7854-4a93-b0c7-608e850bb548@magd.ox.ac.uk>
Date: Mon, 5 May 2025 22:20:40 +0100
User-Agent: Mozilla Thunderbird
From: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>
Subject: [PATCH] media: dvb-usb: az6027: fix return value of az6027_i2c_xfer()
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<christophe.jaillet@wanadoo.fr>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
	<syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0550.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::20) To LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:323::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO6P265MB6985:EE_|CWLP265MB2164:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f63ac2-b360-4ad6-0db1-08dd8c1ab10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|41320700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0pMbHROQXlIU1RTdGRla0luV2NtQjkvdjJSalV6MFVrRVBVVFJ0QUpGSU5z?=
 =?utf-8?B?a3FxdEZXaEVvRjByQit5a0NHQmJQMjZ2SzJvUmdBWHpBRXJOU1FJNXBxMDZ6?=
 =?utf-8?B?S0UxZkkySnl5V0lHY1MvQnJYK3ZNaXhseXhBOGFUbFBET1pSV0hRS1RjL2t2?=
 =?utf-8?B?L1ZKZGNQK091QmlMV2V5dHVqTmVXcUxOWEwzaDVBY05zTXZKZGd6S1NYSVo0?=
 =?utf-8?B?bS9xalRuUjlYT3lMYS9XK2p0UFZDdmUrZXdVckMrUTl6RXpHT29ad1lYd0JK?=
 =?utf-8?B?bS9PejRJczh6THdjOWxEM25LcjVrUjRyYkZJMzVURlNVNkRWeDRLVU5aZDlK?=
 =?utf-8?B?SmRoVm5UanV0Q0VIdS9lRE9XazBYOTI1ak5pcXI4cUc2QnlKODNoM0VUM05W?=
 =?utf-8?B?UDRNdWhrek9TWlBpWXJjbUFSRkdrL3hHQytIUlZUZ2FuaHlWZWRZc0FwNE84?=
 =?utf-8?B?Q0tsYkZmNjNqU2Y0MnNySzN4VklmclU4TnlxaHI4S1prZjB2VGVtWHd5dWZQ?=
 =?utf-8?B?R3ZxeThpNXowOENIQm9Ba1VQNXpia0k3Mng5R1QrTkNTOU9mSFpyUy9hZExx?=
 =?utf-8?B?MnU0VkF6NmtoUHdsNW1uZ3FhSENxQWJRd3p5K1FvOWs2WlpXZnQ4SXE3bjFl?=
 =?utf-8?B?QS9QeEw5eUoxUEtOY3YwSUFxR2cybkdycU9LQ1lGUmk2Z3BpcWM3ZW8rS2VR?=
 =?utf-8?B?NkhQMkJDdFZMTUJEZXVKcE9uZUJLU05ETkpoaTc1RzVSSGZGb29GUzNMZG9R?=
 =?utf-8?B?MFFOTjFBZEpvVmxlQ3JTc002eHN2b3B6NkdCc2lLMDQ4LzNmSnVpcWpHMUhB?=
 =?utf-8?B?YlVTaWdYWTJod25aUDZBNElLQlV6NVBhSGE1RlNmcElxaXJjWkM2blN6YjJp?=
 =?utf-8?B?MnFuMG5BU1J0bEF5VmJibkhZcHQvRmtDQk9NcEV3ajJObGFRbldCeHkzU3Qr?=
 =?utf-8?B?OHBmUEtncEcvK1lGdndFaVFVVjJpVkV2VHZEaktiTUd4TGpNSStSZnRCRDFE?=
 =?utf-8?B?bFJ5QmpiMTZwT2JIZFphM0ZaYjJBRHVpSFRIaTM3VDl4UTZzZTZ0YzVGSWE2?=
 =?utf-8?B?bDdvbU5oMjZiRDIwMFVUV3lDa0JkQjhpYlpHbkNXem1vZDZCWVB5ZzFUMlBJ?=
 =?utf-8?B?bzV0ZDZ2SHcxREQ3QVJKOXZ3N1Y0cHBGTk1vZzlqYnBsNUNEZ0psMlBRWVFj?=
 =?utf-8?B?TUt1T2hibXZ1S2FpdDNaMEo5MEN6aWtHbkplem9mSEt3c0tuTm5rNlFoS1U2?=
 =?utf-8?B?NG5iZnpXcHU1MkNMQldqbmVueHorcjRkOHdFQjYzdWVKcVZZUnlhNVJMLzBN?=
 =?utf-8?B?T3VjU1lhUjYyUm96U0JMVDJHMjhJbDNEODdha0FZZDI2Zjk4Ymp4VE9LRldN?=
 =?utf-8?B?NFF2UkUxTWI1cWtDL2JDODUzVlpSbWtmVyt3Q05jSnl5Vy90TGIyNktvSHBW?=
 =?utf-8?B?bUl5NkJrUUVoMVNQS3EyS1F5VFR4N3JmclN4RXhUY1ZmenNkVE5qaVd4RGlS?=
 =?utf-8?B?UGsvUE55SGNaR2t2MEdkaXIvV1FiajZsVHRPYWR1eWYwUDllaXl2cDRIVkl1?=
 =?utf-8?B?NXZDM05pTm8raWZyUkxkK0YrOTZ4MXNVWE95SXlkenp5cXBDTmxtM1BpT05W?=
 =?utf-8?B?SW9hS3RIUlJ0OWFGOEM1SUF4SmJ4czN2OWt1OTcySzduVVVLQU5BS3lBRDZZ?=
 =?utf-8?B?a2tYMHowdXpvd0FhM2VxZ2c0NE5SaC9ONngrMDZnb1dLYmxsTHJqZlBqT216?=
 =?utf-8?B?Qy9rUHNuNXh1SEYvdVVhTDl5WDlnWWMzMGs1QlQ2YXh3T3h1MzdEM0drOXN0?=
 =?utf-8?Q?M7C1/UYv1b6fD2CdcObgHikyfdjwr1dUgJsI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(41320700013)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUYwRGlMYU9EeFNreFhOdXorMGhYaWFXU2VBMFQ2SEpaWnFpaEtZQWo2c09U?=
 =?utf-8?B?dzJBOU9Zc3lrUHlrZHBncjFQOEc0b0daamp1MisrV0gwRkdKUnVXcWp1ZWl3?=
 =?utf-8?B?T2x5T243ZXRWZjdOcm90VFRGUE41b0lERDY3aWlJbERMVnRDWm1xdEVpMHFU?=
 =?utf-8?B?SlNKbmo0YTlsS1lCYzZ1bU5VMFNkL04zUTJ3UklwUEJzcS81YThFd3NKRGdY?=
 =?utf-8?B?NCttOGY5b0JmZUNJSDB2dWFDMlJVRTN0OXU3QWRGRXFPc1dTblFLR1ZoRXVZ?=
 =?utf-8?B?SldMd0I2V2tLMUFHWHpNRnMzdmtad0djdGVMQlBkYVJYQVdBaXV2V0pqMUZQ?=
 =?utf-8?B?SzBzTzhLZEZ4djZmeEZZRGMvYkFlZkZFWWhpQnRZTis0S1dHbDRQM3U3NHN4?=
 =?utf-8?B?RThUc3Y4b0hwYm1rRDhweE9pMlJ4bkt6SkQ3K2NRRjROeEpOWjJ3RGxaZUJw?=
 =?utf-8?B?c0VOUkpLdVZNS2ZhVzdzYmNOY20yZGhSaEFZWCt4TlQ3WjJsNEhGc3Y3b1ND?=
 =?utf-8?B?cUNENlFYVFh4ZjJiWTYydXlGbEt4cFNrTGlHQWhpd1BqWjZCTTBqdUtGTEJI?=
 =?utf-8?B?aEpiVCtKYzZ4RVYyTXJLWFNIZ2pkRzJRWktSa1hnd1ljdXV0OTU5NkpxUEs4?=
 =?utf-8?B?SjNNd2gyR3NXK21saXQzZWtqT0ZEWW1vTjRlZG5rU0VUbWtyMGkvVkpnZnRX?=
 =?utf-8?B?WGtFZmt0Q3VXaG4xeThtTThCd1Z5UTZaMlAvWXl0OUlHZnd0V0xxSWoveW9E?=
 =?utf-8?B?Sy9yVHpXOFhIWnZEUVFQeXJMM0d3aW5Qc3NHWnhRRjBjcmJxUWpEVDRxNnV6?=
 =?utf-8?B?SnNITWw4NUx6UTk1VEJLYTNYQkJCbE5JMUM4aDJoYnlhQU1LRVZoNXFLY0VD?=
 =?utf-8?B?WGRkQkwvQlFIK1plbUZyWDdzRXVUbDdmQWJBaDJFMGJEdldobTExL096VzZW?=
 =?utf-8?B?VG1ORzY0a1BFa3Q4T0xsaEw1czVVMnY5eWlLUTVxRWZiekp0N21BMHRSTlZR?=
 =?utf-8?B?RlovZGovRklaYzJtUmc4eVhRMGNZK1IwZXl4RlhycDB4UVpMczQrY2dsNWNI?=
 =?utf-8?B?T3owQlZOR0VJb1lpUXkzMDIrdXJHWHVLcE1KL1NlZHdNbi92TGdYZzVNei8z?=
 =?utf-8?B?NEVva09JVHlYSlRndWVHMnlaaC9Wak9qc29mUW9nNjNqU2RoS0FaQnlPVVkx?=
 =?utf-8?B?Z05pc3JKL1VRNDdjRDF6T211TVEyMjhLRThOSlFVeCtQbUJQc013L3FvVGNk?=
 =?utf-8?B?UFVvcjVndFZLbEl2MnBnQVlHZmVyY1Yyb0I5aHBxcVUxM05iSnpYc2MwMm9n?=
 =?utf-8?B?U0NuUVNsUjJucGJsU1l0djZLcFFpeHJIZk9jbzFGNlNYYUVpRFE5Z3htUDJL?=
 =?utf-8?B?SEtOYjRZanlzMGs4eklBNzdnYU4yNlNKQlg4OFNlMmNxRWpoeERSYzg0VVd3?=
 =?utf-8?B?Vmg3dUllanVhYUxucEovblJ5RllRYlJHNVlXamxnMVdiN2VHNHB0TU16dGxN?=
 =?utf-8?B?b2xUdGwwN3lGZzRwekFBYjNydmQ2QkdUQzhwKzJaa2twUU91dkYwRlU5bU9i?=
 =?utf-8?B?OUF4U1hwaFBBZ3JyTUsraHhVUFczNkNtQVdLN2crcDAxKzk5My9WSlZRa25P?=
 =?utf-8?B?STNVREQwRVBGVjhmRVhuL2h4L1Q2dnBFNkd4OXpjNEFmMnRsdmQ3NEt0ZmF2?=
 =?utf-8?B?RzVrTUlNaGNXYVd6QWhDRXRqd2FaTVJPSVRSUURqNmNVUEdKZTFBeElzOUEv?=
 =?utf-8?B?UFc0RURvRWVYSG9ZK1Z3cnpKNDlmY05XZlFKNVdQMi9CWEdvR3Z3V3BMaDlU?=
 =?utf-8?B?YmJxK2xSY0tEQVpsSVh0cjlER2drcW0yM2cxaXpBSTJ5RldKeHJodm9GYXBu?=
 =?utf-8?B?RTdIWnJuRWVJYUwxOTBBY1I5NTg3Sm5Rc2NXbTFuQm5Fc1ZreXVSV3pYc3E2?=
 =?utf-8?B?dDgyamQxaEI0dGsyODFhUEh4TCtTTUdCdFNqUUxzeXVHUE5yWmdiQklIUkt2?=
 =?utf-8?B?YjdxZnJnT05kek9WVk1QdCtvc1NZemZsZk1lMTRSN3RDWFpqNmNIcjc3SnA3?=
 =?utf-8?B?SmxDYlQ4WGxkSFRRNHNmZysyVEFzSHljVEh2Um83bngveGw1UWZrQzJVY0lV?=
 =?utf-8?Q?nm24xam3jTBbb71EZKqjee+Kj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f63ac2-b360-4ad6-0db1-08dd8c1ab10e
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6985.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 21:20:42.5034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: cc95de1b-97f5-4f93-b4ba-fe68b852cf91
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUaTJ7e0ptTQUhAF9fB0rLUC5M654/1ACXFjnk5utILAcevWemawMf/UT5F2XKkTaqDjFh3WZVTWuEX3yiTz+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2164
X-OriginatorOrg: magd.ox.ac.uk
X-NTG-DKIM-verify: pass 

syzbot found an infoleak bug triggered by the az6027 driver [1].

In az6027_i2c_xfer, the return value counts the number of messages
passed to it, when it should count actually executed messages. As a
result, i2cdev_ioctl_smbus can copy an unwritten buffer to the user.

Introduce a separate return value counter that only counts executed
messages.

[1] https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb

Closes: https://syzkaller.appspot.com/bug?extid=08b819a87faa6def6dfb
Tested-by: syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com
Reported-by: syzbot+08b819a87faa6def6dfb@syzkaller.appspotmail.com
Signed-off-by: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>
---
 drivers/media/usb/dvb-usb/az6027.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/az6027.c b/drivers/media/usb/dvb-usb/az6027.c
index 056935d3cbd6..be9cbbd4723d 100644
--- a/drivers/media/usb/dvb-usb/az6027.c
+++ b/drivers/media/usb/dvb-usb/az6027.c
@@ -957,6 +957,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 	int length;
 	u8 req;
 	u8 *data;
+	int ret = 0;
 
 	data = kmalloc(256, GFP_KERNEL);
 	if (!data)
@@ -976,12 +977,13 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 			req = 0xBE;
 			index = 0;
 			if (msg[i].len < 1) {
-				i = -EOPNOTSUPP;
+				ret = -EOPNOTSUPP;
 				break;
 			}
 			value = msg[i].buf[0] & 0x00ff;
 			length = 1;
 			az6027_usb_out_op(d, req, value, index, data, length);
+			ret++;
 		}
 
 		if (msg[i].addr == 0xd0) {
@@ -1001,12 +1003,13 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 					msg[i + 1].buf[j] = data[j + 5];
 
 				i++;
+				ret++;
 			} else {
 
 				/* demod 16bit addr */
 				req = 0xBD;
 				if (msg[i].len < 1) {
-					i = -EOPNOTSUPP;
+					ret = -EOPNOTSUPP;
 					break;
 				}
 				index = (((msg[i].buf[0] << 8) & 0xff00) | (msg[i].buf[1] & 0x00ff));
@@ -1017,6 +1020,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 					data[j] = msg[i].buf[j + 2];
 				az6027_usb_out_op(d, req, value, index, data, length);
 			}
+			ret++;
 		}
 
 		if (msg[i].addr == 0xc0) {
@@ -1035,7 +1039,7 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 
 				req = 0xBD;
 				if (msg[i].len < 1) {
-					i = -EOPNOTSUPP;
+					ret = -EOPNOTSUPP;
 					break;
 				}
 				index = msg[i].buf[0] & 0x00FF;
@@ -1048,12 +1052,13 @@ static int az6027_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[], int n
 
 				az6027_usb_out_op(d, req, value, index, data, length);
 			}
+			ret++;
 		}
 	}
 	mutex_unlock(&d->i2c_mutex);
 	kfree(data);
 
-	return i;
+	return ret;
 }
 
 
-- 
2.39.5


