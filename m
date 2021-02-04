Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45DED30EFF2
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 10:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235280AbhBDJtV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 04:49:21 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16552 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233597AbhBDJtS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 04:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1612432159; x=1643968159;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=gd7QA4AWB7FA4i5Kbfgza5KDDdkv0s+nDA7bVYRKKI8=;
  b=G688CCKBaYLp0fgAmg+XZpOkKgXRfwKhIHiEOAPuRWN/gp7aTvivwaiV
   So14S/co7/Gl6elxLGlvLwFlMZFPlsoCh6W9lcj3jTTqQqBwmYsulV6p6
   lQWKyLpQiZdsaqAPeKmwja7cVQPgFrK9Op1gQ7IJfR3hqPTvKwd3Ni5Sq
   Sf1p4j4qxWZhwRhLp7+RMkmhFTBaXD515J5fMkmGLnE8IzhkOdvXOvEBG
   9BoqbrmdkyV0gJg4i23biurzH8pOQHRslLREle0YEahjxckMDP/KU7QD2
   zhGKjnRtkmkqDu1w4UkltYUnYiuide0r8CK7IyAtXHruwXIerk/ThqLgI
   w==;
IronPort-SDR: D1USvyEpXz+XNiou1v1kYGw5c/j+epb3+MiIwpBLoj4p2Zl5HovtYDbGx8zTYQbJRvAqOazaLI
 415rJYzbYxbQtlLqjcXDbQB03hYCnav4o/T5wt+69bR75tzND4gHMi8nKNB6KUZH5NL1ayl7cK
 jSbKKsou6HhFJ+73J+HB4t0n5/ez2tUvTvqM/Q60UgB+ieHUD5yyV5wCATSINQmbuY2rrOAEH+
 MOFazQMrdwvdRD5fPwTdcCv5QvxWaBPfjqV9g6B2N+EWpW5dv1TZKhvY8OdjIpyD0SWCZ8Ccxl
 YIU=
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; 
   d="scan'208";a="160290652"
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
  by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2021 17:48:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGgoeZ4mwyBp8/v9WGEwK3FoeMRuq+P5lr6IBNW6WrOgBx4BFcJIzMkJy1lYh2zjiWhlIRvDmpYyEBediDOVl29m2QElwMnH+LlZeeIFk+7SEdTOLt6rso39QSwUeC8QM+M7imJehGS50kdb3IkvxStxUOHJ31AuovAwUFnR6kOL0pwCJgUirhQfnPNhFvsmLvJXKv7pqlzj7SDaRqDXBqbK9FtO/L/sMLUwDc19oThRcR826vH1mxJJ49fUSM6j5erfz17SHp+917rcrVvp1y6qMDwnYd3iIaqfzKmoeCBYzdB4kNjjXBQs4oR4TkVfmC404Jy7y94MQrcKvQ5sgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHJVeHbj65VgWAEISnlLC1Sr4NGh+kUSEccQWdH1flM=;
 b=RbX53Ts3f/bzytKOZTwcmA0oQ4Ol3zDRXHD4HyOr44cUAxJiTgjzAmOQDOkQIcv0lsb8ldr6tSql7A1m4PKB3lyJeanfKKMupQNNQg9Fra5JGNRuI/dgHBdJbiglSk4NYnumUKnMjRHN2wG0dYkW88wUoAc+hW46M6JJ4hOfIagaQIiKblJftHqDfAV6lmlqQGuHcQii/MvVuR701HpT+Aw3jJq9y/zNwg3jdRkankGnqd/YbboJ7of1GP4NCkBxAHNvoXA1ubulT+jnocXlLhPg5A5QcQBhJbPGRchztCkW+D7yBIptOpt6fJr3dSZXk4Oa/anFH+ZHxn2VHyyYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHJVeHbj65VgWAEISnlLC1Sr4NGh+kUSEccQWdH1flM=;
 b=L/SPFNcvndGVBwdBPJ4EBJpSJcwLsOz6SGgeXHRQzI1ZQOUCnG4uIJW7lHVFKJ/XsB0Q/5fa82xtrKNfh/7JkgodWqy03TvKioBvD/W8f7cD0Mg44jMB4/FpqRORRFS69bWjR72P0jjwsoUthZYyBMVLDdXV9Mx03xUk4nHb0Z0=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4544.namprd04.prod.outlook.com
 (2603:10b6:805:ac::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Thu, 4 Feb
 2021 09:48:07 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::c19b:805:20e0:6274]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::c19b:805:20e0:6274%7]) with mapi id 15.20.3805.024; Thu, 4 Feb 2021
 09:48:07 +0000
