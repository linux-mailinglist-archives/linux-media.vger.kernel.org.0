Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C241F45A622
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 16:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235870AbhKWPDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 10:03:55 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21046 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231387AbhKWPDx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 10:03:53 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ANE6q0p004389;
        Tue, 23 Nov 2021 15:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=nhSS+jVlwCZmEMKccZ8mcBguODz1M1XaZ/AnA3E9MmA=;
 b=cFr/zBD7bv/vEsWeJoJKsngA7dn8F8MzuT42QFzLSLivqyP6zESNh8Pl9TJ7dcl7CwJt
 QVc1YlP/WxCH1qDrTkMRNWipEfOXJC2KGPC/Q5Mqgi0QU62wdxeTJn9R3xVGc0meaysl
 XfMOdJAUebhdGFa8Pn84OMKeQAHYJ2bAWppnSFrKWhUwDZqSPz3lzcznIEuEcI5CkBuC
 AuLKMg3kMJDEbMp236lHbMoyo+k/WKo/9IPbMMyCAlCqygCPuaqCN9JskP5Ztm4Go4zo
 JwEE54NeLSqVgM5xHu4bOBgPxoGRXkossk+gkrCR/yjcC7psAiYB8Df10HHGArq5t2Fy 7Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cg3059m8j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 23 Nov 2021 15:00:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ANEKcKF084734;
        Tue, 23 Nov 2021 15:00:04 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        by userp3030.oracle.com with ESMTP id 3cep4yhyum-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 23 Nov 2021 15:00:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtpTwjDWDeOxBywr4p/M/tpTdASoA0tDhT6PZUh0c+qJxwQf6P0dWwatwBBFgLM/oKB9okWapE/LQmnyizp7iY4U+xSLOf2ZUzZOR9UabFyOUnsd0Ia7vpNW4hg5g+XrhfJ1Vw6lr0KGHa4eSdDLNomkDMU3EqhA1HbcmEqQ2pagqiCRRMCl7n+OqOBWGYn3o0tHD4byNSAhUqQULLWbOgQ+7jqPMwYAFl4Vvi54XKPSM23IGvEmNJMzGjDPUl62GqcTrJ7fzkoJXOR5XWgtzMDnkaZNzJlz3m/3O/v4ozCAcpmHQW6tUBowP2j8A3Tl6ldXKzOtP8TA8nJhdW6n2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhSS+jVlwCZmEMKccZ8mcBguODz1M1XaZ/AnA3E9MmA=;
 b=jQljF2bsBmdAjX+uMjjSwIyxM+df7IAuFKF5NT09sToUDjbRK6dQOu/QJXIH4bgMqUJcOc8f1eFQjjVDuljMHdFXrw6YLOQ5MVS6A9bRF2HM0hqsFmaXLgux2UsHmNOlckwW9x+JSleRJ/CYb+WrLNA55R2pEEBFeYPNI/9T9JV2kSWXep7ieu8DVa7FSzjXBkEIcBrss+NMUHHm/rKtRk/snui61P6UG5resc0HYB1Phs3HUzE/yVu9yjxkIdCsRPqyrkemwGZXBib91eKM/xt5sC1sgH/2sa6FPf1tf9RkHnF4Q5Vegb24+g3bPPjgW9NvH088eQHO1kogq3dLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhSS+jVlwCZmEMKccZ8mcBguODz1M1XaZ/AnA3E9MmA=;
 b=HlpbJUrtOKgn0A0GuGipiro6rPGWkm6XI9kuzRsr7+UFJEZeSUmRBl6sJLXvZOQJuhU3mFY/XIEXpGOvz66QKnuT85THSfOf0sXYwI5EbiusSqsM7E8URcqBl4J+HUObDTGl1CRWEDPDIEICOW4/d/xEQEdBe7isNx9o0R9GSXY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2397.namprd10.prod.outlook.com
 (2603:10b6:301:32::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 15:00:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::495f:a05d:ba7a:682]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::495f:a05d:ba7a:682%6]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 15:00:01 +0000
Date:   Tue, 23 Nov 2021 17:59:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-media@vger.kernel.org, ezequiel@vanguardiasur.com.ar,
        nicolas.dufresne@collabora.com, mchehab@kernel.org,
        robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/7] media: hantro: add support for reset lines
