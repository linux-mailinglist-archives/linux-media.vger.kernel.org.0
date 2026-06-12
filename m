Return-Path: <linux-media+bounces-64744-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KL0hF3NvLGpTQwQAu9opvQ
	(envelope-from <linux-media+bounces-64744-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 22:43:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A85EC67C5ED
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 22:43:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=o5eC6782;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64744-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64744-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD87331CAB57
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 20:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9DE357CFB;
	Fri, 12 Jun 2026 20:42:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA84F347BA9;
	Fri, 12 Jun 2026 20:42:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296976; cv=fail; b=sIXLawivNkU9YL4VoR48vxdNUibPQs+qX0F8HsyE5FsvDs/otR+FaLz9RlkDEUDgKjjBPNkkGKJULfnxSV9gnum6ktyaDFDZFDo+atm5AGiHK7zpqPST5HoHBhG3k2z06OU+eZy61QvuhH/HS3iJiz7Q2m3PDRj+zSHq4o8+o1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296976; c=relaxed/simple;
	bh=HBSWh1L7tVvejbxl/wsExeafPYFfF3C3p8tjwUms86g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LU3CnjY4RLzO06Yl7hR/oLU54Pfv/pGX7TpK2og3Xeuz9dCiS7ijOGuScj6UG79fkDE3SVeQ4nkcuEX2lHIp6Fot/moMvbrOfVjL7aZii4i0piKr8IuuozFScIGjn7btZnfMSyy4D0u0uKJAoy03bkyqywylztpGR+UiwN2js4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=o5eC6782; arc=fail smtp.client-ip=52.101.66.20
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJgB2bFyZ7A6GEvh1OdxMjJvdYiDytVxYaHP4sWPoj5JAsf0dCQpTWCuwAH6UeOmavueGuhnkMTnemr9mD4VrXS7XQjlN6vDPH5Rn3SDVUxJXVR5WjM+/Fanxjbru/wI+c9krdgMpujUhg6GaSkM1tr8uNpWR9A6rjPurMuoosgiLdSM8Mvw0PJpYlteb5Pm4wBWvPWzynpkmLbTB9BOF+CtgkJ7nfQmR/Cx/vxE/l/OtxJ86+HedTIbmFEHBlHy8zTfE83xNPj/ETRC6HWmvfa924ZcA+wcEHK0E4Zp+A4thQTjTfJd2MsXALYmjU5xFSFu0CWzALDAktLqwy0MAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlYH4N2p2i9+rKI8wAS684hiishN46hYH5UPxwNAbFg=;
 b=xTe7KNFY2LQlNidykQUdf1JBOZiD/qSWU2V7K6ACmveiDR/INHlA1OMXVqzX64+PX51Eua5nQyYD1reEuiVZjReKK7rVFcsmlOlQYOVXVJQodh7ag5ZEgo5Swt560uO/ett/iWnTvU1GFZwVmTMQOG7lvZwpD6Biboyma7q68vYjfdlMVWDToyzrH/9CEQXIxtFcRM9BxzrQVuraRMU7m3Iv9L4mDDpZnir6LXS9zyyvctKOw/OvjJMZm7qU3h1REaHTG/g0J70WitA+XJkeEDnvDA0ZYO2JgaGbYRv9tvWiHTSomrqd9sFUKahCFCKobu/aNQGt99vNI1vN2rVpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlYH4N2p2i9+rKI8wAS684hiishN46hYH5UPxwNAbFg=;
 b=o5eC6782IUT+giHVYOZoK6QlW9Dxmj3zrVp+Om9MpC3Ol54wNxCwTlVpdjvHvKUAT1CL28jcXkCBb8gmFGOpcVuFWP/6wYBgXGGfaHaVUvACKebCMGN/bSWavr4y1IlHHB8aZqzI4feN1e+lcBVi1NXUEdNgMV9hwuiFPeZM+Ujv9PG6Czl03Woafc06MV5QyEGZnyowex6bW0zK7xQHmi71PmazotxL5UnAjkrl2lmB/zO3PaP4FxNhJKyJ+7f1B+1yXeTy88TLtHZP4hupo44in2L51PgKFRHwU1aR9mzpEtP7zBKwyby3YNyncq+Ap/d1wSWRvatC6Y6gXN1b/Q==
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 20:42:51 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 20:42:50 +0000
Date: Fri, 12 Jun 2026 16:42:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: media: qcom: Add JPEG encoder binding
Message-ID: <aixvO3-mt9QIlexN@lizhi-Precision-Tower-5810>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
X-ClientProxiedBy: SN7P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::15) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PA4PR04MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fea2d29-f041-4051-c220-08dec8c32a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|19092799006|1800799024|4143699003|11063799006|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rhUgLEgQLAm6/s4lTGV4vZSnnsFw1Hl5qq1/76+1cnf49blgFY4PRt4tEFBkRb1AnCspAFW2O+DlYW9o+k/DzTUVBoIKLd3NUvj4GKqngwdud/ffsSzvf4gKD9R9TaU+2AVbyg/0dazJeW1hZ7mDUX6b+DKN5SW+2MM+3SPEK5AyMFA2/Ld6u8fpvDdqguuZxKImMd+2cwThArtbV4pMjZI5ZXLJxIf819qVTVwE1PAHDeJKmlN5hFU0OGpFUkiTqUbcUkYiY9R9VIpYzpsxZZ5gSgj31xlbTSokQS1lgDZpZMh2DBT2+GgIp+czS/f9Dnoy+GlrIoH/WR8XqBPMoaLWxfKbm/LUPiaf/aVVfSH2MyK13WY0UMtyYC3j7v9NL7UTcW9e7pJVSbTom7wD4IxprLhXDQ/iI+YQI0PbtcU3r/PM46MUjdvDcA86L7G5HbJrsByGTx23Nx5Ac0iTn8n7To9pk6OAZEszuJFe76Sg6ay/yuoYSyc0n46dDwiaosEzCPwusxYk/6PVITdGtommgrPlU0fCOw1lBva6YlGOJlC48lKOhpmoYuxPQWN/O92G5M+haLEyEILf5cZfMT9xEymZi0W7Ap/sev3DigXdX+tJ6QWuVxr6L0egIixV7sEY9S2ZWhE7p2frYYdZ1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(19092799006)(1800799024)(4143699003)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D2VMe4GXEggo2np4WXtIoDuiVxHO4YwK7wFHjak3KBreYjKsln7STDuZon/f?=
 =?us-ascii?Q?eJy0mOJuJvzvJUYuTt0GLFSTXcba8Y8EX2d3s4rFyNmap+96Unw7UFuxuFZ3?=
 =?us-ascii?Q?uuDf2myKW7DwAs54jFjLozkwb/2roudhqT2c+k+qNJ/d5zzSH+i1dGhRo4pe?=
 =?us-ascii?Q?HTa67lg2w5aQaX6RAbFQV+QfqTWa46O+ggrJQsCstHG7FA4tMWVD+gGDqt07?=
 =?us-ascii?Q?JhXB1jDqfIoc9m2+EgbKR50RtWXUhn/5W6v7x5Tw1yIiswqSaSAPtFSFEuoX?=
 =?us-ascii?Q?9EKVuAnl0xL6Ojz7AFIwyqGZc2rbjUsBdfT31W5C3A6Owhqttyqv9ObN/Qtt?=
 =?us-ascii?Q?6fI/LN8uCMSXaepp4HxbTr1w+lAti9KM6KlvJMvSPPORRVR5e7VT2QR9P2K9?=
 =?us-ascii?Q?dV139yJmP+lA6P/hObEqzNyo6zi4pzkF4Ut59Ehky7eN6jDhkQCDPMvB9Yk+?=
 =?us-ascii?Q?Y6v3/WdLLFlP8071KGoWycfoOzC3gXJYukB055Tw3Tu3ee8T3MKsikOxK8kt?=
 =?us-ascii?Q?72yLLaXk6Lg66JvSQFEqWWliBfU/u4gQ882lumZJoG7yOIEJ+lEZIsLylybQ?=
 =?us-ascii?Q?tPUt7IZp1tRoTQ0C9X7h78V8ZiQxbigTByyXJyXD9oqJUBhC3NgUPblkVasv?=
 =?us-ascii?Q?sxb0iH6NEB57rY26TPJxHlcneXG02/Gh1M/BbowWuYHWRsmV/+Bmxc38xcIm?=
 =?us-ascii?Q?ipgNkMZPBNi82w5D7TVscuOVzt5eMnm8ORcssAztCCnV1mWYhvVs8daH0xJd?=
 =?us-ascii?Q?/ylZ01UmvbBogE/BNmF7s+yI2uuYD5xKppjQQHXyoVEYah9ZaR5mNenB/MWe?=
 =?us-ascii?Q?WlYh1s4AbC7W/uirBNhQkVhc0QImGIW5X90J0J/87zDpUeJjCRwZVzp9ZS4j?=
 =?us-ascii?Q?Xd+8OqnniJW8xCAprVBxfdTRXIy3iPyYpmVtg+ByDo+btwJ+QVj+qlHF02tm?=
 =?us-ascii?Q?y3A5MQYlNrSi2cTTTwMIqr7cw0GSg7VyJG3WSB2GS32GlizWfPVt7a7tQqiB?=
 =?us-ascii?Q?vzkCOiNw4w+ezXn9/Rao9xPpKYl9CMplsf/f628OKkfVrqQAdWLPrQ2N2dHU?=
 =?us-ascii?Q?75K5tD3oDUyBPAQOCqVAn5RAzAaWQfohn6fHge9DxMSIVK9hqOMWPvRNSgjV?=
 =?us-ascii?Q?a6n/0hIIpgBxsMyOvmx17Sl7VsSgsaFKydtkrt0r6MTxPD+ziyaY4ONj6bFa?=
 =?us-ascii?Q?9fMDOnF6BIWZVAEGqhr1vegH0r9InKsyTW0D6rpiFrDCYYnjPTFK7BPzoIeH?=
 =?us-ascii?Q?/v1Me0xsm7g+etmN4E1dRB061swI7BmwPgYCF7TAL1hR4GLTZJIAZHaeoCGE?=
 =?us-ascii?Q?DvNi87ZEaAXlSAzfaRQJhsYIftEJ9AtPbU9u9MEQkz81+oVo/QYrUYkHpW4t?=
 =?us-ascii?Q?7qCs4D0c+TBku4VyCqHkv+pVEQfeKtw7HJNZDIYnxTYyPY9C4WKVNB5BQW3u?=
 =?us-ascii?Q?J3Mesk+tE2iP7LLAjXsWqZk0Tm5+tZdJAUq7A4Tr3ILXI5B7oovQoZuFMPZm?=
 =?us-ascii?Q?Uekl38IfDVZnhn0AL+755ZGzho+bPYbps27YJ6gnlCekz1M4BROFsQicoCus?=
 =?us-ascii?Q?5pI74fo2P1jwRiIBIlX5jQNsFdFpiUXWUlh2LNQEMb7bE/Nyb4DMHoevdb+E?=
 =?us-ascii?Q?CpknI3iVVKvfEoj9x3AH4PwlCf4I1zXjCYJDSzIo+eHeHRMBBLshJJOyvhUl?=
 =?us-ascii?Q?s5tk1w8KUgwemvD+bNsvcmzJGke9mCYfNz6XyyFTjGDKrasjvHlurxJnOYai?=
 =?us-ascii?Q?IVmKGKazqfqw7rPmmABrrW9HU3bdBW0dtlZGvl8mHC7lMCYgOH2E?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fea2d29-f041-4051-c220-08dec8c32a61
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 20:42:50.5813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zJakfCcDacJQaWE07LkFp6WHAfFtEdk9YBE7RZtAQka1CRVeKuVNcKk8wLVm3mwKXaXVxic7mOXwfJ+8/vW7FNF1Kcra31mworH82JMu+0ybJNnbFpCpO2MxtqLTM6/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64744-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,devicetree.org:url,qualcomm.com:email,lizhi-Precision-Tower-5810:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quicinc.com:email,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A85EC67C5ED

