Return-Path: <linux-media+bounces-34602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E70EAD6CA0
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F11BC16FA2C
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5629C22D4FF;
	Thu, 12 Jun 2025 09:50:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020106.outbound.protection.outlook.com [52.101.227.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D016F1F92E
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721829; cv=fail; b=JXYvsQOGTWafwaxZiHVNvydquL4z+QUsz6WETkP3woPr0mwrOqLsDpxiR67LRNjBPd4jaokAvNBNx/XbLJOfaBHe22fPFNybYHwQtnOi6rkjZESqG0QJqdA/YIBA53oPxfKHjWuaQkcwTGmHuRSzSi4pd7B37nPy70KXujRgO4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721829; c=relaxed/simple;
	bh=+SoHYaDzu8fsYCNNucgnfcl4ErIVfwG0WK8gk2/Wocc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OCWipPqqJEcEQWH68w+znP8fegUGQRk/hy4MZONgPl9mwlQOlXXUcE3usnyFDSbfij6O5+fkDl6pQ7/LIhuLyQGG//aMJNsm7fQvmp+wvm6H5Tz10Es6fydAx8XveP4K1a1+tY2bzFpBGVlLhIRJPQpfVbCwI9P6tvtdwco9bJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nr8rZr925T15SBYyi3P40KgE66xqAFldAhImi2RhQU+nU3B+SmbgFTx+Bp+MZt4LeRA/ozrDl1/bO7Bjypl4vSL4bUoYGsJK6eZAEciwEuKf7+/SZwi+BFPfugm32w/pv4nDDbm+823vgsCqVM5CuOUrAkC73tDifwm2wbmkMo6Axl989CrUabRbhfj9uJ6t1OKlA8EsFM1iYOAOf75334f2UsbFYmQBjtKw2TOvHguLwwoucT5EsJG62kfziTOBm6DBnG/YN+bWNlsE+Gt6kwbzCzRLwYJig6GclLOTOY5osqTzsQwDA0hEQBGdTKGxz3pVdCPDPs9M9DyEj/D6zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SoHYaDzu8fsYCNNucgnfcl4ErIVfwG0WK8gk2/Wocc=;
 b=WJPV9/Q+WPRAbNYG0AXXo2KSLuY41K8O59gspppYpuKQzJL7ERJwInOa84EngsNBWbKKTqjMKjimxZC/eBJhhPm4Vh9a5/BKrx7yJJNl3vqSAKOPUsKiP8bteYpLbBFYWYv1g5xK0+ey48V8DesnK09Fd8ROCGLZ5F8hKXnQOya0Jkx0aMkxFwnvMm8ziw6BlH7IxBYgcg+M9XF8gZJt0dnF6tV1d/bwttMAnBict5KOhYPgy9uJaKGEFhPeluafDNpRVUQRptBKWy94/em21ujcrHK5AgKFclUwCABa82cgq8JpLyARtEZd7cg4mKZtlDAVzbOy0jNZLzPrdLfz9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB1775.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Thu, 12 Jun
 2025 09:50:22 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%6]) with mapi id 15.20.8835.023; Thu, 12 Jun 2025
 09:50:22 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, "open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword: bdma_(?:buf|fence|resv) b" <linux-media@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Subject: Re: Issue: Stuck After Successful VIDIOC_STREAMON with OV5695
Thread-Topic: Issue: Stuck After Successful VIDIOC_STREAMON with OV5695
Thread-Index: AQHb22gYf5eLLq3cRku7ZKJP51USUrP/QKwAgAACjAs=
Date: Thu, 12 Jun 2025 09:50:22 +0000
Message-ID:
 <PN3P287MB1829C80107E00CFDBD3133718B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References:
 <PN3P287MB18297E8A4F568F064D19A1D18B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250612092406.GA25137@pendragon.ideasonboard.com>
