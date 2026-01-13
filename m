Return-Path: <linux-media+bounces-50536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5090AD17DB2
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 283F63015583
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70490389DE9;
	Tue, 13 Jan 2026 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b="I+263O0f"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023083.outbound.protection.outlook.com [52.101.83.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B1F25DB1A
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298769; cv=fail; b=ir5CQxSzyK7h0SJXY0jEVi2G+f/pjquKqhVHjxbasH12NyCCVs0Uf/o7Qy/kifNqt5vxPQogPkY9a0IezVfYp3FOJ/ymIA1Z8yB3J06AoVGyt8oM55SXfzuxnPW2U+7hkDqIBqL+3G6CysjsptlN3cBcsAzFubHZBrZrZai8d3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298769; c=relaxed/simple;
	bh=5TldGV1QMKysqMAPBmQauDbp5yaQSbiAjo2geou1ksg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HqIbASmW7YEzVfLJFe0N7waeqqZLWNmii3fT+o/VVCDWTcP1XBAadl3IzV3ISO3QfZTY9FcFiWyF5t3R9zcaQXXdALW2IuLyLAWhXbFJ1MB0kkYFXFwjETz7JNzuviJPfMImA9e+1VPjYsEFzzhYzu3Ze9Cbyps3CmPhQxgyjig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai; spf=pass smtp.mailfrom=q.ai; dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b=I+263O0f; arc=fail smtp.client-ip=52.101.83.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=q.ai
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPDA5tw49+XBfnLY068xUNEELtJWTzc+HzixHnfE2sOiHXeIaN89IxDYopi2CgOe1tXaa2Omf4vY/PaWaAJfAccYJpmOChcjWQPqR1JBctyWVGh+O1X99YyMFsPp1gsyBnIRwe+LarzFdzV7WzApjt4AKg9d6ybhrPB/5C1zOfTivgPfjWpUKFlndv2JVnNpKJwllrEY80cKlWbd0ZN952AF+LTIIv+a3n/uECUokI5AC2AIEAkBgpRgohskeG5uv0fMI4FhhgGFzvSYzGC1lAnpP9Vi12vx1ijpbt9Zx/i2AhgFow11lcoC1xn8UX75ow5zahlmxHZ5ngYq5CnoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TldGV1QMKysqMAPBmQauDbp5yaQSbiAjo2geou1ksg=;
 b=mu2WrTMh0DCaZOVWZLtGrR28/4ZdIZPtI1AjRXg3WCEsImkgNAr5GiQEAz3iXxmJxlAkKxLbbYRCNcqgYnFUlxRXCmmUFW0VEtdQ4XEAhK6n0nNNJi80XkrbH/QECdJ1rzK3SVVDWGBcdYEs+qtlCYgKMzBELS1hnJbIhSCCY0GQaanCk7Ydc5sUzHudBfAJRJZzxcsc/MCND5jwKNMSBS5s6N8BPe4G7NJMfWPpDIs2dXiRf0T5gf0pN591Hw9/CN1FwvCWYfVoWWVPSdJBj4O43m6e9hkSWr8VzG4bg7DhsQx0qs+GOvKv+cx3QeDV+toZdku1iizCo78g57/7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=q.ai; dmarc=pass action=none header.from=q.ai; dkim=pass
 header.d=q.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=q.ai; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TldGV1QMKysqMAPBmQauDbp5yaQSbiAjo2geou1ksg=;
 b=I+263O0fBterHLyBLifNtv2ZPt4t2koovWkJtNbGI+1txgvNXSr654dSUMM0Wl8GbLf/9fSMqt35lmRCelJcihG04H2Nbedrf4X2jqJ+CldKCFtKDve9vjjemJXWGYJAg3Yt55/iJ6qFZUyCQBxqHkS2FhNXRlyfhSC6Z/I7P5xSOLDK6wcwQorr7B37H2ndzqGjlTE1TeqFT6RFruwdi8kquAVJwvF4BauwydG2sTAO4k1H0GQMIg+GZ/al4k5p5PGf3Sz3Qktc528RANWu+jMASuLEc7LTNkKiudaQ1ZlDC8Xw27+eQwBHjQ1DU/K8JbRRyncVQsDkYeM6z32q5w==
Received: from DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:46e::10)
 by AS4PR10MB5718.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 10:06:04 +0000
