Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB02A442CAE
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 12:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhKBLgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 07:36:51 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22032 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229720AbhKBLgu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 07:36:50 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2BVUst009755;
        Tue, 2 Nov 2021 11:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ba6tPla5UYJCvWAAg/PdK37xSKVfoQajZrOMxSZU7xA=;
 b=1JnHe5YcS9hN2YZTqc4FQUCHGHvjfpwkcHzTlBu/SsEhufszFIqb58OteOOR2hUT9fwe
 8exGHt2w5TFkyu3h4qhLXPLwwIiJDbCJzYagLKVb05j65vw3fkKPzYkphHA4sYhqz/i3
 8VhRx0M399dUNg7PGs4MkVm3C0iiIJt4WQIMVDOy+QdHY1rutsAUC4ThwEORqy/tn/33
 1V6F25PH9gwfFSriZeoxVOObD+6Ow3JGwXKUoSP52f2KyZ19v1diuzbQWfeBGxd9bWfz
 d4QA5NWqWbJgnpZ4uQPktKB9qF6VqgnKSbKmSgQFzOBIZW4z63AdS58TsrFolWIOedBj VA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c26e8f347-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 11:33:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A2BVsOo183181;
        Tue, 2 Nov 2021 11:33:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
        by aserp3020.oracle.com with ESMTP id 3c0wv468hb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 02 Nov 2021 11:33:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSGFzqgBy/W82S2LtT6LJ1f3Fjn3PhU6FMbK18j3/C8foJqCoAJgDL4p9frkQzRw6lu2IK8Rk0uJMgxLY8BORCw97NkgxUWidtEh02sxGyvZlwxjcYQ9I/UhaIV+P7VxkDCDQn8XJbSR8EMR6Zkc4u+B2AnWBl8oMKr+ix+1HsiFQryZoV4RW26nwt6nHJuVfImFR2H8eRmMbXJqffTGidbN35BCuaMSX5VAgJ/X+famHUHhlCMC/BHHF4c1Abe8fUcj7Sbv7N4F9lA7GPdE0SSS8ctH4N60kmVBAYE27OCR2xXd1ZuUiUw5iPQ8do7aR5wigh4OBOTP6j8ZEEAtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ba6tPla5UYJCvWAAg/PdK37xSKVfoQajZrOMxSZU7xA=;
 b=JAlOt+RhDJ3E7UNGeNG+NtEfOHhRk5g3WLtH0qCvSNrTKPQ5On5Zz8V28ZZx8ieSnv1Af89+WBqf4o6PLJDUfqh3rc5DmOLHmnEcXdNbnt4+M0nYysSV42nfzd7yNU+1RdMBrlidTa32YqMvWPXd9QsN+KmayjEWLFXg0uytana42taPV5G9+DTR9puPpZtZm6XhtS7u4ann1twR3ABZPw+vJMyhwPIps6d+PhOInEKTmOhVUcDVsQim95o9khkYBD92uWCtfXISwwvMyOY6uVvlDc3RfPP3/if0w/tTW1a+TOCYA5vD8xyMaAHReANd6lGbgPTbCMOeqGHpyW34xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ba6tPla5UYJCvWAAg/PdK37xSKVfoQajZrOMxSZU7xA=;
 b=y0ty39ZH9wUSUhGY+XEQ1ViuBtP5UMokwRqxuOThKojeW8GgTNINkYBTUiQzwAf1xq5GGdMW1GalvdPhe6Fd7Kz39Tsr5C5Roa+7D6wJZ74FRUKWiuD+3q7OQ9GVBG+npPdXznsnrXhbW6KeXGFnNvVMTKLA0jpDTdgOfanei1Q=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5808.namprd10.prod.outlook.com
 (2603:10b6:303:19b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 11:33:55 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 11:33:55 +0000
Date:   Tue, 2 Nov 2021 14:33:32 +0300
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
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] media: atomisp: pci: fix inverted error check for
 ia_css_mipi_is_source_port_valid()
