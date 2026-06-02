Return-Path: <linux-media+bounces-63438-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vtnDNn1DH2prjQAAu9opvQ
	(envelope-from <linux-media+bounces-63438-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:56:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91817631EF6
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:56:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=AxIdTpqg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63438-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63438-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D84F8303CC79
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 20:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920AF39769A;
	Tue,  2 Jun 2026 20:55:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB052EB87F;
	Tue,  2 Jun 2026 20:55:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433728; cv=fail; b=BEffhZAHPhR5l8WW+9+Srj5Xj5ayWx/IXeIY/BT2EvOHty1EN8IObkL9CKfgF1q+8dtL5ZJ38xaXQr3Xw9vBC+DZCNhJ7vjwWSFeAEZ8spvYIBDAVBY55nbE9nBJ5XdARswrS+MxAQjHTpAhHl0b7v06gP25fER48ezHw3Rpvpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433728; c=relaxed/simple;
	bh=LeKYM/8EQbTHH+Wn4ospQeg1hH6sfEp+qqPOx9e7EEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qXJAU/qMW2TVE42Bhc+cYLDPJ/TDVkzCyhSCCxvV8Xb68rLGK2kl29OOoWSgSdlkGkqsI9hTENkgPD/fglZtkx9o+gBkJqtD5ah8qP8eanm9z/pPIGFXsxgUrqc5MhzGXzq6/Iky02ZqqkDzNYwX2algRxtVX44PovcS66leK1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AxIdTpqg; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwoU0hTzVT4wKiR6tRAs7A1qVbx3qxAju0+REYPYrMM+Td2aAISb9NJ0yWt0UbF0B7TNybxHG6ecGN1rUlfyPJ99rScDsmaTw9BmI6oOiK1H90YspqenUjiDu0KA6okO3QVJI5jVdf4CMPCXCJ/3entBxyGz0uAB7B5DPRr8cRwWKq6zvNJfadQKR9qFlfX9MiaO7p+V/rjIHdpXbevFP/iDASzBvoc7U56vvZdPBkMuNmLg0Tn03ylXDqFEoFnIZV8R67lRdsZAm3fPR+OBbJSsvo6P+UC6zJKBGle6pwXnpUfiCGi0fFTZ21qQfGWN/IKlMJDPICHPVAtugMoOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sj5QXe8C0GmioY0LUxQHLJ6kxUd+tVWD9fzZRxf0VUs=;
 b=QNBESLPyH+XJzylDhJh8xggaApwoSWOBkaTTsLan0BAR7KODA6CrUVpt8O1NOweYLDZG+oZtYprJ7VQFHYqAUxzd9/zobeRSUe308K+dgnSSiXNuOD2i9p+xlX9l0P5ucMk1NLjDPfFnP0k+dSbfHa6ORz9RFmwaP++BtbGCaTQ5yTW8jVy2LjReSOy6ZpvWjOK5beU0Z1zSilVwtgw/4GK4gkl6MHM4wM7NYux5kH6q0ObXgmnEm6qdRml/QmlUfRP83cNSndhPQezHfuIE2HPqvLUCTWM9tWxC6HG0BRbykqgmqR/UlssZEZ1zZ2J49+nnwgDp7EzlY/O+c5ygDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sj5QXe8C0GmioY0LUxQHLJ6kxUd+tVWD9fzZRxf0VUs=;
 b=AxIdTpqgmywPhKnuX9RioTp5lD/ev0KxSioIyxJJcUu3ltcsoh3pCb87V4KLiDqIInaupbm1HoPiZJKrM2h8hdxBe/2cCp2HxTvJTpfflQMUQx5M65oLnqNmJSNXAEs4BzUHGOD42SsD3vLVSo+NoDPRO2a4MytK0EGiuosg5FMS35RkrLIf0EPbswxfc6BZOZoNqB5SobmiYxVhOj0LeKr3JFLKguRUkhiJOgf7EI/ENyGUOhNdjiumn5vzzUemc3M93YxAvxHUlrKOP7GiORccQMjWv3nodCLt/B/NjTnstIiqzhcobG4Ot/U10SYMhvgED3dAfAEAEQeeGYD1XQ==
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB9993.eurprd04.prod.outlook.com (2603:10a6:150:112::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 20:55:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 20:55:20 +0000
Date: Tue, 2 Jun 2026 16:55:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <ah9DMPcKUaTm324I@lizhi-Precision-Tower-5810>
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
X-ClientProxiedBy: PH7PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:510:324::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB9993:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e46012-2734-4b04-6b4c-08dec0e94270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014|56012099006|11063799006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wRTlih9HPhQ2NWk5R8fNBC0Ad/LWU0cV64kLOXJOdpIc+4GQvAahrNkGC4Yh8L2fOKqYZiNemkjLhw5E5dFH44u1m32pGsAdp6DYsm703ITrIBX2ZW+BPcelWvPDfnGW3NRHGl8uhgMhGrzwo5FEvC6W2O98bdf3+6v9EBoyVSeipCwTdBytqhbtVdju1QaI6F3PCnq1/8F7se1rosvEUoGclGHewQojkKPEVx4FtNOvXcBlOuZZPztmoZTUqziwkoylMIfMGB4ydGHGyAypjKISXqNU/9LqaJICTzFhb6rZ8Bdwfb2JibCycylc89lvbuURA64nE1k7Oz7z2ljVK/P36JUrPI9FjMkZdHOnhzxCUru1IP22KBnJcitkhgnct4kw4TccPniFag8GyCCJrAXe4OxmbP9J+EGFNSyVJAWP1f9qftgH/Y6XdUL88N1qg9xpGw4gLXo7tz2fIjQb0oO3dHWyVi/KLI8CRDXOVa5CLQHEng2+0EuMbOlkY2GmmJbdS6OEoRQ2JB3BZdEvU2woSDk+M457aXBL0BQC+V2HrgckOH9uJd7XeDW7g2PQt1tU6JvlL5WiFETZxPqGA/DaMdrIbnZWThqa9NI/x9J+F6dxYHhwY4KRCgf1FCDc+eavaUMEm4ZhYXtvcT6/gR96s45BGIS0oeu17itXz+TSfdZvXf2leeTZmgDLglm2ILYbPC/Q37AuBa5U6hxyrmTSUBDvG6eZ9EQHTilhQnbx/T8kT3BdT60qR3ByxMrt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(56012099006)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PmT0Od2sbfgzu/gL/u4bhR8R9JmZ/6x176qwZGLvN75QzFBmSXa4FQ4pXecN?=
 =?us-ascii?Q?bSPrg4fViCs5P/ttuIdDvKAsVBkRszRFWbhsqNC9bYrsqbmOSWe0rkCkxKng?=
 =?us-ascii?Q?ij/jIws+g/t4Yx9nwzTJZ5oEDVqQ+OQz4FIvADtsjepE5DnS5EwJo1njqOKY?=
 =?us-ascii?Q?lI2HXOr2j/LipuCdYmQgwI+wjoIBSwgEjWduUWp/vzPkZN4ujM57eQmj+5sp?=
 =?us-ascii?Q?xT2JKHWHM2GnNAnbhOAuhUrqaBtpilFtm0vxT69bfCLJlT+7X/1hc5LB18A5?=
 =?us-ascii?Q?0XJwNqXiR1VwbxfyVQeDdh01PhX+bpTBn5ZdUJe4nfRGC1Xbgw5IC9RP5QyO?=
 =?us-ascii?Q?7Ly4xfbFS/zgcFGT/rd0iP3mEILOps5Li3QbX1LzQUpq1GmsmfnYTSNT56wV?=
 =?us-ascii?Q?yEOZkgmr5hKWBxnp4L7kzY6vkxk0Cf++lL+4G8mUAxb0jhELZFp0Dxv5WSLN?=
 =?us-ascii?Q?QxRiqpi7U70ySPmeAKjiNgl3XEjaR+Ygbk1knu8Rm65kpMsght2ZvJtX6SN+?=
 =?us-ascii?Q?z0WVC4RMT3vhucAEFT2LSxxoW1F0npVnhG2vraaVUnjOTSZ1c3unXwoQMg91?=
 =?us-ascii?Q?D4xc40E3wfVsXcxzdFaEDkYKUClVfMJYJ32ST56lT9uB7w4AGszYlmb4Ub7o?=
 =?us-ascii?Q?twXosR1WbM2RHKQlkleINqlWPvEsglmmgkxBGMzqSwKgKPhpakyrUtbjApU9?=
 =?us-ascii?Q?rRgW16PJI9GKLPxGyruRIYXNmERkGdNBP/p/66b6C3ZIxLRASHb1Zyld1Z1v?=
 =?us-ascii?Q?ZsZQICZoWVH/4arSgvcCyWN9N8inxE5pXOcCESgj0iOtWKEHp7W8KO5yjZnE?=
 =?us-ascii?Q?dvvcj8kIukxSrSXAgENpWr5QOu9yxR0lRacZnydix2DVHA3zOO06CmUL0z6Z?=
 =?us-ascii?Q?VM/TObaVl2k/qj9u5wMgIUoicRzObQ52gfm6kHUMjK6TwnGXnh+DuRvbqQYQ?=
 =?us-ascii?Q?QHpYN2BuzJ8oPkncHaWnlnOMx0Ma5IL+YGO7BxfotHWCElX+oW6JM+2qhYZ/?=
 =?us-ascii?Q?AMqmWMRyITjzLajvlbsSD/WY9XSWmsKhql24214NgPsLLabiBIzmszL7Yr8j?=
 =?us-ascii?Q?U7c4eoO8HMTI5cA5TDxXCWzk8z4BzqxKYAlXcVN3c5prVboTRU0XH44p/w0v?=
 =?us-ascii?Q?ujl2GO6c/sqCba5sJsdY3ZKPlkFczGP7JZ5kNf/FdSzHjq4QnAtpwygOKmEd?=
 =?us-ascii?Q?FQSo8aDQwANpdljUL6T5wSjJfDBdok7/lCVEh7VSDHbx5m92Tn1uH77gOPMN?=
 =?us-ascii?Q?viukHp2GvoKYSymG/hXwNtU555dpRc/GLN4FAQe18+U6gsuljZ0tgZXM29Pd?=
 =?us-ascii?Q?TIaTkLVFE17d4487Xl1ILs3/P5QsHihwAJlSIi9H1ZMGbecSWXXWxf0iPgw4?=
 =?us-ascii?Q?oAT6TZBwu9BRVp6BH5W2WffX2ZUNITUoSh4FyD/AXrLh7lPpx0/0/6l/cVMe?=
 =?us-ascii?Q?PXSAKC57pqDOiGIJubuD0sEvecMxkL7IMUuIWH4fuiNDsgQXrUEbc8KHXgMd?=
 =?us-ascii?Q?iAE0c75afHZMC6vI63jwBpl4CLfCVBwQ/6iPKO4PFJCkcZQ2lgBi+JW0bsEY?=
 =?us-ascii?Q?0J9C22OW9iazTvmBCfTUeFDwzkkklrTIfUs7CQ1rJZRILhmk/KGRzKn0zZvU?=
 =?us-ascii?Q?30oNuG8YQQmttzVL7MtRX3sHHA5nM2REpdhsSu+jyBmlm+RoHpBD1LK5GEN4?=
 =?us-ascii?Q?YkYjAkZYjt0LnCWK2pZX9GmjrMiXvwJPsGi7NSFetSD6HBPI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e46012-2734-4b04-6b4c-08dec0e94270
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 20:55:20.9100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bl9l7WzfD8pPNW95DWYYLFm/iTP5/ha2UGPJ0fAKSn5lplOScNxDFewi0rX4aF0HQ4nXhDZEXXw83iQy3QDRBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9993
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-63438-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lizhi-Precision-Tower-5810:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:from_mime,nxp.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91817631EF6

On Sat, May 23, 2026 at 03:48:47AM +0100, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
>
> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
>
> The schema here defines three ports:
>
> port@0:
>     The first input port where a sensor is always required.
>
> port@1:
>     A second optional input port which if present implies DPHY split-mode.
>
> port@2:
>     A third always required output port which connects to the controller.

Most likely CSI controller binding to descript connect graph. PHY should
be simple and straigh forward to change digial signal to analog signal.

most system work like

phy {
	...
}

csi2 {
	phy=<&phy>;

	port@0: {
	}
	...
}

Frank


