Return-Path: <linux-media+bounces-29680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9032DA817EB
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B061B1B67BC9
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE1F2561D6;
	Tue,  8 Apr 2025 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SLyxHk2J"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2042.outbound.protection.outlook.com [40.107.247.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913E72561AA;
	Tue,  8 Apr 2025 21:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149246; cv=fail; b=omnQMgff6NMM3irOFgkuvsW1Pct2KywXjRyqBhyVvMYC+mpG6ghvv7AmAnXh6Zx6MDVfITwvuHywbRaqt/1aY00qRaP2wM0qaUU+MCDRn7h3n/04fSDboSaCR1mx5f5swGXNSjAN2JQQZaIiHfr5ygQuAaNNbRc3bh3Fc8ivodk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149246; c=relaxed/simple;
	bh=whffEOlnqKmx08fE+iHWtEpWfG1ym3K0BSf9B+jZ/UM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=baHDqFyKzbC4tupZf5ieIUtCFvq5nD/kBcEj6dG/JaHEN4LGkmAsgFxX+0XUadGEMU0+kskNaMrCZuAxeqCf4ZqPqwm8Vp82OlqRS3g3jPxrY8pJn2x1JIJ/KejSJjXDlAutUdtlOFP90CLpfaVYiVA1Jw4Zy0RidizCWUKb0eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SLyxHk2J; arc=fail smtp.client-ip=40.107.247.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdkMZyQb5BO8LBgFox9Ke0C6kO5fp/Z+V3pDrH87dQnb+ZZ9JulBKWKriq6ZzRNwfTnwPhwAbCSY3fXAxFcFHPVBKPWkcLa0khVHqjJh6b8/MgAS16FqDJcxshi8csXA27ETNluYq6hfmWEOZ4QpnOhb8bqVwJ0AsL5cc0wPV9Sp5e2caOgKozcpfLxlcklZT8TrRr5OP4e+ElymEF7UjgyiWT8tWDJpfefDSYKNmPdI0Flr7Fq9nlorBEcx7vhrBnW3PB5CJpY0dIEx6iqaJOv5JLykTyMp7IXiyaW4mXP4z5iaW1fVmRJKqnvV6itrCG+r7/QteZfOdCU13mZXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffsql7ZUvBkYVd9O4D1RB7qM9ZUCbJlBPFNukIiFzYE=;
 b=ZitDWPua5jYrpdL6HVLJdPGWDknLCnbD/3xuqxNQ5QYTrS09i7662HloEONmgD/ezGRJhdA5/uZ+UqoZ7jpv6RbiBS7odeJumQB6EyjvXvlghgB37k8jlMwTuCRdzJ2Rh4PUxCVUeFFrBY+mxs4fW2koDvmVmKWgK3K+bI0lUs02PlJ5BHMEYPjNBLC3xSUCeCi6omJnuhdNEsJiqB7jQEZcWf8nf9gnTRs9iUawvOrI2IwQnTB6JLiAMVoed6KTj0Zseh+0+uPo58Z9n8nTFW/S7aoxWl+UQuMX/kJe/0NVW3KQ5r+Ya9aB8hydwjkgxTHYLv+jXDcm4Zbyym9RhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffsql7ZUvBkYVd9O4D1RB7qM9ZUCbJlBPFNukIiFzYE=;
 b=SLyxHk2JgxKoV6aci1DhsmgkFZ5I5mXiCQSE21cwca0dMpPtCUB3TU8kP9A2IEXp4DGfWjMAdUcg4A9qqdiXqecIpXfqc7frCpMdNZqBftASWEZ0EXHS1CP/RDBgp6qizlDJnDmLieBJQY9QfClwhmzaPNu9OaaXAo3vERybIOMPDy8jkMhtafprb8rRy+U99LoqaTVlEs7x8pAF+Qj5T0ma/Ju5NCjvjEor5IWWEnIs9Kgq5NoaXFDgrdS1BKhXb6LcrWolHOqeyRPenXTPKLim6C7SKX7kPRq3+VE5g1Sx+7UbvEUNT2rRA3PP5+LJOlbErHme5VK0ZofGXHAhVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:02 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:00 -0400
