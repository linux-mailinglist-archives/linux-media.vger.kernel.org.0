Return-Path: <linux-media+bounces-14377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B4091CC1C
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 12:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A64741F221DD
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 10:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EBF3D575;
	Sat, 29 Jun 2024 10:31:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543A71D540
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719657102; cv=fail; b=pX1ztRmpFIm30i+qImUVUGZooTHi36kjtEYYOugfq5K8J0eZUenUNmmlwuuZe8Fkw2m+FrOmrTJ63PnQ5oeeaFm1T28yvS3/jIYv0WFSq93+bxcBbAj9DMniAxmMAJFrDxR1F/IMnoAzFW+LtOvCrYiShXDxKO6OnSlyD0RHHbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719657102; c=relaxed/simple;
	bh=KpH7f4El8hfgvs4Tc1uDGNlDMi4DOzzN/yMNBc4pqw0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DDb2j3Nh4YAcq49U56gokT7IZI4xhBi7TBc5+Whr8QjM/ms7ZsZ6fnuyryu+Pk6W5g4vELV5qtF3PNfINT4v5lC4x/Rw/5oAoxpYzqqUDxNfA6YXwloLwDs7op4gyWhHwJWSuOl4lPa6FlwI5yeyBce7jWyziLDBdTvXW2xI640=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45TAFMcH011156
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 03:31:39 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 402dj003b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 03:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTz2D7fgT4bJahiJch2VMzgBPvtTjtbEQxTjqR+eaU66u3fmOzOzvjL7it+m8Um3J/dBnvcDzDNsRes7aMG4v30ebLZr3LdLZbUkfdLa2daFdE6k7HX+DSwsLEesUijsM1e7SD1x8bNPappNJ/djC1LlGyRA+hUxidz4nbnsh/g4FqBaKvS7RHZS8Xz7fomCbye7lorzdOnjPLODseDSXKKpJRqbB7u5OdvQIJnh0a9IAE+AwXAyqeCH96x4hqP6nmqNMtZY7ppY9pxRrqlhmNvSIv8jvFpacIlk5Y1AalzU2o7PVw4YuhAQpnD1gmtrH4QbKSL0GmfEsTu7nvZBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfHXoZsmEEsWYHusBzr5rY+/xxiJpsUOdq8Ag1N8XX4=;
 b=cPhMrB/JbERrGGds7K22YrDXw4/5nnR7ZmpVtGLvwlxe1dFkhIVkVJc70tvm1JeGGXMHFE/pVHvh8RrifSryKzie+biUhVI2NAn7pLTEQZ/3gEY5D8WS9+hJ50Mz0Bg+sjr9fEyhVBKPz+TAMcd5yGnyXP5u16QeXsUP66ZxYKtd4LErah5d9bIk14lqWltWOXLBvSLe9QJOtpBg107jrpyQb5nw/1IzmueiO4Ex1ppfvtxZ0BbIS4+EzkKNHuZHLudcOF+Wx90ETLNnZmUG2Yjf8JO1zDaMNWxraIJuTRjHzYD7E0ifDHWOh1A0WiT00NB9CJ1XY+8SDnC84f5M+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sat, 29 Jun
 2024 10:31:34 +0000
Received: from IA1PR11MB6417.namprd11.prod.outlook.com
 ([fe80::fe57:61ca:7119:ccf7]) by IA1PR11MB6417.namprd11.prod.outlook.com
 ([fe80::fe57:61ca:7119:ccf7%5]) with mapi id 15.20.7698.038; Sat, 29 Jun 2024
 10:31:34 +0000
From: "Yan, Haixiao (CN)" <Haixiao.Yan.CN@windriver.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: [WARNING][v4l-utils] do_package_qa: QA Issue: /usr/bin/cec-compliance
 uses 32-bit api 'time'
Thread-Topic: [WARNING][v4l-utils] do_package_qa: QA Issue:
 /usr/bin/cec-compliance uses 32-bit api 'time'
Thread-Index: AdrKD4jFSlbV7Eq1QmyIh8WcM4/ufQ==
Date: Sat, 29 Jun 2024 10:31:33 +0000
Message-ID: 
 <IA1PR11MB641773FE706ED51D1031CD0BDFD12@IA1PR11MB6417.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6417:EE_|DS0PR11MB7851:EE_
