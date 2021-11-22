Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4992B458E86
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 13:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235000AbhKVMlz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 07:41:55 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25700 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231258AbhKVMlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 07:41:55 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMB4rmI019937;
        Mon, 22 Nov 2021 12:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=MIP9ViCfJiRJlERkpcJYHDz4xnhv3FSw7bF6vJU/dJM=;
 b=KGhYxlK/zXjhfjifyjxN8D16hfo5+0aMkefbcXuxp0aMbihoGBveo+R0KZmDhshH237N
 XfryUZj21EcQft/zZAwv9ugjEZab+bTg1B4qg7oIe29/0eIZ925cgvRazCpa9gNnq6LE
 YU7O/clwfbrN4u7TbFq0OAbxp1lKLU5Ka3iQY3cuV+1z+otKypHnPvOBpJzdu+mR9iE4
 G/4H/Q4iKtdtJc/Lqu0aZoQrVVT5rd6Ca86Oq2GxxLtdgUzFXR7ULnVkiWsdBn67OhXh
 eZfEi/Cq1pO/DAGSCAbbuNaYeLrpYlII/vCWNxGgOe73Cy/bZ+SS/gAJcuWwySDSD2Rm Uw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cg55fsrcg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Nov 2021 12:38:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AMCVbE9012434;
        Mon, 22 Nov 2021 12:38:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
        by userp3020.oracle.com with ESMTP id 3cfasqkus8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Nov 2021 12:38:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqEok6t0UOgxHKhHay0ifDxWdMouc97XaxVg5Q7RVcPz1CoqmoPMmRLFoDlQWf8ZL7xF/IsPnNZyCb0qjvMSFB0mQo7OtxvWYEuTVr/fzu/MXjJMe0DgvMxRSjMgL4s+RZ7x2aFnLgRqy3N+6XuIIh9f2hJ0r2+cg6MoDNyfJxlfj2xcMCqgMxisJTQmKD79LOeG3yGQUXWeHM585mG/MkvXRRsXJOOc1R2yatjvO56AKY/0kUZIqa67Ey41QnVGTKHbxysTqYzREjvCLsLc0KMVKbJu4bIEFZ6Z57P0vr1BU3oe/eGm03F93NUbk5gRvIFXHgDX6BvUcASKXiFirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIP9ViCfJiRJlERkpcJYHDz4xnhv3FSw7bF6vJU/dJM=;
 b=NedYoQYDGzCsAwPHcX0KM2l0wCI9X50x1huHzwmB4XJbVO97SPOlrcrDxh3x0RojyWCu4/bJsZTJB1MxPc24mcLbhw+S2wG5H9W+Et/zSmYOUUNy/3bkKFxhrz1Y/dy82y2IC+zEnEGJnqo5lpwfP6Lhf7ZfPLHkPogLFh6vh61SCC70pTwgY2sXSGzEzEcMP6k2KunZRJUerF2wMQv7dm7RM64htyTR+XuUxaBG3E5MJ5PT0inqdEPqIwqPeApteGzaSrMd6QMJRcRqsYuwALDJHvp6FLvPm4w9ZZruSWdpf58/ssftKwMPd21JbTvmqXKgQxyKINL3izh8ADUxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIP9ViCfJiRJlERkpcJYHDz4xnhv3FSw7bF6vJU/dJM=;
 b=onZ7KaH2pp1DaaQIrDkf132jz49KcxFlukVCTbA9KPUdfcGaNVfbOi4Rpt3lYns0Jasq1fU+rWo+QZyIXh6ahsFgfE0VtrNgKX7IQQKWRS+ho0xfyHTrfiJhAwXxkRPA9R+owrF5EkdQ1tr7xpU/o1rgi1QfBLNDN7YV8JswknM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4466.namprd10.prod.outlook.com
 (2603:10b6:303:9b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 12:38:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::495f:a05d:ba7a:682]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::495f:a05d:ba7a:682%6]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 12:38:31 +0000
