Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D493A3E4B
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 10:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhFKIuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 04:50:55 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55211 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231355AbhFKIuy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 04:50:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id rcqSlBuwThg8ZrcqVlFKOa; Fri, 11 Jun 2021 10:48:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623401336; bh=G1VGqXt89WoewGpVbdFEKa3Clc0rOG+MHsQ5Nvi57lU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tNP/MfBvfp232sQYURJ5IMxsr9fChRKn4gEF8iQ45MFVpL1CD5F6v04tlqhZRNEi2
         TGopVLZKyOc3rznIaG0N5cWNYGapwGpfyJA0p84sYBJJ7EBMFNqBloxhccd1COHNTP
         uKIpH1nt/i02bZiRsh8GJq88PKJao+/Gd6cLXgqYuusP7VAFXCiGUIBjhJXeMdqGel
         6rV1QHd4on/7eXlx0Y8yjYEYAkIgxflr+gXBIWCjdTp7xKpJhaYIh1C9BqCv55k8Ks
         AUMaNpMwMdo6hjpks1RigdKZlu4rNy0M9tgWxH430Ct7wOvm0lgXv/ScPgN5AVH2Vl
         Q12FwBL5gaNdA==
Subject: Re: [PATCH v6 2/3] cec: add tests for Deck Play message
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     jaffe1@gmail.com
References: <cover.1623368302.git.deborahbrouwer3563@gmail.com>
 <8f655634f038f312a32434e1f7c37c3720f0eb57.1623368303.git.deborahbrouwer3563@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <818cc8cf-23c9-333c-603f-70de1493ab6c@xs4all.nl>
Date:   Fri, 11 Jun 2021 10:48:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8f655634f038f312a32434e1f7c37c3720f0eb57.1623368303.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfB3B7u2tGtvuZR+TIwNAiCBbCOgmwsLdDj74gONwboiRZ3YqWRMgCeWzG/BZTF9xVuFS7lDR6uu1ZvUGtCk3GzBZxSXmqjD7l36HakEYewG1IZiuHmqS
 nMRn7coQ4v0scANh2qMMhbqxau1ginszehs+CeKbbPaXTYnDw4Hzem9AQGPKFlzqrca5kSzOHFpskGX8bULavObue7irGx9LkXlSpyl29uNKRDzqCHqpE8r1
 p10YaFgpjxvRbTgd0pOHC0hvcQKGxycs/0Wh83i6nsw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

Some more (small) comments:

