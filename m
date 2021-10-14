Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A90CE42D46F
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 10:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhJNIEh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 04:04:37 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54894 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229970AbhJNIEg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 04:04:36 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19E76ZCX022075;
        Thu, 14 Oct 2021 08:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=z+kMRv+4giIHKsqXF1xWTY0i0YjO9vkzxam9dPMOY9M=;
 b=IrhwaLnC5GrxU1hBi/LHp7xIIEJqbYIkbnt4fwOZCShtwT8sncMtXZ3xMxU05pjABApe
 bSf37e2ilmaM6UE+zMNpvch5t+sSSoNp1S/0enSlk+Ou1upEBXBT2Bg8R4w9k/42uPzZ
 oSn5r/D55zu5N2WgD41H6WxQ9LkoGhR26J0cGlXtz2Q577dYq3QFyA4tKvSxCuOWNFuT
 /Kji3v9y+wKqPMNMDsF+ChfOGkNq/uqCQVHYiHLffRI7OwMG3lcQc/zol+6bounfL7oc
 ffeJPFkfxRDZxXUrTvjyflXaL/SlcPJdpr7As2+2fN3Bc3JcgMof13XamIg2d0Mtm+E3 qA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bpfve88s4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Oct 2021 08:02:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19E81Dqp013447;
        Thu, 14 Oct 2021 08:02:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
        by userp3030.oracle.com with ESMTP id 3bkyvc8r0x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Oct 2021 08:02:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKvhVlnnRdf+qbfWg34UM5PvRVYnu6UFifR+HQvPZroIHFRERKo+jwigRnrZAyZ0/I60Hgd9W9DRNKGKUmEzJUVqhYOt1RhF+ZAuJA1fPqi/XCtSEmbyLQ+ereZLQJ6ilNEsIMB1Qo7AsTZyRosQE2RSABXHgJ2ZOvkiZOVHPrKTnsBQ50FMJQPHTDevEri9FJ2RspGMbxd4sdS+wV7YSSAXoVHtFs1ANg3AV5PBMKI/bbmvk60YhrbrBQqL65IjSekkBOFgs0qDbasjS8MXIziej0eRvcNzVf9MGTjBHYQp5xgwDHlGgZACm396K9YPlBWnKt3RRwu0ChkmF8bGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+kMRv+4giIHKsqXF1xWTY0i0YjO9vkzxam9dPMOY9M=;
 b=mBMRWq6IVhLaZ4YOcMZfC8+1ZBHq+dJPJ8iEOc6GyiEQHw3mM53ZW0tVexRNCIYUvqOZOtYxOrJFtty+/LRKerS/qdJyYXqOr86Gjsi4duhmANhTWT6oiW+WcSaHGlmqu1Mn5XAxG2amLsXJ9/08JBK3OCZT34Kc44+DyNty6j2g8ZURR1vdcCjs4Dz1ZKIsfNKYjWrdAiZZnZl9D9C3A1wVdKqUtXuux3VcCHLdL805YHVDSmqF7MMVdf8Rxdqakx7fRexH5Afw3CUHLKQxgtPlA+4Llx3LXMCUlaDCh5lYoydVInU1I2p5YNrEx9k2R1JfposKKQJJO+0IiySAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+kMRv+4giIHKsqXF1xWTY0i0YjO9vkzxam9dPMOY9M=;
 b=fVULzOh5cKVRvqUEWOc96YbU3v8BIPx1GOHrCbVxBbIo7h+UCNjOhBEDb+cc+ywZdu4s8fRLQZ4ab834sBz7XCpRFX89oIUCyaMm0OXfIfxoaFDj2uJS4wPwLVJGpAb1aOhL99fKNnZMdWotpalxGPmAvuF4M6fhlx9QQCmdNvM=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4499.namprd10.prod.outlook.com
 (2603:10b6:303:6d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 08:02:14 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 08:02:14 +0000
Date:   Thu, 14 Oct 2021 11:01:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v2 06/10] staging: media: zoran: fusion all modules
Message-ID: <20211014080155.GY2083@kadam>
References: <20211013185812.590931-1-clabbe@baylibre.com>
 <20211013185812.590931-7-clabbe@baylibre.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013185812.590931-7-clabbe@baylibre.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::25)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNXP275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 08:02:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a391f19-aa9e-4f78-5bc8-08d98ee8ee82
