Return-Path: <linux-media+bounces-57420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBhhOy5xx2kcXgUAu9opvQ
	(envelope-from <linux-media+bounces-57420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 07:11:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F6234D7CC
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 07:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6430F303F07C
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 06:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C794A334C3B;
	Sat, 28 Mar 2026 06:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="cTqn/u1b"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021093.outbound.protection.outlook.com [40.107.57.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6190B15E8B;
	Sat, 28 Mar 2026 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774678309; cv=fail; b=njOP3QV+31taq758B9+uR6ug8TPWurpDK/sQkJFPvTDU4djk/Vll2Bq2vn3xo0YizEWDk7gwn11AlJ7eCmNjA6qFik3crWKD4sbCJRAfC0vmuANbqQW2qVQtsGDb3BJiwq+vVpN/4I/7qxnOx1G6fIpXtzVWrdr1AVVhYmK0azc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774678309; c=relaxed/simple;
	bh=nGe1Qg1sf+cYhAJGNXnL8lwIOJs16XujAa7a5dNsXF0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KtG51DCLzhRAVzsJL4u17zbHFRSDQV1hW79Zfg2L4hrChKv1bEquhouZToRtY22OB/7tJf4ONq9hDzGUlKdqics9hG5WtVQoayCzufHXKGmnHJdINqGuF4BPy537574mRBuZ9OZMZM7TqTipvL2uQJx4ONpytaEzfkMoySvwldw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=cTqn/u1b; arc=fail smtp.client-ip=40.107.57.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSlqq+KNR4JRw/iSM0ZV9QIRjIj6PSMMSrMENFOibdNPwjzMHoTfrNialia0bKpn4mBEEplyF73RhJClEnIYUPaeN4d1kKCT3PiSrLnBIo7/hAVtCY7IxNb0Ym8Mf+0usXNBxNa0zSs5HJnUC0gYMizep+bfz5g1p4k2vVBU0rZ1WosWZlq8w2ZRbENZYBqkTDse4vLS0pGfwDe5nihKyiBms8CSkvf/A3BmX0A6uAD08ju7JohCUVe/5fsMGKFwkKXxPd9zqILlCDtSBGSUUmZt+u3knVPTYyZhXmsyVIGtecLwAZCfZfuixiLPnYt0ItyvqgGpYGh6N2Xjf+RhQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmuKVrp2kAp1//6MVzY/fg/r2CjJZlHEoNbBpzKJeeQ=;
 b=SwHXkgTZk4u2GeayG1pkSW/VEDp1yDLL0V+lbjT9G7YavJMImmitQKDIVQTgn9Lw9nhvwedH6NeRozxV1lio2weafck9MR6I7Fi9JukqTHBNd7wjLhm+Ue95ayt/9i2Kwn2mF0uf3quKCl+oAD3SLJvN36IuGXhhkpwEQNCY+Flhk8xMwBkV+zgXuGST1Kj+QJHtyCAGfB9wOuL/6kFkQVHaCsk3zpKy2tOkOHq5Bx5pTNscTM5KPM6iFHfKx3SiV5UTVt0/bGpJamwurLEV8AFOjd7khDcvMs042Mt23lULC/rqoP4fFgt6/jv5/Ki983nMVrw2WGGt1gX1qlkOnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmuKVrp2kAp1//6MVzY/fg/r2CjJZlHEoNbBpzKJeeQ=;
 b=cTqn/u1bjrI64zRBB+2VJ6azryprVpfs5md5hB5O5hiFGXJdM1zVFfaMrNaGF+w8K4BIbY8BJpVs4+0Pf6cEaIHLqC0RmAuxO62Jnei1tMrG8PsHv0FxkLXJkjHukHHjsjetSB8YZRG1AnNRydBLWQ/R5PJWWRBHDs+TNDj6mw9UsqXJynRjAavFhC06kOJXT5q2fJ6paPXAJtka6v3d0q0Pr7QCmkdwpYV21uxnWFiHeopKodg82MinWVpTNNchsSbOLTqD6sNHRoq91hVLQiz79DywF8iMdKBiL2Aej3VfbhEaCCHXDkZl4J7HOLs29535aR6qzAofKJJJcUM0OA==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MAUP287MB5561.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:217::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Sat, 28 Mar
 2026 06:11:43 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%4]) with mapi id 15.20.9745.024; Sat, 28 Mar 2026
 06:11:43 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Michael Riesch <michael.riesch@collabora.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: imx415: Drop redundant runtime PM callbacks