x-ms-office365-filtering-correlation-id: e8c1e28f-f56b-4b5e-1d19-08dc9826a5f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?sRoWH1hkgUqL1voAKQZ/tXG6Hj4okwjFzxNWTrz76Rct+jKGOrp7Y9ScxK6Q?=
 =?us-ascii?Q?Ac71HOBKSaTe2skquVPrMD4yOm+NDC6u0yn7yd/d11zLz6fcEfJe1SwrX5/f?=
 =?us-ascii?Q?nHWgJxe3VZi0YAo/vcDVABNfRBGHFSgjHQWf8X9MAr22l76rr1mMFH1JOtjp?=
 =?us-ascii?Q?YtUnhMsS51gqSC7xZZ7WIj5lRM0o/aU7K7EUafK5IOjTIq4FfNOL7GRQGNau?=
 =?us-ascii?Q?zmTL7t4cciDW51ySaddXIVkYv4BsVYyFAPOi5TXXYVentw0P5Ofg6p1uq4PF?=
 =?us-ascii?Q?yb24xie5cx/yXf7cAaMQ2F9L7Rjs3bWTHNDEuJ0ErpWoLYS3CjVrg88mX3zw?=
 =?us-ascii?Q?OT6co+ABWMP9w71NLCyFCBj8tJRFG+6F7lG55NZzdP3xLExqR49Pz1v29SKz?=
 =?us-ascii?Q?VnrCODOUrco5tbq6+CSs0rglw4iqUWo7TUTaL9gr3gZOW7+sIW8Vgvb0Bc7B?=
 =?us-ascii?Q?wP1mbk6+Qci37atVg8GQSd8kGrOjR5Ed996nC5G1lulMGOdHDqeDrfoh0HsO?=
 =?us-ascii?Q?RTWG7dCXhlXKCRt7EPky+XbjnqzAxrQWCB3Sm0WebpIw8lwobG8VvYbCRhrm?=
 =?us-ascii?Q?MuunDoR80iCX3LjELCNusmi86TeQsauB1B5XV1LkaYopo0/7ogffn2KjSIbR?=
 =?us-ascii?Q?ZiCrBz7gVJ40UCyZuLyKbAdsfWUYBfpTg2Fl+xSZ58hRyZvkInCEmkKA4xTD?=
 =?us-ascii?Q?8e122ZDwhnqg/fB2s0/Po2MnZ+EE4yyHeIDz2iZPSsVAOCvxsgYljixNyQk4?=
 =?us-ascii?Q?k7DS+UUzy4wG0VCGmc2mlLVduv2OvLyZga3PF8oNMJYp1/nZcHPohERnV0Bl?=
 =?us-ascii?Q?PyvtZ9nl0M/HF6paWhZo+fmQXhv2r/akNV+HXBauxkIv4JhGOEcviXAJAVid?=
 =?us-ascii?Q?ExJs5ahv/Q91u6EEzuyrN2zfJbVDtwW5DGDGYkyF2aLMYnQLEApNN3uzXfuK?=
 =?us-ascii?Q?tn67LEgLMU9e35vgnsJu3BRE5xzG7/bYhavLOf/uqN4XswkthiFznYw5IzvV?=
 =?us-ascii?Q?cIC15FUJ/xFcPaJ02/nirqQaLQSYHvastTgAioXP7OlVWRy9bhC8MmN5NRwh?=
 =?us-ascii?Q?IpPloV4xuzXgZY03f6QXiK5LCyOnAGxNFWvlhug+2Al6UCTq0sVd7iHyEmzB?=
 =?us-ascii?Q?C/HIZnlQTGd1kFjxxH7YQZauNmSBeus8B2tblDZClriXQz76FrodAQOPKV/v?=
 =?us-ascii?Q?7e2NKkQxYedkzitGBow3IaDxXlwRV4M1GUTYweXbQlkFjYPi+2v2AJrAyC2D?=
 =?us-ascii?Q?/Gw53okLaGroaHr3BKVY09ajxPiCbJH1EeM3cduFx6f0vgeQLyaIKwvZOygo?=
 =?us-ascii?Q?KEE0NmJiDTXFQQnVk6XSJujA7p6Bxr3xA924TG8cqw5dPO+4G/HnejOv38VY?=
 =?us-ascii?Q?WEe6/HGRAPJNsz0lazEQ/BCb0sJoiZKtSCcSL3f/dnce5RMlGQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6417.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RER2cZ2DyiPMarXMpMh0j4gojyd9UpRmHC9RcVWBdCk2HfBCqQ5Sqcqdl+Vf?=
 =?us-ascii?Q?ffJ4nyBOSmbPk1O7JznuHovfydm/LH0J4OAXZIqMPhEiTU1phGAvku5n7Ea3?=
 =?us-ascii?Q?SIIr5DWiY5JwnTjCk0WICGTe2IJr9GgMbsk+tYhbh4WGNc2dsb6SIA99rXrr?=
 =?us-ascii?Q?bNNhn9Q65+w/mDQDvdemZ+gcXOJdExW60SobdHyO0n+7XepNR0vh/LoSnp6e?=
 =?us-ascii?Q?7oE1R/HEGKCdWJnXc4DGkYn/Cd3IbuGNdys5bYE9QblEnShHLYACzhwIvW38?=
 =?us-ascii?Q?rWq6xqyoPKJeG3z+QQsjzB9fJUjBA4Jl7RTeM6JuOkCjVKVbFNzNZTB4MSRL?=
 =?us-ascii?Q?Nrx3Zte9YAvCjdRopSuvCmwQVjOlIDdXVeapbBdpCzdESzVNLx5Pkj1qoxhZ?=
 =?us-ascii?Q?FGTG75AZTJPWM239mNCQWTLpfVVttzsZgHCBHazG8Tbk+EMinRbq112Dw7OO?=
 =?us-ascii?Q?RQNvs4V7k3sHo28SlfE01179lIELi1JCIadDwFJmej/eLsBh30C5Bc29IOs5?=
 =?us-ascii?Q?pxw7YUiChFCIixAAWzlDmhPL36PjnqDmJ5OGfNiJRFXTcDHiNgaVGxFVSIEF?=
 =?us-ascii?Q?iyOfoBTzzgGyySm2ZXR3/EbgCwfVwpIkA8nc+CbyqXGOkqPvu3pRtHKP7ACc?=
 =?us-ascii?Q?tBVIJUlyikhcnSW+m8pRQAJHefi3oM4zNcGLLC9UBmVPRSKZOC03XGz38U7Q?=
 =?us-ascii?Q?lm+mICrkAolV7KAdngy77ef1CqlsPVZXtYOOcUoUYF3+nSPcFnoIkX6riBJF?=
 =?us-ascii?Q?IyXPBp5R3gxzLE6zD+bI/ri8M4h4UzZnSZLbpxapdA2L/kzszZGc4hC9vFRu?=
 =?us-ascii?Q?4OLb6jH4MarldgPNDvXdftAVtctR6/TZ1a49LfWG/gBC7CPK68oc/sqmvUWv?=
 =?us-ascii?Q?osnoML0OKFfk5DN8yulSrfDTDn2nJFr4NgfcQKMvg6WeajhAHCa/m9oJg/wE?=
 =?us-ascii?Q?4XO1zFI72krr3Ob6rZLYZqPq+QXQyPN/iyFJXPhm0rWUq+VG59UGkWIg+QuI?=
 =?us-ascii?Q?H4eqvwYcypA9E4SM8IZz9hcvXP5kwrAI0kmPn3FrJGfE6AQrgKuUn7AMShoe?=
 =?us-ascii?Q?Ud0CzfjJKCzHT4Fg4nFF5OqkoO4lm2R9N7mGe2FD3JwM81UfqpvcprtjZA8A?=
 =?us-ascii?Q?Hod4o/DY0RzgEPcWSOK/Lxip2OgG/gm9ivVs782vbm3qLvZP2Nd5Oi3yToLO?=
 =?us-ascii?Q?HBSiWKcktDC0P23ql+B4j+VvtgZRJFM/vd4ytyrYhX1n4fYMgrwkKT1pNlBL?=
 =?us-ascii?Q?OzAvYiLmKeZhWImUuIG6LEegQLPT5sFvH5DvSRd3D887/OwlmQ/cNWPDgrfs?=
 =?us-ascii?Q?aw1nPUwfKJ/P+Wra2lWhLISafIQR+2MRl8aBkVJ9ErJTgdXgeW0NqLbVgzKH?=
 =?us-ascii?Q?C+KzVbegAlwDB6to3Ud4tOxINioekqX/sGbBndXNnETZFA/2SC31me73kPqk?=
 =?us-ascii?Q?Z+p36LmTIsdjFk2+ox8+OTRHUeoaNiLA2RPnZR9LVEDG/j9oZo7dFwZ5UmWb?=
 =?us-ascii?Q?ayl9oYnCmIKSjyj/YCNjZC+78GDynI4udHQb2q6Udv51qj4b2AU+KK3ewhH+?=
 =?us-ascii?Q?/pS/l6kuyyFhCk4vlTOSCgrxBrDGZGws9bIy4RlHjz+iFfkSPa43Z0+nXzcY?=
 =?us-ascii?Q?/A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6417.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c1e28f-f56b-4b5e-1d19-08dc9826a5f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2024 10:31:34.0088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQW+B8VmanNJn8SOUudF3o+WNz9jMIt5dLR00XnPBmz0hHJcE1wfMH4MiA9RoDy2aI4PQYMdvWZibIrzu5fwz+bcsNPzUPp9Vnivi4sJsQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
