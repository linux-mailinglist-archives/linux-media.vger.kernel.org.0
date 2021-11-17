Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92FB045468C
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 13:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236787AbhKQMqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 07:46:30 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21708 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232278AbhKQMq3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 07:46:29 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHBu8db031134;
        Wed, 17 Nov 2021 12:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=G2TYRPPjL7YT97I6BEzF7DfwzwoVwdcFl413/8fejeY=;
 b=hFNRrlTDMpKAzxObzOAj2W8KGoU6/XM50MCsVq+pyd71blme4xVIK3eTR6s7j7m5d8bZ
 ZqaRtsA2bJyDHZ6/BmrP49Cj3gvT5+2RFzt6nYBaa14BEAoIRtMAYhmlBJQiIdrIAOVS
 AlmfdAm5V+se0TbO1iHRmtN8yR/weXfco8BvqNuzq6TwLb6fQoEdTutrj5JN7A82RssO
 JGSuGihAjdy/xMkPtbqehzRmmU4llsNh535hQVBsaPw/5tis4SxH53zHF20PkOALoKv0
 J2HlmUFbtz3ywK45CEq4dSavWTTTRIIoFY157U9vn9dm2j6iJlGtkgnEb6decF4phnTR XA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbhmp0cbr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 12:43:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AHCaGhb029645;
        Wed, 17 Nov 2021 12:43:14 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
        by userp3030.oracle.com with ESMTP id 3ca2fxpmj0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 12:43:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCW+FOGY2du4g9B4CulkaSB8RfA/3lH9Mi2Uaw60OVTbdfemYKKzofwFop3BTgCA4Q/vejEsWnx1hNBOodp7hmrx3v7oLCVC6JAiJBdBfdK0yILFRv2bf/M/mQtihBjHLGBwt4gSTwKjMHz3f1pnIiz4md1tNECiUqrZknCqHLSQCk4TQaINTQu+eHfhLoge6wVTOQ/Ls5wUwqSrjDCk1+Wb4h3yKJumdo/M/PowP6rJCDGPKP4DcX/V/UfKP70H03GxSqfisuHNLdgN7wSXk9Mek5x3Fw1bOoycuFMhcfX2yEl078b9Bvqn6rnYuqj0D7SIRNeSPrlUoyuLU++eHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2TYRPPjL7YT97I6BEzF7DfwzwoVwdcFl413/8fejeY=;
 b=Q4geH0tVAjEKaUMU8LRAkXd4rvubyBLSdq+Rs2p/SnTtxs7RWToQ974gBqWZROphYoLT/SNbGJzf9Se8+vwfUPs8dCkwm5zoacMT1tPeuUr/AWTDFayAhde3T3z8g4w3zqKzw4raahACNhgJARkkZtT8w4BhCyvfpkj033rRMAeEng+l4AuQVBDUVhHHzyZlA/Pc8s5AFYSCtrOw+ks4gQDVq5dIt72QeZOA3+fYaxlPpk7f659QpW+w8q1LZZBNyI6MxCDpO/Roke2uajXT3+CxJNV5y03ydqnYhi95dh21lj1BJygipEtBeTsOlCHdvcAzph1HzITaa/LsxR9hzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2TYRPPjL7YT97I6BEzF7DfwzwoVwdcFl413/8fejeY=;
 b=h4kjj+dwiWaCnmio1hjrXIFTyH+eTITf8NbOzP/N3JiN751CKuKE9uSENMuMKryAxSEfpCyWgiJWwxwv5NhUC/8U6croEp/0491hMRKa0oYNdkdemT8QG3nEFx0VqvHNy+W/SHJ1uIaMma6f0WRDLn9FNT5WGbWH9MOQJwdGwpU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4626.namprd10.prod.outlook.com
 (2603:10b6:303:9f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 12:43:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Wed, 17 Nov 2021
 12:43:12 +0000
Date:   Wed, 17 Nov 2021 15:42:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 13/13] media: atomisp: sh_css_sp: better support the
 current firmware
Message-ID: <20211117124245.GM26989@kadam>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
 <f0c9b8ec25fedbfccac6d14ff1add2d40beaa088.1637140900.git.mchehab+huawei@kernel.org>
 <20211117100238.GL26989@kadam>
 <20211117111956.215743f8@sal.lan>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117111956.215743f8@sal.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0021.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::33)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNXP275CA0021.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 12:43:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c059a560-1caf-465e-7789-08d9a9c7d003
