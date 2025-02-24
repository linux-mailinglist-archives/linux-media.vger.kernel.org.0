Return-Path: <linux-media+bounces-26766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8EAA416E9
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EC963AD4D2
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 08:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA197241674;
	Mon, 24 Feb 2025 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JwQ0+1Ve"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468F619B5A3;
	Mon, 24 Feb 2025 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740384448; cv=fail; b=rNO5D/RxbXqzOtu+OOuOfYEYKQ7IiloK6vhOUvHbaRNKB9elnvY5eabn+OPyqPIGitRNbIBgwjQRN7NcO+WsgSN50uyJQ1Vt6wNpCtCT7YGt6TulNovdiYqc2S0crbxaXVi3HZ9DUQP05pK0Rb7Y858fC8sxLMlifQTPvkj+oYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740384448; c=relaxed/simple;
	bh=XBC3X2F8uXgnO24wqvNe9eAW63aTAn04rAKaiVRUL2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ewJfPjXFxXyLYUOSjccFaD6UDoWKJzr4o0EJEy0Pxlbc4TRVOxqo2lXxmcSSymK1PRywk1WBIQcKiOUpd/FHYOpmljawmi7L+sZdIVNf+rG3mXbfSvAFIZgRbmvEBWy92Ie/38vYcKnmmSd1BEp3kL5n4ar7kurE4Sqq0x6akLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JwQ0+1Ve; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiMF4Dm2LIXSGnKvXMZhV09M5+CwTjjvzfbH+ALZXDlMtvT85LqJ9JXSkJaL+f9rfgRrlN+x9io8vXZ0DdtQ2qIDtKW1gt4nrdBkt80tAou9iCKJvzn6uLus/RVqCAq2AP1t8SulNsNPEXCdVIifuXQ88ZMRmdiDNcFEVsYyQLwH2cum5qXR3qhzVue1Fqs8I1swiVqlFJMsdPbzSd4dnB+Bz+9h95omiDfjjraBRBi2C0ZCRGmI5RkraXEQhZeRCPhyLVOm6ZNW1lu3z1nYkCeAUL9ZM+KgMBRSCeWWgU6vqP1fuwPesnd4vq0MalQOUNL6jrYmmtOSRbMno3c+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVKwAxIjWjxUi3p4WZOtPJVpI5+a2zwZWcG0tfMt+Gc=;
 b=v9NTJVT/MLSaKwDkkb+/9o0MQ4xr9wv8mxWIEyYMDoNDmWGDy2pLdzFxlw+XbYegBN3Buj6oJlbMX7gxPUbj145Qiqh6n+eY4rsRAPaUSbSszJXAIyCmSKAndxbUWGFrHfhvCaGcsI/hMQWOvLI+2UVTbDBBDecsE3kD987GhjSsPbmkVV/NZ1miSI1UKcqol8NhRpFNIcjx2PdJUyO4V9ZA55md/plmZv4JzRco6Z24o2qFLerFeFsnp8VrzTTB/FdLkRb1ndpSEbfO5e2b8oJ+AWv1C+Xs9HKWfmuhJ8tB6aPhKQbZiA37oxfuYOPO2y3d6LuO43uHTNlvLA3Lkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVKwAxIjWjxUi3p4WZOtPJVpI5+a2zwZWcG0tfMt+Gc=;
 b=JwQ0+1Ve0xHTAam6NKt3qQ552ravYhcGK5EHILq2cLJAlCc+rf5c6yxlpYmxl3qHQhY3RVpPZ56G5mup4Te3m8If0upNcE7hNVV6JO6u0FdoxZz/5SD/3HQIfQtUGbcnryChtI51VAQnCkXaUSZCHW3yK5x8SUOQXX2G35FCgL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY3PR01MB10957.jpnprd01.prod.outlook.com (2603:1096:400:3ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 08:07:20 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 08:07:19 +0000
Date: Mon, 24 Feb 2025 09:07:04 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/18] media: dt-bindings: renesas,rzg2l-csi2:
 Document Renesas RZ/V2H(P) SoC
