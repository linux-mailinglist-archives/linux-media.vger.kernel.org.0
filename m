Return-Path: <linux-media+bounces-11149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 852248BFF34
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 15:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30B7628B7AB
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 13:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD4184E0B;
	Wed,  8 May 2024 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="OYKRKx5W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C83585297;
	Wed,  8 May 2024 13:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715175906; cv=fail; b=smiWWmhlYrtPlOtsYYfQ5qbsgzQFkWzE2lIGExx+4yFHZWKPtUGTi1Mm9t59eakhwHBe8w75rYk2kh6rwz/PVOl3A2+gpKZo5higPebnjCt4Hio+XlzABZecbEbUghBw3qWKJ66Tm5+qiaY4WI4JrAKzcBDegDaajpyy7QL4yKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715175906; c=relaxed/simple;
	bh=aKnRITcLdq8zlLABZZZGEkWbQChFElWOr/bExDbAuVU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YIIiOhnsddqXYy6U9Y4AlVgQN5A/fwXcMc9vxyczK4nOSEMtnE9entRTRs9yBXPJ1DLdoTe8jlmUl/x1cKLLkWvoPWuFR9Vo4XRTdtEM1ZBYqforW54cHniUJQxyFlMf702AlHHSqKB9frYsrFOctfUY/h+Am6veox+einnyFL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=OYKRKx5W; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44871vlJ031118;
	Wed, 8 May 2024 07:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=DKIM; bh=xogS+nfG2iHC
	4JVOcC5gi6myVCqNbZOKd1Gctav9hxI=; b=OYKRKx5WKYHv/5/K55XuoYgj4ZCS
	Xt8maVEoa8UDiJC8qYM/CXYzaGvxnCewEl2F2cOpEn1jWi0qGiGeVy6mJsvNMdT3
	9timN1PYr9b+74liYr6TF1sEpDhMtyfKRMPDbi41xk4ZZe9sFkpFdTLupPdW34Ma
	AB/g0NujiKQX2lHSsbm8y8s2eyKVgdFuOGrCXyVpMDgsehSgtZDoVHuDxmmoYar7
	bQUvOKfD9PxMRD0+V+z+UtVUFzNvuoctx5jcGfjquwvMl/kI0sT8oof+7GORlMYW
	x/J7rpvES0W9UXGeltSDqpm3qv6LbObV7LUPt5VQw8PPr7u4SCzl/1C/kQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3xysg7u69t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 07:47:18 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnNx0qLFbUEM1HJ6xT/4tBLB69bu0MQIkmAmXPYGSan7SbQ++bUJAuN7qkqJXbkHqbLpUs3T6I6YHJt+TQgjhtbMs5LIVmPw5SyXzC0hohtTbSzLoz8wseSepYaRKVcn+Wm66WfExj+RjcPwavCDBDU/BZWSSsRGeFyElOG+BAkR+2Hxv+Y3NFSa1ph+FACo9pfbeS0foPZj+HtF3a9YoLjgSyILKX9HmvjWNZKZZDoZLrgDKE3IUrrCIKqy3gLmlSpFk7IBzWrZtY6y+iII2O3bmOCSaGvAcpV3Jum4QaxF1mmBRTKjFlPxeFFoZJ0U0PkphU9sIn5JLOGW0oL4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xogS+nfG2iHC4JVOcC5gi6myVCqNbZOKd1Gctav9hxI=;
 b=Vr39Zb52MRPUvqfJKuXe5/vrdHEbGqnrAQbo7U/4kzedOPjEf9Ko4TYlbOWvxoPD0STIb9NYthfC2M8qULIGIypjkonb6Vh31t94I+Gk6cLO1aywY3nGZn/fQAWlBwZ4CdKOf+VYS4BSyEfKVT9c+p3blYsyNHuRtcEzuoEuqm/1wao4timsJKrISE0DKzgZNJZguQgLQ2GG7Gor/oC2d8dzfTqnVpotOAvTunQDFlyTWupQ/ANLrr8nGJVsm3U1ttHJnhkjWVCccats94Bg+ZIUC3sMWKWm2Y+u7YU/MWPMUY3QZtg/nkLh4Ln4IXHL2081BIrfmo3OlUhs7FmUbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from MWHPR03MB3245.namprd03.prod.outlook.com (2603:10b6:301:3c::20)
 by SN7PR03MB7183.namprd03.prod.outlook.com (2603:10b6:806:2e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Wed, 8 May
 2024 11:47:15 +0000
Received: from MWHPR03MB3245.namprd03.prod.outlook.com
 ([fe80::3eff:f373:7fe4:b97e]) by MWHPR03MB3245.namprd03.prod.outlook.com
 ([fe80::3eff:f373:7fe4:b97e%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 11:47:15 +0000
From: "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
To: "julien.massot@collabora.com" <julien.massot@collabora.com>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
Subject: Re: [PATCH v7 3/5] media: i2c: add MAX96717 driver
Thread-Topic: Re: [PATCH v7 3/5] media: i2c: add MAX96717 driver
Thread-Index: AdqhOJHRHcC/decLS5yxxutPZweKpQ==
Date: Wed, 8 May 2024 11:47:15 +0000
Message-ID: 
 <MWHPR03MB32455B0276679AF8D7319D8D9BE52@MWHPR03MB3245.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYnRvZ29yZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1iNWE4NDAyZi0wZDMwLTExZWYtOWJhZC00MTU2?=
 =?us-ascii?Q?NDUwMDAwMzBcYW1lLXRlc3RcYjVhODQwMzAtMGQzMC0xMWVmLTliYWQtNDE1?=
 =?us-ascii?Q?NjQ1MDAwMDMwYm9keS50eHQiIHN6PSI2NzE4MiIgdD0iMTMzNTk2NDI0MzQx?=
 =?us-ascii?Q?Mjg5NTI4IiBoPSJpRW1UTzFRYVRBcDUyV1JJN1cyOGUvSkN2Z289IiBpZD0i?=
 =?us-ascii?Q?IiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFFb0NB?=
 =?us-ascii?Q?QUE0K2g5NFBhSGFBVHp2TStlMXUvNFJQTzh6NTdXNy9oRURBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBSEFBQUFEYUFRQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBUUFCQUFBQXZzR0prUUFBQUFBQUFBQUFBQUFBQUo0QUFBQmhBR1FB?=
 =?us-ascii?Q?YVFCZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeUFHOEFhZ0JsQUdNQWRBQnpB?=
 =?us-ascii?Q?RjhBWmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1BYVFCMEFHa0FkZ0JsQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdFQVpBQnBBRjhBY3dCbEFHTUFk?=
 =?us-ascii?Q?UUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3QjBBR2tBWlFCeUFE?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFZUUJrQUdrQVh3QnpBR1VBWXdCMUFISUFaUUJmQUhBQWNn?=
 =?us-ascii?Q?QnZBR29BWlFCakFIUUFjd0JmQUhRQWFRQmxBSElBTWdBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBQT09Ii8+PC9t?=
 =?us-ascii?Q?ZXRhPg=3D=3D?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR03MB3245:EE_|SN7PR03MB7183:EE_
x-ms-office365-filtering-correlation-id: 3383526c-543a-4eee-6aae-08dc6f549b75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|366007|1800799015|7416005|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?u7kHuC93h+G9Gz1vRljufsv9qz7zrxkVNtEDhYfAqSV0qnHeIg+LP3XAbNs0?=
 =?us-ascii?Q?ga2ds/pflW/IGETQtyyQ/msZWEl6ZrUcrBwKyldqk6TNhrCz9dm+1YExo5MO?=
 =?us-ascii?Q?4oc3rvFVBoOEJL5kPHocoDOZhlvbJW5VjJ+6HFqUlc6VAMfp+jyy9oyIielU?=
 =?us-ascii?Q?aZy4hW+9erZrQ0KOAVTACMnuFg7fMVyuDq9pfsDA2uzrONaiNw6BfZ3QSn4G?=
 =?us-ascii?Q?00KM978iihbtPgZLfa5/wpXezFIsOY0XUZwE8I7/C2ivNjCnAqT2ZfiJGY6v?=
 =?us-ascii?Q?Q4hN5nyWT674MiW7pe6KrvReaQ4bNRCD4eNkk2fr2CFhG9DXza84heaAFz/9?=
 =?us-ascii?Q?gvrJhbim5JpG13Xw7DbifXZ0sXz7XCSQ0UuvqoiKER9QiIcO+5K0qv5hgSsO?=
 =?us-ascii?Q?mfrjlS4GI46zY6fUKlea9PTGLjpm2PMztT+lHJbHwgUheGWHScDQj8rsR5xs?=
 =?us-ascii?Q?blEkyHEbtc5uGCB2dYSIBjO7plbVlLGoMlCDpVQ+Y6C0f6VSfDdS1S/R3g4R?=
 =?us-ascii?Q?9SgRnMqeyYI2R+IX2owKUHPVF3mKgp6cDoM3Zd7W/hU8i7LBbxh4vixQ5wf3?=
 =?us-ascii?Q?Kh5RBIrhD5XilrG4Kd7M/9AlOQXFXcYuDqi+I5itw5q/0ZFMfU9T1UNu7U9x?=
 =?us-ascii?Q?DvxZdiweRkjxtvEheavfHDt2LcoKqBbXyAYLZcUHmUTPCTkPX5V7VoZtQjep?=
 =?us-ascii?Q?3dO2cVHm6B5uor3o2bFS7Fz8tnVoTqY19cGarePcZxNUXEo78ICPs+rlHXRR?=
 =?us-ascii?Q?TRzxANFY5/dsWr3IaQyw6H6+caRmYLXmnpTkrIFMD8LngQJYPAjSLRlhBrUA?=
 =?us-ascii?Q?mGzQC4hMvg6UaZ1mb+xk8bjNjpOB59Dwd5818Nhja7/Z7sDtCXL+s4HO845f?=
 =?us-ascii?Q?68yXqjVIASS6Rt94JBXdW5Sh2t6wu++eY710d1o63HZaBJB20y7IszI97sW1?=
 =?us-ascii?Q?KpG0dypeKlOOb1AV3H+mCv7R8IzycN55p6KikXh1La0c3+psWpzDWpm7nBjW?=
 =?us-ascii?Q?o/cZqFka51eP6pC6MqK3IU1hN1Uch4CtOQr4EQV2HkAczg/DvoDX9BwlhxnU?=
 =?us-ascii?Q?pG4veksot46nwGezkdnFa6RVKLlnA9ahJgLFC9D5wEt7cC4DP4SMCA6ODwMk?=
 =?us-ascii?Q?//MDi27MhcpESooxm/v9iEg8y+/Zo8TUWOviId63Z/EPBI1mIPJ0WkGRIHDm?=
 =?us-ascii?Q?GEqBKjtODopAGOVXGdFXiRCWwfCsiNRT1IHEjMuWk+WwWue00xLfIbp4R9aS?=
 =?us-ascii?Q?mZ5TMo4Y3VJEl1QPJoVtSw1/6p/nzvRHrn62ph5y9mhONSHAMinWJwxIW3Q6?=
 =?us-ascii?Q?CPXIQh3v3GONU0kSJ0Xl8JbffMlte6Yk1RZllkitonMbDw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR03MB3245.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?CEEAPA9bCcaxbnKohghQA0YUrShx+4a6vpdv0d+zrXK1luPbAsRzxKhukje3?=
 =?us-ascii?Q?VNrykRGUNYcq2hHyWn7FHWcp8rRExEuNjjksHiwz3L233+3FoWofOZMjvj1r?=
 =?us-ascii?Q?9RKwVy0lGytBJwwtMs35ievFhUxIgoIOiHczxodv3f/hCiMLNMplpKA+mI9p?=
 =?us-ascii?Q?a4v2sk4ZkCk1LJjvUrPnjwF3V1Hg3C0bphfBThXXPVM4iPVfvrsfsa1AKo4p?=
 =?us-ascii?Q?5GC0WiMPh5YqT94gwFuutg2BDnJhRRt1BakruvG7gmzViCQvOFWcS3OfCa8x?=
 =?us-ascii?Q?XDa65/7vIf8jgLFuoeMJD9yCIHn2LnAFZ1aCSCT4Z2gzUVLzMYRV9NCRHbFk?=
 =?us-ascii?Q?Gq38R1/dFlF4kVIFMYIMzH8usfFydL7Kbsh0Q0ke0FhztmuW9gcSlwwI/XKZ?=
 =?us-ascii?Q?/GpS4SMRZTRA0/lrBaLah3fh1ZsHsDX/b+WhL6/qYYMeV+i/do+HgOyB8n8D?=
 =?us-ascii?Q?X8OjOQwSyeKTjYndQusUs8/Y/ggOSeYn8Sutk5PztmvVYk2W9Q/Y3zToPLuL?=
 =?us-ascii?Q?hKsfHrO0n1zzucruwI+6SvkuQWIO1H0b5KTh7XiaoqtJdelF/Ta/X9CF8m7d?=
 =?us-ascii?Q?5JC9h3rvylV47nuKnztxll0mep4OgMS0/64brGREmQsn/8kwMdvmpTOcC0mM?=
 =?us-ascii?Q?eH5z9q4XoPTby56x2Ovrj5ttFITLRMEP9f4iVoz723+9xrum3vCFuFTOoq8z?=
 =?us-ascii?Q?PywQEwNXIy5hFXuTntjbQxDmc+GwZX6KIAlx6TdcAvVFU/L2x1s9JwlTkx0O?=
 =?us-ascii?Q?EhQMYfXS/6dCFRmbE4Z8Dno7+vIPo6TKA1LnmUdmeSL2obA9Xnx3UNYPZzg3?=
 =?us-ascii?Q?saZvSLJ3nDpPOScZ7NS5jz9RZRPiaLj50IBJnoGAjWclk0Bn6MwOt7hNpasf?=
 =?us-ascii?Q?2FlTcxVGIL117+7JkH0rXscavUE9qcxfMiSjZjHgjVQ3wu3EdLD/WtmuIQlq?=
 =?us-ascii?Q?TBRsjkwekVmcrlh5oDFTQxX7Xg2Jra7hf+Eu5CGlwWNE4iv7wh0zW8B+dZIY?=
 =?us-ascii?Q?A/CN4xenQ/0pzWXv+1DsZ8sj1J2vNStqbFDzPnoJcl8J9IOaDEmiPeqrqGmd?=
 =?us-ascii?Q?vxWPnf9DOW+MCa7eyJvujPZXkPgBVGNSZctkCAxb+RSlyjIGeO/9jSOKZsxr?=
 =?us-ascii?Q?Ct+z1YgJ25/0bSxjVwCTIiLKaQ1CqOL5WiqzZ/fO3+8KC3Q602qocUXglhFn?=
 =?us-ascii?Q?XySsN9FJPva7yqAfPfAQF7tRZC2AvQoxLV2JaEvY1UNtB7qgvTvgE1W3qeS7?=
 =?us-ascii?Q?XrRkxG2p3SCdE73ial/c2pOgwfdJJDUztXLSpHfr+EB1XsxNm9J5XTNBpXws?=
 =?us-ascii?Q?CcxbbRjjIHizuIw8WxtJg4mtMEPAXFrJTQ0FZQHckZQwsxHbsJddrCF98SkP?=
 =?us-ascii?Q?+XIt5akrWuIQCkjtcfdDSwIPzPNKCYSkVeUxkFYEWN/ufSP4Pk1oC1sV9jyT?=
 =?us-ascii?Q?EJKR/ks7zKIbH9qNdhxstE07o6ZCOxHMfuF0btvGhqFGfzojvasBpVyFDg9z?=
 =?us-ascii?Q?14ylEYofiw/jGhNLFgM1Nx+WwgXOyzXR7JNZ9OcpYUtDtcUEcX49s4qxSrrr?=
 =?us-ascii?Q?Vi2gYjo4mSicr38RcCyY2dnm/LnX35SBqETEclCr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR03MB3245.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3383526c-543a-4eee-6aae-08dc6f549b75
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 11:47:15.5766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cv/aK2kq5uI22rXGoxTmUN0TZQaRKS0gh0HMex9u5iHxMIO9GrhnXWUU4N5brT92bgOBAP7sW+Xz8bWbYswm2if5M0n+ppJ3Fs5wMdDPhSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7183
X-Proofpoint-GUID: FkFY6SO7TyjFN66oUXJdT7-aNhN0p_Vx
X-Proofpoint-ORIG-GUID: FkFY6SO7TyjFN66oUXJdT7-aNhN0p_Vx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_07,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080083

Hi Julien,

> This driver handles the MAX96717 serializer in tunnel mode.
> All incoming CSI traffic will be tunneled through the GMSL2 link.
>=20
> The MAX96717 driver can handle MAX96717 and MAX96717F variants with the s=
ame "maxim,max96717f" compatible.
>=20
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
> Change since v6:
>   - Kconfig select MEDIA_CONTROLLER, V4L2_FWNODE and VIDEO_V4L2_SUBDEV_AP=
I
>   - rename 'REG3' register to 'MAX96717_REG3'
>   - Initialized 'ret' variable in 'max96717_gpiochip_probe'
>   - remove max96714_v4l2_notifier_unregister and call the function direct=
ly
>   - Do not store private pointer with i2c_set_clientdata since the v4l2-i=
2c
>     uses it to store the subdev pointer
>   - use dev_err_probe at gpio chip initialization
>=20
> Change since v5:
>   - set the driver compatible back to MAX96717F that can be used as a fal=
lback for MAX96717
>=20
> Change since v4:
>   - make the driver compatible with MAX96717 instead of MAX96717F
>   - Add the device id for the MAX96717
>   - remove hw_data structure for now, it can be usefull later for handlin=
g different serializers e.g max9295
>=20
> Change since v3:
>   - Maintainers: align to the new binding path
>   - Kconfig: better describe the symbol
>   - store the v4l2_mbus_config_mipi_csi2 structure instead of the full en=
dpoint in the driver private structure
>   - use MAX96717_PAD_SINK/SOURCE instead of 0/1 for pad intialization
>   - Removed incorrect call to fwnode_handle_put(priv->sd.fwnode)
>   - Use unsigned int instead of u8
>   - Allocate clk name out of the clk struct initialization
>   - fixed multiline comment
>   - Removed one unnecessary goto at the end of the probe function
>=20
> Change since v2:
>   - Use CCI helpers instead of recoding register access
>   - add missing bitfield header
> ---
>   MAINTAINERS                  |   7 +
>   drivers/media/i2c/Kconfig    |  17 +
>   drivers/media/i2c/Makefile   |   1 +
>   drivers/media/i2c/max96717.c | 928 +++++++++++++++++++++++++++++++++++
>   4 files changed, 953 insertions(+)
>   create mode 100644 drivers/media/i2c/max96717.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eea74166a2d9..cfaa904ace59 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13426,6 +13426,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
>   F:	drivers/staging/media/max96712/max96712.c
>   +MAX96717 GMSL2 SERIALIZER DRIVER
> +M:	Julien Massot <julien.massot@collabora.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +F:	drivers/media/i2c/max96717.c
> +
>   MAX9860 MONO AUDIO VOICE CODEC DRIVER
>   M:	Peter Rosin <peda@axentia.se>
>   L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig index =
c6d3ee472d81..9918195e09ba 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1575,6 +1575,23 @@ config VIDEO_DS90UB960
>   	  Device driver for the Texas Instruments DS90UB960
>   	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
>   +config VIDEO_MAX96717
> +	tristate "Maxim MAX96717 GMSL2 Serializer support"
> +	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
> +	select I2C_MUX
> +	select MEDIA_CONTROLLER
> +	select GPIOLIB
> +	select V4L2_CCI_I2C
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  Device driver for the Maxim MAX96717 GMSL2 Serializer.
> +	  MAX96717 serializers convert video on a MIPI CSI-2
> +	  input to a GMSL2 output.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called max96717.
> +
>   endmenu
>    endif # VIDEO_DEV
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile inde=
x dfbe6448b549..9e007116f929 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_VIDEO_LM3646) +=3D lm3646.o
>   obj-$(CONFIG_VIDEO_M52790) +=3D m52790.o
>   obj-$(CONFIG_VIDEO_MAX9271_LIB) +=3D max9271.o
>   obj-$(CONFIG_VIDEO_MAX9286) +=3D max9286.o
> +obj-$(CONFIG_VIDEO_MAX96717) +=3D max96717.o
>   obj-$(CONFIG_VIDEO_ML86V7667) +=3D ml86v7667.o
>   obj-$(CONFIG_VIDEO_MSP3400) +=3D msp3400.o
>   obj-$(CONFIG_VIDEO_MT9M001) +=3D mt9m001.o diff --git a/drivers/media/i=
2c/max96717.c b/drivers/media/i2c/max96717.c new file
> mode 100644 index 000000000000..1ea76f922bdb
> --- /dev/null
> +++ b/drivers/media/i2c/max96717.c
> @@ -0,0 +1,928 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Maxim GMSL2 Serializer Driver
> + *
> + * Copyright (C) 2024 Collabora Ltd.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/fwnode.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/i2c-mux.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define MAX96717_DEVICE_ID  0xbf
> +#define MAX96717F_DEVICE_ID 0xc8
> +#define MAX96717_PORTS      2
> +#define MAX96717_PAD_SINK   0
> +#define MAX96717_PAD_SOURCE 1
> +
> +#define MAX96717_DEFAULT_CLKOUT_RATE	24000000UL
> +
> +/* DEV */
> +#define MAX96717_REG3    CCI_REG8(0x3)
> +#define MAX96717_RCLKSEL GENMASK(1, 0)
> +#define RCLKSEL_REF_PLL  CCI_REG8(0x3)
> +#define MAX96717_REG6    CCI_REG8(0x6)
> +#define RCLKEN           BIT(5)
> +#define MAX96717_DEV_ID  CCI_REG8(0xd)
> +#define MAX96717_DEV_REV CCI_REG8(0xe)
> +#define MAX96717_DEV_REV_MASK GENMASK(3, 0)
> +
> +/* VID_TX Z */
> +#define MAX96717_VIDEO_TX2 CCI_REG8(0x112) #define
> +MAX96717_VIDEO_PCLKDET BIT(7)
> +
> +/* GPIO */
> +#define MAX96717_NUM_GPIO         11
> +#define MAX96717_GPIO_REG_A(gpio) CCI_REG8(0x2be + (gpio) * 3)
> +#define MAX96717_GPIO_OUT         BIT(4)
> +#define MAX96717_GPIO_IN          BIT(3)
> +#define MAX96717_GPIO_RX_EN       BIT(2)
> +#define MAX96717_GPIO_TX_EN       BIT(1)
> +#define MAX96717_GPIO_OUT_DIS     BIT(0)
> +
> +/* FRONTTOP */
> +/* MAX96717 only have CSI port 'B' */
> +#define MAX96717_FRONTOP0     CCI_REG8(0x308)
> +#define MAX96717_START_PORT_B BIT(5)
> +
> +/* MIPI_RX */
> +#define MAX96717_MIPI_RX1       CCI_REG8(0x331)
> +#define MAX96717_MIPI_LANES_CNT GENMASK(5, 4)
> +#define MAX96717_MIPI_RX2       CCI_REG8(0x332) /* phy1 Lanes map */
> +#define MAX96717_PHY2_LANES_MAP GENMASK(7, 4)
> +#define MAX96717_MIPI_RX3       CCI_REG8(0x333) /* phy2 Lanes map */
> +#define MAX96717_PHY1_LANES_MAP GENMASK(3, 0)
> +#define MAX96717_MIPI_RX4       CCI_REG8(0x334) /* phy1 lane polarities =
*/
> +#define MAX96717_PHY1_LANES_POL GENMASK(6, 4)
> +#define MAX96717_MIPI_RX5       CCI_REG8(0x335) /* phy2 lane polarities =
*/
> +#define MAX96717_PHY2_LANES_POL GENMASK(2, 0)
> +
> +/* MIPI_RX_EXT */
> +#define MAX96717_MIPI_RX_EXT11 CCI_REG8(0x383)
> +#define MAX96717_TUN_MODE      BIT(7)
> +
> +/* REF_VTG */
> +#define REF_VTG0                CCI_REG8(0x3f0)
> +#define REFGEN_PREDEF_EN        BIT(6)
> +#define REFGEN_PREDEF_FREQ_MASK GENMASK(5, 4) #define
> +REFGEN_PREDEF_FREQ_ALT  BIT(3)
> +#define REFGEN_RST              BIT(1)
> +#define REFGEN_EN               BIT(0)
> +
> +/* MISC */
> +#define PIO_SLEW_1 CCI_REG8(0x570)
> +
> +struct max96717_priv {
> +	struct i2c_client		  *client;
> +	struct regmap			  *regmap;
> +	struct i2c_mux_core		  *mux;
> +	struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
> +	struct v4l2_subdev                sd;
> +	struct media_pad                  pads[MAX96717_PORTS];
> +	struct v4l2_async_notifier        notifier;
> +	struct v4l2_subdev                *source_sd;
> +	u16                               source_sd_pad;
> +	u64			          enabled_source_streams;
> +	u8                                pll_predef_index;
> +	struct clk_hw                     clk_hw;
> +	struct gpio_chip                  gpio_chip;
> +};
> +
> +static inline struct max96717_priv *sd_to_max96717(struct v4l2_subdev
> +*sd) {
> +	return container_of(sd, struct max96717_priv, sd); }
> +
> +static inline struct max96717_priv *clk_hw_to_max96717(struct clk_hw
> +*hw) {
> +	return container_of(hw, struct max96717_priv, clk_hw); }
> +
> +static int max96717_i2c_mux_select(struct i2c_mux_core *mux, u32 chan)
> +{
> +	return 0;
> +}
> +
> +static int max96717_i2c_mux_init(struct max96717_priv *priv) {
> +	priv->mux =3D i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
> +				  1, 0, I2C_MUX_LOCKED | I2C_MUX_GATE,
> +				  max96717_i2c_mux_select, NULL);
> +	if (!priv->mux)
> +		return -ENOMEM;
> +
> +	return i2c_mux_add_adapter(priv->mux, 0, 0, 0); }

From my perspective i2c-atr should be used here. Besides i2c muxing ADI ser=
ializers support
address translation and this functionality is especially useful in configur=
ations with multiple
serializers connected to same deserializer.

> +
> +static inline int max96717_start_csi(struct max96717_priv *priv, bool
> start)
> +{
> +	return cci_update_bits(priv->regmap, MAX96717_FRONTOP0,
> +			       MAX96717_START_PORT_B,
> +			       start ? MAX96717_START_PORT_B : 0, NULL); }
> +
> +static int max96717_gpiochip_get(struct gpio_chip *gpiochip,
> +				 unsigned int offset)
> +{
> +	struct max96717_priv *priv =3D gpiochip_get_data(gpiochip);
> +	u64 val;
> +	int ret;
> +
> +	ret =3D cci_read(priv->regmap, MAX96717_GPIO_REG_A(offset),
> +		       &val, NULL);
> +	if (ret)
> +		return ret;
> +
> +	if (val & MAX96717_GPIO_OUT_DIS)
> +		return !!(val & MAX96717_GPIO_IN);
> +	else
> +		return !!(val & MAX96717_GPIO_OUT);
> +}
> +
> +static void max96717_gpiochip_set(struct gpio_chip *gpiochip,
> +				  unsigned int offset, int value)
> +{
> +	struct max96717_priv *priv =3D gpiochip_get_data(gpiochip);
> +
> +	cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(offset),
> +			MAX96717_GPIO_OUT, MAX96717_GPIO_OUT, NULL); }
> +
> +static int max96717_gpio_get_direction(struct gpio_chip *gpiochip,
> +				       unsigned int offset)
> +{
> +	struct max96717_priv *priv =3D gpiochip_get_data(gpiochip);
> +	u64 val;
> +	int ret;
> +
> +	ret =3D cci_read(priv->regmap, MAX96717_GPIO_REG_A(offset), &val, NULL)=
;
> +	if (ret < 0)
> +		return ret;
> +
> +	return !!(val & MAX96717_GPIO_OUT_DIS); }
> +
> +static int max96717_gpio_direction_out(struct gpio_chip *gpiochip,
> +				       unsigned int offset, int value) {
> +	struct max96717_priv *priv =3D gpiochip_get_data(gpiochip);
> +
> +	return cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(offset),
> +			       MAX96717_GPIO_OUT_DIS | MAX96717_GPIO_OUT,
> +			       value ? MAX96717_GPIO_OUT : 0, NULL); }
> +
> +static int max96717_gpio_direction_in(struct gpio_chip *gpiochip,
> +				      unsigned int offset)
> +{
> +	struct max96717_priv *priv =3D gpiochip_get_data(gpiochip);
> +
> +	return cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(offset),
> +			       MAX96717_GPIO_OUT_DIS, MAX96717_GPIO_OUT_DIS,
> +			       NULL);
> +}
> +
> +static int max96717_gpiochip_probe(struct max96717_priv *priv) {
> +	struct device *dev =3D &priv->client->dev;
> +	struct gpio_chip *gc =3D &priv->gpio_chip;
> +	int i, ret =3D 0;

MFP pins of GMSL serdes are multifunctional as the name suggests and I thin=
k that proper
pinctrl should be implemented and expose alternative functions like RCLKOUT=
 (MFP2, MFP4),=20
PCLK(MFP0-MFP8), GPIO forwarding.
Also with pinctrl we will be able to control bias, jitter compensation, dri=
ve strength

> +
> +	gc->label =3D dev_name(dev);
> +	gc->parent =3D dev;
> +	gc->owner =3D THIS_MODULE;
> +	gc->ngpio =3D MAX96717_NUM_GPIO;
> +	gc->base =3D -1;
> +	gc->can_sleep =3D true;
> +	gc->get_direction =3D max96717_gpio_get_direction;
> +	gc->direction_input =3D max96717_gpio_direction_in;
> +	gc->direction_output =3D max96717_gpio_direction_out;
> +	gc->set =3D max96717_gpiochip_set;
> +	gc->get =3D max96717_gpiochip_get;
> +	gc->of_gpio_n_cells =3D 2;
> +
> +	/* Disable GPIO forwarding */
> +	for (i =3D 0; i < gc->ngpio; i++)
> +		cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(i),
> +				MAX96717_GPIO_RX_EN | MAX96717_GPIO_TX_EN,
> +				0, &ret);

