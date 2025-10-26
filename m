Return-Path: <linux-media+bounces-45568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B30C0ADC1
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 17:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E8B154E9446
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 16:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023092D3739;
	Sun, 26 Oct 2025 16:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsenseai.com header.i=@realsenseai.com header.b="afqnMqhT"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023133.outbound.protection.outlook.com [40.93.201.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB45724DCF9;
	Sun, 26 Oct 2025 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761496734; cv=fail; b=BQYoRad2EWJxfIkkJl6R/4Wj8TcooZR+aTkdkuxkeyDiDNC4u6O51CJ/ycawhUulgdV1mfRAJIqWm9Hk4KjqpmAuReTDAWcYNP/LD6MwCCq83mGOmcR+JOoC5X2ag5p3IIzMQR5VUIXfe3auzgv3ikUsLd+ZnpWjrMVrLpDA2QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761496734; c=relaxed/simple;
	bh=lNXMLeweuqJ8wwhMKQ41fuz/zOQRGLp02gcby6A2oSk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HPGUIn1PYuvuqhbZ0tVWY3rFSN9vhOHyQdiWcZR4cExLKt6jzayq1Doy7wH/3fEOK6l5j/5T91tyPiCgK+K/S+hKlPKW+I5Gl8EGKOOOJUO+kwZF7opuQC9FVZ6WbZpu8Y8Ey5h8axevBJn6H2qhB5byfVuPcXoX1hOTh0ClQCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=realsenseai.com; spf=pass smtp.mailfrom=realsenseai.com; dkim=pass (2048-bit key) header.d=realsenseai.com header.i=@realsenseai.com header.b=afqnMqhT; arc=fail smtp.client-ip=40.93.201.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=realsenseai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsenseai.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk70I0n6at4cVEcL4+xprol0YsHvGDleswF6UBk/xaaEIBA8+Ih1H+G1YG5yLKgcoEGkBshkp/XnghVuEswy3+o/WDQpmUx/Mpt7W8bvhECbb03sG51zE+Dk1/AR3XB1oAy+E7p/WeQ9k0oE7DxQbwKWiq6yEpd6ZwxG9a8dE95cRnJM/v/A0STQnakFO79T6P01Kh8KXR3/GnYeshZBvx9tY7aERrXAXlATzheVTSGZ8eSMt5hEZpLL/LzJQwwWtxsVSlq1J/QSkowr6E0LBsWfmdmjgrM+psNpmlhTu5kuPkfsBIzrSXudRNngOY32P6jpEx7RUYgc9/9mmaI7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNXMLeweuqJ8wwhMKQ41fuz/zOQRGLp02gcby6A2oSk=;
 b=nPkg74wzukkvyANGWHFbQWMSV+ROs532iqcB1nkbWbvHAKOLgW8MKiamZFtrbpDL16hU3+2Dpu5erS+QyotR+baWT5FmDyo9V29QqFkbcgv67O494ZcJme7nwhWOGewo0PpYNZFU/vObW8bZn/whJ7sQ/IimD/zRhGr8vBpNrkySzzl/Jm2cgvqhO/dRGGoKXADcWp8i39dtaoXStQYH1wwIS18w0NxwW6SjOIGou8xPxLNNpufWyjzz3FelvD69E04SZfBrBsj/xs7t1dXenDhjoqOvo+zsw7z//aA+XShVBi9Hhx3+qLMki++NVLggFuBb5vswYfC1JB+1tFAysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=realsenseai.com; dmarc=pass action=none
 header.from=realsenseai.com; dkim=pass header.d=realsenseai.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsenseai.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNXMLeweuqJ8wwhMKQ41fuz/zOQRGLp02gcby6A2oSk=;
 b=afqnMqhTWWsRmvuOeMT6sJmQRhLNiIkts68EUQP9t6NCn1Xb3osM8W5e0/c2H2Ot9fsSVBFgI3/OPuvpyDaWPuPUCTNRc5uLfkSXf6BGf269BVZ2f2/epCrU0BFVwnY/H3olaTJvpXCAszKxrmIpf9drEqbyPzofD/CIJD4k2BmVfkfkqeassxmStuojxEgahSDcgj37JUdWQzMWOmNj5ZTRki9S5ohQkwa5ht+2OUrzWbtXlL9lhG28mClJJCLcl+6h8ZV1oxbvbWDydnmRCCFTV94xaqolm3YevcroA+yzLOxq4MtGLHoZXN3grLSozDhRKnMs5uPHOtpa0wb5rQ==
Received: from MN2PR18MB2479.namprd18.prod.outlook.com (2603:10b6:208:106::27)
 by DM4PR18MB4238.namprd18.prod.outlook.com (2603:10b6:5:395::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Sun, 26 Oct
 2025 16:38:49 +0000
Received: from MN2PR18MB2479.namprd18.prod.outlook.com
 ([fe80::5614:d442:4fef:5b6b]) by MN2PR18MB2479.namprd18.prod.outlook.com
 ([fe80::5614:d442:4fef:5b6b%5]) with mapi id 15.20.9253.017; Sun, 26 Oct 2025
 16:38:49 +0000
From: Yogev Modlin <yogev.modlin@realsenseai.com>
To: Ricardo Ribalda <ribalda@chromium.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
	<hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] media: uvc: Add D436 and D555 cameras metadata
 support
Thread-Topic: [PATCH v3 3/3] media: uvc: Add D436 and D555 cameras metadata
 support
Thread-Index: AQHcRKoGwes/Q6CGmkS2V5eBSYLQiLTRJRsAgAN++NA=
Date: Sun, 26 Oct 2025 16:38:49 +0000
Message-ID:
 <MN2PR18MB2479A2A1FF7F921AD6E88C3D88FFA@MN2PR18MB2479.namprd18.prod.outlook.com>
References: <20251024-fix-uvc-v3-0-b7f83c012ca7@realsenseai.com>
 <20251024-fix-uvc-v3-3-b7f83c012ca7@realsenseai.com>
 <CANiDSCt30UjEEZd8-8Qsuqn_Ks2pOBE1awOwmZVsHPnPHVQ6FA@mail.gmail.com>
In-Reply-To:
 <CANiDSCt30UjEEZd8-8Qsuqn_Ks2pOBE1awOwmZVsHPnPHVQ6FA@mail.gmail.com>
Accept-Language: en-IL, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=realsenseai.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR18MB2479:EE_|DM4PR18MB4238:EE_
x-ms-office365-filtering-correlation-id: dbe46d00-fc2e-4cbc-211d-08de14ae240d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?WXVHbUh3N09VT2NKeE1hU3E5MHJJblNzdVI4WTVlYVRwL2RQbHVVTm1Xd2xu?=
 =?utf-8?B?U283WlZkaDNjMEhvcy9Ic2k1OEtQUE9UTW9GZFFEblFGVnU5Y3FoQndaclpH?=
 =?utf-8?B?TFkvUHRscThWUGk2bXBXWFNRdjJBTWFFWVoxd3BOSDMxcFpDdkE5Q0hjc3pY?=
 =?utf-8?B?RFpYWlR2TndUcWlDOXN5MGs3V2duWXREZXgwaWNyRVBMVVBBcFFHNnpBUzRy?=
 =?utf-8?B?QlVWUld5aHgzMTRPTmw4ZE9qMDBMVUY0ZGVQa0czS1R4K1NGRHpEOUMyb2pZ?=
 =?utf-8?B?WXU3WlNhcnNobXRUTUtkL3ArMmkyVWxjN29RRWYraUVuN3VZUlpSV1lVcDV1?=
 =?utf-8?B?SnNDVkJVWUdoZDFieEt1TkFlazdEaHl0SFJJU0dSSWpRU1UxL2diTHp2Q00x?=
 =?utf-8?B?NTVkNDZHdXcrak84aVQ2UmJuU1ptcllTaklzU1l0T0Q1N1h5OW1Oa2ZieGgr?=
 =?utf-8?B?b0U3WjJoaU5TTy9ja094RGwxeVdoWlpUd25UQ0twQzdFdVNVY3UyZ05YSGww?=
 =?utf-8?B?MmlYb01zSkY5UTJnUGlGTHJZRVhKWHo5WGRLaE9odm9vcEZwOTJTZjBvdmVp?=
 =?utf-8?B?TS9RYVFGV3I5Z0JCRGFNemtXRm4zakZHS0VYWWwvY0xFYUtKQzBHZTJYR2tV?=
 =?utf-8?B?TUx1L24vMTdOT1cwLzJRMzgvcUQwUWR4YUU3ZFRBT2FNeVFldFJkbSszRG4x?=
 =?utf-8?B?YTRUdnZZWUZKd1VoZUVmc1lETUs2V3g5c21YT1l6QXRnc2M0SUgyRHplOEFi?=
 =?utf-8?B?U0kvbnBPNzlBTUdiYWtZYmJ6SExKY3ZtMVM5cHpvVnkxZkVTR0I2WUNUV0F1?=
 =?utf-8?B?bENSQ2wyZVoyR3B5bGtmWW1lTnQvaWVsN2hST3ZDVmgyTGpWTitxYjRNbXpu?=
 =?utf-8?B?V3A5bXA3SWV1dWVaV3JFWUp3dG9OWmgrZGYrNXZEekRyREpHNHQzcXRMWGxq?=
 =?utf-8?B?MlRpQVoxczA3QjEzd05YWWJIaEJXU0J0NUpzVVRoejNjV3dVVVhTZGxtc3Zs?=
 =?utf-8?B?ci9iN3crSTJveVpZazd1RTUxNmJUS1BvcEZvUERpbVlDMUhTbG8xZHJvMlh3?=
 =?utf-8?B?MmRvNWJyMDM4eldGSXZGUUZ5WFA4djlITmRzeGdaSmdLNzVVQ285bHRkWG5W?=
 =?utf-8?B?UjFSdUc1WTJ0Y1g4eEZ4QUdZbTdIc2E1Tkc2UTdTTU96NU1leVFLUFJKVDRQ?=
 =?utf-8?B?WnA4SjdObHRQc1ZJbE5GME1lUUR4ZHJVcCtOTVVMRUFHelZpRTJiaGJkVlEv?=
 =?utf-8?B?VXZDeWZuVTlRNmxkSTROVXdBVG9HbStqV24yb2VQd1c5REI3em9zc3BUVHNU?=
 =?utf-8?B?S2ZzKzBpZXhvMmZVTWlER1VOQ1lMWWh0NWpHSmphbkVkWXowZy9JY29PN3hz?=
 =?utf-8?B?bnVBQUQvelBsc1lQWmxlSE8yY2NCeUJscUFRbVBuRlBRNUxxM0hSamdNdGc4?=
 =?utf-8?B?NzZCQTJMZWVIakpSUjUxdXRQN1pDTnA0M2NaNVNKcXNBcUw1dWh3cVpVMVNa?=
 =?utf-8?B?YisrbXByQlZIckJ2QmxZVmFpcUxmVFFkQ24xNVZJZ1l5VVFsSXZ6LzBVclUx?=
 =?utf-8?B?STB1emhpTTk4dlRkZkppMVFUaXdzQUEvWjlJcWF0SGhIZkM3cFQ1MU9sbElM?=
 =?utf-8?B?UmNpbGdQcHVUZ2Zzb3pLZFdTM1ZHeTBwNWtOUzgxK0wrcWppc1pSNGJyUXdZ?=
 =?utf-8?B?cTIwOHhPVjBKTXJ6aHQ5RWpnZEM5YjY4Ni9YRXk1WC93MVlEUkJjTGlxcmRh?=
 =?utf-8?B?SzJud3pITEF6dFJFbVJORTNYZmh0K3FjeXhXZkREM1Y1UlpqR3hrRm9KTXBw?=
 =?utf-8?B?NnJvOG40b2RtY0luZ0xnOUxqN2ErVEZvNUU1ZEZsdmxEaUxhaXNjOTZ6dGRQ?=
 =?utf-8?B?L1NraTArbUxZampmdmVFWEY1cm1aZE9LeXRvY0N4T0k4UE9TRTd5bkxHYmNv?=
 =?utf-8?B?RFNILzlqY0tYSlBRZG41SUh0Nk9peVhjQy9MdXprQTdGcnNwNFhkbkplWVo2?=
 =?utf-8?B?cVY1WElsTUlsMjF5eWU1bFBhMXhkdmVYME1CdGZhY094ZVA0L2F5Q0piWGxG?=
 =?utf-8?Q?oB1B3c?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR18MB2479.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFdhb3RWY3VGWWRNZDBQTWtuS2R0STJ5MmJIRU9ib2N3TEM3WlljOWE0K1B4?=
 =?utf-8?B?L1RSbm95dW0xYUw5a3M5VWxvVWhjMjI0ZXdyMXd3V1VNWndEMGRhVmxncFFU?=
 =?utf-8?B?SUpRL1VjNjJEMnpXM0N4YVFaQ1FaZjR5bHhDT3FNNlV6bjlDbXRTaE9DS2dw?=
 =?utf-8?B?NG9ncFVDTi9wMzM0L09xSVd5SHBSeEhLSi9KT1pBMWlkTzhuTGtJNlFYMDdP?=
 =?utf-8?B?dThTT3NwanBmQjJuTHI3dW1RWlY4a1RkQmlZZG90QWhwTHdSY3dTT1hKakgv?=
 =?utf-8?B?YldQSEIwM2lMZTRJUWFsbjV4Ri81cGNZUHVDQzFLZ2wxbmJrc1k3ZGNJTldS?=
 =?utf-8?B?N3VLU3gzd05lZzk2Rkt0T0hqV2J2MHVacE5FcmE3TUlvSzhKUUg4OVh2elBX?=
 =?utf-8?B?OVc3RzArOUVST0VZT05LblkycFAyS082QXpDN0U0MERZUkVVN05JT0RtVE5M?=
 =?utf-8?B?Y3BSYytUdUwwZTN2M3Yzb1BrdlRWMjFwRytsTGdSL0taZTB4NDhqaytBQjlk?=
 =?utf-8?B?M1NDcFNENjlDZFJOQjRCN2tNWWVUcTNHVGdxeHc4eEtVVGt3dlF1SDM3UU1O?=
 =?utf-8?B?TzBWcW1lZGY1a3BuL2c4TldQeEo2cGJrRmQyMmlZT3RVMmtHOHEvcEhKNFc0?=
 =?utf-8?B?bkEwblFjdlZwOUY1Y2k1amhEM0tRMnU4ZnQ5MkpKOE1ILzF4S0dOZ1ZUUWdX?=
 =?utf-8?B?QVVrM1pYbFpYV2JHRkNoVk92ZWRRY0RUYnQrenhTZVNIYXhuemtONGdKODVz?=
 =?utf-8?B?ODNUU0ZqN1lZTks4cS94cWd5MUlLcnhUZUNiTUFobnRnVGl5T3IxbnY3TVN4?=
 =?utf-8?B?ZUFRZ3YvVU9KWTZONkpjWDR1UDJBYmJjNlJHZThzQWtPQitUeWJXVThFcHdW?=
 =?utf-8?B?NVd4cS8yS2VYZzc5ZTJwdUV6QXhLWjltaTl3b242ZHVOcEtyenpaOGdtdDdh?=
 =?utf-8?B?SVcrWjcwSE5LdnkyaXJpRlFaQkdwbnNCVFR6M2dFeHZtbk5Vb253YWhnOXRG?=
 =?utf-8?B?VHduQWV6VmVhN3R4QUN4ajF3aFBRbVd2eWVzM1h3RytnYkJuc1ZvRU5pWlNk?=
 =?utf-8?B?YnRobW81ZzM4dCt3SFBOMHh3M1Z0Vy9DYXBmbE5hcVVxZzJEZncvSlg5Z21R?=
 =?utf-8?B?ZUdLUWV6RGhIQ1VDbFp5RDNMa0hSbnNuS3RkNjE3aTVDZkE2YjVqZWxvam5M?=
 =?utf-8?B?Q0JkbjdXVW56Ukg3cG1OQ0JsdXpGeUVPUVpuOGdzWVpWNi9iUVBwMStscVJh?=
 =?utf-8?B?cWFYcnEyWlpVZWdvS0JrTENsK0g4dmVBWTYwVUdBUlJrV3JiR2J5Z3lpeXZD?=
 =?utf-8?B?NjFRT3VLUzdzRGFNNit4clB2MVQzbEg0WnRJRGZUOXI2RkU5VzVkS0ErdEt4?=
 =?utf-8?B?aUJmdGJCSFBTWmxvYjVTUk1NQ2lES2Y2ZUpkb1ErN21UOWpWNVlQSGRrQjMw?=
 =?utf-8?B?RzhFVjlUWktFZjlKcGRaR0FrSGI3S3JneCtoZ2NOdWtxZUwzRlBMcDJIZE14?=
 =?utf-8?B?WDZ1dkRUZkVHOWRncGR4ei9NT1V1bTBGOHFqb2JOTFBCSnBVRFI3Uk1RbWtx?=
 =?utf-8?B?T2RKMy82ZkxLcTVHeDNodU8vcmV0dUJzWEgvbE1VUDkrUFEzei84cG5mMGw5?=
 =?utf-8?B?QTI0cUlZWDNVOHNyZURwenVncUJzSjBSQXhuK0k1aE5lNGpTcmwzMGRiVU9x?=
 =?utf-8?B?SGtZVElHakJkR1o1alkxSnYyNVdBUm9HRCtrSVErczNLV3F5RHhjV2NHQmV3?=
 =?utf-8?B?TEsrN2s4dmJSRURobkdIOXlITlByYnFjZGZ1SDdsYzFzbUI1OGl1NFFnN0ZD?=
 =?utf-8?B?SmpYejlZbUlRanQ4RWNTRklDY3A1cFp6Nm1YakFXM3dEbzQvamZMbkt3M2RG?=
 =?utf-8?B?NXhONENtbHJxSXZvZGFoTGFyMXBtK2JlTjd5TTFKaVhHOWpuL3VuRjFCc3ow?=
 =?utf-8?B?bmhWa2g2QUl5Vm1iTS9WR2Y2NmZTSmNJTk10U1JibEN6aGpSWXFjRnQ3c01r?=
 =?utf-8?B?azZpNlp3SVdaMEVSZ2FyVGU5anpndTlxRko4cWFQbHZNdGlNMHU3amdwaGYv?=
 =?utf-8?B?VnZ2SVRyakxWajk2Ti9Jc2pzYW5COW1xaERSd2hsKy9tZk5QVzRqaHdHS2FW?=
 =?utf-8?Q?Yd2z0GHKT9dojMVywJZ8OlVOk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: realsenseai.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR18MB2479.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe46d00-fc2e-4cbc-211d-08de14ae240d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2025 16:38:49.4706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 900a1806-5e7c-4a61-ba52-40ce09b89e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 90D8o0XT7TxbrsC6v7MRATn67GkWyiXqXnq3VILZ/ovTeIAcZLjKXrNktICvT5IzkCkqv3jeAhXT/a1xxCXNjpyGAECZaFN0WYa+12d08+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB4238

WWVzIEkgYWdyZWUuDQpJIHdpbGwgY2hlY2sgaWYgaXQncyBwb3NzaWJsZSB0byBkZXRlY3QgYWxs
IGQ0eHggY2FtZXJhcyBhbmQgbm90IHRvIHN1Ym1pdCBhIHBhdGNoIGZvciBlYWNoIGNhbWVyYS4N
CkZvciBub3cgSSB3aWxsIGFwcHJlY2lhdGUgaWYgd2UgY2FuIGNvbnRpbnVlIHdpdGggdGhlIGN1
cnJlbnQgcGF0Y2ggZm9yIHRob3NlIGNhbWVyYXMuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBSaWNhcmRvIFJpYmFsZGEgPHJpYmFsZGFAY2hyb21pdW0ub3JnPg0KU2VudDog
RnJpZGF5LCBPY3RvYmVyIDI0LCAyMDI1IDI6MTMgUE0NClRvOiBZb2dldiBNb2RsaW4gPHlvZ2V2
Lm1vZGxpbkByZWFsc2Vuc2VhaS5jb20+DQpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsgSGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9y
Zz47IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0
OiBSZTogW1BBVENIIHYzIDMvM10gbWVkaWE6IHV2YzogQWRkIEQ0MzYgYW5kIEQ1NTUgY2FtZXJh
cyBtZXRhZGF0YSBzdXBwb3J0DQoNCltZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gcmli
YWxkYUBjaHJvbWl1bS5vcmcuIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczov
L2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KDQpIaSBZb2dldg0KDQpU
aGFua3MgZm9yIHRoZSBwYXRjaC4gU29tZSBtaW5vciBuaXRwaWNrcyBpbmxpbmVkLg0KDQoNCkJU
VywgaXMgdGhlcmUgYSB3YXkgdG8gcHJvZ3JhbW1hdGljYWxseSBkZXRlY3QgaWYgYSBkZXZpY2Ug
aXMgUmVhbFNlbnNlIHdpdGggRDRYWCBtZXRhZGF0YT8NCg0KSSBhbSB0aGlua2luZyB0aGF0IG1h
eWJlIGFsbCBoYXZlIGEgc3BlY2lhbCBlbnRpdHkgaWQsIG9yIGFueSBvdGhlciB3YXkgYmVzaWRl
cyB2aWQvcGlkLg0KDQpJIGFtIGFza2luZyB5b3UgdGhpcywgYmVjYXVzZSBpZiB5b3UgY291bGQg
ZmluZCBhIHdheSB0byBpZGVudGlmeSB0aGUgY2FtZXJhIHlvdSBjb3VsZCBpbXBsZW1lbnQgc29t
ZXRoaW5nIGxpa2UgdXZjX21ldGFfZGV0ZWN0X21zeHU6DQpodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJz
L21lZGlhL3VzYi91dmMvdXZjX21ldGFkYXRhLmMjbjE3MA0KSW5zdGVhZCBvZiBjcmVhdGluZyBx
dWlya3MgZm9yIGV2ZXJ5IG1vZGVsLg0KDQoNClJlZ2FyZHMhDQpPbiBGcmksIDI0IE9jdCAyMDI1
IGF0IDA3OjUwLCBZb2dldiBNb2RsaW4gdmlhIEI0IFJlbGF5IDxkZXZudWxsK3lvZ2V2Lm1vZGxp
bi5yZWFsc2Vuc2VhaS5jb21Aa2VybmVsLm9yZz4gd3JvdGU6DQo+DQo+IEZyb206IFlvZ2V2IE1v
ZGxpbiA8eW9nZXYubW9kbGluQHJlYWxzZW5zZWFpLmNvbT4NCj4NCj4gQWRkIHN1cHBvcnQgZm9y
IEludGVsIFJlYWxTZW5zZSBENDM2IGFuZCBENTU1IGRlcHRoIGNhbWVyYXMgbWV0YWRhdGEuDQo+
IFRoZXNlIGNhbWVyYXMgdXNlIHRoZSBENFhYIG1ldGFkYXRhIGZvcm1hdCBmb3IgdHJhbnNtaXR0
aW5nIGRlcHRoIGFuZA0KPiBzZW5zb3IgaW5mb3JtYXRpb24uDQo+DQo+IFRoZSBENTU1IGNhbWVy
YSB1c2VzIFVWQyBwcm90b2NvbCB2ZXJzaW9uIDEuNSwgd2hpbGUgdGhlIEQ0MzYgdXNlcyBhbg0K
PiB1bmRlZmluZWQgcHJvdG9jb2wgdmVyc2lvbi4gQm90aCBjYW1lcmFzIHJlcXVpcmUgdGhlIEQ0
WFggbWV0YWRhdGENCj4gZm9ybWF0IGZsYWcgdG8gcHJvcGVybHkgaGFuZGxlIHRoZWlyIG1ldGFk
YXRhIHN0cmVhbXMuDQoNCldlIGFzayB0aGUgbHN1c2IgLXYgb3V0cHV0IGZvciBldmVyeSBxdWly
ayB3ZSBhZGQuIENvdWxkIHlvdSBwcm92aWRlIHRoYXQ/DQoNClRoYW5rcyENCg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBZb2dldiBNb2RsaW4gPHlvZ2V2Lm1vZGxpbkByZWFsc2Vuc2VhaS5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9tZWRpYS91c2IvdXZjL3V2Y19kcml2ZXIuYyB8IDE4ICsrKysrKysr
KysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykNCj4NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJpdmVyLmMNCj4gYi9kcml2ZXJz
L21lZGlhL3VzYi91dmMvdXZjX2RyaXZlci5jDQo+IGluZGV4IGRiZGFjYzY0ZWE2Yi4uNmYwMDUz
YTc4MTIzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RyaXZlci5j
DQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZHJpdmVyLmMNCj4gQEAgLTMyMjMs
NiArMzIyMywyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgdXZjX2lkc1td
ID0gew0KPiAgICAgICAgICAgLmJJbnRlcmZhY2VTdWJDbGFzcyAgID0gMSwNCj4gICAgICAgICAg
IC5iSW50ZXJmYWNlUHJvdG9jb2wgICA9IDAsDQo+ICAgICAgICAgICAuZHJpdmVyX2luZm8gICAg
ICAgICAgPSBVVkNfSU5GT19NRVRBKFY0TDJfTUVUQV9GTVRfRDRYWCkgfSwNCj4gKyAgICAgICAv
KiBJbnRlbCBSZWFsc2Vuc2UgRDU1NSBEZXB0aCBDYW1lcmEgKi8NCj4gKyAgICAgICB7IC5tYXRj
aF9mbGFncyAgICAgICAgICA9IFVTQl9ERVZJQ0VfSURfTUFUQ0hfREVWSUNFDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCBVU0JfREVWSUNFX0lEX01BVENIX0lOVF9JTkZPLA0K
PiArICAgICAgICAgLmlkVmVuZG9yICAgICAgICAgICAgID0gMHg4MDg2LA0KPiArICAgICAgICAg
LmlkUHJvZHVjdCAgICAgICAgICAgID0gMHgwYjU2LA0KPiArICAgICAgICAgLmJJbnRlcmZhY2VD
bGFzcyAgICAgID0gVVNCX0NMQVNTX1ZJREVPLA0KPiArICAgICAgICAgLmJJbnRlcmZhY2VTdWJD
bGFzcyAgID0gMSwNCj4gKyAgICAgICAgIC5iSW50ZXJmYWNlUHJvdG9jb2wgICA9IFVWQ19QQ19Q
Uk9UT0NPTF8xNSwNCj4gKyAgICAgICAgIC5kcml2ZXJfaW5mbyAgICAgICAgICA9IFVWQ19JTkZP
X01FVEEoVjRMMl9NRVRBX0ZNVF9ENFhYKSB9LA0KPiArICAgICAgIC8qIEludGVsIFJlYWxzZW5z
ZSBENDM2IENhbWVyYSAqLw0KDQpUaGUgbGlzdCBpcyBzb3J0ZWQgYnkgdmlkOnBpZA0KDQpQbGVh
c2UgbW92ZSB0aGUgZGVmaW5pdGlvbiB0byB0aGUgY29ycmVjdCBzaXRlLg0KDQo+ICsgICAgICAg
eyAubWF0Y2hfZmxhZ3MgICAgICAgICAgPSBVU0JfREVWSUNFX0lEX01BVENIX0RFVklDRQ0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgVVNCX0RFVklDRV9JRF9NQVRDSF9JTlRf
SU5GTywNCj4gKyAgICAgICAgIC5pZFZlbmRvciAgICAgICAgICAgICA9IDB4ODA4NiwNCj4gKyAg
ICAgICAgIC5pZFByb2R1Y3QgICAgICAgICAgICA9IDB4MTE1NiwNCj4gKyAgICAgICAgIC5iSW50
ZXJmYWNlQ2xhc3MgICAgICA9IFVTQl9DTEFTU19WSURFTywNCj4gKyAgICAgICAgIC5iSW50ZXJm
YWNlU3ViQ2xhc3MgICA9IDEsDQo+ICsgICAgICAgICAuYkludGVyZmFjZVByb3RvY29sICAgPSBV
VkNfUENfUFJPVE9DT0xfVU5ERUZJTkVELA0KPiArICAgICAgICAgLmRyaXZlcl9pbmZvICAgICAg
ICAgID0gVVZDX0lORk9fTUVUQShWNEwyX01FVEFfRk1UX0Q0WFgpIH0sDQo+ICAgICAgICAgLyog
R2VuZXJpYyBVU0IgVmlkZW8gQ2xhc3MgKi8NCj4gICAgICAgICB7IFVTQl9JTlRFUkZBQ0VfSU5G
TyhVU0JfQ0xBU1NfVklERU8sIDEsIFVWQ19QQ19QUk9UT0NPTF9VTkRFRklORUQpIH0sDQo+ICAg
ICAgICAgeyBVU0JfSU5URVJGQUNFX0lORk8oVVNCX0NMQVNTX1ZJREVPLCAxLCBVVkNfUENfUFJP
VE9DT0xfMTUpDQo+IH0sDQo+DQo+IC0tDQo+IDIuNDMuMA0KPg0KPg0KPg0KDQoNCi0tDQpSaWNh
cmRvIFJpYmFsZGENCg==

