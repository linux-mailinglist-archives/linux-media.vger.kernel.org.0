Return-Path: <linux-media+bounces-49822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1856CCECF3A
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 11:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF36730056FC
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 10:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91B429D269;
	Thu,  1 Jan 2026 10:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="B4sapvhp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3265E1F4CA9;
	Thu,  1 Jan 2026 10:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767263478; cv=fail; b=JWo+WfjhVEKYeH9bwPIv1lEEO1Kr7oYG0arV5HyCYI0uXCW6eWBHzXLDFZ1g67viR5sH24Xtv3lLkoMBpOzJ383VyQVtenZbJn63Z1uAbWcMLjx3numqEB8HuWNFnBP1hCFi1C897DmrEWQjVZF+FTU/w2D1R232u4N5Cbic5Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767263478; c=relaxed/simple;
	bh=NO+3e7m2FWdbb7BeeoP2lKgC3oare+EZ5DRIs9ZI4Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YuJKhzNJ1EwwGviBBsXF5v++JOZJVWm4J/WBg4f5GaKB33efS9NeAYZ+EkbjVfBIE+rHY3w1Dku+Rdi3sBYWIOlThQcu1p3mo9H6nTFcFIsO5aAq+Apnpsr84JJrzY/y5xMVz68cV5Qui/XXd8aTtkpaQUxk+a3Yhc5UryZ5aEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=B4sapvhp; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601AQcD01044411;
	Thu, 1 Jan 2026 10:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=lK5vWQF74v0QyhnMlSjQW7sK9pWrJbBKLgaXYx+g8Oc=; b=
	B4sapvhpms2jb5OsJ22eB79nApXgNQOUHGh18YaY5twU2K14tqzRra0rGcCu5Cov
	QPQlv9fqUEeo8bpn+LwEI32O9HHhs0KE9a+Mso1b/9jp0WcaWuYLSex4q6OSZ7cK
	yyaU1GDm0NeFjXy8SejIO0fBHbp8JupSSz16GqZixbMZBgmJFC/ZJ34AXbinRwLi
	bbHFTQ09RI/guodvyadY5rD5eSIxo2l7ZawfMDCsHuNA1t6qjWZsRnlGc0dxywuq
	sQAmCAfyRGID6hoxAYy5/fjQwvy4n+KVZQI9YhhvbfM9GzQnX08wChBUUrBBRttL
	p9wGrPUyl3XOpE8WDTtOow==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010025.outbound.protection.outlook.com [52.101.56.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4vfqq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 10:30:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Urn7F+qKmvRlQedsf7fEKnMv1nji2AAhOvkStobj9xXZHXZ34BbFsbn+iwRFMGsXz4joxtUtzSFdkGJeOVTW+cP8u2zVIO9Op1ymfEelrtSHSGvMjf1Zn3E78+ueMcIwsen40N/XywCzI3k4dEWrXYctJjVI+G5LZCyx6MCjtbrNyjiWjWgleTbqzoBCQjcpoUI2vtuomgGsegZycYlz3tP2bDgRBVH1IoswkYudq+0twMzP9170sv7UmzhQFRXVEN0p7Q2rM9wyxaQO58RcmruAUF9CkMc3UPz9DTMsQVQ69leSaVgMrLEFpVVsPPXdyhi2l0/FFtwFRIuNnasXcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lK5vWQF74v0QyhnMlSjQW7sK9pWrJbBKLgaXYx+g8Oc=;
 b=D8p+EgQmGyOVgruR09NSncW6zv/IsaugftnXITP2rBsCMeY3Zcaq/4oZdAUra05bYjlCDs7uIzHGHvtzltf4zh62CPnMyAAwhfU7yIbhkgvT3yrdVvEe262Edn4YGhRiE5Kf4+9tyPB4DXze8CfyNgfSK5TdRlQJIoX9XKCZ4zLkPRQ8/+devWatGW0Qv4WJtAICvrq5aI3g/aALfCXNGDJCgrMI1BNepmQglag3xUO8udv9Oz/QoTLvVzPpipQkcZgSD+edkRDSsx2uOgI+44a86aqiIaiJLvCNzAxdUbcuPnGkuUZtR9oDbSQMxunG4mIMXkIz1eEpSMwrw1Gqug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CY8PR11MB7876.namprd11.prod.outlook.com
 (2603:10b6:930:7d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 1 Jan
 2026 10:30:33 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 10:30:33 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] media: i2c: ov5647: Convert to CCI register access helpers
Date: Thu,  1 Jan 2026 18:29:59 +0800
Message-ID: <20260101103001.207194-2-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101103001.207194-1-xiaolei.wang@windriver.com>
References: <20260101103001.207194-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CY8PR11MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: e03ac2fa-e540-4b64-8680-08de4920cb78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|7053199007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ScBx4lCOsuOVvkDv+SwBaVkn+0hmZ6K6eV7j83nmBqr00cQ/FrCsMzMVyN3x?=
 =?us-ascii?Q?zkWxxZn+8OfYkbjobUGLi3dRFGv8ambIC+e0/Y66PzFx9rpqPi+nAigqX8Y5?=
 =?us-ascii?Q?GyDad4pMuw2VK+BFke835esUcbufgLmdKeBoyqtCTU0iHMnW7IMoEP7tiFv8?=
 =?us-ascii?Q?L/8VDqrQyQEvGhAqDcvmsMOYdb2tpsInWeqGp1A+AMHbl1aOO4qfB8l+iQ+7?=
 =?us-ascii?Q?NmLSZhCQoVyn/4YUsLEGAdtUveHEd9BStqmQGMiuSRLY+id5CvRLOIugCnQ6?=
 =?us-ascii?Q?uFXwIBQ2BLkmtxqR+yrCy4N0JsjFlyrmNQmjBP1KtMi0mgQclpquaF2M6c88?=
 =?us-ascii?Q?EsRj3xXwKceVpt9McjvgqIexf8LhOimqagiYA21kOev0E/5G+u5GfxZpmnX3?=
 =?us-ascii?Q?xm4dqtCp0pKD6VdYKNtLWlupyqIHGSEQ4DHbqeqedWmkkZto2ErLSFDZu8Oc?=
 =?us-ascii?Q?HGEANkPq+LmAo3Ppq/Bk+eRRQ09GK3ApwAE1EyhJrs/beRmCNzQCk85EmZek?=
 =?us-ascii?Q?24uv3Vbt53zHvKqrTsmZC4ZTSMzYtGuV9HbyS02i8ncO2bgiPDX6dSO4Y/Qt?=
 =?us-ascii?Q?5FAMm+aWc+IWCYGoR+3Y8wZ+FUT3C+Yj34KS3C5dWizB6xYIJzjpEEiCYRQj?=
 =?us-ascii?Q?wY7JNaAWDxoqo1pjYWJJEOojIXnsDAGoeX55nA4HHE3v3fdCq6EuO4CXuJA0?=
 =?us-ascii?Q?gCXcmsGQzPQxRFoNAfHxoLM3boyR5iCOdGzyZdDr7bq4br7TP6oiFnZL/qAJ?=
 =?us-ascii?Q?sh5P4W45yOMa/ZopMayoSimKeX5tQ++jFGXAK+xZv+nNQGb8J6RjBgblU8rq?=
 =?us-ascii?Q?dyHjmub81EmpfOXRUVJbRnPxDhQgxozUe8uTW9c/wBVTmO2aD4mam3CXV6wD?=
 =?us-ascii?Q?rlqaiLqgP/2zTeoYUojTPax056ooXgY30qd/wJDpmZfZM/HP8irHBz9u/J0f?=
 =?us-ascii?Q?mYsY0t6OtM4fVYgruombEc9+lSy5mkTZsn6T+w9K8FhVAX+ConVQlVRqsC5J?=
 =?us-ascii?Q?7b4eL8R6Yoj3x5In6MyCXf6gSwsNnE0rADaYzwgVrW+gzU1clLS6GH0t9agp?=
 =?us-ascii?Q?h9MXPgk+PbVAAs4N3uGr85oK1zee9KQefZhuTftvFdUVflz4jinZO+IGydvJ?=
 =?us-ascii?Q?55TwgrGMDeJDh+65OSem5MFbtSDw73s8YsfGri0KPcWmBf74ieSaYS+4MrWY?=
 =?us-ascii?Q?GgcpGzekVOvcIM/x2u+OpjewhcLLAj/+SoR9jViP9K57yclatjE/Swwew9Wx?=
 =?us-ascii?Q?ZjV4ztPIkYcIraCuCwQkn392M0+YnxxZqtunB6AgUdIX3QQf90tZiaf+99/Z?=
 =?us-ascii?Q?i1aPLGlSdJNraY3TUTY3DogFGoY5K6H1eIUQmsDzVRWSGgCEJMJjWfljHaTT?=
 =?us-ascii?Q?4P8Cym4CwYc9npZjUJH2L6lXiVlzEi5XlKVZPWnPvlyhOZYUAeClXPnDy/EA?=
 =?us-ascii?Q?3dbvimGquem08QHURGOIV3+3kq3lMV7UkEkbfvpkacaBfIvyorhljTSxpSDy?=
 =?us-ascii?Q?WeyISe4DR6cxYclffO2UCsSW6CQdgtkuGqrWbYdyDG4UmSFqtN0DsMre+w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7A8y2YUaBSYilA899xAsXlvIijLb8mq1chSOio/6de4guO0F1udv4Vuyf/kx?=
 =?us-ascii?Q?dwLEiWlA/RR5B63+kp9yNW4fQ7JVEzoDE4uaFBg0H46Ezs+8o6SijbcR8miZ?=
 =?us-ascii?Q?EMyd0nRfEy2t+SbDkZv2m15Ndxv/eYy2MNf7UWQ6gYsZtQHH2fmK7lZGnbNV?=
 =?us-ascii?Q?3IzQdvZl4eDrxFHua6FCb/czDR/ZgIUQECtRE5C+qKx43l1I433UkZEYDgQt?=
 =?us-ascii?Q?HmTJjYgdQqbM1UCwO+MyEVEY7EIbPYhA9XY+qj9R2ncRPPmSmfCF2svi+Gj0?=
 =?us-ascii?Q?4OffiEbFTKEaqgJPTgKqrMdLiAka5lFbbnXzrDJ64OeHSWaApcRZkgEdGOWn?=
 =?us-ascii?Q?90vpLBFEF9SXk/QlCmkPOAa0X0MGdBHqDpIpPVpsep92I64gTaaTuYupU6sx?=
 =?us-ascii?Q?D3J94COWCa2hpwo01akl7fXBcEcMPX8y2voteTgMJ8F30TLUrA01RDBGSBoj?=
 =?us-ascii?Q?zT+Dp4xfjtxAnrSpDvYqEJGlLgRTKuU4cgDA5SvwjqkDWxmvBcrDgQ6Bgfpn?=
 =?us-ascii?Q?GdvmoHoYBfa4kjzLgm+yr5H8RR1VP5/Ne8EFviKr4v4CK8EWt33iFsExv7da?=
 =?us-ascii?Q?uuUAuwWGpDyKX4TLclcGIlR0YzwvQxH4KnYBR1hyWQG6IxB7dzcwx1J6vC39?=
 =?us-ascii?Q?IsQiAw8hFOKhw8TiZmc/EwAnxceZdPv7r2BR6YjGW1HMFTVG9fqf7WtKy3PK?=
 =?us-ascii?Q?le722DD6xN3zOuPyXqvH85Oqzh/QcTBe2coWWi+hHpRbkdB8dkJvqupcAJuo?=
 =?us-ascii?Q?BqHtzT/3rO5A9ACLuvNMZhBCiW4Lzy677k7Tj6G1MAkz4eZnMrcQZnTV8bog?=
 =?us-ascii?Q?UelrhzNGP6Ac1QVhdywX/Q5S3mv0EJGgUgBlj95ioFrdhtlrVdE1yMDysK4F?=
 =?us-ascii?Q?QJDTMcto4J/BGJuedFgZYQN2z5xjEkjlaLURPMEMoDgaqbalkTVbICLIq/pE?=
 =?us-ascii?Q?rzEfpMSJyDq+3FYQoVBQTHMYZnZrwL3kWyO77dJuq+AXbpgSzrP+M3ljr1wU?=
 =?us-ascii?Q?1sGti6fUDF8eNCT1nSIUD4Qtt8YRQCHy+R8M+uioYhqyUqwLlMFatAk8mRqi?=
 =?us-ascii?Q?nA2lvf21eyn0cElaV+3qpzTWmHYXmb/tTbjde4rNngwP9dto3w9F5gdzBB0G?=
 =?us-ascii?Q?S+JW6zMbVorAOOcx0s4BJcqfP0Ks4gPlFC65DLCAtXN1Hyt4X3cTlYUuYXBT?=
 =?us-ascii?Q?JAfOOdw8BqiQc2iP9UBAsUkQFc57mmHkQyt2q9TqS/n16juFISK2ZifNLf9W?=
 =?us-ascii?Q?7cludZQpiBHv97Xe3Og3ZuwYdUae9qvXDb35YK80mXtrIqNEoTspZ2QXphh6?=
 =?us-ascii?Q?ICq6w61DtzloISm4nzdEUI1ZUisMAhqTis8QolCSlgp5JySYq4DPLlk2mR35?=
 =?us-ascii?Q?Z3fFpI5zli2Hk8t3Ln8aJ+hxSm41Mof1UJBBKQOulI2d8SETw4izQnUpOxh7?=
 =?us-ascii?Q?fqvZyXzIOzV2cQjzaBb0sSANyJwTy71nyljSdXhJuNLE40nyD0WGGLE754YE?=
 =?us-ascii?Q?l7BKCcik/8SkeL6gIckCI04YjMhsc50LkLzPG/MummcwYq5kmxdA11iyU+AJ?=
 =?us-ascii?Q?2EAmBa28froGgEr0VLKOlCckxw2ECJ/5so4xcOdgRyycOOJ851A0UC+Q2zdY?=
 =?us-ascii?Q?BDxZbN2hda/Fv9laenBbMf0DtiaVeBMBZri3hSgFSsY4AX5/abF6U58j3beP?=
 =?us-ascii?Q?OI1vv286ovFDzDweez/TQzj/AJYcLjtWmai1vi18nfgP+LGhRmjeFh6sQo1T?=
 =?us-ascii?Q?E/wXYVlgzIJKR0bEQY31RaIWsGg3mcI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03ac2fa-e540-4b64-8680-08de4920cb78
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 10:30:33.8418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3ZvsalM5s86HZ03JMvxrZTFdXn5ozRgGMVE2hysMXHkoDjjjZfqwpIon1gBfQ5czy6/4X2VjRzJsPChtAANUw8Ehs39Is7Fi4Bgr/4ZcnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
X-Proofpoint-ORIG-GUID: XzXXFrw67Yw24G7xnwuu2WkR5wDoWO--
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69564ccb cx=c_pps
 a=I+0PaAUBL5uRonxG4DgGUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=uE7DuzBMNn_X1jFd8tgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XzXXFrw67Yw24G7xnwuu2WkR5wDoWO--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDA5MiBTYWx0ZWRfX6a5c0TLCDA09
 aOxBGSy3uVkd95fKmZIyxHfT4etB9G8XFxDlmA8HIjJpMgQb8TuLwfPz+gwV6IVX1cU46dpnRoG
 6Bx9mqHSaZMxoDsGEVRE9RDpNml0x29/kJfW9NOXMo5G7mrTUmErloKQPipvjKu4IDpk/GPkgr/
 Zq7YOgjAU/9c44e2+yhtKYz2516NA1RNvYeObmA1Xp/dEuih/QBUeDWwsrVUBh1Nnqo4ECku8yO
 TOMN4PvUpR7cHNt7hLSKsJzMTjVDNiGqB+y6C1ZYxIGU/jWs1iwKM0yulIB12qO8qqPq1hMMhxY
 CIk0uNVc7rqeecxDazABVACr70DSnsAy6XZXcWxFFIoR+LrgcHV4ndt8S991KnDFXYxtNibc7BT
 uX0ggytjxSudXxElymOW8qz6igP+ZGMqnrPrTlp82aFZ9VwF0ryBeOE3LvoCT5TBrqloEMDHRk5
 AnUT97yFTdNGxfQlOhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010092

Use the new common CCI register access helpers to replace the private
register access helpers in the ov5647 driver. This simplifies the driver
by reducing the amount of code.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5647.c | 350 +++++++++++--------------------------
 2 files changed, 103 insertions(+), 248 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4db8c4f496..cce63349e71e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -529,6 +529,7 @@ config VIDEO_OV5645
 
 config VIDEO_OV5647
 	tristate "OmniVision OV5647 sensor support"
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5647 camera.
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e193fef4fced..24a160bbb079 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -20,8 +20,10 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -41,25 +43,23 @@
 #define MIPI_CTRL00_BUS_IDLE			BIT(2)
 #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
 
-#define OV5647_SW_STANDBY		0x0100
-#define OV5647_SW_RESET			0x0103
-#define OV5647_REG_CHIPID_H		0x300a
-#define OV5647_REG_CHIPID_L		0x300b
-#define OV5640_REG_PAD_OUT		0x300d
-#define OV5647_REG_EXP_HI		0x3500
-#define OV5647_REG_EXP_MID		0x3501
-#define OV5647_REG_EXP_LO		0x3502
-#define OV5647_REG_AEC_AGC		0x3503
-#define OV5647_REG_GAIN_HI		0x350a
-#define OV5647_REG_GAIN_LO		0x350b
-#define OV5647_REG_VTS_HI		0x380e
-#define OV5647_REG_VTS_LO		0x380f
-#define OV5647_REG_FRAME_OFF_NUMBER	0x4202
-#define OV5647_REG_MIPI_CTRL00		0x4800
-#define OV5647_REG_MIPI_CTRL14		0x4814
-#define OV5647_REG_AWB			0x5001
-#define OV5647_REG_ISPCTRL3D		0x503d
-
+#define OV5647_SW_STANDBY		CCI_REG8(0x0100)
+#define OV5647_SW_RESET			CCI_REG8(0x0103)
+#define OV5647_REG_CHIPID		CCI_REG16(0x300a)
+#define OV5640_REG_PAD_OUT		CCI_REG8(0x300d)
+#define OV5647_REG_EXPOSURE		CCI_REG24(0x3500)
+#define OV5647_REG_AEC_AGC		CCI_REG8(0x3503)
+#define OV5647_REG_GAIN			CCI_REG16(0x350a)
+#define OV5647_REG_VTS			CCI_REG16(0x380e)
+#define OV5647_REG_FRAME_OFF_NUMBER	CCI_REG8(0x4202)
+#define OV5647_REG_MIPI_CTRL00		CCI_REG8(0x4800)
+#define OV5647_REG_MIPI_CTRL14		CCI_REG8(0x4814)
+#define OV5647_REG_MIPI_CTRL14_CHANNEL_MASK	GENMASK(7, 6)
+#define OV5647_REG_MIPI_CTRL14_CHANNEL_SHIFT	6
+#define OV5647_REG_AWB			CCI_REG8(0x5001)
+#define OV5647_REG_ISPCTRL3D		CCI_REG8(0x503d)
+
+#define OV5647_CHIP_ID 0x5647
 #define REG_TERM 0xfffe
 #define VAL_TERM 0xfe
 #define REG_DLY  0xffff
@@ -81,23 +81,19 @@
 #define OV5647_EXPOSURE_DEFAULT		1000
 #define OV5647_EXPOSURE_MAX		65535
 
-struct regval_list {
-	u16 addr;
-	u8 data;
-};
-
 struct ov5647_mode {
 	struct v4l2_mbus_framefmt	format;
 	struct v4l2_rect		crop;
 	u64				pixel_rate;
 	int				hts;
 	int				vts;
-	const struct regval_list	*reg_list;
+	const struct reg_sequence	*reg_list;
 	unsigned int			num_regs;
 };
 
 struct ov5647 {
 	struct v4l2_subdev		sd;
+	struct regmap			*regmap;
 	struct media_pad		pad;
 	struct mutex			lock;
 	struct clk			*xclk;
@@ -130,19 +126,19 @@ static const u8 ov5647_test_pattern_val[] = {
 	0x81,	/* Random Data */
 };
 
-static const struct regval_list sensor_oe_disable_regs[] = {
+static const struct reg_sequence sensor_oe_disable_regs[] = {
 	{0x3000, 0x00},
 	{0x3001, 0x00},
 	{0x3002, 0x00},
 };
 
-static const struct regval_list sensor_oe_enable_regs[] = {
+static const struct reg_sequence sensor_oe_enable_regs[] = {
 	{0x3000, 0x0f},
 	{0x3001, 0xff},
 	{0x3002, 0xe4},
 };
 
-static struct regval_list ov5647_2592x1944_10bpp[] = {
+static const struct reg_sequence ov5647_2592x1944_10bpp[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x1a},
@@ -231,7 +227,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
 	{0x0100, 0x01},
 };
 
-static struct regval_list ov5647_1080p30_10bpp[] = {
+static const struct reg_sequence ov5647_1080p30_10bpp[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x1a},
@@ -320,7 +316,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
 	{0x0100, 0x01},
 };
 
-static struct regval_list ov5647_2x2binned_10bpp[] = {
+static const struct reg_sequence ov5647_2x2binned_10bpp[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x1a},
@@ -413,7 +409,7 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x0100, 0x01},
 };
 
-static struct regval_list ov5647_640x480_10bpp[] = {
+static const struct reg_sequence ov5647_640x480_10bpp[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3035, 0x11},
@@ -594,109 +590,29 @@ static const struct ov5647_mode ov5647_modes[] = {
 #define OV5647_DEFAULT_MODE	(&ov5647_modes[3])
 #define OV5647_DEFAULT_FORMAT	(ov5647_modes[3].format)
 
-static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
-{
-	unsigned char data[4] = { reg >> 8, reg & 0xff, val >> 8, val & 0xff};
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = i2c_master_send(client, data, 4);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
-			__func__, reg);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
-{
-	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = i2c_master_send(client, data, 3);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
-				__func__, reg);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 buf[2] = { reg >> 8, reg & 0xff };
-	struct i2c_msg msg[2];
-	int ret;
-
-	msg[0].addr = client->addr;
-	msg[0].flags = client->flags;
-	msg[0].buf = buf;
-	msg[0].len = sizeof(buf);
-
-	msg[1].addr = client->addr;
-	msg[1].flags = client->flags | I2C_M_RD;
-	msg[1].buf = buf;
-	msg[1].len = 1;
-
-	ret = i2c_transfer(client->adapter, msg, 2);
-	if (ret != 2) {
-		dev_err(&client->dev, "%s: i2c read error, reg: %x = %d\n",
-			__func__, reg, ret);
-		return ret >= 0 ? -EINVAL : ret;
-	}
-
-	*val = buf[0];
-
-	return 0;
-}
-
-static int ov5647_write_array(struct v4l2_subdev *sd,
-			      const struct regval_list *regs, int array_size)
-{
-	int i, ret;
-
-	for (i = 0; i < array_size; i++) {
-		ret = ov5647_write(sd, regs[i].addr, regs[i].data);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
 {
-	u8 channel_id;
-	int ret;
-
-	ret = ov5647_read(sd, OV5647_REG_MIPI_CTRL14, &channel_id);
-	if (ret < 0)
-		return ret;
-
-	channel_id &= ~(3 << 6);
+	struct ov5647 *sensor = to_sensor(sd);
 
-	return ov5647_write(sd, OV5647_REG_MIPI_CTRL14,
-			    channel_id | (channel << 6));
+	return cci_update_bits(sensor->regmap, OV5647_REG_MIPI_CTRL14,
+			       OV5647_REG_MIPI_CTRL14_CHANNEL_MASK,
+			       channel << OV5647_REG_MIPI_CTRL14_CHANNEL_SHIFT,
+			       NULL);
 }
 
 static int ov5647_set_mode(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
-	u8 resetval, rdval;
+	u64 resetval, rdval;
 	int ret;
 
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_write_array(sd, sensor->mode->reg_list,
-				 sensor->mode->num_regs);
+	ret = regmap_multi_reg_write(sensor->regmap, sensor->mode->reg_list,
+				     sensor->mode->num_regs);
 	if (ret < 0) {
 		dev_err(&client->dev, "write sensor default regs error\n");
 		return ret;
@@ -706,13 +622,13 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &resetval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &resetval, NULL);
 	if (ret < 0)
 		return ret;
 
 	if (!(resetval & 0x01)) {
 		dev_err(&client->dev, "Device was in SW standby");
-		ret = ov5647_write(sd, OV5647_SW_STANDBY, 0x01);
+		ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, 0x01, NULL);
 		if (ret < 0)
 			return ret;
 	}
@@ -742,32 +658,25 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
 		       MIPI_CTRL00_LINE_SYNC_ENABLE;
 
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
-	if (ret < 0)
-		return ret;
-
-	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x00);
-	if (ret < 0)
-		return ret;
+	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00, val, &ret);
+	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
+	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
 
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x00);
+	return ret;
 }
 
 static int ov5647_stream_off(struct v4l2_subdev *sd)
 {
-	int ret;
-
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00,
-			   MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
-			   MIPI_CTRL00_CLOCK_LANE_DISABLE);
-	if (ret < 0)
-		return ret;
+	struct ov5647 *sensor = to_sensor(sd);
+	int ret = 0;
 
-	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x0f);
-	if (ret < 0)
-		return ret;
+	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
+		  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
+		  MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
+	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
+	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
 
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
+	return ret;
 }
 
 static int ov5647_power_on(struct device *dev)
