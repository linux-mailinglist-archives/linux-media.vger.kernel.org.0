Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8A7B34B1
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 08:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729732AbfIPG3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 02:29:01 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41278 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728040AbfIPG3A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 02:29:00 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8G6Subn013864;
        Mon, 16 Sep 2019 06:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=Em7C6s5bdBtM/8kSKj+piR5+1PhSuqxGmjk8Lbe0Vto=;
 b=XeYM3ZysZE9hXwPA4HKSFbr5HQVNJwM1qTWBpHuHR/P0dB0gzJRhHNnO11vOnUAXRgnS
 VeklTi+aK+u6vPRLG59l89OVji3gmBhlV4+r7JQeEuBqhzSnA2vV5VAjQt6GBDN06WcH
 7MrUiCZEJdIRUVNmEU0JgqkhklRK+mXmnKclbN8cJ62guVSxD9ap3pwanuyW2dwWcd6F
 X4et3DohMO7aWYpZVcmAQsgbrGI1DQyrPpqL1dGEC+mFAzbldblKXx9QTGQdEXKgjo1l
 28admtAoEer60nb2uT65vEyxtBagXLZH5neDwmn0R/nFLVDTKf9kBtCkLoeBZYaYubL6 JA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2v0ruqd9ay-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 Sep 2019 06:28:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8G6SCBW121235;
        Mon, 16 Sep 2019 06:28:56 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 2v0nb40yu0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 Sep 2019 06:28:56 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8G6Ss7W008236;
        Mon, 16 Sep 2019 06:28:55 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 15 Sep 2019 23:28:54 -0700
Date:   Mon, 16 Sep 2019 09:28:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l: cadence: Fix how unsued lanes are handled in
 'csi2rx_start()'
Message-ID: <20190916062846.GD18977@kadam>
References: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
 <20190913075709.t35ggip624tybd6l@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913075709.t35ggip624tybd6l@localhost.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9381 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=941
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909160069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9381 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909160069
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 13, 2019 at 09:57:09AM +0200, Maxime Ripard wrote:
> Hi Christophe,
> 
> On Thu, Sep 12, 2019 at 10:44:50PM +0200, Christophe JAILLET wrote:
> > The 2nd parameter of 'find_first_zero_bit()' is a number of bits, not of
> > bytes. So use 'BITS_PER_LONG' instead of 'sizeof(lanes_used)'.
> > 
> > Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > This patch is purely speculative. Using BITS_PER_LONG looks logical to me,
> > but I'm not 100% sure that it is what is expected here. 'csi2rx->max_lanes'
> > could also be a good candidate.
> 
> Yeah, csi2rx->max_lanes would make more sense in that context. Could
> you resend a new version?

This is sort of unrelated, but for Smatch purposes the csi2rx->max_lanes
comes from the firmware in csi2rx_parse_dt() and it could be any u8
value.

I sort of wish that people would write code which was known to be
correct just from reading the kernel code, without looking at the
firmware...  I guess I could mark v4l2_fwnode_endpoint_parse() as always
giving us valid data, but that still wouldn't tell us what the valid
data is.  It's hard to know the right answer from a static analysis
point of view.

regards,
dan carpenter

