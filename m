Return-Path: <linux-media+bounces-29130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5630BA777F5
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01B4E1688EC
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA701EF38E;
	Tue,  1 Apr 2025 09:41:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0444B1EEA37
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500515; cv=none; b=raP+oG4nXHRPoKhLoeqo4wq8Cd1vJ6kzRg2Et64Ml9miwQK5WRTXSq4cbOsMw1VqGTDRomBTTEShbsPksYqV0yQz3P5ol4vVUJSw7+HzbXs6JfbAYeyFcgK3BGKaM3EwIpD3sRxh/UojH+TqQWcl3TMib9rDPHNKjebOHriC2Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500515; c=relaxed/simple;
	bh=pc5z7Xv0OqhNDbcI/o4tfdT+8L5z/PFHdLlPgnepgy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mv7q35yhcF0fy5X0fII3GBOC6nMhT/hyG/L5V/BpTRvM80Bx4/wo+iMXXKXrjQtL/EqfncS76UpM6AH/lRU1fjVQZN5/8RxdG7jRJ8WGPf/y/3fBqVlPhrnqxLOtDn2QYIACbHIvLGavy/MNCpuR0uldYlAPKV8VKqI2X8e0uDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF11C4CEE5;
	Tue,  1 Apr 2025 09:41:53 +0000 (UTC)
Message-ID: <d6095605-6aeb-4398-b571-38deefd4ca00@xs4all.nl>
Date: Tue, 1 Apr 2025 11:41:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] media: cec: extron-da-hd-4k-plus: Fix
 Wformat-truncation
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
References: <cee8080d-ea46-432c-8241-e7ec81ef691d@xs4all.nl>
 <CANiDSCsrF-OAKg9OSTEwwGWq=6EgJ7MK6XahgONq_3UXuj8DFw@mail.gmail.com>
 <adf3386e-2029-4126-8b15-019240cd91ba@xs4all.nl>
 <CANiDSCt7gjNK=MBgvg-yO+L7kdPPyDgoi4Y8Lyqb1fSnyLJaTg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CANiDSCt7gjNK=MBgvg-yO+L7kdPPyDgoi4Y8Lyqb1fSnyLJaTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/04/2025 11:11, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Tue, 1 Apr 2025 at 10:43, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 01/04/2025 10:30, Ricardo Ribalda wrote:
>>> Hi Hans
>>>
>>> snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
>>>               port->direction, port->port.port,
>>>               cec_msg_initiator(msg), cec_msg_destination(msg), buf);
>>>
>>> Will need:
>>> W -> 1 byte
>>> %c -> 1 byte
>>> %u -> 1 byte port.port  (we might have to add %10 here in case gcc8 is
>>> not clever enough )
>>> * -> 1 byte
>>> %u -> 2 bytes cec_msg_initiator(msg)  (we might have to add %16 here
>>> in case gcc8 is not clever enough )
>>> * -> 1 byte
>>> %u -> 2 bytes  cec_msg_destination(msg) (we might have to add %16 here
>>> in case gcc8 is not clever enough )
>>> %s ->  CEC_MAX_MSG_SIZE * 3 buf
>>
>> Actually, this is at most (CEC_MAX_MSG_SIZE - 1) * 3, since the first byte
>> of the CEC message isn't included in the buffer.
>>
>> So this code is safe.
>>
>> I agree that it could be made a bit clearer, but something for another day.
>>
>> I ran this patch through the CI and it passed the build-ancient job.
> 
> Please check the  full log. I have already added the warning to the
> "allow-list" to move to 6.14

I wasn't aware it was added to the allow-list, so I didn't check the
actual build-ancient log, just the final job status.

I'll prepare a v3.

Regards,

	Hans

