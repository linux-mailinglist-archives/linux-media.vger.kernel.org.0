Return-Path: <linux-media+bounces-27098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 055FCA46D40
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 22:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88D8E1887A00
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 21:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76033223321;
	Wed, 26 Feb 2025 21:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="axwnsklG"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2111.outbound.protection.outlook.com [40.107.223.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85372755E5;
	Wed, 26 Feb 2025 21:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740604684; cv=fail; b=AFdKUEsx/Q7IVjRgASOsismrq/9iiyK+ICNRXlllyP6DVYWdfSJ0lkqYqdSrytNUxix2XSNWFm5l3plEmf0k+GuBxJ6JvSBI7CzuhzfumtMPXiViOBbSm2PKEuBay3KwBY2mQxtVW56C7/0ZNdbcQl19iEQ30+PVN0I9lwuk3q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740604684; c=relaxed/simple;
	bh=f6azlYE2mkFuIhqpY6E4Af6/1fgViBFsbvc5/o4rlN4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=b1WKevffO8x/EXtIG/GnosiBwREk+ju0UVkmHDJmz/PgVwwxLCFyuFFNvdlXFrihCO6/o49Xw+CuMc2tbc2exmP4CkloukMLRF4rqqs0YoQoyXEIHMmBsP0/fr1UKbwsEkvsNsZszckW5kqP7SuW6N9P0ieQdsZHpBLLcCs7ph8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=axwnsklG; arc=fail smtp.client-ip=40.107.223.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCIJ0Y6kIylFY0zW9pq18/kQtk60rEDAamwawEYWVt96+rhzaZCd7Omh8qGv5gBTlXj2PJEyU4QH7KVgt2v3bFX0hCn2bO+FERI+f2rYRbM4A8npsLTswYsZcvrn+e0LN2WXvG8SxuwxaeI97eoN54l+wgEhW7G32Q7zNYj23SWNcmh8mY9vp9lH3DSzapOSshNrZv39Ubk2H96f8YxpHcxiP/boCxz/KotpiSeCh027zxwB2ElCT3UUVkZ4cXpPKW69aEtJaDz6Zbfs80NKBFI9zfR0vLdPBIoIOQuHk0tbVETsTKUjj3r281SrzFzbijP0Gmzx1DzeJ2jm882XcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMPqHkZ2yWvviD3ZN8OOibZCsDVCae6LW80VZH4AwF0=;
 b=Vg3qmOFBxOqg1VEMtzBKeci3lTaY8LfRQS8YjfJ82Jdfy3BS05JCze2fgJMizr3qDVjNW64jqcmT+8Iga8KYluoWnbqpXB/FY2QLbA9I2DvlG5pZhBfIP0TpHI1yb/bAQS1I68hiMwfamIawuZNwjuPQU2Vqsqr1cvvVgstULu3eeh0xO/TbXMDp1p6OcRDe0NfOZVuCo8C02JP+aDKzdyh3Q7MmXUcnXwsCKo6REnTIsgA0RyMFzKOc5VGVUJJffT3U2KGUV/mxt4hsWbP7S/HidpmcxJVw9t+/z/HNYdL2rBM6DJ0QEpcnyBSAe9qPNoaqtMN6RP0GO3rnJN5dhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMPqHkZ2yWvviD3ZN8OOibZCsDVCae6LW80VZH4AwF0=;
 b=axwnsklGu12q4HDQA+mFTZTGmW+LdMgII+8NeUEPhVnC5lc25Nxyi80uSMVNb5oWpKmh5e7P/L6T7TZ8txLBFg/xII2q8jsfpozYz96t6DpRPT5Dng8bMYKhCC2Fcr+4jDVEYqbtBxDr6qV2igJY80Sofkk5FfPmmugbyfY3g+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from MN2PR14MB4207.namprd14.prod.outlook.com (2603:10b6:208:1d6::13)
 by CYXPR14MB7572.namprd14.prod.outlook.com (2603:10b6:930:d6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 21:17:59 +0000
Received: from MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7]) by MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7%3]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 21:17:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 16:17:56 -0500
Message-Id: <D82OV1MZ1U4T.2KKSJIP8P27I@d3embedded.com>
From: "Sebastian LaVine" <slavine@d3embedded.com>
To: "Markus Elfring" <Markus.Elfring@web.de>, "Stuart Burtner"
 <sburtner@d3embedded.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
