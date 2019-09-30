Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21507C1DAF
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 11:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbfI3JMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 05:12:09 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41163 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726121AbfI3JMI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 05:12:08 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Eritid01V9D4hEriwiL8Dw; Mon, 30 Sep 2019 11:12:07 +0200
Subject: Re: [PATCH v3 1/3] cec-follower: fix bugs for tuner emulation
To:     Jiunn Chang <c0d1n61at3@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20190924192445.93575-1-c0d1n61at3@gmail.com>
 <20190930043017.474025-2-c0d1n61at3@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <83499bfd-ba8e-f8ee-ecfe-a85fea03ac6d@xs4all.nl>
Date:   Mon, 30 Sep 2019 11:12:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930043017.474025-2-c0d1n61at3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCevrlk+hNcCOestU7YlkZWDWngG2jLV5j6EL8cI5m5UmNkfIYsFiqcF7lMN4HsFvWg9uiglqnQiN6w93+HJCYuQtGwlvUNPPyNEdhc76/urZEMxNerU
 LfW/5Bj9slUnmMs0LpScHAxzjs4Tktu/YuWg88nQfvYDptB68+Yr3Shpc+dqjsFfdxW+mf4yugW5KlQGqpWUpDqhpXlJMTDt7u4FCgR668+L7dWY46yOcxRq
 kgIEmno973LrvFyxd6lxEMImlde3PL/i83EtmzKQXGo=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jiunn,

On 9/30/19 6:30 AM, Jiunn Chang wrote:
> Fix some typos for tuner emulation:
>   - analog_tuner_init() store ana_freq in hex
>   - analog_get_nearest_freq() temp variable check

The patch is fine, but this commit log is wrong.

"store ana_freq in hex" is meaningless. What you mean is "store ana_freq as multiples of 62.5 kHz"
and the second line gives the wrong function name and doesn't really explain the issue.

Regards,

	Hans

> 
> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
> ---
>  utils/cec-follower/cec-tuner.cpp | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
> index acc3fd00..2f6e3425 100644
> --- a/utils/cec-follower/cec-tuner.cpp
> +++ b/utils/cec-follower/cec-tuner.cpp
> @@ -92,13 +92,15 @@ static unsigned int analog_freqs_khz[3][9][NUM_ANALOG_FREQS] =
>  
>  void analog_tuner_init(struct cec_op_tuner_device_info *info)
>  {
> +	unsigned int freq_khz =
> +		analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
> +
>  	info->rec_flag = CEC_OP_REC_FLAG_NOT_USED;
>  	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
>  	info->is_analog = true;
>  	info->analog.ana_bcast_type = CEC_OP_ANA_BCAST_TYPE_CABLE;
>  	info->analog.bcast_system = CEC_OP_BCAST_SYSTEM_PAL_BG;
> -	info->analog.ana_freq =
> -		analog_freqs_khz[info->analog.ana_bcast_type][info->analog.bcast_system][0];
> +	info->analog.ana_freq = (freq_khz * 10) / 625;
>  }
>  
>  static unsigned int analog_get_nearest_freq(__u8 ana_bcast_type, __u8 ana_bcast_system,
> @@ -123,7 +125,7 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
>  	__u8 system;
>  
>  	cec_ops_select_analogue_service(msg, &type, &freq, &system);
> -	if (info->analog.ana_bcast_type < 3 && info->analog.bcast_system < 9) {
> +	if (type < 3 && system < 9) {
>  		int freq_khz = (freq * 625) / 10;
>  		unsigned int nearest = analog_get_nearest_freq(type, system,
>  							       freq_khz);
> 