> 
> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In
> function 'extron_cec_adap_transmit':
> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44:
> warning: 'DCEC' directive output may be truncated writing 4 bytes into
> a region of size between 1 and 53 [-Wformat-truncation=]
>   snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
>                                             ^~~~
> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:2:
> note: 'snprintf' output between 13 and 65 bytes into a destination of
> size 61
>   snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     port->direction, port->port.port,
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     cec_msg_initiator(msg), cec_msg_destination(msg), buf);
> 
> This does the trick
> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> index cfbfc4c1b2e6..c56db19eaf16 100644
> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> @@ -1003,7 +1003,7 @@ static int extron_cec_adap_transmit(struct
> cec_adapter *adap, u8 attempts,
>  {
>         struct extron_port *port = cec_get_drvdata(adap);
>         char buf[CEC_MAX_MSG_SIZE * 3 + 1];
> -       char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
> +       char cmd[CEC_MAX_MSG_SIZE * 3 + 15];
>         unsigned int i;
> 
>         if (port->disconnected)
> @@ -1012,7 +1012,7 @@ static int extron_cec_adap_transmit(struct
> cec_adapter *adap, u8 attempts,
>         for (i = 0; i < msg->len - 1; i++)
>                 sprintf(buf + i * 3, "%%%02X", msg->msg[i + 1]);
>         snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
> -                port->direction, port->port.port,
> +                port->direction, port->port.port % 10,
>                  cec_msg_initiator(msg), cec_msg_destination(msg), buf);
>         return extron_send_and_wait(port->extron, port, cmd, NULL);
>  }
> 
> 
>>
>> Regards,
>>
>>         Hans
>>
>>> DCEC -> 4 bytes
>>> \0 -> 1 byte
>>>
>>> That is a total of CEC_MAX_MSG_SIZE * 3 + 14. Don't we need to add an
>>> extra byte to cmd?
>>>
>>> char cmd[CEC_MAX_MSG_SIZE * 3 + 14];
>>>
>>> Regards!
>>>
>>> On Tue, 1 Apr 2025 at 10:18, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>
>>>> Change the port type to u8 so gcc8 knows that the port fits in a single
>>>> char.
>>>>
>>>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]
>>>>
>>>> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
>>>> Reported-by: Ricardo Ribalda <ribalda@chromium.org>
>>>> ---
>>>>  drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h   | 2 +-
>>>>  .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c     | 2 +-
>>>>  .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h     | 6 +++---
>>>>  3 files changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h b/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
>>>> index 7422f7c5719e..fa2e02b26565 100644
>>>> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
>>>> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
>>>> @@ -14,7 +14,7 @@ struct cec_splitter;
>>>>  struct cec_splitter_port {
>>>>         struct cec_splitter *splitter;
>>>>         struct cec_adapter *adap;
>>>> -       unsigned int port;
>>>> +       u8 port;
>>>>         bool is_active_source;
>>>>         bool found_sink;
>>>>         ktime_t lost_sink_ts;
>>>> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
>>>> index cfbfc4c1b2e6..c4add8f3f8b4 100644
>>>> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
>>>> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
>>>> @@ -1692,7 +1692,7 @@ static int extron_setup_thread(void *_extron)
>>>>                         log_addrs.all_device_types[0] = CEC_OP_ALL_DEVTYPE_TV;
>>>>                 } else {
>>>>                         snprintf(log_addrs.osd_name, sizeof(log_addrs.osd_name),
>>>> -                                "Splitter Out%u", port->port.port);
>>>> +                                "Splitter Out%u", port->port.port % 10);
>>>>                         log_addrs.log_addr_type[0] = CEC_LOG_ADDR_TYPE_PLAYBACK;
>>>>                         log_addrs.primary_device_type[0] = CEC_OP_PRIM_DEVTYPE_PLAYBACK;
>>>>                         log_addrs.all_device_types[0] = CEC_OP_ALL_DEVTYPE_PLAYBACK;
>>>> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
>>>> index b79f1253ab5d..cd07e90ea32a 100644
>>>> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
>>>> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
>>>> @@ -83,9 +83,9 @@ struct extron {
>>>>         struct serio *serio;
>>>>         /* locks access to serio */
>>>>         struct mutex serio_lock;
>>>> -       unsigned int num_ports;
>>>> -       unsigned int num_in_ports;
>>>> -       unsigned int num_out_ports;
>>>> +       u8 num_ports;
>>>> +       u8 num_in_ports;
>>>> +       u8 num_out_ports;
>>>>         char unit_name[32];
>>>>         char unit_type[64];
>>>>         char unit_fw_version[32];
>>>> --
>>>> 2.47.2
>>>>
>>>
>>>
>>
> 
> 