Cc: "LKML" <linux-kernel@vger.kernel.org>, <kernel@pengutronix.de>, "Abel
 Vesa" <abel.vesa@linaro.org>, "Alexander Stein"
 <alexander.stein@ew.tq-group.com>, "Angelo Gioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Ard Biesheuvel"
 <ardb@kernel.org>, "Benjamin Mugnier" <benjamin.mugnier@foss.st.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Bjorn Andersson"
 <quic_bjorande@quicinc.com>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Dave Stevenson"
 <dave.stevenson@raspberrypi.com>, "Devarsh Thakkar" <devarsht@ti.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Elinor Montmasson"
 <elinor.montmasson@savoirfairelinux.com>, "Fabio Estevam"
 <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Javier Carrasco"
 <javier.carrasco@wolfvision.net>, "Jianzhong Xu" <xuj@ti.com>, "Julien
 Massot" <julien.massot@collabora.com>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>, "Kory Maincent"
 <kory.maincent@bootlin.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mikhail Rudenko" <mike.rudenko@gmail.com>,
 =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Nishanth Menon" <nm@ti.com>, "Rob Herring" <robh@kernel.org>, "Sakari
 Ailus" <sakari.ailus@linux.intel.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Spencer Hill"
 <shill@d3engineering.com>, "Tero Kristo" <kristo@kernel.org>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Umang Jain"
 <umang.jain@ideasonboard.com>, "Vaishnav Achath" <vaishnav.a@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Will Deacon" <will@kernel.org>,
 "Zhi Mao" <zhi.mao@mediatek.com>
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-3-slavine@d3embedded.com>
 <c929975d-6928-4161-b062-64636a4f278e@web.de>