X-MS-TrafficTypeDiagnostic: CO1PR10MB4499:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4499DF751D2242B8B7E4495D8EB89@CO1PR10MB4499.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O9Umm6LPN1Ejy6yzCVQG7jliMvKkDqDUkmVEAExigYn1R8u7xKVQP1zKle7Oe40M+7Fq7pVJla0I+SWyi35EzSbsheOUSbg4MINiXshMEeC5Tzf8kuQlXtW0REISNUmK5dC1FbZT7n6CIPftqQK+SWwGLEa1/D8XUXHzFlpr7jQFncJZPvl/Lpw/ikh/10R6W3/PzPfoR4CCMY4Ntm0gHDbtzqfTMP4eHbwc+HZCdJ8pxJo6XDxCnQ5MBR4pNyCCaD/WDU5r2I4yNH/ZWMGF02s9Z9kyMTnI27JUevFhgNvWbP0tYL6paHfJ/LomXCxr4W8KndzSw9brhZcyH/LtKqicjXL06bYdgqTcWn3Vt18fnx6cbdrOWkp5BXKg25ay0edRCP2XhvGfHUiKXnlEZ56OjmL44BgVSivAoVdgg96+UldGhkSR1Ju2Z9++/LVuKdC4uQPBGyZJupICb6yPf7rjjqd5l2Xkjq8wY5paJlqwEoSAf6fvB3JeuzfdmnSSHukHLlPgF3cokcxcQhUxWzVvssOgn5dM/nawhCD7cz/FV/0+Ez3AwxJm0cecyvLE5jTg4nfcYuDMGouRIP/Q1/fj2v9ItyibsRm0XvNoZbR4vCdQwfVOzRGHsvk7Ro2/AWx/1MQUd/vmbonvFhuHi1tedrm4PD+fNXlCuBiBxGQiiHCL83p9v3VezfJMYB6aqyLvSlryUuZNX/wRZrUl4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(4326008)(55016002)(6916009)(186003)(66476007)(86362001)(8676002)(52116002)(5660300002)(33656002)(38350700002)(8936002)(6496006)(2906002)(508600001)(6666004)(956004)(66556008)(66946007)(83380400001)(9576002)(38100700002)(33716001)(9686003)(1076003)(316002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LTB2d79VWz0JFBg6SdgFeyoZYQLXjqlb6mdq96QiA87Um6oRJ7dP+3HrceaH?=
 =?us-ascii?Q?mHPi2R/JjrTTTHXm7FJau60PsqP023YV/JWMQmXu2EK/12Y92di2S8Em51Ds?=
 =?us-ascii?Q?KUSofulXx34UZFRJjQFTNg/Q0RX+h4OJtSUplEP7d8zwpfA/oltsgCO+X61N?=
 =?us-ascii?Q?hBmsa6iXD3ZzMb7qiWZaO4DNser3D7WlBaAmhwsC5D9YOzpY9ADqOJWD7WC6?=
 =?us-ascii?Q?lGvhI5eQBthyEV5MpXl52jOhKCKmdrVYzTdK7W5YgOU6q4EFiBISsXcFIBPh?=
 =?us-ascii?Q?PoKxG9uEaZdp2djoCSUOFKDnKBMmNd6PeS7cjIxkBKNOKs1HfalmZ7sv1df6?=
 =?us-ascii?Q?1XkKYjEf1gL4zuAx2bKsd/JWib+07PK1G4OvVMNX+sczolWAeGzC6CTTrA76?=
 =?us-ascii?Q?rSDt1wk70g0gN0iSA6fJz5COdjFfHU38DembebRJH27VOWZPgWzGx64x4gvP?=
 =?us-ascii?Q?A/uYULfkHi0/bcB44w72C96lztktfW9FsaABoRDOtgkX+3eza+YmYTVmJ/VJ?=
 =?us-ascii?Q?prrxh8yH8lMhupm/yApu+vp70AxCXNeGvVJnmz+oGUIhT/rvHy6dL2TvpBQS?=
 =?us-ascii?Q?wpHcLVT+q8+Fzdi8wENXkvlOgEaFm7KO5GoxPBSktvK3ej+shRcmzA0R4etz?=
 =?us-ascii?Q?6zfknoPiBnQsJt2DBylCfoFBC6xNFo3nij2WBh3lU2f37A8WLO9z87OPV5xG?=
 =?us-ascii?Q?brEzKMWmRWvLoMhX8rSW1kYm5lNeyGL5y2gdtRBM52ryopZ9zPCbnLUkI8fO?=
 =?us-ascii?Q?LdSRqjoI6UxDNwbJmmfx2rpwDNe33AycUCvXUyhSKEZpiZ6UDSpN3tG9bh7M?=
 =?us-ascii?Q?2T+rLg641N6dg5gpkS1TfvBoowEO+lomSHJbzIdqXOLaa1ASt/Hsg/BK1bc5?=
 =?us-ascii?Q?B6f+tIczEjn6DpmOt3dMXCpvJfBij+OpotDwST+q2kNof6fXiTvMpa1xXxH6?=
 =?us-ascii?Q?GEdcmUjPgohaneOUWGCboSyNyd7zpsm+EeK4W7MJazWT0NBGYrykWfAWn+MR?=
 =?us-ascii?Q?lgxX9lUYbvpYXiYAFWKtWRcu4mIRNZbH26c2WySjsNh9Mjg3IoPxcPdmeumd?=
 =?us-ascii?Q?USoZcxmCIhpnxgtwe1AR83nol+TpNz2deGLJ8Y0H0C6R6IakzslF0wify+P1?=
 =?us-ascii?Q?azYcojIcUuefJtwINlMM5DJZowfbysToH2db79r422itJ0nCdTY/W76FiUiA?=
 =?us-ascii?Q?8s0iNUXpMglfoBsdbQRTX9tPsYqDEmeJ4JeXOqWTw3fobg/fp0jeT5AlPfFF?=
 =?us-ascii?Q?Zj/mPilLMI6b2d1/ZBUJCkeac2nlPzDs2hTdVHZrPAiPXwi0InuYZV9C1Frg?=
 =?us-ascii?Q?MvcuCWo49C4BGXZ45gXhS9VW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a391f19-aa9e-4f78-5bc8-08d98ee8ee82
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 08:02:13.8990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vh1c2spOEdvRKCG9hHJRvfU8+uOB3ns8nZEz/xIta6JycNF4OrQ7gslFdmv4i4i2reLKSnKQTeq0kwlKMoLzgYjA4i28IAW2/sPCdbjnOrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4499
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10136 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110140049
X-Proofpoint-GUID: 3ADVDoS7fvwS0SwbAC0vADkjX1hCPcdh
X-Proofpoint-ORIG-GUID: 3ADVDoS7fvwS0SwbAC0vADkjX1hCPcdh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 13, 2021 at 06:58:08PM +0000, Corentin Labbe wrote:
> The zoran driver is split in many modules, but this lead to some
> problems.
> One of them is that load order is incorrect when everything is built-in.
> 
> Having more than one module is useless, so fusion all zoran modules in
                                             ^^^^^^
"fusion" isn't the right word.  It should be "fuse" or even better
"merge".  Same in the subject.

> one.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

[ snip ]

> +static int load_codec(struct zoran *zr, u16 codecid)
> +{
> +	switch (codecid) {
> +	case CODEC_TYPE_ZR36060:
> +#ifdef CONFIG_VIDEO_ZORAN_ZR36060
> +		return zr36060_init_module();
> +#else
> +		pci_err(zr->pci_dev, "ZR36060 support is not enabled\n");
> +		return -EINVAL;
> +#endif
> +		break;
> +	case CODEC_TYPE_ZR36050:
> +#ifdef CONFIG_VIDEO_ZORAN_DC30
> +		return zr36050_init_module();
> +#else
> +		pci_err(zr->pci_dev, "ZR36050 support is not enabled\n");
> +		return -EINVAL;
> +#endif
> +		break;
> +	case CODEC_TYPE_ZR36016:
> +#ifdef CONFIG_VIDEO_ZORAN_DC30
> +		return zr36016_init_module();
> +#else
> +		pci_err(zr->pci_dev, "ZR36016 support is not enabled\n");
> +		return -EINVAL;
> +#endif
> +		break;
> +	}

Not related to your patch but if load_codec() fails, the probe function
still calls zoran_setup_videocodec() on the failed codec.  It might be
better to set the codec to zero?

		result = load_codec(zr, zr->card.video_codec);
		if (result < 0) {
			pci_err(pdev, "failed to load codec %s: %d\n", codec_name, result);
			zr->card.video_codec = 0;
		}

regards,
dan carpenter

