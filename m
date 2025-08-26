Return-Path: <linux-media+bounces-41088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B7DB36CD6
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 17:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 367421C410B7
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 14:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30B81CD215;
	Tue, 26 Aug 2025 14:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="qfiQbf5D"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013065.outbound.protection.outlook.com [52.101.127.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E7F17C91;
	Tue, 26 Aug 2025 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756219938; cv=fail; b=FpXtv0ha5/gYbJQ+Oen/u8DIAjDsq8ANfNfKQCBgYJ7Avl3d/pX+QiDNGksaWo/IemmMbwd8o22/s6fvAPWd1u4aNxNvftbCXGsjecEXNwfkLw0VIdsbJ+QRtXp79bAx3nuNmgl1kxi/fwQcM8OO9VrgJRU1BaZrvFO0CzItyl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756219938; c=relaxed/simple;
	bh=NmasIa2Mbi04NWL3uxNiNPvXImLj6dgTe0cVTs0WqeU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YNruAXESAxvrQTeBr1kQs1ZOr8wKAiCV7u9LiZcLifT/5BSCwl0F93gBgD929mgvhMy9t2NTpdL6cbupNJ3uijHaz2VZYuwn4SekyIhmzCklafjNn8JxIp+ayJWQ2b8XOPXMIpMb4rZMmwMeq25nMKJkhupNDG/TfNmdgZWi0iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=qfiQbf5D; arc=fail smtp.client-ip=52.101.127.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjR+EG+pjbEwDbinjWibBzBzm/AeI9LRp5HPQgT0LpZ8upOazYnbxSj9mqgfk0khF0jD6jAMQwbqcbbkzXmoN3GJyb686nDi/qhS5NidNASbhsw+w4hdZJuMkUC8a3MbYXqTGOmH7Cgarpuiceku8kJPmYRdJ233rWZUcHY7UofpMOA5hgTauAR27RuiPIXf+YovlZGBW3i4GMD9xYIuYcjSecKRtAGLAoZ6b1/ubxyCGRkaCsTiLQB942mt0rDFP+1ehe885id61myuR9hvjtpUOlLRBBRHUbauvDONdknsq37OLL6uVIC/+lY67hxlcOckzHoTSbYhPRYS3E+sAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1+xYJngaO2IiEPZjsC56f7xZziD/6wDN0pRZzAynGs=;
 b=kjMgiCMqbdQrcApb95eLTnP5WnhLW3Yrv7Rk8f0OtELdH9+h+sXwW20Cyx+ys9zMB8ja/Ll2h45tHBkZhyKWcU8JcS1QFDdTw5wbqc428JUqhrNw4vp1UpBSlxlHEYwW3sD6t9pIuoarIgKT4DruLsRVu7up4sQfWdzuxZ6jefV+oTrourBdOHARHOuCfZppxygZuJ3J0pSx1ZK0F8hk+TjHi02fCiVQpI0LW1shHQct+HMVMCWbTpxGS1zPsuZ94fogMpeSk76So1fdy+J2eBbQyL9BeRKfFzb5sk5Iz1iVN1QQgU7PsocwAPDpMtXdf5gnVY3lltMMHR60Wz2I8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1+xYJngaO2IiEPZjsC56f7xZziD/6wDN0pRZzAynGs=;
 b=qfiQbf5Db7od1Z0iJrgg+lxWYxnCHJmWgdAECerA9GzFe5MU/j4ASEiGnZ4xHl6pLbpO057wR9/z0khs/vok40xNLcKOb5BxVOpsPUIpLsGUZ6Ktsg5c2tTVbfEBXJqO2/HhjvP0C8eZyhUlu4MvX1rHlaggIlne4NBxJs2SYbS2ER9lMCJL/KKfdFmy9zpK+VdJfdqqPDFdTbGDZaBW39LHUNcYaDB0+lsEbQL2FswPPCEI9DDqtfdkx4pYFxDSAGcnrn2vDSBaLHOYljp6nIHvg9dcfFj285xvFSRqg2HTPcL28bZgm7OADtf5SEYa1/Su2VtEpBot4pBtS3L02A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB6787.apcprd06.prod.outlook.com (2603:1096:400:453::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 14:52:13 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 14:52:13 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] media: dvb-frontends: Remove redundant ternary operators
Date: Tue, 26 Aug 2025 22:51:54 +0800
Message-Id: <20250826145158.534407-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::20) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 2633b7ed-ca23-40ca-1eeb-08dde4b02433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jjedMs85XjnWd1FNfBrRtpAyMC/Nh0qhGrQVglOOVEPCG3TuwQqKOoU+5Bzr?=
 =?us-ascii?Q?98KI4BYFrNCJ8Ctn9rb6Ls/I1o7fgkWWPvYpYcM59LaOI3B/5bFKxxXcXtVL?=
 =?us-ascii?Q?D7EcC+sMkWXf+Pawa7p6gDL6JJFqLQn2RLExTx2/+HE7sjS3MgBNIvLSTD9I?=
 =?us-ascii?Q?YpKZG/li1L5+f5yqIrn0xjN/KAWpDIkc49DB39QgLDkzNOlx5Mo30oPWRyuS?=
 =?us-ascii?Q?MaP854PNCdGRrXal1ze+tG8kh1oc8PkpC39/S2vUGHCp6ju5gmLQYqlIxPQ0?=
 =?us-ascii?Q?nNCQb+FRrOHqGaWkjzFy7GK51OGBHPkTMd2/OMmBThjQw6Y47Ao8P6I3Ohhe?=
 =?us-ascii?Q?StPVpXrqdS+iXZiEOqmTG6N+eTrgle7E/CMr+sLcaTSqn+x5A8od5CrporxS?=
 =?us-ascii?Q?wcHEuVkaHa3LaXQrTVUeAcfRctu0/POwyIa74APF09S0gEBnOiIyMsfeHcBB?=
 =?us-ascii?Q?WM2d/uUHqtQeDj/FATIlU2M9FYfJg0AcZcYzPJVZHwL1c2O3Gp5EK0YtKQUm?=
 =?us-ascii?Q?FxTLFxs3E8kMF5obrggwglbFU6vxEJiRU57RROSkm4bO1Zdl5zGNJcsvx+wu?=
 =?us-ascii?Q?gmwvaDvgs1e8IVXEZ+p4YorRrcFlTv4YujihE48WgpLwqssB8E81hDyRLDVk?=
 =?us-ascii?Q?9S7ksG9ZMj6g7IvGnOnS6c4cxOeufKfv3SP9a96iBfuPUYrOUo5DG+owOmRT?=
 =?us-ascii?Q?RgirfDKn8/uGVHQ6OfT4iBQwgW54pB/ODHlS7JRUGjRuMmHwWTN9KR6qqLN8?=
 =?us-ascii?Q?gPP3hCSCjS03nwkOF/nRZiebX7U2E8wUlsXYus74Kg/hlSgwE/PCXeb0pp6M?=
 =?us-ascii?Q?0u90PHuWUj8N9Fsab72y8KWroNLUns7W9EDvz5CRLWb1JqYVmqSHPeGku9P0?=
 =?us-ascii?Q?AOTiRQjd3A0lEGv8FnvDob2ZORQXt3MfK6KX221krS3ESu3iXEfDlNcx5fBT?=
 =?us-ascii?Q?FldMzqZCRVfI4oVfksiG751K44q3ik3wQAaT5cahX88lSOG+D1D4E+vNuN3n?=
 =?us-ascii?Q?LDovrQARyZB4Rx3nQd9wR+RgMv5WciX20QFr83rW/1RqOrR/NEW+f1w5qgW9?=
 =?us-ascii?Q?OfrOPPi75eVqw/EIsA2y8Wtrtlg9jTmPxLwC3mEDyEXqd4yawfjAuPocW3tK?=
 =?us-ascii?Q?HhP/SK6/ort5JFelEwCqAdi8EKUyA140Jx9r/brlCebSfB50M9wpYRe9B6aC?=
 =?us-ascii?Q?BgeuTzcRI1Froon0txbNw3ohoxQDubGS1O2o1TSH52r6EeC8CXkfPa9AYaEA?=
 =?us-ascii?Q?ZpxOIPLFCsWE4S/0iYBRJEhP+HHwcSY571Xq0LJ3uFU9vNTdi+RTDDC80wsg?=
 =?us-ascii?Q?w8u9+oxMAYs6CZ0Rrcbv5S5xnTvDbvO4iH932TGXNC24Dx6CcoNnVFVic+aY?=
 =?us-ascii?Q?CMwzy162Rnpp74gcJlx6pqhdz0UVURd94QXfomUhl6dQYJHk1H2FfswvXSiR?=
 =?us-ascii?Q?7uXgHLZmE3FHOtOHIcRFlKYr0vhHy7NkmxDjo4rsgPoo/BMXYAYWeg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bkve++/+E+DsNGGhj3arVY8E6u/g01aSlcEg5xpHAaIbC74WhEUEN/DmL1EW?=
 =?us-ascii?Q?VnAK+N3TEOZtowU/4b1NIi/RVFyq9uV/DZLcV5LuEFTiXc50D7o3eKBaninL?=
 =?us-ascii?Q?CZoI3AnsAlAkNnnKzXUjRC0kK2/7aLIbpHTDxVosoBhEF4y3ijOKqpnySkyu?=
 =?us-ascii?Q?ZsdyQ1wdrDqE3xIR7C8D3/bQPSBMteGcsxwOF98bGrCQz2xrvjbkN38+eeBa?=
 =?us-ascii?Q?Ya8sGT8OnmDAumUo4OVNoYP9DR+8wLoMpmOt45Mh/qBCd0Gg+TB5WokyWq/J?=
 =?us-ascii?Q?3owQx4Yni/hiNcjj4ox/zMm5zDH5NRQPIOQ36kpBbB0IUcBALenVe6qb9WVI?=
 =?us-ascii?Q?yN+nugUk9u+bEIp4yFMBz1FFfFYr98Sf2kWTCmwsnYgxNIm3/rYERFJjePam?=
 =?us-ascii?Q?hBZGTpg0tp99GUSa9HIMFxtg16HYttFHbIQVW4G07HFSn+yohgZivGwktaLE?=
 =?us-ascii?Q?18P7MsLEHVYxLbxI0uThxy5ejWsHqySAAVR/mrx0MjTAO4V1h0oMnWyIx/95?=
 =?us-ascii?Q?o32385kdoqXXZGUunP1lPZJw2ncYT2nPqLr2LbsbEKZhuKxK4eskKjrnY7Dn?=
 =?us-ascii?Q?EZ9zR+V03VcXsdNMCvrQRR7+77HRtthS5UuBx8OqbfhNfQXdMEF1AH8PB40n?=
 =?us-ascii?Q?untdoI5PpQI8j9Q9y22jHAIizfm4V99LX+OmfxO+17ow6GMku9A7HcSWx5k1?=
 =?us-ascii?Q?XS3a4NFsGd5lQuHW3QkoqMgeExxpHo3xPXEl/t4LcvObLiS+cIAJSkE5AVwD?=
 =?us-ascii?Q?yfd5T4efpYZvzyNvM/do40Iv5SpOX02gnxFV1aQwNG+RhhXR8yZ3aiaspVFG?=
 =?us-ascii?Q?lnwjgRHLvDyEIQhUywN5gHWCGK9yhhLORHX1ExOfE3oFTKOUfdqT5EfjsnBx?=
 =?us-ascii?Q?5hnAbhfQk2oI9xigeNZN3nkw/jx93vYxq/IlZadVfxdDj1N4q3iAt40DlzjV?=
 =?us-ascii?Q?da6KUK0CCs0ty0Te68LOk0f37XgxDuZ9LcxssK55qy8mIcrRmsfzeZ07i9BY?=
 =?us-ascii?Q?DwN7DqVuEGb/KYYHdddogTMYMpDAQDnmxwgu/+BaW3Fk7s+DFxt86mRDlCBp?=
 =?us-ascii?Q?UXN/mPjGvWuhs/uAvNq/9rWfm87BdE5S7Ckf/+X1L88lspi3YzQMmvufBGw0?=
 =?us-ascii?Q?FJndyfLLfQP2q3HNxnrE2n0ECBH2bAhBMLEv2sqqdxEwUlYvPmbHlToyA4XF?=
 =?us-ascii?Q?kUd8lyahwfURmtKljn64gvR3MluUgYMXcJ/l/Fct+bTS7e3sgNpLLO4eHISI?=
 =?us-ascii?Q?TNPHJue+cte/0XT3ujACJSFL6xVZWEx0aaumaEx5ayS+VN5L17hwsEst11T/?=
 =?us-ascii?Q?SmJ2oJVNqfy0QeQuH8eG+wuaboc+Hfw44WMTOMaBRwCoVjeQZEuyJNI0d8cN?=
 =?us-ascii?Q?2S6GIc5L8mOj0U53J8Ctkt/iJV93V45ohrMoQRGR7iOL7aWpvoUiWer8SXvo?=
 =?us-ascii?Q?II+V7rpCgYwo8rZMTv3UJLSlH6Qsy4eHcOq/GzNKZ3W7E8mxbdZNy6CkCcvg?=
 =?us-ascii?Q?jHAdyALGwI3RjtS2MP22ExJh/54noCAT+1LXKSwYk+xqImuvjENG6YgzznMZ?=
 =?us-ascii?Q?IWH79EA+hW/N+ghNX8BQLfGFnzLF2o9jrhPLOCW1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2633b7ed-ca23-40ca-1eeb-08dde4b02433
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 14:52:13.0922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrY2fhQ+iXgoG58WhmcNBnkrMI6Y3cqt4cZ9GEq8prif9kcqZk/4HMhiSp2ZwwPJVpuwXtShqVEBAX9vzsEN6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6787

