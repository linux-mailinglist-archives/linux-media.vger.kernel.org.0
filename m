Return-Path: <linux-media+bounces-42623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68658B59A31
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 16:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3D58467A3B
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 14:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5DF334375;
	Tue, 16 Sep 2025 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dltAPa09"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689182F83DE;
	Tue, 16 Sep 2025 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758032610; cv=fail; b=Xx8oKMhdyDrn0U58AxzDWdmjS9j0DlmsI6UQXL5InoGZH9kkBnFYFqILQ6BzNI1bZfmRgpvjTwGqLsBeqIRK6VTlmJ5U3OdbX2w5dfJuVvQKXePo/pCemVlQHA5nZcL7pka/jah5LCrUxL5ago5rrk71+cvzcPMbPTgfaCQyXdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758032610; c=relaxed/simple;
	bh=58Gveq1yENMmgaVC1MskeIe7AtL+Y/2PiIyz/cWZV7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DZFvWPrpa1pxSV1OnNnX1THTfuVGyLw3sl9NBoVukiA267ndtZYrgqStI3Epb3KaaW1p+ZOAipF7R/kgubFEO8f3Dw7JrLy73CP/eIN2EB/JV+fbDDvspIeQrWpqA8TBgv9jf9cn2Z857KCy3OtNbCLDIKxbhcbX/YL8MM4L1cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dltAPa09; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgdPufxqZb8XcsAcc/RCuCCMDWzj1yFgkG+tYD9A8kR015re5/DMUErkVrwIU6zvPafmhEX7ahd+q0CmzLk9eBtDx6YvXvZywF8PjBqmSN+JKOTQK7Zq9OxLNJGGWH9ysTLA+nRpwVZq+kSJFnTnKHUybuxrq890I/Eb4EHU2BPZUBwQtDgW63RT2v6ZtaHEKd+K1jPcoKq3s6WYCjeUQGpV8G10QDSGCe/GXvLEPhX6+O8+yXbMazqHqUT1srqmrgz4jxYqLXNp/1/6TIwci48uvTv/LZFnQfWX+R6r7af/yZh+4eiZTotkNU3E3IGXWzo5RMcST99gAQ7cAZvvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWMn+xVkXe9nf+d3UxBHwZkaOIvFpjd9kqDkt6ztSEA=;
 b=wLYlSPwlzHdgM32RFrYsJG7HO6ioGBQyfrQj/N5x3o+Ps4fqd2uYY7rT7rDu1hjZl4tHvzRzs09NFcia7FZZvaFwmITw6eJ+Rf7rwzXmR7ndYeNBmyve4VyRsCmdqfBK9Y1UiuhR8no4cPl1SALwOh+r8RkTy8SZQuVxJyod0urvXmtU6VcXwKCiq6VkihLm6nTPR2mLM6SvAxeSrj1kzkJuP4Uu7CMq8v87QOub2OTYWoKMmy8Rz76CjYIyhiuAqiXgJNdc2g7kUZ4gAEkPk9zsclQ5s0ijyCcTpdyxqjCl3nyOoZ1oM3YhGSFFDm0J0qTzdeDejQmdNP6HE/90vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWMn+xVkXe9nf+d3UxBHwZkaOIvFpjd9kqDkt6ztSEA=;
 b=dltAPa09xHghLuj7f9gs6tWc1cgJ7LUcwu4PGUNsnvZnMnQQmwKYad73lhbfvHNv5b7h5VGJcrochbQTxssaOzjSrud0q1Hobn2CswqoiCqp6Q7rUB8jmQEJUGeOQWXAmfQcXvEsj+UsK0Bl5Yopj4LV4r5DeHD/+pi3I5v9UygvhrrkuBkGumw2ENp/Ia2o92TJJocFBADj4gy2age8ODwtAVehHZ8r1Dg6pD2z7INGfAjuvMGxq2oTVQJYt5635ir5XWBmQ+X+04h9XwiT/INxwoPcEfMq3Sm3GNpuglM3yoZJW1ZGL8Hrm19xLuS4kg+ovSJ9vhhg730vUe+K3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI0PR04MB10417.eurprd04.prod.outlook.com (2603:10a6:800:21c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Tue, 16 Sep
 2025 14:23:24 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 14:23:23 +0000
Date: Tue, 16 Sep 2025 10:23:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 1/4] dt-bindings: media: ti,ds90ub953: Add new range
 for remote GPIO data
