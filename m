Return-Path: <linux-media+bounces-51726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI0dGMnteWkF1AEAu9opvQ
	(envelope-from <linux-media+bounces-51726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 12:06:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B68969FEF2
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 12:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 886BE30038C0
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 11:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22342EB5A1;
	Wed, 28 Jan 2026 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epitech.eu header.i=@epitech.eu header.b="r86RWcke"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020085.outbound.protection.outlook.com [52.101.84.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E7016DC28;
	Wed, 28 Jan 2026 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598401; cv=fail; b=g+YIXR/ZwVLB5n2W1tXA3nw52Tkhjnu+bhR+pi/3jzipKev1Fg6wCFIoMArW3qK0/n9/0UihHx6Ra877A603COC1qeGfno9klFiPW1o9BDdOZMpqV6Sqc9a0wffm9jElpBBY99kU6mVtG24czan568zsvhMedtPfd7pujK+bca8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598401; c=relaxed/simple;
	bh=sOXKhnntty6JCyU2F/H0bzyxjA8ohLVmjZbJGBYTN4M=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=B9c5apSNwz30n4v9MToaVEqV8CgxEJVMeYXsmpSHf7gS/Dmh0DL3Ix1RaSb1/ZsfbNtWCbXQZrdJ+7jfLNJ36iJMb4VAmLF2rqt5xsCNtl5mbA9CJds1MDTxPxERA8AV9P/A1QEs4f7UCETMvpXjF/NNbfK01JTBorB6jy9tcVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epitech.eu; spf=pass smtp.mailfrom=epitech.eu; dkim=pass (2048-bit key) header.d=epitech.eu header.i=@epitech.eu header.b=r86RWcke; arc=fail smtp.client-ip=52.101.84.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epitech.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epitech.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGlln/Ts4gIIHbuwVP+5hZR6t9RqhHvtNhSROfseIwi4XCEepV/r9MG1uT26xFGcizKfuslnzPf7YAAskvazVtNyvZDtUCueesE7mDnvpYMXAdInzMKY+iv206MxMthEMUNGS/QyV0u6Ui7uuqyYiJ0KPs7ge0Z+HVu1MBP3ismkoSzkNLrbU43M1Sxs7LMtBtuclSZ/r4C7MqRkhHTI8p4LGhd56NO9PTgVAy2NQGn4XUNgTdnwOzY43gXXPJmdqoEsrwnSaL3OVdclL5IsMIKGJjD5OrAxEddjK6R/Ho7iYDuhxrp+ML2aaftnuHF6k+TXGHV/1uYUh4wRF6FKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuqRGLyyRLlKQwx0IN6URuxZUYuXy7nq5f1S2ca+L9k=;
 b=mC2gNEOUWn3YZnnbUazTbes2hkCQLprMd/O0vJHhtmWfzLS0lLXZMTU5W+v/Js/JRen+CTQGsJ6X5/otHjkEv58Mac5VSXSPAuZETtUB9XduIagCYcOdRnzV/8q4+h+42Uw8G4BF/YzH4uLupJ81QtG7k7lbubDnNlITnDk5ssNH6s5xNXGZMNpBO7AP2WmqJ1JTQxzIRQ4ZwR53gGz7Cc3VLCHZWQrhskDCyjjHJ/+NRDsDcK11GzSRxEZDv9iGi1QJOT+a1oJl4FERdhDuXGW1WomQ4wf7tkNVqWU6VUZVq2YhzaHoRc3PfP1dt5m2gTFeGfdd4iV0rsL9hQ6ogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epitech.eu; dmarc=pass action=none header.from=epitech.eu;
 dkim=pass header.d=epitech.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epitech.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuqRGLyyRLlKQwx0IN6URuxZUYuXy7nq5f1S2ca+L9k=;
 b=r86RWcke4kIjA/Pq4EI2mM9VPfD7n9TnSb8KizctoUTBpFOJ++AQY5zqMm7fGSmwoGW11+eXSejCJf3Zz8zUo+1qBJldolm9XJD4vG0F6XWUlhsWAdbvKg2shcn754lq9QAObRfZJR0nvUKLcgEAjSWXIwSHmcOuNuImkJ9Ke9UJ4UcTbKZlBs28pyc4QkbH2CpjlG9oRWedZFUH/8wHy2BC3bxA6XZgxclTDNM2ZuZd30IYNC7RJbjs8gcSbxYiG47g8HdB53RH/52EngQEDYMdEbJAoyBtHa47rWuPSnn13wzMCGNnEHdmZ34PM6VHFJHt1pNM1GypN90FHxLJAg==
Received: from GV2PR02MB11640.eurprd02.prod.outlook.com
 (2603:10a6:150:30c::17) by AS8PR02MB8319.eurprd02.prod.outlook.com
 (2603:10a6:20b:524::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 11:06:32 +0000
Received: from GV2PR02MB11640.eurprd02.prod.outlook.com
 ([fe80::e704:a38b:6af6:68ee]) by GV2PR02MB11640.eurprd02.prod.outlook.com
 ([fe80::e704:a38b:6af6:68ee%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 11:06:32 +0000
From: =?iso-8859-1?Q?Timoth=E9e_Kremer?= <timothee.kremer@epitech.eu>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] staging: media: av7110: cleanup sleep   timers and dead code
Thread-Topic: [PATCH] staging: media: av7110: cleanup sleep   timers and dead
 code
Thread-Index: AQHckEPCP9kXgwenFkeMmqUUzBprow==
Date: Wed, 28 Jan 2026 11:06:32 +0000
Message-ID:
 <GV2PR02MB11640C6AA4BEEE7A1B584411C8991A@GV2PR02MB11640.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epitech.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR02MB11640:EE_|AS8PR02MB8319:EE_
x-ms-office365-filtering-correlation-id: 480f70e5-0071-4e3b-44ff-08de5e5d4b79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|786006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?KNthRpAmLT2ug/nBm3LTpvgtHWbIqBMoNzxAYMDJHatZnqJy6DoFoGqygd?=
 =?iso-8859-1?Q?36BqDpVkUNovWZUzleHhRtFaXBmg5+T4mR26e1oRbXPd5R0pyi3otc5Yai?=
 =?iso-8859-1?Q?zzKV6iZMagWpDpyN8DxjqrN4BDS+GyXR/YV3ub4y32wuVMveHrtjG1c1s7?=
 =?iso-8859-1?Q?DE7fs5F/v1r+K6o5oku2Rc36PddLj0EGNOBxA4J8MCEPih1oSDZEPuysnw?=
 =?iso-8859-1?Q?7LGw8G3iksd+gWIziwoJUaFjiHjCfSuDqN82sZl7YGUsiz+oK6bwJS6GxH?=
 =?iso-8859-1?Q?JOKe08fapDgscp6MFFekF1Q00RnJXSrISfj7TsiYJFtZ3/QvihVgCKyOU2?=
 =?iso-8859-1?Q?C64ikNnl1RHwxoFPvGEG0FHyYFVQMJRrC0XvP/faaRLA+8938mvy3SrfjV?=
 =?iso-8859-1?Q?bNaW5ueF+Ce4DXz0u3hB2qVqcRRo5qfp0sFaffI45jEgkv4Muq3lhCoYI7?=
 =?iso-8859-1?Q?mr/Ae4gV3G2tL/5CUhQaeR3Y8v03+67nL2Y3CkbwoJjbWqM7/u6z+SNo1B?=
 =?iso-8859-1?Q?6owjMZUyjJPnxxPpsWgHJ7rKYsrNYQJStUFPRJ1QjddouuR7Mz0ZnrMpEn?=
 =?iso-8859-1?Q?9wnbCg2XPIxeJ+x9qEza7Cexw3B7ZQ6WZ4tMRTUGMAbwbUyyfoiMzu6C5U?=
 =?iso-8859-1?Q?BW6HgV1PfgaKw8yU2zYhLv+vgFCcMYMHiecD/BvF3X4qJmmOV4g7V5nkmi?=
 =?iso-8859-1?Q?tXh+Q498qmDaXiahcU1oJp4Wm0xQ6OIAlU339X/Z5ZXpvlHNTyBJW4d27Z?=
 =?iso-8859-1?Q?ctSvHXR2d33dX/R3jp83/g3nVfH7XyPujt0vUP4mKANjIr5mx03uziOhg7?=
 =?iso-8859-1?Q?fUTRQ7SN+HuOgxd8a9Z1Kn+wwEY3p6BirNgZ38GKxf02U/CkhKuDbPq7ZA?=
 =?iso-8859-1?Q?ItNPcOzMbGt2fBzud+ifvovfkoUB1lymmXTlNeE+bTICmyySnagRk05Kgb?=
 =?iso-8859-1?Q?aOo8tE9GGvAXHHVBGDaVCE0uD87TNdqJ/3kfA/KGXfePhuZmjP7bqTSViM?=
 =?iso-8859-1?Q?m7kbf2rFVwinBD1/bJe+c8EGshD7sJdYHUzghufuFgMQ7exbQBkUMx9Tve?=
 =?iso-8859-1?Q?u5nmIZoQHb7a8ATiTqV+1KUiTZSU+aWwpq8P3BUrW5E3dR+uq9grLmP5kp?=
 =?iso-8859-1?Q?C2LT5xulM/EPJfS6IzoJLXBBXcG/QhulK1ZXEpjp/QmVV2TBt0ws+hwrm1?=
 =?iso-8859-1?Q?k7qOvBXNNptTI1cSwRLpdXmw4rLUGzv/PplovPTx6IQSqTzA3HofWTGREP?=
 =?iso-8859-1?Q?hvz0+Syi66Lw8HlXbuSalOlmgc5mYfuLaw+1fjcvSN2kHFIohbkyGM+yZU?=
 =?iso-8859-1?Q?pohYYhnPR6UsmaS0ii0gsFynRwqnsOBTh1HNTIXakzM+lpbUj/RhNOyIqa?=
 =?iso-8859-1?Q?+Wfg3YZEblU6ckjGh7TnXAkBB88lZ8WnnB0REYSZDk2fhNFXhonhA9LZyY?=
 =?iso-8859-1?Q?UDNkumn9m/Z+vNcJme8s2p6aV6yev7ptxrS08vVH76LkuDPV1JFmP0YZji?=
 =?iso-8859-1?Q?nt8J6d407t8+6p1tzaq7gsklrENN3DnbkRTY+9dlNaNWWfRPAU2wdXt+Bl?=
 =?iso-8859-1?Q?7APjzoKiA3jntZSOYqquCrN/WB08+BeO8FwVpcAp+1uYkGiYfdWLf7ImPH?=
 =?iso-8859-1?Q?wZRCxR2sx3pkXsUTBlX+VT6XNxuQBijqOEfz0UQf0gZruGiQ4498cWQKI3?=
 =?iso-8859-1?Q?I07GfAtt7HtN2SNEMj4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR02MB11640.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(786006)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4j5GKyl2lODXMink6LDCQLL0KxfWQMz6jMcacIAI+rY0sCDax3CP/eeDmB?=
 =?iso-8859-1?Q?KDSMeKO/BA7ZZsiKviFnyT1T/lx3D4rMgVIZDjpUARtgubgpnVuK7WaEOU?=
 =?iso-8859-1?Q?JLncNj/cLcZgk/QhpH+MrfB/2+w8AbM+QqSLMnQyCmesY1tW4DPBZcOZIo?=
 =?iso-8859-1?Q?eJdoeQswytS317bjHOAtqO48Q7Qd6OCZhpTqU5an1KUfLtaE2yL3Nx/3Xf?=
 =?iso-8859-1?Q?3C+JwEebYUhyAvKndncjl2UJu3e0twwpLAIlmm8NsYMRF+zzfvBU3zW3Zw?=
 =?iso-8859-1?Q?UeJpL6//SsD6TNc/WzGZ/8fOUCEO2pp4/fXDiRnCzLOTrA+839v0SQ9kRe?=
 =?iso-8859-1?Q?ipYYDuHssKoJJMvXFN/PvxCr34qFWyRE8n7Ff85A1kIaflAV/IghS/+s9d?=
 =?iso-8859-1?Q?+yLjz/SKAyYQEaGxrf+mb1OeLKj+5x0F28dID/T3/pDrgYMjkAf7eEfiKg?=
 =?iso-8859-1?Q?3QVDi6eUhbwlQBWWrDQUJk2WfXVzq7FWiGClhrxp9R6cRNq0aTjhgfqIeJ?=
 =?iso-8859-1?Q?oVxac6fpX3BrVlg1NUWV5/XXQZJobgdFWx+/dUwLyC/daJr86c92QFqO+N?=
 =?iso-8859-1?Q?WG7CeC6hVCBweXSOmSnRoNmvlBglfKuDJRL3e1ikoLYATHtz8WTyQYE9GA?=
 =?iso-8859-1?Q?hjEJeBfz+iwREf8IcL8o3pyxZ5WAv8G6Lku6ZH+CKZaalToPinXNJBDgBn?=
 =?iso-8859-1?Q?0WHdcwVikzo9dhh1QnoocSJC9Jyo8gmzaniK6145fzf/oF1q12ZBN0Hkjk?=
 =?iso-8859-1?Q?bI1p28c8hH0vyH3eBhqm7pzaVUX5sC93sIoeKzYT65tMjFWhF2qlwkE9ZZ?=
 =?iso-8859-1?Q?1Oth6oEvqqZ6D/3Xfx21O4Gjrtg+kX8+WC4H6NqRsuNTtPUR5xWkOEbgUZ?=
 =?iso-8859-1?Q?dg9x+I3u2n6m7cSffqSfvloBSqoJo3G0aMBMWxLRs3RsA0aFvca+jqIo4M?=
 =?iso-8859-1?Q?PygrROVrMJ0RtveHy8mR8pvLr1phix5Gfq3T+nb/EcSjVn8B2zEqlJqZNs?=
 =?iso-8859-1?Q?wgC7/DojErEFDrvd7/1gkuiAeFFZ1BX99v225ljOM5+tyWX02E4yX6mINt?=
 =?iso-8859-1?Q?AIHMHaGAqMbi1m+97TGK39ghyYO+ODgiM/qjUYCaT9nMIdmonxWKMbQnA/?=
 =?iso-8859-1?Q?vwyBPDakODRLdOBSJguoz7gYU0Mco9KNNqCoXESVlVAFXmkxSoPuXwiylU?=
 =?iso-8859-1?Q?Bp+Pml7AsiqxvGzu6wDfozoE2eRARuzjt0qhCpVX/enqyaKaRyLpJAEv2v?=
 =?iso-8859-1?Q?kJbVyEM0x2hjp1KJlZyq3tAuZbTEdzOgV4F33nyUKIjcymBzBFVWUP683A?=
 =?iso-8859-1?Q?y4GzXextgokzZQardNW84865pnEpjNxUm1LT47a56ylSmxoltEzNXcs2+n?=
 =?iso-8859-1?Q?raOyg3iYCS9Bl1Kvq2FBDW6g70ToL0UAu+xn2YyaBdhzYLKW34t4cNGmcR?=
 =?iso-8859-1?Q?qA1G0ZBNojicbmQNrmdqw5q51tYlZVm7OguGcLS452I9l/CWDNi4zHV9p+?=
 =?iso-8859-1?Q?WwmDT6P1IgZQCT87IhlnPYjEDhfslwn3Qw14M84CjKOwKfhU5ed3pQetY/?=
 =?iso-8859-1?Q?hOV1+oGT6qs/fB0TMfZdU3SE90jBHP3VOK313VukzWbvZkdV1DR6YuShk2?=
 =?iso-8859-1?Q?+CsGK3HI92jrWuUCEM8+TuC2jIGZPT5IWwZkchNAO+wkItfd8Efxf9iWRV?=
 =?iso-8859-1?Q?fd3L6iY8YXxuAZggwUssi8eMge9nhMzwvWesdQ3/t5Y3xY9uupMOEC40UO?=
 =?iso-8859-1?Q?0naxlcKnW8UwX2qwFC3F5hluMNgX5ZDQXvU/zppeiExwKfUKX3uGYgMhiR?=
 =?iso-8859-1?Q?gc2GWCKbqw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epitech.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR02MB11640.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480f70e5-0071-4e3b-44ff-08de5e5d4b79
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 11:06:32.4210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 901cb4ca-b862-4029-9306-e5cd0f6d9f86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t9L7rhM+NENghgewok3LglHYSVwbGUtPhaRUnMq1bQXmau5k5ByXCGh5HhuK/eJkMOI8FI0elucs8QMO3gz9wH2ijPgJG19roJRwEYihEB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8319
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[epitech.eu,none];
	R_DKIM_ALLOW(-0.20)[epitech.eu:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-51726-lists,linux-media=lfdr.de];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timothee.kremer@epitech.eu,linux-media@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[epitech.eu:+]
X-Rspamd-Queue-Id: B68969FEF2
X-Rspamd-Action: no action

Refactor sleep timers to use usleep_range() for short delays (<20ms)=0A=
while retaining msleep() for longer delays to maintain hardware stability.=
=0A=
=0A=
Also remove dead code blocks wrapped in #if 0 to clean up the driver.=0A=
=0A=
Signed-off-by: Timoth=E9e KREMER <timothee.kremer@epitech.eu>=0A=
---=0A=
 drivers/staging/media/av7110/av7110_hw.c | 64 ++++--------------------=0A=
 1 file changed, 10 insertions(+), 54 deletions(-)=0A=
=0A=
diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/med=
ia/av7110/av7110_hw.c=0A=
index bf8e6dca40e5..202d2383556f 100644=0A=
--- a/drivers/staging/media/av7110/av7110_hw.c=0A=
+++ b/drivers/staging/media/av7110/av7110_hw.c=0A=
@@ -95,28 +95,7 @@ u32 av7110_debiread(struct av7110 *av7110, u32 config, i=
nt addr, unsigned int co=0A=
        return result;=0A=
 }=0A=
 =0A=
-/* av7110 ARM core boot stuff */=0A=
-#if 0=0A=
-void av7110_reset_arm(struct av7110 *av7110)=0A=
-{ =0A=
-       saa7146_setgpio(av7110->dev, RESET_LINE, SAA7146_GPIO_OUTLO);=0A=
-=0A=
-       /* Disable DEBI and GPIO irq */=0A=
-       SAA7146_IER_DISABLE(av7110->dev, MASK_19 | MASK_03);=0A=
-       SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);=0A=
-=0A=
-       saa7146_setgpio(av7110->dev, RESET_LINE, SAA7146_GPIO_OUTHI);=0A=
-       msleep(30);     /* the firmware needs some time to initialize */=0A=
-=0A=
-       ARM_ResetMailBox(av7110);=0A=
-=0A=
-       SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);=0A=
-       SAA7146_IER_ENABLE(av7110->dev, MASK_03);=0A=
-=0A=
-       av7110->arm_ready =3D 1;=0A=
-       dprintk(1, "reset ARM\n");=0A=
-}=0A=
-#endif  /*  0  */=0A=
-=0A=
 static int waitdebi(struct av7110 *av7110, int adr, int state)=0A=
 {=0A=
@@ -312,7 +291,7 @@ int av7110_wait_msgstate(struct av7110 *av7110, u16 fla=
gs)=0A=
                        pr_err("%s(): timeout waiting for MSGSTATE %04x\n",=
 __func__, stat & flags);=0A=
                        return -ETIMEDOUT;=0A=
                }=0A=
-               msleep(1)=0A=
+               usleep_range(1000, 2000);=0A=
        }=0A=
        return 0;=0A=
 }=0A=
