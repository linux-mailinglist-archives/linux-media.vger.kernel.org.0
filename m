Return-Path: <linux-media+bounces-39558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42722B22300
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12809161230
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70562EA476;
	Tue, 12 Aug 2025 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VKwHQD3k"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013005.outbound.protection.outlook.com [52.101.83.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D192E9EC2;
	Tue, 12 Aug 2025 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990402; cv=fail; b=cmUWFvdMEum6dG/5TOJaJngx3UoZBaz0N7mPfgJgOH3RgMWt0LUkeSsP3l+P9UDPDNjmciUA2m+DFcXYOaWaEk9f2l1pmxTYMoAEteaC+SPvBiAmn83Quykh7Sw4CBSOWlVwtFH0EXJ9IPIC/tp6sWCnvUhQoez0OB+zMHLoCTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990402; c=relaxed/simple;
	bh=ev+VoKQWc22ZRZH7gFZKUMsOdD4edWgs/IlVeeimGr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WuASMr/Uo6GTyNEVi+ECWrv0LBh7bf3Vhtu49riVYDBD3lBbAo9Ri0aoeP0Kh/GP5k1Gzi8bi/Qr6M9W2EiNFYenBa/ElV6oFXz2LpyphXdbPKfJcomCG36A17MdcjbyOCn+OQVwwy6wIaUTHv07ouKbeoq4BmfZYEuhTxEqGPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VKwHQD3k; arc=fail smtp.client-ip=52.101.83.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=df1IAUwlT6hEwU133hXkFbxTc1ayimNrBCVWDip6eRl8T7iQ20VS18s+XLCOFvDELGKXyn5xs5+erxcTGW1JG/+LrmmIYu3wTsWqehg038Be1+mcylLnCHTZWfMO+82k9+hhRR+h/mrVjrmdxZ+G5p6Y4VK6wPQQQSi8qGtorviAxbdP3k8UCmiJF4btbgWTvLJiXEfo6qfNCFhkSTcwrn9C/iQsQv3VXV+tiVteGUCIClnBYQp+7AwmCfc765pKPEMZjVl0CYLS/MRXQWuf+bdPeaczAdpRezIufRMyb1OIiJtn+Qrc61vDBFI+TV3Om1Nu0xyNoBXkq6v1oBRiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrY1vC629cDqdzPFpOwsItfoYUOhl4JR4U7eVl2MbKM=;
 b=W6wc5BMH66eJ8mBEHZIBQiuxeZ8Na9okN49d82opyzbeyFEhqc+ENIqT9EYGJYK25qYU+D8i5zVtoHWOxAn3wd7gC1oVuDpN3rOqeQENvl9Pr2NzimHfJp1DjpV5PgNYlF+anSsfy4IqtnbqxIzNMr4NNTgNTYgn8PtyUqoigZm0BHh3NNiG++Tge/GYTD/qY6c25y4SoJTRDWqP0vqBQjjqmpF3+FhSIm0enQ/GDRtianpuTHoQnZjozlkh6JTXTAEzkXZpqlR48d5uE2BpM0VCQ9D4IBbR7kfZYAZOc8ZXQWSFFF/11fG5Gh9zZZAfc7PN5QMd4c6ndCLb3EndYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrY1vC629cDqdzPFpOwsItfoYUOhl4JR4U7eVl2MbKM=;
 b=VKwHQD3kDN2RR/OXta6JKX4y3KfzG+2B2aM90QqNBKyg/VtdwHDtna9XblNBiT1yh0StjvNVNCwQEn+uuOjcajoFzDiFasuVbjRWmANhWWoeKob0JRXneNiqZSzAo4B2Ltq3jjf8GQmD13LSmGUtR0QCw62WHIazybhbsJ+fYBHSy3vurw13l12u0PC0Osh6bcdXlXPtjGRBAfsAcXSobpersG1lMHEJAv80LRMI6sWT9pJbeMIv27C365dbbBB0D1fQ7BjfjF5jrYE+ftqPaigdgKDUxMwaccAcBd9OE3hKFqU8KcAoUDqbkZmjhdtje2oVhrn9K0JvHvQ98QFC9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM7PR04MB6904.eurprd04.prod.outlook.com (2603:10a6:20b:106::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 09:19:55 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 09:19:55 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH v3 3/3] media: imx8mq-mipi-csi2: Implement .get_frame_desc subdev callback
