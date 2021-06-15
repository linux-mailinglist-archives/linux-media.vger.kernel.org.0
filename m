Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220523A7FBD
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 15:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhFONbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 09:31:55 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58297 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231651AbhFONbY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 09:31:24 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id t97zlm180hqltt982lrlMH; Tue, 15 Jun 2021 15:29:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623763758; bh=+imYr7Q3leZ01q1T2ltFEv2bDZNu+vrKNCA9U1m3V4A=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=X0mvNeqrcWmNmZiTuwsqSz+/ZGSoE+ok1zqWHjfh/qrqI0YvRxvnF6bhWt7baPBOy
         ftwYi290YKv2gch2psHBoGv3hfK6N+ZTOTdW+UOre+a9EuTvuXDppdJPnS6Vvse9/E
         tlhxccrxkKxFdlpurENQT0KqZPz+l5GertEiskFSuFwgaMoc9zZZg+Jbkv6+f83LUX
         Q/LyuyJ44aASFZm9cEA+QPBsoaUBQvM3B5XfOTnGVC+AhHF/1tsnvweYTUvsGlXv0N
         SdgDspqOaoIQAtZJnyuzDyLWvf8/NTWTbIfJzvWq+UC5LZ46bRm7B22/69CwlBl7XX
         eRGNbtP/7zv3Q==
Subject: Re: [PATCH v2] cec: add Deck Control wake-up handling tests
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <20210614135338.8838-1-deborahbrouwer3563@gmail.com>
 <23d440c3-6f4c-1765-b79e-b2f920c35c0a@xs4all.nl>
Message-ID: <c4ce938a-f4da-14be-e52d-97efe4aada60@xs4all.nl>
Date:   Tue, 15 Jun 2021 15:29:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <23d440c3-6f4c-1765-b79e-b2f920c35c0a@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEmEyk6hdiIfuahnFiqtWTUn6nRsiHUq+seP1GoE342rPBQQTUSyBznpKn4pzuGOT0zSyumwNFOCDBzUvMCVKuk4Kx6u7lDytkG1RSLnyfnVcRmp/rjQ
 AA+oHQXV6skhl5PJVowkyEjgsKBFH5Std0YvNz6haS+Aoq/3MdUjdwjoPx1VrnZWFd4wCMs7SD8wNUjTnpcu6Hpvo3T9naJnmNGnKqIsZr1iblb2cD79WNv1
 iEE30fY2WUC5k+jjNXF05vYn/24IabpDzbGnnDNOUp8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/06/2021 10:08, Hans Verkuil wrote:
