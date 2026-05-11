Return-Path: <linux-media+bounces-61118-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEyUKjTZAWrPlQEAu9opvQ
	(envelope-from <linux-media+bounces-61118-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:27:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A650EDD6
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DED6A300BB98
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 13:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE893E63A4;
	Mon, 11 May 2026 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A9WTenmq"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F4E3E8C4F;
	Mon, 11 May 2026 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506017; cv=fail; b=GDAYqm2jkU+nHkbk7uWKUl41qWinkL5dd7monubWgsWnXMcp5rD37pEoEu5IKgRH7lXXBh17UaDbibzBWtqjxOOSJu0ClvRFsDsjBjWmQUlgKFebdnh8YckSDDd60QM1rQXiJPz4aDAJ4AE9adVPWYWwFGXEFTj3QAF4Y6jCYsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506017; c=relaxed/simple;
	bh=Guv7IiAHHmP97dOUL/jCbFMFP1NH4fbRJ8C5DxxTg1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TxuJSJCa8ULpPMZFw5Kq3TvIlF9bvf5Jv7hrhEPu4xkFPlBxUl8G4brL5RYXZ9alGT/7AUMJC56FvehYUKnNVQRUKOxGfoWyLfuQL3nCyfp6H198dsPBT81YNXj8Snso04q3X1NQyp3W1N3Ip1aDtHqJ+7eSNebfLRuxAHjlk0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A9WTenmq; arc=fail smtp.client-ip=52.101.84.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMyMbutJUEEm4949eKbeyAhbNHkdZBST4tvaNu7Szvf03SwcSI6Al1CWKlRRWU/LzL9JxWHtdBm7wc+HopBCJ6edD7/NqoTQAjcV3O6rv2L62w8soMiW/Ld7AEq2xQrJvd4ZsFhtxtMlOkqYU7cpHmlXT60x8KqVBM6r9xxhXzUWPWcJhTnZynSNUAqrs/TYiRP0DVnBzegVh9grPB/RkBQpsBGY7b7DIMym5cLcToL0ygTNhZibMBnRDL/3trVpTCRCH8V8B7yIh9Poduj5zJczXHQuToXwZHzOja5qVfMcGuWSkEBc11sVRX7JMKFEe6YsJq0P5rWMY8ZMzyKCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpR7KndFn7bpyQdyVJD4QuyNS/d1K7MwBmH5Yv9ssyM=;
 b=jGrImQ2zOqWZ+1dfNAJ8uWGeZjq2y2owJ4e4y3xeGyk3mzDeNI9TidkAoZp+11fW4Zwl7Ur6ycLwhXFaHJ+KVzxZJPbNMCifvkTTNBSNVtJwG21AOCB2mPRWxvIXCDVledAyrao9jYvF6wbUdVvLQWsIl+Szhmz/xMsrLw1TjMy94yAu4SFGQ/HOFx3RaBV4/L1oDYL6fX8k4JNpa0WR4rrp40RrLTKYSrs0J6pVvW9SsBza0vSFkmY3LjRYcyT51wQ8ypIRVMlvBLz1aBoh9czK1f6s2ok9sx7uOzX+BEpDxDk13dvAu1mVgPKW57nALuIRMITBtIMrAE1wtSYnVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpR7KndFn7bpyQdyVJD4QuyNS/d1K7MwBmH5Yv9ssyM=;
 b=A9WTenmqc3z5VzTGfnuO6GquVM3jzQ46A8coCW0L6iGXv/7l3dQULguugw8ehryix+YnOAheB7Kc8+jCYjNJKb2tG1v8s2ATc2tsKBaCmILnrFSozH5OMO1UQeXJ9XsEwagDQPkbsqX3mFMA5zGnfQz/y73bVowLkX6xHw5gqqG0PucSePwiSSd4ZnPVNErfTi1pwYuKB0LbPKixgCMf/gK897qztFf03AulP1kAK44jkzodCbZrKK/PbxvMCpa6e/x2wY0EQcDT1t6v5ZfGXDtxmftP3wrjCj9ea1YDFN+auXpTka35xIVuIkTJvX6G8thGlSl/EyJrpkEVRwdGyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AM9PR04MB8131.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ed::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:26:53 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:26:53 +0000
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
	geert@linux-m68k.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v2 1/8] dt-bindings: media: Add nxp neoisp support