In-Reply-To: <20250612092406.GA25137@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB1775:EE_
x-ms-office365-filtering-correlation-id: 35b2fe72-a7cb-40a4-656d-08dda9968cac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?yHRrRhWYpMqXF3+v/O3Knfb4v8al0bO+xIC7Off3N7T8aZKwwLqN3soZ?=
 =?Windows-1252?Q?olWxHlSlKi2J4ELFYoFO6aYdNfVDz0kO/xeqYoiiCzgpB1iHDE0kefmT?=
 =?Windows-1252?Q?WnZFhULCCYzc0YgOYziz2UHUqNRFGVZ0zFZ6anGupsY0P+/h3Jc0YnVU?=
 =?Windows-1252?Q?mdXbRmd6nPZ1hPode2XuF08nq6zDSBdDyzi5L7D55/vn2zCaOmae3/80?=
 =?Windows-1252?Q?9RiJA2Wk6laVroEYm9GGQ5fpfiz97T0d40m8UCa9+MYhIloH3GDeuqub?=
 =?Windows-1252?Q?ZBmUv0VgawqhAYk+ZBMTTwLeDQnaaWE/XtBZjMjzahFRo9ns3ba+9irH?=
 =?Windows-1252?Q?vnYXhDc69BGe+DvrZu2imIrnyrSr3VZp4EEFSPF36MPLUEA+5vP6Tu1P?=
 =?Windows-1252?Q?6NmOcxpA3Z/TVYiVX1TaRsBpW2W4DiIsYUXWUluU4vrv4iVmc3S0Zyxg?=
 =?Windows-1252?Q?99C+77tFck0r8ODQkJyNK9s7ECnuFkHmnODGVyslKiUvs0SF8yg6M1fk?=
 =?Windows-1252?Q?IN3tMaVqm4FOy3BSFa+uEyg1BdU/1Kwr+GJk1+r+6CL9pQapoZ4FjXvK?=
 =?Windows-1252?Q?qWlcupAWpXgHyMtpZCBDa2Gjcmo9RpCcXs3IeLZFAqWF5tt8pksPrpvK?=
 =?Windows-1252?Q?5ZMXLY44dp31fQ3DaGLW9cQbM0KZDJJZugfM99jkgAUB1oC2o2K/y7GF?=
 =?Windows-1252?Q?u58JF9wCzwQEhyQiCMER0f6wbxA0+pYRjNqBDXAx/V0FtMzUu/2Hkz9C?=
 =?Windows-1252?Q?s3uJRozbDB3t0qYuRPdVhMwkTvnxkcBiV/ry522H7ebHC7/Wqast48Yq?=
 =?Windows-1252?Q?x5uVyMrpowAMYD6r8UQJ1eDYwbicLoRAd0Tl1fIlXkO8J7pZZKZTu56M?=
 =?Windows-1252?Q?KixLPMvg3i9VcJd/0NwAA5m+fo4HPzZhhc42Z2RN737MsLrXO1rjLQEI?=
 =?Windows-1252?Q?J9rhy1W1rLHcDoMxVp//fGkStzR+XDtdQsolyTNaHW2xzRoijdfbkEp9?=
 =?Windows-1252?Q?Vksa1Fg9GpeILDWOtZIl1H10jNaGpRk8u7ZIsM0/4CTQ+nl/jib30hVh?=
 =?Windows-1252?Q?Az5PORmchh38KMzNdN0ORY+s/94DMMwnI/4L2caAlH/DBJAyggLE2r3r?=
 =?Windows-1252?Q?EJXi4jvQIcMXGafkRuD4/pYEgc0J8dGhYN1u7OJW0Y2fNxlJ0cSZlKgQ?=
 =?Windows-1252?Q?l+zx11v62RL2xUtUAYrUg4PoqcNXrnS7wCWoZY0IdbMi3LgWVwbz/pzn?=
 =?Windows-1252?Q?bIxRVhOHhxYOUdMqEoQAdkQcE2rAhrCHPSNKVEQJHXmGjeh3eHjFLRuP?=
 =?Windows-1252?Q?jd/qZpY1hAzBBxmvyNCbK9UMp4pF9nWEm/25eL27Kb/dgGCLInCdkZWa?=
 =?Windows-1252?Q?Jrb8IcMeN0+nptQk40YOfSXINKBEn2ldo479pBvScdtczEXL0ArjlqnR?=
 =?Windows-1252?Q?GpkE/s5BpZkt17tZ6LugGURxFxDnLZmtLW9y1OKk6JgQg/IjpKSsm8ex?=
 =?Windows-1252?Q?xhX58gxewmfOiW+enfTeLijwkaTkypU2khgiK04OMaZ+HfNxEa4Ihbdc?=
 =?Windows-1252?Q?QBN1iLa0Mz0nx5n+ls463wYPtFJKj+nHXp2Apg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?FJDqByQV4G1s0DqjrNZL0BSPh8aecK4xA+0oKddrLqG3IUGwuTcPhURO?=
 =?Windows-1252?Q?/vDCt/Ub25tDEdRl4fSd5e7X+jsrnSOUWnOtJEGzeSPe0RSkNiJtE86N?=
 =?Windows-1252?Q?M+f//kTSl5GISAUA6fNECySR56K1cFJE3k++HIzPyBoMlHOfiB8HSmy3?=
 =?Windows-1252?Q?Sef7CNWB+rV8NVPRHkMH5mm/kYmFDoAd0UwGd3wNdyhbPLlos+q41s6e?=
 =?Windows-1252?Q?KwsuYpLctspJkFkQjzl5hksT9A6S8ndMDQ8NubP0z+2nbWoCEGAIIZ1G?=
 =?Windows-1252?Q?sVreKCfDxc53cTYrKOP0yobRgOYMqj20RyBlOfYcPnxH8m/BlvxC/It4?=
 =?Windows-1252?Q?clj8qDfDZwhdqVJgVwQXYumdOvKMSMFqPwZc0NG0TMRDxhSxNCNuwOl4?=
 =?Windows-1252?Q?Cm/J9rKmgLkD+wBbWtGVZ83R+W77xpVU2T8Q75funCPdu1iz3tqfeilY?=
 =?Windows-1252?Q?XCPVI4nBcKtJ6o7bDPrDeVNW7eBhC7leCbI7PD80C4UGG4hjhNn+iuqo?=
 =?Windows-1252?Q?DbfeU/k9jCYVX/dVL4YYUU0FRF3EFfSq/pKxbn/GXHBNjhOVJGoP2Gg6?=
 =?Windows-1252?Q?yDkeafQFxclHn4vGJVSeo/qHgZRTxe3GbKTaEXjwDNngfnLZx7q/Ul0c?=
 =?Windows-1252?Q?iG5/mKdgVUZUQyo+psalxIcWkCkvhD2dPA+LMwKagGTkDitPUfJsM3rL?=
 =?Windows-1252?Q?N3tnJF/Y41Et3LpsXJTmvQYb9UFXfc1FSGMEy8Hn3JPwKiHB1snlT/9p?=
 =?Windows-1252?Q?CQdgT1m57SJFtl0CWGEmHbDV69GHJ1Q1yEOugXdb5QqMZX5JL/Ore/Ch?=
 =?Windows-1252?Q?KHUxgqgHJ78P7cGT/SVOoupiQOJnE79AyHCI348alahE2gcbzCvqEXAt?=
 =?Windows-1252?Q?t+cbjR+zVn+It6/w5Xovck0MlC92OuO7XiaKZU4y6VA48NGqCRLRIJRd?=
 =?Windows-1252?Q?HfcNJXn+J/Vb634pEisgxmG/Lt7pooDVREEYH6T8Q/lvYb0o5vkavlGp?=
 =?Windows-1252?Q?udMDOtAb0MEbPnn9Wg10FFFY5gPZ2segUs0s6tiB53hnRB5l0LmxpsKN?=
 =?Windows-1252?Q?x27LAi6LVJ/sLXq8zbGstQJJKHHlUReNSePFuqOAsiKxyIxI7M4coUE7?=
 =?Windows-1252?Q?QcYnxEpGhlUW0cLbOjJrQ2lhttRM5fgzNSpwpBSS3haa/cQt3COICUwF?=
 =?Windows-1252?Q?Ut+sOX17KShlR9HDxdRlXT0hKmI2VNKpzqVDD0Eu7VONLqBYhKkOfCgy?=
 =?Windows-1252?Q?YU6x4jwqma8OCT3Inq7BBjueYam0JKwQl59gFZpRTpYiozL3EklMDkT0?=
 =?Windows-1252?Q?GYw+tMXms0T5gyTpqk5HV40SMEA2jkeKRDV1u3GecvqebVB+6tTAOfn4?=
 =?Windows-1252?Q?eXoJKyC7Xh3OdAlp/TX2/pkAb89t8e7M79vDpYJm14OXtXVDRHYvNlGK?=
 =?Windows-1252?Q?3IsgQG78JaUObSPv4tAmRxI6v3PPXdxstUfz6AtZzpQ9lQBLrGp6Ue6d?=
 =?Windows-1252?Q?7Zng9P9+HkqAdEFOkJhsrq7mggV+THqv/306LQSSr2QSiMv+Ku/M+PSm?=
 =?Windows-1252?Q?yfMt76FITg5Q/r2kgHQMDDg+OK6DNvA9quOF2ZItV6rGf70kf51vVyzK?=
 =?Windows-1252?Q?x63WZVVcXKwNIeiv05sPzNrOVCR0RXl24Lt0pcR4msN5feQVnHQI9OuY?=
 =?Windows-1252?Q?mf3XR0v49+ILHA1aJnPriZB9yQAeSUsz9KaDbic6vgC/Bm5WiSfGaA?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b2fe72-a7cb-40a4-656d-08dda9968cac
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 09:50:22.6654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c/8enaxstCv2csSGy5Lup7q2Y4gn6wtR1FRwLkOH6dX57HlXE458vV9On9JKPozLQMxDi+kuUltepF9i8NZS2T2GS/sJMT9sDrKxamHJjUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1775

