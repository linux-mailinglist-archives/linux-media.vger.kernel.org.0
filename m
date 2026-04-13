Return-Path: <linux-media+bounces-58677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JMxKU0W3WkOZQkAu9opvQ
	(envelope-from <linux-media+bounces-58677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:14:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0403EE791
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18369301412F
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DB42EBB8C;
	Mon, 13 Apr 2026 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WPIr3iln"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013049.outbound.protection.outlook.com [52.101.72.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266B32D7DEA;
	Mon, 13 Apr 2026 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096288; cv=fail; b=Q23r3lyJiSazZehi7/f4169HaMwbsdurbdYYNlPTyTr16dmqolc8h2uIyJMDN8TNNiXnuZU9R211G51EoocH4pEkQiGIJZA5Vg451dz4yE16SJDl3bUoIHf/o5lyO1HTnLWwJNjLnWGVWI2I5U+Yc7d5c8h2dbmh1ADW8r3l4hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096288; c=relaxed/simple;
	bh=VNOWxOQV7SxBZEXbFwnNEYkRK3b37cAS8j5F7m/Ljdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uZRh/mJtqikuHuh/BAgqVnYgrrFiHTEJjh1MGcGe78mRTo7Q4nljk9u5GRsbxMVVm4eZzSTSJkmkoUhGEtvQ5FzbSXrnKoNUla5wXZOTcrXpjsaWvzlvek8HqByD/wHUbMFKdZNyj2E7P2LDKgpK9teiUP0mBCex2n9eQKw2gPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WPIr3iln; arc=fail smtp.client-ip=52.101.72.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inMtukOycqT3TV7ApQuN+Qr0lDtP9YWlREw6DMAX1Vim5ERWvCz8ZzF0unWsjWELILuEsQ8tAFOZG58TaFf6UdLKNxG4F3tAWCWnGdY/tyHAWSIzQnmfiiWopSAe7TQUXMUBmaiH7MThXVc9+efs3nYVd5iJceZ1bkvAj9xupHLUNlMLqnWk13INFFtIUoBIZpnFuPQEGFvxePGAhaSZtX0QkC4TdyZUySo2eboRq4KJaz7JMWJvAi2knJldWDdExN1W+hDkvvf2R8Z3s4Ts1pHzu/PysYlxgvUDFpejELW15WpFIYHdNq/OqBJvQm/701cSXGd/gMlx9C+weHHnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DctmzinWIRqskXHYsSdRmLGdk6J5U0Exu6OLSsok8v0=;
 b=ZS/qqrCc2rtzH8aUt+JrBHYudQhiGWle2P6nbalEmMgMKyLWgPNwAGfokrF5TQxttPzHCjRot32V1l33FMOTbA1iANDG2HJIrry1V475keZF/IhMSDTAqJ4FxpTGlkv+i11I208COnLMdHjU2HyDTS/BzZjZ1+LUi6jdRwdxE/W0nrruUAKVjkbb+o+ifnFQLRdjxp5EhWnvfIupzTC/uX8AbIuGZYxOQIqAytQsXYwsu7iYXe+bcSz0adm1Q2lE+Z09Y/EA8bDkP6NGmL1t6w+7LyODORniV9adk0pBPpqB/voJZN56mGbZYwix4NxZexI9Ia4Y+sKY/NtjG5RRUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DctmzinWIRqskXHYsSdRmLGdk6J5U0Exu6OLSsok8v0=;
 b=WPIr3ilnk6WfkuwK9JovH4UTjHQRumuC7FBsLf7bJuNO4UFoBkeE/qNTMRjwnQ7kGxppTnhE5YTaT87v+s9rjbIqEWu1e8KFWJwh1EHQYFSZ4NoMHy4tyWUNatRq+iSNtm53LqmfF9VicgWRlu6PxdvO9y+fJypmbSayF3ySTfy4U8neGlmnqn2LowBccPW5bYa8CbkF2g1Hb9iKiQ8IrCAOOaywq62koRnq7jyc96kNBMHn61zmaHAaFXZNqsNWxvVuuV7/u2JK+73U2rD0Ckf7r02qh3BJahzSDeJ+XeNP2y5fxFUfZFqIwft8KMt3TB6ggSFHs5f3oLqZiP39Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DU4PR04MB10316.eurprd04.prod.outlook.com
 (2603:10a6:10:567::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 16:04:44 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 16:04:44 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v1 11/11] arm64: dts: freescale: imx95: Add NXP neoisp device tree node
Date: Mon, 13 Apr 2026 18:03:31 +0200
Message-ID: <20260413160331.2611829-12-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::15) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DU4PR04MB10316:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a13de6-631e-46bf-d683-08de997660a9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|52116014|1800799024|366016|38350700014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 6m0OsHrfwDPL1GsbrhpazReDEwPT9qFRd179Y2NfbMJlFkDDr3+laJaNpUejKpPDvOEAPiBPmTaEpg0WUw6K1JhD+HxceqyN3VXGGrnXkkBd0JHJ9tCE0TI6qH7rx6IIOMXBB6lXdkSgDrnXY3A+YWVCz6CW3DhRONeYzlqy2EKZm3NAFWCMMFutAkYlbjq0svaWrGzqV3pjo7VQJF0NkUD+gCbrcSkP03pKH4NXmlYmO4NfjN4V233auZVeU+SBYGd9/kvD8Lr4QHLYeagOQOq1bbw9lYO+IrszO/m5gq3IiPaJbEy6AbnE///brfWy4CEtezSze07kx0HMfELvE1ZthGpRXTRFs3lz34+jVPmnrwKWZ6K6geNgfgYP7HMHLtC+mHTx8T0SiwdZ7cpjWvFCcOo5CkOSLM5ngxXCjiU2Pi2AI9q9VFYjov6wDkz3EbblrDvZZ6idd2XKCRo8nciU9ThnKzuWnAUlzrxk5UaXL49SuSUXxggBEX8MPTX9TqrQSvdxDZqz0bvGzcGvicw48VRgQiLBq829ZQhOqwOImkiMM2CuzbQRQ+4R0LeYDSK2wHRtEj/txdoZwFXkx24/egPtR7UbhuzYpsxTB68AgqSJufoAuw74HymMImHQfC3XeaZsOnkjyJclXwJoxUeLn1/C4lm57DMliObCGRAlUBGNR/cqE+4+vmpo6DCQbr4pW7MQOBMfwnTg3+59l2/QNaFkfceHlCBWa7Ea5kxzfCQPZ1Or0at+dUeR6FJNF7vv7GTQdbM6zzTOK8W6G3BBG6/hE1b6QCeEaKN7/z6ZtXw3mmNG8ONslrgCiwb9
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(52116014)(1800799024)(366016)(38350700014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gxgMzp5zXcYSR2I//w9DpEpksMDryI7/0X+ZtSTkwEcVShrgIriQt4lRx1VW?=
 =?us-ascii?Q?wtsipRpzxxhKHqhaAgeeKM0kZVZK+GeQ0RtQoNY0efnLqveYc+zWK1gbuqhB?=
 =?us-ascii?Q?M6rYOSKYXMIaQJWQevHa/F/+7KIr85bkoVE9DWK6FIoBkm8auDzyGZL3gQzo?=
 =?us-ascii?Q?9SOHVWZaSefjc0m2Q6OnEC3XZZJK+Nl5JDrDwbYNroZoBN1CQm081sZl9uBw?=
 =?us-ascii?Q?dsM1MmTKa299KKhVpbevHzQdKLBeDn1Vzv1KiUiWJdlp39BGmR9PC6Iaz+Hw?=
 =?us-ascii?Q?elrQekCVSPIk7z194qwMf9M+P0QTInfw3iSGKj1PGJytmDQQgO5GKk2iu3Q5?=
 =?us-ascii?Q?6+TCIB9Hm9kAMjSa0qbv2J/Vmg7O4Q8D9ijcJQcWVG7fCF91dmrMh6MNHgqy?=
 =?us-ascii?Q?SjboNxvHfh5B5Xe6A55QTSgonX17ml+RHnm41I4/IBSEjlvcm4xg9QI2eV0z?=
 =?us-ascii?Q?uupLucdEoWzcn3YB6P7a8E5nlUvS7iEqM+g+on7ThHu+BfvD/JSVhxTADpSS?=
 =?us-ascii?Q?qlKS/v6s91j9roYuqt6UU8XmSofx2QdJv3qHUF8wQNYnUi4fRwxdkR4mOajb?=
 =?us-ascii?Q?dTGBD6XSASvzfmWQJb4zIv7kUH1NOn7KeY5knu3orEQvWY4dn/eUkdkLrsii?=
 =?us-ascii?Q?rqdR3fn2M3Vtrc51iJcpjcQt0tlJ2xr14+oehzooGbDu8qzROxPJgE/wfKPD?=
 =?us-ascii?Q?3otH8RGWp9jDYatNClA1CGtH1Qu7xOD3wNYcL37zNu840DPhU4CM04SelZu3?=
 =?us-ascii?Q?oa7M00bdQuNbqNLcqRF4748D+j5AkUSPRxWskGDrdVbPXYYw3drdmqNMcsO+?=
 =?us-ascii?Q?xMJMZrZUR1LG1HSvKCy6nN2uPxio98ade0IAcGnNoFRBD6NlYl1XsQN++U9w?=
 =?us-ascii?Q?uE115b1pKoI4dZiWaTjupKnkErv0vE6eyDEkApjDA8BZTc4TXS/dTfpF7X61?=
 =?us-ascii?Q?zmwsEEcmOKzZnqbndM/dLmLQddJkBKB4KYY82vJ5ttYJfEQVx7OuaXKHL9Dp?=
 =?us-ascii?Q?ver1AYHAbibeJXEoDVLAQIaAvxGm15t2zirtnmFDR1ACPh3KT9Gcgp5/JSZU?=
 =?us-ascii?Q?7rX86MGVL57DiCY204QVqvZiYBfIf1pCjCmy5h//aCe8GCtg5kkDlPAmWVOU?=
 =?us-ascii?Q?rvT0EmwoX10846m4LXDJiaCOwFWrKk8xhzsMNQeBuvVoVyKNYCWQda8zEy2A?=
 =?us-ascii?Q?85bpE/vllz7vuD1Ob4DxVESde3djy60Cqt7VZQD2QyD7k48hBoLSlejHwUJI?=
 =?us-ascii?Q?xL8Ta1S9gUSGINgNwujv9/EWJMslem9z+1PkgaLSN57eZugWViqEAWbNb+cy?=
 =?us-ascii?Q?PN87iO4zMlLM7+OI5nW3ehUubu+ruSuD2v1+zOvcX5rhVxXckx6aD3U8sgI6?=
 =?us-ascii?Q?JdJCd4Uilj9/QByJ6gsIGQOW0ig3gIbwHNS8MJOJIOmh6jtB9LTeMbBQnB1o?=
 =?us-ascii?Q?hKdt1kJoDjDPEWud6UGq1usgeRjTCQVEh8gbbrxUY03u5c1IuNzX+C8tY4ML?=
 =?us-ascii?Q?spEtv4VffZJ+6xKtWOaroVUvTPjlYfGZm2cJz64/fz4UAqKmTTSugPMRRRwa?=
 =?us-ascii?Q?q3bpcNKeiLCfCL2bAJ6uQgkeIdMRLVoe6tfyIDI1nVwAJasaMS1AuUBcF/N0?=
 =?us-ascii?Q?m59ZiUTMgzVrt959H3l7vlf/3frDIFRykarIKa/DPZLDH3qPXkSvC00MN5NJ?=
 =?us-ascii?Q?jNheExellyMVfFUEhI39+SFvpuSelBkWPtZC/KbWtu+5xbzyIShtRYCWKZKr?=
 =?us-ascii?Q?E1BsuQvN3g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a13de6-631e-46bf-d683-08de997660a9
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 16:04:44.1808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Mkpk3m4Z4T7ctkBEm3qXK1MRbGOkG5k/vxIRwxUZRQ0iiR247WgWhuBBE/MBb9t82TLDtobUAS1gW/2n8ybHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10316
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58677-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4c010010:email,4ae00000:email,nxp.com:dkim,nxp.com:email,nxp.com:mid,490d0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B0403EE791
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add neoisp device tree node to imx95.dtsi and enable it by default in
19x19 evk board.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts |  4 ++++
 arch/arm64/boot/dts/freescale/imx95.dtsi          | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index aaa0da55a22b..9fbf22a57dba 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -511,6 +511,10 @@ &mu7 {
 	status = "okay";
 };
 
+&neoisp0 {
+	status = "okay";
+};
+
 &netcmix_blk_ctrl {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c88..89c6952cc33c 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1765,6 +1765,17 @@ smmu: iommu@490d0000 {
 			};
 		};
 
+		neoisp0: isp@4ae00000 {
+			compatible = "nxp,imx95-neoisp";
+			reg = <0x0 0x4ae00000 0x0 0x8000>,
+			      <0x0 0x4afe0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_CAMCM0>;
+			clock-names = "camcm0";
+			power-domains = <&scmi_devpd IMX95_PD_CAMERA>;
+			status = "disabled";
+		};
+
 		usb3: usb@4c010010 {
 			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
 			reg = <0x0 0x4c010010 0x0 0x04>,
-- 
2.51.0


