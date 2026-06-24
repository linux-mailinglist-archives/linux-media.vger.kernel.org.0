Return-Path: <linux-media+bounces-65572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DI7kOfUNPGpijQgAu9opvQ
	(envelope-from <linux-media+bounces-65572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:03:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 489A66C0364
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 19:03:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=eUspIE+G;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65572-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65572-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 388503035A96
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 17:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B51352010;
	Wed, 24 Jun 2026 17:00:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257F535201B;
	Wed, 24 Jun 2026 17:00:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320420; cv=fail; b=dOB5jta7Zd72XhNNrvd4tU15zJC1fMw6Gu9Xj/SndHT5daN59wAKS86p5Nyzps+zk6dRu1eqiwwWG7+4IrK6sq0eTm+wXWIZv5ggZaToUAl8KI0lzm1moG47E9H6UaR4q6kGsv7zbbR5yrjYHRDMgYGVm5LujArQUng5HTqJMqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320420; c=relaxed/simple;
	bh=+lNv+My9P75ElujoWAlRcKkrC+qQ6tPl/PEZyOCnE5I=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=SsqetpWSYbnrNJf63c++HEHPAOu4coGa7Bt8Q8ZCSCAs8XUIIa9wAZ3nId4jterkfn6qJic4RvnqEEFr1WkhWFtKqBWlaA/bH1MQ5PO6x2ELJ84+jz1setVSUiwAt9ba/kltpfG5FdZrKNnurFUqv2J89qMrOma130GbvAkTdys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eUspIE+G; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQPrM+bjSU8mpRbnuNVuJFyEmENxDTnbO1z7g+YoHT0P5ZpEmldT5M/oHW6bJ2e9pDkagqCwf9DoxnltWTOWLbHwwKG+TazgZThw4zaR4MwDOUCPEQ6L08oW4ySjMKwt8+IZU7MRHP5IYfPi+uANiBsjwiQ38J7/stEkbmQvMDAZGwsnwrIZbPp5hUFN77H2c46ic9FuPamlDFNuBSiLWOUk7snug2qNu6TnEd+e/WrXe6t7kz0wLfca06rOrkrDBnoseb0Kz/QGBvY2llD9rN3Xv6z3q0VD9ngQtWbuZVS+RD/oljJJ12iaAstN3QMH4ynX8HQhs4NhC5MxF5aJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+yvGJjC4aA694QulIRt96TOscs3AtO5NR7GQ0fBl5o=;
 b=ooe8EdOr9f1rIzA1BHggfg1tRqsJZio0HX2tRdS/SZNQPCqK0H3L+lQYPqF06GT91ROLBHJNE58jdqHJJeZMnS8QFThWQ/SQIvwDhBIOob5iDZ9uKptR0nJLR6g3PTQ+AYK59zp0KuKZzox3nHZZIKTAjIrl8W/PuoDdrRlp2GfyDM5UacUPdMPYVm3CzX2rUw05FEKqDuPdEV8EdUb33gdHFIIS5pHVaF8aBkZyjdnQJQ/rSAo0FLfqH8zGf+OrHSZwu6uNHIDdACk8uJA/ZVxZGPzUf8R+CGpmto8TcCLjCGVh7areBPX7UPQoj9X4IxTgVrH/5gv1uuqYgUhvDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+yvGJjC4aA694QulIRt96TOscs3AtO5NR7GQ0fBl5o=;
 b=eUspIE+GvBpxbAW9KIf5BzH/iFmwbeXEeM84129IJTMg9NWLxzlWaNPA+i4wOsDZz6poUBVKICUxxRS0Jnt9lOMNxCaGy9B/LUzPWza+kbEuH2UsLTWf7FTU/4CN7cfFyvvIduq7d696qK7oiSjRgmdO9RHNRwNroz7YMDEu+gkoUGrNMXKG221bt+mI3gkEDnDlbElh6JKQU/oHXxbr8GxWprQFZU8kE60pEKlk9Nbfi0HljDh2uUq7WGkhxuE+jx19YKYJI4VfQNGmwp/qheMziyypAPqmHn60VES0aIRNh0ZaZoe0izfSLDSxRDNCtRIE5MohXENLZ7O+tMOijw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11642.eurprd04.prod.outlook.com (2603:10a6:800:2ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 17:00:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 17:00:15 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v2 0/4] media: add and use
 fwnode_graph_for_each_endpoint_scoped()
Date: Wed, 24 Jun 2026 13:00:08 -0400
Message-Id: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABgNPGoC/02N0QqCMBRAf0Xuc4u7pSt68j9C4rpdc0FONjND9
 u+pEfR44HDODJGD4wjnbIbAo4vOdwuoXQampe7GwtmFQaHSqBWK5nWNxvdsRWGp1nleSCQJi98
 Hbty0tS7Vl+OzvrMZ1sBqtC4OPry32ShX79dVf91RChR0OFokMkj6VHZTvzf+AVVK6QPXTjnEs
 gAAAA==
X-Change-ID: 20260620-fw_scoped-5dab644510a1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782320409; l=1553;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=+lNv+My9P75ElujoWAlRcKkrC+qQ6tPl/PEZyOCnE5I=;
 b=seMaerYRxvbJPVaLL1xD4h2Itn6d86EuRyyEO1mU3S3xhpGayomua0BuCsQxH0nulguea/ckS
 67ga6ND6N6aB4f88Oxa+82a1JlZQnShqWkp8aF9JeO5JS52mc7Bei1A
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0105.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11642:EE_
X-MS-Office365-Filtering-Correlation-Id: 499fccd8-c8bb-43f1-58c7-08ded2120fd5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|921020|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
 lJm43ahbywKcNdrziUAi2TYW0vJ+wGQY8edI18iZSi4Sk2Ez7nhJHZNx3AdwuV9aU4JDF3lltfjtin/zCbJHet76ub/3uiqbDiak4pxBc4yXfH3BZ8H1pN/k7wNnJmABelFFlTa8NtJq6k9+QkUr6x7sQqAzLSBbuE4lI+E+d/aRyCWTwLgeXoP/zk3Q/li9w56w6BY6lovOxTkswRLQX/ciOfuyJfumXcZNebel3uwOC81ijMJwPawvzM9iqG/yDl39XAoJUU9dq44bGuV1ne+PIWHFUFVvfA9XzIbu8FMkOMhsST8g3mLXnVGhhoT7YI5P9dRSZXwKyUzck7VEgazyYKO7en7l7/ruJ+LVnk8BiTmGdqFazeZLR7GHdo98XtPSFT/KH3C88kM/a40sGTQq6D2lKfz13tgGg/kSsdeOkroQkZ6g13Ic8AGvbl2247sigmBzHkWYlhu8Mi3dJty+lVjAqTDO+Zbd4b+PSeNVv91imwrJsirMGFVrv1fKIJGZmFnNyKQpPDVnDG2dwbB3ZY9XAFZPOU4N9FGrrT19FQHAwjLJ+jPEBVe6dXDEMnAIaxldRAsLKQ+Tc8fLlwo3t3w4Wt38ZsaoOkwBrAGrCc4uUDX3FkxmiZAbfc55NiSU+iY5QTfwvISUiPjoe/YcXshkshkO5ilhIhiJO04=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(921020)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?T084cTZaUnhseFUxd0d2aThvSEMrUTJWOS9JUjBTS05wUytxMjBhY1BuZUh3?=
 =?utf-8?B?QWZOblY1RmM2MDhRYmRPU015MjJob0YvcnlYVUZuWjZnaFdDclM5ODhPTk5u?=
 =?utf-8?B?MHFFZ0JRZ2N5b1R1MVRuTWdGZzFKNFlVZW5pbE55UkZoOHNGQzROWUtBWW9q?=
 =?utf-8?B?S01jNmxEQWVFL0pYWHFwa3l2bk9hMnJqMFB5aFFLSGhtc3AwVjJzWi9iY2xP?=
 =?utf-8?B?Rk1FLzlpcEVtU2dnSnBiQ2NjdHlRZFJQQ0YrS0lXbjc2SkhWUEZFTFhCOVor?=
 =?utf-8?B?L2t3UmwyVEoxN1BuNmxZZ25OeUowUlg5eVBXdzRpRXp1SnRyakx1OW5uUDVH?=
 =?utf-8?B?WS9xc1VBQkdYTXpldmplamZXaHYzRWRzYUxEWUV5SDRMTE9PUDFqMTY3VmY4?=
 =?utf-8?B?dHR3N1pndkl3WFRJYXpiUTZza1pMMmF3SEFYdUtLOEtlTnV6QkFvODlIT0F4?=
 =?utf-8?B?OUlZeEZGeEM3WkluS2VFOHhIc3lEdnJLV3hEeUN2Q1Z4SEM5QlNWTmtTbll0?=
 =?utf-8?B?U21TclVxTitoNmVoVHNmUjZUeFl2RXdGQ1JLNWdqSlpMbmc0RjcrU1VxL3A0?=
 =?utf-8?B?N2xXTVl6WlpCcG1NamhQVFpFSXovTWlnR2wvcEdZbGxIZmVTbHFDYnJCQi9w?=
 =?utf-8?B?anBSVFlpRmN3dlRCRUFLYlRTNlYrK2JqcjA4N0pkMGZ5NFdnMCtoM1N6ZUo3?=
 =?utf-8?B?ZTZzOUZ4QXBSc2ZaRHFiZ3YwM2xVVGJzRFdkNW5DZ2x4Y3pzM1RJMjZtK05l?=
 =?utf-8?B?VHlGTVdnalV6ZDVodWtpU3RuN3JJT2xXSlhkejdZTUF3UzNMNGpzUkJlSVNF?=
 =?utf-8?B?SFpJVkxZQWVlWkxRNHAwWlA3S3VvZ3MwM2NHZElaM1J5bXNvSEd0emszN2Rj?=
 =?utf-8?B?czhiNlI2ZnlmRjh3SzVZcHRBN2twY2NpdzloazJCZjR4QmdNeXBsTHpvbC82?=
 =?utf-8?B?eVVwS0szR0M5SGd4Q0xsMENXRm5ab2U4cHhYcjMybU96YWRYL0w2WERTL0Vo?=
 =?utf-8?B?OXlXaEEwWjRSc0c1MVB1Q1dhSlhyWTZWa2xjczRCVldMVy9vYWEweklmOEhR?=
 =?utf-8?B?ak1WVEd0Y1JNa2dkT1BDRDNQdmtFNVU3RXN3ZE14MmoxMDh2bFB5aGlya2dq?=
 =?utf-8?B?WkNKRndTcTArM2xRK1ZsQlhsaHNRQ1YxQy9OS1dWbHlWZ3JvVXhXNnRQOGdj?=
 =?utf-8?B?b2c1SG5TdExVSVZ5VjJFRlFsMnpPV3owUGJ0QksxTW0yT3hJcnp2dlFINEVK?=
 =?utf-8?B?Rmo2SWhPYUxKYnJ0OGF2dTdPSk8yNE0zVGYxR0ErS1FNYmErbjMrR0poMXZW?=
 =?utf-8?B?UEszZldVVDJmRk44SXYxa0dMeDNzWCs4M2JGTngwT0lQNzcxOFdLWEVicFlH?=
 =?utf-8?B?Q1FmWmY5V2NqTXRSVjU5SGQ4TExwQ2pGeWJBYWFtMUwvT0FoOE14QmM0Nmp3?=
 =?utf-8?B?RUx5TXNVZUMrN2xadTdGK3RqWUZwSGpDc040QXRhWmdwY2JBTzhpWnEzYXcr?=
 =?utf-8?B?d3FGQ2hUTHJTWGFJeWdlR3BMSjdjZE1jYm1WYXh4d2NJZ0ZZK2tJazBkKysw?=
 =?utf-8?B?Wm9tbWkrZFgxTlBOdmVIOUN1eEtXcmVXMjFDQzEwdWxXQTgwYUQvVnR3SExM?=
 =?utf-8?B?QmFPWEJMOXVzcjk4YmowSXphSVpIRVVRcDBweERyNWl2WlkzdndpWDNqR0Qr?=
 =?utf-8?B?MXg1a0daa1NkdU1rM1R1WnJQTi9MOU5CeVNaK3ZWUnpVcGRKc0Ztek0zV3d6?=
 =?utf-8?B?L3RwZnFBQlVxcUgrMEdUUWRQT1dPUnJWMjhLQVBERDk3WDVZRDJ2RlhyczBG?=
 =?utf-8?B?ODk3ZVBtemJCV3VlRnFEdS82VnQvQ0VESU1RcXd4czgwMDREQ3hLYmZIUnhl?=
 =?utf-8?B?bEpIR0U4eVhBWkNJdlFtWkZEcWF1dTVKL3FjemNscTBlUVV4T3RaOVA1UjF2?=
 =?utf-8?B?Nzg5QlpaV1hlWC9BT0tpbTFySDB0ODVQT0tLK2ZmeEd5Nmw4UUdVeUc5NitO?=
 =?utf-8?B?VTVURmJISlJUVytvRGVQdHJjK05VUmZpbW5Uc01xWWdWN0U2SlRxZWI0TnNz?=
 =?utf-8?B?V01BOTE5djAvajEwZHcwYjViSy8vemtieXVyUUxhQkszNnZnWlR3QmNQdnFm?=
 =?utf-8?B?SzB6ejRLZGcxZTJ3WXJNWTlnLzFEeFlaS1A1SHN6N0Y4cEZQWjNhaWFEZXBo?=
 =?utf-8?B?QjF0WjdMVlFWbEtDV21CbWJkbllEZjBKSjZCOXYxbDJDeU0rRDdtYUJhajND?=
 =?utf-8?B?akgxYm1TeXhHam5VTGd2V3U5SEpiM0Y4dkFVUWpXT3pTcGN6cXlqZmdXcm9E?=
 =?utf-8?B?WEJIVVhZTUs2dFhaejFGSThXZnRYVlBZUE55S1RSSHljTWlJNDFjTzF1YW40?=
 =?utf-8?Q?piDzavozfHAgHdBOIj1wHQLvypScor5sCqK12?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499fccd8-c8bb-43f1-58c7-08ded2120fd5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 17:00:15.2497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wrsuo3e3DR5ryJrMv6pakse3IjKx/L5IvUublVvlsRqAcTg8iPC+RYb7Szx2SsJeLJKHTbXoSIJ0ZiUO9dM2ME9j83N1jG3SPtz73f7lle5t2C/Ij5+C10vqvs88z0An
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11642
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-65572-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,msgid.link:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 489A66C0364

Add new helper macro fwnode_graph_for_each_endpoint_scoped() and use it
simplify media code.

Typical example should qualcomm's driver (camss.c), the v4l2_mc.c and
rkisp1-dev.c only silience improvement.

Anyways, *_for_each_*_scoped() already use widely and make code clean.

Build test only.

Sakari Ailus:
	when I try to improve the patch
"Add common helper library for 1-to-1 subdev registration", I found need
camss.c pattern, so I create this small improvement firstly.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- colllect review by tags
- fix typo and indent.
- see each patch's change log.
- Link to v1: https://patch.msgid.link/20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com

---
Frank Li (4):
      device property: Introduce fwnode_graph_for_each_endpoint_scoped()
      media: mc: use fwnode_graph_for_each_endpoint_scoped() to simpilfy code
      media: rkisp1: use fwnode_graph_for_each_endpoint_scoped() to simplify code
      media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simplify code

 drivers/media/platform/qcom/camss/camss.c           | 17 +++++------------
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c |  4 +---
 drivers/media/v4l2-core/v4l2-mc.c                   |  5 +----
 include/linux/property.h                            |  5 +++++
 4 files changed, 12 insertions(+), 19 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260620-fw_scoped-5dab644510a1

Best regards,
--  
Frank Li <Frank.Li@nxp.com>


