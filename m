Return-Path: <linux-media+bounces-11919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 633118CFB60
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 10:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E598A1F21ABF
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 08:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE2A53389;
	Mon, 27 May 2024 08:27:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8B44D59F;
	Mon, 27 May 2024 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716798435; cv=none; b=EOVo0GcTzxlcE9C1Ugx0lGmhYTeZpqfvQKPAoWaWzO12cuJDaZxTtd6keovOpBdL8t9HthrVLNvO2Fs6ecV7A6Wg3Nv+b1o8+HytTwMhYYKqP5GfMB9D0U843AjslLl1FzbNZ7Z+KCP0Nbuh/zqXOte5Tul5POqRMRRMqU74sDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716798435; c=relaxed/simple;
	bh=zUE6pPT76PHtvUaIgPgs0DAmlWvRn84at9iQJw0SZZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rMALbBpfBuMwSkY5QNVboPNisKYgNHBwhTgc1z5kUPwQ7nag+wSzN/OoBzxv2Kc/JIonSMa/dJnY4Sqf/A0EZps5NIUf/EnStYZz9+Uds/A6o8vme8u4KHPwuK87vnVavFiEwr0SptjeC8eDH+Er3Vya8q8xsABnciQY6uHDGkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4VnpZJ1C6yz1S5m8;
	Mon, 27 May 2024 16:23:36 +0800 (CST)
Received: from dggpeml500012.china.huawei.com (unknown [7.185.36.15])
	by mail.maildlp.com (Postfix) with ESMTPS id CC0DC1A016C;
	Mon, 27 May 2024 16:27:09 +0800 (CST)
Received: from [10.67.111.172] (10.67.111.172) by
 dggpeml500012.china.huawei.com (7.185.36.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 27 May 2024 16:27:09 +0800
Message-ID: <e3af2eda-8239-a3ca-9d8b-9f31dcbb83f0@huawei.com>
Date: Mon, 27 May 2024 16:27:09 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] media: dvb-usb: Fix unexpected infinite loop in
 dvb_usb_read_remote_control()
To: Sean Young <sean@mess.org>
CC: <mchehab@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>
References: <20240412135256.1546051-1-zhengyejian1@huawei.com>
 <20240430104137.1014471-1-zhengyejian1@huawei.com>
 <ZjTPqR3_EhbNU-fm@gofer.mess.org>
Content-Language: en-US
From: Zheng Yejian <zhengyejian1@huawei.com>
In-Reply-To: <ZjTPqR3_EhbNU-fm@gofer.mess.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500012.china.huawei.com (7.185.36.15)