X-Proofpoint-GUID: 0RHWkuEQ9M9KFzJElDNrbPqWSEb1_S5j
X-Proofpoint-ORIG-GUID: 0RHWkuEQ9M9KFzJElDNrbPqWSEb1_S5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-29_04,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=835 malwarescore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406290078

Hi,

On Yocto, when building 32-bit lib for v4l-utils, met the QA warning issue.

WARNING: lib32-v4l-utils-1.26.1+git-r0 do_package_qa: QA Issue: /usr/bin/ir=
-keytable uses 32-bit api 'ioc
tl'                                                                        =
                             =20
/usr/bin/ir-keytable uses 32-bit api 'stat64'                              =
                             =20
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/media-ctl uses 32-bit api 'ioctl'                                 =
                             =20
/usr/bin/media-ctl uses 32-bit api 'stat64'                                =
                             =20
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/rds-ctl uses 32-bit api 'ioctl'                                   =
                             =20
/usr/bin/rds-ctl uses 32-bit api 'ctime'                                   =
                             =20
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/v4l2-ctl uses 32-bit api 'select'                                 =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'fstat64'                                =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'clock_gettime'                          =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'ioctl'                                  =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'nanosleep'                              =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'fcntl64'                                =
                             =20
/usr/bin/v4l2-ctl uses 32-bit api 'stat64'                                 =
                             =20
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/v4l2-compliance uses 32-bit api 'select'                          =
                             =20
