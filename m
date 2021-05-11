Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771F637A057
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 09:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhEKHJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 03:09:27 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:36768 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhEKHJ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 03:09:27 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B6vshZ142125;
        Tue, 11 May 2021 07:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=MtNSXqxJmgXhn1u/vY3Q53qi7aS1ZV0ii69xoMtn1bs=;
 b=sBQuwWS0oe2DiLV0dIwD9eKpZnw6YcbyT9KDFHwxouhCsUpoJ05jhqHMh5MBJE6prRGC
 8SOxmKmkraL84NVk4+g8MJPmPQUmGKd61fbxiBYRyqnMGP2U05u1hNA+0wSjuZ22x8TY
 5C202OAgYVTVtQzbWSGJ/qEr+DpN026zUQciUF5P3jMSfVs/njqcoqozECwMGLrdw2EB
 3JyWVPKQI343dMFNfwJVclAL9F/otyJoifvHZfEbLQkPKaqNpYjoOLI9HwsHjLAJuR92
 ouax/4BWeOq264auIRVo+hsneDP9wOg+X+NOCIMVu+qcThLdVCiEjVQbT5pAjo5q1GM6 HQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 38djkmdmdq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:08:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14B6uc5t101671;
        Tue, 11 May 2021 07:08:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38djf8k8m7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:08:02 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14B73mAu142353;
        Tue, 11 May 2021 07:08:01 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 38djf8k8k5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 May 2021 07:08:01 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14B780Ro007750;
        Tue, 11 May 2021 07:08:00 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 11 May 2021 00:08:00 -0700
Date:   Tue, 11 May 2021 10:07:53 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pavel Skripkin <paskripkin@gmail.com>, mchehab@kernel.org
Cc:     Uladzislau Rezki <urezki@gmail.com>, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in __vmalloc_node_range
Message-ID: <20210511070753.GU1922@kadam>
References: <000000000000fdc0be05c1a6d68f@google.com>
 <20210506142210.GA37570@pc638.lan>
 <20210506145722.GC1955@kadam>
 <20210506180053.4770f495@gmail.com>
 <20210508124630.GN1922@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508124630.GN1922@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: X62SeFBmmEDWN1OEsf7S1xPxLoQvj9oX
X-Proofpoint-ORIG-GUID: X62SeFBmmEDWN1OEsf7S1xPxLoQvj9oX
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9980 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110053
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 08, 2021 at 03:46:30PM +0300, Dan Carpenter wrote:
> I wrote a Smatch check to see if there were more of these and here are
> the other issues that it found.  (I will expant this check to more types
> on Monday).
> 
> drivers/media/usb/dvb-usb-v2/lmedm04.c:1196 (null)() warn: element count is wrong 'lme2510_props.num_adapters=0' vs 'lme2510_props.adapter=2'

This one is fine, but could do with some cleaning up.

> drivers/media/usb/dvb-usb-v2/af9035.c:1997 (null)() warn: element count is wrong 'af9035_props.num_adapters=0' vs 'af9035_props.adapter=2'
> drivers/media/usb/dvb-usb-v2/af9035.c:2043 (null)() warn: element count is wrong 'it930x_props.num_adapters=0' vs 'it930x_props.adapter=2'
> drivers/media/usb/dvb-usb-v2/af9015.c:1409 (null)() warn: element count is wrong 'af9015_props.num_adapters=0' vs 'af9015_props.adapter=2'

These are false positives because they use the .get_adapter_count()
function instead of setting num_adapters.

> drivers/media/usb/dvb-usb/dtt200u.c:384 (null)() warn: element count is wrong 'wt220u_miglia_properties.num_adapters=1' vs 'wt220u_miglia_properties.adapter=0'

I'm not sure what's going on with this one...  It still looks buggy to
me.

I did re-run Smatch with more elem/count pairs checked and there were
no bugs found.  A bunch of drivers think you need to add a zeroed
element at the end of the .devices[] array so someone could delete that
if they wanted.

