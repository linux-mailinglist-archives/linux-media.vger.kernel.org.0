Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF2132E5C1
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 11:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhCEKIo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 05:08:44 -0500
Received: from mail-bn8nam12on2041.outbound.protection.outlook.com ([40.107.237.41]:1198
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229783AbhCEKIW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Mar 2021 05:08:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AocZD76clc1H78U/pxQ2PFZhJ08rGhi89hNSlPRWrdt5me1wgo/5JQa5rzwbtrbPk0UC3+iOGzb4slq6HU+MWXVU74jTFwybJLavxvPp2D3QsQEwdZpJiiFUMZukbTLtTvQnNmB63ee+RDdHGJdtI7HOWycsoYXycDSaWZC5GagVWtMTJEAeSezYSyNvlVax7DEqGaYKgYSgw5DlPsJh5Ppuszau8cGI78g7hE6cGVF7yWdkDDut5FhLa2bWwBjR66dR/HzDVaPGWUZin4SU0uQB7hXR2ZXeeH6Bay2VzlkeLaTKqS4s3jBtSd8R43l24/3qsYPQWem3mdZefuw/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gVuP2g/VxIFG3nonMZSsmFAiRNy2oTr1YCsjQjyheI=;
 b=cNIlTPs0CuvutDDmDDrsZ0PmCacGBeJE9EEJJGymcLhAKtFPnHCL64FB+XGWqwrgDvILYVM5cxgU4t9t59tX17SPFhZ9ymMka9EKKJrBS8j7chT/q+LhGwsR41eTzazzfYXD2ub0bs2k5K2rN/3UbW4aExYfB+l0EbDxplpqcAQh3pMJqLx6B9B3zNXJukgkktrXjgqh/ANHw/GO4+XF30Vs0oW6uwUc6Pq0eTKwOoERVzQRfVwgEI+1jjMhkJfvx1yst8ihog5XZdUXu17X1vzDbM30++KK7JbNSKPy6zcxKdjFZ0SJdaCmjih8b7722td/rH+tPeJY6WISpUiTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gVuP2g/VxIFG3nonMZSsmFAiRNy2oTr1YCsjQjyheI=;
 b=pZ3tzc143cwkKF6JGVtpE9DRJkJsvsvqNe08i50q7Knd3c6iyYjLPhAWXY08pHwijihdYIbdVFaqklQUS7YxlWK7DMi2igOEj/BtvKFpIoNYt0Dbsvj/D4SM+bp9jSKjv9QU1pOTGpgoA6b4Ue4pIo6at5YKy05wzgaAqo1UzqE=
Received: from DM5PR05CA0020.namprd05.prod.outlook.com (2603:10b6:3:d4::30) by
 DM6PR02MB6138.namprd02.prod.outlook.com (2603:10b6:5:1fd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Fri, 5 Mar 2021 10:08:19 +0000
Received: from DM3NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:d4:cafe::c8) by DM5PR05CA0020.outlook.office365.com
 (2603:10b6:3:d4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.13 via Frontend
 Transport; Fri, 5 Mar 2021 10:08:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT026.mail.protection.outlook.com (10.13.5.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Fri, 5 Mar 2021 10:08:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 5 Mar 2021 02:08:18 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Fri, 5 Mar 2021 02:08:18 -0800
Envelope-to: michal.simek@xilinx.com,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org,
 mchehab@kernel.org,
 laurent.pinchart@ideasonboard.com,
 baijiaju1990@gmail.com
Received: from [172.30.17.109] (port=50670)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lI7Na-0006k6-Hw; Fri, 05 Mar 2021 02:08:18 -0800
Subject: Re: [PATCH] media: platform: xilinx: fix error return code of
 xvip_graph_init()
To:     Jia-Ju Bai <baijiaju1990@gmail.com>, <hyun.kwon@xilinx.com>,
        <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <michal.simek@xilinx.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210305094819.13685-1-baijiaju1990@gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <d5b346cb-5949-ec40-918b-59041d60929b@xilinx.com>
Date:   Fri, 5 Mar 2021 11:08:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305094819.13685-1-baijiaju1990@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62aaffa6-5460-4e90-2fd9-08d8dfbe99ef
X-MS-TrafficTypeDiagnostic: DM6PR02MB6138:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6138A2FF9BBADF166E60FCB8C6969@DM6PR02MB6138.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0pjq10+Hwo2ceZrzC36M0/F1HQWO6/EUshgQFaSJQL4CFF1CfwdBhPmfNf5eqR526C9+ccKceviRqH5vL0MJE/jHymKwrfEulCSkwqZNVwVorLQxBoEG796B0u9zS1jxdURWF4MMfKhE/QUHJYSXf+60sPYX2MC72ySC99fYLZf2+wWljaUhMh5hByE+xukkl+ToCEoAqraHz/fe07tRUS1ndbcaJcFotB8ng5buqOJBtg0QTbpyRXZ77u2zF2P/20T7Nml5ekYV0+PiMntv96GBUFKQnTudgBOOIhoQYIrrlKVE7iGaXFF97Hv2/ii034Dl4dvji0yf4qhgO11J8CgzZfPa3clRTdQNFO7+Gv6cJwEzv8IdLhLh932tCOWMbmmLj+y4GvPjKng95RsU0gQQaHM9/OoJsOCUI99v7e1m/m0+o8qcFizeYO091A3PQjnyaeG56zaGHQmQMhvPrn8T1MQZCrMxbOWFIBLwfeW+bdIEoMr13r6zMPC5JZhZ/6XRleawtaQQUsScZeImS2/IDy1bYeo1JpGWe1MvlCyapFJxcDba8YbTbZKbisF1ZN56wTHgut4wZ/rTZS9WpLBI7uS3QmJJW7GXD+fO/huMPVZRoNRJIzNyw7OViJfs/t54KZsF9hpk4ChA9H3dFjm/Wv18p2bhQ6DUtqT+9hfezY3a22qvUmYNXGCXEgrFwdtLuhIzvr9aM2VL8XhtUDSPyhqMJ1dOBA5xzQFp4vg=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(36840700001)(46966006)(26005)(70206006)(36906005)(478600001)(186003)(31686004)(2906002)(8936002)(5660300002)(8676002)(44832011)(336012)(426003)(2616005)(82310400003)(70586007)(54906003)(316002)(53546011)(4326008)(110136005)(31696002)(82740400003)(356005)(7636003)(4744005)(36860700001)(9786002)(47076005)(6666004)(36756003)(50156003)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 10:08:19.1395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62aaffa6-5460-4e90-2fd9-08d8dfbe99ef
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT026.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6138
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/5/21 10:48 AM, Jia-Ju Bai wrote:
> When the list of xdev->notifier.asd_list is empty, no error return code
> of xvip_graph_init() is assigned.
> To fix this bug, ret is assigned with -ENOENT as error return code.
> 
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
>  drivers/media/platform/xilinx/xilinx-vipp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index bf4015d852e3..2ce31d7ce1a6 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -525,6 +525,7 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
>  
>  	if (list_empty(&xdev->notifier.asd_list)) {
>  		dev_err(xdev->dev, "no subdev found in graph\n");
> +		ret = -ENOENT;
>  		goto done;
>  	}
>  
> 

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
