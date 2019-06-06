Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91C213747C
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 14:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfFFMqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 08:46:21 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45842 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFMqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 08:46:20 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x56ChqtW003123;
        Thu, 6 Jun 2019 12:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
 bh=suyPrwakIpx4/GT/1pO6R0rUGM7UxiWyf4SfHp3I1Gg=;
 b=z1VhShHb2i7HnW0uk6ZwccsbeHFgBJW4/hx22fhDyqH28AJ8xAcapEeLDVpLjk9rbrMW
 UisNBRZh0n+QqG1pVdBjtjrz1Mxr/rvvYdsTOEuevBWAk0FoGOSTj6HF8fIVUzRI051K
 mb7wXoROtxyO9AHeQFBky8CcvcAMh+oGHExVMojIgLxKzhneo1dr/j9xe6XwHQmJTEMH
 JLOi6Jjyc56J3HJTAEdiryvLWQKNNw3awF7CGTCPufdE975bApnwDw7SP5clqDMbGYWo
 XO/xt7wN8y+m8aZWAhjmwx7VCtLdFqxZKgJw8lNUag1KkZxTNMpW3JuUh5HLiPVb6e9R jw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2sugstr6hv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 Jun 2019 12:45:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x56ChtjB099122;
        Thu, 6 Jun 2019 12:45:50 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2swngje01v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 Jun 2019 12:45:49 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x56Cjho5021500;
        Thu, 6 Jun 2019 12:45:43 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 06 Jun 2019 05:45:42 -0700
Date:   Thu, 6 Jun 2019 15:45:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, paul.kocialkowski@bootlin.com,
        wens@csie.org, mchehab@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/7] media: cedrus: Fix decoding for some H264 videos
Message-ID: <20190606124533.GN31203@kadam>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
 <20190530211516.1891-4-jernej.skrabec@siol.net>
 <20190603115536.j5lan6wtmbxpoe2k@flea>
 <2536664.ljALn0aKaT@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2536664.ljALn0aKaT@jernej-laptop>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9279 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=769
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906060091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9279 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=802 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906060091
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 03, 2019 at 05:37:17PM +0200, Jernej Škrabec wrote:
> Dne ponedeljek, 03. junij 2019 ob 13:55:36 CEST je Maxime Ripard napisal(a):
> > int current = 0;
> > 
> > while (current < num) {
> >     int tmp = min(num - current, 32);
> > 
> >     cedrus_write(dev, VE_H264_TRIGGER_TYPE, 0x3 | (current << 8))
                                                       ^^^^^^^
This should be "tmp << 8" instead of "current << 8" though.


> >     while (...)
> >        ...
> > 
> >     current += tmp;
> > }
> 

regards,
dan carpenter