Date:   Mon, 22 Nov 2021 15:38:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Kyle Copperfield <kmcopper@danwin1210.me>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Dragan Simic <dragan.simic@gmail.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip/rga: do proper error checking in probe
Message-ID: <20211122123808.GA10517@kadam>
References: <20211120122321.20253-1-kmcopper@danwin1210.me>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211120122321.20253-1-kmcopper@danwin1210.me>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0002.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::14)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNXP275CA0002.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 12:38:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34c251c0-71f6-412a-21a9-08d9adb4fde0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4466:
X-Microsoft-Antispam-PRVS: <CO1PR10MB4466DA358A3594190EFDD6F38E9F9@CO1PR10MB4466.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H7NBuorF1xj5w8z4hD1HFo9hCmYK0mRX1c1Aw1xlISLrMG/ALJqDI0tI3r1AYC9B9f7X+iPjOPjwMSs7KMNjL1tHRaNC3/+UPoJZY6XSxph18y+9pGAB8iA9WIuj4v8B1EgjXU+kO6Yxd+zWFW0fIJjhpaQQbPzXQGvJ0MS39GaR4SwBaEetgKKgdNPD/hT53dpXk4a0PUTFPhu7wYKTdlaNt5b1WiLEz9odrYZPIDsvrjgfV18o6rnf2UIrbspyXT7zUQWCiUyBkLJORvYIbYhLe3EgvQYgEXpnp9dWk3yGjVbgClisZnZ1gRQcjQXXlg35o2Vfnst9LUxtlO5frTgpttaDLjSL/AeRjpr0khoEosoNkJsCn+qhHqpFCiyBEP6bmRV55yVhkntthVhDs+kHDtoOoNqYlCG3Wfc3qafVrCc1dFb75TaOdZM+4OCNF7j2PFCGuE6RysCHmoaP1KfL/mTykjIlf651HOKoTuRCaSubjlTgirFAeWjciII/n7OXg5bEqK4ijLUl/Vep0gW0zAsl+3lrdWvvgme/zJCN3eUbjczW459Q2M53ASWKLJfzoxPGtAJotAb2NjGM7ObdaSpjVikCvFAjk2EuPYvpaxvjbUyVQYD0it+58DmsdCW5a/faKSiPeipo3n91LqLcrCMmln6E81piAr3qO+McSbxxfWfQttaILtN8H9haLFdyZ3hQmlZVo7HgKXD+hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(84040400005)(66556008)(5660300002)(26005)(9576002)(86362001)(44832011)(52116002)(55016002)(508600001)(1076003)(4744005)(9686003)(66946007)(66476007)(6496006)(316002)(38100700002)(6916009)(4326008)(33716001)(38350700002)(2906002)(83380400001)(33656002)(956004)(54906003)(8936002)(6666004)(8676002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MN74ESixKKz+uMlsB3nNfe1oazTR1x9loLof/uzGDQQVx3Ac7vvGzooIlvQ6?=
 =?us-ascii?Q?Q7KQcb1FRAfUhdyM6cVJMyL4CdsuvurekhUHkza0EnPkour4cMN5Py3xGD+Q?=
 =?us-ascii?Q?hhrBHZ6X3KFhhb5Ext2bmhMG70311+u7abFcAsyEW839JklYrQHak6JIN+pa?=
 =?us-ascii?Q?/W6GXKy8CNmxFJE80k28vzto5HeaYvQYYPLDSmUG/sUDW6ZRi3k0FDu6n+OS?=
 =?us-ascii?Q?xekTAVLs/4c3odz2YLTTh42fUTGu6z2P4sWNoH+2UK5sooWr+1kNM0lD0FjG?=
 =?us-ascii?Q?b56CBKItKT4H8iAvYRMa+fF2lq6ZRkGu4wSfA4cVJDm+9qkYDpjyXuHVw0zZ?=
 =?us-ascii?Q?iHnxOIeUWVBHRrVEuKaCG6rZnV1gpLhD6xBpIsh4DNsvYslGEJyjDFr1iDlc?=
 =?us-ascii?Q?ZEbBNyA10squlXixReqqXPhPlWsU83lYQBn7MLEASo6OPZSaXEH/wdKRAKmF?=
 =?us-ascii?Q?pr3K471pq+2NbC6N0HIRO6xX2nXyEZ7swJqT2/ZgFRUt+DYlHqcawsiuPdyr?=
 =?us-ascii?Q?Qufdll+LRd5jIISXxVygL86vQ86JZdUJUuWLiAcy71cTAQgbSjbCfIQkjiwU?=
 =?us-ascii?Q?xuCGdqYsIkHEnVYJfoGyjDtH0WjB9TbJ2EVz0SBbvZ10eB2X1JEpKy32DNta?=
 =?us-ascii?Q?bINryuW7BzRPihSKy/oeAA8+suWpEed+HmSFwfbWM5nAyfsZnbM/wGkwiD/9?=
 =?us-ascii?Q?aRemxUQQ3dmgRaJE4zH0CrfmvgmX6nnFBcqnYmZnzn3UMkXQlK9d9+IDxnbI?=
 =?us-ascii?Q?uSon/qiIsRars7EV7B0WRhi8hmT7DGuCtvejMNKrYf/c6M6JA2dvNGmUX8M2?=
 =?us-ascii?Q?g3s2LNPW6IOKKRDZaP2tsh2/q0Q4iyVkKy0OeIeTBly321dSX3teAeXchOq5?=
 =?us-ascii?Q?R7/0Tnynkvj0bwuOkkGNwZN9EA1o7W8J5KA+H69vAMyBr4gnTMxRZr39mRtC?=
 =?us-ascii?Q?/AsmlQjc7gftS98noZbMxv0ZMR7lnmCEDRRHLcgqyVTImreD86m4d8kDQJza?=
 =?us-ascii?Q?8xH3NeOhmQk7BtaiHv4iZqdGsz5qlDoOi8U3s6PxD+Gqm6iadbQC57ECMi3e?=
 =?us-ascii?Q?/faNItGPFQGVJOJcxX+50Y17N8WlDyXZRGQoNO/dF2WedRpYLuOA3bM35l+g?=
 =?us-ascii?Q?qe06zSVcU6IYFAj0TtdndC+W6VhQwgevIER2BYfN3wb0LK68P6hjqbbd7++w?=
 =?us-ascii?Q?kTjFRb40P8D7RMo0a5mqbbKewBFIxsE2BXuME8y71P+SgIPz5f5h/VvvL9b1?=
 =?us-ascii?Q?St1oLWV8cnKDdh8t7FGRQbDLRBcc+ZWvjZst0QdzuBNqNDRFWJ0fyGNRWfm6?=
 =?us-ascii?Q?bD7CCofl/n1/UUmhPNVUIkVv2tZRdT8u4G+1814VsaFlzOK9dws307IZadTh?=
 =?us-ascii?Q?w24bd5x/aNPH+wmvtj64+l7IcqIAeLSiecDMIsGZ5qDnphPAfNsMmyyTb818?=
 =?us-ascii?Q?5N8XQN+ayPdVXSkuAPV+3kasR2e/aWEer210cUHUILKV+q1Xg2a9O/1p4NSe?=
 =?us-ascii?Q?BEtR6KI9y/Ky0DramQiScB+FQg0rpnjL1ZcpO5zVc076o7THDd8QhjDrBzr5?=
 =?us-ascii?Q?kMVva5ibLLqsQrxtAEnk/Wc3MgUTCiI7+S9mZYWAQkcCSM18zvin9HTHIDQF?=
 =?us-ascii?Q?ozBOS+rtwr756j4amNWRxgleMbR2vSvG8hBWKNFraBtgdIHMkn2A+7cioDbw?=
 =?us-ascii?Q?78hvHF3aWqwsTcRIi+KmMlNMNlg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c251c0-71f6-412a-21a9-08d9adb4fde0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 12:38:31.6207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG54RWLNrDmH7jKZ4Y+KVPmVOaUzb/dHFH0KVzoVb5KfIhvq6e0/cSdzXr6ev91CR5XmwllTZiekSu+t0LDXtOFSbQZp3RThCXvxTogZjEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4466
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10175 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220066
X-Proofpoint-ORIG-GUID: fBigvzEa3AY1aPwfr7ZIuMwFGu9GNUM5
X-Proofpoint-GUID: fBigvzEa3AY1aPwfr7ZIuMwFGu9GNUM5
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 20, 2021 at 12:23:02PM +0000, Kyle Copperfield wrote:
> The latest fix for probe error handling contained a typo that causes
> probing to fail with the following message:
> 
>   rockchip-rga: probe of ff680000.rga failed with error -12
> 
> This patch fixes the typo.
> 
> Fixes: e58430e1d4fd (media: rockchip/rga: fix error handling in probe)
> Reviewed-by: Dragan Simic <dragan.simic@gmail.com>
> Signed-off-by: Kyle Copperfield <kmcopper@danwin1210.me>

Sorry about that!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