Message-ID: <aMly0eRgNRB2VqU9@lizhi-Precision-Tower-5810>
References: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
 <20250916-ds90ub953-v3-1-bb7bc6545da7@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-ds90ub953-v3-1-bb7bc6545da7@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI0PR04MB10417:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1bbb5b-a278-42d7-7d7f-08ddf52c9813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oh9M8TEftzGkH2RfwlDi+93YfWD/wKxJkZqxaMONzqgjUoejJWBiry21AKa6?=
 =?us-ascii?Q?iTbY+hjEDfXpczpz0G8rRE702t2XUrWot71ApzsOzQZWgsZYOAUFUxMT3OWa?=
 =?us-ascii?Q?qk3RuKR2Yufj7TmGxKY2VnDeo9GjAONCHW5CIN6SEVxW72/0Cwx1xHBHVaDP?=
 =?us-ascii?Q?IFsdVd29rlzCcudD8SRTSzbQQ/xVkETSIFQllqh3JvMuuzB3JCU8sHZU21Zr?=
 =?us-ascii?Q?nkdT9IWsqXhbfgAzVjOHHbVtoAusRD0EVnhLou7JAbL+CjX2C1W724uF149f?=
 =?us-ascii?Q?JX96+L6/NyqKcc4kh8HjDvO9h+9W3K/HF48cOZ1vx48fAoIRLBr5baeqj7oK?=
 =?us-ascii?Q?AAU1vS3zpOOxiL32NXvptklgKza9xrw+6L9ppB+DOdVihiByIx+nL05TFG4b?=
 =?us-ascii?Q?dBX+Jb1mImjX8qY30jgRDqgaM659yXxhipvwzHKCU9mEUJgAQd9OrXH+yMin?=
 =?us-ascii?Q?wSjeGVRT+D8WVtMFG6ow0Xd70jR43hlOsxvFl2b3pBrvmoXWGDHjx0XvWNZW?=
 =?us-ascii?Q?eNN/2Kk4u2G42rRfwS+nJFYvWKbIdk9fdyN5KEU/+fFKFgcwNKp5yWcr3W9k?=
 =?us-ascii?Q?Xq0k/+bqSRdcdxbNGOPaEUJqlq0NJbpucmaR302VJvJ5dCsQQtwSHS3I4KI2?=
 =?us-ascii?Q?EvNaUwPmXYR6MAhv6ug0mc288xM1L3GAzDMezMwSMBUzB5Ggxc46htOxIKDx?=
 =?us-ascii?Q?RD4hrFWjefG9Q2uTeLKBSjHKvHg1XVOUL09VBF7JxySgF8ZRG0Hdrrn56vpw?=
 =?us-ascii?Q?g7Bautj7ID7q5oAwNNrL4YqysDo/LGNsN/azxYAwz0xwWMe705fwgU4w+kIB?=
 =?us-ascii?Q?TSMttePEt3hBunVg5h8OuBEIhsiOYjVVk4VhNpbq9Y5qRebeDDu3qr275BO+?=
 =?us-ascii?Q?gtzZDGK20ssjoNC6wEJiDlhcEHcDm+uig15QPYYkKO+P4AUPd7Gl/xFAoA7J?=
 =?us-ascii?Q?MAdCmbbgkIPDnZCA2kqrSan9T/vk7bN7yPNfuRpfzLxksOXW85Xq3Hl7C1oR?=
 =?us-ascii?Q?85KaobPhL4so/dzVEZC2QXie4DmTXV6NoVmB2yGCl6j5zUeGcNTBMuK17EY8?=
 =?us-ascii?Q?aqWYVxfm1m0zkCfW0s+35DILFJFYAR9n2daX4JAfz5v6amBhMiHYOiRBXR59?=
 =?us-ascii?Q?LgXo+D7FoJz6FvUx/2WWWpWmlwSa9yE+NDdqGRQOTWsxtICNT1PG3HUP+Z1n?=
 =?us-ascii?Q?4Ot1WHh4jL3UQtaOEvb0in86qUE9Q6ndBPTQe2U0oEfmXMY3fM6ljACZWQvs?=
 =?us-ascii?Q?I6NtEVogE7APjhmvor4E202UUFArCpQS5y/0My0SoTsFIUZRxABUrzo7dY5J?=
 =?us-ascii?Q?1W7FPRiaCqPcyqwRBUt9OD4DdWrhaDmF8wrJK9oLVYo6YiXSILaHKr1cDQXJ?=
 =?us-ascii?Q?5LNh1LHAzHgoI9NfQINngDI+AH5NQFzDg6WCHTecuuVXU6DaIHLZZcnq/sQL?=
 =?us-ascii?Q?ZEVUTSAlbdJDa4bPGHbUxAMr8kITiFqhFvF+5w4Y94D2P6/ItKJm3A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IuMRhbjT1MfETn3sU+Di+ROWok6VwB0RLye92iGZSBkozGpF1kB05ssXFdN8?=
 =?us-ascii?Q?KotKH9HCGjpWpoawTXVbNE1801c6GqlE+1HWtRJZog/Z262os8jvlgV2iJ6K?=
 =?us-ascii?Q?SQft++5PKiLx8hQCAcCzLTAai+pIy4/YjZDkpj9OwZZAaVcSM43QbZ+0dDXQ?=
 =?us-ascii?Q?qsvcbXNeR6XXr+qj7GFgcdeBDxDIHjxv3x0p7MtKt+AgGK2FapWpHjsrA/0R?=
 =?us-ascii?Q?yEANOUnMxZEdNWvKeoY6jVQr49kCi8xltJDQDV/gTnNUWBpPglBA7tTjcjPK?=
 =?us-ascii?Q?Q0zO441rkQ4YqxNmWUeyBmRV66Z1UPN2Wl1w+3+NSi8Q/dekDz3u+bSKdD2S?=
 =?us-ascii?Q?4AYDhiNZxsYvr9xDjp2nkmW5JJwWtV2eBiuA+J8lkgrUFXAbzuW7TG0hWCKO?=
 =?us-ascii?Q?L2Jq866b56qyAQAhl1Bg+ncpTkr20RUK5ErzW4b1yImFz6MR0USJ0i0rjNeo?=
 =?us-ascii?Q?PIqzTcgx4ug7cwI4OIwJhBjrLTAYnOQ1yjc1LNKI5gRM7x/3YYdcxbJtveD4?=
 =?us-ascii?Q?HA4QBiUaRRaEly5mP3LN5+/2Jf2WyDB/pKGKjzKu36/VvHzImiC+CPipqrSX?=
 =?us-ascii?Q?2Kz3+NyJvJ1ZsVk8rtgjChr7bi+C6FAfOsLUXsZMQnP7T191DSSbsQGGnE2S?=
 =?us-ascii?Q?P4DylLsbYlG9CmkuYieiQDC1TZjv0+8QPUVVHNFdZWc0ct88ZNdE9KZ33dvP?=
 =?us-ascii?Q?5WrYwS6BqsVz9EuPB/P9ierny59KusCsoyXEyplQ5WOCNFO1YDztajFRQPTA?=
 =?us-ascii?Q?3SCFNBCUFrrtUdSAyCtqHz7v+U/YXrauH0MlfaryMcDDspiKb4jYa/5r/PqY?=
 =?us-ascii?Q?/5l3EXpFPxxuLo+z2mJyN2HRKAgkljIWeqKeIS8v6fwgaLJh22sWZzd6wroy?=
 =?us-ascii?Q?owvV8+HtP2AnFmQYkP92UQEtEPDOoVHMn95BCvXTBYrY8TI8oymh7cNW+9Jm?=
 =?us-ascii?Q?JdnxqZhJda++7Mt0u/Ivg08dpgFM/KRQGQatcGP6Azxhh5ibeZAIzWHbJEa6?=
 =?us-ascii?Q?hoGR+mxAChfWfLKAfmUfGklI5fM+7ZO1OnU87tTO1EZ5UtQXEZF7kPWdjdCr?=
 =?us-ascii?Q?/rw1jk0BINFK6z4VXpzh/iQqe/0oxR7LgFyx6guOtMqmbJ3U6y0wnMiL+K9O?=
 =?us-ascii?Q?xb4FFO8iQ/Gz897DRxsebWAldBBDGUafaz8oVadTu8zU561QmMNavW9ScsbX?=
 =?us-ascii?Q?ZK7HlieK1DORH07CD+dPl186O1WPk0zPTe4hWVuiPlxUroL9VA/i4brNL8NH?=
 =?us-ascii?Q?OgOJXR3alUGeYP+3tj7VY225Fi89CecwS8QhvtuFNEa1VjTsB0U/w8ixmvWd?=
 =?us-ascii?Q?5UyuwktM53I13lBylFFkCnEs+5NG8N0ttklV7Lo/ACpkgDfMgiMwkpsnL/vm?=
 =?us-ascii?Q?lFbVXnhntCg7Sooe/qYiC8AmUpKwjJ3uoYFPdewzwfF5V2f1MX4Qyz3CoPCR?=
 =?us-ascii?Q?nLFg6n6iea/UomYE/D1iufH/17xv+L3kOP5r0jpVZdZKq9KbrdaKxKQOw3Fn?=
 =?us-ascii?Q?FSPgyZGP+nDvZ9AIipY8N+ELt0FFS037k3E8XngBuwhvR87Ar3/CndH5QFZt?=
 =?us-ascii?Q?8P2Drn4LDdHuC9o9Pd4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1bbb5b-a278-42d7-7d7f-08ddf52c9813
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 14:23:23.6971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLC8d1PJhMUG99GdzJENoRH3s6AzTxym5QNSzweTX6DLcrBEFO0ohWF+b3xY5R6ITz5ikIYk6jdKpFCvWbVyLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10417

On Tue, Sep 16, 2025 at 05:43:43PM +0800, Guoniu Zhou wrote:
> The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
> output, it can be programed to output local data or remote data coming
> from the remote compatible deserializer.
>
> Make a different GPIO range for remote ones.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> index 2e129bf573b79e0ca8f25b4ec5fc6ea76c50abd7..234276a8738a7fbe9fadad62f12366697da97b11 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> @@ -20,9 +20,13 @@ properties:
>
>    '#gpio-cells':
>      const: 2
> -    description:
> +    description: |

suppose should be >

  The second style is folded which is indicated by ">" character. In addition
  to maintaining line breaks on double line breaks, the folded style also
  maintains leading whitespace beyond indentation of the first line. The line
  breaks on indented lines are also maintained.

Frank
>        First cell is the GPIO pin number, second cell is the flags. The GPIO pin
> -      number must be in range of [0, 3].
> +      number must be in range of [0, 3] when enabled as an input.
> +
> +      If enabled as an output, the GPIO pin number must be in range of
> +      [0, 7] and [0, 3] for local GPIO data, [4, 7] for GPIO data coming
> +      from remote compatible deserializer.
>
>    gpio-controller: true
>
>
> --
> 2.34.1
>