@@ -788,8 +697,8 @@ static int ov5647_power_on(struct device *dev)
 		goto error_pwdn;
 	}
 
-	ret = ov5647_write_array(&sensor->sd, sensor_oe_enable_regs,
-				 ARRAY_SIZE(sensor_oe_enable_regs));
+	ret = regmap_multi_reg_write(sensor->regmap, sensor_oe_enable_regs,
+				     ARRAY_SIZE(sensor_oe_enable_regs));
 	if (ret < 0) {
 		dev_err(dev, "write sensor_oe_enable_regs error\n");
 		goto error_clk_disable;
@@ -815,23 +724,17 @@ static int ov5647_power_on(struct device *dev)
 static int ov5647_power_off(struct device *dev)
 {
 	struct ov5647 *sensor = dev_get_drvdata(dev);
-	u8 rdval;
 	int ret;
 
 	dev_dbg(dev, "OV5647 power off\n");
 
-	ret = ov5647_write_array(&sensor->sd, sensor_oe_disable_regs,
-				 ARRAY_SIZE(sensor_oe_disable_regs));
+	ret = regmap_multi_reg_write(sensor->regmap, sensor_oe_disable_regs,
+				     ARRAY_SIZE(sensor_oe_disable_regs));
 	if (ret < 0)
 		dev_dbg(dev, "disable oe failed\n");
 
 	/* Enter software standby */
-	ret = ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
-	if (ret < 0)
-		dev_dbg(dev, "software standby failed\n");
-
-	rdval &= ~0x01;
-	ret = ov5647_write(&sensor->sd, OV5647_SW_STANDBY, rdval);
+	ret = cci_update_bits(sensor->regmap, OV5647_SW_STANDBY, 0x01, 0x00, NULL);
 	if (ret < 0)
 		dev_dbg(dev, "software standby failed\n");
 
@@ -845,10 +748,11 @@ static int ov5647_power_off(struct device *dev)
 static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
 				      struct v4l2_dbg_register *reg)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
-	u8 val;
+	u64 val;
 
-	ret = ov5647_read(sd, reg->reg & 0xff, &val);
+	ret = cci_read(sensor->regmap, reg->reg & 0xff, &val, NULL);
 	if (ret < 0)
 		return ret;
 
@@ -861,7 +765,9 @@ static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
 static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
 				      const struct v4l2_dbg_register *reg)
 {
-	return ov5647_write(sd, reg->reg & 0xff, reg->val & 0xff);
+	struct ov5647 *sensor = to_sensor(sd);
+
+	return cci_write(sensor->regmap, reg->reg & 0xff, reg->val & 0xff, NULL);
 }
 #endif
 
