Return-Path: <linux-media+bounces-33266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84745AC2469
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 15:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D133A5124
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 13:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C51295D98;
	Fri, 23 May 2025 13:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="yfVruSHp"
X-Original-To: linux-media@vger.kernel.org
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazon11021111.outbound.protection.outlook.com [40.107.160.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE622949ED;
	Fri, 23 May 2025 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.160.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007834; cv=fail; b=NWz24wtPsp/N4YOTkwZNs9PKD+MyFYPtEuknP1I+8dP4VCxZPS6I+dCALUO1mDfl1JwGAP+MWDNuohRqTT+OZ8xnPTPV+BEaDnmLGeehS8x+zAYGXxjZwTPfLjSCGANXA9MmeJO2VWt286Cu9nVAoATv2hiGtuZmjpD7zLl790E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007834; c=relaxed/simple;
	bh=xIIHy495odXI85DwoLMjFvuCVtzOMdD6Rp6Ui36CzwE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LmZ3P/7dcAr/AvAtY/3436pr6HvZMyMvtmMMUBENLLiN2v4ziVvNO/UdsjhdK0MxASjTu+XhDphuDpBRDpaHbH6SAB5OR6RoZ2YNP4hOZfxZrhXjHtQvseWen0S+J4konj0SNvhTp0HpGBZX4zY0/QF+4pgHwyv+clMGsb8V4dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=yfVruSHp; arc=fail smtp.client-ip=40.107.160.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNy/1fiaCsKdT6n6ElUyvYwk2XjDdAEgpefQKMpxZRitTEC2RHlz4kTesrgKtr+rUJvwQCIJZgAQo5kfuW5LnaRJPfO2znW+arJ/txNaVItUjRRoQKsLz+Q1NHVHC3AHN8AsSlJVyLsIPHuakDegTTuoDiYqt+bJ1nh56UYrXGEnFoX7FscCDy5sErndP1hCqVFiVrkRiunKv3RIfFDzpfYnT60zfsldep01jLmJBV7U6eiLogrnAfImwbUZBzwokHPosWjeou2Qshy8oggh6jODEkzAmk34EMZr7AlPp1EUb6pLyqvPfth5WvPzp0WLJqlRgH6kTFyng7G2tmzQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADzzuOFAnWtSqIi7kgxiy7RMpf2rbUU0lJox0hHBGBw=;
 b=PZ8oZohJwJRZkGbwVnRPCOVJT2k3tvjamwyiurzeNxW/2HWuPo7s+69KTw7mrww4HqJwpAKIQJE3OygaBlIbFVVGVX5l+AJHja7Z9mdKYRF2UTcoCfuEoFhVn6SS4lTVLNu34eZljULWmbk6XSUBCMIGKrTlPe0gkWnHmE/+o/Sc4dsA6fvgJPadj7o5psSJ/uvzu3px9YlsZAEUqdLgmOg4Z+LjcIxC573R62hFlJX/XiymRHelzRfM/k2dKiXDjQy9Be5o7ZvhxJi39kq0kJ7SgIEc/M9Zy+NTt5fnWxt5sAPtR44ns01zijoD1heuiRW0tT9jGIqWCYRfRGxsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADzzuOFAnWtSqIi7kgxiy7RMpf2rbUU0lJox0hHBGBw=;
 b=yfVruSHpHIA9rhnAiwq/p/QY2PlXL2MFAGMkLu9uBL/XjwZZn6sgBwThoY9b5qJ4o8RW+8n/1+S9dcQcbEmzAhGdeI6lBh9ZcoNnHkdKHhr9KEpVL90ClyewnT7eDWJFLFXHi2qUjEqZzDu4CUiFt9V23rI64WoOgJxAMjxbHuOR5WfgCW6TuzTwy+sp4A+sT/mOLeFDbi5uQZ2vrQFUCo/cAIhbNt5kr/hQ8kjCKnGj0/PVZezwYfLG22K1IiTcEi31c/XYKRyaDiP3v4UDWlSpUJa5EyouMeXy8NKFKUgx8R7hlEOm34EAk4y6ApgcVmlrc2S3w/7wLt/gQGO2Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PATP264MB4619.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:428::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 13:43:48 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 13:43:48 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] dt-bindings: vendor-prefixes: Update the description of allegro prefix
