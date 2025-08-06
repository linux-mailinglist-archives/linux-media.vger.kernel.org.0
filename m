Return-Path: <linux-media+bounces-38959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33856B1C3A9
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 11:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D08F63A877B
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 09:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21AD24677C;
	Wed,  6 Aug 2025 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b1QSo2hY"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1860C28A1CC;
	Wed,  6 Aug 2025 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473533; cv=fail; b=RuT3JDBG6Q5AH+z2TQ9Gn5qWvDmjiq7+LsH1yDzUVOMsVkAODXiodyfbFA4v5GAgkUWDpPlzAa1pAA1gyqB3oimvW310XrSmreepo0Uy4C1LiCeNSk0HIUnE1cLURP5yE5yFgMmchzNbcT7xZhtAPm5SKdg4q+yHwmxfN7t+ydU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473533; c=relaxed/simple;
	bh=kxqHPTES+05echVHHpylXUxbfg08SJ6IWIpjOT6f3YY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pacN1xP/iZp4fJZQaCrVQ25vMCHCOd3sHweKYW8pJE3E2/9imBrygz+myQEk/nCAHISJ9evm6og0NGwsyCNJMrVvyo3YJpLqFkysr0zfI6rKjj0VDRT5T/jrmxCrCDDlrA+MX6uNcOWF8OoKvTi72CKXhfivb1GxE1CvY+xtQBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b1QSo2hY; arc=fail smtp.client-ip=40.107.220.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PY/iJeiyZm8UAQeA16piatuVNi9SisY1uyD9I6lgVsygSyJrrCYNpGxAMtQTVI0G0mR0/noF+hnrncFNiiCTnTWrpdVmW/jxws6DCcNx6eU5G7s1tcwvIzHv0fzrioDn0sESLFVjn+xrSn9Ol07pR2dnrmnZq47QB4ok1+ODveB1jWR4KTKyOTK1sQaZg588nq+vDkV43S36kQ/6pvjRWG2+CPgc1k9Ja3NgXwIfYIdMl433K2ZQ0lvAb91qOq4tz/rd9nPm97L6cWptKKedGZWlwTJIvbVL85dXd7LvJd8ygTu/CgCKi3IV0fEUJbjr60q7yhkOmTjPZq3lX0LkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AFYhWnKpsdKh8v/qY+KRDUc2vxYZ1vLRhhg/mexC1s=;
 b=nP+9YYZTgbgQik5QdOC+6qkePcR+w7FeMQKjvxMsMW437qIS56uqaB/CzPnuGKWRj+EexnUmSH0v8LI3w2rzC07tK1Wb3nTKElhdVFV7NBKMsEC6fz2OXfnZCVlVA+Qmn4QcNoFxzlrdsfzYAfLQeN/KYHo5+MiwqZoAclaWIv6xYa04vpxggCojFE60tx4FzZkmOh7Q3y2g8Ujjk1J7Wm0FYvDshDx+82zHeI9s55wtbqHBgUu0Ush0ecuAkQi2QQaivbeDmSFsBfQcxTfBVfsIVvhswLEaG81eTX/+D3jWYmgimetaXzBX5BKgtwBwrWfWXDnwnXn6rExqOugSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AFYhWnKpsdKh8v/qY+KRDUc2vxYZ1vLRhhg/mexC1s=;
 b=b1QSo2hY8vy3cXIDjpiWZQxxmyqdawIS1yHVYdduVNINZI6HXhhM547fcI29kSs4HG+Uu9EeVuXnkxw8vn0RvMimn+jmTS7/S8n/0TCuinnvz9ZB/PfDt1iyz7X2y1F84FXVOa7jCIFjVkgyyuQV28f820M8bD0dEi+2ohuKp9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB9202.namprd12.prod.outlook.com (2603:10b6:510:2ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 09:45:25 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Wed, 6 Aug 2025
 09:45:24 +0000
Message-ID: <b40c9157-3ff2-4a9b-9617-e8fc4f6e893a@amd.com>
Date: Wed, 6 Aug 2025 17:45:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] media: platform: amd: Add helpers to configure
 isp4 mipi phy
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com, bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-4-Bin.Du@amd.com>
 <aIcZuj6wrekhaguE@kekkonen.localdomain>
 <20250805103930.GD24627@pendragon.ideasonboard.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250805103930.GD24627@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0065.apcprd02.prod.outlook.com
 (2603:1096:4:54::29) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc51676-2c1e-4e97-9674-08ddd4cdf799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEgyREZ3NTJ5WE05cGV0aDJPZFdwY1JvSGtqdG5tNm4wSFRrRkZUY01BNVJm?=
 =?utf-8?B?MytTMnBRaUFZcnpTRGNnZ0w4MXdoVGdsSjlENER4VFV6WVNKRyt4ZTVVbHFp?=
 =?utf-8?B?bDk2dE51MElaVTd2M2FQYTk4RWFTZ0RWMkJmazhVUnBsak9vK1FvNUdUSStn?=
 =?utf-8?B?VEVGVi8zUkVaYWs4VGZENnFwd2JPNFZzK2FzeXZFRDJRWTZpMUdERGpTem5w?=
 =?utf-8?B?WTdlRFMvOTUvRTN6MHR3akdjVHJDYk1KVzlFNkg5dUtyOC8xZjB4MWtNYTJ0?=
 =?utf-8?B?Tm9UTlQyNFNPcmprVmJzRCs1Uk5Xakw5eHN6c0ZiODBPOHByNGxsNXhZSng4?=
 =?utf-8?B?ZUFkUUtwQ0ozVVFvRGcvYWhOMHhkeHc3OWlNM3JRSUpmVHF1N3BnRURhZThU?=
 =?utf-8?B?TWd3MkMxaEtodzV3WTFXblBHa2ZiTU5PeTVEUk9icmpIMFdTemZBdHo1RUgw?=
 =?utf-8?B?U0RIZERWVGR3ODJsM3pIbjMwcDc1NTIvMWN3VThvMkRQQUtTeXVGM3dHZXov?=
 =?utf-8?B?Z2F5YzM4T1BtZjc4YU9WdmNaWmxUTFJlaHRrMkVQcVFsY0s0eFZ6U2daU0kw?=
 =?utf-8?B?R1dwVFQwSHd0cXN6dnE1b2IwcVRNRjlXUHZ0eG93OVZ5WUt1S2ZvcStoamsx?=
 =?utf-8?B?YzdUUmpnRDJjTG81alNXa0lVWmNDOXltQXlsOUtPbkxCU1FGTjdhWExKZWpS?=
 =?utf-8?B?M2hHUkFQNkZOZmsrU0NLQk8vUG5yVDVZaEZEVVRycWhDUW0wVksvMng3REQz?=
 =?utf-8?B?TXNuVGx3OWd4dmZBL3o4MXA0VlR3U295S1NDclVmZnJueXhBcE9ROXk5S3dZ?=
 =?utf-8?B?Zm51em1IbDN5ZDRPU0d5VGVDek1QdExETzloekxObXNic0UxZVR6V005UkJR?=
 =?utf-8?B?UTFFbWVhcFh6aVRwZHpQV2psR1VpWnBXejJJSVlQUUJQdW9lWjZoMmV4aFRX?=
 =?utf-8?B?RE91NGJsTnhOWVBHVnNSUUtqVXBhLy8vcnNBbjhyclhlSVhpUlBCd1RpOHNB?=
 =?utf-8?B?OUg3eUNDRGZiclhWd2t3UXFrakRtZUJBY1UxV1hHcWtpQnd6a1VFM1JTMEJz?=
 =?utf-8?B?TW1sT0pmTTZuYUk4M1NabmNoNGJaNCtEYXEyK29nWUJBRlQyenFMd1Jwd3Vk?=
 =?utf-8?B?N3RGOFVJUHVTYzR1WlZLcjlRcStZc1pFNllSZm9HcUNIeFZxN3V1M1RVN2s0?=
 =?utf-8?B?dGhyY2V2Q0lnajd4c3h3ZzN6ckIySkNKWlR0bDUzN2U1S3pwbW84bnB6ZUVF?=
 =?utf-8?B?dmFSU1JUUy83MjFsYmxseFFBYlNYR2pYdEgwZ21VTjFYSzBMR252N0VFTVhj?=
 =?utf-8?B?NDFlRjdua1VuTDhFYzVsNEY1dlByRzB4U01BOVFkUHY3cGh1cHN5b3BVdVUr?=
 =?utf-8?B?R1BCVkw3aDlINy85YzF6OE9tZXh1QXFKbHhEU0VMNk5FbVVLbGxRZ2JiMmpU?=
 =?utf-8?B?MU9nRSsvQTBpOUhmMG9uekpSbXZXdXVBNTVKYlNubmk4VlZYMHgyRXp5YWRC?=
 =?utf-8?B?cDY1ejI2OTJ2ekdLVUlKc1c1cVY4QTZLWERWanRnRGUxQzg3ZDZ1SldRdS9r?=
 =?utf-8?B?WmI0bVE5dUtTZHlBSTdlTktJUEZnaVhXRzhmTkJSUHB5NUx6a3Q4TnBHOVdG?=
 =?utf-8?B?cDBCWHgwRllTNDdYSy9MNW5ia0tuNTRySUtla2MwZGRhc3FieWxFZ1psQ1RB?=
 =?utf-8?B?bmJUVjEza2hickdzZkEzV3ZaU3pkZG9HOGZreGZzYm51NHhRTHpHcFhKc244?=
 =?utf-8?B?ZmdFK0pLSm1RR2VaSjRHL09xQ3lPbSsvcjBjRXhIT2Rta0tDUSs4OVI2NVBB?=
 =?utf-8?B?RTJFODZwRU5DTEVwVVRoZnJuRzhPOVp2eWJxc0JIZnRVUFZrODN3Mm5NM3NB?=
 =?utf-8?B?RWErTDRULzlWVmhrTERGQlF3OWFQSE5OcHA3bDlUR21OZVJnMjRiRjRtaGpx?=
 =?utf-8?Q?WCzeomYDHN0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFJMYlVKOGZNeDcrcElBY0h2NHlHUGE1aCsvSWhGNFZYVXBuVGRzblZRc3JS?=
 =?utf-8?B?MzJLOGVaaENEcDY4bkNiMS9abS9waW13UDBXa2l3UjdNNnRWbTdNUUI4NzJX?=
 =?utf-8?B?T2owTlNXNlp6S0J6UHpKOHhlMDVxc29MY05iZjZNOEdTTitqSzRQcXVTV2VK?=
 =?utf-8?B?NHdqN2s4Z3RDMXg3bjJ5R2xvaU1vK0VWT3NUNXJaWTZIVVJiT0JzVVZYQjAy?=
 =?utf-8?B?VDYyaXBsYkcvbXZtMFZVVTVMMDBWUEkxQlppK2lVd29XNUZlZ2NLK2FNdEFv?=
 =?utf-8?B?WmdMakJmUmtrdjhkbTJsOE05UjR6S0xDa0cwVDA5ZklRSlZMREFQSEpwelph?=
 =?utf-8?B?bEhxVkxWMEQ3dkJzNWhWMlpJaHlkYkxNWW1PdzBkQTdmNS9za20wbnE1Z2No?=
 =?utf-8?B?cW5CUmcvSmR6QUduWU1XM3dqeTdnd3hrd3VPanBVZmdKT0Q2bEJXSE5TTXNr?=
 =?utf-8?B?dURobkI3R3FmWGRxUlg2L0w1ODV1YjRORFZrUGNVMnU2Z1BBZFU1V2tySUZH?=
 =?utf-8?B?RU9ZME5Jb0V3QU02OHgvY3Q2WlROU21wMkFFYkpabVUyelh5R0gySXlRSW5z?=
 =?utf-8?B?MVBjLzhTd3loeng0TkNZcldmOStLZ0c2RWJFTnJ2L0NWdnNmMlZnQTUwSXRD?=
 =?utf-8?B?NkZQSmZaczI2MXhxcTBEUC9lWjVZSHljMnptRkY1bzhVN2drUllFQXI0R1ZP?=
 =?utf-8?B?OGZjQXFGL3ErV3FFU3dIZzhETkNHKzhKTE4xQmRGMTlQSnV0bzFqa2k3ZEJ2?=
 =?utf-8?B?Z1BzSHRQM2Y3YndWem05Q0ZqcUduN1RCdGlFR3cxdFM5NjhVS0EyclFMTWxQ?=
 =?utf-8?B?OGlTSEhXYTNsUDNGa2Q3akQwUDlwbHgvNWN6QVNiejN1UWgvdTFVVTBMa3o4?=
 =?utf-8?B?WVJ6NU9uMFNqZVpyRWUyODZhSTh3ZDF0elhrVmhVbmNWUy9qdDBEbEgybVlB?=
 =?utf-8?B?bENVL2xCRHZ6aVl2QURBKzg0WVlGRDh5STBzcWxlYnRTTWFHUEp4cDNicnV6?=
 =?utf-8?B?ek9BTWZTNzViU3BXeDRQRC8xeGM4UkM5SXBYcnduOG00T2FFTGVZQTRxakxE?=
 =?utf-8?B?dlZDN2Ixa2dUK2JCT24zR2RxU0lNWitRbThPamVLRlhUNDFZN01lS1MrbkRL?=
 =?utf-8?B?T0MyUTMvV1E2aStNSWcwRHBjRVB0cWYvMnA5WEk2eWk3eFB2TmZrbHgwVE1V?=
 =?utf-8?B?MXowN1Z2UTEzS0Q1QTQxMWIyYWVSdEtRZERGVmFPelg2c3d6T3NCTlQ1Mk1u?=
 =?utf-8?B?Z2g0b2pnTTc3MUV6WW12MWNsSXRRNWFObXllY2hKL0N4d2hMUzBTaThtVU5E?=
 =?utf-8?B?Z0F6T2tEOUxGUm9jU01MMTVsOGxCd2JlOFMwWldCZXdaTEg1Ty9KZjlkZGU0?=
 =?utf-8?B?ek5Ca2JsbE5iaDlrL0gwL3lJNnpxZDRWbitDOE5DOVVwV3RFbkp5dWRtVTFl?=
 =?utf-8?B?ZzNEYXdiVzM4WEpJOVNrcjVTMXROWmQ4MnloT28ydGxjQ3o4SEZwSUs4bFpM?=
 =?utf-8?B?WXdGNWdKaFo1RjRnaDYvWmdRV1BtQVR6dzdFUmJjWVdncU9GbjdDcmhHcHQw?=
 =?utf-8?B?T1FnK0FsVTZ4YnhRWlVtRmQxb1dLMGUycDBoc2N1SHl3NW5sMDhQTW9HSnNO?=
 =?utf-8?B?OHQ3c2I0Y2tVY0ZRcWExay84MkxJTkNGREVkcm9EbnAzYm9yaXRIYTdCbTRi?=
 =?utf-8?B?Y3BPYlphNTRNaGlqZU40Z1BiTUNONnBDcllXMVkyU0puczRkVHdWZHBhZjlu?=
 =?utf-8?B?d3N2SnRWR2lKVXhNYmRnVWVRa3dHNmQ5Z2NYdm00T1lPZnFTeWlrck44dHZx?=
 =?utf-8?B?aFZlSkpvT08rYkQvOFVLd0ZLQXg1T3BSbnBPV3lJaTJhL3FOTG43V3kxMzRQ?=
 =?utf-8?B?dzZKYnA5Vk1aYkdJTDlsbEoyanVlOTlFQnc0Y0RTWDlNUy9ZbjFBeWQyU0RZ?=
 =?utf-8?B?R0ZnZ04rOU4vTGRUTlZBQThhenkzdlBFRW9LblFYK3hxcHFCNWpTaFA0V0Zh?=
 =?utf-8?B?RWdJUnIzc3p3dngxaTEyb3RpY2RNekpsdGJmMDJwM21GZHF6TWV1OGVFcytJ?=
 =?utf-8?B?NlhJb1V3eEphSzhBUkUzajRCTTEzcDRMcXhDWmZSWE5vcHdUTGRuOUhMZktT?=
 =?utf-8?Q?6cUs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc51676-2c1e-4e97-9674-08ddd4cdf799
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 09:45:24.7045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTCsbYRNEP49l9V7vHAySt1grxmA97sdv999FrBbMtqkMp4oZN/vi46+mG7nojIS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9202

