Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14D6EADB72
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 16:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfIIOql (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 10:46:41 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:52249 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727285AbfIIOql (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 10:46:41 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7Kw7i3aBG50xT7KwBiArny; Mon, 09 Sep 2019 16:46:39 +0200
Subject: Re: [PATCH] cec-compliance: rename has_arc_rx, has_arc_tx
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190909142653.35823-1-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <4c754bd0-da8b-90c0-7423-d59dedb084b7@xs4all.nl>
Date:   Mon, 9 Sep 2019 16:46:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909142653.35823-1-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLGqtvojB8d6a2L9sKTITAood+g+9YJD0gsuVwh3FourFQ+jK0t9MhJvytXGCErGhNo4XHHA1r9kMmmfw7QbEuI2uBsuYB3FFsgwH2N7Rlhd1WgA0RGE
 /ORL/F4mnCZkObzEChIku1EDIYSK1duwFwIU1qj0+F39W/VdUpW6Ckp5BDspVf29+8VsSqcBsSfiVByQ+Y5c+yW311qk6mo6XzkzM/UlLbyrATCzUS5vx6AS
 5Fnpc+vb8UUfG3xh2C+duBjnF0+F6z/ffsZ6zDsJ524=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/9/19 4:26 PM, Jiunn Chang wrote:
> Renaming has_arc_rx and has_arc_tx to better match the macros defined in
> cec.h:
> - CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX
> - CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX
> 
> For devices on a HDMI ARC link, sources can only support receiver devices
> and sinks can only support transmitter devices.

I merged this, but made a slight edit in this last sentence:

"For devices on a HDMI ARC link, sources can only receive ARC
 and sinks can only transmit ARC."

'receiver/transmitter devices' is too vague, since that can apply to both
video or audio. So be more precise and specify that it is about ARC.

Regards,

	Hans

> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-compliance/cec-compliance.cpp |  4 ++--
>  utils/cec-compliance/cec-compliance.h   |  4 ++--
>  utils/cec-compliance/cec-test-audio.cpp | 10 +++++-----
>  utils/cec-follower/cec-follower.cpp     |  4 ++--
>  utils/cec-follower/cec-follower.h       |  4 ++--
>  utils/cec-follower/cec-processing.cpp   |  8 ++++----
>  6 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
> index 3818ce58..d89962f0 100644
> --- a/utils/cec-compliance/cec-compliance.cpp
> +++ b/utils/cec-compliance/cec-compliance.cpp
> @@ -1038,9 +1038,9 @@ static void topology_probe_device(struct node *node, unsigned i, unsigned la)
>  		node->remote[i].rc_profile = *rc_profile;
>  		node->remote[i].dev_features = *dev_features;
>  		node->remote[i].all_device_types = all_device_types;
> -		node->remote[i].has_arc_rx =
> +		node->remote[i].source_has_arc_rx =
>  			(*dev_features & CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX) != 0;
> -		node->remote[i].has_arc_tx =
> +		node->remote[i].sink_has_arc_tx =
>  			(*dev_features & CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX) != 0;
>  		node->remote[i].has_aud_rate =
>  			(*dev_features & CEC_OP_FEAT_DEV_HAS_SET_AUDIO_RATE) != 0;
> diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
> index d7460b62..023c34d4 100644
> --- a/utils/cec-compliance/cec-compliance.h
> +++ b/utils/cec-compliance/cec-compliance.h
> @@ -137,8 +137,8 @@ struct remote {
>  	bool has_text_view_on;
>  	bool in_standby;
>  	bool has_remote_control_passthrough;
> -	bool has_arc_rx;
> -	bool has_arc_tx;
> +	bool source_has_arc_rx;
> +	bool sink_has_arc_tx;
>  	bool arc_initiated;
>  	bool has_sys_audio_mode_req;
>  	bool has_set_sys_audio_mode;
> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
> index 872bb9ad..2bc24daf 100644
> --- a/utils/cec-compliance/cec-test-audio.cpp
> +++ b/utils/cec-compliance/cec-test-audio.cpp
> @@ -165,17 +165,17 @@ static int arc_initiate_tx(struct node *node, unsigned me, unsigned la, bool int
>  	cec_msg_initiate_arc(&msg, true);
>  	fail_on_test(!transmit_timeout(node, &msg));
>  	if (timed_out(&msg)) {
> -		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].has_arc_tx);
> +		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].sink_has_arc_tx);
>  		warn("Timed out waiting for Report ARC Initiated/Terminated.\n");
>  		return PRESUMED_OK;
>  	}
>  	if (unrecognized_op(&msg)) {
> -		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].has_arc_tx);
> +		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].sink_has_arc_tx);
>  		return NOTSUPPORTED;
>  	}
>  	if (cec_msg_opcode(&msg) == CEC_MSG_REPORT_ARC_INITIATED) {
>  		fail_on_test(!pa_are_adjacent(node->phys_addr, node->remote[la].phys_addr));
> -		fail_on_test_v2(node->remote[la].cec_version, !node->remote[la].has_arc_tx);
> +		fail_on_test_v2(node->remote[la].cec_version, !node->remote[la].sink_has_arc_tx);
>  		node->remote[la].arc_initiated = true;
>  	}
>  	else if (cec_msg_opcode(&msg) == CEC_MSG_REPORT_ARC_TERMINATED)
> @@ -248,11 +248,11 @@ static int arc_initiate_rx(struct node *node, unsigned me, unsigned la, bool int
>  		}
>  	}
>  	if (unsupported) {
> -		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].has_arc_rx);
> +		fail_on_test_v2(node->remote[la].cec_version, node->remote[la].source_has_arc_rx);
>  		return NOTSUPPORTED;
>  	}
>  	fail_on_test(!pa_are_adjacent(node->phys_addr, node->remote[la].phys_addr));
> -	fail_on_test_v2(node->remote[la].cec_version, !node->remote[la].has_arc_rx);
> +	fail_on_test_v2(node->remote[la].cec_version, !node->remote[la].source_has_arc_rx);
>  
>  	cec_msg_init(&msg, me, la);
>  	cec_msg_report_arc_initiated(&msg);
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index 77394ab0..dca0f627 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -450,8 +450,8 @@ int main(int argc, char **argv)
>  			__u8 byte = laddrs.features[0][idx];
>  
>  			if (is_dev_feat) {
> -				node.has_arc_rx = (byte & CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX) != 0;
> -				node.has_arc_tx = (byte & CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX) != 0;
> +				node.source_has_arc_rx = (byte & CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX) != 0;
> +				node.sink_has_arc_tx = (byte & CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX) != 0;
>  				node.has_aud_rate = (byte & CEC_OP_FEAT_DEV_HAS_SET_AUDIO_RATE) != 0;
>  				node.has_deck_ctl = (byte & CEC_OP_FEAT_DEV_HAS_DECK_CONTROL) != 0;
>  				node.has_rec_tv = (byte & CEC_OP_FEAT_DEV_HAS_RECORD_TV_SCREEN) != 0;
> diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> index 36496fdc..0998382c 100644
> --- a/utils/cec-follower/cec-follower.h
> +++ b/utils/cec-follower/cec-follower.h
> @@ -64,8 +64,8 @@ struct node {
>  	struct state state;
>  	__u16 phys_addr;
>  	__u8 cec_version;
> -	bool has_arc_rx;
> -	bool has_arc_tx;
> +	bool source_has_arc_rx;
> +	bool sink_has_arc_tx;
>  	bool has_aud_rate;
>  	bool has_deck_ctl;
>  	bool has_rec_tv;
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index a38f664b..fa7687c9 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -753,7 +753,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  		/* Audio Return Channel Control */
>  
>  	case CEC_MSG_INITIATE_ARC:
> -		if (node->has_arc_tx) {
> +		if (node->sink_has_arc_tx) {
>  			if (!pa_is_upstream_from(node->phys_addr, remote_pa) ||
>  			    !pa_are_adjacent(node->phys_addr, remote_pa)) {
>  				cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_REFUSED);
> @@ -769,7 +769,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  		}
>  		break;
>  	case CEC_MSG_TERMINATE_ARC:
> -		if (node->has_arc_tx) {
> +		if (node->sink_has_arc_tx) {
>  			if (!pa_is_upstream_from(node->phys_addr, remote_pa) ||
>  			    !pa_are_adjacent(node->phys_addr, remote_pa)) {
>  				cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_REFUSED);
> @@ -785,7 +785,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  		}
>  		break;
>  	case CEC_MSG_REQUEST_ARC_INITIATION:
> -		if (node->has_arc_rx) {
> +		if (node->source_has_arc_rx) {
>  			if (pa_is_upstream_from(node->phys_addr, remote_pa) ||
>  			    !pa_are_adjacent(node->phys_addr, remote_pa)) {
>  				cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_REFUSED);
> @@ -800,7 +800,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
>  		}
>  		break;
>  	case CEC_MSG_REQUEST_ARC_TERMINATION:
> -		if (node->has_arc_rx) {
> +		if (node->source_has_arc_rx) {
>  			if (pa_is_upstream_from(node->phys_addr, remote_pa) ||
>  			    !pa_are_adjacent(node->phys_addr, remote_pa)) {
>  				cec_msg_reply_feature_abort(&msg, CEC_OP_ABORT_REFUSED);
> 

