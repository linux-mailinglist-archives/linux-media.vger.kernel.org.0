Return-Path: <linux-media+bounces-45137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E5ABF74B9
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 17:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5689B19A0CD5
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 15:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1777D343D90;
	Tue, 21 Oct 2025 15:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZP54ory7"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013041.outbound.protection.outlook.com [52.101.83.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40191341AD7;
	Tue, 21 Oct 2025 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761060188; cv=fail; b=lvVL9izKUo5v15Ov7z8bGVe1rBJI5Mmgi4JtEjRsqdhc7E43s1jtRPIyWt+KIN2cmv6sHFiD+Gi2Y62a8ze+ECtNJNzpwWJAD5EYaeL+0kJ9mhv9sHvFcRscACH5ozL+Y3cLoLUN+BPBl7zi//1Zn3+NDdHABZZdrjRF2aUmKIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761060188; c=relaxed/simple;
	bh=jhiRx3nje14MvBCGOsknp3COtXiv5UjVBxWK7npQSns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=trMnbA8pzOc6aF6qgleawiQDaBAS+WZkb/LajpAvToFddvpoSXFappLlH4+492hdDnMl9hm9HdBIQ7EY0jQbIRP/VBkjawrB5HkGGH3RLRaI9OrDKXuHfebS6W2ExS1kHFY2NgVlMw9JVTmK7EbLdE7lToGqRYWm7F8zJuNgnBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZP54ory7; arc=fail smtp.client-ip=52.101.83.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utMCR+222VC5B1fk/n/R1aKKbiuLFRtRurYMT7XAxmUb2Den+cNOcQlCVw5tlWmd6YTC5jcI9ir04RvheC/wcQfDIDsAJXL3fySC3GfEvikVumsz54mEHpmR685C3VQ4NWHFAIfxtA/L4rb1TWkUaMwZpWnRFcme/HyN34BMY52R06NAdiSwULDqpT4uGrUCarcXe215+g0IjTD41o1ii58kJqjlYjEtETnKaO9keiKM/n7dvabxtaxUAfwUidW816ekoMmkxXjJE8h7cKcUYmvPcaylSIDtbiB+d2HBbB3hsDAFWYAdzYVw6Rkd7Mu4ATRVzOOJRSvmxEhiTudGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaVLSy3wyIJ0EN+R1XDHSBOfswRUBnefXIlXmgmY3OM=;
 b=abiXkR2WyHuUIEceDkXkZzJNR3o+MfTTAbAd8ayIUEiydXcGObYPUqJ0HNz/hTYFiCZ4ScCX9iCvy2zsO8Mcz9PBcD98r2WB8Dvm5w3KyMb7XTYLxQpHmdHVmw0V485KSlg0KKApRYm3FJabwhk6nakO7hK05coLEWynThjaLSBGdg5plhO1Uez1mpLAQq7eO8fiSNxuTiPAaRcmkIeC6rqjrZcK3Axn7cYNzNUe0uYZHSrFRP41hGiUspFUdF8HiJQer0OnVc+XG9fVljGTUufNsATBZfMhT8jqmNKco6aoYwVde5FmZDh45YgdWrMU5E16q4sZWn9ZWKaEIJLklA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaVLSy3wyIJ0EN+R1XDHSBOfswRUBnefXIlXmgmY3OM=;
 b=ZP54ory7Dr03UxqiEIhBgTmnHP8YBtYkU8WWdx0TnJBvo/f7Ef+SlAR+QsoVQeZtJHhLDo76nif0FFU3gHqIKqC9UQ9bMbhH0gUsnonZ0ABaJBCuFIfUVmo7qEhIINGtNxL0pQ1vFiHNrerFksfyNopxPW2xhTYTUtGYpikyOyUFydyyhI/QQFzNwK0c4pQI+eSARwODu7Z5hDZLW9Bv3pq+biF6Xw7a/kHaWhM7Grw/B1qKbuNBoMYq4Kp7xbjplJkw4o53CAQu+OvJipLTdpM/468cDIYP6ozD2aKDH2RqF+5vx4HZyLmkbhrkJ0Utfi6UUZ30Z1xnT2CjtBWmXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB7496.eurprd04.prod.outlook.com (2603:10a6:20b:29d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 15:20:19 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 15:20:19 +0000
Date: Tue, 21 Oct 2025 11:20:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	"open list:OV2659 OMNIVISION SENSOR DRIVER" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] media: dt-bindings: move ovti,ov2659.txt into
 ovti,ov8858.yaml
