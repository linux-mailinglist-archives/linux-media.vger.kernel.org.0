Return-Path: <linux-media+bounces-14208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 477809199A5
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 23:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7B7628664A
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 21:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E93D18FDBC;
	Wed, 26 Jun 2024 21:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b="XKnC78ZU"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2099.outbound.protection.outlook.com [40.107.220.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82D41667F1
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 21:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719436561; cv=fail; b=qxUe+BP3mduMCcg5TDvSg8RTjTazYuXMiI+WlnhIw72Achkrqr96hiA16/yn0nOJLlJuv4TJSixyp8jBd62rMTHUfe6EA4dxo7b2xJTwGxWDHhCaAnx5EG60dh3VXwRmk2bMSxhJowYCKRpLK9IRu+Y9KYA7nNBNhY42LBhzosI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719436561; c=relaxed/simple;
	bh=HuNyqJDpj9fcWm3kdyjZESkiyEXhyezoYChZ7ZVhcBk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=im2GqJVcCcfJ7cUSULX0jfjP/EPaSMwbEu3W2mKuFvomsAVRcp5fQoAhauqbeI72RLrRvka9tDtNjdDrhHYyGQ6a8G/n7g1OWcQrR9kkrWjULBhA/zC2Po5mHLwYBB20QpjcwpyWEr2LSdjAtoEUcoWBMhx6X9i+3U57H4W84YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com; spf=pass smtp.mailfrom=d3engineering.com; dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b=XKnC78ZU; arc=fail smtp.client-ip=40.107.220.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXmwT+VmK0kFPWjCYxp2f79F/t3C02KpbfOrZjgIbGJ/7q8QwFHOL/7lDGd/V/x7fFhiJwctrlUwZzQFQuCZxTjvMFpB6yyPK4vKtkIoJCfVirWM+0qX+YK2MoDxw+BrWRAUZMl4diDRw6Q/1atEu5esiuZct3CAJH5oZOFISG9GwQfwOilVfCcWOuUqOahrAh5VGxJqEsgthWVDZkgFKoNU6hzH797d7CEpEA9TWywNyo0ieNS/A23VRcax7Ma3FeOhH1tnWQVBRWhMNOvP7pCBK7FwTiYvvYYFvgrBPoOppD5hl5ZwByqOTg7rItorXMd2nadH69f7vMTFjCfwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmmFlIAS680WGX+kQC38Xdr3kWLER8Be29t5zj5ipqo=;
 b=XfvzHNe70uVlqRfxHfXrMEdSM5KJplYuU/iyTKq2P3CaLQOCnj14tJG0Fza0EYIswMrmd4nym1YjSkxfLeLBI0nVLp0w/0qehdxaJLgBeSGjmosbSDi8zQU45IVkBh1mWOWWDV1NAvs263LrZcwSzgTLh1BARVk9QB+hem/xyP8iOlEr4pIC6xALw56bVpjHOjgIb6p1aO/8pMuKTG5VftIyfyKGy/t0aV6FU0n7Ot/NSXq0WRdMTH8xOvWfu1rkx/C1MOfZ5hpUo7CS0KI+W4dcwLI7WQcLnRajaM47tb3Gigag3+FgmTAgvgTA7nb7axS8G9MZdVwIEt/zlJ3+DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3engineering.com; dmarc=pass action=none
 header.from=d3engineering.com; dkim=pass header.d=d3engineering.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d3engineering.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmmFlIAS680WGX+kQC38Xdr3kWLER8Be29t5zj5ipqo=;
 b=XKnC78ZUgmnNFEDcEtGcGonivKsGhFN53SXYRyibHySby0SZgB7w0cMN5ARn+ucuDjN1XRUddaPXmHX8FtD0/t+M2lA30qmzNj5XvkLmEqoVIMPdXbwnCSfQM0OGJdFOHeWg0Dfgp09xzLMsIuK240SFiWUy0Iv3DaCxvYW/EWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3engineering.com;
Received: from CO6PR14MB4385.namprd14.prod.outlook.com (2603:10b6:5:34c::9) by
 CO6PR14MB4242.namprd14.prod.outlook.com (2603:10b6:5:350::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.22; Wed, 26 Jun 2024 21:15:57 +0000
Received: from CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864]) by CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864%4]) with mapi id 15.20.7719.014; Wed, 26 Jun 2024
 21:15:57 +0000
