Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3164497E3
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 16:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237112AbhKHPO7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 10:14:59 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38808 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240985AbhKHPNs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 10:13:48 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8EBiG9008796;
        Mon, 8 Nov 2021 15:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=QY6sqTzssx/X/D0tmHMsqA6XVgijsAMt3BuJ4jkbUsQ=;
 b=SsvnfK98zSvr7CObrPYAXLUESd++ZKO2hLAZTwTb2X5RIEngxPAXKi9KufDuS4CyInK2
 kjLroZAoe1LA5SeZB/FrMRFZ24flbRgQJIZuRrwBS0Qu1hSBnH6Dv4xtO3HHbhx2Nybs
 JHfsmWz656/MKsjKLgYM6bOAhfd+cXNjE34bZsG5HsGAk5jAcs+7TY2W1cFtX1L4UjHU
 L8FFI0uai9FJFaH9UAjPg6ekCsOhAfvzYF5X9N3lxtfVzk+c9Q05r/0hGS7/kEgbTGcn
 16DLDI1oqagUspS+PZhGkEXu3Y+m/yD1hXURzWhM2YEcWhZrOkLGOmMKRnfoO1YQKYTC Lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c6vkqufjj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Nov 2021 15:10:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A8FAaZM122488;
        Mon, 8 Nov 2021 15:10:41 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
        by userp3020.oracle.com with ESMTP id 3c63frchww-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Nov 2021 15:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQf+/82N6cFHWsdOUAVULqhQcHnJyLbCU+ApulGfjySGitt4OcZnH8VW60fiICkNT3C01frEZ+UsaLD/2N34pQS3QNs6iAkxTTG2y5Pu5J68OET9sjznB5WQ4dDsOmMQQ2L+p1XRR/hFujsCjf5PJed0UITnXJ8e11J9oWoD0Ts8tYzrxxHDk0/kfH6C2qQnwSm7TTeK5LWuQHc781huKocBSJutUMy8wm30Dnu0KFftq0BmByrjUv7VtidiDFTAJTq9H52b3FR+DSAeS+3qPnGMSFsaTFI4QjgavS2fC0O27AMJjc5iZUDfY3nDGvi3D/5xU3+Bmscmd5i1Z9ah9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY6sqTzssx/X/D0tmHMsqA6XVgijsAMt3BuJ4jkbUsQ=;
 b=E5IaRdiw0YDwiBPEkpkS1Pz9pAEMpHgG2U50sRzZjGbJVS3rDglEQdU3ms0y0QVMzCtfvDj2pHz2bnNtq5F8U91PnDPNwD1xhbUcjhTWkJdTi15jtLg5GQ4yOg7b/dwXDu293ssl3hhKRp3eQy74PiFHgGZlTK4cL6shD+2xQU0vyLZ3J+Ysx39yuGptiF/VE9F/3oqYRxq/lMZVCvA3nIX7GiMvN6N6dbMD0AqmGw1k5AX1FRvkUO8TteBD/E+eRsmG/8kQiW3K6WcIuwDURBwprzZ2rwdTQ8mTYSGVt4jqlqpv2n8EEAKmnjOl1tmflgdZ6IhFgAQd4G2IIQa9cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY6sqTzssx/X/D0tmHMsqA6XVgijsAMt3BuJ4jkbUsQ=;
 b=AciBJqKcJK83yEf8ykUXwBEXbyP3iGwdGpjB8+k43zGFfVaOpY9uMvZpGxEcMLq9FO7uyd1090eAZiMF8+UBbsBKmwGjaUsnZjB2X7NUuL6fBXRp/fJ0qXHhJOB74VenVGRszUVjIwgNUgeP63dELGrpJZfTr0UmDax8Ab0MAFk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4595.namprd10.prod.outlook.com
 (2603:10b6:303:98::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Mon, 8 Nov
 2021 15:10:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 15:10:39 +0000
Date:   Mon, 8 Nov 2021 18:10:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/17] media: atomisp: pci: fix punit_ddr_dvfs_enable()
 argument for mrfld_power up case
Message-ID: <20211108151012.GH2001@kadam>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-3-kitakar@gmail.com>
 <20211102112634.GB2794@kadam>
 <d5f00baaf993d28423bd37bf3f44ea43f226b6a6.camel@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5f00baaf993d28423bd37bf3f44ea43f226b6a6.camel@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNXP275CA0004.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Mon, 8 Nov 2021 15:10:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59ed3eba-6997-45c0-d040-08d9a2c9ec66
