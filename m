Return-Path: <linux-media+bounces-60555-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJz3GjIH+2mbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60555-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:17:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE8F4D8782
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F211A3047273
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17A73E2774;
	Wed,  6 May 2026 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kLtS140u"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89762877DE;
	Wed,  6 May 2026 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057967; cv=fail; b=sJW41Ij/LtM1nK93kTWs8r0K4HenByKsiHFp7ZnLz4FUAbAsw8GvPichtFKhcLNwq3jPWQKtkxyUMXoAFZZcRD2aPJXA1/SEYbdOytrh4xHAW8aKq1giWWHqXKQwErw+VFTVDURbBnLTvYqQSXH8BpMqtgv9KKn4r239asIoysU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057967; c=relaxed/simple;
	bh=FjXo1hF6Rbu3KiNJLD3WSxWUAZr8qaV85cJqAvFsrIA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=aaXtzWipKwhyAd+e426EvhxCWzre310lNLtrJ9M9OS9drDYfytmcVfnaxQ6VuVYDWaXFfv4mdcaDbAivJnyRmfgfR88+hXbSpjggbF521mQ7C6jFMX3nu4hDNeD06dPK6MUdSivFdnX4HCIpu3AMdZid3nrAqPOXzyee1FehU6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kLtS140u; arc=fail smtp.client-ip=52.101.72.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcOYr0/mOlhLEhryoKiYvAfFgJRXfv2erGQqKTxaLWXwBN8BwFSSFtiCsqV1Ku1OJsnRLZQxKkz3bcQ/wHhFkkiAI53cl5/PCJXJDVEUFHt/s/klMZtgcCa/iYXt2s3TxRy5+Jl34g07Znjw1PvUZnTd2Qei72kBgTX7qihPIlU7MguT86VGZlXr+vFs+OoATXXQVR7k4zTB0ZWwFVHCR+gYcGR4TWeeHaequ7ZrGh3oLu1e6heiGS3ZY8Z6Ah3Dxah8CUTA2K9chBCx4hg0NTmJ/jEGP2AeCM18V66ouzhwBzNCgYXk+/1kIffi9SNG6Cu3auVgc9D5wUkR2PKTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5+Tl/zgsVwD9/kCdwVAFUSzbATI/y+YyCX93snTxj0=;
 b=F1mL7rlFThxY95WqCYeFkvqBAF/TZXTupdXcNA4diBrPEZtzx09V9wjqX0kIlcmxESwADJTNHw3QssY3BQ8F6kKl8UCMsM2CIoKH1jCP5GF4T64jm9FrGWtppt2s86F8UG4SanOMZfe5WLTYwfYqN3ycwIoUFpZoXAQ7jCVhW6oTn00Tpn3vI73jf0fKyc64bRU0iXPbwaJy8mKs3TncabI5+d61YTbTim8x41tdsXrxSfRomPWZLRx5m/7CJ7GC0sm52nvbZi7KjNMaIJIobhJXZvbjT9isp3Z2Swc+5sieDyvWy0Clj9w3ED8jR0hQzekW3meNgJwSXwsXkXFf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5+Tl/zgsVwD9/kCdwVAFUSzbATI/y+YyCX93snTxj0=;
 b=kLtS140upRkm6IWy54d7Y7PRLiBrHEjJJv9ZABKoxeP6fcWiYtyVpA65zzocKf7ZjGktC1ZC9EimldsEx05awVpUONLeSKpxGq02DCuSel1umitMsznesIiZsIEAiNaFJXrlFfHu0JzrkssCpCB6EHqoURxqA46RdqycJemcmoIEvfEt+mRXZ4S+4fEYs3iGUCpeYrhAwQcY+8tyqiDosQ5i6d7xxHg6Ov5cUi4zwRV6o5TZKafJjWxKQgnNXv1pcMMkNGABW7gFdn/ewGLyDuQ4nrkvPLZCVaqbPQL9ZwcjwlsSaioLGrnYnkP68XyS49y/YhzinztnqN8+YjOGzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by DUZPR04MB10040.eurprd04.prod.outlook.com (2603:10a6:10:4dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:59:22 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:59:22 +0000
From: Robby Cai <robby.cai@nxp.com>
To: laurent.pinchart@ideasonboard.com,
	Frank.Li@nxp.com,
	martink@posteo.de,
	rmfrfs@gmail.com,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	martin.kepplinger@puri.sm
Cc: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example endpoint label typo
Date: Wed,  6 May 2026 17:01:24 +0800
Message-Id: <20260506090124.2960477-1-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|DUZPR04MB10040:EE_
X-MS-Office365-Filtering-Correlation-Id: 823e44b4-d1a9-4e44-ad90-08deab4dc401
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|52116014|1800799024|18002099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 8qrNNtGcEqEPXz9V9+R7i2FWfi+b5vFPgmr9GoIAHV/ZKeRd/O5gOCWD8n5WcuRHeIv8niPHHBVjHddW4lChUFytZJtVhXhr8XoRvLO1pXA4hXCMmCaqQvJ76YjhF9O9EICulmkwLkmWSCcrYixXx8ilbcrEiNtOjmtmiKvB+P+b4IcZ1QFWUGbWzfJj4LcrBbrlpdckv5U4yTvDrb6SpOXdh5gvFNpTI3fHodQVv6f3vCcsj6sVeOKBWeo3sEyGOhfHrBHCbNePdbZ67RYxYADDhz2WqNekbZYMkTn/f/VESx7b/MV0q2i0Lxa61mfIUFVpbVgCuwLDiXojeFe0VEIfQwfXwsm68aZwSQWgijEowvpiaGESG8qmwVVTx9mPv6/7eSrShBG3sblZTHS7n1gR02GNx+EMj6I9Kk5xdEsDKni0bRxaRJ7VnO67KpNWIgF9se74zvkpmfQ9B86kE4ICTLCuYbPP+SMY/7rglLV8MNv0l9asTrnM5M/aaaM394rdzear7GAw3jaSiWc6ItAMQm0KemJnY+7/a5GgkYL/Kp2GsPZ0CMq/rFi5/at9V1MUNP0FB+cpnlk4AIxHeCkX3x+5VzHUx6OzRyd7OsPX83EYy05mwOZSiNKAMujgD6KbhL+g0VxvhTI2taG556GRPuPpE8mxswlRXygobRbmGrMtbjwMkc1reSnqsVIQQzu8KDD3wEhULI8hQLMAxKSrKdwdBfWRqzbBwLxc5D9ZsTLl1c5zP98LXaMR44f1Qq1tOwkSS5YgxFjdaDXdGg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(52116014)(1800799024)(18002099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?zU9WqH2NNUU0HWaLInud+0l530sgi80lkvuYdMTLmeioBsuB30bORLLiF2bR?=
 =?us-ascii?Q?ORsxMwPdX1nEZhSuP60s0zIof72IXtgeFyR8HoiXl5qrEK0jtYHT7+0OQF5k?=
 =?us-ascii?Q?maY8M0LUs5bCiyFDDmsjUJHwAHP8Jw8OIq8YMQ80rd1sZNNmgNnILS2Cgkmc?=
 =?us-ascii?Q?Pi1fm0b5Zy6aDdO/eZr7L73o0EC8n4yFjvl8upv8waSrKzTmrLDg1kXYq4cm?=
 =?us-ascii?Q?mQv7/HvEK23d+vGBpdCf833ynwtGM/aL81nGHpYxZlHz/iD0ZbbSFVjpJnL+?=
 =?us-ascii?Q?VruM27GgzYB43DR4kBdyyRZKoSbxK8Z4e0X9FUmNF0EdfVmI+WDmwaphB1YM?=
 =?us-ascii?Q?vIeeVvJtCUs90+RwVauEYAv2GPT6gmcbCvsYwYGImN960Tn0RXO5o3LpDMLo?=
 =?us-ascii?Q?e+HTv6GinExw/6rIaK8qITxMRHq8GKczpa64/7Epuq/ZfhZ4xTXxAF5PBnyB?=
 =?us-ascii?Q?zyu05ncTbqJsKH8JN1kX3iWF8GJtXLDO1i2/wjphSBXibI3g5hUWXHpw1Ozm?=
 =?us-ascii?Q?X+47WDIFb44wBQGsBxKdnXY0KAt9MhXEVpRtaMjkA4/g3jsScGZtKaG6JUTi?=
 =?us-ascii?Q?EHFUusArqRoqXh4eLYHXlti081Yp2lFsgcNSr6KjPRU1DSEPPRAubErngXRN?=
 =?us-ascii?Q?/ORVnrGL2ChGO6qVDdgPFz7AyT4awVwEVna9/uBHWayvDe4Eo7Amz69J9KIQ?=
 =?us-ascii?Q?Koi2U8gR0pFTxSmOU9oDTA72FdV3JWfS4ULNTdUsGoa+5uXbHPE5L3b50czA?=
 =?us-ascii?Q?m5p7B0RjcrDgrXzxGgjVE4EWuHWo3INkCHiKzNLe06fS2sUGIH93becF0F0Q?=
 =?us-ascii?Q?QCA8WQlXgXVhISXD2Bclhdr3B8UdQ4yOlKTSNzKBG6J/xHC7EKFnhPA4njah?=
 =?us-ascii?Q?8vkpcBFdkZC6vWS2p5eWTtVKPqSWiiglSciT+fj3Clqym3nk7GyEwx9Fky/e?=
 =?us-ascii?Q?30Nr5cUwfciDBOxrkQI/o2038QjZhyGF3SgZO6tWQEJcgGWu+4500U3zEbo9?=
 =?us-ascii?Q?yzD/njLUuOqboLHFkLmzAOQq4NbDSs8iVyzgOhA5+gCZwMC+1LteXXrBikgp?=
 =?us-ascii?Q?+gLjbWCz8SixBQJyX9LDiTQ7nV2H80b4jW1U5/juJvdHQOZC0QdgPsCHPKrk?=
 =?us-ascii?Q?lgyfOielLwqEljDt78/sWNc8RGHYw75yU8w0poNGqXHxugT4EfrnSAv/tjvu?=
 =?us-ascii?Q?/KTmwQEHKegXJH4K9pSs4WpD8kv+4ZYs/5YYCMxpIfPlX1wP2oUO7R2h5BRD?=
 =?us-ascii?Q?hEi8FvQmqOAAirnUxnvqRic6ycJ4W1AoP07ksLMHVzJ06VFQDc8EZ4aUKvNB?=
 =?us-ascii?Q?Uw52yarO4uYNf0PwMrx7yv9oc1uwt7dA4cHla8eokKUOyyGWdhA0TjyVx8oj?=
 =?us-ascii?Q?o21w8OcwK9dIjstTOiRkzrREUt6B6/F7XMUjIXcsgaKs3WzyM5cnuR+XVypl?=
 =?us-ascii?Q?D78TYza1wmqzC/kQ+Q/eCXHK4Gey1AKEJWcmN4A38Dl90QDJgB61Qdjd5UZU?=
 =?us-ascii?Q?VJlUQYKOnbbmIbkciAc8/Rnf2FlNbv5ux2K5uNpV3O/ZDAf57XnEfFJt/jVJ?=
 =?us-ascii?Q?xQSTc1rrcA3dLpscX/LS2/jFQW6002H88tH446frmblL1TLH0YC5EBLK+HM0?=
 =?us-ascii?Q?o+E9rzftzwk2L9hPEy9Bc3GPTiIGdPter4NXHE1TL7BmoSAt1mtf2rRH8MTn?=
 =?us-ascii?Q?gFzqoSqjfWyvE3Ni553zQQhCmhh9OGLnDWya+Dso3zHBcBALwXCOVceLhKOt?=
 =?us-ascii?Q?JrKstmzthw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823e44b4-d1a9-4e44-ad90-08deab4dc401
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:59:22.4088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmCk9yn3ONrHvdenBPmsUNMGm/rye7qY3leLab0z4tsoHTz/S2G96bPaTuyI6bym9fn/dM/hb5gaehZMOI/pYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10040
X-Rspamd-Queue-Id: 6AE8F4D8782
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[nxp.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60555-lists,linux-media=lfdr.de];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_TO(0.00)[ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,kernel.org,pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[robby.cai@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_NONE(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_SPAM(0.00)[0.804];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid,0.0.0.0:email,0.0.0.1:email]
X-Spam: Yes

The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out} endpoint
labels, which is confusing for an i.MX8MQ binding. Rename the labels to
imx8mq_mipi_csi_{in,out} for consistency.

Fixes: 37255747ecbd ("media: dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller")
Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 4fcfc4fd3565..71f79651dd96 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -220,7 +220,7 @@ examples:
             port@0 {
                 reg = <0>;
 
-                imx8mm_mipi_csi_in: endpoint {
+                imx8mq_mipi_csi_in: endpoint {
                     remote-endpoint = <&imx477_out>;
                     data-lanes = <1 2 3 4>;
                 };
@@ -229,7 +229,7 @@ examples:
             port@1 {
                 reg = <1>;
 
-                imx8mm_mipi_csi_out: endpoint {
+                imx8mq_mipi_csi_out: endpoint {
                     remote-endpoint = <&csi_in>;
                 };
             };
-- 
2.37.1


