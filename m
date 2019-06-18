Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4542349F2F
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 13:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbfFRL3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 07:29:21 -0400
Received: from mout2.fh-giessen.de ([212.201.18.46]:48592 "EHLO
        mout2.fh-giessen.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729612AbfFRL3V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 07:29:21 -0400
Received: from mx3.fh-giessen.de ([212.201.18.28])
        by mout2.fh-giessen.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hdCIg-00020r-Rs; Tue, 18 Jun 2019 13:29:18 +0200
Received: from mailgate-3.its.fh-giessen.de ([212.201.18.34])
        by mx3.fh-giessen.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hdCIg-000H0T-Mz; Tue, 18 Jun 2019 13:29:18 +0200
Received: from p4ffcdd17.dip0.t-ipconnect.de ([79.252.221.23] helo=[192.168.1.60])
        by mailgate-3.its.fh-giessen.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <tobias.johannes.klausmann@mni.thm.de>)
        id 1hdCIg-000AcO-ES; Tue, 18 Jun 2019 13:29:18 +0200
Subject: Re: [bug report] media: stv090x: Implement probe/remove for stv090x
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-media@vger.kernel.org
References: <20190618105314.GA8418@mwanda>
From:   Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Message-ID: <6b03dd33-46b2-ed7e-6f3b-c6f47a1815ca@mni.thm.de>
Date:   Tue, 18 Jun 2019 13:29:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618105314.GA8418@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Dan,

yes you are right! Yet this was already reported to the Mailinglist and 
a patch was provided [1], which will hopefully be pushed to linux-media 
git repository.

[1]https://patchwork.linuxtv.org/patch/56811/

Never the less, thanks for the bugreport!

Tobias


Am 18.06.19 um 12:53 schrieb Dan Carpenter:
> Hello Tobias Klausmann,
>
> The patch eb5005df886b: "media: stv090x: Implement probe/remove for
> stv090x" from May 29, 2019, leads to the following static checker
> warning:
>
> 	drivers/media/dvb-frontends/stv090x.c:5032 stv090x_probe()
> 	warn: 'state' was already freed.
>
> drivers/media/dvb-frontends/stv090x.c
>    4994  static int stv090x_probe(struct i2c_client *client,
>    4995                           const struct i2c_device_id *id)
>    4996  {
>    4997          int ret = 0;
>    4998          struct stv090x_config *config = client->dev.platform_data;
>    4999
>    5000          struct stv090x_state *state = NULL;
>    5001
>    5002          state = kzalloc(sizeof(*state), GFP_KERNEL);
>    5003          if (!state) {
>    5004                  ret = -ENOMEM;
>    5005                  goto error;
>    5006          }
>    5007
>    5008          state->verbose                          = &verbose;
>    5009          state->config                           = config;
>    5010          state->i2c                              = client->adapter;
>    5011          state->frontend.ops                     = stv090x_ops;
>    5012          state->frontend.demodulator_priv        = state;
>    5013          state->demod                            = config->demod;
>    5014                                                  /* Single or Dual mode */
>    5015          state->demod_mode                       = config->demod_mode;
>    5016          state->device                           = config->device;
>    5017                                                  /* default */
>    5018          state->rolloff                          = STV090x_RO_35;
>    5019
>    5020          ret = stv090x_setup_compound(state);
>    5021          if (ret)
>    5022                  goto error;
>
> stv090x_setup_compound() frees "state" on error.
>
>    5023
>    5024          i2c_set_clientdata(client, state);
>    5025
>    5026          /* setup callbacks */
>    5027          config->get_dvb_frontend = stv090x_get_dvb_frontend;
>    5028
>    5029          return 0;
>    5030
>    5031  error:
>    5032          kfree(state);
>                  ^^^^^^^^^^^^
> Double free.
>
>    5033          return ret;
>    5034  }
>
> regards,
> dan carpenter
