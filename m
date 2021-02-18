Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E210031EA01
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 13:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233201AbhBRMog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 07:44:36 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:47084 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbhBRKro (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 05:47:44 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11IAf8nt191305;
        Thu, 18 Feb 2021 10:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=DkIB6cqMedrzHSkwL1PZcrM4aHbF3RlvHi1R4O/JB1s=;
 b=jdNHZhY+QWg5MKXzNi9DkiSCQqUTZDjnqRofrInKaGVr1Xc9yYRB322ch/tMUrmViive
 9ZQdFqq4wWJ3Tz87Kp/DQ8uwPmTaCmgwFji4e+xaWPpaxurKGDMp8ynLosEnczLXxrgy
 0RC/hNY48+YIoWhwvlfZl2TZEnKbIleSttJSA+4WtbI9ta03Xf+/XaQ3GDXrhKvrjeYE
 h8WQsf1ZVYq4jvA+HnNGkqwMbIC4Zk5wnmOg3ozEenZRvRNrVMwEX79nQrr9HpZuwl7g
 GDM3pnXTHly5QFwtBEVTtK+pygnh9Bj5cTtnacvQWbvWOU4GYAAmcP6DnIQ87ergbK5j 7w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 36p7dnne2g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Feb 2021 10:46:27 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11IAk8hu090043;
        Thu, 18 Feb 2021 10:46:25 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 36prq0amnd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Feb 2021 10:46:25 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11IAkCeM017093;
        Thu, 18 Feb 2021 10:46:15 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 18 Feb 2021 02:46:11 -0800
Date:   Thu, 18 Feb 2021 13:45:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl,
        devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v1 03/18] arm64: dts: imx8mq-evk: add reserve memory node
 for CMA region
Message-ID: <20210218104558.GD2087@kadam>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
 <20210217080306.157876-4-benjamin.gaignard@collabora.com>
 <ab14f5a0bde2bdcd4bb0128f76e5a3ba8e7b0894.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab14f5a0bde2bdcd4bb0128f76e5a3ba8e7b0894.camel@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9898 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180095
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9898 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102180094
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 17, 2021 at 04:39:49PM -0300, Ezequiel Garcia wrote:
> Hi Benjamin,
> 
> On Wed, 2021-02-17 at 09:02 +0100, Benjamin Gaignard wrote:
> > Define allocation range for the default CMA region.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> Despite it seems like I signed-off this one...
> 

I've been puzzled by this as well.  :P

Signed-off-by means you either wrote the patch or you handled it in some
way.  And it is intended as a legally binding document that you didn't
sneak in any copyrighted code from SCO UNIXWARE (etc).  So like maybe
the authors snuck some in or maybe a maintainer took the patch and
sneaked some unixware code in.

Obviously if you sign the code, that counts as an Ack and Review as well
because maintainers are going to only merge stuff if they've looked it
over a bit.  But the main thing is that it means you didn't didn't
violate any copyrights.

regards,
dan carpenter

