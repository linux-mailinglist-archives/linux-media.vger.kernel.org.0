Return-Path: <linux-media+bounces-38961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C399B1C3DC
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 11:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACFDD7AC747
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F9B28A1FB;
	Wed,  6 Aug 2025 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DuiYDx7o"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303E31DF256;
	Wed,  6 Aug 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754474209; cv=fail; b=qxi+3mPcpm9y+0wK0j7BOnyGj10gdy/4eEvx1nrIu7/WXaHG6Nm+HqUwBb361slcg8UoUYcOZgYVkp0Ff97x7ag14yogyHy+6v+TwEn8NqZcrWv0DPYAi4RUIFg046+eLARuAVpjoghCql16d8r0QqL9woTpZuYYauTwWAfFMOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754474209; c=relaxed/simple;
	bh=YlH3Btvc/N0FKcGa/0QJ194tJkPmG5E22LNnfka65UQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F+MW698+IQslDTOi0y+mWoK/6LJDwTxi4vHy1qxbbNEXeTdZevDPJuWsW1YXboq0oi6B2l9mQTe6/RHx5rrU1ciYJi/pAE+qOunWZvsg6TESO8/JJjOWD8ZuweSu/9gAEnUt7zF3suQ/cTjO0K2CWcwpQdhBtvSuw5JwqZAFfcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DuiYDx7o; arc=fail smtp.client-ip=40.107.244.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3jzOK3NwcQIuJD1lnl+h6rY0Rm94W5b5PkviGl47czacakn/G6KOgGqg5NnhxCKHLplES24KTCb6OpF6DxvCMHJg/QzbnWOkXh92pJb2mAhfb1N4/t3kSqpSKlWDtiPjYWJz7KE0QlddBwYRQ/qfgrptEaOaftswKIEPWmoF3WQJVIkoqcXzZpJlup09DdGWwuM5CMpg37VC/qHsjNLVkGG/0IMFIqvpxmu+QGaQQ/zljIwW0FHeQlAUmv/aiiQlYmdrxhFIbGeJmhpTNmaA1ICZgDG5zqIKa5dxUW8tXBHTd/c8xG1fMYQbgKMd2TQPaK2h7EFJPs9q3VSssMisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imMwFGiBtzxnxix9TsBDIQ/2igxCuDFtOafKQ8ir8n4=;
 b=ZCLQRVUBCbX7bimPg1BoLoNaDJgohndsTlaM6etW9ekOj4aFcqN25zkIvShDzl5Muw8n1EodwIdU813/d5aSWesaRkN1VX7EJHcSSiLpxuv8wJA8a3a+kSDEl35WhxnIM+Cr3gEKHs6CKfSODDRQ59Nt7cU2Jcvl2jcHVBrL++wFj7YX6A7OYT6Iu4rRKWxcOi35OzNoLxuE2UItHt8XpsLUxcaANqQyUGrQqZZuzMq8d8iRmcxy7LNRuhmDDVGq6cNOATBdbfVF1yHfONW+Jf42ogXkZML9o76L/qPHqG1cJFiS112hBiIN4V7erndmCOu3ZRvxFuq//rSmEr4rAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imMwFGiBtzxnxix9TsBDIQ/2igxCuDFtOafKQ8ir8n4=;
 b=DuiYDx7ovofqovp7FH7E6UUmbmhlZSTBPn3djozQ/MWAC0A/fucGGPXtgYDVI5t1IRkylN5+EyLWG59hHaf5qoO3PRUtSt5mnB8uyD+6Fth5j7WjyT3KAdh8uGv4ykdMoNj0kWKZN0tI7QUrge+uP8oTF0xeXA8AZzLHBlvwOC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB6908.namprd12.prod.outlook.com (2603:10b6:510:1ba::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 09:56:44 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Wed, 6 Aug 2025
 09:56:44 +0000
Message-ID: <ec27a954-5a79-4913-91c3-f8ee5ca61a2b@amd.com>
Date: Wed, 6 Aug 2025 17:56:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] media: platform: amd: Add helpers to configure
 isp4 mipi phy
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com, bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-4-Bin.Du@amd.com>
 <aIcZuj6wrekhaguE@kekkonen.localdomain>
 <87e27412-12fa-4c6e-b333-7e37077b2dd6@amd.com>
 <20250805105337.GE24627@pendragon.ideasonboard.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250805105337.GE24627@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0063.apcprd02.prod.outlook.com
 (2603:1096:4:54::27) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 839ec7cc-1b7f-45af-a592-08ddd4cf8c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWNGMDlOdk0xcVZjNEhGM2pvUmY5aGtnczZ6YzJJckZ0WExiTUJXeFpLTUxY?=
 =?utf-8?B?SERXN1BXYmVpV0JOTE9yN25BNG56aXZiL0ZDeVlrSkdwVFlmOURJYlZTSWJS?=
 =?utf-8?B?eDUwakkvT3ZxYUg0amNvdlRqa3FQZElOd0VlSnhic2MxYkZTUG5Ld3FKL1Fk?=
 =?utf-8?B?MEVhVTNUNzJqdUdtRTU5eEl0Z3JqdnMzVWdVR1B1em5hdi92Zk1YWDVRaW10?=
 =?utf-8?B?S2hkTnVXZkc1NUVxcVl2U2x1Q2V1T0Vqck5RSmlrNnVnSGU3amtRcUpQbTVP?=
 =?utf-8?B?eEZtcS9ZYU1oc0M5SjB4WEQ5YkpQL2NvUDlOYm1ydFdjYkdoREpyd2I0OVE4?=
 =?utf-8?B?VUpmcmVaMnkwVkFZcG9oQjVWaDJTb1BacDNqWFdacGVYajV3SHA1eDNBWGhq?=
 =?utf-8?B?M2NJMGV2cXNOcFlOaW1yMkt0Q2V1Nzg2VUVIZHFYYmdmc0paSXYxTTVxOXBk?=
 =?utf-8?B?S1hYdFZsQUJVWEhMZDhjYmlra3FVOVE4Vkx6M0FQSHpxZWtRNUZHcE94Q1ps?=
 =?utf-8?B?dm9QWWowN1pCZkQ3OFNRN1U5a3FVNzF6QVFBcnN5QTVpU1VraWpzR0JMVE1t?=
 =?utf-8?B?MEJHTFVpZk50UEtnbVdKM20xMXdqQ203WkZaS1FTVzA2bnI1Zm5taStxOC9v?=
 =?utf-8?B?WGhCSkdaakZYajVGRHhEUWo4S01vN08vZVdhcXEvZ3g4K0JieWtQd3d3T2Ex?=
 =?utf-8?B?emgraFNZbkhPUlpTd05XMFVYSmdSdmxiNTVhaEJRcEdMVU9YZEdVRmk1TTBw?=
 =?utf-8?B?M1J5Qll0dGVqS3ZKbUxLTUd4b1kzWCszdGtUN0ZHVGhBNnBPUEwvSWh5TWZo?=
 =?utf-8?B?TThWQWFiQ2hESW5ReG9EVER4TDJXWFhoMmR1b2VUOXdJU1l6a1czczBNVkFZ?=
 =?utf-8?B?VjJad2JYSm5ZdWtYbVNOKzY1ZWFGVmcvOWk0d1YxRjQxalI3cjFVUkxDWCtO?=
 =?utf-8?B?b2x5VkFaRTlia0lPTjZPUUdWUUtueVpiMm1yVFhRS2Q1aGlGVTN1a0pHZU9H?=
 =?utf-8?B?ckNSeFVQbjZGa3BmVTdoN1NUNU1kemc2VEpMUW9DcmhENEJueExoZlZ1bWZS?=
 =?utf-8?B?TzJxaS9jUWRxVEw1TEVTUWNqTmRaQklTRFBiOVM2L1pQaGh3Qlh4MEEzTGR5?=
 =?utf-8?B?STBmSERXTWxTcWhhcEsvc2FudzhRNTQ5Uk5BbFRFOFJNR0hPNG1yb1VKWG5U?=
 =?utf-8?B?K2Jzd1RkL2RNUHpPaTk1emx3N2NZblplWTdZSDlMTTFUckEvdjU1YmlIWU9F?=
 =?utf-8?B?YnY4ODU2REwxdnhqMDdXTSs4Q0JQUFk3STk1b3Rnekg1TjNHTkg2NlIxb25K?=
 =?utf-8?B?R1pwRGZOMmlFa3IwaXJhNGk2M3NTdlVuZ29vVmo3RnJJQ1BYdXVOQ2FGNjlC?=
 =?utf-8?B?Skl5YUFEYXVITUg5cEd2SHZjSFAwRm5zSUNhVFIwajY3aGlBS3hBekRENDN0?=
 =?utf-8?B?VncxdGlyQ0dFOEZvS0k2NWoxazhmbHZkVmhTODZxZGdKQWx1QjhIY3RJdnZQ?=
 =?utf-8?B?SUNPSjk0N1o1Y3JtNWxlai9xaWs1Zjc2YTArT2RPelRzdHVESmp4V1E4Qlh3?=
 =?utf-8?B?S2l1ZG5yUklsQ1VLclpHQTVsRnBRRithRXFHcVVrUTN2ZDBqT3k0LzRmL0RM?=
 =?utf-8?B?ZzNYQVlKZGk0YTkxUXR6Y2Q4a0ZlQ0pjN3JHQ25yT3NZYWx5ckYvYlNvY2Jj?=
 =?utf-8?B?aldjUzU2TXZQSkxpaGU1ZWJuWXhXdk81QUdGc1hpZXpBRHlwZ211RHdHdDB4?=
 =?utf-8?B?b0ZvV25NSnFkQ01wR2ZJS0tMR1JEcDdLWTdpTUt4N000ZnhPeVF2MTVlc1JQ?=
 =?utf-8?B?RmY4MG13cWhualJtS1ZtU2F5SGxCN1VhLzJkekcvaEpKdlVHdzhqanZxc1dU?=
 =?utf-8?B?Q08vbTBkWEhac1U1SzdzUU5ndnIzTHFLdm5mZFI5Q2FJelFDa1JyNUdBY2NF?=
 =?utf-8?Q?Dg2NyCFdwlQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUpBR1ZjdUlSaUlXNStTdHI2NytlOExaMHRVZXUyTFhEL0Z4UElxNTlQOVlr?=
 =?utf-8?B?aGFZUlh3YWFzL2o2YjJoMHBEVmowM1FWc3Z1a0FhdXA0Q2daNFBvcUdqUitV?=
 =?utf-8?B?emZHeHB4d2FSTUpnOE9PVFJzQXgwRjhQMkVkQWh6OFpMcVFuNVVVNE5UU3U2?=
 =?utf-8?B?V29GVUxmSlV6TXVDSGdJN3JkSE1wMW9MM3ZJZmk5QlFCL3lURkprcXMzazVu?=
 =?utf-8?B?YTd3STlwSkNHMStvWGpvcnJxWjZ2UjdUUUdsS2FQenBHL3VSQlZ2U3FTMzlS?=
 =?utf-8?B?NjkxMEZMY1dNVytITzJHSlMzbDJLdkI2dTdsSzhyN0liSkxVV0lHRmFESUFi?=
 =?utf-8?B?QUdqVmFQTlNEdnpOM25RTC9ZR2Vnc2tkVksyVDNiMFFrMGZaRmtXbjRLdnF0?=
 =?utf-8?B?czRxRUo0bktLQ0FBSU4vTXhzeVdUZWxBMm1MSGJJcWNHZ01odG4zVVU4bkZX?=
 =?utf-8?B?NnZRWHVhWVNXOEh3bWMvdUx3am9CM2dwQXdNTlhCZjNqR25LYTdGWkZUTXZU?=
 =?utf-8?B?UUtRRCtPNHpVbGdjVlcwT2tOYWNwSU0vWWQ5b2x1Y2xYb2FNSThpVjZSZktv?=
 =?utf-8?B?NVZrU0t2R2VsNTRWT21ETnhNNytycXJobDZualZTdU1IeEVKZnh1K29LdUJs?=
 =?utf-8?B?cTBOQ1BoVW8zSndIamZjV0JuK2VlamVobzlUMkxsbENSa0MyT1U1NkVFbDdm?=
 =?utf-8?B?MjkyN1IwNHZFMzRMd3NlT1VmQW1VamlvdmV1ZlhZak5wVlJPbGM5aDFCbmUz?=
 =?utf-8?B?MW9kaXRkclRkVUlteWNFRnduNkk1TUgrYWdxUG5oemJwSEZJRkxDUHY3N0pl?=
 =?utf-8?B?REtvSThYNXIvK1U2c3ZpU3VsTU83TE5EOTh0V1N4alg4cHRpL1VTU1BuQnho?=
 =?utf-8?B?ZVNFZTRwdFRxNGNpbUJjR1JqRExhd3QrTlVFQ3MwdTh3bjFHdmRlSHZzS1px?=
 =?utf-8?B?bXMzeEVxdTVuVnhWYmw1Ti9aT1BMSnpkbVhLMGttNVM5ek1sWXNSU3krVkpr?=
 =?utf-8?B?dSthYWZicFJUdFd3KzRzVk5KcStHZVVyandTQjdFWHhrWE02d29Ya3ZYVktO?=
 =?utf-8?B?MjVQak1Rb3pESVh0OTQ5SVdteEh1UG15ZXQycHdDTG9taTRkSEV3VEZ2UlRs?=
 =?utf-8?B?Y0RUK1IwNVc3L3VVTXJROGpnT2U4TWlkODRwZ05iL1lFWkVBZmphNzBuNWpX?=
 =?utf-8?B?VjU5MGhoUzE2cDRIM1BFL2t4ZTdNZ2YzT2ZKVEhJbE1pT2FseTk1YzhaTC9m?=
 =?utf-8?B?TjdDWnZSdkwwbGhXeDF4T3g1bHpQNURaLzY2U29wTWpYNkdCODlzcHAzc0Ju?=
 =?utf-8?B?MW1WbnJIRTlVaElubkk0MGZsa0VEZWl6eUIxL0kzd05pOG5iTmZ4eVNRYktH?=
 =?utf-8?B?SUdVYkd0bDdJL28yckpWOWFYUGk2TDBUdVpGWEpvOXBWdkVSdCtNcXpxcFVz?=
 =?utf-8?B?VmduS2J6L3IvU1AxNGNrSWg4cEdJc2lhRWZESHg4dUdsRk9kZDVOZ2pqMWIr?=
 =?utf-8?B?a2JianoxRjNwaHV3cFpEdWZycllKdXE5dm52TnFlNlVxQ3R0Q2xVdlpMRjFX?=
 =?utf-8?B?MlJCVzNkTXNoWmhJOUROYXJQdXBCemRIVzk2eDlyMGJyUU9mcVZreERxZmZE?=
 =?utf-8?B?ZGpWcGpCYkxvTnZWS1VSUmRCZG9VZmhNYk93L1pqOHlMdXpYZ3gwWnJXM3ZE?=
 =?utf-8?B?aGZwa3Q1ZGFqT2xHQkVjOVg0a1UrS2dQeDVnL0RWcWV2anByYkJnZVRzQmJJ?=
 =?utf-8?B?dzNFeGd0elA4NWRnQ0c4ZnNlekpCTW5EeEZqWmh6VEsxNStObTZPVVdOZUVG?=
 =?utf-8?B?SUhoZXF3SEs4TzFnYVh0L1RWMnNNbGFVUEYwWklxZE1vWHlPMzhkMzRPc2Z2?=
 =?utf-8?B?bCtyMkgxUUhncFJMUmtxdmpCdnR3dUEvNmVLdm5wUkZ2cFI0WS9TTm15N2ZM?=
 =?utf-8?B?NmpJTUVlT0Rnb0Y3dEtqWVdoMGhKUHo4eVRFdUx4VkkrNXJIM3dwUGoxY3p6?=
 =?utf-8?B?d1VWcnREQ3pBRHU3d1FnNWVQME8xckdBbUhtQVhjUWRDNmNMOFdwSTNpOWlX?=
 =?utf-8?B?VXRNbE1xZVNRbCt2TnZtMFlIZGxTTlFrSlB0c2g0ZzV5T25ScFh4YlMyMzNz?=
 =?utf-8?Q?Y8qY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839ec7cc-1b7f-45af-a592-08ddd4cf8c9a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 09:56:44.2142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8m5/Z23CGewr5/KbpPm8vvnrrDNW7cKbCWSRsO5shL29qikDywaMcWPzOHVmpJo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6908