Received: from DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f76b:b6df:cd63:e889]) by DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f76b:b6df:cd63:e889%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 10:06:03 +0000
From: Itay Chamiel <itay.chamiel@q.ai>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: uvc_alloc_urb_buffers() fails for small frame sizes
Thread-Topic: uvc_alloc_urb_buffers() fails for small frame sizes
Thread-Index: AQHchHP6D+m4URZ1Kk6Yp+5X0tcadQ==
Date: Tue, 13 Jan 2026 10:06:03 +0000
Message-ID:
 <DU2PR10MB77866A2E27FA9670E867EC20E18EA@DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=q.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR10MB7786:EE_|AS4PR10MB5718:EE_
x-ms-office365-filtering-correlation-id: 0c434c04-d7f7-4d08-4360-08de528b5c85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z0YyQXZLVENQNDJxRlpnTklrMTZOY2x5WXFtL0RZSWlQWVlxenRPUEV3alpJ?=
 =?utf-8?B?Qjc4ZHo1MTV6R2QwdzdTUk9nbTNyc2RJMG8xWlROaDRKNU5Db3hCZkhhVVpy?=
 =?utf-8?B?dEoxSDloOHpGNkJoOVZNNW1NMUM5WmxPR2ZCZENPY2dRQW9adENWU1liR0JJ?=
 =?utf-8?B?aWpYVUJoOEZnZ3E2ZFRpOHZ1d1g1QTN5SENWVEhkVm1iWnpXWGR4RVZMckk5?=
 =?utf-8?B?NnNic1Uyd0I3ekZUZUp5MnNjRXlTVFhOOWRxUmZaelBFUk1ZUS93SzZoYXU0?=
 =?utf-8?B?ZEV6cWt5NnNBeXhTRndNSmc4WW9TYitRNVcvbVl2T0YrQTN2aitYdjBuMjdE?=
 =?utf-8?B?OFhHWHFVOTJEYkdVWS85aDRlYlcrYjl0OVFkL0J4OFZDUUZpUUg5N0hVVlNS?=
 =?utf-8?B?bGh0WkZiSGlmMnV6bGV0NmEzZ1Rka0NVVmdHS3BpaVV6eFU0Rnp6b1JyZ0tT?=
 =?utf-8?B?dDE1U2FqLzU0eHhYajYrMlcxQmV3MisrM2VYNlFOcDM5VXhwQkFaWXowY3pa?=
 =?utf-8?B?OGFFdFFRaEVaTTZ5UmVBVktEMlBCdXI1amsvQTVCWDJLQWJQM2tDM250TG1P?=
 =?utf-8?B?V3d5NGs4aEs0dFBQaUxqV1diOWJCZHQ0c1pjSmpURXNsSEtDWGdGZURMWmV0?=
 =?utf-8?B?L0RRc3pqejdwcHBPZHFwZUhCS0s1T1djWTJqM3FNalNhckREZ25sUkFuM2tY?=
 =?utf-8?B?S2NLZXlTNTRPMHFEMVQ5QzQ3Nm43ZTV1QXRHTWNNZ1dhOGVRSHZPYTlrQWFC?=
 =?utf-8?B?RTZZbkdTdnRsTEVpaWxaS0ZhYm5zZW1pUnJZdFVLSTBzclFXMm82R281eFdJ?=
 =?utf-8?B?SmNWQWJGZ1lCZnpNbmptVGNYTjN2TzhDeGpMdkJNK2Y5RTBXd1d1L2NzQ0NX?=
 =?utf-8?B?VkR2ZnlJWFlsVXRUTWtqK1dXc3llNXZnR0ZaRzVJODNrMmVYRG5FNHc5RGZa?=
 =?utf-8?B?bDIxSzN2UGVPSU1iUkcwdEhJSnBkR1Q3c2lZN3ArbDByMVovTFNGS20zVUN4?=
 =?utf-8?B?NnJyLy9EY3daV2xJbXM5OHFsTEM0T2h6My9LaFBVa0pXSUY2cC9IR0luTXNF?=
 =?utf-8?B?OVBDMGZtcml4Q1hybHp3NFFEUEV3aUsyZENvN0Y5c0lFMXJ0U2FGWGtNYW1k?=
 =?utf-8?B?R1FkeVQwR0pIU3NycFVhNWg2VnRuTVVnVkN5M2hyQlhuNEtJbi85ZnV1bUpq?=
 =?utf-8?B?bzU2Z0wwSmdtVU5Jc3cxdVpsT1hnNDRnRk5QK1NyelR6d1E0QnFwdmlVNHpk?=
 =?utf-8?B?eHUrZGY4U2RDREN0TU5oSHpwMFNxT1RKci9RL0ZDbllUNUd4UWFkVnI5ZG9l?=
 =?utf-8?B?ZjNaU3JGT1NNTFduTWNPUXVOWVBwQ2VKVGVHVTg4eFRDdGF0cmxDWFllT0x3?=
 =?utf-8?B?WGpYelBDK2gyWGZFRXpDYXlHd2dDNTBiWnczK1FpWXAwb0VtMS8vVWtwcFkx?=
 =?utf-8?B?N05YSHV4OURxOUdVUHRJOHhVell6TWxaVUltMjFjQk1hL21jN1VEUlFPZzN5?=
 =?utf-8?B?Q1VoM0YzSnNxM280U2pUNnNNS212NFgxUWFtRXFkMXVzZEJJcnZyNUR6TllM?=
 =?utf-8?B?QUJkSytvdkd1dE1UeldYdEw4ZHM5dWZFY3ZzalFwQldpNjJHeHZVQ0k1aWdU?=
 =?utf-8?B?Qk5pVjZWRnlXdURGOWFSelZqZkxLU1p1QkZINTEraiswUEMxLzUvdGtNRXE5?=
 =?utf-8?B?NDUrYzJtbnVPNkYyVGpiRjdhcStWRXV4S28yN1VMMXJ5aEFURDhudnFJcHBq?=
 =?utf-8?B?aFRxVUpoSDg3RVhvNzNaaWtQNWk5ZnZhT01BbEhPbjgxZEE3MlJDSTdCeUNm?=
 =?utf-8?B?OC9nKzNkYUk1ais4Y3BVMFFiUnhoU2R5QU9PRFgyYlBzWFFjOHNTZzV1SFF0?=
 =?utf-8?B?dm5mbmJGNCt3N0MyWC9yQVE2TVphUUJWRVFIWVQ1VnZSUWdZUVZ6OTZNYkpl?=
 =?utf-8?B?YXZYY1MzUUE0dEtseU9naURDejVIN0FHc2NacjJDak1DWlFoakp3dFdPMDFR?=
 =?utf-8?B?T3hXN0ZJNFRVWk9sbW54dHdkZWZkMjY5RGpBeEExUU8vM2N6VzZFQTBVMFU4?=
 =?utf-8?Q?i2JR78?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2RmNll3eVNJM2dMM1RuVzFpUUZLL09aNEwvZWU4UTV6VUZTeXVkcHU3RWlv?=
 =?utf-8?B?S0dhMHhHWlpMLytJczVubEFqL0hOTTFVc2EwMFZ0WnRDVUdKaDAwNk5nL1gy?=
 =?utf-8?B?ZmkvMnVQVld6VzZBNVRUN1N4elh3NlczSmg5M2lMbnlhSGZHREpBamY1RTE0?=
 =?utf-8?B?c21UbTNoTW1yOGpyUDBuWGFtdktrbk5VZEhwdU55WXo5V241clhTV2hTVW5s?=
 =?utf-8?B?ZW9zRy9nckdodTV0bG9nMWRFVlRlWjh0RGFTZ3hEVVBNaU1RK2RjdHREcDl3?=
 =?utf-8?B?T09Tc0YvKy96bG5Wa1RnbXRBVFdqamRIZEZXOFk2dVZDRHpGMjJEWVdNZjln?=
 =?utf-8?B?YVBiNnVQWVYyREZzcjVjNjgwb0hkeEJVM1BwUHVXdWcxb0VCTjhFRDVZaHlh?=
 =?utf-8?B?VjBMTGN2aCtxSUZOdmlYVVd1MktLc0hsSmtYVWE5TGcvK3QxRCtud2h6aUl6?=
 =?utf-8?B?cFNxTzQ1NkhhY3BCNlJzK1ozQnRrVElDaHVOSzZGZlp6dmRINGlYTDBCdkE1?=
 =?utf-8?B?NFVRTUxRWTRnRkYxNy9ETzhDYXNCdzlpU01vdkh4eEYzWS83U2pZYzJUSm1E?=
 =?utf-8?B?UlpDeTE4TW1iOUpFdFVvWno2NCtpZzhySW1kTlI3YjZTcFpZc1pWa2kwc01S?=
 =?utf-8?B?Tm0wYXkyZDJqNFh2eHd0dlRWNWh4YVA2Z09EZXJxUUtXYjhsT1diWmM2eFpi?=
 =?utf-8?B?VWpyb0hRS0FMRkNyL2NCbUs0K0pERGg0eTJKakhlekhPZnBQREpEeU1vZXI5?=
 =?utf-8?B?Uk1zdWNFa1graUpaSk53cmNwVm5WL3pKZjkyNGx6VHpiYk0yVXFaWldYQng1?=
 =?utf-8?B?Y1IwUnRXdXh2azQvbkplY296S2IrdFNvK2VTbEdLOEVTVW1vR3ZablNJa3Mv?=
 =?utf-8?B?ZzV0VWZCQ0xSSVorNmtLRERYVzU1TTBUWStuLzAwa0s1R1cwc1BURGFnNjM1?=
 =?utf-8?B?cjBDQWk2dGhPa0lENzdvNnZuakRxQ3FFQVhKU1AyQ2RwcGtpZ2M2blhlbW1t?=
 =?utf-8?B?emp0N2lQclJFUzdKZldPM3IwdmNKa3V6Sk9NMWs3d3pIVHVqTWNFT0NHRUl1?=
 =?utf-8?B?akxibVRIdHdwOFJzdHpZSFFoS3R3OFFXbFZNdmxvQXJac1Q1Q3krK2VyZHNM?=
 =?utf-8?B?Q01RZGI2YWdTUUxVS1o0Uk9CaElHSzF2eUlyaURseUM2UWxyZkxHcHEvYjAv?=
 =?utf-8?B?YjJkbHdUa1ZHQTlqNksreUtSbld6cW9NaGRIdzRUNENMbEx6TFB0QzEyTU5J?=
 =?utf-8?B?YVR5NGJqTnhrUlptcHRXcnczTU10MGpINVN2REphblh5bHBBWHNxTkhKS0V0?=
 =?utf-8?B?S0U3VnZzWUYvYnVEQlU3dmtYaTZhSVB6RlBJT2tGNEVvZlQ2cVZNOURWUXBm?=
 =?utf-8?B?ZlZwc29VSCtVbFpsK2ZxOFFqNEpscWVZd3V5V1FZN1c1bGgyNGpib2sxWTFZ?=
 =?utf-8?B?Tk1rY1pPaFVERTdkYlU3NVNjckRlQWhDV3czZUZ0R29HamVkVk91YXlKUHFW?=
 =?utf-8?B?VHJvNmFQREE3aEtEaGFJdXFaZHRBQlk2QmNxS0N3LzdLSmwrcW1BYzQ5TnVq?=
 =?utf-8?B?bHFNWmF0QjVod3lkTkNWRGtnaE1EU3hLa3FyN25JNXhqRHNxUnhXR0IvOFkr?=
 =?utf-8?B?K2VGZVR5V1oxa281cnYzODlUR2lHbzAvTk9EMFdEV3FFZWhDbWFSUE9TWDFI?=
 =?utf-8?B?eVJJdkY1TUh5aGdBSnM3ODhqSGorS3BwZmxRbkR5UnZGZUoycE5RVE4vem03?=
 =?utf-8?B?TGNKVEdHNk90MlpnaFdMbFhicUtEM3lURkZURnFRVzRwYjhheVR4SU9qVDl0?=
 =?utf-8?B?aUlpSG1JWVVITDV2WkFvRzZvd2FXdi91MTFPMlRkYU9oTjVvSTg5RVpXSm80?=
 =?utf-8?B?SmlKSzd4cDZVOGo4eWM3UXdqbzdXUWEyZXlBMFlETlFmanRVREpONWt4ZlVt?=
 =?utf-8?B?dEw4WlBEM1hVVnhUcnlvRUozVnZYemdYaXVqa0U1WU8wejBTWTdKcGZHMFhr?=
 =?utf-8?B?bm9Damc5aUFYK3pmbWJVTGxXL3lsbFJzVVR0ekZIN21hSThrbE1aT3RxOExN?=
 =?utf-8?B?MzRjbXRDdXM0U2FPblA1STlZMUhQUVZCUVhEM2xHT3NxLzZ2MGZ1Y1JxK1VN?=
 =?utf-8?B?em1ER0RUL3hrUUtVdzB6QnZsNUcwSUNRQVZPcVNMQVV6YXovRGphMHMwVlgv?=
 =?utf-8?B?SjcvNDkvWkxzQlhzb0VvaXlPV3ZoUHhOQzg3TTIwMmVQTlorN0JNVFhXZE9i?=
 =?utf-8?B?L1FVcTY3ajVXR2FjdWtsRVVUSk5vVDdpRjVxVjQxNmtITzd1dnhJTElHZWV1?=
 =?utf-8?Q?aMo1ILZdgP8qUfr2lN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: q.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR10MB7786.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c434c04-d7f7-4d08-4360-08de528b5c85
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 10:06:03.8752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7aac50ea-5b23-4e88-8c1c-f6c7ceede9fc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tKCANitiO1G0tuI3DeRpWvyhQNAjNus82NLM7ObDKCG9hgolg9YzATs9EdERuPche/chI+XaviEG1388tYst1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5718

