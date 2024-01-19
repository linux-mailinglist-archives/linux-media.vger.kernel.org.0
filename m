Return-Path: <linux-media+bounces-3909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9F98325FE
	for <lists+linux-media@lfdr.de>; Fri, 19 Jan 2024 09:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 436B31C223DF
	for <lists+linux-media@lfdr.de>; Fri, 19 Jan 2024 08:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5D91E896;
	Fri, 19 Jan 2024 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="gAmfnBtI"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2056.outbound.protection.outlook.com [40.107.105.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C547EDDA1
	for <linux-media@vger.kernel.org>; Fri, 19 Jan 2024 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705654480; cv=fail; b=HuPPCB9kQWRwxrF7E/TAHgS2Md7UzsXyAJBFPyWkhnmWsmgwylwSX6r4KuuV/IT6q97rBA/ZXuqoQ7kDA13RHQaWWoCP4c2qaAm7FKzWY8/nerymn8jeM0JY+EXwkgRYnIcAOqgtoKDs9sTg+726576idVuRBrGdWKf7z1Ugwdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705654480; c=relaxed/simple;
	bh=U/cpFVGK92fKFx2WfB+OvUyYCSHkkdgA8kmA5+Ezi7U=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TMjydq3vNL8ozFmaCV7OeYQQns+haWbbkxIIJ9P++++97HF4amGJsTB9EjB69mieQld5FE50f5Arsh0V52eMKWSLubvicEiShrC7NB9/TB7+ERuJj7saOVFOrWr4wVd7tYmn3p/hgATTSJZgVO1pjyDT6Ou3yymADdnn5Uck8jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=gAmfnBtI; arc=fail smtp.client-ip=40.107.105.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcvflxI0XzLrvrgIUbI0sk1hC0biVrcv9s/S/LaMDTBFuGhh6BDSpnL1tYs3fdEmwq/XSyiOaoig8FkbBR/b6mPWUDsRkLD65vDz7oEOgA62zwLL2gPMmNnF1YgkCY3nKxPkW3WJWqIa6jQYpxW/CUhygLGwYz+CMjpo5AsYq5OQC24ZP8e4TDbOuQJd1L55kFt3FJ9p/+UIpOF5GrZkYJe4xNJjcVR1CPhHfeSCy3GhhPeeXPpLgk1RJnSkOWLnvxs2CiIiNsqt7DRywiK2nnp7sPBwtesMynwJNr1I59j0TJ8GvcKrlwg0/XhW2PriVIt8+kDsTfMiE2tSwwHAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/cpFVGK92fKFx2WfB+OvUyYCSHkkdgA8kmA5+Ezi7U=;
 b=mTfrA1lkxQBAGCbGnaZ2nTmOXXuHxHcdKTUehSb59qNoRNvJqflz6/H9ncHFFBl4HaT/dT8jbvLrzr8+1Um7jw6OjGUimppM5/XIs7x2jVFJAB20uZuaHMVp9dopDypTfNCK9M1O5AJxMMuG4C3DIuJwWFwHzblWw12+3XO5/E3WppiZVT0UD1huxoQjSBKxFcgx9AmpUpaWU1MdJlS2F6cp3umYDMz0cQVXVPEyqRlOHtiKJYwgcx1Q7qGDAsyvzDcKPWQM/O7hSyhePke8K6NGcfnz81ZG99/ZgKUsf5qs8FsUHn4XN+3VwjkKBq/FibNW8PMzFmmOlng8t7xqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/cpFVGK92fKFx2WfB+OvUyYCSHkkdgA8kmA5+Ezi7U=;
 b=gAmfnBtIxnoaaUm59lvnUhYyx3gxd+r0pz3Sd8b1GdvUHbFDOPSXxkI5QXnP/ibESUBLv2hVGO2sPPXaCfP1Cn7kKFA5TkGCXaxbpyBCYnIdllr+PnV1TXwz9FJSZoPVUq2jjgq9wmL+o9y8kQYWuxiBIAfX8gzcDaMhWYqH3XI=
Received: from PA4PR04MB9248.eurprd04.prod.outlook.com (2603:10a6:102:2a3::14)
 by DUZPR04MB9846.eurprd04.prod.outlook.com (2603:10a6:10:4db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 08:54:35 +0000
Received: from PA4PR04MB9248.eurprd04.prod.outlook.com
 ([fe80::4ae2:3101:1c1f:6911]) by PA4PR04MB9248.eurprd04.prod.outlook.com
 ([fe80::4ae2:3101:1c1f:6911%3]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 08:54:34 +0000
From: "S.J. Wang" <shengjiu.wang@nxp.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
Subject: RE: [PATCH 00/10] v4l-utils: add v4l-audioX support
Thread-Topic: [PATCH 00/10] v4l-utils: add v4l-audioX support
Thread-Index: AQHaSrUfttjzPcE1XU6Qb3W89W6ZQA==
Date: Fri, 19 Jan 2024 08:54:34 +0000
Message-ID:
 <PA4PR04MB9248315C81C152A31811A806E3702@PA4PR04MB9248.eurprd04.prod.outlook.com>
References: <20240117150232.1800006-1-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240117150232.1800006-1-hverkuil-cisco@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9248:EE_|DUZPR04MB9846:EE_
x-ms-office365-filtering-correlation-id: 098ff0b6-6331-4e71-0067-08dc18cc4288
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FW58czFXLJIQtd1DQoGph9afG9gd1UzfCphfL9vDjainHrnDfsXTRr7ttsMu/UFgMGzsUWMQ/agy1iI5IR2eD0iauJ4lYkYYGVdnuY6nNFyfguXs2TIv45PTOKP+BkMuwS1s40g4vNdIRmYB8XaCOp3fcLGYM01Fn/7XSiQhh/Ge7GFoOUFCWukd3LmS5PoS9HQjVEKKmmdR7OwcEk9LV9NksTZ7+pQt97xYCXDuaduKHhrSNWXSpzxF9SFofAZqraz8T7qeSpPnuItsTRCWE9JTVxRfx/ExB2TqE8xQQI482WAKy5tnT4KSo0mD1Sea5zRqlLKr5M5N+MhIudYPmnCTqNygQeu3sn2wCFZCYWeS7Mb8GoU5l+8Qc45qPQv04OQcINWyKoLGdoswIsoS1geNHV957o37soOHg/z8fNzN2erJ0GVBsT42xqSK0cGxtBole3c8jg+WMbaGbdZ+abCY82LSkpRM98CsHnvtOSW/4+FezGjQCYiDDtnGFOlFjC+OVcgIk0Se+Mf0lsJbSXPYOCo2XZxKzWC9pB7A9UOYT0tluMC0fXNBKz1FWHbC8K3tOs9lKk2iMsTlLtsRyN06Wa+6CdowQz3259d2CGDOUzABuwzXzQhW7SXP/nNZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9248.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(9686003)(478600001)(71200400001)(7696005)(6506007)(26005)(38100700002)(122000001)(966005)(2906002)(41300700001)(66946007)(66476007)(66556008)(66446008)(76116006)(45080400002)(64756008)(8676002)(316002)(8936002)(110136005)(4744005)(5660300002)(52536014)(86362001)(2013699003)(38070700009)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Xcg4UycTMmrSkgaKJhaGOCDO+nFXqykQ2cmmFYjwHYhXTd2VNQ0kynJmXdku?=
 =?us-ascii?Q?XaGYBZQhNwNR8aKpqER6CJsUhPb67UzJRV2XDQQiKKRIJrunmSjDaO7PvAIL?=
 =?us-ascii?Q?UzzLE8AI8O4e/wMM+wyiNYRL+pZMhX34KYejTS6ghpmqh1ATe39YcHtWa478?=
 =?us-ascii?Q?rRgGjZoCD+8P4lkND43C1p16pS4DHRUaI1ewGESp5CY+sZhvWofh4NyCMZM0?=
 =?us-ascii?Q?eadf3sOZgrXBVJE/F+vK6UmxgQlXpXmlFSJQsHr0FCzbXUMwW2O4nJhnJZRL?=
 =?us-ascii?Q?ff8oIbswxZ2XpN2bJJWwNSpJDF8LLE7e9uc/fIwD5XhMiHvXqdL16qF1iT51?=
 =?us-ascii?Q?kQMLD26uPXdMJ590Q7bKHMf/kINMO6NZIyEEuKd4HvkjXehcIoAYUSu+R7It?=
 =?us-ascii?Q?FiAfnmAcsy96dE8ew7LEKzMUsknecXFPBny3fGOIXPrxrT2qP0NYYSPuSnpp?=
 =?us-ascii?Q?XEnIWjoHpYVY+FSL4wDBTnoavD5+hcsdd6aiEWzO5n2JXNYUy3bK2NDeMeqG?=
 =?us-ascii?Q?ZlNteYp7QmkVe+HU6wKSETDEkwpqYrW1HFcvQyaJC9oPKqD6i74n7P/U+tDJ?=
 =?us-ascii?Q?+d8M0er169mWb/P8qHskz3ZIXH5uwIXFfsVgqXl8FLjcbx1XHqQ4ZqVJ1nnL?=
 =?us-ascii?Q?+y6GXVkgosqRjms57mUkALtI4kclp+iHDhQYa5jLKyREl5ZgWPZXN3pvNPxS?=
 =?us-ascii?Q?KMP3I39DM3q0Zc6jTCUKjM9Ed5je1KGStFKjw+CWqcxH4mSjXuUKVxp/bT7s?=
 =?us-ascii?Q?M34KhnuiPGlYnHnRRvmqhJKBLbrj6G8+vF7p6vEok/Yt3qoSnvZdTaZ5kOaI?=
 =?us-ascii?Q?nio8H9jxX4WOgoGgCZ6i7QAy/SWyDCaUKuIBOkeRWKZSNjIO4hRLK32J0Hwv?=
 =?us-ascii?Q?kUlncfWWmXRSwbsZElPUIxq63OClCIPFKs/oAw8vZX4CdlqBGC++Z7HthM65?=
 =?us-ascii?Q?5pUcxtGR7r4kURSChzIZkG5pYE9gjQCqaTCnWNcZU92UGQqGO+bwQ9OFRQSS?=
 =?us-ascii?Q?ztgEesRFjcw8EfuwkgxnDGD2vmYXVDoLiKZgGdXCjXzDBPSzjrZR7pmXqTjv?=
 =?us-ascii?Q?6QD28pdOs3psCDYAVURguhbCRP57DM6y5NFKsONSHFAdL96SkvVag6MuHbKK?=
 =?us-ascii?Q?ewBMhBXODQDfoU0gMRZ1MRv0aSe/A45GozQx/87v46YAqTok8CLsWWkEdRtt?=
 =?us-ascii?Q?zD3sOMX7Is6Eze22YulnafRjDKTaDqeXP28SMgOw7FnM0u98TcLD6eK0QF2M?=
 =?us-ascii?Q?6SRdmxLcbgi2f5+tiYGwwRq+pcGtjRGpu43KD7zdDTbC/ZmUc919QNolMqly?=
 =?us-ascii?Q?vezmvj3Cbyo8YfsNcOqzuO+ghRgzhLl42Znj1NhruKKHhalbtimlkQ+8tVcQ?=
 =?us-ascii?Q?KPMAZeoJfv5amzBU1cIPE8G5/EI8FDk2x7gQhb9RJ9Y9sIvLrq99WCX3onWq?=
 =?us-ascii?Q?5Z8dwjAD7pPWi5YPNLPKrm0oGNRuiLwoXdEYhtarhdZiRzlW3iT66S8+p69e?=
 =?us-ascii?Q?YYpH0MG1y5AqJP3Qf/FNNK3GrbCyPDQvGNuEJd4UsJhn/3IdS73/7ihh/C3i?=
 =?us-ascii?Q?g/2C0An8Vx4tnMlVF7API8HkBvBk2ZAKdpgnFR83?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9248.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 098ff0b6-6331-4e71-0067-08dc18cc4288
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 08:54:34.7838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OvIX/cZL1ix0B6MESBVqLfA6rKZQ4iGvHcIKM+cAT4NBPtRxxBKMCyxegWkoT/5HUlL0nAx6B+VmtxgUzf5Scg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9846



>
> This patch series adds support for v4l-audioX M2M devices.
>
> I think this is pretty complete, and it now has support for fixed point c=
ontrol
> values as well.
>
> You can find the git branch here:
>
> https://git.lin/
> uxtv.org%2Fhverkuil%2Fv4l-
> utils.git%2Flog%2F%3Fh%3Daudio&data=3D05%7C02%7Cshengjiu.wang%40nxp
> .com%7C1da7678f82b643a2fe0d08dc176d5988%7C686ea1d3bc2b4c6fa92cd
> 99c5c301635%7C0%7C0%7C638411005620181050%7CUnknown%7CTWFpbG
> Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> Mn0%3D%7C3000%7C%7C%7C&sdata=3Dis4OEFFoCTkO%2FZCShSgCqMh%2Fk
> Vvk5iUvsp%2FtnXdGg8k%3D&reserved=3D0
>

Tested-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Best regards
Wang shengjiu

