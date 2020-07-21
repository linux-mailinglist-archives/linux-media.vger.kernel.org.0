Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6A8227AC6
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 10:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgGUIf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 04:35:56 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40600 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUIf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 04:35:56 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06L8RmZo101671;
        Tue, 21 Jul 2020 08:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=05l1rKdrSgScAm71Y0DqPRHKe7cVAnwHKVSOdGMgmiU=;
 b=y8I+NhcSmMZaPtlYCFH9a8UicnvilJ1IVH0guYVousnBX/P94PP65jFsSU/2xx/oCsWJ
 PVCswmqB+0CH5QkcZ6lK6aQfCZikSM7PjldTf0WUXv+ocZVEw8flw2fuqa5uURssPUuK
 ceKR9dbqu2HkwX0LJo48IJJQiKeEG89kyGnLnjw9ZS2M4Rmm8pStGvXuDTuxnTWjTpmF
 cB6OnBEgdZVHmGTvPCX2lRxK/FhDtlwKm+RDUtI0rJ8Oscf9zMD4BYgTIVLAYrRklTcz
 DPBGxK2q6eMtL/nGoY/lagY6F+NDnvyp+mdjf7ZlAT73q9wYBSj0OFGr5D/oUcYTUT6c RA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 32brgrbtdm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Jul 2020 08:35:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06L8OdwM128229;
        Tue, 21 Jul 2020 08:35:48 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 32dvu00q1s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jul 2020 08:35:48 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06L8Zk5x013293;
        Tue, 21 Jul 2020 08:35:46 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 21 Jul 2020 01:35:46 -0700
Date:   Tue, 21 Jul 2020 11:35:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     B K Karthik <bkkarthik@pesu.pes.edu>, Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fix WARNING in pvr2_i2c_core_done
Message-ID: <20200721083539.GJ2549@kadam>
References: <20200721075642.4cdlzbewml5jwbwm@pesu.pes.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721075642.4cdlzbewml5jwbwm@pesu.pes.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9688 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210059
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9688 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210059
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subject isn't right.  Cc the correct people from get_maintainer.pl

On Tue, Jul 21, 2020 at 01:26:42PM +0530, B K Karthik wrote:
> i2c_acpi_remove_space_handler makes a call to
> kmem_cache_free() through acpi_ut_delete_generic_state
> in drivers/acpi/osl.c. since this removes the kobject,
> there is a warning thrown in i2c_del_adapter. The group
> can not be found because it has already been removed.

The commit message needs to have a cut and paste of the warning.
I don't think you can't ask syzbot to test linux-next when the patch is
not in linux-next.

https://lkml.org/lkml/2019/9/25/302

There was some discussion about this bug in Sept and it looked like the
correct fix was to unregister in the release handler instead of the
disconnect handler.  I'm not sure if the pvr2 maintainers were ever
CC'd about this or if anyone wrote a patch.

regards,
dan carpenter

> 
> Reported-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com
> Signed-off-by: B K Karthik <bkkarthik@pesu.pes.edu>
> ---
>  drivers/i2c/i2c-core-base.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 26f03a14a478..cecf27fcc4f9 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1527,7 +1527,8 @@ void i2c_del_adapter(struct i2c_adapter *adap)
>  		dev_dbg(&adap->dev, "Removing %s at 0x%x\n", client->name,
>  			client->addr);
>  		list_del(&client->detected);
> -		i2c_unregister_device(client);
> +		if (client->dev->kobj)
> +			i2c_unregister_device(client);
>  	}
>  	mutex_unlock(&adap->userspace_clients_lock);
>  
> -- 
> 2.20.1
> 
> -- 
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20200721075642.4cdlzbewml5jwbwm%40pesu.pes.edu.


