Return-Path: <linux-media+bounces-24326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3BBA03B91
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 10:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AF3916572B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 09:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29FA1E3DF9;
	Tue,  7 Jan 2025 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fi/MF+G+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b1I6vJbt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fi/MF+G+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b1I6vJbt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B01DFDBB;
	Tue,  7 Jan 2025 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736243647; cv=none; b=h9DMcacI5UWAwfh2wosVAEB+7PEwJukH/CEcSpbsDbO/5sl27SpQ1RtjU1ybLhZHFaX/jGGC1SR5JQ+Tkbau1qr1BNe6EBxbBS65NJ/ST3CalKtcnp4d4gGEyLBameymx9i3NQgUOp/W64a6wOAoIUPhy4TwoTIt6UDMMTYMnDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736243647; c=relaxed/simple;
	bh=H1gopRdSs03Z4TVTWtbdBWchjT1q5SWO5N3TzswsrNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RghGl/zpxtl/Rw+4Q6g/icY/YKd3Q+xgeepKY9zXgYublfPFCaEo4eQ0UxArxIt5sRKaUI6cTTfhED5Pg8MwlfRnUFpikQTt94csToAg/PfwXmkDP5BiCrQzBK+JHKPusATsWxQedp1QjxRxlhYKXEOkfLN6FG1x72oBz2iXfy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fi/MF+G+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b1I6vJbt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fi/MF+G+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=b1I6vJbt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC7BA210FA;
	Tue,  7 Jan 2025 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736243642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSIaf47lAQaB+tDLPmqbFeeCFhYqumT9guoc602A2MQ=;
	b=fi/MF+G+WF1qlLTz5ykh/pZ8Xc1PWRe0rbERz/dYhihTEPkck14ddLCGHeRhiwf2AOcCv9
	ToPBZWmj/167nNDaiU4wtaZPW3q0z6kxXLd6QcLVO/1QZ12mHORy4BdDmGzOR+dKqEglfV
	KO3epSO6uf+9ur4XgJ0QHTT+jtUrS2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736243642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSIaf47lAQaB+tDLPmqbFeeCFhYqumT9guoc602A2MQ=;
	b=b1I6vJbtpnfhJ0zDM5c88VbracuDfVSj+LKJNIyw3L7v/+3SMo/C0hcb+fPvYMtbNP65/N
	paNI15waCY4/DNCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736243642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSIaf47lAQaB+tDLPmqbFeeCFhYqumT9guoc602A2MQ=;
	b=fi/MF+G+WF1qlLTz5ykh/pZ8Xc1PWRe0rbERz/dYhihTEPkck14ddLCGHeRhiwf2AOcCv9
	ToPBZWmj/167nNDaiU4wtaZPW3q0z6kxXLd6QcLVO/1QZ12mHORy4BdDmGzOR+dKqEglfV
	KO3epSO6uf+9ur4XgJ0QHTT+jtUrS2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736243642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSIaf47lAQaB+tDLPmqbFeeCFhYqumT9guoc602A2MQ=;
	b=b1I6vJbtpnfhJ0zDM5c88VbracuDfVSj+LKJNIyw3L7v/+3SMo/C0hcb+fPvYMtbNP65/N
	paNI15waCY4/DNCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CF1013A6A;
	Tue,  7 Jan 2025 09:54:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OD0iBLr5fGcMWgAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 07 Jan 2025 09:54:02 +0000
Message-ID: <90e63cca-4db8-4dde-9d49-10ad26245292@suse.de>
Date: Tue, 7 Jan 2025 11:54:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] media: venus: vdec: Make the range of us_per_frame
 explicit
To: Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
 <ribalda@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-arm-msm@vger.kernel.org
References: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
 <20250106-fix-cocci-v4-6-3c8eb97995ba@chromium.org>
 <9f089225-9c4a-4510-8b0c-da5ba9812a3d@xs4all.nl>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <9f089225-9c4a-4510-8b0c-da5ba9812a3d@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_TO(0.00)[xs4all.nl,chromium.org,kernel.org,gmail.com,quicinc.com,linaro.org,cisco.com];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,xs4all.nl];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,linaro.org:email]
X-Spam-Flag: NO
X-Spam-Level: 

On 1/7/25 11:35 AM, Hans Verkuil wrote:
> On 06/01/2025 14:40, Ricardo Ribalda wrote:
>> Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
>> There is no need to do a 64 bit division here.
>> Also, the driver only works with whole fps.
>>
>> Found by cocci:
>> drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>> index 6b8906ced6bc..88f6b5a3a4fe 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -464,7 +464,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>>  	struct venus_inst *inst = to_inst(file);
>>  	struct v4l2_captureparm *cap = &a->parm.capture;
>>  	struct v4l2_fract *timeperframe = &cap->timeperframe;
>> -	u64 us_per_frame, fps;
>> +	u64 us_per_frame;
>>  
>>  	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>>  	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>> @@ -486,10 +486,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>>  	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
>>  		return -EINVAL;
>>  
>> -	fps = (u64)USEC_PER_SEC;
>> -	do_div(fps, us_per_frame);
>> -
>> -	inst->fps = fps;
>> +	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
> 
> This still allows for an fps value of USEC_PER_SEC if us_per_frame is 1.
> 
> Looking at where inst->fps is used I see:
> 
> drivers/media/platform/qcom/venus/pm_helpers.c: return mbs * inst->fps;
> drivers/media/platform/qcom/venus/venc.c:       frate.framerate = inst->fps * (1 << 16);
> 
> (mbs is at most 512x512)
> 
> So if fps is USEC_PER_SEC those calculations will wrap around.
> 
> What is the real maximum fps that the HW can handle?
> 
> Stan? Bryan? It would be nice if there is a proper sanity check here.

It depends on the resolution but I think we could limit the maximum to
240 FPS per instance.

~Stan


