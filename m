Return-Path: <linux-media+bounces-27774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B19A55202
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E70C47A56D0
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EC426BDB8;
	Thu,  6 Mar 2025 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="BWx2Usna"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022121.outbound.protection.outlook.com [52.101.71.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7F26B0BC;
	Thu,  6 Mar 2025 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280196; cv=fail; b=P13HbxcFDXCekcSn/F2SZjkGDae+SZBcj2kYhboLIUwEGnyEwwHNjX6jPpIqqENF8tTh2iDkujqPr2O23FvySSXefGohFqZoSDu55+Ozg1sUYsfcuOgK/mGOopTwXs+7MbiAlcEFcpZaJTItiX0SI1TPORwxN78YeI9IF13Sabo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280196; c=relaxed/simple;
	bh=Xo9R1USL/z+d4IAQ/+r4od9eFDQsy0jh6o64qDS6lhQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qBsUzgSEw0rpN9AlKs35FbDU2iUGLSkbZI1tWjSRGntIhR6z30sZO7+hvezeCm8bKJMlHnBk3MC2q5528FkGTP0v591cXVcE2BOouxQCmtxANdRYkJFntwvJl+OUwXCylVbEWtjdxAmI8aWbVXQFiOBlb+GAor8DJg9FzVKa4Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=BWx2Usna; arc=fail smtp.client-ip=52.101.71.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWdTv7h+Yl6f3oItqrMmpQeIFA5FvYIDayGGN7Bq5kFN1KeW/LbWrnzk4M69l4gPSBQ1QZFfNGaWkEp9P4zjWJkg490y1KixVbqsD8U0KMi6o8udaITuDdwFhLPoyQOLxmDIJ0xaVgg4dTHsEOaLnF/4ThW24HGuLXqg63aT5oDd8hM2OfSiREEUNE02SDkfBtuG93Iqmz6ZkOwj8EG0e6S8Iw08K0sPmRy63eFYYYucA5xAtJaHtZeoIFlEh4OMOH5ME3lxgSJPUcxS6aCLYCbw1Q7pu3PQM3WjQ7bAcdxX5EF0rOqhn3CSp+tCbJuy8sNryfLcRdmmcHLl4AOBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HthD4IvHLA6stKJScMCSkGvaVS45odtvgDWcqH1Zbs=;
 b=nMHpwWoVkGq1g7XBHIcoaISBU6fCS/JxZ3VH+4Enp9uJ4Hbk+KGT8k5hHXm7ygz2JBO2TreGK7CayW5afCu3RYyW5RShMz3KmrCGRH137dZO8F+gPyAG/n9Njplm4YxVNkAxMrZ1SPjnBCjFq16ETppTd+VXOQYgPy1fSpDJpMeUltesVOOx6VB6DlOzgSW1lSVHggPrS0bwLEtovxG7k8UKIVmBhLc/4ey9Y2xX/FWTVlQ0scBm+5rRWNjSC2xItYf5R9pj/Ixx5tK28OOi9uCKaUIjJpfeJAi5cthHl7ehQqbJUhyOMsnpepVpJop8xv3wUm2+wA4CHUIVUtqt3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HthD4IvHLA6stKJScMCSkGvaVS45odtvgDWcqH1Zbs=;
 b=BWx2UsnaoRY5WSIQ9frd2DSzaZem5Tu5TPQN13GISx4j56BmN1Vzw9NaknBHZnzhV2ycFlhvidAaEcgenOgRSLmJ7n9jq02AtalVOUBysw2Bz9YDspOiSDavDsoSO9vy1uLQbpBhT6dhgBOYB69tgUTP+iP/2wmhQVZSi5hISbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB11001.eurprd08.prod.outlook.com (2603:10a6:150:1f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 16:56:23 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 16:56:23 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Mar 2025 17:56:10 +0100
Subject: [PATCH v5 09/11] arm64: dts: rockchip: add vicap node to rk356x
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-v6-8-topic-rk3568-vicap-v5-9-f02152534f3c@wolfvision.net>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
In-Reply-To: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741280167; l=1988;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=Xo9R1USL/z+d4IAQ/+r4od9eFDQsy0jh6o64qDS6lhQ=;
 b=j2eM+c52yKxz/S0FRDaBFAjQNB2zOQyds0Aq0+xGf4/BIUq4q6iGqMRtgCK6buueW0mf335Hj
 bS7bKftfXqZBaBffJRgWofgOFPETy9wMAR5OYZU+8r7r2AllmHEowDn
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::31) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|GV1PR08MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e48083-41d4-47ae-96ec-08dd5ccfd37e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3lrUkpvaVhFODlxN3lmalVna0VwT3JMR014ZVU0SHc0dkpBZzAwNHUxMHhh?=
 =?utf-8?B?My9qeVBOdUJ1VGp3bHJ0T1lwZzM5VWo0OUswY0JYWlUrVTNtbTM1dmhJNVov?=
 =?utf-8?B?amVDQmxScDBjRzlacW1SaWx1NVk2aVNvbzNmTzd5QWxNRjg1SjZNaWxGWVE4?=
 =?utf-8?B?UlRDcUgyYmFUVlM5Mi9nQVpFYktrTVp1bWpJMlgxTkdyKzZycDZOMko3RzUv?=
 =?utf-8?B?M3UxbGZ0OFA3bmNNTWtCeHdzdEpxVkRONVBuR011cEswVFZSTDRFNW5BOWhq?=
 =?utf-8?B?cW1JUytJYjg4V0pMZ1ZaSFpVS2RvU1FtMGVpZTRjWUxIL0ZXbGRSa3lXei9l?=
 =?utf-8?B?TDU1T1dkUEl2OGVOcW55M0VPRVpDRkpjd1llbTMxTlV5OWhELzRFWDZoNEh3?=
 =?utf-8?B?NDVKNUtmNzBKVml1cXFWK0xnU1JnM3RFelA1VDFWWUhITXJkTXpzOFY1OWNz?=
 =?utf-8?B?dXZXTS9xTDRKTEk2N04wMkxGcXhsQ29rbENzSmhBVXQvOG4rTkVKbmVGeEpF?=
 =?utf-8?B?WXo4SzlncFdjWURzL21yTWQ2QzZCaFRHT3FBNXRHQ0lGZlRvdWFNQzBCcW5W?=
 =?utf-8?B?UWRmZnJjN0tRM3d0WlUzQXl1NkFJRVJWcG9obFllTkxtZHYzYUtqMFEwNU9I?=
 =?utf-8?B?T3laUkZHb3ZQZXp4U1ZtOXpmUUVjT0ZqRmQzaFUwZmFvZDk1eXROZ1RmNm8x?=
 =?utf-8?B?WVhmamhDQTgxMU9qakh4S25TQkliNVJYTnBCS3ZkeFNML01pYmJOREdXUDla?=
 =?utf-8?B?cG9HQ2FLZUFyRkNQaU1XY2lHaEFWNWIwUDhHNVNHWnM4WnRPekZlZk9Jb2JC?=
 =?utf-8?B?b0taYkNzNGtLNVFYNEp4bmc0RlRXTUt6U0MvTEFQWGc0ejJVajdkbUoxa2Y5?=
 =?utf-8?B?MFBJK0NHWnkrQ1pGSU5Kd1BaU3VRQzBjQmk1RVpiNkVmWjdGaHo1MDg1ajVa?=
 =?utf-8?B?aDRjS25TWVY2cjd6Q3FESEdnV0lUVnp6bXA0RHcwU3lqVTNCakNmVVZOaHEy?=
 =?utf-8?B?ZE1JTS9ZRDI4Vm1wejRZQ2dvN2RFR3VieEdNc2FvU1FSNXpTSkc1dFJ4a2Qz?=
 =?utf-8?B?aTJ2b0dKWU5zZWtPRXVMTXJvaXlZWkVuS1ViQVZZak1YUmdPb2lMS001SHk4?=
 =?utf-8?B?aG5INWs3UzBQRnRyN3RFM3JIUGxKT2phWFRuaS9EZkltdkdQMDcrdW14TXpW?=
 =?utf-8?B?NDNFNzBLT0lIZWp4WmU5M2xjbXNhVFB3MExkSDF3RHpWSzhMZkZzOEZJaUpK?=
 =?utf-8?B?ZXY1Uk5VNS90WnhyTldQb1hmR3pEazF0YkpQZGxKVjBSMlNJZGk5V1V4bWl2?=
 =?utf-8?B?bzVMTWxhajgzc2UxeGs0eTdKbVhQeWM2OFVaejBHWUJoQzNhN0VlTWVUbmhx?=
 =?utf-8?B?azFtUW1weFJ5VkNQdTRGdFgvUGxpSWFOV05saDV5dnNuVDVCVm8rSGg3VWhE?=
 =?utf-8?B?ZTdiWkNzVDhaOTl6b0VQQVpod2xGWUh3VStFZ2pSZWl5RUtRSEd4UHk5ZjNS?=
 =?utf-8?B?WXBocFdSSmtBK1ZSWVZHUzZsOTdKNEpiQkFEdnZ2WlBGRVZvM0NtSzV2Rk1F?=
 =?utf-8?B?OTkzUlFnZHMyNVJwOXdRWVFNUGVMbW5paWx2RmdZalQ0RTJKMlF6aGVxc3l4?=
 =?utf-8?B?Q0trT0FRYzdPaXRib3MzSnpOaVgvU1pLUStXZXBTK08vVGsvc1ZxVTI0Nnhr?=
 =?utf-8?B?cHBJTGxWSjV5L3hPQXNITVA1RWpBb3RGbXhiSElqYVRMcXMxNEkxWTZnZkZz?=
 =?utf-8?B?czJrOW80RzhTbUduemhsdVZ0ZmNsTzhmcFpKb1NlQUh2NHNzN2k5Z1MyZ0tJ?=
 =?utf-8?B?TVpSUjd2aWpURGJsY3BsSXBKbE5qZk9CTzk3SEV3eVBibkhpZTNrUXVNOGZT?=
 =?utf-8?B?QXM2MkJuYmRnb2RkdG52Y2d0cm1JWHNyRi8rV2lCRlI5UEdpQkRJZWxlWjVG?=
 =?utf-8?Q?O0dz1BzmVAg/vfddY/TOvAPa15KW65mZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkVtSUFJb0h2WWVCSXIya1NCL0xEYXVFWFk5S3Y2YjZMclR4Wis5ZzByTXVa?=
 =?utf-8?B?ci9QdFV4RTBOKzZ3RUZ0aitQem9BUXNvcURtNVpmZ3BWZWg4d0lIMGxCVDFv?=
 =?utf-8?B?MkE1WjRTUFVQZE9yQTBlZWNyeEUzM29PTWNyV0xmVndkZGFCa24wa2FiNWFQ?=
 =?utf-8?B?a3EyMjA0NG16VlVCOE1reW5SQUNuNnFqc0IraTVrQjJIUjkyTDFhUHJkVkpT?=
 =?utf-8?B?Y2ZKUjFucEdSdCtmUnB6cHN5Z0xsYXdnMmdDQzZIK2RNVFc3UThhOG04anVB?=
 =?utf-8?B?NS9qcFRjY2M5bWg1TndDNmJnbDdBeEp0YW5aRFRjNm5oMTB6d1Z6UXVieTg1?=
 =?utf-8?B?MXhSQ0hia0RlYmtjcnB5QXlnV1NLR3BxUnhZQVJlcDE5NEQydjRJdnNNcm0r?=
 =?utf-8?B?Y0lMcDBUbG5zK3VoZG9MUmNFbUdmUXRJRlBPUWtTdlFEVi9YWG1zOWVjWVQr?=
 =?utf-8?B?WEZmUE5XeTBrQ2tVd0xzVzQyN0V0VURuaHEwTmNHMjVCaXdha04wWUhFSXVX?=
 =?utf-8?B?M0ljM1c3SXpYMm9PSEkzanN1MUhXME9MS1NTR0ZoOHovUEZ5Q2dGbVNkSjJV?=
 =?utf-8?B?bURPOFFtQUliQTZKQXlsLzFEd3FNaFg5aFNUbkFQTmpVY0V4eHhFUG9VSmc0?=
 =?utf-8?B?c2JQQS9mY1R5S1R1QzhLTUQrN1YzYk5KZ2JUbEJTTDlXTHJMd3hVdXJsaWxu?=
 =?utf-8?B?dFNsZHNLNHhsODNkUmVhVDZ6R3h6QjBLZXRKNkl3MG1mRHVVL1Z3NjRFcXFh?=
 =?utf-8?B?VUhqWUVjMXFwQnc1ZUlVaHhaZk5aaDhzWW5EZVAyYUIzNG9SWVhIWGZVN0tq?=
 =?utf-8?B?STQvL0FLWCtZc01rNTJWOW55Rm9FV3dNSmZCdkVBeEo1SWJuUkl3cVJHVTht?=
 =?utf-8?B?clpBcUY4M3F1ZlRSc25wK1l5djlDK1lwcFcwQlRjUkdqUGNHc2FVVEtOLzFX?=
 =?utf-8?B?c3hRQ1FVZVQ2VktqVWViVmd4U2ZTRWZqYzZ5MTZGWTRYN1d5My9qWXhKemdT?=
 =?utf-8?B?YitIaXVwMEdBaXZoNUhidUMvL2ZEMS9xNWJyWU1RM3c5ekNqd08zdWlObzJ2?=
 =?utf-8?B?bERrS1dLSzdtaGNUYVpQeWtUODBTU2JHZkEwZ3U4cmxLVmF1MkFKZGZ1alhZ?=
 =?utf-8?B?Z2lidEdBZjI1eC83M2JrcGFaUUt6dkxkVVlvVVBTSmt6dW42NTk1UXdQbEZx?=
 =?utf-8?B?M0JQMkZQSUZHR0pCWlB2STlCc0lzNkIrUitFbEdESFY2Y1BSMDM4b21hWGVF?=
 =?utf-8?B?Z2pwSnpvbXFRdFB5bXIrcXpra0dkQUppeXNmaVFqbGpNZVpiTkdBRjBneDFF?=
 =?utf-8?B?WEl0ZkkvT3lXMGd0ZjZ2TDR5TDdKN0pBdDFIcjR4ZXdwdzg4c25oVkcwRmg3?=
 =?utf-8?B?R3R0ZUM1RzNXL2sycHpJU0t6bXJyem9xU0dzaFZ2REwyRnRiR29IMDBkckRI?=
 =?utf-8?B?VW11eXFKUkVjaEZsdnIzcWsrQ1M1ZjQwM09Wb1BncTc4cEtCZEVOS0JVMCs5?=
 =?utf-8?B?MUxaOHpVV0Rsd2pJSTJPdWNKSVpGVmNEdWs2WkNnSGNRQnZMY1U5UW1tMktU?=
 =?utf-8?B?WmIyYmZ4bVErUGFZT2w0dHhBazgva1lETHRTZVdid2xiU0c3QmF6Y3U5Z2x6?=
 =?utf-8?B?NW13NTZiVHdhblphS3UwSnh5ZGp0anJIK01iVVJtRG43K2hDclVhdWcwd0NC?=
 =?utf-8?B?R1lndWlyejZKS3lGTFVqUmtFZ0xOMG1uMGdpYWxXSjVrRzk0Ujl0TlVqTGNt?=
 =?utf-8?B?d1VvTG1CV0NsSVpON3diUldhUXJkR2svdDMzazFTeGNkcXFoVkFONlF2UVpK?=
 =?utf-8?B?cTd5eVlEUEloWnBCT0huME0zaStKYVc0OTZ2aEJLc1ZnZHpTNHpQbXl5R1RV?=
 =?utf-8?B?ZkhTTVM4L20yczhVV3lMUXMvNG5sRVFUWHlGaXJnMHpoVTdwR2lUZkdIV3pR?=
 =?utf-8?B?UDBiTm55VDk1MHM3cGlsVVgrcGhtSzl3SU43cXpqNktGMld0cjdVYkpBZ1p2?=
 =?utf-8?B?NmQrb210dVVVcWNnWHpnS0lhbnovMSs5ZnRzaVEvV3R1S3Q4WE5EYUdIcjg0?=
 =?utf-8?B?ZERlTkV5US9td2xnMU5zSm5zSE51M256NnlqcEtMV0hRenc1cEJqUmltdFpt?=
 =?utf-8?B?OXdEMW9RakZablpCcHMyZ3RvSVJtMHdhMEJiOUpXTXdFWHErRkZndjk4b0xl?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e48083-41d4-47ae-96ec-08dd5ccfd37e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:56:23.4605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZ6fGaH4sXokdfLQ4ahlRJdWKTMJE7q34XyJnb0iZH6TDiS/1Hnw9IkisF2YHYPzIXistXMv+bmRcJgr0wrU94nleo25d3l9y3Ji2TwLUkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001

Add the device tree node for the RK356x Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index e55390629114..cba5092dbcea 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -553,6 +553,50 @@ gpu: gpu@fde60000 {
 		status = "disabled";
 	};
 
+	vicap: video-capture@fdfe0000 {
+		compatible = "rockchip,rk3568-vicap";
+		reg = <0x0 0xfdfe0000 0x0 0x200>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+		assigned-clocks = <&cru DCLK_VICAP>;
+		assigned-clock-rates = <300000000>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+			 <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
+		clock-names = "aclk", "hclk", "dclk", "iclk";
+		iommus = <&vicap_mmu>;
+		power-domains = <&power RK3568_PD_VI>;
+		resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+			 <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
+			 <&cru SRST_I_VICAP>;
+		reset-names = "arst", "hrst", "drst", "prst", "irst";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			vicap_dvp: port@0 {
+				reg = <0>;
+			};
+
+			vicap_mipi: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
+	vicap_mmu: iommu@fdfe0800 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdfe0800 0x0 0x100>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3568_PD_VI>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
+
 	vpu: video-codec@fdea0400 {
 		compatible = "rockchip,rk3568-vpu";
 		reg = <0x0 0xfdea0000 0x0 0x800>;

-- 
2.34.1