@@ -1089,33 +995,27 @@ static const struct v4l2_subdev_ops ov5647_subdev_ops = {
 
 static int ov5647_detect(struct v4l2_subdev *sd)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 read;
+	u64 read;
 	int ret;
 
-	ret = ov5647_write(sd, OV5647_SW_RESET, 0x01);
+	ret = cci_write(sensor->regmap, OV5647_SW_RESET, 0x01, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_read(sd, OV5647_REG_CHIPID_H, &read);
+	ret = cci_read(sensor->regmap, OV5647_REG_CHIPID, &read, NULL);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&client->dev, ret,
+				     "failed to read chip id %x\n",
+				     OV5647_REG_CHIPID);
 
-	if (read != 0x56) {
-		dev_err(&client->dev, "ID High expected 0x56 got %x", read);
+	if (read != OV5647_CHIP_ID) {
+		dev_err(&client->dev, "Chip ID expected 0x5647 got 0x%llx", read);
 		return -ENODEV;
 	}
 
-	ret = ov5647_read(sd, OV5647_REG_CHIPID_L, &read);
-	if (ret < 0)
-		return ret;
-
-	if (read != 0x47) {
-		dev_err(&client->dev, "ID Low expected 0x47 got %x", read);
-		return -ENODEV;
-	}
-
-	return ov5647_write(sd, OV5647_SW_RESET, 0x00);
+	return cci_write(sensor->regmap, OV5647_SW_RESET, 0x00, NULL);
 }
 
 static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
@@ -1138,74 +1038,6 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
 	.open = ov5647_open,
 };
 
