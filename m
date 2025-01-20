Return-Path: <linux-media+bounces-24916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B48CA164CE
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 02:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B82A188669C
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 01:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA85DBA50;
	Mon, 20 Jan 2025 01:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="mLSOcokV"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1801.securemx.jp [210.130.202.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C464417BA9;
	Mon, 20 Jan 2025 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737336129; cv=fail; b=r0rQ9byNu74bvqkg2VUz7QBnYBrKzm4mXnvR6hX55+Y9/7bJTmqMRkPX8KRC0aYbYOSnC7nS9JBy8scGrDN+myc5we0VEPObdrQhftumDmu3vsqIzPXQiQ88t0I7CNQTtZadMITBvKpmJWCaJDnerXCJwh6sYQ3NMK7IsoRanf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737336129; c=relaxed/simple;
	bh=4U4On4/qSmcZ2xupNM+McW7ajIm62C7sU0oU/FntsHQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PetbK41GJRuY3PeXKLJG0mXtxNM6mYvBOei7Zynyps9iQMPBQV964y3hPIIWw8uYwi/N+GLm/AVzLDNMEGt/SbR6Qbd7/GfoV8hhv5C3TezWdVAxB1mZ40XJ4+Q4URxP7LRWFcfgS5xcGD/98NaUoo2/o1wOvauCkfxxebwAoyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=mLSOcokV; arc=fail smtp.client-ip=210.130.202.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1801) id 50K0GSpm638084; Mon, 20 Jan 2025 09:16:28 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1737332145;x=1738541745;bh=4U4On4/qSmcZ2xupNM+McW7ajIm62C7sU0oU/Fn
	tsHQ=;b=mLSOcokV0mFGrh1IQkUj9+Zjm51E2l1919VC8XacvmlH5ebU6/ZfK3wRqGCWodG1ZojQH
	SKfBKhUr3Djgf72f2BlZaqwNfVSvd83A6HELY6kw72MLS/IolmCXGibrSBhtExJB7CXIFaInAWOjh
	spelmx2tvvFLyEkriJn0UQE79Ii0T2XODMq0MnUjg9J5/zV8TaEwFE+q8ftYhsiU+InL1irIFh6FL
	TtLCyGsMtN6ii+BDItQwJEHRi6K6CRz+9oTSFR+On4ul649PB4f3oQGmtkEBZkamt8MrnIk41N5vZ
	9fovaWQcugp5KeDFhpAOqaRtfqr+rbPb1PUi8u5N3g==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 50K0Fi0N2072956; Mon, 20 Jan 2025 09:15:45 +0900
X-Iguazu-Qid: 2yAbAvUQKm3pmuwKyw
X-Iguazu-QSIG: v=2; s=0; t=1737332144; q=2yAbAvUQKm3pmuwKyw; m=xZoba2SLL0+Zc07v1yD+nMw6AzaJ00fvKOv1dc3naS4=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1803) id 50K0FgKm1577841
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:15:42 +0900
X-SA-MID: 38086712
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5uaHufNARVsZErBR3WbmWZvpxXamEKOvdaaYzHq19a61J6V93PjG9/9PJBxuaLtiCplJjikmU/o36PZaKSuJqze4z12VSxQudZ7Ph8VkX0MnxDMjFd+wVOFBuXM/un1zKZx8kY3KiswqcMMB4iWwjgR6AfpzvwRj9o/lK8s4SEhEuXgFWIDPsuB6kEsKGL/Ql0+5rUqGST9VwMCejHKWqdOlJq1FtA4UDRqQkosuAWW0/66UeIH5gvIDM/6cW+dOnYQZdW6m7pMwGIKCelCNgkY/UTP0wjUeLff/mElTQ2vac2mrA1Wf6hurpdqKjDQxrDWHgzkcdABH9viYP50cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4U4On4/qSmcZ2xupNM+McW7ajIm62C7sU0oU/FntsHQ=;
 b=J05AE5y4EvJ+fRbb8zCQdZjxufrbIJi4ZXlur92BPStkoNlfYoOpqGRPgyFkOFwjY+hzx27wvqavwnEUBJ9uiM8WbKabXPL0q8hA+rEpKIx3ClRZOyOcdadFVmgOx/UodgTu5RheEH181dTE3eWLsJSFazI5106Sm63Hy6/QcIA3tjJtHsu5cGtTLFcBUS9Wwul4ubpbocMDUtpL44zeYVCBmfGtnzJOcdtqSJUqR/X9jTEp2BduxiQPfX1Sy9Yb3JC/BsSA45aTDvz5Un7Rkj1m3Qbf+/Fe1DsH9cwZanC3raKoxknxbZWXt6Y6/bGX4WSkiyXrQYL1LXi+oxJy/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <laurent.pinchart@ideasonboard.com>