For ternary operators in the form of a ? true : false, if a itself returns
a boolean result, the ternary operator can be omitted. Remove redundant
ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 2 +-
 drivers/media/dvb-frontends/drxk_hard.c     | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 779cce93e94a..dae2540a6d00 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -1270,7 +1270,7 @@ static const u16 nicam_presc_table_val[43] = {
    TODO: check ignoring single/multimaster is ok for AUD access ?
 */
 
-#define DRXJ_ISAUDWRITE(addr) (((((addr)>>16)&1) == 1) ? true : false)
+#define DRXJ_ISAUDWRITE(addr) ((((addr)>>16)&1) == 1)
 #define DRXJ_DAP_AUDTRIF_TIMEOUT 80	/* millisec */
 /*============================================================================*/
 
diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 87f3d4f0eb8c..9ef367918824 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -6324,8 +6324,7 @@ static int drxk_set_parameters(struct dvb_frontend *fe)
 		case SYS_DVBC_ANNEX_C:
 			if (!state->m_has_dvbc)
 				return -EINVAL;
-			state->m_itut_annex_c = (delsys == SYS_DVBC_ANNEX_C) ?
-						true : false;
+			state->m_itut_annex_c = delsys == SYS_DVBC_ANNEX_C;
 			if (state->m_itut_annex_c)
 				setoperation_mode(state, OM_QAM_ITU_C);
 			else
-- 
2.34.1


