Return-Path: <linux-media+bounces-59509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNW+Ffw362nRJwAAu9opvQ
	(envelope-from <linux-media+bounces-59509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:29:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E145C348
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 495A230432F6
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1906338837E;
	Fri, 24 Apr 2026 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="GLSMrP1U"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021095.outbound.protection.outlook.com [40.107.57.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE41A267;
	Fri, 24 Apr 2026 09:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022797; cv=fail; b=klbZpzC4xhbZ8ywLZZrbgRRfrWTGoNE+9FujvuITfUIWKaggHtKBQ3201qjouIoe9ZeRbpWX+WNd+rIFprYB3k1qk01E9ce9H1/pOQxUMY0LzxBSdDPqTXYxsUuy0/MnlZB53LDVAVOjmnz/xRtH9VdGI1WThpAVMDDety0urCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022797; c=relaxed/simple;
	bh=xUhgcL9GQeAsyXfJdkttEugkSdwJJiEGBTECb8Y+ifI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jSc4Msdgp8tcRKP+Uif6RIlqdBfkqk59oW4+Si1uywbVnRsa5wbPRig3I6amUqfxO0A8WW1Tgao5fOaqpWRsKtWKfA38Suhcgg9c9TwzcznOf3OjOXCmOoY6wttQdW8ibpgevEuk81oh+HPg5mwhJBLX6yj7wAJHkCYrQqRqD9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=GLSMrP1U; arc=fail smtp.client-ip=40.107.57.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owE9i+Ge3ZZl88S+rzff8sXP0DR/liLBxdnMWzII7sHTZftG96C/fJ2MYytOPAJ3z5P100Lw8tHZ1qkRYRc1yInwdUjF6cEW1cJWUPXkf1mC94R2OkfHp02pG8KcErPXXG23/vxFFeNFboMC9ERm7ThePycwWN7CFyTaYySw8gyKY+jm0Mdxw0pkRHBgRaQ2HQvRwProbPcvT+bjkuDZpnqZ/zmx094LXCKPi4sQMf9NWp37OzR2vRXH/oHr447zSbzojTavxAQ2BFwQINzEvAgcaX+eKk5o/mjl4WXrOkDmGD1Pnfo91frZ8rjcxr1Cj2W1rslr1TgfM4qMQWsXyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Jbstpi9fnWAVVcQZbYWxb3oxpjJbkCTp8h7+rvdlPQ=;
 b=J5dx7zUxCYwurt38hMR+2eX3jccsMZCmaQRlo0D1Hd8lDyZ2Q9NK+DX9vA/TRqt2T/dJclpF9Bz5rGItvxPmYvk2j7VUmUF8L1SMVycanDrX7+Dvdo0v02kwVyFHowArXfuwqbFdg4xP3XbP+GClJgVY+Zmk20WkFCvznCh/4AaThn2BECvFw/FosQzY353z2aTt5AsGgIskjSnJ+gcdo9SshGC59FjIEYDb98Sw1Now6o/VY1miQ8SFv73MU0TcT525DZjnnIsUN9im8dhFxmI3KrS8wolLZPSGuK5GECcnhUtdSjGWjx/eFnMAlhUBEn+rjIoll91nhY6vgZE+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Jbstpi9fnWAVVcQZbYWxb3oxpjJbkCTp8h7+rvdlPQ=;
 b=GLSMrP1Ug4pogUCv7CLzWN1gliaXoEO6HJSeSYIf2SWVnhCSQ9mfEpdZ+2N3TkW0kTIEDmWmMBANXVkDBpaHOZOsl3GuMLehlePJQLFdZ0TDUbMfosZYUPUNWBOgd6pwjWpmgrc7ot1Pk5RzlyveJRuWElfg4GWzGwEDWS3YVzF67jwSpvVcXB14qoNPKyM7vsOYUkZjWnXTh66fWiiH8g7EWt1YAPpSLfdjxojnMPmuqbGOfqcNCvcjd9VkGECxOem0xREJdl96dv8AoNK2Vsc5XnaIDmYmBzUrsSNLqxUWc1QSF4XJJa8edbwNq48M6HkQ8/0CLP7Kdy5oKyXMvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MA5P287MB5221.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 09:26:31 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%3]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 09:26:31 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: media: i2c: Add os02g10 sensor
Date: Fri, 24 Apr 2026 14:55:45 +0530
Message-Id: <20260424092554.26130-2-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::24) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|MA5P287MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b04f90-da14-4cf5-2eaa-08dea1e39213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|22082099003|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	oCUA5CM1KnDi34fDAJspA6hT5/61+kcoV2W2EwoPsb30TQcBZKszEAmxXtTK9pgj/E9H8V2WlmTND3IztcHc3gSpWLxjlH28IWwmrjrKUM3cJXU6bJxOTGg5mEJHIM4eFT+fO83p+EQ1RHrwrpAFYiAR3483IHsbY/KjoLD+FYeKHT2S0lYB6KkT/6g8htIS58XtFiV/caY34j22gxQrQgv9I9u0k1I2ZrcyFv1UhaWMrG8ddUUkxw/0SRvT9pmMz66Bii7H1cEtpC9eVUjGhcBd5q028rpNUYBBFvZn5NhQvycGnT7utx/UTsVK5Gc1eW0bP2KeKrVDDEA4xJ5ypfUK0vPSYfjaH19rZyX7+7LMout+Wb0NubdsQlaSUZYw8wyU1bN6oCFieWWg2HHiNuljeXAJMHXYPzb6+YizSWSv+1+ub21+0Dj7u1swBDTXfIUAc/oYGXby9B9zL59ka0wyO6PcajUxzyK8JPVC/24D4IpKqXbEDTacwyfmKutNQk0ftNdokdsMz/NbcI8v2NRAU2lvoBi8fe+RW/60e3tf3Kfy1dx9rvl1QWxhxJFw7swCZLH+2Xds3604+1wBaCrw6rYfAYVaptN+gkpZhtTwhaE7skL4J0gVk85fR9WUj7seaIDA4N1/VJbimScCB6UsF2k2lz3rcQlLsYmXTa8rqpqbhbw/OdzsR6xX1Z9VcLGbq8no7qPZYUT52+PAlGGwLqZiFp4fUJVIoSxoXOA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o67gMnDj2brVg68xzDaCjL2JtTsWUIE4m6etEHd7zpyhhbAXi8BhGCdT+faf?=
 =?us-ascii?Q?1g/kO//BhNHSP1Ov7OeKKr7v0yS3W10uCGiAOB8Txss3ko/nAJJlp+p8RVWi?=
 =?us-ascii?Q?idib7skP8dtvWCR/q/7vszHWtQzbEG4K474pq51GpuiXInrVtfUL8upyyjkY?=
 =?us-ascii?Q?7B9OEUVrM8Y3kYpVMt2GqQK1tX/ZLlX4G7xxSMqLs55+icTkAs6VhqkSc7ud?=
 =?us-ascii?Q?xVZ7JyL8ybi1c4TcKum46Kyi9PYCTQGv+j/6guIQ11ai+3AEAePl92pTsYYl?=
 =?us-ascii?Q?e4jlbnWiZglQFJFhAaEWgijPHFEwAjobuT0bAteXXzpU/sbpn/okByq1VrYJ?=
 =?us-ascii?Q?PZLOGbkjw4glf45seS7jZJHrJwnGHQqS0i4Bdb94YRL6tUlEUA0H3/BPx3bl?=
 =?us-ascii?Q?TITZXPFmzDRE7r68Qu2L4gYIpneqoAGFU+BLlmoJWIdUKMdFYnRfg5WJQKgu?=
 =?us-ascii?Q?abV+dlOeoDTMXGUX18II98yzRHf50QSFGjNUEE96GJXXBDwrOaJLTrYL/tXd?=
 =?us-ascii?Q?7YwpJlX565O0z4kk6yKkoSQdx6aSQ7GKLhSZvS+5OXar7OUsnKD+eYPI1402?=
 =?us-ascii?Q?Cf0ZXNX1TLkusfezwBSszBrs8iu9rR7E5WDY2XF5QITOXFnFJpIHD1ZNwmFD?=
 =?us-ascii?Q?oUYb9YkB9IhkjmQm1sif/J6M0t/y2g0bpwlpxq2vWqcM7c6KKd1XBt1eISEK?=
 =?us-ascii?Q?5w4G9mqAIwY/mef3CJAuQd7gPrYKUSGBxPXC2DR0TmD70htaKq7YywrxOpHT?=
 =?us-ascii?Q?xTTpeH5+DR5Swys4+uzTkw4THhGB6aHeoZ0QeeTEsNGMXbZvOeP4tQ17+mTu?=
 =?us-ascii?Q?pli9f7SgsnCPabrsjl7BaXj1rOt4c7sEsGoT07Uo6MI4jlfv2Hiapof8lhyb?=
 =?us-ascii?Q?Ou0mtQZ2cLp1nz4MOAH7eZDr7zRFjdfmRs7guzGonrsn6ivrI4WBqeuePmNr?=
 =?us-ascii?Q?MxmT6hSWPexYOBGNTCUSUNmLfFsf+AuuHcE6AYcStZm05bB4DKZkNxOKJw0I?=
 =?us-ascii?Q?nuTY/3P2vBo5v9bt81wnwRXYJmXxFNh9xFSZpcqiTuSr3QT/BH7iHtJu/HSo?=
 =?us-ascii?Q?qaylBQALiixnExoWBUpo/sN3s851fSZ+Efd2oo/BRZ40PV6hZaFhcB5KMNTQ?=
 =?us-ascii?Q?UkabIWDH5APddOVJuCwVkCukHGjV30rNyldkfnJwhQR9q97W25eBzo1+Qcnx?=
 =?us-ascii?Q?f254XNerp8eLBhy24cJYHBwnXu1dP8aY1TYLv5Gb91jJoTb5nGHo/7AWG/GV?=
 =?us-ascii?Q?y4At4pw9e4aWblBp87IzzwgfAMX4B3SgTd8OPuBnPuI6WLw9q56S337jjbF4?=
 =?us-ascii?Q?zPo16hwwlpAhTlIMVzVJr7apATcBzoqGMWbOVZ59W3NDd2txiInBvKWx+a4r?=
 =?us-ascii?Q?cph/wSPu0OGLP2Wvx/fdlpUQFoCSxAW7YNIkvArBuZGeSQo0SzJapmCJmljG?=
 =?us-ascii?Q?ewc7kj10tolAoZYQpRgOWtAypuxt1Uk9JmM5TFt/jgd5cX23MctLMl1YjUjL?=
 =?us-ascii?Q?9waby4g0OtbSoQ1LfoK4ktOvKNxUprP45G63xfLNLCBiMvYRjFmk5ymNnXjm?=
 =?us-ascii?Q?seDCqUcZpENKBiQP/kUDUY46RAsE2WklNkB30K6VmaeyP4IdiOX4eRq5s8PW?=
 =?us-ascii?Q?4pSmh+SUYTzEp6jps+s2DpSvHfJVJVvUUjQq3HyiPRH1OT+nNQefYKkBYzpe?=
 =?us-ascii?Q?1Ake6aw72NLeS45/Q96ByIQ1G58wutxJWyyQiXu8Dn2XOR4EOMPn+CkaR3QJ?=
 =?us-ascii?Q?5v/siwyYHBtQe4vzsx8JxLW+OkbYjrx1/C8kNu2eSBUqm4zX70nL?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b04f90-da14-4cf5-2eaa-08dea1e39213
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 09:26:31.4568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vTCJxO502CQEUcGOJwbJgWLNKU5exE9VssBrKl6OC8igdrk5zUKLOrvWQalihnNnbDpJxXbS9BcZ6k+WOaLxdEjh7jVg+V4+TryIJGbi5EaN8HJAaYDr+sngrxs8nli
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5221
X-Rspamd-Queue-Id: 9E6E145C348
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59509-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,siliconsignals.io:email,siliconsignals.io:dkim,siliconsignals.io:mid,3c:email]

Add bindings for Omnivision OS02G10 sensor.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
---
 .../bindings/media/i2c/ovti,os02g10.yaml      | 91 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
new file mode 100644
index 000000000000..252059459390
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os02g10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS02G10 Image Sensor
+
+maintainers:
+  - Tarang Raval <tarang.raval@siliconsignals.io>
+
+description:
+  The OmniVision OS02G10 is a 2MP (1920x1080) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. It outputs RAW10 format data and supports
+  a 2-lane MIPI interface.
+
+properties:
+  compatible:
+    const: ovti,os02g10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital core Power Supply (1.5v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@3c {
+            compatible = "ovti,os02g10";
+            reg = <0x3c>;
+            clocks = <&os02g10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os02g10_avdd_2v8>;
+            dvdd-supply = <&os02g10_dvdd_1v2>;
+            dovdd-supply = <&os2gb10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 900fc00b73e6..8a0a55073c30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19443,6 +19443,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS02G10 SENSOR DRIVER
+M:	Tarang Raval <tarang.raval@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
+
 OMNIVISION OS05B10 SENSOR DRIVER
 M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
 M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
--
2.34.1


