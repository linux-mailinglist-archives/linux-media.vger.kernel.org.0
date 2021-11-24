Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDC945CA96
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 18:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243001AbhKXRHa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 12:07:30 -0500
Received: from cnc.isely.net ([75.149.91.89]:48387 "EHLO cnc.isely.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241709AbhKXRH3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 12:07:29 -0500
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Nov 2021 12:07:29 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=isely.net; s=deb;
        t=1637773156; bh=HroewjoStlopb9pBDt78lZM0rUmJpXnAO3aufLlmYHw=;
        l=4040; h=Date:From:Reply-To:To:cc:Subject:In-Reply-To:References;
        b=AdwacM2yzznuhb/DS5JGIWgzjW5JaJkhFMqajEXpgrbL3iHeIKCQZxNys/kB5lChA
         gKUelmP/79U3/F5t2aBhMyPvHgPPyPduLR8sUypJZWoohE5t2jpG/dCKMu042ETGr4
         5Xf+hvdg8tI6g2oZKi34dEtkNtg5e8h4FsDovepQNJINq73Bxsakny39vQ1MU
Original-Reply-To: Mike Isely at pobox <isely@pobox.com>
Original-Subject: Re: [PATCH] pvrusb2: fix inconsistent indenting
Original-From: Mike Isely <isely@isely.net>
Original-cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
  Mike Isely at pobox <isely@pobox.com>
Received: from ts3-dock1.isely.net (ts3-dock1.isely.net [::ffff:192.168.23.13])
  (AUTH: PLAIN isely, TLS: TLS1.3,256bits,ECDHE_RSA_AES_256_GCM_SHA384)
  by cnc.isely.net with ESMTPSA
  id 0000000000020071.00000000619E6F64.000045F1; Wed, 24 Nov 2021 10:59:16 -0600
Date:   Wed, 24 Nov 2021 10:59:16 -0600 (CST)
From:   Mike Isely <isely@isely.net>
Reply-To: Mike Isely at pobox <isely@pobox.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mike Isely at pobox <isely@pobox.com>
Subject: Re: [PATCH] pvrusb2: fix inconsistent indenting
In-Reply-To: <9e64da73-4b2d-204c-d225-7504b9ebc341@xs4all.nl>
Message-ID: <alpine.DEB.2.21.2111241056090.13190@sheridan.isely.net>
References: <9e64da73-4b2d-204c-d225-7504b9ebc341@xs4all.nl>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


While I know you're just dealing with mechanical style checking tools in 
this case, that indentation was in fact deliberate in order to make 
visually obvious the regions of code where the lock was being held.  It 
was helpful to keep me from accidentally escaping a region without 
releasing the lock.

But this is an area of code that hasn't been touched in a very long time 
so I imagine the visually obvious aspect is not so important anymore.

  -Mike


On Wed, 24 Nov 2021, Hans Verkuil wrote:

> Fix these smatch warnings:
> 
> drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288 pvr2_encoder_cmd() warn: inconsistent indenting
> drivers/media/usb/pvrusb2/pvrusb2-hdw.c:1730 pvr2_hdw_set_streaming() warn: inconsistent indenting
> drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3461 pvr2_hdw_cpufw_set_enabled() warn: inconsistent indenting
> drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3501 pvr2_hdw_cpufw_get() warn: inconsistent indenting
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-encoder.c |  4 +--
>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c     | 33 +++++++++++----------
>  2 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
> index f6005d1296ef..c8102772344b 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
> @@ -188,8 +188,8 @@ static int pvr2_encoder_cmd(void *ctxt,
>  	}
> 
> 
> -	LOCK_TAKE(hdw->ctl_lock); while (1) {
> -
> +	LOCK_TAKE(hdw->ctl_lock);
> +	while (1) {
>  		if (!hdw->state_encoder_ok) {
>  			ret = -EIO;
>  			break;
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> index 3915d551d59e..cd7b118d5929 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> @@ -1718,16 +1718,16 @@ int pvr2_hdw_get_streaming(struct pvr2_hdw *hdw)
>  int pvr2_hdw_set_streaming(struct pvr2_hdw *hdw,int enable_flag)
>  {
>  	int ret,st;
> -	LOCK_TAKE(hdw->big_lock); do {
> -		pvr2_hdw_untrip_unlocked(hdw);
> -		if ((!enable_flag) != !(hdw->state_pipeline_req)) {
> -			hdw->state_pipeline_req = enable_flag != 0;
> -			pvr2_trace(PVR2_TRACE_START_STOP,
> -				   "/*--TRACE_STREAM--*/ %s",
> -				   enable_flag ? "enable" : "disable");
> -		}
> -		pvr2_hdw_state_sched(hdw);
> -	} while (0); LOCK_GIVE(hdw->big_lock);
> +	LOCK_TAKE(hdw->big_lock);
> +	pvr2_hdw_untrip_unlocked(hdw);
> +	if (!enable_flag != !hdw->state_pipeline_req) {
> +		hdw->state_pipeline_req = enable_flag != 0;
> +		pvr2_trace(PVR2_TRACE_START_STOP,
> +			   "/*--TRACE_STREAM--*/ %s",
> +			   enable_flag ? "enable" : "disable");
> +	}
> +	pvr2_hdw_state_sched(hdw);
> +	LOCK_GIVE(hdw->big_lock);
>  	if ((ret = pvr2_hdw_wait(hdw,0)) < 0) return ret;
>  	if (enable_flag) {
>  		while ((st = hdw->master_state) != PVR2_STATE_RUN) {
> @@ -3394,7 +3394,8 @@ void pvr2_hdw_cpufw_set_enabled(struct pvr2_hdw *hdw,
>  	int ret;
>  	u16 address;
>  	unsigned int pipe;
> -	LOCK_TAKE(hdw->big_lock); do {
> +	LOCK_TAKE(hdw->big_lock);
> +	do {
>  		if ((hdw->fw_buffer == NULL) == !enable_flag) break;
> 
>  		if (!enable_flag) {
> @@ -3457,8 +3458,8 @@ void pvr2_hdw_cpufw_set_enabled(struct pvr2_hdw *hdw,
>  			pvr2_trace(PVR2_TRACE_FIRMWARE,
>  				   "Done sucking down EEPROM contents");
>  		}
> -
> -	} while (0); LOCK_GIVE(hdw->big_lock);
> +	} while (0);
> +	LOCK_GIVE(hdw->big_lock);
>  }
> 
> 
> @@ -3473,7 +3474,8 @@ int pvr2_hdw_cpufw_get(struct pvr2_hdw *hdw,unsigned int offs,
>  		       char *buf,unsigned int cnt)
>  {
>  	int ret = -EINVAL;
> -	LOCK_TAKE(hdw->big_lock); do {
> +	LOCK_TAKE(hdw->big_lock);
> +	do {
>  		if (!buf) break;
>  		if (!cnt) break;
> 
> @@ -3498,7 +3500,8 @@ int pvr2_hdw_cpufw_get(struct pvr2_hdw *hdw,unsigned int offs,
>  			   "Read firmware data offs=%d cnt=%d",
>  			   offs,cnt);
>  		ret = cnt;
> -	} while (0); LOCK_GIVE(hdw->big_lock);
> +	} while (0);
> +	LOCK_GIVE(hdw->big_lock);
> 
>  	return ret;
>  }
> 