On Fri, Jun 12, 2026 at 10:44:14PM +0300, Atanas Filipov wrote:
> Add device-tree binding for the standalone Qualcomm JPEG encoder
> hardware block (separate from CAMSS media pipelines).
>
> Document required resources briefly and scope initial support to
> currently used compatibles in this series, including SM8250,
> QCM6490, and SM8550 class platforms.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml     | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 000000000000..83f19719a869
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
> +  - Hariram Purushothaman <hariramp@quicinc.com>
> +
> +description: |

Needn't |

> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
> +
> +  The JPEG hardware IP version 4.2.0 is shared across SM8250, QCM6490, SM8550
> +  and related derivatives.  Platforms based on the SM8550 register layout and
> +  interrupt wiring can reuse the qcom,sm8550-jenc fallback compatible, provided
> +  the correct register base address and IOMMU stream IDs are supplied in the
> +  DTS node.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: qcom,sm8250-jenc
> +      - items:
> +          - enum:
> +              - qcom,qcm6490-jenc
> +          - const: qcom,sm8550-jenc
> +      - items:
> +          - const: qcom,sm8550-jenc
> +
> +  cell-index:
> +    description: Legacy JPEG HW instance index.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    oneOf:
> +      - items:
> +          - const: jpeg
> +      - items:
> +          - const: jpeg-regs
> +      - items:
> +          - const: jpeg_regs

