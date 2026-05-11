Return-Path: <linux-media+bounces-61089-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHA6GHHGAWqSjgEAu9opvQ
	(envelope-from <linux-media+bounces-61089-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 14:07:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E85F150D514
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 14:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89B12308D99D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6376537A485;
	Mon, 11 May 2026 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bLV/0THz"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC3337881F;
	Mon, 11 May 2026 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500906; cv=fail; b=qy6o2dRrHY0Gg4cpJDpiRqLa5kSzG9QDK8TGl5MGg2fUaAND4uzweRRescyFOyqq7pto4veA4qEJ+92Zb6k7o6lA/zVZCgXA5FhjLTQSmqwe6HMH0CljiW6kylktSsJDlWBrswo9d/ojViFRVHdzsTo3qpF7/tzCIy4gQIcI4gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500906; c=relaxed/simple;
	bh=7VngcJ1KaBxbHvvhgmbXL3Y1zpgylr75oM0HB1ZyJS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b+otwV9HWTozPgHXG84OaiZozl7YVzEa4gFI//af31dxA1K8y9ychfVFsDeDCTThgJl241NjYiCDkQJpotbGMG2+k0AtCQ0zGirtVsABv1YhLleD2i7nKDo4cKeUQH0hiBViATJ3rcqwd2cww1YnAQlBbDmmch9H5SovHDEp8Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bLV/0THz; arc=fail smtp.client-ip=40.93.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=genZmT1pmjBq32Dybc1/rImfJSoOb6UMsobcYr+/kLly4/fuY6zaOen1X3Dc6Y8Y6MGIpDBE71UipK7qH3V25A0SvAa4ufFYmK6G4ujGKia8kzQKBBb3MXopMZkmEOMyOJnaq2IHjX4hRHoGjoBMNhjbOknIQKVtEftxf8YmfKir6vISSsTIm+FYvIgmOwZFaUtzxIlsXwfo4/+sFv2mfhuY0cE5ccyXq/b9IiVFiKW5DtWV2g0vfHCet9eebeVc9mY5avLG5AI4jF/522EA51nGvsnG+NE8qDCL3grpaDcar1ddMFf7AEoZQegre5VSC8NmeTCoiX3OTjPcMxKOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VngcJ1KaBxbHvvhgmbXL3Y1zpgylr75oM0HB1ZyJS8=;
 b=u8lEu3GvCxXTKhxvggctS4AQ2IyNep6mHCzQufhv0e1FDuB8jL9K1hM6P/92AMNm8BztUN0sZgf6CR8aQw4Zr7QcGCBCc5lhZFJriJD86z/Awl8fX9T20a0C04i06/iMFOWWSc2YnoeKrlt9HlFy8N5mp8HB0LG1ptij3mG2FyTTG8/n2/ZhLgbqGbw2WoAZUL0US87/kLBusxp9w9YhBPn/HikN2S7UuSLp91aXw2XNUlWt1dLzWGc56Et+2W+jxUAtS6K2oTBC1ra2L57lKmw1EOAv43W249A2R854bSI/B/fD4FmLMi3vnJUJ8J7CbsaHxQcpFHgjMlGWGfum5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VngcJ1KaBxbHvvhgmbXL3Y1zpgylr75oM0HB1ZyJS8=;
 b=bLV/0THzlz/nxswzqQe1XxfUZV5ZfG4eyKIBCIM+QTJiedjutKkmTqYkl1o5gYkyYXJyKxwry8efAbEE/9KHZTX0AUgp0HS51aYU78L/JNC4/r+hD8nR3JcJV7LNy8RXOUwDUaUjscnOcwxGJrrRgcwbnzYkNt/iH80b/8SMePDCmhKo6aQsvBij48uUR8tYtcx6YVxAstmvRI5vjzWJXYn6R8fE45nubrS1KGM7/99Vm/cVJPWHgXmw180eRMjI2hzGij3bx4ssbD3B7sC0NbdVZHQpbMZLQVWE2+Lt1rjgye23PIPkd5MjXINXY67CZR+dOUEACfzLk3+DtcYBXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY8PR12MB7610.namprd12.prod.outlook.com (2603:10b6:930:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 12:01:39 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 12:01:39 +0000
Date: Mon, 11 May 2026 09:01:38 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
	christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
	alex.williamson@redhat.com, vivek.kasireddy@intel.com,
	dan.j.williams@intel.com, yilun.xu@intel.com,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com
Subject: Re: [RFC PATCH 04/12] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20260511120138.GB1116784@nvidia.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-5-yilun.xu@linux.intel.com>
 <c0b160f8-2930-4158-9e50-b4cc4209e2ca@amd.com>
 <afs/Jamxnj6GGFfM@nvidia.com>
 <3128deea-95a3-4c36-902b-37f280913f2b@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3128deea-95a3-4c36-902b-37f280913f2b@amd.com>
X-ClientProxiedBy: BN9PR03CA0275.namprd03.prod.outlook.com
 (2603:10b6:408:f5::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY8PR12MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8f060f-4242-476c-e604-08deaf550ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PXvgFp92o9GkMRuEMEEj9nrC/7bDARxqOe+GIJmi1R4IFtttYiDbAoKB5nu/F97eMJ5xMbdECpH0QEBYQm9mkqctOGOwp0NgMwFhOmfPbugIcuBjTP73dyJgEZ+1R3g6oKgYTkT7ZAyg6PcaxDqoCjKYwqMoWrLb8migaYXK6S8IBb7CBIxxB484cWbZHDDjAHzAjHcEIT4vMMW7Y4zERw6LwsDLxCVKH5BxT3SYRYsdeUiJExzzJRfPhNg74Q0nBVtiGBRnOQ9SEpqRD8Fx8NBagExT+inlvo4I889l1QrF4OuHWGIGfxX7rtQfnkNfL87lHCtlZ1q0taJem/saF+v0g6xt05YAMViQCz7tzSvNyf6stj4G9b2e/rowRJRiEigO+p//9p2wNvrspLtSlaiYsv/MkZEpscdtDhG8Q2sll1zfQZvc5U1dh9TWvfyMln2OPU46RDtKv6ikm18vz/F1HHhwiOPlsgMUccS7p74esXadlq2J8qZLR5iGa86Nkm17Lix+8EMmGf6CcGgzJJTfZ/+mTUjp2nN7BV7t/Ug8903NUSz8J1ZnW9VpJ2iVe/K5Z/LTUUEDyzPFDP3aE6wJGxQi+z4wW8HeQwXggl2S5bQumFLdPV0EA9OwtTixodIWHdw9xm3m4g0R5UZ8gGQrcauJkOvBjVxYTEBcpmDyY6M1OVQzKC1NGRAGVOeP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TmuAV5vO40qGitztGS40u48XkVEeq4U6rJp8iAqevWjb7Q5dmbLPXSk7aunk?=
 =?us-ascii?Q?fXNYChm328xg3wuOPMMS7VmLebChEdpD8TGwA1IWbj2zIcNVAtg84crMjR1E?=
 =?us-ascii?Q?RqoRl/JTCv8UJEVNEEw3ggIGd3U0WukSfcDQTw9yauaRPKvJiHvE2bY2vLLf?=
 =?us-ascii?Q?C2c1fUSZLiJvyRVMB8VaqhES4yKxQiswXSglnpPI8LbJkjmb3s7gTc+M6qF0?=
 =?us-ascii?Q?wyjVLZtfnt2botGeNdNqmyEXUanib8tpJ3Y2gQDs72ew5bgI1VgAJYayCpOs?=
 =?us-ascii?Q?fgGsfU6W+0pBa1CUGoR55DUbMrNVk9A+5DrPo6IuYXjUn/vy2dY5F+gVV9f4?=
 =?us-ascii?Q?d57tYTuSuQdtSinthH7heSP8krEcFpO/21Pp++6zjqZT0a+CIiewADA75ZK5?=
 =?us-ascii?Q?AhPMG2OQbJSGQzl+9V2NtgYiWDTYQd7Vgp1jZWKhO2fhS3ATdn0GVsJU29dO?=
 =?us-ascii?Q?9himdjuzSSFow/6Yhwlej+sMrIn7S/jxwxFjRBVP5VRtqebRuYKU7uOKnsS6?=
 =?us-ascii?Q?ldTmWSIL7+mWD/M5LZtDIZsBBej80s0eHiCVo8bZQoWInqt69IGyr28ICZc8?=
 =?us-ascii?Q?5wC2b9vz8Bite3bPRg15t5phH15LZmdoMHqtiUWc3wMGmzuPM1e/DpVYsyZQ?=
 =?us-ascii?Q?Gt1+burTXjUXC4xZBq85uP5DxmniguQplE/eODVOjqv5s/ZEL/+QhAVe/7uY?=
 =?us-ascii?Q?Nj/zXfvsi6nii9BJ58xVcZEGALZpBVlTfboWmNoQppJBqPCNyfbPnU/SFRw8?=
 =?us-ascii?Q?5E/Njq3B3xvFUOSqPQg3OB0amLt8lpr83e31VKBZn3TCKdXtgiy00UCm7Rmr?=
 =?us-ascii?Q?JhkDDgfEbaGw+wCrCmlWFatigZgfMBX9m9RCB38HCKonzkSSWBt8gZsYvoEf?=
 =?us-ascii?Q?AQwqhEpumb0R11awzKIGMQ42kWFfzwznyXf+RDeVa5+uVgjYaKq7euNaRNsK?=
 =?us-ascii?Q?i1DYoaLr9I9WM6WvkDYCNzOTa6j8waAj+Y+2mNGt5U7+fMAX8FAkLUbECrXQ?=
 =?us-ascii?Q?GoQ3u8lDV+qemlH7BvTRawvk1PjYhh5XDJfNfunBU479flXPNKVCzvJUXfBr?=
 =?us-ascii?Q?rQ2aWiVSU+XY6bWgxnUnqdx/yA4VPSJOKVJfMyKeZoTQwzvGhvSRzZVPqGQz?=
 =?us-ascii?Q?PC5kwON+M0KjXZOkv0eUrggal22vKr7lsNINUIA1yGPIvyt2fXUhxrPZMBBL?=
 =?us-ascii?Q?DYuaaRSCus/sMNoUtDWMM9lexxBYZZomGn+w4ajr4YagV9AUfQzla5OqOcEY?=
 =?us-ascii?Q?HbExBddbZzVkb9zT+0l04Ry3TNsgztqU09JI963eEEOmRcmJbJjVFRarO3Re?=
 =?us-ascii?Q?LnsKRMeNoRntlNxaGmF83JpqWS45jERMqYUiPXJCEPO2fEGYvVGW1GWet+L/?=
 =?us-ascii?Q?TEoMH1kaCNp2MQb00r17DcEd+GcRf08Guz4NzlZXJrptgx+xwYB7s+CQt2Ab?=
 =?us-ascii?Q?bUsjANHvWzay96S5YbDxTnPnwVO0ASaxcw2Ju2L0SsAUvwucHTJI3Bv+NqsR?=
 =?us-ascii?Q?MDc/zOs+52iFgVRAzVLynO1SPEWN067KQbIj+Ou3o2gtqDA4k9v0CZMUc+Wk?=
 =?us-ascii?Q?jep5TRtrUKEBLybu7j3rqQlQd+Jpxq2ysGVY02L1P9CDfAnP4EcZ3UkOEG2l?=
 =?us-ascii?Q?u8CBTarfanunygJfmeDpTQdeMSjQQUZcyqU2jktxB/qlVKz5Fb+vZxCASstM?=
 =?us-ascii?Q?spufow89KD9+X50z79b+TYAMdKc2ctioNr7CVJ8hlebvEtD8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8f060f-4242-476c-e604-08deaf550ec6
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 12:01:39.1862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2w/iPp1iPlmyq0R+dsUor5dvXDGQSLnx1SwKgqbEzQ/RFYLNl/tJ0mXFTMQjTp2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7610
X-Rspamd-Queue-Id: E85F150D514
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61089-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 05:16:56PM +1000, Alexey Kardashevskiy wrote:

> true but either way dmabuf slicing will be directed by QEMU's
> msix-table emulation MR and this slicing needs to match the TDISP
> report so I'll have to teach QEMU these reports, right? I am worried
> if I miss something obvious, again. Thanks,

I don't think so.. It just needs to slice it into the MSI page
blindly. When the VM goes to validate the TDISP report against the
mappings it will fail to accept the device if there is a mismatch.

The only thing qemu could do is fail sooner, but I don't know that is
worth the complexity as we do expect all devices to have their MSI
range unprotected.

Jason

