Return-Path: <linux-media+bounces-25709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ACDA2A54A
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 10:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA96D3A860E
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 09:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FE3227B81;
	Thu,  6 Feb 2025 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="kO1TPkw6"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021085.outbound.protection.outlook.com [52.101.70.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFFB226899;
	Thu,  6 Feb 2025 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835888; cv=fail; b=BrAmBEvEjUEihVC5bk9oM6DnKXxkhQ18zT3Dw/ydtfp3o55tEmGWJlOnWqjukLfYSFpqyMZh986X2RP6U9uNwz2pBt/Y9WF9ht/7hhWuuy5wrgn037rSOzl/oNmpXRZAN3Mz/X1xjUyGH5katmkDxCsolZYZbVvD/JA1K7EEvZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835888; c=relaxed/simple;
	bh=TOjjCdbG8+id2SdNirR3B6WDLwEWVtZBREEw0OdTRgc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Sdh4mKzmAqPIRYI509GaS1m5wWhn5oI9Sgu/MqOrJCyAPx503x1tiSAnAKg91Il04bYodP9i4yFXNFcaWJwEL1i4ok/WnCJQv6ueo9PtalJmoONcAFqk8AQ4z8ClhSZ5c5HUIUkkPCFQ+5Db9OvlyUHjEiMbxe7c4g25oB3yrek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=kO1TPkw6; arc=fail smtp.client-ip=52.101.70.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gk7s+hIzps8Fu/yyh2vNOC/EoAPFI+Wf7F/BL2pLNbb4U9mvjXOBMyq5Kt/zwVvYkI0RaCzgRyJKSIybdNCfRZHGtJ0dvQl+Im4zz6OXRzt3few2Ps1X9HrikMp7eE+TxhYnuWeZq3Mp2sdyxDwUYILzogtESh/AU7YjMuGevr6EWYtneKpp32r2LxJFbGcs393mPWsytZovClq3aPPi37Ysd1PKkBXagW66+UE0h3QvAgJxDmGdUpES/9qW23sTBHujulEO6emZuJFaSAV3cQ2Gze/0sZ4kBGZKLq021oSdV2P9KQEztrRl4IxT7SX8TjIgGqeUhQjVmx003v1mIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAevX8DPPJJwFpeEZsZj9Ll8Xy/l/5Dz9tCfFmx2VLA=;
 b=w8W3Y18NHFYqQDGAoHnzkj/SHNFfv0dihmzM+fUN9ilXj9H02iPHVZfkoVXwTFvI5cvsbW6IeNh0TUx1+qZ/eZ20ebcE1sjmNTu8igDBKQKRcGat7yDl91vGBu+S7zvTmfUaplLOVfbZ1rCfvjrZiBRDWj/dU5Vx21AUEYBALD25reBLgszCXlHLpMcXRw8pD5/6UiQoAhAPK42A3lAhujb23LDIbz8KBn96MIHqRnQy1gsY5HUwKIlSYjtR1XXLPg2F0FKu8+RyOWvQVbeASQWSOT1T5hGhnOAJQu0J6MSQZyTxn9YE5EJTnajmzssrDAVCiriCCrMUy2q30sHepQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAevX8DPPJJwFpeEZsZj9Ll8Xy/l/5Dz9tCfFmx2VLA=;
 b=kO1TPkw6yYvFKkkjJlDJobX+PiiCbmqww8I0R7OE6UcVUmIHT3Po4tCXFtJwI3C/xpPl/a6+ASq3CsxXDM3KB7fLgkmlWqxYcVZ0dmUBsf4MyhF9HFzRMzVOu3Yn8mrQqRN4v+KnNHYP+3HAyEWg31fVsv5Ar+AorlLPpV+Uk3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB10170.eurprd08.prod.outlook.com (2603:10a6:20b:63f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 09:57:58 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 09:57:58 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 06 Feb 2025 10:57:40 +0100
Subject: [PATCH v3 2/7] media: dt-bindings: media: add bindings for
 rockchip px30 vip
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-v6-8-topic-rk3568-vicap-v3-2-69d1f19e5c40@wolfvision.net>
References: <20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net>
In-Reply-To: <20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net>
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
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738835873; l=4443;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=NsTFkcABzB7Oz4O9mN4hbSE8/lW18X7tv64zaWMvP0c=;
 b=UCFDtTSQZrfsMv0+FCI8+sssC2dPkm5phix/tdRJQD1DiEexiBnV5rrmRIjwMgy2M2zWID1w6
 hq2CVmUZrYpCGq68P+vUZZPFvJTJi7WuuyVBJN3cl1l2LQh2bYAKWzC
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB10170:EE_
X-MS-Office365-Filtering-Correlation-Id: c75b45b2-42b2-41e5-0cfb-08dd4694bc50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1pNb3N1WnpDTE9tcG9Wb21vZ0xYN203cE9aMUpFKzRRc05peitvZnpyNmxi?=
 =?utf-8?B?TFNWYmxhaEtOQkVXZ0twejJGeDJob0FjcmNIRFFFdEVuM0Q5RGU3RkNsbWZZ?=
 =?utf-8?B?cDN2eUdOdWlIU3FXTnFQQkFMbHhIamJCOW5wNjlMWkhhZ0FoMk9pcXJqdnJJ?=
 =?utf-8?B?VU02c1pBdWlaYlJQYS95QWhlczNzemU5ZUQzbm1BV3QwLzRSaEZPNkpteHkz?=
 =?utf-8?B?VG1teUhZMkE0SlBDMzZiYjVVT0JST2FIU2xWaUQ2VERETDNTRVE4NHBLQytQ?=
 =?utf-8?B?dlduTmNUNXIxL2NWZGxRZjExQ1I2dmZFTFUyR3d6RytkY1pWbmpqcDhTVEFR?=
 =?utf-8?B?ejJ3Nk52OS9UVU1QUGJkNXlDRTlMQUFjZDhRcG1sSlNZNGpKeGU2YjExbDRH?=
 =?utf-8?B?T3hoc3BrUDhCeXJvTHpzYVdrSWZsSjFjeXpJNE5IU2U2TXl1WjRpZXNpWHEw?=
 =?utf-8?B?RU9uZ3Q0TmdPcG9DMTNsYXRhTnBhaDZHMG1NYWdhUEdiQUszaHR0VnltYTNL?=
 =?utf-8?B?aUc2aGpkQU1yTG1Pd3NkbEZMT3A1RXYyNGJOM0VuVDVUSUpFYzVvNDJwZ1cw?=
 =?utf-8?B?UFMvVzR6dFZTSXFyaFl5eFkwVnZZVkJCSysxY1FxN0xvQ3JBQ0RkRWx2UUtE?=
 =?utf-8?B?RnlVQmNGaHo1RGx2QlRXKzdrbks2aXRuRkRDakRHcU92NjhLaDZFYy91b0U4?=
 =?utf-8?B?WTNhK2hSVUpreHgyS1RxRVBETkQrNUFLUWFqc3h1QVgzT3l5R1c0UGI4WFd2?=
 =?utf-8?B?V3dSZTlwVGtodmx3ek15emhsWTV4MWtyUVRMWGw4WGt3REF5K3Z4TnliSjll?=
 =?utf-8?B?UGtYMjFwSWc4bFZzakRNV2VJZyt0d2MrNmlxZzM0MkhhdCtjUkNPS1hNUHNq?=
 =?utf-8?B?cnBNclloWE1tQzhuSHAvSVdnQ0hwem1GQUEzZXM0eEMvUDEzcHl0L3FzdE1V?=
 =?utf-8?B?UDZpUGZZc05KUGp5ejRROFVKYW5vYmF5UVUrMXhXZHg1UjZ2NlJWQ0o4WVQv?=
 =?utf-8?B?L1g5cy8xL2hVZ3BZZFR5eGw2bE1pUitVZzQvUG9jRDNQcVVOWWkrZ2s3dk1P?=
 =?utf-8?B?MlF1SnkzUmxpMkNpS3J0K0JsbUwxb1htWGhna1JPRndWUWc3eWIxakQ3UFdB?=
 =?utf-8?B?T21PaXdzc0o4YUd5WnVpUDdQRk9mYUZWL1RNdGRkbEU3bTdRb01wb2NMZzFX?=
 =?utf-8?B?bVJlVUVRbGVwdmJsOElLVDZUT3c5RVNKUmtHTkZEeDR1MzdHb05zdXovYkZJ?=
 =?utf-8?B?T2NLaGNzVjJCWHpOeFBDRjFkZ05pa2RIbVRPblJFTldyMVcxeXJXVjQxdnY2?=
 =?utf-8?B?UHR3cDErbkdxREdFV3JtYk1ZSmJraXVoVzYyWVlHbFAxb1FSZjVpTDJxSlNN?=
 =?utf-8?B?YUdiZmRlN0gyUzFuQUZSQzVFS3F0YmFXZWc2ekN5NHNweXdsU1ZXUXYxNEtM?=
 =?utf-8?B?Vmhkb1BRUWtVdHBDa2tJd2NOdTBrTXhoclQ3WE9zWFZVMDltcTBxWFRvMXk3?=
 =?utf-8?B?bkgvVE1ZaDA1T0NHc041dXdJNTh6VERmbTU3Ymp0eTdRKzgvaVZKcEdxa1dp?=
 =?utf-8?B?YzBSU00rN0xTNkJFdGhOTllublVoSktWY3pISVpPY2d0MWsraHAxVGZkc3d1?=
 =?utf-8?B?OFBzeHRud2V5T3h3QUtKR2c1dVlLS0dlUnZycklLdElYdEpYMnBVZ0NPVThZ?=
 =?utf-8?B?NGd2bzBQVkNTb3ZyK3V3SGpnbDdzaGh0Mm1QdU40RmF4RFVIVDB6bzdsN2t2?=
 =?utf-8?B?d0xPZmZDWkdPZnppWUtOMkxaUkRsbTRLa0NGWFJXMUN4U1BrR2xOb1QrcE9N?=
 =?utf-8?B?TEpmTXljUjh4a09yWGUvUGJqTmlCT2R3RFF2SzBSRGg2RS9DTlpxWFdrd2hN?=
 =?utf-8?B?dGZVN0t6M3NLNnBkREJHMHo5SW5wRS9XU0pCRllnR3RXUXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1lHbUtvaVY4KzhHQWhRd3p3YWt5eGZsQzFMblZaSk9ic1ZpS2RWaloxUUs4?=
 =?utf-8?B?Zi9xODBHVTlJVkp1SGYveU8yQitwUlJiZTlzVW93R1M3QkxPdjgzTmE0OHdn?=
 =?utf-8?B?UXVCK2V1M3I3Y1RIU0dRczE5TTQzMVI3YmZlMVhmQ3p3RDlKQ0VqTnY2SU5Z?=
 =?utf-8?B?YnRnczNpbEFTYW9BUHFaOXh0SHJlU2RhVVdoQlZUUXVVUXczRXhrbXA3Q2Nh?=
 =?utf-8?B?ZHBYSENYUkFwcmJ4WWtLTDFGSHpETE5Yb3ZpT1hjak5yQjJqVkRxZEM3UnZG?=
 =?utf-8?B?UzlZYjc1enpmQ0QwWWJwbk0vQ0o1WDdPQ1llUlh6MGxmckJFMGRSUlB3Znlz?=
 =?utf-8?B?SjlTSFVKcWg1MFMxWUczcmJ6R1hjMEw4RmVDZlA1c3FEM2ZiblNXNlBwK29v?=
 =?utf-8?B?Z2VIak4zenN6N0FxVDNSZHJkTjZSaHNTNWFhODR5VXlLRzczdEVncllhS3Bs?=
 =?utf-8?B?UG9KS3hRSDJvVUVoT1VUWkZKcFNKR2tFZDdaaTRlWWh5aGRYNFhma3RFODJW?=
 =?utf-8?B?MjJVR2IrdWV2ZUdvTllia3o2Umw1czlVdEQ3dVYvN2RtVk55c0lJZER1bkVE?=
 =?utf-8?B?dDlCUk5GVG8wZ1laQllkWFBUK1hmYXFSNVhBVnJDbWVhMDBKMDRGa0E2OThn?=
 =?utf-8?B?OG5QcWNDN1RhemhhZmZ1KzFueldEdVAwRTRtSmpIUU04MEkrL1N3REM2bExr?=
 =?utf-8?B?UjYrNEFLODlidVRIN0pacHk2ckg1NklyNDJiT1Z4bHNlTDdWeGRRVjRtZDhY?=
 =?utf-8?B?VWlFVjkvN0NBK0ptQUw1QWJvSll0eWZ3VXRSOXp3R2RPUHE0LzZ0UzBWVWIv?=
 =?utf-8?B?bDJqVXhST1g4ZUlwbDh5QVJsSlRRQllpSldxNXlYZkJIelVNa09QT1FuZkN5?=
 =?utf-8?B?STgyZW1md1FaVTRaY2hJd2VUSWdqSDl1azRGRDR3K0lacmFkRENHV2xKUVY1?=
 =?utf-8?B?RVNlL0V5SWFmdHRzOTBsN0xaTkIyUmNJWjU2YjErT200VlF2QzdwYytkWGl0?=
 =?utf-8?B?bWVNbnVBNnFZanZkRU9obEdoQzZoRWl3K0xOdTdqS2gvZ1BXNy9kMjZPdGdk?=
 =?utf-8?B?dG5XeC94dkN6Sk9QSGxnNFNyRnpCUWtuWWt5OFFvam1oMWVSRzlJOVhoWnRY?=
 =?utf-8?B?Y2JvUitINTVtSCsvZWp4THhrZVZGSFhCRW1yM0RBaDI5eUcwSWdpY3VWenlO?=
 =?utf-8?B?Z1RLbVdzR0VtM0dSenFXWFp0RDJUcFV3emMwck5jbTk5L2FGVW56VGF2QlRO?=
 =?utf-8?B?RGNTU3gwZjFrb1AxcmNwZCtPYlEzVW1ITEdDbHZUMURMeVlUeHJYRHdydEpo?=
 =?utf-8?B?VDZlRjJXWkR6R0ZRMjY2UUJOSnlPWk5xY0dZVkFyMGpTL1YxUE9kNU9nc3V3?=
 =?utf-8?B?K2ZCN2RjelRJRlkyTGRGek5KSUEvY0tEblhlanI4Zy9KZkVjSVZnSUVMdm5u?=
 =?utf-8?B?ajhwNjUwVnNGcTIzYkNHMHg0OW5jNGN5UU5EdmMrSS9ORGlLdE94dXFUaDc0?=
 =?utf-8?B?RHA1TmxqVkhxNE5keDRiZGZ2eXBhRE4zMEJrak1ialNtU1kyMjRKdHBHek1H?=
 =?utf-8?B?dTl2UTRjVGN3R0NKU2duWC9SSTQ0TDFqcEl0cVJYcjhQeC9oQ0RxWThTcklJ?=
 =?utf-8?B?WG9JUEU0UlIvaFpiK3l4dmxhT0NDanl4T21VREowaTA0bm9JdkpsMVBjS3g0?=
 =?utf-8?B?a2NGbTJXWFFRMGdkaVNKR1k1b2h1YUVNbFRqMzRiQjZRTnNoTjBQemUxeXdI?=
 =?utf-8?B?czJhOU9WYnN2UHFFUlFFYU43OEp3QXAzQmwrK1kzYXZ2REl0Vzd5OGdQeS9q?=
 =?utf-8?B?ekVHaXQ1WlVnT21Ub2dFeC8xdDJuNVR1alp1dnZnNGpMdkYxTEdLY2s1anRS?=
 =?utf-8?B?K1UzeGdBK2lSRjhBbGF6czNIT0V2MUllRHpnc3ZTbGdhNDN0Mm52SFRDRUtL?=
 =?utf-8?B?OENva3JNblB1QWVwYWNwQUNyKytDem5DMVZ0YnhlOGMvZzdIZDNUL2RGbEVK?=
 =?utf-8?B?NkVISjZQcUtZaVJLWXhMdzR6TjgyUDNjbnFXVXpjeTlVSjN4aXQvbVhZdEsy?=
 =?utf-8?B?ZGJBdGtlN0E5STZYZ3JHZXQrSWVzamlrR2IxT0RXc2pHT3VSTkJEaEUwTUFB?=
 =?utf-8?B?ZGJGY1pmWHdIVGlDbTl5ZTFjRjV0T3E2T2xMNmt6NVBNQVV1U3dxODZ2anhI?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c75b45b2-42b2-41e5-0cfb-08dd4694bc50
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 09:57:58.6091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vOrrIYxrdA3aEyRIS+RY/Ba4rk02crlg2YsiwH0hwPTM2VIJSk0rfcoL5yZJSgK/DvZGKY8boH1856h6a4xNvXplnHMso52V4D1sgPMqoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10170

From: Mehdi Djait <mehdi.djait@bootlin.com>

Add documentation for the Rockchip PX30 Video Input Processor (VIP).

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
[revised description]
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../bindings/media/rockchip,px30-vip.yaml          | 123 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
new file mode 100644
index 000000000000..d34c0974204f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,px30-vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip PX30 Video Input Processor (VIP)
+
+maintainers:
+  - Mehdi Djait <mehdi.djait@linux.intel.com>
+  - Michael Riesch <michael.riesch@wolfvision.net>
+
+description:
+  The Rockchip PX30 Video Input Processor (VIP) receives the data from a camera
+  sensor or CCIR656 encoder and transfers it into system main memory by AXI bus.
+
+properties:
+  compatible:
+    const: rockchip,px30-vip
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ACLK
+      - description: HCLK
+      - description: PCLK
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: pclk
+
+  resets:
+    items:
+      - description: AXI
+      - description: AHB
+      - description: PCLK IN
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: pclkin
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: input port on the parallel interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                enum: [5, 6]
+
+            required:
+              - bus-type
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/px30-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/px30-power.h>
+
+    parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-capture@ff490000 {
+            compatible = "rockchip,px30-vip";
+            reg = <0x0 0xff490000 0x0 0x200>;
+            interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+            clock-names = "aclk", "hclk", "pclk";
+            power-domains = <&power PX30_PD_VI>;
+            resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+            reset-names = "axi", "ahb", "pclkin";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    cif_in: endpoint {
+                        remote-endpoint = <&tw9900_out>;
+                        bus-type = <MEDIA_BUS_TYPE_BT656>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..bbfaf35d50c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20401,6 +20401,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
 F:	drivers/net/can/rockchip/
 
+ROCKCHIP CIF DRIVER
+M:	Mehdi Djait <mehdi.djait@linux.intel.com>
+M:	Michael Riesch <michael.riesch@wolfvision.net>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
+
 ROCKCHIP CRYPTO DRIVERS
 M:	Corentin Labbe <clabbe@baylibre.com>
 L:	linux-crypto@vger.kernel.org

-- 
2.34.1