use enum

If reg only have 1, needn't reg-names.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 6
> +    maxItems: 6
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: gcc_hf_axi
> +          - const: gcc_sf_axi
> +          - const: core_ahb
> +          - const: cpas_ahb
> +          - const: camnoc_axi
> +          - const: jpeg
> +      - items:
> +          - const: gcc_hf_axi_clk
> +          - const: gcc_sf_axi_clk
> +          - const: core_ahb_clk
> +          - const: cpas_ahb_clk
> +          - const: camnoc_axi_clk
> +          - const: jpeg_clk

Needn't _clk

after remove _clk, both is the same.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 2
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_0_mnoc
> +      - const: cam_sf_0_mnoc
> +      - const: cam_sf_icp_mnoc
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - power-domains
> +  - iommus

iommus need be listed in top property

iommus:
  maxItems: 2

Frank
> +  - interconnects
> +  - interconnect-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    jpeg-encoder@ac53000 {
> +        compatible = "qcom,sm8250-jenc";
> +        reg = <0xac53000 0x1000>;
> +        reg-names = "jpeg";
> +
> +        interrupts = <0 474 4>;
> +        power-domains = <&camcc 0>;
> +
> +        clock-names =
> +            "gcc_hf_axi",
> +            "gcc_sf_axi",
> +            "core_ahb",
> +            "cpas_ahb",
> +            "camnoc_axi",
> +            "jpeg";
> +
> +        clocks =
> +            <&gcc 0>,
> +            <&gcc 1>,
> +            <&camcc 0>,
> +            <&camcc 1>,
> +            <&camcc 2>,
> +            <&camcc 3>;
> +
> +        iommus = <&apps_smmu 0x2040 0x400>,
> +                 <&apps_smmu 0x2440 0x400>;
> +
> +        interconnects =
> +            <&gem_noc 0 0 &config_noc 8 0>,
> +            <&mmss_noc 0 0 &mc_virt 0 0>,
> +            <&mmss_noc 1 0 &mc_virt 0 0>,
> +            <&mmss_noc 2 0 &mc_virt 0 0>;
> +
> +        interconnect-names =
> +            "cam_ahb",
> +            "cam_hf_0_mnoc",
> +            "cam_sf_0_mnoc",
> +            "cam_sf_icp_mnoc";
> +    };
> --
> 2.34.1
>