Message-ID: <aPekq38Sr5KvXvKw@lizhi-Precision-Tower-5810>
References: <20250912183003.1115957-1-Frank.Li@nxp.com>
 <aPdHqCWNdmVkch7S@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPdHqCWNdmVkch7S@valkosipuli.retiisi.eu>
X-ClientProxiedBy: SJ0PR05CA0139.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::24) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c0d1dc-49ec-4b60-bf82-08de10b5589d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3q5iVHwjSTZcIbGN1G7SyAHq0ggRKDj2amNCmLpPAiLpcDYOOq4wAfrDzjls?=
 =?us-ascii?Q?mImuKrSp0fI+uyuNdpRr7fPXTYGorGTccMHTU6pJfntle2/8JpG3Msxuwtzt?=
 =?us-ascii?Q?WnSuUWvZO72lCyWjto9RK8B3YtoCIJTZ/a8GBINtvjtogmSb9C3dUaHuHHCb?=
 =?us-ascii?Q?9RjAcZnwMOt4hpypxe3aW3VJwrGgxD3nNol8jZrlcPoh/HpOE1ix0n9Dpw/j?=
 =?us-ascii?Q?xStbvYz1+g3pTWcD9OA0n+4idtpDP97021D4SjnF1CJ9M1hfdVs4Pe/+ZKK1?=
 =?us-ascii?Q?4bLsCU/icwzAv/Tmbl2+BGojTXZOnwWqLv10f0bf5SgsGy1Y9aKkFWTtArTo?=
 =?us-ascii?Q?n3qawT503biml+UdU+o7eTWv324gGL3X+x8jtyFfe4+GeoPF88i9IAt9988+?=
 =?us-ascii?Q?lR34KV8JZejf49PkMO4TKZ93KoZryrOVEoBXHX/WsFd7Qxo7mrkWUckv5KXl?=
 =?us-ascii?Q?F3jt1COkLHV/Io7JDLQ3wUxSv2Xrc3teZqhYevNgL97hAvQJY7D8zbYkJIoo?=
 =?us-ascii?Q?/g7tsuz88oNjhRq0YL1c6PtEwcJ44iW8I0R9Jw4mPxnv0qDJ6eKwAnvHi73X?=
 =?us-ascii?Q?apY5mk+ubUnHHXvIRjiQcShiHJKaesdoo45sVTgj10XLPzux22DK3dOs0LQm?=
 =?us-ascii?Q?9Ov2PQuwpay8dJ0sogSWC13RsJkG5ggmSTdbBCpy464Lq53xLx8znM5pDUfy?=
 =?us-ascii?Q?qTmFok2K8izKconqiX3rE/l6HMsuq4lMo0X0GLryfT22edKRfSVpNze/snl0?=
 =?us-ascii?Q?i512yDmkeomd/oiRlkoWduN7p30g2bpVglpY0leiT8LAvlavrbEgGCQIMD2S?=
 =?us-ascii?Q?NCeipwiBpTpfN1Dufvom8k5A8d7RmWnlPbPBXKjpPUTHPd9u4Kvz+3t842mI?=
 =?us-ascii?Q?TRMnA3/t3uMqtjYlac3U+2jzRqYCMx2C8FOJ9wAPN6ktYLE+2rcMLj2GEO4+?=
 =?us-ascii?Q?AO93kH1Zs/Q2Yun0tewMNY/rQler1b73DcOmHI36vtjDe/PVdhyoohzW4jds?=
 =?us-ascii?Q?+V7QisxySNPh5BdY3OQUUygir2+CMlZ7mGJFsUmWW0dCj1Iisyxl1FpvFpZu?=
 =?us-ascii?Q?qAI5IoSzqWa4e04ZhShp3NNHxe24LLzuxsCucIB70VqSDMcNJDL8pi23VNjH?=
 =?us-ascii?Q?7EBtBnnegzZJZouGPPWulHkWTufcd5rzP32LXRSKbj+ZejjUxHredeelVazc?=
 =?us-ascii?Q?kUbO52OfRygqjkacBzTa1zUYfrSOaYd7n6fk7v4A/NIXbrb1g8of3SFP4cEl?=
 =?us-ascii?Q?zDV/Zm4IeVqFedLqvJj1KAhaF2Qq582R8iAQf9MQKs415TEgOva/KK0dwcnO?=
 =?us-ascii?Q?2VKNvVNCWpxJBVHpyt3FYu5HlqaahAIc8VZBcHH9vj+g8Yv7JKOwXWh9AZZ+?=
 =?us-ascii?Q?q91Tb6ILjJQxXXPVmvlES/3kjMGecch3MUw6rUtNKpEZ3Siz858mOZg0RcsN?=
 =?us-ascii?Q?G55ONe5QA52+A6TxwF+sDnygD0r3frSLoPR5w2hqVuW69hH0xeWN+wQgsu1u?=
 =?us-ascii?Q?9WECf1VbHf6hapclkxmLoQRWFHEp2CCr1jWH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sl6GhWstEq+jqkZUDIsiJ/R1bDP5tIYo389B4Dl45rUmH6pdbtUwVc3uV7MC?=
 =?us-ascii?Q?lXTjb8n/F/Y0GqpZ3fSwNc+q8jcsJNEkLjPLLbmLmPK2mg51DHIBnzq7Sbhl?=
 =?us-ascii?Q?+wfK5Qv85/HzsjObkEyLLn5ovfdka8rtVszDcRxYHmsSio2LCrDYPUilLcSh?=
 =?us-ascii?Q?2zZnSaFyeTysv0Oa/BN1NgluQosr/mDNQ3crd3VTJdpvX4o5DL3lCdihtCA3?=
 =?us-ascii?Q?MY3UF+GGnWkjqnE/L7tLq8tkIplGqOGsAgRTMZBI+0og4QpIrpqX3VwDsYgj?=
 =?us-ascii?Q?YToOV2YaK4WRDzF8Y2WOLoQR7jGr98l0EhltAXPMIrCjxf8haNx0MUq8YwuZ?=
 =?us-ascii?Q?fLJj1A/5Vnua8473W5igg76/tISAJYF3nF+Nt5vAC2MBJAM48/VluqKwVeF/?=
 =?us-ascii?Q?dI2rKtuWBy1H3L4aTIDXP2/BKkabqy77Bzu8GCWkcmzpvq+zTfEAdl575UGP?=
 =?us-ascii?Q?mK8zaz99XaXUcS5diW6o3oPWdZhDs1HayxzZpgSn2buFLadsfLiAgv1/Hzaq?=
 =?us-ascii?Q?YC4SPv84q0tdeAjQ+MP069zJSltbXXTJreM5DpoFBcjV+ZH2Pyeejoy68g+B?=
 =?us-ascii?Q?p9+vfnGi7xj7cUxi8zn2kNYGB0IOETSojUr9yC+HDbvF9rHBsXwnVwVNHZfH?=
 =?us-ascii?Q?5AvImsueRDRp1UcZUG+x9mW4BekWN0w2S+GhOS9XeXGJ6aV+nR4kbDFQV0Lu?=
 =?us-ascii?Q?D51wcvFjry2/C7ETWlNM+WA0OceekHCyCvDEIhVgCBq96zuf+Ds7dsNLMTmD?=
 =?us-ascii?Q?1xmas/q3otW5eTyF9XQWkqq3x8Iknb72Pa7FUSD21Ja9cikT2QZm6W8ToyzD?=
 =?us-ascii?Q?a7dKSSonlOqgyVn3G8+9ATNnqKwkHvmet9Qcm+MgQgpSpnSyshKHTnk4cvYL?=
 =?us-ascii?Q?7aIzUM8NG+Gkaw7pEFYizr0e+D1hDUGfWNZZh1T/UhBZ3lwlJSf1pBxC6Uwp?=
 =?us-ascii?Q?F8xX7f7pcH7vk0yXGr9L39uBj9ZhYqQucmeSEL+lzne+Oktggqu6tFzSCkQ9?=
 =?us-ascii?Q?Sszfd9WQfvWcNIvJ3lUSHRYtmAWWIuuhgJTl2kWvMcxCc+z70bx1g3oSQPDV?=
 =?us-ascii?Q?ANA/eCzdiWmWpXBUG0V0hGp19DcRTpn8ekIdBzrYSKVSYo6l5vTL1TS8DAiY?=
 =?us-ascii?Q?RAzUt80JI2DGyyi75oSxLHXqYIEpc3WsjH0c57tIjfLqAlwpjtBzqIKmtr3W?=
 =?us-ascii?Q?dN7EobMMkiZzR071rsRrUqjQFpZ5IE4R0Qij7r2C20MBiNG8xO4lQw6L7flF?=
 =?us-ascii?Q?TaivjQbvY/VCa90Uhp1IQYNCdQ5ZoIwmZfMsWlQIU/jXZ8OHbwXoFz7TYU+z?=
 =?us-ascii?Q?O5nHY+BqJC1iTbSLLhwj18OXFQ1rPFx0PSUrtkiawobpmKVFVPDOrJ//gS1W?=
 =?us-ascii?Q?85Lz5iQg654KtguyHv+D0NkuGTpbW/6Md79lbHmSxPs38YFHozA97nVSXWd3?=
 =?us-ascii?Q?se5UXORTbudGEr92gJnZ0r5umuDqiLzAtlLy2HEqDjIBIFbnockFQFdbw5b5?=
 =?us-ascii?Q?0dC0wlEckevJqGWud8hsQ1PWKs6X5aq5C7ijjO8lDFn7nFMRJFwlIIsKN6qM?=
 =?us-ascii?Q?rN4wlJYuJnUrx8Snkc8RCnpz7sLCKaGsEQpkJa+/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c0d1dc-49ec-4b60-bf82-08de10b5589d
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 15:20:19.6450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5t1Y59Ak5UPNTOT8frKzJoOOzBX4eg4MF/OOQAkomTVbB8qk/iKf3bsoyqIA2CJkw0GqCFpfoaJm+AsUbzPzxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7496

