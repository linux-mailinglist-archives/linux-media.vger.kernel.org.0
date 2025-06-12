Return-Path: <linux-media+bounces-34583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD06AD6995
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 09:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DE8D175CDF
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 07:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521A0221F24;
	Thu, 12 Jun 2025 07:52:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021125.outbound.protection.outlook.com [40.107.51.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01268221543
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714760; cv=fail; b=VSAcFOEhILQ/gAtGC1+DYdARWDoh2kL7/q6ptwhGeGxyRkzSTJHKma8ZziNXXMyqZq3MytzpOwSDl7iqL8XIBrjY/yKgRyncRke6I5Syp6GcOkcfE4qiUY7IycFLzarG+SO8AcE4X5vcqu9AC5mYRRlpkhsf1qG8uBu7JU0hZxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714760; c=relaxed/simple;
	bh=weWcvodZ9n6cYlczFK2K/aLD19gq0N+iE1kGXbkQezY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Yf7QbUNMtaYWiarIEy5qdZAfRlkw9lAVXQV96ShHjaP7KEptwTl8p+xFAQ2yYdj1ZY9hU64zGuwVH56gRQKvvkPOAqe/VK2QfCDc7YfUqFwtpNVu+hsadkWEeLHW74sPxseQGNO7C/XVE/nlWEJ2o8DTcqyorU0SjGkHeiYpeKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjiHXxZCnkeMVY9vzGVgszCTlZ8DKha99Iv3Tk1nmwicsrhxLepNVU9nbX5f8KObDHRcVMHjPZZcTs68ytQpLLzkYExj/I02XzN3doo7j73VnL7Llq5mUuX5F09k46q/D2N6AYViYAoSadtbCFcfAe/K1JLoMiss9qMizYRDYqEmjd525X0nhiu2vtTNJPnh2lEagXWZEmHAfOo6OjyJKZHwAb1QCo0cYCYhBjNewZpnkOhWPjqul5U8zNEoip/byD1Q+KzDhrK1wT8f0Db6z5gpLuLN5+JkA9KSnjoSft5tSghnbN074DL39m/tN4DBC2KOPFK40UHN3vDXlxsebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4B5Av03bKdCO/irCqBg9ZTj8+VYuSvV0zuDOcVuZ2g=;
 b=vDoPSbM3jHa5AkjRORqCy46CiJ40lxfYkzE2XL4E1ZJahhSxitw1JgUAzgupac9dD0MTQM4LocRd1mwAPPOG2JPiH6v1S/gDBdP8uazZVcWsGMD7ZB8HgBgdiGPlEzcPiKiNJ4Px+vY8212W1cuM001D4jjfBMZ+xMpch51E8SszbS7V1Wo3WPh1ZpLNHUsOVXR3mK01bQUQH4NHvzzu2W1VjknHAkxCQYS3tClv9RNmBk4+dhu2NrBZ9Aocx6gShjKdmtX9HUAgwKjBlnfwFMMcLaO+7J+3hYcPpqMayjtTYi6zc5zqlnJd1UFR8dWrvlkAU7qn2ap96P+ZibOgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0305.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 07:52:33 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%6]) with mapi id 15.20.8835.023; Thu, 12 Jun 2025
 07:52:32 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>
CC: "open list:DMA BUFFER SHARING FRAMEWORK:Keyword: bdma_(?:buf|fence|resv)
 b" <linux-media@vger.kernel.org>, "open list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <imx@lists.linux.dev>
Subject: Issue: Stuck After Successful VIDIOC_STREAMON with OV5695
Thread-Topic: Issue: Stuck After Successful VIDIOC_STREAMON with OV5695
Thread-Index: AQHb22gYf5eLLq3cRku7ZKJP51USUg==
Date: Thu, 12 Jun 2025 07:52:32 +0000
Message-ID:
 <PN3P287MB18297E8A4F568F064D19A1D18B74A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB0305:EE_
