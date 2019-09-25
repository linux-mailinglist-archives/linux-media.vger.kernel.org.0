Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 119E1BD8D2
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 09:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442499AbfIYHMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 03:12:32 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:32787 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2442450AbfIYHMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 03:12:31 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id D1TOiB14iKKNGD1TRitao2; Wed, 25 Sep 2019 09:12:30 +0200
Subject: Re: [PATCH v2 1/2] cec-follower: add tuner step increment/decrement
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
 <20190924192445.93575-2-c0d1n61at3@gmail.com>
 <fb849c63-6bac-5d40-f78d-f0ac57250a95@xs4all.nl>
Message-ID: <c56379c6-51e5-0199-1bfc-b1be359ca9a1@xs4all.nl>
Date:   Wed, 25 Sep 2019 09:12:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fb849c63-6bac-5d40-f78d-f0ac57250a95@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAcoXoJoZ5fiMqsHk6nKFXSC/nudp3NI7gEpODqKb3vDhwJmCA1/Zbm7DPcVEeCEk+ZWF88q0CuEqsfGRL3GcQrHteCikiCa4YmS6cje4IC1InBdJoVd
 xpo7KVgYGCHHpi/1RGqtVhgNZYFJfTnfGZkECQ5kyA7p1K3R7vwWHhRVC2L8PEZD4uyWf9G8ylQyKvpt2emlSs2kOa29xv9nn7SM5ousVCQDOrROKrrdzvdp
 UuzL4daUZGRKFqvnrMd0zGwfB3UGmkbfnMlFMY9mHnY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/25/19 8:54 AM, Hans Verkuil wrote:
> Hi Jiunn,
> 
> On 9/24/19 9:24 PM, Jiunn Chang wrote:
>> Tuner step increment/decrement will select the next highest or next
>> lowest service frequency.  There are a total of three possible
>> frequencies from analog_freqs_khz given a broadcast type and system.
>>
>> Opcodes implemented:
>>   - <Tuner Step Increment>
>>   - <Tuner Step Decrement>
>>
>> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
>> ---
>>  utils/cec-follower/cec-tuner.cpp | 47 ++++++++++++++++++++++++++++++--
>>  1 file changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
>> index acc3fd00..1a9b9d90 100644
>> --- a/utils/cec-follower/cec-tuner.cpp
>> +++ b/utils/cec-follower/cec-tuner.cpp
>> @@ -135,6 +135,22 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
>>  	return false;
>>  }
>>  
>> +static int analog_find_freq_index(struct cec_op_tuner_device_info *info)
>> +{
>> +	if (info->analog.ana_freq == 0)
>> +		return -1;
>> +
>> +	int ana_freq_khz = (info->analog.ana_freq * 625) / 10;
>> +
>> +	for (int i = 0; i < NUM_ANALOG_FREQS; i++) {
>> +		int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][i];
>> +
>> +		if (ana_freq_khz == freq)
>> +			return i;
>> +	}
>> +	return -1;
>> +}
> 
> Hmm, I don't like this code. I think that it would be cleaner to just add:
> 
> static unsigned int analog_freq_idx[3][9];
> 
> Which contains the index of the current frequency for each bcast_type/system
> combination.
> 
> This ensures that 1) there always is a current frequency and 2) tuner stepping
> is now trivial since all you need to do is to update the corresponding index.

I've been reading up on this a bit more, and section CEC 13.8.2 states that the
Tuner Step commands cycle through a set of services defined by the tuner device.
But normally it will cycle through all services.

That means that rather than cycling through the frequencies of just the current
bcast_type/system, the follower should cycle through ALL channels, both analog
and digital.

So for analog we really have 3 * 9 * 3 channels, and this will be more once the
digital channels are added.

In any case, this means that there is just a single 'static unsigned int freq_idx;'
and not an array.

Regards,

	Hans

> 
> Now, that said, I was thinking that it would be nice to have one bcast_type/system
> combo with no channels at all, since that's a nice test as well.
> 
> I think that setting secam-lq for satellite to { 0, 0, 0 } to indicate no
> defined channels would make a nice test case.
> 
> Something for a follow-up patch, though.
> 
>> +
>>  void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
>>  {
>>  	bool is_bcast = cec_msg_is_broadcast(&msg);
>> @@ -178,12 +194,37 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>>  		return;
>>  
>>  	case CEC_MSG_SELECT_DIGITAL_SERVICE:
>> -	case CEC_MSG_TUNER_STEP_DECREMENT:
>> -	case CEC_MSG_TUNER_STEP_INCREMENT:
>> -		if (!cec_has_tuner(1 << me))
>> +	case CEC_MSG_TUNER_STEP_DECREMENT: {
>> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
>>  			break;
>> +
>> +		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
>> +		int freq_idx = analog_find_freq_index(info);
>> +		int idx = (freq_idx == 0) ? NUM_ANALOG_FREQS : freq_idx;
>> +
>> +		if (info->is_analog) {
>> +			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][--idx];
>> +
>> +			info->analog.ana_freq = (freq * 10) / 625;
>> +		}
>>  		return;
>> +	}
>> +
>> +	case CEC_MSG_TUNER_STEP_INCREMENT: {
>> +		if (!cec_has_tuner(1 << me) && !cec_has_tv(1 << me))
>> +			break;
>>  
>> +		struct cec_op_tuner_device_info *info = &node->state.tuner_dev_info;
>> +		int freq_idx = analog_find_freq_index(info);
>> +		int idx = (freq_idx == NUM_ANALOG_FREQS - 1) ? -1 : freq_idx;
>> +
>> +		if (info->is_analog) {
>> +			int freq = analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][++idx];
>> +
>> +			info->analog.ana_freq = (freq * 10) / 625;
>> +		}
>> +		return;
>> +	}
>>  
>>  		/*
>>  		  One Touch Record
>>
> 
> Regards,
> 
> 	Hans
> 

