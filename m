Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC23D1CB20D
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 16:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbgEHOlN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 10:41:13 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40432 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728174AbgEHOlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 May 2020 10:41:11 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048Ebmmb151195;
        Fri, 8 May 2020 14:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=B1c1c4b7hcwNQpIS66ZNy2hvCK33KO4bX3N1aBJuM1c=;
 b=iBy3sM5gzqqO9TmCpG6EnnQDsryKuEu9BCc9Wl1tZ/U6DZR8IIV/Q1IHr7ERdefSRe1x
 /qmlmoYLrCCUfMhC+Z5QWcORvPJC+jOKphHEe7zpFD/g1tCoo4Blj7Xbn/RVqrAS4uc8
 Rb/mlNaiCth0NyPbN7HHOFKlJ8ZiUxD3lAu9CHKr9HRT1Y425wJ5gwuCv6CK+/yDjPAE
 szwyutASWoLWN/fa8xLJYV9ESwLpUUvU6/bpzvob+7Jg77phEtZVai/NDqBgAzxk73e9
 nfmsu8R1UdzsJIry7UtU7a5JSlA0BB7xOFRbFtp4nuAjkciP5fYkQwqKGjRiwC1f1S88 Nw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 30vtewub98-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 08 May 2020 14:40:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048Eba9h145238;
        Fri, 8 May 2020 14:40:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 30vte02xpu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 08 May 2020 14:40:31 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 048EeUww002334;
        Fri, 8 May 2020 14:40:30 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 08 May 2020 07:40:29 -0700
Date:   Fri, 8 May 2020 17:40:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] firewire: Using uninitialized values in node_probe()
Message-ID: <20200508144022.GB410645@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9614 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005080130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9614 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005080130
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If fw_csr_string() returns -ENOENT, then "name" is uninitialized.  So
then the "strlen(model_names[i]) <= name_len" is true because strlen()
is unsigned and -ENOENT is type promoted to a very high positive value.
Then the "strncmp(name, model_names[i], name_len)" uses uninitialized
data because "name" is uninitialized.

Fixes: 92374e886c75 ("[media] firedtv: drop obsolete backend abstraction")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/firewire/firedtv-fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/firewire/firedtv-fw.c b/drivers/media/firewire/firedtv-fw.c
index 97144734eb052..3f1ca40b9b987 100644
--- a/drivers/media/firewire/firedtv-fw.c
+++ b/drivers/media/firewire/firedtv-fw.c
@@ -272,6 +272,8 @@ static int node_probe(struct fw_unit *unit, const struct ieee1394_device_id *id)
 
 	name_len = fw_csr_string(unit->directory, CSR_MODEL,
 				 name, sizeof(name));
+	if (name_len < 0)
+		return name_len;
 	for (i = ARRAY_SIZE(model_names); --i; )
 		if (strlen(model_names[i]) <= name_len &&
 		    strncmp(name, model_names[i], name_len) == 0)
-- 
2.26.2

