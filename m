Return-Path: <linux-media+bounces-51196-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICY0MEaTcGlyYgAAu9opvQ
	(envelope-from <linux-media+bounces-51196-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:50:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4574B53DB0
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9889E4E299F
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 08:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FAE47799C;
	Wed, 21 Jan 2026 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="iMgJEFrc"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020081.outbound.protection.outlook.com [52.101.225.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CE4359FA0;
	Wed, 21 Jan 2026 08:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985254; cv=fail; b=raaRqcUZAECdYmdhiirb+sE39tQGbpzYvT/Z5yeiKUsC3+V/ddecBJLtgTnC9v5/WEFsAAeBit7YL3K5JbUQUBFWD0uS/PBFMngqf+HVjQvAlBqDMajuivzRLBrZ32e48pL2pbWYmZCTQan+lUx/zReyB2yYRHLUj3ITnMD5+2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985254; c=relaxed/simple;
	bh=8Wvp5agmfqZW2l0msxc1Y1/Q4HsXTwofjWFK+qhvgM8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YwDHVz1Zc8+wUe1ddWRzIwzjzN+Mj54UdcxrKTxJCagyCUgNXDZi1uPGmTwA7P71PnPAB1nMqBUR/zBOV/yUt4glSHhF5o2oO1Cp8tW0h3SyuwYaNB7oURPHM8h7+2dFd8C/YXIyiq48MZjcbSJ/XThvjLpFQ64eFagBmZ8a/gU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=iMgJEFrc; arc=fail smtp.client-ip=52.101.225.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+3EXdwsO36KiOGqwWcqX6fJT4NZdl6x/OSgBLDpy1JaisdOL/UnLfzZ8MdIBIcO7Ldn+wruZ3DZ6RXl3pD2dma+gHB28d23fhDmIMl16IFx4a6nMOcJP22pYKRK8YCe/cxiEkFoKBww6U6t8N4WQqyBH/H09P3Wv/aDHot/BsbJV9aKIBhlXN+IV3BcIrSGPs14f+wJone2GLnDjYgm764ooW6F3N5vDa9MjsV1U5yRMEHjJJdxUniylrUvH/JiUXIhKejkik8/xOsj94M7J8z/Gr52gx8BuHLbX3NTKizM3cc5LKWcn201hMT74dPVUtLFhWwU4jhPoe3iSNlROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Wvp5agmfqZW2l0msxc1Y1/Q4HsXTwofjWFK+qhvgM8=;
 b=hV09w7gMBR+AajjaOfYAtab/ugbnIn8SdzpjgKzu9wAXW61I7SQpoy6li8BHlnC3dZmm0x/KgKB2J9EqZd+S97Gjx2KoGhEx1qN+Tl9ZDYnmGXoAqnGp2koa1qpiDsRr44gJYcBWaxJgxg4zZZgt53qemmeZwRuIexou27aV4HNKoKF8kz7OOQaJxlLkUvxIdB06SgNex8ohmrg3U4KfhG9mB7eluuLBwAugEhQUwi8t7gA9ES6vq2I4WezFR2qne8pG6EXmXuwY4ki9gq+SvyoZIuNFhSpQhRJytoU3/rYGX9i7TiWeu1tUaSEkBQJMtCe/BO6aYPzRLquVjms7Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Wvp5agmfqZW2l0msxc1Y1/Q4HsXTwofjWFK+qhvgM8=;
 b=iMgJEFrcpGVx9gp+He91k4NoC8eJUc3+tRh6kq/vt3KxTroj0jjLDquk2wept2FuSWKD7DIbEUrgKNIMM988HbnHROvc9iwvmloMNT1rCaz7I+Cvz24/1m3QcljJ17yLU9hnnBwC+Osm18XyizDnQgOOgK+BoVOxJ5iVmQL8X+ZtveFUZSm3VO430UgXajEtk2kVheXMcEyUW/o7RJLcLaIt1jpBL/7AeZ+vZoivpW1d4OON52M6OSasgts8FTqCt0JBABnbowonCl67KVVlnG3JwHzoiFdzM/YZc+HLqisSx00qHGo2z053KEnJewtw9n2AmX2ArWLrrCcraa7hUA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1402.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:47:27 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 08:47:27 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 1/2] media: i2c: imx412: fix sensor power-on timing
Thread-Topic: [PATCH v4 1/2] media: i2c: imx412: fix sensor power-on timing
Thread-Index: AQHciq1b+QTJpATAPU+ZTs6oRz7wRbVcTPfJ
Date: Wed, 21 Jan 2026 08:47:27 +0000
Message-ID:
 <PN3P287MB1829EDDB642D6CFE9FD7EDBC8B96A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260121-imx412-v4-0-f6bdf83f116b@oss.qualcomm.com>
 <20260121-imx412-v4-1-f6bdf83f116b@oss.qualcomm.com>
In-Reply-To: <20260121-imx412-v4-1-f6bdf83f116b@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB1402:EE_
x-ms-office365-filtering-correlation-id: c90f0613-42b3-4da0-f6c8-08de58c9b494
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0jnht4ZcMG9wD3dBZZjs5UQ/wf/QjZYdl85FuqzG+UzV5J9BxLmUf9SEew?=
 =?iso-8859-1?Q?nGuONYCGLWnlYNqwtXRYoQHMKGlNNbTvi5RypEUsoyYlRk296Odcy0YX20?=
 =?iso-8859-1?Q?f2EaWwDL79GjCF+hhB2yijYHkncGejsfJraAwZJ/hdzi5VdF5WF7kuALol?=
 =?iso-8859-1?Q?LasMvaikT3RSV/kiEzGyy/SQfdEh4jRSE6r64s/jSbvbSCHEu9XSRYH080?=
 =?iso-8859-1?Q?DG+FW3BcB27+zVr+U0n4d6xKJzKwwhlkx/RYxOiRYQ3+QNycALesnHlUOH?=
 =?iso-8859-1?Q?tJGtYjzcDS8n02tjBYKXEyXzSH0xVZ2+AK2+U7mN7noP30cNZ5AeMxlPyN?=
 =?iso-8859-1?Q?7uUidYr2V9HsL1tU6A5hNqNL1mFNLfny0ESdtYWpJHNHtHAwSGxJD/TQwv?=
 =?iso-8859-1?Q?NFUSp8s3cBH2NUJgLKkQlIyalIE1XuUiAZ6eirnnG9d0c5s/jrp0izQ2bS?=
 =?iso-8859-1?Q?0yXd3jZj7yUz5oO4WEEox6T4QAGrPGSqBTvYYoDO17fq+QUFiWDE09R864?=
 =?iso-8859-1?Q?d4wi4rUQTT9g1d895cmyU/3cTJ4+sfhpGJ8Q/Jc+N1mhJYqEGoXrV2LfYm?=
 =?iso-8859-1?Q?kTurnhcJB+rE1dD36ogjbWEvyBbaLruQ0TBPaJN7iHUyqYQXoUdPxzlmmz?=
 =?iso-8859-1?Q?TcduxCmZze6qh6aaNtZ8k/yox5WA6uo1pcOfhyjq9PVnNu1iPOwkDxiP55?=
 =?iso-8859-1?Q?aqDhtq/BPT4pp6Ewzp8y0cnAYpQlP7zZ9D22M6DijpgRdQezVKpr/51UYJ?=
 =?iso-8859-1?Q?7tDM5RXu1gjz2oVSoz9bi5S0H3yDBeMWFbX/LCm3cBVaynm9wtYP+SZt5a?=
 =?iso-8859-1?Q?kp3lgVsZXh6k/cwqcWF6JqIYdmWzmdb93llKAEMzVLvGIoiboDZ3psEHKN?=
 =?iso-8859-1?Q?Ve3C1jcSY/o/ijP5vj5t9MQNMgteQUkaxOHa7TIPtWUMfvz2f8EySiTUlA?=
 =?iso-8859-1?Q?GRpBbi0EUc3bsn68myZhmWlXZ1uZ9AsSc6IqwMOw54vMhLllPHZy5odkDr?=
 =?iso-8859-1?Q?zWtJ+0xCVIeiTjAfSw4aTQSDHg6xYbJ7bgfewczoggHw6R7NcNh2Dx5/Vb?=
 =?iso-8859-1?Q?EuWWkeC0dh/HQ4VGAh1U6Jshmci/AWAVM1jcSNn0YUxUzh9Fl/8sbAboNy?=
 =?iso-8859-1?Q?bsYaOwIVcswrij2ITlOx1t3jkMqJHwWgy7SCC4kfZVORyBs0W1W3ggD1/b?=
 =?iso-8859-1?Q?+SR3o20GgfIIdSMkMT83VdWanBa4zBg8XrWv0EALN2RdtRLyWXDR6bAqmq?=
 =?iso-8859-1?Q?T1y1h5+ScBp1pSP+G+IstSIrXhtkGpl0aV8VEJ5bOSNoaBp9pwJEpnHhnN?=
 =?iso-8859-1?Q?JMiTZxI5Nhu7PyobT98KbqcqMEksIHLWNy/SSHMHVyB4ggEWYehdYS9M//?=
 =?iso-8859-1?Q?Ki3sp+9umzGez4w+VnyvnBD7HvS8TL16ebPXtJ1Vbps/ULDANYSASTnKm6?=
 =?iso-8859-1?Q?uPZAb7YpO2/Te0T/WhXBFSDGIL7N5WBxI7yHTkqtSCj7FyoSZCqDlcxgqf?=
 =?iso-8859-1?Q?EBwdM0Lp56y2BTf4dpqKQlmmIfQWgpDpDADZy8a2+oWolT+sHm2DuDS6ad?=
 =?iso-8859-1?Q?BUS/4w+JAJkTUQC8wKm5nFIieja1xzBGdEMXc3i0jrYK6Alo0cm8uY+jH4?=
 =?iso-8859-1?Q?yfvs9qdh1m8PNmB/MSbKleTY5zuQhiKcLCrHrmtKWaptXE9exjiUy/KJiC?=
 =?iso-8859-1?Q?G+Lsm7pvYswOitRswdU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JNIIbP4J//RPmFuOWs6gWrc+aJwZQVn76vHrv/xbm0whTgfjVS+wjiidM6?=
 =?iso-8859-1?Q?qh3tZfS4/uJszTub+hRnl0dru0yMN1VDIyE7GZUk1jhgy4UjBJHbtgceB4?=
 =?iso-8859-1?Q?CV880JmPstzXkrnzMPebKrVVOzywqpG2xaMcwyq8cRXmj77Cew3cRuc55r?=
 =?iso-8859-1?Q?6BTL+4xt4hjBQSqVETXtWQocjVJ5sSsbap1CtafwAFvcV+kZQ6zqexXV8l?=
 =?iso-8859-1?Q?n36j9f1/4cCdXWpOCWWjmTukH4jqVL/5JS0Qf0WilMBVl5rBQIZxt5edoj?=
 =?iso-8859-1?Q?HxJ8s86EMQscZdN+G9x7n5wZBXelSAMf6ThDD0nszaXutRFYIOjbmhK0uN?=
 =?iso-8859-1?Q?JN5sqQhGQR4TWRu8LNIIK/vD5AnvuqY6TT4/HwHBRsclGtFmxgThQSt8KI?=
 =?iso-8859-1?Q?31Q/+XB+5dLlUEXfEB/Vz8z13LIG5Sc0X46lqwvwJrHrdbNQpsncvZWS3a?=
 =?iso-8859-1?Q?IqHSWoZow+NiktDQkwF/3HPYH1J9DRiXYK+m6mFAf9MTp40xmcF3A2L8nq?=
 =?iso-8859-1?Q?nyO5uB38lbmz4wiJyHdDTnilG8PHz9/AmDz3y1ZB3awk9x4lm1wb8+8XbB?=
 =?iso-8859-1?Q?9tuk4rJXJ1gyNrvZeZT0E+buOTb4CirnLw8MkP+Kjb+3iqQi3lHmaHrCWq?=
 =?iso-8859-1?Q?LpdwMnNq2ewfDEP3TWn8crUiMvVbtPDthH8GYndSck56nJzK5ueRhlDJDe?=
 =?iso-8859-1?Q?8QZPryGyNTlKaqinEJqKVjgOxsJe/vE/C0m8mo78+Boa6J8m8P28QW83bb?=
 =?iso-8859-1?Q?5KBnC3XQJq6ghFN31t8MYGxyFic/qqiikw8BAlY2dka5E1uVWCbXWlB6+l?=
 =?iso-8859-1?Q?4ORiOvBpFAQ8ePhSuNk2pHnElSNAojAMcTKuor0BsX7WivE5fw0DmBzac5?=
 =?iso-8859-1?Q?3mRXHJJutVDXQlhDYoFY5OEYLvjO6N+89je1mj3xEpAdjNNXU0D+uV3WLc?=
 =?iso-8859-1?Q?DnpJ5EEVVYk8Ttkyc7uDU+XwyVpqDpugfzUorSlATO8w8IbATSIScg/KOQ?=
 =?iso-8859-1?Q?UwLOl+N7cah/B+rtnIF0QPwyT9oXJpl3Vo9UA11u6tk4xTFNqOZAAFZ7xV?=
 =?iso-8859-1?Q?HKV/rbadZbrgGF9Jh5ntbJOpjBOh4yEmRy+bTsJCBt/F6+ilMHC+U0WKPS?=
 =?iso-8859-1?Q?PEbLRKZSxei9ZDeB3NAFM5lySbvwIWEMeEZrNffvh06hNHpWcWJerc+LB4?=
 =?iso-8859-1?Q?gZJ+ha3fqEBJvxmdd8dH3chh1ruz1RMGcNaONAQGrV4MWMt+gfgeXsWUki?=
 =?iso-8859-1?Q?tw+loQPBD3rC4yqnJ/DdeJP7BQsFfhXiMziwnzQfc/7FE8bDnbmknW4wsk?=
 =?iso-8859-1?Q?kMLoAl59iIgrmzdr/N3VoHGRY3ijHQhQGUui42q4Q/ic9P6fhp1BZVm/Al?=
 =?iso-8859-1?Q?hjk6TdmgeSyzuOIMkgGU2RBd79OfOgebJsqMTrQyNo1hyyMsCh6JNXizRC?=
 =?iso-8859-1?Q?Fovi7adW37SP7hry1oDW3rtZC88FztXczctzphsdJfY/3Fxd8J/g73gtq2?=
 =?iso-8859-1?Q?A9BnLqAvrOiG7WV+6JznCzgHL8K5FG0/o5KEs8ucxrXTwH/C/BHgVGH3+J?=
 =?iso-8859-1?Q?+3RPiGZZjitU4O9LBE7+F8VewlygiYCERrx0h/RGCPQv3wTcZqB+It10r9?=
 =?iso-8859-1?Q?7fuy36Wor8zRZw8yXIHVzzo7QQDHEn1r5+vMnS8YK2MXajbwOua8oQJfiS?=
 =?iso-8859-1?Q?SCTURj/D/1nTHhHDDImJVzhH7HNk5aICZ2hb9H/8VFMSvLKhy4TGGtPsuS?=
 =?iso-8859-1?Q?JTQx/VyZDaMIREhBZ2T/ruqYJJuyaYOUPz/hJBu90rEqgRYy1Cgj4d0hIy?=
 =?iso-8859-1?Q?1M82LJAG0Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c90f0613-42b3-4da0-f6c8-08de58c9b494
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 08:47:27.4457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5O7QeqLxNQ26UJNkW3jX3JRDXzEvKGKhOKRLD7cqFsRGyp9Y1LSWW1IlczB8YMx4HMx499pkb0Dvv+/NaCxP3Bowzg5uowMn+B/e737z8kA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1402
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51196-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[siliconsignals.io,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,siliconsignals.io:dkim,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 4574B53DB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wenmeng,=0A=
=0A=
> Assert the reset GPIO before first power up. This avoids a mismatch where=
 =A0 =A0=A0=0A=
> the first power up (when the reset GPIO defaults deasserted) differs from=
 =A0 =A0=A0=0A=
> subsequent cycles. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0=A0=0A=
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
> --- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0=A0=0A=
> =A0drivers/media/i2c/imx412.c | 2 ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> =A01 file changed, 2 insertions(+) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0=A0=0A=
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c =A0 =
=A0 =A0 =A0 =A0=0A=
> index b3826f80354703b17b416dc233854da3f5736e38..5cb55deb125edb218779b0764=
29f9fff93e11a08 100644=0A=
> --- a/drivers/media/i2c/imx412.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> +++ b/drivers/media/i2c/imx412.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> @@ -1188,6 +1188,8 @@ static int imx412_probe(struct i2c_client *client) =
=A0 =A0 =A0=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 mutex_init(&imx412->mutex); =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0=A0=0A=
> +=A0=A0=A0=A0=A0=A0 gpiod_set_value_cansleep(imx412->reset_gpio, 1); =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=0A=
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0=A0=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0=A0=0A=
Just logic needs to be set to high when requesting this GPIO in =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0=A0=0A=
imx412_parse_hw_config. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0=A0=0A=
Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=
=0A=
Tarang =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0=

