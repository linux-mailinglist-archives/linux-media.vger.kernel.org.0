Return-Path: <linux-media+bounces-64547-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NVJyIQJoKmpiowMAu9opvQ
	(envelope-from <linux-media+bounces-64547-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:47:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D421366F854
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:47:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siliconsignals.io header.s=selector1 header.b=KX9k8VY+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64547-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64547-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=siliconsignals.io;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76FAE3239B35
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111E43B47F0;
	Thu, 11 Jun 2026 07:40:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020135.outbound.protection.outlook.com [52.101.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE77366049;
	Thu, 11 Jun 2026 07:40:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163603; cv=fail; b=YttKNITZCS6sfmRqAjXh6l2xI2ebF4KB9FFli+liwFxFSbmz0deyo2OkLpUuw7cOXqgEIC+ZtDPBUEiwBc7BC7wDFSGVC5EaBmdYDW0WqkW96Zq9nsac387v8xLMIV5cExNr9RM2EMbjizqkNcDgQZLEH7URzRZ4dNnvIc7FZkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163603; c=relaxed/simple;
	bh=t5vDkHlbR2BgNAL4IiHtlU0FuuLz1RD3d+wcieN3Ahs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KUBJ6ziHEtcp/PucJC2SMye3wo88cSDng3TBu9RVPgDW8KJSz3zs7a6YbLPvMZfV//sgp80vWhSao82kdZNKIdDVjfBM15hWrniEDqSmn22vAC1GoS/V/MS7m0jdaTqMsK/WzgahSyKs04eX/3SrAhZPh20rBnoCN6xcFJJLoQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=KX9k8VY+; arc=fail smtp.client-ip=52.101.227.135
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYZbafxHYXnVGNr7R5K3yZ+/00E/qawnJTM7k/E8C77agAaUIR/ic+b83jNOwq8JZvqRaTlVRqPC9JLnNDPgE/M08Hod4PlXPmPBkSZHrVbM6qsiCJau+2FVA11Sq5WHBieLtMGNO5BiS/eyazv60CtbQq7zJ/AngYcxDGI7aVms2r8OA5p7E3TZZQYkVGD9I8wI70C5fQd9K1H1jEhVcBFujMO0LbncRklOi301poEmkZA0MXzMWSVpyjfxi2PT+BazaRGI4W2zMbH5LzvbTHMjlnsq2oYOgl0Q/gMYHeaBiQa0fW0W0jzSclVkCtlqKFd8BXzD1yIB/jGMWGquNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgW4ZU4ZPQx31/XoN6soIIrVfcqXBdw34MCbGGlHtvI=;
 b=Hmaw2xstcwRV6VcOIgqkAXkIn7hdrtIPaTnMb7nUEaj/uC0AewkEOR0pj3Tdx0y1w/bo9XHKp0tc2040gg9EMgs2E1LHJdMtyk9rQPrDYWfWC8BTz/Cs5NBdX4185l5skIf4EGsjUgCfOAGNOBAngjmrQ00GsTENTh2JAl90OgOlT+HeES8qsBO/6dMXN0Rh0oXRl90c0vd/LTXzb8FrDLvrrjVXut4BwEHh/Rmzistm9MvzBLA8EKJ8JAico6dG34yLyo3YdxoYyjJ34LTdFGLLiyiD8ww5tkp2bug48HQPT2iTuHqg2on3Giba1wK9miDAviqHpVY4NltP7Vp6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgW4ZU4ZPQx31/XoN6soIIrVfcqXBdw34MCbGGlHtvI=;
 b=KX9k8VY+/nts0Wwe8yhcSaENvXcr0fFZCkOVKgOSqOGrEMIYvjJQbmZVkyxkPNQTihQSvVLcp0zWIydq+9095428+xZl8h0GGEBCyBqELtiLbvPeZpLwomEsB4aBYgGpNVXGPGRKSZPDOttVjcLtmwUgs6PTEjG/yCX1XG+f/ED3/u5ZalnCIWv0CLxYu+C1/7UrePDsBv/JqeTwL37cVPPGEyQndKDxMJB+f8rGkVO5SKojltT49fMf6sGXS1HCBjXhE1q1vVHoz6YKYRgqqbBvycjujuv7KNZh09DYyoX9RVuYw7TeINEf/rHNKqHIqCwbySaN31UZT31GlYEOKQ==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN3P287MB0750.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:101::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 07:39:56 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 07:39:56 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
CC: Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Svyatoslav Ryhel <clamor95@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] media: i2c: Add os02g10 camera sensor driver
Thread-Topic: [PATCH v3 0/3] media: i2c: Add os02g10 camera sensor driver
Thread-Index: AQHc08xq1/E6s4vLjkeE1HL5R9n8CLY5QhIB
Date: Thu, 11 Jun 2026 07:39:56 +0000
Message-ID:
 <MA0P287MB21784CCDF0AB60F09B336851881B2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
In-Reply-To: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN3P287MB0750:EE_
x-ms-office365-filtering-correlation-id: 472de092-2464-431e-2b26-08dec78ca205
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|38070700021|6133799003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info:
 SiEGC0vLHsB/bLfpNsttSz4W4V38B3FmO4s+DIgm8wWHN0eF3A3xGk8NR+L8r6T7x7cdqHXgPXhQjCVg+HIu60O3iiJzYtcGvw2pKpLvDyiDzj2mjFwpJGcjbzessUik2BUFhlTAyzPof1QtnjfjW88AEsM7Wt09QhCnQ60A8cVgWoHmkK5uH5jXBRu2v9ZmQl7r70pZeak48nY8y0iWFG2kyeMKvap/Y948wwJ2y6MkQoRliP3PiV2BTg4IQiD01tUzqpvF5LeSKg8+lUT2P378xVu1wf9v5y9brfEdKvEuCJTegdYAqTgqsMMxxgdKSVeajG+dS6w4j9hh0zepqE322cE1bpQ5GoFK8UhyHNiMGVioNpuCL6M8nMjB8WeXD947Y7iqDJ6PEUSUXe9cfJVgJd+eaOjCojyNhSFFoeW9XYFoskoFJotrNC2FEd9liahipS8i7rH//ui96PL2kgRQ3Uc4+5LiOPYWi+6lp38ELXENtA0fspv8oBaA7Kb8kr8VF6eBJyo/wvVWh1Xti6tQjng0cUf/KYAtjVQIVVGGzw3U2EwxRRi4v0Dybkjxw5rahWSRXIIj6tc1ZbPCSh1WaVJbiCOabGdCwRllgFW+lD1sp34hxQ4ulUuRzGhYp+qijqxNh9/yiKx9ykllsNCmjTqFVkuI3DwCAj4HQrAPzApP7tcP+vrCDwHdC8clgxVuJ1gAQdKnA7mq2nUH0LfAvhREsCJx7h6RLzsz+gSRu9HUwcieLQytaqOsrFku
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(38070700021)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QiQ5Uaod/l4nExbSE78PitQHIUNZ97ATvDcEPPiCm3CgImAedgRUoxz8wP?=
 =?iso-8859-1?Q?1RaJDPtH+pkiz65zT69C7KK1LVenzFwITfVK/qUi4FoNbtPBEHl3REe5Rr?=
 =?iso-8859-1?Q?J0IiYCHu5s56eszs9tk6DkVXMdYaxMv6M2LNYC0u7Ung9xW2ofy4UoCWN8?=
 =?iso-8859-1?Q?db9gyP90K+/rvTh8Cpe94xMXHr0mzVlJJiY+pzKjiXv3oNaPKHdoA3+nRG?=
 =?iso-8859-1?Q?lGPGyD8/xvYiEC37UKEz/kOT+PNvAFrIKdsTTjsHooPje1d8fMr1wa4BP9?=
 =?iso-8859-1?Q?x9yeOtf23EEV3o3UpGgiIZSfOAR4jWG5i/W0wfTe2Zj/6fhkuqJMSCU2sh?=
 =?iso-8859-1?Q?piv27k1mx7Nh5Uc0XOAlZJ1BbxZohZ6Blwwu6r3PTEuFivdiBzujwGXif+?=
 =?iso-8859-1?Q?XLf3BselFU7PT85jin265lUXc8N+QeZzkuosiE3d6z2mrl9K44TX0dEQ9n?=
 =?iso-8859-1?Q?uoEt7FO6N+qzw3fbx7ND0FQn+rO0xzCjF7TIYvH+RH3x9H0Q2/7EKRjfwY?=
 =?iso-8859-1?Q?aTbsQk+3Ux+1u7xls/+jdcPCWTpp/eH5kaTtfXY1EkeKwgPSsv+EInLwb+?=
 =?iso-8859-1?Q?1V6DOpv3+wbQGGD/tBonYL9ypzVh3SZdC0hJdqwh5BAM1+kw8Of0FxGcMU?=
 =?iso-8859-1?Q?eWTR0pIKv7itk/6mbVqXs+86wFaJnjWvIhtpKZ7SsfKqB/HuCOaHG3ParI?=
 =?iso-8859-1?Q?P5sharx9YnZD9GnJqlqLy4JWcGsmNLJoEwe6wTIvsLcT2u1AR7B19GWvWU?=
 =?iso-8859-1?Q?WZsIbN8wGnn2IfUrJBjz3RDTc1BrImYFN/5Hp9qv3FS7jItX+AGwVl+5cU?=
 =?iso-8859-1?Q?05EoECQBJm7caTMZzLsGAr//bjoZfmIc9DGRi/jueWrYXyaD+G/dj0zx+k?=
 =?iso-8859-1?Q?r+GQYSUxIvFglg/FGikN/VehfYcmRcpISdInj4gBxDTmotYek6lYAj+/Px?=
 =?iso-8859-1?Q?FeMARDegT1s2voCoAQUHoBzy+7Te/kgqnz3r357/U9leWrSywfb3vK8frG?=
 =?iso-8859-1?Q?6k4dU1IFsKC5N8Hm+aE/wIxngVzOdZRc43dASybyhmUistaWKD/7kfmWLB?=
 =?iso-8859-1?Q?XzrgeF+DHbrWHM6jwcDQh9ty5tY1JPhLwA+P27bN2s7FOnhs4WzorivPxk?=
 =?iso-8859-1?Q?5refVbCSweCF+g2IC5J4qldAoLxKWrugn9lGB6TmsiUcEqLa3p09wcRzEg?=
 =?iso-8859-1?Q?DOXtGsk+C+o73HAvdN3iFuIySjx7c7v4OD+xobxlbdFN8BzGr54AR4TBXh?=
 =?iso-8859-1?Q?A9eWm4zuo0kmJSwmRfQYaZhEeUioNlgOP+if6Z+srMCG80uQnf+349i3pS?=
 =?iso-8859-1?Q?HtaUAPpGQolZMByVIxpgP1QEcPIIiVmhPLUkIvJaFlGDfiCcyx38ZQmrS6?=
 =?iso-8859-1?Q?8pV/7XaeoC8pBU2kzfYHoFwe40PkfWJ0iy5qyjOcnXcRzbLtAPpA9Qy2pC?=
 =?iso-8859-1?Q?jzJbE7vqc/Aa/P+YbeY5nJiQF33Mo1GPmAboOnLr+2LU/OzU3hyYMtyG8L?=
 =?iso-8859-1?Q?FYcRpYpfMD7wm4gqthFYV8OZFAPr7bCVoFPKApR/ZHtAkWuyjZpJ6fkvqz?=
 =?iso-8859-1?Q?Xf7wnvX5t0rLFfHDTJSjGmtU2KKxtRXrwjEfTMWD+6NvBdmnY2fqzSnGKy?=
 =?iso-8859-1?Q?+tkZvrwf0BFgi9F7XvePpmThheRhnDlUxXw18FYwSISv2FtlDvjftAQFal?=
 =?iso-8859-1?Q?BZjFD5kUj1EDSbGW2JH9ksSklBXSG5WSvLfKCN2SqN7Lx4aVAt9z6txdEP?=
 =?iso-8859-1?Q?4LVqPVtx5c+LY0FZZ4G0QRMiGJW9QAWucfsmBsM6IKCglCei3MdE4SqQBI?=
 =?iso-8859-1?Q?UzmYJ3XdfM77cF0U2mtCaSSRdKFYFzc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 472de092-2464-431e-2b26-08dec78ca205
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 07:39:56.0645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iAbgPH/pUiU7YTdXlIWb8i5BFUqwx8Mgm4fSvZx5GW085Xh941VNI59/BS8XfGidcWiUpsP5PNX2z9yXRf76NXyhvA8kC6SgeiS0Pniv5F1MRsSX/lXm9SfHg3FJ4GpA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0750
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:bryan.odonoghue@linaro.org,m:heimir.sverrisson@gmail.com,m:hardevsinh.palaniya@siliconsignals.io,m:himanshu.bhavani@siliconsignals.io,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64547-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D421366F854

Hi Laurent, Sakari                                                         =
     =0A=
                                                                           =
     =0A=
> The following features are supported:                                    =
     =0A=
> - Manual exposure an gain control support.                               =
     =0A=
> - vblank/hblank control support.                                         =
     =0A=
> - vflip/hflip control support                                            =
     =0A=
> - Test pattern control support.                                          =
     =0A=
> - Dynamic mode configuration (e.g. up to 1920 x 1080 @ 30 fps, SBGGR10)  =
     =0A=
>                                                                          =
     =0A=
> The driver is tested on mainline branch v7.0-rc2 on IMX8MP Debix Model a.=
     =0A=
                                                                           =
     =0A=
Could you please review the driver now ??                                  =
     =0A=
                                                                           =
     =0A=
Best Regards,                                                              =
     =0A=
Elgin                                                                      =
     =0A=