On Tue, Oct 21, 2025 at 11:43:20AM +0300, Sakari Ailus wrote:
> Hi Frank,
>
> Thanks for the patch.
>
> On Fri, Sep 12, 2025 at 02:30:02PM -0400, Frank Li wrote:
> > The properties in ovti,ov2659.txt are the same as ovti,ov8858. So move it
> > to this yaml file.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov2659.txt        | 47 -------------------
> >  .../bindings/media/i2c/ovti,ov8858.yaml       |  4 +-
> >  2 files changed, 3 insertions(+), 48 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> > deleted file mode 100644
> > index 92989a619f292..0000000000000
> > --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> > +++ /dev/null
> > @@ -1,47 +0,0 @@
> > -* OV2659 1/5-Inch 2Mp SOC Camera
> > -
> > -The Omnivision OV2659 is a 1/5-inch SOC camera, with an active array size of
> > -1632H x 1212V. It is programmable through a SCCB. The OV2659 sensor supports
> > -multiple resolutions output, such as UXGA, SVGA, 720p. It also can support
> > -YUV422, RGB565/555 or raw RGB output formats.
>
> I don't object merging this with the ov8858 bindings as such but the
> differences between the sensors should be taken into account. Something
> like the text above should be added to those bindings, which now describe
> the ov8858 only. Also, the number of lanes is probably different between
> the two.
>
> What about the regulators? The ov2659 doesn't control any right now, but
> that's probably an oversight (and whatever regulators connected on the
> platform used were hard-wired).
>
> Overall, it might be easier to keep the two bindings separate rather than
> have some number of ifs in the bindings.

