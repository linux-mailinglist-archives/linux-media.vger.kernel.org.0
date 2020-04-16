Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF101ABD58
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 11:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504368AbgDPJxI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 05:53:08 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:35600 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503852AbgDPJxD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 05:53:03 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03G9mLw6079677;
        Thu, 16 Apr 2020 09:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=ORNkJh0El/FiFaNrBZ35C8htJjikUv/QO8+cVqgjYns=;
 b=TMxuolbgxTh7AfZ1jZZNYK/K8B4EvLKcEvSHnOoKKE3pd1UpDP4SogboxBc+mCqK7hZY
 70Ou+a/w2oeJ4XEf8CoIOK8aEmlQWrm1qaJFgp9rBKNNlhJYoZvru1FAtbcMpcO2lHLR
 jxYqtLx5vQ7eOy/ZKyzQkYa48fJQEJUf4bmDBNPRLdWTtJZeXgiZWuQj1HEqH3b4QjhA
 NI/dNbj5qNPYvvpA97aypERJf8lY7k112u8pn1YL2OU1CWz9xBLn5UztR93BPKzOjj9i
 IrdT4l/61lPvXDqZO+UZQybyNvoHFPloHpVc6oDTm8pmQ4wotBQSCgNiDnRLjkT+ovmn hA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 30e0aa5x1b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Apr 2020 09:52:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03G9l5h3106098;
        Thu, 16 Apr 2020 09:50:30 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 30ememjd48-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Apr 2020 09:50:30 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03G9oAKA028024;
        Thu, 16 Apr 2020 09:50:10 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 16 Apr 2020 02:50:10 -0700
Date:   Thu, 16 Apr 2020 12:49:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>
Cc:     devel@driverdev.osuosl.org, nd@arm.com,
        Todd Kjos <tkjos@android.com>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
        john.stultz@linaro.org, anders.pedersen@arm.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Joel Fernandes <joel@joelfernandes.org>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Laura Abbott <labbott@redhat.com>,
        Martijn Coenen <maco@android.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Brauner <christian@brauner.io>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: android: ion: Skip sync if not mapped
Message-ID: <20200416094955.GM1163@kadam>
References: <20200414134629.54567-1-orjan.eide@arm.com>
 <20200414141849.55654-1-orjan.eide@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200414141849.55654-1-orjan.eide@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9592 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004160067
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9592 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160067
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 14, 2020 at 04:18:47PM +0200, Ørjan Eide wrote:
> @@ -238,6 +242,10 @@ static void ion_unmap_dma_buf(struct dma_buf_attachment *attachment,
>  			      struct sg_table *table,
>  			      enum dma_data_direction direction)
>  {
> +	struct ion_dma_buf_attachment *a = attachment->priv;
> +
> +	a->mapped = false;

Possibly a stupid question but here we're not holding a lock.  Is
concurrency an issue?

> +
>  	dma_unmap_sg(attachment->dev, table->sgl, table->nents, direction);
>  }
>  
> @@ -297,6 +305,8 @@ static int ion_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>  
>  	mutex_lock(&buffer->lock);
>  	list_for_each_entry(a, &buffer->attachments, list) {
> +		if (!a->mapped)
> +			continue;
>  		dma_sync_sg_for_cpu(a->dev, a->table->sgl, a->table->nents,
>  				    direction);
>  	}

regards,
dan carpenter