Message-ID: <20211102113332.GC2794@kadam>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-6-kitakar@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017161958.44351-6-kitakar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0023.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNAP275CA0023.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 11:33:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f94fb65-dd39-462e-f74d-08d99df4a6d8
X-MS-TrafficTypeDiagnostic: MW5PR10MB5808:
X-Microsoft-Antispam-PRVS: <MW5PR10MB5808ADF7D36197C24F19EAF18E8B9@MW5PR10MB5808.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zz7Or0fCfr3vYqOHcOVDhx3c2aBi8Z/Otsxkl3RMnsTyaYRu51PXfrHCWFtyYCINk9TWLg7ZL+XIDgtkN07IZ4eWKI0VLyQcNrGDiVqQZC6oIrQpMOLVStPaAve71BDoD0JzSZttq7AdRY6CN1/MAOgNP/tD3Q6blf1zU4VfCqGGn1Y8k8Nrx76uYs1hiLVzQzxSEo8l3jBfF4YzjAXofVcj+Hn1peUXu1NTR+A3h3/sJ4CKiQt2mv+o0tZKs7d7ECf8wpb+Jgcmv8mrXB3kC3HcrsEIEqgHQhNBq6cPl8mbTLyYHJgCquIWL8OSuqWpAa3WgSJtgZ7W8fiARvTP79ptxYn1ONBykZkXEdTH634XyXjir/tZS0cK5iVD1m4xsS706gQFn17QhWw2r+ZrqrQJl1IbRBeQq0f5xBBOdm244z2pZKE0M1ufV7oAH9YOardjL1Zzebjlo0TWCX+Qyg2RW8v1DwQ81eomPb/61RScWGZe/fQRm11cgN2bkAcw54tI03a/Wl3bpbqZjvlY9I2TUtzS77R5w0CPpQuhatWeXhyy3Ogwqtg7WZIpc2z6W47kCk/f/JXxY1vp38eqgEh69uJuaKd1NSe9qem4NrPpIDmFYunK+48Os9VAN3PZogmAaDY/BEshTwCG41Bfb9Aaqee+iSgFWEE8ygPKbxigluB3IgUWA1U9OEXBdP+BCVQUxNxLwcMNk9pTfbecxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(55016002)(52116002)(508600001)(66556008)(6496006)(86362001)(6916009)(33716001)(7416002)(8676002)(316002)(33656002)(6666004)(44832011)(9576002)(66476007)(9686003)(83380400001)(66946007)(956004)(1076003)(38350700002)(38100700002)(186003)(4326008)(2906002)(8936002)(5660300002)(54906003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AEHbXpYuCz6O0SSxzkJEIrGJsPseBPRbQezj0MlBg0B/Kc1dC2L9hpF6NDKH?=
 =?us-ascii?Q?BapbUAadDJUh+gi6ac+xLJMuIuzn6nqQNvdu9JWM5iyrA9OzwXwe2cvsUEEw?=
 =?us-ascii?Q?8XMSWpgzXU4KR4JEEnkJWx9VEOk8ivswlSrHIAPYgM2hxNVgGAqC2sCJ5dnK?=
 =?us-ascii?Q?xZU2bsdvjjO1ejI5k5BYQk/EcAIPpFHMgL9dEQzxq0knwKBHN5mPgdoCXp9m?=
 =?us-ascii?Q?QOrip1sB62XJruupznme4Phui2ul6Y7ZqvbLAhg1WhF98GJ6CPeqtyWIbqeM?=
 =?us-ascii?Q?5W+uCx+9xJ/n7V9C2E07Fg5TlWd4dNZN5ScrTf8BLCu3J/DI4erANex6Xhl0?=
 =?us-ascii?Q?nzAuV4/46AgUdJzMvfS9u2gb6IObBlmSbnWwir4otcRhNstwgNBipVVyQVv5?=
 =?us-ascii?Q?qM9sK3yCZcAqZCbcAF1+uAz62TKGPivm35ypm/77UU9uqn3urQbh3MdiQC4J?=
 =?us-ascii?Q?kOShSSXcjk5RQfSxUjXfrasRE8X5dggqXGpLGRseCR4xrVB/u990OXr4owHO?=
 =?us-ascii?Q?5JC6kOoZquHq5J9U0gS24S7r9ggqt+xkYnQoj7GuB9Fp2Erbsgwc+YC+TARF?=
 =?us-ascii?Q?ammEOPDlFUB3sadKYeoVYeNM+JQN9q2DlS9bbHUCqDn0DKbEwfjwXGjF4xzC?=
 =?us-ascii?Q?lEKwTFFl5h/0w3p1sOSru7o+Gi39FKlDSChfiz5pgf+Yhf7ps42v5AJJqv8h?=
 =?us-ascii?Q?deHRNIm0S69XsXRNxJ06jjBVhmbNHynMJ9lNJQmusOc/A1gn3S5RRD3psau3?=
 =?us-ascii?Q?O9wJYvnUvHFaUQrZmZYZObNZVHE6J8Lj7X6wRtqReE6RKU7CICD4RIUrrmF6?=
 =?us-ascii?Q?y/Qwk3L1KhPLGk1zjaICn8BbGSwOrbssZtKK1/kN/xgf7Vrsj+PAO3f7X1a+?=
 =?us-ascii?Q?/mTbA8z+VbRbMN/Ve6gsmFG2PhAa6covmTtD0ymqvp1MGjqG+FJLbp6idCUI?=
 =?us-ascii?Q?xbc8xUAFM2+fSOmUXAcKMxVd8xQqQ/tTYdqECnizY+QBL67oWyFD5V8Y1lWB?=
 =?us-ascii?Q?0cbP/WhS81vHFXF+vgUiBDR53hBqYQw0Fbqq1w3Hriy1GaOek3bbCsI6CVAG?=
 =?us-ascii?Q?uQBZWHxpSdCmwB6cbIpx/R3oPTrYW8DGORp46y3SI0PZCZs3UcacXbQjjF+Q?=
 =?us-ascii?Q?9/CedJzI7egahFPdNSiXP3dbU0TGV1+nxOEFjaur4A8U2CZTDMxJ1Jr6nOzi?=
 =?us-ascii?Q?0cQSwknkuI+O5IIIYLEg9GVDL78qhGn472h5m5QCE50LRl7Sy/VU4fUi1JiE?=
 =?us-ascii?Q?dq6dICXmOXHfqho0EX5r4oKG53oGsQC5zgv6PtKD6wAeSupWcaDlQFauPzNJ?=
 =?us-ascii?Q?r2p38SD+n4fYhoY1mqmD2OpNbBMhpj37nJy8HXgaEoBGhJgK8YORYAt7sEqo?=
 =?us-ascii?Q?+O6v2nO3V0nY2CzSpFzsvCEjYs3mnKTTBKifYTf8ShhoxpUq0rbwaLSHoIMO?=
 =?us-ascii?Q?mJ+AZuNSPFFD++XuGsn0ak4XEfvt9Za8BAS+8ibQP8/zQOzQbc33nOUGV2fT?=
 =?us-ascii?Q?23HItmF7gpI8usB8K53vEVioLvcG1XCXzL0HrWDTU46vwAlJhTE+Xc7Ij7zo?=
 =?us-ascii?Q?+BZbU4sr8jN0mfeBfL86Iu7XNPHJ7p0f2JtJZPWne2kniJkLFSBYYV9jwIEp?=
 =?us-ascii?Q?OwI7eBlaMfrIVlxVBhQ3SAq2UGJSiCzPCgPd5gzzWgxMEWwMR5aYMFKov31D?=
 =?us-ascii?Q?tNQsTg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f94fb65-dd39-462e-f74d-08d99df4a6d8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 11:33:54.9402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3SdlkHsbIldMdjjyrba15vCmV0PsOcrmWnVx1xn5axgKtPTyJo+9TP9Jv0jf8jPZulvd69wWLnrZaPpNxilwWxZ1d7LLTjaHBWVeHvQlic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5808
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10155 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020068
X-Proofpoint-GUID: u_TdqyWwXLHeLY6rXCevwrd6ps9jupLL
X-Proofpoint-ORIG-GUID: u_TdqyWwXLHeLY6rXCevwrd6ps9jupLL
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 18, 2021 at 01:19:45AM +0900, Tsuchiya Yuto wrote:
> The function ia_css_mipi_is_source_port_valid() returns true if the port
> is valid. So, we can't use the existing err variable as is.
> 
> To fix this issue while reusing that variable, invert the return value
> when assigning it to the variable.
> 
> Fixes: 3c0538fbad9f ("media: atomisp: get rid of most checks for ISP2401 version")
> Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> ---
>  .../staging/media/atomisp/pci/sh_css_mipi.c   | 24 ++++++++++++-------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> index 65fc93c5d56b..c1f2f6151c5f 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> @@ -423,10 +423,12 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
>  		return 0; /* AM TODO: Check  */
>  	}
>  
> -	if (!IS_ISP2401)
> +	if (!IS_ISP2401) {
>  		port = (unsigned int)pipe->stream->config.source.port.port;
> -	else
> -		err = ia_css_mipi_is_source_port_valid(pipe, &port);
> +	} else {
> +		/* Returns true if port is valid. So, invert it */
> +		err = !ia_css_mipi_is_source_port_valid(pipe, &port);

Don't invert it...  This isn't supposed to return 1 on failure it's
supposed to return negative error codes.


> +	}
>  
>  	assert(port < N_CSI_PORTS);
>  
> @@ -553,10 +555,12 @@ free_mipi_frames(struct ia_css_pipe *pipe)
>  			return err;
>  		}
>  
> -		if (!IS_ISP2401)
> +		if (!IS_ISP2401) {
>  			port = (unsigned int)pipe->stream->config.source.port.port;
> -		else
> -			err = ia_css_mipi_is_source_port_valid(pipe, &port);
> +		} else {
> +			/* Returns true if port is valid. So, invert it */
> +			err = !ia_css_mipi_is_source_port_valid(pipe, &port);

Presumably the same here?

> +		}
>  
>  		assert(port < N_CSI_PORTS);
>  
> @@ -665,10 +669,12 @@ send_mipi_frames(struct ia_css_pipe *pipe)
>  		/* TODO: AM: maybe this should be returning an error. */
>  	}
>  
> -	if (!IS_ISP2401)
> +	if (!IS_ISP2401) {
>  		port = (unsigned int)pipe->stream->config.source.port.port;
> -	else
> -		err = ia_css_mipi_is_source_port_valid(pipe, &port);
> +	} else {
> +		/* Returns true if port is valid. So, invert it */
> +		err = !ia_css_mipi_is_source_port_valid(pipe, &port);

Same?

> +	}
>  
>  	assert(port < N_CSI_PORTS);

regards,
dan carpenter

