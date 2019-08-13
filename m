Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 547C18B768
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfHMLos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:44:48 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:48383 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725953AbfHMLos (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:44:48 -0400
Received: from [IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531] ([IPv6:2001:420:44c1:2579:155e:93d7:78eb:5531])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xVE4hL1bvqTdhxVE7h9SYk; Tue, 13 Aug 2019 13:44:46 +0200
Subject: Re: [PATCH v6 3/8] tda9950: use cec_notifier_cec_adap_(un)register
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Dariusz Marcinkiewicz <darekm@google.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kees Cook <keescook@chromium.org>,
        Colin Ian King <colin.king@canonical.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20190813110300.83025-1-darekm@google.com>
 <20190813110300.83025-4-darekm@google.com>
 <20190813113209.GF13294@shell.armlinux.org.uk>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <49f41f61-2094-f372-5ae8-c923e03d055f@xs4all.nl>
Date:   Tue, 13 Aug 2019 13:44:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190813113209.GF13294@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPgxnnsf4H4jmOgOUipcBW3rPmtlY2lHvQZ7sJK+FTC5QUHRPe7Z4toqC9rDKmV+UtbETpTrgTRAzdX+EfgcUcc59f+i9XLi+uyGhspj8SpzmcN+JFQI
 ByrJlAEefHMYdx9LLPklpP95A7D9q0hpWmgFccn7lFxXTu0mEsRqaA7vQCugRSz3DT9OuG8wxzDFGW/cSpzO6IbgZFKBQsVVHLvPL1w+OrE+0hzJ9Ns66ydw
 Et71agSIpUWaSMr+/cq+DKASLQPufmxgGvpKmYeKCLcS5Q7rhDL6qVAOT+h6DgSvz8xN+2qsQuHa+fF66u5PpvzwjWwoW/8JkAivwfn1rlZ9m50uUTlaJc/1
 Yv9AGi6D0HatL2sXyb7Iml8kdzKI4YcR6t5A1WQGIf4+MFppfxATZOVZ0RYRDwcBySFu/GnNhQ8nsUZL6CMCDX+4hA3EQO9lAyb+uM0qPKk4KIkauA6NvYUn
 wv7NhVbltiN4RRg5cG1n2q8f9LdOgAwGMACeBbfgnmKRf43lo/ctZWdGyoI0N/X8BkJjZQTTJb+y6xsJFNmNoVYjrm+DmzRGt8CaoOlBPQLsDfaUAmiRVAUM
 xazaMOLmFnuHJBgL8HZH+XRrc9td9fTY0dnzfBKK7xq5FaAgyY8EM5sIZCLy+WG8nBvNQZLDl6eAe+g0BRE/NlcAUqAMCI+00V3U6C6cOGe5lg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/13/19 1:32 PM, Russell King - ARM Linux admin wrote:
> On Tue, Aug 13, 2019 at 01:02:35PM +0200, Dariusz Marcinkiewicz wrote:
>> Use the new cec_notifier_cec_adap_(un)register() functions to
>> (un)register the notifier for the CEC adapter.
>>
>> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/gpu/drm/i2c/tda9950.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
>> index 8039fc0d83db4..a5a75bdeb7a5f 100644
>> --- a/drivers/gpu/drm/i2c/tda9950.c
>> +++ b/drivers/gpu/drm/i2c/tda9950.c
>> @@ -420,7 +420,8 @@ static int tda9950_probe(struct i2c_client *client,
>>  		priv->hdmi = glue->parent;
>>  
>>  	priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
>> -					  CEC_CAP_DEFAULTS,
>> +					  CEC_CAP_DEFAULTS |
>> +					  CEC_CAP_CONNECTOR_INFO,
>>  					  CEC_MAX_LOG_ADDRS);
>>  	if (IS_ERR(priv->adap))
>>  		return PTR_ERR(priv->adap);
>> @@ -457,13 +458,14 @@ static int tda9950_probe(struct i2c_client *client,
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	priv->notify = cec_notifier_get(priv->hdmi);
>> +	priv->notify = cec_notifier_cec_adap_register(priv->hdmi, NULL,
>> +						      priv->adap);
>>  	if (!priv->notify)
>>  		return -ENOMEM;
>>  
>>  	ret = cec_register_adapter(priv->adap, priv->hdmi);
>>  	if (ret < 0) {
>> -		cec_notifier_put(priv->notify);
>> +		cec_notifier_cec_adap_unregister(priv->notify);
>>  		return ret;
>>  	}
>>  
>> @@ -473,8 +475,6 @@ static int tda9950_probe(struct i2c_client *client,
>>  	 */
>>  	devm_remove_action(dev, tda9950_cec_del, priv);
>>  
>> -	cec_register_cec_notifier(priv->adap, priv->notify);
>> -
>>  	return 0;
>>  }
>>  
>> @@ -482,8 +482,8 @@ static int tda9950_remove(struct i2c_client *client)
>>  {
>>  	struct tda9950_priv *priv = i2c_get_clientdata(client);
>>  
>> +	cec_notifier_cec_adap_unregister(priv->notify);
>>  	cec_unregister_adapter(priv->adap);
>> -	cec_notifier_put(priv->notify);
> 
> It looks weird to have an unexpectedly different ordering of
> unregistration from the registration path - normally, unregistration
> is the reverse order of initialisation.
> 
> In the initialisation path, it seems that we register the notifier
> and _then_ the adapter.  Here, we unregister the notifier and then
> the adapter rather than what would normally be expected.  Why is
> this?  I suspect there will be drivers created that do this the
> "normal" way round, so if this is a requirement, it needs to be made
> plainly obvious.

It's not a requirement, it just feels better to do it in this order
since cec_unregister_adapter will in general also delete the adapter
(unless an application keeps the cec device open).

So the order is actually: allocate_adapter, then register notifier
and: unregister notifier, then unregister (and typically delete) adapter

Regards,

	Hans

> 
>>  
>>  	return 0;
>>  }
>> -- 
>> 2.23.0.rc1.153.gdeed80330f-goog
>>
>>
> 

