Return-Path: <linux-media+bounces-25987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC8FA305BE
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 09:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F50D164792
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 08:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CB81EF097;
	Tue, 11 Feb 2025 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="OL3Kb8ZG"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021117.outbound.protection.outlook.com [40.107.42.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1FC1EE039;
	Tue, 11 Feb 2025 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262535; cv=fail; b=rTVbXg0rGoTOtM+VFhiN35qdCiV89qAoGSXgWKMyMPklmXKq6M+PnPbozjBxuj2kA0Qm1quOfy0hQgAnx59SeojaD2ZPmYLUQDTDOyWSWIpYA89tsPxoKIgtLy9RZp3ZySytZo2QajJPS0f/VkTT4N12OenK35cZ/amJ8ZILNRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262535; c=relaxed/simple;
	bh=1VOBRUsF3BYMRDm8SGHXN4cnvo/yNcidWI1ys/pLJD4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jc9UbB1bple4Or5jTERqyigyO8yzPehubVjiz2KqIlKItLUNXXetsoeJbTLxhACjyqnJXnEodzxsnG4P1tagO8yg2kWFqBaEpjL2inul/ecsQ1AfJvHG7MfoPC/x1UzrVdLotT/8M48izsD/I7/qBff0jtR8zL2hkkti0Slg7vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=OL3Kb8ZG; arc=fail smtp.client-ip=40.107.42.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgcPzCJpEW7J/CMNHjFbqr7BuhN+Nk57hVHIWbIFnmzB4x4ePDUUsp9wsafYKCoAa5+0ZqMozRussYQMpSN0+sc1p99NqqtvY/T5f0SHNPzs6dVM4u1GCTL9kZzdkjPROsn3rzFdTPUCbqESaZGGStkdai8kgAa83Xtq8glefP+unXNFo49VoFjZw4gMNoPwj71/YYEMYUPRs8S89RJzww3BtGJBQOzUEl4YFVjmOwAtt9MF7XX2s5PHp5dD8avt6sWJkTlT63kftPnuh0AEyvvInn/kHi0YK97Abh/qCXu3atQyoc0DsQPbxSR0X3lpvZohmINFQ3MTvochIAaL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJxI6EuD0aaPhENQ9zY8fkmGelho6cFx3RapluMcLUg=;
 b=TMlJ4ijVs/47N7S5+wTXNelMdJifI+VjiNRZCk1GgsFfDim30jg/0wJWHIyQqzkJ92pxgZ8cnoSrW0nlIxyqXEANi1jNnpBVAdJP57bY1URRi12wCzNPvWvHH8q2pRpcrQygMzbwdYfmrqhb8ICfsN0U+33XCnJpYRcs5ew1UpUN6f9IvTJLK+Q7IsmyiLt5sE7Fddczk53+BH2tFklhzR6xjMvQROnLjqBeh/lK5TnvzvShLhpm+uLtgK2FjcKG9sjO7miAD09gaaMTviyCZPkuCzHgQCCIGX6mqusqUkazVc6nGsCu5otvie96C5/CtTHXFaUKziKCe+5MaAxURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJxI6EuD0aaPhENQ9zY8fkmGelho6cFx3RapluMcLUg=;
 b=OL3Kb8ZGgaqvSbKriCMvfaacAPODsJJxczpq9q4g9oBm0h+xVmPl08a6B5TJqQTbvKbmHpelcRzM4t+5rowpk/tSNL+u90Fx0JWLgHeOjrjXILqxL0uP4ILy8oqkjeMcnCR0wdEK4ILvmA6JV+qG2Pp7QTtex0I0sGmMrujnCqo=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE1P216MB2041.KORP216.PROD.OUTLOOK.COM (2603:1096:101:161::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Tue, 11 Feb 2025 08:28:50 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 08:28:49 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH 4/8] media: chips-media: wave6: Add Wave6 codec driver
Thread-Topic: [PATCH 4/8] media: chips-media: wave6: Add Wave6 codec driver
Thread-Index: AQHbe5s6TIh4rto0wEORrmYeUFOifbNAzpsAgAD2lwA=
Date: Tue, 11 Feb 2025 08:28:49 +0000
Message-ID:
 <SL2P216MB1246CB5966183FE8E17541D5FBFD2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-5-nas.chung@chipsnmedia.com>
 <7373c956-216a-43a6-939c-4a9be5564c57@kernel.org>
In-Reply-To: <7373c956-216a-43a6-939c-4a9be5564c57@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE1P216MB2041:EE_
x-ms-office365-filtering-correlation-id: 0d8596ee-4953-4899-ac7c-08dd4a761c4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?t5LnNTHLGUnqCnzk7jVs3WKzIZ0zpYvUHkOkjXYUjLu98umggZXeCf3+A8H4?=
 =?us-ascii?Q?kWJ5vo2aWq1K4rA+2YaH2aUqgnOzYDmwodDyXJNnip1e29RLCuFv7ieLqwrC?=
 =?us-ascii?Q?KfyCGg9oczgQhVmam8xIymyPq2E4jKkvCuDl01amyUd/mW12ExRvYzChp0JU?=
 =?us-ascii?Q?Klq9BucvH0kVtln92s/g0DGxK5QwM/gPk2bA6NDXEbxiKfU7Vhnl7dgzCb+O?=
 =?us-ascii?Q?M8x3sQgdETAzghrTqZDKZNJT/AIfGZP6xQXqBq8V5KsvtOapoZZz+wgc365H?=
 =?us-ascii?Q?kWDXlicPUh/uPf8dcCjKNrhGDCZaawbx9zRyOGTB1utA9PfXgZCLyMTwbkBk?=
 =?us-ascii?Q?f7YujMaISoBFlQTyq3BV8Ll+oqswreLxnDG3tJWS2YXYi2uRdUINZoFKWX+v?=
 =?us-ascii?Q?exXl9CJ+UoVn1jdefeybJcZy/qobpbc1ZCPapNeMgRgzk0Xhbc5k0YAAUQQI?=
 =?us-ascii?Q?b44ugxGGFAq+ZmfTiuT7vbOfYp+ZIPjGkG9H7nR8s6PnHXLinTPLTNcYkmhV?=
 =?us-ascii?Q?P6pb1f7wv09z1SljU5xdprjfwpo3FnyZ5vmG2Z7ss+XXbT3qXW/rXymbHHNK?=
 =?us-ascii?Q?n0oxey83cUhlNhjCpvn5u3/QmJr60IJfbKGcbZ7jTiiRTmdLtQNOI9jfnFyV?=
 =?us-ascii?Q?DUdX03vmgYbDrzpIP7upL8tOH8yMSGL/DcxQ7ztIFDMGnuqJQ2kCGCWdADPL?=
 =?us-ascii?Q?I3T4EHwriUUNe1/qhxNin0sH3OjGA5KxBkEaQtdUiOMOgPkYJRUehkNm53Hi?=
 =?us-ascii?Q?tk+FB05wh/N5hJlBjGSQ7UWljpQZzOfi2jNUSMAHlbt87utFcUJFprA9ZN7E?=
 =?us-ascii?Q?ZSCQ8rVzeOCfqU/su0ZokddUir17R08v1acDWSGlxOJUO5fLa4AUA2Yt6AHG?=
 =?us-ascii?Q?JfwObdHzrm6mlLM34mwoG+1bkK/QNw6OL1Xw+jYuPZ3Entlt5+SPVlisohYw?=
 =?us-ascii?Q?LuejPUnV483C0nRe9NV4kupVYTZUIywEUFLTeZnFdA9ziQIdDmCjK9NQhRb2?=
 =?us-ascii?Q?7FJ1HGLNzgCU/inafcUYaUeNxs/1s6tXXLOg8/SIOby/o+CE7TMtigBi0WGF?=
 =?us-ascii?Q?pguiGk0Yzv99rkm+kPxE+T2HUdrXtEv5R+G/B86raKYxLF4F2v1s0F5TGLMU?=
 =?us-ascii?Q?wSv348U2DqREJbh4+5rVdCLXf8fp0W6nFGmBcOiZJpvsEzm/KSpSOTRJb+bf?=
 =?us-ascii?Q?M+kVQ6P+5PUQfDmCyr7zqZGA/K16dEpxjL+wTB4o/KlVKcfmY9fDpYm1jat4?=
 =?us-ascii?Q?mBMR3qGGDWThwU9zxET7eQiN7Dybmcam076P7uR8WQYIO0M/5lFe04kOzCAM?=
 =?us-ascii?Q?TfVI+diWiYpTQXUdWfUElxSImCxwpziZ8ttc7FsjCQvZ/3GUyyq8OyEzTR1M?=
 =?us-ascii?Q?3KW8Lp+hzrCKFtYY1VTjIbOmKE9ixf260Eb0DMSPsnrz9i/cdz2hPolv4iPX?=
 =?us-ascii?Q?JHDhU8kCcMlPj6DEOi0000+YGcIq/Yto?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/9ugfNy45wyXIHuMGO+cOZTtTpWNTmlWX5ZBHdb/Bch0qcC/ezfGsitv7KaD?=
 =?us-ascii?Q?saEvg67vx2I8CR6ubiyqgL81VJSZrmMTGjUGOvwWPCJVorr2CWuj1G78hIo6?=
 =?us-ascii?Q?13V6uACsUiJTW5ghehlkAjbb/AqPgv56LHRFTNbwa5Jrvwil+8JwblSKiTJH?=
 =?us-ascii?Q?2P0C5aAF+oP15KvSF0nYmug3gI750iMt4AcQyc33ahuWkiKSNvVgvP/Z1K84?=
 =?us-ascii?Q?1uKWqIqsbvpRPXnsFTxcEOP55Niex/VHnhiu9F5Nes70vLv30tHJ5qVsPSGU?=
 =?us-ascii?Q?DAzrIpDlh3eNgNgFjN4bpsKOGduHDictLOA/JOP3T7qSNn84g01mO4wzPo/O?=
 =?us-ascii?Q?glkaR+ahuAAVWU17MktHz4MgAT6Qn/ZHGAzWCk555gtt8yWl499cco0Xnt9I?=
 =?us-ascii?Q?OCuUSvyOaDDTFVFUNJ2YPcdY4TKgXgpIjmmZpm9t965R8moYThRwW/eEa3Ol?=
 =?us-ascii?Q?fvICnMQW/zX/8U8kDUT1qUtoB+y31A3UEHnL26jtbNrxfLkUbKozoQWktqdU?=
 =?us-ascii?Q?twfWOGVFh6Xw9HCRR9kuEjry1Gx4uXXtX/kqTuXvmlp+B4RvZ7r1m1lzoJvm?=
 =?us-ascii?Q?OmZaxPfJv+QGhZl1wVGlHKh2+XwIylHFHO/lcJqwRcBb2XnuV0QydC96FUUZ?=
 =?us-ascii?Q?jWoT+Zxq1Eh8W5R/9zR2gDk5r8F1Ku9mhElHrZgf+RQM5qrww8dwp4FoI25M?=
 =?us-ascii?Q?p+CHfAzWWSBiI3yHqibPLwOiTp+a4gPPtd8xvzAXOG0exeQzwr4KHold7Cqc?=
 =?us-ascii?Q?9O4/iKl4zYfSFf9UVL7AHjvvgpISsYfgPAOV60dGexvYuQgtrrEEdCi/01MH?=
 =?us-ascii?Q?KyBcCFVhSOo3e6+qi6jPyvs/c3r48oF4OJAqriE8leRTH7NSDaaHshMLauzE?=
 =?us-ascii?Q?kRMAu5RPyNgvaSODbLgSlV5Fz9CM+KQeB9bw0Tvr6UJIunow0AduHyEtaqOL?=
 =?us-ascii?Q?/5+/ro+7yDgctocyRaw5nuPrTwMPdZihyO6lNXTY1lvxPx9a+G/RI8IAjvTq?=
 =?us-ascii?Q?e4W2CK1P+Rg1tA0UroXhR/EmV08ftaTx8VCBgS5JjBKM1E8PWxUK1LIsWGJ9?=
 =?us-ascii?Q?3WbFvqFwKyrBEraLspsZD3xyvi0m/NJ5b0z1x6HyJbczsoO3refAuR2eUHTT?=
 =?us-ascii?Q?eauY/jGLUQncEnHGJbUgxJJRWv0ge62WOAsz8QrDA/ft7WZbMjgB7s19LU7E?=
 =?us-ascii?Q?sKZq3sZScZ8IGiBlaArsLDcwQp3zJPMRWdjzgF4viY0u6e8DR4MkeWtVbVSy?=
 =?us-ascii?Q?+MFL7WCq/edSjc4hkqRbpcRpt7aXNy5VsOccPDsNHV9DnsFBgfEC3mvJFNn2?=
 =?us-ascii?Q?eZLYPhmFzlA+75g4rCWAPMhEKjJz1ngOrK+EkSG0t8dRV+TVqwOAJvykgq4v?=
 =?us-ascii?Q?9HneF49EhlWaw1unDaGazVDnT78GhrdsIYWCF37Dt6Sp1+XCnRm028PaQ+Ni?=
 =?us-ascii?Q?hjl1VicyhJQGHZ7HX0khGGRszVVbksbDEa434h4M6n2PLf5XPqou9Kpf87ow?=
 =?us-ascii?Q?W1ycOPnjvlqMoOsd8h0lq+u6zxmpXSSdTV9zNm1be0AbofkLOktkNL3cuEBq?=
 =?us-ascii?Q?gH0eGICLBsn+WTiq0duy1YLyOCknEY0LLX6GvFrE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8596ee-4953-4899-ac7c-08dd4a761c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 08:28:49.7728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GopREXElwoRbuPdWM3xTO84xXj/eIOJUvYf0s4Gsg3UdjOSGviMpjJdEDHeXx/cZvx7yFuO2OK8BPLb1pXay1H4mVdaJiy/ZGyaVtYaASg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2041

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Tuesday, February 11, 2025 2:41 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; sebastian.fricke@collabora.com; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH 4/8] media: chips-media: wave6: Add Wave6 codec driver
>
>On 10/02/2025 10:07, Nas Chung wrote:
>> +
>> +	dev->debugfs =3D debugfs_lookup(WAVE6_VPU_DEBUGFS_DIR, NULL);
>> +	if (IS_ERR_OR_NULL(dev->debugfs))
>> +		dev->debugfs =3D debugfs_create_dir(WAVE6_VPU_DEBUGFS_DIR,
>NULL);
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	if (dev->res->codec_types & WAVE6_IS_DEC) {
>> +		ret =3D wave6_vpu_dec_register_device(dev);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "wave6_vpu_dec_register_device
>fail: %d\n", ret);
>> +			goto err_temp_vbuf_free;
>> +		}
>> +	}
>> +	if (dev->res->codec_types & WAVE6_IS_ENC) {
>> +		ret =3D wave6_vpu_enc_register_device(dev);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "wave6_vpu_enc_register_device
>fail: %d\n", ret);
>> +			goto err_dec_unreg;
>> +		}
>> +	}
>> +
>> +	if (dev->ctrl && wave6_vpu_ctrl_support_follower(dev->ctrl)) {
>> +		wave6_vpu_activate(dev);
>> +		ret =3D pm_runtime_resume_and_get(dev->dev);
>> +		if (ret)
>> +			goto err_enc_unreg;
>> +	}
>> +
>> +	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s %s\n",
>> +		dev->res->codec_types & WAVE6_IS_ENC ? "'ENCODE'" : "",
>> +		dev->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
>> +
>> +	return 0;
>> +
>> +err_enc_unreg:
>> +	if (dev->res->codec_types & WAVE6_IS_ENC)
>> +		wave6_vpu_enc_unregister_device(dev);
>> +err_dec_unreg:
>> +	if (dev->res->codec_types & WAVE6_IS_DEC)
>> +		wave6_vpu_dec_unregister_device(dev);
>> +err_temp_vbuf_free:
>> +	wave6_free_dma(&dev->temp_vbuf);
>> +err_kfifo_free:
>> +	kfifo_free(&dev->irq_status);
>> +err_m2m_dev_release:
>> +	wave6_vpu_release_m2m_dev(dev);
>> +err_v4l2_unregister:
>> +	v4l2_device_unregister(&dev->v4l2_dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static void wave6_vpu_remove(struct platform_device *pdev)
>> +{
>> +	struct vpu_device *dev =3D dev_get_drvdata(&pdev->dev);
>> +
>> +	if (dev->ctrl && wave6_vpu_ctrl_support_follower(dev->ctrl)) {
>> +		if (!pm_runtime_suspended(&pdev->dev))
>> +			pm_runtime_put_sync(&pdev->dev);
>> +	}
>> +	pm_runtime_disable(&pdev->dev);
>> +
>> +	wave6_vpu_enc_unregister_device(dev);
>> +	wave6_vpu_dec_unregister_device(dev);
>> +	wave6_free_dma(&dev->temp_vbuf);
>> +	kfifo_free(&dev->irq_status);
>> +	wave6_vpu_release_m2m_dev(dev);
>> +	v4l2_device_unregister(&dev->v4l2_dev);
>> +}
>> +
>> +#ifdef CONFIG_PM
>> +static int wave6_vpu_runtime_suspend(struct device *dev)
>> +{
>> +	struct vpu_device *vpu_dev =3D dev_get_drvdata(dev);
>> +
>> +	if (!vpu_dev)
>> +		return -ENODEV;
>> +
>> +	dprintk(dev, "runtime suspend\n");
>
>Drop
>
>> +	if (vpu_dev->ctrl && vpu_dev->active)
>> +		wave6_vpu_ctrl_put_sync(vpu_dev->ctrl, &vpu_dev->entity);
>> +	if (vpu_dev->num_clks)
>> +		clk_bulk_disable_unprepare(vpu_dev->num_clks, vpu_dev->clks);
>> +
>> +	return 0;
>> +}
>> +
>> +static int wave6_vpu_runtime_resume(struct device *dev)
>> +{
>> +	struct vpu_device *vpu_dev =3D dev_get_drvdata(dev);
>> +	int ret =3D 0;
>> +
>> +	if (!vpu_dev)
>> +		return -ENODEV;
>> +
>> +	dprintk(dev, "runtime resume\n");
>
>Drop
>
>> +	if (vpu_dev->num_clks) {
>> +		ret =3D clk_bulk_prepare_enable(vpu_dev->num_clks, vpu_dev-
>>clks);
>> +		if (ret) {
>> +			dev_err(dev, "failed to enable clocks: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (vpu_dev->ctrl && vpu_dev->active) {
>> +		ret =3D wave6_vpu_ctrl_resume_and_get(vpu_dev->ctrl, &vpu_dev-
>>entity);
>> +		if (ret && vpu_dev->num_clks)
>> +			clk_bulk_disable_unprepare(vpu_dev->num_clks, vpu_dev-
>>clks);
>> +	} else {
>> +		wave6_vpu_check_state(vpu_dev);
>> +	}
>> +
>> +	return ret;
>> +}
>> +#endif
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static int wave6_vpu_suspend(struct device *dev)
>> +{
>> +	int ret;
>> +
>> +	dprintk(dev, "suspend\n");
>
>Drop. Don't re-implement existing tracing.
>
>> +	wave6_vpu_pause(dev, 0);
>> +
>> +	ret =3D pm_runtime_force_suspend(dev);
>> +	if (ret)
>> +		wave6_vpu_pause(dev, 1);
>> +
>> +	return ret;
>> +}
>> +
>> +static int wave6_vpu_resume(struct device *dev)
>> +{
>> +	int ret;
>> +
>> +	dprintk(dev, "resume\n");
>
>Drop, useless.

Okay. I will remove the redundant debug message and dprintk in v2.

>
>> +	ret =3D pm_runtime_force_resume(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	wave6_vpu_pause(dev, 1);
>> +	return 0;
>> +}
>> +#endif
>> +static const struct dev_pm_ops wave6_vpu_pm_ops =3D {
>> +	SET_RUNTIME_PM_OPS(wave6_vpu_runtime_suspend,
>wave6_vpu_runtime_resume, NULL)
>> +	SET_SYSTEM_SLEEP_PM_OPS(wave6_vpu_suspend, wave6_vpu_resume)
>> +};
>> +
>> +static const struct of_device_id wave6_dt_ids[] =3D {
>> +	{ .compatible =3D "nxp,imx95-wave633c", .data =3D &wave633c_data },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, wave6_dt_ids);
>> +
>> +static struct platform_driver wave6_vpu_driver =3D {
>> +	.driver =3D {
>> +		.name =3D VPU_PLATFORM_DEVICE_NAME,
>> +		.of_match_table =3D of_match_ptr(wave6_dt_ids),
>
>
>Drop of_match_ptr, you have here warnings.

I will address this in v2.

Thanks.
Nas.

>
>
>Best regards,
>Krzysztof