Thread-Topic: [PATCH] media: i2c: imx415: Drop redundant runtime PM callbacks
Thread-Index: AQHcu4wwgYrEHvr7v0CWd5igCCg/DrW+FZyAgAEY/ACAAHfEgIAD1ZZN
Date: Sat, 28 Mar 2026 06:11:43 +0000
Message-ID:
 <MA0P287MB21780F5BC2F8113A10B6F0718854A@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260324124524.135278-1-elgin.perumbilly@siliconsignals.io>
 <1378ed13-6744-422a-b0b8-02621117238f@collabora.com>
 <acPU3H9pYEwzuuOS@kekkonen.localdomain>
 <3875be43-63b9-4e49-a0d8-175dd9268788@collabora.com>
In-Reply-To: <3875be43-63b9-4e49-a0d8-175dd9268788@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|MAUP287MB5561:EE_
x-ms-office365-filtering-correlation-id: acec7a4a-99ca-4682-2036-08de8c90e25e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 B8rPBXUqb1AIy7OO4XIw0BvM1CHiOG2HDPvAXnEQ+L3moh3NrE+Ik7nSkVfxUbCtDloG6u1EnF5+c6wEbx7ntpCDDi9E8sGA/W3sRAOyL+KS6lllyiftfAPHf8iTqctHessu47XnUI+Kl3e66y4QvM+xWTXmFjtH0nzr1q5tEk1YPPdwSFrcBrjRyNshpOSqqpgulieqQQDoxY+OYDfjR+yiuZ4EECFQoi7EvG4tB+ZENhLOG3+I8q3WSLKDkemoHcfe3G3x8zZzQQY5am9IQNUateX1Fb/kD7gSiSpBa/2wxFbSDlL4h5YSkd13CsvDIIQJEYGsSrosm4IjKJvG9A0UF0dhtbZMtxxvOiM02xvLvViqFhs9ohjI6xOxfzoAhRcK2YuWXXfxR6aU5aXJ6vqKuenAgEBBu8wNXFH+bu2dqgfNWcFYnic6lRmpsdxyxZdLg6qk5L2iBIDkHnvCUsnIk38SmT92do828Ogquw6ui36vn6ZxBu2gFce9TG1UwpPDszr3yNT1JMOHuMWnIQ5Yvdev2Di08V7fQjm9+WE46rvlkaqpSWoBKJD0twbMx4rQReo/kXdT3nJGCysZE4cU1aqw+VgNL2nVM51PAFivdB82sE1loZ36f0BlElsaVUGd5pkgkSHf2HNVsg9v9rSnsSgDW7b935Em6FSmGOpBO3lLO5+kRNCr9912ypjdwelnnPIUd0kTNQEDjuxHqKW3Syrei+AqCtFsOfaurw9AZHHKTCQiA763CejFByeS7QB1SBmRVKxE8w1z5sv3SQ+As6gndxHCr4yvyrys0o0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?ObnVQayuX8LaIjwvyZliwmSN7idrOcTZ+cr279PpwtP0M6TvyBVI7cbV?=
 =?Windows-1252?Q?NCCQwVvyzgHs/CD6heKvfEQ83Cpt1HbkTUWlMvxgzi1kER3oYrvWYp5z?=
 =?Windows-1252?Q?TlT/AVAd+Ay5TBXclSj3HGrzqgYtDvkmckF79LajI7Rp6Gorb896jw9d?=
 =?Windows-1252?Q?XsnIzm+I48ZkDqpZ79/WAwexOstpcYP93ht8BFuFrbneDt+KSQPu3c3r?=
 =?Windows-1252?Q?wSgn7+0worqCO+PdBCba/JaSoJk0TpDfv6bXEQqi8ERnOG3T9Fls0n3L?=
 =?Windows-1252?Q?UjFqhtYzj1VejCWnq5QVpBkJQbbm805yXlnkEeEQ1dY/B267GwE0vr0c?=
 =?Windows-1252?Q?pQDSct20nOtYEH+M14mQrbBDMRq22s9A2BpUAjM5Yzu/OLM+zX3uWWIO?=
 =?Windows-1252?Q?YlvEXBfzTq5kDynYxcbPXksoXuq0+B7LFDIB+j20cBc8Jirac9oJ+8Xk?=
 =?Windows-1252?Q?UuticX+YXLYLqeLwHjBZtueZOfJPIcrhujQZY1UePGUUAufEEAAgayNY?=
 =?Windows-1252?Q?01K9UdfkH+H1Vao6kshc2H+tVXuFuHhu96jRR9YYPpu7eRlH4rjMagYF?=
 =?Windows-1252?Q?+vwrfUy9fifgkpGs0V5UdINRRSTkFg4eV2bvwIiR7U+OV8oEsjGfSAcg?=
 =?Windows-1252?Q?tjQUKLACcKN97n2UyntQkyz7QSjMq//TpGYz9upgJCwlK16dWeGLs3qj?=
 =?Windows-1252?Q?eT/ASg0UeWfm79MgdC8qQI+3NrnuNzjd95Pxc9ABfwXqaX0BL9LMIPLa?=
 =?Windows-1252?Q?SoIec5bmkUhUka0r75s0eGuyJoNAjwbd9bKS2FuNdRSoasPBlax4h5UY?=
 =?Windows-1252?Q?I6BD/4gtaNeVN1Zn4dKZC/+f7E8EE3TMBXk+h6lL56MJbwi5d+LM5pmH?=
 =?Windows-1252?Q?1PmTZkTrE/+oix6Q0qkhDPt6fLFeihzps3oHI18jDE3/eDpUMmcd2Pin?=
 =?Windows-1252?Q?unzVWKllvQihJvo/L+oS9TIhCxkeK5z0MuSNDkZxAgl9yfK6OcHfvZZB?=
 =?Windows-1252?Q?MZpoyMBnw960HJb0WnuV2+XsOsOpGoh6t/tuUEIsybExYCo9NsDiq1/s?=
 =?Windows-1252?Q?Yo/WMMipuiJJkZZwceGXH1VTuse1jdysg5mSJunvN4KZXSfDBDi4fLMa?=
 =?Windows-1252?Q?7aVD9PUsRkNJ1ZSrW3ZwCYGUcGgkpP5RGur0Jet+8YhwXLi9jlfQUacT?=
 =?Windows-1252?Q?0/ZvOWfE3XRZ18ATrwOBxY5htsEXwSSWk38dNlwjpNLoWqXqlVguxI9v?=
 =?Windows-1252?Q?WIRoOG+gvXMlwhglfOq7Vq+QwAKnq2nQEV+9r1OjwuVVqGt3xuOvxGz5?=
 =?Windows-1252?Q?yZ1xanfO4b/k5BJQNXDwDcnu5Fs/+zL/1y8TK2H02wkhwxMuILy74rcO?=
 =?Windows-1252?Q?97jdEm6ugln4iXmo5tNUTlam1aD96shFvE0iD5TUv97vNbmeS1LR+ZEp?=
 =?Windows-1252?Q?l5Z2QrbeRFIMkMc0GW/vud3NbXItb5Ykj9Hz8VoSO0ol8NdUZnA+iV67?=
 =?Windows-1252?Q?87iJ6654dO4YA2qD6Kdl4x0de+GS2ShRL0E4xmyIp4duRwKwz912ge6e?=
 =?Windows-1252?Q?4zcsaVStdpPMEETnfd4IdPNm9MlFglpbnnTe7jf4+z2B5ZhRWfyIGnfD?=
 =?Windows-1252?Q?oR7VMNZBOzs9XFPrq8kIyQlVlKcb5R2pP9IBO2RjcON6vyPQcQRIgGuX?=
 =?Windows-1252?Q?VIJlMQpwUCVdKeeQJcNsGnq6lDwmCYSF2DpwCut+z2kK/90ONQ4pLvgx?=
 =?Windows-1252?Q?Z+FqWtDZcx1F5sX7BTfNDnagxB+Clgda3wsTCbpNzGp3XBj3gCJZODHn?=
 =?Windows-1252?Q?Y/ZwJZycKBBhAmb0aLBZVqUZ8zVcIXKOX8Sn5YMvfzM7nN36wRj8lXN2?=
 =?Windows-1252?Q?2QlZYFNZWiySUtGSgeNz0zbeAdy38XC2xnI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: acec7a4a-99ca-4682-2036-08de8c90e25e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2026 06:11:43.3876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rUHytysHcfg6STLumnH3GtMQofH1KdZtwbzaNNv2pX6bPR/fPpe/ZxcGBSyyusY73cuEWtZ1vc7ApUXCfMfsd97QWU1+sYsH7LdrWITwdOSXQEuXWezhUwBmVPkqw53f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5561
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57420-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 53F6234D7CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michael, Sakari,                                                        =
     =0A=