Message-ID: <20211123145933.GD6514@kadam>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
 <20211122184702.768341-2-jernej.skrabec@gmail.com>
 <08e80e9e-f646-72e4-e4d4-f8e6310228f1@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08e80e9e-f646-72e4-e4d4-f8e6310228f1@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0012.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::24)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNXP275CA0012.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 14:59:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85dcb8f1-377c-412d-c40d-08d9ae91ec42
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2397:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB23974396A25E614430C7177A8E609@MWHPR1001MB2397.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qpvQkQEwDa0gmId37SOE8Kl303sE9hE5ebfzrfSdZvl0tLi5UJCfwRdLgM4B4vHaZ2rvC7bDZGh8X9LUVuyVXKpAaUb5BIVuw5uvscxCSXbumMN1VvoOtjmevl+7JWVcPAYWxZcLPo+2RgANS1I9bh2dviW/x+JMhQXT5ib1HtbG2/w8CT+ay8DJcPxBcRUjYW47eZq4xSH68BRcgrYYWmKzFfKi0csgCP7Hv6tgodwcrVbs8UK+hc6jUUFkE0X8z0q9zbOHrFSAVyYZCkauPERsC27fUDIhSLCwGvy7mqfK5x+0rdzf7MgBj/PldiYYi0OXQPxT+Ub8+kxUcxwN0+iANNOQ1bGr+svHMFjWB0z1wL5dpUMUfI3THc+pxJi5myT2b1/Lq7vNXLUamHuTsiM8Uto17GqyhuJAP/QtJvy+anV2u5/8boY8RKccbBCCKINEtSEMzs4UUUN5/BwRS/J91vuZNBenDnG4oDrhvyyuGrjCb/AWOw35b91ptND0cYwohOJQHppwAEb9iTLBqby5PG5m/z8HreHtPFoDLv+jGyU+qZ30EYW4732UBzHIZ9DU/x5kQkOfZHFAMSt0qY/ESOi/e3kyGLfbj81L9aBdvjGE5815GpuMGimC6oyiB79MMkpSMSuLlp2SduqcoSb+tzWj2Dzq+2UFP0bcHzZha8PKeiLqKoTYKhvG4CgmCT89R4nwDV9jP0pHLFdQtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(4326008)(956004)(33716001)(83380400001)(86362001)(186003)(1076003)(8676002)(2906002)(38100700002)(38350700002)(9576002)(8936002)(316002)(9686003)(5660300002)(33656002)(508600001)(26005)(52116002)(66476007)(66556008)(66946007)(55016003)(44832011)(6666004)(6496006)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mZh9udMV8Me03n7nWB5Hcj5AhGMALehe5RojLZot34qQsueZyknnNo30vEMr?=
 =?us-ascii?Q?qV6tyW+HfMgWi4NlyS5076WgTGvKUclAQovqwSCGLPuo/XuBehRN+exD5H8I?=
 =?us-ascii?Q?ybDkheiw4wmaILASDrqyx+wrH8uMDZ/70jrVeoSoIG9a8ypEcuQlg9MIcWSv?=
 =?us-ascii?Q?T5ELWLB2kt1/pYSFTURBV2M4ijrmwnUSi8NGPbbYRd40t7yfFjPvo91uI2ZK?=
 =?us-ascii?Q?x6qalq4vH5zFUv1z82pjmL8djUxvSg0O3elOvcgxxJHZuMKR1PAMJMT45XnE?=
 =?us-ascii?Q?eeta47a82dNMwxUfsGG74IMHLZ2Ukwbn3kDilTI044giV+558F3XJIRSIFYg?=
 =?us-ascii?Q?76XHU5lIpBYWueSIOBIVYfydsFh23dslnn9F0EILqiUOfoP3xPBL4gwzlNn4?=
 =?us-ascii?Q?Re6WmbwgEErT3LrT1jrDFklq3iNilXMIMULkOvLOwpa3K1/dsQGCAFJzuA4/?=
 =?us-ascii?Q?EXBzzEKdbhmFTcvlLRnXQBD2OTksgcVm+tU9eNfiPbh68IK8F8niEbw9Kpul?=
 =?us-ascii?Q?pd78KkkZbDmfWxbmU58fe5tnDGzPoCBKMzNDnyOwhgRHj2J1WNnrOEwZpKTd?=
 =?us-ascii?Q?nXQQvioE6yo3a19a31q7TXp1b6wM8lzU9Sbvz/DvnaDlG7OqLQz2K8oicaYV?=
 =?us-ascii?Q?S9xFMfdndQDZo26A7MHcADBOpGdqr9vn42FkYeoaopvFoKrNC8+vpJ2dXw4S?=
 =?us-ascii?Q?P46RzNP9G6JUSYGrd5jhbwshr7keg0ZJaKzjmpAhdf4IVYGVazOn4D7kcA9B?=
 =?us-ascii?Q?L/jpD38HvnAihuNm0etk+N3lAlJcEX0JxTj/Aibqqm8Oq01ncttDOFRGRa/c?=
 =?us-ascii?Q?qJW0WF8sPllBPv1H+AeCXpfhc5JNqcgz4B/7luQEoMOBGot+wNamWm+yWAyA?=
 =?us-ascii?Q?hLLdOwDeubpOBmK4pPNkdRH+rU0czndXuxhttAcjq+byZtpeW+hSFI0+xDJ8?=
 =?us-ascii?Q?7Qi7aCNHrmaZvdSB2nyvOK4CgbqfYjIWCWkgbGLdjIN6lnj/r7uS2HyTIWn8?=
 =?us-ascii?Q?IWjrwT3GbybyEotF48HGtrVPrByl70axNP+pIk6xHOCSqSq6jka9hkUoCUJ6?=
 =?us-ascii?Q?mFM1/2jvFN6BWPFTq7EFDBVkUSF/80LvMC/3T0i8OIExUTRH7dwGjQgGI1lu?=
 =?us-ascii?Q?0I6WXBKlI3mEL0BtkewFMz4X7RnW/ROwOnz8DIixgmzrRczbADBPzoV7oV83?=
 =?us-ascii?Q?zMKfJJvB+Oba1Nyjw42lWLgK8OhelTq+dzsJOABRMqD6vZNX7iEBTKv+rxlz?=
 =?us-ascii?Q?+PYDeFCGoj+Bx0lyU4ZNj348x226P8koizJ1DkU3bJc1eN6lt5WVbs/rpL4e?=
 =?us-ascii?Q?kydONluUQxf8A+IVa5Dx3zmFvFI/lYzI2gLhl6Jn2FxLXe4y9gftKxeq0wxv?=
 =?us-ascii?Q?SK/ObX+eQpHZlSnmOH9+kiiVzVPckQee3cEA7Keonm4jk18xTl+8egeYk91z?=
 =?us-ascii?Q?vSl1bXO+MUdRf0gaDwAcUywSnnzDgNfHAxR0Yh4OoPS/ZGA9M0TT97R0LLXf?=
 =?us-ascii?Q?23+fFm3QELQ1UN4lGI+Mu8VtLLGigxWgox2tzjwp+Lklzej9SwgybsvrlPLC?=
 =?us-ascii?Q?KZYBXuWzjYicSN+42Oi9DUPaYTtq6UOmHTBw32Gg/M/7Nl3gnWtU7YiLnZ4T?=
 =?us-ascii?Q?BH9I0tUYtu7nuNeDjo3nfWTjTwQsrOhPVZlMHbxPAniiuODWIZzSEXfV2/Dl?=
 =?us-ascii?Q?SeRQjL43ZLy0PrbtlgYYxksamrc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85dcb8f1-377c-412d-c40d-08d9ae91ec42
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 15:00:01.4640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cuwNouXJ49TQX7Anq/gO5ZCR/u848IvoyJsBU8SX7sbTiDZznQIz5VDS0rKBIybWwHz7BZoC5qBHlHOgGQeiMNLcAijKA5pnbzQd8dBVRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2397
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10176 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111230078
X-Proofpoint-GUID: 9bPVSsYJkYhwnaDOnHqJcxZIRzIPqd7C
X-Proofpoint-ORIG-GUID: 9bPVSsYJkYhwnaDOnHqJcxZIRzIPqd7C
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 23, 2021 at 12:09:03PM +0100, Andrzej Pietrasiewicz wrote:
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > index ab2467998d29..8c3de31f51b3 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -905,6 +905,10 @@ static int hantro_probe(struct platform_device *pdev)
> >   			return PTR_ERR(vpu->clocks[0].clk);
> >   	}
> > +	vpu->resets = devm_reset_control_array_get(&pdev->dev, false, true);
> > +	if (IS_ERR(vpu->resets))
> > +		return PTR_ERR(vpu->resets);
> > +
> >   	num_bases = vpu->variant->num_regs ?: 1;
> >   	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
> >   				      sizeof(*vpu->reg_bases), GFP_KERNEL);
> > @@ -978,10 +982,16 @@ static int hantro_probe(struct platform_device *pdev)
> >   	pm_runtime_use_autosuspend(vpu->dev);
> >   	pm_runtime_enable(vpu->dev);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^
It looks like this is the pm stuff that we have to unwind on error

