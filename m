Return-Path: <linux-media+bounces-66708-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MNe0L3JiS2oXQgEAu9opvQ
	(envelope-from <linux-media+bounces-66708-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 10:08:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5277D70DEAF
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 10:08:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=fumn+OcA;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66708-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66708-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D71813246F10
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 07:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBF839E17C;
	Mon,  6 Jul 2026 07:16:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021093.outbound.protection.outlook.com [40.107.51.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D853E51D2;
	Mon,  6 Jul 2026 07:16:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322182; cv=fail; b=VgEc1uy8G639dv7TIrt9uLnHOeqnyt3WdMqDpXy/8ZLmTy1iXwdVszMyVc1HzgddtUnk4VbyJsbukh4DROZ3KSbDTblDP+4bTzDq+1xOX6mV04qeQ4e2Js3Hlp4vnPUyUSuE+XM5OmDri2rFyUDSqVKW3NOCOVhWNxYHscfcOv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322182; c=relaxed/simple;
	bh=0ZpG9P8Zv2rFCCEBbH+p7Yy75XefsC9kIWtspLLhH1g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PHxiA+3QfZsS2VSZToKuS/jWEFgY7B+9A2m01E7N/M3vwkVY3s6SNd10wQaqn0nTpeJskNlSpAwBDws7bBec0BN5bJPb+uGQTqSbsp/vg4Chmuak2slCJDb/CZWlgHT50Z+p5nA/KTfm5GjDiNVt0LOGDSMSTEtuIEBNsp8NKqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=fumn+OcA reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.93
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUFcF/cG6s+V5Qc2/CFcuZxEsZq65XC07NTyvbDmEIUIYjRZCeWy+ZJgNtCiZ+w999+omHuzHUpEN6oT+dZ5FYj0cHDcwy1KBSo2+jilAK4rzOcIwl6cwDKu5Gn++STA7A2KYGv2EdGSY2ZjLSix0FRowA/vXp3yxoHT9EhMh403QPlpK5hnJOjRwQZDGhRDhqUBb+YmcPOWnRdGfSkd4kZShfu1+NlI6pmG0efSaxL1ge7Jsk80MW8sNgKhIPGlDUz4Dcgcy0L0f7XCMWK1OuxlQsIiXe7ViSXNbdjqsE5PrKi+acbKXWpRyRQysNDl8G8kZ6SPhzQtbglgiw49AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qssFn2+963XM5nT8JLK9LPIrwVDhiruXqoR05JanX04=;
 b=fj7A66bxhdkSQ5cNw+Vk8mswa1rnfeveOmwqRFZz9pnY01KMTUaG4WwnOdtUi26aIOBBDCHY0/Ojp8LKHxHl4HnGyDaqBRa0pE7FBaetKwAmNjMjBp7kPqh+H71BEalVT3Jtmyr1FPHFuuHTWevlSu5BdTC1Iat0rURy7iLcU5XneLxuHfZiOPX8dASZQCnY9y9fEIHLuIFWgpiqLOI7O+Yi9a1SFnZNpXcyYdA5oCuj+4Y4RcV7o06FnCMzoxXxbpF8FecGmKRC+FDCI+iRpdY3Py2nohUNT2UaPLY8/hGJjUdPqPjPBefvVqO/toG1+fe8W8sIRmFpnBPaLYZK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qssFn2+963XM5nT8JLK9LPIrwVDhiruXqoR05JanX04=;
 b=fumn+OcArxID8T8K6Xmu2IHI7s+TRh0FoW3PgocIvVpd7EIGQ6iAT8Nh3DibnO4OiOef9C/dyVX64GIy2D7Xmh+4zUz93Ht8kFd6igS0tM2/kQsiqgHlqfsuOE/xCdASnxLlUQturcJFuDkCo72DIsYdWr9UmV684OAau2hIXlS+zItr20e88cB026VCdUCGGJRaRILORqNkeBYrwuwdiPsEZmLcQQheeXCoPln7l9VZdAaHKLF52gJTvR9ycT5/JmwLdm8bNEML37MRp0PgTOS+mdZnWyZWq95KVl7hRks2nvW59zZNi7IHNKL+/5TQxMwL3aBVc9kvqMdMcD3hTQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAYP287MB3657.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 07:16:09 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 07:16:08 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Kate Hsuan <hpa@redhat.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Serin Yeh <serin.yeh@intel.com>, Damjan
 Georgievski <gdamjan@gmail.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, computman <anis@talbi.fr>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Scally
	<dan.scally@ideasonboard.com>, =?iso-8859-1?Q?Ilpo_J=E4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Thread-Topic: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Thread-Index:
 AQHdB5q8NQpQtUcMokeHZdb/BmiJ5bZWs7/NgABnEoCAARLcy4AAVS8AgAAC2ICAAAgvPoAB/Z2AgAM4iQCAAlXEPA==
Date: Mon, 6 Jul 2026 07:16:08 +0000
Message-ID:
 <PN3P287MB1829FE03558376196C9030328BF12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260629074026.35490-1-hpa@redhat.com>
 <20260629074026.35490-4-hpa@redhat.com>
 <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org>
 <PN3P287MB182945B5747452110940BEA08BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <c7634571-4682-41d5-aa9d-8b965d641d51@kernel.org>
 <akT2CSCbaR0a3BMA@kekkonen.localdomain>
 <PN3P287MB18296E80E1786B05F5ACF37E8BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <d59e796b-fe53-4103-a94b-5ffba53246b9@kernel.org>
 <aklcEKiFDfZwCFP-@kekkonen.localdomain>
In-Reply-To: <aklcEKiFDfZwCFP-@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAYP287MB3657:EE_
x-ms-office365-filtering-correlation-id: fd3e75a0-879b-4bb5-0bfb-08dedb2e738b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|56012099006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 GpHj5DNq3xY4J+fGOTzNEbborgze/AC40egvrlp6LkYGilOByNV+lN0Fxf/k3S/HYn1s1Ni7P/jkYmNjXADn6st/LKi+b7aj8NQu7hdmrSVTKGkSKXQYGumTWd+fXSv3BLDwqs7gKxDK0XqgE3Cs0eEz46ooA/pHZnlAJhOJ9LApvGGUZzlnjp2l7CqKlYnX3nXUuJbATf00WhSxrvk9S6HQ17je/MkRicTGsf9grkg9gP3DVnRluKITTv1LPIx7cxXfFZAyg0lU8J7SOyk4Lt0iVhmdJKN6C9JDwjJC05IEXaCKY9VtLmdyP3JQ15yIs3T/Qpl6eX8HX0AwTRuCPjDYal0ypmXy06v3kVKCmmORGk8szXRMGVOW1Q5oYYNH9jGVFHhmiGS/aSLaCB5RZKJpVlwDBv5sRWHDSFZ/2CZ0ypN0yvxjxuqBU+Ddshg3mbuaxAHiOPt4nqTu43USQbjZqXcO1pRLE9mW+yGYjKNHRaamIYDNDR1pXdtZLS0Olk5k22cXjHEFeasETKuAPjy0NB0k5RJX4GMUGtCEHOmnpb6gy94fjspOjWuglwNQmBp6jgbkhl/zpRGZekQFMDuYB1MFYjMPC4T1nDr/WYVWj1fL1RhYPCnDrTJTn7uOKB4kdztilkvTFUeJvznKzzisQgcmEsffp473OP28j1DeaH4r22t4oyMVgb3J+WraciP2Id/Ft+aV7Bb3WpkW6IhRP6sGYPpbpoatTAJm0jg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OjrF15DKsXtKQH0jk7TNJVWdrinZC5v9Xd3RLVw58atZBaqlzip44/tE3z?=
 =?iso-8859-1?Q?8BdPJpewj8G14dlwHZqbPHvYflWT6OLINfbJWESm6H/rsMdJix7iSO68VG?=
 =?iso-8859-1?Q?VAG5EKNonvuBvZU9pteE2/m0hQYGZXho2GGMKA7T4CBT0jcqAWP0h/vxxa?=
 =?iso-8859-1?Q?Q9uFaVo6Oe4sPCHtvwM2uNMjb+btAzusms55YGTWzyfhd/InqMz+pn3vkI?=
 =?iso-8859-1?Q?OUxNz3RLmp1i9LtOfWtcsVkl1U489lnPcPOT3Le+YFzyx7hi5IPB87NuhN?=
 =?iso-8859-1?Q?GRM64ldGV07lG81rx4Tqysw/bQedfBv3ZsAPIekbb6Xqo05+l/Q+4e9jtD?=
 =?iso-8859-1?Q?iybtFhim7U/dkXzRFi1u3JMiNU6zZkaRRdtD71jHV9YAyuAG3RQWfRbBkj?=
 =?iso-8859-1?Q?xlEAMrqab1eGrhjZZ/04FLGjVHARIH+hiX8che/Z3rS2URzsUjEdpTXxPi?=
 =?iso-8859-1?Q?H0LdSZBhfa6anpW4Vcnn8CZQUblsOdpbzyu4IuzH8s39ug4prhsGhgFviD?=
 =?iso-8859-1?Q?kQDJcleZX7KLokyl0fHiJhtaRvinB0MXqQ4iO8r8Ac04mZrPIOPa++KQ1K?=
 =?iso-8859-1?Q?9yfWgjKqpxv+IDhichEoenz0NEQCjDo+s/fAe0W2yHb+dI8OarvP8gH8Q4?=
 =?iso-8859-1?Q?TVGS/XlIGbtPlmkL6NiMhVhWnc4nixFmzTjvlkWfAoLVoEMF1bRjG2B4tR?=
 =?iso-8859-1?Q?v2zMpdnQSfyTQVPeURgmREVaLGQO+MAsN7TaUmsf9DZphT6EYaf2t/UBdS?=
 =?iso-8859-1?Q?OO+LCQUMCgOxIPfBHJzAcRhcN9bx1WIt+1GKVP8rtkzeVTp/1dvb2nKL8v?=
 =?iso-8859-1?Q?Uwbvskm/3mgQNTPI0C081ev/l4t3De7PLAacJmSsr1WF05z1w9KxcoOS/d?=
 =?iso-8859-1?Q?IYNrnuCGunf2DvkbfCDLnFSMn2rSqyeFsfNcMXu5mNRo01346qynKMC7xX?=
 =?iso-8859-1?Q?TLYkh6qTa1PYjLmrEEzPUXIMipdTcwgjleoT0cLSFQC23s2v76hKYrfd8+?=
 =?iso-8859-1?Q?pYStu0OrKHZ9BRnphcKttZKkxib21KHm5zHutWiVRaPwl3iaJ3P5qsbAX2?=
 =?iso-8859-1?Q?1P6BPt0vuGY8RfUyxuI0X7xsifFGnr9K+ESfWXImgKvWIMh6bUUbPESQ80?=
 =?iso-8859-1?Q?nN8wecLRaSrUkZYWEINHN6+N/Qq4H1QdMbApAmlEw6IxiqNyNDBtXn1ggB?=
 =?iso-8859-1?Q?0ob4ow8rDa8IoCp8NzbTrdQ28aIBSn/+2/g1BJb35nX1475kEQAy2wcljC?=
 =?iso-8859-1?Q?+H/ZRDiSzx+ODsjgYKUlcsUekH9FtVhVk+ErbBT77NYlpwit6F6GFI/xDy?=
 =?iso-8859-1?Q?9XSgFv73Pjwpbxlx41lIBLnKt3ByWpUdMXaT3FqMTemNinWtCYkxydVb9m?=
 =?iso-8859-1?Q?WN+OHoqw8wM2kNHFMSN57o179rlYU68XuAeZMlCpsRa5B22Eq/umLln0It?=
 =?iso-8859-1?Q?FCdSrsLnPe5dQI+M7PQX6Ae3lyBAx29fO8HmehSqL9FNfd8h8hwo943KCC?=
 =?iso-8859-1?Q?Tb9SKdhVsUooM28PQLupmRL31bCirM2fRC793wE7MEasCmTGZwVAQff0P6?=
 =?iso-8859-1?Q?Jqj+DrUbNqQwFqZFyJJZXwGIETPox3MDeUfAgrIjBa90KiRigaSf6RtqDI?=
 =?iso-8859-1?Q?MVOyI78Ca77a48Yhw6+aYSAZSXd30k7Sf0zru58u5OaSmGU/a2YxfbSf8Q?=
 =?iso-8859-1?Q?W+mTDGpdijVLug6xZFB1Xoh3xY2gZC1iQYxA9fVGBVuh9DrStgV7apQJ5F?=
 =?iso-8859-1?Q?MXZjEYHA9slenoIMEJQ0b88U4XRyfeIxyUztOi1j4xvqd1mReZDX4eds/V?=
 =?iso-8859-1?Q?6pdwlySTiQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3e75a0-879b-4bb5-0bfb-08dedb2e738b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 07:16:08.6034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8M0Fkcg3Seab82rFakP4JyxgT1cVcX8/qMYzeqrf25V8Ly7KE8h7bY2hxz5P/628LZ53/kpEtRfZt5CJkIWcCLoJeZ2GMHutnFEafALsFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3657
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66708-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:hansg@kernel.org,m:hpa@redhat.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,intel.com,gmail.com,ideasonboard.com,talbi.fr,vger.kernel.org,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,siliconsignals.io:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5277D70DEAF

Hi Sakari,=0A=
=0A=
> On Thu, Jul 02, 2026 at 08:05:25PM +0200, Hans de Goede wrote:=0A=
> > > I went through the INT3472 driver and would like to propose a generic=
=0A=
> > > approach that satisfies both sides without per-HID quirks or sensor d=
river=0A=
> > > changes.=0A=
> > >=0A=
> > > The problem is:=0A=
> > >  - INT3472 standardizes on "avdd" internally=0A=
> > >  - Sony IMX sensor drivers use "vana" per datasheet, and all existing=
=0A=
> > >    Sony DT bindings (imx219, imx290, imx415) already use vana-supply=
=0A=
> > >  - Changing imx471 to "avdd" now will create inconsistency with those=
=0A=
> > >    bindings, or require a rename later=0A=
> >=0A=
> > Ack, as mentioned in my reply to Sakari from 1 minute ago I'm ok=0A=
> > with sticking with vana for the imx* case,=0A=
>=0A=
> At least some Sony sensors use "INT" PnP vendor prefix and so telling the=
m=0A=
> apart from the rest doesn't work at least this way. There could also be=
=0A=
> other prefixes as well, they're not all "SONY". Right now there is one wi=
th=0A=
> INT prefix and three with SONY prefix.=0A=
>=0A=
> If we start having lots of devices with the same quirk, we could also=0A=
> introduce a pointer to an array of IDs to avoid repeating the same quirk=
=0A=
> over and over.=0A=
>=0A=
> Kate's patch adds two quirks so this could be already considered (and onl=
y=0A=
> one of these IDs is using SONY prefix).=0A=
=0A=
The HID prefix is not actually a concern for the alias idea, because the=0A=
alias table triggers on supply_name not on HID. Since INT3472 always=0A=
assigns "avdd" to any POWER_ENABLE GPIO regardless of HID prefix, the=0A=
alias would work the same for SONY471A, TBE20A0 or any future INTXXXXX=0A=
prefix.=0A=
=0A=
However there is a different problem with the alias idea: it would register=
=0A=
both avdd and vana for every sensor that has a POWER_ENABLE GPIO, not just=
=0A=
Sony IMX sensors. So I agree this is not a good approach.=0A=
=0A=
The NULL-terminated HID array is the correct approach, the mapping is=0A=
explicit and only applied to hid we explicitly list.           =0A=
=0A=
I can send a patch implementing this on top of Kate's patch.=0A=
=0A=
Best Regards,=0A=
Tarang=

