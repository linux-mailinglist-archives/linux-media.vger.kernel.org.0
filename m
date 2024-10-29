Return-Path: <linux-media+bounces-20534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B799B4BA7
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 15:02:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 537E22857CA
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 14:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7378206E7B;
	Tue, 29 Oct 2024 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kxf5IkLs"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2052.outbound.protection.outlook.com [40.107.241.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAA042A92;
	Tue, 29 Oct 2024 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210552; cv=fail; b=VZRZsv5ALnFXz/whxLcLBF/QFKzdYJv17qF/H52ZAJRT2lx+NPXc/d5Mto2r9C7SVaOlC5ZraVWDOVzRMnPH/PYCKr+zJPBm1T4ELGCJYLuujK8TpkYTGevdQMa4AHqiZv9Kzp6mvQwXLVGOPbr51Q1Vqpy9EFPc0E1Q7DitzVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210552; c=relaxed/simple;
	bh=bixRGpY26CVFpZ2Qvo1vOVHT7BxPHn4dE8YvUfRfiY0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hCVbWOut4FQX1Vcy+2bduMCy6ZtA8hWs3O3Rd+Fs4X5BILA8FdkwNWI4XiNN86q6nBHRwcdnmWNhc1BU3fDqQ75bu1QxedoMpKbCCi/Gd4JkPAGfrTJmYQa/2Bp7t/n9eICNMo22gg+zanMxb0ygRPo+WGFzGdgAfVNfetHNfhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Kxf5IkLs; arc=fail smtp.client-ip=40.107.241.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inL6btmXWAQe/VA9YVCH82Rsi6FdOtzL/3mHesJ4Z9iReImJdW8hmaWNFAvPC2jj0RX8ywNiRkLz3FiXmtdV5cB33MLd1DfTqVJ7+gF0E9f6MUuflSUU8KaBR6ULUAwKv8jrv5hIZBXz0kM3qln85siaub7y7wOna+KMvsxDmYgJ+4JOBpJqWXs2u6wawKUVnFC0hoWjtofb58acsNKcN6FmqmWek6nVlZPsBX+kTsiHn4bKh+x0cAC43ZxxhUqAtQjDlQEGd2cl00cCk0Ot5Fg7TdT20V1vzXe0cb0rWOJ5b37gI+plzDC5hZBZ8Oe2BJ5adzO8BQRekpMyk6bJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0S8IYRX0+aR5CLao0NOZVNDZ8tlNvV9cNIPhOej5ZNs=;
 b=falZDyW/BuY35rHzDNnYt+YktVHKvY81ZcOgGs7ygnV7R6BUEta5tKFH6CjIwbUS9pVsvlx50pp9+dL9sBFyeltYqMmpbTlWGfZO3wPG9U8L/K+3St8v2bMxmsxmo0YqFcg0w/kFaJgyz6FFZBC28vifS0dPK//iyyAvMkqGDUrs0cV1G1+oT6ebOgsrEQ3IKW032Y1bwrZkuzVZVUHt14OnZbu5TkTGfxQPBfuzsAHXwSMB26TQHbl5soXcSKEfO1FmQ66TwpVrbRRogJXeDshjptxsudvEQxznruHUA76j/XEk990YJevg8iY4BfnypdxhFqKrYEh6V7nPPTO+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S8IYRX0+aR5CLao0NOZVNDZ8tlNvV9cNIPhOej5ZNs=;
 b=Kxf5IkLsIWVwk3RUKJQLWWCPIfX8oPkasm1pnulS1f6OVduMf87/f1UjTmFUEkR6KfRz6IhUeokS98k/tCI2C8tkKEOOku4wbQzMqWJpqkDDoa18UAI0NwAI2SN2QR0JHWluSjdPxUZ6dDRkMpJHR//MotkWjcf+AAyLiF88OadtmrReEU31LPV00nGyU1P3MY/+Y1wuWG501c7W43Nx6Js5q9GbCdL6cXtvPAFo9Fo/1BtSFPP+sHLEJgCB2zWK3jFfwUmSOyWqhSdtAHDuQkViEzSupcelsXZmzcZ2VH6dVkpyu6ZGHWagKD2bom15mOR4iglAo8y5FCWMFZt8mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS8PR04MB7894.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Tue, 29 Oct
 2024 14:02:23 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%4]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 14:02:23 +0000