Hi Laurent,=0A=
=0A=
Thank you for your response.=0A=
 =0A=
> On Thu, Jun 12, 2025 at 07:52:32AM +0000, Tarang Raval wrote:=0A=
> > Hi=0A=
> >=0A=
> > I=92m trying to bring up the OV5695 camera sensor on the Debix Model A =
board.=0A=
> >=0A=
> > Kernel Version: v6.15-rc2=0A=
> >=0A=
> > The issue occurs when attempting to capture a frame, the system hangs a=
t=0A=
> > the VIDIOC_STREAMON call.=0A=
> =0A=
> When you say "hang", do you mean that it freezes completely and becomes=
=0A=
> unresponsive (no serial console, no network, ...), or that it doesn't=0A=
> capture frames ?=0A=
 =0A=
The system remains responsive=97console, serial, and network are all workin=
g fine.=0A=
=0A=
However, after calling VIDIOC_STREAMON, although it returns 0 (success), th=
e frame =0A=
Capture does not proceed. I have to manually terminate the process using Ct=
rl + C.=0A=
 =0A=
> > 1. I've verified the data lane connections, and they are correct.=0A=
> >=0A=
> > 2. Regarding link frequency:=0A=
> > In the mainline driver, the default link frequency is set to 420 MHz, b=
ut according=0A=
> > to the sensor's datasheet, the MIPI data rate can go up to 1000 MHz. So=
, I also tried=0A=
> > configuring the link frequency to 500 MHz, but the issue still persists=
.=0A=
> =0A=
> I assume you meant 1000 Mbps, not 1000 MHz.=0A=
 =0A=