> > +	ret = reset_control_deassert(vpu->resets);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to deassert resets\n");
> > +		return ret;
                ^^^^^^^^^^
So this return should be a goto undo_pm_stuff


> > +	}
> > +
> >   	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
> >   	if (ret) {
> >   		dev_err(&pdev->dev, "Failed to prepare clocks\n");
> > -		return ret;

And this return should also have been a goto so it's a bug in the
original code.

> > +		goto err_rst_assert;
> 
> Before your patch is applied if clk_bulk_prepare() fails, we
> simply return on the spot. After the patch is applied not only
> do you...
> 
> >   	}
> >   	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
> > @@ -1037,6 +1047,8 @@ static int hantro_probe(struct platform_device *pdev)
> >   	v4l2_device_unregister(&vpu->v4l2_dev);
> >   err_clk_unprepare:
> >   	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
> > +err_rst_assert:
> > +	reset_control_assert(vpu->resets);
> 
> ...revert the effect of reset_control_deassert(), you also...
> 
> >   	pm_runtime_dont_use_autosuspend(vpu->dev);
> >   	pm_runtime_disable(vpu->dev);
> 
> ... do pm_*() stuff. Is there any reason why this is needed?

So, yes, it's needed, but you're correct to spot that it's not
consistent.

regards,
dan carpenter