x-ms-office365-filtering-correlation-id: 98356527-10a0-45ef-383b-08dda98616a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?X4qIO9K4/1CW53XEdDhZymqc8nW05RAzGSdswqj5o5lqovuGRzgBwiZS?=
 =?Windows-1252?Q?zNlGhd2KmEQVhIf/cWuEJ+Gt0BpIDsymmGdtIQRHNAu5moZ0TCXXKu4e?=
 =?Windows-1252?Q?spw9R16fS3mskPgE25I4uod4g4fO3xOiuWaR8bXD+h1MEpYf0/rHKnsB?=
 =?Windows-1252?Q?de8pTvmf5XNax59EKWiY9JVXIp81Uz7t8y67mMeWyhIafuhjM+kemvsw?=
 =?Windows-1252?Q?V9lQw7rWi3eo8xhScfq8dtdLXlN31Wi3ItvJPA03N0tW3NyfkIhBRlsc?=
 =?Windows-1252?Q?proElOG3/1HcjpGLRbo6/XEAUlLAXVC0Z/Qw01XulBRrpiKPF4utTAl8?=
 =?Windows-1252?Q?CzSZXf/q0tcLyFjwEgR1+zFQEPzx1aoElGrnlMAkTS7dhpo6WRCO23yd?=
 =?Windows-1252?Q?9arDMSNsCQUaYMw6bdbUiU6OFXDeMM76Rm3QoG719aoq4TrazKv/bIBH?=
 =?Windows-1252?Q?GBEK3Jan4pFsHsjwujRL+9l0kWXsHS5MKo7OHqt75OHBJuvorN/ekwFF?=
 =?Windows-1252?Q?dkxUKC8nUjXa4u+6TNhChyLKJAZF7gQ70hTkFGFkEI+wr/9nNVgzIVVN?=
 =?Windows-1252?Q?9OBh8r7LEROznUeqzo5WF29hF8k7V1lYguCoeQmLF8+dtg/XdtWkxw2f?=
 =?Windows-1252?Q?AcmvSFSErt3pYU/53pvUT5Y9zl08yHBLfvHeVRaSWdEtG2MNBYuKpyUf?=
 =?Windows-1252?Q?fczZZH8RABPQGBct+u6+XkOIHlk5RD+0QYlVO7hRaJ9TUQbylLi+yTzI?=
 =?Windows-1252?Q?YkaWFXZc6U7FWlF+X0z5LaiwFtAsuoOUQARg//SM3H1SftuUS8pgB3m9?=
 =?Windows-1252?Q?HYFQHFzC4rCzg4RHO2UsanG+V0Ww4aalFJO1ayE0ZBN9CePloEazyUiO?=
 =?Windows-1252?Q?hIeB+Rwx8+DagNPaNzm3As8FUAu2zIb7ZTgWUCocz8uJVvOG1zrIVeGT?=
 =?Windows-1252?Q?z67DVRjQcjN37ZyJKUQqBFcc/AtDdXQn0/Dd0HU+oGp9u9G+STGZqIBk?=
 =?Windows-1252?Q?EgBe8rsTfMMVYG914wATNrZ5wdMhxqpftj9sRymgPHlr/MXeBXg58H36?=
 =?Windows-1252?Q?vyBrArIpY3myPzeV6QrOblYiC69nzNvSUFtLHTpKqXWCNzLo7s7WwPMI?=
 =?Windows-1252?Q?tkSqkXdPwDdNq16kybDvXMTiOyW3X3bhcCvFC8QP7sGxWsgSN4w/xOM+?=
 =?Windows-1252?Q?GQV7uoNHoGiPO2pIHd65v5sH6dwhdsmjTVAYYZ934dax1WA60Ly9yCsj?=
 =?Windows-1252?Q?qqHpDWRJwvcVf44aAEEQskGcPU0+33CfuWQrS9XRgSBM5s2NJ0aTayWv?=
 =?Windows-1252?Q?59SwqsUWjefNb6Gw3i5i+KGZNc3qOL8Jb3LBVvsq/RZ/afVIH7GqMTqe?=
 =?Windows-1252?Q?a1Y6LO4GCCwJZ39tD+mqYVt8AK0vEQIBFQAbZPgFaBm4gax0pfYIZaSQ?=
 =?Windows-1252?Q?De2D81p8CZGJlns2ERhYjlBjfaqRKLG/gv8tai1SxDFhMnxvfd5gWi6k?=
 =?Windows-1252?Q?a0OE6jv/Lal7f/bulW6Llk7QNX1Yt3cpGrb9IQrPpkPUKfrX+twbhWIO?=
 =?Windows-1252?Q?SLC6Rd53Ws0teYRjjEDPbgKCRrN7NmZVwZn4JA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?WqShSNdYfgkhu4D6vzWFFrlHd0l89dd4rrE5B0reqFEzeQkLlqrVdTzm?=
 =?Windows-1252?Q?6w3pTAtqyOBAhCr3Fu8HAY72cDEjiK+1kBES+sSZE5KVYw6ZERaSLKaj?=
 =?Windows-1252?Q?Eiu000gDnVRcaW914H8iMZ8uj52CCYLeNARvyPeAYLwpLiPcJa9UCF1H?=
 =?Windows-1252?Q?MecbzdegOWG4d/fYufeGMSWmGR6EWeM07r37fb7R6KwCz2uV+UuubF9e?=
 =?Windows-1252?Q?kbB3oQGS7lN/fuV17QbGGkkvUqsaD/cndakwl5ryDy9b6cBXtdIXDe8M?=
 =?Windows-1252?Q?U1x2+N3qQHgREvyZ5oH4c7VXVf4vcWpliSIXIOO3zksYAID2MaGrXOid?=
 =?Windows-1252?Q?qFqU1HpL8p0CrV/JeJE/MyrBUIPw1xGgIMYs0uaUgbBzz46HVU2a7EUO?=
 =?Windows-1252?Q?FZNDj4TfLnEKpbzLGM08t2nbr0sQ+gQrf4RIJNUbymJigm3P8Aqbi2Qo?=
 =?Windows-1252?Q?JvaHBhivsmnFS7EqaCYpk2zcDuPqtMQjhW6zxUEKMRIXo9KpMZE8zeHf?=
 =?Windows-1252?Q?Bs9pWkeF0o4w/NNXjMjrKkiIgmBvcrybBvTFe+izo3QuyUyV9QT5S4T3?=
 =?Windows-1252?Q?CO03AsGIBWs/DFZWgrO/3zh2cPjw6TSDlrk35Lv/FzmghgtyEWmK04My?=
 =?Windows-1252?Q?Hkh07YwO5p6/2IoF7otg2jpJUURrLWQaU3rnLiKXkOow5OyrJLXuVdY0?=
 =?Windows-1252?Q?2slEHS5yYWEpiyE1bQFbH8Ecbn6kBxsi0n98Yh9UQGmtVnCLLJB7Lpf6?=
 =?Windows-1252?Q?G2ocR984vHJ/MsjhW69zZ4lUj2sbsDpjUGKAS4zdhVx0v8wWyNvBP24p?=
 =?Windows-1252?Q?bIm1G/vxk+x+fxnVekNcEOlgzmU+hLLjlQCnOSejC0oN7W/bHzQ2H0Yz?=
 =?Windows-1252?Q?+DPwpwa2d2e8Iu7ccQberptjVnatUSkvMOFJgL4/gxrJykBzYWeB4N5C?=
 =?Windows-1252?Q?syaqy/3OOboqNcuZu3kCTZobyB3do2ylCnXdb/v/F/GrY7qXBsOKKORV?=
 =?Windows-1252?Q?nZd6bM0SWCC1WLTpWhVUPOBVcalArqgJEv5YNdi7jdOP+CbvJuiEqkCL?=
 =?Windows-1252?Q?F0ip1e+S43PZgO711KlwyGeDny+NvERkp+azMQtXxpglml2U/zPnujyn?=
 =?Windows-1252?Q?VephyJE7prkB07lS7H0kXdnNKP2pLBZE3HE0LLN7rmUgYwgD2hse2a6C?=
 =?Windows-1252?Q?I7DxOoemgaPkVIGsJtgLZEjHF8OilOy2XqBLgBBng9JW7eqJKlfhcyBc?=
 =?Windows-1252?Q?mdgImV63X4QC5kyODu3GSVJDKDbuq8oAfp1N4tGTd6M8UF9VU9qOCsi/?=
 =?Windows-1252?Q?TWXUY0WJOHHmQiZYqNyeOGNQHmPI5Sxx/wYSGVaqGNLHqAJTXKNchO1i?=
 =?Windows-1252?Q?eMq7orz2IJT9kFBY8Mq3mJyT8fV1YWUsqgA6dN5a/YwC+FGFaEqDaMFe?=
 =?Windows-1252?Q?O5jsXz4p5kwodlq2+UG2bYLvWZOdrYFAlIFUzzxrDl0Si5hmZSiz63m4?=
 =?Windows-1252?Q?Yv7BuMbSeDDl5IecJRo5GONVx95qDvjUj6gzkDGVOIs29+6185eh0LkA?=
 =?Windows-1252?Q?8VhGM9rPZUCtMOZTVCmCwGylUSnIi32/EbeJz7TAhtwpqaDyHqWPK1VS?=
 =?Windows-1252?Q?ZUc3QIVvkRqeyRX6wvFC2GwxR8hezQds5ihhGWrbXjzcP/rdOoIpFeyL?=
 =?Windows-1252?Q?hCXDsrPwHIM8/9S0Z/gqw64+njbR5oxqdpRnPtv+CJ9mzv3QEJFVZg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 98356527-10a0-45ef-383b-08dda98616a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 07:52:32.6516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BlPKAFdpRDKS3B+U7aFCjDwQ7TlD93ttSbt/Y5HDLHbhih5DAknNWojTwZweiC8W+Ivty0o6RDITM3NQH7X83Bwr5nYF4IoFgnV1+pHVXTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0305