-static int ov5647_s_auto_white_balance(struct v4l2_subdev *sd, u32 val)
-{
-	return ov5647_write(sd, OV5647_REG_AWB, val ? 1 : 0);
-}
-
-static int ov5647_s_autogain(struct v4l2_subdev *sd, u32 val)
-{
-	int ret;
-	u8 reg;
-
-	/* Non-zero turns on AGC by clearing bit 1.*/
-	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
-							: reg | BIT(1));
-}
-
-static int ov5647_s_exposure_auto(struct v4l2_subdev *sd, u32 val)
-{
-	int ret;
-	u8 reg;
-
-	/*
-	 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
-	 * clearing bit 0.
-	 */
-	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_AEC_AGC,
-			    val == V4L2_EXPOSURE_MANUAL ? reg | BIT(0)
-							: reg & ~BIT(0));
-}
-
-static int ov5647_s_analogue_gain(struct v4l2_subdev *sd, u32 val)
-{
-	int ret;
-
-	/* 10 bits of gain, 2 in the high register. */
-	ret = ov5647_write(sd, OV5647_REG_GAIN_HI, (val >> 8) & 3);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_GAIN_LO, val & 0xff);
-}
-
-static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
-{
-	int ret;
-
-	/*
-	 * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
-	 * which we leave as zero (and don't receive in "val").
-	 */
-	ret = ov5647_write(sd, OV5647_REG_EXP_HI, (val >> 12) & 0xf);
-	if (ret)
-		return ret;
-
-	ret = ov5647_write(sd, OV5647_REG_EXP_MID, (val >> 4) & 0xff);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
-}
-
 static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov5647 *sensor = container_of(ctrl->handler,
@@ -1239,27 +1071,42 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_AUTO_WHITE_BALANCE:
-		ret = ov5647_s_auto_white_balance(sd, ctrl->val);
+		ret = cci_write(sensor->regmap, OV5647_REG_AWB,
+				ctrl->val ? 1 : 0, NULL);
 		break;
 	case V4L2_CID_AUTOGAIN:
-		ret = ov5647_s_autogain(sd, ctrl->val);
+		/* Non-zero turns on AGC by clearing bit 1.*/
+		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(1),
+				       ctrl->val ? 0 : BIT(1), NULL);
 		break;
 	case V4L2_CID_EXPOSURE_AUTO:
