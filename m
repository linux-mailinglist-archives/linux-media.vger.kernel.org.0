Return-Path: <linux-media+bounces-62950-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHQzKVITGGrKbggAu9opvQ
	(envelope-from <linux-media+bounces-62950-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 12:05:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 068C65F02A6
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 12:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 998B93569A10
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 09:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD933B635B;
	Thu, 28 May 2026 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="k8UgYzlZ"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021083.outbound.protection.outlook.com [40.107.57.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1923B3883;
	Thu, 28 May 2026 09:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961833; cv=fail; b=MDnY0VUCFmno4MQIFyF4BIz2rl63YMzdkBaqAi8pfi2MMMwuwJbAUBtAWADMDoGEKE/QPfCYxGyjjlJ8FDPdYY4ZJnSHcrQSshFRRQxiLtSm2YM2Vsfe6p+8jVF6IAV8IfomYRvAbU/9g8mUs5Vz44gUzytbtdHq6RqQS8ANgHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961833; c=relaxed/simple;
	bh=tzvo4ytUZocEEFXUHavt68th8VjENqFmiuIdjuizSzk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tHgc6WVwCqnMPbKn7jOaUz07LJxHr7hi4by1AV9YFVVlz6RlT1Q+eiprzVghLOhW02fFa3vZxsE8hfbKWK8NnWwWeRjdhwHtT6YBqtF54QfbFyhjcjKFcLb5RVHhPoUUJgUgF2lqAEyQ1s3PZdhXBWpaKAGoJComFkOVHdylqrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=k8UgYzlZ; arc=fail smtp.client-ip=40.107.57.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfRdjGgvDM0f6ItoXr+gkb0ky0DgnNEEoAnNZSS7A9fX8M1gtIEcLy10gHnpwtFkfKqKa4VYqVnQTecYFnYh30IkUm0PIEkU0s+tX22qkwmOHjWDr/snPRmba3J1ZnfjxnrvjKXMOqajxFJyZlzUAX5/wIW6XTX3TIfYOoMSyAxuXR9ao3mhP7XZcrqeWzrvdwF0uZQ7zBsGn3F3towu/rYJrkH8krbeeyZNgkyszFV4wQAbEFXxgbitV/P+Y5jQ9/XMZT+3BHmlOTLGT+/E1fgD5AcQFMMUe6OoDNu96JkTk2o0s9sX3Lt8GDIQfAKQJlYARBUF4UDHHGKEnm358A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu06MeDPaQ2bpvJMDgy1HWzPaazYOgmX6RVOmxTX4EA=;
 b=uKitFpu5R9TVa2XXcL+lLie8eryP4KVMyVjxqPSpbr4Nruktp4vpAbEMjyDimwoLk7Waod2UOApTNZ8QE/JAsWTeBO77eR0lL76sddh7DebcGPNbiMfIzJIiy00M16ALnIc8lZwwzwlqISj45jnpMuKuTFBuwfaCHZvGFzqsvVfIvCJyv6GVxVhweAgLs3tOKslWrQpj/PTcal2vR1kPEfXqgGlXj8yK3JZ1YxzB433BkwAkxcKFul4TvsQzp1rZsCW/BtShaJH5dMcFmFFRuT5j4Ua6TAG5oIvqTIIS+QZuPV6Jg8ZypnpSXzDQW0cGUyxtPRWXOfh9PI5XWH37Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zu06MeDPaQ2bpvJMDgy1HWzPaazYOgmX6RVOmxTX4EA=;
 b=k8UgYzlZ+SBt0KrzRZAriR1qu5DVJGrqQS8D1IOAm+VZieS4mCm7euxXf9OY+Jn9BOov9Qrq0jtI6JBa9CehmHYMh6JD+dkiCw27wzhubGU5q0CBk3442yS4g8xrqCAyfz17qeOBXcK5GU1rBWsUyh3HTJEI+lvzac2hXAm9oHS0vVBA+Weio2dHrt3opZKxQ2d4vfGrtyYFEhZY4ePQkJ4m5P2xw8I5ngPe9w75cVek6Fr5KPiKb6fKb6XMTz1znU0I4GRBVBVJ+DZipE92Tssl5EoVhq7BkNAszSBL6FBhdKFiXH3AOhfjAbcM+P3FKxbFNnAbXlOSh3F3kmpQKQ==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN5P287MB4359.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 09:50:27 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 09:50:27 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] media: i2c: imx412: Modernize driver with CCI and
 streams API
Thread-Topic: [PATCH v2 0/3] media: i2c: imx412: Modernize driver with CCI and
 streams API
Thread-Index: AQHctSN4DeO9deZoCU6gY+tKh3EbAbYjo9wk
Date: Thu, 28 May 2026 09:50:27 +0000
Message-ID:
 <MA0P287MB21780927FFC0C0048169A0E988092@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
In-Reply-To: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN5P287MB4359:EE_
x-ms-office365-filtering-correlation-id: fc6f1381-ffab-4a77-f5ab-08debc9e8c1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|22082099003|18002099003|38070700021|6133799003|56012099006;
x-microsoft-antispam-message-info:
 QhCj8Xg9rn6/ay2nfgZoTx+mIklryFel2DVLBjx9C0u4u2Nw3nciNcqYasjkFo5sQnoo/QW4As9DfrOBTTXt55RfKx2S4nI+VTU26bwdNMrxNTlyBelxFCMB6WiiLFbjXLLg1Ny49+RNXTObVwGrakOcwGrJeRd33ACRCdXZwqBxwK5VWiQKSYzkJxvHTuPzllaM2SEEJUwuyzj11uJkFV2bYEjA2WE0diaCPxDdBCGu6Jd0Ertgu8XCgbDw3UZpUjG8kVQLj7AiaKXkg7e1qNIFEsccex9VMnjxcaC/BkYvJ1BuqwBUzQHXHSZwI4B3BPJKhhJpeQLrQvAE8kG6mHwSwTXmnmZzf9wIpZ4pc0gwwq/t7pJ5X8ZRr3+fcJ+zC68kBsSy22wH1Rwf10tNxCurd99FUW6xsMh5XGUnYn8o2/56L4MvS/+L7H4jLJCOHgxkgJovdApq4RP0ZLtHIKE7waTOcRKeGung8z42cyk63X6iInxQmFd2qnwVBpuYtUrYqhXLX4vkgo0Y89lUW2QMEDtAIHnFCqfauk2oho5SAr4YfZWJFkFXvOmzEXUghDdwmLNwxrUBxFJBylTQTwu+HFb3ajQOGVa2UkigNw2cSXPkJeB/Koi8/AnnRgWp9bilmwxiGcVrh6LMqbIiQj5+3VVfa5Qo2LCOXhWD+P2tY0RMk8+S8ziXY6FgdV/JI3+ZlQmSb13Ojc0VYUxai9Dj8PFpd6c8buBU+BGdgVCGFymaK8EbZJp0cQjsOmz2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(22082099003)(18002099003)(38070700021)(6133799003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xbjkINTHX7xT6LBd1LKwuP5EpHY6/bI4hwerWSBPRfSpIbtDHjsfqc9UqN?=
 =?iso-8859-1?Q?KbthftN8RdjG0kqkpr5r38KNM3MUSJGvC8JeDMalYhkTP3ZCQe9LL00cet?=
 =?iso-8859-1?Q?4L/oEBpLIFZxX9osZ4YL4Qvfs63n0MV7VFD/7fkdeLOHMh5G68e3hgZuKb?=
 =?iso-8859-1?Q?IV3cupZ48MRbjp/tPbH/iddEN3YtlhaN6r85y52mDImqg5MEjQOceRF+4g?=
 =?iso-8859-1?Q?UZTYFUdKA6o3ustIognYzYgU705gbtClvuPwh6SaxASrTBu1YRnaTKqDh7?=
 =?iso-8859-1?Q?KaW8yk1kV43ypqenwlNxGN9FtFIBNaTVarhnVIzr6KAyBsf0hFoLMRrE4s?=
 =?iso-8859-1?Q?VhkJ0MyfHMebXGlYL3bWwyPn9iPagw7TpLo7Lu0Lpk58s/Jjk3UvWdvCu1?=
 =?iso-8859-1?Q?BPomg3jPB1NpSXGbFVSEQFMUGjwb3pJC2bzKpfINu3qrfbUUiwK9Cs/1xU?=
 =?iso-8859-1?Q?2GEfues34wnkGg5e02A7aHawOcZNScQ1LqrkBLVqAYXeyIsxAd6Q0jtK2i?=
 =?iso-8859-1?Q?W5tHpfIXCldEiMvIuhqHmLsdY4DAODstp8KWkPwWS/IKo/M/KLwLQVo5ix?=
 =?iso-8859-1?Q?6f41GUhoj/JeC9DOuMEwxA2j5KSEC3itSstf05PjioM1jtzcCadES42UV2?=
 =?iso-8859-1?Q?7HO5Qz9aV9TFdQvValIsGcyqEeQEY4QzpdcUk/LNvAH+NRoNLgV+LB6Z/d?=
 =?iso-8859-1?Q?lUDUXnBbz0AevrBHjVcOw91BW+EC9jijl4DIZBxoQDjDj8UvobnP+gc2hP?=
 =?iso-8859-1?Q?UPwCdaiIbbfgmCkDipVmgKMvHJRGlaSmM/Ernf7eZ6+XJIo7q0seyfnCuH?=
 =?iso-8859-1?Q?FiP1JamJIj40n0f5Zu04zSoX8BCZWgyYq7OZpQt6cqaXDp+0d6OStu8GEA?=
 =?iso-8859-1?Q?U87YlN8c3nW4PEjBwC2jIRHaOjeG6MCmuzlh7h3xDf7leCcJ4i1Dq7z97a?=
 =?iso-8859-1?Q?3jaJw+5vgJqTmHzROdYsfIRor2JdJXOITVv3DYdRLPyL79VBZOoHF0NrxW?=
 =?iso-8859-1?Q?fl0XbYxrgB2fK0Tb7oyV4eXMAor6a7SccYRpOqvkLkpJZrFeHMofjVGEv5?=
 =?iso-8859-1?Q?VdwdOEhOj6leYyKN2mXleR0IQgMXxuQRX3y6FwyRqLWP7YWX8MiqU110wX?=
 =?iso-8859-1?Q?5eRBcmAVvnPJuhPkknuTBNVzVKfWs6ZPF8FdgPwTnd5fQDr1E+FevwtlZH?=
 =?iso-8859-1?Q?jZhnj5jwH2mz8yKnXfumCX7tZw8IBVlHBP1zoHl8DOCB+8EsyYhknmEJfq?=
 =?iso-8859-1?Q?6q3PjWOAaHq0FuOiWzuunYKfAkpTVA1p5NZqcuAQyJGDoKGKnYC/RpjuS4?=
 =?iso-8859-1?Q?CQFekg+cxsJoQ4Y8FxsNaWJb2Ab6HZKPQS2CN59sIR/JAQcQroNSMKWeJ3?=
 =?iso-8859-1?Q?rdp7xZnUTFxwjELKa6JY+D/uMwnsVZsd0IeKpl/EH0jS3z8eQwXS6zOY6P?=
 =?iso-8859-1?Q?PKL+gGQjdfuPKDdAweJh1UEVdqNOTmS5NcJGG6a5Ynr4tyQ4d34nr7eAqS?=
 =?iso-8859-1?Q?t1KxZT+X8PxqiKNT2O2IjbGwRKB2gaTk2Vivaxzdc2HaJdcvAjEIoGwBji?=
 =?iso-8859-1?Q?SInhXowsPVOwOjTKwgNdpzzywxrV7JPLmN+3qIVbnRPwFE8x4MGfaly5DA?=
 =?iso-8859-1?Q?PHVokM14c+1R5+PHO+G4z1y+L6sYGGSFsBDtqxvHgwpC/lwSmDZocbStvc?=
 =?iso-8859-1?Q?vS0cQq4PhQgqoJk4fYlhgPmVdHKttmYjgbevo5yZVFeCf6MxMphwnBgtha?=
 =?iso-8859-1?Q?y90vLCbeC+gXl12QAs9g2XczDUwzw+iQx5za9n2ntPBSRsb/vXXjbP0t2G?=
 =?iso-8859-1?Q?jb3TuUgAeQ03j4cg6erZ1E/aR+kzt9Y=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6f1381-ffab-4a77-f5ab-08debc9e8c1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 09:50:27.4689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdIg/q2GYTjUcwI+kzjfXPvj1luYJ1KA+kLfI5pKqb9rSMSRWkgY444N16lQjgv1HDH/GXKw/4CshQJM8aslw2C7dCr7r6jI7jyavxMc7p5aWTpMVl6b6KHhMjny8QVF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN5P287MB4359
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62950-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 068C65F02A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,                                                                 =
     =0A=
                                                                           =
     =0A=
>This series modernizes the imx412 driver by:                              =
     =0A=
>                                                                          =
     =0A=
>1. Converting to the common CCI (Camera Control Interface) register       =
     =0A=
>   access helpers, which simplifies the code by removing custom I2C       =
     =0A=
>   register access functions.                                             =
     =0A=
>                                                                          =
     =0A=
>2. Switching to use the V4L2 sub-device state lock instead of a           =
     =0A=
>   private mutex, improving integration with the V4L2 framework.          =
     =0A=
>                                                                          =
     =0A=
>3. Migrating from the legacy s_stream callback to the modern              =
     =0A=
>   enable_streams/disable_streams callbacks, providing better support     =
     =0A=
>   for multiplexed streams.                                               =
     =0A=
>                                                                          =
     =0A=
>These changes reduce code complexity, improve maintainability, and        =
     =0A=
>align the driver with current V4L2 best practices.                        =
     =0A=
                                                                           =
     =0A=
Could you please take a look at this series.                               =
     =0A=
                                                                           =
     =0A=
Best Regards,                                                              =
          =0A=
Elgin                                                                      =
     =0A=

