Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 322ACF73D6
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 13:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbfKKM05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 07:26:57 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:46189 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726832AbfKKM05 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 07:26:57 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id U8m2iUcTIQBsYU8m5i67WH; Mon, 11 Nov 2019 13:26:54 +0100
Subject: Re: Seeking help for getting rid of i2c_clients_command()
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-media@vger.kernel.org, Michael Krufky <mkrufky@linuxtv.org>,
        Brad Love <brad@nextdimension.cc>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>
References: <20191110150553.GA8040@kunai>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5209c59d-f0f6-c2c3-5f5a-eedef500eb39@xs4all.nl>
Date:   Mon, 11 Nov 2019 13:26:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191110150553.GA8040@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfODLNaZnOVBuxew/HtR3vzc/B3JSTHuJFEOOqugvRvY2I7lqN3fMtw4jB2ACjK0ogGQSdw/Pql+WnqIM28L0UdaYHf+c4fOnlRGBFRdPudn6Qyy/gHNk
 pTsHTQm4TF6Rtqc3XWnPQJukx0h1jjAGxfTNWSpFh+8RHazAKzOoOoFIG2sEtPykYZeAU7wBPg6TG4RDuWpcyBCquMyXWeFCshm6L8BOP04tdWzdQsoMR86v
 g9KyFu7y0eZHA7DUNEVwp49FkdtZ3itW33j8FL7f81qnrd1Knx0oz+cxle91/FY/xradj0SEFmYGTj3DD8EWhA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/10/19 4:05 PM, Wolfram Sang wrote:
> Hi Hans,
> 
> I know it is 13 years since you wrote that code:
> 
> ba8fc39954bf ("V4L/DVB (4270): Add tda9887-specific tuner configuration")
> 
> There, you added i2c_clients_command() which looks today like this:
> 
> 	i2c_clients_command(priv->i2c_props.adap, TUNER_SET_CONFIG,
> 			    &tda9887_cfg);
> 
> Now, I would like to get rid of the i2c_clients_command() API, and this
> is the one remaining user. While trying to convert it into a local
> function, I started wondering why i2c_clients_command() is used at all.
> Why do we need to try all devices on the bus? A few lines later we have:
> 
> 	tuner_i2c_xfer_send(&priv->i2c_props, buffer, 4);
> 
> so i2c_props.addr seems to have a valid address? Or are there multiple
> tuners on that bus? Can you kindly shed some light on this?

Oh boy... The tuner code is awful for many reasons.

One reason is that for a given video capture card there can be multiple
tuner devices: Analog TV, Digital TV, Analog demodulator and/or radio.

The TUNER_SET_CONFIG command is (AFAICT) only used to configure the
tda9887 (demodulator), and the problem is that when this code was written
the tuner instance that is calling TUNER_SET_CONFIG does not know on which
i2c address the demod is.

TUNER_SET_CONFIG is called whenever the TV or radio frequency is
changed, and when that happens the demod needs to update its configuration
as well. So the tuner_i2c_xfer_send(&priv->i2c_props, buffer, 4); is for the
tuner itself (whose i2c address is known), but i2c_clients_command is
basically broadcasting to anyone on the bus, and only the tda9987 will
actually act on the TUNER_SET_CONFIG command.

However, it looks like this code is only used by hybrid tuners (i.e.
supporting both digital and analog TV), and that the available tuners
are now added to a global list via hybrid_tuner_request_state().

This should make it possible for tuner-simple.c to actually lookup the
i2c address of the demod from that global list and use a direct call.

I've CC-ed a bunch of people who know more about DVB than I do, so
I hope they can double-check that I am on the right track.

Wolfram, do you just want to get rid of i2c_clients_command or the i2c
command() callback as well?

Regardless, it would be nice if we can get rid of the command() callback
in the media subsystem. If I read the code right, then you can get the
tuner struct of an i2c_client using 'struct tuner *t = to_tuner(i2c_get_clientdata(c));'
and from there you can get the analog_demod_ops that you need to
configure the tda9887.

So I think this would work:

1) walk hybrid_tuner_instance_list to find a tuner with name "tda9887" for
   the given i2c_adapter.
2) get the i2c_client from the adapter with address state->i2c_props.addr.
3) struct tuner *t = to_tuner(i2c_get_clientdata(c));
4) if (t->fe.ops.analog_ops.set_config)
	t->fe.ops.analog_ops.set_config(&t->fe, &config);

Regards,

	Hans
