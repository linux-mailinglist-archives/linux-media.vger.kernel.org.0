Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADB0B49EA8
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 12:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbfFRKxf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 06:53:35 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41338 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfFRKxf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 06:53:35 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5IAmuVf120952;
        Tue, 18 Jun 2019 10:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=VFo0tmnQOwK6DoFqlP1O8ooMyonB41TzSpfcto5mko4=;
 b=e/asscSNeDLB+Y7nGFfVC8SpfOLcZNL5zfqTVomEyl9ENfwa9Id5MwSn5B/vHFl7BVrv
 wQR9oWiAh7YTN5io5dLBC/pW3tRyGbV8pdiLpVxYhgJHYkhSB4DTFoUwYh7e4Lj8qoe8
 NrDvLl5yo6As80eZNEjt/StNKxTDed4c+mSKpkcUqpwtj/JCh63KytlRwSE0D9dfCvF9
 oUrJlCAxKLsLsHow/MUcp+fHFRgZtVsP35v47xq6mB0OSCUXYr26qrS49FRDOxvrA6g/
 Zmb9RBWtoN2GWdKOuNZXEcnZ/T9r5itU+8iX5kDFQbCdEFIwT7FNO3CKRNTq+ayW892I 4A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2t4saqbnh5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Jun 2019 10:53:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5IAqiAF001723;
        Tue, 18 Jun 2019 10:53:23 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2t5mgbvnvf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 18 Jun 2019 10:53:23 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5IArLmT002474;
        Tue, 18 Jun 2019 10:53:21 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 18 Jun 2019 03:53:21 -0700
Date:   Tue, 18 Jun 2019 13:53:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     tobias.johannes.klausmann@mni.thm.de
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: stv090x: Implement probe/remove for stv090x
Message-ID: <20190618105314.GA8418@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=997
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906180090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9291 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906180090
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Tobias Klausmann,

The patch eb5005df886b: "media: stv090x: Implement probe/remove for
stv090x" from May 29, 2019, leads to the following static checker
warning:

	drivers/media/dvb-frontends/stv090x.c:5032 stv090x_probe()
	warn: 'state' was already freed.

drivers/media/dvb-frontends/stv090x.c
  4994  static int stv090x_probe(struct i2c_client *client,
  4995                           const struct i2c_device_id *id)
  4996  {
  4997          int ret = 0;
  4998          struct stv090x_config *config = client->dev.platform_data;
  4999  
  5000          struct stv090x_state *state = NULL;
  5001  
  5002          state = kzalloc(sizeof(*state), GFP_KERNEL);
  5003          if (!state) {
  5004                  ret = -ENOMEM;
  5005                  goto error;
  5006          }
  5007  
  5008          state->verbose                          = &verbose;
  5009          state->config                           = config;
  5010          state->i2c                              = client->adapter;
  5011          state->frontend.ops                     = stv090x_ops;
  5012          state->frontend.demodulator_priv        = state;
  5013          state->demod                            = config->demod;
  5014                                                  /* Single or Dual mode */
  5015          state->demod_mode                       = config->demod_mode;
  5016          state->device                           = config->device;
  5017                                                  /* default */
  5018          state->rolloff                          = STV090x_RO_35;
  5019  
  5020          ret = stv090x_setup_compound(state);
  5021          if (ret)
  5022                  goto error;

stv090x_setup_compound() frees "state" on error.

  5023  
  5024          i2c_set_clientdata(client, state);
  5025  
  5026          /* setup callbacks */
  5027          config->get_dvb_frontend = stv090x_get_dvb_frontend;
  5028  
  5029          return 0;
  5030  
  5031  error:
  5032          kfree(state);
                ^^^^^^^^^^^^
Double free.

  5033          return ret;
  5034  }

regards,
dan carpenter
