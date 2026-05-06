Return-Path: <linux-media+bounces-60535-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PJaDPT3+mmlUwMAu9opvQ
	(envelope-from <linux-media+bounces-60535-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:12:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D094D7B1B
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2860A303C035
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202133E2779;
	Wed,  6 May 2026 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Va0a8dr7"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013004.outbound.protection.outlook.com [40.107.162.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CFD23E320;
	Wed,  6 May 2026 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055092; cv=fail; b=ZaLW7jQpAzDkj0FcQJ76EfgtlmyLkxztDesXxojEbm15ucrkf2FPGHC3rn43QhHYAf8LlKPAnVX4TIhBaL3MxatbK6UXBkw7haHUMYlPgKVZBoqMk1LcR+ves+XTS+jFj0DhJcxpT5uhdB+sAdf5du8u3dQNO26yoUrQ3Y4k2WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055092; c=relaxed/simple;
	bh=36qAai0RJhfwSJ+rc6zcpKEhOdRPO5WZ2hRV05QYQ/k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AQ9OAjQDqsSA/eLtE0A/T+bqGesOkwApD19vCXXq9Pzl4XRQBcnPsIve6lQnL+eZFI4PaG3nn9mfhW3gSGV/pT46462AURo+eF+U4Q6SPE18ee0e8nh+NqThnt8LFrAEjimYorGtdCjh9RMkiyT8CXr/Q35dVJi2IQlCFqI6j0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Va0a8dr7; arc=fail smtp.client-ip=40.107.162.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuKRPqVoVMAGibbNZrYpVukkjlltRiWuwn52OVJjVtQzDhz4n9mKu1kcgm5vu+gztzAb7LU6sXhuXLk+kaZeWs3KfyqKdA9VRQhb+j2fJW3vsnwXrtfa9gnK5097MrAfr6+Zxv1SWf7yrPcdsaPZFYBkvW1N/2PqXhrWCm43qFgeOks0RkgXtdOggGR3IgLH5W+uQfHDJDK+P1Q+CGFWHjhFLBq80rqOxd9cNtMHYr32uLzzCir4x2WX4G8mRcfN8HjysWRQ6quUX/nm9UOQiGXq0Lh+eOHBoNPGd1IccSeLnMYvyrkBzlTAN/9b5QSZSlB68dUSFxcQMGy3duTxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hp/EyiPNw4N3bV6HArqeId33JgWLgg6PowjNBd66Rgw=;
 b=jkBp1Aa6YAC8juZGiPzDFpdmRNUC25NG5eE7UNwAhukOK9fgrEdN9OZ3L1ggo/VXbf8fMp3DUb9ZnicgbmkngR0NxKgtgYX/eBki9MbBvjELFU48MJZJoI6CLCHWv2muZ43CmqIxcfsCRcZG3l01yCNlJrE6qn+Kd7+kn/gaPrbqUzLT0xIJ8x7YyNriVDxrLlVL5RRDvwkB7ONc1LvPOJTwXSGPkste2763vE+xMXqfkHcZALBvppLinraCxgch3PTvjvV6qPUdSssidoj2Ool0hT1hMiVgYMHBqLGNA2adC/IjF6PvwNKIBe44gQUwNGOHPPA7N1gYERtj69vLKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hp/EyiPNw4N3bV6HArqeId33JgWLgg6PowjNBd66Rgw=;
 b=Va0a8dr7iZV8af/1isbi2cEUHdRNyIEizLiVQyoU1jsH/KwKdmrONwRdLuOtPx0Z5cMsReEewqTGF/PpaqVAG7xolYQx7w5Uh49/8Pfwv0IbsVoHmGEfR9eSjBUDtwMrireo7kMUlcTQ6PX+EqufoTtFCiqWG+z2mdeNMDLGXh7rwCYaGYZrfLr1VTRUuPSrlmBuZGNXKaWR0iJQxPCGs3fS4VlwWjIiyVCCpI8IcqpuunytDqmyoPID/QjIOSqZmUGCXiScGuwbX8dT1jwk6C4kBaOKfMOOLGKq03++VuAEhUDBY0D3KbLRX8T8cdsPu5WVu+svIxlvxa3CKQTLNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by GV1PR04MB9197.eurprd04.prod.outlook.com
 (2603:10a6:150:28::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:11:26 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 08:11:26 +0000
Message-ID: <b8c24929-449b-4394-afe3-d3517c64427e@nxp.com>
Date: Wed, 6 May 2026 10:11:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: v4l2-isp: Rename v4l2_isp_params_buffer_size
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <20260505-extensible-stats-v1-3-e16f326b8dad@ideasonboard.com>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <20260505-extensible-stats-v1-3-e16f326b8dad@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::18) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|GV1PR04MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: 10708416-d0fd-401e-4ef5-08deab4711e8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|19092799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 isDwa3yzwZ1R56WG4im35IK5r/OlmPgKcrvTK+QnlqoHZet5GKZ2rKv8qRasfPYyfo8ikPgJOHViRr4t8oi/qP9zSnwogl/qWyRm/mC4/pDzx/KVhDdJ2d20aXlHcwU5oZdqrlOJFJhIVwBFlwUESsra86B3i9Ww4og5Vr9BS5PkKBtob2EMv3ngvNelOVZEsxBjJgV/nXuoivKSGNv+CZXNwx/oo/evCoDbBCaKlJOq8frokfUbgwB8S+8A2emDHiEkCX0efmk2wCgy4R9PWWaZ8ZUvjVKAFuKSfk7Nm0xxboCZdNG5nw0gBJicFnQV2xW9uO5xjEkGziylH8jfS95gfWQVr1aGZPdq6ijDr7KADVzvFs5BLsq0WMuCYJUcPoMQSB1eFsCacNtcjHycIwaApgIdOBcZUxn/krklAkLyA08JXBISYK+3YSJVhpopCglaJAqYZ4hCNWmrS00BEhxrhGY/Mov+d+T0ff2rOOthh2TfpOiQWbiXtjj3N4zPyPD7UmfNCdOZryggxPb9+O6N+5Bj2g3rZtAbCu0E/okXkR3NELboO45mtDRO1FR1C44+JCRLgVrPUdCy8Gr/4NeGuWL9oe9FgNAf8Xxe6vGiX2V+PtSaXrhvFlUou+A3E4VKTuGoeLhjyCf6U/lYBzsxhASOlV4HnAGR53x0iATFQcTRHIJhIPBZxK80qY/r
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(19092799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?M3lkaStjNXdtSzNzbW5uWC9yUzVSMmg2Qm1ZalgxNVRQemFjSFdQTDVydE9l?=
 =?utf-8?B?ZThtR2pUU1gvaFZIRDNmc00yNmJ4YllKMi9JZ2w5STg5aUtRL1g2Y0Y1UnNT?=
 =?utf-8?B?S0puUElmR0xacnJlbit2L3AwamU1dmZEeG9MM0JKVUkvRmYrODVZdXI4cGRn?=
 =?utf-8?B?OSsyVlROb0hnenlyNWFEdk9SU1VXWnlTZ2xSQkRHMlB0aG8raUd3MlByeXo3?=
 =?utf-8?B?cHNXajliMjFxYUtaUnd0Z244VmlKbnNQTzE4TXcyWXlVMFdPdU1zc0d5UEtr?=
 =?utf-8?B?YjZuWnVSNlBBL2ZOYzhSdGdiMXQ1ckF3aWhXMW9PVFF2VUdvdWpGaVQ3N21G?=
 =?utf-8?B?WGVVaER5eU1xU1hNUU9BV0tCOTllbGNCc285YTBWL1JtUEFwNTBwbXV3dDVh?=
 =?utf-8?B?N29QMEFIRzVVWUxwa0IwdjVqWlhZdlhnS2ppL0lLc0FpNGY5YnJiaTc5TmIy?=
 =?utf-8?B?MSt1VzhKU3laRExPSHFHUDlNdVE4WWNhMWZ0OW1JdDYxbDdWSHd3NVVWU2Mz?=
 =?utf-8?B?cG9Kb2lKOTF3M3JzOExPVGdBQ0txbHlZRFR5NGtNMVhFbldzd25MK3ViWW5x?=
 =?utf-8?B?dzF0TDY3VzBoL1JvZkFLTFVLem0zQUlvYlF6cVdxT2VmOGdkRGUxY0VwdFl0?=
 =?utf-8?B?T1A4Mk15SlpvTC9SNzdIYkZNYWY1aFNFc1ltU2xrZ2xSV2psOHZFOCtSc3Nk?=
 =?utf-8?B?dHZOV0RoblNiNmRMMTlrL1YxalhHUWhEMGVRMHgwQmxUbDF5bFR3ZjNwWkVE?=
 =?utf-8?B?bys4WjQzYmRJY1N2c2pGNndFQ1lsTGxaeUZzRW03UzNZSStxS3dwbDg4YWRq?=
 =?utf-8?B?TDlIbk1EYmx1N2FzOTE3M29KZWtqK0V2VGorU1BEejNWZHc0V3ZXbFQrMzNq?=
 =?utf-8?B?dFJmMG9vT0tXeGNKdkhoakZha1VxRTlRV2prR2h1cFZaaGdWcUtxbkdRSTFu?=
 =?utf-8?B?T1RRUUs1TThsRDNNRDgyTnJvdVNmeE4vRHhicEkrV0prRTNMYU5qMU0rbktN?=
 =?utf-8?B?YXEvV1JVeXF6bkpkZ2cvdDdSR3dFRjgzMkpvRnFXSFR5WlpwQWQ1YnUvYVo0?=
 =?utf-8?B?eVMvTTZ3T0ZSUENOWDRBMEx1d0dMSjJBVDFaWlgxR29rUFFMNXlYR2piS096?=
 =?utf-8?B?dE40UlFONjYrNUNyYjB4ZlNXcVBhM29lTFFxN3kvYmZJREtoVHpnd2Flc0Er?=
 =?utf-8?B?SlJxWEFpaUowdGFiMHdCMjJkUXhyRkIxNGprWGUweXZ6bDdLWUVncmZyV2lo?=
 =?utf-8?B?c1J0VkszWjQxbEhqT0VZa3UxZVhEdWJpLzc3L2xTUUxBdDBKeVNZOEhlR2RT?=
 =?utf-8?B?WVYwS0Rpem04SFpuaTFHS3JDSHd0ck4zU3dZd2lYNkczTlhkVlk4clp3Z1ZX?=
 =?utf-8?B?WStqeEpkQ2d2UnhrcStNTndJdU9RWVFWbWZhdG5sOVM4RXBGY0hjQWpwMGpQ?=
 =?utf-8?B?ZFlleldROWRwRDBMeTBtcVplUWUzOFB1R0ZiMWsxNExYQSszWXpaOENkNnZa?=
 =?utf-8?B?V0cxTkVkcW5tWWRiSWdSR3oyLzJtdXpQdnQ1bDM0eE4wUUhLQUZXZEgydnNO?=
 =?utf-8?B?NHVMZnZjc2E2aEY5d3B4RXBoa21aTGNWNDlNNU9vVzBGUWlCVmlETHZUMmtT?=
 =?utf-8?B?Y25vMkJ2SlpKTzd3MjhtR01ZM1A4bitKUnk1MFhKT2tyY25Jd2Zic3YwRDhu?=
 =?utf-8?B?RjFYclJvVG1xNjJoNVFLWU13NVdFbDh3MDV2Mi9ob3N1VE5vSHpRQTYydDli?=
 =?utf-8?B?OWNZRXg2NTlUdHp1UGJvTUZTUWxxSFFsL2FnaXlCMzV4aE45dWVMUzRPWXJL?=
 =?utf-8?B?c1FDQ00vVEQ2RjBRL1NpNzVZOEowZzZuQUxXWkVQekZRTXlmL2ZjdEU5K1dC?=
 =?utf-8?B?L2ZrbVY3V3RnemVlUENkQ2owSlI1dUlERTVqcXpJeHBPZURucTZGdVRybG1k?=
 =?utf-8?B?dmMyNXplb1pJQ2d3SUNqbXFyUFFmdjN1V2JaelNycjY3RG9NNEwrSUlTL2tZ?=
 =?utf-8?B?bjRVelgybXFoL25BMWVieFF2a1FEOU9XWWk4MGFCUWJhZDUwcW5LQmhSY0Fs?=
 =?utf-8?B?aWlERDdTM3lqWUJodmlBMHNBRDU4YXBHRTg5OFp3YVVGN21ZRDFleXppWWxj?=
 =?utf-8?B?bTcxN3FsZlNsYy9WYVJFZ3NZSHQvcDJzaU9IdlpIWDFaKzRoWllKelh0ZTRa?=
 =?utf-8?B?U1FVVXdudEdOQStPLzJiWi85NmlzMnY4L01mdjhSSmE3MUUwbEY4bDVPcXB2?=
 =?utf-8?B?aXp4cm5SOWJ4OWxweFN0UG9MM0xRRE0rRlBDc09lSElyK2lRRk1UZjhRL1dr?=
 =?utf-8?B?RGJuN3hJRW9EcFU3VXZPMTJOazFVQlUwNkF0VFdRUWVjRFBZaUpVdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10708416-d0fd-401e-4ef5-08deab4711e8
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:11:26.6191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2EZuOF2RZtO41kqlsQRVz3PE2lAXeHfnRQHrjQPkWSo6NBLHDOcW1FU8EBECEVa2Kmu3Nd1y0VopjJFmM55nNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9197
X-Rspamd-Queue-Id: 36D094D7B1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-60535-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,nxp.com:dkim,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 5/5/26 4:12 PM, Jacopo Mondi wrote:
> 
> 
> Rename v4l2_isp_params_buffer_size() to v4l2_isp_buffer_size() to
> support statistics.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   .../media/platform/arm/mali-c55/mali-c55-params.c  | 12 ++++++------

Hi Jacopo

Is it ok to meld driver and include changes and remove all occurrences of
v4l2_isp_params_buffer_size ? Of course it prevents build errors, but 
what if pending changes are already using this macro ?
  >   include/media/v4l2-isp.h                           | 22 
+++++++++++++---------
>   2 files changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index de0e9d898db7..dc483f0322d6 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -487,7 +487,7 @@ static int mali_c55_params_g_fmt_meta_out(struct file *file, void *fh,
>   {
>          static const struct v4l2_meta_format mfmt = {
>                  .dataformat = V4L2_META_FMT_MALI_C55_PARAMS,
> -               .buffersize = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
> +               .buffersize = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
>          };
> 
>          f->fmt.meta = mfmt;
> @@ -540,13 +540,13 @@ mali_c55_params_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
>          if (*num_planes && *num_planes > 1)
>                  return -EINVAL;
> 
> -       if (sizes[0] && sizes[0] < v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
> +       if (sizes[0] && sizes[0] < v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
>                  return -EINVAL;
> 
>          *num_planes = 1;
> 
>          if (!sizes[0])
> -               sizes[0] = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
> +               sizes[0] = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
> 
>          return 0;
>   }
> @@ -556,7 +556,7 @@ static int mali_c55_params_buf_init(struct vb2_buffer *vb)
>          struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>          struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
> 
> -       buf->config = kvmalloc(v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
> +       buf->config = kvmalloc(v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
>                                 GFP_KERNEL);
>          if (!buf->config)
>                  return -ENOMEM;
> @@ -583,7 +583,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
>          int ret;
> 
>          ret = v4l2_isp_params_validate_buffer_size(mali_c55->dev, vb,
> -                       v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> +                       v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
>          if (ret)
>                  return ret;
> 
> @@ -593,7 +593,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
>           * changed to the buffer content whilst the driver processes it.
>           */
> 
> -       memcpy(buf->config, config, v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> +       memcpy(buf->config, config, v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> 
>          return v4l2_isp_params_validate_buffer(mali_c55->dev, vb, buf->config,
>                                                 mali_c55_params_block_types_info,
> diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
> index f3a6d0edcb24..d70ed6b431e7 100644
> --- a/include/media/v4l2-isp.h
> +++ b/include/media/v4l2-isp.h
> @@ -15,17 +15,21 @@ struct device;
>   struct vb2_buffer;
> 
>   /**
> - * v4l2_isp_params_buffer_size - Calculate size of v4l2_isp_params_buffer
> - * @max_params_size: The total size of the ISP configuration blocks
> + * v4l2_isp_buffer_size - Calculate size of v4l2_isp_buffer
> + * @max_size: The total size of the ISP configuration or statistics blocks
> + *
> + * Users of v4l2-isp will have differing sized data arrays for parameters and
> + * statistics, depending on their specific blocks. Drivers need to be able to
> + * calculate the appropriate size of the buffer to accommodate all ISP blocks
> + * supported by the platform. This macro provides a convenient tool for the
> + * calculation.
> + *
> + * The intended users of this function are drivers initializing the size
> + * of their metadata (parameters and statistics) buffers.
>    *
> - * Users of the v4l2 extensible parameters will have differing sized data arrays
> - * depending on their specific parameter buffers. Drivers and userspace will
> - * need to be able to calculate the appropriate size of the struct to
> - * accommodate all ISP configuration blocks provided by the platform.
> - * This macro provides a convenient tool for the calculation.
>    */
> -#define v4l2_isp_params_buffer_size(max_params_size) \
> -       (offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
> +#define v4l2_isp_buffer_size(max_size)                 \
> +       (offsetof(struct v4l2_isp_buffer, data) + (max_size))

Shouldn't we keep v4l2_isp_params_buffer_size for compatibility ?

BR
Antoine

> 
>   /**
>    * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
> 
> --
> 2.53.0
> 



