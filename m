Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1823E12D4
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 12:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240080AbhHEKkl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 06:40:41 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:7280 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240353AbhHEKkj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Aug 2021 06:40:39 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 175AUvNO008922;
        Thu, 5 Aug 2021 10:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=eVaTRkamBWNeAIIvO1r0GAnkID272xxf4HZNo18Mxds=;
 b=zR15sbyOd/UICuPRr8fLRPJzkIBTNgGgbsAZbtTnRXeyqnSrGASx/vgy0oCJ2bS1ZUYh
 1PYeOIjwB/M7AuQDoaWI0y6MnihY6wvj0O1X3eScaeG24ARAYa8ca8AzthqsUVKKuAgf
 XoRu7DaP3BloYSiKJTurHF0VIcM3PG49s230cmXEYXzj9+IrNl5t4ehjvJePNn2lSHqp
 KFVFZRT0vxP+cPRZMEYO8NWoNtdGwQVCfLFFoOIpP1f81bjXsS3u86XBOCXlpmY/UErF
 pjIMMUwun88AvxMf8HLoV9tgR9ktT8yCxXmf0u4LSIjoItDX7bU/wZ0FNcDY1gDrRZbS 2A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=eVaTRkamBWNeAIIvO1r0GAnkID272xxf4HZNo18Mxds=;
 b=gpNlQC/O9qVJLbUfUYM8sQ8QyWS6rtRcUvIF7ZAZCuzeGyXvA5W1cBtkDKkArViNZUXf
 W8Zgv5Sr6BPa3JHOj73tMCWHRY9ncvsfhYKRzwzhGQqfg+hbmvUkMJCbXDWc/s8WFOqC
 dVcMq5FmmlkHPojWsUNfZH0t8xxS5Bfh/2uHGMFoY25iriHm/P42HJpywTzXtcvgUg17
 c5Tb4bb58r6Z+MDTeZ3gufX+37gOrubg9wIz/IM/l3IANnh7wmRvSxyou3BWIbXa/nZr
 nb1ypAPXnM0zYou/INGV/h6SiZZaLXumKMS3ld+LNH57F33+85LXLavmoGtUD1sz3zXl fg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a7hxpknmv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Aug 2021 10:40:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 175AZhdx080384;
        Thu, 5 Aug 2021 10:40:17 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
        by userp3020.oracle.com with ESMTP id 3a5g9yybhc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Aug 2021 10:40:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyCGSCbdXLglJMJlVMH2mdQeodUDrAHYywjfF4rfDFEHaDVxs+gXzEg/DoUC8HLJEraQxBxAE8PC4XPpuzdSeDsSLzCScx7Tcvu2Y4As5gwgdntnRajO5IOTkP5TdWnFI+Txc6vy0ZFt8zCIUs2HkF1+Uo+EyPWhXnRN/KxjMlP+pfoAiNqqcpWyCOb28A3kZolPcJV1Wj9HhMgRd6/ObB5jL7ajyT/fz7QHJyr76X90IeAi7x9hmqAqp+R0p31lbyV4vYLgt0H7gWd4HFDBPl0lPBEJGJ6poHE4rC+wxmBKuCuWq37JFNIiupRvkFLHEbmtBo2c45wbTLFT2PSkAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVaTRkamBWNeAIIvO1r0GAnkID272xxf4HZNo18Mxds=;
 b=FNCKOTaLBYoz1OpfsZAT+eA1wBM4Qx8Jn86LHBAVqF4QlUdEAjwZZBA3/Hxn1ydwC+haj+fIbaFT1UjtOUovYtciOO5pNU3b95cJvP77tq5uvY7nOI96CzF4ucKIqd4zjJpNW6E0eGZx4ztoLqHehNXMpUeQ9DNnW9eSPxXrigGWoZA1lMK6INdVGLf1VJCx2YA+L/uwy8HkkzG7MfI26kl+Vv60zX0xIFTVv1X7VVa38pRoq1RQduzIKklVpHvj2uvpl31aux0tTRnLoSDZAT6lt/2TmK08+5sguOHsk6iqGL5F3SdBAF3ag33neORgVmFILEeiqqjxUx1UzLIo+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVaTRkamBWNeAIIvO1r0GAnkID272xxf4HZNo18Mxds=;
 b=nGJd5XqYXaKR6EVoRxBOKLwc+4CetT0+uO+UbCSRE9Nyy0OseudcBPYQM93pQf8rXb6XsfutaAJKCGKUgE6mABm2Zt4mtIU0tJeQq82h/DsGQkzL9/pzYY/H/Q279iLOKxAyHKs/dVDAAy6Inn7oXH/9/p3QTbSHX9w9wlK8nZg=