CC: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <nobuhiro1.iwamatsu@toshiba.co.jp>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: RE: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Thread-Topic: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Thread-Index: AQHbPxt+FWsXAxpsxEuP88pN+FIWP7MDc2mAgButR2A=
Date: Mon, 20 Jan 2025 00:10:38 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TYWPR01MB9986315357E77AED05B3471192E72@TYWPR01MB9986.jpnprd01.prod.outlook.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>
 <20250102092925.GC554@pendragon.ideasonboard.com>
In-Reply-To: <20250102092925.GC554@pendragon.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB9986:EE_|TYTPR01MB11033:EE_
x-ms-office365-filtering-correlation-id: 3c89302f-8728-4369-c961-08dd38e6de9e
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YjRaZzdzUENFUmtUQmVFam5CamVuQ1lHdzBFV1BVbUcyenhtZTJvUXdpTXV2?=
 =?utf-8?B?aEFvT2FGajdpdWdiN05TbTdDOFJNNVdyc1FJWEU3NytzZ3RaeXBlVVhOSFBG?=
 =?utf-8?B?S040dmgwdXgxYW5oSFU0VW1BcEZuYkFGblRCVHpnVjJRampsYUZaWkYrMlNR?=
 =?utf-8?B?WFdZYUphcTAvRldyNDV2ektUeXMrQnIrQTE5Y0FmMFBlSkZKdmNpQ1kzTC9D?=
 =?utf-8?B?UmlnUFV5L2w5OUxrRXZKUkJHbVYwVEl2bzlxSU9LbUNIQjR2anZiSTAxU0p2?=
 =?utf-8?B?d2pyQzYwei9HakI1TVF5MmpHRUora3ZzVGJyemRob25UbzRtZG9PeEQ0Q25s?=
 =?utf-8?B?Mm9hZFJVN0pjTTQ0a2pDamt3bEhGSlI5WDV0Zk1vMk5lYlhFZ2NPVG01STdO?=
 =?utf-8?B?dGZSWWdtYnR6Mm9oWXV5K0g0ckdZNXZwaXJCeTlacjlER2w2djF2a01xQ0wv?=
 =?utf-8?B?SnlGUDIrRTVUblNYMjZYdHB6dUFLVkljNnlVSk8zenNSWUpNOWZSNTl5WEgz?=
 =?utf-8?B?TU1SKzUrcmM4QStYTTc3bHBXZGZTUWZKK2FnY2ZQTk5rSy9nNUQwNVNtdVA2?=
 =?utf-8?B?alNxZFlqYTJLOGhTZktqYUxsS3p1VU0wVUpmelVldWMrRmJHeitqajFhb1Zm?=
 =?utf-8?B?TGlDcGhUU2hsMEU3QnRMTVB1bUs4WHdDYXMyTzIrL21XbUtGQS82M3pyWXRF?=
 =?utf-8?B?NmFEWDBZTE1qdTU3bFV3MFVNYjVTR2s1bUNObTI3RmRuT21nR1FDNFhrdkJn?=
 =?utf-8?B?Z0Izekl1TWJIallBTXIrbEFRbDVja2dtcHpKcFh2ZmwxM0xwV3g5Yk03VXpL?=
 =?utf-8?B?Nis0bmtqUXNxYW9ZaEpNSG1HWHNINEZ4eG51Y2NpL0grbDZ5R2hwOHdBTGRS?=
 =?utf-8?B?U3ZndXh1a3lCeVRlKzBTSXU5TFlsdUhQOUlDampoQ0puNTZud2NmSDVpaWYx?=
 =?utf-8?B?WnFqd3hpTEhBZnN2ZXZBRHlmVkJLemY0R3BEU2FBSnZsT01ZU1J3SjFJbi9t?=
 =?utf-8?B?YkdMMHRIVUMvdHBCYVhWSS9xd1JOeFBHSzJNYy9jMlNSVUtvMmI4NDlOZGxh?=
 =?utf-8?B?ZW0zcmk5VGhyZkF3OFRjUkZqV0lNa3VYWldpdnE0WFVkc20xSGNvRXdPenhj?=
 =?utf-8?B?OUVCNUxIQUkzNmZzNnc1blBWb3Q2ei9tVjV6d2hQWVBXT2psUjFaNll0Ui9U?=
 =?utf-8?B?SFF0TjI3eEZxWjJZbU9CTkI1V3Q0cUYwMnpVeFlsSFhRakovbktvbEpCTDla?=
 =?utf-8?B?VjQyaWUvVisveWs5ekxDWkVicEE4ck5mNEs2YlZGSUhRbkk2bnBmRFFTbzRx?=
 =?utf-8?B?TFNLN3JCQmdwWVJoNlkreGVWZ1l0Mnp2UUoreXZUTHQ2T1dxTVlSWmkzb0hF?=
 =?utf-8?B?cnV2b09hWUlsZzJyOEpIQ0VmVXQ5WlNZRGZGTHpDOGQ4VjdWM2k5Ylp6OXUx?=
 =?utf-8?B?d3RKeVMvVlpkK05LYWh6VWxOayt5dUhnU3hoVk5oQ0xBQ2ttbldLdlE5M0U2?=
 =?utf-8?B?ampwbGNSakUxTlcrZXNXbG11WUJUK0dtMEZLaDgrRHJZTEsybm83YkZOVVBV?=
 =?utf-8?B?UWpKcXl1S2ZoR0VES1IxNWNNTlNDREdrOWsxZ3JpOE9uODBqS2lHYlFvRW1J?=
 =?utf-8?B?NXQxZmpSa1ZXcWhlZ2oyY1MrblRpNGVweXBla3hMWXRMUGRnZy9UU0JLazBh?=
 =?utf-8?B?Ym5IdExUczVzS1VhZ3pJNHB5V29VbWxFZzJzL3pPWnBCU2Z3MXhPdERYWnRv?=
 =?utf-8?B?YnVNbFRSUkE0ZjhXbTVDRCtLYzhaSk9RUFRSRmI5YXVuNm5sODBDRjdsQU5W?=
 =?utf-8?B?SE04TW5zQ04yd2tyZkk3aUtVOXc5S0dMdE1nNXJhSUhudUlBaVVGWWREMVJk?=
 =?utf-8?Q?snhQZ9nXjmsAH?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB9986.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QkdXa291WU5YSnpDQXNINWgvWlI2cXdOcExIMUUrQXZPa0I1OURkbUlDZ0s5?=
 =?utf-8?B?U3dkb09VRHhGZ3lCU2F0cGpjdStvcU5IK296czRueXBJS1JVdDVGWi9zeHFY?=
 =?utf-8?B?ZmZWR05UUC9VM25DNkNqdXRlUmsxcUZrWlFLdnhhanRJRTRuU2VMWTkvU1la?=
 =?utf-8?B?alFuL2hHb2NRZFRJYmVsaFNqcmxWTzJySC9GVllKMHV0Ny9aRmhONUtYaEVx?=
 =?utf-8?B?QWR4Q2R3TkhWcGxTcDhDaSsxODhlQVlkaEZ5bzRwQmx6ZDFwbW4yN2xHZm1C?=
 =?utf-8?B?UldpTWdhcGNCNG9UNGk4b05ubVVtM1VSV3UyT1JaNTdLSTVpY3dHL2xpaGE0?=
 =?utf-8?B?UWJBNmkxL3pEcG1IcFVxSTBMWFJ2d0lZbm5nNXdYVWx5c1U2TTJ0dTF2MnU0?=
 =?utf-8?B?eUlNejk0Y0c4SnlRMXV2QWlPN3VmeHRZS0RaL3dNdHZIVjRHZmwwQUNSY3kx?=
 =?utf-8?B?MURrL0VOUVJkcUlYeHVhOTM5K3YzbytxNGlKeVpNOXc2U2trZXk3TU1RaGp6?=
 =?utf-8?B?YU9Vc1gzQTNkRStJVFhYNWQ2elNiZXE2WUNIblM0U1hUaHNOdHBGa2l5NFJx?=
 =?utf-8?B?WFdvUE9SaThiUk93VXUyd2tPd2p4NitxTDJLSTIwVkRqYVBMeklPVzlBUU00?=
 =?utf-8?B?S0ZaSXFDdVZ5OVluUXY1VXpYcHJodkxRaldxSnlqWG5PMGNLUFdyZktHMElj?=
 =?utf-8?B?V0F6SUJvRXZIVzVQMzBXVzBPdW9ac3Q2NHh5UkU5M1pwa3l4NTJKZWNqNU1j?=
 =?utf-8?B?ZFNXdDJvUVdHS3hPcU0wZEVJRUVoQzdZVGcrQkY2QkluYmFXS0Mzbk14Q2lH?=
 =?utf-8?B?N0FEdDRoRWRRQjJZTHV2aWM0TzRzN2ZDbytWOEwyV2pONTRpVnEwaldDZTRI?=
 =?utf-8?B?QjBaektUWllsazhIMldqWEhDNWdYc3oxZExBaTJ1cVpRTVBHT09pSFZBU3hX?=
 =?utf-8?B?V3VJWXZBVlJYRlhnTmRUNDhIY1FLaTFwbVVXbnNRV3ROY1hvbURObDAzeG0w?=
 =?utf-8?B?TDRsbVRKVW4yNXptazM3bXJ0VWg0ek1rMDZ2UHFqUit4bDljM0pDNE9QanZk?=
 =?utf-8?B?V01iU3lFWWFPNTZ2dVVVR25mN1FaNGUyQzhIMkN6M0gxNzVwRDA3SWZLbXcy?=
 =?utf-8?B?eTN0a3FIQUx4cGRLWUNneERWNS9HY0xTeThnd1hUMkJtZjB5a3Fnb2R1V04x?=
 =?utf-8?B?bE5aM2R5RCtBanVtR0hSWTVpVVM1L0EwZUpvR2JzU05WVWwySnUyMndXY0w0?=
 =?utf-8?B?V1JBMlBtVGxhYk5MTnNzYzEwYzQ1NzFUU0xNS250SGYxR1hoM0pmZXJTejBP?=
 =?utf-8?B?dndJTHJKeWFlYW83UTc0d0QxSjFXMFRmeVJ3dTl3aEtyeVVrbFdJTERXT0pG?=
 =?utf-8?B?ZVhqOGNjTWJ1NmdNQnNjZm4yU0g3SWxGdHVXOTQzbHZOQ1ROVGowT3U2Nnpu?=
 =?utf-8?B?UHVEbkhHNTBERTVnbC9Oc3VBbXphcG1aQ3VVLysweEFwVWxyRDVPZGJ6NkJH?=
 =?utf-8?B?VmRhbWtZMy85R0JGYTRVWGdlRnpvUUtIM0dycDIxOFFFM3h6ZnJSekY1amky?=
 =?utf-8?B?ZEZXQy9odTdqYnI1WGpxbDFTa3hSeG4rV1FnZzF4NXlhMTJaNkhQQjJ1eFd4?=
 =?utf-8?B?aXV0R0dQNm9Pd3hwODNHS2N2bEhKOHlJdnVpWEtscFdtb1RKOWJmdnh4M3du?=
 =?utf-8?B?bWxLWmUrcTF0YmRIK2hWOWZoQU1TaysvNlplR211UW1aSzlJUmRxa0pGdnpR?=
 =?utf-8?B?ejdaN2ZscnBqSmdpYS94dzZKaUpvVVAxdDk1R2RjeVhpWWlDWnY5QkVUaXE3?=
 =?utf-8?B?TVBVT003M1JZMTBWRWZQc0c4OHpRSk41SEFlMy9LYXFtNGZtZXRzQ0Z3RnRx?=
 =?utf-8?B?aDBvOWw2ZzRtNlpIckVHaFZWNUttaHZCRVVCalg2cnA4aVE2eW1CU3pWVTB0?=
 =?utf-8?B?ZHpIbFlEbkhsLzlFdDUrWUF0Q0c5U3RQTDhidXo1aGlWSWlvNytNblc4akpo?=
 =?utf-8?B?NzBDZkZHWUNZNFRhSy9FNW45ZWRIZ2tqdzFFOWlKaGRtL01vK1pCd3loZVJz?=
 =?utf-8?B?a1BFZUNDK05JQVZldmFsWWl4Y1p0N0FXUWNwWWNsZFEvMmc0YkwrRldRSEZE?=
 =?utf-8?B?aGhXTEN6VWJBeDMvMnVBaWJKUEtSd2lRRmRhYkhIYzhETlY3T2NlVlcwRTZ2?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB9986.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c89302f-8728-4369-c961-08dd38e6de9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 00:10:38.4488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWIQDURv3x77ctTaAWqTuC5+N/cttsKQWDDdnyB57j0bGmqpboam7LYT79WUyM8Abi8iMmHveMiCSnIJOuNOSet9556Kf4qV6iNTHlE0CtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11033

