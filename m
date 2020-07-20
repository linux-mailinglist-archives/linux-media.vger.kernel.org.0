Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC39225A22
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 10:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgGTIe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 04:34:29 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:38584 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728024AbgGTIe1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 04:34:27 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06K8WNwB093440;
        Mon, 20 Jul 2020 08:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=xpaW2B9941YB0NweNGEDZrsGofKWzgtxk2QzTD/4JrQ=;
 b=tPvgmFapTBAxYadM93ygaKWhRMck8GqGDNtEd6D8aSmRo+l1HERPXsP+87LNO0Ir0iPH
 YWwb0rUN2wfGP7Y9EGbUgy8S+E2IWahAvX/EGBKNDAaNp6d8bxl8xYRxS/N/cl6Bzz4I
 augqlcm80FXX7Y6rlCR6FdtaTlkOXBYelL2DqMGuqQB6LtnDFeeGpsM0zeSat/ERrjxr
 k3NtpQpX+aXRDwMV7YTqQUkIOCOFRSO5rSsZ/05Bb5EtWiEC7cvWbHfTdybA799Cpow1
 dQswVo+jyL9egYxf96U/Ba4l3hAvQlSRLsUDwI+RiCl/Jxg9IX4lEtJCurdEx0Q6KEJR OA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 32brgr5gu7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jul 2020 08:34:19 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06K8Wvq6006452;
        Mon, 20 Jul 2020 08:34:18 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 32d68g7jpq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jul 2020 08:34:18 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06K8YHSM032622;
        Mon, 20 Jul 2020 08:34:17 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 20 Jul 2020 01:34:15 -0700
Date:   Mon, 20 Jul 2020 11:34:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Suraj Upadhyay <usuraj35@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: Replace depracated MSI APIs
Message-ID: <20200720083409.GF2549@kadam>
References: <20200719142623.GA31565@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200719142623.GA31565@blackclown>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200064
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9687 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200064
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry, this is still not correct.  See comments on other thread.  There
are other msi related code which needs to be updated.

regards,
dan carpenter