Authentication-Results: sony.com; dkim=none (message not signed)
 header.d=none;sony.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4484.namprd10.prod.outlook.com
 (2603:10b6:303:90::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 10:40:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 10:40:15 +0000
Date:   Thu, 5 Aug 2021 13:40:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: cxd2880-spi: fix a reversed condition in error
 handling
Message-ID: <20210805104002.GC26417@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0102.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZR0P278CA0102.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 10:40:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5973e0fe-645e-4647-f668-08d957fd6932
X-MS-TrafficTypeDiagnostic: CO1PR10MB4484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4484BCC178CC4D1F8BA133D48EF29@CO1PR10MB4484.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q2ChD/47rT5u+re4+vkYXSdwO9ZqEZqTvjudw5/fy9LraM8/I/uho3IQkpzUrt5fcqhc5cS+Alqttuq8HxI8ScgLgNuooTffPBPQ2ObcsMDF2o2co9R/JkfJ1KXrlA4PpWr/LB2yUi53wc8Xp/Zvcf6TdkdPpoSljqLD+Ixr8K/DMUxjLSlfwgCYkkAUtw8U5U82XMwMnNuwlfbFSQ3vRtoG1KQF4jxTdSBsztPa9kIxKXDTG5oJTfI1wkhuTQmvOjgzHo1TPDExIibaYdks2ldKOkXeiRkQeZLzXjMk5zrO5FppXH6qX606WkId61fTwY+WFVTm/WnSsh3t7BXQRoIpQxyQtolp7If5jpK2iASxUjzS+AtDUp5ox+/AbWg2kB+EXArmv9nbghRXXHgviqABMLpUnSWW9fbglEvffQ+MFOxJgXPgD7GPy5FRlvtoUWfBsynPj9AsW/D8iF6DsKhCX+a63T0wemw4g7S2t+CAEFW3cFZtSOJcipBQju8A6gSUA6a6PLB74+rv4BiHJ98WLxWrS76072jwtYSKPtN34GPhCM/wDsN7rmSyRkoL+WvQC3Qzp69hIgKNX1UC3uHgbX6T0ewMfwEg1ixD5zBaMp2F34glHDg5uNiDBOsDlrBVQI4MB2orhrvthJiCrRk5WRkozSoTxoPDDFNzzJAB5G+0ddxSIRZhhy//gE75TmkUrXfbbCXjuoHfxlAGfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(346002)(136003)(376002)(366004)(9576002)(8936002)(33716001)(86362001)(66946007)(66476007)(9686003)(6496006)(83380400001)(316002)(8676002)(66556008)(33656002)(55016002)(110136005)(54906003)(6666004)(26005)(186003)(4744005)(478600001)(956004)(44832011)(2906002)(1076003)(38350700002)(52116002)(5660300002)(38100700002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+7n8PyN1LhN+4YE5wqTjVcoTNdAZuruwnSyMoKqpRpUHnwKBFvD+bAiZbgXO?=
 =?us-ascii?Q?75TvcCYzuttq+4gnC1rRru93e64Pi0y5YFNTJgb8c/6f6EJNUi57WiX03ZOu?=
 =?us-ascii?Q?I8ldAderM4AyK4pVUmtg+/oPYQuGFA+JFCs8x6xpXkqgGMDr5dHvyV0GGxlZ?=
 =?us-ascii?Q?73FYXEW340NfiCZPLVg7jnUVsaFxJEvQLI0G/7uiHtY2t6nq+obHgqn7MWEM?=
 =?us-ascii?Q?KhnIHVToxig3f+JRywn7C4lRggIEJ6qOQwru7StQ8k5lDaw9tSIQrd+GPVSD?=
 =?us-ascii?Q?I+xoQ9kq5fKRv5cxXOFTAt+6ihI8hC61AaL6eo+5MYFL3BddeYbhrGDFTTc7?=
 =?us-ascii?Q?Spha6DRL57ceHINsClSf7nSrZaeD1FEJy4yh7TT/GHvsh1zgmx6H21N5U4dv?=
 =?us-ascii?Q?Gs0GC7QjAXVlns6mZvmW54bHpRIkfZgcbrMUl8eEu+AZU5emVHM/c2kxzvWG?=
 =?us-ascii?Q?8Nvf1Laf6TAoJurVXkxPpPcsYzw7cnliOWzqYAg7IlnaSkY2FX8E9fUpHNK2?=
 =?us-ascii?Q?IAVhv4gs3kavN7n3Q16mORh8VEhXVrAm3zNLuvDreJVyXW/hdpUc31TiTjCG?=
 =?us-ascii?Q?0yxmKCeQZVXZ23i1hQyPlD7zUgeqsaoPuc5Rz9miQscGE9VOFkqCIgCeoMBp?=
 =?us-ascii?Q?Q7aVnsrUQvIoF/tKF4UqXtJCuh5Pd1PF5tWrasfc5s5e2q+WWxG5Ori2Uiaq?=
 =?us-ascii?Q?Mv+iq7EUC6IaoLGgc/YUAOZVKwhG+I+anFqKSYwJiZDemxpVQQRfgrfrzzJA?=
 =?us-ascii?Q?/ZvK1bOIHPbY6vQFuKShB3QvORo2+Fa1I/wDLBcIDiLAVlXamvdyhbnjpmx2?=
 =?us-ascii?Q?RJTTVaq2EuKK0t8FIBb5iqBc8CR1lVOmDjh3L+Z72EBjk1ZPp6GWiSZPn+dR?=
 =?us-ascii?Q?nSdtiqJmlhqK5w/ElIHK5u+9hzqubpS64flRHD6ynMc8cQY/NjsPaePbQ+PN?=
 =?us-ascii?Q?fuJLEcJX6Fe5jahrvVZqgtLLEqWXVJY32IM0jvj4D8ebeE0tcS+n/T7r00SN?=
 =?us-ascii?Q?SIwFQzjP1w7xScfBKtQlu9TT8qZOlXQJmzDjvSPN+Wyzk0kTAYMaYgcS+VEm?=
 =?us-ascii?Q?KE4NTwl0WXJAsYgCNtoIgJZvW0lGPX6zR/ZWVzImis+Z1C89rZ7OcHL3cO37?=
 =?us-ascii?Q?Y51waat0MRuMxLmMuL+ODWyFiWKPyi2D3gRx1JYwyrn6RJsnIAvzwo+Py8EP?=
 =?us-ascii?Q?QzAAfac+hSRMkYDSGeS+pGMMLDwBsRG3gSu8d7MlodmdGyP+kcVl+Y/WnlsP?=
 =?us-ascii?Q?3ko9Uon89oCQXhNSTBnAybjvGq/cb+ENvIFxp+aH6y9kKZUzwDZVXhv9+QJE?=
 =?us-ascii?Q?1w7+LkSVxm9tBigJA4fePoYz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5973e0fe-645e-4647-f668-08d957fd6932
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 10:40:15.4404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ybgjKlC6xadwOSV9QikOGEGBYbbdfVzV42zSdL4RoGxBabdALYYCwIZ9Knrgq3KtWPScTjh34BrHsfQ4tAPUQ207LEHr+6noqAsnmRo3Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4484
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10066 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050063
X-Proofpoint-GUID: tt-_ScGDXCcKqNf1MN9F7KAnOIEpjXZ2
X-Proofpoint-ORIG-GUID: tt-_ScGDXCcKqNf1MN9F7KAnOIEpjXZ2
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This if statement is reversed so it leads to either a NULL dereference
or a leak.

Fixes: dcb014582101 ("media: cxd2880-spi: Fix an error handling path")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/spi/cxd2880-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/spi/cxd2880-spi.c b/drivers/media/spi/cxd2880-spi.c
index b91a1e845b97..506f52c1af10 100644
--- a/drivers/media/spi/cxd2880-spi.c
+++ b/drivers/media/spi/cxd2880-spi.c
@@ -618,7 +618,7 @@ cxd2880_spi_probe(struct spi_device *spi)
 fail_attach:
 	dvb_unregister_adapter(&dvb_spi->adapter);
 fail_adapter:
-	if (!dvb_spi->vcc_supply)
+	if (dvb_spi->vcc_supply)
 		regulator_disable(dvb_spi->vcc_supply);
 fail_regulator:
 	kfree(dvb_spi);
-- 
2.30.2

