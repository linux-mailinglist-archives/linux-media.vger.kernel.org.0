Return-Path: <linux-media+bounces-25479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD5A240B6
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE538169615
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C051F3D3A;
	Fri, 31 Jan 2025 16:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PBo//0gJ"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A601F2C5B;
	Fri, 31 Jan 2025 16:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341276; cv=fail; b=A3k06QjycIe8g3NScx2GqFDpbUe2Dxyf5tQjbO5dioQHcsh0MKKl8E47hYz1BaDwfglwvflwJt3zebmPvshlB3D3V6hFphCpIKEX9FlzcpPwyDarZaJAaDpKjdsY7UMoKje4Z2vuP9IKWiGeecMkH2KRYL4Wf/EVHXOpj2mGWco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341276; c=relaxed/simple;
	bh=LtDzLy16sKf9e9KLaID6gsEQtuZx3XwfGmwrjuf8uvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CnsO/HOrK7AsnRbrg5hfb+1Khf/5/esFSd/D2nHlFQc8ar6tXW+LIT7UeWDW10SAV5vhO896huvR3gotHBlsge3nvumDuNEb7eHiF7HP+HsVDNi1QNRZ21mgDnC7f8sYZozrGqIyDLjbLKlGaoRps5i+G+KAPI2gFr3mvToBofU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PBo//0gJ; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhQrhhhSELkS+N/Z5eaXrp0/qIvWPzRhgNnKm7SW94jU2XzaEA/8/KmcR5EoPiVBPhs9gG1Koi3UCfpDvlZbFSo+K8CkNs7pjZTh5ch1BjYm85RW77rjjfp47t3o76dCZwNfb2InKCvMg0vz3rmtnNf8xSSMBj7oyahcazwuXUB43uR1UeJEdfKXmRaM34Dp05Gr2LaXuK5VT65eB1D12OBjoTVelXMhKTpvSBl7CtUheg/Ic9Hptp/FfV7y+aaSW9SCTKtR0yOCggezwTVeuAd0JSIBfloS/qnu0YQpA4kZlIEVqYXkxgwXIJnpTVgb2ruNQUtpi37I5qVq/cU8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zN0lYccTmUd8XK8t0ve3fyUBpYkTPy1IvSRvyTXpf/o=;
 b=UWMPD3YulibdyV1GRQYJdhCI/NPZKkDQGWsk6HTMwAtU1uRP88E3cSUk7xdVXuDiqmuMcGGSQG1w1dAf1AWE+7wzYbM1U/rO0QV8zbGD3LVrWZToDSpwiVlLZanqzHRx+OQVneYGZUYph4VEFaZnly7xvoEzOqvNVux7FkSfcFk2C2ZmAIhJwD2enQL01ZXs76H1PuD/cC43QTPb8enC2CSLKPG45kQnFFFt90RxZVWsG6Z/7UlwWzWon2XcGxq1MXDurB4fPGo+kafZehmE7J0dLuf/KvIaZMr7F7e1G70iH/S8Fpbf45etO1aFD4CV6oeP/mvXrTE8DoOA3zyqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zN0lYccTmUd8XK8t0ve3fyUBpYkTPy1IvSRvyTXpf/o=;
 b=PBo//0gJt9BdWnJC2YL3V5We4dNQbLfnjILJ9uVkHFbfagf/dkmG4kWXUUw/EsMyz+R1iJydOyZdMRo3jHploQdFiho+EjqFuEbBmvS12noEDop8/jZAtHihxuwwBmgBXXt4UVp4Q27KTHhCEzQRPqVp3XuVNZBAt4JGfTW/kldFgpeHp6DSaW252MXip+uoByNQorhzqnMNcCwcVfXH2Ki+zvGTnfYBtVzpC0wU9U3NRk8R74QtFqrxXJGn9dg+lV5+IrL2x8tNCqWcLRykl9yu6EWXJfglpdbJTTalHTzdxWckOH7oeKkddjekXKLzysR/KV+s5UL+crl3uPOQsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:30 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:30 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFC 02/12] dt-bindings: i2c: maxim,max96712: add a couple of new properties