> Hi Deb,
> 
> On 14/06/2021 15:53, Deborah Brouwer wrote:
>> Test that a deck in standby will wake up upon receiving the Deck Control
>> messages Eject or Play Forward.
>>
>> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
>> ---
>> This is part of an Outreachy project to expand the testing of
>> Deck Control messages as handled by CEC adapters.
>>
>> Changes since v2:
>> 	- move tests to cec-test-power.cpp
>> 	- check if deck control is supported by sending REQ_ONCE
>> 	- use a single function that accepts different ops
>>
>>  utils/cec-compliance/cec-compliance.h   |  1 +
>>  utils/cec-compliance/cec-test-power.cpp | 58 +++++++++++++++++++++++++
>>  utils/cec-compliance/cec-test.cpp       |  1 +
>>  utils/cec-follower/cec-processing.cpp   |  2 +
>>  4 files changed, 62 insertions(+)
>>
>> diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
>> index 818181ab..057f42c4 100644
>> --- a/utils/cec-compliance/cec-compliance.h
>> +++ b/utils/cec-compliance/cec-compliance.h
>> @@ -468,5 +468,6 @@ extern const vec_remote_subtests standby_subtests;
>>  extern const vec_remote_subtests one_touch_play_subtests;
>>  extern const vec_remote_subtests power_status_subtests;
>>  extern const vec_remote_subtests standby_resume_subtests;
>> +extern const vec_remote_subtests deck_ctl_standby_resume_subtests;
>>  
>>  #endif
>> diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
>> index bc88eca7..49241093 100644
>> --- a/utils/cec-compliance/cec-test-power.cpp
>> +++ b/utils/cec-compliance/cec-test-power.cpp
>> @@ -652,3 +652,61 @@ const vec_remote_subtests standby_resume_subtests{
>>  	{ "Wake up TV on Text View On", CEC_LOG_ADDR_MASK_TV, standby_resume_wakeup_text_view_on },
>>  	{ "Power State Transitions", CEC_LOG_ADDR_MASK_TV, power_state_transitions, false, true },
>>  };
>> +
>> +static int standby_resume_wakeup_deck(struct node *node, unsigned me, unsigned la, bool interactive, __u8 opcode)
>> +{
>> +	struct cec_msg msg = {};
>> +
>> +	cec_msg_init(&msg, me, la);
>> +	cec_msg_give_deck_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
>> +	fail_on_test(!transmit_timeout(node, &msg));
>> +	if (timed_out_or_abort(&msg))
>> +		return OK_NOT_SUPPORTED;
>> +
>> +	unsigned unresponsive_time = 0;
>> +
>> +	fail_on_test(!poll_stable_power_status(node, me, la, CEC_OP_POWER_STATUS_ON, unresponsive_time));
>> +
>> +	int ret = standby_resume_standby(node, me, la, interactive);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	cec_msg_init(&msg, me, la);
>> +	if (opcode == CEC_OP_PLAY_MODE_PLAY_FWD)
>> +		cec_msg_play(&msg, CEC_OP_PLAY_MODE_PLAY_FWD);
>> +	else
>> +		cec_msg_deck_control(&msg, CEC_OP_DECK_CTL_MODE_EJECT);
>> +	fail_on_test(!transmit_timeout(node, &msg));
>> +	fail_on_test(cec_msg_status_is_abort(&msg));
>> +
>> +	unresponsive_time = 0;
>> +	fail_on_test(!poll_stable_power_status(node, me, la, CEC_OP_POWER_STATUS_ON, unresponsive_time));
>> +	fail_on_test(interactive && !question("Is the device in On state?"));
>> +
>> +	return OK;
>> +}
>> +
>> +
>> +static int standby_resume_wakeup_deck_eject(struct node *node, unsigned me, unsigned la, bool interactive)
>> +{
>> +	return standby_resume_wakeup_deck(node, me, la, interactive, CEC_OP_DECK_CTL_MODE_EJECT);
>> +}
>> +
>> +static int standby_resume_wakeup_deck_play(struct node *node, unsigned me, unsigned la, bool interactive)
>> +{
>> +	return standby_resume_wakeup_deck(node, me, la, interactive, CEC_OP_PLAY_MODE_PLAY_FWD);
>> +}
>> +
>> +const vec_remote_subtests deck_ctl_standby_resume_subtests{
> 
> Space before {
> 
> Also, make this static and make it part of the 'Standby/Resume and Power Status'
> tests, do not add this to the deck control tests.
> 
> The reason is that these power status tests should all be done at the end, not
> in the middle of other tests.

Sorry, it's been a while since I last looked at this. This shouldn't be a separate
vector of tests, instead...

> 
> Regards,
> 
> 	Hans
> 
>> +	{
>> +		"Deck Eject Standby Resume",
>> +		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
>> +		standby_resume_wakeup_deck_eject,
>> +	},
>> +	{
>> +		"Deck Play Standby Resume",
>> +		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
>> +		standby_resume_wakeup_deck_play,
>> +	}

... add these to the existing standby_resume_subtests.

Regards,

	Hans

>> +};
>> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
>> index 283abe43..cd50c52d 100644
>> --- a/utils/cec-compliance/cec-test.cpp
>> +++ b/utils/cec-compliance/cec-test.cpp
>> @@ -1658,6 +1658,7 @@ static const remote_test tests[] = {
>>  	{ "Remote Control Passthrough feature", TAG_REMOTE_CONTROL_PASSTHROUGH, rc_passthrough_subtests },
>>  	{ "Device Menu Control feature", TAG_DEVICE_MENU_CONTROL, dev_menu_ctl_subtests },
>>  	{ "Deck Control feature", TAG_DECK_CONTROL, deck_ctl_subtests },
>> +	{ "Deck Control Standby/Resume", TAG_STANDBY_RESUME, deck_ctl_standby_resume_subtests },
>>  	{ "Tuner Control feature", TAG_TUNER_CONTROL, tuner_ctl_subtests },
>>  	{ "One Touch Record feature", TAG_ONE_TOUCH_RECORD, one_touch_rec_subtests },
>>  	{ "Timer Programming feature", TAG_TIMER_PROGRAMMING, timer_prog_subtests },
>> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
>> index 876e0bc0..5385b335 100644
>> --- a/utils/cec-follower/cec-processing.cpp
>> +++ b/utils/cec-follower/cec-processing.cpp
>> @@ -561,6 +561,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>>  
>>  		switch (play_mode) {
>>  		case CEC_OP_PLAY_MODE_PLAY_FWD:
>> +			exit_standby(node);
>>  			deck_state = CEC_OP_DECK_INFO_PLAY;
>>  			break;
>>  		case CEC_OP_PLAY_MODE_PLAY_REV:
>> @@ -618,6 +619,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>>  			node->state.deck_skip_start = 0;
>>  			break;
>>  		case CEC_OP_DECK_CTL_MODE_EJECT:
>> +			exit_standby(node);
>>  			deck_state = CEC_OP_DECK_INFO_NO_MEDIA;
>>  			node->state.deck_skip_start = 0;
>>  			break;
>>
> 

