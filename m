Return-Path: <linux-media+bounces-49563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72531CDE251
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 23:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB46B301176D
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 22:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CE02BE634;
	Thu, 25 Dec 2025 22:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="SparbaWU"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB17A25F988
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 22:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766703227; cv=none; b=ScD/MIHys+xmjbxI+epVCmmjeN6VWZm4IizZ9j8ZMWWJb0PJRjEugwjRcts6hb78tvrziifb9OUZRmFcYl9946iqEhaDjvGlPfcFFz4S0qQXEyPNlt/UyStZ0afFbyWfxicM1qUIbWJ72GhJ45RMXAWG8D0OJh6KzpcB+KrCbYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766703227; c=relaxed/simple;
	bh=8Bl87sjOeJEeTTZcr4AU4MZuxMspVdlgihJDib5ly6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTMITHBP4OOTtphw+b6abC9mFKikdwVtLGwfiFk8jfmV77MfZzkVV4u3yDhNDcyP69OavIWrKaexTHNAHWk4jN1U+cPnhYI+i2B5wGH7QI/rJEikAN7EPCDERaadvpxSABumsZcuh+ohE03y1rtlZPKcm/HDzrqblRWvMh46Upg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=SparbaWU; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <e13015c9-29b8-46e9-9290-d1d71eb73e51@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1766703213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UTq5gCCegajzQ2uBoKipxKxU+gvWEXz5erxNVvC4+Ng=;
	b=SparbaWUMVuyS44P0MyDh26WSZ+4Jq6khpXTArWlLEC0wEngbSMGFJ9ajp5TgHBQrnX1/e
	p6itN0+cXOnsL9QLmdTGDO4gmGSa4nCpXam2/vpyiCEojoZ2PAy5AqB3coAdtRl2qy/nxV
	jt6i7Pd22LhBf7p6EIVkNKhbeVhYWRzvRw4Fj5ZEdSsxdHyxVlWbG7UD0mwkgJ4GVoYpyn
	JK/yAhhicHt3rw7fj7e/MqQZv53jlSPhUUYCYbDoCiiQKxHrJ0+TDFabiXtjeH0bpuTzEr
	LXbUWchwSDOI2XQXYXT3AVJ90orOxmYav3obSlMURt5CO7RsoRkDouKlBlUMMw==
Date: Thu, 25 Dec 2025 19:53:26 -0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: iris: set default size when S_FMT is called with
 zero size
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <PAqEcmCHEfU40aJzxWzZEpPQfxYCXUAQ9a9lLgcqz47gzKU5z_bOvdOBleE7B3AIZ13bFrkW2ndB0eMgy2TQdw==@protonmail.internalid>
 <20251012235330.20897-1-val@packett.cool>
 <c0dbc541-d321-4ce1-9d2d-0c4189ef752f@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <c0dbc541-d321-4ce1-9d2d-0c4189ef752f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 10/28/25 10:19 AM, Bryan O'Donoghue wrote:
> On 13/10/2025 00:50, Val Packett wrote:
>> drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c 
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index ae13c3e1b426..6be09d82e24d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -196,6 +196,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, 
>> struct v4l2_format *f)
>>       if (vb2_is_busy(q))
>>           return -EBUSY;
>>
>> +    if (f->fmt.pix_mp.width == 0 && f->fmt.pix_mp.height == 0) {
>> +        f->fmt.pix_mp.width = DEFAULT_WIDTH;
>> +        f->fmt.pix_mp.height = DEFAULT_HEIGHT;
>> +    }
>> +
>>       iris_vdec_try_fmt(inst, f);
>>
>>       switch (f->type) {
>> -- 
>
> Doesn't venus do
>
> orig_pixmap = *pixmap;
>
> try_fmt();
>
> format.fmt.pix_mp.width = orig_pixmp.width;
> format.fmt.pix_mp.height = orig_pixmp.height;
>
> should you fall back to DEFAULT_WIDTH/HEIGHT or to 
> orig_pixmp.width/height ? 

Hi– sorry for the late reply and happy holidays :)

The patch does the fallback *before* try_fmt().

I have just retested everything, even with yesterday's new "misc fixes" 
patchset 
(https://lore.kernel.org/all/20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com/). 
The issue is still present, the 0x0 size is what iris_vdec_s_fmt gets 
before try_fmt().

What the rpi-ffmpeg developer said 
(https://github.com/jc-kynesim/rpi-ffmpeg/issues/103) is:

- V4L2 very clearly says that you should be able to pass anything into 
S_FMT and it should set the returned values to something valid
- S_FMT should not only not complain, it should return valid values in 
the structure passed to it which will then be used in the REQBUFS
- the buffers being allocated are for the coded bitstream (remember in 
V4L2 speak OUTPUT=source, CAPTURE=destination); width/height doesn't 
really mean a lot here but buffer size does
- 
https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-decoder.html 
4.5.1.5 states "width, height: coded resolution of the stream; required 
only if it cannot be parsed from the stream for the given coded format; 
otherwise the decoder will use this resolution as a placeholder 
resolution that will likely change as soon as it can parse the actual 
coded resolution from the stream"

So since this is a deliberate zero request, and V4L2 requires returning 
a valid placeholder resolution, it should be DEFAULT indeed.

I'll resend with a comment as requested by Dikshita.

~val