Message-ID: <5239f68d-ace8-4262-936a-8bf9b17680cf@nxp.com>
Date: Tue, 29 Oct 2024 16:02:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH 4/5] dt-bindings: media: i2c: Update bindings
 for OX05B1S with OS08A20
To: Krzysztof Kozlowski <krzk@kernel.org>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, laurentiu.palcu@nxp.com,
 robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, julien.vuillaumier@nxp.com, alice.yuan@nxp.com
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-5-mirela.rabulea@nxp.com>
 <f4155f41-7267-423f-ad23-e7f0b24c650f@kernel.org>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <f4155f41-7267-423f-ad23-e7f0b24c650f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::22) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS8PR04MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa73a54-f4ed-4a7d-1543-08dcf8225001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1Rtc2FaU1dKOVo4WDRUdzBjak5jSFBwSzdlRFRveEJ4eGMrclIwK0xtV2hz?=
 =?utf-8?B?L292Rm9xTDRwY2pBdks4NVRtUllmMHhpb0NUTTlsOWZ2VEthYTJiZ2xtQzUw?=
 =?utf-8?B?ZC96bHFpK1BiNGFpRkp5M0Q5Y2hES3NHQURDNEQ0MUpnN1Eyb28xZGtmNldt?=
 =?utf-8?B?dnd0d05JaFlvanQyWmcxZWlKM09RbGNmRlZiWXJUS0pjL1V0V2ZpYzluVnZN?=
 =?utf-8?B?QmlqSjg0b09RK3c4NlczajdmL2RxZ0c5ZVZHZjhiUHBaRjl5R25hb3NaT09B?=
 =?utf-8?B?MlcrdDhPck5DRDRPejc4eUV0bGVKTUJJV1hhVjQ2c3N1YlU1SVE0NzZ6QUcy?=
 =?utf-8?B?eDhINjVIbWFOWnJlL2RxYzR3VC9qeGNVWUV0Y1ZIY1lDdTlkdTZnSWNubm9Z?=
 =?utf-8?B?S05lQWxGd3FaYlk5ZGM1akg3TTdtemcyaEdzbXkveFU5dWVxeXk4a1B3T3Vr?=
 =?utf-8?B?WkdjVTl0TmRJd1RxUVVTbGRwdEZXMUQ1YUYyTFRnQUM3NHBibmE2Q2taTXY2?=
 =?utf-8?B?U1hmY0x0MjYrMHdPZnRwVmxXa2lteGVDeFlZSU02ZWhKTlE2OFpUejlmaWRI?=
 =?utf-8?B?QUEyeDVYandnbENHREsxdkQ0cVlIa05KdXlpWENmRzA5dEtIQzZSL2hodGs4?=
 =?utf-8?B?Zm0zMFZxcC9Eek16aUxrYzNZMHZDVmhDQ2ZFZnJzalNnZExFbkFDVlYxbWF4?=
 =?utf-8?B?Tm9idVJUcGgyMGx3RXNGZXB6cXN2S0luYlFEOWpKTkZpSGlVQ0lQWlN4b091?=
 =?utf-8?B?eGxjeVVxc2pXYXJER1FwSXlJNWc5TEVYM0o3RFBXeTJFanVWUytRejk3UFF6?=
 =?utf-8?B?QU13aHpESVJnRjBad2xIUGwxcjlHNEljTnFiOTJKOUZqZkJZRmJDckJ3S1dB?=
 =?utf-8?B?cGtJYTg5OVF1RGVjalBVZUpCMHhtenZJVjR4cUVsTk13ZHdISUxiK2lPN3NG?=
 =?utf-8?B?eFlGWkdBdmZGWjN2K0phSTFKc2lBQVJ6ZlB5TjA1Q2ZiNFhlSGVtN0tlYjdT?=
 =?utf-8?B?aHpXdmR1d1MxYkZtV3NISXpubDRXZ2todzhMaXZJbDNhcUdpSEx2ekREeVdT?=
 =?utf-8?B?YWhxZWYwVFlxdUJLZVRUTVRaYWNyZzZUYkdWOWgxL3h3UTZPRWVtUEF1TUVZ?=
 =?utf-8?B?aHB4WnlqWDlSV3k2WGV5UzJyWlBWT0hGTytxOEtTcXgvemh3REF4aDMvT3BP?=
 =?utf-8?B?aXZPYURKeFdaeXV3c0ZjVElQdXdSWVdXZmg3REQrcERRSlVzUXZuM1hTSUhI?=
 =?utf-8?B?U0pSaVcrRGhVR1RTK0VRZ2V1U2VyaXhCRGNLSmNqR2hOUDE2UURJLzdhRU9a?=
 =?utf-8?B?akpHWTYraEVsR3pEcjBjS1dsbjljZzN1UUF6VXA1WGhoL081Vi9XRjhnSVZS?=
 =?utf-8?B?aTdNb3grMEhIYktXaTh5WEdTektRREdMQk1xUzE0NTRjSlhySjlhY3JPVE94?=
 =?utf-8?B?RkVCYnhueGhmdDhpc045ZXB0VE0zWk1nRnZscHM4Lyt5VFNlWDZlOEFNUTkx?=
 =?utf-8?B?R2ZVR3I5WnhncXBTRnNuU0g0TWNUREEvVXhlRFBnWS9zUVNLYXpmOUpJMEU5?=
 =?utf-8?B?VEJWemJqbjlYM05KME1mVTZiSHZEUzRhcEdQZVhyK25PaklReGhUNFNRTFVR?=
 =?utf-8?B?emtuUUFRMzM0Y1FWWmppUkptbTB0QS9UTmRIL25FdURaSWRNazdNVitFS2FD?=
 =?utf-8?B?dUppS3E5TE5DTThYdm05V2dnT2JwenNQUWRtVGFTakE3S3I3TTJVdnNVd3V4?=
 =?utf-8?Q?92v5oLKghYtOiqQ9DW5xaIF3KbUc3y7oGIxYOim?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1hTQkUxWWhTeUFSTTYvMGxzNzQ1a2Z6VkFvZGdCNWNZSzZsOG1SeG9SbEdB?=
 =?utf-8?B?QTZReXZWR0NxajBnTzhvc2gvMnpiSDNOUDBXMUhNK1psYWZLR2t4N1UzRjhQ?=
 =?utf-8?B?aTd5SGJTcW5FSHlyYkIrWjgvZEtUUlpkUzRveEFDbktIQ1RZQitta3FYeWRX?=
 =?utf-8?B?S3N2c3A2RHhmaFNHYXRsS0swZFNaOVNYUG1jWm1UWXN1blVTRy9uNnNKRUhx?=
 =?utf-8?B?ZEJPdlZQUjhXY2FoeERBSlV6UUhFV3h3eTFyTmx1WTFJdnpaWktIQmpDSmpm?=
 =?utf-8?B?S0xnNmFYNXByc2VLYnFxM3FBWEV4R3Radis1dzk0Q0NvVWhsQTVBb3FSOFNy?=
 =?utf-8?B?Skl0WmFwT1RDSERONDVDUE9uM3hGcHQvTk04VExWYWhiNFFTSG9wNHZNcGdK?=
 =?utf-8?B?UmRIQWxVOFZuN1RoMTRLY3FKVDJEeGFVQ0tBRU9YRGxlRVRMRjVSd3MxL0h4?=
 =?utf-8?B?YzZWQmNNdUZkVmdpVHViRU9SVXU3SG9tdGZMSkYyVWdSQUVoRTUwWGcxQzM1?=
 =?utf-8?B?bXZqcy9CZmVoak1IMzVsUVg1TGdyQUVCZ3ViWU5rS0ZyY1ZZcWd2dUN6M0xX?=
 =?utf-8?B?U2FvU2NTK1RGbTVWZG1lM2ZlRnFvc29tWHAzMTM4OHp1a1hRQ3VSTXplc1g5?=
 =?utf-8?B?N3AwZE1kSzJ5cVlwL1RIWk96bFFqSTE2Lzl5MGFNaVVsTERLSktwOGcvSWFv?=
 =?utf-8?B?bzdyR2JuUUJUWEc5cC9KRyt6Qmkwd3hwSXphS1ZpYUxGRmRlZEJWaHZEODNu?=
 =?utf-8?B?aDN4Vmc0dDBBdFhTR1lrMlFrbGs1WHNyOXZWemFHSTlxV3Z5N3AzTjJlY0Vp?=
 =?utf-8?B?cm1mYVQ1N0d3U1g2c0QyZlFVcllyWW5yaTJpOTZaczBQaUllbmRNbXFrNXg1?=
 =?utf-8?B?QUtycU1iQlM4THNPa0ZFYllpQjRReGgyNDhHMzNwSXA4cGdlcG5NMEpwcmlm?=
 =?utf-8?B?TnpybnVxcDhzcjJCVkdVNWtBREFWdm16Y0FRdlBEYnRFblNBWTRFd2dCT3hG?=
 =?utf-8?B?TXc2RnErUDdNMXhVUStsUVk0V0s5S1l5ek1nVnA4SUhTZHRtVitLdWRJbVVW?=
 =?utf-8?B?cnYzUTlHOUJGTnRvTXlETk55TDlyczdNb0RWWTFwNzU1RHB6VEZVMlRCRU5U?=
 =?utf-8?B?bmhKQ2dsejVLS0pnTEdNQU5qSitodzN2Y3kvM1N3eUJHMU8yWmpMNjJ3TTJy?=
 =?utf-8?B?QTVlU3JKUzV1TGdDbVc0QXVxdEt6dDNlM001RkdrdGdid0lVTUZTKzd4Z2dG?=
 =?utf-8?B?N0x5akRNdWozbjhLOFpoZ05PT0wvTDFrNlVTMVliSUtJTFhhNnNXUS9nUWZh?=
 =?utf-8?B?RzdGamF4SjhiV08xQ2xPbC9EbnhndVZuYWFqdWpaSWphaFlzN3ZaT0VVRjlV?=
 =?utf-8?B?V1BXM1BGTlNETDBTMHY3djNPazI3RlIzRXdQeXEyQmdVL3M0R1lpeVgrY3hl?=
 =?utf-8?B?MThDeGVQaXlEenp2ZmVwYXVmc2RkS2FxTU96WlVhd1dvSnJrTUhCdVdRSS85?=
 =?utf-8?B?MzkvTXZSc1QrM0pVSDVldHQ4VnpmOVVQQmhpNnZFZENNdmlua0dqVCtJQU9C?=
 =?utf-8?B?bnhQbFFRdi82VEZLQlg3M3ljcXkxekVFS0tDTEo2NXJrUmpjR2NSbjgxa0Zm?=
 =?utf-8?B?UmZ3N0dqQ0RvRkVJOEtkWWd1TU1VdE1BQW9pcXdYd0FQcDZhZ0JuOCtVQ2FH?=
 =?utf-8?B?VWpjcllpVndhSXdwejR6YkZlQU52MFhvZU4wRXlBVmk1dFBrRS83SjBsT0Iy?=
 =?utf-8?B?azdKVnVIMnh1L3FSV1o2S1J1VkpCeU9hTmUySE9zY2U4SXhDVENpVFNaYVIr?=
 =?utf-8?B?VWlmYk9EUFVoSHozZ2d3TlFmMCtsY1ZLakJkVmhzZi83WG9jbVdpN2kvRDIw?=
 =?utf-8?B?Y1EveS9qSDF3Z0RnYzdoQUZSVWFyUVBVOXlHSE14T0hXeUl6TStTQ1ZMZVRl?=
 =?utf-8?B?eUMrSFNTWmdYUEZIMVc4bWQyT3FnWlpmK3hVNjYyRUdGTW5hMDV5NDBDVjhh?=
 =?utf-8?B?TGlWbUdQU2UzeFVMZUNjNkhKTkF6YytUTVpZT3FGcS9LNnlHOGNpc3M4Q0Z4?=
 =?utf-8?B?a2hhb0F4MEZNdGtjeEd3V2hNSmJhQjRtZi83OHpqZ25USzlTSitndW45d3NJ?=
 =?utf-8?B?SExYb3BmSkk5YnZmUTJLOVd6NkRBY3RYTkVqYWZydVp1a2F4T1lxWlhvdzhG?=
 =?utf-8?B?blE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa73a54-f4ed-4a7d-1543-08dcf8225001
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:02:23.6549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqKaXBljuyFtvjrPk6G9LC3yTzLJhqX0QKMI4uSFOu5e4pPf8i7pMLT13uQBVUUlVbna2WF5y2GFa57WVuUyUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7894


On 29.10.2024 08:17, Krzysztof Kozlowski wrote:
> On 28/10/2024 20:06, Mirela Rabulea wrote:
>> Add another compatible for OS08A20 sensor.
>>
>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>> ---
>>   Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml | 1 +
> This is part of the original binding. Submit complete binding in one patch.

Hi Krzysztof,

Should I squash this patch into #1?

I sent the patch #1, #2 and #3 for the OX05B1S sensor, and patches #4 
and #5 as additions for another sensor, OS08A20.

Thanks,

Mirela