Thanks Laurent Pinchart for your review

On 8/5/2025 6:39 PM, Laurent Pinchart wrote:
> On Mon, Jul 28, 2025 at 06:33:30AM +0000, Sakari Ailus wrote:
>> On Wed, Jun 18, 2025 at 05:19:54PM +0800, Bin Du wrote:
>>> The helper functions is for configuring, starting and stop the MIPI PHY.
>>> All configurations related to MIPI PHY configuration and calibration
>>> parameters are encapsulated in two helper functions: start and stop
>>> mipi phy.
>>>
>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>> ---
>>>   drivers/media/platform/amd/isp4/Makefile   |    1 +
>>>   drivers/media/platform/amd/isp4/isp4_phy.c | 1547 ++++++++++++++++++++
>>>   drivers/media/platform/amd/isp4/isp4_phy.h |   14 +
>>>   3 files changed, 1562 insertions(+)
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.c
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.h
> 
> [snip]
> 
>>> diff --git a/drivers/media/platform/amd/isp4/isp4_phy.c b/drivers/media/platform/amd/isp4/isp4_phy.c
>>> new file mode 100644
>>> index 000000000000..8d31a21074bb
>>> --- /dev/null
>>> +++ b/drivers/media/platform/amd/isp4/isp4_phy.c
>>> @@ -0,0 +1,1547 @@
> 
> [snip]
> 
>>> +union isp4phy_mipi_0 {
>>> +	struct {
>>> +		u32 shutdownz : 1;
>>> +		u32 rstz : 1;
>>> +	} bit;
>>> +	u32 value;
>>> +};
>>> +
>>> +union isp4phy_mipi_1 {
>>> +	struct {
>>> +		u32 mode : 1;
>>
>> Please pad these -- I don't think the ABI otherwise requires they're in a
>> particular location of the container (u32).
> 
> Or better, ditch the structures, and use macros to define register
> fields like all other drivers do.
> 

Sure, will look into it and update in the next patch

>>> +	} bit;
>>> +	u32 value;
>>> +};
>>> +
>>> +union isp4phy_mipi_2 {
>>> +	struct {
>>> +		u32 rxdatawidthhs_0 : 2;
>>> +		u32 rxdatawidthhs_1 : 2;
>>> +		u32 rxdatawidthhs_2 : 2;
>>> +		u32 rxdatawidthhs_3 : 2;
>>> +	} bit;
>>> +	u32 value;
>>> +};
>>> +
>>> +struct isp4phy_mipi_3 {
>>> +	u32 reserved;
>>> +};
>>> +
>>> +union isp4phy_mipi_4 {
>>> +	struct {
>>> +		u32 enableclk : 1;
>>> +		u32 enable_0 : 1;
>>> +		u32 enable_1 : 1;
>>> +		u32 enable_2 : 1;
>>> +		u32 enable_3 : 1;
>>> +	} bit;
>>> +	u32 value;
>>> +};
>>> +
>>> +union isp4phy_mipi_5 {
>>> +	struct {
>>> +		u32 forcerxmode_0 : 1;
>>> +		u32 forcerxmode_1 : 1;
>>> +		u32 forcerxmode_2 : 1;
>>> +		u32 forcerxmode_3 : 1;
>>> +		u32 forcerxmode_clk : 1;
>>> +	} bit;
>>> +	u32 value;
>>> +};
>>> +
>>> +union isp4phy_mipi_6 {
>>> +	struct {
>>> +		u32 turndisable_0 : 1;
>>> +		u32 turndisable_1 : 1;
>>> +		u32 turndisable_2 : 1;
>>> +		u32 turndisable_3 : 1;
>>> +	} bit;
>>> +	u32 value;
>>> +};
>>> +
>>> +union isp4phy_mipi_7 {
>>> +	struct {
>>> +		u32 ready : 1;
>>> +	} bit;
>>> +	u32 value;
>>> +};
>>> +
>>> +union isp4phy_mipi_ind_idx {
>>> +	struct {
>>> +		u32 addr : 16;
>>
>> u16 would seem appropriate here.
>>
>>> +	} bit;
>>> +	u32 value;
>>> +};
>>> +
>>> +union isp4phy_mipi_ind_data {
>>> +	struct {
>>> +		u32 data : 16;
>>
>> Ditto.
>>
>>> +	} bit;
>>> +	u32 value;
>>> +};
>>> +
>>> +union isp4phy_mipi_ind_wack {
>>> +	struct {
>>> +		u32 ack : 1;
>>> +		u32 pslverr : 1;
>>> +	} bit;
>>> +	u32 value;
>>> +};
> 
> [snip]
> 

Regards,
Bin