On 11/06/2021 01:58, Deborah Brouwer wrote:
> Send all Deck Play commands and check that the follower implements them.
> Test that the follower returns Feature Abort for invalid Play operands.
> 
> Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp     | 100 +++++++++++++++++++++++---
>  utils/cec-follower/cec-processing.cpp |  70 +++++++++++++++++-
>  2 files changed, 156 insertions(+), 14 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 83be6b73..f2ec4e90 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -33,6 +33,20 @@ static int deck_status_get(struct node *node, unsigned me, unsigned la, __u8 &de
>  	return OK;
>  }
>  
> +static int test_play_mode(struct node *node, unsigned me, unsigned la, __u8 play_mode, __u8 expected)
> +{
> +	struct cec_msg msg = {};
> +	__u8 deck_status;
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_play(&msg, play_mode);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	fail_on_test(cec_msg_status_is_abort(&msg)); /* Assumes deck has media. */
> +	fail_on_test(deck_status_get(node, me, la, deck_status));
> +	fail_on_test(deck_status != expected);
> +
> +	return OK;
> +}
>  
>  /* System Information */
>  
> @@ -793,24 +807,79 @@ static int deck_ctl_deck_ctl_invalid(struct node *node, unsigned me, unsigned la
>  static int deck_ctl_play(struct node *node, unsigned me, unsigned la, bool interactive)
>  {
>  	struct cec_msg msg = {};
> +	__u8 deck_status;
>  
>  	cec_msg_init(&msg, me, la);
> -	cec_msg_play(&msg, CEC_OP_PLAY_MODE_PLAY_STILL);
> +	cec_msg_play(&msg, CEC_OP_PLAY_MODE_PLAY_FWD);
>  	fail_on_test(!transmit_timeout(node, &msg));
> -	if (is_playback_or_rec(la)) {
> -		fail_on_test_v2(node->remote[la].cec_version,
> -				node->remote[la].has_deck_ctl && unrecognized_op(&msg));
> -		fail_on_test_v2(node->remote[la].cec_version,
> -				!node->remote[la].has_deck_ctl && !unrecognized_op(&msg));
> -	}
> +	fail_on_test_v2(node->remote[la].cec_version,
> +	                node->remote[la].has_deck_ctl && unrecognized_op(&msg));
> +	fail_on_test_v2(node->remote[la].cec_version,
> +	                !node->remote[la].has_deck_ctl && !unrecognized_op(&msg));
>  	if (unrecognized_op(&msg))
>  		return OK_NOT_SUPPORTED;
>  	if (refused(&msg))
>  		return OK_REFUSED;
> -	if (cec_msg_status_is_abort(&msg))
> -		return OK_PRESUMED;
> +	fail_on_test(deck_status_get(node, me, la, deck_status));
> +	if (cec_msg_status_is_abort(&msg)) {
> +		if (incorrect_mode(&msg)) {
> +			if (deck_status == CEC_OP_DECK_INFO_NO_MEDIA)
> +				info("Play Still: no media.\n");
> +			else
> +				warn("Deck has media but returned Feature Abort with Incorrect Mode.");
> +			return OK;
> +		}
> +		return FAIL;

Do the same reordering as I suggested in the previous patch.

> +	}
> +	fail_on_test(deck_status != CEC_OP_DECK_INFO_PLAY);
>  
> -	return OK_PRESUMED;
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_STILL, CEC_OP_DECK_INFO_STILL));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_REV, CEC_OP_DECK_INFO_PLAY_REV));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MIN, CEC_OP_DECK_INFO_FAST_FWD));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_REV_MIN, CEC_OP_DECK_INFO_FAST_REV));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MED, CEC_OP_DECK_INFO_FAST_FWD));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_REV_MED, CEC_OP_DECK_INFO_FAST_REV));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MAX, CEC_OP_DECK_INFO_FAST_FWD));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_FAST_REV_MAX, CEC_OP_DECK_INFO_FAST_REV));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MIN, CEC_OP_DECK_INFO_SLOW));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MIN, CEC_OP_DECK_INFO_SLOW_REV));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MED, CEC_OP_DECK_INFO_SLOW));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MED, CEC_OP_DECK_INFO_SLOW_REV));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MAX, CEC_OP_DECK_INFO_SLOW));
> +	fail_on_test(test_play_mode(node, me, la, CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MAX, CEC_OP_DECK_INFO_SLOW_REV));
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_deck_control(&msg, CEC_OP_DECK_CTL_MODE_STOP);
> +	fail_on_test(!transmit_timeout(node, &msg));
> +
> +	return OK;
> +}
> +
> +static int deck_ctl_play_invalid(struct node *node, unsigned me, unsigned la, bool interactive)
> +{
> +	struct cec_msg msg = {};
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_play(&msg, 4); /* Invalid Operand */
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	if (unrecognized_op(&msg))
> +		return OK_NOT_SUPPORTED;
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_play(&msg, 8); /* Invalid Operand */

I think it would be more useful to test with 0 instead of 8.

I did consider testing for both, but I think that is a bit overkill.

> +	fail_on_test(!transmit_timeout(node, &msg));
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	cec_msg_init(&msg, me, la);
> +	cec_msg_play(&msg, 0x26); /* Invalid Operand */
> +	fail_on_test(!transmit_timeout(node, &msg));
> +	fail_on_test(!cec_msg_status_is_abort(&msg));
> +	fail_on_test(abort_reason(&msg) != CEC_OP_ABORT_INVALID_OP);
> +
> +	return OK;
>  }
>  
>  static const vec_remote_subtests deck_ctl_subtests{
> @@ -825,7 +894,6 @@ static const vec_remote_subtests deck_ctl_subtests{
>  		deck_ctl_give_status_invalid,
>  	},
>  	{ "Deck Status", CEC_LOG_ADDR_MASK_ALL, deck_ctl_deck_status },
> -	{ "Play", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_play },
>  	{
>  		"Deck Control",
>  		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
> @@ -836,6 +904,16 @@ static const vec_remote_subtests deck_ctl_subtests{
>  		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
>  		deck_ctl_deck_ctl_invalid,
>  	},
> +	{
> +		"Play",
> +		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
> +		deck_ctl_play,
> +	},
> +	{
> +		"Play Invalid Operand",
> +		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
> +		deck_ctl_play_invalid,
> +	},
>  };
>  
>  /* Tuner Control */
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 4c7ba1d4..e58df85f 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -553,14 +553,78 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  			return;
>  		}
>  	case CEC_MSG_PLAY:
> -		if (node->has_deck_ctl)
> +		if (!node->has_deck_ctl)
> +			break;
> +
> +		__u8 deck_state;
> +		__u8 play_mode;
> +
> +		cec_ops_play(&msg, &play_mode);
> +
> +		switch (play_mode) {
> +		case CEC_OP_PLAY_MODE_PLAY_FWD:
> +			/* Play Forward will close tray if open. */
> +			deck_state = CEC_OP_DECK_INFO_PLAY;
> +			break;
> +		case CEC_OP_PLAY_MODE_PLAY_REV:
> +			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
> +				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
> +				return;
> +			}
> +			deck_state = CEC_OP_DECK_INFO_PLAY_REV;
> +			break;
> +		case CEC_OP_PLAY_MODE_PLAY_STILL:
> +			/* Play Still will close tray if open. */
> +			deck_state = CEC_OP_DECK_INFO_STILL;
> +			break;
> +		case CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MIN:
> +		case CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MED:
> +		case CEC_OP_PLAY_MODE_PLAY_FAST_FWD_MAX:
> +			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
> +				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
> +				return;
> +			}
> +			deck_state = CEC_OP_DECK_INFO_FAST_FWD;
> +			break;
> +		case CEC_OP_PLAY_MODE_PLAY_FAST_REV_MIN:
> +		case CEC_OP_PLAY_MODE_PLAY_FAST_REV_MED:
> +		case CEC_OP_PLAY_MODE_PLAY_FAST_REV_MAX:
> +			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
> +				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
> +				return;
> +			}
> +			deck_state = CEC_OP_DECK_INFO_FAST_REV;
> +			break;
> +		case CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MIN:
> +		case CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MED:
> +		case CEC_OP_PLAY_MODE_PLAY_SLOW_FWD_MAX:
> +			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
> +				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
> +				return;
> +			}
> +			deck_state = CEC_OP_DECK_INFO_SLOW;
> +			break;
> +		case CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MIN:
> +		case CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MED:
> +		case CEC_OP_PLAY_MODE_PLAY_SLOW_REV_MAX:
> +			if (node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
> +				reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
> +				return;
> +			}
> +			deck_state = CEC_OP_DECK_INFO_SLOW_REV;
> +			break;
> +		default:
> +			cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_INVALID_OP);
> +			transmit(node, &msg);
>  			return;
> -		break;
> +		}

The NO_MEDIA checks are repeated several times in the switch above. I think that it
is better to do this here:

		if (play_mode != CEC_OP_PLAY_MODE_PLAY_FWD &&
		    play_mode != CEC_OP_PLAY_MODE_PLAY_STILL &&
		    node->state.deck_state == CEC_OP_DECK_INFO_NO_MEDIA) {
			reply_feature_abort(node, &msg, CEC_OP_ABORT_INCORRECT_MODE);
			return;
		}

> +		node->state.deck_skip_start = 0;
> +		update_deck_state(node, deck_state);
> +		return;
>  	case CEC_MSG_DECK_CONTROL:
>  		if (!node->has_deck_ctl)
>  			break;
>  
> -		__u8 deck_state;
>  		__u8 deck_control_mode;
>  
>  		cec_ops_deck_control(&msg, &deck_control_mode);
> 

Regards,

	Hans
