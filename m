Return-Path: <linux-media+bounces-63276-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDwqCTKgHWqncgkAu9opvQ
	(envelope-from <linux-media+bounces-63276-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:07:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E8621599
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 562F430580AE
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF4C3CFF53;
	Mon,  1 Jun 2026 15:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="O4nLLmW2"
X-Original-To: linux-media@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012065.outbound.protection.outlook.com [52.103.72.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF833BF676;
	Mon,  1 Jun 2026 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326004; cv=fail; b=iFoZn0A5vFLsoP7UiIfu6ACsDz3WGjlRlChgt1/9NbdPm4PkyhzsXU4WnL9VQwBtTriOtYXbyYOBd7sr+z14Bd+THwcvLiiBiWht4TYQAl+Il7AIDqlzKsKuKuyqPnB085Zk98PJ2KImL5f2rVDIywssL15rXpOOKTuyDi4n0Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326004; c=relaxed/simple;
	bh=lscNdUHlvWxe9PiUaivLcAYaaN0ecTCGXnukd5FrxT0=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=SP/N6uaTDnqun/pmRW/8u6rUQI23CO7HHOq0r02UI+/LjZsXyql9vheqzuQyFZL8ngjZg423F2aliLvaKyPl+jLYH/QY9C8JqudypGI8ZIrAQm9708Ibs8BQ6HEkFqtdXwN2ZCAGELZ2t+1xuJqSSBS0Mu61kN+d1bwkukJSbes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=O4nLLmW2; arc=fail smtp.client-ip=52.103.72.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojYtuXFhM3iboCnPahp3i1Z/toUZWzckGjxoRn9LZHFOBtFb6SbdD1ht+Z81lc4iMYqoePvwZlVqVpqxSPmg/McJSBrYh9fKOQoPMD1PofS59OC5W75WOi1f4YWYvFnS9C/QqK0jbYlmWG3wSSPjXYwulPqRNMA2xFrdix5Pa00lUtZbJ3efmN1MopH0z45Opuu2ylQ/1qebqBtLJkMDKvOJ7KMUEnLSCXo5tpTsHntvZIK613Yu8jpu/SX0tbEHHFk0JDRJEGas1rXTDpBoMXw9ydantH/zF+D9GBodFuVq+RWHuwBZtu09jKOOo4VmK5Siie9/6f6UHexefzxjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQyR2t3vwiJ1G9Mk2Sxa6dt1MO6vuoyDzW5JyifEGFE=;
 b=WgS1XT+rUteg/IIiUsRIGNbLARNOa4It/uDqB3zHZpWEHQkipoTAUWRPu/HAdsKwk9quG0tKlmkOq147qDMqcBQjnouxSlaPrHCwCncIvg3vrOpeP/P5oI2gys+ccPyIATUDYUz3Dzi4LEcGWlhvmj0gw7o3Uq1SMCzR6uPlSeS8vEab08aG++lRWFgSe/0WR+ne8yMLdRSoJdAB4/gCqmkTlhE+0PaetmQld5UUAMP3B/7z1Qod7o5c55Wca+w5A1Zu0w1ZcK8s0NEoYBgmC9/hO9Tu2S/sMgveOPhGY4p4LG9LeXfPD6kJwH+rOb5tLPtG9KHHd9YzcBySEhxxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQyR2t3vwiJ1G9Mk2Sxa6dt1MO6vuoyDzW5JyifEGFE=;
 b=O4nLLmW2a1I5LY3yiX/+eCNpCOqgzj+H9lRZfz/8QngwyZEfF7Kppye4mR4CdAUx3h16t+Kc9ggcefbf14hnHomjp2p75EiKR4WETEzKN3jRJB1otAm2cfGPK9K9AHfZXfc+bXBPGnFOhCkoHNrDZAjq4YEmPzr4RYUSpbBl/O8FYp0gxS4v1LJM4K1vchLIEaPVKGTjo8+EouNJYNAj0/UZ94kYXPiLas8bcOuOTlaDSdm+7ImrGqXaO5EQ4X38KW9po+HGgPzWRn98OufK0HXJcLGDRee83oanxI2Unjr49o7z3RG4beUsGJ/ekjGc3he3UlXvtGMGl8/iExm8mg==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by SY4PR01MB7875.ausprd01.prod.outlook.com (2603:10c6:10:1b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 14:59:57 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 14:59:56 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Mon, 01 Jun 2026 22:57:18 +0800
Subject: [PATCH] media: vicodec: fix out-of-bounds write in FWHT encoder
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <SYBPR01MB7881C44480F77338B6A93C61AF152@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIAM2dHWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwND3bTMitRiXXMTQ7OUlERD4+S0FCWg2oKiVLAEUGl0bG0tAIYvJCh
 XAAAA
X-Change-ID: 20260601-fixes-7416dda13cfd
To: Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org, 
 Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=lscNdUHlvWxe9PiUaivLcAYaaN0ecTCGXnukd5FrxT0=;
 b=owJ4nJvAy8zAJVb4wiKgu++DA+NptSSGLNm5ZxM4LthzBl7YfO2G65tqJWZ+rtt/lzmef3ui9
 fr6yXYbUu93lLIwiHExyIopshwvuPTNwneL7hafLckwc1iZQIYwcHEKwEQUVjMyNC6V2ZL90VJc
 aaO2UgvPxtbjOt4RFWH1Tz7xLVwtF7jpJcMf/gipgpoZH52Xltc/z/dlzEiT3H5JM0SuYQV/1q2
 8nXkMAM6+SZM=
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-ClientProxiedBy: TPYP295CA0060.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::19) To SYBPR01MB7881.ausprd01.prod.outlook.com
 (2603:10c6:10:1b0::5)
X-Microsoft-Original-Message-ID:
 <20260601-fixes-v1-1-20d4506d12d3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|SY4PR01MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cdea260-270a-4fe3-4404-08debfee71c2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|55001999006|13031999006|8060799015|19110799012|24021099003|22091999003|24121999003|51005399006|5072599009|6090799003|23021999003|5062599005|15080799012|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVVQVXpYTDE4KzNtRE5HbFR2ZlFlY3VjNUxGMFdRQzZVdjgrVCtmODFvNWE4?=
 =?utf-8?B?emJweXNrY3MwTjlKNFhTcVpMeXFBbVo3TFFheFoxYU5sYlY0alJYV2pnV2th?=
 =?utf-8?B?UEk1VEdYUkVyYVBpYkFTNmFLZkwyY081NEEyL01FQTFMNmlocmRkamFEVENi?=
 =?utf-8?B?TzFpcmpKKzN1aDVNdXU3dkxveHBxOUVZMUJRTkdBNjJpWFRjWlZVSHo4ZEl0?=
 =?utf-8?B?Vk1iN245cW1NK0drSlprNnFkc3lDdmdHYmZWd2hwenZnblFUR0tQRHlxc2Ir?=
 =?utf-8?B?Tm1Ua2tGa0JoQSsrNVpQRlV2U3JDM0tuQUJGb0dJcE10UkF6M29QbG5YSERW?=
 =?utf-8?B?b1JsWEhuRC8xdG1Fc2crOWhDWTh0MTIzb0JpN2N6N2R1VzFOcEUxeGZoTGlR?=
 =?utf-8?B?NmdjWjVOYk0xd1RiTUpUL1NMTWQza20rL05nNzgwTFF6SWpJYUtKeTRwY2xU?=
 =?utf-8?B?eDE3a2NKbDRIR1kvSFJLa0gxamVvN2drNCt6WFhaaHFzTTJrRkliclFPa2Fn?=
 =?utf-8?B?OEdZaEV4Q3FuZGxSMmxsdURGelM3NEl5L3QzOUhYQld2NG11RU0wOTBLMFpT?=
 =?utf-8?B?eElZdGJXMW1LMWdKckNlMEVXWDRyNzNobTBTRHRaNDhlRWV5Yy94VGlxZThR?=
 =?utf-8?B?SlFSVmlwS1dod1EySWxYb1FkTE5wb29vcERNbU0vc1U1c2pubzU3YXpkcy9r?=
 =?utf-8?B?eDZOMXVJZzBjZjhGN1c4cmtMZ2t4Z1ZOQWRwN0t4NldqbmpmN1psVTFpVE9I?=
 =?utf-8?B?VWNKb3VNWm9mZGQ1OWh4bzcxci80N3IveVRnbTFBRWEySk13MUNoRnZiV2h2?=
 =?utf-8?B?VFMyeWxxQ0ZSc2tySVl3T3dXMmRLOEd3MWZuV0NwVlUyWkJjelFXcHYyK0l3?=
 =?utf-8?B?ZzBzL2pmT0x3QWtyeDNydXpJcjhhU2VDQjhNWjNLcDh4WDl2aG9Kck1iZ3d1?=
 =?utf-8?B?NEpqQk95SVgzYlBSKytpMGltcytObnAzSmRranJNbUUzaFkxNFB0Zm5ZZUsv?=
 =?utf-8?B?TVk0K2pwYjhGT1pqWDBmMFN1ejVtK3d0NEpHeUpFdXh1T00yeW1Da2dlRXBw?=
 =?utf-8?B?UU1PcDR0MU8wa1J0aWg2S3dqdjVlY3NtTHhvd0pFM1dlR1pqYVRKbWJKYXdL?=
 =?utf-8?B?T2RmSnZ0WXZWVlBSMkNubllKWkhlcGNjNm4zZEljZHpFSXphVWxiS2FPKzd5?=
 =?utf-8?B?ZUNKZDNQRUNzdEt6YzVFS1h3L3Rxb09GNzhwbWlBQndaRThuREp0K0h2cEtT?=
 =?utf-8?B?RTMwRnhJMU1UNG9TbDB4UWluUTlEZUxvallaQlFUQTJOVjBlZVJ4L0JLbGdX?=
 =?utf-8?B?NmdScjdOcXVCWFFzQmowdnlvUHU3aVlEOTRKOW1iQ1NaK2daRmpMcFJyNTd2?=
 =?utf-8?B?ZmQvV0wxUlhWNENOZ0RwTzNjVHhrakE5SnBXTU0vRElqL0FEMTRncGNmU1cv?=
 =?utf-8?B?eitaQktBSGR5YTZyT2ZkcUNKOXlZeHl5aEY2a3VTNS9raWhKejMxd0xwVE5B?=
 =?utf-8?B?VlVLZTVCRFZhRlAvUDZxUTcvc1d4QWFWMmdKMEZPdzJiVDZvczhyWHdINER1?=
 =?utf-8?B?Um0vdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SExPKzhqNHFtS1QwN0c5VmluTURSY0RPbUNpV3NVZks5OHdoZ3JXcXJGN1hL?=
 =?utf-8?B?QURFUXliQ0FVVlZhaGxUVXl3ZWFlenl5WkxCRlpjN01rRG1WTC9pRDdlbnV2?=
 =?utf-8?B?SDdNam9WaWRsMUlXUFZKaEdxRW9mTStiUkoyeDRkdmlrQjNtNXo0bExoc3JI?=
 =?utf-8?B?cmlYR0trMUFJbWdSYmZ0ckJ5eFFybFA0RmdzMHR6STZIc3NQcFMyZ1JkQXor?=
 =?utf-8?B?S0ZmbXVya1U3QnpDT0pnZHN1ZC9EbXI3VlRyOHN1dGhiT3o4Y0t3MzY1Ulpl?=
 =?utf-8?B?Sk85NXZNOHlBMm5VVkY4VkZhdUlYZlJlNURVQzEvSVI4WUIwWjk5bnpwdnRv?=
 =?utf-8?B?djF1aDFhbmhDUmFRRDkzZDhVZEV4Ym5IQjZ2OFhzWmRVRkRZNjdpaEFHK1pR?=
 =?utf-8?B?elN2NVRYM0hlTzk0bEU0VXRlNzZWTW55QlAyd2p5SWhQRGFMTWhvbWV0Ry9v?=
 =?utf-8?B?MWlkM1BibEhlcEdvTHRGS2FwREdqb3doNVZ1WUFQRHE5d1B5aGpML2V3WHF4?=
 =?utf-8?B?K3B0ajZQSVlJVGhTOHd1RzhZNEN3TldScVUyUHBDZXc2alJoTkV4ZlhrbHVW?=
 =?utf-8?B?ejZFNms1eFMzRzlQdm94b3hpa0N6MnlNZC9Td01scEhoN0xWUE5oNmJYR1My?=
 =?utf-8?B?TlZ0R2NISDN6MW9heGJUZm1VN256YUhaOVZNSjFsS3RPWW5Qd1lKdEZCRDRt?=
 =?utf-8?B?VnpkSFg4Wi9EcmVmZkxON2NHTWczZ2tqMDhMNFp3cThSRzM3cWVRdXNiUE5C?=
 =?utf-8?B?NklpazdWUzNBazRTSExkU3ZnQndUeWVBYm14a2NsUXE4cXdZeTlrNGVqcG9o?=
 =?utf-8?B?Z3ZlM3JRczFlbFlYUnUwTWJ6V09Pd2dZWDhYMXQyanREWTd5Q2RIeHhWaGYr?=
 =?utf-8?B?REhmRTdBNmlIV0tSMENMRFFQZVAzQ2hjRFpFekpGSmxyVUFKYXFRRVFmYXJu?=
 =?utf-8?B?UnVidkxHaU5RNUtOMFdBSUVhNkswaE5raGJEMGlQbDNqeTV2ZmxUNmMzcFdl?=
 =?utf-8?B?eldRT1VsRjQrSmFHSWw0TDYyU1RmTkZRUUpablhLQjdCekVlME9XNmt2TWY0?=
 =?utf-8?B?emVJSjdjVVFyK0FZcHVOWVhOU2orcjFVU0ZrbDh1OGFIcDhsZTdLYWFMK1lZ?=
 =?utf-8?B?ajAxdFE0KzRFNXBNSGg2TkF0WG04VTFkbTVvWXdYeWFURTYxUVJXbjkreDd3?=
 =?utf-8?B?Qm43Z0xwZ1o5dHkyZDE4aGt5OHdzQUFQUGFnSGlQdUJ2d3FRUFA5T1o5d1p0?=
 =?utf-8?B?SnhaeHhaZzVPUjFFazB0V0NjSkFWZVJ5OE5FY2QwTU1QcElTaE1hSm9jcFBs?=
 =?utf-8?B?clR2V0JOdldVUWd1Z1FRUURWNzVGRHo2eTYxVGJaR2I0eXlpdllwRFZZMnlj?=
 =?utf-8?B?QXhvaEtiNGt5TVZza1dYY1VhVnVicjBFdXp1cllYUWZXdDBOQmNkdmZGTHdy?=
 =?utf-8?B?cHVWTGN5eUcwaURKWkJRR3RvSkNkakJhNkl4SStqTnc4QzJrUG9nVDlqSncr?=
 =?utf-8?B?QW92dS9HOEthZWtwNVVuUDcyTHF1N2Q0Q24weXIrNEFudlZoM0JpZmNiQlB1?=
 =?utf-8?B?aWJBaUpPZVdQYUE1Ty9CalpHMmsrVW9oeG5RaWpwQUdPamJJSVlWMjJQU2dq?=
 =?utf-8?B?a2lUT2FlQWxCTWNkbVh5TXFjS0xkNHlob0UrSkMyNGFXaVJaTklFMThsRWF4?=
 =?utf-8?B?WXlGbWlkdUcvc0c4YmptZnRERzl0YjdwUklML1BVR0Q2QWhONVV2cmxYQzg0?=
 =?utf-8?B?enUwSmlZMmhPTTZ5RkhDWUVJUUhJR2VMVUtQRjlpd2dVYlhKVlhNUlhvNkpV?=
 =?utf-8?B?d21sOVNubUF3c2pnNnlGU0M2N2xFVm90aFU5UkhTcjFpclMvbWZueWdNU01a?=
 =?utf-8?B?OHRONkQ2UUVIUUcyd0ZKczJxS3kzR3RhbEgyeVNtU2hTdFE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdea260-270a-4fe3-4404-08debfee71c2
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:59:56.8428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4PR01MB7875
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63276-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,outlook.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[moonafterrain@outlook.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	DBL_BLOCKED_OPENRESOLVER(0.00)[SYBPR01MB7881.ausprd01.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:email,outlook.com:dkim]
X-Rspamd-Queue-Id: B31E8621599
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

vidioc_s_fmt_vid_out() sizes the encoder CAPTURE buffer from the
compressed descriptor pixfmt_fwht, whose sizeimage_mult is 3:
coded_w * coded_h * 3 + sizeof(struct fwht_cframe_hdr). fwht_encode_frame()
encodes one plane per component, and an incompressible plane takes the
FWHT_FRAME_UNENCODED path in encode_plane(), copying the plane verbatim.

For a 4-component pixel format all four planes are full resolution
(width_div == height_div == 1), so a frame that forces every plane
through the unencoded fallback writes
sizeof(struct fwht_cframe_hdr) + 4 * coded_w * coded_h bytes, overrunning
the plane by coded_w * coded_h, which can result in corruption
of adjacent kernel heap memory.

Bump pixfmt_fwht.sizeimage_mult from 3 to 4, matching the largest
components_num among the supported raw formats, so the capture buffer is
always large enough for the unencoded fallback.

Fixes: 29a7a5e99080 ("media: vicodec: add support for more pixel formats")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 318e8330f16a..3ff2d06742c2 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -63,7 +63,7 @@ struct pixfmt_info {
 };
 
 static const struct v4l2_fwht_pixfmt_info pixfmt_fwht = {
-	V4L2_PIX_FMT_FWHT, 0, 3, 1, 1, 1, 1, 1, 0, 1
+	V4L2_PIX_FMT_FWHT, 0, 4, 1, 1, 1, 1, 1, 0, 1
 };
 
 static const struct v4l2_fwht_pixfmt_info pixfmt_stateless_fwht = {

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-fixes-7416dda13cfd

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>