Date: Fri, 31 Jan 2025 18:33:56 +0200
Message-Id: <20250131163408.2019144-3-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::33) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: da647c7d-5ea1-419c-186f-08dd42152300
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WUg2EEV1DY+RQEGoA6C5o7CVv24HrIQX477KsDMXelvuvvtkCN3XzpZiPAGu?=
 =?us-ascii?Q?9JyA14BSKfZ3YBAKiKP5ts4aXgNQAGzvQ655hILbg5yeNJw90X6Niu7Iddqm?=
 =?us-ascii?Q?+bQK7adeDZsTx5m0XcZhow827qlDHtssakIEWvR1qhwx94R8vHfulF0I0frQ?=
 =?us-ascii?Q?lbsUgSDrF/Bkls4DBXTmjiaYjDs0svqc2epczkw1sor+HHHiB06rFmHE+8AJ?=
 =?us-ascii?Q?UQdT2+TMlBd8+gOABtLnoq6MYA7djPUGx9RNabqlgj2/c+/Pdv8NtaxqPoJ1?=
 =?us-ascii?Q?BZuyqZVYg6P3bhBo5poralYkbZvqrufxNAD0/SOv56MD42GGIgfWi3xL7jpb?=
 =?us-ascii?Q?UQaGGv6us9LAmvLVtlFjuI3pHtsURBPgGAA9c+gMFlHTMe3q0GLesQcNPiAf?=
 =?us-ascii?Q?psnJ117tdXo23U5ikpZ6bqhHkuJOwpO5FZCJGte89ZxA/3F8k/1Aznnx+V43?=
 =?us-ascii?Q?WeN/QsTpRIb19CAUCe1GAolAhjpDsKqAkgzq4gmBaHiAUrfjp0iFeE+BB8XV?=
 =?us-ascii?Q?vM6lX2BwtTfuSckPjYi9cXHAHoEil0XJ6RTWLl15Aa7BQ9a+mRPWjAk6NCPT?=
 =?us-ascii?Q?6dziHUgjdniMtKvmoYruZYItT3kvLneUCri/gZq4ZW9ZAqs3yUsC+WISofRk?=
 =?us-ascii?Q?yS11oedn4Wdxw7GZbcX8eVcFsIys8i4B/yS8BhI17eCBM9U/oXUhkZqU6lQB?=
 =?us-ascii?Q?/4uzmAcWD3EVVC4cYQexlIswrPUP5E8rGrwLJ1f0GgOL1dTiXiQoaq+lXuTz?=
 =?us-ascii?Q?ipTt16LnaHOSpzfqRVQlnmSuUPKkbYV+OnHU+IkRidCm9LXd46cqr8Ji+57M?=
 =?us-ascii?Q?m7suM3Xdlqf5pFfrlFa42bWTy+B/38SChS4lsmjT6nbeXHpojj1ZSmwidH1o?=
 =?us-ascii?Q?p6cLsgtSbZYnRMWFCiGV2UybkxAGLw/QTGsAcYCkc0hcZh8SoO71YimqJNq4?=
 =?us-ascii?Q?5YwvVnIh19h4sIiwMhCqRnQDnBJvx0OdT/SqcEFkuEnNv+fxkOXUraGIOKP0?=
 =?us-ascii?Q?fJr7U7d2sYIZ7KqVNTjzpzA6E+m9/mo0IG2zOoxqKbZ2I4gUnXJ67qWy1lvQ?=
 =?us-ascii?Q?e5AJzjxMRkr5gl1s2rfjWoHew0fSHFWwMr+YyFOnHO80KtUWRrJ9uSV/ZZom?=
 =?us-ascii?Q?LQ4Ig36akGwNI1p251ZAwdl49xtziK+3MXC+HG0m71zMYJF8KZPTcrr8GEPh?=
 =?us-ascii?Q?welxsGvigK12wg23fnKxLPvHdhO7d2D5OEbI/4yEgIIN5bTAeq+dlddocMfp?=
 =?us-ascii?Q?d5YF8PDI7ozpSY9mjSH/o8ps6vWpYp9oIp/V/7o8g2qOTbHUYVf/vhJw1ogc?=
 =?us-ascii?Q?h72LrdHO/tJghrfRD5Iq/KMOuID3WrSLt2QMfAlDM7eOoYL1PZDuFoNxpQfQ?=
 =?us-ascii?Q?4wnmkDpgEGnnzQtZz25feHjwbuTD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GaWb3qpS/ALlJfxpf+0/s03+k14hfCFAWhqhYrDf0KLcgBo7N/TvxH99jeNJ?=
 =?us-ascii?Q?BOHe3d8DToveYTkhvpYyAsRsp9m895qlMYCMSu2YHgtvEOZmmF85Clr2pUR/?=
 =?us-ascii?Q?imbC6TsVVgGeBsx8A8nsXmSQ1EzTLtc5K6DrpNOUc6W+hTrXNcEpXmSi09og?=
 =?us-ascii?Q?TrbA1MtBthDFFR+O4QNh/Q1U0IAuCFKqwvrSjkKywx9nlCqPg/WZrTY6QH/J?=
 =?us-ascii?Q?c458LNstF/8kmaPPpZBzpLfcC3qnY0VWY6hg6875g2DwIEWCXkBs3QddlRIN?=
 =?us-ascii?Q?f5AltFzpRdjG01mcJ/+mQJweUN+Bu29HI20FdHdBlBjE2P/okihwYHMX7UIp?=
 =?us-ascii?Q?YCvcHRonlyh1bUc33nRhZxuxJ+TBraP4s0KZHjea0aoB/AiKGrQg+MQQ85H4?=
 =?us-ascii?Q?6WtTyjvL+GLmFJhXfn7BnaaiR1ZghkJgk+c6n3cwWQQV+HMOc2UPboQmXM9a?=
 =?us-ascii?Q?6X6BEenJVK92GC8Z8E7wqKWnxSvHsQRSpgFplSMbwd0asQSh6yx0MxCi1n/P?=
 =?us-ascii?Q?O/ojuDWFc6A71W/tE7r8382wg1qMAN9t6w82NNwV4AO0YvN1yHROypyXe/ka?=
 =?us-ascii?Q?W3WyZ6z3dToPMN46cRs1A0Lvr9TmKoCQhKhh6MZ8Prkn9TwHlGzuoE2PgN1/?=
 =?us-ascii?Q?hCiqzmxulPjKMTZe+0v0+Xm3Foip5zQH18W8kx9r/LC0MLl9zV1XvLSv9cc+?=
 =?us-ascii?Q?8EASxSJgdWccQd84WXys/mOdXMGmehRG+4wqkUhkXKBUEaBQ6y/slvCVR2pL?=
 =?us-ascii?Q?PEt6/Zhd/zgWBQ/WcbF0qJSP2vS0OegSOIXFqHTghE2OuU51S9l5GPlu5eE1?=
 =?us-ascii?Q?G1QLP7NTZW2yvVl30Ij/cyZnRWLHoHWgc4JGTblEU2VjGdF2lL7rOw5T8WAa?=
 =?us-ascii?Q?CB5W51+bEsJFQMNurd2GXC3E3gJNZGX19YbQtmAersVLXu/MQ7nHBsMz3VsI?=
 =?us-ascii?Q?2BdkeddkLZlzEtCnIrOSqSwqgrsuY7C+lyT9aJoMIpQcOmdgcvUmfrrCu/+U?=
 =?us-ascii?Q?lfNfPIefXDa329xYVcCvlOuolMYi6ctpd5ZynwOSlTbuRuHuZ9lqIzpZcG8L?=
 =?us-ascii?Q?a8MSxj6XSbaxXc1YVXwz9TxqlI9vWmSwlxBip303WNp6QrVRb6aC/HPYXF29?=
 =?us-ascii?Q?SL3PCXAx2IudF7GU4qqU3qCZHw/tvloO6dX4pgyJdaiatjby929qQq9XNTyN?=
 =?us-ascii?Q?djlV2Ea0Kh3DEf/yzlqusFPF6kuwigMT5iKp3cLRCrQlZg3BJEWy5+5oWWF0?=
 =?us-ascii?Q?B/0W2pcGl033vViJdrU59mlrh8tB0o3xeoBOv44l7Sb2v7Usbi+CA93kOnwP?=
 =?us-ascii?Q?oEPNzyLnp+E3cMgkHs300Tp03Tj6cH7AqLbU/vQY596Hf6Ss7ku7ZXvxCWOZ?=
 =?us-ascii?Q?UNenBESDaboypRJd1XqT/oE5V51im5EDO8RHYyn8kklHufiT7V9n01m/P9sQ?=
 =?us-ascii?Q?ZwgVfnzMxzR+G+NW/TVkl7DzRKlT1Wy6bmN6XJUgz/aKQ+l4OmfptQCOyOQE?=
 =?us-ascii?Q?TuIwUnZ27JWY2bH5IGpR5vygGLRB6OP2cJhkAU6CfAHJwwKGbVd8F8iNvDBh?=
 =?us-ascii?Q?Ji4H/nFwqBxJE5NB8yIHTXw/1KhK90bBpefmT6spj8mXmfxR4TJfthA4VMbL?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da647c7d-5ea1-419c-186f-08dd42152300
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:30.7171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lW6D4LjSAMdqxbitwIVVjuvk65WhOTVAzGMLxrHmUICS1HD8faTvMVoErD2iQXX18KVYr14EsZ/ySzy0FmeNMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