@@ -343,7 +322,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, =
u16 *buf, int length)=0A=
                        av7110->arm_errors++;=0A=
                        return -ETIMEDOUT;=0A=
                }=0A=
-               msleep(1)=0A=
+               usleep_range(1000, 2000);=0A=
        }=0A=
 =0A=
        if (FW_VERSION(av7110->arm_app) <=3D 0x261f)=0A=
@@ -359,7 +338,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, =
u16 *buf, int length)=0A=
                        pr_err("%s(): timeout waiting for HANDSHAKE_REG\n",=
 __func__);=0A=
                        return -ETIMEDOUT;=0A=
                }=0A=
-               msleep(1)=0A=
+               usleep_range(1000, 2000);=0A=
        }=0A=
 #endif=0A=
 =0A=
@@ -405,7 +384,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, =
u16 *buf, int length)=0A=
                                av7110->arm_errors++;=0A=
                                return -ETIMEDOUT;=0A=
                        }=0A=
-                       msleep(1)=0A=
+                       usleep_range(1000, 2000);=0A=
                }=0A=
        }=0A=
 =0A=
@@ -433,7 +412,7 @@ static int __av7110_send_fw_cmd(struct av7110 *av7110, =
u16 *buf, int length)=0A=
                               __func__, (buf[0] >> 8) & 0xff);=0A=
                        return -ETIMEDOUT;=0A=
                }=0A=