X-MS-TrafficTypeDiagnostic: CO1PR10MB4595:
X-Microsoft-Antispam-PRVS: <CO1PR10MB459550E194E31AABC5A2A80C8E919@CO1PR10MB4595.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GPcca/fqAaSG0FztJxvxVCSvRwyk3lQZjdDn28NI32FMhohmXTmu73oJlVjwSjhZPLMRETkKzD1Baa2VBluUx7JM4Mj5GO1aPitzUVdQP7qJej+NXQdezVGxQqBtW/j/7MnZzLZ9zFXtmuCdoKfRTI7n+Y6biewmQQFMfOGo+PzBoTdGynX/CzV3Y1i96QUMtl4tx49brIcFEYv4pLUv8yPPk/AzpwowLvXR0GDOAH//KCJwVdikvWg2zz6uPKnm0gvqoFblUuNmJywimuVXWt+VWxSWr6H4geofN7VudLnzLVxx1tkRic7BG6yjEp3OQefsJBpvHktN04NIaNpCfU89ZTCAQGwSccOU/635T9NTIGQvVt2Dh9kcoqFuag1oyPV5JwXmQRwCVPnZ9CjlREmlJDvS6p4c34G+ZPeLY9uJDZVK/tfHVOjuTJki+WWc6Z5VITfvxzV3qCS3G2IOviyaOAqNyo4/a9sf5TC8pLqJX6tTwu0b3mLe4b9Lx1208Pcee2JWJprfctZuPP+NW7AP69gbJIdyNGFkHYG38oM/T+RW/Bm1+h/6WAloVv0hPMUYpws7NDLhG2ej0kIZkt7Gea5wVPlOFAwoRGOi4oO26LXK46Gn7vODM+dK62Opc7fqn0bbo2iEmrSXVzhao1b9RsDsFT2hRHCNadYdSto2v81rRw2sBnvpggkCJeAjws4XIpp9X8y7flvoTfYE+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(52116002)(38100700002)(38350700002)(9576002)(8936002)(66946007)(33716001)(33656002)(6496006)(186003)(6916009)(55016002)(44832011)(316002)(66476007)(5660300002)(54906003)(8676002)(6666004)(508600001)(2906002)(26005)(1076003)(86362001)(9686003)(66556008)(7416002)(4326008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7gU9L8cHXoUVbnvbrhsEcPQnH9eWUOwU4TKDccuK53Ppk1R1KsCIId/WpRNy?=
 =?us-ascii?Q?Yvk4Bwco9YukRjVMye37AxW1yHkE6dplXW1WJlEXWVcIgwXz6WP29bbAGaQ8?=
 =?us-ascii?Q?iKAyA8hvJkstl58ypY4nzZ97JpbZvr2SyvRp5CbL4cRfwUnSZZ69iPETj4vl?=
 =?us-ascii?Q?UaKmIGkXoonFk8TqvRHT1N8upIVXUMrGlWAw2MCun8CMxxSZr+19izgU/IEU?=
 =?us-ascii?Q?2hBCVpHkiqqEmUqU0IgYWVM126/bzG701Xrkey561xdFDy2YecEps/MP6zVL?=
 =?us-ascii?Q?Jpv8oRsNy5cqJaM537VVCI6BhGx06fo85D3hfuO6ujEJdXtAjvOKl/6B7fkA?=
 =?us-ascii?Q?yr9sBf+kVBjblK0AKDPNfaTTMM5BCmb4TLhkUP9yZ7+I3CjpCpi8WqBwf8CF?=
 =?us-ascii?Q?80L0AkNTs4r0URgCdMsssHTdcJbhZvMOBoSP1kDEHkPWIeIH30QrZ4FiNlLz?=
 =?us-ascii?Q?vRqk93GFkfzdGAzHxTVo601rgV2Pj5aKwtX6qLnHBsUlZRJ+ka9OVOxqEWb0?=
 =?us-ascii?Q?mMc6+uaAl+zssYEsT7AYcGNZJF/jCvoZX+GpCoDjaLSyn7xr9f09dxhCMa9Y?=
 =?us-ascii?Q?/NfCNOzMrYBQ5TDAKVD8kkmdLVNAWXizePmGFYIDD3bcPCbixd0c5rLo9P/Q?=
 =?us-ascii?Q?A8F8IMunpUp0oGhcy1thnO56QR9wWZx86pmMPiSJmN1klkTbKvqaqwboBXYR?=
 =?us-ascii?Q?VNx5qzi/+Ur/EmL9SBfzUeWMdFMTSC7ToEVO+i6E5giNXZUYsbFxcdAFeKK0?=
 =?us-ascii?Q?qHhrOaHmULdrxqei+VU2cZKxCx5MQukSuAL4ayhB5vVYcj7eglCEQpN6VCuG?=
 =?us-ascii?Q?M7qiq/5r6KFdtL5LQAIOaXsY87ey8dmXpZ4CtNY0EYD7VtJwKYl2rFALSn2X?=
 =?us-ascii?Q?HUciLpKMTu8bEqvj1HlfPIByjBWzupsutm62b30LuTVsm9IRDvKdyiBMjE2k?=
 =?us-ascii?Q?+Eh0dSF9Ue1PFut1DBDnGpQAqdPZlV4V1/mHSb7eTqQjqKFliSrMo0bMdsHY?=
 =?us-ascii?Q?PotY8oKPfbfyQYbt4Kp/1df10Wu1RFBg0N/qoceeqf0nnz01n0FY88ZK2qBZ?=
 =?us-ascii?Q?ahrNybpVO9pS0/8her9/Z4vDAlqxOsyYIVnTRdRl5Ea9VdLUbHSqT5bXk/nv?=
 =?us-ascii?Q?2oKnA++IPbN3K0MWEIVTOn0D7xYDGboFcIb8KWGBjiplAjquSTKhMlak7pAT?=
 =?us-ascii?Q?TpHP7wmwPGj13j1H+cha2hBt3co0oS3VUebUbpkhW9Jha7cUAabR7SZCIKvD?=
 =?us-ascii?Q?cgi6da7WNasc7qq0/c5UgMjKJHRIHw7Ra3dcxHh4rHyEuRcRalCTY9jUM/Ij?=
 =?us-ascii?Q?6zmzXJ6ULN/5I5367T88BeCrf83COCyrwRSb/fM2t6affmBz7hJi9qnqfATB?=
 =?us-ascii?Q?tcFaUc28jmyXx2qPPQqHTGvtRCvuQ5Bda+JVH2KClA9f6f0stImrNOWzA4e3?=
 =?us-ascii?Q?Vhvwa1iRH6pFmPQSGeEfZYrt7OxtceFWZu4IsOdm4JCKrqF+zuOHMQ5BI2IW?=
 =?us-ascii?Q?DX9l0TcqXoYtjtMCDlUf3mhr4raJs+nLDimyY/Su0YVb58UCK1wxMnanCQ9q?=
 =?us-ascii?Q?iLyEcX0H/Gd5TUJWB82R7BZhzrWTjI/CEENEVLFN4rv4r9bxBdQSfu0wZHvc?=
 =?us-ascii?Q?XS9q1MFSugNrk9q7HTuyVuJ30pIykBJQXdUPQhmpiBhHMsofpdyFA0GA5jtV?=
 =?us-ascii?Q?hk//21d4rGsCBYB3PtvUzCysMto=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ed3eba-6997-45c0-d040-08d9a2c9ec66
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 15:10:38.9182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAS0oFTOG1ixF/mKCjV0fRhrEXnVllRu8z33lfbBPdz50OxwZMBJOgH72+rmKaoKakNfgp/RWTNYj+TNrzq12Xqf9wkz8u/2P0Z9v2Gj688=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4595
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10161 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111080094
X-Proofpoint-GUID: hT5nZIZIdjeRvPY2UYq8n3AU3W_hSUNK
X-Proofpoint-ORIG-GUID: hT5nZIZIdjeRvPY2UYq8n3AU3W_hSUNK
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 08, 2021 at 11:48:42PM +0900, Tsuchiya Yuto wrote:
> > > diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > index 0511c454e769..f5362554638e 100644
> > > --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > @@ -711,15 +711,15 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
> > >  
> > >  	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
> > >  
> > > -	/*WA:Enable DVFS*/
> > > +	/* WA for PUNIT, if DVFS enabled, ISP timeout observed */
> > >  	if (IS_CHT && enable)
> > > -		punit_ddr_dvfs_enable(true);
> > > +		punit_ddr_dvfs_enable(false);
> > >  
> > >  	/*
> > >  	 * FIXME:WA for ECS28A, with this sleep, CTS
> > >  	 * android.hardware.camera2.cts.CameraDeviceTest#testCameraDeviceAbort
> > >  	 * PASS, no impact on other platforms
> > > -	*/
> > > +	 */
> >         ^^^
> > 
> > >  	if (IS_BYT && enable)
> > >  		msleep(10);
> > >  
> > > @@ -727,7 +727,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
> > >  	iosf_mbi_modify(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0,
> > >  			val, MRFLD_ISPSSPM0_ISPSSC_MASK);
> > >  
> > > -	/*WA:Enable DVFS*/
> > > +	/* WA:Enable DVFS */
> >         ^^^^^^^^^^^^^^^^^^^
> > These two white space changes are unrelated.  Please do them in a
> > separate patch.
> 
> Thank you for the review :-)
> 
> I thought these space fixes were too trivial for a separate patch, so
> I made the fix while at it. I have no strong reason not to separate the
> space fix. I'll do so in v2.

Trivial white space patches are fine.  We get thousands of those.

This goes through Mauro's tree instead of Greg's and he is definitely
more flexible than Greg.  Plus the atomisp stuff is broken so no one
cares.

But the rules are really clear and it does help in reviewing when people
follow them.

When I'm reviewing this patch, the patch description says it is a fix so
I review that differently.  The fix is very simple and it changes true
to false.

The other patch would have been a "change comments" patch.  We get
thousands of those as I mentioned.  My concern there is that a UMN
researcher will try to trick us by hiding code in a "change comments"
patch so I have a script to review those.  It takes one second to run.

But then when I was reviewing this patch I first had to spot the change
from true to false before I could review it.  That's where most of the
time was wasted.

regards,
dan carpenter