Add new properties for configuring FSYNC functionality and operation
mode, as the chip can support both tunneling and pixel modes.

While at it, add the maxim,max96724 compatible to the bindings since it
was already added in the driver some time back.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd3..410004f3a032f 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -36,6 +36,48 @@ properties:
 
   enable-gpios: true
 
+  '#gpio-cells':
+    const: 2
+    description: |
+      First cell is the GPIO pin number, second cell is the flags. The GPIO pin
+      number must be in range of [0, 11].
+
+  gpio-controller: true
+
+  maxim,operation-mode:
+    description: |
+      Deserializer mode of operation: 0 - tunneling mode, 1 - pixel mode
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+
+  maxim,fsync-config:
+    description: |
+      Frame synchronization (FSYNC) is used to align images sent from multiple
+      sources in surround-view applications and is required for concatenation.
+      In FSYNC mode, the deserializer sends a sync signal to each serializer;
+      the serializers then send the signal to the connected sensor.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    items:
+      - description: |
+          FSYNC mode:
+            0 - off, no FSYNC generation
+            1 - internal, GPIO is not used as input or output
+            2 - master, GPIO pin is used to drive a slave deserializer
+            3 - slave, GPIO pin is used as FSYNC input driven by a master device
+        enum: [0, 1, 2, 3]
+        default: 0
+      - description: |
+          FSYNC TX ID: GPIO ID used for transmitting FSYNC signal
+        minimum: 0
+        maximum: 31
+        default: 0
+      - description: |
+          FSYNC pin: 0 - MFP0, 1 - MFP7. Not used for internal mode.
+        enum: [0, 1]
+        default: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -92,6 +134,9 @@ examples:
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/media/video-interfaces.h>
 
+    maxim,operation-mode = <0>;
+    maxim,fsync-config = <1 0>;
+
     i2c@e6508000 {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.44.1


