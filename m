Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB5C3C4D6A
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 12:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243920AbhGLHNG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 03:13:06 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:43981 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241559AbhGLHHn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 03:07:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 2pzWmJfXdhqx92pzXmWPOI; Mon, 12 Jul 2021 09:04:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626073475; bh=yQqpXrVSdhAoUJWKa4M1quVKh5vDl6e/2UfRZJp6KPk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FiIpUu3YNiK9Slnk/9LDcbx1C+BpOGziAVt5qYOR41/4ZdAJIt3XhTaQ3mIrO+PtW
         V5j5F7l7yl5t3lcfx7yxjvGIWGhqyN+MuHCZXFNvRHTsLCxtg/5eltVaP6LZxAR4hI
         1FZg7hLB2knEFrlJ3N8Ahknr0S6Wm9RDs0gwK1dOLUffLbQYwmczK4sXCBhUvWXA9o
         7EJA+QcwTM5HErpc5zG1YUQTbYFEom7BiHqteon6uRgSDVBHjUrVkZki2DsXXV+foH
         idyEBpALKXuYO4nDr8nx+Z7ugxOyRX5bG+Bw1OGLzmLjftHxABgPx7d9KnBsMq85KQ
         cEJolmjpYMsdA==
Subject: Re: [PATCH v3 2/2] cec-follower: emulate programmed timer recordings
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1625962440.git.deborahbrouwer3563@gmail.com>
 <b940889da47bc1c636993d9c7a93892eb18fa252.1625962440.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8eb5344f-7540-4715-6567-db28ec53b05d@xs4all.nl>