SW4gZHJpdmVycy9tZWRpYS91c2IvdXZjL3V2Y192aWRlby5jIHRoZSBmdW5jdGlvbiB1dmNfYWxs
b2NfdXJiX2J1ZmZlcnMgYWxsb2NhdGVzIGJ1ZmZlcnMgZm9yIHRyYW5zZmVycmluZyBmcmFtZXMg
ZnJvbSBhIHZpZGVvIHNvdXJjZSB0byB0aGUgaG9zdCBvdmVyIFVTQi4gSXQgZ2V0cyBhIGZyYW1l
IHNpemUgKCdzaXplJykgYW5kIHRoZSBVU0IgcGFja2V0IHNpemUgKCdwc2l6ZScpLgoKVHlwaWNh
bGx5IHRoZSBmcmFtZSBzaXplIGlzIGFuIG9yZGVyIG9mIG1hZ25pdHVkZSBsYXJnZXIgdGhhbiB0
aGUgcGFja2V0IHNpemUsIGFuZCBldmVyeXRoaW5nIHdvcmtzIG5vcm1hbGx5LgpCdXQgSSB0aGlu
ayBJJ3ZlIGZvdW5kIGEgYnVnOiBpZiB0aGUgZnJhbWUgc2l6ZSBoYXBwZW5zIHRvIGJlIHNtYWxs
IC0gc21hbGxlciB0aGFuIG9yIGVxdWFsIHRvIHRoZSBwYWNrZXQgc2l6ZSAtIHRoZW4gbnBhY2tl
dHM9PTEgYW5kIHRoZSBhbGxvY2F0b3IgJ2ZvcicgbG9vcCBpcyBuZXZlciBlbnRlcmVkLiBUaGUg
YWxsb2NhdGlvbiBmYWlscyBhbmQgdGhlIHN0cmVhbSBmYWlscyB0byBvcGVuLgoKVGhpcyBpcyBi
ZWNhdXNlIG9mIGxpbmUgMTgxNSBpbiB0aGUgY3VycmVudCBnaXQgdmVyc2lvbjoK4oCC4oCC4oCC
4oCC4oCC4oCCZm9yICg7IG5wYWNrZXRzID4gMTsgbnBhY2tldHMgLz0gMikgewoKU2hvdWxkbid0
IHRoZSBjb25kaXRpb24gaGF2ZSBiZWVuICducGFja2V0cyA+PSAxJyA/IElzIHRoZXJlIHNvbWUg
cmVxdWlyZW1lbnQgZm9yIGEgbWluaW11bSBvZiAyIHBhY2tldHMgYWxsb2NhdGVkPyBJZiBzbyB0
aGVuIGl0IGRvZXNuJ3Qgc2VlbSB0byBiZSBkb2N1bWVudGVkLgoKSW4gbXkgY2FzZSB3ZSBhcmUg
d29ya2luZyBvbiBhIGN1c3RvbSBjYW1lcmEsIHdob3NlIHBhY2tldCBzaXplIGlzIDIxNTA0IGJ5
dGVzIGJ1dCB0aGUgZGVzaXJlZCBzbWFsbCByZXNvbHV0aW9ucyBhcmUgNTB4NTAgKD0yNTAwIGJ5
dGVzKSBvciAxNjB4MTIwICg9MTkyMDAgYnl0ZXMpIGJvdGggb2Ygd2hpY2ggZmFpbCBiZWNhdXNl
IG9mIHRoaXMgaXNzdWUuCgpUaGFua3MKSXRheQo=

