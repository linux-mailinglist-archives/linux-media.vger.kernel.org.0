Return-Path: <linux-media+bounces-51713-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNi7NVR6eWlQxQEAu9opvQ
	(envelope-from <linux-media+bounces-51713-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 03:54:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA8A9C6E3
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 03:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99B7E300D336
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 02:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9C22C178D;
	Wed, 28 Jan 2026 02:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="S9P6VkR6"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012002.outbound.protection.outlook.com [52.101.126.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A33250BF2;
	Wed, 28 Jan 2026 02:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769568842; cv=fail; b=ACE8RMt860MM9QbrUripx+zCPbW3jIj0Zb653NnEFkzFPiRIsbIlB6nw7ZsZAsmH/kdIWK7jfqACoEkBRebn2o5ds04EmAoZ5DmDmHluF9dD3jjEwlOhmQRcOGaG1/jziYc3zmTEt+Nplmwgh0Anmc3K85DexdnwRUWzPETpLGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769568842; c=relaxed/simple;
	bh=htk0IAkKDSEZNmS8/mY8R/zbnSV+9Hqos7SwAjtr99I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rfpsBbr70dhi9zgdE+OWFI+9hpHkXXZRYDvDXdp78l5OACt4WKLtJ1fSUBSv3XzL/BVJuG6PfXmkD2YMb0DVVAAwwzzyO+aV9QMj93bQyhKb8IPN8xpLvS6cm/FokVdgxh3rFvGX6wP2VtPYmzfA2ImIoNnytQJULOLyTD1s8v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=S9P6VkR6; arc=fail smtp.client-ip=52.101.126.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUqzyLTG5Zz8pzBEJx0kBomwTLK6ZeyU1wW+1ljNyT5Hg9M+Y7JMSkV0yfUWn4MzLWqe1ClM71bf1PkSafNBb5AozCU+x+FVYb1a83qbq1uC5yNHlWaFh5DW5iolAyr1psiN7k9NYNPdSEzdnpR83aTzmI1kY+knw6n4qVNgJjPPaBIucS4RoLsY5UpY0JW9Y5WQPtupvtUFJIpiIiCd7Cp2oZ9Ua++bA+QtNYTsTzD3qRwRz0T4MXNzYvNoAhD/Oju1B88c2NKScKkqy1GtbdKSVjBSPqD4woQF50fiyOecAq/subTPrQABAVF35zScEzxiLQsNF6+kP9Cg613VKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEU4HqaKOblR1aWcWMErEB/nDc5k6J292D+LeMo5uL4=;
 b=k4JYTflhS7jQkzVC5Deulk8aN2oAk4neOg0769nO0BkpmYge4vt+o18X896Klh7miX/qQARo8NPyswsrYx9nTff5/cbf6MloXS1t1TgKCk4jTzMkCaX693qjQV1rWGFbzVSfaXtTN/dDEwUVWe8+sUArorFprUvEkWpd4RtKhWiliUsZWBTq44wjoZbzNH418C1dLZhi8duHMmidtZspyjU2Zyermf4Vb9EVR2PuwO61C7FCE4oagRRvbXyCsxQp+lTQDXrkqD2yYIY3RJDnpbIIpVoVvJQuHBohoefrpUDKLX5RSLUXlu3V/Dm9dvqdd68FAG72mV/WH27aviLfeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEU4HqaKOblR1aWcWMErEB/nDc5k6J292D+LeMo5uL4=;
 b=S9P6VkR6n8/0MU3barbtJpycx0/AbO8rJKsydKFEMvU5+jlfqToMDWiMdc+nL7q54Rvzn3WeIAgPsN+l76Krk/QByMZLvuukitmhypmA6wF8bBONGA/VKbepOqKIBwMLPbw1V/qoQDHVpUPPoswvFNmSSsgN5/Hopf2GQ2XJSw7IxhWskxX7uNyxbHGaVBX+8vT8sHvpVLMx2FL5Qr0/uNuPKCAce5yaMmENR3wHVR1DurzPvFpt79XLQmPf6AViUwbqEGZLjn4qk+1wLiwrrDMIOY79yefl4fzYV2Gon21iUwRU3lpYjISXODfNzmTry/9tzf3QTYgPFCixTXRx/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6895.apcprd06.prod.outlook.com (2603:1096:405:21::13)
 by TYUPR06MB6002.apcprd06.prod.outlook.com (2603:1096:400:346::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 02:53:57 +0000
Received: from TYZPR06MB6895.apcprd06.prod.outlook.com
 ([fe80::8fe4:2b45:9a9e:5dc1]) by TYZPR06MB6895.apcprd06.prod.outlook.com
 ([fe80::8fe4:2b45:9a9e:5dc1%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 02:53:56 +0000
From: huanglipeng <huanglipeng@vivo.com>
To: sean@mess.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LiPeng Huang <huanglipeng@vivo.com>
Subject: [PATCH v1] media: lirc: modify the timeout waiting time for the  infrared remote control.
Date: Wed, 28 Jan 2026 10:53:45 +0800
Message-Id: <20260128025345.68258-1-huanglipeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To TYZPR06MB6895.apcprd06.prod.outlook.com
 (2603:1096:405:21::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6895:EE_|TYUPR06MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 7086f10d-de25-406e-1ae8-08de5e187ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ng01Hu4Lj1stGFkZlaawZuKcOQgFSy/T1ATopv7uusCxwqRCisUWYM0sXHYV?=
 =?us-ascii?Q?wm+iSLFRcy2Fwzq1CxFLeFI9ldZdoFgedf+z3a0WpmQryEHdl/CPf5rnZ2ZC?=
 =?us-ascii?Q?ITZVKtDfc1dCocEz6if/DqjTyGbO8NJdKGnBPgzt7uj/YwPSt8HlG+vPMjr3?=
 =?us-ascii?Q?nqaxDa6Ig/4suqahHrS9Dfx26hK2j24W35LNPFwWnFSIV1fGMuDOdU2L6I82?=
 =?us-ascii?Q?oTWfULG1Hp+aDKTzemVRjudUJ1fLgEb3hbrN0vDb1ImD+kWlLXqAMOuvMYiJ?=
 =?us-ascii?Q?mKtAvNslCKYvZXMxh72lx5hevKIkNstbrMXtoZIm5ePb7G6Q7wHJ+yJ7cwzT?=
 =?us-ascii?Q?z04jJVBH4BQiluFCFGh093s2XoxYQGXJ7T+IBKZgiGZsqkn2FQkZ6lBxP1xJ?=
 =?us-ascii?Q?ldCbpr054fNwTKyKf1JoiuO90Zpt7m4WE86YVa6D62RgEh3nFKLCTe4On9CD?=
 =?us-ascii?Q?RJE6gBhxWHQLt9ZNfXu9g+WrF1M+DWVk1GOnYlzMwFVahfSdNJh0h55TLPbK?=
 =?us-ascii?Q?Rk6tqS4xOKzt6FkhB6CRCYBMHfJdubDbjkjFWXzCCwua9PG/HbFrm1y6NVGY?=
 =?us-ascii?Q?S+icfx/kZIO03el4IzRtTNHf0e4nn4sZ55tccpFDxL8p8s53VNPNyEqmBjeX?=
 =?us-ascii?Q?8CC5sUCaVzgKUUshIo9BdfrhkR7YBbqqPLNmvC7Em03EZXuFCbSxof/Jx/eC?=
 =?us-ascii?Q?zSK4XQgbEjOj8+A9Eyp/2fumzVpfI7ihF09pGuwajjjgvH+/I4SvJeFhp/bf?=
 =?us-ascii?Q?InzH66U+HlsSyUP0FELEWlspE2qvn6w8nyy31kjuOOivBW3BBxY9jwEg1dtB?=
 =?us-ascii?Q?0Ov58593Ju0bhZEpsPvqHbtNRV9NRm7Ffi+DEEiLx/jas7GAKaFxVwJUNxOd?=
 =?us-ascii?Q?ZIWsPoQIGyQeclWQTkwsrJDKFHnXr1Qf2rNto2mnJNjdpUdoRKKks++2jdKu?=
 =?us-ascii?Q?BeTZk/RETOGYc5IzTkpPXXx26UYvC9Cd/CCGsalXqqIgn8f0DJDMidSW9ZJ/?=
 =?us-ascii?Q?8zm50mHNLTKwU8ImA1SFeKpg3rliEY6AlxCI4KwQdYUW2LVewgad53kg8fCv?=
 =?us-ascii?Q?soIWk1Pbk7jwxFxjQd7av6PJoinCXqxh3yx+w1WRJDYSdjVy5+981tpHQA3p?=
 =?us-ascii?Q?zlWGh/8lnMNyzqvysgxgXCxNx8KdwemnaKLOFgtQ3fGqSVayVaiu0HYWFw3h?=
 =?us-ascii?Q?E6betFnLjmARrEYJOEWLdlMG2DhfPn9qB1PfrhVcprkmYtHjz7h3HUG+CfrO?=
 =?us-ascii?Q?SCu27zQs22UHNu1FjB8oLL37I3pP9YIF4VZHTFkU9z0oMNpV2kTOvVNgMKpd?=
 =?us-ascii?Q?N8EskIAUh6g4EGxgpZ3xqKeXSowDYWBnvSNuAF3HpA5J6xj1WfRzkucE5jXy?=
 =?us-ascii?Q?ZBVtlzZcLry2kgfhqI8vYNZAvh6WBV07C5d/N9ULMd6BmGcbkrDNvvoCZFfV?=
 =?us-ascii?Q?qGXK4+dl4SugUrk2fsuebOwaUeEcwH52TfK8GPce3IHIs7e+Bx9lgUQXwCGZ?=
 =?us-ascii?Q?eTlOYycTPwmVnPtDVwEgoucPabLwNz9l8QKj4OLc2Pmjg5sLOaeePiKp1P7j?=
 =?us-ascii?Q?svYEWMGaTyh+QUw8CNaA9OdL7s66Gw8d5y3PIbhL0SAHeyej0YImTZi1z6qf?=
 =?us-ascii?Q?rhrEhxEGrZHkqyNjrqMhvu8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6895.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Uyl4RFKSPkePK3CLmocL0cAE47TuE+0THDOnEY//Yvs7Lhz0OXCYAvEHhqr?=
 =?us-ascii?Q?nk16D2h7hP+Kz2zuKmBXZN1EC4Q3ivkUhcP2aYPX+XRRsT84EhZ+JBTRMyxQ?=
 =?us-ascii?Q?JKFUY5tpRlaSjussDJHkQmPqMICW4bc1xxuJxXYYuVIGehIXWTkRSLmOhPj4?=
 =?us-ascii?Q?+/AHxM7bg5ogq95aLdi/vFQ0ROJiB1B6R/UxNngoIbpM3MpKY6wlr5KTEekZ?=
 =?us-ascii?Q?NyyIzGAGYHaaRudFHF3ZLDt2fncddqCzl+FyrUxDP/laLHNkmGu14yGJE39o?=
 =?us-ascii?Q?msvOy7BkKW67UZglUcEO1TLK08Y0veUdShR3jdeGJsOEFkN7o0aBOYwZVY3o?=
 =?us-ascii?Q?IH8+ZmTP8Ksx3TSU9+//a7gNweHsSmcu77zR6DuG2eAYcxfADHDETbV50oFs?=
 =?us-ascii?Q?igd+Gz/EV3lzrb+4Pz1+1ciVnn/csBOkfSrdjUx1/5FZa65LDyw9hgNo//49?=
 =?us-ascii?Q?XxSXPnueR4gM36ksXobEXCsFdyKTZBdWWEej7tyTYcwvw+1q/zY3XMPF34mH?=
 =?us-ascii?Q?wOxAigP/Dggnrfnrg8flAgM7KquYnl5ekGMZ+sD7QnUt6xqwN0D9P3hXT3mB?=
 =?us-ascii?Q?aQFjNJatVWAb9j8PpA4Qe7f9kyszXXwAHoMTIhz4Nfclt59qKpfwQkQK4m10?=
 =?us-ascii?Q?hRhIb6eAoGBO9xAouOqcmBV4ZpnxYe7b9ofrdnx32JlfpwiWYohwLvjcQvq9?=
 =?us-ascii?Q?kfjeCio1RmnGBpMGRGoH3ItxncQWGm4eKUGAIfhg48NvgAc44PGYoJQzonQb?=
 =?us-ascii?Q?o0h2Em+IUge4ftHQzOZaj+omoEpFWMSPdeLykq5t92kOjjgTdt01yJbWncVU?=
 =?us-ascii?Q?JFCWeu1XRS505+p5deV45N7ZBv2y3tkMVpfyxU/WhWVO/yBufxsdyiEPUsHu?=
 =?us-ascii?Q?S2QPoTBthBou+CAKnKI3vi4TSEui+E4KapLcg6tDrNM4+3HciAo7gqUNwsZR?=
 =?us-ascii?Q?JPCH+k1oqbJ1DLQ2+7NXom+Rh0qOkXT5unzzt9IUZJ/mMbaouDPJV3Cw+/5J?=
 =?us-ascii?Q?AbvJfAhbvyVV5gr6XSpgZME4lTWtssRaBVHhJ9q2qeMHFRb+hc15kXPkAaCO?=
 =?us-ascii?Q?8mXzquSdhhEKRWvge9rXmRRt1pfm+dBm0jn5p486EtdaO2bMnG6/4cwY6+2C?=
 =?us-ascii?Q?9uR/VQb0u2kzChKsdH6d5Ke8Dj2GgsnV4fEpgAaj8QyVse9BLI+pcUc4UM3/?=
 =?us-ascii?Q?2MVVHpd/r2P1rw8SE9ot8etjCv31W5bEQcRDskjHzATs1lO6xhVJjqZax6Qe?=
 =?us-ascii?Q?4VnYFuVz8oyB+gBSpb6M1l8kxrxqOvADRudN9FVmj19YCwOX9nyyQnMLs5fA?=
 =?us-ascii?Q?021xwQU2xQ/yoPCvqwOrRGckEkAPF0I4MWvtf4ZbM26jfeDrzCOfxdUDY9U8?=
 =?us-ascii?Q?mRTghd3pVDo2BpfbVlWOcEa0CIRP4VKeJgPECqwkuAPAlboojHCo92w0gADG?=
 =?us-ascii?Q?8DC12Qk6TB3KfurjTpt0eqkDrwOusrRPYWH5MmqR8rZWPerUh40YiH0jQVTp?=
 =?us-ascii?Q?L0iH3llrrF+KrVRbapqDeRQvKpcalW5CfDcT68Uh3F9WaSovdY5CUyxEoz49?=
 =?us-ascii?Q?sjNQLIj82ok0iKAfrzAKmoOBRwVfE4pH5IZHVtjFmhAYFgQJtcV9UJq/ckoD?=
 =?us-ascii?Q?Kq9I318v3lvRpiYTSLW5tLfdxnOP2rfMBlLsto4xalC4uvrJYrKV9Z+8xVaP?=
 =?us-ascii?Q?y5NHpnMdE8wITydAK3Y4OPDER7MNz5XZjVcKNtY5GmbIiSVFttR8pa2v+WnR?=
 =?us-ascii?Q?V5pbU+DaJQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7086f10d-de25-406e-1ae8-08de5e187ae0
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6895.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:53:56.9117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8AuAWNGnon1YyqT4K5+Z0Hx85F+ydsPmEZ8p6SLizc6zlt6sCvd62XYbJXGrE1jcW+qFxIGOKcSOK+4icCwEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6002
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vivo.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vivo.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51713-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[huanglipeng@vivo.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DA8A9C6E3
X-Rspamd-Action: no action

From: LiPeng Huang <huanglipeng@vivo.com>

When certain infrared remote controls send codes, the kernel side
does not receive them, which is due to a timeout in transmission.
Modifying the maximum timeout time in this area can solve this issue.

Signed-off-by: LiPeng Huang <huanglipeng@vivo.com>
---
 include/media/rc-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index 35c7a0546f02..9214f3fc174d 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -303,7 +303,7 @@ struct ir_raw_event {
 
 #define US_TO_NS(usec)		((usec) * 1000)
 #define MS_TO_US(msec)		((msec) * 1000)
-#define IR_MAX_DURATION		MS_TO_US(500)
+#define IR_MAX_DURATION		MS_TO_US(1000)
 #define IR_DEFAULT_TIMEOUT	MS_TO_US(125)
 #define IR_MAX_TIMEOUT		LIRC_VALUE_MASK
 
-- 
2.34.1