Date: Mon, 11 May 2026 15:26:21 +0200
Message-ID: <20260511132629.1300868-2-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
References: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 40026dd9-f6f1-4bc9-3898-08deaf60f71a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|19092799006|22082099003|56012099003|18002099003|11063799003|921020|38350700014|3023799003;
X-Microsoft-Antispam-Message-Info:
 TkoWtOWfv66mhaid1zAT/ibhzRsutYMdaYfUB2p2sHR90Qkf9wNlNU/M2H9lLdnFLrXu9mUqX9bFLvCvSrwtBpmSeYK0rOeTn3G9FQhpk6XYPPS45hmqMIA07xXljbsI80X+hOKs+YvdpWGQvPyaOB8l4mjGOVQAF3qyLXq9xVHxKMG77IfQkFfdHda+U1mD5kRRxWpbQ5htWTLLAm9h6Lunk+lMd15wns8hLF11cYcO+5AZ6Eej6xJ/F6vm5dDaeHzwdS+DN/IF0OUbppl/fgAKMvPFVnhwgPveUrCokvHarcfCQB3JUhM9JgzORTqSxZiz2art25oU2AUEewEOeicXxm6MkzD3264t6zNKOp4VzrP1x8lhOKkuwVEQj8EEBroD+UC8jZasx3PFLCasLLlHhFlaUSDkGO4skiubkoDjHhnNE9BwYObDs/eSSyLADyKks+qoDblHHo8NjLr3kTJ2PQAOd8Coq7iJ/RlG44yVIGJh8R315E35ieNmDjdrtu2jlIQ5W4bzVSlWuN5ZBYo3tnGdnE+9Na48CRGkHgLLx/m54nM4JZ6/EaNye309DUNmne/ziTJg07Z9y+nkYMdQUJ0IICXn2hbEAGUBItwkgo5wka8MUUMaOETydnrChsf0iwDePCNM3xcnW2M1+L8fGR868i87VPeP8KGjxIxcbuTqtZm/c1vhuLtzjnz/bI4UsWmJsjlRbDPQXbwl+9czfV9IUNwN0xOwDc3Fm+k=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(19092799006)(22082099003)(56012099003)(18002099003)(11063799003)(921020)(38350700014)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?AFW1sKiMJ1MiR+IG9RKu8U+buvhPPMPYoJMEB1xVg9SWs+QLUFiXJBZR9+pd?=
 =?us-ascii?Q?28v0cT9WfGfewmEoBIUaIs/QiLaC81BVKLw5xAHnWB43c5qxgaitTWiEpmZ5?=
 =?us-ascii?Q?ema6FB/HGIt+YB8v8FGyi/b9qaJgVyP+OU+KZe+jAFFfif6rOho3rbgf2Kqt?=
 =?us-ascii?Q?DQaQWWhm8pQC3nge9VJnkTFW1VPjmP2CVuSob65t+PqQZ/yjJpx3jma32GhC?=
 =?us-ascii?Q?txYX4Sd4JR/K0GCo5KaE/ps0du6t+jhpdBCMzeCdHQTv1lsVK1NYiFWTX1wZ?=
 =?us-ascii?Q?w2N4GTKayiy1v540+4SZjn1FyBjzY7E4+I2a6I47z7P72LvIkmiVONM8frEJ?=
 =?us-ascii?Q?ogfju096A1ec3wmWHUkobe9uzdV5GOZvQjKXOnZShPpJNnNlZAowqA84aFqH?=
 =?us-ascii?Q?fBEtD3Jgb1Nd2T2Eh8ZrAWI+S5CMOSKo1x2rcS9U+VvUqD4sulQOKLj5lE8r?=
 =?us-ascii?Q?7fXGJ2Q9z5IklqXM6X6DJMNzeXwhyGzJKw+c6TzQ4TEUaAu5KKFcathu9P8r?=
 =?us-ascii?Q?IZ7w52/5R+Uxfz+O8nTtLa3HoyqPv3eZIeeBWQyTj3T4zLGDqmuE9WUSscr+?=
 =?us-ascii?Q?m1wzEXhucyIc257Uh5dWqL67rjMAllTq5E6ltT8VNX9Z/4IPzYSV/ge4arGe?=
 =?us-ascii?Q?6aJDd7t9KBOUVgfHJP4byxOw1mVh1qImpV9fCgofDT1aTS0rH9AxjdtsxMiJ?=
 =?us-ascii?Q?xBaM9wzKW/2tcZNJNDWLrS6TIiqnRmBwxnym5sQqrGbTmvrJ6XHqnHy85kwl?=
 =?us-ascii?Q?dBCC4yTOqedKb0w3TokaqXcBX6u+asCcDfIp/8DaJKpBr3T+zg6g9Ger2ZOB?=
 =?us-ascii?Q?j0L9sDZtHPtXzAis3sDMKQG+jNHlJx+egbP/GogsqPLaaXwq/EtWuvuE9kQC?=
 =?us-ascii?Q?NmRxJHngJm1oBiVLcAbJKz9U9eK820H1OCLz6JdQ2qQYu7h/Vd3JqMUfu4Xs?=
 =?us-ascii?Q?kZKJUJGC1Z8Lo9BaHyaRXG17Jdy4U2dpKpcIqALk1oha6BNoMo5GBk0klqws?=
 =?us-ascii?Q?JQBY+lZj7s33BoPrMn9Lciv410PvmnZyeo0mklpdm6dCA3qgnDXjcM6l4Y5c?=
 =?us-ascii?Q?Fg6xKPzlW+5fqScrrBejoNBvLY+tq5qvz1SeyZ7uedU2m0JcCcATsZPD55or?=
 =?us-ascii?Q?kTj0q2AyAFXCsHF+S8r60IO1AlzqN30C071UucA6h+sTZQdEmDFTPzVS0vMs?=
 =?us-ascii?Q?XXcFx7W1zcaijTFljlO2NKfY+tDIVuNExphvkuRe1BR2mwObUZZ2R23fC016?=
 =?us-ascii?Q?qLktksehLWNY3sXI2lDDopnNE7jEzB6tbGHssBpbJ5ViRB+wfjckJomTHgjW?=
 =?us-ascii?Q?wHQgYpWKBWmH9/tzUWPTeM5hlrHxzaZkBa0JZnrCsbVmwrVhcX134v7dNTuE?=
 =?us-ascii?Q?ulwwUDhD+D4kL1dR937mJMG66Wu/8d3jjHo0F9YU5wjugmycpneNqlZB0Qyl?=
 =?us-ascii?Q?qfbhZJZ4gdvoEj1JS1iuEnohzr+rnV11MuK+LBKkOqwZFBtDvRNLn68SWu2C?=
 =?us-ascii?Q?oQav7NyzgUUufDKMnyhe+11nt1WGHFeLJhbyeMaQhY8izGP5ljnXNSfTeEnX?=
 =?us-ascii?Q?Y+9cfuQGTNouhSGc9ebLjVm4l1A8EKK8man8/KIw5hlLacVS8myUNA1DjPBA?=
 =?us-ascii?Q?/2LZ8feZz8zTpZm7gNN9O9K9ghVslnNk8luHgtVA+s5d43WDdFr2idFivaAl?=
 =?us-ascii?Q?v3OpSWuG26RPhXkqqbSJKZF7jOVmyk9Vk0cbAtKfM48b+U5RhvAiiZWWY5D/?=
 =?us-ascii?Q?cHJ7jOWYuQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40026dd9-f6f1-4bc9-3898-08deaf60f71a
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:26:53.2357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Kuott2N8kJOl/x3DbRWRaPmWYJd8v5kKpjYycKwZo/rM8elrU+zJp0EaRNlVRbJhlvjIgchiSIvCIwgApHcGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Rspamd-Queue-Id: 4A9A650EDD6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61118-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Action: no action

Add the yaml binding for NXP's Neo Image Signal Processor (ISP).

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 .../bindings/media/nxp,imx95-neoisp.yaml      | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
new file mode 100644
index 000000000000..458c4e4d640d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx95-neoisp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP NEOISP Image Signal Processing Pipeline
+
+maintainers:
+  - Antoine Bouyer <antoine.bouyer@nxp.com>
+
+description:
+  The NXP NEOISP performs a set of image processing tasks on the RAW camera
+  stream and provides RGB or YUV enhanced image.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx95-neoisp
+
+  reg:
+    items:
+      - description: The configuration registers
+      - description: ISP local memories
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: camcm0
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    isp@4ae00000 {
+        compatible = "nxp,imx95-neoisp";
+        reg = <0x4ae00000 0x8000>,
+              <0x4afe0000 0x10000>;
+        interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&gic>;
+        clocks = <&scmi_clk 64>; /* IMX95_CLK_CAMCM0 */
+        clock-names = "camcm0";
+        power-domains = <&scmi_devpd 3>; /* IMX95_PD_CAMERA */
+    };
-- 
2.51.0