Oops, yes, 1000 Mbps.=0A=
 =0A=
> > but the issue still persists.=0A=
> >=0A=
> > Could this be a driver-related bug, or is there something else I should=
 be checking?=0A=
> > I would appreciate any guidance on the possible causes or the correct d=
irection to=0A=
> > investigate.=0A=
> >=0A=
> > Best Regards,=0A=
> > Tarang=0A=
> >=0A=
> > #######################################################################=
###=0A=
> > debix@imx8mp-debix:~$ v4l2-ctl --device /dev/video0 --set-fmt-video=3Dw=
idth=3D1920,height=3D1080,pixelformat=3DBG10 --stream-mmap --stream-to=3Dim=
age.raw --stream-count=3D1 --verbose=0A=
> =0A=
> What device is /dev/video0 ? =0A=
=0A=
/dev/video0 corresponds to the mxc_isi.0.capture device=0A=
 =0A=
> >=0A=
> > VIDIOC_QUERYCAP: ok=0A=
> > VIDIOC_G_FMT: ok=0A=
> > VIDIOC_S_FMT: ok=0A=
> > Format Video Capture Multiplanar:=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 Width/Height=A0=A0=A0=A0=A0 : 1920/1080=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 Pixel Format=A0=A0=A0=A0=A0 : 'BG10' (10-bit Ba=
yer BGBG/GRGR)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 Field=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 : Non=
e=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 Number of planes=A0 : 1=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 Flags=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 :=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 Colorspace=A0=A0=A0=A0=A0=A0=A0 : sRGB=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 Transfer Function : sRGB=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 YCbCr/HSV Encoding: ITU-R 601=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 Quantization=A0=A0=A0=A0=A0 : Limited Range=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0 Plane 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 :=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Bytes per Line : 3840=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Size Image=A0=A0=A0=A0 : 4147200=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_REQBUFS returned=
 0 (Success)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QUERYBUF returne=
