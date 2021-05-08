Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D75F3771E5
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 14:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhEHMuA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 08:50:00 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:41748 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhEHMt7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 08:49:59 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 148CmqjP053809;
        Sat, 8 May 2021 12:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=SBx3deiTVeEuoX0w7ieKjdDS48e8ft7buEKWAF3U1pM=;
 b=LVguNhDNcxCLr8CCRBHSjZO+uuUQb/c+JMEfX5Gg36eJbMTmWoHxIdnN+wxhFOZiVQ+R
 InZSnp9/xd8OpL6btqVVWdbuMclLbFpfb0Hz+16C0NDZtDk/e7y9hbGlE96jQRgMqOtX
 /U2Ec4GQ11EkW3h6yZqxwHcpRtS558fwOiqh5LOFB+/U1jfHoYX6hTMmhFR841Js34d2
 KaL5Xgcz/teVlAtRu8/6+DYanhEuvogvnYoYSizhr0Wj4p7g4gr9aBzx6ZuMU43iFzwG
 yczOdk/E2/fKaium6jB7RP/W0tvLJ+k9MX0NPqSfZRxSoJVhBBW2nDmKAXTTeOUXFuRq vw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 38dg5b8gun-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 08 May 2021 12:48:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 148CTnHe106768;
        Sat, 8 May 2021 12:48:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 38dhyjuhq5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 08 May 2021 12:48:51 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 148CmooG140142;
        Sat, 8 May 2021 12:48:51 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 38dhyjuhnk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 08 May 2021 12:48:50 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 148Cmn8R016622;
        Sat, 8 May 2021 12:48:49 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 08 May 2021 05:48:48 -0700
Date:   Sat, 8 May 2021 15:48:41 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     Pavel Skripkin <paskripkin@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] staging: media: atomisp: remove useless returns
Message-ID: <20210508124841.GM1955@kadam>
References: <cover.1620475909.git.paskripkin@gmail.com>
 <f5b8abd8a92fcdd9b0ec49902d4363bc35c86218.1620475909.git.paskripkin@gmail.com>
 <20210508124334.GA1403@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508124334.GA1403@agape.jhs>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: P7_qWKZjJCPx_hUMwk6ha3HJUI3Y7HkL
X-Proofpoint-ORIG-GUID: P7_qWKZjJCPx_hUMwk6ha3HJUI3Y7HkL
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9977 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105080093
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 08, 2021 at 02:43:35PM +0200, Fabio Aiuto wrote:
> Hi Pavel,
> 
> On Sat, May 08, 2021 at 03:21:52PM +0300, Pavel Skripkin wrote:
> > Breaks are not useful at the end of void function,
> > they can simply be removed.
> 
> this commit description is not really describing the changes that
> have been made
> 

Pavel clearly intended to say "Returns" instead of "Breaks".  But when
you're complaining about commit messages please write a better one so
the people can cut and paste it.

regards,
dan carpenter