The key is what's differences between two bindings. Most ov sensors use
similar properties. Duplicate these information at bunch binding files is
more difficult to maintain it. It is more hard to standardize if use
difference files because seldom check other files when add new one.

For example: clock-names, some use xvclk, some use xclk, but it points to
the same things.

Frank

>
> You can drop clock-names as there's just a single clock (the same goes for
> the driver naturally).
>
> > -
> > -Required Properties:
> > -- compatible: Must be "ovti,ov2659"
> > -- reg: I2C slave address
> > -- clocks: reference to the xvclk input clock.
> > -- clock-names: should be "xvclk".
> > -- link-frequencies: target pixel clock frequency.
> > -
> > -Optional Properties:
> > -- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
> > -  Active high with internal pull down resistor.
> > -- reset-gpios: reference to the GPIO connected to the resetb pin, if any.
> > -  Active low with internal pull up resistor.
> > -
> > -For further reading on port node refer to
> > -Documentation/devicetree/bindings/media/video-interfaces.txt.
> > -
> > -Example:
> > -
> > -	i2c0@1c22000 {
> > -		...
> > -		...
> > -		 ov2659@30 {
> > -			compatible = "ovti,ov2659";
> > -			reg = <0x30>;
> > -
> > -			clocks = <&clk_ov2659 0>;
> > -			clock-names = "xvclk";
> > -
> > -			powerdown-gpios = <&gpio6 14 GPIO_ACTIVE_HIGH>;
> > -			reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
> > -
> > -			port {
> > -				ov2659_0: endpoint {
> > -					remote-endpoint = <&vpfe_ep>;
> > -					link-frequencies = /bits/ 64 <70000000>;
> > -				};
> > -			};
> > -		};
> > -		...
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> > index 491f2931e6bcd..d7059dbee7fca 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> > @@ -19,7 +19,9 @@ $ref: /schemas/media/video-interface-devices.yaml#
> >
> >  properties:
> >    compatible:
> > -    const: ovti,ov8858
> > +    enum:
> > +      - ovti,ov2659
> > +      - ovti,ov8858
> >
> >    reg:
> >      maxItems: 1
>
> --
> Kind regards,
>
> Sakari Ailus