On 2024/5/3 19:51, Sean Young wrote:
> On Tue, Apr 30, 2024 at 06:41:37PM +0800, Zheng Yejian wrote:
>> Infinite log printing occurs during fuzz test:
>>
>>    rc rc1: DViCO FusionHDTV DVB-T USB (LGZ201) as ...
>>    ...
>>    dvb-usb: schedule remote query interval to 100 msecs.
>>    dvb-usb: DViCO FusionHDTV DVB-T USB (LGZ201) successfully initialized ...
>>    dvb-usb: bulk message failed: -22 (1/0)
>>    dvb-usb: bulk message failed: -22 (1/0)
>>    dvb-usb: bulk message failed: -22 (1/0)
>>    ...
>>    dvb-usb: bulk message failed: -22 (1/0)
>>
>> Looking into the codes, there is a loop in dvb_usb_read_remote_control(),
>> that is in rc_core_dvb_usb_remote_init() create a work that will call
>> dvb_usb_read_remote_control(), and this work will reschedule itself at
>> 'rc_interval' intervals to recursively call dvb_usb_read_remote_control(),
>> see following code snippet:
>>
>>    rc_core_dvb_usb_remote_init() {
>>      ...
>>      INIT_DELAYED_WORK(&d->rc_query_work, dvb_usb_read_remote_control);
>>      schedule_delayed_work(&d->rc_query_work,
>>                            msecs_to_jiffies(rc_interval));
>>      ...
>>    }
>>
>>    dvb_usb_read_remote_control() {
>>      ...
>>      err = d->props.rc.core.rc_query(d);
>>      if (err)
>>        err(...)  // Did not return even if query failed
>>      schedule_delayed_work(&d->rc_query_work,
>>                            msecs_to_jiffies(rc_interval));
>>    }
>>
>> When the infinite log printing occurs, the query callback
>> 'd->props.rc.core.rc_query' is cxusb_rc_query(). And the log is due to
>> the failure of finding a valid 'generic_bulk_ctrl_endpoint'
>> in usb_bulk_msg(), see following code snippet:
>>
>>    cxusb_rc_query() {
>>      cxusb_ctrl_msg() {
>>        dvb_usb_generic_rw() {
>>          ret = usb_bulk_msg(d->udev, usb_sndbulkpipe(d->udev,
>>                             d->props.generic_bulk_ctrl_endpoint),...);
>>          if (ret)
>>            err("bulk message failed: %d (%d/%d)",ret,wlen,actlen);
>>            ...
>>        }
>>    ...
>>    }
>>
>> By analyzing the corresponding USB descriptor, it shows that the
>> bNumEndpoints is 0 in its interface descriptor, but
>> the 'generic_bulk_ctrl_endpoint' is 1, that means user don't configure
>> a valid endpoint for 'generic_bulk_ctrl_endpoint', therefore this
>> 'invalid' USB device should be rejected before it calls into
>> dvb_usb_read_remote_control().
>>
>> To fix it, we need to add endpoint check for 'generic_bulk_ctrl_endpoint'.
>> And as Sean suggested, the same check and clear halts should be done for
>> 'generic_bulk_ctrl_endpoint_response'. So introduce
>> dvb_usb_check_bulk_endpoint() to do it for both of them.
>>
>> Fixes: 4d43e13f723e ("V4L/DVB (4643): Multi-input patch for DVB-USB device")
>> Signed-off-by: Zheng Yejian <zhengyejian1@huawei.com>
>> ---
>>   drivers/media/usb/dvb-usb/dvb-usb-init.c | 27 ++++++++++++++++++++----
>>   1 file changed, 23 insertions(+), 4 deletions(-)
>>
>> v2:
>>   - As Sean suggested, check endpoint and clear halt for both
>>     'generic_bulk_ctrl_endpoint' and 'generic_bulk_ctrl_endpoint_response'
>>     with the new introduced dvb_usb_check_bulk_endpoint();
>>     Link: https://lore.kernel.org/all/ZjCl97Ww6NrzJQCB@gofer.mess.org/
>>     Link: https://lore.kernel.org/all/ZjC7rXU7ViaH60_S@gofer.mess.org/
>>
>>   - Add Fixes tag.
>>
>> v1:
>>   - Link: https://lore.kernel.org/all/20240412135256.1546051-1-zhengyejian1@huawei.com/
>>
>> diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
>> index fbf58012becd..7eb321bab84f 100644
>> --- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
>> +++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
>> @@ -23,6 +23,23 @@ static int dvb_usb_force_pid_filter_usage;
>>   module_param_named(force_pid_filter_usage, dvb_usb_force_pid_filter_usage, int, 0444);
>>   MODULE_PARM_DESC(force_pid_filter_usage, "force all dvb-usb-devices to use a PID filter, if any (default: 0).");
>>   
>> +static int dvb_usb_check_bulk_endpoint(struct dvb_usb_device *d, u8 endpoint)
>> +{
>> +	if (endpoint) {
>> +		int ret;
>> +
>> +		ret = usb_pipe_type_check(d->udev, usb_sndbulkpipe(d->udev, endpoint));
>> +		if (ret)
>> +			return ret;
>> +		ret = usb_pipe_type_check(d->udev, usb_rcvbulkpipe(d->udev, endpoint));
>> +		if (ret)
>> +			return ret;
>> +		usb_clear_halt(d->udev, usb_sndbulkpipe(d->udev, endpoint));
>> +		usb_clear_halt(d->udev, usb_rcvbulkpipe(d->udev, endpoint));
>> +	}
>> +	return 0;
>> +}
>> +
>>   static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
>>   {
>>   	struct dvb_usb_adapter *adap;
>> @@ -103,10 +120,12 @@ static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
>>   	 * when reloading the driver w/o replugging the device
>>   	 * sometimes a timeout occurs, this helps
>>   	 */
>> -	if (d->props.generic_bulk_ctrl_endpoint != 0) {
>> -		usb_clear_halt(d->udev, usb_sndbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
>> -		usb_clear_halt(d->udev, usb_rcvbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
>> -	}
>> +	ret = dvb_usb_check_bulk_endpoint(d, d->props.generic_bulk_ctrl_endpoint);
>> +	if (ret)
>> +		goto frontend_init_err;
>> +	ret = dvb_usb_check_bulk_endpoint(d, d->props.generic_bulk_ctrl_endpoint_response);
>> +	if (ret)
>> +		goto frontend_init_err;
>>   
>>   	return 0;
> 
> This results in the following warning:
> 
> drivers/media/usb/dvb-usb/dvb-usb-init.c:133:9: warning: 'adap' may be used uninitialized [-Wmaybe-uninitialized]
> 
> I think these tests should be moved to the top of the function, so no cleanup
> is required.
> 

Hi, Sean,

I have fixed the warning in v3: https://lore.kernel.org/all/20240509124414.1392304-1-zhengyejian1@huawei.com/,
would you mind taking a look at it ?
I introduce a new funciton dvb_usb_clear_halt() to clear sndbulkpipe and rcvbulkpipe,
dvb_usb_check_bulk_endpoint() only do pipe type check and is moved to the top of
the function.

--
Thanks,
Zheng Yejian

> 
> Sean


