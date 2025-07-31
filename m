Return-Path: <linux-media+bounces-38695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13941B16F22
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 12:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 634A71AA1C86
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 10:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30C7221561;
	Thu, 31 Jul 2025 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OOySnTN+"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF82745E;
	Thu, 31 Jul 2025 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753956261; cv=fail; b=epj/M1ZwmSnvOzZ0oAU5ht3gWA/XClBwjiLpHHB4OjiyHAL9TbsE9obp72NyuZVJsiCXSLcNnY9/52s2elVRE5MBHAIeqk2h0JrSI1ITKQugRsFLpFPLzULnamywp5JYC20bUSY488h8zvOYvWKOT6lG+2rRxWCx0jmeLrdGXB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753956261; c=relaxed/simple;
	bh=wVeo+yyajxr81Feknr0SI2S8cvNjKvA3JMfiKuH4efM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o09DRm3MqywuO4D7aj62q1JIbGyc0LXxoQWyTpe0sGInhBKHEMvpQg2EsbzBi9HjAEu2+SsJm4xd7MUWiGpUWl3lHUSqwGMT6xbGZFczfJ7WxJTbx/T4S85YOC7YjRNBxXfc5osMCTRYY2Vof3DwMn2jrt6n3OnOYEr+IR2FGEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OOySnTN+; arc=fail smtp.client-ip=40.107.100.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIc4TwA78X6cwIbEkvjOedVcvmDcMb5dwTA487nSO7Py2bXHvv9Q3IkIp/GQIQhbiZmPZIY/yk13I7w8CjvBel5Ibw1ycx5LIL+1Qf8TMkgwzBfqr9iT7UJatZLiN25ljrvr5G3QdWMy5Lppn/DAHk1jdZgbEmK1IumUstyqJ60ZRCnq8/SXuoknRYFGJ5ApvOXj6W5F4NBoeaIjv0qUxGrM39Ppyd1sFvnviRPWMSZfwYDfaI3Q1nYDizucRqxD5wsJcxmckEXcIqnv/UVpkD24mvKM7Sv27J91OFTERT+zONJ0/txh72WvvkYnWqrtZUbZnK1nx1zf8scnqj5JlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Q0rre0KypxgJ+YcZ6m5V/iQssOH0es6Y4E0pnx8Lu8=;
 b=Lc8xisF/ZQYNZ29TKp+bJBcPd6sVgs/CQln0qiz6qRjsu2bqMCc1f66uzE5FlAbTAWHywWULCSFwETWs15d8R3H1twEw8edxQpHESMvtZV/5xF6j/fDyM1YsB7Vypl+tkvSncALESI3RnRDEYf3RckiVAihUKK+/aHVX1T813of1Hw6PIZIeFu519FBQ2ihzxstvBrBPvI+1ZOHq7k/b0bqB3bP2mBXkeJ6QmQvD9aco19OAPRhEmFUMV6Uggj/gE90ACM0RD3gMFHjmGuiEWqZkzXWcHYWCQLgoJB5BYSQu9fYGXCl+RFCcxgncbQbpPFr3PTaR7I2iQMwnHiwA8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Q0rre0KypxgJ+YcZ6m5V/iQssOH0es6Y4E0pnx8Lu8=;
 b=OOySnTN+OgdGEjDK0mnz532Oc7P59F07VY/ljWPF1SuruYevxYLzvXJWBgniQR5OZPb7I0xN5d2l2f3ZUrQAhhmH4DsLdINjIcmAben6pUGTNSPitsBkrhRZSRGB8v4LSSWF6NuqLZ5FI/CnPZciiBq7Zlhw80cOxnQXkBsXYzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB5830.namprd12.prod.outlook.com (2603:10b6:510:1d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 10:04:15 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Thu, 31 Jul 2025
 10:04:15 +0000
Message-ID: <1a9a4beb-97ab-4853-8201-bf08f1a030ab@amd.com>
Date: Thu, 31 Jul 2025 18:04:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aIEmJXNpNN0QF233@sultan-box> <12fb4d09-6b94-4f54-86b8-8a3ac0949151@amd.com>
 <aIVXVpg_9XxRXUAH@sultan-box> <b02d0749-6ecb-4e69-818a-6268f894464d@amd.com>
 <aIh7WB0TGNU15Zm1@sultan-box> <aIh8JPTv9Z5lphRQ@sultan-box>
 <751e9265-889f-4fbf-acf8-7374311a6b6f@amd.com> <aImvvC9JEgQ2xBki@sultan-box>
 <a3272335-1813-4706-813e-a79a9cabc659@amd.com> <aIq5EyQ_uuO63dJb@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIq5EyQ_uuO63dJb@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a37571-99f3-4deb-2e04-08ddd0199b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXRkZk5DR0t2ci9GRE1HRkM1bTlBYUE4Skx2TU8xbFJSeGRnR1cvZDMwVTJ2?=
 =?utf-8?B?VllGUXAydGUzNGQ4TlJ6d0NiZDM1cVNKUWEwVkhrUnNFZGhQVkl6clVoTXhU?=
 =?utf-8?B?bWJUVGVYTHpSdko2R2Q3K3FjeUlmQ3BTSVNRTVlMQXBwVmZmNitDaGs0SnZp?=
 =?utf-8?B?SEpIc1ZkZkhmTGdhRU9TaDN2bU95NEVCNlJZOGFaUi9xWUtXTUVBSDVGMFJV?=
 =?utf-8?B?ZDV1and3OWRSVmgxWmN3OEZjU2VLditJUWNObmlZOTgyWS8zeTAxRlBzQitV?=
 =?utf-8?B?dThxTVIwTXhBZ3JXR1dSZkJIenBUajFBMElyQnh3N2tNcTMzV1VVcVl2RnlC?=
 =?utf-8?B?TEt2aU10RVJoWk5QNWEyRFR6aE41SEtEcFphWTJmaXBOeUh6a2lLNjVjMWtG?=
 =?utf-8?B?SUZjQ1ArdXJRU05Wc3VPZW5WdEJGUTJrcHJsY1ZXWnpWS0ErZkREaitjVS9O?=
 =?utf-8?B?dDlJNHVYa25Oazc4SUgzdmJuRml0bU1MNVBIWWNrVUltWGVFcVVweTFJQ2JB?=
 =?utf-8?B?V3VlSkVGb0RKZy8ranVZcjdFUVYvNkVScHlETkdGaVN3RldvZm5qbGpZVHZX?=
 =?utf-8?B?SXlNcGIvSXM3a08xblFFV3dDbUhvUjUyOVdOVGVLaUJxYTlTcFRGUTF1TEE1?=
 =?utf-8?B?b0l4NGcwZS9oQjdpWnNibEMrbWF5UHpyemVvTG1VbFNIWU9kNFMwR1Y5UEox?=
 =?utf-8?B?cGV5Qlc2aHZuWWszeHZTeVUzYytHdEJJR1Y1UEtFOUhzMnQwTGVaLzBKUlhj?=
 =?utf-8?B?TmtlVkZJcStkWWlyd29uaUtqZm1CZDBPUC9mWjkrYVV5WmdXaTFIaUNLUy9V?=
 =?utf-8?B?YXBod3BTaTlYQzF1ZHBQSk9QS3dNUXdCaVFRNHJ4RWNBVEozbGNQbHpPdHpq?=
 =?utf-8?B?V3lTeWxEZS9oWHdqdStOTjZLVUNHenZXVDhMMkhvQUNBaDl2ektVVU1CR2wy?=
 =?utf-8?B?eElQRFNOdXBBejBEemVEaDFhZTBPa3Rqb1puWnBMU0pta1gwNmI0Mk9Vdnc2?=
 =?utf-8?B?VFBmNGlteFU4bHRLR2ZsalZtYVVJQzllVmhwS0QvQStsdTFaVjlpNUZVcDhS?=
 =?utf-8?B?Y1ZIeGF0c0xtRVBWOHRlS0dCWlFBdllLaWZtbllqczdFcVJyM1hreE5nOU14?=
 =?utf-8?B?cU0zVUh2aDlHZXZBUlpOb1NzT1Y3bFBMNUQ5aVhqUWhxZTFncUd4Z3V1cWRD?=
 =?utf-8?B?NldSZTgvOEtTc3dCeDlrMTBnYlZrZzk4aktzK0NDTlZ6MkFNQlJPY3pxdEdk?=
 =?utf-8?B?NUQ5TXdUZ290VDl0Ri9iQTB6OE1IQysyQlZENGhUVWtvRXU1aGwvTk9sYUhD?=
 =?utf-8?B?QmZ5RWlEU2QxR1IvU0R6cC9Wc21DcFp1SS9YU2pLWjZoNHkrWGNkdFcyVGl0?=
 =?utf-8?B?clFyK3grRUY0S0NZV1gvbnUyZW5sMEc3dEpUQU9hZXo3dWRTd3VpSXA4RUwx?=
 =?utf-8?B?MkgyM2krVnpKQzJPeDRKYm1uNjhsM1dpOEdpb2lGS2pNZUNmR3BtVEV2YmhB?=
 =?utf-8?B?RzJuSVQ0cFJZc24yL3EvVUtYS3NyZjRkSTcwRVdEZEhRYmlDZVlOMkF2RzM0?=
 =?utf-8?B?VTFaTGFPMWlaTFhSeGZQa0dhM2N3NDBYRXF3aE5EeE9WSndaYlp1aWN6M29N?=
 =?utf-8?B?S2hEVnJEYXNWdjJ4RkFOVzlJeFhLUUtwb3puaGtWblZOKzByQkt1Ym1COXQz?=
 =?utf-8?B?NThNZWxySnR6U3FTTmlZV2I3ZWNOeU8vcytVRVRybC8zQzhSK081dlR5c1Zw?=
 =?utf-8?B?TGJHSVRabC82bUs4Nk1ERkFNRk5FWEhCNmFnd0FCN3RTYTVtcWxsU1VUQ2hJ?=
 =?utf-8?B?NDJSaEpDcVZaK01iVVJiSGpQMHR3S3FjcExFT3pCVHlkWm5hYjBrMHJNWjhQ?=
 =?utf-8?B?Z2RUbnlkYkovYWd5RGVmM3NhYnZHVTRGUHczbk1lc0JBRndhYkhYQXhkSmU5?=
 =?utf-8?Q?DpOLJJG9mEE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0I4b0VSTFV6WVJuS3NqYjVCOEJVWW1CUm11NFd3Z0VpM3k3VUIvb1IxRitP?=
 =?utf-8?B?V2h2Y21vYUY5NDh1dklNVEZEMEplZTdaVGFJZC9mMzFVRDdYQTNOMXo2czd0?=
 =?utf-8?B?NDNGTzkrZDNmK3JUZTJHTzdsY2RJWkVKSUFpOUpNaldSUjV6TFhIcVhPTC95?=
 =?utf-8?B?NW1FVDNWV3p5SXo4NEpySVRnMXR2THYwTWVubE1tNVZ5ZG1XZTBpQjJheTl6?=
 =?utf-8?B?MDRaVWl1bSsvSlEydm0zYjVvcjRFVUNWYVErVUNwZkMyUVk1eThEenQwZnBD?=
 =?utf-8?B?OXNzbzN4NEpHRmlUci9UY2Ftb0NQblFSTkNDK0gxd255Vmh3Z1lXMUtNNW8x?=
 =?utf-8?B?WWVqQnp6a0ZSeHk1M2tNaHZOdFVLckM2NHVpRm9RdnFMTEpMN083clk0VExJ?=
 =?utf-8?B?Z1hjRkp2QzNJc29HSFU2WVVFdlBhWjRhS3ZFYXRNd0pybmRpc0ttRlhHUkVJ?=
 =?utf-8?B?YmRzcUtpanNCRGxyZmxKbUd1NjVQQUlTdmd3a3pheVZXdzgremczRTFIa2NS?=
 =?utf-8?B?L01jS1Y1blQ5a2huZ2VCL1dyMEpHL1NFUlZCMzRNclhLd2Vsa2hlNDlFQSt5?=
 =?utf-8?B?SHc2M1FLWU12dlVMSEdscmgzVlUrNkFnaFlOVkg0d0JZcFJVbitlQWUxSURp?=
 =?utf-8?B?UFJBc3d6a2tjeVJJY1c0aWdLWWJqeFNYdTgvVGJOd1Z3ODcxUWlQNng1VG9H?=
 =?utf-8?B?NFFuQkpjZUFCakdiTVJzL2w4RmdRSU52YmtNeVFoTkFtemlRNEJ6QmdwRjNF?=
 =?utf-8?B?TXc3cGJsdEtDL3YyVkplSjBXcGxobTdnY2RxdG05bzFYVUduMFFTODBBSW55?=
 =?utf-8?B?K0NncGNLeElWYStySXdIaklxa09sMWpIMEtPbUlCMUZxY1hIRHh0eVRjZm9s?=
 =?utf-8?B?cXl6cVdaR3VsTkYrQjQ4enA1NE9vbkx6RmYxRHQ4VHNXeFVxUkNraVkvMGpM?=
 =?utf-8?B?cFhrOVQ0TWtHejduWlovS25lTE02a3FIcDlHYytOdm9zTllGVzAzUnlMNkRk?=
 =?utf-8?B?QkVvRS9nWHJDbFAxQXZSbjBOZHpwQy9XREVPcFpnWFRwcy8xVVlZNk5seFRj?=
 =?utf-8?B?RGRYcytyeGRhaWlwWXdhWDZMT0M4Nk5uN0dQbGNWZ1JFUXlGRzEwVXNLSFF3?=
 =?utf-8?B?S3hlNXZHVjNkZGdmdTFLZmhtM3lwdlNoc3BKUTBJc2pNNDhXcEFWUUQ5K3ow?=
 =?utf-8?B?eHhVdXNna3dIUnR2Sld1TXJHa2hqK0FnckhDVFdyMWFOenN5WmtKdnNzY1cw?=
 =?utf-8?B?cFF1WDhlT3B1UGpEeGxOT1h2dEN1b3A0SkxMTXFBazBaSkd1ek1oaEo2OFZi?=
 =?utf-8?B?WFA3bFpnRXFGbXhzend3WXVuSEM2RE9zTDFDQ2g1TlhrQ0lSNnBMNlg4ZEh1?=
 =?utf-8?B?dDJBdGU0N3pqdFR4czhVM2RwZXllSlR2MTh2STBFYnhiSTAyYzVyT1B1OVBQ?=
 =?utf-8?B?eVFPMm5UdUFIdnVVR0RuelF3RlJsMHRYbG5GR240OS9jTTVnTmdLTzFQTmlq?=
 =?utf-8?B?dEl5M2VNYmZOT2lBMXBocndEOHEvb2xHVmxQUDFNUmRiT3BPMm9qUHRZSVZm?=
 =?utf-8?B?a0UrcEtnMExJaVZIcXpuWjVaNE1aMkhBR2JidWIzbEtTSGUzS1RwQVppczZ4?=
 =?utf-8?B?TitpWWMvbEoyV05lU3plSzNNbWZHNDlGTmlwampsT0VJUlhrakN2eVZ2TWpN?=
 =?utf-8?B?UWRyakliUlFleWo1U091NEk3OWhBcFowZnNlTWcxWlZxbU9lSWpnTXFLb2pW?=
 =?utf-8?B?UHlOMU8yYUhPbjk0akxZV05iODNXclZ4bFRya0VrR1VxaWpncDBRYTBkVGd2?=
 =?utf-8?B?Mzg3YmZHQ3hQTG0vSThkV2Y0cWVqZlgxUEFUbWlqYTQ3VGtFQzJXSTR6SFZi?=
 =?utf-8?B?djJiRVdzbFJNTEkvSFQyRUVXajlXS2VBT0svcW5OR0RBdUVwSWI2QVRmTGNp?=
 =?utf-8?B?U1dPQzB1dmZmM1QzbUQ4UkM3WFlpZFFwdEVRb2RJRHBjRGMrSzUwbnBuclFx?=
 =?utf-8?B?ZThpZHJxNXRzMzl4UzhRUEYrZUdQNDNmQmVHT1F6dGdEcUJFTlNaZmxVY0RC?=
 =?utf-8?B?Y0pnUTlsQ2o3Z2NMSXVUVHp2bGpJSi9JMVdTcnQ5NkFqNktRY0hQSzBOVThu?=
 =?utf-8?Q?vKPg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a37571-99f3-4deb-2e04-08ddd0199b1f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 10:04:15.5130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IE5tuFxtcazcTMsDoe84LzROnFj/rH1RY1/W6QtHijqp2UucCQUldEai0Haam/Oq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830

Thanks Sultan for your test

On 7/31/2025 8:30 AM, Sultan Alsawaf wrote:
> On Wed, Jul 30, 2025 at 05:53:58PM +0800, Du, Bin wrote:
>> On 7/30/2025 1:38 PM, Sultan Alsawaf wrote:
>>> On Tue, Jul 29, 2025 at 06:13:50PM +0800, Du, Bin wrote:
>>>> On 7/29/2025 3:45 PM, Sultan Alsawaf wrote:
>>>>> On Tue, Jul 29, 2025 at 12:42:16AM -0700, Sultan Alsawaf wrote:
>>>>>> On Tue, Jul 29, 2025 at 11:32:23AM +0800, Du, Bin wrote:
>>>>>>> Thanks Sultan, please see my comments
>>>>>>>
>>>>>>> On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
>>>>>>>> On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
>>>>>>>>>> I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
>>>>>>>>>>
>>>>>>>>>> I cannot for the life of me get the webcam working under Linux. The webcam works
>>>>>>>>>> under Windows so it's not a hardware issue.
>>>>>>>>>>
>>>>>>>>>> With this patchset and all of the patches you link here applied to 6.15, I get
>>>>>>>>>> the following errors:
>>>>>>>>>>        [   11.970038] amd_isp_i2c_designware amd_isp_i2c_designware: Unknown Synopsys component type: 0xffffffff
>>>>>>>>>>        [   11.973162] amd_isp_i2c_designware amd_isp_i2c_designware: error -19: i2c_dw_probe failed
>>>>>>>>>>
>>>>>>>>>> With the old ispkernel code from February [1] applied on 6.15, the webcam
>>>>>>>>>> indicator LED lights up but there's no image. I see these messages at boot:
>>>>>>>>>>        [    9.449005] amd_isp_capture amd_isp_capture.1.auto: amdgpu: AMD ISP v4l2 device registered
>>>>>>>>>>        [    9.489005] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: The OV05 sensor device is added to the ISP I2C bus
>>>>>>>>>>        [    9.529012] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
>>>>>>>>>>        [    9.554046] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
>>>>>>>>>>        [    9.554174] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
>>>>>>>>>>        [    9.580022] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
>>>>>>>>>>
>>>>>>>>>> And then the kernel crashes due to the same use-after-free issues I pointed out
>>>>>>>>>> in my other email [2].
>>>>>>>>>>
>>>>>>>>>> Any idea what's going on?
>>>>>>>>>>
>>>>>>>>>> [1] https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
>>>>>>>>>> [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
>>>>>>>>> Hi Sultan,
>>>>>>>>>
>>>>>>>>> [1] is for kernel 6.8, believe it can't be applied to 6.15. We didn't verify
>>>>>>>>> on 6.15 but we are really glad to help, would you please provide some info,
>>>>>>>>> 1. Suppose you are using Ubuntu, right? What's the version?
>>>>>>>>> 2. 6.15, do you mean https://github.com/torvalds/linux/tree/v6.15 ?
>>>>>>>>>
>>>>>>>>> After your confirmation, we'll see what we can do to enable your camera
>>>>>>>>> quickly and easily
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Bin
>>>>>>>>
>>>>>>>> Thank you, Bin!
>>>>>>>>
>>>>>>>> 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
>>>>>>>> 2. Yes, here is my kernel source [2].
>>>>>>>>
>>>>>>>> I have some more findings:
>>>>>>>>
>>>>>>>> Currently, the first blocking issue is that the I2C adapter fails to initialize.
>>>>>>>> This is because the ISP tile isn't powered on.
>>>>>>>>
>>>>>>>> I noticed that in the old version of amd_isp_i2c_designware [3], there were
>>>>>>>> calls to isp_power_set(), which is available in the old ISP4 sources [4].
>>>>>>>> Without isp_power_set(), the I2C adapter always fails to initialize for me.
>>>>>>>>
>>>>>>>> How is the ISP tile supposed to get powered on in the current ISP4 code?
>>>>>>>>
>>>>>>> You are correct, yes, i believe the I2C adapter failure is caused by ISP not
>>>>>>> being powered up. Currently in latest code, isp_power_set is no longer
>>>>>>> available, instead, we implemented genPD for ISP in amdgpu
>>>>>>> https://lore.kernel.org/all/20250618221923.3944751-1-pratap.nirujogi@amd.com/
>>>>>>> Both amd_isp_i2c and amd_isp_capture are in the power domain and use the
>>>>>>> standard runtime PM API to do the power control
>>>>>>
>>>>>> Thanks for that link, I found it along with another patch on the list to make
>>>>>> the fwnode work ("drm/amd/amdgpu: Initialize swnode for ISP MFD device").
>>>>>>
>>>>>>>> Also, I noticed that the driver init ordering matters between all of the drivers
>>>>>>>> needed for the ISP4 camera. In particular, amd_isp_i2c_designware and amd_isp4
>>>>>>>> must be initialized before amd_capture, otherwise amd_capture will fail to find
>>>>>>>> the fwnode properties for the OV05C10 device attached to the I2C bus.
>>>>>>>>
>>>>>>>> But there is no driver init ordering enforced, which also caused some issues for
>>>>>>>> me until I figured it out. Maybe probe deferral (-EPROBE_DEFER) should be used
>>>>>>>> to ensure each driver waits for its dependencies to init first?
>>>>>>>>
>>>>>>> amd_isp_capture only has dependency on amd_isp4 which is the ACPI platform
>>>>>>> driver, it is init before amd_isp_catpure.
>>>>>>> Do you see in your side the amd_capture probe failure caused by failing to
>>>>>>> read fwnode properties? If that's the case please help to check if amd_isp4
>>>>>>> is loaded successfully
>>>>>>
>>>>>> I got much further now: there aren't any driver initialization errors, but when
>>>>>> I open the camera, there's no image. The camera LED turns on so it's active.
>>>>>>
>>>>>> And then shortly afterwards, amdgpu dies and the entire system freezes.
>>>>>>
>>>>>> I've attached my full dmesg, please let me know what you think. Thanks!
>>>>>
>>>>> I almost forgot, here is my current kernel tree:
>>>>> https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.16-sultan-isp4
>>>>>
>>>>> Sultan
>>>>
>>>> Thanks Sultan, yes, seems much close to the final success. Will have some
>>>> internal discussion.
>>>
>>> I got the webcam working. The same bug happened when I tried Ubuntu's linux-oem
>>> kernel, which made me think that the issue was firmware.
>>>
>>> And indeed, the culprit was a firmware update from February. I bisected
>>> linux-firmware and found the commit which broke the webcam for me:
>>>
>>> 	commit 1cc8c1bfa11251ce8bfcc97d1f15e312f7fe4df0 (HEAD)
>>> 	Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>> 	Date:   Wed Feb 19 12:16:51 2025 -0500
>>>
>>> 	    amdgpu: Update ISP FW for isp v4.1.1
>>> 	
>>> 	    From internal git commit:
>>> 	    5058202443e08a673b6772ea6339efb50853be28
>>> 	
>>> 	    Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>
>>> 	 amdgpu/isp_4_1_1.bin | Bin 4543184 -> 6083536 bytes
>>> 	 1 file changed, 0 insertions(+), 0 deletions(-)
>>>
>>> Downgrading firmware to before that commit fixes the webcam. Any idea why?
>>>
>>> Thanks,
>>> Sultan
>>
>> So, can i say the working firmware binary is this one?
>>
>> Commit 8f070131
>> amdgpu: Update ISP FW for isp v4.1.1
>>
>>  From internal git commit:
>> 39b007366cc76ef8c65e3bc6220ccb213f4861fb
>>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
> Correct.
> 
>> There are too many changes between them, so i can't tell exactly which
>> change caused this. So, from my side
>> 1. Will try these two firmware to see if we have the same issue.
>> 2. It has been quite a long time since last release, will see if need to
>> release a latest one.
> 
> Thanks. It was a quick bisect for me, so I'm happy to help test if a bisect
> between those two internal git commits is needed.
> 
Really appreciate your test.
> In case it makes a difference, I have the laptop with the 2.8K OLED display. I'm
> aware there is one other display variant on other SKUs, which is a WUXGA IPS.
> 
Good to know, I believe it won't make any difference for ISP

> Also, with that old firmware, my camera only works with the old isp4 driver from
> that Linux_ISP_Kernel repo (which is the same isp4 driver used in Ubuntu's
> linux-oem kernel). Does the new isp4 driver you've submitted here require newer
> firmware than the old driver located in Linux_ISP_Kernel?
> 
> Sultan

We had a try, yes, both of the old FW can't work on the new ISP4 driver, 
as you know, for the last months, we did lots of driver modifications 
for upstream and cause it incompatible with old FW.
Now, under internal discussion to upstream a new FW to support the new 
ISP driver

Regards,
Bin


