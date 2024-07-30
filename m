Return-Path: <linux-media+bounces-15491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9AA9401E0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 02:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11D881C21FFE
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 00:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3DD621;
	Tue, 30 Jul 2024 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BunbjPEK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D4D502
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 00:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722297878; cv=none; b=qqHzo7dsiHJRalixR9azQior0/f+OAVkwSkoMmVlzS/gRyN/M86LBi0iVfmzj99RJmF+EEPHG49TO8WPkPnNKGo6+Cgd9RM/wSmgpPkuDcrkGXp0IKxgYWKJ3KyM4pfEdx5grf36Jx2aMzyit43UU5YDFbKvYHO1PJ54/8gIXHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722297878; c=relaxed/simple;
	bh=Q2O2EMOeiGFDs5+kYdZBRD/TdVfNulAX3+bVBDNqxMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDiGTxW287ruab58eJfkXYFdjAy5TgosqrLTCyjS8wAkuEXq6lpRP2LO/p/s/rv1OnRrTfokd3EOuskGnSzowoycdxqgkicufn0rQs46xh5FqrXJo0BdbT9QGHDw7vsklKDLgwtoOeD/lOuCiEMLeVLrlCjy2SatbMvSVzRwJW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BunbjPEK; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-58f9874aeb4so5382354a12.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 17:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722297874; x=1722902674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJeQtmZ/fhKgI+nxPmNQBZBf+a2l/q92OcFwO0K4lQY=;
        b=BunbjPEKSdSiF8ROyVfRLnG7Ionbyn2v7Wix0AKeAoiGDHSdbsq/lBvF0vr0ivQc3H
         JfY/W92QAdyVdR4ctCMpnDXQr6+BDOFZVPJP54QHlIhbJOhaoERfYYYcDQUrFL+xARPO
         hRpm/vORv03PtNlgHE444UqxD3u+FMZxifKf34Sgbye7cj8MH88w71fnBgl2iny+th+O
         mc4+iQHKeOv6Z5lcpWU7aSmiCe+UUlGiH7Lw7vpgk/B9XT5mlOGblcnTCO1FwikcpWeo
         K0/VdpxGNgaDi/xdGaV4JSTMcN3fGNuIHEdJL0rMDqQ3s5Jwm5GEC5zyTFwpgyqIx2Ns
         MqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722297874; x=1722902674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJeQtmZ/fhKgI+nxPmNQBZBf+a2l/q92OcFwO0K4lQY=;
        b=sd0UWVOz35fIf4ScRcsdFdshhgo1y0VUTw6j6ATD8Oi9iIzwn0s3RrWdHMkIsijgHs
         lXi+VbCMdw0heg3DYnZcFqkbWSYv4i7anHH6RMZiRHixve0XPOaGtoF/b+8mAVD05dGW
         UeRyac/p2mFrwgrdqF76rOu99ExqSLfwKLvFVKOZeXqsfosmgDascHhEq/9PvMK+07rl
         0cD4lJGx0GlPaS/P8VV1wHA/sdlxDOfJwQBLjvLGnDAnG/vWQ9O6G1W1RZ7CNfytuPos
         XErTaRYPPA4RuU38Daa2FWgsC6Co4UJMnqTiM5wvsBokPKjMDK5jVr0KriJ59nSltcwR
         Rdaw==
X-Gm-Message-State: AOJu0Yzhov6WguwqjTeWoHrCTlcp9RYUxW7lC5gCVmDsj98i78LI9Fhe
	vsBSWBSvtLveLJ/nYUXU8u0tUiL83wwQm5TAZG/S4cdRtSZs+EnTJAT2syTnxKg=
X-Google-Smtp-Source: AGHT+IGXPFjuwEruoOBD1t/X824UbcAmgTnTFOCBNHMWuZCVFEZbM7UNqjygJ8rMsLsGs29Q8EGHqQ==
X-Received: by 2002:a05:6402:5210:b0:5a2:8bf2:92c6 with SMTP id 4fb4d7f45d1cf-5b02119042cmr6573994a12.21.1722297874495;
        Mon, 29 Jul 2024 17:04:34 -0700 (PDT)
Received: from [192.168.0.6] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5af758a6c36sm4883352a12.73.2024.07.29.17.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 17:04:33 -0700 (PDT)
Message-ID: <bb167c9a-0c9b-4ccd-af64-56346d8e448c@linaro.org>
Date: Tue, 30 Jul 2024 01:04:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: Fritz Koenig <frkoenig@chromium.org>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com
References: <20240729193219.1260463-1-frkoenig@chromium.org>
 <CAMfZQbzvaLLTdAo_UW2CPNA1hv+cGtO6DnRb+MFKEpUfV7e7wA@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAMfZQbzvaLLTdAo_UW2CPNA1hv+cGtO6DnRb+MFKEpUfV7e7wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/07/2024 20:46, Fritz Koenig wrote:
> On Mon, Jul 29, 2024 at 12:32 PM Fritz Koenig <frkoenig@chromium.org> wrote:
>>
>>
>> v2:
>> - cover letter
>> - testing methodology
>> - Signed-off-by
>>
>> V4L2 has support for hierarchical P frames using the
>> V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls. This allows for
>> specifing P frame references needed for temporal scalability. Encoding a
>> single stream with a single layer allows for the layer to be dropped and
>> the stream to be decoded without artifacts.
>>
>> ChromeOS is planning to use this feature for the L1T2 web standard[1].
>> This allows video conferencing apps to encode once for a clients with
>> different performance/bandwidth capabilities.
>>
>> The ChromeOS test framework ("tast") was used to verify that no
>> regressions are present. This was done on SC7180 ("trogdor").
>>
>> Verification of the added controls was done with a bitstream analyser to
>> make sure that reference frame management is correct.
>>
>> [1]: https://www.w3.org/TR/webrtc-svc/#L1T2*
>>
> 
> I still have plans to use git send-email correctly. Hopefully by the
> next patch series.
> 
> Sorry for the missing subject, another email has been sent with the
> correct subject.
> I didn't realize that this had gone through.

b4 is your friend it will stop you making errors like this.

https://b4.docs.kernel.org/en/latest/index.html

b4 prep --enroll HEAD

git-cherry-pick <your seires of shas you want>

b4 prep --auto-to-cc

b4 prep --edit-cover

b4 prep --check

b4 send --reflect --no-sign

Finally when you're done

b4 send --no-sign

if you get feedback or Signed-off/Reivewed-by whatever

b4 trailers -u

git rebase some-patch

do some stuff

git rebase --continue

when you're done

b4 prep --edit-cover

b4 send --no-sign --reflect

---
bod