Message-ID: <Z7woqD7DlVEz3vTj@tom-desktop>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-2-tommaso.merciai.xr@bp.renesas.com>
 <20250223180855.GD15078@pendragon.ideasonboard.com>
 <CA+V-a8vfipunwOoe0=dfP6XMjQUW2OrpqBsy+j_ZVu1AAc55WA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vfipunwOoe0=dfP6XMjQUW2OrpqBsy+j_ZVu1AAc55WA@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY3PR01MB10957:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da8e3eb-ecf1-41f2-3019-08dd54aa42af
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|1800799024|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RC9HaFlDT2dXY2RSUUo1ZjN0ZHlqSVY2bjYvdFJUQm5iYjNmdjh5YzJnSjBW?=
 =?utf-8?B?RUEvbEN5YkJLclZaTGdJTUJUMElxdGxtdTZ6NDBlVXozTnRjeURlU09BVFVn?=
 =?utf-8?B?bVJDZkRsdFpYdU9SQTVQcGdHNHZTNHlMMEFaeGdGdmR3WmdpNjR4WVJLelR5?=
 =?utf-8?B?SGVxbmdCYll5UzMrVzZ2ZWxMM2ZJZGZiMnNPd2NQMFdVdVd4VERmbkNUOUVr?=
 =?utf-8?B?WDJHVGFXZFpEam9QcjZRMzZnRE0zeTF0N3c0TWN3ckRRSlpLZkwycXhQaEN6?=
 =?utf-8?B?WW4wUlRYc0ZoeXhhSVNZSTBaWllqQnpXOEYydkRWcWkraXVQSjhRbzdhNkZL?=
 =?utf-8?B?SjlXSjdkMGIyTlRpOUNuYUxyZkxtOGhxZ1U0ZjVEcURNSElDazlrNzNsRnV5?=
 =?utf-8?B?UEp6blhEdUI1WlhaODVhMGs1TEFNNzFhWEgxTXF6MXpUTnRHMzFxbEpkSHJl?=
 =?utf-8?B?bEtONHJFWlRhL0dqc1VrU2F5UVh0bHVQWklrVDlTeUtZOUpmczBENzU5U3FZ?=
 =?utf-8?B?YVF5elpxWHVyWDhoTUljM043MUhJTFY3b0NzWHhpbHRWSzFETmRCYS9FaUdO?=
 =?utf-8?B?YVlwUlNVbEdSQTYxVkJBazhnYzRJMXp5dUJ0ZVhTOUxRT29Jck1tMk4yRGVD?=
 =?utf-8?B?S2QyY2haelRsdmJidERJUS9GbEtHRWYySFh3dlVrODZtNmp6Nk5XcXluNERN?=
 =?utf-8?B?RkRQUUpHVXNsWXh1M3BCS3pnY1BqVWNxZHJ1QVc3V1J4dUdyb3gybkJJeWdK?=
 =?utf-8?B?WnRybmh4UW9OUHVDK28zb29kWVZ6WEdRTStTR3plaUhqVjIrZDdNSEtIT1FV?=
 =?utf-8?B?TExVbktWWG1KU2cySDV3a2JWWCtLb3Nkc3A3TGR0SUdOZzNselpmc1ExeVNl?=
 =?utf-8?B?MFFjQnY5ZURJVFlXQ1NYSkNRQml4VWJ6eGxGZjE2ZGtKL2ZoVFFPeVRrYkpv?=
 =?utf-8?B?QWQyREp0SFFtOFl0L0hHcUh0Wng3ZGlWRHQ3UW1scWNnVWFYZDc1M2ZLU0Q4?=
 =?utf-8?B?TDdGWlRuMVVnemVlSjlSZHlNU2VkVXBWRGllQkdDa1BVS3BtWDJOZEFCQkZU?=
 =?utf-8?B?Q2drL2p0c1RwZXlTdjVEVmhaeWw3YmdQWGl5VVBlNnc3UXVwVXk1TVh4NHN5?=
 =?utf-8?B?Y2hBQnlMTk9oSlMzV0hhZFRHMWk2dFNGdmlFblJkT1Uwc09jOHh1QW5McXc0?=
 =?utf-8?B?aVprVWRLTkw0ZVNRdEgxdStUcnZVK3VjVDVsNEYrSVQ3dUNXV1c4T0ZpSlFJ?=
 =?utf-8?B?WDVpT3NYSHB5aktWcnF3cndsc2hUVDJHeEJhalh2SUVvZlpIRGVpMWFobXBE?=
 =?utf-8?B?U005TnNOQ1NSOUNMSG9lMGtwTkRJbFVpMVFIb3pxV1ZaeGtRRzFKR2UrMlVO?=
 =?utf-8?B?NisxSXpHbkhLaFNFSkszZkRBdG9mampBN1NyTVZQcFlJM2Rtc08yY0owTzRz?=
 =?utf-8?B?Um0rRnVzbVJaK1ZLbVg3RUJHSWxPKzdFY0FtRHJFODJ3VGF5WWFMdXc1WGlS?=
 =?utf-8?B?ZzA3VkRLQzdXRVNjRmFJai9YN0grbmZtU01BTnFFZ1RkY2E3d2tFVWJBNmJ2?=
 =?utf-8?B?WkJLa2lTZU9lbzM2c0hxS2h1UURiV2U5SjBpaVU0MW5tb3cyczBWOFRXeXJM?=
 =?utf-8?B?ZlNkZm04V3lLeHV1eFRBK1dkR09FUnF3QkJjSkg4MlJMcjZVbEVSVlVySlFo?=
 =?utf-8?B?SStzWmkvdUsveWpjMDN3QUFPcDc3cmhxVlNMSzBlSEZKSURLc3RqdVczQmFE?=
 =?utf-8?B?RU9ZK2lXQWFjZGtjTG9SZVJsYmJpb3lkL0FYekNPanhyTUtOVjNtVVJDQmt4?=
 =?utf-8?B?amVTMGs4cUo2ZThSWEh3V3MrZGFiYTN3a3RrOGFhUWlGQUFjakZuTlE1OVI4?=
 =?utf-8?B?d3JXNHBsc2dNa2JWalZqaTVLbzhNQVFieUQwMVRlS0x2NnVMOEFwd3JTYU9o?=
 =?utf-8?Q?b0nzczwqSKwLcN61ptID4ubiS1E9Ne67?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?d0ZkQjhDUnJ1NEdUbWs1VC8waW4xeTU2YzNPeXhrNUJiemFhc1NCdnZxcmVT?=
 =?utf-8?B?bm00blg0ZjVwdXdpNm0zb2pDOXR0c3ozVXA1STBzdXovMHMzUTVoSXQ4OWNk?=
 =?utf-8?B?UmwxZ29pVm9id0MwWmNXNDFvcFg1UVFFNkxIRG16WW5BR2tmaFJjbHRRTGho?=
 =?utf-8?B?TXBPS3VNbG9BWG40T09UUFdOWHVDQWw0V1BGWk9EUXdSeEFZZDNOdzJNTElj?=
 =?utf-8?B?Wi9Lck01VFo4MmhrY0dFcEhUTUFuR05Pd0RuTHRLYW5PSFk1ejYvdjBnWjli?=
 =?utf-8?B?eDZaWXlrM1lvMEt4UFVBMTBhNzdsZXU1SlRDVVgxY1lLNmhUaENLUDg0Y013?=
 =?utf-8?B?K253ZThZTzZaYkRFbWo2RXhqUEpzWm9RL2tWSENSUVlLd0c0ckpFckJFS0lK?=
 =?utf-8?B?cnYwb21GcElFYkpvQXVWbGZaTkNlb2NZNWE1aGlTV2RXREUzeUNiMWNHcHpr?=
 =?utf-8?B?dk44MERySWRLMjkwVUxTOUNFRGtldlVwYWZOelpHcEJ4Vm9iR2dGRmV6NS9y?=
 =?utf-8?B?MGdWa3pHaFVmcmZTTXFHQ1lYNFk2c2tEa1FBTXo5dFBJalUrNkR3dkZWc2RR?=
 =?utf-8?B?MDFFRnlzTVJOc2h3bUQzSjFxTnVEMklqZ0pvZW4xM2M2V3hEbDZ0VTl0Uzdj?=
 =?utf-8?B?WG9WSG1VVmRGOUNZVkFXWENzZ3YyV0tmOEtzdmQ1MkFnU2J1N1cxbTBvbHpZ?=
 =?utf-8?B?aGI2Y0FTVDdnVkhDOFhLbGNrMmJ0bFVuWVVKRVhMU0FhUFJoR1A4ODVtMHAz?=
 =?utf-8?B?WGlSV3oyVmo5NWhSWjduL0xFSFdHbm5URnlaTVZKa3ZtbmF5TXU1bHI4cHFW?=
 =?utf-8?B?TUdYRzNtblNFZDRpc1ljbUNvd3V3enAvMFJ4dnV1MG95MGdQSjFqUnBoQXFT?=
 =?utf-8?B?V0UxSlNzREJubVZLdDgvWG9UQVdnQWg0Y2c1VnBNRWx6WkpHaXc1ZGQzVWpM?=
 =?utf-8?B?OUJ4Rng3dEp3TEowWmlpQzFCVjFBeTlBSDFWd2Zlc1ZUU1hOTUhyOEVoTW96?=
 =?utf-8?B?M213Mk9LTjhycEV1NEF4UVlyT3FDdkREdFVib0tLdWpTMVVwRXdlTXhUWS9X?=
 =?utf-8?B?YlUzVTZVSDN5Q1Y5eUwzL1pabVYxRU1tTjhVYkQ1VjZ0NWk4VkFnWHVseUlw?=
 =?utf-8?B?YlBsNnNmcmZUSzY3VmZiU3djVEhYWTQ4UkdTc1VCeTVydzRNcG5heXJOQzcy?=
 =?utf-8?B?UHR5aDRFTndxTVk4QU9FMFFxUnBtTXpxT3B5ZW5kN2ZpM0dQNzY0QklqandY?=
 =?utf-8?B?N2llUkFYV2VlVElHNnlmRG81VEEzaHNqS1pwM25HallvbVJpUWU2Q2ZhdzNv?=
 =?utf-8?B?RXduZnhYcUdPMHFFZTRKTENLQldacGZqckM4cnFNajcyVWZCQ2tPMzVrU1RK?=
 =?utf-8?B?OUxFejd6THRUSi91WG9sbFAzeEdNNFlWa0NNaGRmVlpaT0xSM3pkVlVzNUUx?=
 =?utf-8?B?RjhEdmFBU21JMkZuQW4xVzRFU1N3ZzBnclNMWTAwLzYzcExmeG9QK09Wdkpm?=
 =?utf-8?B?elc5WFRlM2E0cTRIRXNXb3FjN0xGdmJvUElpZnQycURCRi9hcUcyMVhCWERJ?=
 =?utf-8?B?KzR3YjhseGhhclQ1TjJyVUdoeGxEV0tMWUxqMDVCSjFyUnJkR2QzTUw1Vmxq?=
 =?utf-8?B?UkxSTGUvMmtpK2V3MGp5NzBFcEhqOWphdEFZMzRpZmFDZTVzMHVUSW5wWkcx?=
 =?utf-8?B?dUpQVTFzWVFYOGs0c2FpWUlkTlJUTnE0cis2aVpFUkdIT1VYRmFJb01CNU5l?=
 =?utf-8?B?TEtLd0YyNkt5V3c3d3VKOFZnMzFJdlIvcjZlVzZDN3RwM1owaFFHUnh0Nitw?=
 =?utf-8?B?NFVhU3FSaXFNOWZOMnpSVngvb2dpLzhBRlFLTWE5SG5sTzFUVWNKYzdlakQ4?=
 =?utf-8?B?WDhkRDRBelBSZmpHUmZSM0JLdDlLSkZEZ1ZFRHdBVzNabkE5TnNIM3lKWXhi?=
 =?utf-8?B?aVJ4WDlCN201ZC9sWDZFbklZdElicmxwYTBHWTRTRVI2ekxYb091dG9YODdt?=
 =?utf-8?B?Z2ViS250UUR2NHBFaEtxSmp4SXY4RlZNNTh4TkJaa2JxWWhucXplWmxjZXY1?=
 =?utf-8?B?VmU5SlRVY3Y4M3dmd1YxUFdCWVFRVDFaL3lOVGl5N3J4eVNuS0htWGdQLzl4?=
 =?utf-8?B?RTBJU2dXSG5TanpsdDFDdHdGRDJldlU2QWxOU1A0aW9YdWZSL0p6K0QwZjE2?=
 =?utf-8?Q?jBBMofzXXX4xvzkMkVuqNrY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da8e3eb-ecf1-41f2-3019-08dd54aa42af
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 08:07:19.7732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZDmv8SN2CIEbXyHJ6AfY4MuiOPK4qagTtBdxDdD6kjF/1kv+G8U4bnNUcnupsFNL1jWFSnl2NzOJkyCmBYvGihtm+C47EG5U2upgaG3bkJ889Rb0horsNfx/CxR/7kG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10957

