Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3DE68759
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729803AbfGOKuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:50:18 -0400
Received: from ns.iliad.fr ([212.27.33.1]:46052 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729530AbfGOKuS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:50:18 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 193C0205CA;
        Mon, 15 Jul 2019 12:50:17 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 0227920127;
        Mon, 15 Jul 2019 12:50:17 +0200 (CEST)
Subject: Re: [PATCH v1] media: dvb: Add devm_dvb_register_adapter
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc:     Sean Young <sean@mess.org>, Brad Love <brad@nextdimension.cc>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <a69ec163-8515-2e86-e2e7-0da61beda6e1@free.fr>
 <20190712162618.GK22408@latitude>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <9be0aa28-46c2-dac0-19c4-21be4098da1e@free.fr>
Date:   Mon, 15 Jul 2019 12:50:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190712162618.GK22408@latitude>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jul 15 12:50:17 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/07/2019 18:26, Jonathan Neuschäfer wrote:

> On Fri, Jul 12, 2019 at 04:19:20PM +0200, Marc Gonzalez wrote:
>
>> Add devm* variant for automagic resource release.
> 
> S-o-b missing.
> 
>> +int devm_dvb_register_adapter(struct device *dev, struct dvb_adapter *adap,
>> +		const char *name, struct module *module, short *adapter_nums)
>> +{
>> +	int v1, v2;
>> +
>> +	v1 = dvb_register_adapter(adap, name, module, dev, adapter_nums);
>> +	if (v1 < 0)
>> +		return v1;
>> +
>> +	v2 = devm_add_action_or_reset(dev, unregister_adapter, adap);
>> +	if (v2 < 0)
>> +		return v2;
>> +
>> +	return v1;
>> +}
>> +EXPORT_SYMBOL(devm_dvb_register_adapter);
> 
> What non-negative numbers can dvb_register_adapter and
> devm_add_action_or_reset return, and what are their meanings? Why should
> devm_dvb_register_adapter return the (non-negative) return value of
> dvb_register_adapter?
> (I really don't know, because I'm not familiar with the media/DVB subsystem)

It seems the return values of dvb_register_adapter() are not documented in
include/media/dvbdev.h -- Oh well...

Based on my reading of the implementation, dvb_register_adapter() returns
- either -ENFILE on error, or
- an index >= 0 in the dvb_adapter_list

Based on a small sampling of callers, it seems like most don't care about
the index. I'll spin a v2 that returns only 0 on success as you suggested.

I'll update Documentation/driver-model/devres.rst as you pointed out.

Regards.
