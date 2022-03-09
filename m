Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62FBA4D2D52
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 11:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbiCIKqg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 05:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiCIKqf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 05:46:35 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5ED068F9E
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 02:45:36 -0800 (PST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2298FlGd003040;
        Wed, 9 Mar 2022 10:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=xHx8JILQtHujJ7zRdqv1wAiPr716og4rdz/99N+whz4=;
 b=QIc32AzuDhLo8Zl4OUhh+MiApVpnUzP2fzlseltSPBs12dddGm8eWimPf82lcBt/MQQu
 18fzXxRFqtk5UAtZUX2Jv4JdUdmSFybk8sCFLKS2tI851HYW2NwkMU3PfB9mDLGTv5tR
 9Wc1/c6AJezAH8FPACfkbv4l6xxDl6zDUXMuTX9fcVTdsOrH3rykAI/KFeLtGZqV/oJn
 idrGtKFQjYm+s0Ni4O/WT6SjG0IhcLfhbf8At4Vhbu+eB/1FL7nc6QhLE/80cObb+von
 C7tHKn9gWA6/QcQQ8zJY9JnlRYqz1WkvCtbhXFqWnP6VkP3ZKOXhqJipQws5xUlphThr HA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3em0du1sq7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Mar 2022 10:45:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 229AjDrL008431;
        Wed, 9 Mar 2022 10:45:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        by aserp3020.oracle.com with ESMTP id 3ekyp2vn4d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Mar 2022 10:45:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLZukQ5dgAWdC99fVMJes7w13Xs1vu3/eAAXoqNYLPgn52mt6rzxA/mlPSclNguE0KWFfFSoG7pIHM/rZMdklcVoVoxkJF+BXaIKklwy9bJXg7bQ9Dk34T86zylJZsVkpoYtPGn9s9MDIE9obHYBWSRgkuoVZVubOzZH3g567mP2/WdjD6qQfMWBUXT4qxGLKiSj7Zws2AVgBsYsB232hrVjHW22aeQNzSnwrFgq2WiOstO/He29zJmurvSpK6WycZyJCLlyt3dXDI2QsHmOL/9McaA3vjaYo7yc5z6EY5KuAyeWBwatfxv2tJlTCefMyTUG8vjXQYAt8lOAizU8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHx8JILQtHujJ7zRdqv1wAiPr716og4rdz/99N+whz4=;
 b=jKG088+gyg4YFqHciWAOVy5dulhauimheKw/MdYW+NPICtPwnnX8PGHETsFZELRluFEdBkiRDsZuO3BvpPXdW+xjBZ1qxFrMljPqJjJFH0E3TuT/qW84OyZGZX5XPN/es64AWEtz7eiUUuJHxJsY1oGlf3Flr6k0I+aeKjdaMQcpZopZ5G50r52JJ5eq15EPGxAygcG3Efce7pyCfC0VcjyNqauV2bjhEOq08wAabYNyrCvCOja7U1QCb1tyMA75xDOIsl7cLtkaiQqwWFpL1aGeGHE5yvebyD1wJHfv9wHORt51usd7OVzDupF+1T5W0Per9doW74FusCVR+Bd8zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHx8JILQtHujJ7zRdqv1wAiPr716og4rdz/99N+whz4=;
 b=JHd66YdKgOe8hwDGWbX8Ov6HaV+4AmgXKGPMwgFNNomn7phqLq12cm853Pf8kQikbVIi13IqcsUZ4EbcbmDDASUkx5FaiUuauCr8XRbBWrrhXqICD0Ibpdex+yAGz/g1Xy78i9kUu0qzBM3/oRdBqZS42EVnVxjl8Ytwa6/v3DI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5475.namprd10.prod.outlook.com
 (2603:10b6:303:13e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 10:45:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Wed, 9 Mar 2022
 10:45:29 +0000
Date:   Wed, 9 Mar 2022 13:45:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ming.qian@nxp.com
Cc:     linux-media@vger.kernel.org
Subject: Re: [bug report] media: amphion: add vpu core driver
Message-ID: <20220309104517.GT3315@kadam>
References: <20220309104337.GA29869@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309104337.GA29869@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::36)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 147ef29b-6028-4196-9bba-08da01b9ed77
X-MS-TrafficTypeDiagnostic: CO6PR10MB5475:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB5475D184AE2CC7467F72D3508E0A9@CO6PR10MB5475.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Af25NcJmfAfGuc/HetzZgelugS+FohtIaCnhOyd9P590aM4mheo4eXabzSImrE1cJFrv8usshyd+ZWaWtAdZ1U6VVffp9FgF+AmpiiC/Z0C81aTOXAXVzDfdVoPg2lB8T4y9rMfV+8C3DpTtgA81S4R9OpM0SfOTBl38eM4Woo8kOi34hQOva+RhLuraCjprFQFqgvGJwea7MEZQtkyQodr0PBx4flCRYTMEhqnTZAeECB2Pgc4k2q/P1mqJg5ruj6opTCh4E+q1xlWhUluJts7Ch4IjedydgeJsDhXDv0mvs9fRumKOYq0k1Y7rTZNliLvuPqdit1sqHNR2bl2yKvx1gL8lkZ4AAoR+gLQmjt5SV8hsGu/ja1YNjXdb7nXn80mT75Pww5Nv3qL0pFlPpYmkl/QoQUeHUtId5UZf5+mG+Kt1Swdby3hDGvG1OIkDxC1T+oFXC5Vd2REartiPwa2awaTR7F8yy0TimJ0+bwVx4njljvqAv17tMvsBk2MqtLQO758GliVVej9JkHALSIWk+67oB8FjlfyWHZ7MCQB5QxHK09AnxjGFJxS5/ZG/0GQyjHS1p0BlMDJyKQGI2Sw21rALGDvf7A6n5nCVMiBKSxcHpltg346qyy6neNcq41z08PsK9At+ramX1Bt5bY/w+gLa0hA7xu/MaTaQ9EXULpuW90e9sOHRy6S10MsExFt+U6mAytBquHmykEMlzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(508600001)(5660300002)(38350700002)(38100700002)(86362001)(6512007)(6506007)(9686003)(33656002)(6486002)(8936002)(52116002)(83380400001)(44832011)(6916009)(186003)(6666004)(26005)(316002)(4326008)(1076003)(8676002)(2906002)(33716001)(66946007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y+NjMdZRBlwaW4m3gyHGyxpKIhAMDBry3wbBIXTdG3kj7uPxNFWVvTyo7NpO?=
 =?us-ascii?Q?iwzleWqK/jV3pDFkJKl7jotU7G5kfKOODH2dwEOOf16HYbl7f0G42bxZANzp?=
 =?us-ascii?Q?15n5b55uzBjkOPf0CNboEoMK6117dblZV1EHAQPpFG+k268EEx5rFRKdQ4XQ?=
 =?us-ascii?Q?pT8v6SWkzfB488JUQG21V/2H4yfgBZVv0K/G/QZyJF1aNBMIL8dfwDqFdeqa?=
 =?us-ascii?Q?HTjeuQNKL5VSi9Ue46opQyLUdQ85eyhxPJ2YJ7l+17kv2YdIy0aPTu1W9FDL?=
 =?us-ascii?Q?Ie4DlPr5EacKuYBJoByfg7+UL9SrLzU5cVuZhqhD3itMRLZkoGxb64rjnWsA?=
 =?us-ascii?Q?ub+EIrwMAEOy8UnY1GK8AHIg9nzEAkcAMKgHFOnFSMSZp9YI+Ugx6zmQlhnY?=
 =?us-ascii?Q?23Rql0MeQQPeET8JDFTH91ZSHv17islc4YSqhu0bTJfnsTjZuNJ9T46mQrM3?=
 =?us-ascii?Q?aM3QMLIY9xmj1+IDlIVA1CVY08OB3IBpw32/e8hUstLiFv5XYHwiil7HjP93?=
 =?us-ascii?Q?UCBesFPsvsc4u7VHPlOrpg1agfQWUEEDXoPlhaCghh8kKrBDluoGh6PzJe/V?=
 =?us-ascii?Q?jL5R2rjyW4nEgiH4eTy4ClokDfsToMZNuXb9I2AAQrjnI55eKxyc41sce5ZE?=
 =?us-ascii?Q?+2b3/o0NvxLVNLzn02Bu/zKY/A8vtfknbp5wByM4taa4W3IfH0MuZfyKXghB?=
 =?us-ascii?Q?L+Y9y+cxY3KfXRUqF2AvYkhIfMrhAQ5bBjizRa+HVMWyhIDQ4sYXeqiBtnla?=
 =?us-ascii?Q?S2k0hZMteB3iH4xBBecuL9l26bRbVhMz1mmfV2D836bRkb8eDUqNEdmAqjju?=
 =?us-ascii?Q?CinKg/Z6yx2wj/o5yExArMWuX9nSOXWwp6VBjGvuMGDGq0CfW4nErQsUKePq?=
 =?us-ascii?Q?5HgOF15YX9TBFY19BkPVxq/OlK6Z6ZklpstTRQ4cqo30EX33cGpkTyw4Saa3?=
 =?us-ascii?Q?xgHjuV4lT3LqWb64Q5h6I5SxlDq+hIoeKQCLdTUbsn6keftyl5F46XdDW70h?=
 =?us-ascii?Q?qsRL8uZoNEd/1ErqnWOacXtYNmARq3pBgmNq78xlWqoxoDQTJt+tNfgQ28Q9?=
 =?us-ascii?Q?nkKzXu1TfdY20Awh+4+wgzfOIGkpj/FKgbVf9cS64ljPi0DhFGAOghN5GnI3?=
 =?us-ascii?Q?N8X/UEfXEWYO7rkbzayHRanL/Hm8bnD8OSOkxgYiHJBYVRd0fCOWSOyGeQQ6?=
 =?us-ascii?Q?dFplXFgrioKXDL2AAMrXTaHNPGr3AcWw6EJl0c1ejFESqWQSmjLeRzEaEsmN?=
 =?us-ascii?Q?zxtuiUMmOMWw2h+lkJJ3py4hP7v6D+Nzg/DY20tk+o3Acq3Hs57bju696fno?=
 =?us-ascii?Q?RyoEmqTmbO4XIjiFlFnOHrm2aJPTEEDoOPahreelOqdb39cET96i0ik2Pw1z?=
 =?us-ascii?Q?NGT6DHe0VjeNy3QfcuyIIFlYA9QlF1S8iLGBkcHHladqMhocMfYn/ZEytU/p?=
 =?us-ascii?Q?uhDRRl/95ZS37mLAp9YI8m9jaz+IIxr03HL1CmTPwPQzESPz+nxuigvQ+p6a?=
 =?us-ascii?Q?N5QbrhDHFJ5DSzqw7NnxKaXPzAUKpFkuKyM3reFIqRomBpj3j3CaYygemCE7?=
 =?us-ascii?Q?zx2tcJ5Nza4QPSD8jTDjQNpVxBwfnr1j7EcFSSOy5x0GyRDeEmKR6kxKXjfT?=
 =?us-ascii?Q?iNl/LhUM7nGM54CrqbwkCdpjrWgE3NycuXopBlfnI834XKjEKUs+KW45hVe3?=
 =?us-ascii?Q?8G+KLw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 147ef29b-6028-4196-9bba-08da01b9ed77
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 10:45:29.2056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsRJzeKlXmeCYqex+LVnMOJBmS/WWcIYhguXNV9K0aoYwWGL8/yQymvtNHS1CO96Il3azkxtK1vXyVhq2DsFYYhq+46KOSnAhOqZjgZNCYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5475
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10280 signatures=690848
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203090058
X-Proofpoint-ORIG-GUID: sk7BuVKpPJlsS6GFBzPPInADsIhd8mui
X-Proofpoint-GUID: sk7BuVKpPJlsS6GFBzPPInADsIhd8mui
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Same thing in vpu_probe() as well.

drivers/media/platform/amphion/vpu_drv.c:122 vpu_probe() warn: pm_runtime_get_sync() also returns 1 on success

regards,
dan carpenter


On Wed, Mar 09, 2022 at 01:43:37PM +0300, Dan Carpenter wrote:
> Hello Ming Qian,
> 
> The patch 9f599f351e86: "media: amphion: add vpu core driver" from
> Feb 24, 2022, leads to the following Smatch static checker warning:
> 
> 	drivers/media/platform/amphion/vpu_core.c:654 vpu_core_probe()
> 	warn: pm_runtime_get_sync() also returns 1 on success
> 
> drivers/media/platform/amphion/vpu_core.c
>     577 static int vpu_core_probe(struct platform_device *pdev)
>     578 {
>     579         struct device *dev = &pdev->dev;
>     580         struct vpu_core *core;
>     581         struct vpu_dev *vpu = dev_get_drvdata(dev->parent);
>     582         struct vpu_shared_addr *iface;
>     583         u32 iface_data_size;
>     584         int ret;
>     585 
>     586         dev_dbg(dev, "probe\n");
>     587         if (!vpu)
>     588                 return -EINVAL;
>     589         core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
>     590         if (!core)
>     591                 return -ENOMEM;
>     592 
>     593         core->pdev = pdev;
>     594         core->dev = dev;
>     595         platform_set_drvdata(pdev, core);
>     596         core->vpu = vpu;
>     597         INIT_LIST_HEAD(&core->instances);
>     598         mutex_init(&core->lock);
>     599         mutex_init(&core->cmd_lock);
>     600         init_completion(&core->cmp);
>     601         init_waitqueue_head(&core->ack_wq);
>     602         core->state = VPU_CORE_DEINIT;
>     603 
>     604         core->res = of_device_get_match_data(dev);
>     605         if (!core->res)
>     606                 return -ENODEV;
>     607 
>     608         core->type = core->res->type;
>     609         core->id = of_alias_get_id(dev->of_node, "vpu_core");
>     610         if (core->id < 0) {
>     611                 dev_err(dev, "can't get vpu core id\n");
>     612                 return core->id;
>     613         }
>     614         dev_info(core->dev, "[%d] = %s\n", core->id, vpu_core_type_desc(core->type));
>     615         ret = vpu_core_parse_dt(core, dev->of_node);
>     616         if (ret)
>     617                 return ret;
>     618 
>     619         core->base = devm_platform_ioremap_resource(pdev, 0);
>     620         if (IS_ERR(core->base))
>     621                 return PTR_ERR(core->base);
>     622 
>     623         if (!vpu_iface_check_codec(core)) {
>     624                 dev_err(core->dev, "is not supported\n");
>     625                 return -EINVAL;
>     626         }
>     627 
>     628         ret = vpu_mbox_init(core);
>     629         if (ret)
>     630                 return ret;
>     631 
>     632         iface = devm_kzalloc(dev, sizeof(*iface), GFP_KERNEL);
>     633         if (!iface)
>     634                 return -ENOMEM;
>     635 
>     636         iface_data_size = vpu_iface_get_data_size(core);
>     637         if (iface_data_size) {
>     638                 iface->priv = devm_kzalloc(dev, iface_data_size, GFP_KERNEL);
>     639                 if (!iface->priv)
>     640                         return -ENOMEM;
>     641         }
>     642 
>     643         ret = vpu_iface_init(core, iface, &core->rpc, core->fw.phys);
>     644         if (ret) {
>     645                 dev_err(core->dev, "init iface fail, ret = %d\n", ret);
>     646                 return ret;
>     647         }
>     648 
>     649         vpu_iface_config_system(core, vpu->res->mreg_base, vpu->base);
>     650         vpu_iface_set_log_buf(core, &core->log);
>     651 
>     652         pm_runtime_enable(dev);
>     653         ret = pm_runtime_get_sync(dev);
> --> 654         if (ret) {
>                     ^^^
> This isn't right.
> 
>     655                 pm_runtime_put_noidle(dev);
>     656                 pm_runtime_set_suspended(dev);
>     657                 goto err_runtime_disable;
>     658         }
> 
> The documentation for pm_runtime_get_sync() suggests using
> pm_runtime_resume_and_get() instead.  I think you can just do
> 
> 	ret = pm_runtime_resume_and_get(dev);
> 	if (ret)
> 		goto err_runtime_disable;
> 
>     659 
>     660         ret = vpu_core_register(dev->parent, core);
>     661         if (ret)
>     662                 goto err_core_register;
>     663         core->parent = dev->parent;
>     664 
>     665         pm_runtime_put_sync(dev);
>     666         vpu_core_create_dbgfs_file(core);
>     667 
>     668         return 0;
>     669 
>     670 err_core_register:
>     671         pm_runtime_put_sync(dev);
>     672 err_runtime_disable:
>     673         pm_runtime_disable(dev);
>     674 
>     675         return ret;
>     676 }
> 
> regards,
> dan carpenter