Hi Laurent, Prabhakar,

Thanks for your review.

On Sun, Feb 23, 2025 at 09:00:48PM +0000, Lad, Prabhakar wrote:
> HI Laurent,
> 
> Thank you for the review.
> 
> On Sun, Feb 23, 2025 at 6:09 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Tommaso,
> >
> > Thank you for the patch.
> >
> > On Fri, Feb 21, 2025 at 04:55:15PM +0100, Tommaso Merciai wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
> > > found on the Renesas RZ/G2L SoC, with the following differences:
> > > - A different D-PHY
> > > - Additional registers for the MIPI CSI-2 link
> > > - Only two clocks
> > >
> > > Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
> > > SoC.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > Changes since v1:
> > >  - Dropped empty line as suggested by LPinchart
> > >  - Fixed minItems into else conditional block as suggested by RHerring
> > >
> > >  .../bindings/media/renesas,rzg2l-csi2.yaml    | 59 ++++++++++++++-----
> > >  1 file changed, 44 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > index 7faa12fecd5b..1d7784e8af16 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > > @@ -17,12 +17,14 @@ description:
> > >
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - enum:
> > > -          - renesas,r9a07g043-csi2       # RZ/G2UL
> > > -          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
> > > -          - renesas,r9a07g054-csi2       # RZ/V2L
> > > -      - const: renesas,rzg2l-csi2
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - renesas,r9a07g043-csi2 # RZ/G2UL
> > > +              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
> > > +              - renesas,r9a07g054-csi2 # RZ/V2L
> > > +          - const: renesas,rzg2l-csi2
> > > +      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -31,16 +33,24 @@ properties:
> > >      maxItems: 1
> > >
> > >    clocks:
> > > -    items:
> > > -      - description: Internal clock for connecting CRU and MIPI
> > > -      - description: CRU Main clock
> > > -      - description: CRU Register access clock
> > > +    oneOf:
> > > +      - items:
> > > +          - description: Internal clock for connecting CRU and MIPI
> > > +          - description: CRU Main clock
> > > +          - description: CRU Register access clock
> > > +      - items:
> > > +          - description: CRU Main clock
> > > +          - description: CRU Register access clock
> > >
> > >    clock-names:
> > > -    items:
> > > -      - const: system
> > > -      - const: video
> > > -      - const: apb
> > > +    oneOf:
> > > +      - items:
> > > +          - const: system
> > > +          - const: video
> > > +          - const: apb
> > > +      - items:
> > > +          - const: video
> > > +          - const: apb
> > >
> > >    power-domains:
> > >      maxItems: 1
> > > @@ -48,7 +58,7 @@ properties:
> > >    resets:
> > >      items:
> > >        - description: CRU_PRESETN reset terminal
> > > -      - description: CRU_CMN_RSTB reset terminal
> > > +      - description: CRU_CMN_RSTB reset terminal or D-PHY reset
> >
> > I'd mention which SoCs these apply to:
> >
> >       - description:
> >           CRU_CMN_RSTB reset terminal (all but RZ/V2H) or D-PHY reset (RZ/V2H)
> >
> Maybe RZ/V2H(P).

Will fix this in v3 using:

	- description:
          CRU_CMN_RSTB reset terminal (all but RZ/V2H(P)) or D-PHY reset (RZ/V2H(P))

Thanks & Regards,
Tommaso

> 
> Cheers,
> Prabhakar