Hi=0A=
=0A=
I=92m trying to bring up the OV5695 camera sensor on the Debix Model A boar=
d.=0A=
=0A=
Kernel Version: v6.15-rc2=0A=
=0A=
The issue occurs when attempting to capture a frame, the system hangs at =
=0A=
the VIDIOC_STREAMON call.=0A=
=0A=
1. I've verified the data lane connections, and they are correct.=0A=
=0A=
2. Regarding link frequency:=0A=
In the mainline driver, the default link frequency is set to 420 MHz, but a=
ccording =0A=
to the sensor's datasheet, the MIPI data rate can go up to 1000 MHz. So, I =
also tried =0A=
configuring the link frequency to 500 MHz, but the issue still persists.=0A=
=0A=
but the issue still persists.=0A=
=0A=
Could this be a driver-related bug, or is there something else I should be =
checking? =0A=
I would appreciate any guidance on the possible causes or the correct direc=
tion to =0A=
investigate.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
##########################################################################=
=0A=
debix@imx8mp-debix:~$ v4l2-ctl --device /dev/video0 --set-fmt-video=3Dwidth=
=3D1920,height=3D1080,pixelformat=3DBG10 --stream-mmap --stream-to=3Dimage.=
raw --stream-count=3D1 --verbose=0A=
 =0A=