Sorry for the late reply, and thanks for the feedback.                     =
     =0A=
                                                                           =
     =0A=
>Hi Elgin, Sakari,                                                         =
     =0A=
>                                                                          =
     =0A=
>On 3/25/26 13:28, Sakari Ailus wrote:                                     =
     =0A=
>> Hi Michael,                                                             =
     =0A=
>>                                                                         =
     =0A=
>> On Tue, Mar 24, 2026 at 08:42:31PM +0100, Michael Riesch wrote:         =
     =0A=
>>> Hi Elgin,                                                              =
     =0A=
>>>                                                                        =
     =0A=
>>> Thanks for the patch but...                                            =
     =0A=
>>>                                                                        =
     =0A=
>>> On 3/24/26 13:45, Elgin Perumbilly wrote:                              =
     =0A=
>>>> Replace runtime_suspend/resume wrappers by using power helpers        =
     =0A=
>>>> directly with DEFINE_RUNTIME_DEV_PM_OPS().                            =
     =0A=
>>>                                                                        =
     =0A=
>>> ...why? What advantage does this refactoring bring?                    =
     =0A=
>>                                                                         =
     =0A=
>> It looks like patch removes two redundant functions, doesn't it? :-)    =
     =0A=
>                                                                          =
     =0A=
>Well yes. 10 lines saved. Not sure whether this was the biggest issue     =
     =0A=
>with this driver -- surely it was not a big issue for me.                 =
     =0A=
>                                                                          =
     =0A=
>Elgin, I was wondering whether this change is within a certain context    =
     =0A=
>or whether there is something I fail to recognize.                        =
     =0A=
>                                                                          =
     =0A=
>Anyway, if you absolutely want this change: I feel it would be nicer if   =
     =0A=
>you left the imx415_runtime_{resume,suspend} and moved the bit of code    =
     =0A=
>from imx415_power_{on,off} to them. Reasons for that may be mostly        =
     =0A=
>aesthetical -- I claim better readability that way.                       =
     =0A=
                                                                           =
     =0A=
The intent of this change is to remove redundant runtime PM                =
     =0A=
wrappers and simplify the code, without altering behavior.                 =
     =0A=
                                                                           =
     =0A=
If you=92re okay with this approach, we can proceed as is. If you          =
       =0A=
feel it=92s not necessary at this point, that=92s fine as well.            =
         =0A=
                                                                           =
     =0A=
Best regards,                                                              =
     =0A=
Elgin =

