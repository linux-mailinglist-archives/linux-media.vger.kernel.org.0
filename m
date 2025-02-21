Return-Path: <linux-media+bounces-26595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B778A3FA1B
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B40B3B7C84
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826F521516E;
	Fri, 21 Feb 2025 15:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FDn5zu6M"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F098215067;
	Fri, 21 Feb 2025 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153380; cv=fail; b=Vpbb+3vfj+p5A/DZfydmpviKVqYOm/3THjx8S8H+PctguAzXPsYyS2FBYjRfsPuknFyF+v7le99bBKWABU3inX7qX9IFj5rJxr+/3Y/bB/MaDf4s2sllFwEwO+bHWXO+mLi081h9UmgLG016Iu/p/7gXO8t1dF4Jjc+FRBBZfRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153380; c=relaxed/simple;
	bh=/+iffWuJrFDhSErbcz3W5TbGqu0OeU3loxr7Z3SCJGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=molY2YoW00ogIxqW0LKtFkkq3kvAT5pKMXi9UF9ehg8lHxPWUDHYtK86diNbIORt5H3MPfVJn/Lvfy1kfYDsyuBunCd8u8xlXedmANMLvCYxUhpOavCB7PgLO8rAXm+NJ/ewYLjLRB5yjYrgvP2NGRKjKTdMIY02SfqSJLf54rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FDn5zu6M; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuyYxzzfib1hEMc6B6lIZ1/LOEUT20SweJTKT0C00j1uLBaTim3lNoqfqGMpx8ZLGPbpBfw54xtSuHEGfhxWN4sHr6jP1JtwmBQgPfZ9xTnJ5XYCR06mRkpQirFT9DQLNWYXcTBUTZFnS2I53vrUoMPH3D1dUIHds+UqUs+jtsjzNI8xDFL3cqjMshga2pd30n7mLH8YVQVE9Luh26HgJ+AP11QZ71NKClbuNVSFICnYXZ1u+Ddbq1Ok01VpR3EaKy2W5vtUu6Ufnrm3VH/MKvltpFtZKRMlbqj7FmPouHHrhCOwT+po9lSLxlU9EchLyU6CfTNgM0WEZ/VSmFEzbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiH7eArCBFGOUW1AYF7aYkseDfrf7XEPGWF+2XGAIPI=;
 b=jbK3ubzWuuXqQEZXy9fdaJSqTYaGMO7tuTHYrgYn7ViV/kGTfOmgVafcjsJXKcRfiZg/MIKZ5iH1LZ6YGFsGAB+/dqa94joFMMeWMFXpMTA/gRQbX2fvJfbtwUOnlb6hWe8dmaWnh5Q2ThQKuYMWTwoXIp+vs2E7laYQfSKNQ3FfdJ6rbtYa+mjUEHYvugfOqaQuUutKH/VcHvihs4bkqk+U3OMES1k4am9SNKdf0Wr37fZ7zJUYVGcpz+TXjZTNWgpiHymoYZ0bJ780phkv/zrAkKXAdfbbnoVXikput8lS7I8dxnX7RrlZM+lYMepOQ0uVyqVMO826IsYUhlq4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiH7eArCBFGOUW1AYF7aYkseDfrf7XEPGWF+2XGAIPI=;
 b=FDn5zu6MJltdBtdNYvZTWOId2bF75yks2D1n8akJzUzxxmxd5K9fqjY/P+ciUSG1FDbBw6mI3ubdRW2+Bwi+D7I7/9bIhuoo5CBEihgroTcVez7UEbk0h4XfbYrW9Fwrxf6V8/T5W+sh9/aNRiSPFOYCPGGdl8lqyrVDRqEKgXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:56:16 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:56:16 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/18] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2 block