/usr/bin/v4l2-compliance uses 32-bit api 'fstat64'
/usr/bin/v4l2-compliance uses 32-bit api 'clock_gettime'
/usr/bin/v4l2-compliance uses 32-bit api 'ioctl'
/usr/bin/v4l2-compliance uses 32-bit api 'fcntl64'
/usr/bin/v4l2-compliance uses 32-bit api 'stat64'
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/v4l2-compliance uses 32-bit api 'select'                          =
                             =20
/usr/bin/v4l2-compliance uses 32-bit api 'fstat64'
/usr/bin/v4l2-compliance uses 32-bit api 'clock_gettime'
/usr/bin/v4l2-compliance uses 32-bit api 'ioctl'
/usr/bin/v4l2-compliance uses 32-bit api 'fcntl64'
/usr/bin/v4l2-compliance uses 32-bit api 'stat64'
Suppress with INSANE_SKIP =3D "32bit-time"
/usr/bin/v4l2-sysfs-path uses 32-bit api 'fstat64'
Suppress with INSANE_SKIP =3D "32bit-time"
/usr/bin/decode_tm6000 uses 32-bit api 'ioctl'
/usr/bin/decode_tm6000 uses 32-bit api 'select'
Suppress with INSANE_SKIP =3D "32bit-time"
/usr/bin/cec-compliance uses 32-bit api 'ctime'
/usr/bin/cec-compliance uses 32-bit api 'localtime'
/usr/bin/cec-compliance uses 32-bit api 'clock_gettime'
/usr/bin/cec-compliance uses 32-bit api 'ioctl'
/usr/bin/cec-compliance uses 32-bit api 'gettimeofday'
/usr/bin/cec-compliance uses 32-bit api 'fcntl64'
/usr/bin/cec-compliance uses 32-bit api 'time'
/usr/bin/cec-compliance uses 32-bit api 'select'
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20
/usr/bin/cec-compliance uses 32-bit api 'ctime'                            =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'localtime'                        =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'clock_gettime'                    =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'ioctl'                            =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'gettimeofday'                     =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'fcntl64'                          =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'time'                             =
                             =20
/usr/bin/cec-compliance uses 32-bit api 'select'                           =
                             =20
Suppress with INSANE_SKIP =3D "32bit-time"                                 =
                               =20

After investigating,=20
meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
#v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to
#both 32 and 64 bit file APIs.  But it does not handle the time side?
#Needs further investigation
GLIBC_64BIT_TIME_FLAGS =3D ""

GLIBC_64BIT_TIME_FLAGS =3D " -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64" wh=
ich defined in=20
oe-core/meta/conf/distro/include/time64.inc was reset, so result in this QA=
 issue.
=20
when comment GLIBC_64BIT_TIME_FLAGS =3D "" , there is build error.
/build-v4l/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-v4l-utils/1.26.1+=
git/lib32-recipe-sysroot/usr/include/features-time64.h:26:5: error: #error =
    "_TIME_BITS=3D64 is allowed only with _FILE_OFFSET_BITS=3D64"
26 | #   error "_TIME_BITS=3D64 is allowed only with _FILE_OFFSET_BITS=3D64=
"

the build error is caused by v4l-utils meson.build:
v4l2_wrapper_args =3D [
    # As the library needs to provide both 32-bit and 64-bit versions
    # of file operations, disable transparent large file support (fixes
    # 'Error: symbol `open64/mmap64' is already defined' compile failure
    # otherwise)
    '-U_FILE_OFFSET_BITS',
    '-D_FILE_OFFSET_BITS=3D32',
    '-D_LARGEFILE64_SOURCE',
]

D_FILE_OFFSET_BITS was reset to 32 during compile.

Is there a solution for this?

Thanks,
Haixiao