Thanks Laurent Pinchart for the review.

On 8/5/2025 6:53 PM, Laurent Pinchart wrote:
> On Tue, Aug 05, 2025 at 05:53:30PM +0800, Du, Bin wrote:
>> On 7/28/2025 2:33 PM, Sakari Ailus wrote:
>>> On Wed, Jun 18, 2025 at 05:19:54PM +0800, Bin Du wrote:
>>>> The helper functions is for configuring, starting and stop the MIPI PHY.
>>>> All configurations related to MIPI PHY configuration and calibration
>>>> parameters are encapsulated in two helper functions: start and stop
>>>> mipi phy.
>>>>
>>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>> ---
>>>>    drivers/media/platform/amd/isp4/Makefile   |    1 +
>>>>    drivers/media/platform/amd/isp4/isp4_phy.c | 1547 ++++++++++++++++++++
>>>>    drivers/media/platform/amd/isp4/isp4_phy.h |   14 +
>>>>    3 files changed, 1562 insertions(+)
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.c
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.h
>>>>
>>>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
>>>> index 8ca1c4dfe246..0e36201fbb30 100644
>>>> --- a/drivers/media/platform/amd/isp4/Makefile
>>>> +++ b/drivers/media/platform/amd/isp4/Makefile
>>>> @@ -4,6 +4,7 @@
>>>>    
>>>>    obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>>>>    amd_capture-objs := isp4.o	\
>>>> +			isp4_phy.o \
>>>>    			isp4_hw.o	\
>>>>    
>>>>    ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_phy.c b/drivers/media/platform/amd/isp4/isp4_phy.c
>>>> new file mode 100644
>>>> index 000000000000..8d31a21074bb
>>>> --- /dev/null