SGVsbG8gTGF1cmVudA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IGNvbW1lbnRzLg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEphbnVh
cnkgMiwgMjAyNSA2OjI5IFBNDQo+IFRvOiBpc2hpa2F3YSB5dWppKOefs+W3nSDmgqDlj7gg4peL
77yy77yk77yj4pah77yh77yp77y077yj4peL77yl77yh6ZaLKQ0KPiA8eXVqaTIuaXNoaWthd2FA
dG9zaGliYS5jby5qcD4NCj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJu
ZWwub3JnPjsgUm9iIEhlcnJpbmcNCj4gPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleQ0KPiA8Y29ub3IrZHRAa2Vy
bmVsLm9yZz47IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT47IEhh
bnMNCj4gVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPjsgaXdhbWF0c3Ugbm9idWhp
cm8o5bKp5p2+IOS/oea0iyDil4vvvKTvvKnvvLTvvKMNCj4g4pah77yk77yp77y04peL77yv77yz
77y0KSA8bm9idWhpcm8xLml3YW1hdHN1QHRvc2hpYmEuY28uanA+Ow0KPiBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTIgMS84XSBkdC1iaW5kaW5nczogbWVkaWE6IHBsYXRm
b3JtOiB2aXNjb250aTogQWRkDQo+IFRvc2hpYmEgVmlzY29udGkgTUlQSSBDU0ktMiBSZWNlaXZl
cg0KPiANCj4gSGVsbG8gSXNoaWthd2Etc2FuLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0
Y2guDQo+IA0KPiBPbiBNb24sIE5vdiAyNSwgMjAyNCBhdCAwNjoyMTozOVBNICswOTAwLCBZdWpp
IElzaGlrYXdhIHdyb3RlOg0KPiA+IEFkZHMgdGhlIERldmljZSBUcmVlIGJpbmRpbmcgZG9jdW1l
bnRhdGlvbiB0aGF0IGFsbG93cyB0byBkZXNjcmliZSB0aGUNCj4gPiBNSVBJIENTSS0yIFJlY2Vp
dmVyIGZvdW5kIGluIFRvc2hpYmEgVmlzY29udGkgU29Dcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFl1amkgSXNoaWthd2EgPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanA+DQo+ID4gUmV2
aWV3ZWQtYnk6IE5vYnVoaXJvIEl3YW1hdHN1IDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGliYS5j
by5qcD4NCj4gPiAtLS0NCj4gPg0KPiA+IENoYW5nZWxvZyB2MTI6DQo+ID4gLSBOZXdseSBhZGQg
YmluZGluZ3MgZm9yIENTSTJSWCBkcml2ZXINCj4gPg0KPiA+ICAuLi4vbWVkaWEvdG9zaGliYSx2
aXNjb250aTUtY3NpMnJ4LnlhbWwgICAgICAgfCAxMDQNCj4gKysrKysrKysrKysrKysrKysrDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMDQgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdG9zaGli
YSx2aXNjb250aTUtY3NpMnJ4LnlhbWwNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS90b3NoaWJhLHZpc2NvbnRpNS1jc2ky
cngueWFtDQo+ID4gbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL3Rvc2hpYmEsdmlzY29udGk1LWNzaTJyeC55YW0NCj4gPiBsDQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU0ODgwNzJiYzgyYQ0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvdG9zaGliYSx2aXNjb250aTUtY3NpMnJ4DQo+ID4gKysrIC55YW1sDQo+ID4gQEAgLTAsMCAr
MSwxMDQgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOg0KPiA+ICtodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRpYS90b3NoaWJhLHZpc2NvbnRpNS1jc2kycngu
eWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogVG9zaGliYSBWaXNjb250aTUgU29DIE1JUEkg
Q1NJLTIgcmVjZWl2ZXINCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gTm9idWhp
cm8gSXdhbWF0c3UgPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpwPg0KPiA+ICsNCj4g
PiArZGVzY3JpcHRpb246IHwtDQo+IA0KPiBBcyBLcnp5c3p0b2YgbWVudGlvbmVkLCAnfC0nIGlz
bid0IG5lZWRlZC4gU2VlIGh0dHBzOi8veWFtbC1tdWx0aWxpbmUuaW5mby8gZm9yDQo+IG1vcmUg
aW5mb3JtYXRpb24uIFRoZSBsaXRlcmFsIGJsb2NrIHN0eWxlIGluZGljYXRvciAoJ3wnKSBpcyBv
bmx5IG5lZWRlZCB3aGVuIGxpbmUNCj4gYnJlYWtzIG5lZWQgdG8gYmUgcHJlc2VydmVkLCBlLmcu
IHdoZW4gdGhlIGRlc2NyaXB0aW9uIGNvbnRhaW5zIEFTQ0lJIGFydC4NCj4gDQoNCkknbGwgcmVt
b3ZlICJ8LSIuDQoNCj4gPiArICBUb3NoaWJhIFZpc2NvbnRpNSBTb0MgTUlQSSBDU0ktMiByZWNl
aXZlciBkZXZpY2UgcmVjZWl2ZXMgTUlQSQ0KPiA+ICsgQ1NJLTIgdmlkZW8gIHN0cmVhbS4gVXNl
IHdpdGggVklJRiBkZXZpY2UuIFQuQi5EDQo+IA0KPiBULkIuRCA/DQo+IA0KDQpUaGlzIHNob3Vs
ZCBoYXZlIGJlZW4gcmVtb3ZlZC4NCkknbGwgcmVtb3ZlIGl0Lg0KDQo+ID4gKw0KPiA+ICtwcm9w
ZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBjb25zdDogdG9zaGliYSx2aXNj
b250aTUtY3NpMnJ4DQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBSZWdpc3RlcnMgZm9yIENTSTIgcmVjZWl2ZXIgY29udHJvbA0K
PiA+ICsNCj4gPiArICBpbnRlcnJ1cHRzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IENTSTIgUmVjZWl2ZXIgSW50ZXJydXB0DQo+ID4gKw0KPiA+ICsgIHBvcnRz
Og0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0cw0K
PiA+ICsNCj4gPiArICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgIHBvcnRAMDoNCj4gPiArICAg
ICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy8kZGVmcy9wb3J0LWJhc2UNCj4gPiArICAg
ICAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKyAgICAgICAgZGVzY3JpcHRp
b246DQo+ID4gKyAgICAgICAgICBJbnB1dCBwb3J0IG5vZGUsIHNpbmdsZSBlbmRwb2ludCBkZXNj
cmliaW5nIHRoZSBDU0ktMg0KPiB0cmFuc21pdHRlci4NCj4gPiArDQo+ID4gKyAgICAgICAgcHJv
cGVydGllczoNCj4gPiArICAgICAgICAgIGVuZHBvaW50Og0KPiA+ICsgICAgICAgICAgICAkcmVm
OiB2aWRlby1pbnRlcmZhY2VzLnlhbWwjDQo+IA0KPiBQbGVhc2UgdXNlIGEgZnVsbCBwYXRoIGZv
ciB0aGUgcmVmOg0KPiANCj4gICAgICAgICAgICAgJHJlZjogL3NjaGVtYXMvbWVkaWEvdmlkZW8t
aW50ZXJmYWNlcy55YW1sIw0KPiANCg0KSSdsbCB1c2UgYSBmdWxsIHBhdGggZGVzY3JpcHRpb24N
Cg0KPiA+ICsgICAgICAgICAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0K
PiA+ICsgICAgICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgICAgICAgIGRhdGEtbGFu
ZXM6DQo+ID4gKyAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogQ1NJMiByZWNlaXZlciBzdXBw
b3J0cyAxLCAyLCAzIG9yIDQgZGF0YQ0KPiA+ICsgbGFuZXMNCj4gDQo+IFlvdSBjYW4gZHJvcCB0
aGUgZGVzY3JpcHRpb24uIFRoZSB2aWRlby1pbnRlcmZhY2VzLnlhbWwgc2NoZW1hIGhhcyBhIG1v
cmUNCj4gY29tcGxldGUgZGVzY3JpcHRpb24sIGFuZCB0aGUgZmFjdCB0aGF0IHRoZSByZWNlaXZl
ciBzdXBwb3J0cyBiZXR3ZWVuIDEgYW5kIDQNCj4gbGFuZXMgaXMgY29udmV5ZWQgYnkgbWluSXRl
bXMgYW5kIGl0ZW1zIGJlbG93Lg0KPiANCg0KSSdsbCBkcm9wIHRoZSBkZXNjcmlwdGlvbi4NCg0K
PiA+ICsgICAgICAgICAgICAgICAgbWluSXRlbXM6IDENCj4gPiArICAgICAgICAgICAgICAgIGl0
ZW1zOg0KPiA+ICsgICAgICAgICAgICAgICAgICAtIGNvbnN0OiAxDQo+ID4gKyAgICAgICAgICAg
ICAgICAgIC0gY29uc3Q6IDINCj4gPiArICAgICAgICAgICAgICAgICAgLSBjb25zdDogMw0KPiA+
ICsgICAgICAgICAgICAgICAgICAtIGNvbnN0OiA0DQo+ID4gKyAgICAgICAgICAgIHJlcXVpcmVk
Og0KPiA+ICsgICAgICAgICAgICAgIC0gZGF0YS1sYW5lcw0KPiA+ICsNCj4gPiArICAgICAgcG9y
dEAxOg0KPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMv
cG9ydA0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICAgICAgT3V0cHV0IHBv
cnQgbm9kZSwgc2luZ2xlIGVuZHBvaW50IGRlc2NyaWJpbmcgdGhlIFZpc2NvbnRpIFZJSUYuDQo+
ID4gKw0KPiA+ICsgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgIC0gcG9ydEAwDQo+ID4gKyAgICAg
IC0gcG9ydEAxDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4g
PiArICAtIHJlZw0KPiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsgIC0gcG9ydHMNCj4gPiArDQo+
ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+
ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRy
b2xsZXIvYXJtLWdpYy5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2lycS5oPg0KPiA+ICsNCj4gPiArICAgIHNvYyB7DQo+ID4gKyAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+
ID4gKw0KPiA+ICsgICAgICAgIGNzaTJyeEAxYzAwODAwMCB7DQo+IA0KPiBOb2RlIG5hbWVzIHNo
b3VsZCBkZXNjcmliZSB0aGUgZnVuY3Rpb24gb2YgdGhlIG5vZGUsIG5vdCB0aGUgcHJlY2lzZSBt
b2RlbCBvZg0KPiB0aGUgZGV2aWNlLiAiY3NpMiIgd291bGQgYmUgYSBtb3JlIGFwcHJvcHJpYXRl
IG5hbWUuDQo+IA0KDQpJJ2xsIHVzZSAiY3NpMiIgZm9yIHRoZSBub2RlJ3MgbmFtZS4NCg0KPiA+
ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gInRvc2hpYmEsdmlzY29udGk1LWNzaTJyeCI7DQo+
ID4gKyAgICAgICAgICAgIHJlZyA9IDwwIDB4MWMwMDgwMDAgMCAweDQwMD47DQo+ID4gKyAgICAg
ICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA3MyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4g
PiArDQo+ID4gKyAgICAgICAgICAgIHBvcnRzIHsNCj4gPiArICAgICAgICAgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
DQo+ID4gKyAgICAgICAgICAgICAgICBwb3J0QDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICBjc2kycnhfaW4wOiBlbmRwb2lu
dCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEtbGFuZXMgPSA8MSAyPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZpbXgyMTlfb3V0
MD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgICAgIH07
DQo+ID4gKyAgICAgICAgICAgICAgICBwb3J0QDEgew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICBjc2kycnhfb3V0MDogZW5kcG9p
bnQgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmNz
aV9pbjA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgICAgICAg
ICB9Ow0KPiA+ICsgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgIH07DQo+ID4gKyAgICB9Ow0K
PiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg0KUmVnYXJkcywN
Cg0KWXVqaSBJc2hpa2F3YQ0K


