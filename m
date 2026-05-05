Return-Path: <linux-media+bounces-60415-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBmhE2zy+WmcFQMAu9opvQ
	(envelope-from <linux-media+bounces-60415-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:36:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3B64CE9E4
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC901301DF69
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 13:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED57331F999;
	Tue,  5 May 2026 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNeEso4C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572CC36495D;
	Tue,  5 May 2026 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988099; cv=none; b=qLmCTnEFSXc0c79s74lTdW5P/ESrYHLD8XwPdiT1iF2cFdDJKi7XVNQ5G2SF3rwFeCzmfzF/c3qZn20yTWdaCnSZnLm6vNdaE8tWXS57Xin7enhq4quJtPUiMqJrFwdE2b/klEi5q5FYrI86Y7mQYSsyXLXAaHMEN61Ogs0QE10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988099; c=relaxed/simple;
	bh=5na5IzJRWnJa+BR4C/mPp2z61cd1JlvZxDqSPdqdXMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FX84h446/5N5hYL0+wklFVXQIxSBCoyKeZtEZT5MhwIuljrjTlzCJhnRe3RJo7xk5bXP76F+IZmuVr3qbM2xmyuKFuKiFIc6i5+6zSV1Z8nOugrz37yDixocUIsgMjsuYloxuD1pd+5IgFsAyBZfL1jFmsp/sMB+GNmkF2T0iHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNeEso4C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7338C2BCB4;
	Tue,  5 May 2026 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777988099;
	bh=5na5IzJRWnJa+BR4C/mPp2z61cd1JlvZxDqSPdqdXMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cNeEso4CWdoXwok8RhP0cGQKtdYCzPz2+4JABokdFImX3+r689zXIdbCWP9hKCuQ+
	 3RF7OtU/+4d8e8nfhFvDyuw5JrEzk2U0NYwsToiMoe2a81MQT8oh+3Bgyx84/5RwPY
	 /RypAgPQVGXxa5XpjoMljGOfrWlDc6vFxrzYYA6dhjwYieLm2+8cF5492SAoRvaEte
	 M8VrCQcu/8bWkbPgTCfmP4l/Pm/ZA4Iv0H7EJdG/jbGKmKLB0DXOfs+ZtEFx6yCVZP
	 fmjqv3Ertp1hbjMlF3cAPZj52ccCuYhWI+k2TwU2RZ3A0dKWbyXSo+6SHeJqmsrJ5T
	 6ckWXXCunix2Q==
Message-ID: <9cc0ef80-8f2b-4206-b305-d68f8f0cc1ff@kernel.org>
Date: Tue, 5 May 2026 15:34:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: gspca: Handle SENSOR_HV7131R
To: Philipp Matthias Hahn <pmhahn@pmhahn.de>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1776693140.git.pmhahn@pmhahn.de>
 <a36c41b3f1a4d9c8d5e6b264ce848df01fac8344.1776693140.git.pmhahn@pmhahn.de>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <a36c41b3f1a4d9c8d5e6b264ce848df01fac8344.1776693140.git.pmhahn@pmhahn.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EB3B64CE9E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60415-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pmhahn.de:email]

Hi Philipp,