Date: Fri, 23 May 2025 15:41:49 +0200
Message-Id: <20250523134207.68481-5-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0109.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cf::11) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PATP264MB4619:EE_
X-MS-Office365-Filtering-Correlation-Id: 017d864a-ea40-42c6-9ec7-08dd99ffd86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXZGOXBzYkpQY1pkVHN0ZXRIUW1VNXFZZW1vVjZtVzNjbDRZcWdKVWphWHRk?=
 =?utf-8?B?dzRZZ0Y4ZEtqS2wyZnVFYnV0dTg1dVZoNGxuR25Xc2xxNTh1bzRnNk8wWXhD?=
 =?utf-8?B?VVNsRm1OWnI4MHFQaHRWQlNOTk9PR2tvc0k2VmZ1UytPd3M2ci90MjNtRmhv?=
 =?utf-8?B?YzJSR2gwM0t5WE16NWdRT2ZRT1RoZE1UNytEU3hJRGt4Q1BNQStCK2ROdmtF?=
 =?utf-8?B?MmVhTGc1bkRLT1JYcDdmZmxKUWxoL256b2txNHlqb2FWNGR1YTB3djkvUFg5?=
 =?utf-8?B?N3NWb3BodGxHcHhpUk9pazNxWUl6bmJhLzVLSGxBTFdScmh4U2tEVWFNVGk0?=
 =?utf-8?B?RGQ1czhZL1dtdkgzWVh6eW04Z2hDUzNyVEhLT0psYUVRajcwUlFGNlJZd0lD?=
 =?utf-8?B?b3dIcEdqZmlkTy8rckFadlpPMjlNTHhkelJKTG5sNDJ3ZDE5YVhIcHZQVUNh?=
 =?utf-8?B?MlkyeXVLdzhSSkV1Nm5OcldNWlVaN3ZyTVA2Y29JRjFXc2RXT2dJcGRnNnRs?=
 =?utf-8?B?b0t0cVRZVjRWSjZVY2ZJL1RmYlhJQWFqWkhKbGp2U2huRlVRYjFLdlVMT1FL?=
 =?utf-8?B?Y1ZyNk1CcU1JZ3lNeXR2bjcyeGdOQUxCRTVJdG1CUkpwSW53Q2d6ODNZRE1p?=
 =?utf-8?B?dGs2OG8rdEc4QmFVTFc2ZXZLYkkxcXpoL0Y4ZU11SUdmRGFQZ2FzZE1iK1Rn?=
 =?utf-8?B?T08zSHh5YXE1azgrcWoyK0FjSkxhaE1XVStMcUZncUo1emVBUE5rZzFCc215?=
 =?utf-8?B?Qmg5eGNRZURNdFlBY1ZPd3NWU2pVL0xsazRHWHJXWEJlUWVsNHpXNmpFZDhO?=
 =?utf-8?B?dldQU3BidkU1Mlc4OWltQ2V4Wnh1NjJuQno3eFVtOVpLeUw1cjRNeTQ0dERt?=
 =?utf-8?B?WFl4UUFFajdNems0VnJlVUI3eHRXYjJHcFcwSXJjS2hNMk11Ynd3ZXBoUnNR?=
 =?utf-8?B?ZXorZTJNMkFDZUsyKzZKU3ZBRmxDQlA3VTRJMlpsM1lHdHUrMmZnZWNvajI3?=
 =?utf-8?B?dE1YRmFnY0pLa2dlcHgyTW9iU3UxcXRzMDdCajkyZ0xQUU5EOWY3cWJoMHEx?=
 =?utf-8?B?VUh4OUR3UUhsVUJySWlIWU03dFlhMU40Qy9pc1dPQUtFUWxwcGo5NEtQRUJk?=
 =?utf-8?B?RDc2aUR6MmRFRDFDZWFNMkU1Y1ZqRWJmWktxU3pWNmhZNFJIc2JrRW9tYWNH?=
 =?utf-8?B?dEc1a3M2Q3BhajJPZFRaMk81ZlR0WkFWSkR5N1dONGpJblA2amRIYTNEOUFK?=
 =?utf-8?B?bEdhNDNhTmJPOUNGTDRzOTlOU1hOR1A4c21ORllnb0x5djRhZjFuWUEwWVlF?=
 =?utf-8?B?d3dIZXVUbGoyc0JkWmpzdUtUL2pJUjVCTE5ORnJHNkZWVlRhZHl2OG9IRG1l?=
 =?utf-8?B?NGtMY2VOMzA3SldiR0Z5OSsvTGxoLzMyMVVVNzNQL05sVWQ2TExkM21WSmRj?=
 =?utf-8?B?WlVYOThBMTZhSWNpd1Q4QXNLdVl5SG9RRHVxdnY1N0JXUTJldHhIZXd4UE1V?=
 =?utf-8?B?a2tRU0YySmZLUlg3VUo4d0FUUEdhZ2pkSFZINWtJZW50VENZTVBWNy9MOFNq?=
 =?utf-8?B?M0wxdTJHOEdIRHI4MkZtUXFWNUJNU0pmT2xsbG5PMXE1NkIrQlJ2cksxdjhh?=
 =?utf-8?B?VDJuY2lMNVE1NzhVY09CcVo3V0xoaWQxR0tmNFFjQTI3QU03cXN1c2RxY3lm?=
 =?utf-8?B?UDU1YXZEOTEwU25USUsrV0oybVFyYjhXWEc0bXZZemh1ckEwOFdTZkxmNmto?=
 =?utf-8?B?NkFUV0tXeDBCRnhScFNHT2g3dnkrNXBKSDRBZGxzdThDVkZ3T1FHMFFibmRN?=
 =?utf-8?B?MXAzVXdOS2tnNElnQkNtUXAydWY5bm90Nkw4Q3hkd3Q0YzVuSG1YR1U3bHp3?=
 =?utf-8?B?UUdCMDdrT0VxZ20rMDd1TTRzMXF2Y1NRRTRHUkFSMDhuM3orQy9tc1lOTGdM?=
 =?utf-8?B?Q2tQRzFaeHN5TDQ3cURDeGpyYnZVSmZTWHFWcUlvVmI2VWZkeXc2d0IzNWVm?=
 =?utf-8?B?OS95MTEvWkt3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkRpOXRKcys0OThQYmxlYmE3VHJqNEwyTkdRNEVzSHBXM0NkbFp6c1JUMDI2?=
 =?utf-8?B?cWRMU2tDRWF6UzBJRGlQelZQYkVPYjNmY0pqa1BuOVFvVS9CaisvMnVmMTU5?=
 =?utf-8?B?WmpXUzBmeENpMzZNY1VtcWNRZno3YURqNGthRm5Zc0pFbTVyWVJMczV6ejVU?=
 =?utf-8?B?cG50aGhMSkQ3cEpCZDBSanZNS0VJSFZiekYvMDZSdWxlTmxUNzVpbHNlUEQ2?=
 =?utf-8?B?RzFhZnhzRkdsWjdrdmdyZDFyYUYvT1FGazFoTjlzZzRuVHdTdmVyTVNJSlJ5?=
 =?utf-8?B?MDVZYTZUSS9PaTBubVZCWmZQT2JicmVNVys0TFVnSEJMZnREb1dtdGU4WXhJ?=
 =?utf-8?B?WHpNazE3bHFERGJteE5Dckw4WXllbUhEMUVIUVBHdEFHTUxtbFVDMy9IeXRs?=
 =?utf-8?B?a3FiNXhxQisxMXAwUVBlZFVoVmY1MXB3bUFlVGFnQS9qUWhvVjdVNlVTNWhM?=
 =?utf-8?B?dzJjRzlmWFlwMmhlbERZNTNJZzZzUFRTZmsrbElSM0hxWmI2eGlEblVBUkJs?=
 =?utf-8?B?WjhiM2g2cEFOeGw2YUJQSERtTXIxOE85Y2U2TElOWFR6MEpmU1VYcklWM3Ew?=
 =?utf-8?B?N1NNa2tzdFZhNmh3Ykc2TXNSUzFQZVN3S1ZUbVdzWnhHbElISEplbG45WVRj?=
 =?utf-8?B?ZTU5VmtNWkZiRzQ1bEo1NWtOclVZOGc4SjZwZ2ljTG1tVTU3ejdCNVhSOHVE?=
 =?utf-8?B?WUh6OFBWUGIxd1I1dXBvYldPSWdIY3d3YkxVMWI1L0ZQbk02Y0V4VU5mdms0?=
 =?utf-8?B?aVFjbFRtQTFncno5V1M0MVRXbnZQM0xUa29rSW1BVlJSTXZNVVF6aisyUkFv?=
 =?utf-8?B?WVRCMFdRbjFKQnFIU1k4VnI5eFBiU1pDeXk3SXNyZy92QUZ4cG5rVWJ4eklF?=
 =?utf-8?B?SHVXNk5WeHBoTDEwbUFUT1FlbThWU0ovbkI2VTVReGZxdUFOSExrZSt6bU5E?=
 =?utf-8?B?TUpWQURZUzZMSTlYRzVHSThpU3V4OThKVWxVYjlyUmMyeUZIS0krYkVxcmlv?=
 =?utf-8?B?L3ErWkxsY1F5dnVLSGtJMjlGWllIV2EyTm5JODA0V215a3hmSnVmS1g4aTdN?=
 =?utf-8?B?aHJaVXZnangvSVBJNGxVR2EwbU8wcVJya0p0TlBJNVhqbkVUUm9iY2JnaDIz?=
 =?utf-8?B?bFo5cmFSOWpOb1ZlM1V2UnZqRE5SYW05Z3dtczViU1V5RkZseXRPejgvNGxr?=
 =?utf-8?B?d3A2cVp1VXFFWWV3UHFaMldlb01laVk1YVVpaGFYZ1Q0c05zbWJlc3VzSUx3?=
 =?utf-8?B?UlZPVkxhamtPdmFsa1BKaUMvZUJ4d09TdXhCZkI5UjRRUnhSRThWOG1venlp?=
 =?utf-8?B?ei9xc1h4cTNTbVFLZlV3QVVhTForVGwwQlo4NE0yOVRDdU9ZQ1dMUmc5ZXpm?=
 =?utf-8?B?VG1VTVRoeDgxQ3g4dGprNllKYmhCN1NURHBVejRsdk9ybnZVY2ZTbU1TeU9U?=
 =?utf-8?B?VkMwd2ZvUHZJR2xRL3dLT1BkSFRYRklhMHd4VE8zUE9kT3lla1FoMS95SlFZ?=
 =?utf-8?B?N3FycDB4dzhGN0U4SHVEVGZOdEdTYm5jWDN4T0pJUW5wUnlCVUlrZ3l3TW9U?=
 =?utf-8?B?eDRwc2hVaVZDaDVFN0pwWlovMlJUSFZPeUZ0UGh3WWFsMnppQXpIM2dmczZi?=
 =?utf-8?B?MWRlczVzbEJQUzdRbVVnZFArcEZobG5TTlNpUkI4RmpSanNscUcxcCtzTTBu?=
 =?utf-8?B?TEdFbUR0cU10c0VDOUROZFpoMk51bE9YQVM4MWU4Mjk2RVRpdUppYUpQTFoz?=
 =?utf-8?B?eVpjdWFCZUlmVnVldUIzbkpINk9KZUJhb2x2eUYwQXUrWnBKcDJvZUFFZ09a?=
 =?utf-8?B?NmQ4ZWNqVE41REpQc0lQbzlzRnpWZnk2anEra25DQ29GNjdUaUVIb29NcW4z?=
 =?utf-8?B?WmJoUFpwb1l3UEhnNUR4cWJBT1BSekhsR1VpaUFrUklBV2dicldVSE5SYkEx?=
 =?utf-8?B?azRybm1tZEFMaTJFM0VoSk5NNTN3TXdCZ3ZxdXArYnpLS3pXR0wvcnRTNDhy?=
 =?utf-8?B?aFU5NEJ4SWpLelJ0MEozZG5GZ08xZUpuVnoyV2R2NW12RkJmN3JQampIL2dL?=
 =?utf-8?B?UWRaUnBIeUxhd1BKcm5XdFlqMkxoUEkwSGp4ZXVUZkViNzhwQzFobWJPV3ZJ?=
 =?utf-8?B?TWdDeXg4d1A3bmM5dXpRcXBiZnpXT0dYSjk4V1B5ZGhIcEpHTmUyc2tGMjI1?=
 =?utf-8?B?cG5kanRpcGdNWlVPMll5dk5KWWp3Uml0Nms5dUU5MHpEbCs4bnNqUDBtaWtn?=
 =?utf-8?B?OGZSNU5LYzFHL2x4RzFwaUI1SjFRPT0=?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017d864a-ea40-42c6-9ec7-08dd99ffd86d
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 13:43:48.4597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8E3kV80tJDsWoj1sSBx2GbV7worMy8PyK7klyorKcfULPqmMwgN+bPdNP+nHnekKGyUViGje6llDt8hVFV3ZtbJPDIqPwf/9LX2Ibk8D9fQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB4619

Add SAS (Société par actions simplifiée) to the allegro of vendor
prefixe description to include French simplified joint-stock company
legal structure.

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..51c1c10fe649 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -82,7 +82,7 @@ patternProperties:
   "^alfa-network,.*":
     description: ALFA Network Inc.
   "^allegro,.*":
-    description: Allegro DVT
+    description: Allegro DVT, SAS.
   "^allegromicro,.*":
     description: Allegro MicroSystems, Inc.
   "^alliedvision,.*":
-- 
2.30.2