In-Reply-To: <c929975d-6928-4161-b062-64636a4f278e@web.de>
X-ClientProxiedBy: BL6PEPF00013E11.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:17) To MN2PR14MB4207.namprd14.prod.outlook.com
 (2603:10b6:208:1d6::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR14MB4207:EE_|CYXPR14MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 40dce939-1c36-41fc-f20c-08dd56ab0b9f
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YjYvZ1BLUXZmQnpoSVNteFdPR1RDSk93RHh5aFBpeFFpd3p4Z1YrQTFseDNW?=
 =?utf-8?B?eU94TTVoaC9ISkliS2FyUlVRaUxCdnRwWmpNSEwzRmF4R052c3VLM2x6R011?=
 =?utf-8?B?Unhxblh5azVuQmU1bUc0VDQyQ3pncldGbG51c2kwaSttcFpLaCt5aDBzT2NN?=
 =?utf-8?B?Qllya0xhZU5vRmFmUmJCREVacWtYZ0tGd1pnRTNFbndLMVFqL1d5NWJRQkxq?=
 =?utf-8?B?a0Y1cGEzUXZRTGJSMnhpMnBHcWQrSGk4TU85b3JFMEw3UDFnMTBwWjFhWUFC?=
 =?utf-8?B?Y1N0MTJ0V094ci9sZWdicE0rNUZCcytPai9GdnhabVFQQ0tyL1IxMFlJcVRw?=
 =?utf-8?B?WlhWQXVoZmdHSlZtQyt2cFczdG1GQkVRTElPNWhVMFc0WEg2empOWDdoUEpU?=
 =?utf-8?B?K3hCbTJZazVOTk13ay9uR0E1OFA5L3U3TDhQWjY5djl3SHBENnBtQWhYK0RK?=
 =?utf-8?B?Q0U1ME9IV252QldiTWJsdS9ueHowWGMvWXZIZTUvQ3JFYkE1MDBYZ2lCb2VL?=
 =?utf-8?B?S1pjQjZYYmRpWGlXQlVYbkppdVdTNUdFTStTMjcrOC92M1RualFia0swK1pr?=
 =?utf-8?B?VGpKZGF3NjJXemdtYmZpS09qUkJFcG1Gd0lTMzU5WThWdFBOT2I2Z2U2WkFZ?=
 =?utf-8?B?djhUVFFKYU5qbWE5Z2hxanMzZDJuM1RDREtUL0FnYUlFeWYwZ21qdnFDTHZj?=
 =?utf-8?B?K2dmL3pobncrRGVtdC9rV0ZhSEF4VDFxSjBic29kWGlqU212cEh5U0dXeFU1?=
 =?utf-8?B?R2hJbGZEeFFwclVQL3Q3U1RBaWNQQTZPbjBhMUhXNXN0OTM2dm1YVnhxUU8x?=
 =?utf-8?B?RDVJbGE0RTM4cVNNRW8veE9IVVlzWVhUdFd0QTE4VWludE15aDE4azkra0J0?=
 =?utf-8?B?akVjL0FZS25CQTN5RU1nWXc3S2F2SkdWcVo1SERIRDI3T2RqTmtwMnZuTS9x?=
 =?utf-8?B?NlBkT2tYdDluenVCanBwRDRwTFNmazNBWkRqQkhpbXVPUFZ6YWZKUjZmb3Zl?=
 =?utf-8?B?dWNxcVFvcmptTENreTQrcHB6SVFYbnNRbkY3amF2MCttc0VYcEdxSDdzZDBa?=
 =?utf-8?B?dkFZaDlrUmx2M0VMb0J5d1pPVzB2V1hrK081dmZoMzkydzJvYUlKSTBuRWIz?=
 =?utf-8?B?eUFnckROKzVPVEZ3UEY0Umc2Y01JNXJ3Vms1THpmVTBNRVJKRURodStIYUFz?=
 =?utf-8?B?K0NiWjhYVStZemdBVEhnQlNscGNKVUdGMkJXQk9TUkQ1dkNtVmpwTUpGRkJk?=
 =?utf-8?B?cGVRL1QwNXF5R005OTBTVmxDY2ZWQ2s2OXZQSjBLR3o0WG1wRkZETmgzcDBq?=
 =?utf-8?B?VGQrUFlzQXl1Yy9pblhkOTc0TWQ2K2ljanhNRE0ydUxXc0JrU1BLcC9zUitG?=
 =?utf-8?B?enB0eW9HckIweTV5Vm5XM3lyeWp3aERKRWVmTWt5MElOa2xnd3YwYmorTkhu?=
 =?utf-8?B?aWJKbzJ0ZEp5SHZpd08wTmdPTXZjUW1vMk1aMFJMd3pEVmZIT01KY0RGWCtr?=
 =?utf-8?B?amhFM2xYeURaL2VEYzNrN2VjZEErdjd6d21MbDlCOHBQOVMzcnZMYWNzM2NN?=
 =?utf-8?B?V29ncS91cmcxMmkvdzVVejlPYXVSLy9KNXJBaGh5TWE3Z0hSeGJneWVBWFRz?=
 =?utf-8?B?cWJkYVV5MzMvdEpGUndXcEtCa3A5UGhTWEdRbG9SY1UvQlVRdWhoaG1NR3E4?=
 =?utf-8?B?OHR2eU1uVTJIa3FQUVFPTHVLcWE2UVRDTjYrVlRtU09LaHNVRGI3dlBvQk1p?=
 =?utf-8?Q?4yMqyz7A48pirtj08iYHutUd0c9eS54gTocHzqH?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR14MB4207.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UmE1ZzNrN3JySXliZmRTMHc5MjBVM1VBWG5kZ2RiTlpBdXhYYWVMUkRiZXlH?=
 =?utf-8?B?WElZbE9hMDBUcENiUFk0TXVCcEErckZBT0VwbVdiQnZyU01JRUJTdE5QQy9V?=
 =?utf-8?B?azJXdmtCd2ZrNG9uN2d6dnVvZmNGTU5OSDBjSnFTNnFBOU1PaGdXMFJMMlVI?=
 =?utf-8?B?Vm4zV0QxWFlUNXF5bk85YTQ2MmFxNzQxU2VhNnFsZFRISXNBWHJ4a2V2SXJZ?=
 =?utf-8?B?U2RtR3VwNlhTdE9CVE1ZZ0MwZWNrNzMyVnY4cmx5MlU4amIxV1Q5M1ZxZDc2?=
 =?utf-8?B?d3hyeTN3aThseTh6SHF3bHR2V0FaMUF0RTJMdkYreVBaVVdMTCsrbThnR1lP?=
 =?utf-8?B?UkFDdlBxY2pRa2Q2Yk9JMVlHUFdGb1FmN29DRG1UYS9YemZQN3hIeVVsQ05s?=
 =?utf-8?B?amloUUZzVFpBT05VTHg5d1dHb25OSjNOemNNcHhNREcxTmVQUkUrZ0FLZ1Fz?=
 =?utf-8?B?TGRFa2Z2U0QyUDZySTRGY1IxN01EWERxU3pBYjdxUCtkK1Z4bjI3OUQwb1Ur?=
 =?utf-8?B?dnRSMW5XaURFNkg1bVlCNnQ2cS85aVRSSVVHNUJacURIQVhIQk5NVU9jN01D?=
 =?utf-8?B?YkNlaThiRnAzS0l6U1dTMFlMSkJmYysvOG9BZG9sbGZTSzg4NEJwRGpZWGZt?=
 =?utf-8?B?U1Vmek5lTlQvU2ZXY3dreUlGZlgxS3grT0JyU3VjZ3pGQWNETHYrME4rUXI5?=
 =?utf-8?B?KzNRbHl2UFRaRjBESVJTT3lvTmlCTUVXWXlyODNOeTNtYmV2OTBvVVFaWHNy?=
 =?utf-8?B?azJkc3puaU05TnFzK0J3a21sdkpaZTF2YW9La0xCdS9kaGk2djdnTVhMNFdw?=
 =?utf-8?B?TGJpS0cxcGQ5NHlxL2RmY3NlQnZZRkNTOVJYc0VWTHlmSFJYeUlMNFlEdXZH?=
 =?utf-8?B?R05Ud0dqUHRicThISjFOMmNZY01obUtOc3FIU3hjamlRODExZ0wzTDZKUVhm?=
 =?utf-8?B?ZWVENDhUb0p4a2NyRjdWRXYzT1RiQmdRSWtnWHNrWkxPeFdicHB1c3Vac2g3?=
 =?utf-8?B?bUpIc0dkNUtjeUlxM3JZTmVKMzhZVTRrWkd1WHVXTlJWUSs2MUxrZ0lNMUNp?=
 =?utf-8?B?Qk9FZ2RiTDM3cXdHeDYxdFYxYk12N0dJaHRiMVJwV3pPNTJ1dWw4R3Jma3hz?=
 =?utf-8?B?SVhKWmRSQ0I4aGhRRVB2cU00dFYvY2l6UG9jdk5LUzA2YWZBOFpwNUVFdXU5?=
 =?utf-8?B?UzBTbExud3ovanp0SnBod25NTjJwa1lsQXREVkE3Z2J3TnV2WU9rblpNbzdJ?=
 =?utf-8?B?eG1LRWlTZG16ZDVwb0l2MXNZWVRKRjdkZCtSM1RLOUUrSUtPcVJwZGEzeDF4?=
 =?utf-8?B?ZEM3NDF2T1VpWUxPUkdJdTJCcDR5cmxlWjkyZXhFbHVpeU5OTFNTeEpMVkZE?=
 =?utf-8?B?VHJaSE93TmpOUzQ5cWxLbVA4NGdFK1VNajdla2hEZ3NaZzY4S2MrbGVRNE54?=
 =?utf-8?B?aU5sM2t0YVY1enozbFJWNFVRUDlzaFNHblh3ZDZlZTRma0NXQkZyVERScnJB?=
 =?utf-8?B?WW9SMzB3NHZybmpwL0hXN05rblpza3pldlR1U0tTdGlqUzl2bXFvNERDWjVZ?=
 =?utf-8?B?ZWhxaDZHMGR2OFkxVnVvK2I1MXM1QzF0ZjBjcXh6UGNXUXMxYUFKV2JQN2xo?=
 =?utf-8?B?S0lVRm9OUjJaTWtHeEpTbHcvd1duZnpIeXEwQVBwb1A3anB5NnJsSGFmZll0?=
 =?utf-8?B?dlZaQ29RZXpRMllPUlV6ZjhjUnhwdWJtQmdJWlY1U0lOUlh2YVd3VUpuTmpM?=
 =?utf-8?B?Y1U4RGQwcy9VZS9Hd2NRaFM0TDQ2UEJCcnpNNm5IZXV2WTVUV0hKTksyTEJG?=
 =?utf-8?B?Umd4dmFoa080cXBhOWdGMnpoQTVxc3Njc1VzUnZFcWgxK01MS010NXZvSklu?=
 =?utf-8?B?dWxaMHgxU2ZnQ04wWGV4Sm4yUFZYbHA1SjdqRXI5UmhySDkrVXY3aXJtYzN0?=
 =?utf-8?B?ODB1RGNqckRlenB0bmkwYStGNWVUQXZ4WFdyQlZnK2xDc1YwN2tJN3dnVW5T?=
 =?utf-8?B?QnRIQnJlRU9QbVc4MEdKcXNoeW1FWHNXYTBWT2J6QTVyRmFzOXFXMndGR09k?=
 =?utf-8?B?OWFqbGN3ZEtpaTREcEEzaTNTcEtYd2l3RkxHdzJOTjhyTEpHUU9qVk9aV0xv?=
 =?utf-8?B?RXZPVWl5TndFN0Vqdmd0K1djODFTeGc1OVlWaTZhM2JKUEFHdG5JQWRUY2tv?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40dce939-1c36-41fc-f20c-08dd56ab0b9f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR14MB4207.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 21:17:59.2582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+q33GjXHPS9PRjePuPS4s8YprNWLS2Nt1GvhSck8g69xQak9frRLAG3X7OxQo0yjbPM1peT2/l7bWNcaciSsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR14MB7572

Hello Markus,

On Wed Feb 19, 2025 at 12:51 PM EST, Markus Elfring wrote:
>> Adds a driver for the Sony IMX728 image sensor.
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.14-rc3#n94

Thanks, I'll modify the commit description in v4 to use the imperative
mood.

>
> =E2=80=A6
>> +++ b/drivers/media/i2c/imx728.c
>> @@ -0,0 +1,9655 @@
> =E2=80=A6
>> +static int imx728_set_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +       struct imx728 *imx728 =3D to_imx728(sd);
>> +       int ret;
>> +
>> +       mutex_lock(&imx728->lock);
> =E2=80=A6
>> +       __v4l2_ctrl_grab(imx728->ctrl.v_flip, enable);
>> +
>> +       mutex_unlock(&imx728->lock);
> =E2=80=A6
>
> Under which circumstances would you become interested to apply a statemen=
t
> like =E2=80=9Cguard(mutex)(&imx728->lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.14-rc3/source/include/linux/mutex.h#L=
201

I will use this construct in v4.

Thanks,

--
Sebastian

Please be aware that this email includes email addresses outside of the org=
anization.