-               msleep(1)=0A=
+               usleep_range(1000, 2000);=0A=
        }=0A=
 =0A=
        stat =3D rdebi(av7110, DEBINOSWAP, MSGSTATE, 0, 2);=0A=
@@ -498,29 +477,6 @@ int av7110_fw_cmd(struct av7110 *av7110, int type, int=
 com, int num, ...)=0A=
        return ret;=0A=
 }=0A=
 =0A=
-#if 0=0A=
-int av7110_send_ci_cmd(struct av7110 *av7110, u8 subcom, u8 *buf, u8 len)=
=0A=
-{ =0A=
-       int i, ret;=0A=
-       u16 cmd[18] =3D { ((COMTYPE_COMMON_IF << 8) + subcom), =0A=
-               16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };=0A=
-=0A=
-       dprintk(4, "%p\n", av7110);=0A=
-=0A=
-       for (i =3D 0; i < len && i < 32; i++) {=0A=
-               if (i % 2 =3D=3D 0)=0A=
-                       cmd[(i / 2) + 2] =3D (u16)(buf[i]) << 8;=0A=
-               else=0A=
-                       cmd[(i / 2) + 2] |=3D buf[i];=0A=
-       }=0A=
-=0A=
-       ret =3D av7110_send_fw_cmd(av7110, cmd, 18);=0A=
-       if (ret && ret !=3D -ERESTARTSYS)=0A=
-               pr_err("%s(): error %d\n", __func__, ret);=0A=
-       return ret;=0A=
-}=0A=
-#endif  /*  0  */=0A=
-=0A=
 int av7110_fw_request(struct av7110 *av7110, u16 *request_buf,=0A=
                      int request_buf_len, u16 *reply_buf, int reply_buf_le=
n)=0A=
 {=0A=
@@ -559,7 +515,7 @@ int av7110_fw_request(struct av7110 *av7110, u16 *reque=
st_buf,=0A=
                        return -ETIMEDOUT;=0A=
                }=0A=
 #ifdef _NOHANDSHAKE=0A=
-               msleep(1)=0A=
+               usleep_range(1000, 2000);=0A=
 #endif=0A=
        }=0A=
 =0A=
