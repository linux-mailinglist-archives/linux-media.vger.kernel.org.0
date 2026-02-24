Return-Path: <linux-media+bounces-53289-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFStLWGOnWkXQgQAu9opvQ
	(envelope-from <linux-media+bounces-53289-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 12:41:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE51186716
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 12:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 474FF30A222A
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 11:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF8D37FF48;
	Tue, 24 Feb 2026 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="srgn+bCo"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB9B37AA72;
	Tue, 24 Feb 2026 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933193; cv=fail; b=VaHE388FyddUzFHuadlyG8taFRwELnBgCX2lTh2p3G2AH0wMc4C+T/B84oRJhIEjnQFQWacapQJH+UTTA0qAPImSorjcoBwbbzdfARJ48SNsMc1Q3kyTjM4OpguCMjpvxu5jp0nj8Qw8EDNSZMw3IUckow9sWIH25a7u2Bd+wzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933193; c=relaxed/simple;
	bh=EVp3J01remHjx3rjmDxtAbIr6Mba18CJEdB/7T00DIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=haaTWzoNUbLe/8CliFw6hLPvJfi1Ya6YdWdOLs2iprDJXgP9L1vHD6QsxZ3KobTopI4Uysd4gK/1sNJ4L/q170U4Vd+VmGA3kCcriEgEn0IgvN2qkN/xLphDuNkT0YsdaG96DBKPhefiEZ3CwNCuOADLtH0u3ZZPCFMLotjLj3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=srgn+bCo; arc=fail smtp.client-ip=52.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQnZij41uqCopNMSZQUJCyKQcpjiQzkg03rdMbRKSWdeWYKRVwgqSoqYxHcubl2H/7s84AXVTrVNRX/SCvVHgb9LJxtu/vw5EocIb0B7KwBbtpfD7w4gycdIM16IUsYNG6udU99EiNAX1FU7pLFDgYb+EaGr2eIEt38Ye5vFyC9tmHO/iGath1KtSbRqdtzDh9f+CKh8f/h7Q6+/Hjzz6vqdaRwI2/BdtaJzsIQyh69z/Q2pHp1UZE503bM/RjUyJ0c7/eM6fP6YSY1cmgyvy0SytnyF0OwlKCrURMzB6RjwOZJAtrBjnTiYb4Tk/3LVGTyCMRMDtnz1O6qsng0F8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfkN/cv6wUXD2j6nyBsIhlLF69Kfh2nfo1q6mjkhdlA=;
 b=vq7+WGvaLI1knrVuNcVP+869mXcgGPshaX6LW3Xue2KYriYWGHgeFGwXMzcYbU9DqOYPNrxsNdMDmI53jiEkvUyuz422JbX2Hx6LhT4n7VTEyHWa4H9DOHoyMzKBftnkJx1wa8r/rdTaL6dI4NVYn0Wva3sgZ6Ht4kP5SnipCrxTmT0LIyDaPXiKDBRFRkBLX3Y3c47+VzvcURk4N6XW+9j0P3dAjGKP0tBzNAjLVBWk/bhLPr+Jp//PksBT8jQCP8+hO3B+UUNQyPcUzUkEUu6bfR7uUVxBw++hSDaKjkmvbuD3ttq7R8fPb2XjFsTIatc/ly7V+4wEGXJvW4BL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfkN/cv6wUXD2j6nyBsIhlLF69Kfh2nfo1q6mjkhdlA=;
 b=srgn+bCoJWuhJerQzzPIOZv48cDzQHfQzpqA3Szk78plCx/r7nZffM+cSUsvKLMeKQZp1sfLKujvNxt+RbviWUL6CuhXA5Fbo5VzkugAc3KVCwYmDsHPWgD9SKYAZquuQy0sAW82VX7inCSzJBM3wX1+KReqRbND+DjK0eaOyac=
Received: from SN6PR08CA0001.namprd08.prod.outlook.com (2603:10b6:805:66::14)
 by SJ0PR10MB4720.namprd10.prod.outlook.com (2603:10b6:a03:2d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 11:39:50 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::96) by SN6PR08CA0001.outlook.office365.com
 (2603:10b6:805:66::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
 24 Feb 2026 11:39:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 11:39:49 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 05:39:49 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 05:39:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 05:39:49 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OBdaF02658018;
	Tue, 24 Feb 2026 05:39:44 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
CC: <johannes.goede@oss.qualcomm.com>, <mehdi.djait@linux.intel.com>,
	<vladimir.zapolskiy@linaro.org>, <dongcheng.yan@intel.com>,
	<sylvain.petinot@foss.st.com>, <u-kumar1@ti.com>, <jai.luthra@linux.dev>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <y-abhilashchandra@ti.com>
Subject: [PATCH V4 1/4] media: dt-bindings: ti,ds90ub960: Refactor port definitions
Date: Tue, 24 Feb 2026 17:09:21 +0530
Message-ID: <20260224113925.19983-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224113925.19983-1-y-abhilashchandra@ti.com>
References: <20260224113925.19983-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|SJ0PR10MB4720:EE_
X-MS-Office365-Filtering-Correlation-Id: 070e8047-0728-49a5-fb35-08de73996b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+ZbehOQ+sxWCtB5wLf6DXvOdU0SP1wTTowwL8wbBAXiAtu9VX5vNVND0qZqL?=
 =?us-ascii?Q?VMsvttAXY7npIxYn1/6ADMQIfkDo72gr4xeT+FQA8FLixO4Bvw27QuZeGRf1?=
 =?us-ascii?Q?rTvADrH8KwYH33OlRo+99wEZWdOEm2twTfPYGz+pHSfOa3AS48j9+SmUP26n?=
 =?us-ascii?Q?iyQ0Z3SuwHGIU33g11ly2Vi7ZWEf58yATbjmDqhh4jgITho3NThZ8mTjKYtv?=
 =?us-ascii?Q?4hfHcZiZ/9Rtn6gkNTKqCsTd6/Sgd8atWyV51ETROAalqIwWj2rxJC/bPPdX?=
 =?us-ascii?Q?wfiX/cR6WopWmDyD0IslpbNsjhmsivUyewtY05fdxqMVhkOWYQcC3GIVQBLF?=
 =?us-ascii?Q?CN8d7eA4/7A56ssqXShfJJ0yz16HzQUJMz0/G5FSWIRYczwykz5pB0a/fORb?=
 =?us-ascii?Q?MafQnPUoCRrtS6m6ORf4VPoWZukzRToGTPJcXcd/aPcGgniMZ5hLYWrYLFYu?=
 =?us-ascii?Q?aKKajrQXEaI7wf1ejZyDkwSIuqFnWBvDX7GdVsP5Nwecsx12Qwe4ekexmu0b?=
 =?us-ascii?Q?rnoJfVCLh33L3Agx1eFknuDCdAhtfK6PHCiHPZJdnUm335omIFNi8/taJUCD?=
 =?us-ascii?Q?ryOpbZS2WGdoGHpwn+HQ3OFNLbmQhWTNmVCzef5OASwx2ohrVIxyWvs0dmvC?=
 =?us-ascii?Q?XB0cBAvbCJFZcoI9/l/1c3piIOfNG4C9vSi+Irff+NVRAKA6SftNdEi0HFHd?=
 =?us-ascii?Q?B5thoRe4W9R338fDPQQL0sAPph5KdRxXFn90Ravyvyo+cTmc0lEhY7wEyHpF?=
 =?us-ascii?Q?cHiR9mY4h4WI4d7Qc6kLZgRJWBp5YyVZ0t4YAS0MIRtQLJhlDnD3v5wLdyRT?=
 =?us-ascii?Q?Xzyj8KwJNOW0gu/WOkUeEi+hYmffknW/o6bUn8/kUR5iMweMnBIyztRwO2gs?=
 =?us-ascii?Q?DajariH7+nQH0WkeWJgVBhgKtFmnK3hSCDT+/iPoGIK6Ax4exLV61as//y+p?=
 =?us-ascii?Q?tnqFE7okikeEmgaWD4SC++5rmDZ9FzNi6rHm9zEQ4obzCh3uWCbICAeSRm2g?=
 =?us-ascii?Q?GovX1EeoKHJ4g7o88t1x6zRq4gZFMydKxQX2RXujny709j4d65mVP/8k4Swt?=
 =?us-ascii?Q?MViym+ToogL1Kk2j9hCkEsqyHdY/hDE6o+xtXxbvM3IINBK6eN4zQlvp1fmo?=
 =?us-ascii?Q?Jux6yU0HQupHkCm57slt+iOtIU9xdwR5q6N0PN43Oai/8XoXGwxSDRIU2EiC?=
 =?us-ascii?Q?FzR7cYl2QwB9eBK64CaqzK42UEW6Tpj3SaJ1GwEgLXku+wSdDVGBbFfhXGkk?=
 =?us-ascii?Q?Eo/Ts9UtgUf56mVbrypWrFkI5NVYn7mDSUyNr2+MNDaFF4gtLtnc7I3Xgjbd?=
 =?us-ascii?Q?WRI7E4c+hx1bTixrwkGvRh1zS/n7B44x1c9DGBj4AfCrnkezkFOEwo/YHRP3?=
 =?us-ascii?Q?Wm3tmjrFeX+UsimNNY93Xge6KL5qI+2Fmy6Bh6qGbIRgP/3bjHVtelzpQ8SV?=
 =?us-ascii?Q?QXTdUEMf+fYxkv9R+GuSmKb6mOXYGtRVMKT2yKtO1o6vIbrs/Qvk1QK8x19V?=
 =?us-ascii?Q?V6oU9ZTQB31r6LZCXdSETMbh0QIjec+tR88xZ74f6q5s+0MJ2CT0XVgfmx1R?=
 =?us-ascii?Q?bEpIuTTwtmYU5uVeEjTpdRLOkBduF96vNimXKbt2hZ/GD0K82agc19NB5yOx?=
 =?us-ascii?Q?sGbMZYoEqJ4/kJ41BWE5geos+t8fxVeKk1OQt87IGOCVWZarLmtoc20BE533?=
 =?us-ascii?Q?n/4U1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JjhDaE6y9x20xBkvqlC+umzpwJ3qEsZfVIDjZRmzA0+6AplYbCjjXoQyBgaVaoM7CEcBphRF9P1q57/LgUFWW9vRE4niTGF3IJceckPO0ZSpnvoeWU9z7DASzH5i/PEE+l3k8YwVd5GwNBu+h2t89HeCkRicGkBySFq6aQfVmCm41ve93rX+jVGq8YumOMe+k9gG4MgIhisSnylaB3epy3UQ7zhxwLbVMfmUMbc+2bb54TKxwSYvFInCtYthIjWm9QHDZpOWtW4goYVslQkQjS1E19lHuYF+vjoM+9L1WGeGejcET0DtNCjiYGUpZHT+8jNzs/l52oMLgnR4LmAVtyRY2RukyGG0es33flRkzqx9VMT8qQShx7W3dmUg2/y6Un1XA/zyYAsB7ifYw71C56XWfx1PkpjJ74Z8kCl6RXdadN8Gkiq6gs/+qDiYaMkq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 11:39:49.8083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 070e8047-0728-49a5-fb35-08de73996b31
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4720
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,xs4all.nl,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53289-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.2:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2BE51186716
X-Rspamd-Action: no action

The current bindings duplicate the port definitions for each FPD-Link RX
and CSI-2 TX ports. This results in a large amount of repeated schema
blocks and makes it harder to extend the bindings for new devices.

Refactor the bindings by introducing shared deftinitions for FPD-Link
input ports and CSI-2 output ports. No functional change intended.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v3:
- Rebase on top of next-20260223

 .../bindings/media/i2c/ti,ds90ub960.yaml      | 120 +++++++-----------
 1 file changed, 44 insertions(+), 76 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 0539d52de422..cc61604eca37 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -125,102 +125,35 @@ properties:
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Ports represent FPD-Link inputs to the deserializer and CSI TX outputs
+      from the deserializer. The number of ports is model-dependent.
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/FPDLink-input-port'
         description: FPD-Link input 0
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-            description:
-              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
-              hsync-active and vsync-active must be defined.
-
       port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/FPDLink-input-port'
         description: FPD-Link input 1
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-            description:
-              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
-              hsync-active and vsync-active must be defined.
-
       port@2:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/FPDLink-input-port'
         description: FPD-Link input 2
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-            description:
-              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
-              hsync-active and vsync-active must be defined.
-
       port@3:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/FPDLink-input-port'
         description: FPD-Link input 3
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-            description:
-              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
-              hsync-active and vsync-active must be defined.
-
       port@4:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/CSI2-output-port'
         description: CSI-2 Output 0
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-
-            properties:
-              data-lanes:
-                minItems: 1
-                maxItems: 4
-              link-frequencies:
-                maxItems: 1
-
-            required:
-              - data-lanes
-              - link-frequencies
-
       port@5:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/CSI2-output-port'
         description: CSI-2 Output 1
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-
-            properties:
-              data-lanes:
-                minItems: 1
-                maxItems: 4
-              link-frequencies:
-                maxItems: 1
-
-            required:
-              - data-lanes
-              - link-frequencies
-
     required:
       - port@0
       - port@1
@@ -236,6 +169,41 @@ required:
   - clock-names
   - ports
 
+$defs:
+  FPDLink-input-port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: FPD-Link input
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+        description:
+          Endpoint for FPD-Link port. If the RX mode for this port is RAW,
+          hsync-active and vsync-active must be defined.
+
+  CSI2-output-port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: CSI-2 Output
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 4
+          link-frequencies:
+            maxItems: 1
+
+        required:
+          - data-lanes
+          - link-frequencies
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