From: Spencer Hill <shill@d3engineering.com>
To: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Spencer Hill <shill@d3engineering.com>
Subject: [PATCH 0/2] media: i2c: Add driver for Sony IMX728
Date: Wed, 26 Jun 2024 17:15:27 -0400
Message-Id: <20240626211529.2068473-1-shill@d3engineering.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CH0PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:610:32::27) To CO6PR14MB4385.namprd14.prod.outlook.com
 (2603:10b6:5:34c::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR14MB4385:EE_|CO6PR14MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 535b9704-306f-4d77-5f57-08dc96252bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|366014|1800799022|376012|52116012|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2+/snwMEd6yH0DzBASzFCHoIO3x1n1Ro+YBsZAjbrnWCA7RYa/MJGTxLG8RP?=
 =?us-ascii?Q?PyuO33qFzz76ROCuKzQc+2e+/VGJc50Fd1mUT8N7Bm77MVOpexy4b4XPC+AU?=
 =?us-ascii?Q?/ZK2GXR0zLftr++e/mbkZcboIyStDI0E2YgMLkK03A8Kay3CDYILwbvhK4+6?=
 =?us-ascii?Q?d4y9KL7o4cR8GlaaIy8N6VlcYHggD3D4k8Alp/3+S5kW+A8lLxHxMUl1cHqt?=
 =?us-ascii?Q?422n8dxVLhNRkw1Hs9kRd5VFt3y1nM7uB24QzUEVGvAS6XpQfAh4PU+uTX5s?=
 =?us-ascii?Q?iURVTjd2MJ6F5XF1oy6af3R7KlYP4ZTOSMQ2mNCxnwxRIL5dkfCTrUN2OQ6o?=
 =?us-ascii?Q?DZpPwyX+82UxRbw12IX+mxhg2l+6q3nnT0tkGqP+nUGPIakpPodmMMfUbi3I?=
 =?us-ascii?Q?AHN1Aa1oz4ujsLZguVbg+6ma8SMbbeZmjRT0UQ2FR4A44JtH7iRpKZhwh+IV?=
 =?us-ascii?Q?4rhPnDIjNqdSvwJTYwkt4rRxw3q0/UJ7YanO9u/mxWGovpy8lOI7PN57aoYA?=
 =?us-ascii?Q?Kv429x4q2ULBf9T+Pkb7LS+TuYqFGDMsnpty/ofZgqJ4KTwNO/M6Fuz5ZqAx?=
 =?us-ascii?Q?EdZaqgfGevcM54we16mlcPzVR0Q5dNZgDr+GCkHg6y3bcTCMx1UgY1OyA70J?=
 =?us-ascii?Q?0NSfQbFUar3d5XnbbOcwPbkB4MgoXSOJwj1emmCjSmmX3s4IEzLHvqJAq5Lz?=
 =?us-ascii?Q?CTLyWY/QwMR7C32pxB7DX5nJ/gzHKVbwFs/vgL8f45s+dLM4AiYRZ7B4oggy?=
 =?us-ascii?Q?FFbpi8lM1Ag7P6cq1ytr4NrbW+Jwbupvzk5g8Wz/HXfczzbEqq8HB80EbsES?=
 =?us-ascii?Q?S8temhEVd1yLmGlWhqOFR56s+fNhHZ9Zn537AGZCHmiWmmxyZ54dQT20o2Ii?=
 =?us-ascii?Q?uWb+F2U78fzgTWYTmzIvmsntDzXtsgoJha2A1GfFlfoT18ynewfJ20vZxF69?=
 =?us-ascii?Q?T0eLK1ui385m93sBeDHdjILnTy9lycOUfZjmwOrWa3cxvbuyIUwDTMOq09+z?=
 =?us-ascii?Q?IxLbR1TFWRDrhhGTRgar0Wi4iH7P3hmROcJHssPOFaVh6ksoPdYMlWS78b9x?=
 =?us-ascii?Q?EyIDIfyCNeaAvqnNuPjOyAG5m730DyyCjxnQVL49IfFKlJBMpwTvdyAhDlLA?=
 =?us-ascii?Q?8XAsxQTbK3efLub1Ldg9uFGlAWFCGwDTGDHlvQ5OVCb7UBrCz6oTmBfgMrBg?=
 =?us-ascii?Q?Ff6gXJVzMiBsn6hYRYCOwEgkyMS0x7GWLkD7d3pQxPhcCvuLaGLubKfNQMi9?=
 =?us-ascii?Q?9J2bcBVCuV2b6bdvG/oBWhum935xBTMURwRWiDGIJg+kjRp8SxxlNfx7ONhv?=
 =?us-ascii?Q?rYe804la/N+63xOyZmy5lzo7ZaF41DSE+BDcqkGkrLJeepBvSOgZnXjGi5EY?=
 =?us-ascii?Q?kJvfJ4z9HTS1LhtLZOqeeF+56KOEAIp29mdFnxpViGosA1KTZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR14MB4385.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(1800799022)(376012)(52116012)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TiHec5IyfADeLjiUEoWtBJKSuteBZY7s/h4vvzFhkL0NESv7GUA6x6ykJS5E?=
 =?us-ascii?Q?U4dX1ULT2zhu9mxdYRh0GGKj8figB3gtnPzNH4aMknvBh6S6LrPUHcAhPc9Y?=
 =?us-ascii?Q?AnNYDGax64hwWSn1j/qBblkhoFpA/0HKnHUQ0KsCZKD8CpSUKAJyGutmove1?=
 =?us-ascii?Q?61Kd38gfWp5saIhWC7VCGLP/jaLo6LH9aTDA3JpD8e74JXRlLUbJb+7rsI83?=
 =?us-ascii?Q?hz12SIk9zFCB5KZEDri9OcCufEuzgfG8pZ8pKIN9vMl3uShtYbK2RiMRvoIK?=
 =?us-ascii?Q?nYEjJgctM2Mw/qFLlRMq/kSx7IMm6/ZCOWSAjFViaLZ9YCYP+yEZ1nsC68hw?=
 =?us-ascii?Q?1Yj9rST2JzEPyQCSU2ELQLOcoFstqMTHvfkaVwx1dO60qnzMq6j6A8re6Cu4?=
 =?us-ascii?Q?rjf9xk1G77Jeduc/sQTJ0dHzeyVh7lMSDWxAVTJXnxMwehzR56bMAHFsyGI7?=
 =?us-ascii?Q?bqmQz1cTDe4LjF2amEYPz7OCczynMXu4FHoZU1ifSQrEFw0ZdsKmDlbVFMp6?=
 =?us-ascii?Q?AmZY0Q1NVzByZXV3UQPGYuUh1nBV6bJFNtazajVuOkmlUMSvOk8XroSZaD94?=
 =?us-ascii?Q?LTQhwFOYwVIHJ2uNDA0w2neAV5YwuWihAM5RiRMJ1CNToOMs8oV4jSmFXbG3?=
 =?us-ascii?Q?96FPzDHtPtcSjdwAnfQJ/vDDut0rmiUI9q+pZXqWka4SV7moBG2Vq9OD5aKo?=
 =?us-ascii?Q?oU5IfbEOk1EPAaOW67e8AJ4asGgll1Nrhc7TqYXUVo0xgPW31Pz2drgNdH6U?=
 =?us-ascii?Q?debwR1s+FZNo4qq6ncE70SUdZupyKhLs+Pu2x+Z6NB4UtLgvWc4QTeqoJXFg?=
 =?us-ascii?Q?p5bi4uhq/vBiIMc+E984VZWL/peJRZmRDgo6YkvJYJ/+PPUKFCA3zKuxZq0C?=
 =?us-ascii?Q?Do/0korN4Y0Ls6vqt15o5G+bMK1+rvBK09lNNbV090zmpKsBgy0L9D6SXM9P?=
 =?us-ascii?Q?VxrRaSu4Es8oDRt5jrQ2Uja5XTeYgstIkrHXqIauRaLfCcSkXmuYeC8yrXJi?=
 =?us-ascii?Q?zG7UUY1mTkt9v+yBRORJAu3bCgAC2230h5OglivfWA2TENLfykGSu8EANlfT?=
 =?us-ascii?Q?q5ZR2SB4sXTWRXzHjlt/91P690qMWoYvZNMeiremLEdz/9q7ga/HouI2vtfs?=
 =?us-ascii?Q?6vxZdMQwiR+adjHBPUT1IdWIpabLxpX1I/K0TAL+iNSSg9XhD2Z9K6sJ9jq8?=
 =?us-ascii?Q?KnxDG2214JdVuEbSLN2LJhU2Us12n8AGTbQLrs9p5FnSv6+i8b0DN/HAQAjm?=
 =?us-ascii?Q?SFCd2D/iqFITJ5Pj4TVKmQf37gKMmTtrjR++5y9DuGQ4L9wD9yU/GELxkMxa?=
 =?us-ascii?Q?VuEDJ8hiVb+0Ww/9Ar2s31I/1kt3Xius3Drx2DryzmVkQBCLikmhp0SiC5k3?=
 =?us-ascii?Q?KImEg+qFpPkZA/KgKi0cSzRcE7V6QgDpvp3OlXQ+uhOOUKVmQxBB9E32yKTG?=
 =?us-ascii?Q?hOO0SpaalY2SJ1VMTPB4shibVeFQ7wCyvJS2XtyJy/jGpW58pk11XX+7YAa1?=
 =?us-ascii?Q?nZftjpuUSVWpUmkWEAfaFLzrnLCUy0D63AARhjQGbauyIrgDAUTRehlZ5lDJ?=
 =?us-ascii?Q?AXbYj9MCN2+zcOVr3I+vSrYzwwB1/XuH55+yVgLKcrqll36NO/9qFr6txHaJ?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: d3engineering.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 535b9704-306f-4d77-5f57-08dc96252bd8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR14MB4385.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 21:15:57.6148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9OyHeawnfZF5fM5BxVy1N8qtdcGx5vTW1aWuXQU1jiWRC4Z1AYwK9F60BwpuVsGe05RFE6Q0IvAh0Sp5pnddw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR14MB4242

Add a v4l2 sensor driver for Sony IMX728


v4l2-compliance 1.24.1, 64 bits, 64-bit time_t

Compliance test for device /dev/v4l-subdev4:

Driver Info:
        Driver version   : 6.1.80
        Capabilities     : 0x00000002
                Streams Support

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev4 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev4: 43, Succeeded: 43, Failed: 0, Warnings: =
0

Spencer Hill (2):
  media: i2c: Add driver for Sony IMX728
  media: dt-bindings: Add Sony IMX728

 .../bindings/media/i2c/sony,imx728.yaml       |   78 +
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx728.c                    | 1167 ++++++
 drivers/media/i2c/imx728.h                    | 3458 +++++++++++++++++
 6 files changed, 4724 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx728=
.yaml
 create mode 100644 drivers/media/i2c/imx728.c
 create mode 100644 drivers/media/i2c/imx728.h

--
2.40.1

Please be aware that this email includes email addresses outside of the org=
anization.

