Return-Path: <linux-media+bounces-28875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8B8A73DB4
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 19:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6C29189CC38
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 18:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981D521A421;
	Thu, 27 Mar 2025 18:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="A23Hw7cn"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6194917BB21;
	Thu, 27 Mar 2025 18:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743098676; cv=fail; b=gPxCmIEQjFcd/TFUbyXHI7wNIp/pQoUFWJVsXnJmPizPwqxeBhp52+h00YBoEAL6qr++hvAJXbBz9ODsraG6qD/YKa56lIYFyn3cGAXr2Gqlg/dTVLPJqBepJkrR+mowFuiVIMXpiOkVzSV/u38c4/yVaFu7ISY0QALguuaBJS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743098676; c=relaxed/simple;
	bh=RwnfUDi2LY4XGzdgmBv+X+2wCJa9dr/yVbtlydsvHRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NHN/6e2jqyoJMvZJqJiP/zr9YKC0OTtSFEvfjh4117aPcSm7rYnTKO4zxwW5sjgjZcCoROEtaEaVqE2numPWdLoVg/n8UNW1isNNIQDXMIvtWVQ/iOs+k/EYh+iA9kb5fwXO6m9Iaa5ER5FUkMcI2bR65qGTgDygws3rZylLb7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=A23Hw7cn; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMReb0v4emKV2sewGx3JWKtAWtIhHoB2u5rvlwYKp0Jg3QTnywkXwiFf8q88EWSOF3bXzofYWT5R9tIvMp4vQsTHMXVu4ewE4Ud42jQJIu81KN+pf1CLOTPU+P/cKnyZCRFJSYpQ9VSbNWO/T+Eidj8n31Q3kC397XyKdzH1Bo27QGTLfeXYIy1GtZzq2EfxSWHtVWSJQekizTklNEA/1sCkRDKo0CA67XJwiCNmOScPvB5ImraG6LMybq68AOswegqEd96QT7+MyWAxxnG+w3iVJ2OXU6H8QwWaWYPEcLiD5FJEkmp242WdfNEHy5PuO6VKXLyGaXZ3QR0vy2KbIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXIdYPmTbaxtHz4vrQxKcmVc0haInrVse8pu3f2nX2E=;
 b=w24SpAeF5WlLKIFoaj+tpHGaOVxFIC4AW+3SvMuzLqRoeip+ZZ/tlKVhYQltxaTRUzgJIfaNMvNgycoQsdaOuBznaC4irGLBTz/FXp2jOlRh5bN7Iout7lQvalgM3exIJmFRNYlfW/OHjWJz8UrJUwiH4vDHgNGpN56t5coThOoMvDNaFDedwDfjdz1wjtRmYX4BdIU6i+WIXoWpOuu42z78QRFkhjQ1bt5+GE/q80Vc3Yd+4zEXkhu9hUrTln32mryZ2QyY9zW2mkke4LmsfvO9wEjqKPOG4rPj39Puu3Z+cpECKg/RHYT7hKvtc2ls6tLRSGmb9r59uOPVuh1wfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXIdYPmTbaxtHz4vrQxKcmVc0haInrVse8pu3f2nX2E=;
 b=A23Hw7cn6OKSi5+d6sMa3jXIp8ILBSMXW/c/qIkFTKVB9zBbb42QewJff8VVJm9vSQPlRpA/s1ku6n3QpqgtHhO1ODlK6p8mxi9h0yFZ/lnnGCFLQtQFcLsb2w8xwUGPMzIG3XDibHn7MumhhXyKb3KzI3LhvnG8fZ/MfmK4UNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS9PR01MB12539.jpnprd01.prod.outlook.com (2603:1096:604:2fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 18:04:29 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 18:04:29 +0000
Date: Thu, 27 Mar 2025 19:04:08 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
Message-ID: <Z-WTGDUrRKa1Ubl0@tom-desktop>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
 <20250303160834.3493507-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB113467D4C0BE9691A6E4630C786D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z9LJFCBbqbdlDP8k@tom-desktop>
 <20250327101554.GA18306@pendragon.ideasonboard.com>
 <Z-WAsxVJ1QpDa8fx@tom-desktop>
 <20250327170659.GD4861@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327170659.GD4861@pendragon.ideasonboard.com>
X-ClientProxiedBy: MR2P264CA0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::28)
 To OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS9PR01MB12539:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a87179-63a5-45a4-e27f-08dd6d59d16b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?CzARxfhcJEsaaum0jDINd5V+b/SVq0Oz00jU8rA51vPJtqMgZYv9LwaF+m7p?=
 =?us-ascii?Q?QfD+UFRe0vRJGNhH6X519plEADhLjlwO5sHZwjdklQsaqUMg1eWXi3vWMc68?=
 =?us-ascii?Q?cYUGTaaY7ooONUXAbA+1UjU4EISuARQtmdU05JD0QlAqcycj01wG5EcBBW31?=
 =?us-ascii?Q?8aFZg3n9mpLQdqre1T/8yX2MShh4OwxcQz05GfEH9qYTgj4sepeCBcCXIXsE?=
 =?us-ascii?Q?tVxr+6L2Q/n7J259xC9SCkzkOgLZb+1vYGOYKSILgwsjdikn65foyPU3w8Tz?=
 =?us-ascii?Q?LuIwMMnYmqqpAnA8Fwo304DfHTpWhb22rgfaCFH2/38eNaBvWIc7/rGRPiE4?=
 =?us-ascii?Q?Qz/eFvAX0wGolz+VrcmbRRrLdgeRykFCF+CeEGo5nmbn0dqxXnxA1QtddeZk?=
 =?us-ascii?Q?pBG/y5ZybdX2WpgJFKMLZe+8083CQbpLfv2AceJ7uqWS08zpYQx+x7/4f7zG?=
 =?us-ascii?Q?V4+y0Hwi5NJIbEp7cMmztpCHPkBIBo8bWsXz/VORfSpspiXKGSUPfGtw95ud?=
 =?us-ascii?Q?wzb7CGNd84uHaEp2GAaAPhMVNayqSP6olsf4mZ1rgDe5hX5wM8eoCglnwbh7?=
 =?us-ascii?Q?QODWLxvYcbT/5u7OYfPFjEP0D7hwuUEV4sxnehp7hiuYo5Flysd6f89bJEkr?=
 =?us-ascii?Q?2H5n9ZSZnN5HVoypE1Y2NlzylvAwv8wyRlwFkuavUoIBCAfl+3Z5RAlh23a6?=
 =?us-ascii?Q?75LB8rFWa7gEpmXokw+OWm91ni8+oIgeaBz5/dmA7J4yyO3oohKrKPWD5JMV?=
 =?us-ascii?Q?4TWRWU6GXSrUXLtFpq4rlRjtVNQXQpJHmELfdF+5SadPfuTIjSwfYPbV8L0T?=
 =?us-ascii?Q?OBEEJSnD5hGFxuaStBByvBW41h5HIWmYlVAkN5UpnZg9V53jncbkV5RWm5BE?=
 =?us-ascii?Q?Sh12G5ss5AIQsBzwRdVx4pQxDquig9oFbuWLfzu1zo7cd1iSZM7JrCNZGKJ8?=
 =?us-ascii?Q?ShtEvR1B8TWbEHfxs2bFYG7prlZaPwPEqqQLASmk5yMAA7b4i3RU+22VuU2D?=
 =?us-ascii?Q?uE1+kJDPYG1u3NhkxoZKwdZefghVaogDbqcbaZVHB7mkDBSLJhn4OpPiG8Mk?=
 =?us-ascii?Q?Kka5glaSPUjbOoXZJgp6Fs6kzr110QBneYFdCXrkIrFJr7CA4WiYuppiDi4j?=
 =?us-ascii?Q?ucHK74TKeHufCyWVZTxqCzpdYuh2VNIlUERJy9eM578oydGvqWJKhXsjXlfG?=
 =?us-ascii?Q?MaKwPCdRls+dn1b8a8BRyYqfmSEHRj6+sNxAqzS1oTCxPO14Nat2u8EQbnMY?=
 =?us-ascii?Q?5JbdjUZZvCNmH8w9Uj3sa8N/WXm4GzzbycKLKa/XmeMVnE2yLiEUwuHJwtIE?=
 =?us-ascii?Q?OIKNXHqFUpnbxwb6iKuoiDE5qlgVF/YutoDckRv1svaTaszogbyWeRrPYzyN?=
 =?us-ascii?Q?eJkTVxGOpkTdzG0OVoeRw0QHT/N+8fix0kPgyHq9PoCcfWSJ0CqLPmnvBge2?=
 =?us-ascii?Q?rjJUQ9f947aDtfsJ0sIcocU3vXNE4xJx?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?w13sNNHN3OnV/MTtO5tA5zDo9dgzz8SInCRmK3Z8DG9IKo4Ye4sodW0womI3?=
 =?us-ascii?Q?5nLVBuZAC2vCiAIghVhLcWvrg16f1SUrKmSOlJ2LTW5c6rammnZwxJe3zlB7?=
 =?us-ascii?Q?howJ5JFONHSM9EqL861FuO85bcblnlN8375dS7ChutHDZSY70jet1bhZUfvt?=
 =?us-ascii?Q?qOtN1xcEeFkXrME9XbopjHMhGvKeYzmJZdESULrwdEFwnc8osbq+g25bu7Ba?=
 =?us-ascii?Q?3VJb3avDo0UOu+h9HgBTrIasE9KTdMs35qbWBv+rQ1CCNRMnmL2PWGQ5dpKB?=
 =?us-ascii?Q?uNkga2Qd4SjYI9La6RQkpdfTuQcPkOtZmNNZs72dNCLSH5pC1yzc21KWB3oJ?=
 =?us-ascii?Q?uSZAE5NArAyCknL3NDQroXoMESjn2qWeesw3J7hrPQJKHWPwZjq/3xydklcM?=
 =?us-ascii?Q?dWLuH1jvcki3dfTZ+ZzTuZOhzeDBfbm6omiUswmc7t5VahPd8Naf+SfNbLef?=
 =?us-ascii?Q?4xtFaOUNE3sP2Ylb2pjf4S018VLf1pd/e5uH0hRWRGiRLnArxll1zCzQNCnf?=
 =?us-ascii?Q?pOEuKCahu80mozvEEOy760lyk6ahhnrmsEAzwTUNQKTnQRhvgy3LW4smBVO+?=
 =?us-ascii?Q?S6kusyjj/EyH7k9ZVSOMwvPR2OYczDE0mIUujR0gO5U77jgbRg2mIDUWJcfr?=
 =?us-ascii?Q?lSLMLnZbFaiY8vD/8lLgUJgG3EZnq/+c/ozTLQ6g6a6ez+W02uVtzpauBaRX?=
 =?us-ascii?Q?PWfqmSWmna+3uwgyEvg4A3nA0UjLca9JpTcBN+myu8N/FPxJnY0VfpwnhDfP?=
 =?us-ascii?Q?7tzggXQtsymaA+kd5beLWAH27MxLAmvcj7CPYvtnIBKbfKAXkm4FDsnPTCMz?=
 =?us-ascii?Q?ZXNec2gq6bFhsc5aQnjIZA3EFY8nWLbFwEfw4F57iFnPKg5y9M1MgF0juxMK?=
 =?us-ascii?Q?fwo97yWtuYHmaBSgiMeUMMuh3V/jdXO1i7Tn7FZv/iXqCwDYEh5ozyAUu6CU?=
 =?us-ascii?Q?ueNOz70yOuqWjRr5JuUEqovRN3fc4AU0XVhvpM3NpMSfxonXCooQe2UWvGQS?=
 =?us-ascii?Q?9UmUj1j0QpyI/qgGRdLqJPaVLLgS4BiVsry/GVGbfuq7Fdu5FoujBUGxHutw?=
 =?us-ascii?Q?z5rwzxNG4s1CHtUuefZVF4mT5IIqInoSqkRJHz21uRKk7O1yxk5xn1wAU1sx?=
 =?us-ascii?Q?YTPdzAqR1/OM+tmb8RtMtEAAgmDeoT3w3f45MTNWn3WCFC8UAadlxAxsLBPA?=
 =?us-ascii?Q?IWcNJwfaFVgDdKJ3UjWBvJuysN27XSEBCfsoKIGEEQA91OmUnga9uDHtRZho?=
 =?us-ascii?Q?rOWGUm6u7MhsOsT+3lxwm6PoLIheZFS5AN5wGz4RarLxHE+4ar5reJJb0KyW?=
 =?us-ascii?Q?VUFOnuA/H+aCPe44d/mFX7ZLavh+YXTEGho70a+QC5norCDvdX2IFPoYmfB9?=
 =?us-ascii?Q?99xl02b0nvOv+S5R48lJJuYVVsDyyBoZbMpn77lw5sdnzhG7TIzSPDfaD5hj?=
 =?us-ascii?Q?27c5JuAkQDojlYPQLDu0NLicSdgOBeDMyFxSeWQCe6qr1NAC8GkySSVgEUSk?=
 =?us-ascii?Q?RyK/cf4QLtnkX1GYGQjfHFZ9NrwTvSEnG5zS154oLLJTDt7Yakm8cgI7ZrxT?=
 =?us-ascii?Q?urteUpiIcsSeWQ4lATRHkEOlt/Bj5OVukZx6wcR2rwUasLFP8fafJPY3w/FA?=
 =?us-ascii?Q?fVEinEkouh4AqkpBsrFfwmg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a87179-63a5-45a4-e27f-08dd6d59d16b
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 18:04:29.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJrUwYH67sdiCQIZgjUurMAF5h9xJg4RBEq54jfwzXMxX1LnUrWr2tO4YQjc8D86ouo8w8Hy3KVCj/qJFiCqN6VIO3lFS1XzzLlozQKzvsyOP+z5pmEDXnRyhFGaLxlr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12539

