Return-Path: <linux-media+bounces-14410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 643B691D080
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 10:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3D6DB21167
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 08:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4DD41C92;
	Sun, 30 Jun 2024 08:17:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5BE3EA9B
	for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 08:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719735470; cv=fail; b=GfnYuwI2uhuxH3ULlnEWjimHucU7kQxsn7hOojodLBjIm+POzMBS32B4H0bp9hDk1pQ7ByTiABZe3QNUZdxf7U7o/+EvzRmnleKDDwoETzrAflrTIDJguGgnOZq+L9od/dYWisbthB3ZUqKk4cOyNALop7mWyOqrNIb1ndN/gMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719735470; c=relaxed/simple;
	bh=/1DBYX9WNTZ2Fs0AIR2RQFpMgo7biYsZxwfuzvOD958=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=todUJSk+GU0qY2JcKLlp4WygdFyJWQIiPsH3j98HmN5WCsO61WoINRz1CPfmxrwVy1iYkFLiCRGgnC+ZpWwJ+cOSilLG3BhysVFbd2Kxw1RbMZu03T4Cc/+OyI6rP8WxOuh9LUfzqj2mI9eCy6R+pAwPTwYFYuZGCr+XV32QSHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45U8HkHk028047;
	Sun, 30 Jun 2024 01:17:46 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4033em008a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Jun 2024 01:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXN81eQ4jX8+xab78OEILOGXgfWyUly4mH4+Fwxtyno8XJKqM/+nf7GXOtZtebzdWMqLvp5d6nvdLDZEXaFkQ2K3HLBnEPA2+z8pIbXwaSLOl9Z1XxCuRYAdh7ry5envA0k82dMkrvu6et8wMfOxT8H9/5bVHQCVVy6JtzNGIrmvExJQsI2dmJRXitGlz2CE0FRV5EmmfMN5X2GacIujD9BhUCB2pfV23DdZgnmUMisK7iRZ9lBEsp5JMD0o2AVkvBu33/Tkw6srytywM50r1gFxIWuXFlnSkBM6f3vBkBCeAGF6Scn2xZxUuwXLRkG5xUjr5yFHIBx4KW/iopRV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmwkuhqCvrJIkPu3OUDn3As7pX6jgJNENPlZWamNjiM=;
 b=Vx8lyaizkRIUQjOY/egZNoRbIAEZMbeYH2uT1UTSPfthfI51hfY2M7/+m3FkzbPs19ZyTFq4jPqVHZxDVvicCDgPP6SVX4ic4+HddH7mDWk30wjzogmt3fSylouYFpvjBBJ3+pfZqbikEK0Jtjqd4JpSD84oLc4aEuc+iMDERsk4T/0xOBvnvN1UKnpOZsFPyCAH/GIHvN6a3OjRC+/RUjR8yUoiV+1gE3ZjVUhIR3V15LzMMCFhktMVT1buTzRVujapppz0JHtZDbrXsV5Ke5ofxszaI96Y8AG96+2XnqOEKaLwSicnDJXtOFZsITYMWCK+FCI9Lg886J5Nj2INdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 by CH3PR11MB7914.namprd11.prod.outlook.com (2603:10b6:610:12c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Sun, 30 Jun
 2024 08:17:39 +0000
Received: from IA1PR11MB6417.namprd11.prod.outlook.com
 ([fe80::fe57:61ca:7119:ccf7]) by IA1PR11MB6417.namprd11.prod.outlook.com
 ([fe80::fe57:61ca:7119:ccf7%5]) with mapi id 15.20.7719.028; Sun, 30 Jun 2024
 08:17:36 +0000
From: "Yan, Haixiao (CN)" <Haixiao.Yan.CN@windriver.com>
To: Rosen Penev <rosenp@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [WARNING][v4l-utils] do_package_qa: QA Issue:
 /usr/bin/cec-compliance uses 32-bit api 'time'
Thread-Topic: [WARNING][v4l-utils] do_package_qa: QA Issue:
 /usr/bin/cec-compliance uses 32-bit api 'time'
Thread-Index: AdrKD4jFSlbV7Eq1QmyIh8WcM4/ufQAtPAjQ
Date: Sun, 30 Jun 2024 08:17:36 +0000
Message-ID: 
 <IA1PR11MB6417BE9A56F60EFA578773F9DFD22@IA1PR11MB6417.namprd11.prod.outlook.com>
References: 
 <IA1PR11MB641773FE706ED51D1031CD0BDFD12@IA1PR11MB6417.namprd11.prod.outlook.com>
In-Reply-To: 
 <IA1PR11MB641773FE706ED51D1031CD0BDFD12@IA1PR11MB6417.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6417:EE_|CH3PR11MB7914:EE_
x-ms-office365-filtering-correlation-id: f20fc01f-35fe-4b89-6e23-08dc98dd19b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?rtgNpakcs1ue840+A7kJbbmrxr0eZrWSvfpmSi8P9CJxGyEiVDxnHHqMG1Gy?=
 =?us-ascii?Q?88eopJs/jFcr5mZaJagLctYazGO3O8kNWfbfAtUpDbOJUK13AumtPYE+lVxi?=
 =?us-ascii?Q?pU9uKkz9bbiUfHGPq/PyX/eIKpDb3e5cO5d6cN4OBcmDByf615KG4VgCV/IH?=
 =?us-ascii?Q?BuP1kgp9iUNWd63Na8vklZ0Z5dnttupjBGMq+upW1j+6Esp4YGGqwkx5PdNp?=
 =?us-ascii?Q?IaAw4AEJ9rSq/Mw9EIaUdIaZYpS35YcIkocjH9vr41kYZ6j0cV+XE+W6JCQ2?=
 =?us-ascii?Q?bY2RXbUJXIXh3TISvOlDcelHdilsLWrXfAkCbXPMQTt/ULyKr8vCQlAMTH6m?=
 =?us-ascii?Q?DxlIrXRpBplLwu0HPuVWn4t6+7qfGJAn+R34PvZDD8Gt3MdUt3luMVdcy1sV?=
 =?us-ascii?Q?il8B4myiZXXi3pA/teu793kl4yz/zOQtlUX5oY8CNhhKTg6+da6XgjpyM9r2?=
 =?us-ascii?Q?zDaaseYM2UqL+aPSzOzItzWgutYcFe7bB7+SqhNrctxj93nf/qHlQVHxyuyf?=
 =?us-ascii?Q?2GfYvSFwjaDQGkxWKT28I5vHFj/eHJo2zDQB0O3DUtixVJSvW2ioJaKuy3sr?=
 =?us-ascii?Q?iqSJRjahC31sE3puN3yhv7B7w4Knbpntzmk1Cxb8aurToYYvM+LBA83qvB/D?=
 =?us-ascii?Q?MT1mlUnzUQ+o9XRSzGcC6+DAvsr1ZvCe5mp2X7gxo+XbEza980rDnevsYGVZ?=
 =?us-ascii?Q?2d9HPLOoClSqa2UZQaxfADyvqC70FqAaI2CZOt8kZYCBIqI+PxpZ+t/XRRZl?=
 =?us-ascii?Q?NhNZuBlCCA7TeO89+MPraIiVsVHa9rFkVtlPwoSaKR4z3H8dgjq7uF365FqU?=
 =?us-ascii?Q?N1KzgPXooLZj//H1cExpk8Q5bYKzvqNFWOuiPtoVTjg9mBA3WwZQTteDlJwb?=
 =?us-ascii?Q?cdmFPGa1tkElp/iIfwJMqRzlAP1f7Wzo62iDzf1ggvP+vrs924BwcPbo3ebt?=
 =?us-ascii?Q?i19l640adWyif51Ufnx3yAdQyoCZmNsXptPpY6xpI/zskHkk1SwA9c8Sg/5z?=
 =?us-ascii?Q?vV6AA+BHv1wd9ru9RIBBYdABRg5qJn0NVxab9LzPyG8FYU55gqGzEHDdm2SK?=
 =?us-ascii?Q?F0OVJLySGKQR372mNQOEdL1FcijhoDSbbDLrtypdsjIXrAxMMNjrdKK9oxYm?=
 =?us-ascii?Q?NVkfavmczVxuOy/MtLwO7gkO19CrnrfPL5wF10R8wZCBUK3vBht2dF+XpHYF?=
 =?us-ascii?Q?kxqh/i1afkItEKBTFRyD7scNHZkj2ADDxXRGMrXs9TvJfP+0aweEhkWbtrgc?=
 =?us-ascii?Q?W9mcu2PPKJ/FbQN6TxsrR14ApLFVBW4d5pO7uHDzwMGFZ1WrTkltgzr7U4s8?=
 =?us-ascii?Q?Alfvet8rg0CEgEtniAydfvC0fKrm8/yHT0nCXgvQaBPh+JrF3ot3vQa411pU?=
 =?us-ascii?Q?Rj+YNhTgNgbqyyaC7IwCJMwaa1rcKZehkBF3/2RbjQLky8I5Xg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6417.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/k6D0pRFUxykOkR09DS7A5SlsaBSQb52RU9+F17suf/Z8+s+opCcqIFI+nUR?=
 =?us-ascii?Q?drI0a56G6ZKh90rAaU8aTv4qd6jMh0HeuFxTceUknja7LC7ynCYciSamxksa?=
 =?us-ascii?Q?PZC7+x6zY74gA8fiz+6HlNx7eHsf95UMjzeMHjMpViJ6FK2GxkHZceadrJeE?=
 =?us-ascii?Q?/hF3SninecO8JZxHAkDPDMOIIAUlCWWNGwPHAs6k5tZGlT6AnYB2J7S10jw5?=
 =?us-ascii?Q?Q5V+JzsEWqvYfsHnA2Ww2V3Pzh2zQG3ADpzerwRoCwu2vusaS173RVeYF8FM?=
 =?us-ascii?Q?dqUN9LVEV4Ku/TzKc77EUpk4js5spm2I4irXjiBL3czf6BRSlit7Y4drRaKe?=
 =?us-ascii?Q?WjdZeR/yFQEzDmAxIssEa0SWwBmAUNCN4nll8oR6f6Gs+9t7l2nu9VVBOtnm?=
 =?us-ascii?Q?h4V8dMsn47DrLhDkSuwL8sUEYM98bT3ZpWgEDAoamOSR1oqS2w3G390bBPri?=
 =?us-ascii?Q?8YSK0J1abrIYTLD1sZ9aH85WXK7NsG9IzHHnF6hnF8ovluyOEEOjpxzWOvnm?=
 =?us-ascii?Q?RuhPJFVPPKTIPyHA2va4lOs4QxxQ2n0WpKXCbBfW0SMR7tT+MU7dAHS0OP8X?=
 =?us-ascii?Q?71fTGDZGf8w04NIsfL/bQGZmJ3pM8OeVaNxcq35SZEEMmKtmek7ZwUcrq4ND?=
 =?us-ascii?Q?vS95aIGYu7M5QqY+CEn6Plgn582kWcjIpyvCsRZO6ErzlRvRKOOMcTbaP8ir?=
 =?us-ascii?Q?ChOfAXKNhOvHU4LcvYOUOrX9ek3Juz0+LS3+Nq/u20xxfc4A8TcVny59cnIf?=
 =?us-ascii?Q?LtN+gqX7nzYA2P0oqAUNOaZITPDxXp7452+xBtEHWt+VeGtCfGW17wQUa0pE?=
 =?us-ascii?Q?49OhHc3gXvrf+FqYaLjzjFOiQw8g48dn8EA+85V25yp4xVBnk4Sydt3zKMsT?=
 =?us-ascii?Q?hcITHH9i2VOtGj3ZNt6WfgRbJl/OIMNQ+lUf/I8o53UwEAb3RDvyZ3nWdC7O?=
 =?us-ascii?Q?VYL9yjG3ssC5C/UzO4VOHVKq+SZFxW8cXq6Pysyna0CeAKgsf76EtboPVVRN?=
 =?us-ascii?Q?crmZutZvmG3srp5xwJJq8lGCCb/SHf8eqVWLLE1CDFdujvCaEcQWK9Dp/kVB?=
 =?us-ascii?Q?g60PwCFGCUt2FS306viU1s+4nzotJ95NNixeyAXkbirmO+WoKPbpIXKB1kQ1?=
 =?us-ascii?Q?KdcWlB8NNobOXYBRc3s7+L0wa7rbKdukM1t+gpcgfOBw4+MSAdzu2VE9HWe2?=
 =?us-ascii?Q?tqKYWLrOPe9+htibq3wOVJHW80wFwIYulnBuvIUnnPpexSjz0Ep51L7o/nVT?=
 =?us-ascii?Q?FBcoUnC5DtknQdHrrhEQdT14kRO9ahqXh9nxrbCmOM9I7RzqCTBG5VMJaUKM?=
 =?us-ascii?Q?mQYbNuRRSDtyooRQJH0Qln4floYSN8W4M7jGxLN3UvBZ1wIa2aIzvrfumR4o?=
 =?us-ascii?Q?c0ZXYBkX3lf2HyYXw2LRBgpIWBWUvzobBK14nCXfMPnu6v7s39O6ntlZec0I?=
 =?us-ascii?Q?w3VWnGaRpIJISLcf/38NDlM/2fLQp8yg3S06A6oOgf1SedZqD9F5Ts5Pr4cD?=
 =?us-ascii?Q?c2x1OJOo1lr6Gmy0YmDltBMvKh/YyIDyDzjwm1rkPZmyh17AZeNYrN4WGo4y?=
 =?us-ascii?Q?ach9S7ZMSXdzNT88dE+RL1LH/ip/9KTfCxgsf+o1OIo9nzcNBGRYpY4iG0GT?=
 =?us-ascii?Q?JQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f20fc01f-35fe-4b89-6e23-08dc98dd19b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2024 08:17:36.6001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kLADe8xRonrRIKxChREXNpknOvf3S3plG1+r5s7RF/c+xJjyqcO3kclKZkibrYzwjMHDcjAIkfDR7Zf8HDUqbeb4oApKLkXh74bdxBIvHAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7914
X-Proofpoint-GUID: DIALhCoZwTAljpk6401PwWlC42Rj0Ud4
X-Proofpoint-ORIG-GUID: DIALhCoZwTAljpk6401PwWlC42Rj0Ud4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-30_06,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1011 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406300064

Hi Ronsen,

Is this issue related to your commit?
v4l-utils: fix compilation with 64-bit time_t

-----Original Message-----
From: Yan, Haixiao (CN)=20
Sent: Saturday, June 29, 2024 6:32 PM
To: linux-media@vger.kernel.org
Subject: [WARNING][v4l-utils] do_package_qa: QA Issue: /usr/bin/cec-complia=
nce uses 32-bit api 'time'

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

After investigating,
meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
#v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to #both 32 and =
64 bit file APIs.  But it does not handle the time side?
#Needs further investigation
GLIBC_64BIT_TIME_FLAGS =3D ""

GLIBC_64BIT_TIME_FLAGS =3D " -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64" wh=
ich defined in oe-core/meta/conf/distro/include/time64.inc was reset, so re=
sult in this QA issue.
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