VIDIOC_QUERYCAP: ok=0A=
VIDIOC_G_FMT: ok=0A=
VIDIOC_S_FMT: ok=0A=
Format Video Capture Multiplanar:=0A=
        Width/Height      : 1920/1080=0A=
        Pixel Format      : 'BG10' (10-bit Bayer BGBG/GRGR)=0A=
        Field             : None=0A=
        Number of planes  : 1=0A=
        Flags             : =0A=
        Colorspace        : sRGB=0A=
        Transfer Function : sRGB=0A=
        YCbCr/HSV Encoding: ITU-R 601=0A=
        Quantization      : Limited Range=0A=
        Plane 0           :=0A=
           Bytes per Line : 3840=0A=
           Size Image     : 4147200=0A=
                VIDIOC_REQBUFS returned 0 (Success)=0A=
                VIDIOC_QUERYBUF returned 0 (Success)=0A=
                VIDIOC_QUERYBUF returned 0 (Success)=0A=
                VIDIOC_QUERYBUF returned 0 (Success)=0A=
                VIDIOC_QUERYBUF returned 0 (Success)=0A=
                VIDIOC_QBUF returned 0 (Success)=0A=
                VIDIOC_QBUF returned 0 (Success)=0A=
                VIDIOC_QBUF returned 0 (Success)=0A=
                VIDIOC_QBUF returned 0 (Success)=0A=
                VIDIOC_STREAMON returned 0 (Success)=0A=