drivers/media/usb/dvb-usb/vp702x.c:374 (null)() warn: element count is wrong 'vp702x_properties.num_device_descs=1' vs 'vp702x_properties.devices=2'
drivers/media/usb/dvb-usb/vp7045.c:184 (null)() warn: element count is wrong 'vp7045_properties.num_device_descs=2' vs 'vp7045_properties.devices=3'
drivers/media/usb/dvb-usb/cinergyT2-core.c:206 (null)() warn: element count is wrong 'cinergyt2_properties.num_device_descs=1' vs 'cinergyt2_properties.devices=2'
drivers/media/usb/dvb-usb/digitv.c:300 (null)() warn: element count is wrong 'digitv_properties.num_device_descs=1' vs 'digitv_properties.devices=2'
drivers/media/usb/dvb-usb/dibusb-mc.c:48 (null)() warn: element count is wrong 'dibusb_mc_properties.num_device_descs=8' vs 'dibusb_mc_properties.devices=9'
drivers/media/usb/dvb-usb/pctv452e.c:963 (null)() warn: element count is wrong 'pctv452e_properties.num_device_descs=1' vs 'pctv452e_properties.devices=2'
drivers/media/usb/dvb-usb/pctv452e.c:1015 (null)() warn: element count is wrong 'tt_connect_s2_3600_properties.num_device_descs=2' vs 'tt_connect_s2_3600_properties.devices=3'
drivers/media/usb/dvb-usb/gp8psk.c:324 (null)() warn: element count is wrong 'gp8psk_properties.num_device_descs=4' vs 'gp8psk_properties.devices=5'
drivers/media/usb/dvb-usb/nova-t-usb2.c:168 (null)() warn: element count is wrong 'nova_t_properties.num_device_descs=1' vs 'nova_t_properties.devices=2'
drivers/media/usb/dvb-usb/dibusb-mb.c:267 (null)() warn: element count is wrong 'dibusb1_1_an2235_properties.num_device_descs=2' vs 'dibusb1_1_an2235_properties.devices=3'
drivers/media/usb/dvb-usb/dibusb-mb.c:335 (null)() warn: element count is wrong 'dibusb2_0b_properties.num_device_descs=2' vs 'dibusb2_0b_properties.devices=3'
drivers/media/usb/dvb-usb/dibusb-mb.c:398 (null)() warn: element count is wrong 'artec_t1_usb2_properties.num_device_descs=1' vs 'artec_t1_usb2_properties.devices=2'
drivers/media/usb/dvb-usb/af9005.c:1015 (null)() warn: element count is wrong 'af9005_properties.num_device_descs=3' vs 'af9005_properties.devices=4'
drivers/media/usb/dvb-usb/dtt200u.c:176 (null)() warn: element count is wrong 'dtt200u_properties.num_device_descs=1' vs 'dtt200u_properties.devices=2'
drivers/media/usb/dvb-usb/dtt200u.c:228 (null)() warn: element count is wrong 'wt220u_properties.num_device_descs=1' vs 'wt220u_properties.devices=2'
drivers/media/usb/dvb-usb/dtt200u.c:280 (null)() warn: element count is wrong 'wt220u_fc_properties.num_device_descs=1' vs 'wt220u_fc_properties.devices=2'
drivers/media/usb/dvb-usb/dtt200u.c:332 (null)() warn: element count is wrong 'wt220u_zl0353_properties.num_device_descs=1' vs 'wt220u_zl0353_properties.devices=2'
drivers/media/usb/dvb-usb/dtt200u.c:384 (null)() warn: element count is wrong 'wt220u_miglia_properties.num_device_descs=1' vs 'wt220u_miglia_properties.devices=2'
drivers/media/usb/dvb-usb/az6027.c:1096 (null)() warn: element count is wrong 'az6027_properties.num_device_descs=8' vs 'az6027_properties.devices=9'

regards,
dan carpenter
