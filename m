Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 106A43DD5C0
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 14:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233661AbhHBMg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 08:36:26 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45170 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232629AbhHBMgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 08:36:25 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 172CRbXj004221;
        Mon, 2 Aug 2021 14:36:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lNlQryOYukRxWW8f/bdXPFu7SvefaiNkrOqMIxDBW5A=;
 b=SNicw1KMoPB2QUKieZB27autKNKLweuCVn52YOcNd5E65aKsVGLdVwE5y4vCkVqqgm4g
 2B96gg1I0He/U7fCGwhM/wkHrMZ74dwnXPwSbY3YnLpu/k/pJj0w2R6sH1DDj6J0YNTw
 R57dBWFcGNTf0dGmWO0PupEfB5cykC9HbB9X3ZIVChzIFkrqVQevcjduWEaWal3vWLto
 WekB4SUorF6QXULFTJiqL9erAmOzWWxzzm2vG814HM60aTo0voVF7oY7NQfODZ1liHsB
 Rx2lqjswPRsuBUX3RirDZ3B+VFeG0t4qycM+N1DgE5XzTIu5+e1iSUR6n4vO4a+fmO06 Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3a6cx518cc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Aug 2021 14:36:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EAA0100034;
        Mon,  2 Aug 2021 14:36:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 058CB222C93;
        Mon,  2 Aug 2021 14:36:00 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 2 Aug
 2021 14:35:59 +0200
Subject: Re: [PATCH] [media] c8sectpfe: c8sectpfe-dvb: Remove unused including
 <linux/version.h>
To:     Cai Huoqing <caihuoqing@baidu.com>, <mchehab@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210727053903.711-1-caihuoqing@baidu.com>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <f33dbe73-c7db-acc6-8f74-866ff74857e1@foss.st.com>
Date:   Mon, 2 Aug 2021 14:35:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727053903.711-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-02_05:2021-08-02,2021-08-02 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi 

On 7/27/21 7:39 AM, Cai Huoqing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 1 -
>  drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c  | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> index 338b205ae3a7..02dc78bd7fab 100644
> --- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> +++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> @@ -28,7 +28,6 @@
>  #include <linux/usb.h>
>  #include <linux/slab.h>
>  #include <linux/time.h>
> -#include <linux/version.h>
>  #include <linux/wait.h>
>  #include <linux/pinctrl/pinctrl.h>
>  
> diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
> index 0560a9cb004b..feb48cb546d7 100644
> --- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
> +++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c
> @@ -11,7 +11,6 @@
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> -#include <linux/version.h>
>  
>  #include <dt-bindings/media/c8sectpfe.h>
>  
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
