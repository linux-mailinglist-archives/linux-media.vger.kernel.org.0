Return-Path: <linux-media+bounces-16998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DAC9623D8
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 11:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65C211C23F27
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 09:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3D3166F20;
	Wed, 28 Aug 2024 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Ww+tBh9g"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2051.outbound.protection.outlook.com [40.107.117.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B061547F2;
	Wed, 28 Aug 2024 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724838360; cv=fail; b=rBPFfLipRsCe5HxxMHNamXMHMzY6hlA88u6rEZPbzNG1m7D1VImFk9Pm+qoEs88umd+eijYxQ/9lSufbbrI/AoMRkXWiLaAW7O4uqHtbHSMKFdNS3xbByIBp+c8xaDe+HgeMV6JK226FlyAs3EZQUuLAWBib4Kvu+QkRyNXczu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724838360; c=relaxed/simple;
	bh=bQhrglxTpem7hCN0+VX7K6d4B5muSyplqkbwZZLJhiU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Phd7oQ++7axIIKWclgt1QSIAQ+rsjt11zCiX2ZMwUiR26v/pF2knbvhiE/HUQzaEJ8uMTTyIhLWrq7AnJQ7bD7tlTjIDrjObIZcsYyavuSZYdiZanqe4T5SHS3iiFaKqDrI4lODtRNbhpsxn+1JudVVBWYT5BOjl2ZLBP+V8i1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Ww+tBh9g; arc=fail smtp.client-ip=40.107.117.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtxTx4xMQZrD+WJ8K6r2e5KREGusXetaCWR7pefPQt5V41PQ9lpGd9aBOb21LGiLB3HcLKEcTzHwAW3Q+CJb/Ewu+4EAKTrKgXkLbesSaSwFSwSQtC2H/y5K8IRwO2gb57Hv3Q2OOcNKbv8DtX9SP3xjhEivKjSAiNNri96IrSfbOoLveimUa46zWptHQx9zJ1KO4y+ik1GOIxyprymBJJEG81CoJiRHuOER8QQoA/gYaREbJnsRFwQ46Dcl578OgDfFJffmpauUxyBCSCIBCdCzA9hD0Ze7/c4I6l091057Ve9lAFiGVEbgrgKAbELQVhick6uHa8qXXHFUkjYfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLk4+KvKVSuPonLOpI/p/NPIN6mz9G4n8Qh4GJf3DDI=;
 b=E1KjoIt160sqTF4qO3CcdFk1mR/zSSGqd3OVXqEw0fQ+nM/9TthIuFv13z9V+yCH5pfMPR59IKOLF8Y2CaGpE0yeEc80DRQvFIKM8AN2EKT0/yDInD+IZoS1zxa+PR46ZBV9HSRj+sq6W1VRaIgShhUa59ahgDjBntDJuSeXQXFRlApOrlGuTpiO+APHszE5xOd0CkMqcehBlLtN4btS99AkYyZblmuVkhFzND5l1tySxaqEilIfwEZxH9Z5kbmV4NkMa29tboulr7iftn/XFxPX1kCuDSu9JzhsGJyGs9XkBdiPJf5u5Sd3cjIKhwPkAY4uxnAv/cgofpEpqsagLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLk4+KvKVSuPonLOpI/p/NPIN6mz9G4n8Qh4GJf3DDI=;
 b=Ww+tBh9glJgY0BM8i7pj31cle0lLH07uIM2laIMArT+X4tzPSaTu+GGmx9gR2JWCgYjGE0KCtV+3JqGsRj7ONN/0dZnETEADcJZQOvKhEH612anZXEpHIoiw54L3hSnqgLnTltseRpz6PxTgrAf2RaowI0Yqr6qYvoYLDzJssvrn9pq1C2HNnqddNTnVqSRBY4QRln24/Vjp9X/Y1psAfVpp8nBTvVBfbsY7hqHx8dROZxxoi93PMTh7wQXbSQ7OvixUJVYxz6JFcotvZPRioGfXl8POALDRzBFCcSp2zvPREqeelQb2CRvmkbfKEy0E36Z8yN84lG2qgeWF7qHJUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by SEYPR06MB6010.apcprd06.prod.outlook.com (2603:1096:101:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Wed, 28 Aug
 2024 09:45:54 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 09:45:53 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: rashanmu@gmail.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] i2c: max2175: Simplify with dev_err_probe()
