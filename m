Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2893B2B77
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 11:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhFXJeV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 05:34:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:52516 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231970AbhFXJeU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 05:34:20 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15O9Vlns002948;
        Thu, 24 Jun 2021 09:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=yQ5M4SHM0BfFTHs4PPzwWpd1szbr4vVmioMOXnO1cO0=;
 b=bQaiF/bi8p43MLn5iZDRoOoq6Hrn3KvbBkgiorU7QzKrM08VPzjWdv2DvHzDp8JCSv2G
 BEoRJwvGlkIyPgeUkzN3U0VQTdiIQZhDc6bHsg0DR24Q58ID2a5JxeYb3ko+H7jOWIZp
 F4LNIrL7BrdzOt5y1bHd/ah73FhTzOzle4++vvGE6GKDz+e9YCxr4C4iNI94KupqmZhP
 f1147zRKDtuuOi/t+oovTqHcG+gaMT/5M8UP8c3q1znrD6WPfKaus0tNUJATzxX9ZZwZ
 qVx29e5shw0FM5VUNuAQB1nJu9T0bgcJhObHlgx3EbfwqtoTFCDh6JWsMJoMlTGGcexP lw== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 39c8tw9hqe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 24 Jun 2021 09:31:47 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15O9Vhvh186376;
        Thu, 24 Jun 2021 09:31:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 3995q0gxqe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 24 Jun 2021 09:31:43 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15O9VhTf186348;
        Thu, 24 Jun 2021 09:31:43 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 3995q0gxpq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 24 Jun 2021 09:31:43 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15O9VeBW025519;
        Thu, 24 Jun 2021 09:31:41 GMT
Received: from kadam (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 24 Jun 2021 09:31:40 +0000
Date:   Thu, 24 Jun 2021 12:31:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Yizhuo <yzhai003@ucr.edu>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: fix the uninitialized use and rename
 "retvalue"
Message-ID: <20210624093133.GD2040@kadam>
References: <20210624031719.11157-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624031719.11157-1-yzhai003@ucr.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: f8qJNJp0lkgxrrmAuCR6Z5m5CitlvNX-
X-Proofpoint-GUID: f8qJNJp0lkgxrrmAuCR6Z5m5CitlvNX-
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 03:17:17AM +0000, Yizhuo wrote:
> Inside function mt9m114_detect(), variable "retvalue" could
> be uninitialized if mt9m114_read_reg() returns error, however, it
> is used in the later if statement, which is potentially unsafe.
> 
> The local variable "retvalue" is renamed to "model" to avoid
> confusion.
> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>

Please add a Fixes tag.

regards,
dan carpenter

