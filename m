Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283503655C8
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 11:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhDTJzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 05:55:03 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:49301 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229937AbhDTJzB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 05:55:01 -0400
Received: from [192.168.2.10] ([84.202.3.209])
        by smtp.xs4all.nl with ESMTPA
        id Yn5NlUxZ6w8UmYn5Ql24G3; Tue, 20 Apr 2021 11:54:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618912469; bh=zWv231pv1wtEoS2++n8IGIYrDK3uJ6y9A/NR4t+fotk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Jei3k8ySYNpsTzro34JVXG/zOaIanPlYhX3nWjddnlI5UzFveIddv+yuWaiKEKd5I
         fhSB4qkUb1eufri4srIt0XNQfsWws2mtjyPHAR/unfRnG0tNBhGnhWYKhaJBM5iYji
         MpPDkkQVDhYYRcKkVFbsLO0IADwpfWC9RmX91eHqDCNz3ytc+pwfTU4TbkkoAUuOhw
         Oc/7SjDKeLA4fHHGe4B18+q0Jb+OIpesh7v2a0bo2A5oLYRe6j/Bmp5Rg7s7s6YoGz
         hlOWV1MTf8YahwttAoJk/h8l42qQOjCpSgrZfAlvdQYrwt0AHp8Rh+g57hWbpU/9CK
         pac7iuvrGOtlA==
Subject: Re: [PATCH] v4l-utils: switch remote_subtest arrays to vector
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20210420042714.3720981-1-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c206618a-01f4-0cf4-7cdf-4f08a75c1559@xs4all.nl>
Date:   Tue, 20 Apr 2021 11:54:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210420042714.3720981-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJC4fTFC/52uag6qQm0XI/VUmuECnLYyPjwRtkLmpJjL459JmJ7LbZ74wPQdtL24yT+TYdXlvBKDXyFqDb76oow5EpX0czVNW8HpKavURkqJjyMjqlqs
 Xn8mwyIbHNVfbrTXO2/COTEourjC01UBSVfcOfSM44a5Z9xRaDgHIoRFU/2gReyHcT9HOhqW0O6LpYf9UGA9DXtvYoaddPCmAA6KIRqBcvEnfaHTQfjIEABm
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rosen,

On 20/04/2021 06:27, Rosen Penev wrote:
> Easier to read and allows removing some boilerplate code. Only a
> moderate size increase.
> 
> Ran through git clang-format

Just to clarify: this is a clean up patch, right? There are no clang fixes
here as in your past patches.

> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/cec-compliance/cec-compliance.h   |  26 ++--
>  utils/cec-compliance/cec-test-audio.cpp | 171 ++++++++++++---------
>  utils/cec-compliance/cec-test-power.cpp |  17 +--
>  utils/cec-compliance/cec-test.cpp       | 194 ++++++++----------------
>  4 files changed, 177 insertions(+), 231 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
> index d87e4f1b7..c948dfb34 100644
> --- a/utils/cec-compliance/cec-compliance.h
> +++ b/utils/cec-compliance/cec-compliance.h
> @@ -19,6 +19,8 @@
>  
>  #include <cec-info.h>
>  
> +#include <vector>
> +
>  #define TAG_AUDIO_RATE_CONTROL		1
>  #define TAG_ARC_CONTROL 		(1 << 1)
>  #define TAG_CAP_DISCOVERY_CONTROL 	(1 << 2)
> @@ -456,25 +458,17 @@ void testRemote(struct node *node, unsigned me, unsigned la, unsigned test_tags,
>  			     bool interactive);
>  
>  // cec-test-audio.cpp
> -extern struct remote_subtest sac_subtests[];
> -extern const unsigned sac_subtests_size;
> -extern struct remote_subtest dal_subtests[];
> -extern const unsigned dal_subtests_size;
> -extern struct remote_subtest arc_subtests[];
> -extern const unsigned arc_subtests_size;
> -extern struct remote_subtest audio_rate_ctl_subtests[];
> -extern const unsigned audio_rate_ctl_subtests_size;
> +extern const std::vector<remote_subtest> sac_subtests;

I think std::vector<remote_subtest> deserves a 'using' alias declaration.