=0A=
=0A=
###########################################################################=
#####=0A=
=0A=
echo 8 > /sys/module/videobuf2_common/parameters/debug=0A=
echo 8 > /sys/module/videobuf2_v4l2/parameters/debug=0A=
=0A=
Logs:=0A=
=0A=
[  133.181274] videobuf2_common: [cap-(____ptrval____)] __setup_offsets: bu=
ffer 0, plane 0 offset 0x00000000=0A=
[  133.182569] videobuf2_common: [cap-(____ptrval____)] __setup_offsets: bu=
ffer 1, plane 0 offset 0x00008000=0A=
[  133.183766] videobuf2_common: [cap-(____ptrval____)] __setup_offsets: bu=
ffer 2, plane 0 offset 0x00010000=0A=
[  133.185209] videobuf2_common: [cap-(____ptrval____)] __setup_offsets: bu=
ffer 3, plane 0 offset 0x00018000=0A=
[  133.185230] videobuf2_common: [cap-(____ptrval____)] __vb2_queue_alloc: =
allocated 4 buffers, 1 plane(s) each=0A=
[  133.185607] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buffer 0,=
 plane 0 successfully mapped=0A=
[  133.185678] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buffer 1,=
 plane 0 successfully mapped=0A=
[  133.185763] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buffer 2,=
 plane 0 successfully mapped=0A=
[  133.185822] videobuf2_common: [cap-(____ptrval____)] vb2_mmap: buffer 3,=
 plane 0 successfully mapped=0A=
[  133.185847] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf: qbuf=
 of buffer 0 succeeded=0A=
[  133.185879] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf: qbuf=
 of buffer 1 succeeded=0A=
[  133.185907] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf: qbuf=
 of buffer 2 succeeded=0A=
[  133.185942] videobuf2_common: [cap-(____ptrval____)] vb2_core_qbuf: qbuf=
 of buffer 3 succeeded=0A=
[  133.501480] videobuf2_common: [cap-(____ptrval____)] vb2_core_streamon: =
successful=0A=
[  133.501579] videobuf2_common: [cap-(____ptrval____)] __vb2_wait_for_done=
_vb: will sleep waiting for buffers=0A=
[  147.031310] videobuf2_common: [cap-(____ptrval____)] __vb2_wait_for_done=
_vb: sleep was interrupted=0A=
[  147.039118] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_done: do=
ne processing on buffer 0, state: error=0A=
[  147.039135] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_done: do=
ne processing on buffer 1, state: error=0A=
[  147.039141] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_done: do=
ne processing on buffer 2, state: error=0A=
[  147.039146] videobuf2_common: [cap-(____ptrval____)] vb2_buffer_done: do=
ne processing on buffer 3, state: error=0A=
[  147.039603] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem_free:=
 freed plane 0 of buffer 0=0A=
[  147.040152] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem_free:=
 freed plane 0 of buffer 1=0A=
[  147.040595] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem_free:=
 freed plane 0 of buffer 2=0A=
[  147.041036] videobuf2_common: [cap-(____ptrval____)] __vb2_buf_mem_free:=
 freed plane 0 of buffer 3=