Date:   Mon, 12 Jul 2021 09:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b940889da47bc1c636993d9c7a93892eb18fa252.1625962440.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC8M3Yg28TLIt0dwffZAGD17jswXHdluVIHRsJdp+gICwJlYod+m/HTlsdI6nmRHv3aYz71I57rEb6+0BQ6w/AXKOaSKa5bubbcSZXDQoesO6LmLVc5v
 FsCx7ikcF3peMkchGBNLLDuWbKkz40Wq/edqVS3s6QV+uF9Lv8IuxZtjPhwAkoUvxFmY3+TMfFpYOMW/rz3M/hMCTm+pk9dUsTByJV6wwwcpLrNYTzDO2qQu
 /lD7LOoqXiB1enakLfGnol1zkEh20Ha0pV302tRoOt5skDMyksmHyyPoXayx/kkPvCAe4o+XgHEx00vCACJuVbGooMY6qyJhpHP8YopoX5UoqHc7G4OJaU6/
 lVVmSR6x
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/07/2021 02:37, Deborah Brouwer wrote:
> Start and stop recording as timers are scheduled. Schedule future timers
> if a completed timer has a recording sequence. Delete overlapped and
> unfinished timers. Reduce available media space when a recording is
> completed.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-follower/cec-follower.cpp   |  5 +++
>  utils/cec-follower/cec-follower.h     |  1 +
>  utils/cec-follower/cec-processing.cpp | 56 +++++++++++++++++++++++++++
>  utils/cec-follower/cec-tuner.cpp      | 26 ++++++++++---
>  4 files changed, 83 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index b273b988..0adf6ce8 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -301,6 +301,10 @@ void print_timers(struct node *node)
>  {
>  	if (show_info) {
>  		printf("Timers Set:\n");
> +		if (node->state.recording_controlled_by_timer)
> +			printf("Deck is currently recording from the first timer.\n");
> +		if (node->state.one_touch_record_on && !node->state.recording_controlled_by_timer)
> +			printf("Deck is currently recording independent of timers.\n");
>  		for (auto &t : programmed_timers) {
>  			std::string start = ctime(&t.start_time);
>  			time_t end_time = t.start_time + t.duration;
> @@ -373,6 +377,7 @@ void state_init(struct node &node)
>  	node.state.one_touch_record_on = false;
>  	node.state.record_received_standby = false;
>  	node.state.media_space_available = 36000; /* In MB; space for 10 hours @ 1MB/sec */
> +	node.state.recording_controlled_by_timer = false;
>  	tuner_dev_info_init(&node.state);
>  	node.state.last_aud_rate_rx_ts = 0;
>  }
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index 69c96aa7..7b22368b 100644
> --- a/utils/cec-follower/cec-follower.h
> +++ b/utils/cec-follower/cec-follower.h
> @@ -60,6 +60,7 @@ struct state {
>  	bool one_touch_record_on;
>  	bool record_received_standby;
>  	int media_space_available;
> +	bool recording_controlled_by_timer;
>  	time_t toggle_power_status;
>  	__u64 last_aud_rate_rx_ts;
>  };
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 32375966..2987cb99 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -1164,6 +1164,62 @@ void testProcessing(struct node *node, bool wallclock)
>  			node->state.deck_skip_start = 0;
>  			update_deck_state(node, me, CEC_OP_DECK_INFO_PLAY);
>  		}
> +
> +		if (!programmed_timers.empty()) {
> +			std::set<struct Timer>::iterator it = programmed_timers.begin();
> +			/* Use the current minute because timers do not have second precision. */
> +			time_t current_minute = time(nullptr) / 60;
> +			time_t timer_start_minute = it->start_time / 60;
> +			time_t timer_end_minute = (it->start_time + it->duration) / 60;
> +
> +			/* Start the timed recording only if the deck is not already recording. */
> +			if (timer_start_minute == current_minute && !node->state.one_touch_record_on) {
> +				node->state.one_touch_record_on = true;
> +				node->state.recording_controlled_by_timer = true;
> +				print_timers(node);
> +			}
> +
> +			/* Delete an overlapped timer. Recording will be at best incomplete. */
> +			if (timer_start_minute < current_minute &&
> +			    (!node->state.recording_controlled_by_timer || !node->state.one_touch_record_on)) {
> +				programmed_timers.erase(*it);
> +				if (show_info)
> +					printf("Deleted overlapped timer.\n");
> +				print_timers(node);
> +			}
> +
> +			/* Delete finished timers. */
> +			if (timer_end_minute == current_minute && node->state.recording_controlled_by_timer) {
> +				node->state.one_touch_record_on = false;
> +				node->state.recording_controlled_by_timer = false;
> +				node->state.media_space_available -= it->duration; /* 1 MB per second */
> +				/*
> +				 * TODO: We are only ever decreasing the amount of space available,
> +				 * there is no heuristic that reclaims the space.
> +				 */
> +
> +				if (it->recording_seq) {
> +					struct tm last_start_time = *(localtime(&(it->start_time)));
> +					int next_wday = (last_start_time.tm_wday + 1) % 7;
> +					int days_to_move_ahead = 1;
> +
> +					while ((it->recording_seq & (1 << next_wday)) == 0) {
> +						days_to_move_ahead++;
> +						next_wday = (next_wday + 1) % 7;
> +					}
> +					struct Timer next_timer = {};
> +					next_timer = *it;
> +					last_start_time.tm_mday += days_to_move_ahead;
> +					last_start_time.tm_isdst = -1;
> +					next_timer.start_time = mktime(&last_start_time);
> +					programmed_timers.insert(next_timer);
> +				}
> +				programmed_timers.erase(*it);
> +				if (show_info)
> +					printf("Deleted finished timer.\n");
> +				print_timers(node);
> +			}
> +		}
>  	}
>  	mode = CEC_MODE_INITIATOR;
>  	doioctl(node, CEC_S_MODE, &mode);
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index 544cb662..37e2de24 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -864,6 +864,16 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  		cec_msg_record_status(&msg, CEC_OP_RECORD_STATUS_TERMINATED_OK);
>  		transmit(node, &msg);
>  		node->state.one_touch_record_on = false;
> +
> +		/* Delete any currently active recording timer or it may restart itself in first minute. */
> +		if (node->state.recording_controlled_by_timer) {
> +			node->state.recording_controlled_by_timer = false;
> +			std::set<struct Timer>::iterator it = programmed_timers.begin();
> +			programmed_timers.erase(*it);

I think you can just do:

			programmed_timers.erase(programmed_timers.begin());

> +			if (show_info)
> +				printf("Deleted manually stopped timer.\n");
> +			print_timers(node);
> +		}
>  		/*
>  		 * If standby was received during recording, enter standby when the
>  		 * recording is finished unless recording device is the active source.
> @@ -946,12 +956,18 @@ void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, uns
>  			break;
>  
>  		__u8 timer_cleared_status = CEC_OP_TIMER_CLR_STAT_NO_MATCHING;
> -		struct Timer timer = get_timer_from_message(msg);
>  
> -		if (programmed_timers.find(timer) != programmed_timers.end()) {
> -			timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
> -			programmed_timers.erase(timer);
> -			print_timers(node);
> +		if (node->state.one_touch_record_on && node->state.recording_controlled_by_timer) {
> +			timer_cleared_status = CEC_OP_TIMER_CLR_STAT_RECORDING;
> +			/* TODO: Allow other timers to be cleared while one timer is recording. */

I don't understand this TODO.

Can't you just do:

		auto it = programmed_timers.find(timer);
		if (it != programmed_timers.end()) {
			if (node->state.one_touch_record_on && node->state.recording_controlled_by_timer &&
			    it == programmed_timers.begin()) {
				timer_cleared_status = CEC_OP_TIMER_CLR_STAT_RECORDING;
				// Also stop the recording at this time, updating the state accordingly.
			} else {
				timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
			}
			programmed_timers.erase(timer);
			print_timers(node);
		}

> +		} else {
> +			struct Timer timer = get_timer_from_message(msg);
> +
> +			if (programmed_timers.find(timer) != programmed_timers.end()) {
> +				timer_cleared_status = CEC_OP_TIMER_CLR_STAT_CLEARED;
> +				programmed_timers.erase(timer);
> +				print_timers(node);
> +			}
>  		}
>  		cec_msg_set_reply_to(&msg, &msg);
>  		cec_msg_timer_cleared_status(&msg, timer_cleared_status);
> 

