Return-Path: <linux-media+bounces-62249-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAZNLwqjDWqu0gUAu9opvQ
	(envelope-from <linux-media+bounces-62249-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:03:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3812758D349
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79BA130F0392
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9DE3D3481;
	Wed, 20 May 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Ese5H0Jf"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021086.outbound.protection.outlook.com [40.107.51.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C8F3DA5A7;
	Wed, 20 May 2026 11:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278235; cv=fail; b=ctn1EkIkwYgutswORdnROFy6736kP6ADT2Hdf5+d/QeURarlw2tyHfr9kdBpRPmzVoIT19M2Ljav8DjOhUfyVtQDYWorhHWugqQzWgZ9HBbP/4l36+P4q/W1ZVNS+t7RJsgaX/XtHr2byMEjizVbnndtyId02sH5/YAsqtjSers=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278235; c=relaxed/simple;
	bh=TGQgi0dP3In+Av1mVkB0VbIR/6QAOJJwLUR7oqucZQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JwBo0bg1Q6A+xdhcG7jPFeCd3fXBawLj8z3Mx808IF0CW0VoVA/0LQPtsP/ZuSKuOowuSgDMhk+9LVL7b5EwJV/BRiaSmzJnPz3qmL7Mem5F/3WjXhFnwop0C8iAPwyAwf3Nvg3+B481sKAYq/IzQGcg2R5fW1YQX0y7l6fJcKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Ese5H0Jf; arc=fail smtp.client-ip=40.107.51.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8YHFnqMcBpKlzzuLja0PKuBWRinaXN5i7Cn7KzvLDzHgwl1hP6i/voBvn5cDCINwM5DM01rBUQU7qPTb3/OiLZsp+VeQ+gJ7QgJvYhDtBE0uyU+Pg2R2hWZp3viHpAj9sdEFBABcq/Y+SgA1DuQGp/MF9TjyMdIXRnr11rB++JTYaO8uFl3SRfIi/F34So/R5z6MUa7wLYtSTe0zvs6pfub7gcvGFk4csDwF71iVIcIDahiEo78mAWCksnYKj7pHr1x1Vgq4bNdeSJ7j8STVagScsiHpoWyyMUi7tRJSL6qjb8tjCbJOTABnZ+BatUzOZiBj2gjAlt4pcQyVKjEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQIgCPXRn+hibMSZbrWU2/N/yRMqbseGXd0OX8BKfZg=;
 b=oXpAjrHO7c7tx9AtSAuM/rj4KTmZP3SwZdNmy3v3wJmNWXRTXlLFwaGIOCIle5DlskK8szFJUsF33o1C5bAQqyuuAndcgeO6BKyKgti57APeLWtbgFXGANdsqMJTMCyKjBlsLISz14CKr84FjzRQ3lJRV+H0p1jPbaxowYKQUCnjpclkkUSvdUriBuou/n3K1t1q32yyckVhSInukgM3H/nSk/xuDJ+bgBJ5oP923N40oAySBBU0Y961a9TMKxoP290okUbqyUi5vMFerv2l8oy3yarPRarYqsohFjYtUTysnbx0Fr0FXJm4G5Poz7+JETInANIQuCu1l4ivleb0kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQIgCPXRn+hibMSZbrWU2/N/yRMqbseGXd0OX8BKfZg=;
 b=Ese5H0JfEVU/wIIHfNErFYeUCB5OZo2dbqMu4jh32xGOuZ9bFJ29AHbC2eAyrHnpVfEw5TbhDLfKpruTFSPZc+Z7JP/H0TO/GqEc0I7tshp6lwBFAXqgJO4LXUiZsAuFU9rUMyqgQ/DdGg4OxqFhX0I04cUUCz8xaWhHXBaviycmiQVBE+KyUHESozFJ6jaelhim8DRkNXpUPFjpOG51BXPayh5lMjxEpfKGKEk1btDnnvofrFqMYAOPFYXmvd3G1ieVKAURB9cnGdqlijmblggeH4HFrUALeVRAlWiyt0w7NkLe7VyTxNFnY/W6GHvwuXaPXb/Dske4H1TR3ixNxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAUP287MB5499.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:57:11 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 11:57:11 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: media: i2c: Add imx576 sensor
Date: Wed, 20 May 2026 17:26:33 +0530
Message-Id: <20260520115641.11729-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::12) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MAUP287MB5499:EE_
X-MS-Office365-Filtering-Correlation-Id: ee00e837-5cca-427c-d194-08deb666ecc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014|3023799007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p3zMZN/5Mo84GG2xiiANjllY/y9jO2Xg9eo6rlGMavv8vjOEftJ9vMjvhr6ewf8GmR2YvvRqBB/DFGnvd0eATnfHp/7fQEItzIjSRKyKRYcUvPQGYBs3kwJu41tjz+OuDykAspmHSpNWwfMvgDFRGJzNa9hJPSetC1uRn+63ktTOkmavdM+2wep+N9GJkVx4Kb1j2z5v5ipHpbFDPx7A5/TVD+RxZedyDSrgIQpyZM6MtxFn21gByHj+WZkyIdHQHPiN/Uvnxe0YY7BfZSWmqivW1I6EYVlh1X3okLFRDYr/f3yTJBV8G0WNKuWBIdydXBy8K1aMBXavtqKJCh64tONr2YzFVSN/c21KXalH90qjagqFc2SCI39jKQBW3SE/MgWS+fc3KTsmRlSaBgba+HB4nGi+ccQOI4e6eFduIa2V177qMAnUNkw7366JbVCKyQnmQM7tGHyrP7b3Xn8K/5xt9BSSxtgVwlO6Lgx43XpQ72IJtVcinpkWASE1lrGB5mBYxU5nhY8X9QKBFnfnKnm3YkHRwzuj0RE4jOQ9wS4KWFRsUq2jY4ifs+uy2JIzCCMlsyVacn0jgatD+8DgerYIzBBjW/lSHeX9xlGwMHgQsTxdSBT9yTCRoOkojhFFz6oltAZF0eupiVnJwuRiAHJ4sK+lSZRPkOxp1ptVZSnZI5LmxiI2KywU5LilPkYP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(3023799007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUo3UGVyYnl4SkhMM0E2UWMvTldjQnExY2pkdUFFbHBpOWhLOHJQOFF2VmxI?=
 =?utf-8?B?Y2RySGZtVWtIdjYweGxydVpKTFJsbGZ4ZStjemdBcHBGRG9EaVU2MlpaSUk2?=
 =?utf-8?B?ZS9YelR2dWVVNzJ6ZFVzMHZmb2ljaUVtQ2lmaWNaR0xweWM3WXdkdEd4UDJr?=
 =?utf-8?B?RmgvWVY3NzNISVIyTVNSRjNRc2JlZXhZOHdibExsTzJFY0NPL1F3MllsUGNK?=
 =?utf-8?B?VSsvR3FqMlp6cTdIYXFuVEJpQVRCWjlRT1YxZjkrRkpjVUJBTkRGVkU5Mnh3?=
 =?utf-8?B?dVNmUytJS3oyU2hORWhUWXgxTktFZkhuMlcydDNhS1hnSSs0aHBrWWJ0amlx?=
 =?utf-8?B?WERidzFsZ2xaRml0dk5VUEZUQnhzRGNFNEdjblJzZTR2NGZqMGwxVTZBWkNB?=
 =?utf-8?B?d21OcFYzS29OeTVwdjQyaW5vZHBobmNiek1BaFhVc1ZYNWdqazhENUZ2Ui9n?=
 =?utf-8?B?Y0xtazBnOTQ1YW0xM3Jtc1Q2ZHNpY1gwNlQrbTFIK3RGRURHSFdDVXM5NXh3?=
 =?utf-8?B?anBwMzF4S1pTQUJtdUJMdTBHTHJKZ296RlArQnZSSXN1UnB3YWpmbi9rTGtR?=
 =?utf-8?B?TDBrOXltWXZQYXB0NGNjQ3lWVzljVjluWXE2cGxrMTQyNkdHR1MwNjVoY2oz?=
 =?utf-8?B?YnBlVFJXZXFuY05JMmZ2cmNHd1FyMVBVNUxKZUgyNHp5bzZ5Q3Fob1Q3bU5z?=
 =?utf-8?B?cTg4SHFJMEFpS09KRGk3MlMrZHVlV1paWnZBMzJBZU1BNzNseWRXblZpZ2lF?=
 =?utf-8?B?Z0VpVmQ1NlVKSHk5bTJuZUFvQ0JsOXFuWFVCMEdMdk9mVDRCMmpkVldBVVRW?=
 =?utf-8?B?c1MxdHk0ZWNkK3V3cHYvVk0xbFVQaE91Z0dNNXpuUkZrSmxJVzU4RFpUYWsw?=
 =?utf-8?B?WkY0S3hzVnI5Y0poNTQ2aGhpY1RKVGluMk1qeFcvbWVldHBVVmtVK0ZmcXNJ?=
 =?utf-8?B?UERMOS9OaUZQR29pUUpSckpwd1JXdVlhVHlOeStMRU4zWERyOWd2WFdoSk5U?=
 =?utf-8?B?WkNRMXlnRXhDMXc4MmRnbjNlUExwSXhSQWU0cDFLbmlYMjduLyt5VG51bVc3?=
 =?utf-8?B?cE5WSUFJb0l5VjR2L1NiTis1NnRjaEdYNzFidDRIaGd6aEhDdHl5eVR3TTVJ?=
 =?utf-8?B?WUNTb0RnT3Q3ODc3bzdHNGNKdWg2elgwZlRGTFlrOVBDUWJWSUhISHpGbVV2?=
 =?utf-8?B?VXpEVDdYZWU5aTJ3bUNob0FXcTBZZ1Q1QUZ2ZXdvejJwVUVHTUt5WFpqQW5P?=
 =?utf-8?B?Ny9URjdpUTB3SW56VHFYRUNCakNzaG5jYkZLY3NFMkpEWWlDaHhxYXhhc1N2?=
 =?utf-8?B?eWZOQXNNM1g4Ymx3OWQ0b3o2NEIwZ05wOXJaK0tWclA4L2VPQ1dsUHF2SEY4?=
 =?utf-8?B?VnBSK1IwWWxrclJhd1NXR2RCdC9PMk95cDRacy9yUjNWck1qOExOTWhJdGl1?=
 =?utf-8?B?ZkJsL3AwcUpiKzlRNnNqSXlPZG1pVHdDcklFMVVkbmxVQmxjNEJjQVhBaGxI?=
 =?utf-8?B?WmdtSVBWT2QwdWlreFFhM29VV1FqeGdvTkdpYXhhdTdqWE83akdyb3NtZ0Zh?=
 =?utf-8?B?QzA0TzJEWGhBaytmb0hyUURvRFVJdlFacUpDRjFoR1BCdzdXM0EvM2ltRm9r?=
 =?utf-8?B?RWI5YTRrbHlFdVN1bFlPRlVNcVNuUlJuZTdKSkNka2VxVHN5MVh4d2Z6UURG?=
 =?utf-8?B?d0hQY3pNdFdzZWZwcXFYVUhKMTZxb3JEdCs2anlhWFVGSS82TVFrT055aklU?=
 =?utf-8?B?Ui9jckxvRjhKdlhzV0pRNUVpK3F1OCs5MzJwVmdYejhKbDBXWVhmSlZQb2pi?=
 =?utf-8?B?Zk9JMzBsY3dJVFYwZFRFM2ZEUEVPMG5WK2F4Tm15bFBqbU9SZEw0ek1oa3NS?=
 =?utf-8?B?YXRPQmVwSTdqTkQ4amVOeUx4UzQ0UmNhaGdwL2Z2NnJkbUhUUFprMEp1anhU?=
 =?utf-8?B?akNMWUcvMXNUeGRrclpNZ0hHTEtvSmpQeDB6VWloR1I2WHBGK1NIWTBqUlIw?=
 =?utf-8?B?MTdENTEwb2RuZ1dlcS9DNElxek84MzlJMHh0a3lHUTNYUUVaOFg0Kzd1UHJJ?=
 =?utf-8?B?VU1jNHc1eEM3SGh0L0FxcVF3VG96MmlDaXRGemYyV3g4WUFrOFY3SzdsdHh5?=
 =?utf-8?B?MjRmVEt0ZGp5a09LSHlsQ294cjlBNkttWXhqdGtiaWxIUHVrbXJiY1k0ME9p?=
 =?utf-8?B?aW1hNDVITVZpbHlnZUtQYW9aT0NESExMT25vQWozWEpKQ3JoMkdjK1lYeUxq?=
 =?utf-8?B?NStUSnB0YlhkZUd3VmJlVXlaZy9RZmhMZ2xIL3B0QktzckRRVFk3SGZVKzl3?=
 =?utf-8?B?SlJOZXNQUk9hZ2NiSVlkRUJnZnFVNEl2TCtHVHh5VEs4YzBWOVAyYkRKb3hu?=
 =?utf-8?Q?pcf8pgNNXH0UOun/gK92eVtc9f8gu3/uBwhJn?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: ee00e837-5cca-427c-d194-08deb666ecc5
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:57:10.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WTz12KxwOtzloyvL1p8+fCtchYlvUm/LMa2LB3FTnNpUmDbNYtWUinjzzYplq+FSjKAfPkWmuuyZ2MlahjCL2q7Xy/ILgnTvG/MBY+xTHY0k3bkOh6+EPZ5MPWBEvHW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5499
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62249-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,ideasonboard.com,windriver.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,siliconsignals.io:email,siliconsignals.io:mid,siliconsignals.io:dkim,0.0.0.10:email,devicetree.org:url]
X-Rspamd-Queue-Id: 3812758D349
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

