Return-Path: <linux-media+bounces-58003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOqbLrcPz2lysgYAu9opvQ
	(envelope-from <linux-media+bounces-58003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 02:54:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 364F538FB96
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 02:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED1F030BF617
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 00:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E8D26059D;
	Fri,  3 Apr 2026 00:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="bsb3ewT8"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020087.outbound.protection.outlook.com [52.101.156.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AAA24A076;
	Fri,  3 Apr 2026 00:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177549; cv=fail; b=ki/I/yDyxvvWNa/UtYtR0OXcxVSLP+tvLW3yE5n216CF6Jncy0Yk3I3c2QeFFfxK7lmG677EGSocXELGQ10rYkt9osqM+jf9JLX4ejNDreH8fRwebEoDveDU9qiAgOCfXOGuK43zxmB92IhAFyp7hFrMflRs7vhKAvpfb6XcU98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177549; c=relaxed/simple;
	bh=pvxn3/BAxMrAvfStmRkX+GAOYEOo9h98ZDUHVk7YRSs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TvrlvGfYDBgEEIfpUEQYJAKAvdAZ35gRv2IjxX4Yn5xI42gZTJTUbdDRm1tiSyprNvfX/c0mDSasDIUw0ed9DzJo9T2v6GZb6KrpdyxuuqRA+qXikazM3UsTTnspHLv1ozVyrI+R2xrqnxlyP+MwfwRbY6s9UwABjDVK/07t1+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=bsb3ewT8; arc=fail smtp.client-ip=52.101.156.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcnq2NW7I6zYVaE7XALntRUctMBcR5snqd06DAuzMHGYvafKdNvF47wsFGzL4SQZnqmnWAmoyBG8wWp9hinRWLs1QAf0Lglip9AaR3eeOZdWev5EZ9bT4kFv/+7+KCavSssCBjcInswsLnpqG7l0FTybs8NaxHbHBfgieiyyqfxA8ZAxL5PEu4sAV9ChVCQ+x1r7njluEYuELWzrSOpqJaR3iQEfvFn/3qgfzn8Ij29NJr9SP0ciyLXTsb9DDUODtgtQFs/cPaWpL+5IDBE+uFJLwyTFcyqFxLRpEPH64iXyGXSl/zuRVzoZ0T1b8/ngGrG0hEa4urfUqM3TOc8YcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYL7iuwHwBvumbvXFT8ZWo9vqbwibWp7fzOzMLLlxko=;
 b=jwHLW12lJeZlOnonLaSaohIIT7poh+Vr/asTivnhswEtjjA+GqQUGOEbFxEXyaOGY/MQfU49DO+eNwHIa4eHLBBRAZ4qpQGKarqrivfCHt3sMvb8uzCJzKVlqbR1NaOEOJzorfoJhemIT7Mnh1ERQl7Idudqfn9WSGLgg0uEQQbRxnlXAFvG0Ev/jZHiUtCYQCcLHarjPxNtUFGTj9NR205AgI3tUNmY/HpmnKVU9QBPU1edsthRy7Xu53kht4yGf7CtbW/kgEnTZcRYEnhPbjsCHBy20JpYHeOj3xv/ACy1LoUZrLB6SxkILUhqz02sJySMmSJweJ6hoYKMxCyWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYL7iuwHwBvumbvXFT8ZWo9vqbwibWp7fzOzMLLlxko=;
 b=bsb3ewT85L2aBknoG78kuNAA32/FXIwcHZq8IkBoc2CLO1M4PWKFeQPTTxNxHV6Y2JLR3c5YWNjz+XmMbaRjj8J3MkJ+35dg8+k7IrU0gLY38fHJ5tGj2poKv0JWNIc0UoSLVV9+qWE885rK7wZR1SU9POcrYggaJc0yC2YGO9g=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE2P216MB3437.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fa::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.21; Fri, 3 Apr 2026 00:52:24 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9769.018; Fri, 3 Apr 2026
 00:52:24 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Brandon Brnich <b-brnich@ti.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "detheridge@ti.com" <detheridge@ti.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>
Subject: RE: [PATCH 2/2] media: chips-media: wave5: Fix Reports from Kernel
 Lock Validator
Thread-Topic: [PATCH 2/2] media: chips-media: wave5: Fix Reports from Kernel
 Lock Validator
Thread-Index: AQHcwtD5MCbGACGojkKLqsAL2d2HDbXMgodA
Date: Fri, 3 Apr 2026 00:52:24 +0000
Message-ID:
 <SLXP216MB1148C00B0F5132E4F495D571ED5EA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20260402184554.1751445-1-b-brnich@ti.com>
 <20260402184554.1751445-2-b-brnich@ti.com>
In-Reply-To: <20260402184554.1751445-2-b-brnich@ti.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SE2P216MB3437:EE_
x-ms-office365-filtering-correlation-id: f8506062-f6ff-4ffd-efcc-08de911b450a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 LOTxnk3jIbwRijXheklagd3K/oq7m1w9fEQY4NIbxLRASTIr6rmZBtV04JaRAgyZTrZfGAb3OujH9gFYtXsWW8bqRwvh/kh02TDifdfeJo6N2fIn51DZabrvM+Ahq4F+KF80Izrc2KKskFHbD17Cf/UwhNLWpr3hV93Or+ashLPGXNEj/RAFsi2q46ThT2vxoeObtk5OkZhPXeQAaKNiULmDzX0r34rqD0Mau6LkNAe4Jqa2PrB9mGLoedb3hhGMQbUygiOpr/GHayeUCF/JAs8aGjV4Gjk+oD/D7TtC4c+rP4x+SVqy/aIekIRPNpQfk69YlJYYgrLUcaF5Y0p4fVOQa0VkBOCiLjuCwWzh1a/tA9l13700x5YIpMeZ1MksrqeUbjD0wa5XYQ/+SgpZ/MYgxqsH8bH4Tix73E9iUMjCA8ChHAIYDuSt9RnaJWFLi6GUkMkDDqLnHztm4RtAEFRMldPKchgt6ec3tFMUWfqb5jfeRH9uE6YD1UwYF2yQ9pjLXThnWyrrq7HKijTBBtHo0OPAmyT6tIIv9sfoQ1b7TposzIyi5VUZ86e8uT3AAjdndEOUVn5IBA/yiA0N0fn859MWbpKkoCkxPuUT7oUM2TPdvHnFcuxGSP0fck36GNHyyj8hd1vaJjU9ZszHd70w2Hoc4FqNuNUvE16vmKsahSgLWPKHECi5RTGQuyNJ4yTKxtsgqiJP7ihCE0fCpRkEwlXQGQjdjmZEkLjp2Xn88DgU8wOp2W1Tp6JlFpPbAJzeb7K0pIramq2nYWWyrFXghDplC9fnnB2N/2UrmV0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rU4EYF62Sy7M7/5dqDUbpDrKieahYfObBkySmQIN3NkVIEdEHYvo9KmbdEkD?=
 =?us-ascii?Q?LoSGhKRp9fHlTz+g596BSmiCi0WbhLpb5Bdd5dqAqoE94IKgzqwDhiv5SD5E?=
 =?us-ascii?Q?TyXO5AEO5H+6RgzVFZI2MnaKyl0pUpW4ehPmi12+Am5IaAKbGeZ0LKrf80Ht?=
 =?us-ascii?Q?cVPWVU3iC44X+9mq1zxfCn23qseX0MuSUGpkAeaHH8AReCdWNIZV2cTF8Y+K?=
 =?us-ascii?Q?8kL/AY0Izy4MlDrBgi9kCJWhLB2jJpwCLwUQgH3j2Z9dma6bntBzp1+S5TZT?=
 =?us-ascii?Q?3Dc6q00Q90W5tdr6yP9eE1lfyqi83YE303hB6QQPAmrUnGDwQccAiXUOJ8Nt?=
 =?us-ascii?Q?CE7Dtcov0zEyWBCsRDFMxwezdkFPLmTljHe2KlWxP5cJC9MPiGSzUWWprv3i?=
 =?us-ascii?Q?JeWKRv7MC6HWrvc9M+h0tBe0koO2gYdDEvr3uAyX0iCbx/zOiDtpN1fKOI/K?=
 =?us-ascii?Q?3gZgoBl2lYWPv55Bzklu9jeTxMC2jlPEW1DvyMkdnDZLEJIC1xmyrHGMgh9K?=
 =?us-ascii?Q?78KswvaETMu7+oS/+inCNnV8AYmKQ+nbovqcoKwsblZK1j2/rgUVaUphRs//?=
 =?us-ascii?Q?VAs3DrNSHTPfD1Ro+sJVaJ8HWSFchMYM+pFVwSO/Qjkb6ga5JzvjK0RF+NQa?=
 =?us-ascii?Q?5JQIzfHJy2WzTsV/1+aoCBE43WKGAsQMEKhaw2N0JNvkAa8bGDbI5/KzvdQQ?=
 =?us-ascii?Q?aqwt8Stf3P+YKPL6QjqJX/PpaeAkq5ZlMbw2STq+HnyBeLo7cD4S9eaYApWW?=
 =?us-ascii?Q?sTnZmWrZouc1aMRRNSGOHA8g5smQEdyitcds1C506lccgDGmankkibRpoXJ1?=
 =?us-ascii?Q?WNbkNOveD5Y1LS7etViRM2OGd40XpfzedE4CoF9mQqbbs5gYeaH7SQfoAt62?=
 =?us-ascii?Q?1PHoLf2plTnM03dRkuy/p81iCPfBds1KAddWrwqyeayb09VAI5JsAHnBRk7d?=
 =?us-ascii?Q?Gl3a9DFYLRjLU9kpKHdbT34XnVce3V4xSz66w2mo39xs5amBCrfLgpBCT0lD?=
 =?us-ascii?Q?VnUPbiIHjHJies5L8hKhQEZ48mqOXO18UsXijQth6AIKEXo03NqPNxnj+FIZ?=
 =?us-ascii?Q?l5j9Y7Bf1OjRtMLFC8MkOLwQHUUR1clndchKT0RxI5CVB8jHkEAYrEj4l8fq?=
 =?us-ascii?Q?b9poj6FsmTAAsdGI1fcDVlbo/4RR/wyWP4Po0PJwhmsDQAgv4qEiGb9socPE?=
 =?us-ascii?Q?/2a3c//8tJbnV50Lkn5Zix525LSLHAtnJliFu8MUGsiVN6jV+oOXM8Ud13yQ?=
 =?us-ascii?Q?EcB5S+sQHD8SL3r4GtkyblqzD3j8L+frdnDr5L23rIOyG+8d38Mq8bTKSKzI?=
 =?us-ascii?Q?A2sVdhdk6borAfqMSDJqAdE2cHsyf+WVWOgHWOer3S7HFpxltK7IjSPKPgEH?=
 =?us-ascii?Q?nASOGvr+u0pVKlB1bOj1AY3ZbN9aMhxYWmI9AYCN+DDIVq86HUPxKxRTw9Hp?=
 =?us-ascii?Q?EfiCc0dfwuIq3+hk/Lkw9MEj4zmmJ3wZmWa4bkcTKXvJtW1DXhxeJrl3ypSM?=
 =?us-ascii?Q?Hr/26vDiPQYaZ+ZKlLlR9+FvokU9YPfxHN0snkB/c0vCfTqD6Xeb469FlYR2?=
 =?us-ascii?Q?wqC2/Kllbjhe44wlhT7XgmwFByQVWs56EK4GPDBFL0flRS9fHMoRgrSRETAq?=
 =?us-ascii?Q?+lSz7rt8E43FUL+71ByK+u9+zoiNE9L4qmYlpxWbSAdG/Qin9jD3lBpYAx/A?=
 =?us-ascii?Q?htk9crbt6RpTuXcbWbu2fcQ4yGmDe6i1rWRvW8JKX+nCBCpQwJTM+xlvq7+X?=
 =?us-ascii?Q?SIE6LNV/7w=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f8506062-f6ff-4ffd-efcc-08de911b450a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 00:52:24.1247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jDA7iIl3yfFATj++afVagofpvEqfNTzT3YjBMTvPyvKDHJVGWVBa0wyGZz/NVIF/46rsU1uNifzyu/nMjtRHI3+XswM8vEG0jrdH24DwRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3437
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58003-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,ti.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chipsnmedia.com:dkim,chipsnmedia.com:email,SLXP216MB1148.KORP216.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 364F538FB96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Brandon

> -----Original Message-----
> From: Brandon Brnich <b-brnich@ti.com>
> Sent: Friday, April 3, 2026 3:46 AM
> To: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: detheridge@ti.com; mchehab@kernel.org; Nas Chung
> <nas.chung@chipsnmedia.com>; jackson.lee <jackson.lee@chipsnmedia.com>;
> nicolas.dufresne@collabora.com; Brandon Brnich <b-brnich@ti.com>
> Subject: [PATCH 2/2] media: chips-media: wave5: Fix Reports from Kernel
> Lock Validator
>=20
> handle_dynamic_resolution change requires that the state_lock be acquired
> based on the lockdep_assert_held. However, the
> handle_dynamic_resolution_change call in initialize_sequence does not
> properly obtain the lock before calling.
>=20
> Since the v4l2_ctrl_find and s_ctrl can sleep, they should not be called
> while a lock is already held. Store off the fbc_buf_count then properly
> update control once lock has been freed.
>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>


Tested-by: Jackson Lee <jackson.lee@chipsnmedia.com>

Thanks
Jackson



> ---
>  .../chips-media/wave5/wave5-vpu-dec.c         | 50 ++++++++++++++-----
>  1 file changed, 37 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 80e1831a42e0..62b21b2c5e29 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -283,10 +283,25 @@ static void send_eos_event(struct vpu_instance *ins=
t)
>  	inst->sent_eos =3D true;
>  }
>=20
> +static void wave5_update_min_bufs_ctrl(struct vpu_instance *inst, u32
> +fbc_buf_count) {
> +	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> +	struct v4l2_ctrl *ctrl;
> +
> +	if (!fbc_buf_count ||
> +			fbc_buf_count =3D=3D v4l2_m2m_num_dst_bufs_ready(m2m_ctx))
> +		return;
> +
> +	ctrl =3D v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
> +			V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
> +	if (ctrl)
> +		v4l2_ctrl_s_ctrl(ctrl, fbc_buf_count); }
> +
> +
>  static int handle_dynamic_resolution_change(struct vpu_instance *inst)  =
{
>  	struct v4l2_fh *fh =3D &inst->v4l2_fh;
> -	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
>=20
>  	static const struct v4l2_event vpu_event_src_ch =3D {
>  		.type =3D V4L2_EVENT_SOURCE_CHANGE,
> @@ -305,14 +320,6 @@ static int handle_dynamic_resolution_change(struct
> vpu_instance *inst)
>=20
>  	inst->needs_reallocation =3D true;
>  	inst->fbc_buf_count =3D initial_info->min_frame_buffer_count + 1;
> -	if (inst->fbc_buf_count !=3D v4l2_m2m_num_dst_bufs_ready(m2m_ctx)) {
> -		struct v4l2_ctrl *ctrl;
> -
> -		ctrl =3D v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
> -				      V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
> -		if (ctrl)
> -			v4l2_ctrl_s_ctrl(ctrl, inst->fbc_buf_count);
> -	}
>=20
>  	if (p_dec_info->initial_info_obtained) {
>  		const struct vpu_format *vpu_fmt;
> @@ -439,19 +446,24 @@ static void wave5_vpu_dec_finish_decode(struct
> vpu_instance *inst)
>  	if ((dec_info.index_frame_display =3D=3D DISPLAY_IDX_FLAG_SEQ_END ||
>  	     dec_info.sequence_changed)) {
>  		unsigned long flags;
> +		u32 fbc_buf_count =3D 0;
>=20
>  		spin_lock_irqsave(&inst->state_spinlock, flags);
>  		if (!v4l2_m2m_has_stopped(m2m_ctx)) {
>  			switch_state(inst, VPU_INST_STATE_STOP);
>=20
> -			if (dec_info.sequence_changed)
> +			if (dec_info.sequence_changed) {
>  				handle_dynamic_resolution_change(inst);
> -			else
> +				fbc_buf_count =3D inst->fbc_buf_count;
> +			} else {
>  				send_eos_event(inst);
> +			}
>=20
>  			flag_last_buffer_done(inst);
>  		}
>  		spin_unlock_irqrestore(&inst->state_spinlock, flags);
> +
> +		wave5_update_min_bufs_ctrl(inst, fbc_buf_count);
>  	}
>=20
>  	if (inst->sent_eos &&
> @@ -1583,6 +1595,8 @@ static const struct vpu_instance_ops
> wave5_vpu_dec_inst_ops =3D {  static int initialize_sequence(struct
> vpu_instance *inst)  {
>  	struct dec_initial_info initial_info;
> +	unsigned long flags;
> +	u32 fbc_buf_count;
>  	int ret =3D 0;
>=20
>  	memset(&initial_info, 0, sizeof(struct dec_initial_info)); @@ -
> 1605,7 +1619,12 @@ static int initialize_sequence(struct vpu_instance
> *inst)
>  		return ret;
>  	}
>=20
> +	spin_lock_irqsave(&inst->state_spinlock, flags);
>  	handle_dynamic_resolution_change(inst);
> +	fbc_buf_count =3D inst->fbc_buf_count;
> +	spin_unlock_irqrestore(&inst->state_spinlock, flags);
> +
> +	wave5_update_min_bufs_ctrl(inst, fbc_buf_count);
>=20
>  	return 0;
>  }
> @@ -1647,6 +1666,7 @@ static void wave5_vpu_dec_device_run(void *priv)
>  		ret =3D initialize_sequence(inst);
>  		if (ret) {
>  			unsigned long flags;
> +			u32 fbc_buf_count =3D 0;
>=20
>  			spin_lock_irqsave(&inst->state_spinlock, flags);
>  			if (wave5_is_draining_or_eos(inst) && @@ -1655,14
> +1675,18 @@ static void wave5_vpu_dec_device_run(void *priv)
>=20
>  				switch_state(inst, VPU_INST_STATE_STOP);
>=20
> -				if (vb2_is_streaming(dst_vq))
> +				if (vb2_is_streaming(dst_vq)) {
>  					send_eos_event(inst);
> -				else
> +				} else {
>  					handle_dynamic_resolution_change(inst);
> +					fbc_buf_count =3D inst->fbc_buf_count;
> +				}
>=20
>  				flag_last_buffer_done(inst);
>  			}
>  			spin_unlock_irqrestore(&inst->state_spinlock, flags);
> +
> +			wave5_update_min_bufs_ctrl(inst, fbc_buf_count);
>  		} else {
>  			set_instance_state(inst, VPU_INST_STATE_INIT_SEQ);
>  		}
> --
> 2.43.0


