Return-Path: <linux-media+bounces-9815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B891A8ABC1D
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 17:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CCACB20FE9
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 15:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA4526291;
	Sat, 20 Apr 2024 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="nuN43EAr"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2109.outbound.protection.outlook.com [40.92.22.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101121CAA9
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.22.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713625284; cv=fail; b=CGi4sNKmfXL+VCoU2gqE9IKv3pdSUr0cmWn4sFiATvauUI/iD91geCkZLIaOBZ1iKU5gTOQZryIUe61n3sAM4+GR6TtZ9U/CWlCxNzwZBPkBUPIxpLiA1YUs3PTh0j75mRW05XqQYDMjtUpLnZdOwUFmOOiPQMNRnpVTr1zODzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713625284; c=relaxed/simple;
	bh=8DFp5XK8JSF7xwUkEq1A4igD6SgHUkKf4erQvmPCsMI=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NSapU6gcy8DcvIGZxtr/6c4MLjmVAnn9cvF0WdhzFs1ABCYuAhAq2fnpzyPuWg1WIKiHwukSrtzKgATmv+bG/Jwbqtbrd56iJN1YDhPvwsNMQoEhc0yzOG3AyD+c1vmAILgd1JVG7uaFozy+ZODYvpeLWTZwFlQLjTSt6rCbBrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nuN43EAr; arc=fail smtp.client-ip=40.92.22.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHsJ9fcTwz0WYCnW1el6IbtKWuCILugJRAYGkrn8Bh/Iagh+6g/W1uakaeSMd29q6FGrddh7Y4Wx9+zNWcAWYQe4n7l3Ps1T73xg1os0cjQ2ihyAzOLKSrh3Oh3BqF6v1z7sv4QHEGPKHodNK+Rgp4onBvlz2Ehc3Mf5OH/R8zz82GvsKorfjQRKusCXJiAoFLJFboQqSAZVjTPAJSeL43N8uiSsfK7Jud8gk785vFFJaelvw409500HdX1yuuMjWzRRW3htwyuOJiM9QciJBqyXCglKLYxQ/KD4ckp9pd5oCmyL/4Yd+z+M7V9TyGy7/RtaCTe9EJCk8sJfVb0m5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9EjrRLez0f2zW0cmEJpG3J6kT9g3n/Mcw1nSR/XSXQ=;
 b=S1Z4pcNsZfIKoelmkIjgaTmh8NHnmKwIDzDcJ9yI2GvWsT398C7elA4jcd/3nA3y12SDu/IaHM+XhKLbEXqD/SUKRS935QCcBQ897dEjfJOysqQNqGi5DfZBGVqctLanS1TtydGPs69A6RQ2tpBx8TOR5LF7v5mck7jxJzp2Z313SZAlrCEitW4S8bEihoY5o1/tpllE7DaVloWsEfhZaU62CxTQN0ZjNXr6pe/0ubOcknw9qawHsloIYUQtNE3HXBVpRDWwIIoIgyOBVCe+2Cj/IDPYutJRPAjdPGmgpPE/MS3zUIn7LXDWd4yNFHg2xIFMra/qsZXRwDa/fA+zwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9EjrRLez0f2zW0cmEJpG3J6kT9g3n/Mcw1nSR/XSXQ=;
 b=nuN43EAr2uMqHHHufWV1IbYjSUhVLs6Ini9PS1VJX6zvZr5HMXrU8oZ9NUa7Q9FGqrGOsa14zwJnkPCIMjrudu/tHoumzWSF7Skbe2fTmWq/eNcZJy4XC+i88Pg9CF9mU1kVCjENjQr8bngwliNWFu5OzboE1peG2zhsPyITEPhRHB1It3+5LBsQxX9Q3hfvN3dYrKwEutX8K3bgkpS+XIqj8S4lZIro2U65M9njg1Q6rMajjyHvyOUfQ9d9ueUtdavfcaG0okLIR4v2aXPJg7cDPugsOM14ekjCP2+F9/NyqFaMOxgnwEi6hkamHNtRvv+ZBF7GW/cM54NMyQvwqw==
Received: from BL3PR19MB6514.namprd19.prod.outlook.com (2603:10b6:208:3b9::10)
 by DS7PR19MB5735.namprd19.prod.outlook.com (2603:10b6:8:76::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.52; Sat, 20 Apr
 2024 15:01:16 +0000
Received: from BL3PR19MB6514.namprd19.prod.outlook.com
 ([fe80::707b:75e3:8c68:45f8]) by BL3PR19MB6514.namprd19.prod.outlook.com
 ([fe80::707b:75e3:8c68:45f8%6]) with mapi id 15.20.7472.037; Sat, 20 Apr 2024
 15:01:16 +0000
Date: Sat, 20 Apr 2024 17:01:14 +0200
From: vricosti <vricosti@outlook.com>
To: linux-media@vger.kernel.org
Cc: sean@mess.org
Subject: [PATCH] keytable: fix stdout/stderr inconsistency
Message-ID:
 <BL3PR19MB65145B42CD9A31304D6DF5CED30C2@BL3PR19MB6514.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TMN: [UKF/+PHr0QtQRiVeZXgWzud8qUSNT1CkrCCsB+oAlhClTH/tFwYZZwePq9Et8Mwl]
X-ClientProxiedBy: PR3P251CA0020.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::32) To BL3PR19MB6514.namprd19.prod.outlook.com
 (2603:10b6:208:3b9::10)
X-Microsoft-Original-Message-ID:
 <20240420150114.nm64kda74yyzhld7@bifrost-Z490-VISION-D>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR19MB6514:EE_|DS7PR19MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0bb5e5-a985-458c-aaf1-08dc614aba84
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F5m+u6LAfIn1AxrGswjsOy1Cs6k781dmjQp39HyXo4VBulqZ3cH6JHgjrMF1P2P3Sv73b/qnqXsiBoCrKNhhRGT+2n4TkQ1F3iebm3/bmU8quyx+TkXiuXDHt7ldDzRxLntB6KPo4bGMN6VHDMu3bXiYvmiJ0WcOezjLlw/ChDLKx1oKGDphjepx+LnG35UgR5LgWMva0DQbEYGFW8vSnIC3UDdcJKISD0mGmYr+Vwh2DgA+BpW2ZWTicxDnZVGPmK+a+KnsQ2fBUPCqJ9Gm5RJl0qysU7XYEYHBpz4EZ0PHqxHdzEZDB1pze+ExDZupyP+Z9o7D6pJg5IaE6D2tCYaHoocQa9PoS+kx7P0EXaEY/rR7tq3i8XOo7AXecDdFPR9Xcb7axB1B7p1/mDrNSN0shUwD8E8oXztpI2Ru93yUpcBMFRSmPkXeM1giH9XRhNzI8s/KgWmtLFHAO+MpZWS3iyu1wHs5Emwg8HPOnVLe2g9CxzyhrkBMVZH6vsqwCzcjskH1FlzXB0/ar40rPy0v4Xi6sE/FpDX2rqmuX68nCjDhjEuHZqv+znPpWBHC
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R4wDZ/km/cJiOG3Td81Tl0L2+LrtRW0DBMkmOMkGd4Jb1VTyFegWW2B+RqAK?=
 =?us-ascii?Q?jnUMWaW52+6fY77nfp3NEo8vXV33I9crTZLG6yA2VWgdFkzvfi3bSXesy8UN?=
 =?us-ascii?Q?oal8ulv0gnnrSfSdATaiq1JtoPfjJjk3EkRoFNqiuQhTt9DrKHPPfac+fRXA?=
 =?us-ascii?Q?BOp45YDVRAWPGy4fK+1oQfzE8ulCgt8Hx0gOjv8Z0es7lKAKj60JGZ6Z1/De?=
 =?us-ascii?Q?REnBnY+J4rZb5vsLi5HCxqSQK5IIR+xvdSTKWdaGE7Fplv4JwOoRcwUedEXo?=
 =?us-ascii?Q?T1GRYfbUsKTvXGMtYv3GXBpPz1n0em76mCv02BhoBTat2/YytF7lehiqFCaQ?=
 =?us-ascii?Q?0iPjATSr7GZ56UeXF7O8iURwWhQHjcCXveT8G0VzIdRcFGB2p80rwfa/wF8i?=
 =?us-ascii?Q?FhhnCKTI6E+MZdpO6tv1Is/GfZKswyu8cflOqakMTiVtlDG7/LYppuz0ZC+T?=
 =?us-ascii?Q?li03pRciY/KcJc/ZmeP5LNacBpwgI4qeuHij2Z4RM7qscOjImIDRIGQ1N5E3?=
 =?us-ascii?Q?B+YVFruXzFL8fm+Y8yBnSvgsoql9UzVavDxKdV5YutzEfb4Yx2g4ym2266zJ?=
 =?us-ascii?Q?J/DEBKqEGne3mU308aTVCWnZki9U5A5+5hBkNmMSqB5Aexyze6eoOoAVAoEV?=
 =?us-ascii?Q?yjfs05asIuvM2mx405H9potoKbOMx1bqE0oTgiVcwUDklkhTAjeCaj8ju1Ar?=
 =?us-ascii?Q?Gp4JeOJKRhPPNvRJ+7JCBIrw8KyzfWVMbkuEY/5wchAfKieP/Qt5qmU4jSp6?=
 =?us-ascii?Q?vlHEvVBp2t2MuETK2cqOX6aNZ8uSVGfINjXqE2hSey+CtmYOGfIyncTdzhik?=
 =?us-ascii?Q?6fgrioO7cwLhOazGTsFq7bZ+G8T//K/V9zIt5FzsDR19CbHEs9gBKRPtt6lQ?=
 =?us-ascii?Q?LdCuDEvAXsbGXsi6sk77712P3ht/jKMaerpoA6uSASNAxyZdpuesE4PPIp6F?=
 =?us-ascii?Q?JEFYhvVACOMlnaZsZP+9jZ2peEcaU3gtQEUDLl4XSAG0b+Qd7CJG7DHBjpgE?=
 =?us-ascii?Q?vjmhtRB1Lya+RKcfWNYC0wOszJDWVfr8RFA55DBdyIt4DfysEYyCr49wNpQR?=
 =?us-ascii?Q?04RzZEi5dlPxFv0aXhaSUFdXP4dplBY6xDiBUdpLXWxbBrOXFNCZ3ohx89gu?=
 =?us-ascii?Q?5X3GSyBG/EqrgDzjXE7kQ2/YI/Vdwlmgd4ZQdrPfegBk0tkdVXE+XIG2dURe?=
 =?us-ascii?Q?mV77KojGG/E31wz9P0aQUv2wY6oK7nqvsSF7kWcYihnoWbO5ecxDSsMqoXe0?=
 =?us-ascii?Q?6q3rkUbkniAczRy7T8Q/J7je/pnLrdey1Zkh1bHnIxI4F7xJdBvxGEPHVzz6?=
 =?us-ascii?Q?QzU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0bb5e5-a985-458c-aaf1-08dc614aba84
X-MS-Exchange-CrossTenant-AuthSource: BL3PR19MB6514.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2024 15:01:16.6442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB5735

This patch fix the keytable inconsistency about stdout/stderr.  

Signed-off-by: Vince Ricosti <vricosti@outlook.com>
---
 utils/keytable/keytable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 9f7575d6..5f5b88dd 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -1728,7 +1728,7 @@ static int get_rate(int fd, unsigned int *delay, unsigned int *period)
        }
        *delay = rep[0];
        *period = rep[1];
-       printf(_("Repeat delay: %d ms, repeat period: %d ms\n"), *delay, *period);
+       fprintf(stderr,_("Repeat delay: %d ms, repeat period: %d ms\n"), *delay, *period);
        return 0;
 }
 
-- 
2.34.1