d 0 (Success)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QUERYBUF returne=
d 0 (Success)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QUERYBUF returne=
d 0 (Success)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QUERYBUF returne=
d 0 (Success)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QBUF returned 0 =
(Success)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QBUF returned 0 =
(Success)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QBUF returned 0 =
(Success)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_QBUF returned 0 =
(Success)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VIDIOC_STREAMON returne=
d 0 (Success)=0A=
> >=0A=
> >=0A=
> > #######################################################################=
#########=0A=
> >=0A=
> > echo 8 > /sys/module/videobuf2_common/parameters/debug=0A=
> > echo 8 > /sys/module/videobuf2_v4l2/parameters/debug=0A=
> >=0A=
> > Logs:=0A=
> >=0A=
> > [=A0 133.181274] videobuf2_common: [cap-(____ptrval____)] __setup_offse=
ts: buffer 0, plane 0 offset 0x00000000=0A=
> > [=A0 133.182569] videobuf2_common: [cap-(____ptrval____)] __setup_offse=
ts: buffer 1, plane 0 offset 0x00008000=0A=
> > [=A0 133.183766] videobuf2_common: [cap-(____ptrval____)] __setup_offse=
ts: buffer 2, plane 0 offset 0x00010000=0A=
> > [=A0 133.185209] videobuf2_common: [cap-(____ptrval____)] __setup_offse=
ts: buffer 3, plane 0 offset 0x00018000=0A=
> > [=A0 133.185230] videobuf2_common: [cap-(____ptrval____)] __vb2_queue_a=
lloc: allocated 4 buffers, 1 plane(s) each=0A=
> > [=A0 133.185607] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buf=
fer 0, plane 0 successfully mapped=0A=
> > [=A0 133.185678] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buf=
fer 1, plane 0 successfully mapped=0A=
> > [=A0 133.185763] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buf=
fer 2, plane 0 successfully mapped=0A=
> > [=A0 133.185822] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buf=
fer 3, plane 0 successfully mapped=0A=
> > [=A0 133.185847] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf=
: qbuf of buffer 0 succeeded=0A=
> > [=A0 133.185879] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf=
: qbuf of buffer 1 succeeded=0A=
> > [=A0 133.185907] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf=
: qbuf of buffer 2 succeeded=0A=
> > [=A0 133.185942] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf=
: qbuf of buffer 3 succeeded=0A=
> > [=A0 133.501480] videobuf2_common: [cap-(____ptrval____)] vb2_core_stre=
amon: successful=0A=
> > [=A0 133.501579] videobuf2_common: [cap-(____ptrval____)] __vb2_wait_fo=
r_done_vb: will sleep waiting for buffers=0A=
> > [=A0 147.031310] videobuf2_common: [cap-(____ptrval____)] __vb2_wait_fo=
r_done_vb: sleep was interrupted=0A=
> > [=A0 147.039118] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_do=
ne: done processing on buffer 0, state: error=0A=
> > [=A0 147.039135] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_do=
ne: done processing on buffer 1, state: error=0A=
> > [=A0 147.039141] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_do=
ne: done processing on buffer 2, state: error=0A=
> > [=A0 147.039146] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_do=
ne: done processing on buffer 3, state: error=0A=
> > [=A0 147.039603] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem=
_free: freed plane 0 of buffer 0=0A=
> > [=A0 147.040152] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem=
_free: freed plane 0 of buffer 1=0A=
> > [=A0 147.040595] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem=
_free: freed plane 0 of buffer 2=0A=
> > [=A0 147.041036] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem=
_free: freed plane 0 of buffer 3=0A=
> =0A=
> --=0A=
> Regards,=0A=
> =0A=
> Laurent Pinchart=0A=
=0A=
Best Regards,=0A=
Tarang=