Add bindings for Sony IMX576 sensor

Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
---
 .../bindings/media/i2c/sony,imx576.yaml       | 111 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
new file mode 100644
index 000000000000..b74253004fae
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx576.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX576 Image Sensor
+
+maintainers:
+  - Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
+
+description:
+  IMX576 sensor is a Sony CMOS active pixel digital image sensor with an active
+  array size of 5760(H) × 4312(V). It is programmable through an I2C interface.
+  Image data is transmitted through MIPI CSI-2. It supports RAW10/RAW8, COMP8
+  output formats.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx576
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: INCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.05v)
+
+  dvdd-supply:
+    description: Digital Domain Power Supply (1.8v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@10 {
+            compatible = "sony,imx576";
+            reg = <0x10>;
+            clocks = <&imx576_clk>;
+            reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&vreg_l3p>;
+            dovdd-supply = <&vreg_l6p>;
+            dvdd-supply = <&vreg_32m_cam_dvdd_1p05>;
+
+            orientation = <0>;
+            rotation = <90>;
+
+            port {
+                cam_out: endpoint {
+                   remote-endpoint = <&csiphy3_ep>;
+                   data-lanes = <1 2 3 4>;
+                   link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ff935e197c21..1b15fa355e8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24856,6 +24856,13 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c

+SONY IMX576 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
--
2.34.1