Subject: [PATCH v4 02/13] media: nxp: imx8-isi: Allow num_sources to be
 greater than num_sink
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-2-ef695f1b47c4@nxp.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
In-Reply-To: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=2311;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=whffEOlnqKmx08fE+iHWtEpWfG1ym3K0BSf9B+jZ/UM=;
 b=PK+UDnAYVUmFPYzl9dB4GKXAqq4qvb4fjSjqeL0MY1LC76L2Xmj9/FFc+y/3lHgtzET/cAv4f
 tQqeYEgiYf4AkfT96s43Vqd56n4of0UB+jQfjQ4iyo0EBtF6nke71s9
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:510:2da::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b45505-1111-4fd1-87d3-08dd76e7dfac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UWNPN3p1MFc0VUVXckpMZVE1anZyQ2xJcnpTdHZWblFFNHlOdTBmc0JWcUNn?=
 =?utf-8?B?eFVKYWxHK3RzcEJTNk0wcC9renVpV0lMelFxMDZNUVZkSjhWeWRwemFqZWVm?=
 =?utf-8?B?SWVvSjZKejlyNDA5M0RZK0t0QjNBZkxXQVM5RTdpUHNMZXFtWHVRK1JqaTYz?=
 =?utf-8?B?TzU1YXB2SUF5Y0t0Vjk2eDFTYkg1djlVVHR1RlFYT3BCL04zY3FCTGd4OGJC?=
 =?utf-8?B?WVRwN3BYaEd5R25YSXdGYTRHcHRQR2w3bzJ0OFc1WThvbmU4ZWQwa0dqeENv?=
 =?utf-8?B?K0tDTDFaeXJhQkdCQTBDc0pmOXl6TVZ0ZHdyeHZ2Z1E4bkY0MUplMlZ4bDRx?=
 =?utf-8?B?K0ZQd2poTXFzWDg5WXBnRGFTdkdObVZDd3hsTkp3bytvZS9pNGtSc1RGRjQv?=
 =?utf-8?B?VVIxb2tHTXpmK1ZWMmZ1QWY3ZktBa3lWYmpCR2YyaXlBWnZmdEI1bG9SUGR5?=
 =?utf-8?B?UmZ4eWVyVGkrUHNTeEFaODVud0ZZN1RnUTVSS0NGeHhrZ1BRR3lGTmRvVXFY?=
 =?utf-8?B?enJ6WnN5WjVmQ1hMbHpVcU5FaTZBTmJ6bExBZGwwNVR6bEs5YVV0Y3h0SWxh?=
 =?utf-8?B?SWFQdjNEV2hlZHcxUGhCekxwOTBmdjAvbDBCcjl0VXVTOGpZU2RHbTdaekll?=
 =?utf-8?B?S0RabVhhb2c5NzhxYUVVZDNBaFJTYkptTUtQdS9NMDNMSmcvN01kRHBaODE3?=
 =?utf-8?B?YUl6RzlDc1AvN3lxWlpQQmdYTmY4aHFoNUFIQVk0U0V0bzBFOVh4ZjNHZHcx?=
 =?utf-8?B?Nzl0dnJPbS9PeFBTYzFGR0FJbVY0blhlWE9TdXpCZVg0d04yZktITWNFVDla?=
 =?utf-8?B?ZkxodmJKUXNxWVVHWWZLRExnUE55R2J0aVVhM2RWenJuY3JXRWZYbnBUbFcz?=
 =?utf-8?B?V2grL3lHUlhjSytvSXJMY1BoRTc3bUt5V1F5bWVLVTc2bEhoankrRi9tc1p3?=
 =?utf-8?B?b0RJQmFROHE1UzljNzNtaVhtSENWOEdrT0dnZ2VWQnJJREtKV0VmWGEydklw?=
 =?utf-8?B?cFFjVHRxM0dHMFIyWjN5U0EzQi9tY2NBT0VVaUhybldEdk5ObUNka2JXdU43?=
 =?utf-8?B?MHJwcmF1WE52QkhxcEVkemFoZUt4R2RkQm5iK1NJZzlSS3ZJSU1XK3lOdGJW?=
 =?utf-8?B?Nnl3SU9odVlQWlZHZ1lNbGhYSFB0VHJNSkZsZkM2YUhhUTlDTVhsbVJ3MHg4?=
 =?utf-8?B?RDhXWnljL25HOHVndEloamhPV3M5UVl6VGRhRjlJbGJ4NlRUZHh6TkYzK3Fl?=
 =?utf-8?B?U1lmOVFHaWtkWG1FMlZNL0dSdVhHbFRYV29CZUNzb2pzY1YzMStFTk56djV5?=
 =?utf-8?B?YU9iY05vVVRJSTM4VUNiVGdva2wvVnRPQWRoZWRNUC9RTk9zWHdxWFNUbXA1?=
 =?utf-8?B?dk5XekJKNzJPODI2UWVmV2VUV0FMYnhBN2FWTEpCVE1xSHBpT0xqZHBlbE15?=
 =?utf-8?B?Vm1YNTRDdm0vK1VOOHNLRmV4U1dGTXNqRzZhSEEyRDlTdFdtYVBUWjZpenIz?=
 =?utf-8?B?T0FOZkZmbDNLNDRJTnVUdWF2VWFtemV2N0xwTkFRTk5iQXZ0bzRKRWQ3M1J2?=
 =?utf-8?B?WVNiUStqT1FtNkNOMURQM1dQZTYrbXIzSmJPb1lycnpqSWE4cWliajJqNUJl?=
 =?utf-8?B?U1pKQXJrWTdyQm04NDA1MW1tMkFjaFpRMXJNRW9DVGRZdjFTTEt5elJzb0xO?=
 =?utf-8?B?TnNHZlJjQ2ZqVW1sSENvd01JbkVyRVJ4RklNSlJ5OGp4L1U5QzFhWGdxdjhL?=
 =?utf-8?B?cFE4cWszWGExM3YxTEpFODNIU2wvMVFSbDlXczJ4U2JFMTVSdDRSNTBQQ3gz?=
 =?utf-8?B?UVNhekZZVzlTcTVQcmJVU21DeTRiVXdhVE1qNEgwZWppWnMxOTMwemk3OGZI?=
 =?utf-8?B?d0RJQTRKS2YzcTJnbW4wbXJPd3QyaDlWaTNIVXpQQUU1dDQ4YzUwb05yY05k?=
 =?utf-8?B?OHQzcFFiNzkzUFFFYi9tRzM5UkNLc2t6SFFGZ0lyRmdPMENiV1pYWXowd1JP?=
 =?utf-8?B?YmhGMHErODVBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?L1BXNlBIWlJOUG1FYTFSVDRDOWZldzY4aldzYmNYK1c0TjZERkFna0Y3ZEtq?=
 =?utf-8?B?RGwybTVhNzFjS1RMYnZpZklxMEwxM2Z4anBla09NaXBzbnp2Sjd0UkRYS1NQ?=
 =?utf-8?B?YXFvNTN2R1BDTnBlendMdXdJT1NMczNURlZqaVJZdFRpWTFqSm84SGZBOHVI?=
 =?utf-8?B?YVYzblFubWtOdWpIbmNwWWZmQVpOZDZhcFU1TlBPNU9lc0t3MExDTVg0YUdE?=
 =?utf-8?B?dENTSzhwaVBveGVTMzhMdy9RdDJrZEtlU0xhOTFXSWRHMi9EbkwzRkZ3eito?=
 =?utf-8?B?Sjc3aGNyLzdMZTI3OG9SaGxOR3RES3NuQU1zRTN5Tkp0VGVxaHQwd0JGRG9R?=
 =?utf-8?B?M0NVMGhhdHhuRVNOSGJqVGg2VjQ4eWJNM281bzhPR0RZZFVnUmlEa0JDV0NJ?=
 =?utf-8?B?emhWVEoyUDNkOGhLQTljUVNHWXVtbldOS0JWOXV6U01VaFpwamJsemZGUmtO?=
 =?utf-8?B?Q3cyVjFlcWU3dHYzaExsMVUwUkljZHc0U084YTFuYjZ3VmJmNStaYlRLclU3?=
 =?utf-8?B?WFNrQ0hxbHpHbWFiZWpLdmM4VlRmc2I2T1dJRlRVKzlvSlpxRklHREFQY0xn?=
 =?utf-8?B?VjhDSXV5ZlF5UDY0ZmphVXQrMkRnbTlSQzFraTZVZEFrOVBmTEExRU92ZFow?=
 =?utf-8?B?aXpIK2gvU0FjSnpWb1JCa2JtN3h1WnJqYjVpdGFjcWFYZ29jVDB2UHBLWUJo?=
 =?utf-8?B?TTZ5VEtNaE9zZzVUU0Z2UmtBdHhudXZpUHlXdXgwcDNMazA1Q1RBalNzMkpS?=
 =?utf-8?B?clBsL2lNbzhiNTgrMEd0UEQ4R2w2YnZiWi9JdG1LakhsVEJCR1FjZnRpK3lu?=
 =?utf-8?B?aUxLOW5mUmd2Mmk3L1JsSmVoeVVEOW5OS0dKS2xpUXhBZEJlYndEeExyS09F?=
 =?utf-8?B?eDIzQjBPeEs2WG40NWFWUThLMm12SUpiVkwzNExOU0I2eS9yZ3Z3aHNlWjU0?=
 =?utf-8?B?THNjbGFhQmRMREwwZ3hWVjQzSWZQN1MzNkl4azFhY015MGtuNGtsMVJGOUIx?=
 =?utf-8?B?Tm1jMlhsSmxlRXpqbEhHWjJPbG54bS9DR2NsWGRzZlI3SGQ0WWJ4Yk9mNXYz?=
 =?utf-8?B?NnRuajlBWHdWYW5jK2NUSTh0RmYxSkJmeHBqM2VyY3Njbzhvd1pUZlNwTFZL?=
 =?utf-8?B?THUvUE5CYlVzY21WcEdWd2RsZVB3c3loWEJQQ1pXVm9RUGYxWmc0TFF2Kzky?=
 =?utf-8?B?STlXellzWUVnQUlhazRKcld1VWR4VmRqRDBIb2UrbmZ4aU9lVkJ5QktzYVZC?=
 =?utf-8?B?cjhCakliRHlObG5XUGQvTVhkbHVpVzJiMUE2YnlRUVBKcTc1U3VuNForRlJB?=
 =?utf-8?B?RmdkL0ZMRVRQVzNtZHArU2p0ejRPZGpZQkxQbnc1RzE3ck1jSmFwTEFLcHFw?=
 =?utf-8?B?TEpsU1hQdjRKSml4cjZieVUwbFNWOHp2WnJlUWtkY2FnK293VXc5ODhMUDhQ?=
 =?utf-8?B?Ni8yZk1ObW9pampXMjBLNXFTM1FCMUUwY05QV3NGRzhjb1pyRWV6SjdQeEpO?=
 =?utf-8?B?OWlXU1FwOFcxVXczNzA1OVplRHhKSUVFWWM5OWo5QXNEQ0VGSVQ1Q0QyWndY?=
 =?utf-8?B?eW9jUkpLV2pISUJ3Qlg2TmhyUWYvcndxWFdvem50K2pjSjhQZmlaTEhGcE8x?=
 =?utf-8?B?ZEFHM2U1dllUa0VXQmI5Mnd0NnlkYlEvWVVVbEsza2xCRm5Ea01zWDJ6ZEw1?=
 =?utf-8?B?NS9XYVZwWFVybW1Vc0xTYnhBZzY1Vmp0c0hscmJYSzZOOGwrR3UvNWNUUWZV?=
 =?utf-8?B?U2RRNzdON29BVG9hZlFoR0NqekJRWVRiaVFSYStCZzJpa3Z0dWVNUTk4YUc4?=
 =?utf-8?B?U3VDUlg1T0JXSnJsbW84L3VjT2NuRE9ua3Z1WURMR1ovZlNvVWh4cnUwUG1a?=
 =?utf-8?B?dFJSbFRnaVhQNjZzdlNRb0diaTc5T09Fc0djeE1WSE9mcTdhS0lFU2pZSmRR?=
 =?utf-8?B?ZkpRVE5kTWFSRmNXTWtHU3A0UzQ2UzVjZnk1aHQ0SFVEd0RLQkF4MUhLV0d6?=
 =?utf-8?B?KzVueXJmWks1R2ZKTi9Jcmp3YjFJQklpMTBJeU1laWVKVmdTdnhkYjM1ZlJB?=
 =?utf-8?B?b3NUcnhmVlUyQ21lZFNCSTV0VndiMmJHdnB6TEp4TTRtYzNZMmZRRExiZGlq?=
 =?utf-8?Q?FfW4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b45505-1111-4fd1-87d3-08dd76e7dfac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:02.0108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1laf3/iMwoyqoyNgZVFc4q2Zy2G3NRAiBEJUaon0b72Ycl7fgHjWHlX9S49ci8+Qa1qgiqoSC9PTwGXXU1/h0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