Date: Wed, 28 Aug 2024 17:45:21 +0800
Message-Id: <20240828094521.978220-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0096.apcprd02.prod.outlook.com
 (2603:1096:4:90::36) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|SEYPR06MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be6fcaa-3e44-4383-41e8-08dcc74634ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cqwxcLS+KcULI31LvtvlwKjMBISmWxKd/5vo9ArdAQUtqxyQWBT3QHHG+/Au?=
 =?us-ascii?Q?TIJ92D18KomoR/2EwkJ6N2Ficggg8TeL5BU6aKCaRbeuj5OZ4mYpbi03Hfsz?=
 =?us-ascii?Q?VIRZIl2JZJDTYTEtnNMYfSzmFZfZxRrYH9AcZJ+ffC4dpoNzxsriYB5bv4lA?=
 =?us-ascii?Q?8P4wBGO8hyDLrzS30w4BcwPN83AwrO4muvYR8fGsmndfuKqaXSJF2b4JbicF?=
 =?us-ascii?Q?J09qc8w8jwqwr/ev/ndXvSEVXAOc51t+lAdTrLfJlSAX7ueYqUZQCyMDVJuE?=
 =?us-ascii?Q?Gas51YT3LYzqmuajK7hFb3BzadiECd14KY8Tw6jQzQICWvPFC4oAhw7b2NA+?=
 =?us-ascii?Q?DVak7YWzVPl95gTJMZ1SkMUCbKPtWl4Qi/lcN8XPvd+fk0Gwo8VqSb2GhfuQ?=
 =?us-ascii?Q?BlC8+VSgy0s5gGRoI3MEsgMs/TgFziznAEoItYYgSExTvR+V35ja1LENbBwy?=
 =?us-ascii?Q?A3j29+vvhBPYk9+lmwK8vk9wdxwRijM+DfaMMft7JJO6SrAejX8117XHrLok?=
 =?us-ascii?Q?SfCZdOAw9GyAboqoiGtanpkoXkTi9fUZuxul83y447za7+S1J+M5Gz2V0qEq?=
 =?us-ascii?Q?rbU3Nbei6abnuRaxSFsrTeDZwqJnpU8itJY3Ukyuj7EQXH9wOlFVwaPFyR3M?=
 =?us-ascii?Q?jfDtn4hQWnucDeLa+AgG3HNjjnp3K8vS2ZXVxFOPgkSH/3TihzG1jdIAk9lA?=
 =?us-ascii?Q?0X+sVFAyn6GaRKpYhGTbdZGBx5GViEAvwPt9WRbWwfJgrSSpf9FRreG8V298?=
 =?us-ascii?Q?QfjfrFbKkkG4kfLtb0QYw7K3m7b5rDiGyO13k+MTvLCr0e/Qh78hV5ft4/IF?=
 =?us-ascii?Q?Y5rNPtm8LsbqHs6pE2rJm4ZvQXYqNKAvwZwTmReX1aD/oc2udht+E2OnqgU9?=
 =?us-ascii?Q?g7aXEY0H+cPeGWW7Z1UlecgX7oP/AAwaZEtQMpIUKXlE4nxWQ54DJ4dMCx8c?=
 =?us-ascii?Q?aSV6zxTBSAuqlkI8Hy0ynZWNO+Kbgghm8URkTiASysUVm1bfrO2k4Z/3rKzj?=
 =?us-ascii?Q?rSvn9FUNdq6ZK5/WRlkOSzLWikCG2m3vweGxbEZWXIWpuhVFkhd2c68y8dd9?=
 =?us-ascii?Q?2b0O/Fcbyko62j6OB5qxdtUfcJUUs9rrbMqF7OTv0DQQ60Z47C8haD7r6tlI?=
 =?us-ascii?Q?jt2iwxZeAkw7h9eq0oK6XCoPBCP3xgNRGBCh4ZHikMFyo55192xUzZ+xqEs3?=
 =?us-ascii?Q?sMq/wCReT6dP8OpUp9WMBvrs8rSPfqYED3to46J8eIWqd1+VRB1PHbGnklnI?=
 =?us-ascii?Q?ROPzAEykU2sjEiMve5IzNdB3hGSqYJTVokdx+EkzA2Vl6Q0CapNQ+n5s7nAi?=
 =?us-ascii?Q?vn28LmFVfCzQ1/CuJtbeXwQJVABXlvNiIKp7VahB3pG9cAISUdhNrcup/E6y?=
 =?us-ascii?Q?hIqZ6XrBvvqtDNeecZ0fDiLlQEoZ3hMeOlrZhhn3hue4q4OG8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1z1X/MjjhNE1r4x88atQQII31174D+k+VBvSujylZK3WwzQ7t5kvuVwGEwDG?=
 =?us-ascii?Q?5K+5WL1pcVMlx9w5k3uuJ+9m7WSYbMzxvsI8aewx59jrP+m25ZEcYfi12Pus?=
 =?us-ascii?Q?ggmZVzUp9QPPR+RtT1VL7JPjwiMvdVm0C0HOIvDDjPuYcMwLgN+cxkbL+v2r?=
 =?us-ascii?Q?zKTARWS5/Y9TawVTTdY0inrFWWexO6utTbsDHE0NFKI12cKbj0rDaWIMQ1jh?=
 =?us-ascii?Q?PunWnugDTj05HixyQ5KPciyzilFTsJStW13ZkRXCzvEbQcrZbH+PI1tXyWjW?=
 =?us-ascii?Q?uuS/3C+UACrH1Fk5qnjFJTAhh7jvUeUPPWXDX2zisFhSlYCCSLgBbjv8U3re?=
 =?us-ascii?Q?w+6XHs1azoimvESb6vVcWBoMv9wfPXU83hAvpk0ITo+IgDrnz8SSptPOG+0o?=
 =?us-ascii?Q?31pjMknT6djQ5RcT2vTdZCcWwIYz6WOsM/eSn4MnaC/wA1bBfedjK7GXCgWf?=
 =?us-ascii?Q?tZx+4VYI51l8Ds3O3IgKs6TG8p0RCZp1/7ioNrQn53qiBIjrYATzmDqFDY9n?=
 =?us-ascii?Q?FkqZ0MdCFGhDVOKBuZUgELfELjswktP7cEe4yYTbmSVqUMvsKMAOZvuaMrG2?=
 =?us-ascii?Q?N3w4cfW39GNsiwkx0Nme16WQaRgtTlD/Bi2adw7gNF4cyZ+v1XLlBVYY/f3n?=
 =?us-ascii?Q?vtYZh2UrZCacJ3PscQymvvCUFgQ9/e8HvztUqjsid7/ICCcCRqwY3YQdwO4Q?=
 =?us-ascii?Q?27f1ER8t/HZwcBBiJvFNGFf10NRTkISrbPji6Ywuz3i76KpmyRdBVo8gaZbp?=
 =?us-ascii?Q?cOoBKupEjUUmIz8Yl48eut2vSXeqXE43pedl3Yf03YljGF0yI8u5P8Dbta6L?=
 =?us-ascii?Q?XBj0jLTZBLbQLVyJtVMKhyAEjLwAOdiRJ5QCWYx4r7eO1qttvzGIina3eR/Q?=
 =?us-ascii?Q?H8EoDuCj2Z0FTWck4wzCFW3H0CLu7fRY6ey3p1P+z/9VrTKiIeYwDNnPyTQs?=
 =?us-ascii?Q?ZdEvL5bAV1ynPQ8fuGwC0V0gc71otLPjPrEsKr5/OYt9qv1sNi7BGg8gz5IS?=
 =?us-ascii?Q?SLXS8X1pEa8BnqgjNystngwXyM/O110RbTQ6uZKZziSoeHCRpNqr2SRFlHZ9?=
 =?us-ascii?Q?b/CDEW542f5jwatjIJeVNHm5LI/DdMMtCyw9noFqLpW/h071cYEyBmJQRzpS?=
 =?us-ascii?Q?vWz8Nadpl9S5B7b5SYMZrrqbVompTc9vcBqxCtEpRivJsnTy3ubIpFCxZb6I?=
 =?us-ascii?Q?v5O97oOGW3Ep072soDx1txs51oVIXgVE0WjJNcc/kcqJ0yRtH4LBMvaPgx6f?=
 =?us-ascii?Q?U+fbhURJL9e4VcD/NpbXLztdrXfIguf7vXy3Rn7URk+QBuuDBBQ+Zp3CpbqR?=
 =?us-ascii?Q?FTP9gHYwJ/y9IHYqQ3HLLlpgsYzCI4TXZVnqw7OrFRES6jsVuh3KWkCvxE7y?=
 =?us-ascii?Q?GLYg9P3ZdYWczUOkJMN1dydevji5gFOvIkfMW0+lhCNOTOtFpIUulHux7hIx?=
 =?us-ascii?Q?9Bku4WD1uPUDunOM1XB2e2PAcUnR/QOQmJUeE3dVDUZB4zfrOy8Ka+gn00rm?=
 =?us-ascii?Q?/rE/MvPsGPyDWXvf0aSEUF9pqbb3PJ8J9gY25dJVKPxvubW9YTcl1Ew0IHlq?=
 =?us-ascii?Q?J+be8+Tb9yV174ihCUhCZjKyFYgd558dGeh+OUZC?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be6fcaa-3e44-4383-41e8-08dcc74634ff
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 09:45:53.2047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZenwP6Ld4He26Z5M2VR14n1INlFPuBVQFIa4u5HMqtR0I0PF/P1MB7mM+dS/iQp0ZRVqFzpIcLWB1QtZRX2vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6010

Switch to use dev_err_probe() to simplify the error path and
unify a message template.

Using this helper is totally fine even if err is known to never 
be -EPROBE_DEFER.

The benefit compared to a normal dev_err() is the standardized format
of the error code, it being emitted symbolically and the fact that
the error code is returned which allows more compact error paths.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/media/i2c/max2175.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
index bf02ca23a284..700a70a6cee3 100644
--- a/drivers/media/i2c/max2175.c
+++ b/drivers/media/i2c/max2175.c
@@ -1299,9 +1299,8 @@ static int max2175_probe(struct i2c_client *client)
 		ret = max2175_refout_load_to_bits(client, refout_load,
 						  &refout_bits);
 		if (ret) {
-			dev_err(&client->dev, "invalid refout_load %u\n",
-				refout_load);
-			return -EINVAL;
+			return dev_err_probe(&client->dev, -EINVAL,
+					"invalid refout_load %u\n", refout_load);
 		}
 	}
 
-- 
2.34.1