Date: Tue, 12 Aug 2025 17:18:57 +0800
Message-Id: <20250812091856.1036170-4-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812091856.1036170-1-guoniu.zhou@oss.nxp.com>
References: <20250812091856.1036170-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM7PR04MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: f34c801a-9d9c-4b71-58e7-08ddd98166d9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MHZBUDkrR1lmYjlBbzA1R3puY3BiT0JqbVQ4ZEQyNkJ3UHh4ZWR0dEM2aGxh?=
 =?utf-8?B?MENubjB1REFaemVHQmJOeGo5bEVMTDR4VEpmdHdOTFgweFh1Zm9NajZoUjB3?=
 =?utf-8?B?NHhLOHN1NVpqaXFWbVU1R2tKMTFpQmpteDVHTHlralFPY1FNTTdxYmxFQUp2?=
 =?utf-8?B?ZHlyN2l6MmYreFdRU2FVSE9jc1htWXU0OGpYeEs2NEpRNk9vMVpHZzJ5MDMr?=
 =?utf-8?B?RFM5OUprM1ZIRmFxR2dRcHp1UDIyTkxmZ3BYVk1BSlZGaXJicnJSQUlKMzB2?=
 =?utf-8?B?OHIzWUdBV2FlcGlTNEJEaDJLcFFpb0FXenJaSWRWN2dJbHgyVG5aaWJwRDF3?=
 =?utf-8?B?cDNKWHNFcUdoaFExdk1YKzFjdnJIN1prTERGZml4NjZIR0hQYmU3cmVKYnR2?=
 =?utf-8?B?TWpubHRZY3BYVXQxYmV3S0dWek1CckhGZ29FNWk2UC9BMlIwbmVKYUo4ZkUy?=
 =?utf-8?B?eUw3bjBiV2R5TnVNSnJmMVYrazRWSTByS1pPdy9Fd2lvamJ1WTJsNDN6UnZU?=
 =?utf-8?B?UVR0RVpBQUNGeVFOR2pIajhLVlRIamZWM0VYVnlwK0d3VFU4M295RDF0ZFRD?=
 =?utf-8?B?TmI3WnVMa2VNRFJGNFU1d0VmY3ZQZ3JJbWRDcVdUem5Cd1JCWjVyMEM1VWlZ?=
 =?utf-8?B?Y0lNSnFyLzJGOHlTV1FDUmN3VHdCTjFIdFF4Q3BhVUZmVU5SU3BYZE94Vkhz?=
 =?utf-8?B?RVFRWkdNVVZlcjdhL1ByWXpoT3dtUDR4aGM4Zi9TeVl6RlY2QTVTWjJkbkN1?=
 =?utf-8?B?Sm1QMG15UnZmOVhRaHJRNW0vRFpIanYxZUJqZmNxeDE5cWFTRFVkZWpGSlll?=
 =?utf-8?B?OXRNQjJLZUQ4RE8ycWQ2NjREN2NRWEg2dW1PRFhXN2RQdDQ5U2J3eFFjSlh0?=
 =?utf-8?B?MTR6VU96bkoyOVRLRjlTTlYzeE5uMEZmOEpuVENKRVFmL1FMd0pxd0NZZ0Mw?=
 =?utf-8?B?N2JXZ05EcUU1aGV5K2FhRndxblNvMjdmM0UrRG4zVjdjYi81bXRxSURLSWdW?=
 =?utf-8?B?YnVDbHhKSmlGT0FRTDhwcGluT2s5NzdQN2lBNzhDcW9qNklPbDZFeVNHZm5y?=
 =?utf-8?B?SDJpY0J6Tkk3d1lob0VPSGlvc0w4WjJCeTljUDRQM3Y3dzNrNFR0NWpJWGd2?=
 =?utf-8?B?bzVncFZLOFBXYnRIaGpUcS9PZ1puN1RQNmtmcGxibU9EbW5ZRHorbUZCZEhv?=
 =?utf-8?B?S2FPZ2hFYkFkT29OMnA1OE45bkJrUEtYV2pFbEZzRnVmOXkydk8vRk83Lzc1?=
 =?utf-8?B?NlNOSjNQTDdBOURzbG45L2dHZXNLQmhXeTBLZE1LSHg0MGZsMmNuVzgvNDhQ?=
 =?utf-8?B?dTYvV3k5RVF3bnlnaVZ1NmhiSmhnNjZkSVhwUlVlL2FjUEpCd3ArWmhtTWRS?=
 =?utf-8?B?L2xJQVpJQ2JieGFlcEdjOXFjWEtqaXljSFpFK1VnMnN0bDI5N2kxNlUvU3c1?=
 =?utf-8?B?SVE5YkVKVW9BY1lvNmVQTzVNdmRhNG5pZW16bjlsa2FWaU5pZTFGanN4ZVNy?=
 =?utf-8?B?RHU3UDRUSWsvTkxhcEtVTzFtdE45Z25HMHVDRzYrb1JIMWdlYTIrbTdzeUox?=
 =?utf-8?B?TXJ5dm5xQTQ0NHdkNE9oYlNtNGgxdmd4NUVxNDZsN2ttSlZ4ZFBxa0hVOXhJ?=
 =?utf-8?B?SlNkR0ZzN2xXSEpTWmEwcDNINENjVFRSWkNrdXBEVHhYRk9uang2dWtxS1Rt?=
 =?utf-8?B?SjIxQXJLUEUxaU5icWxBMW9vSGNPTUNyeGdKMStLMXgzWFlSbk92VHN4Y25n?=
 =?utf-8?B?eCtEZEJSTEtYWTZ0ZDBGT1RsaFA4V0ZEbGZoUjZNNkQ0NjFCZjR6V1pvZVZv?=
 =?utf-8?B?N0poeC9BODM4UjBuWW9JcTM5UTdHWGR4ZkV6M1pSNndXNDVkc2k4ZjNsc0tH?=
 =?utf-8?B?VjgyeW8waWk2N1FUMTA1V2R6OVd0MlplcWdLemlJd09xSlhOQVB1TDlGd2RF?=
 =?utf-8?B?NGt4eXUwYWRmQko1YzdZWDVSQjBmenhYSjhMMytMSC9DMGlwTHlKTmtLUTBC?=
 =?utf-8?B?b1hxRGdERHlnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Nzdja0tsdjBaZVBzQTdtOHV3aGlkbDlBSllUYTZkQmJFZXlUZ0JkTk4rNkVY?=
 =?utf-8?B?a05uVmVVaHBjT1pSU1VYdTFqWjByNFl0dDQzbkRad1Q0Nnl5endLZ2F3SW5E?=
 =?utf-8?B?Z3ZNNDkxQlBCR0RETjVqYWJ3R25DU1FwTE9TeUpiMXNZblh2RDBkVlJCY2pk?=
 =?utf-8?B?L3RQcHROdnV0Y1AzTDl6dWRHVm9kN0JpRWxyOHJDWVk5VDFUZmNXWHRpUDkw?=
 =?utf-8?B?Z2pNMTZiQXJTZXo3MnhrcW1uQW5saHpWRWo5SDN5cGtTRkJaSVBsdkNpNGRJ?=
 =?utf-8?B?MTcxcFl4bkpKVHJxN1FKb2ZkUzBESXQ2cnBLcmFpT09XUDZIdTNkZnJMRzhk?=
 =?utf-8?B?SnhUdkZORnlFbHZjTDJJTEVxdHM4QnRISXBLWmRoZ2M3a1ljQmxCZHdnYmtv?=
 =?utf-8?B?c01QS2JUNWNiT002aWk5b0c0K1VsN0JCZitaMWdlQzJ3UFIycE1FaUo5U0JQ?=
 =?utf-8?B?RHNrNytTWklQUGZTZzhYTTdUK2RUclEyVlc0d0NyaGVNMG5FRnA1Z0M5RWt1?=
 =?utf-8?B?TFI1clpMMFRVYnVFUlY3VWloZFk3bSt3ZW8vdVRuK2R4WTRNcCtNblRaamVB?=
 =?utf-8?B?VVlUWEU2dFpBUUZJYU45YmZERDJuZmpXbVowUjE3cnlWWVhQTlJmY28rWkJi?=
 =?utf-8?B?WmZjdU5ST2MxVDJ1OHE5eTFGb2tXQXZ6R3ZDTGc4N2cyWU93Ri85eXgyUklj?=
 =?utf-8?B?T2g5WElsMDV0eCtmWWY3NC8xMTRRampDcndtb2FRcWxvZmV0L2hhUWNIQ1lD?=
 =?utf-8?B?clVyKzlDR21DL2tQVE9jWEpVcld6TjBkTTFlcEFpSjJnVWN1WDFIRGRCVmd4?=
 =?utf-8?B?RlByUE9oYy84aXNKNXUyVGN4VHdnd3U1eEJjTVJONlZSMzZPQnQ1WkhZSUFP?=
 =?utf-8?B?Z1JmMzFQQUJFYmxVMDQxZVpnRTJUbVIrNUx0UzhTeGhYUEdFbWw0RXNxV010?=
 =?utf-8?B?S2NsR3ZpMllOT1hDY0k2OVBtYVV2THM1cHNIY1I1OEh6eGZWNTZpWVVoT0hl?=
 =?utf-8?B?YU8xYUc1bzhTb1dUUXkzb25RQVBtM0MvV25kTHNSZDF0VVpCR0V0Z1FYOXNE?=
 =?utf-8?B?SnN4L2NlT0VmeXYrT3l1VEh6bnkweXlYeCttSnd0RWdsWXhSaTZaUlY1UGpn?=
 =?utf-8?B?eER0eExDR0xrY0Q3ODhwMm5sdXEyVUxTQk0yeEg1dkFEK3JreW5WR0NjK3U2?=
 =?utf-8?B?STQ2Y0tIdURaSHA5T1EzbnpKWE95bGRsUHEwZGNyZmtreU1rM2ZmNTVUb0Zz?=
 =?utf-8?B?OVB2K0pjSXcvR28wQ0g5bTJXNFh2Ukd5NzFqRzdMdVphM3VUc2RoNzMxNk0r?=
 =?utf-8?B?ZXcrRXE3U2plV3VYUG8xYkJwVm5PL2lPa3lNVk0vVlFRSlhLSnJtUE9wMWhl?=
 =?utf-8?B?UEs4VXREeGkxZTZ3YjZqRzJjZjVUZG9UY01EQnUwbWNKWHJ4NVpzRlV6YWRV?=
 =?utf-8?B?OERHWi9ER1cybFBQQzFxaG9wR05Xd3JsOHBwZkpSSkg2U0hVd0swWnZNNFpF?=
 =?utf-8?B?WTVUb1RSTkdudnRscDNyK3R6MWRJanhia2hCa0tyZkZSTTA3eCt5ZGhxSTNo?=
 =?utf-8?B?clpmSUFVYWFXK3JVZ1JFZXhFZytQOE5OMFpyeml3QURTR3dubXVLV3p6SVNJ?=
 =?utf-8?B?NURjaGQ4amRMQWNqTGQ4WGF3d2d4dHNLVVp4Z0h4REZqNDFpTXBjYjVmQ3Ax?=
 =?utf-8?B?YmluaGl6VFVPNlpkUG1UcUEwQTNRWm92RXh4SFJBSDFaMjkwMnF0bW5Rd1FC?=
 =?utf-8?B?ZGNDdzI1c2NJbzVVR3NnQVZjUWtvMk9DNjRoZzkzbFRiVjJrUC81Y0ViT2Fm?=
 =?utf-8?B?WEpEMjc3ZGcvdVgrdkkvSUxzcXE2UTFnUVI0VGtmSUhXTWw0cUJCTU9sdmN1?=
 =?utf-8?B?TDF4UGNWNy9TRmtOaWd4TjZDTmliUysxZnJxK0x5dUZPb0VvdXBBRFVRdDdi?=
 =?utf-8?B?dlV2Mys2VU8wT2pzNlRVUmZiU0FUL0RyUHQwTjI1V015N2xnWC82WjV4MXU0?=
 =?utf-8?B?K0Vja09vQUlKOUtUMFU3RUNZVU1wRG1KTjlYdGhNL0xjb2pCMG00dHFRNlBJ?=
 =?utf-8?B?M0k0b2NwaHFGakpUTmRhWHVVRi9ielppL3ZkeDk3R2Y3anVmd0FLZDVVMWdS?=
 =?utf-8?B?b0J6bG5sU2pHdDFuY1V0NFlML2FtSCs5SGhqL3NaQzZOKzEwUnNBZXcwNG9t?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34c801a-9d9c-4b71-58e7-08ddd98166d9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:19:55.8485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stRzk3YlQns5HjITB+ruA7J7UpHAWV+i6up6v44H2PwZZlhitunXSX1MvDKYeqLKcaQUUphNnZaZ/pP7FTgYWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6904

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Implement .get_frame_desc subdev callback since downstream subdev
need to get frame description.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3de9007ad122..ed6578f7f0f9 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -689,6 +689,37 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx8mq_mipi_csi_get_frame_desc(struct v4l2_subdev *sd,
+					  unsigned int pad,
+					  struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
+	const struct csi2_pix_format *csi2_fmt;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (pad != MIPI_CSI2_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SOURCE);
+	csi2_fmt = find_csi2_format(fmt->code);
+	v4l2_subdev_unlock_state(state);
+
+	if (!csi2_fmt)
+		return -EPIPE;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	entry->flags = 0;
+	entry->pixelcode = csi2_fmt->code;
+	entry->bus.csi2.vc = 0;
+	entry->bus.csi2.dt = csi2_fmt->data_type;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx8mq_mipi_csi_video_ops = {
 	.s_stream	= imx8mq_mipi_csi_s_stream,
 };
@@ -697,6 +728,7 @@ static const struct v4l2_subdev_pad_ops imx8mq_mipi_csi_pad_ops = {
 	.enum_mbus_code		= imx8mq_mipi_csi_enum_mbus_code,
 	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= imx8mq_mipi_csi_set_fmt,
+	.get_frame_desc		= imx8mq_mipi_csi_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops imx8mq_mipi_csi_subdev_ops = {
-- 
2.34.1