On 4/20/26 15:54, Philipp Matthias Hahn wrote:
> I found an old USB webcam 0c45:602d Microdia VideoCAM ExpressII. `vlc`
> triggered an OOPS as soon as I opened the device:
> 
>> BUG: kernel NULL pointer dereference, address: 0000000000000068
>> #PF: supervisor read access in kernel mode
>> #PF: error_code(0x0000) - not-present page
>> PGD 0 P4D 0
>> Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
>> CPU: 8 UID: 1000 PID: 19655 Comm: vlc Tainted: G O 7.0.0+ #1 Debian
>> Tainted: [O]=OOT_MODULE
>> RIP: 0010:do_autogain+0x7d/0x100 [gspca_sonixb]
>> Code: 74 21 0f af 90 c4 00 00 00 89 d0 48 63 d2 48 69 d2 09 04 02 81
>> 48 c1 ea 20 01 c2 c1 f8 1f c1 fa 06 29 c2 48 8b 83 48 06 00 00 <48>
>> 81 78 68 f3 01 00 00 7f 34 48 89 df e8 41 f1 3b 00 85 c0 74 07
> 
> (The out-of-tree-module is v4l2-loopback.)
> 
> Adding addition debug information I found out, that the cam is based on
> an SENSOR_HV7131R:
> 
>> gspca_main: sonixb-2.14.0 probing 0c45:602d
>> sonixb 1-3:1.0: sd_config(sensor=01 bridge=00)
> 
> In case of an SENSOR_HV7131R `gspca_dev->exposure` is not setup.
> Enabling auto-gain will result in the above OOPS.
> 
> 1. Check for `gspca_dev->exposure != NULL` before dereferencing it.
> 
> Even after that there's 2nd OOPS:
> 
>> BUG: kernel NULL pointer dereference, address: 0000000000000034
>> #PF: supervisor read access in kernel mode
>> #PF: error_code(0x0000) - not-present page
>> PGD 0 P4D 0
>> Oops: Oops: 0000 [#1] SMP NOPTI
>> CPU: 1 UID: 1000 PID: 709 Comm: vlc Tainted: G E 7.0.0+ #6 Debian
>> Tainted: [E]=UNSIGNED_MODULE
>> RIP: 0010:v4l2_ctrl_g_ctrl+0x36/0x80 [videodev]
>> Code: 20 65 48 8b 05 63 17 b1 c8 48 89 44 24 18 31 c0 c7 44 24 14 00
>> 00 00 00 48 c7 44 24 04 00 00 00 00 48 c7 44 24 0c 00 00 00 00 <f6>
>> 47 34 20 74 2e 48 8d 74 24 04 c7 44 24 10 00 00 00 00 e8 72 fd
> 
> This is caused by v4l2_ctrl_g_ctrl() dereferencing gspca_dev->autogain,
> which remains NULL as gspca_dev->exposure is NULL.
> 
> Check for `gspca_dev->autogain != NULL` before dereferencing it via
> gspca_expo_autogain().

I see no sign of adding that check in gspca_expo_autogain(): I think you
missed that in your patch.

> 
> Signed-off-by: Philipp Matthias Hahn <pmhahn@pmhahn.de>
> ---
>  drivers/media/usb/gspca/sonixb.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/gspca/sonixb.c b/drivers/media/usb/gspca/sonixb.c
> index 4d655e2da9cb..09725d62d904 100644
> --- a/drivers/media/usb/gspca/sonixb.c
> +++ b/drivers/media/usb/gspca/sonixb.c
> @@ -900,11 +900,11 @@ static void do_autogain(struct gspca_dev *gspca_dev)
>  	if (sd->brightness)
>  		desired_avg_lum = sd->brightness->val * desired_avg_lum / 127;
>  
> -	if (gspca_dev->exposure->maximum < 500) {
> +	if (gspca_dev->exposure && gspca_dev->exposure->maximum < 500) {
>  		if (gspca_coarse_grained_expo_autogain(gspca_dev, avg_lum,
>  				desired_avg_lum, deadzone))
>  			sd->autogain_ignore_frames = AUTOGAIN_IGNORE_FRAMES;
> -	} else {
> +	} else if (gspca_dev->autogain) {
>  		int gain_knee = (s32)gspca_dev->gain->maximum * 9 / 10;
>  		if (gspca_expo_autogain(gspca_dev, avg_lum, desired_avg_lum,
>  				deadzone, gain_knee, sd->exposure_knee))
> @@ -927,6 +927,9 @@ static int sd_config(struct gspca_dev *gspca_dev,
>  	sd->sensor = id->driver_info >> 8;
>  	sd->bridge = id->driver_info & 0xff;
>  
> +	dev_info(gspca_dev->v4l2_dev.dev, "%s(sensor=%02x bridge=%02x)\n",
> +		 __func__, sd->sensor, sd->bridge);
> +
>  	cam = &gspca_dev->cam;
>  	if (!(sensor_data[sd->sensor].flags & F_SIF)) {
>  		cam->cam_mode = vga_mode;
> @@ -958,7 +961,7 @@ static int sd_s_ctrl(struct v4l2_ctrl *ctrl)
>  
>  	gspca_dev->usb_err = 0;
>  
> -	if (ctrl->id == V4L2_CID_AUTOGAIN && ctrl->is_new && ctrl->val) {
> +	if (ctrl->id == V4L2_CID_AUTOGAIN && ctrl->is_new && ctrl->val && gspca_dev->exposure) {

Is this really needed? We should only be able to get here if the AUTOGAIN
control was added, and that's only added if the EXPOSURE control is also
present.

Does it still crash if you drop this change?

>  		/* when switching to autogain set defaults to make sure
>  		   we are on a valid point of the autogain gain /
>  		   exposure knee graph, and give this change time to
> @@ -976,7 +979,8 @@ static int sd_s_ctrl(struct v4l2_ctrl *ctrl)
>  		setbrightness(gspca_dev);
>  		break;
>  	case V4L2_CID_AUTOGAIN:
> -		if (gspca_dev->exposure->is_new || (ctrl->is_new && ctrl->val))
> +		if ((gspca_dev->exposure && gspca_dev->exposure->is_new) ||
> +		    (ctrl->is_new && ctrl->val))

Same here.

>  			setexposure(gspca_dev);
>  		if (gspca_dev->gain->is_new || (ctrl->is_new && ctrl->val))
>  			setgain(gspca_dev);

Regards,

	Hans