Allow num_sources (drvdata: num_channels) to be greater than num_sink
(drvdata: num_ports + 1).

ISI support stream multiplexing, such as differentiates multiple cameras
from a single 2-lane MIPI input, or duplicates input stream into multiple
outputs. So num_channels may be greater than num_ports at some platform.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v3 to v4
- use routing.num_routes = min(xbar->num_sinks - 1, xbar->num_sources)
- replace xbar->num_sinks - 1 with routing.num_routes

change from v1 to v3
- none
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd173..55454445359f4 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -188,11 +188,12 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
 	 * Create a 1:1 mapping between pixel link inputs and outputs to
 	 * pipelines by default.
 	 */
-	routes = kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL);
+	routing.num_routes = min(xbar->num_sinks - 1, xbar->num_sources);
+	routes = kcalloc(routing.num_routes, sizeof(*routes), GFP_KERNEL);
 	if (!routes)
 		return -ENOMEM;
 
-	for (i = 0; i < xbar->num_sources; ++i) {
+	for (i = 0; i < routing.num_routes; ++i) {
 		struct v4l2_subdev_route *route = &routes[i];
 
 		route->sink_pad = i;
@@ -200,7 +201,6 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
 		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
 	}
 
-	routing.num_routes = xbar->num_sources;
 	routing.routes = routes;
 
 	ret = __mxc_isi_crossbar_set_routing(sd, state, &routing);
@@ -453,7 +453,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 	 * the memory input.
 	 */
 	xbar->num_sinks = isi->pdata->num_ports + 1;
-	xbar->num_sources = isi->pdata->num_ports;
+	xbar->num_sources = isi->pdata->num_channels;
 	num_pads = xbar->num_sinks + xbar->num_sources;
 
 	xbar->pads = kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL);

-- 
2.34.1