X-MS-TrafficTypeDiagnostic: CO1PR10MB4626:
X-Microsoft-Antispam-PRVS: <CO1PR10MB4626B4CBD37C5D3DF194DBF68E9A9@CO1PR10MB4626.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Khllxdp8Eu8CLLp9/3EnwqoasUK+aPCqui8gBLPWhpCEapFDgajKDwigxwFr0kWr1mI2X2XG+iGiU/fpMfRGEbtdY9+UsKPAAiqZcdVEEoriKcjR4nvzGyFpsOp58IKuaL6yKbSDmm+0frYQfvPgnlXCk54rOIdkuTVL3e0jD5/4bH9OlMxLqE0PG8gzuuohRoZy3FVBJyLHrsmgfWJXE3A6ziOr0+MloqJcNTnlq4+R7VwIQKD+fMX9TjPn6Xi2pZ6JbcafohEvjT8YLlA3Y5dFeBs7CviNoK/pHKz7spkU/Rj3R+/VMfA3CaFuyYKrujwtDTOqQqcg7VQaZbqNdvOipm6zNx4ouZTwwQK1uSizzFgBIli2X7N1gWjJvvaYmiHyg0z61wl12W8kklwqe+F4sDWty+tllE94XXMvrditaXvu8EezsknAxexT4bNvFKrcWuCnYD/oXHEeUDASaHN+PmisLTbqSX82baA9ZRxN6CPT6+kgRBvNx8E6qOyfR9VlYi+N0rjE3LgzdpY007DkP4So2gWTnKQSJZxnDVQug05hXioTiTOFfhkpWxTjgFHmFMxK408N+7gNuJjg/N/79npX63wpz6aDzKpkhbvAxL9k6GS9cglBkmvhgI7jVJuAGiajv3HZGtNP4HUQKq7HyvF1z2AezxqR0+5wai3Acx9UFT5sOO/er719fozJjaPKCqRxUQSSTy7cJp/5jswfxZb+6n07CShfHIsu0gSpxEW/Ei6IlG2xPwLznd/GN9ZfVFZxeA5EYtlg0DQZmMc2kXhzpSiZ7zCz0qxttQo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(26005)(83380400001)(4326008)(5660300002)(956004)(508600001)(6666004)(54906003)(186003)(2906002)(9576002)(8936002)(44832011)(9686003)(55016002)(86362001)(66476007)(316002)(4744005)(33716001)(52116002)(6496006)(966005)(7416002)(38350700002)(38100700002)(1076003)(66556008)(66946007)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pH2dTlJQpYbenURNK1wj27Q9RZkQ/htayE34V3YIB21NP8cUiiqcl++6vM0Z?=
 =?us-ascii?Q?xfG8iZnmok2NmnNfgrJp6C4i6z90FEa8de8jVzayZuwF/N2KGjOwE4oYz+J7?=
 =?us-ascii?Q?Fu5CZ4gLIHF4uSrS5UlSMvFUm2UMjJVTlRk6n4aKvdVIfg1vzgjoE4HDLicJ?=
 =?us-ascii?Q?PtAbE1ip+SrUdmQTmM8EoTjYf202oYk/tVaKqmZkZP3G8efvkLIs1UgP2NbY?=
 =?us-ascii?Q?ByeApwYUiiYNNDlm7xo7Rll3lED+KwTzOQvpK64FCR+gv8V+s/Td1hQ7vYdH?=
 =?us-ascii?Q?4DwjQpNksKjAZYtACLANGQUfmHpZL3wBaXSX19Av74vhogvbaJ7o4MgcPPuo?=
 =?us-ascii?Q?Guor67L8uq9JxngN8LSN3w9JmWNgxiBYW5bieuV53VSd/Oqx2NkFzFg+Pu8h?=
 =?us-ascii?Q?tgWsSp/qXR7NGyjumrYsXVvkmpU/iw8zVH579S3CB3kWSqd1Q3Efa+8SDDmj?=
 =?us-ascii?Q?beJ+dsePJqOX2VxoOUANXPcx6FSpIys58uJVtWSiFRGOC3H0W+wxCMbUKTLd?=
 =?us-ascii?Q?lJIGnYIv7Kh0Zh26D7a0pK81F8RhKydR4msZqNvf97nMuXw/AgwJWbQbrPvL?=
 =?us-ascii?Q?29xb2uJfg/5kvddP4weJyX+ft3S2N5aIZ6YhwDHTDOahSBGGDWJXN+I54ZPi?=
 =?us-ascii?Q?PCHzXaGaUQO5WbplXu4bhN+WoqaMAmtBUOGjT1FykwIdFi1/PLacJSzGSRNL?=
 =?us-ascii?Q?hLwSW60r/CfSHMJqCWrShfxFftqaxvMpU97LlNp7gv/y4SKTBpd8iuiOqFbl?=
 =?us-ascii?Q?tjBuyzaXOIw3MJ37nN59brsbxQiP5SxEzVc+6BKe1uP9N18cagRuGd+QxAcO?=
 =?us-ascii?Q?gccwVv0LGhed0+akB/vd8RGptXovoZfSKgSoT10PRWXyBOOKi9lgcKPBVdt3?=
 =?us-ascii?Q?PWxRkUhYHgvW9F5qqOOUC5guMKWrk7uQy1iG1vibEaFXPZsKuecDIF3oAtAl?=
 =?us-ascii?Q?u3iXaA43ZPMbHMQd7RmxWA6yZm+PbfX1HXk6AzIIBrh5oJwrkb2VLdLOkU/D?=
 =?us-ascii?Q?3fSFfCa0paOAoy/B4X712MKR5z8ZoeGtRw3JIi2Fc1RcBQ8ThB1XevUvm2Mi?=
 =?us-ascii?Q?4UgSaogSTzywf6V8Tm6xXfjjcMWgsLxZ9k4/4JM+sIMew09LbIQxgRAdKvdQ?=
 =?us-ascii?Q?SfAACG5JPWR3KlqZ/78vdigbKabP49EP0RpWtunjfLztDVV/Q/CMRyCWHsUY?=
 =?us-ascii?Q?iy8tiEw6ST5sHHTHcl8hmVC9nmDcqS+AHHIzmINg6E+n5sfrFl5slRF9TCwg?=
 =?us-ascii?Q?Lfly7vztX5QDQUSugy/qPCpBHom6tO3L1OOMHxvh8uQyNIKkuOlkTwSOM6gs?=
 =?us-ascii?Q?8LYLuS/h55veRA0wVRjP+l7PjZM9YB3pndoRKtizXKkUSk41NhIuVsbVj9lV?=
 =?us-ascii?Q?RuHeAKey9BYZb/V0fWlgpz+1jtdbN0w9bskHDg3wK+TXd7FcCTe4RNiG/e+Y?=
 =?us-ascii?Q?Uyd/Hz8rLReSK8hNesHcN10JO9733hQr0elZTLEmSe88C4tQXgL7c+PbIkkT?=
 =?us-ascii?Q?0sDUpk0jZDB3qjqNmL1OJDcmMrXAIfYOC6BUssLnq0/rsgrIu5JR/cuUTh1f?=
 =?us-ascii?Q?t12dFAS/KeTXfb2sDJP+IaMFCXcW7kLISuZNQ1Uy5Igc6/q31dPqisNjEmDa?=
 =?us-ascii?Q?xquRFgQGahQE6NX1GInLEHIaIw03IjziDbvcYKIJc1syWSfLc5SHgNxJUhgB?=
 =?us-ascii?Q?1Jr7+W4+PqXxfHlvgaRtPDDNUG0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c059a560-1caf-465e-7789-08d9a9c7d003
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 12:43:12.2048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fx3th+PEctO69Ze9IWb7SArASObNWaAu0K/hB17UTYfOKWP+dp4jfFLXCjImWmrDwfwVsQ5KhhoVjJxTSPjVlg6ce4DWiAMqFKDDSKb6vPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4626
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10170 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170065
X-Proofpoint-ORIG-GUID: Z8omYbDCun-LRJ8TCja1d5_I5ZxzfBZT
X-Proofpoint-GUID: Z8omYbDCun-LRJ8TCja1d5_I5ZxzfBZT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 17, 2021 at 11:19:56AM +0000, Mauro Carvalho Chehab wrote:
> Em Wed, 17 Nov 2021 13:02:38 +0300
> Dan Carpenter <dan.carpenter@oracle.com> escreveu:
> 
> > On Wed, Nov 17, 2021 at 09:25:38AM +0000, Mauro Carvalho Chehab wrote:
> > > As we're using Intel Aero firmware, make the code closer to the
> > > driver for such device.  
> > 
> > I don't really understand this commit message.  Is there a out of tree
> > Intel driver?
> 
> Yes. It is at:
> 
> 	https://github.com/intel-aero/meta-intel-aero-base/tree/master/recipes-kernel/linux/linux-yocto
> 

Fine, but only removing the if (stage == 0) { is correct.  The other two
changes are harmless but wrong.

regards,
dan carpenter