@@ -574,7 +530,7 @@ int av7110_fw_request(struct av7110 *av7110, u16 *reque=
st_buf,=0A=
                        mutex_unlock(&av7110->dcomlock);=0A=
                        return -ETIMEDOUT;=0A=
                }=0A=
-               msleep(1)=0A=
+               usleep_range(1000, 2000);=0A=
        }=0A=
 #endif=0A=
 =0A=
@@ -719,7 +675,7 @@ static int FlushText(struct av7110 *av7110)=0A=
                        mutex_unlock(&av7110->dcomlock);=0A=
                        return -ETIMEDOUT;=0A=
                }=0A=
-               msleep(1)=0A=
+               usleep_range(1000, 2000);=0A=
        }=0A=
        mutex_unlock(&av7110->dcomlock);=0A=
        return 0;=0A=
@@ -745,7 +701,7 @@ static int WriteText(struct av7110 *av7110, u8 win, u16=
 x, u16 y, char *buf)=0A=
                        mutex_unlock(&av7110->dcomlock);=0A=
                        return -ETIMEDOUT;=0A=
                }=0A=
-               msleep(1)=0A=
+               usleep_range(1000, 2000);=0A=
        }=0A=
 #ifndef _NOHANDSHAKE=0A=
        start =3D jiffies;=0A=
@@ -758,7 +714,7 @@ static int WriteText(struct av7110 *av7110, u8 win, u16=
 x, u16 y, char *buf)=0A=
                        mutex_unlock(&av7110->dcomlock);=0A=
                        return -ETIMEDOUT;=0A=
                }=0A=
-               msleep(1)=0A=
+               usleep_range(1000, 2000);=0A=
        }=0A=
 #endif=0A=
        for (i =3D 0; i < length / 2; i++)=0A=
-- =0A=
2.52.0=