Date: Fri, 21 Feb 2025 16:55:16 +0100
Message-Id: <20250221155532.576759-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 664a7307-72e9-4169-9a48-08dd529045da
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n60hQgPD3pYYbqbSRgwu9VHcYIOng2flmbypSNpgbSQ6L446jB8dAyurRNEQ?=
 =?us-ascii?Q?3talYUdvGVsGtPNWGQyFy63G+LtMrTL/UKx/YItFxOrqc6yZTIOgkgKsV0t7?=
 =?us-ascii?Q?djiAVQ4lEaCCwHrTku18iJ2LMBD2wBEOOe/SqJvtpRuTlVUU9Qm414uY2Iqz?=
 =?us-ascii?Q?t8k9vAt2lpX2J/J4//WGkdZ+vrMXaGTrntrIPJiALSf4mrFszPfwft3ybOim?=
 =?us-ascii?Q?kVToFsOb63K3gbUA8GdH67Ngp22drbSpgM6fMQ5Xoz/8/JlTqL8IA6h4aBYe?=
 =?us-ascii?Q?kpTpIP2QgQCtH7pQDYpBAGYU6aOkxQw7sD5BUlhaSpJhQl91t6B+VZin63R4?=
 =?us-ascii?Q?u9iYG4PGbcq9HfuHIYlIWzF8zcCFrZBHuJNFx8m6/cy6E7kp/wFEeeJe3P3c?=
 =?us-ascii?Q?5nYBjrKkXJnXlSWVxx0OLFtvo7NVJWxCg/uV0ScCg/8gc1A1U61fLVgV4mv6?=
 =?us-ascii?Q?Z5AygKRMA/XDcTYM35nxuH62Oox1TySt/1HIzqI8nNraq6/YzVR6a2w7KFVn?=
 =?us-ascii?Q?R93+d4WQ5qvf7WmUGAPGOg56KzPbkCOCjDkW532WLwATW7dYSvdCYrRw20Do?=
 =?us-ascii?Q?MF/Q1GPvJ05h5CkN1C7y5vbVaHZ29/unuHADAUUmToL2VlsTAcQms0m63a4G?=
 =?us-ascii?Q?qESpqecdA0gMFXEj7sNjg93EfTbNLFb7OV6Bjefm8m/D52hrT5Rfp1IoWRqN?=
 =?us-ascii?Q?AFyuARJldP1BTAUH6N1C1nBU0AXudEUt/QMGvCQBL60aQUtIp+o0pnJPbwA3?=
 =?us-ascii?Q?eQoF4z1IDV4Ff1JQLhGP7+RQSeOW/m/dJT97rjUxurTzo0DP3arjlANv7vo1?=
 =?us-ascii?Q?pgG847LVFPc55ItIuTRu+ml1CLYXF8DC7TrC/xclAxKPY8L7yHWM3Pr7SfMn?=
 =?us-ascii?Q?bfQlCl+xEhk4fQ1XCJBKELhmWh7pJW9ZwGEd15zv6VXsm0reiU4ULmVDLqAm?=
 =?us-ascii?Q?sfTxSVsBngxkdktv6VMnk8trgcQov4d6ZtcBEj57hp4eES9PNFRFP9exUQb1?=
 =?us-ascii?Q?IYls1dvMmnNx8Z7uDK7CNKypIXDLfk0Bj14JHVCAcg7n5/L1NXoaPaI4f0Mf?=
 =?us-ascii?Q?aH4HdoeNBZynNqiOK90JFyP8pXN+CEOrocpFERp2EJg7Hwhc13MKFrUnVnZi?=
 =?us-ascii?Q?+UsPGlvhhMDB8m2eAJl6csEbJivaXLbplclR3/tU5k40NZdWFD9rFUePRzb7?=
 =?us-ascii?Q?kIL/6wNGH89ufGiyhMRTLEET1FwEUYeIqr3mOyHeoiWDOLefH8493h4FMQn2?=
 =?us-ascii?Q?+MWcdXSKUrfgFkXQ5s9y+ynFwo7gW3NhIDkXxkTUSfJGdMRZdpqnMu9+iucY?=
 =?us-ascii?Q?I2LPy+qmfL9mpuGQbN22BwOzcs+IZJOKb7Jd65Qc9Z7YKQQDYF8MXO30oUqQ?=
 =?us-ascii?Q?X1O0CGRl0xBCOBtbfvIkW0RPm4VVPu4RKBSylCkjQFgG/sFnMgTuDKQfg8ox?=
 =?us-ascii?Q?jG4FcZK8tRX2FLljBmdHoMCahZHVma0I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z7sWi4hVrVkRi6Nkx6KppJ20ZPGAU96zxbu/dSFZFoNVUYmDr/srRIM6pFzb?=
 =?us-ascii?Q?45/05nAryDVMZ1lrz7FbNNBnGuTF4Sk9Z8dO7f52DZPk2bdPVUppU6YKUMBl?=
 =?us-ascii?Q?NpZxep6He0GZ0baOuhChxR/hEzzo/FxqIjvlGxIVSIRseVOQSf6an7HJvrUm?=
 =?us-ascii?Q?srEwxVni1naZmXF4olV+H34/7HH1MeSORBfzjHzsdUe2xE9dzG43BHuKidoX?=
 =?us-ascii?Q?I99juewSbPdaQV6men8V/QwFli4mQJTS15HSJM+ykHDhkM+aURduoNvSjiuz?=
 =?us-ascii?Q?oNVqP/ojvx0EsNlLvi+jEkopVjwCSvEGAUIatdTsYp2mC2QtZmkEDYGSBqXU?=
 =?us-ascii?Q?GwTna5zeIg1OORfrLqEZNMU2ImClXhv0l5N8D0Z0hjhUYh4lerxaAEtQy9/c?=
 =?us-ascii?Q?E70mnUSPKC2pVfw3mRyrxb1pWT9RDhm396Sr11TW4NUGQw7Qz99YDgdwzVeD?=
 =?us-ascii?Q?/oh21yv96WpZuuYyPMsDfI2sqgckN8tCABj6kxVJTZ8XoWJ/EwiUgSRChnG0?=
 =?us-ascii?Q?L8TXG5A19ZtvmuaowmhpwUyPYyYYudfLtKu2Soi7FFo1MQ3ipitqWt+bUnKO?=
 =?us-ascii?Q?ixansBS4RuHZiSiFGWEsjNIMR/9Vi8iouVL3pljKWgxz0+CBD5/YDQfHzQR9?=
 =?us-ascii?Q?eM6YGWKfpPQPaJrJyyxwD0GFll2xrpGpySe6ohseNbE2TvhcrRMJFWL5dpMG?=
 =?us-ascii?Q?GmuQmBZRYOvvsEIn3Z6uLrYmR6KWej2o/E8Tvx6NcM7AAD7ubCCCzgqLHF3w?=
 =?us-ascii?Q?CzR4YeaF7U4x0qo2b+8SyCtSU35irzCsxiwZDTzaZ5J3g+/qpR9zpDaUea7V?=
 =?us-ascii?Q?g4oX2+HOEOtmma44FPUUOOXEK1ALUX6cPxU+Tk3MTfluhL8CWs3TtUWj6EIv?=
 =?us-ascii?Q?5oxph6TbXYINv6mEJ1OYZ7AT0IQ+l18QlFG7BUBjGxrRVwYBNpCHQqw/bIOc?=
 =?us-ascii?Q?pHLoTqHN9lno6AkkRNHucvrVG0OkQX2T6qPBN804lGuVh1RDVMuYO1ZufGxd?=
 =?us-ascii?Q?dn6gijnDkBfSHq7u/NYVC1FqmS3bHN4zUls94v2kfgeqrsLn7qRSLlYzR3g3?=
 =?us-ascii?Q?J3ZntRBm6WVOD1RNJJXk75zEGth3HnVChi+V7DMePom5WIJ9YnaBaucwV5uv?=
 =?us-ascii?Q?xogIX4duLe4clTDvCwOmEiKJfjBQkpUpFGtA1YOuaLnjtchZ1H27ow8GKyj/?=
 =?us-ascii?Q?ySeSqwZ7ekBcAjLUDr9FhPmTWTqtosS7EbuqZYoViKlcBcmw+lfQmXkCRKXI?=
 =?us-ascii?Q?oX3jxNvEzLfVUaQuTkwF7vz7XlBP2yi/XIY0RMxt7PTaAsrRXc7vDuSgSLZi?=
 =?us-ascii?Q?wloYGlqwRYo9My1t1b8E2Lg409iHeQC88D0d5RwxJQMycoRzheL3s0H10g6r?=
 =?us-ascii?Q?Q/bVwqEeHTz7plfnJlIX1v83dHYhQyrOrfjPjsoUNSIyyMB5Gg1F86FTJY4/?=
 =?us-ascii?Q?XpriTATrjOSzwWWjpbuvwLhhS1Rl9vpb3vDJhcEAnDCPV4Q4+qn41NeTJ99b?=
 =?us-ascii?Q?AXZouf3yVHfFnSUdr56/qop63Nc2mYD2Im3WFiRgKCRE6flo8PnjM3oD7bUL?=
 =?us-ascii?Q?WPF6VZ/oGsaA8HL941J5GPd3VozwJEuM8UtM8qNzMt3Q5Gb+gWZ7mcHybsDC?=
 =?us-ascii?Q?TNjaQQmfY/7wPu4jZc02PTE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664a7307-72e9-4169-9a48-08dd529045da
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:56:16.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Do5bG9Wg3rPdsJxYU4Je0HU7X4b2XRwqpFP1pX4a9OL0fTAKMBpKptN8D4Lbm2Oqy9bs+LMfmNI1M6iixfeAWIZHO7omFH2F23JXdOwTH6wia/so8fC+IUUEW3/NTfp8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
SoC.

The CSI-2 block on the RZ/G3E SoC is identical to one found on the
RZ/V2H(P) SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../devicetree/bindings/media/renesas,rzg2l-csi2.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 1d7784e8af16..9b7ed86ef14b 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -24,6 +24,9 @@ properties:
               - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
               - renesas,r9a07g054-csi2 # RZ/V2L
           - const: renesas,rzg2l-csi2
+      - items:
+          - const: renesas,r9a09g047-csi2 # RZ/G3E
+          - const: renesas,r9a09g057-csi2
       - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
-- 
2.34.1