-		ret = ov5647_s_exposure_auto(sd, ctrl->val);
+		/*
+		 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
+		 * clearing bit 0.
+		 */
+		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(0),
+				       ctrl->val == V4L2_EXPOSURE_MANUAL ? BIT(0) : 0, NULL);
 		break;
 	case V4L2_CID_ANALOGUE_GAIN:
-		ret =  ov5647_s_analogue_gain(sd, ctrl->val);
+		/* 10 bits of gain, 2 in the high register. */
+		return cci_write(sensor->regmap, OV5647_REG_GAIN,
+				 ctrl->val & 0x3ff, NULL);
 		break;
 	case V4L2_CID_EXPOSURE:
-		ret = ov5647_s_exposure(sd, ctrl->val);
+		/*
+		 * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
+		 * which we leave as zero (and don't receive in "val").
+		 */
+		ret = cci_write(sensor->regmap, OV5647_REG_EXPOSURE,
+				ctrl->val << 4, NULL);
 		break;
 	case V4L2_CID_VBLANK:
-		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
-				     sensor->mode->format.height + ctrl->val);
+		ret = cci_write(sensor->regmap, OV5647_REG_VTS,
+				sensor->mode->format.height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
-				   ov5647_test_pattern_val[ctrl->val]);
+		ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
+				ov5647_test_pattern_val[ctrl->val], NULL);
 		break;
 
 	/* Read-only, but we adjust it based on mode. */
@@ -1435,6 +1282,13 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto ctrl_handler_free;
 
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap)) {
+		ret = dev_err_probe(dev, PTR_ERR(sensor->regmap),
+				    "Failed to init CCI\n");
+		goto entity_cleanup;
+	}
+
 	ret = ov5647_power_on(dev);
 	if (ret)
 		goto entity_cleanup;
-- 
2.43.0


