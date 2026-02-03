Return-Path: <linux-media+bounces-52102-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJe/G+PQgWl1JwMAu9opvQ
	(envelope-from <linux-media+bounces-52102-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 11:41:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3D4D7DFA
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 11:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EB873046F1D
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 10:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848D13191D0;
	Tue,  3 Feb 2026 10:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9df9jAd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1830F927
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770115284; cv=pass; b=jbZj/e/aeowTQnBV2IgauukssiMzwUh7I3+fhq15Txo7VvGz+2qmiA6eeI4fspLL+GPAyVJxGT2N7TwsHe93JwpdCMzs+lYvqUCxNPGSK3msCeS7ez3plbOa+8xyng3QoSlPAf8D1zq3kH/hZ4fGsAmeaKqVMWxvoXMUm6VSUGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770115284; c=relaxed/simple;
	bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdvaOiRN+8TshXPzmLC+XzM2CnI2SLDd0OU4Khtp3a62urqW4tIkjyu+pTHAwW6xe1YsuM81iMzkBt6XxooLdqUG1KKqaXV1zsdwstPzi2Xi9Y5AQyHShsatwrSfJl2ap6AOQ4JF5Vq6b6r/J2Wct+801nwaKcgMj4Z+VAgGZ5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9df9jAd; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e2cb21520so1877506e87.1
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 02:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770115281; cv=none;
        d=google.com; s=arc-20240605;
        b=UojGb/FdtwWWPS6f7CvUzFXZJGpbCZhtba7Tesrwb7HSoRaWTAEL8vWYd3ZG3Vt21t
         VxhvQNwpv2UM9yDXio05M3sy7ruYIKivY3wpKiC31HR+2wzfaTfJZ7g3sXLgsVYSZxQI
         YiWugCTYXsS3K1wq4S1r0ekGX8xuLAiN3DyzyLGrQ+ejT2joWSP/qwkxW+/APYkuVAti
         RsMP/FDsqbvqvA/NOGXlxU7vX7CIfuTw/VtHoqhl13qLc7ZoMtPO5R9VfvAsGItHO1Fv
         SM6upEbWrI85yL3GD4V1uVtsecmpnmBWbUMtvx4W9YFSzyZiQ2YgXD62NEH7S1MJvzo9
         vWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
        fh=rhtMqVHjqwcuMGPOWYOC4NyqwdNgNyAPjwCLk3QANPk=;
        b=VQFYWBodXWwNdwXZYB7SDZrVBzt3Rmnsg/wx5nXC0QB3WjJ0IArJKnft207WjisI6g
         7JyD1T1LWdghT8NH1z6Gz88tWVf+HpEPmeBqNie7y7X3rqy3YqoJ8iWBy5vJkSbQRw2a
         f5cVzP5FVJNB7QkYoYML+f3iIoaY4XTkjqS2jP59koQ1qOxwYBkHg4WK3KounHF6iAbP
         8XlLg+f589kffQ3OWNlSJkf7+ODqzFPMWa+SA2PYvvXykMd1pozd6f72DQ2h1Vz22vus
         zkvMBdIwJg+JJ8WNX2irz/XqxasU675pQLADav7I0zwm5ykAX44gw+QI73hh1103qT2i
         afiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770115281; x=1770720081; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
        b=u9df9jAd3ocwpNvTkerjq/5EwbpvelscXEhWSwC3ym80s8IjbgyHdQcqBp45X9nu4F
         NYiYPgWEx4f31cBTrYoFs0mdyAasZdSRvrSGXQx6fAsr6ikCHnpvjoQgP/nNWsE2SJwo
         yTfIIy7K2s35FAt3R959t8mjWSPYNXL1u2sMNnKKypKrwfPGRHk9vzGlihZ/vPEqpu8a
         kJzg9L3Xvo49f0c4ypDqDWW4hPmIy6mkoI/NefVKGICLNXwOEmhaapKDgO1AvB2v8d5E
         pRWPz16LCsYRVVFuNtLdietKnxRklo/lTYqOiCEWmeVFsTJ3Z+BFSR87ren4mP988TBd
         7eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770115281; x=1770720081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
        b=CrX9JBSztWf6R7v8GnjJ7qvgBklIQfnlLd4R+ZB1mCwkPpndjR3gbcx9QfbQayWeLd
         GFycVx08AjrO17t+0C3vE1Mx4Q0lVAqoM3TDnR30IZIUeB6XGgzD2Ii7cwcVJckoajPQ
         SOWl0Wo/sdOQl6I/zNwq6jl+d2IKcARtuRot0qDaaZcGh6ZV0Gohaxsm0YtZbl/QPEvW
         FMFQI8LJyet5qZ8gXuuA3Z6d0lPTL14K87hcwXEpa51h4n4fcMAvo/XjrSBmaOPYWmcY
         Hxj5IHw50lxIXcTUgRFkzvmYYxX+/mF+PIxBPEEFBBN4gVb0bf08AOOAe6VUS/57FgrE
         JpUA==
X-Forwarded-Encrypted: i=1; AJvYcCWmepZnIpgzl8MPs8vbaOOIlzcu6quFE1g9eYSUFi+Mi9fU6HaExiVtgnJMCOdqY8oIIeSXUQRGWCs64g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1LNI6D4tjDG+E/GrGQxLmnD17MVqxhcH6aFwmLxhvidLdDgyr
	4Mmw1xoUg5AWywh29DKf6zrzmRDs0TdatDnUGqYzPWFvATBs3/pYJrdLaILGQUzllG7AsrKzEW7
	spKo3IxSl5Jv0u2oesrk71T0V1jOQRAijRtHZ7jXY3g==
X-Gm-Gg: AZuq6aLczng7rWPywpAXO7tICOUxef+yah0jVFqMpsLj6KsADOZzVLFZKWUOphZvfuZ
	W1E5RNcSLH45//5LIKFStBnBiZqi3m7kHQwem5bbk3Owl8a8cesZjY6at10S1J0k9Q5xW8pI3zr
	OtwrUAc21XMNUzFqGHcHvo/ITUfLQI4G+iqgO4q23vU+0E81pOh3QcQaNX6C2fOF9SJX6YIQTdG
	tePavrow6UdG413R6pvBwahXObXMD9yN+tEwcaHQG9LSra8g5O+m1BShB+q5fWAxYxSu5kY
X-Received: by 2002:a05:6512:615:10b0:59e:1704:e0d3 with SMTP id
 2adb3069b0e04-59e1704e0edmr3493618e87.14.1770115281299; Tue, 03 Feb 2026
 02:41:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
 <CAO9ioeXkhxjghtGVGsOH=1hwC5FvS_4LEXt3hmAEuAbwVjct3g@mail.gmail.com> <l6o4lv2sy7x4g33mjigeh6sb6cmrfyz3xshhmbc3el6qvw3oep@okwpfykypawa>
In-Reply-To: <l6o4lv2sy7x4g33mjigeh6sb6cmrfyz3xshhmbc3el6qvw3oep@okwpfykypawa>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Feb 2026 11:40:45 +0100
X-Gm-Features: AZwV_Qi-wgYVrdRqK589mxNzs1gxGV1Oudp9yxPTCOEtASkncTUH7LC0VHPXYJs
Message-ID: <CAPDyKFrX7NieYszgEZXFyQJr+PA266MJZTvJcGFmrQ2oy7Mj3A@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain handling
 on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52102-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:email,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: DA3D4D7DFA
X-Rspamd-Action: no action

On Mon, 2 Feb 2026 at 20:22, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Feb 02, 2026 at 05:51:16PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 2 Feb 2026 at 16:46, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > As pointed out by Konrad during the review of SM8350 / SC8280XP
> > > > patchset, Iris aka Venus description has several flows. It doesn't scale
> > > > MMCX, the frequencies in the OPP table are wrong, etc.
> > > >
> > > > Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> > > > stopping it from being overclocked).
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >
> > > Do you want me to pick up patch2 for v7.0 - or what do you suggest at
> > > this point?
> >
> > I'd prefer it if it is picked through the immutable tag/branch.
>
> Another option would be to ack merging it through the media tree.

I didn't think the series was considered as material for v7.0 as it's
getting late for that.

Anyway, I have queued patch2 to v7.0 and the patch is also available
to pull in via an immutable "core" branch in my pmdomain tree.

Kind regards
Uffe