I think we should not ignore forwarding. It is often used in propagation of=
 FSYNC
from host(deserializer) side to serializers and further to sensors for mult=
iple cameras synchronization.

> +
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_gpiochip_add_data(dev, gc, priv);
> +	if (ret) {
> +		dev_err(dev, "Unable to create gpio_chip\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int _max96717_set_routing(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_krouting *routing) {
> +	static const struct v4l2_mbus_framefmt format =3D {
> +		.width =3D 1280,
> +		.height =3D 1080,
> +		.code =3D MEDIA_BUS_FMT_Y8_1X8,
> +		.field =3D V4L2_FIELD_NONE,
> +	};
> +	int ret;
> +
> +	ret =3D v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int max96717_set_routing(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				enum v4l2_subdev_format_whence which,
> +				struct v4l2_subdev_krouting *routing) {
> +	struct max96717_priv *priv =3D sd_to_max96717(sd);
> +
> +	if (which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE && priv->enabled_source_stre=
ams)
> +		return -EBUSY;
> +
> +	return _max96717_set_routing(sd, state, routing); }
> +
> +static int max96717_set_fmt(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    struct v4l2_subdev_format *format) {
> +	struct max96717_priv *priv =3D sd_to_max96717(sd);
> +	struct v4l2_mbus_framefmt *fmt;
> +	u64 stream_source_mask;
> +
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> +	    priv->enabled_source_streams)
> +		return -EBUSY;
> +
> +	/* No transcoding, source and sink formats must match. */
> +	if (format->pad =3D=3D MAX96717_PAD_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, state, format);
> +
> +	/* Set sink format */
> +	fmt =3D v4l2_subdev_state_get_format(state, format->pad, format->stream=
);
> +	if (!fmt)
> +		return -EINVAL;
> +
> +	*fmt =3D format->format;
> +
> +	/* Propagate to source format */
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(state, format->pad=
,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +	*fmt =3D format->format;
> +
> +	stream_source_mask =3D BIT(format->stream);
> +
> +	return v4l2_subdev_state_xlate_streams(state, MAX96717_PAD_SOURCE,
> +					       MAX96717_PAD_SINK,
> +					       &stream_source_mask);
> +}
> +
> +static int max96717_init_state(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *state) {
> +	struct v4l2_subdev_route routes[] =3D {
> +		{
> +			.sink_pad =3D MAX96717_PAD_SINK,
> +			.sink_stream =3D 0,
> +			.source_pad =3D MAX96717_PAD_SOURCE,
> +			.source_stream =3D 0,
> +			.flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +	struct v4l2_subdev_krouting routing =3D {
> +		.num_routes =3D ARRAY_SIZE(routes),
> +		.routes =3D routes,
> +	};
> +
> +	return _max96717_set_routing(sd, state, &routing); }
> +
> +static bool max96717_pipe_pclkdet(struct max96717_priv *priv) {
> +	u64 val =3D 0;
> +
> +	cci_read(priv->regmap, MAX96717_VIDEO_TX2, &val, NULL);
> +
> +	return val & MAX96717_VIDEO_PCLKDET;
> +}
> +
> +static int max96717_log_status(struct v4l2_subdev *sd) {
> +	struct max96717_priv *priv =3D sd_to_max96717(sd);
> +	struct device *dev =3D &priv->client->dev;
> +
> +	dev_info(dev, "Serializer: max96717\n");
> +	dev_info(dev, "Pipe: pclkdet:%d\n", max96717_pipe_pclkdet(priv));
> +
> +	return 0;
> +}
> +
> +static int max96717_enable_streams(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state, u32 pad,
> +				   u64 streams_mask)
> +{
> +	struct max96717_priv *priv =3D sd_to_max96717(sd);
> +	struct device *dev =3D &priv->client->dev;
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams =3D v4l2_subdev_state_xlate_streams(state,
> +						       MAX96717_PAD_SOURCE,
> +						       MAX96717_PAD_SINK,
> +						       &streams_mask);
> +
> +	if (!priv->enabled_source_streams)
> +		max96717_start_csi(priv, true);
> +
> +	ret =3D v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad=
,
> +					 sink_streams);
> +	if (ret) {
> +		dev_err(dev, "Fail to start streams:%llu on remote subdev\n",
> +			sink_streams);
> +		goto stop_csi;
> +	}
> +
> +	priv->enabled_source_streams |=3D streams_mask;
> +
> +	return 0;
> +
> +stop_csi:
> +	if (!priv->enabled_source_streams)
> +		max96717_start_csi(priv, false);
> +	return ret;
> +}
> +
> +static int max96717_disable_streams(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *state, u32 pad,
> +				    u64 streams_mask)
> +{
> +	struct max96717_priv *priv =3D sd_to_max96717(sd);
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams =3D v4l2_subdev_state_xlate_streams(state,
> +						       MAX96717_PAD_SOURCE,
> +						       MAX96717_PAD_SINK,
> +						       &streams_mask);
> +
> +	ret =3D v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pa=
d,
> +					  sink_streams);
> +	if (ret)
> +		return ret;
> +
> +	priv->enabled_source_streams &=3D ~streams_mask;
> +
> +	if (!priv->enabled_source_streams)
> +		max96717_start_csi(priv, false);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_pad_ops max96717_pad_ops =3D {
> +	.enable_streams =3D max96717_enable_streams,
> +	.disable_streams =3D max96717_disable_streams,
> +	.set_routing =3D max96717_set_routing,
> +	.get_fmt =3D v4l2_subdev_get_fmt,
> +	.set_fmt =3D max96717_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_core_ops max96717_subdev_core_ops =3D {
> +	.log_status =3D max96717_log_status,
> +};
> +
> +static const struct v4l2_subdev_internal_ops max96717_internal_ops =3D {
> +	.init_state =3D max96717_init_state,
> +};
> +
> +static const struct v4l2_subdev_ops max96717_subdev_ops =3D {
> +	.core =3D &max96717_subdev_core_ops,
> +	.pad =3D &max96717_pad_ops,
> +};
> +
> +static const struct media_entity_operations max96717_entity_ops =3D {
> +	.link_validate =3D v4l2_subdev_link_validate, };
> +
> +static int max96717_notify_bound(struct v4l2_async_notifier *notifier,
> +				 struct v4l2_subdev *source_subdev,
> +				 struct v4l2_async_connection *asd) {
> +	struct max96717_priv *priv =3D sd_to_max96717(notifier->sd);
> +	struct device *dev =3D &priv->client->dev;
> +	int ret;
> +
> +	ret =3D media_entity_get_fwnode_pad(&source_subdev->entity,
> +					  source_subdev->fwnode,
> +					  MEDIA_PAD_FL_SOURCE);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to find pad for %s\n",
> +			source_subdev->name);
> +		return ret;
> +	}
> +
> +	priv->source_sd =3D source_subdev;
> +	priv->source_sd_pad =3D ret;
> +
> +	ret =3D media_create_pad_link(&source_subdev->entity, priv->source_sd_p=
ad,
> +				    &priv->sd.entity, 0,
> +				    MEDIA_LNK_FL_ENABLED |
> +				    MEDIA_LNK_FL_IMMUTABLE);
> +	if (ret) {
> +		dev_err(dev, "Unable to link %s:%u -> %s:0\n",
> +			source_subdev->name, priv->source_sd_pad,
> +			priv->sd.name);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations max96717_notify_ops =
=3D {
> +	.bound =3D max96717_notify_bound,
> +};
> +
> +static int max96717_v4l2_notifier_register(struct max96717_priv *priv)
> +{
> +	struct device *dev =3D &priv->client->dev;
> +	struct v4l2_async_connection *asd;
> +	struct fwnode_handle *ep_fwnode;
> +	int ret;
> +
> +	ep_fwnode =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> +						    MAX96717_PAD_SINK, 0, 0);
> +	if (!ep_fwnode) {
> +		dev_err(dev, "No graph endpoint\n");
> +		return -ENODEV;
> +	}
> +
> +	v4l2_async_subdev_nf_init(&priv->notifier, &priv->sd);
> +
> +	asd =3D v4l2_async_nf_add_fwnode_remote(&priv->notifier, ep_fwnode,
> +					      struct v4l2_async_connection);
> +
> +	fwnode_handle_put(ep_fwnode);
> +
> +	if (IS_ERR(asd)) {
> +		dev_err(dev, "Failed to add subdev: %ld", PTR_ERR(asd));
> +		v4l2_async_nf_cleanup(&priv->notifier);
> +		return PTR_ERR(asd);
> +	}
> +
> +	priv->notifier.ops =3D &max96717_notify_ops;
> +
> +	ret =3D v4l2_async_nf_register(&priv->notifier);
> +	if (ret) {
> +		dev_err(dev, "Failed to register subdev_notifier");
> +		v4l2_async_nf_cleanup(&priv->notifier);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max96717_subdev_init(struct max96717_priv *priv) {
> +	struct device *dev =3D &priv->client->dev;
> +	int ret;
> +
> +	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96717_subdev_ops);
> +	priv->sd.internal_ops =3D &max96717_internal_ops;
> +
> +	priv->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS=
;
> +	priv->sd.entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> +	priv->sd.entity.ops =3D &max96717_entity_ops;
> +
> +	priv->pads[MAX96717_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
> +	priv->pads[MAX96717_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
> +
> +	ret =3D media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to init pads\n");
> +
> +	ret =3D v4l2_subdev_init_finalize(&priv->sd);
> +	if (ret) {
> +		dev_err_probe(dev, ret,
> +			      "v4l2 subdev init finalized failed\n");
> +		goto err_entity_cleanup;
> +	}
> +	ret =3D max96717_v4l2_notifier_register(priv);
> +	if (ret) {
> +		dev_err_probe(dev, ret,
> +			      "v4l2 subdev notifier register failed\n");
> +		goto err_free_state;
> +	}
> +
> +	ret =3D v4l2_async_register_subdev(&priv->sd);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "v4l2_async_register_subdev error\n");
> +		goto err_unreg_notif;
> +	}
> +
> +	return 0;
> +
> +err_unreg_notif:
> +	v4l2_async_nf_unregister(&priv->notifier);
> +	v4l2_async_nf_cleanup(&priv->notifier);
> +err_free_state:
> +	v4l2_subdev_cleanup(&priv->sd);
> +err_entity_cleanup:
> +	media_entity_cleanup(&priv->sd.entity);
> +
> +	return ret;
> +}
> +
> +static void max96717_subdev_uninit(struct max96717_priv *priv) {
> +	v4l2_async_unregister_subdev(&priv->sd);
> +	v4l2_async_nf_unregister(&priv->notifier);
> +	v4l2_async_nf_cleanup(&priv->notifier);
> +	v4l2_subdev_cleanup(&priv->sd);
> +	media_entity_cleanup(&priv->sd.entity);
> +}
> +
> +struct max96717_pll_predef_freq {
> +	unsigned long freq;
> +	bool is_alt;
> +	u8 val;
> +};
> +
> +static const struct max96717_pll_predef_freq max96717_predef_freqs[] =3D=
 {
> +	{ 13500000, true,  0 }, { 19200000, false, 0 },
> +	{ 24000000, true,  1 }, { 27000000, false, 1 },
> +	{ 37125000, false, 2 }, { 74250000, false, 3 }, };
> +
> +static unsigned long
> +max96717_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct max96717_priv *priv =3D clk_hw_to_max96717(hw);
> +
> +	return max96717_predef_freqs[priv->pll_predef_index].freq;
> +}
> +
> +static unsigned int max96717_clk_find_best_index(struct max96717_priv
> *priv,
> +						 unsigned long rate)
> +{
> +	unsigned int i, idx;
> +	unsigned long diff_new, diff_old;
> +
> +	diff_old =3D U32_MAX;
> +	idx =3D 0;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(max96717_predef_freqs); i++) {
> +		diff_new =3D abs(rate - max96717_predef_freqs[i].freq);
> +		if (diff_new < diff_old) {
> +			diff_old =3D diff_new;
> +			idx =3D i;
> +		}
> +	}
> +
> +	return idx;
> +}
> +
> +static long max96717_clk_round_rate(struct clk_hw *hw, unsigned long rat=
e,
> +				    unsigned long *parent_rate)
> +{
> +	struct max96717_priv *priv =3D clk_hw_to_max96717(hw);
> +	struct device *dev =3D &priv->client->dev;
> +	unsigned int idx;
> +
> +	idx =3D max96717_clk_find_best_index(priv, rate);
> +
> +	if (rate !=3D max96717_predef_freqs[idx].freq) {
> +		dev_warn(dev, "Request CLK freq:%lu, found CLK freq:%lu\n",
> +			 rate, max96717_predef_freqs[idx].freq);
> +	}
> +
> +	return max96717_predef_freqs[idx].freq; }
> +
> +static int max96717_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				 unsigned long parent_rate)
> +{
> +	struct max96717_priv *priv =3D clk_hw_to_max96717(hw);
> +	unsigned int val, idx;
> +	int ret =3D 0;
> +
> +	idx =3D max96717_clk_find_best_index(priv, rate);
> +
> +	val =3D FIELD_PREP(REFGEN_PREDEF_FREQ_MASK,
> +			 max96717_predef_freqs[idx].val);
> +
> +	if (max96717_predef_freqs[idx].is_alt)
> +		val |=3D REFGEN_PREDEF_FREQ_ALT;
> +
> +	val |=3D REFGEN_RST | REFGEN_PREDEF_EN;
> +
> +	cci_write(priv->regmap, REF_VTG0, val, &ret);
> +	cci_update_bits(priv->regmap, REF_VTG0, REFGEN_RST | REFGEN_EN,
> +			REFGEN_EN, &ret);
> +	if (ret)
> +		return ret;
> +
> +	priv->pll_predef_index =3D idx;
> +
> +	return 0;
> +}
> +
> +static int max96717_clk_prepare(struct clk_hw *hw) {
> +	struct max96717_priv *priv =3D clk_hw_to_max96717(hw);
> +
> +	return cci_update_bits(priv->regmap, MAX96717_REG6, RCLKEN,
> +			       RCLKEN, NULL);
> +}
> +
> +static void max96717_clk_unprepare(struct clk_hw *hw) {
> +	struct max96717_priv *priv =3D clk_hw_to_max96717(hw);
> +
> +	cci_update_bits(priv->regmap, MAX96717_REG6, RCLKEN, 0, NULL); }
> +
> +static const struct clk_ops max96717_clk_ops =3D {
> +	.prepare     =3D max96717_clk_prepare,
> +	.unprepare   =3D max96717_clk_unprepare,
> +	.set_rate    =3D max96717_clk_set_rate,
> +	.recalc_rate =3D max96717_clk_recalc_rate,
> +	.round_rate  =3D max96717_clk_round_rate, };
> +
> +static int max96717_register_clkout(struct max96717_priv *priv) {
> +	struct device *dev =3D &priv->client->dev;
> +	struct clk_init_data init =3D { .ops =3D &max96717_clk_ops };
> +	int ret;
> +
> +	init.name =3D kasprintf(GFP_KERNEL, "max96717.%s.clk_out",
> +			      dev_name(dev));
> +	if (!init.name)
> +		return -ENOMEM;
> +
> +	/* RCLKSEL Reference PLL output */
> +	ret =3D cci_update_bits(priv->regmap, MAX96717_REG3, MAX96717_RCLKSEL,
> +			      MAX96717_RCLKSEL, NULL);
> +	/* MFP4 fastest slew rate */

RCLKOUT on MFP4 is a particular configuration but MFP4 can have other funct=
ions or=20
in some cases MFP2 is used as RCLKOUT so better to not hardcode this.

> +	cci_update_bits(priv->regmap, PIO_SLEW_1, BIT(5) | BIT(4), 0, &ret);
> +	if (ret)
> +		goto free_init_name;
> +
> +	priv->clk_hw.init =3D &init;
> +
> +	/* Initialize to 24 MHz */
> +	ret =3D max96717_clk_set_rate(&priv->clk_hw,
> +				    MAX96717_DEFAULT_CLKOUT_RATE, 0);
> +	if (ret < 0)
> +		goto free_init_name;
> +
> +	ret =3D devm_clk_hw_register(dev, &priv->clk_hw);
> +	kfree(init.name);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot register clock HW\n");
> +
> +	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
> +					  &priv->clk_hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Cannot add OF clock provider\n");
> +
> +	return 0;
> +
> +free_init_name:
> +	kfree(init.name);
> +	return ret;
> +}
> +
> +static int max96717_init_csi_lanes(struct max96717_priv *priv) {
> +	struct v4l2_mbus_config_mipi_csi2 *mipi =3D &priv->mipi_csi2;
> +	unsigned long lanes_used =3D 0;
> +	unsigned int nlanes, lane, val =3D 0;
> +	int ret;
> +
> +	nlanes =3D mipi->num_data_lanes;
> +
> +	ret =3D cci_update_bits(priv->regmap, MAX96717_MIPI_RX1,
> +			      MAX96717_MIPI_LANES_CNT,
> +			      FIELD_PREP(MAX96717_MIPI_LANES_CNT,
> +					 nlanes - 1), NULL);
> +
> +	/* lanes polarity */
> +	for (lane =3D 0; lane < nlanes + 1; lane++) {
> +		if (!mipi->lane_polarities[lane])
> +			continue;
> +		/* Clock lane */
> +		if (lane =3D=3D 0)
> +			val |=3D BIT(2);
> +		else if (lane < 3)
> +			val |=3D BIT(lane - 1);
> +		else
> +			val |=3D BIT(lane);
> +	}
> +
> +	cci_update_bits(priv->regmap, MAX96717_MIPI_RX5,
> +			MAX96717_PHY2_LANES_POL,
> +			FIELD_PREP(MAX96717_PHY2_LANES_POL, val), &ret);
> +
> +	cci_update_bits(priv->regmap, MAX96717_MIPI_RX4,
> +			MAX96717_PHY1_LANES_POL,
> +			FIELD_PREP(MAX96717_PHY1_LANES_POL,
> +				   val >> 3), &ret);
> +	/* lanes mapping */
> +	for (lane =3D 0, val =3D 0; lane < nlanes; lane++) {
> +		val |=3D (mipi->data_lanes[lane] - 1) << (lane * 2);
> +		lanes_used |=3D BIT(mipi->data_lanes[lane] - 1);
> +	}
> +
> +	/*
> +	 * Unused lanes need to be mapped as well to not have
> +	 * the same lanes mapped twice.
> +	 */
> +	for (; lane < 4; lane++) {
> +		unsigned int idx =3D find_first_zero_bit(&lanes_used, 4);
> +
> +		val |=3D idx << (lane * 2);
> +		lanes_used |=3D BIT(idx);
> +	}
> +
> +	cci_update_bits(priv->regmap, MAX96717_MIPI_RX3,
> +			MAX96717_PHY1_LANES_MAP,
> +			FIELD_PREP(MAX96717_PHY1_LANES_MAP, val), &ret);
> +
> +	return cci_update_bits(priv->regmap, MAX96717_MIPI_RX2,
> +			       MAX96717_PHY2_LANES_MAP,
> +			       FIELD_PREP(MAX96717_PHY2_LANES_MAP, val >> 4),
> +			       &ret);
> +}
> +
> +static int max96717_hw_init(struct max96717_priv *priv) {
> +	struct device *dev =3D &priv->client->dev;
> +	u64 dev_id, val;
> +	int ret;
> +
> +	ret =3D cci_read(priv->regmap, MAX96717_DEV_ID, &dev_id, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Fail to read the device id\n");
> +
> +	if (dev_id !=3D MAX96717_DEVICE_ID && dev_id !=3D MAX96717F_DEVICE_ID)
> +		return dev_err_probe(dev, -EOPNOTSUPP,
> +				     "Unsupported device id got %x\n", (u8)dev_id);
> +
> +	ret =3D cci_read(priv->regmap, MAX96717_DEV_REV, &val, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Fail to read device revision");
> +
> +	dev_dbg(dev, "Found %x (rev %lx)\n", (u8)dev_id,
> +		(u8)val & MAX96717_DEV_REV_MASK);
> +
> +	ret =3D cci_read(priv->regmap, MAX96717_MIPI_RX_EXT11, &val, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Fail to read mipi rx extension");
> +
> +	if (!(val & MAX96717_TUN_MODE))
> +		return dev_err_probe(dev, -EOPNOTSUPP,
> +				     "Only supporting tunnel mode");
> +
> +	return max96717_init_csi_lanes(priv);
> +}
> +
> +static int max96717_parse_dt(struct max96717_priv *priv) {
> +	struct device *dev =3D &priv->client->dev;
> +	struct v4l2_fwnode_endpoint vep =3D {
> +		.bus_type =3D V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *ep_fwnode;
> +	unsigned char num_data_lanes;
> +	int ret;
> +
> +	ep_fwnode =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> +						    MAX96717_PAD_SINK, 0, 0);
> +	if (!ep_fwnode)
> +		return dev_err_probe(dev, -ENOENT, "no endpoint found\n");
> +
> +	ret =3D v4l2_fwnode_endpoint_parse(ep_fwnode, &vep);
> +
> +	fwnode_handle_put(ep_fwnode);
> +
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to parse sink endpoint");
> +
> +	num_data_lanes =3D vep.bus.mipi_csi2.num_data_lanes;
> +	if (num_data_lanes < 1 || num_data_lanes > 4)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid data lanes must be 1 to 4\n");
> +
> +	memcpy(&priv->mipi_csi2, &vep.bus.mipi_csi2, sizeof(priv->mipi_csi2));
> +
> +	return 0;
> +}
> +
> +static int max96717_probe(struct i2c_client *client) {
> +	struct device *dev =3D &client->dev;
> +	struct max96717_priv *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client =3D client;
> +	priv->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(priv->regmap)) {
> +		ret =3D PTR_ERR(priv->regmap);
> +		return dev_err_probe(dev, ret, "Failed to init regmap\n");
> +	}
> +
> +	ret =3D max96717_parse_dt(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to parse the dt\n");
> +
> +	ret =3D max96717_hw_init(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to initialize the hardware\n");
> +
> +	ret =3D max96717_gpiochip_probe(priv);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to init gpiochip\n");
> +
> +	ret =3D max96717_register_clkout(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register clkout\n");
> +
> +	ret =3D max96717_subdev_init(priv);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to initialize v4l2 subdev\n");
> +
> +	ret =3D max96717_i2c_mux_init(priv);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to add remote i2c adapter\n");
> +		max96717_subdev_uninit(priv);
> +	}
> +
> +	return ret;
> +}
> +
> +static void max96717_remove(struct i2c_client *client) {
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct max96717_priv *priv =3D sd_to_max96717(sd);
> +
> +	max96717_subdev_uninit(priv);
> +	i2c_mux_del_adapters(priv->mux);
> +}
> +
> +static const struct of_device_id max96717_of_ids[] =3D {
> +	{ .compatible =3D "maxim,max96717f" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max96717_of_ids);
> +
> +static struct i2c_driver max96717_i2c_driver =3D {
> +	.driver	=3D {
> +		.name		=3D "max96717",
> +		.of_match_table	=3D max96717_of_ids,
> +	},
> +	.probe		=3D max96717_probe,
> +	.remove		=3D max96717_remove,
> +};
> +
> +module_i2c_driver(max96717_i2c_driver);
> +
> +MODULE_DESCRIPTION("Maxim GMSL2 MAX96717 Serializer Driver");
> +MODULE_AUTHOR("Julien Massot <julien.massot@collabora.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.44.0
>=20

Best regards,
Bogdan

