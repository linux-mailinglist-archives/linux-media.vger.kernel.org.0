Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7B51551A0
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730464AbfFYO0Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:26:16 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:36531 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730545AbfFYO0Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:26:16 -0400
Received: from [IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b] ([IPv6:2001:420:44c1:2579:b032:593c:25fc:ff9b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fmOehQpEISfvXfmOhhHkpo; Tue, 25 Jun 2019 16:26:14 +0200
Subject: Re: [PATCHv8 03/13] cec: add new notifier functions
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
 <20190624160330.38048-4-hverkuil-cisco@xs4all.nl>
 <CALFZZQGDAxTMk1uVVNwXZRVqsgLULmrCQF_BznpYL1MdSGgu6g@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d7e89672-3a7f-0cea-3c65-135ccc0867f7@xs4all.nl>
Date:   Tue, 25 Jun 2019 16:26:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CALFZZQGDAxTMk1uVVNwXZRVqsgLULmrCQF_BznpYL1MdSGgu6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCVU7bawREtAh090a3YWPJl7wpQ85LJic30amvjrWhtrgles0qGVeYvJJ1/7PVCbwML9zGJ3XDVz+qytrZR6CpgXv0oSLDJHPvc/x65SPsyOa6WCDdCn
 003PkSsQ5oRy2YTNSZiRgXTYDD67a/12Q3cfd0HzvCS34O8+2Sfm9fNKsCHgIusLz16r+Jk7x8bXj/qx37XKmcFF8KJ3vsXmyoKHO2lVLV2AOOf5V4b6GmQZ
 jlZexQoeCT1BgzW/6xhwz33NG8DI2Akyq/xZEq33iTx0n+NIXxpyUOGBhcdaYp9hoPlbCLnJqaX8z5R6OffPC82OTgjwWhZw8+o0tYEbTelPEYLsAD9pBWNK
 OSzmniZLhcis//s3LbjwoD+4/eXXiy7G6MNlGgjUkhFw8lwSCws=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/25/19 3:48 PM, Dariusz Marcinkiewicz wrote:
> Hello.
> 
> Some small comments/questions.
> 
> On Mon, Jun 24, 2019 at 6:03 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
> ...
>> @@ -22,9 +22,11 @@ struct cec_notifier {
>>         struct list_head head;
>>         struct kref kref;
>>         struct device *hdmi_dev;
>> +       struct cec_connector_info conn_info;
>>         const char *conn_name;
>>         struct cec_adapter *cec_adap;
>>         void (*callback)(struct cec_adapter *adap, u16 pa);
>> +       bool called_cec_notifier_register;
> If I read his correctly callback is set only by cec_notifier_register
> (and not by the cec_notifier_cec_adap_register) so maybe that boolean
> is not needed and just checking if the callback is set is enough to
> tell those 2 cases apart?

True. I'll change this.

> 
> ...
>> +struct cec_notifier *
>> +cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *conn_name,
>> +                              struct cec_adapter *adap)
>> +{
>> +       struct cec_notifier *n;
>> +
>> +       if (WARN_ON(!adap))
>> +               return NULL;
>> +
>> +       n = cec_notifier_get_conn(hdmi_dev, conn_name);
>> +       if (!n)
>> +               return n;
>> +
>> +       mutex_lock(&n->lock);
>> +       n->cec_adap = adap;
>> +       adap->conn_info = n->conn_info;
> Would it make sense to use cec_s_conn_info? There is a certain
> asymmetry here  - cec_s_phys_addr is used to configure physical
> address, which also takes the adapter's lock while setting the
> physical address. That lock is not taken while the connector info is
> being set (not sure if that really matters for the code paths that
> would call into this function).

I thought about that, but there is a side-effect if I do that:
both cec_s_conn_info and cec_s_phys_addr send a state_changed
event, and I want to avoid that. Doing it this way ensures that
there will be only one event.

But there is definitely room for improvement here and I want to
work on that for the next kernel.

> 
>> +       adap->notifier = n;
>> +       cec_s_phys_addr(adap, n->phys_addr, false);
>> +       mutex_unlock(&n->lock);
>> +       return n;
>> +}
>> +EXPORT_SYMBOL_GPL(cec_notifier_cec_adap_register);
>> +
>> +void cec_notifier_cec_adap_unregister(struct cec_notifier *n)
>> +{
>> +       if (!n)
>> +               return;
>> +
>> +       mutex_lock(&n->lock);
>> +       memset(&n->cec_adap->conn_info, 0, sizeof(n->cec_adap->conn_info));
> Could cec_s_conn_info be used to reset the connector info?
> Also, we explicitly clear connector info here. Since the notifier
> provides both connector info and physical address, maybe it would make
> sense to clear physical address as well?

Actually, this memset should be removed altogether. The connector info
doesn't change at all, it's just that right after this function is called
the whole CEC adapter will be unregistered. I thought that it might make
sense to zero the connector info, but really I should just leave it alone.

> 
> 
> ...
>>  void cec_notifier_unregister(struct cec_notifier *n)
>>  {
>> +       /* Do nothing unless cec_notifier_register was called first */
>> +       if (!n->called_cec_notifier_register)
> Could this check be made with n->lock held? cec_notifier_register sets
> this value while holding that lock.

It's not needed: you can never have a race here.

BTW, I'll be glad when I can remove these cec_notifier_(un)register
functions, they are pretty ugly and confusing.

Regards,

	Hans

> ...
> 
> 
> Thank you.
> 