Hi Laurent,

On Thu, Mar 27, 2025 at 07:06:59PM +0200, Laurent Pinchart wrote:
> On Thu, Mar 27, 2025 at 05:45:39PM +0100, Tommaso Merciai wrote:
> > Hi Laurent,
> > 
> > Thanks for your comment.
> > 
> > On Thu, Mar 27, 2025 at 12:15:54PM +0200, Laurent Pinchart wrote:
> > > Hi Tommaso,
> > > 
> > > Thanks for being patient (and reminding me about this). Apparently,
> > > Embedded World is bad for e-mail backlogs.
> > 
> > I can imagine.
> > I skipped the EW this year, hope you had fun there :)
> > No worries.
> > 
> > > 
> > > On Thu, Mar 13, 2025 at 01:01:24PM +0100, Tommaso Merciai wrote:
> > > > On Wed, Mar 12, 2025 at 01:37:25PM +0000, Biju Das wrote:
> > > > > On 03 March 2025 16:08, Tommaso Merciai wrote:
> > > > > > 
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > 
> > > > > > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a CRU-IP that is mostly identical
> > > > > > to RZ/G2L but with different register offsets and additional registers. Introduce a flexible register
> > > > > > mapping mechanism to handle these variations.
> > > > > > 
> > > > > > Define the `rzg2l_cru_info` structure to store register mappings and pass it as part of the OF match
> > > > > > data. Update the read/write functions to check out-of-bound accesses and use indexed register offsets
> > > > > > from `rzg2l_cru_info`, ensuring compatibility across different SoC variants.
> > > > > > 
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > > ---
> > > > > > Changes since v2:
> > > > > >  - Implemented new rzg2l_cru_write/read() that now are checking out-of-bound
> > > > > >    accesses as suggested by LPinchart.
> > > > > >  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
> > > > > >  - Update commit body
> > > > > > 
> > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
> > > > > >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
> > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> > > > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
> > > > > >  4 files changed, 139 insertions(+), 35 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > index eed9d2bd0841..abc2a979833a 100644
> > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > > > @@ -22,6 +22,7 @@
> > > > > >  #include <media/v4l2-mc.h>
> > > > > > 
> > > > > >  #include "rzg2l-cru.h"
> > > > > > +#include "rzg2l-cru-regs.h"
> > > > > > 
> > > > > >  static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_notifier *n)  { @@ -269,6
> > > > > > +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> > > > > > 
> > > > > >  	cru->dev = dev;
> > > > > >  	cru->info = of_device_get_match_data(dev);
> > > > > > +	if (!cru->info)
> > > > > > +		return dev_err_probe(dev, -EINVAL,
> > > > > > +				     "Failed to get OF match data\n");
> > > > > > 
> > > > > >  	irq = platform_get_irq(pdev, 0);
> > > > > >  	if (irq < 0)
> > > > > > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> > > > > >  	rzg2l_cru_dma_unregister(cru);
> > > > > >  }
> > > > > > 
> > > > > > +static const u16 rzg2l_cru_regs[] = {
> > > > > > +	[CRUnCTRL] = 0x0,
> > > > > > +	[CRUnIE] = 0x4,
> > > > > > +	[CRUnINTS] = 0x8,
> > > > > > +	[CRUnRST] = 0xc,
> > > > > > +	[AMnMB1ADDRL] = 0x100,
> > > > > > +	[AMnMB1ADDRH] = 0x104,
> > > > > > +	[AMnMB2ADDRL] = 0x108,
> > > > > > +	[AMnMB2ADDRH] = 0x10c,
> > > > > > +	[AMnMB3ADDRL] = 0x110,
> > > > > > +	[AMnMB3ADDRH] = 0x114,
> > > > > > +	[AMnMB4ADDRL] = 0x118,
> > > > > > +	[AMnMB4ADDRH] = 0x11c,
> > > > > > +	[AMnMB5ADDRL] = 0x120,
> > > > > > +	[AMnMB5ADDRH] = 0x124,
> > > > > > +	[AMnMB6ADDRL] = 0x128,
> > > > > > +	[AMnMB6ADDRH] = 0x12c,
> > > > > > +	[AMnMB7ADDRL] = 0x130,
> > > > > > +	[AMnMB7ADDRH] = 0x134,
> > > > > > +	[AMnMB8ADDRL] = 0x138,
> > > > > > +	[AMnMB8ADDRH] = 0x13c,
> > > > > > +	[AMnMBVALID] = 0x148,
> > > > > > +	[AMnMBS] = 0x14c,
> > > > > > +	[AMnAXIATTR] = 0x158,
> > > > > > +	[AMnFIFOPNTR] = 0x168,
> > > > > > +	[AMnAXISTP] = 0x174,
> > > > > > +	[AMnAXISTPACK] = 0x178,
> > > > > > +	[ICnEN] = 0x200,
> > > > > > +	[ICnMC] = 0x208,
> > > > > > +	[ICnMS] = 0x254,
> > > > > > +	[ICnDMR] = 0x26c,
> > > > > > +};
> > > > > > +
> > > > > > +static const struct rzg2l_cru_info rzgl2_cru_info = {
> > > > > > +	.regs = rzg2l_cru_regs,
> > > > > > +};
> > > > > > +
> > > > > >  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> > > > > > -	{ .compatible = "renesas,rzg2l-cru", },
> > > > > > +	{
> > > > > > +		.compatible = "renesas,rzg2l-cru",
> > > > > > +		.data = &rzgl2_cru_info,
> > > > > > +	},
> > > > > >  	{ /* sentinel */ }
> > > > > >  };
> > > > > >  MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table); diff --git a/drivers/media/platform/renesas/rzg2l-
> > > > > > cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > > > index 1c9f22118a5d..86c320286246 100644
> > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > > > @@ -10,71 +10,77 @@
> > > > > > 
> > > > > >  /* HW CRU Registers Definition */
> > > > > > 
> > > > > > -/* CRU Control Register */
> > > > > > -#define CRUnCTRL			0x0
> > > > > >  #define CRUnCTRL_VINSEL(x)		((x) << 0)
> > > > > > 
> > > > > > -/* CRU Interrupt Enable Register */
> > > > > > -#define CRUnIE				0x4
> > > > > >  #define CRUnIE_EFE			BIT(17)
> > > > > > 
> > > > > > -/* CRU Interrupt Status Register */
> > > > > > -#define CRUnINTS			0x8
> > > > > >  #define CRUnINTS_SFS			BIT(16)
> > > > > > 
> > > > > > -/* CRU Reset Register */
> > > > > > -#define CRUnRST				0xc
> > > > > >  #define CRUnRST_VRESETN			BIT(0)
> > > > > > 
> > > > > >  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> > > > > > -#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
> > > > > > +#define AMnMBxADDRL(x)			(AMnMB1ADDRL + (x) * 2)
> > > > > > 
> > > > > >  /* Memory Bank Base Address (Higher) Register for CRU Image Data */
> > > > > > -#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
> > > > > > +#define AMnMBxADDRH(x)			(AMnMB1ADDRH + (x) * 2)
> > > > > > 
> > > > > > -/* Memory Bank Enable Register for CRU Image Data */
> > > > > > -#define AMnMBVALID			0x148
> > > > > >  #define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
> > > > > > 
> > > > > > -/* Memory Bank Status Register for CRU Image Data */
> > > > > > -#define AMnMBS				0x14c
> > > > > >  #define AMnMBS_MBSTS			0x7
> > > > > > 
> > > > > > -/* AXI Master Transfer Setting Register for CRU Image Data */
> > > > > > -#define AMnAXIATTR			0x158
> > > > > >  #define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
> > > > > >  #define AMnAXIATTR_AXILEN		(0xf)
> > > > > > 
> > > > > > -/* AXI Master FIFO Pointer Register for CRU Image Data */
> > > > > > -#define AMnFIFOPNTR			0x168
> > > > > >  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> > > > > >  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> > > > > > 
> > > > > > -/* AXI Master Transfer Stop Register for CRU Image Data */
> > > > > > -#define AMnAXISTP			0x174
> > > > > >  #define AMnAXISTP_AXI_STOP		BIT(0)
> > > > > > 
> > > > > > -/* AXI Master Transfer Stop Status Register for CRU Image Data */
> > > > > > -#define AMnAXISTPACK			0x178
> > > > > >  #define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
> > > > > > 
> > > > > > -/* CRU Image Processing Enable Register */
> > > > > > -#define ICnEN				0x200
> > > > > >  #define ICnEN_ICEN			BIT(0)
> > > > > > 
> > > > > > -/* CRU Image Processing Main Control Register */
> > > > > > -#define ICnMC				0x208
> > > > > >  #define ICnMC_CSCTHR			BIT(5)
> > > > > >  #define ICnMC_INF(x)			((x) << 16)
> > > > > >  #define ICnMC_VCSEL(x)			((x) << 22)
> > > > > >  #define ICnMC_INF_MASK			GENMASK(21, 16)
> > > > > > 
> > > > > > -/* CRU Module Status Register */
> > > > > > -#define ICnMS				0x254
> > > > > >  #define ICnMS_IA			BIT(2)
> > > > > > 
> > > > > > -/* CRU Data Output Mode Register */
> > > > > > -#define ICnDMR				0x26c
> > > > > >  #define ICnDMR_YCMODE_UYVY		(1 << 4)
> > > > > > 
> > > > > > +enum rzg2l_cru_common_regs {
> > > > > > +	CRUnCTRL,	/* CRU Control */
> > > > > > +	CRUnIE,		/* CRU Interrupt Enable */
> > > > > > +	CRUnINTS,	/* CRU Interrupt Status */
> > > > > > +	CRUnRST, 	/* CRU Reset */
> > > > > > +	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
> > > > > > +	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> > > > > > +	AMnMB2ADDRL,    /* Bank 2 Address (Lower) for CRU Image Data */
> > > > > > +	AMnMB2ADDRH,    /* Bank 2 Address (Higher) for CRU Image Data */
> > > > > > +	AMnMB3ADDRL,    /* Bank 3 Address (Lower) for CRU Image Data */
> > > > > > +	AMnMB3ADDRH,    /* Bank 3 Address (Higher) for CRU Image Data */
> > > > > > +	AMnMB4ADDRL,    /* Bank 4 Address (Lower) for CRU Image Data */
> > > > > > +	AMnMB4ADDRH,    /* Bank 4 Address (Higher) for CRU Image Data */
> > > > > > +	AMnMB5ADDRL,    /* Bank 5 Address (Lower) for CRU Image Data */
> > > > > > +	AMnMB5ADDRH,    /* Bank 5 Address (Higher) for CRU Image Data */
> > > > > > +	AMnMB6ADDRL,    /* Bank 6 Address (Lower) for CRU Image Data */
> > > > > > +	AMnMB6ADDRH,    /* Bank 6 Address (Higher) for CRU Image Data */
> > > > > > +	AMnMB7ADDRL,    /* Bank 7 Address (Lower) for CRU Image Data */
> > > > > > +	AMnMB7ADDRH,    /* Bank 7 Address (Higher) for CRU Image Data */
> > > > > > +	AMnMB8ADDRL,    /* Bank 8 Address (Lower) for CRU Image Data */
> > > > > > +	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
> > > > > > +	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
> > > > > > +	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> > > > > > +	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
> > > > > > +	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
> > > > > > +	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
> > > > > > +	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> > > > > > +	ICnEN,		/* CRU Image Processing Enable */
> > > > > > +	ICnMC,		/* CRU Image Processing Main Control */
> > > > > > +	ICnMS,		/* CRU Module Status */
> > > > > > +	ICnDMR,		/* CRU Data Output Mode */
> > > > > > +	RZG2L_CRU_MAX_REG,
> > > > > > +};
> > > > > > +
> > > > > >  #endif /* __RZG2L_CRU_REGS_H__ */
> > > > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > > > index 8b898ce05b84..00c3f7458e20 100644
> > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > > > @@ -80,6 +80,10 @@ struct rzg2l_cru_ip_format {
> > > > > >  	bool yuv;
> > > > > >  };
> > > > > > 
> > > > > > +struct rzg2l_cru_info {
> > > > > > +	const u16 *regs;
> > > > > > +};
> > > > > > +
> > > > > >  /**
> > > > > >   * struct rzg2l_cru_dev - Renesas CRU device structure
> > > > > >   * @dev:		(OF) device
> > > > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > index cd69c8a686d3..792f0df51a4b 100644
> > > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > > @@ -42,16 +42,66 @@ struct rzg2l_cru_buffer {
> > > > > >  /* -----------------------------------------------------------------------------
> > > > > >   * DMA operations
> > > > > >   */
> > > > > > -static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> > > > > > +static void __rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset,
> > > > > > +u32 value)
> > > > > >  {
> > > > > > -	iowrite32(value, cru->base + offset);
> > > > > > +	const u16 *regs = cru->info->regs;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> > > > > > +	 * rest of the registers have valid offset being set in cru->info->regs.
> > > > > > +	 */
> > > > > > +	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> > > > > > +	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> > > > > > +		return;
> > > > > > +
> > > > > > +	iowrite32(value, cru->base + regs[offset]); }
> > > > > > +
> > > > > > +static u32 __rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset) {
> > > > > > +	const u16 *regs = cru->info->regs;
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> > > > > > +	 * rest of the registers have valid offset being set in cru->info->regs.
> > > > > > +	 */
> > > > > > +	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> > > > > > +	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> > > > > > +		return 0;
> > > > > > +
> > > > > > +	return ioread32(cru->base + regs[offset]);
> > > > > >  }
> > > > > > 
> > > > > > -static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> > > > > > +static inline void
> > > > > > +__rzg2l_cru_write_constant(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> > > > > >  {
> > > > > > -	return ioread32(cru->base + offset);
> > > > > > +	const u16 *regs = cru->info->regs;
> > > > > > +
> > > > > > +	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> > > > > > +
> > > > > > +	iowrite32(value, cru->base + regs[offset]);
> > > > >
> > > > > Do you need this code as the purpose is to test compile time constant and
> > > > > It won't execute at run time?
> > > 
> > > Biju, I'm not sure to understan this comment.
> > > __rzg2l_cru_write_constant() is called at runtime, with a compile-time
> > > constant offset. The BUILD_BUG_ON() verifies at compile time that the
> > > offset is valid, causing compilation errors if it isn't.
> > > 
> > > __rzg2l_cru_write(), on the other hand, is called when the offset is not
> > > known at compile time, because it's computed dynamically. That's a small
> > > subset of the calls. It needs to check the offset at runtime for
> > > overflows.
> > > 
> > > What do you mean by "won't execute at runtime", and what code do you
> > > think is not needed ?
> > > 
> > > > It was suggested in a previous review.
> > > > 
> > > > I've done some investigation on the above bot issue here.
> > > > Using __always_inline for constant read/write issue seems solved.
> > > > 
> > > > I found this link: https://www.kernel.org/doc/local/inline.html
> > > > 
> > > > But tbh I'm not finding an example into the kernel that use both 
> > > > BUILD_BUG_ON and  __always_inline.
> > > > 
> > > > Laurent what do you think about? Do you have some hints?
> > > > Thanks in advance.
> > > 
> > > Do you mean that the compile-time assertions are caused by
> > > __rzg2l_cru_write_constant() not being inlined ?
> > 
> > Seems yes.
> > Using __always_inline seems to solve the issue reported by the bot test.
> > 
> > > The function could be
> > > marked as __always_inline I suppose. Or the BUILD_BUG_ON() check could
> > > be moved to the rzg2l_cru_write() macro.
> > 
> > Mmm not sure that I completely got this way.
> > 
> > Actually we have:
> > 
> > #define rzg2l_cru_write(cru, offset, value) \
> > 	(__builtin_constant_p(offset) ? \
> > 	 __rzg2l_cru_write_constant(cru, offset, value) : \
> > 	 __rzg2l_cru_write(cru, offset, value))
> > 
> > And BUILD_BUG_ON() can only be user on constant offset.
> 
> There seems to be quite a few examples of usage of __always_inline with
> BUILD_BUG_ON(), so we can go that way. Otherwise, you could write
> something like (untested)
> 
> #define rzg2l_cru_write(cru, offset, value)				\
> ({									\
> 	u32 __offset = (offset);					\
> 	if (__builtin_constant_p(__offset)) {				\
> 		BUILD_BUG_ON(__offset >= RZG2L_CRU_MAX_REG);		\
> 		__rzg2l_cru_write_constant(cru, __offset, value);	\
> 	} else {							\
> 		__rzg2l_cru_write(cru, __offset, value));		\
> 	}								\
> })

Thanks for the hint.

> 
> > > > > >  }
> > > > > > 
> > > > > > +static inline u32
> > > > > > +__rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset) {
> > > > > > +	const u16 *regs = cru->info->regs;
> > > > > > +
> > > > > > +	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> > > > > > +
> > > > > > +	return ioread32(cru->base + regs[offset]); 
> > > > > 
> > > > > Do you need this code as the purpose is to test compile time constant and
> > > > > It won't execute at run time?
> > > > > 
> > > > > Not sure, maybe adding an entry with MAX_ID in LUT,
> > > > > that will avoid buffer overflows and you can take out
> > > > > All out of bound array checks?
> > > > > 
> > > > > Cheers,
> > > > > Biju
> > > > > 
> > > > > }
> > > > > > +
> > > > > > +#define rzg2l_cru_write(cru, offset, value) \
> > > > > > +	(__builtin_constant_p(offset) ? \
> > > > > > +	 __rzg2l_cru_write_constant(cru, offset, value) : \
> > > > > > +	 __rzg2l_cru_write(cru, offset, value))
> > > > > > +
> > > > > > +#define rzg2l_cru_read(cru, offset) \
> > > > > > +	(__builtin_constant_p(offset) ? \
> > > > > > +	 __rzg2l_cru_read_constant(cru, offset) : \
> > > > > > +	 __rzg2l_cru_read(cru, offset))
> > > > > > +
> > > > > >  /* Need to hold qlock before calling */  static void return_unused_buffers(struct rzg2l_cru_dev *cru,
> > > > > >  				  enum vb2_buffer_state state)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Regards,
Tommaso