From:   Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To:     Yang Li <yang.lee@linux.alibaba.com>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>
CC:     "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "dick.kennedy@broadcom.com" <dick.kennedy@broadcom.com>,
        "james.smart@broadcom.com" <james.smart@broadcom.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH] scsi: lpfc: Remove unneeded return variable
Thread-Topic: [PATCH] scsi: lpfc: Remove unneeded return variable
Thread-Index: AQHW+sijbzLBfbFR2kKjDSIaB//4Lg==
Date:   Thu, 4 Feb 2021 09:48:07 +0000
Message-ID: <SN4PR0401MB3598D8B3DDA6C490AA934DE19BB39@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <1612424125-91111-1-git-send-email-yang.lee@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.alibaba.com; dkim=none (message not signed)
 header.d=none;linux.alibaba.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2001:a62:1542:e101:51f:6b4a:2171:57e6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0d3afe46-ab52-46f2-0509-08d8c8f1f983
x-ms-traffictypediagnostic: SN6PR04MB4544:
x-microsoft-antispam-prvs: <SN6PR04MB45446D4B6ED14E46C792580A9BB39@SN6PR04MB4544.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4HB5RzVY7oLUyTyzku79oHw2GfhIU8143LXRN1LCXqEwDcocwV50a5k09eJGB+gGtl/hLqPf6neUNmXJ8FR6xUVpVG1EuQxmyeEJGycKXSujkEqabbq1Ssq0d84ejMdWPfS8e3+asZGUeeZv5dawRv9YN9kBr1HCmuhzu1nK7o37V1LlW+8ZkSdqUz+eyZ/aWs8oBu1tSrgllsc80S0rJApIN/ZdSm6rxENtcKdv7Twvv+tzXlI7ytg65Ett/71WWaJD0gssis/7xFSwXuY3cKPbR/TsPIDITX8Ki80e6sc+BNIyPiyXmepCNdlKCWrQF2lI+fS1i09bGCeDPtKq59PC6AsQDeZdzMNsu3jfHbJYpWWOypRfyU8fejtn0/8AtIcyJR293I3ijA+81qieuAqt0jHEhaiftuz81Ys11nqlYlAI1oUfLECrqPfuS8U9gZlWfFNwqkis92ZktSim+89fYrVnODvn+wILkN2v1hK4KXJZKAv7EeL5xo8BxTovyWYuhtLE9JdGEjkKI3Vxaw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0401MB3598.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(5660300002)(86362001)(6506007)(55016002)(8936002)(64756008)(478600001)(66476007)(8676002)(66446008)(33656002)(66556008)(91956017)(76116006)(7696005)(52536014)(71200400001)(7416002)(54906003)(53546011)(316002)(4326008)(186003)(83380400001)(66946007)(2906002)(9686003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SE6Wl1AvA8aEx+i6RTMA3eqLzkYOA/b8rn0vli6g4ViQ3T39wS5iT8Zq64Ob?=
 =?us-ascii?Q?v0NQwJ3/p3HQGGRxp6dNeNzkDwknfbu3FEEk0+TYT8LX7+//R27M6MLgH/dh?=
 =?us-ascii?Q?39N6BGz8vB7mVr7hDA5y/PGCMtsYFrgemP8tnlXNoI+xAgk5ft7D/XW+dmFR?=
 =?us-ascii?Q?tc29/4u3UsMy9BxTUdMWMMtPydmbdTJ/eb/BTkwd5u+TM1A9+vWMxQCfbfZD?=
 =?us-ascii?Q?x/UDwMFJmTxE3gSd8TBo5GNrCNKvqaIYv93zAkuA+vcXjX9a12tWDl2QFfn8?=
 =?us-ascii?Q?B2H75GLCxg3ofdB0LO9YJv5G3vn8uBjljZ7LsE0ynjYq4ENJm4EmXXNBUwrX?=
 =?us-ascii?Q?qCs/AjZbo+P17G3PiipwEx1OaRncAiGgM/8l2YOOJwkD4JwP29X70bFhvZWx?=
 =?us-ascii?Q?YmApW+ynBS8ODae1+mCgW5X6On7spgMEoSTpeLQdKPXMox6d5xFqLLYrzO/1?=
 =?us-ascii?Q?LsOKS+ew0n0aZE7AxMG0dRC/mIfhtb2BnCji3kThbc/m1afHuVLjLzOGNmVL?=
 =?us-ascii?Q?6/2abUfhGB7x+31Dhp2DvESoZk0saYtb6CDLmAfp8jDr2yAgDMLPQwssK975?=
 =?us-ascii?Q?bLJOT2nFOdCucCutCCTxUEH2BHJGHQtBzUEEYdTSMc/Dr7RGbI4Ztk6oXAnr?=
 =?us-ascii?Q?oomc99gEmJH6jrhYBVbnPRTSz2ZRD3Xzb07P1wJP0+I8swEYD9wlYCinMIbo?=
 =?us-ascii?Q?Pjt5VhVOeX1KTrfyIo6q0/tCI5/VSNTNLI4gjcfl8EndQN5jFGWJ6ydrnLlL?=
 =?us-ascii?Q?7Av3nfdiiku2EsD8m2r33U5N2sE2emK5OjUUf/T00U1ZpU8JasEL4FKVQi8O?=
 =?us-ascii?Q?zvhwgV1KLIizdtXFwzlAIvPFkZZFzJr9U7kXP/0oaPYv3BIXnMyxp9Cf5kEq?=
 =?us-ascii?Q?DL1+9hp2+8SPxlAitf0iTn7pgd34ooWLkiF0aiiz0AdSnm/QXOEh0lvHd8F4?=
 =?us-ascii?Q?6zPJGJ3jk2MyhloXxMI6hQyjnDKx0pzzy1mNpFUGhLnfau3viXwrK7+G0hPz?=
 =?us-ascii?Q?rkx2+69fbjlu+yusvM/DfCYvjFl8BVCI3q8O9Rny8KKZTnDYl3OXAqbv4LOC?=
 =?us-ascii?Q?O3qWCIj1oyKhqt40N4VonYvq/KvhHPTNd+4AY1twgFz0XnPM9XahpRPMo+mK?=
 =?us-ascii?Q?v+iXw/PkuWyn6a4E5wwONFV6XWyd9JGw/A=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3afe46-ab52-46f2-0509-08d8c8f1f983
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 09:48:07.0492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jhALLuAvTikj9BwS2dN5/SlBFdKxC+wo4wGmh6bM2U9tlWBwo7Fua2c7Rmc1GDdk0pn7qOxMwPpLHVogh3QCsJqPSXqmoF5yk+YfRLKYb7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4544
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/02/2021 08:37, Yang Li wrote:=0A=
> This patch removes unneeded return variables, using only=0A=
> '1' instead.=0A=
> It fixes the following warning detected by coccinelle:=0A=
> =0A=
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>=0A=
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>=0A=
> ---=0A=
>  drivers/scsi/lpfc/lpfc_sli.c | 3 +--=0A=
>  1 file changed, 1 insertion(+), 2 deletions(-)=0A=
> =0A=
> diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c=
=0A=
> index 95caad7..31f97f6 100644=0A=
> --- a/drivers/scsi/lpfc/lpfc_sli.c=0A=
> +++ b/drivers/scsi/lpfc/lpfc_sli.c=0A=
> @@ -3376,7 +3376,6 @@ struct lpfc_hbq_init *lpfc_hbq_defs[] =3D {=0A=
>  			  struct lpfc_iocbq *saveq)=0A=
>  {=0A=
>  	struct lpfc_iocbq *cmdiocbp;=0A=
> -	int rc =3D 1;=0A=
>  	unsigned long iflag;=0A=
>  =0A=
>  	cmdiocbp =3D lpfc_sli_iocbq_lookup(phba, pring, saveq);=0A=
> @@ -3501,7 +3500,7 @@ struct lpfc_hbq_init *lpfc_hbq_defs[] =3D {=0A=
>  		}=0A=
>  	}=0A=
>  =0A=
> -	return rc;=0A=
> +	return 1;=0A=
>  }=0A=
>  =0A=
>  /**=0A=
> =0A=
=0A=
I suppose this is in 'lpfc_sli_process_sol_iocb()'. It's return =0A=
value doesn't get handled either:=0A=
=0A=
                case LPFC_SOL_IOCB:                                        =
      =0A=
                        spin_unlock_irqrestore(&phba->hbalock, iflag);     =
      =0A=
                        rc =3D lpfc_sli_process_sol_iocb(phba, pring, saveq=
);      =0A=
                        spin_lock_irqsave(&phba->hbalock, iflag);          =
      =0A=
                        break;                                             =
      =0A=
[...]                                                       =0A=
                }                                                          =
      =0A=
                                                                           =
      =0A=
                if (free_saveq) {                                          =
      =0A=
                        list_for_each_entry_safe(rspiocbp, next_iocb,      =
      =0A=
                                                 &saveq->list, list) {     =
      =0A=
                                list_del_init(&rspiocbp->list);            =
      =0A=
                                __lpfc_sli_release_iocbq(phba, rspiocbp);  =
      =0A=
                        }                                                  =
      =0A=
                        __lpfc_sli_release_iocbq(phba, saveq);             =
      =0A=
                }                                                          =
      =0A=
                rspiocbp =3D NULL;                                         =
        =0A=
        }                                                                  =
      =0A=
        spin_unlock_irqrestore(&phba->hbalock, iflag);                     =
      =0A=
        return rspiocbp;=0A=
}=0A=
=0A=