> +extern const std::vector<remote_subtest> dal_subtests;
> +extern const std::vector<remote_subtest> arc_subtests;
> +extern const std::vector<remote_subtest> audio_rate_ctl_subtests;
>  
>  // cec-test-power.cpp
>  bool util_interactive_ensure_power_state(struct node *node, unsigned me, unsigned la, bool interactive,
>  					 __u8 target_pwr);
> -extern struct remote_subtest standby_subtests[];
> -extern const unsigned standby_subtests_size;
> -extern struct remote_subtest one_touch_play_subtests[];
> -extern const unsigned one_touch_play_subtests_size;
> -extern struct remote_subtest power_status_subtests[];
> -extern const unsigned power_status_subtests_size;
> -extern struct remote_subtest standby_resume_subtests[];
> -extern const unsigned standby_resume_subtests_size;
> +extern const std::vector<remote_subtest> standby_subtests;
> +extern const std::vector<remote_subtest> one_touch_play_subtests;
> +extern const std::vector<remote_subtest> power_status_subtests;
> +extern const std::vector<remote_subtest> standby_resume_subtests;
>  
>  #endif
> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-compliance/cec-test-audio.cpp
> index 30b702e74..733549b19 100644
> --- a/utils/cec-compliance/cec-test-audio.cpp
> +++ b/utils/cec-compliance/cec-test-audio.cpp
> @@ -82,14 +82,11 @@ static int dal_req_current_latency_invalid(struct node *node, unsigned me, unsig
>  	return 0;
>  }
>  
> -struct remote_subtest dal_subtests[] = {
> +const std::vector<remote_subtest> dal_subtests{
>  	{ "Request Current Latency", CEC_LOG_ADDR_MASK_ALL, dal_request_current_latency },
>  	{ "Request Current Latency with invalid PA", CEC_LOG_ADDR_MASK_ALL, dal_req_current_latency_invalid },
>  };
>  
> -const unsigned dal_subtests_size = ARRAY_SIZE(dal_subtests);
> -
> -
>  /* Audio Return Channel Control */
>  
>  static __u16 pa_common_mask(__u16 pa1, __u16 pa2)
> @@ -274,16 +271,13 @@ static int arc_terminate_rx(struct node *node, unsigned me, unsigned la, bool in
>  	return 0;
>  }
>  
> -struct remote_subtest arc_subtests[] = {
> +const std::vector<remote_subtest> arc_subtests{
>  	{ "Initiate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_rx },
>  	{ "Terminate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_rx },
>  	{ "Initiate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_tx },
>  	{ "Terminate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_tx },
>  };
>  
> -const unsigned arc_subtests_size = ARRAY_SIZE(arc_subtests);
> -
> -
>  /* System Audio Control */
>  
>  /*
> @@ -762,66 +756,99 @@ static int sac_system_audio_mode_req_off(struct node *node, unsigned me, unsigne
>  	return 0;
>  }
>  
> -struct remote_subtest sac_subtests[] = {
> -	{ "Request Short Audio Descriptor",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> -	  sac_request_sad_probe },
> -	{ "Request Short Audio Descriptor, invalid",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> -	  sac_request_sad_invalid },
> -	{ "Report Short Audio Descriptor consistency",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> -	  sac_sad_format_check },
> -	{ "Report Short Audio Descriptor, multiple requests in one",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> -	  sac_sad_req_multiple },
> -	{ "Set System Audio Mode (directly addressed)",
> -	  CEC_LOG_ADDR_MASK_TV,
> -	  sac_set_system_audio_mode_direct },
> -	{ "Set System Audio Mode (broadcast on)",
> -	  CEC_LOG_ADDR_MASK_TV,
> -	  sac_set_system_audio_mode_broadcast_on },
> -	{ "System Audio Mode Status",
> -	  CEC_LOG_ADDR_MASK_TV,
> -	  sac_system_audio_mode_status },
> -	{ "System Audio Mode Request (on)",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> -	  sac_system_audio_mode_req_on },
> -	{ "Give System Audio Mode Status",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> -	  sac_give_system_audio_mode_status },
> -	{ "Give Audio Status",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> -	  sac_give_audio_status },
> -	{ "User Control Pressed (Volume Up)",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> -	  sac_user_control_press_vol_up },
> -	{ "User Control Pressed (Volume Down)",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> -	  sac_user_control_press_vol_down },
> -	{ "User Control Pressed (Mute)",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> -	  sac_user_control_press_mute },
> -	{ "User Control Pressed (Restore Volume Function)",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> -	  sac_user_control_press_restore_volume_function },
> -	{ "User Control Pressed (Mute Function)",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> -	  sac_user_control_press_mute_function },
> -	{ "User Control Released (Audio)",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> -	  sac_user_control_release },
> -	{ "Set System Audio Mode (broadcast off)",
> -	  CEC_LOG_ADDR_MASK_TV,
> -	  sac_set_system_audio_mode_broadcast_off },
> -	{ "System Audio Mode Request (off)",
> -	  CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> -	  sac_system_audio_mode_req_off },
> +const std::vector<remote_subtest> sac_subtests{
> +	{
> +		"Request Short Audio Descriptor",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> +		sac_request_sad_probe,
> +	},
> +	{
> +		"Request Short Audio Descriptor, invalid",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> +		sac_request_sad_invalid,
> +	},
> +	{
> +		"Report Short Audio Descriptor consistency",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> +		sac_sad_format_check,
> +	},
> +	{
> +		"Report Short Audio Descriptor, multiple requests in one",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> +		sac_sad_req_multiple,
> +	},
> +	{
> +		"Set System Audio Mode (directly addressed)",
> +		CEC_LOG_ADDR_MASK_TV,
> +		sac_set_system_audio_mode_direct,
> +	},
> +	{
> +		"Set System Audio Mode (broadcast on)",
> +		CEC_LOG_ADDR_MASK_TV,
> +		sac_set_system_audio_mode_broadcast_on,
> +	},
> +	{
> +		"System Audio Mode Status",
> +		CEC_LOG_ADDR_MASK_TV,
> +		sac_system_audio_mode_status,
> +	},
> +	{
> +		"System Audio Mode Request (on)",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> +		sac_system_audio_mode_req_on,
> +	},
> +	{
> +		"Give System Audio Mode Status",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> +		sac_give_system_audio_mode_status,
> +	},
> +	{
> +		"Give Audio Status",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> +		sac_give_audio_status,
> +	},
> +	{
> +		"User Control Pressed (Volume Up)",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +		sac_user_control_press_vol_up,
> +	},
> +	{
> +		"User Control Pressed (Volume Down)",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +		sac_user_control_press_vol_down,
> +	},
> +	{
> +		"User Control Pressed (Mute)",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +		sac_user_control_press_mute,
> +	},
> +	{
> +		"User Control Pressed (Restore Volume Function)",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +		sac_user_control_press_restore_volume_function,
> +	},
> +	{
> +		"User Control Pressed (Mute Function)",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +		sac_user_control_press_mute_function,
> +	},
> +	{
> +		"User Control Released (Audio)",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
> +		sac_user_control_release,
> +	},
> +	{
> +		"Set System Audio Mode (broadcast off)",
> +		CEC_LOG_ADDR_MASK_TV,
> +		sac_set_system_audio_mode_broadcast_off,
> +	},
> +	{
> +		"System Audio Mode Request (off)",
> +		CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
> +		sac_system_audio_mode_req_off,
> +	},
>  };
>  
> -const unsigned sac_subtests_size = ARRAY_SIZE(sac_subtests);
> -
> -
>  /* Audio Rate Control */
>  
>  /*
> @@ -848,10 +875,10 @@ static int audio_rate_ctl_set_audio_rate(struct node *node, unsigned me, unsigne
>  	return OK_PRESUMED;
>  }
>  
> -struct remote_subtest audio_rate_ctl_subtests[] = {
> -	{ "Set Audio Rate",
> -	  CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_TUNER,
> -	  audio_rate_ctl_set_audio_rate },
> +const std::vector<remote_subtest> audio_rate_ctl_subtests{
> +	{
> +		"Set Audio Rate",
> +		CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_ADDR_MASK_TUNER,
> +		audio_rate_ctl_set_audio_rate,
> +	},
>  };
> -
> -const unsigned audio_rate_ctl_subtests_size = ARRAY_SIZE(audio_rate_ctl_subtests);
> diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-compliance/cec-test-power.cpp
> index 42f4d2980..ff17b015e 100644
> --- a/utils/cec-compliance/cec-test-power.cpp
> +++ b/utils/cec-compliance/cec-test-power.cpp
> @@ -6,6 +6,7 @@
>  #include <cerrno>
>  #include <ctime>
>  #include <string>
> +#include <vector>
>  
>  #include <sys/ioctl.h>
>  #include <unistd.h>
> @@ -95,14 +96,11 @@ static int power_status_report(struct node *node, unsigned me, unsigned la, bool
>  	return OK_PRESUMED;
>  }
>  
> -struct remote_subtest power_status_subtests[] = {
> +const std::vector<remote_subtest> power_status_subtests{
>  	{ "Give Device Power Status", CEC_LOG_ADDR_MASK_ALL, power_status_give },
>  	{ "Report Device Power Status", CEC_LOG_ADDR_MASK_ALL, power_status_report },
>  };
>  
> -const unsigned power_status_subtests_size = ARRAY_SIZE(power_status_subtests);
> -
> -
>  /* One Touch Play */
>  
>  static int one_touch_play_view_on(struct node *node, unsigned me, unsigned la, bool interactive,
> @@ -233,7 +231,7 @@ static int one_touch_play_req_active_source(struct node *node, unsigned me, unsi
>  	return 0;
>  }
>  
> -struct remote_subtest one_touch_play_subtests[] = {
> +const std::vector<remote_subtest> one_touch_play_subtests{
>  	{ "Image View On", CEC_LOG_ADDR_MASK_TV, one_touch_play_image_view_on },
>  	{ "Text View On", CEC_LOG_ADDR_MASK_TV, one_touch_play_text_view_on },
>  	{ "Wakeup on Image View On", CEC_LOG_ADDR_MASK_TV, one_touch_play_image_view_on_wakeup },
> @@ -243,9 +241,6 @@ struct remote_subtest one_touch_play_subtests[] = {
>  	{ "Active Source and Request Active Source", CEC_LOG_ADDR_MASK_ALL, one_touch_play_req_active_source },
>  };
>  
> -const unsigned one_touch_play_subtests_size = ARRAY_SIZE(one_touch_play_subtests);
> -
> -
>  /* Standby / Resume */
>  
>  /* The default sleep time between power status requests. */
> @@ -638,7 +633,7 @@ static int power_state_transitions(struct node *node, unsigned me, unsigned la,
>  	return 0;
>  }
>  
> -struct remote_subtest standby_resume_subtests[] = {
> +const std::vector<remote_subtest> standby_resume_subtests{
>  	{ "Standby", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby },
>  	{ "Repeated Standby message does not wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby_toggle },
>  	{ "Standby: Feature aborts unknown messages", CEC_LOG_ADDR_MASK_ALL, core_unknown, true },
> @@ -652,10 +647,8 @@ struct remote_subtest standby_resume_subtests[] = {
>  	{ "Standby: Get Menu Language", CEC_LOG_ADDR_MASK_ALL, system_info_get_menu_lang, true },
>  	{ "Standby: Give Device Features", CEC_LOG_ADDR_MASK_ALL, system_info_give_features, true },
>  	{ "No wakeup on Active Source", CEC_LOG_ADDR_MASK_ALL, standby_resume_active_source_nowake },
> -	{ "Wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_wakeup},
> +	{ "Wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_wakeup },
>  	{ "Wake up TV on Image View On", CEC_LOG_ADDR_MASK_TV, standby_resume_wakeup_image_view_on },
>  	{ "Wake up TV on Text View On", CEC_LOG_ADDR_MASK_TV, standby_resume_wakeup_text_view_on },
>  	{ "Power State Transitions", CEC_LOG_ADDR_MASK_TV, power_state_transitions, false, true },
>  };
> -
> -const unsigned standby_resume_subtests_size = ARRAY_SIZE(standby_resume_subtests);
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 8a9ea2afe..ede52ee1b 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -13,14 +13,15 @@
>  
>  #include "cec-compliance.h"
>  
> -#define test_case(name, tags, subtests) {name, tags, subtests, ARRAY_SIZE(subtests)}
> -#define test_case_ext(name, tags, subtests) {name, tags, subtests, subtests##_size}
> +#define test_case(name, tags, subtests) \
> +	{                               \
> +		name, tags, subtests,   \
> +	}
>  
>  struct remote_test {
>  	const char *name;
>  	const unsigned tags;
> -	struct remote_subtest *subtests;
> -	unsigned num_subtests;
> +	const std::vector<remote_subtest> &subtests;
>  };
>  
>  
> @@ -178,7 +179,7 @@ int system_info_give_features(struct node *node, unsigned me, unsigned la, bool
>  	return 0;
>  }
>  
> -static struct remote_subtest system_info_subtests[] = {
> +static const std::vector<remote_subtest> system_info_subtests{
>  	{ "Polling Message", CEC_LOG_ADDR_MASK_ALL, system_info_polling },
>  	{ "Give Physical Address", CEC_LOG_ADDR_MASK_ALL, system_info_phys_addr },
>  	{ "Give CEC Version", CEC_LOG_ADDR_MASK_ALL, system_info_version },
> @@ -187,7 +188,6 @@ static struct remote_subtest system_info_subtests[] = {
>  	{ "Give Device Features", CEC_LOG_ADDR_MASK_ALL, system_info_give_features },
>  };
>  
> -
>  /* Core behavior */
>  
>  int core_unknown(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -237,12 +237,11 @@ int core_abort(struct node *node, unsigned me, unsigned la, bool interactive)
>  	return 0;
>  }
>  
> -static struct remote_subtest core_subtests[] = {
> +static const std::vector<remote_subtest> core_subtests{
>  	{ "Feature aborts unknown messages", CEC_LOG_ADDR_MASK_ALL, core_unknown },
>  	{ "Feature aborts Abort message", CEC_LOG_ADDR_MASK_ALL, core_abort },
>  };
>  
> -
>  /* Vendor Specific Commands */
>  
>  int vendor_specific_commands_id(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -265,11 +264,10 @@ int vendor_specific_commands_id(struct node *node, unsigned me, unsigned la, boo
>  	return 0;
>  }
>  
> -static struct remote_subtest vendor_specific_subtests[] = {
> +static const std::vector<remote_subtest> vendor_specific_subtests{
>  	{ "Give Device Vendor ID", CEC_LOG_ADDR_MASK_ALL, vendor_specific_commands_id },
>  };
>  
> -
>  /* Device OSD Transfer */
>  
>  static int device_osd_transfer_set(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -317,12 +315,11 @@ int device_osd_transfer_give(struct node *node, unsigned me, unsigned la, bool i
>  	return 0;
>  }
>  
> -static struct remote_subtest device_osd_transfer_subtests[] = {
> +static const std::vector<remote_subtest> device_osd_transfer_subtests{
>  	{ "Set OSD Name", CEC_LOG_ADDR_MASK_ALL, device_osd_transfer_set },
>  	{ "Give OSD Name", CEC_LOG_ADDR_MASK_ALL, device_osd_transfer_give },
>  };
>  
> -
>  /* OSD Display */
>  
>  static int osd_string_set_default(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -418,13 +415,12 @@ static int osd_string_invalid(struct node *node, unsigned me, unsigned la, bool
>  	return 0;
>  }
>  
> -static struct remote_subtest osd_string_subtests[] = {
> +static const std::vector<remote_subtest> osd_string_subtests{
>  	{ "Set OSD String with default timeout", CEC_LOG_ADDR_MASK_TV, osd_string_set_default },
>  	{ "Set OSD String with no timeout", CEC_LOG_ADDR_MASK_TV, osd_string_set_until_clear },
>  	{ "Set OSD String with invalid operand", CEC_LOG_ADDR_MASK_TV, osd_string_invalid },
>  };
>  
> -
>  /* Routing Control */
>  
>  static int routing_control_inactive_source(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -525,14 +521,13 @@ static int routing_control_set_stream_path(struct node *node, unsigned me, unsig
>  	return OK_PRESUMED;
>  }
>  
> -static struct remote_subtest routing_control_subtests[] = {
> +static const std::vector<remote_subtest> routing_control_subtests{
>  	{ "Active Source", CEC_LOG_ADDR_MASK_TV, routing_control_active_source },
>  	{ "Request Active Source", CEC_LOG_ADDR_MASK_ALL, routing_control_req_active_source },
>  	{ "Inactive Source", CEC_LOG_ADDR_MASK_TV, routing_control_inactive_source },
>  	{ "Set Stream Path", CEC_LOG_ADDR_MASK_ALL, routing_control_set_stream_path },
>  };
>  
> -
>  /* Remote Control Passthrough */
>  
>  static int rc_passthrough_user_ctrl_pressed(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -573,12 +568,11 @@ static int rc_passthrough_user_ctrl_released(struct node *node, unsigned me, uns
>  	return OK_PRESUMED;
>  }
>  
> -static struct remote_subtest rc_passthrough_subtests[] = {
> +static const std::vector<remote_subtest> rc_passthrough_subtests{
>  	{ "User Control Pressed", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ctrl_pressed },
>  	{ "User Control Released", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ctrl_released },
>  };
>  
> -
>  /* Device Menu Control */
>  
>  /*
> @@ -604,13 +598,12 @@ static int dev_menu_ctl_request(struct node *node, unsigned me, unsigned la, boo
>  	return 0;
>  }
>  
> -static struct remote_subtest dev_menu_ctl_subtests[] = {
> +static const std::vector<remote_subtest> dev_menu_ctl_subtests{
>  	{ "Menu Request", static_cast<__u16>(~CEC_LOG_ADDR_MASK_TV), dev_menu_ctl_request },
>  	{ "User Control Pressed", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ctrl_pressed },
>  	{ "User Control Released", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ctrl_released },
>  };
>  
> -
>  /* Deck Control */
>  
>  /*
> @@ -704,22 +697,13 @@ static int deck_ctl_play(struct node *node, unsigned me, unsigned la, bool inter
>  	return OK_PRESUMED;
>  }
>  
> -static struct remote_subtest deck_ctl_subtests[] = {
> -	{ "Give Deck Status",
> -	  CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
> -	  deck_ctl_give_status },
> -	{ "Deck Status",
> -	  CEC_LOG_ADDR_MASK_ALL,
> -	  deck_ctl_deck_status },
> -	{ "Deck Control",
> -	  CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
> -	  deck_ctl_deck_ctl },
> -	{ "Play",
> -	  CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
> -	  deck_ctl_play },
> +static const std::vector<remote_subtest> deck_ctl_subtests{
> +	{ "Give Deck Status", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_give_status },
> +	{ "Deck Status", CEC_LOG_ADDR_MASK_ALL, deck_ctl_deck_status },
> +	{ "Deck Control", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_deck_ctl },
> +	{ "Play", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, deck_ctl_play },
>  };
>  
> -
>  /* Tuner Control */
>  
>  static const char *bcast_type2s(__u8 bcast_type)
> @@ -912,7 +896,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
>  	printf("\t    Finished Channel Scan\n");
>  
>  	printf("\t    Start Channel Test\n");
> -	for (const auto &iter : info_vec) {
> +	for (auto &&iter : info_vec) {
>  		cec_msg_init(&msg, me, la);
>  		log_tuner_service(iter, "Select ");
>  		if (iter.is_analog)
> @@ -957,11 +941,10 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
>  	return 0;
>  }
>  
> -static struct remote_subtest tuner_ctl_subtests[] = {
> +static const std::vector<remote_subtest> tuner_ctl_subtests{
>  	{ "Tuner Control", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tuner_ctl_test },
>  };
>  
> -
>  /* One Touch Record */
>  
>  /*
> @@ -1061,14 +1044,13 @@ static int one_touch_rec_status(struct node *node, unsigned me, unsigned la, boo
>  	return 0;
>  }
>  
> -static struct remote_subtest one_touch_rec_subtests[] = {
> +static const std::vector<remote_subtest> one_touch_rec_subtests{
>  	{ "Record TV Screen", CEC_LOG_ADDR_MASK_TV, one_touch_rec_tv_screen },
>  	{ "Record On", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_on },
>  	{ "Record Off", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_off },
>  	{ "Record Status", CEC_LOG_ADDR_MASK_ALL, one_touch_rec_status },
>  };
>  
> -
>  /* Timer Programming */
>  
>  /*
> @@ -1281,7 +1263,7 @@ static int timer_prog_timer_clear_status(struct node *node, unsigned me, unsigne
>  	return OK_PRESUMED;
>  }
>  
> -static struct remote_subtest timer_prog_subtests[] = {
> +static const std::vector<remote_subtest> timer_prog_subtests{
>  	{ "Set Analogue Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_analog_timer },
>  	{ "Set Digital Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_digital_timer },
>  	{ "Set Timer Program Title", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_prog_title },
> @@ -1384,11 +1366,10 @@ static int cdc_hec_discover(struct node *node, unsigned me, unsigned la, bool pr
>  	return OK_NOT_SUPPORTED;
>  }
>  
> -static struct remote_subtest cdc_subtests[] = {
> +static const std::vector<remote_subtest> cdc_subtests{
>  	{ "CDC_HEC_Discover", CEC_LOG_ADDR_MASK_ALL, cdc_hec_discover },
>  };
>  
> -
>  /* Post-test checks */
>  
>  static int post_test_check_recognized(struct node *node, unsigned me, unsigned la, bool interactive)
> @@ -1409,79 +1390,34 @@ static int post_test_check_recognized(struct node *node, unsigned me, unsigned l
>  	return 0;
>  }
>  
> -static struct remote_subtest post_test_subtests[] = {
> +static const std::vector<remote_subtest> post_test_subtests{
>  	{ "Recognized/unrecognized message consistency", CEC_LOG_ADDR_MASK_ALL, post_test_check_recognized },
>  };
>  
> -
> -static const struct remote_test tests[] = {
> -	test_case("Core",
> -		  TAG_CORE,
> -		  core_subtests),
> -	test_case_ext("Give Device Power Status feature",
> -		      TAG_POWER_STATUS,
> -		      power_status_subtests),
> -	test_case("System Information feature",
> -		  TAG_SYSTEM_INFORMATION,
> -		  system_info_subtests),
> -	test_case("Vendor Specific Commands feature",
> -		  TAG_VENDOR_SPECIFIC_COMMANDS,
> -		  vendor_specific_subtests),
> -	test_case("Device OSD Transfer feature",
> -		  TAG_DEVICE_OSD_TRANSFER,
> -		  device_osd_transfer_subtests),
> -	test_case("OSD String feature",
> -		  TAG_OSD_DISPLAY,
> -		  osd_string_subtests),
> -	test_case("Remote Control Passthrough feature",
> -		  TAG_REMOTE_CONTROL_PASSTHROUGH,
> -		  rc_passthrough_subtests),
> -	test_case("Device Menu Control feature",
> -		  TAG_DEVICE_MENU_CONTROL,
> -		  dev_menu_ctl_subtests),
> -	test_case("Deck Control feature",
> -		  TAG_DECK_CONTROL,
> -		  deck_ctl_subtests),
> -	test_case("Tuner Control feature",
> -		  TAG_TUNER_CONTROL,
> -		  tuner_ctl_subtests),
> -	test_case("One Touch Record feature",
> -		  TAG_ONE_TOUCH_RECORD,
> -		  one_touch_rec_subtests),
> -	test_case("Timer Programming feature",
> -		  TAG_TIMER_PROGRAMMING,
> -		  timer_prog_subtests),
> -	test_case("Capability Discovery and Control feature",
> -		  TAG_CAP_DISCOVERY_CONTROL,
> -		  cdc_subtests),
> -	test_case_ext("Dynamic Auto Lipsync feature",
> -		      TAG_DYNAMIC_AUTO_LIPSYNC,
> -		      dal_subtests),
> -	test_case_ext("Audio Return Channel feature",
> -		      TAG_ARC_CONTROL,
> -		      arc_subtests),
> -	test_case_ext("System Audio Control feature",
> -		      TAG_SYSTEM_AUDIO_CONTROL,
> -		      sac_subtests),
> -	test_case_ext("Audio Rate Control feature",
> -		      TAG_AUDIO_RATE_CONTROL,
> -		      audio_rate_ctl_subtests),
> -	test_case_ext("One Touch Play feature",
> -		      TAG_ONE_TOUCH_PLAY,
> -		      one_touch_play_subtests),
> -	test_case("Routing Control feature",
> -		  TAG_ROUTING_CONTROL,
> -		  routing_control_subtests),
> -	test_case_ext("Standby/Resume and Power Status",
> -		      TAG_POWER_STATUS | TAG_STANDBY_RESUME,
> -		      standby_resume_subtests),
> -	test_case("Post-test checks",
> -		  TAG_CORE,
> -		  post_test_subtests),
> +static const remote_test tests[] = {
> +	test_case("Core", TAG_CORE, core_subtests),
> +	test_case("Give Device Power Status feature", TAG_POWER_STATUS, power_status_subtests),
> +	test_case("System Information feature", TAG_SYSTEM_INFORMATION, system_info_subtests),
> +	test_case("Vendor Specific Commands feature", TAG_VENDOR_SPECIFIC_COMMANDS, vendor_specific_subtests),
> +	test_case("Device OSD Transfer feature", TAG_DEVICE_OSD_TRANSFER, device_osd_transfer_subtests),
> +	test_case("OSD String feature", TAG_OSD_DISPLAY, osd_string_subtests),
> +	test_case("Remote Control Passthrough feature", TAG_REMOTE_CONTROL_PASSTHROUGH, rc_passthrough_subtests),
> +	test_case("Device Menu Control feature", TAG_DEVICE_MENU_CONTROL, dev_menu_ctl_subtests),
> +	test_case("Deck Control feature", TAG_DECK_CONTROL, deck_ctl_subtests),
> +	test_case("Tuner Control feature", TAG_TUNER_CONTROL, tuner_ctl_subtests),
> +	test_case("One Touch Record feature", TAG_ONE_TOUCH_RECORD, one_touch_rec_subtests),
> +	test_case("Timer Programming feature", TAG_TIMER_PROGRAMMING, timer_prog_subtests),
> +	test_case("Capability Discovery and Control feature", TAG_CAP_DISCOVERY_CONTROL, cdc_subtests),
> +	test_case("Dynamic Auto Lipsync feature", TAG_DYNAMIC_AUTO_LIPSYNC, dal_subtests),
> +	test_case("Audio Return Channel feature", TAG_ARC_CONTROL, arc_subtests),
> +	test_case("System Audio Control feature", TAG_SYSTEM_AUDIO_CONTROL, sac_subtests),
> +	test_case("Audio Rate Control feature", TAG_AUDIO_RATE_CONTROL, audio_rate_ctl_subtests),
> +	test_case("One Touch Play feature", TAG_ONE_TOUCH_PLAY, one_touch_play_subtests),
> +	test_case("Routing Control feature", TAG_ROUTING_CONTROL, routing_control_subtests),
> +	test_case("Standby/Resume and Power Status", TAG_POWER_STATUS | TAG_STANDBY_RESUME, standby_resume_subtests),
> +	test_case("Post-test checks", TAG_CORE, post_test_subtests),
>  };
>  
> -static const unsigned num_tests = sizeof(tests) / sizeof(struct remote_test);
> -
>  static std::map<std::string, int> mapTests;
>  static std::map<std::string, bool> mapTestsNoWarnings;
>  
> @@ -1489,15 +1425,14 @@ void collectTests()
>  {
>  	std::map<std::string, __u64> mapTestFuncs;
>  
> -	for (const auto &test : tests) {
> -		for (unsigned j = 0; j < test.num_subtests; j++) {
> -			std::string name = safename(test.subtests[j].name);
> -			auto func = (__u64)test.subtests[j].test_fn;
> +	for (auto &&test : tests) {
> +		for (auto &&subtest : test.subtests) {
> +			std::string name = safename(subtest.name);
> +			auto func = (__u64)subtest.test_fn;
>  
>  			if (mapTestFuncs.find(name) != mapTestFuncs.end() &&
>  			    mapTestFuncs[name] != func) {
> -				fprintf(stderr, "Duplicate subtest name, but different tests: %s\n",
> -					test.subtests[j].name);
> +				fprintf(stderr, "Duplicate subtest name, but different tests: %s\n", subtest.name);
>  				std::exit(EXIT_FAILURE);
>  			}
>  			mapTestFuncs[name] = func;
> @@ -1509,12 +1444,10 @@ void collectTests()
>  
>  void listTests()
>  {
> -	for (const auto &test : tests) {
> +	for (auto &&test : tests) {
>  		printf("%s:\n", test.name);
> -		for (unsigned j = 0; j < test.num_subtests; j++) {
> -			std::string name = safename(test.subtests[j].name);
> -
> -			printf("\t%s\n", name.c_str());
> +		for (auto &&subtest : test.subtests) {
> +			printf("\t%s\n", safename(subtest.name).c_str());
>  		}
>  	}
>  }
> @@ -1553,32 +1486,31 @@ void testRemote(struct node *node, unsigned me, unsigned la, unsigned test_tags,
>  
>  	int ret = 0;
>  
> -	for (const auto &test : tests) {
> +	for (auto &&test : tests) {

Why use 'auto &&test' instead of 'const auto &test'? Is there a good reason
for that? The original is much more readable and from what I understand just
as efficient (not that efficiency is an issue here).

The same for other occurences of this idiom.

Regards,

	Hans

>  		if ((test.tags & test_tags) != test.tags)
>  			continue;
>  
>  		printf("\t%s:\n", test.name);
> -		for (unsigned j = 0; j < test.num_subtests; j++) {
> -			const char *name = test.subtests[j].name;
> +		for (auto &&subtest : test.subtests) {
> +			const char *name = subtest.name;
>  
> -			if (test.subtests[j].for_cec20 &&
> -			    (node->remote[la].cec_version < CEC_OP_CEC_VERSION_2_0 ||
> -			     !node->has_cec20))
> +			if (subtest.for_cec20 &&
> +			    (node->remote[la].cec_version < CEC_OP_CEC_VERSION_2_0 || !node->has_cec20))
>  				continue;
>  
> -			if (test.subtests[j].in_standby) {
> +			if (subtest.in_standby) {
>  				struct cec_log_addrs laddrs = { };
>  				doioctl(node, CEC_ADAP_G_LOG_ADDRS, &laddrs);
>  
>  				if (!laddrs.log_addr_mask)
>  					continue;
>  			}
> -			node->in_standby = test.subtests[j].in_standby;
> +			node->in_standby = subtest.in_standby;
>  			mode_set_initiator(node);
>  			unsigned old_warnings = warnings;
> -			ret = test.subtests[j].test_fn(node, me, la, interactive);
> +			ret = subtest.test_fn(node, me, la, interactive);
>  			bool has_warnings = old_warnings < warnings;
> -			if (!(test.subtests[j].la_mask & (1 << la)) && !ret)
> +			if (!(subtest.la_mask & (1 << la)) && !ret)
>  				ret = OK_UNEXPECTED;
>  
>  			if (mapTests[safename(name)] != DONT_CARE) {
> 

