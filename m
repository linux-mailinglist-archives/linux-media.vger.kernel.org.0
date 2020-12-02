Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0C52CC00F
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 15:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbgLBOtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 09:49:14 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:45136 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbgLBOtO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 09:49:14 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B2EcweO072239;
        Wed, 2 Dec 2020 14:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=F94BZ6EiqRazcXmrkYEHvqtwAOcB7RoOXNSrA81tQlo=;
 b=QItMScL+fPMJRfcJkmBP9gmz66ijgjc8ENM5sk+NE0rH5bdgf0BdBABiEQgWG2Y56ivB
 x+tFSwU/wPZijO3zkdZgzLF+dK9hr0/a+ZvneMtv0Ptk4tnfjdgJFXaiGEUmqlfFiyNT
 Xy7i4X8s9hKFAehPgOI7wU53c4B8dkpNgbdaD+PMGbzuBexnm5+bfAB2m1YsSkyFlexo
 L3qOnT/no7oAfx07QsRE+iXsgwleV7IIyitnEEv/y2vGQcRIIWI4eBAHDXGi1y9yxwXH
 7FR+R7kNsYRHuxnNfehTY8k4n70b4/ORvP8LWdJCc14oB/k8QGxApPeoXmB93AHuNUk4 ag== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 353egkrmq3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 02 Dec 2020 14:48:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B2EfN5V191281;
        Wed, 2 Dec 2020 14:48:31 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 3540fyuh3j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 02 Dec 2020 14:48:31 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B2EmTNm028412;
        Wed, 2 Dec 2020 14:48:30 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 02 Dec 2020 06:48:27 -0800
Date:   Wed, 2 Dec 2020 17:48:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: ov2740: allow OTP data access during streaming
Message-ID: <X8epMQZcpSx0xLiZ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=3
 phishscore=0 mlxlogscore=791 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=3
 phishscore=0 mlxlogscore=818 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012020090
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Bingbu Cao,

This is a semi-automatic email about new static checker warnings.

The patch 5e6fd339b68d: "media: ov2740: allow OTP data access during 
streaming" from Nov 13, 2020, leads to the following Smatch complaint:

    drivers/media/i2c/ov2740.c:609 ov2740_load_otp_data()
    warn: variable dereferenced before check 'nvm' (see line 603)

drivers/media/i2c/ov2740.c
   601  static int ov2740_load_otp_data(struct nvm_data *nvm)
   602	{
   603		struct i2c_client *client = nvm->client;
                                            ^^^^^^^^^^^
Dereference

   604		struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
   605		u32 isp_ctrl00 = 0;
   606		u32 isp_ctrl01 = 0;
   607		int ret;
   608	
   609		if (!nvm)
                    ^^^^
Checked too late.

   610			return -EINVAL;
   611	

regards,
dan carpenter
