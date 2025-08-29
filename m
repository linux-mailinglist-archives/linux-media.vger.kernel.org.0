Return-Path: <linux-media+bounces-41295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B232B3B292
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 07:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BA331C86CB2
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 05:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997DD220F49;
	Fri, 29 Aug 2025 05:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="LT7exSwa"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022074.outbound.protection.outlook.com [52.101.126.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585CE256C7E
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 05:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756445325; cv=fail; b=WgCNT+yE/ZdtvCHCURzcE70vImp85bvMAk/q7/eVtmj2ukrdC8y6FHmCa2XxTezEACPVngRU89/hlzbLuaiDHf+EChhYPczZSMOtCO4ASV+B/v/hysvN1C1zETtgVp81w8U9OB0PChNFYOVgoO7LwAOlDrjplEG4+aUaMgFVrBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756445325; c=relaxed/simple;
	bh=WmGIFjkyyHgmQBb2g0w1hHur/gm7zBHr18HZTy5LkNw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TYFrfrnmHnOs18sPAICIpdaQ8+lDl46P3J+PvhRg0z2CpebiSIZ4DWtCvuxT3CooPoHO5vu9tw1n9yPoQc/HnEr5RFTJLAWWR9z9gpaBGjnhVTRLhRoQPCHcy//UvMlMf5tkx9tLPMPoN2o1UFGhEV7KNM+qfJ/K8TpsdHpJjWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=LT7exSwa; arc=fail smtp.client-ip=52.101.126.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmF7Bkm8k6Ip5esQNvPAyJLpeoKfHgNSNX3mQHasPhGu16p330X2CST3OmlVUb9LAHIAtXSago1b4j19lIjzAQv573ApsmlQlH1IUH1aO/Y1Xynmup3DKqoft0jt71tRTShi1ibMspn2KuCINJCIDxI7NjzxPoDsMgBIys9fkbFsvSPfNBji9FEzxRwdMJbHSqfo49bkrqDDmHvNzlvCCvi6lNRMkKDLAkKAQOnjiohIDas/uOChvV/Ze9EtcTG5NESqvUzC72p8laGshDVkpR9uja6srK1dhhJawd4eXm/h/6adeIHkNkdQfS+xE4UsIeBy0HSqDHBpYd3n9Xxviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmGIFjkyyHgmQBb2g0w1hHur/gm7zBHr18HZTy5LkNw=;
 b=RY05xv4bC/5Y3Y2FYAgDpBIQV7+NqiqrKSxHkU2R+/fEDpH7NawIOgbJ7gFp6ZQUv3Ytxtfn1ZKKam/ks+Jr8b28VyP1DXh7yvjpFAnLlKayRG53pcF+hR3ASF56RGU32wuWaWqEGG9TOjCRU/n1CfeUJ9Buy+a5+s7C6fiOFqzzq7HLbMCl06Wym5LwciW/CNlGlw0QDEbV8zisMeTXyDEa/ahg1Hn0d1NbmLmIpwFOEFKAJhCYi4YMO2UO6o0+JfeZJpmAVzbTytMJXenJGE/pOVPkKLyZvEcjJkQ4Q3PtBi960tbzMrXAgkfYEU734WJB4SXuGt3jX7ukFbllhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmGIFjkyyHgmQBb2g0w1hHur/gm7zBHr18HZTy5LkNw=;
 b=LT7exSwa4NkZhhd3Ypdxtr022OvybAZMhR4zFrDlkTCYOuBfHBR0syd2goXmG+OKN/3eRZrg5pBqHNKmkalq555P/vfUW+Xao/fhIOjs/EUJJCFdhIg9HE8YBgMo8a7Ic6H4qHh1f5fbLlmai+u204mNi04GKieu/u91quE0hoLdFvju9B663lgm58SPZ6Zg+WvIN9K5eVZQoOmglMN6lUx51fQnvgG6wJwIiDMe3ccRTe6Sl58VQ8YQZIBdi+5JE/929PPhRndEuI5h5FSsKEr65SZPWhJEEorDpF29/hH+O/vd/L2YislwZx3AEyQIlOFcGTKYkmH5MGcUa8ytHg==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by TYZPR06MB7120.apcprd06.prod.outlook.com (2603:1096:405:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 05:28:39 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%5]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 05:28:39 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [v10,0/1] media: aspeed: Allow to capture from SoC display (GFX)
Thread-Topic: [v10,0/1] media: aspeed: Allow to capture from SoC display (GFX)
Thread-Index: AQHcGKGjZpWf6DtvDEKh+wdzevNViLR5GRfQ
Date: Fri, 29 Aug 2025 05:28:39 +0000
Message-ID:
 <TYZPR06MB65683C462A48FD2604AB3786F13AA@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250829035301.2697535-1-jammy_huang@aspeedtech.com>
 <68b13391.050a0220.94f3.088b@mx.google.com>
In-Reply-To: <68b13391.050a0220.94f3.088b@mx.google.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|TYZPR06MB7120:EE_
x-ms-office365-filtering-correlation-id: e85cf656-9a2b-422e-b330-08dde6bce90d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dk1CZHBUbVAvTyttVllzUXNieVNGTEZkN2dkeVZxalFncUwvdDBkYklIVFZV?=
 =?utf-8?B?Q2hCOW5pWnI2U0k3SlFXUGRNU3VDS0VwVnJnaEI4emIzYXB0RFMyMXF3OHV5?=
 =?utf-8?B?K2x5Z0R0OTArNnRDTUxGOElqV2hMRXU2aXpUYXZWQlFmdDVhQzFPSTFDa09X?=
 =?utf-8?B?TFJSZ3FvQk9YVUtXYnNZYncvSUZCVmtUeGI3NTRIK3RNVFQ4TE4xRXZ6Qmps?=
 =?utf-8?B?RU1raFJndjBMZ2ZiSFR4aG9nT1VwT0cvWk92c2VNcVE5dS92bThXY0RFb1ht?=
 =?utf-8?B?M2NvNVk4eFE0Z3ZZUUQrTEtpakxuWXMxK2paVWlOTnlIeG1wQ1V5MWNFdVlK?=
 =?utf-8?B?aFh0V0FqUzFjSjZ5Z1ZDQm1pSVlSRGlwL2hWTG1LdDRsQWZoYlRlbTRYT3NM?=
 =?utf-8?B?dS9vU0xBSGtndGdnT052TzFld01uV1ZNaTRmSTVnMXNxZi9paFRoQ1ZzNFhM?=
 =?utf-8?B?VFRiYXFtZjAzdHREdjJjNFU4bUU2ZjZZTjNlb042Y0tSTUh3NDVYM0R4TGRK?=
 =?utf-8?B?dDlmY0RMbWs0V2xveGNBVkRlTEFhUWdrY3V5amovUGpLUENUc3hlNjg1Q0VO?=
 =?utf-8?B?Z25xRW1GQ3F2WjQwL0JvTGN2R1VyU2RJMXptdXVESkVGd3cxeTU1NHUwK1BM?=
 =?utf-8?B?TXVQUTg1VUM1N21vWXZ6V3FJd3dIUytjYkMvTHVnV214RXVtWG9uSzg0YmRh?=
 =?utf-8?B?bUtWM0tyNnBMa25LelVaUlhIcWM5b0JjbCtycFo5VG5kSE1XczgxTWwxVEhV?=
 =?utf-8?B?TmxyaDZhU3M0dmh0NllCd2NDc2dPZGpLdHVDVUl5UnlqcjR6VE9mVXJYaUF0?=
 =?utf-8?B?cDlROEgwdFZKWHR6Z2Z6OTFEVjF3eG85VFRyRDV3Ky9UY0U0Nlh6SlZNaUNO?=
 =?utf-8?B?WENQdlhmVmhGQ3UwMjJoOGpmZ0FqK3ZoczlncWh6SjJrclNGVmVoV0hudE1q?=
 =?utf-8?B?SW9RSjFYKzk0MWVmbDZGdEtrVGNJRzc3WVhjR2ladjc1bGNYSy85dGNVY0RB?=
 =?utf-8?B?K1NrVHV1bTJmbzNsR3gvVHBQZ3VHSFRhbVVoZllVQzRnVjV2QVltdnVRS3ZJ?=
 =?utf-8?B?OGxYZFo1SVJsdHZ0TXpXTk5zcFNIMERVU0RjZHAyOTZtUWJkYkNEQWplL24z?=
 =?utf-8?B?MU1YQk45Y0F2SG15aG56RzJqeWdjdS9HN3pkcjA4Wms0VmhkSThRZFVSMlB6?=
 =?utf-8?B?STZzMjFBSUNNV214T3BYczg2Y3RxbnFpdDIzSHFSOTZHdmdFOFRPWjBuaEdF?=
 =?utf-8?B?b0pvaDJ4SHVnVmlIaURFK3NVanRoMEJmRUxMdFpXb21KUjViUnBHRURnS3ZB?=
 =?utf-8?B?S2xiemdKYm8rVUQ0RVd5K1J5ak1EYkNnMkt0Z1Nxd05Ia3c3S3hpeU1vd1ZB?=
 =?utf-8?B?cTcrS1hDMTZvN2FaTE9hWWt6OTVVeU05dm81cmpuc1hncWxOenhxYW91d3hu?=
 =?utf-8?B?SXNyOWxpZFNUY25aaktaM295ZkhXblVPY2haWklsOSt0LzZxS2t0QTJIQUZ0?=
 =?utf-8?B?RzZ2djR6UVplRElFR0R1N0I3RHZyaGgzOUZKajVjRytIL0tTN3lEL2pNbzRL?=
 =?utf-8?B?dkJoZEJOVkR4WCsvSExhV3FNYTcwN2QrM0paeWpRSjU2MjBPY1QvUUF2Q010?=
 =?utf-8?B?MjhDSXE1K3hhdStnbGRMRC8yUEVKYjU3a01ZRmQxWkh5Mkt2eDcyWWNSUExF?=
 =?utf-8?B?UW44WjJaeUpXNnZDdDZtNlVBdysvSmR1YjhvN3QvZ085Nkh3Q1o5QmJUMG5R?=
 =?utf-8?B?SnJVNHdkZU5jK3FudXdIMlZRVC8xZ1Njc1dZWHd1N0dBSTNCWTVHVTNWSVJi?=
 =?utf-8?B?Wkk5cXJaWUJKNE5xNDNEVTJDbVoxUDNQby8xSnU1disvOWFuWDd1Q0lIeDVi?=
 =?utf-8?B?WW1HMXBpUmhQNDlva0FHbldsTDJtRkRjTXBtMFJzMHU4MUJaTW9pMGhuaXB3?=
 =?utf-8?Q?NaIGytl/JWw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b2dIZ3U0dElSczJ1TmRhYnhTWFoxZk1PZjh1OWErLy9qRENtYlZzaDlKRmQ4?=
 =?utf-8?B?ckZ4RFV0SGFtUi9vUS9hZW81TzhrSVAvelh1cUNCeUtWWTlUYXdJdTlkNnpB?=
 =?utf-8?B?RDdQZVozSWZCSGdheTZqTGZleVVoSisxRnZ1bEk4NVhhUTFiQ01WTms4eDdN?=
 =?utf-8?B?Y25QMytua0tZVDlwZ1VDM0ZKNnV1blJxSzdxMkltWDIxU1NnMHZaWEg1Q3RK?=
 =?utf-8?B?ZkpYSDFJdzNLc2Jvc2xLci96b2Y5KzFpZHg3VHB3TlBZM2NIOVhWN2hBQnZH?=
 =?utf-8?B?QmVneFdpTmxKUlMwYkh0OEg3VVZJNm13Nk1lNG0yTjRxQXFabVRteUhtWGVD?=
 =?utf-8?B?TEg2UUVwcWtzbTZwc28xS3doTnVyeVpwMTl5bkJXUlRMeEhhdHYxL2JTSnk4?=
 =?utf-8?B?dEpSZXI4Vmg5Q2cvbTJ5WHMxMmtFaEo4OUJmNjJsbXhJVC9ybVBlZDJkeEc5?=
 =?utf-8?B?ZGZGc3dnc3g4RThOL1ErcFBuUHhTWEtwZ3RoWkYwd29Yek9ZWitacEZtbkhC?=
 =?utf-8?B?ZGw1M2ZZdlp3N29LSGV5eS8vcmNqT3RrVzBSN085SHpWcS9OTlVaNTZ5R2N1?=
 =?utf-8?B?cDJhdDBQbUNkTk5UWks3ajNMdURTdUdMakhxTGw0NGh4dzVEUmlSdndOWTdy?=
 =?utf-8?B?eXZzSjlXVWkweDR1UCtiY3orb0pjaDV3NCtvcHh2aXBscGl3NjcrN0ZBS3hp?=
 =?utf-8?B?U2pFZS9rZTFIT25lemZjcTBnaFpGbjZyTi9VN0VjSTVaUzB3UkY5cXo4WVVO?=
 =?utf-8?B?YzF1RkVlV2grVGJRbG1OK3lTY0xyVTQyTUhaK2JpWHYzTmpJcFlPajZqQzBT?=
 =?utf-8?B?T3hVaERoMTdhY2RjSEY2aDlSUWxPL3pXWXZEbjlRbGtQeUVEV2s2N1l0cG9X?=
 =?utf-8?B?VlZsV3p3UUJyYWVPeitXbkpXNnhzUlBUbHZOQUZrZFJqZ2RkRGpvUkVKb2xQ?=
 =?utf-8?B?alJSNDRZemc0cFl6cmZnWDhPQk1rS2pUUXo3UVVtcHJmMEpBR0hxQjE5UmlK?=
 =?utf-8?B?N081NDNDMS9qdytjdDRRZ3Y0ZzZMa2dyQVQxdXNPeExUdDlRWnRTZlJ2Q0lD?=
 =?utf-8?B?UEZVczJSZmJEaWdON1lpb2hCU0xabzRDRWxZN3dlbGI0TUtjSUZiblgyUXZt?=
 =?utf-8?B?aUtRdzZPWXY0bGZOa2ttQXZJV1NaQnB1dmpMM0pEdWpOazNKS2hOM2Mrcm1K?=
 =?utf-8?B?alZTUENRcFd5b3pFSkFmNnM2OE5jYjBMKzV3TXV6RjJtYWszdGRTaXgxTU5s?=
 =?utf-8?B?aXZySXYrc3pCRy9pTEg4TjA4aVJIM0Jodzc5Y3NNTUp6ZENRMDBVWnBIcXJm?=
 =?utf-8?B?OUZ1NVd1eHZ6SmMrbzRwZHF2Z3g5eXY5MXArU3U3YXhCMUZvQ2RzcDkzdjFZ?=
 =?utf-8?B?Rm0rcEt6eVRRUmVKWnRiOHEwdU5QSGdBY1lHWDViWklFVE1SQWhZL3l3Z0lT?=
 =?utf-8?B?OW5IK0wxcWhGZWs1d083dFZGN0ZKTFVUTzRRVzhTT3RaLzZ1ZmZsN25XVEND?=
 =?utf-8?B?S0RZZmZhcjAzQ2p3dkZoNDhQWmwxNGN0K1lFNzE3U2dPQzJTb0Z0emtKVlRT?=
 =?utf-8?B?Qnl1dlRqSDlzN3FyMzhiODZHcHpYbHcvYVJNNlhtZHJOUCsrTzZvV2xVVTVn?=
 =?utf-8?B?NXV6SVZ5amdOdk8xVk04eHovdTBzTUExK2Yxc21WZVRtT3UrNFZYWUFWcTEx?=
 =?utf-8?B?ZmN3QVNJR0xXSGpmT1pza1pYVDRVK3BaL3VvWlRiRzl6NWdZeXJkTkUxQ0ty?=
 =?utf-8?B?a2dmZktRTFZKS0ZKUWIvaDhSZU5FRi8za3VpN0tPczdHOUtpdGpzY1VZVU1j?=
 =?utf-8?B?SDdxelVHSnlpbXE0RE50Y1NBQk1aa2ZpZkpLRnFSclpiRkVsMDhuRGpxeHU3?=
 =?utf-8?B?ZmRoMUdHaTJqREZnb0cwdldsWG12WTZjRk5HbS9WNWd1eWNRc0FSZkt0OXM5?=
 =?utf-8?B?TDUrVkdPcTdsVmhiT1BxZElmdTU4Rk5lZXl3TXo2RUMrdllaZUp5ZENnejFB?=
 =?utf-8?B?L1hlK3VvTTJJZzJXMDBOcXEwdHFJQ3JRL0VUSEtmWkxmeGRlWHFiL1pwT296?=
 =?utf-8?B?MEhFQm5ROE9ad3IrcGpaNE1EZDVrQXJTU290amRjKzNSZkFnTGhkVVdMRFY3?=
 =?utf-8?B?b1BMeGJpTlVUWmh6dFZjaFFuSmtyZkVjNUZoc1IydVFobklIOUI2NFNVcFBX?=
 =?utf-8?B?NWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e85cf656-9a2b-422e-b330-08dde6bce90d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 05:28:39.4132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ux6qDxzLKPHLXsGfuZ5KhTG2gtC0tKu9xvPRTCex3BxuxbHhzMLeL5ELwgNhgCzv/Y6me8arsniHvR8wdx5M/FAXjoJgSxbccYP/Wl4P3Zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7120

RGVhciBTaXJzLA0KDQonZHJpdmVycy9tZWRpYS9pMmMvaW14MjE0LmMnIGlzIG5vdCBpbmNsdWRl
ZCBpbiB0aGlzIHBhdGNoJ3MgbW9kaWZpY2F0aW9uLg0KVGhpcyBpcyBzdXBwb3NlZCB0byBiZSBh
IGZhbHNlIGFsYXJtLiBDb3VsZCB5b3UgaGVscCBjbGFyaWZ5IHRoaXMgaXNzdWU/DQoNClJlZ2Fy
ZHMsDQpKYW1teSBIdWFuZw0KDQo+IERlYXIgSmFtbXkgSHVhbmc6DQo+IA0KPiBUaGFua3MgZm9y
IHlvdXIgcGF0Y2hlcyEgVW5mb3J0dW5hdGVseSB0aGUgTWVkaWEgQ0kgcm9ib3QgZGV0ZWN0ZWQg
c29tZQ0KPiBpc3N1ZXM6DQo+IA0KPiAjIFRlc3Qgc3RhdGljOnRlc3Qtc21hdGNoDQo+IGRyaXZl
cnMvbWVkaWEvaTJjL2lteDIxNC5jOjExMDkgaW14MjE0X2N0cmxzX2luaXQoKSBlcnJvcjogd2Ug
cHJldmlvdXNseQ0KPiBhc3N1bWVkICdpbXgyMTQtPmxpbmtfZnJlcScgY291bGQgYmUgbnVsbCAo
c2VlIGxpbmUgMTAxNykNCj4gDQo+IA0KPiANCj4gUGxlYXNlIGZpeCB5b3VyIHNlcmllcywgYW5k
IHVwbG9hZCBhIG5ldyB2ZXJzaW9uLiBJZiB5b3UgaGF2ZSBhIHBhdGNod29yaw0KPiBhY2NvdW50
LCBkbyBub3QgZm9yZ2V0IHRvIG1hcmsgdGhlIGN1cnJlbnQgc2VyaWVzIGFzIFN1cGVyc2VkZWQu
DQo+IA0KPiBGb3IgbW9yZSBkZXRhaWxzLCBjaGVjayB0aGUgZnVsbCByZXBvcnQgYXQ6DQo+IGh0
dHBzOi8vbGludXgtbWVkaWEucGFnZXMuZnJlZWRlc2t0b3Aub3JnLy0vdXNlcnMvcGF0Y2h3b3Jr
Ly0vam9icy84MzU0OTI0MQ0KPiAvYXJ0aWZhY3RzL3JlcG9ydC5odG0gLg0KPiANCj4gDQo+IA0K
PiBCZXN0IHJlZ2FyZHMsIGFuZCBIYXBweSBIYWNraW5nIQ0KPiBNZWRpYSBDSSByb2JvdCBvbiBi
ZWhhbGYgb2YgdGhlIGxpbnV4LW1lZGlhIGNvbW11bml0eS4NCj4gDQo+IC0tLQ0KPiBDaGVjayB0
aGUgbGF0ZXN0IHJ1bGVzIGZvciBjb250cmlidXRpbmcgeW91ciBwYXRjaGVzIGF0Og0KPiBodHRw
czovL2RvY3Mua2VybmVsLm9yZy9kcml2ZXItYXBpL21lZGlhL21haW50YWluZXItZW50cnktcHJv
ZmlsZS5odG1sDQo+IA0KPiBJZiB5b3UgYmVsaWV2ZSB0aGF0IHRoZSBDSSBpcyB3cm9uZywga2lu
ZGx5IG9wZW4gYW4gaXNzdWUgYXQNCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2xp
bnV4LW1lZGlhL21lZGlhLWNpLy0vaXNzdWVzIG9yIHJlcGx5LWFsbCB0byB0aGlzDQo+IG1lc3Nh
Z2UuDQoNCg==