[snip]

>>>> +
>>>> +static const struct isp4phy_mipi_reg *isp_mipi_phy_reg[ISP_MIPI_PHY_ID_MAX] = {
>>>> +	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY0_REG0,
>>>> +	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY1_REG0,
>>>> +	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY2_REG0,
>>>
>>> That's an interesting way to prefill structs. I don't think these macros
>>> expand to valid pointers.
>>
>> Yes, these are valid pointers, but they are not pointing to system
>> memory, they are phy registers address, can be accessed by adding the
>> mmio base.
> 
> Please don't do that. Store register addresses in macros, and use them
> through the code as appropriate. Stop passing the base mmio address
> around through functions, store it in a PHY object, and pass that object
> to the isp4phy_start() instead of a dev pointer, base pointer and phy
> id.
> 

Sure, will do that and update in the next patch

>>>> +};
>>>> +
>>>> +static const struct isp4phy_mipi_reg_seq startup_seq_general_common_config[] = {
>>>> +	{ PPI_STARTUP_RW_COMMON_DPHY_10, PPI_STARTUP_RW_COMMON_DPHY_10_PHY_READY_ADDR_MASK, 0x30 },
>>>> +	{
>>>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2,
>>>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_VAL_MASK, 0x0
>>>> +	},
>>>> +	{
>>>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2,
>>>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_EN_MASK, 0x1
>>>> +	},
>>>> +	{
>>>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0,
>>>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0_CB_LP_DCO_EN_DLY_MASK, 0x3F
>>>> +	},
>>>> +	{
>>>> +		PPI_STARTUP_RW_COMMON_STARTUP_1_1,
>>>> +		PPI_STARTUP_RW_COMMON_STARTUP_1_1_PHY_READY_DLY_MASK, 0x233
>>>> +	},
>>>> +	{ PPI_STARTUP_RW_COMMON_DPHY_6, PPI_STARTUP_RW_COMMON_DPHY_6_LP_DCO_CAL_ADDR_MASK, 0x27 },
>>>> +	{ PPI_CALIBCTRL_RW_COMMON_BG_0, PPI_CALIBCTRL_RW_COMMON_BG_0_BG_MAX_COUNTER_MASK, 0x1F4 },
>>>> +	{ PPI_RW_LPDCOCAL_NREF, PPI_RW_LPDCOCAL_NREF_LPDCOCAL_NREF_MASK, 0x320 },
>>>> +	{ PPI_RW_LPDCOCAL_NREF_RANGE, PPI_RW_LPDCOCAL_NREF_RANGE_LPDCOCAL_NREF_RANGE_MASK, 0x1B },
>>>> +	{ PPI_RW_LPDCOCAL_TWAIT_CONFIG, PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_PON_MASK, 0x7F},
>>>> +	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_NREF_RANGE_MASK, 0x1B },
>>>> +	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_USE_IDEAL_NREF_MASK, 0x1 },
>>>> +	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_TRACKING_EN_MASK, 0x0 },
>>>> +	{ PPI_RW_LPDCOCAL_COARSE_CFG, PPI_RW_LPDCOCAL_COARSE_CFG_NCOARSE_START_MASK, 0x1 },
>>>> +	{ PPI_RW_COMMON_CFG, PPI_RW_COMMON_CFG_CFG_CLK_DIV_FACTOR_MASK, 0x3 },
>>>> +};
>>>> +
>>>> +static const struct isp4phy_mipi_reg_seq startup_seq_common[] = {
>>>> +	{ PPI_STARTUP_RW_COMMON_DPHY_2, PPI_STARTUP_RW_COMMON_DPHY_2_RCAL_ADDR_MASK, 0x5 },
>>>> +	{ PPI_RW_TERMCAL_CFG_0, PPI_RW_TERMCAL_CFG_0_TERMCAL_TIMER_MASK, 0x17 },
>>>> +	{ PPI_RW_OFFSETCAL_CFG_0, PPI_RW_OFFSETCAL_CFG_0_OFFSETCAL_WAIT_THRESH_MASK, 0x4 },
>>>> +	{ PPI_RW_LPDCOCAL_TIMEBASE, PPI_RW_LPDCOCAL_TIMEBASE_LPDCOCAL_TIMEBASE_MASK, 0x5F },
>>>> +	{
>>>> +		PPI_RW_LPDCOCAL_TWAIT_CONFIG,
>>>> +		PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_COARSE_MASK, 0x1D
>>>> +	},

[snip]

--
Regards,
Bin

